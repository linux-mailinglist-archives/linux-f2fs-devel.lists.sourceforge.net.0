Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 021FB2C7C50
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Nov 2020 02:20:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kjXrK-0007GT-ER; Mon, 30 Nov 2020 01:20:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kjXrJ-0007GI-Dq
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Nov 2020 01:20:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HUcr/ao3PnLrarswt3nLhTTdM1w0lHWzi4M/X4gjYBg=; b=CrofxhaheG+XB07MLvJOlO7eak
 3nJWcItgnXBGqHDWsL8trPEyhjhpz+JRDXgjskmj4iS0PyL7FVh8OrogqisbJgiMovb6BU6MurFfG
 FqeeETNt82c9s25KAuFydxrRon5WywA6OSQNteCgDILKenPMCQBSg0wKEEMFjJCeLntA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HUcr/ao3PnLrarswt3nLhTTdM1w0lHWzi4M/X4gjYBg=; b=ZabZt/6rAtgA8NzvUVrcO/Mvm+
 cKYBQ5995TtfWpQoJqHNpiJF8NDFUVUsZ2lkcKItIusSQsG/sJzpoIq5ii8pcUiQPdCzaZAnIk+jI
 jqjwWwNEXth+sOmDxaTYSM7FBEVkacVcvz0Q0I2/bDfq41sjgFEOwYMUBRUxk6kzfC30=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kjXr3-0053qa-J2
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Nov 2020 01:20:05 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CknSW5LHTzhk9G;
 Mon, 30 Nov 2020 09:19:07 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 30 Nov
 2020 09:19:26 +0800
To: Shachar Raindel <shacharr@gmail.com>, <jaegeuk@kernel.org>,
 <chao@kernel.org>, <ebiggers@google.com>, <daehojeong@google.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20201128174124.22397-1-shacharr@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <fcd8b499-239f-c776-dad7-b4a0e19ca1fd@huawei.com>
Date: Mon, 30 Nov 2020 09:19:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201128174124.22397-1-shacharr@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1kjXr3-0053qa-J2
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix deadlock between f2fs_quota_sync
 and block_operation
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/11/29 1:41, Shachar Raindel wrote:
> This deadlock is hitting Android users (Pixel 3/3a/4) with Magisk, due
> to frequent umount/mount operations that trigger quota_sync, hitting
> the race. See https://github.com/topjohnwu/Magisk/issues/3171 for
> additional impact discussion.
> 
> In commit db6ec53b7e03, we added a semaphore to protect quota flags.
> As part of this commit, we changed f2fs_quota_sync to call
> f2fs_lock_op, in an attempt to prevent an AB/BA type deadlock with
> quota_sem locking in block_operation.  However, rwsem in Linux is not
> recursive. Therefore, the following deadlock can occur:
> 
> f2fs_quota_sync
> down_read(cp_rwsem) // f2fs_lock_op
> filemap_fdatawrite
> f2fs_write_data_pages
> ...
>                                     block_opertaion
> 				   down_write(cp_rwsem) - marks rwsem as
> 				                          "writer pending"
> down_read_trylock(cp_rwsem) - fails as there is
>                                a writer pending.
> 			      Code keeps on trying,
> 			      live-locking the filesystem.

f2fs_write_single_data_page() will not grab read lock of cp_rwsem now, could you
please check f2fs code in mainline?

	/* Dentry/quota blocks are controlled by checkpoint */
	if (S_ISDIR(inode->i_mode) || IS_NOQUOTA(inode)) {
		/*
		 * We need to wait for node_write to avoid block allocation during
		 * checkpoint. This can only happen to quota writes which can cause
		 * the below discard race condition.
		 */
		if (IS_NOQUOTA(inode))
			down_read(&sbi->node_write);

		fio.need_lock = LOCK_DONE;
		err = f2fs_do_write_data_page(&fio);

		if (IS_NOQUOTA(inode))
			up_read(&sbi->node_write);

		goto done;
	}

Thanks,

> 
> We solve this by creating a new rwsem, used specifically to
> synchronize this case, instead of attempting to reuse an existing
> lock.
> 
> Signed-off-by: Shachar Raindel <shacharr@gmail.com>
> 
> Fixes: db6ec53b7e03 f2fs: add a rw_sem to cover quota flag changes
> ---
>   fs/f2fs/f2fs.h  |  3 +++
>   fs/f2fs/super.c | 13 +++++++++++--
>   2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index cb700d797296..b3e55137be7f 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1448,6 +1448,7 @@ struct f2fs_sb_info {
>   	struct inode *meta_inode;		/* cache meta blocks */
>   	struct mutex cp_mutex;			/* checkpoint procedure lock */
>   	struct rw_semaphore cp_rwsem;		/* blocking FS operations */
> +	struct rw_semaphore cp_quota_rwsem;    	/* blocking quota sync operations */
>   	struct rw_semaphore node_write;		/* locking node writes */
>   	struct rw_semaphore node_change;	/* locking node change */
>   	wait_queue_head_t cp_wait;
> @@ -1961,12 +1962,14 @@ static inline void f2fs_unlock_op(struct f2fs_sb_info *sbi)
>   
>   static inline void f2fs_lock_all(struct f2fs_sb_info *sbi)
>   {
> +	down_write(&sbi->cp_quota_rwsem);
>   	down_write(&sbi->cp_rwsem);
>   }
>   
>   static inline void f2fs_unlock_all(struct f2fs_sb_info *sbi)
>   {
>   	up_write(&sbi->cp_rwsem);
> +	up_write(&sbi->cp_quota_rwsem);
>   }
>   
>   static inline int __get_cp_reason(struct f2fs_sb_info *sbi)
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 00eff2f51807..5ce61147d7e5 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2209,8 +2209,16 @@ int f2fs_quota_sync(struct super_block *sb, int type)
>   	 *  f2fs_dquot_commit
>   	 *                            block_operation
>   	 *                            down_read(quota_sem)
> +	 *
> +	 * However, we cannot use the cp_rwsem to prevent this
> +	 * deadlock, as the cp_rwsem is taken for read inside the
> +	 * f2fs_dquot_commit code, and rwsem is not recursive.
> +	 *
> +	 * We therefore use a special lock to synchronize
> +	 * f2fs_quota_sync with block_operations, as this is the only
> +	 * place where such recursion occurs.
>   	 */
> -	f2fs_lock_op(sbi);
> +	down_read(&sbi->cp_quota_rwsem);
>   
>   	down_read(&sbi->quota_sem);
>   	ret = dquot_writeback_dquots(sb, type);
> @@ -2251,7 +2259,7 @@ int f2fs_quota_sync(struct super_block *sb, int type)
>   	if (ret)
>   		set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
>   	up_read(&sbi->quota_sem);
> -	f2fs_unlock_op(sbi);
> +	up_read(&sbi->cp_quota_rwsem);
>   	return ret;
>   }
>   
> @@ -3599,6 +3607,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>   
>   	init_rwsem(&sbi->cp_rwsem);
>   	init_rwsem(&sbi->quota_sem);
> +	init_rwsem(&sbi->cp_quota_rwsem);
>   	init_waitqueue_head(&sbi->cp_wait);
>   	init_sb_info(sbi);
>   
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
