Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 766581B6BFE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Apr 2020 05:35:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jRp7r-0006UW-VM; Fri, 24 Apr 2020 03:35:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jRp7q-0006UP-Br
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Apr 2020 03:35:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KRSEymxeAMB1D3Hn+fxgugvzY453zEqMIciKFKB0ss4=; b=eqjqbH0e0+beziUZ0wxdtk5CKl
 Q8oORE8wyTzq3wRZtRW72mtreTLghn/c1bXC2ZMei2sclN+ilxDbMMONNZfLJs+cAmpaXrFZ8fb2S
 xxrqE+BW0RYXBoxmYxyiEq9vhEC5ScjAf0k2ITqsYdm8eDBzt+bh9NRtA67w5htwW4d4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KRSEymxeAMB1D3Hn+fxgugvzY453zEqMIciKFKB0ss4=; b=OriYxY3f9XNqBJAADoc5RNPzNC
 UhBaAuT4LhfC6xSPpZDIEzZlC715I5TP15f/Mbt5hdYGhsSId/QO/rMKUvZF6K6JuWWu166RKh6zU
 DyUGdAoF/vn+YDgAXWhx9+/HLjTshnseSftj4II31u6Aap+vbotu/20ObZ3sMP0WEM2I=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jRp7p-00C4jM-4e
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Apr 2020 03:35:38 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 35C24206D7;
 Fri, 24 Apr 2020 03:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587699328;
 bh=X4SrWJkSoc3Enbcge8Fd0LvQVeH/UDL4vww6M2ZMQP0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XJFpTycSwL3dRrWsMY+tgEUrJ06u5mgJKl5PDT/SRSRuZptbbNM0xDPU7s+Mshgn1
 uwXm7TubOigHs4yp+miarFIfiiYgSursUT2Nu37RUYptafjuEGc0N+xMHhoIefB2dV
 OukxSDbO1uoxXQGqsKSy+iVqwf8CyQBT+ZTyze28=
Date: Thu, 23 Apr 2020 20:35:27 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200424033527.GA106894@google.com>
References: <20200409173056.229855-1-jaegeuk@kernel.org>
 <77e9f2e6-f3f3-8ca9-e6b5-3d57c4d2acc5@huawei.com>
 <20200416213946.GA196168@google.com>
 <fd8b116a-7830-809c-70a4-a3a12da1eb14@huawei.com>
 <20200423194952.GA99191@google.com>
 <e67273bc-7416-c86e-58ba-c025029e8099@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e67273bc-7416-c86e-58ba-c025029e8099@huawei.com>
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
X-Headers-End: 1jRp7p-00C4jM-4e
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix quota_sync failure due to
 f2fs_lock_op
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/24, Chao Yu wrote:
> On 2020/4/24 3:49, Jaegeuk Kim wrote:
> > On 04/23, Chao Yu wrote:
> >> On 2020/4/17 5:39, Jaegeuk Kim wrote:
> >>> f2fs_quota_sync() uses f2fs_lock_op() before flushing dirty pages, but
> >>> f2fs_write_data_page() returns EAGAIN.
> >>> Likewise dentry blocks, we can just bypass getting the lock, since quota
> >>> blocks are also maintained by checkpoint.
> >>>
> >>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> >>> ---
> >>> v2:
> >>>  - fix multipage write case
> >>>
> >>>  fs/f2fs/compress.c | 2 +-
> >>>  fs/f2fs/data.c     | 4 ++--
> >>>  2 files changed, 3 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> >>> index df7b2d15eacde..faaa358289010 100644
> >>> --- a/fs/f2fs/compress.c
> >>> +++ b/fs/f2fs/compress.c
> >>> @@ -985,7 +985,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
> >>>  	loff_t psize;
> >>>  	int i, err;
> >>>  
> >>> -	if (!f2fs_trylock_op(sbi))
> >>> +	if (!IS_NOQUOTA(inode) && !f2fs_trylock_op(sbi))
> >>>  		return -EAGAIN;
> >>
> >> I encounter deadlock..
> >>
> >> Should call f2fs_unlock_op() for non-quota compressed inode later.
> > 
> > Could you elaborate a bit?
> 
> I meant we need to change as below, otherwise, cp_rwsem can be negative
> after f2fs_unlock_op if writebacked datas are belong to compressed quota
> file.

Ah, I see. Fixed.

Thanks,

> 
> >From 817dc629c47d3000c595640ecb3099b880519d47 Mon Sep 17 00:00:00 2001
> From: Jaegeuk Kim <jaegeuk@kernel.org>
> Date: Thu, 9 Apr 2020 10:25:21 -0700
> Subject: [PATCH] f2fs: fix quota_sync failure due to f2fs_lock_op
> 
> f2fs_quota_sync() uses f2fs_lock_op() before flushing dirty pages, but
> f2fs_write_data_page() returns EAGAIN.
> Likewise dentry blocks, we can just bypass getting the lock, since quota
> blocks are also maintained by checkpoint.
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/compress.c | 8 +++++---
>  fs/f2fs/data.c     | 4 ++--
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index df7b2d15eacd..26b071afe48a 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -985,7 +985,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>  	loff_t psize;
>  	int i, err;
> 
> -	if (!f2fs_trylock_op(sbi))
> +	if (!IS_NOQUOTA(inode) && !f2fs_trylock_op(sbi))
>  		return -EAGAIN;
> 
>  	set_new_dnode(&dn, cc->inode, NULL, NULL, 0);
> @@ -1092,7 +1092,8 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>  		set_inode_flag(inode, FI_FIRST_BLOCK_WRITTEN);
> 
>  	f2fs_put_dnode(&dn);
> -	f2fs_unlock_op(sbi);
> +	if (!IS_NOQUOTA(inode))
> +		f2fs_unlock_op(sbi);
> 
>  	spin_lock(&fi->i_size_lock);
>  	if (fi->last_disk_size < psize)
> @@ -1118,7 +1119,8 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>  out_put_dnode:
>  	f2fs_put_dnode(&dn);
>  out_unlock_op:
> -	f2fs_unlock_op(sbi);
> +	if (!IS_NOQUOTA(inode))
> +		f2fs_unlock_op(sbi);
>  	return -EAGAIN;
>  }
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 8dd48c5b6c0d..dd439dbb134d 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2660,8 +2660,8 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
>  			f2fs_available_free_memory(sbi, BASE_CHECK))))
>  		goto redirty_out;
> 
> -	/* Dentry blocks are controlled by checkpoint */
> -	if (S_ISDIR(inode->i_mode)) {
> +	/* Dentry/quota blocks are controlled by checkpoint */
> +	if (S_ISDIR(inode->i_mode) || IS_NOQUOTA(inode)) {
>  		fio.need_lock = LOCK_DONE;
>  		err = f2fs_do_write_data_page(&fio);
>  		goto done;
> -- 
> 2.18.0.rc1
> 
> 
> 
> > 
> >>
> >> Thanks,
> >>
> >>>  
> >>>  	set_new_dnode(&dn, cc->inode, NULL, NULL, 0);
> >>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> >>> index accd28728642a..5c8d3823d7593 100644
> >>> --- a/fs/f2fs/data.c
> >>> +++ b/fs/f2fs/data.c
> >>> @@ -2656,8 +2656,8 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
> >>>  			f2fs_available_free_memory(sbi, BASE_CHECK))))
> >>>  		goto redirty_out;
> >>>  
> >>> -	/* Dentry blocks are controlled by checkpoint */
> >>> -	if (S_ISDIR(inode->i_mode)) {
> >>> +	/* Dentry/quota blocks are controlled by checkpoint */
> >>> +	if (S_ISDIR(inode->i_mode) || IS_NOQUOTA(inode)) {
> >>>  		fio.need_lock = LOCK_DONE;
> >>>  		err = f2fs_do_write_data_page(&fio);
> >>>  		goto done;
> >>>
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
