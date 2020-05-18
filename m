Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BADF1D875D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 May 2020 20:36:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jakcR-0005iB-Fl; Mon, 18 May 2020 18:36:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jakcP-0005hx-V7
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 May 2020 18:36:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wbdmgiSA9uqdVacQeLvkEi2TFVLnd1TQips1NE6ipNA=; b=dbSCsA9NxIdFos+4jOrSO1JJBH
 MeWX/IqtfjTYQQ7YiljPpseoGUMLDTC5MXwCWoSpQnKtcZI/XZ+fXpQiZkn9cPzZchZgnOnBs/QI5
 E8X340BDOsGJ7v4+DzMNCXCVuJmufOh4AmmzkjigDbGbAmuv3WKrJ+L7Rf0IH8l7uKz4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wbdmgiSA9uqdVacQeLvkEi2TFVLnd1TQips1NE6ipNA=; b=Kp/MlQu8H58YxLKuWRzbXdFJIg
 8GHBMX9Brk4Z2zZdsF+7XIqJ7HsEeWgUJahe4fTq7Fud3CKFrrWGcFmGlfg/Lrkm1qPJkKDkjVSWF
 q6wUeaFwsCoZoIX2w5Tnxk3se5b4bvMKbBlgcvqHxvNJU7hhAPVTCEv5FRpTKNfOQYck=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jakcG-00EGZS-MH
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 May 2020 18:36:05 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE60020715;
 Mon, 18 May 2020 18:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589826944;
 bh=E6EpMAiuGo4p9ujOeELI+8en7tMtKUuc3RaFTgxNX3I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L5sfVHWoIiiRKy3p3+hKRs3J026wvJEQdqp6BLDswWji0eqfovcpJhIdXQWq3KlYt
 bjy0J9hqzbzhH/AucMy4au7HRWEC8t3M2y+aJZdtxdx/aYcnw8Agdpk5aoQUK6LJ5J
 uRjwQnZ2640Ms/3zB+PIu/Gg0n0G+XvM82dBgIcc=
Date: Mon, 18 May 2020 11:35:42 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20200518183542.GA121709@gmail.com>
References: <20200505204823.211214-1-ebiggers@kernel.org>
 <20200518180648.GB218254@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200518180648.GB218254@google.com>
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
X-Headers-End: 1jakcG-00EGZS-MH
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't return vmalloc() memory from
 f2fs_kmalloc()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, May 18, 2020 at 11:06:48AM -0700, Jaegeuk Kim wrote:
> On 05/05, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > kmalloc() returns kmalloc'ed memory, and kvmalloc() returns either
> > kmalloc'ed or vmalloc'ed memory.  But the f2fs wrappers, f2fs_kmalloc()
> > and f2fs_kvmalloc(), both return both kinds of memory.
> > 
> > It's redundant to have two functions that do the same thing, and also
> > breaking the standard naming convention is causing bugs since people
> > assume it's safe to kfree() memory allocated by f2fs_kmalloc().  See
> > e.g. the various allocations in fs/f2fs/compress.c.
> > 
> > Fix this by making f2fs_kmalloc() just use kmalloc().  And to avoid
> > re-introducing the allocation failures that the vmalloc fallback was
> > intended to fix, convert the largest allocations to use f2fs_kvmalloc().
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> >  fs/f2fs/checkpoint.c | 4 ++--
> >  fs/f2fs/f2fs.h       | 8 +-------
> >  fs/f2fs/node.c       | 8 ++++----
> >  3 files changed, 7 insertions(+), 13 deletions(-)
> > 
> > diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> > index 97b6378554b406..ac5b47f15f5e77 100644
> > --- a/fs/f2fs/checkpoint.c
> > +++ b/fs/f2fs/checkpoint.c
> > @@ -895,8 +895,8 @@ int f2fs_get_valid_checkpoint(struct f2fs_sb_info *sbi)
> >  	int i;
> >  	int err;
> >  
> > -	sbi->ckpt = f2fs_kzalloc(sbi, array_size(blk_size, cp_blks),
> > -				 GFP_KERNEL);
> > +	sbi->ckpt = f2fs_kvzalloc(sbi, array_size(blk_size, cp_blks),
> > +				  GFP_KERNEL);
> >  	if (!sbi->ckpt)
> >  		return -ENOMEM;
> >  	/*
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index d036a31a97e84e..bc4c5b9b1bf14c 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -2953,18 +2953,12 @@ static inline bool f2fs_may_extent_tree(struct inode *inode)
> >  static inline void *f2fs_kmalloc(struct f2fs_sb_info *sbi,
> >  					size_t size, gfp_t flags)
> >  {
> > -	void *ret;
> > -
> >  	if (time_to_inject(sbi, FAULT_KMALLOC)) {
> >  		f2fs_show_injection_info(sbi, FAULT_KMALLOC);
> >  		return NULL;
> >  	}
> >  
> > -	ret = kmalloc(size, flags);
> > -	if (ret)
> > -		return ret;
> > -
> > -	return kvmalloc(size, flags);
> > +	return kmalloc(size, flags);
> 
> IIRC, sometimes, we suffered from ENOMEM from kmalloc, as some structures
> depended on the disk capacity. I can't remember exactly which structure tho.
> 

I think this patch already addresses that, by changing the large allocations to
use f2fs_kvmalloc().

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
