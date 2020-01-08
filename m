Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFB3134AEE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jan 2020 19:50:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ipGPT-0003an-VJ; Wed, 08 Jan 2020 18:50:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1ipGPR-0003ad-TU
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jan 2020 18:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tuyYSlHxUy40wKZazP6UBCrQeCO9R0GlxdaWQayqkSw=; b=Q2nWD0TDOKvUWP04rdvckbyCxX
 8q9pWlYRLISl+PHl48Af+ISwOERc5xiWpL8gsh7b1csMfiMEHJR+usVtWcYYaFhgsAS2Pq3rx/j/+
 zdbP8Iyse9RZeD3KJiFcJbw0QKGGpg69IFh6uRQUn3preizI7ccj3hCNBZPmIUCuIJSQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tuyYSlHxUy40wKZazP6UBCrQeCO9R0GlxdaWQayqkSw=; b=jyhgP/NRS/jq4AoVzvUGtDMuOl
 +14qaABMAlNnLF3ua73OX43ctazWc5qsJX1LBfPDbrh8hdH4Uny0YBwyNk67WjhP82o/ht18uElBi
 REYQoVVAUlFChNKCfEXQeY1+5kBk2rNN4UEIUbbE9vBDqDVnGouEC+xnK6S6/UjbIghs=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ipGPQ-00Ens1-80
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jan 2020 18:50:25 +0000
Received: from callcc.thunk.org (guestnat-104-133-0-111.corp.google.com
 [104.133.0.111] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 008Io5fk020705
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 Jan 2020 13:50:06 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 7075E4207DF; Wed,  8 Jan 2020 13:50:05 -0500 (EST)
Date: Wed, 8 Jan 2020 13:50:05 -0500
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20200108185005.GE263696@mit.edu>
References: <20200107051638.40893-1-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200107051638.40893-1-drosen@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 MAY_BE_FORGED          Relay IP's reverse DNS does not resolve to IP
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ipGPQ-00Ens1-80
Subject: Re: [f2fs-dev] [PATCH v2 0/6] Support for Casefolding and Encryption
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
Cc: Jonathan Corbet <corbet@lwn.net>, kernel-team@android.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 06, 2020 at 09:16:32PM -0800, Daniel Rosenberg wrote:
> changes:
> fscrypt moved to separate thread to rebase on fscrypt dev branch
> addressed feedback, plus some minor fixes

What branch was this based on?  There is no fscrypt dev branch, so I
took the fscrypt master branch, and then applied your fscrypt patches,
and then I tried to apply this patch series.  I got patch conflicts
starting with the very first patch.

Applying: TMP: fscrypt: Add support for casefolding with encryption
error: patch failed: fs/crypto/Kconfig:9
error: fs/crypto/Kconfig: patch does not apply
error: patch failed: fs/crypto/fname.c:12
error: fs/crypto/fname.c: patch does not apply
error: patch failed: fs/crypto/fscrypt_private.h:12
error: fs/crypto/fscrypt_private.h: patch does not apply
error: patch failed: fs/crypto/keysetup.c:192
error: fs/crypto/keysetup.c: patch does not apply
error: patch failed: fs/crypto/policy.c:67
error: fs/crypto/policy.c: patch does not apply
error: patch failed: fs/inode.c:20
error: fs/inode.c: patch does not apply
error: patch failed: include/linux/fscrypt.h:127
error: include/linux/fscrypt.h: patch does not apply
Patch failed at 0001 TMP: fscrypt: Add support for casefolding with encryption
hint: Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

   	       		       	   		  - Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
