Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6861D19A3B1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Apr 2020 04:54:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jJTWF-000285-81; Wed, 01 Apr 2020 02:54:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jJTWE-00027s-1N
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Apr 2020 02:54:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OdxNV+VKdWxPFVjaBZlvGJRLTPNVS6x9O3kcwvtrbPw=; b=L8h4+OS5JZg5WmlDAC7m4t1Cu7
 3q9Rx3Tl7Ksx3qq1DMY20qUYsohHiSgjiqj8aSqA3Ui9PWzo6DgAOuchv6eNz2m2MPHirsKjXo/ku
 d6HQkH8TUhDyy2C7gsuXmzvx8Bco2U9GE+sgjsgbrdRhW5hdNK1UTh/myg4uyC5crndU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OdxNV+VKdWxPFVjaBZlvGJRLTPNVS6x9O3kcwvtrbPw=; b=BNWkZCmSmt72Wc6Hn7pXxe3xgZ
 DgplskXMnQacG5UbJZ0K2T7ilLXlKcKN8ox7TzAc2NVL4XMwQKO9OU29MRNaQlJYH3MxJQUB0G6Wm
 zIirkCPtd3zjoG/gfpMckpK+PTS2p7i62B3Kwn46N/iNzYtySNWJFhzd6lARalbqYGUA=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jJTWB-003YTl-Hz
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Apr 2020 02:54:17 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B3D37C7476AA77FA5ADD;
 Wed,  1 Apr 2020 10:54:06 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 1 Apr 2020
 10:54:01 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Sahitya Tummala <stummala@codeaurora.org>
References: <1585219019-24831-1-git-send-email-stummala@codeaurora.org>
 <20200331035419.GB79749@google.com> <20200331090608.GZ20234@codeaurora.org>
 <20200331184307.GA198665@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <a56deb76-bf7f-dd86-301f-fbe56413ab9b@huawei.com>
Date: Wed, 1 Apr 2020 10:54:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200331184307.GA198665@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jJTWB-003YTl-Hz
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

On 2020/4/1 2:43, Jaegeuk Kim wrote:
> On 03/31, Sahitya Tummala wrote:
>> On Mon, Mar 30, 2020 at 08:54:19PM -0700, Jaegeuk Kim wrote:
>>> On 03/26, Sahitya Tummala wrote:
>>>> allocate_segment_for_resize() can cause metapage updates if
>>>> it requires to change the current node/data segments for resizing.
>>>> Stop these meta updates when there is a checkpoint already
>>>> in progress to prevent inconsistent CP data.
>>>
>>> I'd prefer to use f2fs_lock_op() in bigger coverage.
>>
>> Do you mean to cover the entire free_segment_range() function within
>> f2fs_lock_op()? Please clarify.
> 
> I didn't test tho, something like this?
> 
> ---
>  fs/f2fs/checkpoint.c        |  6 ++++--
>  fs/f2fs/f2fs.h              |  2 +-
>  fs/f2fs/gc.c                | 28 ++++++++++++++--------------
>  fs/f2fs/super.c             |  1 -
>  include/trace/events/f2fs.h |  4 +++-
>  5 files changed, 22 insertions(+), 19 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 852890b72d6ac..531995192b714 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1553,7 +1553,8 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  			return 0;
>  		f2fs_warn(sbi, "Start checkpoint disabled!");
>  	}
> -	mutex_lock(&sbi->cp_mutex);
> +	if (cpc->reason != CP_RESIZE)
> +		mutex_lock(&sbi->cp_mutex);
>  
>  	if (!is_sbi_flag_set(sbi, SBI_IS_DIRTY) &&
>  		((cpc->reason & CP_FASTBOOT) || (cpc->reason & CP_SYNC) ||
> @@ -1622,7 +1623,8 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
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
> index c84442eefc56d..7c98dca3ec1d6 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -193,6 +193,7 @@ enum {
>  #define	CP_DISCARD	0x00000010
>  #define CP_TRIMMED	0x00000020
>  #define CP_PAUSE	0x00000040
> +#define CP_RESIZE 	0x00000080
>  
>  #define MAX_DISCARD_BLOCKS(sbi)		BLKS_PER_SEC(sbi)
>  #define DEF_MAX_DISCARD_REQUEST		8	/* issue 8 discards per round */
> @@ -1417,7 +1418,6 @@ struct f2fs_sb_info {
>  	unsigned int segs_per_sec;		/* segments per section */
>  	unsigned int secs_per_zone;		/* sections per zone */
>  	unsigned int total_sections;		/* total section count */
> -	struct mutex resize_mutex;		/* for resize exclusion */
>  	unsigned int total_node_count;		/* total node block count */
>  	unsigned int total_valid_node_count;	/* valid node block count */
>  	loff_t max_file_blocks;			/* max block index of file */
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 26248c8936db0..1e5a06fda09d3 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1402,8 +1402,9 @@ void f2fs_build_gc_manager(struct f2fs_sb_info *sbi)
>  static int free_segment_range(struct f2fs_sb_info *sbi, unsigned int start,
>  							unsigned int end)
>  {
> -	int type;
>  	unsigned int segno, next_inuse;
> +	struct cp_control cpc = { CP_RESIZE, 0, 0, 0 };
> +	int type;
>  	int err = 0;
>  
>  	/* Move out cursegs from the target range */
> @@ -1417,16 +1418,14 @@ static int free_segment_range(struct f2fs_sb_info *sbi, unsigned int start,
>  			.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
>  		};
>  
> -		down_write(&sbi->gc_lock);
>  		do_garbage_collect(sbi, segno, &gc_list, FG_GC);
> -		up_write(&sbi->gc_lock);
>  		put_gc_inode(&gc_list);
>  
>  		if (get_valid_blocks(sbi, segno, true))
>  			return -EAGAIN;
>  	}
>  
> -	err = f2fs_sync_fs(sbi->sb, 1);
> +	err = f2fs_write_checkpoint(sbi, &cpc);
>  	if (err)
>  		return err;
>  
> @@ -1502,6 +1501,7 @@ static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
>  int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
>  {
>  	__u64 old_block_count, shrunk_blocks;
> +	struct cp_control cpc = { CP_RESIZE, 0, 0, 0 };
>  	unsigned int secs;
>  	int gc_mode, gc_type;
>  	int err = 0;
> @@ -1538,7 +1538,9 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
>  		return -EINVAL;
>  	}
>  
> -	freeze_bdev(sbi->sb->s_bdev);
> +	freeze_super(sbi->sb);

Look at this again, I guess holding freeze lock here may cause potential
hang task issue, imaging that in a low-end storage, shrinking large size
address space, free_segment_range() needs very long time to migrate all
valid blocks in the tail of device, that's why previously we do block
migration with small gc_lock coverage.

Quoted:

Changelog v5 ==> v6:
 - In free_segment_range(), reduce granularity of gc_mutex.

Thanks,

> +	down_write(&sbi->gc_lock);
> +	mutex_lock(&sbi->cp_mutex);
>  
>  	shrunk_blocks = old_block_count - block_count;
>  	secs = div_u64(shrunk_blocks, BLKS_PER_SEC(sbi));
> @@ -1551,11 +1553,12 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
>  		sbi->user_block_count -= shrunk_blocks;
>  	spin_unlock(&sbi->stat_lock);
>  	if (err) {
> -		thaw_bdev(sbi->sb->s_bdev, sbi->sb);
> +		mutex_unlock(&sbi->cp_mutex);
> +		up_write(&sbi->gc_lock);
> +		thaw_super(sbi->sb);
>  		return err;
>  	}
>  
> -	mutex_lock(&sbi->resize_mutex);
>  	set_sbi_flag(sbi, SBI_IS_RESIZEFS);
>  
>  	mutex_lock(&DIRTY_I(sbi)->seglist_lock);
> @@ -1587,17 +1590,13 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
>  		goto out;
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
> @@ -1612,7 +1611,8 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
>  		spin_unlock(&sbi->stat_lock);
>  	}
>  	clear_sbi_flag(sbi, SBI_IS_RESIZEFS);
> -	mutex_unlock(&sbi->resize_mutex);
> -	thaw_bdev(sbi->sb->s_bdev, sbi->sb);
> +	mutex_unlock(&sbi->cp_mutex);
> +	up_write(&sbi->gc_lock);
> +	thaw_super(sbi->sb);
>  	return err;
>  }
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index b83b17b54a0a6..1e7b1d21d0177 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3412,7 +3412,6 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	init_rwsem(&sbi->gc_lock);
>  	mutex_init(&sbi->writepages);
>  	mutex_init(&sbi->cp_mutex);
> -	mutex_init(&sbi->resize_mutex);
>  	init_rwsem(&sbi->node_write);
>  	init_rwsem(&sbi->node_change);
>  
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index d97adfc327f03..f5eb03c54e96f 100644
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
