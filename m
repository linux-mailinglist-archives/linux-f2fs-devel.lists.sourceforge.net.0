Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC6818D81B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Mar 2020 20:08:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jFN0A-0000NP-Jf; Fri, 20 Mar 2020 19:08:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jFN09-0000NH-HD
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 19:08:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sbsl7HSLMP22aUPoyi9+Ls5caOwusF5joQFGI5m+Zqs=; b=Et2fwLQIhdjzYDN8GyPbv4+D7N
 dpBc99wq2qZCeJfO3wQBfz+PaCJmhxdrEJS2z8zYsKnAd41PGY5WwdVTylAsCMUDqaA4SL96WySMv
 6SJlFSpU9dShfRpf0WmSO3b9WLg4uNtD/FpjeClhuIv/XOtAFaxkcdadtokv4ftv1I7Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sbsl7HSLMP22aUPoyi9+Ls5caOwusF5joQFGI5m+Zqs=; b=ebTAjHiryTNLsG2cRhrJYBcpFJ
 CZlE4PwX79EkZu2vK//GJ47J3azWoyTOIfSE5PCJ/jMamzH5S9QUxuhql7UiiTWKFt/JIkDg3iYgK
 lhjwSZ3yfmnjuycGkn1eEK2elnLsdDe7Ge4niThvRVk8jM6dtGvvZjFFlsMwHFZeq9U0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jFN02-00FatQ-Pr
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 19:08:13 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 15BC920767;
 Fri, 20 Mar 2020 19:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584731281;
 bh=misA3EzkdffBZ3aysYeGsyJ9FFPtYgTX3fo69Cz7vtY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tef5Vl944UuHb2eojwiNWF6ceUS3tnRapEQ2gk6xcj5X2wBygT7ThCakDv9IvvBot
 oY2+1hgbgzo+xbysOofBVsn1o2h9HVGtcXlHH6M+kduDa0/mZG4vlge64+hqKgC/X2
 800BYcn8nWfY5V7xWkq9k79mOh4TJWZSdLP2yenI=
Date: Fri, 20 Mar 2020 12:07:59 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200320190759.GK851@sol.localdomain>
References: <20200320101831.70611-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320101831.70611-1-yuchao0@huawei.com>
X-Spam-Score: -0.4 (/)
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jFN02-00FatQ-Pr
Subject: Re: [f2fs-dev] [PATCH] f2fs: clean up f2fs_may_encrypt()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Mar 20, 2020 at 06:18:31PM +0800, Chao Yu wrote:
> Merge below two conditions into f2fs_may_encrypt() for cleanup
> - IS_ENCRYPTED()
> - DUMMY_ENCRYPTION_ENABLED()
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/dir.c   |  4 +---
>  fs/f2fs/f2fs.h  | 13 +++++++++----
>  fs/f2fs/namei.c |  4 +---
>  3 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index 0971ccc4664a..2accfc5e38d0 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -471,7 +471,6 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
>  			struct page *dpage)
>  {
>  	struct page *page;
> -	int dummy_encrypt = DUMMY_ENCRYPTION_ENABLED(F2FS_I_SB(dir));
>  	int err;
>  
>  	if (is_inode_flag_set(inode, FI_NEW_INODE)) {
> @@ -498,8 +497,7 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
>  		if (err)
>  			goto put_error;
>  
> -		if ((IS_ENCRYPTED(dir) || dummy_encrypt) &&
> -					f2fs_may_encrypt(inode)) {
> +		if (f2fs_may_encrypt(dir, inode)) {
>  			err = fscrypt_inherit_context(dir, inode, page, false);
>  			if (err)
>  				goto put_error;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 09db79a20f8e..fcafa68212eb 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3946,15 +3946,20 @@ static inline bool f2fs_lfs_mode(struct f2fs_sb_info *sbi)
>  	return F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS;
>  }
>  
> -static inline bool f2fs_may_encrypt(struct inode *inode)
> +static inline bool f2fs_may_encrypt(struct inode *dir, struct inode *inode)
>  {
>  #ifdef CONFIG_FS_ENCRYPTION
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
>  	umode_t mode = inode->i_mode;
>  
> -	return (S_ISREG(mode) || S_ISDIR(mode) || S_ISLNK(mode));
> -#else
> -	return false;
> +	/*
> +	 * If the directory encrypted or dummy encryption enabled,
> +	 * then we should encrypt the inode.
> +	 */
> +	if (IS_ENCRYPTED(dir) || DUMMY_ENCRYPTION_ENABLED(sbi))
> +		return (S_ISREG(mode) || S_ISDIR(mode) || S_ISLNK(mode));
>  #endif
> +	return false;
>  }
>  
>  static inline bool f2fs_may_compress(struct inode *inode)
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index b75c70813f9e..95cfbce062e8 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -75,9 +75,7 @@ static struct inode *f2fs_new_inode(struct inode *dir, umode_t mode)
>  
>  	set_inode_flag(inode, FI_NEW_INODE);
>  
> -	/* If the directory encrypted, then we should encrypt the inode. */
> -	if ((IS_ENCRYPTED(dir) || DUMMY_ENCRYPTION_ENABLED(sbi)) &&
> -				f2fs_may_encrypt(inode))
> +	if (f2fs_may_encrypt(dir, inode))
>  		f2fs_set_encrypted_inode(inode);
>  
>  	if (f2fs_sb_has_extra_attr(sbi)) {
> -- 

Can't f2fs_init_inode_metadata() just check IS_ENCRYPTED(inode) instead?
(inode, not dir.)  The encrypt flag was already set by f2fs_new_inode(), right?

If so, then f2fs_may_encrypt() would only have one caller and it could be
inlined into f2fs_new_inode(), similar to __ext4_new_inode().

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
