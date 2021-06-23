Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5313B1574
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Jun 2021 10:09:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lvxwx-0001oW-Co; Wed, 23 Jun 2021 08:09:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lvxws-0001oM-WD
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Jun 2021 08:09:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7Ni3VF0EYW0bmkh1lWvAXbOW4dcndM+5s95rom3rnsk=; b=e5rvI1TgiZtqnP8e4xRStsoYUo
 OIP7x6I2ARHS/qIvM2XO/bklVZN22wqZS3523Dy4GifSp7EPpNVRZoAac3D17vvYNMguXQTcqroWY
 keIHSGzc8XCN4R+NqinC9fr945f+tE32OzZgAnwtM7/VCnb9k6iVtk9hxoQNSNgXFOts=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7Ni3VF0EYW0bmkh1lWvAXbOW4dcndM+5s95rom3rnsk=; b=d1rk/5DxeQmHIzbW+YcBjH/Yii
 f3c+Gw8b3Rkoo8XPLVSu5QKeP98QtPw2OzFThqKstbeWyL4JFOPlFR7i56Q/vdd3AmDhIfXEYLqNE
 0+QRatv1zC5TuexEZnjnQVFquQXz89pY9Dsu52wb3kF2Nx0zX7zTIIugAu3UzWT+C4j8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lvxwp-0008M5-E1
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Jun 2021 08:09:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E12F60FD9;
 Wed, 23 Jun 2021 08:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624435755;
 bh=26gGPscRNaH9KSVko1kHwFNBDMkfJcjIywyyiyVfmTY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=saWNFdPQy1IUmDQ5b2wYcLF2XrgJjDEfb/7fd7y6cL6qDDSpDFarshR0yRpACVL6i
 oLa/dcyPNkFqepUejvmDR8D/f3EVYuu7ElGEkR/URryw4yAAcxs6kCjLHb93Tl1prP
 I27rmOmrOQWCcFPLIJYRux2ZqBpgnv5RAgxyYLfqrbUjG+EvgXLNIlC6gHzRu4uR3G
 A6iDvLEGRvHJONBM57cjgecqhqxYsipTPXi/4VXP5vKNxWEmIY0yVCCfN0ev+i5FtF
 sY4B+o7DU1F/JvAgh3Y/Ey8yA33ctU11/csjVsBRTuG/OniNz6EmZAVFkDHBnxjGkC
 hlkWbOgHutUEg==
Date: Wed, 23 Jun 2021 01:09:13 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YNLsKSSxS5xLJcnB@google.com>
References: <20210525113909.113486-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210525113909.113486-1-yuchao0@huawei.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lvxwp-0008M5-E1
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid attaching SB_ACTIVE flag during
 mount/remount
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
Cc: Zhang Yi <yi.zhang@huawei.com>, Jan Kara <jack@suse.cz>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

I'll remove this patch, since it breaks checkpoint=disable and recovery
flow that check SB_ACTIVE.

Thanks,

On 05/25, Chao Yu wrote:
> Quoted from [1]
> 
> "I do remember that I've added this code back then because otherwise
> orphan cleanup was losing updates to quota files. But you're right
> that now I don't see how that could be happening and it would be nice
> if we could get rid of this hack"
> 
> [1] https://lore.kernel.org/linux-ext4/99cce8ca-e4a0-7301-840f-2ace67c551f3@huawei.com/T/#m04990cfbc4f44592421736b504afcc346b2a7c00
> 
> Related fix in ext4 by
> commit 72ffb49a7b62 ("ext4: do not set SB_ACTIVE in ext4_orphan_cleanup()").
> 
> f2fs has the same hack implementation in
> - f2fs_recover_orphan_inodes()
> - f2fs_recover_fsync_data()
> - f2fs_disable_checkpoint()
> 
> Let's get rid of this hack as well in f2fs.
> 
> Cc: Zhang Yi <yi.zhang@huawei.com>
> Cc: Jan Kara <jack@suse.cz>
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/checkpoint.c |  3 ---
>  fs/f2fs/recovery.c   |  8 ++------
>  fs/f2fs/super.c      | 11 ++++-------
>  3 files changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 6c208108d69c..a578c7d13d81 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -691,9 +691,6 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
>  	}
>  
>  #ifdef CONFIG_QUOTA
> -	/* Needed for iput() to work correctly and not trash data */
> -	sbi->sb->s_flags |= SB_ACTIVE;
> -
>  	/*
>  	 * Turn on quotas which were not enabled for read-only mounts if
>  	 * filesystem has quota feature, so that they are updated correctly.
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index 4b2f7d1d5bf4..4cfe36fa41be 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -782,8 +782,6 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
>  	}
>  
>  #ifdef CONFIG_QUOTA
> -	/* Needed for iput() to work correctly and not trash data */
> -	sbi->sb->s_flags |= SB_ACTIVE;
>  	/* Turn on quotas so that they are updated correctly */
>  	quota_enabled = f2fs_enable_quota_files(sbi, s_flags & SB_RDONLY);
>  #endif
> @@ -811,10 +809,8 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
>  	err = recover_data(sbi, &inode_list, &tmp_inode_list, &dir_list);
>  	if (!err)
>  		f2fs_bug_on(sbi, !list_empty(&inode_list));
> -	else {
> -		/* restore s_flags to let iput() trash data */
> -		sbi->sb->s_flags = s_flags;
> -	}
> +	else
> +		f2fs_bug_on(sbi, sbi->sb->s_flags & SB_ACTIVE);
>  skip:
>  	fix_curseg_write_pointer = !check_only || list_empty(&inode_list);
>  
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 0a77808ebb8f..e7bd983fbddc 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1881,17 +1881,15 @@ static int f2fs_enable_quotas(struct super_block *sb);
>  
>  static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
>  {
> -	unsigned int s_flags = sbi->sb->s_flags;
>  	struct cp_control cpc;
>  	int err = 0;
>  	int ret;
>  	block_t unusable;
>  
> -	if (s_flags & SB_RDONLY) {
> +	if (sbi->sb->s_flags & SB_RDONLY) {
>  		f2fs_err(sbi, "checkpoint=disable on readonly fs");
>  		return -EINVAL;
>  	}
> -	sbi->sb->s_flags |= SB_ACTIVE;
>  
>  	f2fs_update_time(sbi, DISABLE_TIME);
>  
> @@ -1909,13 +1907,13 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
>  	ret = sync_filesystem(sbi->sb);
>  	if (ret || err) {
>  		err = ret ? ret : err;
> -		goto restore_flag;
> +		goto out;
>  	}
>  
>  	unusable = f2fs_get_unusable_blocks(sbi);
>  	if (f2fs_disable_cp_again(sbi, unusable)) {
>  		err = -EAGAIN;
> -		goto restore_flag;
> +		goto out;
>  	}
>  
>  	down_write(&sbi->gc_lock);
> @@ -1931,8 +1929,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
>  
>  out_unlock:
>  	up_write(&sbi->gc_lock);
> -restore_flag:
> -	sbi->sb->s_flags = s_flags;	/* Restore SB_RDONLY status */
> +out:
>  	return err;
>  }
>  
> -- 
> 2.29.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
