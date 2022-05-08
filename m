Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E14F51EE0C
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  8 May 2022 16:28:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nnhtH-0006xK-Pg; Sun, 08 May 2022 14:28:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nnhtG-0006xD-3V
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 08 May 2022 14:28:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FHr0nSGIbZLbxqo9rNbj7UxFDrrth5GXvvfYfdOmzu8=; b=SzBXndS1IH0zfOXbYl/Cm5jsYc
 L4A+0ePfKwnnTtvaNO4KzmIa+9+NrkNtMOgPRTz3BvtbOj5uUDGWFgXrVYlLSMtnjKS7pZQXbauK0
 z/VhckKBmXsS+wI5ZUcA1l0Liuxb2m+6l0UHFrOjM0iPlXCNSkhwpleIVu9aHSd0V0Ag=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FHr0nSGIbZLbxqo9rNbj7UxFDrrth5GXvvfYfdOmzu8=; b=HCnJBQVI6/2PEenc+Vvwb1i1g/
 YjRYc3XMVU8i13Vcoj4XHvK6WPk9m4vMPMETebTr4HDLYcYHpHkL+EU4tuSP6EHF4rZ5Fsk54e2RY
 gQFc1RMc6rn9gwS9kz0yd5MnD5MjwBkv8JdPddkoBa1I0ecn3IQPX2BiAGAa9//0WDUc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nnhtE-005BBy-4i
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 08 May 2022 14:28:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B3EE3611A0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  8 May 2022 14:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2910C385AC;
 Sun,  8 May 2022 14:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652020078;
 bh=u/fX6HhaMssTlfBHSYtMPljJKHin2O8ndeOqzJqYZiA=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Q/l97NcfH2/JWEOFDFdTwmiElRB4cjkKn6nPy0lc5Vvft5M2EhxS377Sk1wU2GMyh
 hdDb9ghKSOwR+UizNjCy8eT0twlp6T3UZ4T0twuAHJZ+qX17RgzGKfjzXZ5t/rN9b0
 y60sxkfUnDtz6bt4AYwxv4FhSkHySFddxKGH9l2UFjZPvjcWS0HIUMPtxxEjohLSHq
 JDdP907xcxQB9qGof7DlmnYkklTCpgu5eHBVOIkidlURzk4Y4tRsj1Le6+qlf4vqs9
 PJq1ZwgeKwtzdhl+ObNvr1WY6aWIBTkAOxKaiBepklnqsVOpraUAb6JuaXibwBVVcw
 GaMGsN/nZfjAQ==
Message-ID: <85723a69-0b8c-020c-11f9-3beb9ed54e0d@kernel.org>
Date: Sun, 8 May 2022 22:27:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220506232032.1264078-1-jaegeuk@kernel.org>
 <20220506232032.1264078-2-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220506232032.1264078-2-jaegeuk@kernel.org>
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/5/7 7:20, Jaegeuk Kim wrote: > No functional change.
 > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> > --- > fs/f2fs/f2fs.h
 | 11 +++++++++-- > fs/f2fs/file.c | 30 +++++++++++++++++++++++++ [...] 
 Content analysis details:   (-7.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nnhtE-005BBy-4i
Subject: Re: [f2fs-dev] [PATCH 2/5] f2fs: introduce f2fs_gc_control to
 consolidate f2fs_gc parameters
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/5/7 7:20, Jaegeuk Kim wrote:
> No functional change.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/f2fs.h              | 11 +++++++++--
>   fs/f2fs/file.c              | 30 +++++++++++++++++++++++++-----
>   fs/f2fs/gc.c                | 29 ++++++++++++++++++-----------
>   fs/f2fs/segment.c           |  8 +++++++-
>   fs/f2fs/super.c             |  8 +++++++-
>   include/trace/events/f2fs.h | 18 +++++++++---------
>   6 files changed, 75 insertions(+), 29 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index efe5e80163a8..d49b9b476592 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1276,6 +1276,14 @@ struct atgc_management {
>   	unsigned long long age_threshold;	/* age threshold */
>   };
>   
> +struct f2fs_gc_control {
> +	unsigned int victim_segno;	/* target victim segment number */
> +	int init_gc_type;		/* FG_GC or BG_GC */
> +	bool no_bg_gc;			/* check the space and stop bg_gc */
> +	bool should_migrate_blocks;	/* should migrate blocks */
> +	bool err_gc_skipped;		/* return EAGAIN if GC skipped */
> +};
> +
>   /* For s_flag in struct f2fs_sb_info */
>   enum {
>   	SBI_IS_DIRTY,				/* dirty flag for checkpoint */
> @@ -3786,8 +3794,7 @@ extern const struct iomap_ops f2fs_iomap_ops;
>   int f2fs_start_gc_thread(struct f2fs_sb_info *sbi);
>   void f2fs_stop_gc_thread(struct f2fs_sb_info *sbi);
>   block_t f2fs_start_bidx_of_node(unsigned int node_ofs, struct inode *inode);
> -int f2fs_gc(struct f2fs_sb_info *sbi, bool sync, bool background, bool force,
> -			unsigned int segno);
> +int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control);
>   void f2fs_build_gc_manager(struct f2fs_sb_info *sbi);
>   int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count);
>   int __init f2fs_create_garbage_collection_cache(void);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index b307d96a0a7c..0e7d101c3e65 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1647,6 +1647,10 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
>   	struct f2fs_map_blocks map = { .m_next_pgofs = NULL,
>   			.m_next_extent = NULL, .m_seg_type = NO_CHECK_TYPE,
>   			.m_may_create = true };
> +	struct f2fs_gc_control gc_control = { .victim_segno = NULL_SEGNO,
> +			.init_gc_type = FG_GC,

.no_bg_gc will be printed by tracepoint, let's initialize it as well...

.no_bg_gc = false,

> +			.should_migrate_blocks = false,
> +			.err_gc_skipped = true };
>   	pgoff_t pg_start, pg_end;
>   	loff_t new_size = i_size_read(inode);
>   	loff_t off_end;
> @@ -1684,7 +1688,7 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
>   		if (has_not_enough_free_secs(sbi, 0,
>   			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))) {
>   			f2fs_down_write(&sbi->gc_lock);
> -			err = f2fs_gc(sbi, true, false, false, NULL_SEGNO);
> +			err = f2fs_gc(sbi, &gc_control);
>   			if (err && err != -ENODATA)
>   				goto out_err;
>   		}
> @@ -2447,6 +2451,9 @@ static int f2fs_ioc_gc(struct file *filp, unsigned long arg)
>   {
>   	struct inode *inode = file_inode(filp);
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct f2fs_gc_control gc_control = { .victim_segno = NULL_SEGNO,
> +			.no_bg_gc = false,
> +			.should_migrate_blocks = false };
>   	__u32 sync;
>   	int ret;
>   
> @@ -2472,7 +2479,9 @@ static int f2fs_ioc_gc(struct file *filp, unsigned long arg)
>   		f2fs_down_write(&sbi->gc_lock);
>   	}
>   
> -	ret = f2fs_gc(sbi, sync, true, false, NULL_SEGNO);
> +	gc_control.init_gc_type = sync ? FG_GC : BG_GC;
> +	gc_control.err_gc_skipped = sync;
> +	ret = f2fs_gc(sbi, &gc_control);
>   out:
>   	mnt_drop_write_file(filp);
>   	return ret;
> @@ -2481,6 +2490,11 @@ static int f2fs_ioc_gc(struct file *filp, unsigned long arg)
>   static int __f2fs_ioc_gc_range(struct file *filp, struct f2fs_gc_range *range)
>   {
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(filp));
> +	struct f2fs_gc_control gc_control = {
> +			.init_gc_type = range->sync ? FG_GC : BG_GC,
> +			.no_bg_gc = false,
> +			.should_migrate_blocks = false,
> +			.err_gc_skipped = range->sync };
>   	u64 end;
>   	int ret;
>   
> @@ -2508,8 +2522,8 @@ static int __f2fs_ioc_gc_range(struct file *filp, struct f2fs_gc_range *range)
>   		f2fs_down_write(&sbi->gc_lock);
>   	}
>   
> -	ret = f2fs_gc(sbi, range->sync, true, false,
> -				GET_SEGNO(sbi, range->start));
> +	gc_control.victim_segno = GET_SEGNO(sbi, range->start);
> +	ret = f2fs_gc(sbi, &gc_control);
>   	if (ret) {
>   		if (ret == -EBUSY)
>   			ret = -EAGAIN;
> @@ -2923,6 +2937,10 @@ static int f2fs_ioc_flush_device(struct file *filp, unsigned long arg)
>   	unsigned int start_segno = 0, end_segno = 0;
>   	unsigned int dev_start_segno = 0, dev_end_segno = 0;
>   	struct f2fs_flush_device range;
> +	struct f2fs_gc_control gc_control = {
> +			.init_gc_type = FG_GC,

.no_bg_gc = false,

> +			.should_migrate_blocks = true,
> +			.err_gc_skipped = true };
>   	int ret;
>   
>   	if (!capable(CAP_SYS_ADMIN))
> @@ -2966,7 +2984,9 @@ static int f2fs_ioc_flush_device(struct file *filp, unsigned long arg)
>   		sm->last_victim[GC_CB] = end_segno + 1;
>   		sm->last_victim[GC_GREEDY] = end_segno + 1;
>   		sm->last_victim[ALLOC_NEXT] = end_segno + 1;
> -		ret = f2fs_gc(sbi, true, true, true, start_segno);
> +
> +		gc_control.victim_segno = start_segno;
> +		ret = f2fs_gc(sbi, &gc_control);
>   		if (ret == -EAGAIN)
>   			ret = 0;
>   		else if (ret < 0)
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 3009c0a97ab4..aeffcc1d5c02 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -35,6 +35,9 @@ static int gc_thread_func(void *data)
>   	wait_queue_head_t *wq = &sbi->gc_thread->gc_wait_queue_head;
>   	wait_queue_head_t *fggc_wq = &sbi->gc_thread->fggc_wq;
>   	unsigned int wait_ms;
> +	struct f2fs_gc_control gc_control = {
> +		.victim_segno = NULL_SEGNO,
> +		.should_migrate_blocks = false };
>   
>   	wait_ms = gc_th->min_sleep_time;
>   
> @@ -141,8 +144,12 @@ static int gc_thread_func(void *data)
>   		if (foreground)
>   			sync_mode = false;
>   
> +		gc_control.init_gc_type = sync_mode ? FG_GC : BG_GC;
> +		gc_control.no_bg_gc = foreground;
> +		gc_control.err_gc_skipped = sync_mode;
> +
>   		/* if return value is not zero, no victim was selected */
> -		if (f2fs_gc(sbi, sync_mode, !foreground, false, NULL_SEGNO))
> +		if (f2fs_gc(sbi, &gc_control))
>   			wait_ms = gc_th->no_gc_sleep_time;
>   
>   		if (foreground)
> @@ -1753,14 +1760,13 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
>   	return seg_freed;
>   }
>   
> -int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
> -			bool background, bool force, unsigned int segno)
> +int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>   {
> -	int gc_type = sync ? FG_GC : BG_GC;
> +	int gc_type = gc_control->init_gc_type;
> +	unsigned int segno = gc_control->victim_segno;
>   	int sec_freed = 0, seg_freed = 0, total_freed = 0;
>   	int ret = 0;
>   	struct cp_control cpc;
> -	unsigned int init_segno = segno;
>   	struct gc_inode_list gc_list = {
>   		.ilist = LIST_HEAD_INIT(gc_list.ilist),
>   		.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
> @@ -1769,7 +1775,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
>   	unsigned long long first_skipped;
>   	unsigned int skipped_round = 0, round = 0;
>   
> -	trace_f2fs_gc_begin(sbi->sb, sync, background,
> +	trace_f2fs_gc_begin(sbi->sb, gc_type, gc_control->no_bg_gc,
>   				get_pages(sbi, F2FS_DIRTY_NODES),
>   				get_pages(sbi, F2FS_DIRTY_DENTS),
>   				get_pages(sbi, F2FS_DIRTY_IMETA),
> @@ -1808,7 +1814,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
>   	}
>   
>   	/* f2fs_balance_fs doesn't need to do BG_GC in critical path. */
> -	if (gc_type == BG_GC && !background) {
> +	if (gc_type == BG_GC && gc_control->no_bg_gc) {
>   		ret = -EINVAL;
>   		goto stop;
>   	}
> @@ -1824,7 +1830,8 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
>   		goto stop;
>   	}
>   
> -	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type, force);
> +	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type,
> +				gc_control->should_migrate_blocks);
>   	if (gc_type == FG_GC &&
>   		seg_freed == f2fs_usable_segs_in_sec(sbi, segno))
>   		sec_freed++;
> @@ -1841,7 +1848,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
>   	if (gc_type == FG_GC)
>   		sbi->cur_victim_sec = NULL_SEGNO;
>   
> -	if (sync)
> +	if (gc_control->init_gc_type == FG_GC)
>   		goto stop;
>   
>   	if (!has_not_enough_free_secs(sbi, sec_freed, 0))
> @@ -1871,7 +1878,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
>   		ret = f2fs_write_checkpoint(sbi, &cpc);
>   stop:
>   	SIT_I(sbi)->last_victim[ALLOC_NEXT] = 0;
> -	SIT_I(sbi)->last_victim[FLUSH_DEVICE] = init_segno;
> +	SIT_I(sbi)->last_victim[FLUSH_DEVICE] = gc_control->victim_segno;
>   
>   	if (gc_type == FG_GC)
>   		f2fs_unpin_all_sections(sbi, true);
> @@ -1889,7 +1896,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
>   
>   	put_gc_inode(&gc_list);
>   
> -	if (sync && !ret)
> +	if (gc_control->err_gc_skipped && !ret)
>   		ret = sec_freed ? 0 : -EAGAIN;
>   	return ret;
>   }
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 87ff2b3cdf94..bc63f0572c64 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -523,8 +523,14 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
>   			io_schedule();
>   			finish_wait(&sbi->gc_thread->fggc_wq, &wait);
>   		} else {
> +			struct f2fs_gc_control gc_control = {
> +				.victim_segno = NULL_SEGNO,
> +				.init_gc_type = BG_GC,
> +				.no_bg_gc = true,
> +				.should_migrate_blocks = false,
> +				.err_gc_skipped = false };
>   			f2fs_down_write(&sbi->gc_lock);
> -			f2fs_gc(sbi, false, false, false, NULL_SEGNO);
> +			f2fs_gc(sbi, &gc_control);
>   		}
>   	}
>   }
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 7edb018a60a6..8b23fa6fc6b7 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2080,8 +2080,14 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
>   	sbi->gc_mode = GC_URGENT_HIGH;
>   
>   	while (!f2fs_time_over(sbi, DISABLE_TIME)) {
> +		struct f2fs_gc_control gc_control = {
> +			.victim_segno = NULL_SEGNO,
> +			.init_gc_type = FG_GC,

.no_bg_gc = false,

Thanks,

> +			.should_migrate_blocks = false,
> +			.err_gc_skipped = true };
> +
>   		f2fs_down_write(&sbi->gc_lock);
> -		err = f2fs_gc(sbi, true, false, false, NULL_SEGNO);
> +		err = f2fs_gc(sbi, &gc_control);
>   		if (err == -ENODATA) {
>   			err = 0;
>   			break;
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index 4d1ad64d4cab..6699174977a3 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -652,19 +652,19 @@ TRACE_EVENT(f2fs_background_gc,
>   
>   TRACE_EVENT(f2fs_gc_begin,
>   
> -	TP_PROTO(struct super_block *sb, bool sync, bool background,
> +	TP_PROTO(struct super_block *sb, int gc_type, bool no_bg_gc,
>   			long long dirty_nodes, long long dirty_dents,
>   			long long dirty_imeta, unsigned int free_sec,
>   			unsigned int free_seg, int reserved_seg,
>   			unsigned int prefree_seg),
>   
> -	TP_ARGS(sb, sync, background, dirty_nodes, dirty_dents, dirty_imeta,
> +	TP_ARGS(sb, gc_type, no_bg_gc, dirty_nodes, dirty_dents, dirty_imeta,
>   		free_sec, free_seg, reserved_seg, prefree_seg),
>   
>   	TP_STRUCT__entry(
>   		__field(dev_t,		dev)
> -		__field(bool,		sync)
> -		__field(bool,		background)
> +		__field(int,		gc_type)
> +		__field(bool,		no_bg_gc)
>   		__field(long long,	dirty_nodes)
>   		__field(long long,	dirty_dents)
>   		__field(long long,	dirty_imeta)
> @@ -676,8 +676,8 @@ TRACE_EVENT(f2fs_gc_begin,
>   
>   	TP_fast_assign(
>   		__entry->dev		= sb->s_dev;
> -		__entry->sync		= sync;
> -		__entry->background	= background;
> +		__entry->gc_type	= gc_type;
> +		__entry->no_bg_gc	= no_bg_gc;
>   		__entry->dirty_nodes	= dirty_nodes;
>   		__entry->dirty_dents	= dirty_dents;
>   		__entry->dirty_imeta	= dirty_imeta;
> @@ -687,12 +687,12 @@ TRACE_EVENT(f2fs_gc_begin,
>   		__entry->prefree_seg	= prefree_seg;
>   	),
>   
> -	TP_printk("dev = (%d,%d), sync = %d, background = %d, nodes = %lld, "
> +	TP_printk("dev = (%d,%d), gc_type = %s, no_background_GC = %d, nodes = %lld, "
>   		"dents = %lld, imeta = %lld, free_sec:%u, free_seg:%u, "
>   		"rsv_seg:%d, prefree_seg:%u",
>   		show_dev(__entry->dev),
> -		__entry->sync,
> -		__entry->background,
> +		show_gc_type(__entry->gc_type),
> +		__entry->no_bg_gc,
>   		__entry->dirty_nodes,
>   		__entry->dirty_dents,
>   		__entry->dirty_imeta,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
