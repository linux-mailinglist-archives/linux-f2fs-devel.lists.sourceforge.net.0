Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D4A525691
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 May 2022 22:51:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1npFmL-0005ft-Gz; Thu, 12 May 2022 20:51:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1npFmJ-0005fh-F6
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 20:51:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jG4VhqCB9G5F8zRr+bhkVb1OxlVBj6Duw8FwG9jCfVU=; b=LP8aQLrEktew+pw/2lYTn0Le0v
 FjWZypHsw1V9KEuNW9QkgH1Nmz+rTxcK0WcTZzQGtDzbrBAmxpofV6OvzXAaOcu92wxMWVM+aKy4g
 R2YwhXyW+VvNeYNaWcUm0sKFeMQjgl4fRhZU442cgUA4gtOfIrvCNhQfNX6yoFl9O8tc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jG4VhqCB9G5F8zRr+bhkVb1OxlVBj6Duw8FwG9jCfVU=; b=lQqKQMDPwH4ZFurJV6k+AOVLZ5
 O3YUgP12SYzwryjsBR7gbSMQxpK1EVbwPxQe/s2IiLlUm/V47onATHBwr5UfKAKJ/o13BF05M9cuc
 Tmji0bmSnzMx89PEpc5/6GMm07t5S64o9EayOHu07nhpjsxi6C5W2aX1AeTcrgChKKss=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1npFmH-0005zV-AY
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 20:51:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9EBFA61E72
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 May 2022 20:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F40C385B8;
 Thu, 12 May 2022 20:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652388671;
 bh=9WjwDRA3LQcT2EnS+ROHg9+PDa9poi2ZXe8g7MGTH8w=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=JH/H8biB25y+V5gzWe3+dxmqhXTSBhziGEmxj6jqa4eXQGOgiDTaRsJlaCq5HDiJ1
 S7GZ0gkVOylM2V6JcIKo/YPHOFNYIP+KOgIu64RY9+9q+lFQNPJoo/+T1AoIOIRXM0
 QZZUsIaXOmaiQbY3/k9wIthYApcmPFIPIRDhTNiRXa7KUUIM22Cx2qvzTuebdbEUn9
 DwETLNf+qyrXaRABgpEvUk63sIyJlIb8FI1HOUph9u3fiw1TUPULaOtDSsUFD5YIRP
 +JwybbAMeX0YfhpAkCiIwm4FFabenn4CdtawHEJ0iV5gYqb0U8pGQhw+rAtKEo9Aff
 ijOSnGzRkDK4w==
Date: Thu, 12 May 2022 13:51:09 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <Yn1zPQKZ3DI6e1Zi@google.com>
References: <20220506232032.1264078-1-jaegeuk@kernel.org>
 <20220506232032.1264078-2-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220506232032.1264078-2-jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: No functional change. - remove checkpoint=disable check for
 f2fs_write_checkpoint - get sec_freed all the time Reviewed-by: Chao Yu
 <chao@kernel.org>
 Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1npFmH-0005zV-AY
Subject: Re: [f2fs-dev] [PATCH 2/5 v2] f2fs: introduce f2fs_gc_control to
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

No functional change.

- remove checkpoint=disable check for f2fs_write_checkpoint
- get sec_freed all the time

Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 Change log from v1:
  - clean up more

 fs/f2fs/f2fs.h              | 11 +++++-
 fs/f2fs/file.c              | 30 ++++++++++++---
 fs/f2fs/gc.c                | 74 ++++++++++++++++++++-----------------
 fs/f2fs/segment.c           |  8 +++-
 fs/f2fs/super.c             |  8 +++-
 include/trace/events/f2fs.h | 18 ++++-----
 6 files changed, 98 insertions(+), 51 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 0699d7460d5d..9920b2d6af8f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1265,6 +1265,14 @@ struct atgc_management {
 	unsigned long long age_threshold;	/* age threshold */
 };
 
+struct f2fs_gc_control {
+	unsigned int victim_segno;	/* target victim segment number */
+	int init_gc_type;		/* FG_GC or BG_GC */
+	bool no_bg_gc;			/* check the space and stop bg_gc */
+	bool should_migrate_blocks;	/* should migrate blocks */
+	bool err_gc_skipped;		/* return EAGAIN if GC skipped */
+};
+
 /* For s_flag in struct f2fs_sb_info */
 enum {
 	SBI_IS_DIRTY,				/* dirty flag for checkpoint */
@@ -3761,8 +3769,7 @@ extern const struct iomap_ops f2fs_iomap_ops;
 int f2fs_start_gc_thread(struct f2fs_sb_info *sbi);
 void f2fs_stop_gc_thread(struct f2fs_sb_info *sbi);
 block_t f2fs_start_bidx_of_node(unsigned int node_ofs, struct inode *inode);
-int f2fs_gc(struct f2fs_sb_info *sbi, bool sync, bool background, bool force,
-			unsigned int segno);
+int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control);
 void f2fs_build_gc_manager(struct f2fs_sb_info *sbi);
 int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count);
 int __init f2fs_create_garbage_collection_cache(void);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6da8a663de7b..d0547bef0851 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1647,6 +1647,10 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
 	struct f2fs_map_blocks map = { .m_next_pgofs = NULL,
 			.m_next_extent = NULL, .m_seg_type = NO_CHECK_TYPE,
 			.m_may_create = true };
+	struct f2fs_gc_control gc_control = { .victim_segno = NULL_SEGNO,
+			.init_gc_type = FG_GC,
+			.should_migrate_blocks = false,
+			.err_gc_skipped = true };
 	pgoff_t pg_start, pg_end;
 	loff_t new_size = i_size_read(inode);
 	loff_t off_end;
@@ -1684,7 +1688,7 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
 		if (has_not_enough_free_secs(sbi, 0,
 			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))) {
 			f2fs_down_write(&sbi->gc_lock);
-			err = f2fs_gc(sbi, true, false, false, NULL_SEGNO);
+			err = f2fs_gc(sbi, &gc_control);
 			if (err && err != -ENODATA)
 				goto out_err;
 		}
@@ -2344,6 +2348,9 @@ static int f2fs_ioc_gc(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_gc_control gc_control = { .victim_segno = NULL_SEGNO,
+			.no_bg_gc = false,
+			.should_migrate_blocks = false };
 	__u32 sync;
 	int ret;
 
@@ -2369,7 +2376,9 @@ static int f2fs_ioc_gc(struct file *filp, unsigned long arg)
 		f2fs_down_write(&sbi->gc_lock);
 	}
 
-	ret = f2fs_gc(sbi, sync, true, false, NULL_SEGNO);
+	gc_control.init_gc_type = sync ? FG_GC : BG_GC;
+	gc_control.err_gc_skipped = sync;
+	ret = f2fs_gc(sbi, &gc_control);
 out:
 	mnt_drop_write_file(filp);
 	return ret;
@@ -2378,6 +2387,11 @@ static int f2fs_ioc_gc(struct file *filp, unsigned long arg)
 static int __f2fs_ioc_gc_range(struct file *filp, struct f2fs_gc_range *range)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(filp));
+	struct f2fs_gc_control gc_control = {
+			.init_gc_type = range->sync ? FG_GC : BG_GC,
+			.no_bg_gc = false,
+			.should_migrate_blocks = false,
+			.err_gc_skipped = range->sync };
 	u64 end;
 	int ret;
 
@@ -2405,8 +2419,8 @@ static int __f2fs_ioc_gc_range(struct file *filp, struct f2fs_gc_range *range)
 		f2fs_down_write(&sbi->gc_lock);
 	}
 
-	ret = f2fs_gc(sbi, range->sync, true, false,
-				GET_SEGNO(sbi, range->start));
+	gc_control.victim_segno = GET_SEGNO(sbi, range->start);
+	ret = f2fs_gc(sbi, &gc_control);
 	if (ret) {
 		if (ret == -EBUSY)
 			ret = -EAGAIN;
@@ -2820,6 +2834,10 @@ static int f2fs_ioc_flush_device(struct file *filp, unsigned long arg)
 	unsigned int start_segno = 0, end_segno = 0;
 	unsigned int dev_start_segno = 0, dev_end_segno = 0;
 	struct f2fs_flush_device range;
+	struct f2fs_gc_control gc_control = {
+			.init_gc_type = FG_GC,
+			.should_migrate_blocks = true,
+			.err_gc_skipped = true };
 	int ret;
 
 	if (!capable(CAP_SYS_ADMIN))
@@ -2863,7 +2881,9 @@ static int f2fs_ioc_flush_device(struct file *filp, unsigned long arg)
 		sm->last_victim[GC_CB] = end_segno + 1;
 		sm->last_victim[GC_GREEDY] = end_segno + 1;
 		sm->last_victim[ALLOC_NEXT] = end_segno + 1;
-		ret = f2fs_gc(sbi, true, true, true, start_segno);
+
+		gc_control.victim_segno = start_segno;
+		ret = f2fs_gc(sbi, &gc_control);
 		if (ret == -EAGAIN)
 			ret = 0;
 		else if (ret < 0)
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index ba8e93e517be..f3d58d154240 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -35,6 +35,9 @@ static int gc_thread_func(void *data)
 	wait_queue_head_t *wq = &sbi->gc_thread->gc_wait_queue_head;
 	wait_queue_head_t *fggc_wq = &sbi->gc_thread->fggc_wq;
 	unsigned int wait_ms;
+	struct f2fs_gc_control gc_control = {
+		.victim_segno = NULL_SEGNO,
+		.should_migrate_blocks = false };
 
 	wait_ms = gc_th->min_sleep_time;
 
@@ -141,8 +144,12 @@ static int gc_thread_func(void *data)
 		if (foreground)
 			sync_mode = false;
 
+		gc_control.init_gc_type = sync_mode ? FG_GC : BG_GC;
+		gc_control.no_bg_gc = foreground;
+		gc_control.err_gc_skipped = sync_mode;
+
 		/* if return value is not zero, no victim was selected */
-		if (f2fs_gc(sbi, sync_mode, !foreground, false, NULL_SEGNO))
+		if (f2fs_gc(sbi, &gc_control))
 			wait_ms = gc_th->no_gc_sleep_time;
 
 		if (foreground)
@@ -1740,21 +1747,20 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 	return seg_freed;
 }
 
-int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
-			bool background, bool force, unsigned int segno)
+int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 {
-	int gc_type = sync ? FG_GC : BG_GC;
+	int gc_type = gc_control->init_gc_type;
+	unsigned int segno = gc_control->victim_segno;
 	int sec_freed = 0, seg_freed = 0, total_freed = 0;
 	int ret = 0;
 	struct cp_control cpc;
-	unsigned int init_segno = segno;
 	struct gc_inode_list gc_list = {
 		.ilist = LIST_HEAD_INIT(gc_list.ilist),
 		.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
 	};
 	unsigned int skipped_round = 0, round = 0;
 
-	trace_f2fs_gc_begin(sbi->sb, sync, background,
+	trace_f2fs_gc_begin(sbi->sb, gc_type, gc_control->no_bg_gc,
 				get_pages(sbi, F2FS_DIRTY_NODES),
 				get_pages(sbi, F2FS_DIRTY_DENTS),
 				get_pages(sbi, F2FS_DIRTY_IMETA),
@@ -1781,8 +1787,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
 		 * threshold, we can make them free by checkpoint. Then, we
 		 * secure free segments which doesn't need fggc any more.
 		 */
-		if (prefree_segments(sbi) &&
-				!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
+		if (prefree_segments(sbi)) {
 			ret = f2fs_write_checkpoint(sbi, &cpc);
 			if (ret)
 				goto stop;
@@ -1792,7 +1797,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
 	}
 
 	/* f2fs_balance_fs doesn't need to do BG_GC in critical path. */
-	if (gc_type == BG_GC && !background) {
+	if (gc_type == BG_GC && gc_control->no_bg_gc) {
 		ret = -EINVAL;
 		goto stop;
 	}
@@ -1808,45 +1813,48 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
 		goto stop;
 	}
 
-	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type, force);
-	if (gc_type == FG_GC &&
-		seg_freed == f2fs_usable_segs_in_sec(sbi, segno))
-		sec_freed++;
+	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type,
+				gc_control->should_migrate_blocks);
 	total_freed += seg_freed;
 
-	if (gc_type == FG_GC) {
-		if (sbi->skipped_gc_rwsem)
-			skipped_round++;
-		round++;
-	}
+	if (seg_freed == f2fs_usable_segs_in_sec(sbi, segno))
+		sec_freed++;
 
 	if (gc_type == FG_GC)
 		sbi->cur_victim_sec = NULL_SEGNO;
 
-	if (sync)
+	if (gc_control->init_gc_type == FG_GC)
 		goto stop;
 
-	if (!has_not_enough_free_secs(sbi, sec_freed, 0))
+	if (!has_not_enough_free_secs(sbi,
+			(gc_type == FG_GC) ? sec_freed : 0, 0))
 		goto stop;
 
-	if (skipped_round <= MAX_SKIP_GC_COUNT || skipped_round * 2 < round) {
-
-		/* Write checkpoint to reclaim prefree segments */
-		if (free_sections(sbi) < NR_CURSEG_PERSIST_TYPE &&
-				prefree_segments(sbi) &&
-				!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
+	/* FG_GC stops GC by skip_count */
+	if (gc_type == FG_GC) {
+		if (sbi->skipped_gc_rwsem)
+			skipped_round++;
+		round++;
+		if (skipped_round > MAX_SKIP_GC_COUNT &&
+				skipped_round * 2 >= round) {
 			ret = f2fs_write_checkpoint(sbi, &cpc);
-			if (ret)
-				goto stop;
+			goto stop;
 		}
-		segno = NULL_SEGNO;
-		goto gc_more;
 	}
-	if (gc_type == FG_GC && !is_sbi_flag_set(sbi, SBI_CP_DISABLED))
+
+	/* Write checkpoint to reclaim prefree segments */
+	if (free_sections(sbi) < NR_CURSEG_PERSIST_TYPE &&
+				prefree_segments(sbi)) {
 		ret = f2fs_write_checkpoint(sbi, &cpc);
+		if (ret)
+			goto stop;
+	}
+	segno = NULL_SEGNO;
+	goto gc_more;
+
 stop:
 	SIT_I(sbi)->last_victim[ALLOC_NEXT] = 0;
-	SIT_I(sbi)->last_victim[FLUSH_DEVICE] = init_segno;
+	SIT_I(sbi)->last_victim[FLUSH_DEVICE] = gc_control->victim_segno;
 
 	if (gc_type == FG_GC)
 		f2fs_unpin_all_sections(sbi, true);
@@ -1864,7 +1872,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
 
 	put_gc_inode(&gc_list);
 
-	if (sync && !ret)
+	if (gc_control->err_gc_skipped && !ret)
 		ret = sec_freed ? 0 : -EAGAIN;
 	return ret;
 }
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 47934995e2ca..8b4f2b1d2cca 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -399,8 +399,14 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 			io_schedule();
 			finish_wait(&sbi->gc_thread->fggc_wq, &wait);
 		} else {
+			struct f2fs_gc_control gc_control = {
+				.victim_segno = NULL_SEGNO,
+				.init_gc_type = BG_GC,
+				.no_bg_gc = true,
+				.should_migrate_blocks = false,
+				.err_gc_skipped = false };
 			f2fs_down_write(&sbi->gc_lock);
-			f2fs_gc(sbi, false, false, false, NULL_SEGNO);
+			f2fs_gc(sbi, &gc_control);
 		}
 	}
 }
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 8c81dd324297..a28c27eed6d0 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2076,8 +2076,14 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 	sbi->gc_mode = GC_URGENT_HIGH;
 
 	while (!f2fs_time_over(sbi, DISABLE_TIME)) {
+		struct f2fs_gc_control gc_control = {
+			.victim_segno = NULL_SEGNO,
+			.init_gc_type = FG_GC,
+			.should_migrate_blocks = false,
+			.err_gc_skipped = true };
+
 		f2fs_down_write(&sbi->gc_lock);
-		err = f2fs_gc(sbi, true, false, false, NULL_SEGNO);
+		err = f2fs_gc(sbi, &gc_control);
 		if (err == -ENODATA) {
 			err = 0;
 			break;
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 7e915dbf3674..54ec9e543f09 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -644,19 +644,19 @@ TRACE_EVENT(f2fs_background_gc,
 
 TRACE_EVENT(f2fs_gc_begin,
 
-	TP_PROTO(struct super_block *sb, bool sync, bool background,
+	TP_PROTO(struct super_block *sb, int gc_type, bool no_bg_gc,
 			long long dirty_nodes, long long dirty_dents,
 			long long dirty_imeta, unsigned int free_sec,
 			unsigned int free_seg, int reserved_seg,
 			unsigned int prefree_seg),
 
-	TP_ARGS(sb, sync, background, dirty_nodes, dirty_dents, dirty_imeta,
+	TP_ARGS(sb, gc_type, no_bg_gc, dirty_nodes, dirty_dents, dirty_imeta,
 		free_sec, free_seg, reserved_seg, prefree_seg),
 
 	TP_STRUCT__entry(
 		__field(dev_t,		dev)
-		__field(bool,		sync)
-		__field(bool,		background)
+		__field(int,		gc_type)
+		__field(bool,		no_bg_gc)
 		__field(long long,	dirty_nodes)
 		__field(long long,	dirty_dents)
 		__field(long long,	dirty_imeta)
@@ -668,8 +668,8 @@ TRACE_EVENT(f2fs_gc_begin,
 
 	TP_fast_assign(
 		__entry->dev		= sb->s_dev;
-		__entry->sync		= sync;
-		__entry->background	= background;
+		__entry->gc_type	= gc_type;
+		__entry->no_bg_gc	= no_bg_gc;
 		__entry->dirty_nodes	= dirty_nodes;
 		__entry->dirty_dents	= dirty_dents;
 		__entry->dirty_imeta	= dirty_imeta;
@@ -679,12 +679,12 @@ TRACE_EVENT(f2fs_gc_begin,
 		__entry->prefree_seg	= prefree_seg;
 	),
 
-	TP_printk("dev = (%d,%d), sync = %d, background = %d, nodes = %lld, "
+	TP_printk("dev = (%d,%d), gc_type = %s, no_background_GC = %d, nodes = %lld, "
 		"dents = %lld, imeta = %lld, free_sec:%u, free_seg:%u, "
 		"rsv_seg:%d, prefree_seg:%u",
 		show_dev(__entry->dev),
-		__entry->sync,
-		__entry->background,
+		show_gc_type(__entry->gc_type),
+		(__entry->gc_type == BG_GC) ? __entry->no_bg_gc : -1,
 		__entry->dirty_nodes,
 		__entry->dirty_dents,
 		__entry->dirty_imeta,
-- 
2.36.0.550.gb090851708-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
