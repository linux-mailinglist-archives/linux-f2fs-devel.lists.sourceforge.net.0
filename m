Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7156D59C8B7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Aug 2022 21:23:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oQD0g-0007qZ-Sn;
	Mon, 22 Aug 2022 19:22:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oQD0X-0007pc-GK
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Aug 2022 19:22:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y8DUc2aMtcyzdJ165LkdhqaSmW/GIAJ55+lyn9VyQUk=; b=HikMf3V8qSOlZeUhnpo7k2A5Yr
 LDmJ7fy3klnXjmk4QLP2LRjh6rB7hFghT2ykcAyCbqW1jQjWh3A0G5xpIuJQ2FQ74c9bTcVD2Btjr
 r/wEn2FW5zC4MxzVOUvVl4ePD93ovMlmcqf7CRHnn1hxuZCFW90Pk/3B1FOrzCryPugc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y8DUc2aMtcyzdJ165LkdhqaSmW/GIAJ55+lyn9VyQUk=; b=RPpZT2rAxUttl3PRL+ewPI4MPe
 S29kxi10EkA2NxXH2MGArepwLtYjvl7qzGT2Zci7gkl+4+dPrau1lfx2w/k3twM0tRJCl3wjHbgGP
 OQYkFMIBPsMfnFMjfVRG9lqe6XbVwhxpxr0PZYt3hWnlq9u1zXHE05CBQauhQiVO63iU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oQCzv-0003jd-UW for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Aug 2022 19:22:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D9AC3B818AD;
 Mon, 22 Aug 2022 19:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532E8C433D7;
 Mon, 22 Aug 2022 19:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661196116;
 bh=mgWtjVWoyx6ivVv6KqvRp9PNUZE+61+wnocBktCea/A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CIFs7w+cOjoG4BduE0LbUS1ENxhhjU7JJzqn72xXr+ZLB3RpzO/QkWWY3ng4xKySB
 YXFCYUBJtkKG/eskdtYg/+xKiscWgupSY2/uxcdx7uc8dwA8KxDcetGyqgmWWRoUil
 XYqsqkCEKihHOJiDYVY/gmdt8gPwBs8ROSzQSXnx8EATmxvwAn4uB5a0X+MZZDFBCv
 F1EGyec7neAHgHcZVfCqAKNaFBZNaaxOl1VYe1j0sGVtblXVdiUXVSTnOQEhS6tH/b
 XIUEqTfRRK4c8OPWdupcRVgBwEZmSKKXgPoHKkZQGh18LOwgjjXU42YapqtH7v7Csl
 1P4cEan3FnB1A==
Date: Mon, 22 Aug 2022 12:21:54 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Message-ID: <YwPXUrawcKdy9qDx@sol.localdomain>
References: <20220815235052.86545-1-ebiggers@kernel.org>
 <YwPKh9fWUJLnSEF/@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YwPKh9fWUJLnSEF/@sol.localdomain>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 22, 2022 at 11:27:19AM -0700, Eric Biggers wrote:
 > On Mon, Aug 15, 2022 at 04:50:50PM -0700, Eric Biggers wrote: > > This
 series changes ext4 and f2fs to stop using PG_error to track > > [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oQCzv-0003jd-UW
Subject: Re: [f2fs-dev] [PATCH v2 0/2] ext4,
 f2fs: stop using PG_error for fscrypt and fsverity
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Aug 22, 2022 at 11:27:19AM -0700, Eric Biggers wrote:
> On Mon, Aug 15, 2022 at 04:50:50PM -0700, Eric Biggers wrote:
> > This series changes ext4 and f2fs to stop using PG_error to track
> > decryption and verity errors.  This is a step towards freeing up
> > PG_error for other uses, as discussed at
> > https://lore.kernel.org/linux-fsdevel/Yn10Iz1mJX1Mu1rv@casper.infradead.org
> > 
> > Note: due to the interdependencies with fs/crypto/ and fs/verity/,
> > I couldn't split this up into separate patches for each filesystem.
> > I'd appreciate Acks from the ext4 and f2fs maintainers so that I can
> > take these patches.  Otherwise I'm not sure how to move them forward.
> > 
> > Changed v1 => v2:
> >    - Rebased onto v6.0-rc1 and resolved conflicts in f2fs.
> > 
> > Eric Biggers (2):
> >   fscrypt: stop using PG_error to track error status
> >   fsverity: stop using PG_error to track error status
> > 
> >  fs/crypto/bio.c         | 16 +++++++----
> >  fs/ext4/readpage.c      | 16 +++++------
> >  fs/f2fs/compress.c      | 64 ++++++++++++++++++++---------------------
> >  fs/f2fs/data.c          | 64 +++++++++++++++++++++++------------------
> >  fs/verity/verify.c      | 12 ++++----
> >  include/linux/fscrypt.h |  5 ++--
> >  6 files changed, 93 insertions(+), 84 deletions(-)
> > 
> > 
> > base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
> 
> I'd appreciate review from the f2fs folks on this series, as that's where the
> most complex changes are.
> 

There's already a merge conflict with f2fs/dev, in the second patch :-(

It's going to be hard get this series merged, due to cross-tree dependencies.

I'll try to take the first patch (which handles decryption only, and is smaller)
through the fscrypt tree for 6.1.  Then maybe the second patch can go through
the f2fs tree later.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
