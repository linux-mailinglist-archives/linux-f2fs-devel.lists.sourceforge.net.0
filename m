Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F0A25B822
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Sep 2020 03:08:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kDdjq-00030X-Jn; Thu, 03 Sep 2020 01:08:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kDdjo-00030G-I1
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Sep 2020 01:08:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I9fshM5rocs+gETWKWf4Hs/cgGoflhs9VMVDoH3w9rM=; b=UoFici7GA/bzn/LEBq3B5DVI0v
 nK0XSQMeJN99k6RMvK6DNWeQtxebAm087p+iw2M2S3kgkQ/lnml2M0Qp3c+zNcOLnSlv59NB1J1rn
 EfdG1z6ZjDoEOi7fMYJ1W0Lpo8Q3xOpqNlORbd9p5Ye29mb4c6l/P/kyt7WQEEqUUFeE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I9fshM5rocs+gETWKWf4Hs/cgGoflhs9VMVDoH3w9rM=; b=EmrCLGuEb5UofH5UBSVe+qnejB
 arcOB9waoNBfSoqTM4GumLoxhsUJ/6slCLbeaqezef50air4N9A1myWZByJFe8w7gLTAfaFvb9bU+
 VN9Mo9OrUpsSGv0GOL6fMGUQzaWP9E6chfAkYQqllEJb6CzOJDwD9wtynzoVjg4UFyoQ=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kDdji-00Aolg-Tk
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Sep 2020 01:08:28 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3AD4555C5E467FA82849;
 Thu,  3 Sep 2020 09:08:11 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 3 Sep 2020
 09:08:05 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20200902062910.4061083-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <822bd3b7-4354-1c61-07c4-6a57b3616ea8@huawei.com>
Date: Thu, 3 Sep 2020 09:08:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200902062910.4061083-1-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kDdji-00Aolg-Tk
Subject: Re: [f2fs-dev] [PATCH] f2fs: change i_compr_blocks of inode to
 atomic value
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/9/2 14:29, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> writepages() can be concurrently invoked for the same file by different
> threads such as a thread fsyncing the file and a kworker kernel thread.
> So, changing i_compr_blocks without protection is racy and we need to
> protect it by changing it with atomic type value.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   fs/f2fs/f2fs.h  | 15 +++++++++------
>   fs/f2fs/file.c  | 18 ++++++++++--------
>   fs/f2fs/inode.c | 11 +++++++----
>   fs/f2fs/super.c |  1 +
>   4 files changed, 27 insertions(+), 18 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index f60414805e05..633957e14944 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -801,7 +801,7 @@ struct f2fs_inode_info {
>   	struct timespec64 i_disk_time[4];/* inode disk times */
>   
>   	/* for file compress */
> -	u64 i_compr_blocks;			/* # of compressed blocks */
> +	atomic64_t i_compr_blocks;		/* # of compressed blocks */
>   	unsigned char i_compress_algorithm;	/* algorithm type */
>   	unsigned char i_log_cluster_size;	/* log of cluster size */
>   	unsigned int i_cluster_size;		/* cluster size */
> @@ -3933,14 +3933,16 @@ static inline void set_compress_context(struct inode *inode)
>   static inline u64 f2fs_disable_compressed_file(struct inode *inode)
>   {
>   	struct f2fs_inode_info *fi = F2FS_I(inode);
> +	u64 i_compr_blocks;
>   
>   	if (!f2fs_compressed_file(inode))
>   		return 0;
>   	if (S_ISREG(inode->i_mode)) {
>   		if (get_dirty_pages(inode))
>   			return 1;
> -		if (fi->i_compr_blocks)
> -			return fi->i_compr_blocks;
Caller doesn't care how many compr_blocks this inode has saved, so we can just
return 1 here.

> +		i_compr_blocks = atomic64_read(&fi->i_compr_blocks);
> +		if (i_compr_blocks)
> +			return i_compr_blocks;
>   	}
>   
>   	fi->i_flags &= ~F2FS_COMPR_FL;
> @@ -4057,16 +4059,17 @@ static inline void f2fs_i_compr_blocks_update(struct inode *inode,
>   						u64 blocks, bool add)
>   {
>   	int diff = F2FS_I(inode)->i_cluster_size - blocks;
> +	struct f2fs_inode_info *fi = F2FS_I(inode);
>   
>   	/* don't update i_compr_blocks if saved blocks were released */
> -	if (!add && !F2FS_I(inode)->i_compr_blocks)
> +	if (!add && !atomic64_read(&fi->i_compr_blocks))
>   		return;
>   
>   	if (add) {
> -		F2FS_I(inode)->i_compr_blocks += diff;
> +		atomic64_add(diff, &fi->i_compr_blocks);
>   		stat_add_compr_blocks(inode, diff);
>   	} else {
> -		F2FS_I(inode)->i_compr_blocks -= diff;
> +		atomic64_sub(diff, &fi->i_compr_blocks);
>   		stat_sub_compr_blocks(inode, diff);
>   	}
>   	f2fs_mark_inode_dirty_sync(inode, true);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index cc7f5670390f..4e4e369b97e5 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -564,7 +564,7 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
>   	bool compressed_cluster = false;
>   	int cluster_index = 0, valid_blocks = 0;
>   	int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
> -	bool released = !F2FS_I(dn->inode)->i_compr_blocks;
> +	bool released = !atomic64_read(&F2FS_I(dn->inode)->i_compr_blocks);
>   
>   	if (IS_INODE(dn->node_page) && f2fs_has_extra_attr(dn->inode))
>   		base = get_extra_isize(dn->inode);
> @@ -3436,7 +3436,7 @@ static int f2fs_get_compress_blocks(struct file *filp, unsigned long arg)
>   	if (!f2fs_compressed_file(inode))
>   		return -EINVAL;
>   
> -	blocks = F2FS_I(inode)->i_compr_blocks;
> +	blocks = atomic64_read(&F2FS_I(inode)->i_compr_blocks);
>   	return put_user(blocks, (u64 __user *)arg);
>   }
>   
> @@ -3535,7 +3535,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
>   	if (ret)
>   		goto out;
>   
> -	if (!F2FS_I(inode)->i_compr_blocks)
> +	if (!atomic64_read(&F2FS_I(inode)->i_compr_blocks))
>   		goto out;
>   
>   	F2FS_I(inode)->i_flags |= F2FS_IMMUTABLE_FL;
> @@ -3588,14 +3588,15 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
>   
>   	if (ret >= 0) {
>   		ret = put_user(released_blocks, (u64 __user *)arg);
> -	} else if (released_blocks && F2FS_I(inode)->i_compr_blocks) {
> +	} else if (released_blocks &&
> +			atomic64_read(&F2FS_I(inode)->i_compr_blocks)) {
>   		set_sbi_flag(sbi, SBI_NEED_FSCK);
>   		f2fs_warn(sbi, "%s: partial blocks were released i_ino=%lx "
>   			"iblocks=%llu, released=%u, compr_blocks=%llu, "
>   			"run fsck to fix.",
>   			__func__, inode->i_ino, inode->i_blocks,
>   			released_blocks,
> -			F2FS_I(inode)->i_compr_blocks);
> +			atomic64_read(&F2FS_I(inode)->i_compr_blocks));
>   	}
>   
>   	return ret;
> @@ -3683,7 +3684,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
>   	if (ret)
>   		return ret;
>   
> -	if (F2FS_I(inode)->i_compr_blocks)
> +	if (atomic64_read(&F2FS_I(inode)->i_compr_blocks))
>   		goto out;
>   
>   	f2fs_balance_fs(F2FS_I_SB(inode), true);
> @@ -3747,14 +3748,15 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
>   
>   	if (ret >= 0) {
>   		ret = put_user(reserved_blocks, (u64 __user *)arg);
> -	} else if (reserved_blocks && F2FS_I(inode)->i_compr_blocks) {
> +	} else if (reserved_blocks &&
> +			atomic64_read(&F2FS_I(inode)->i_compr_blocks)) {
>   		set_sbi_flag(sbi, SBI_NEED_FSCK);
>   		f2fs_warn(sbi, "%s: partial blocks were released i_ino=%lx "
>   			"iblocks=%llu, reserved=%u, compr_blocks=%llu, "
>   			"run fsck to fix.",
>   			__func__, inode->i_ino, inode->i_blocks,
>   			reserved_blocks,
> -			F2FS_I(inode)->i_compr_blocks);
> +			atomic64_read(&F2FS_I(inode)->i_compr_blocks));
>   	}
>   
>   	return ret;
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 66969ae852b9..e86857af9699 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -442,7 +442,8 @@ static int do_read_inode(struct inode *inode)
>   					(fi->i_flags & F2FS_COMPR_FL)) {
>   		if (F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
>   					i_log_cluster_size)) {
> -			fi->i_compr_blocks = le64_to_cpu(ri->i_compr_blocks);
> +			atomic64_set(&fi->i_compr_blocks,
> +					le64_to_cpu(ri->i_compr_blocks));
>   			fi->i_compress_algorithm = ri->i_compress_algorithm;
>   			fi->i_log_cluster_size = ri->i_log_cluster_size;
>   			fi->i_cluster_size = 1 << fi->i_log_cluster_size;
> @@ -460,7 +461,7 @@ static int do_read_inode(struct inode *inode)
>   	stat_inc_inline_inode(inode);
>   	stat_inc_inline_dir(inode);
>   	stat_inc_compr_inode(inode);
> -	stat_add_compr_blocks(inode, F2FS_I(inode)->i_compr_blocks);
> +	stat_add_compr_blocks(inode, atomic64_read(&fi->i_compr_blocks));
>   
>   	return 0;
>   }
> @@ -619,7 +620,8 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
>   			F2FS_FITS_IN_INODE(ri, F2FS_I(inode)->i_extra_isize,
>   							i_log_cluster_size)) {
>   			ri->i_compr_blocks =
> -				cpu_to_le64(F2FS_I(inode)->i_compr_blocks);
> +				cpu_to_le64(atomic64_read(
> +					&F2FS_I(inode)->i_compr_blocks));
>   			ri->i_compress_algorithm =
>   				F2FS_I(inode)->i_compress_algorithm;
>   			ri->i_log_cluster_size =
> @@ -768,7 +770,8 @@ void f2fs_evict_inode(struct inode *inode)
>   	stat_dec_inline_dir(inode);
>   	stat_dec_inline_inode(inode);
>   	stat_dec_compr_inode(inode);
> -	stat_sub_compr_blocks(inode, F2FS_I(inode)->i_compr_blocks);
> +	stat_sub_compr_blocks(inode,
> +			atomic64_read(&F2FS_I(inode)->i_compr_blocks));
>   
>   	if (likely(!f2fs_cp_error(sbi) &&
>   				!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 83bf9a02f83f..65613500e1ab 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1011,6 +1011,7 @@ static struct inode *f2fs_alloc_inode(struct super_block *sb)
>   
>   	/* Initialize f2fs-specific inode info */
>   	atomic_set(&fi->dirty_pages, 0);
> +	atomic64_set(&fi->i_compr_blocks, 0);
>   	init_rwsem(&fi->i_sem);
>   	spin_lock_init(&fi->i_size_lock);
>   	INIT_LIST_HEAD(&fi->dirty_list);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
