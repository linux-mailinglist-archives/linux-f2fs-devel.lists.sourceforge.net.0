Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 769E61AB94A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Apr 2020 09:04:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOyZp-0001qY-4G; Thu, 16 Apr 2020 07:04:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jOyZn-0001qR-NJ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Apr 2020 07:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jyhAioMVV1NIz6i643GLE533NBCNN8eP/yv8BEQlihs=; b=jMRPotl/mgbe26l+1Ay70FN15J
 f7fes40juBBGVRBPko0aP2dkDmTi0VQR/lkCrmfd/Vf7hE3hcMr8OommN6N6TxcW7WeoMToP47Rrx
 iQiDA8YJKLEIp0KPDZidZX6dRrTUvTrm2dv7KqNDPXJpmLrfd4k5/SQbqKpkZ+Ao9CDw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jyhAioMVV1NIz6i643GLE533NBCNN8eP/yv8BEQlihs=; b=J67X843XBwJuGp4e/FtB5DBZEo
 cbU/tcRvr6JDNibyZH28NkOKqdBsRxq/e69O6ZSvpb7biYLvOCD9roLS7KfK8t3uxQbT/xYAk7QWD
 P7czaEKIFYW4scIEoC1CXAoROHyh1X6f29Xky5Hn/66c1KCa6rPk6nqbyA0igzss22aI=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOyZk-003aOx-RA
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Apr 2020 07:04:43 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 6537431995AEF8AD665D;
 Thu, 16 Apr 2020 15:04:32 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 16 Apr
 2020 15:04:27 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Sahitya Tummala <stummala@codeaurora.org>
References: <1585219019-24831-1-git-send-email-stummala@codeaurora.org>
 <20200331035419.GB79749@google.com> <20200331090608.GZ20234@codeaurora.org>
 <20200331184307.GA198665@google.com> <20200401050801.GA20234@codeaurora.org>
 <20200403171727.GB68460@google.com> <20200403172750.GD68460@google.com>
 <20200413174237.GC39092@google.com> <20200414134403.GA69282@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <bc5ffa2f-df9e-06a5-d784-31fda3596935@huawei.com>
Date: Thu, 16 Apr 2020 15:04:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200414134403.GA69282@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jOyZk-003aOx-RA
Subject: Re: [f2fs-dev] [PATCH] f2fs: prevent meta updates while checkpoint
 is in progress
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/4/14 21:44, Jaegeuk Kim wrote:
> On 04/13, Jaegeuk Kim wrote:
>> On 04/03, Jaegeuk Kim wrote:
>>> On 04/03, Jaegeuk Kim wrote:
>>>> On 04/01, Sahitya Tummala wrote:
>>>>> Hi Jaegeuk,
>>>>>
>>>>> Got it.
>>>>> The diff below looks good to me.
>>>>> Would you like me to test it and put a patch for this?
>>>>
>>>> Sahitya, Chao,
>>>>
>>>> Could you please take a look at this patch and test intensively?
>>>>
>>>> Thanks,
> 
> v4:
>  - fix deadlock
> 
>>From fcbf75b308a8b933706c7e4dd18f275129baa928 Mon Sep 17 00:00:00 2001
> From: Jaegeuk Kim <jaegeuk@kernel.org>
> Date: Tue, 31 Mar 2020 11:43:07 -0700
> Subject: [PATCH] f2fs: refactor resize_fs to avoid meta updates in progress
> 
> Sahitya raised an issue:
> - prevent meta updates while checkpoint is in progress
> 
> allocate_segment_for_resize() can cause metapage updates if
> it requires to change the current node/data segments for resizing.
> Stop these meta updates when there is a checkpoint already
> in progress to prevent inconsistent CP data.
> 
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/checkpoint.c        |   6 +-
>  fs/f2fs/f2fs.h              |   2 +-
>  fs/f2fs/file.c              |   5 +-
>  fs/f2fs/gc.c                | 112 ++++++++++++++++++++----------------
>  fs/f2fs/super.c             |   1 -
>  include/trace/events/f2fs.h |   4 +-
>  6 files changed, 72 insertions(+), 58 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 6be357c8e0020..dcb3a15574c99 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1554,7 +1554,8 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  			return 0;
>  		f2fs_warn(sbi, "Start checkpoint disabled!");
>  	}
> -	mutex_lock(&sbi->cp_mutex);
> +	if (cpc->reason != CP_RESIZE)
> +		mutex_lock(&sbi->cp_mutex);
>  
>  	if (!is_sbi_flag_set(sbi, SBI_IS_DIRTY) &&
>  		((cpc->reason & CP_FASTBOOT) || (cpc->reason & CP_SYNC) ||
> @@ -1623,7 +1624,8 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  	f2fs_update_time(sbi, CP_TIME);
>  	trace_f2fs_write_checkpoint(sbi->sb, cpc->reason, "finish checkpoint");
>  out:
> -	mutex_unlock(&sbi->cp_mutex);
> +	if (cpc->reason != CP_RESIZE)
> +		mutex_unlock(&sbi->cp_mutex);
>  	return err;
>  }
>  
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 801c04858bc94..da5e9dd747fab 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -194,6 +194,7 @@ enum {
>  #define	CP_DISCARD	0x00000010
>  #define CP_TRIMMED	0x00000020
>  #define CP_PAUSE	0x00000040
> +#define CP_RESIZE 	0x00000080
>  
>  #define MAX_DISCARD_BLOCKS(sbi)		BLKS_PER_SEC(sbi)
>  #define DEF_MAX_DISCARD_REQUEST		8	/* issue 8 discards per round */
> @@ -1423,7 +1424,6 @@ struct f2fs_sb_info {
>  	unsigned int segs_per_sec;		/* segments per section */
>  	unsigned int secs_per_zone;		/* sections per zone */
>  	unsigned int total_sections;		/* total section count */
> -	struct mutex resize_mutex;		/* for resize exclusion */
>  	unsigned int total_node_count;		/* total node block count */
>  	unsigned int total_valid_node_count;	/* valid node block count */
>  	loff_t max_file_blocks;			/* max block index of file */
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index dc470358f25eb..212c5996d3807 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3306,7 +3306,6 @@ static int f2fs_ioc_resize_fs(struct file *filp, unsigned long arg)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(filp));
>  	__u64 block_count;
> -	int ret;
>  
>  	if (!capable(CAP_SYS_ADMIN))
>  		return -EPERM;
> @@ -3318,9 +3317,7 @@ static int f2fs_ioc_resize_fs(struct file *filp, unsigned long arg)
>  			   sizeof(block_count)))
>  		return -EFAULT;
>  
> -	ret = f2fs_resize_fs(sbi, block_count);
> -
> -	return ret;
> +	return f2fs_resize_fs(sbi, block_count);
>  }
>  
>  static int f2fs_ioc_enable_verity(struct file *filp, unsigned long arg)
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 26248c8936db0..ad395b774a0b2 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1399,12 +1399,29 @@ void f2fs_build_gc_manager(struct f2fs_sb_info *sbi)
>  				GET_SEGNO(sbi, FDEV(0).end_blk) + 1;
>  }
>  
> -static int free_segment_range(struct f2fs_sb_info *sbi, unsigned int start,
> -							unsigned int end)
> +static int free_segment_range(struct f2fs_sb_info *sbi,
> +				unsigned int secs, bool gc_only)
>  {
> -	int type;
> -	unsigned int segno, next_inuse;
> +	unsigned int segno, next_inuse, start, end;
> +	struct cp_control cpc = { CP_RESIZE, 0, 0, 0 };
> +	int gc_mode, gc_type;
>  	int err = 0;
> +	int type;
> +
> +	/* Force block allocation for GC */
> +	MAIN_SECS(sbi) -= secs;
> +	start = MAIN_SECS(sbi) * sbi->segs_per_sec;
> +	end = MAIN_SEGS(sbi) - 1;
> +
> +	mutex_lock(&DIRTY_I(sbi)->seglist_lock);
> +	for (gc_mode = 0; gc_mode < MAX_GC_POLICY; gc_mode++)
> +		if (SIT_I(sbi)->last_victim[gc_mode] >= start)
> +			SIT_I(sbi)->last_victim[gc_mode] = 0;
> +
> +	for (gc_type = BG_GC; gc_type <= FG_GC; gc_type++)
> +		if (sbi->next_victim_seg[gc_type] >= start)
> +			sbi->next_victim_seg[gc_type] = NULL_SEGNO;
> +	mutex_unlock(&DIRTY_I(sbi)->seglist_lock);
>  
>  	/* Move out cursegs from the target range */
>  	for (type = CURSEG_HOT_DATA; type < NR_CURSEG_TYPE; type++)
> @@ -1417,18 +1434,20 @@ static int free_segment_range(struct f2fs_sb_info *sbi, unsigned int start,
>  			.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
>  		};
>  
> -		down_write(&sbi->gc_lock);
>  		do_garbage_collect(sbi, segno, &gc_list, FG_GC);
> -		up_write(&sbi->gc_lock);
>  		put_gc_inode(&gc_list);

Granularity is still large, how about handling userspace signal here
to provide a termination way in case of user don't want / can't wait
for more time.

	if (fatal_signal_pending(current))
		return -ERESTARTSYS;

Thanks,

>  
> -		if (get_valid_blocks(sbi, segno, true))
> -			return -EAGAIN;
> +		if (!gc_only && get_valid_blocks(sbi, segno, true)) {
> +			err = -EAGAIN;
> +			goto out;
> +		}
>  	}
> +	if (gc_only)
> +		goto out;
>  
> -	err = f2fs_sync_fs(sbi->sb, 1);
> +	err = f2fs_write_checkpoint(sbi, &cpc);
>  	if (err)
> -		return err;
> +		goto out;
>  
>  	next_inuse = find_next_inuse(FREE_I(sbi), end + 1, start);
>  	if (next_inuse <= end) {
> @@ -1436,6 +1455,8 @@ static int free_segment_range(struct f2fs_sb_info *sbi, unsigned int start,
>  			 next_inuse);
>  		f2fs_bug_on(sbi, 1);
>  	}
> +out:
> +	MAIN_SECS(sbi) -= secs;
>  	return err;
>  }
>  
> @@ -1481,6 +1502,7 @@ static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
>  
>  	SM_I(sbi)->segment_count = (int)SM_I(sbi)->segment_count + segs;
>  	MAIN_SEGS(sbi) = (int)MAIN_SEGS(sbi) + segs;
> +	MAIN_SECS(sbi) += secs;
>  	FREE_I(sbi)->free_sections = (int)FREE_I(sbi)->free_sections + secs;
>  	FREE_I(sbi)->free_segments = (int)FREE_I(sbi)->free_segments + segs;
>  	F2FS_CKPT(sbi)->user_block_count = cpu_to_le64(user_block_count + blks);
> @@ -1502,8 +1524,8 @@ static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
>  int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
>  {
>  	__u64 old_block_count, shrunk_blocks;
> +	struct cp_control cpc = { CP_RESIZE, 0, 0, 0 };
>  	unsigned int secs;
> -	int gc_mode, gc_type;
>  	int err = 0;
>  	__u32 rem;
>  
> @@ -1538,10 +1560,27 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
>  		return -EINVAL;
>  	}
>  
> -	freeze_bdev(sbi->sb->s_bdev);
> -
>  	shrunk_blocks = old_block_count - block_count;
>  	secs = div_u64(shrunk_blocks, BLKS_PER_SEC(sbi));
> +
> +	/* stop other GC */
> +	if (!down_write_trylock(&sbi->gc_lock))
> +		return -EAGAIN;
> +
> +	/* stop CP to protect MAIN_SEC in free_segment_range */
> +	f2fs_lock_op(sbi);
> +	err = free_segment_range(sbi, secs, true);
> +	f2fs_unlock_op(sbi);
> +	up_write(&sbi->gc_lock);
> +	if (err)
> +		return err;
> +
> +	set_sbi_flag(sbi, SBI_IS_RESIZEFS);
> +
> +	freeze_super(sbi->sb);
> +	down_write(&sbi->gc_lock);
> +	mutex_lock(&sbi->cp_mutex);
> +
>  	spin_lock(&sbi->stat_lock);
>  	if (shrunk_blocks + valid_user_blocks(sbi) +
>  		sbi->current_reserved_blocks + sbi->unusable_block_count +
> @@ -1550,69 +1589,44 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
>  	else
>  		sbi->user_block_count -= shrunk_blocks;
>  	spin_unlock(&sbi->stat_lock);
> -	if (err) {
> -		thaw_bdev(sbi->sb->s_bdev, sbi->sb);
> -		return err;
> -	}
> -
> -	mutex_lock(&sbi->resize_mutex);
> -	set_sbi_flag(sbi, SBI_IS_RESIZEFS);
> -
> -	mutex_lock(&DIRTY_I(sbi)->seglist_lock);
> -
> -	MAIN_SECS(sbi) -= secs;
> -
> -	for (gc_mode = 0; gc_mode < MAX_GC_POLICY; gc_mode++)
> -		if (SIT_I(sbi)->last_victim[gc_mode] >=
> -					MAIN_SECS(sbi) * sbi->segs_per_sec)
> -			SIT_I(sbi)->last_victim[gc_mode] = 0;
> -
> -	for (gc_type = BG_GC; gc_type <= FG_GC; gc_type++)
> -		if (sbi->next_victim_seg[gc_type] >=
> -					MAIN_SECS(sbi) * sbi->segs_per_sec)
> -			sbi->next_victim_seg[gc_type] = NULL_SEGNO;
> -
> -	mutex_unlock(&DIRTY_I(sbi)->seglist_lock);
> +	if (err)
> +		goto out_err;
>  
> -	err = free_segment_range(sbi, MAIN_SECS(sbi) * sbi->segs_per_sec,
> -			MAIN_SEGS(sbi) - 1);
> +	err = free_segment_range(sbi, secs, false);
>  	if (err)
> -		goto out;
> +		goto recover_out;
>  
>  	update_sb_metadata(sbi, -secs);
>  
>  	err = f2fs_commit_super(sbi, false);
>  	if (err) {
>  		update_sb_metadata(sbi, secs);
> -		goto out;
> +		goto recover_out;
>  	}
>  
> -	mutex_lock(&sbi->cp_mutex);
>  	update_fs_metadata(sbi, -secs);
>  	clear_sbi_flag(sbi, SBI_IS_RESIZEFS);
>  	set_sbi_flag(sbi, SBI_IS_DIRTY);
> -	mutex_unlock(&sbi->cp_mutex);
>  
> -	err = f2fs_sync_fs(sbi->sb, 1);
> +	err = f2fs_write_checkpoint(sbi, &cpc);
>  	if (err) {
> -		mutex_lock(&sbi->cp_mutex);
>  		update_fs_metadata(sbi, secs);
> -		mutex_unlock(&sbi->cp_mutex);
>  		update_sb_metadata(sbi, secs);
>  		f2fs_commit_super(sbi, false);
>  	}
> -out:
> +recover_out:
>  	if (err) {
>  		set_sbi_flag(sbi, SBI_NEED_FSCK);
>  		f2fs_err(sbi, "resize_fs failed, should run fsck to repair!");
>  
> -		MAIN_SECS(sbi) += secs;
>  		spin_lock(&sbi->stat_lock);
>  		sbi->user_block_count += shrunk_blocks;
>  		spin_unlock(&sbi->stat_lock);
>  	}
> +out_err:
> +	mutex_unlock(&sbi->cp_mutex);
> +	up_write(&sbi->gc_lock);
> +	thaw_super(sbi->sb);
>  	clear_sbi_flag(sbi, SBI_IS_RESIZEFS);
> -	mutex_unlock(&sbi->resize_mutex);
> -	thaw_bdev(sbi->sb->s_bdev, sbi->sb);
>  	return err;
>  }
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 43a61ed592c10..33da1ad238d72 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3420,7 +3420,6 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	init_rwsem(&sbi->gc_lock);
>  	mutex_init(&sbi->writepages);
>  	mutex_init(&sbi->cp_mutex);
> -	mutex_init(&sbi->resize_mutex);
>  	init_rwsem(&sbi->node_write);
>  	init_rwsem(&sbi->node_change);
>  
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index 3577fa67690af..421a661bfd5aa 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -50,6 +50,7 @@ TRACE_DEFINE_ENUM(CP_RECOVERY);
>  TRACE_DEFINE_ENUM(CP_DISCARD);
>  TRACE_DEFINE_ENUM(CP_TRIMMED);
>  TRACE_DEFINE_ENUM(CP_PAUSE);
> +TRACE_DEFINE_ENUM(CP_RESIZE);
>  
>  #define show_block_type(type)						\
>  	__print_symbolic(type,						\
> @@ -126,7 +127,8 @@ TRACE_DEFINE_ENUM(CP_PAUSE);
>  		{ CP_RECOVERY,	"Recovery" },				\
>  		{ CP_DISCARD,	"Discard" },				\
>  		{ CP_PAUSE,	"Pause" },				\
> -		{ CP_TRIMMED,	"Trimmed" })
> +		{ CP_TRIMMED,	"Trimmed" },				\
> +		{ CP_RESIZE,	"Resize" })
>  
>  #define show_fsync_cpreason(type)					\
>  	__print_symbolic(type,						\
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
