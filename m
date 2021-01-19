Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 573372FBFBB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Jan 2021 20:09:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l1wNV-0005yq-Sz; Tue, 19 Jan 2021 19:09:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1l1wNR-0005yf-E9
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Jan 2021 19:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KCwIiiz7DI3eATP1vkVp2F+uOfqNGZV2KzIp+ryMUoA=; b=Av+srmQsKUFVepEgUYWu9gRJ7Q
 nSNG0Nb5ZRHMPOoQFBcYeA2Pxsq7Y4wmgBOg8YtCEUwgvbrafRx9Bftx2cNS0D+SPKF0jlpV5DuM/
 ZpsKe7plvtfmxtVGAonzwGG2UyCdoi8WnGYN6hUEXqvKox44NwK9+8mE/71z+vuY7r/c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KCwIiiz7DI3eATP1vkVp2F+uOfqNGZV2KzIp+ryMUoA=; b=CJATH1o/jic9AAIBGoiB2AL9UQ
 GfKFXTUEvQXYeE0yplh3YAH4/o2WE0/Tm7+E+V2qUlH7+E08Ao/xlOBN6rbV5aVVVzEpfUR55wKVq
 O51f4vREoxbWKdmLBGqahLHWPZvEV7zXwC0HZDvSu9qxYI6TVgt3Y0QurCIFrwLQO39U=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l1wNI-008JNe-54
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Jan 2021 19:09:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3BD6A20706;
 Tue, 19 Jan 2021 19:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611083337;
 bh=qdLXsDrzNDOXxY5oWv0vGtMYPY/gzk+ieEqvL52lnOk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C2RR4wBvvA49xAm97NAb5Lc0LpajPWnP0AmQfhC858wYyySUqqn8iDG7VY5/0AN4/
 hQGx6Wk/ZHj7bqEzENfL2R/yYR2iV/E0CmcDaRtdbIMjA+7741spCrk8jBMMk9sOWP
 bl6x0raeoxb+26GRABFGxLKhVWbIqTvuy2sLYr0V9Y/EhjrrKxJm+XIm9Mrg/XDJdY
 JnJo5qmkDy0zXgHU4WAR5T3jDnsbR5tfNk/aEwdD7pHg/a4HeSJKMdaL33qrudjcIc
 DSHph+VACHcM7K4xJ/KmqR3naitaOcjzIZbu97289txfyhSyrpCCVzrWKodshw/UNu
 wQQ+IJuPeaDbg==
Date: Tue, 19 Jan 2021 11:08:55 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <YAcuR5UMsj9MTtvg@google.com>
References: <20210119000043.1206345-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210119000043.1206345-1-daeho43@gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l1wNI-008JNe-54
Subject: Re: [f2fs-dev] [PATCH v4 1/2] f2fs: introduce checkpoint=merge
 mount option
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
Cc: Daeho Jeong <daehojeong@google.com>, Sungjong Seo <sj1557.seo@samsung.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Is there v4 2/2?

On 01/19, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> We've added a new mount option "checkpoint=merge", which creates a
> kernel daemon and makes it to merge concurrent checkpoint requests as
> much as possible to eliminate redundant checkpoint issues. Plus, we
> can eliminate the sluggish issue caused by slow checkpoint operation
> when the checkpoint is done in a process context in a cgroup having
> low i/o budget and cpu shares. To make this do better, we set the
> default i/o priority of the kernel daemon to "3", to give one higher
> priority than other kernel threads. The below verification result
> explains this.
> The basic idea has come from https://opensource.samsung.com.
> 
> [Verification]
> Android Pixel Device(ARM64, 7GB RAM, 256GB UFS)
> Create two I/O cgroups (fg w/ weight 100, bg w/ wight 20)
> Set "strict_guarantees" to "1" in BFQ tunables
> 
> In "fg" cgroup,
> - thread A => trigger 1000 checkpoint operations
>   "for i in `seq 1 1000`; do touch test_dir1/file; fsync test_dir1;
>    done"
> - thread B => gererating async. I/O
>   "fio --rw=write --numjobs=1 --bs=128k --runtime=3600 --time_based=1
>        --filename=test_img --name=test"
> 
> In "bg" cgroup,
> - thread C => trigger repeated checkpoint operations
>   "echo $$ > /dev/blkio/bg/tasks; while true; do touch test_dir2/file;
>    fsync test_dir2; done"
> 
> We've measured thread A's execution time.
> 
> [ w/o patch ]
> Elapsed Time: Avg. 68 seconds
> [ w/  patch ]
> Elapsed Time: Avg. 48 seconds
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Sungjong Seo <sj1557.seo@samsung.com>
> ---
> v2:
> - inlined ckpt_req_control into f2fs_sb_info and collected stastics
>   of checkpoint merge operations
> v3:
> - fixed some minor errors and cleaned up f2fs_sync_fs()
> v4:
> - added an explanation to raise the default i/o priority of the
>   checkpoint daemon
> ---
>  Documentation/filesystems/f2fs.rst |  10 ++
>  fs/f2fs/checkpoint.c               | 177 +++++++++++++++++++++++++++++
>  fs/f2fs/debug.c                    |  12 ++
>  fs/f2fs/f2fs.h                     |  27 +++++
>  fs/f2fs/super.c                    |  55 +++++++--
>  5 files changed, 273 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index dae15c96e659..9624a0be0364 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -247,6 +247,16 @@ checkpoint=%s[:%u[%]]	 Set to "disable" to turn off checkpointing. Set to "enabl
>  			 hide up to all remaining free space. The actual space that
>  			 would be unusable can be viewed at /sys/fs/f2fs/<disk>/unusable
>  			 This space is reclaimed once checkpoint=enable.
> +			 Here is another option "merge", which creates a kernel daemon
> +			 and makes it to merge concurrent checkpoint requests as much
> +			 as possible to eliminate redundant checkpoint issues. Plus,
> +			 we can eliminate the sluggish issue caused by slow checkpoint
> +			 operation when the checkpoint is done in a process context in
> +			 a cgroup having low i/o budget and cpu shares. To make this
> +			 do better, we set the default i/o priority of the kernel daemon
> +			 to "3", to give one higher priority than other kernel threads.
> +			 This is the same way to give a I/O priority to the jbd2
> +			 journaling thread of ext4 filesystem.
>  compress_algorithm=%s	 Control compress algorithm, currently f2fs supports "lzo",
>  			 "lz4", "zstd" and "lzo-rle" algorithm.
>  compress_log_size=%u	 Support configuring compress cluster size, the size will
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 897edb7c951a..ef6ad3d1957d 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -13,6 +13,7 @@
>  #include <linux/f2fs_fs.h>
>  #include <linux/pagevec.h>
>  #include <linux/swap.h>
> +#include <linux/kthread.h>
>  
>  #include "f2fs.h"
>  #include "node.h"
> @@ -20,6 +21,8 @@
>  #include "trace.h"
>  #include <trace/events/f2fs.h>
>  
> +#define DEFAULT_CHECKPOINT_IOPRIO (IOPRIO_PRIO_VALUE(IOPRIO_CLASS_BE, 3))
> +
>  static struct kmem_cache *ino_entry_slab;
>  struct kmem_cache *f2fs_inode_entry_slab;
>  
> @@ -1707,3 +1710,177 @@ void f2fs_destroy_checkpoint_caches(void)
>  	kmem_cache_destroy(ino_entry_slab);
>  	kmem_cache_destroy(f2fs_inode_entry_slab);
>  }
> +
> +static int __write_checkpoint_sync(struct f2fs_sb_info *sbi)
> +{
> +	struct cp_control cpc = { .reason = CP_SYNC, };
> +	int err;
> +
> +	down_write(&sbi->gc_lock);
> +	err = f2fs_write_checkpoint(sbi, &cpc);
> +	up_write(&sbi->gc_lock);
> +
> +	return err;
> +}
> +
> +static void __checkpoint_and_complete_reqs(struct f2fs_sb_info *sbi)
> +{
> +	struct ckpt_req_control *cprc = &sbi->cprc_info;
> +	struct ckpt_req *req, *next;
> +	struct llist_node *dispatch_list;
> +	u64 sum_diff = 0, diff, count = 0;
> +	int ret;
> +
> +	dispatch_list = llist_del_all(&cprc->issue_list);
> +	if (!dispatch_list)
> +		return;
> +	dispatch_list = llist_reverse_order(dispatch_list);
> +
> +	ret = __write_checkpoint_sync(sbi);
> +	atomic_inc(&cprc->issued_ckpt);
> +
> +	llist_for_each_entry_safe(req, next, dispatch_list, llnode) {
> +		diff = (u64)ktime_ms_delta(ktime_get(), req->queue_time);
> +		req->ret = ret;
> +		complete(&req->wait);
> +
> +		sum_diff += diff;
> +		count++;
> +	}
> +	atomic_sub(count, &cprc->queued_ckpt);
> +	atomic_add(count, &cprc->total_ckpt);
> +
> +	spin_lock(&cprc->stat_lock);
> +	cprc->cur_time = (unsigned int)div64_u64(sum_diff, count);
> +	if (cprc->peak_time < cprc->cur_time)
> +		cprc->peak_time = cprc->cur_time;
> +	spin_unlock(&cprc->stat_lock);
> +}
> +
> +static int issue_checkpoint_thread(void *data)
> +{
> +	struct f2fs_sb_info *sbi = data;
> +	struct ckpt_req_control *cprc = &sbi->cprc_info;
> +	wait_queue_head_t *q = &cprc->ckpt_wait_queue;
> +repeat:
> +	if (kthread_should_stop())
> +		return 0;
> +
> +	sb_start_intwrite(sbi->sb);
> +
> +	if (!llist_empty(&cprc->issue_list))
> +		__checkpoint_and_complete_reqs(sbi);
> +
> +	sb_end_intwrite(sbi->sb);
> +
> +	wait_event_interruptible(*q,
> +		kthread_should_stop() || !llist_empty(&cprc->issue_list));
> +	goto repeat;
> +}
> +
> +static void flush_remained_ckpt_reqs(struct f2fs_sb_info *sbi,
> +		struct ckpt_req *wait_req)
> +{
> +	struct ckpt_req_control *cprc = &sbi->cprc_info;
> +
> +	if (!llist_empty(&cprc->issue_list)) {
> +		__checkpoint_and_complete_reqs(sbi);
> +	} else {
> +		/* already dispatched by issue_checkpoint_thread */
> +		if (wait_req)
> +			wait_for_completion(&wait_req->wait);
> +	}
> +}
> +
> +static void init_ckpt_req(struct ckpt_req *req)
> +{
> +	memset(req, 0, sizeof(struct ckpt_req));
> +
> +	init_completion(&req->wait);
> +	req->queue_time = ktime_get();
> +}
> +
> +int f2fs_issue_checkpoint(struct f2fs_sb_info *sbi)
> +{
> +	struct ckpt_req_control *cprc = &sbi->cprc_info;
> +	struct ckpt_req req;
> +	struct cp_control cpc;
> +
> +	cpc.reason = __get_cp_reason(sbi);
> +	if (!test_opt(sbi, MERGE_CHECKPOINT) || cpc.reason != CP_SYNC) {
> +		int ret;
> +
> +		down_write(&sbi->gc_lock);
> +		ret = f2fs_write_checkpoint(sbi, &cpc);
> +		up_write(&sbi->gc_lock);
> +
> +		return ret;
> +	}
> +
> +	if (!cprc->f2fs_issue_ckpt)
> +		return __write_checkpoint_sync(sbi);
> +
> +	init_ckpt_req(&req);
> +
> +	llist_add(&req.llnode, &cprc->issue_list);
> +	atomic_inc(&cprc->queued_ckpt);
> +
> +	/* update issue_list before we wake up issue_checkpoint thread */
> +	smp_mb();
> +
> +	if (waitqueue_active(&cprc->ckpt_wait_queue))
> +		wake_up(&cprc->ckpt_wait_queue);
> +
> +	if (cprc->f2fs_issue_ckpt)
> +		wait_for_completion(&req.wait);
> +	else
> +		flush_remained_ckpt_reqs(sbi, &req);
> +
> +	return req.ret;
> +}
> +
> +int f2fs_start_ckpt_thread(struct f2fs_sb_info *sbi)
> +{
> +	dev_t dev = sbi->sb->s_bdev->bd_dev;
> +	struct ckpt_req_control *cprc = &sbi->cprc_info;
> +
> +	if (cprc->f2fs_issue_ckpt)
> +		return 0;
> +
> +	cprc->f2fs_issue_ckpt = kthread_run(issue_checkpoint_thread, sbi,
> +			"f2fs_ckpt-%u:%u", MAJOR(dev), MINOR(dev));
> +	if (IS_ERR(cprc->f2fs_issue_ckpt)) {
> +		cprc->f2fs_issue_ckpt = NULL;
> +		return PTR_ERR(cprc->f2fs_issue_ckpt);
> +	}
> +
> +	set_task_ioprio(cprc->f2fs_issue_ckpt, DEFAULT_CHECKPOINT_IOPRIO);
> +
> +	return 0;
> +}
> +
> +void f2fs_stop_ckpt_thread(struct f2fs_sb_info *sbi)
> +{
> +	struct ckpt_req_control *cprc = &sbi->cprc_info;
> +
> +	if (cprc->f2fs_issue_ckpt) {
> +		struct task_struct *ckpt_task = cprc->f2fs_issue_ckpt;
> +
> +		cprc->f2fs_issue_ckpt = NULL;
> +		kthread_stop(ckpt_task);
> +
> +		flush_remained_ckpt_reqs(sbi, NULL);
> +	}
> +}
> +
> +void f2fs_init_ckpt_req_control(struct f2fs_sb_info *sbi)
> +{
> +	struct ckpt_req_control *cprc = &sbi->cprc_info;
> +
> +	atomic_set(&cprc->issued_ckpt, 0);
> +	atomic_set(&cprc->total_ckpt, 0);
> +	atomic_set(&cprc->queued_ckpt, 0);
> +	init_waitqueue_head(&cprc->ckpt_wait_queue);
> +	init_llist_head(&cprc->issue_list);
> +	spin_lock_init(&cprc->stat_lock);
> +}
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index 197c914119da..91855d5721cd 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -120,6 +120,13 @@ static void update_general_status(struct f2fs_sb_info *sbi)
>  			atomic_read(&SM_I(sbi)->dcc_info->discard_cmd_cnt);
>  		si->undiscard_blks = SM_I(sbi)->dcc_info->undiscard_blks;
>  	}
> +	si->nr_issued_ckpt = atomic_read(&sbi->cprc_info.issued_ckpt);
> +	si->nr_total_ckpt = atomic_read(&sbi->cprc_info.total_ckpt);
> +	si->nr_queued_ckpt = atomic_read(&sbi->cprc_info.queued_ckpt);
> +	spin_lock(&sbi->cprc_info.stat_lock);
> +	si->cur_ckpt_time = sbi->cprc_info.cur_time;
> +	si->peak_ckpt_time = sbi->cprc_info.peak_time;
> +	spin_unlock(&sbi->cprc_info.stat_lock);
>  	si->total_count = (int)sbi->user_block_count / sbi->blocks_per_seg;
>  	si->rsvd_segs = reserved_segments(sbi);
>  	si->overp_segs = overprovision_segments(sbi);
> @@ -417,6 +424,11 @@ static int stat_show(struct seq_file *s, void *v)
>  				si->meta_count[META_NAT]);
>  		seq_printf(s, "  - ssa blocks : %u\n",
>  				si->meta_count[META_SSA]);
> +		seq_printf(s, "CP merge (Queued: %4d, Issued: %4d, Total: %4d, "
> +				"Cur time: %4d(ms), Peak time: %4d(ms))\n",
> +				si->nr_queued_ckpt, si->nr_issued_ckpt,
> +				si->nr_total_ckpt, si->cur_ckpt_time,
> +				si->peak_ckpt_time);
>  		seq_printf(s, "GC calls: %d (BG: %d)\n",
>  			   si->call_count, si->bg_gc);
>  		seq_printf(s, "  - data segments : %d (%d)\n",
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index bb11759191dc..f2ae075aa723 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -97,6 +97,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
>  #define F2FS_MOUNT_DISABLE_CHECKPOINT	0x02000000
>  #define F2FS_MOUNT_NORECOVERY		0x04000000
>  #define F2FS_MOUNT_ATGC			0x08000000
> +#define F2FS_MOUNT_MERGE_CHECKPOINT	0x10000000
>  
>  #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
>  #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
> @@ -266,6 +267,25 @@ struct fsync_node_entry {
>  	unsigned int seq_id;	/* sequence id */
>  };
>  
> +struct ckpt_req {
> +	struct completion wait;		/* completion for checkpoint done */
> +	struct llist_node llnode;	/* llist_node to be linked in wait queue */
> +	int ret;			/* return code of checkpoint */
> +	ktime_t queue_time;		/* request queued time */
> +};
> +
> +struct ckpt_req_control {
> +	struct task_struct *f2fs_issue_ckpt;	/* checkpoint task */
> +	wait_queue_head_t ckpt_wait_queue;	/* waiting queue for wake-up */
> +	atomic_t issued_ckpt;		/* # of actually issued ckpts */
> +	atomic_t total_ckpt;		/* # of total ckpts */
> +	atomic_t queued_ckpt;		/* # of queued ckpts */
> +	struct llist_head issue_list;	/* list for command issue */
> +	spinlock_t stat_lock;		/* lock for below checkpoint time stats */
> +	unsigned int cur_time;		/* cur wait time in msec for currently issued checkpoint */
> +	unsigned int peak_time;		/* peak wait time in msec until now */
> +};
> +
>  /* for the bitmap indicate blocks to be discarded */
>  struct discard_entry {
>  	struct list_head list;	/* list head */
> @@ -1404,6 +1424,7 @@ struct f2fs_sb_info {
>  	wait_queue_head_t cp_wait;
>  	unsigned long last_time[MAX_TIME];	/* to store time in jiffies */
>  	long interval_time[MAX_TIME];		/* to store thresholds */
> +	struct ckpt_req_control cprc_info;	/* for checkpoint request control */
>  
>  	struct inode_management im[MAX_INO_ENTRY];	/* manage inode cache */
>  
> @@ -3418,6 +3439,10 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc);
>  void f2fs_init_ino_entry_info(struct f2fs_sb_info *sbi);
>  int __init f2fs_create_checkpoint_caches(void);
>  void f2fs_destroy_checkpoint_caches(void);
> +int f2fs_issue_checkpoint(struct f2fs_sb_info *sbi);
> +int f2fs_start_ckpt_thread(struct f2fs_sb_info *sbi);
> +void f2fs_stop_ckpt_thread(struct f2fs_sb_info *sbi);
> +void f2fs_init_ckpt_req_control(struct f2fs_sb_info *sbi);
>  
>  /*
>   * data.c
> @@ -3530,6 +3555,8 @@ struct f2fs_stat_info {
>  	int nr_discarding, nr_discarded;
>  	int nr_discard_cmd;
>  	unsigned int undiscard_blks;
> +	int nr_issued_ckpt, nr_total_ckpt, nr_queued_ckpt;
> +	unsigned int cur_ckpt_time, peak_ckpt_time;
>  	int inline_xattr, inline_inode, inline_dir, append, update, orphans;
>  	int compr_inode;
>  	unsigned long long compr_blocks;
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index b4a07fe62d1a..4bf5e889f2f8 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -143,6 +143,7 @@ enum {
>  	Opt_checkpoint_disable_cap,
>  	Opt_checkpoint_disable_cap_perc,
>  	Opt_checkpoint_enable,
> +	Opt_checkpoint_merge,
>  	Opt_compress_algorithm,
>  	Opt_compress_log_size,
>  	Opt_compress_extension,
> @@ -213,6 +214,7 @@ static match_table_t f2fs_tokens = {
>  	{Opt_checkpoint_disable_cap, "checkpoint=disable:%u"},
>  	{Opt_checkpoint_disable_cap_perc, "checkpoint=disable:%u%%"},
>  	{Opt_checkpoint_enable, "checkpoint=enable"},
> +	{Opt_checkpoint_merge, "checkpoint=merge"},
>  	{Opt_compress_algorithm, "compress_algorithm=%s"},
>  	{Opt_compress_log_size, "compress_log_size=%u"},
>  	{Opt_compress_extension, "compress_extension=%s"},
> @@ -872,6 +874,9 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  		case Opt_checkpoint_enable:
>  			clear_opt(sbi, DISABLE_CHECKPOINT);
>  			break;
> +		case Opt_checkpoint_merge:
> +			set_opt(sbi, MERGE_CHECKPOINT);
> +			break;
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>  		case Opt_compress_algorithm:
>  			if (!f2fs_sb_has_compression(sbi)) {
> @@ -1040,6 +1045,12 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  		return -EINVAL;
>  	}
>  
> +	if (test_opt(sbi, DISABLE_CHECKPOINT) &&
> +			test_opt(sbi, MERGE_CHECKPOINT)) {
> +		f2fs_err(sbi, "checkpoint=merge cannot be used with checkpoint=disable\n");
> +		return -EINVAL;
> +	}
> +
>  	/* Not pass down write hints if the number of active logs is lesser
>  	 * than NR_CURSEG_PERSIST_TYPE.
>  	 */
> @@ -1245,6 +1256,12 @@ static void f2fs_put_super(struct super_block *sb)
>  	/* prevent remaining shrinker jobs */
>  	mutex_lock(&sbi->umount_mutex);
>  
> +	/*
> +	 * flush all issued checkpoints and stop checkpoint issue thread.
> +	 * after then, all checkpoints should be done by each process context.
> +	 */
> +	f2fs_stop_ckpt_thread(sbi);
> +
>  	/*
>  	 * We don't need to do checkpoint when superblock is clean.
>  	 * But, the previous checkpoint was not done by umount, it needs to do
> @@ -1343,15 +1360,9 @@ int f2fs_sync_fs(struct super_block *sb, int sync)
>  	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
>  		return -EAGAIN;
>  
> -	if (sync) {
> -		struct cp_control cpc;
> -
> -		cpc.reason = __get_cp_reason(sbi);
> +	if (sync)
> +		err = f2fs_issue_checkpoint(sbi);
>  
> -		down_write(&sbi->gc_lock);
> -		err = f2fs_write_checkpoint(sbi, &cpc);
> -		up_write(&sbi->gc_lock);
> -	}
>  	f2fs_trace_ios(NULL, 1);
>  
>  	return err;
> @@ -1674,6 +1685,8 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>  	if (test_opt(sbi, DISABLE_CHECKPOINT))
>  		seq_printf(seq, ",checkpoint=disable:%u",
>  				F2FS_OPTION(sbi).unusable_cap);
> +	if (test_opt(sbi, MERGE_CHECKPOINT))
> +		seq_puts(seq, ",checkpoint=merge");
>  	if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_POSIX)
>  		seq_printf(seq, ",fsync_mode=%s", "posix");
>  	else if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_STRICT)
> @@ -1954,6 +1967,18 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  		}
>  	}
>  
> +	if (!test_opt(sbi, MERGE_CHECKPOINT)) {
> +		f2fs_stop_ckpt_thread(sbi);
> +	} else {
> +		err = f2fs_start_ckpt_thread(sbi);
> +		if (err) {
> +			f2fs_err(sbi,
> +			    "Failed to start F2FS issue_checkpoint_thread (%d)",
> +			    err);
> +			goto restore_gc;
> +		}
> +	}
> +
>  	/*
>  	 * We stop issue flush thread if FS is mounted as RO
>  	 * or if flush_merge is not passed in mount option.
> @@ -3701,6 +3726,18 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  
>  	f2fs_init_fsync_node_info(sbi);
>  
> +	/* setup checkpoint request control and start checkpoint issue thread */
> +	f2fs_init_ckpt_req_control(sbi);
> +	if (test_opt(sbi, MERGE_CHECKPOINT)) {
> +		err = f2fs_start_ckpt_thread(sbi);
> +		if (err) {
> +			f2fs_err(sbi,
> +			    "Failed to start F2FS issue_checkpoint_thread (%d)",
> +			    err);
> +			goto stop_ckpt_thread;
> +		}
> +	}
> +
>  	/* setup f2fs internal modules */
>  	err = f2fs_build_segment_manager(sbi);
>  	if (err) {
> @@ -3910,6 +3947,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  free_sm:
>  	f2fs_destroy_segment_manager(sbi);
>  	f2fs_destroy_post_read_wq(sbi);
> +stop_ckpt_thread:
> +	f2fs_stop_ckpt_thread(sbi);
>  free_devices:
>  	destroy_device_list(sbi);
>  	kvfree(sbi->ckpt);
> -- 
> 2.30.0.296.g2bfb1c46d8-goog
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
