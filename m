Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D311C8BCA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 May 2020 15:09:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWgHd-0005he-IO; Thu, 07 May 2020 13:09:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jWgHc-0005hY-Ra
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 May 2020 13:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YZ2KSIPDFqrRNJrGef+MrFXkQ/2orqdAbUAX71Ym1Ck=; b=M6hpwucGItgvEeyhyKbPwy1CjM
 BX045UQXJpmF0I4spTMoSYC+2apkWr/27dy4PMl5TgMwLbKm2cB4iBiXenvMFBBwDjzquKSvFZFfj
 u/kPemVrS3RrI7Tp6kxfm0zu9ECGhS2ZSXXlqb6UlN1JADthY8UBODzmqfDdjEDhjS4M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YZ2KSIPDFqrRNJrGef+MrFXkQ/2orqdAbUAX71Ym1Ck=; b=FS+vOM9PhwSxhJHcwfWMLn14fS
 h6GH9JxbIIRxKcNAujsQH3N2XPLAoLl8KnsmX8dd7/Rty2IlEXq0sKcqzcuctTSQQASY0aRjoeB3V
 SjljXwV89wLMDcn/tTYnTi8ydm7VVAVR1/MFs+gtlpQ+mAN/5iwQkP4j1hJfOZlmEqoo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWgHa-00EDxY-QX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 May 2020 13:09:48 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4765220735;
 Thu,  7 May 2020 13:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588856976;
 bh=Do7HGl6Ox7RO6UdN7qPim7FWib9PeRQn2XalXmCIyYY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pGtQGKB8/0XDpDTTYfFqHNDk737vPATiU0pUZ9bibPwe1c4oNFPvJHhZP+SwCwNHB
 T6RRL3BYQE9jayW9v1Vvh67M+4RkYsrd2PJXzfeYtxTEFQXk0hiCh2QauNj5FRWNKb
 AZv1ysOumvyt+0BVxtP/PzX4N2IeHqPBScPX0F00=
Date: Thu, 7 May 2020 06:09:35 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200507130935.GB197114@google.com>
References: <20200507075905.953777-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507075905.953777-1-ebiggers@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWgHa-00EDxY-QX
Subject: Re: [f2fs-dev] [PATCH 0/4] f2fs: rework filename handling
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: linux-fscrypt@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>,
 Daniel Rosenberg <drosen@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Eric,

Thank you so much for the hard work. :P
Looks good to me in general, so let me kick off some tests.

On 05/07, Eric Biggers wrote:
> This patchset reworks f2fs's handling of filenames to make it much
> easier to correctly implement all combinations of normal, encrypted,
> casefolded, and encrypted+casefolded directories.  It also optimizes all
> filesystem operations to compute the dirhash and casefolded name only
> once, rather than once per directory level or directory block.
> 
> Patch 4 is RFC and shows how we can add support for encrypted+casefolded
> directories fairly easily after this rework -- including support for
> roll-forward recovery.  (It's incomplete as it doesn't include the
> needed dentry_ops -- those can be found in Daniel's patchset
> https://lkml.kernel.org/r/20200307023611.204708-1-drosen@google.com)
> 
> So far this is only lightly tested, e.g. with the xfstests in the
> 'encrypt' and 'casefold' groups.  I haven't tested patch 4 yet.
> 
> Eric Biggers (4):
>   f2fs: don't leak filename in f2fs_try_convert_inline_dir()
>   f2fs: split f2fs_d_compare() from f2fs_match_name()
>   f2fs: rework filename handling
>   f2fs: Handle casefolding with Encryption (INCOMPLETE)
> 
>  fs/f2fs/dir.c      | 415 +++++++++++++++++++++++++++------------------
>  fs/f2fs/f2fs.h     |  85 +++++++---
>  fs/f2fs/hash.c     |  87 +++++-----
>  fs/f2fs/inline.c   |  49 +++---
>  fs/f2fs/namei.c    |   6 +-
>  fs/f2fs/recovery.c |  61 +++++--
>  6 files changed, 430 insertions(+), 273 deletions(-)
> 
> -- 
> 2.26.2
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
