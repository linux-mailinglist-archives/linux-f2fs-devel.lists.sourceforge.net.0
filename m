Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9AC13A882
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jan 2020 12:37:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1irKVa-0005xo-6Z; Tue, 14 Jan 2020 11:37:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1irKVY-0005xg-PY
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jan 2020 11:37:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OoV4HzdYeGPGzihAoWXG9NReeBOnhSr4cI5NXn8EgAE=; b=cXSvQ63YPdyas/DqmrWewqc5NB
 MnfZoDRW/7jvzt/+wGjC/c4OCqkZFpQsr3MNNQohTkX1AL1KWfLIs4cow15LYehxEtiayPomi2/jD
 Pw/qg+uGCwPJxce6DH8OL9aZI6uYHBB5W4HQ2HQ3yYWhTuy7KeMFtnuD8++Hao0PSkKg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OoV4HzdYeGPGzihAoWXG9NReeBOnhSr4cI5NXn8EgAE=; b=V
 hlIsed8Gei5JI7TQ4L/9EtoMLtcb9/TfyIDdBzaxp0wmTIWUHX5ctfb2O9RQvWNZwhzymUeRuIO9O
 sqI4tNEgELvMdVrQGlhvd0e5dZgyn1Dd0V5T+ObtcdlNWVFweqC9jnQoBJ0r+/SUFrBBeWoHLoqQX
 UfQSNtYnsZdkC6F8=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1irKVV-002n8T-6V
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jan 2020 11:37:16 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C8605A6E80C2610A71DD;
 Tue, 14 Jan 2020 19:37:03 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Tue, 14 Jan 2020 19:36:57 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 14 Jan 2020 19:36:50 +0800
Message-ID: <20200114113650.104881-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1irKVV-002n8T-6V
Subject: [f2fs-dev] [PATCH] f2fs: change to use rwsem for gc_mutex
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

Mutex lock won't serialize callers, in order to avoid starving of unlucky
caller, let's use rwsem lock instead.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/f2fs.h    |  5 ++++-
 fs/f2fs/file.c    | 12 ++++++------
 fs/f2fs/gc.c      | 12 ++++++------
 fs/f2fs/segment.c |  6 +++---
 fs/f2fs/super.c   | 16 ++++++++--------
 5 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e7208442d32a..61d62cd06449 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1391,7 +1391,10 @@ struct f2fs_sb_info {
 	struct f2fs_mount_info mount_opt;	/* mount options */
 
 	/* for cleaning operations */
-	struct mutex gc_mutex;			/* mutex for GC */
+	struct rw_semaphore gc_lock;		/*
+						 * semaphore for GC, avoid
+						 * race between GC and GC or CP
+						 */
 	struct f2fs_gc_kthread	*gc_thread;	/* GC thread */
 	unsigned int cur_victim_sec;		/* current victim section num */
 	unsigned int gc_mode;			/* current GC state */
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 0dff22566a1d..86ddbb55d2b1 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1642,7 +1642,7 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
 next_alloc:
 		if (has_not_enough_free_secs(sbi, 0,
 			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))) {
-			mutex_lock(&sbi->gc_mutex);
+			down_write(&sbi->gc_lock);
 			err = f2fs_gc(sbi, true, false, NULL_SEGNO);
 			if (err && err != -ENODATA && err != -EAGAIN)
 				goto out_err;
@@ -2450,12 +2450,12 @@ static int f2fs_ioc_gc(struct file *filp, unsigned long arg)
 		return ret;
 
 	if (!sync) {
-		if (!mutex_trylock(&sbi->gc_mutex)) {
+		if (!down_write_trylock(&sbi->gc_lock)) {
 			ret = -EBUSY;
 			goto out;
 		}
 	} else {
-		mutex_lock(&sbi->gc_mutex);
+		down_write(&sbi->gc_lock);
 	}
 
 	ret = f2fs_gc(sbi, sync, true, NULL_SEGNO);
@@ -2493,12 +2493,12 @@ static int f2fs_ioc_gc_range(struct file *filp, unsigned long arg)
 
 do_more:
 	if (!range.sync) {
-		if (!mutex_trylock(&sbi->gc_mutex)) {
+		if (!down_write_trylock(&sbi->gc_lock)) {
 			ret = -EBUSY;
 			goto out;
 		}
 	} else {
-		mutex_lock(&sbi->gc_mutex);
+		down_write(&sbi->gc_lock);
 	}
 
 	ret = f2fs_gc(sbi, range.sync, true, GET_SEGNO(sbi, range.start));
@@ -2929,7 +2929,7 @@ static int f2fs_ioc_flush_device(struct file *filp, unsigned long arg)
 	end_segno = min(start_segno + range.segments, dev_end_segno);
 
 	while (start_segno < end_segno) {
-		if (!mutex_trylock(&sbi->gc_mutex)) {
+		if (!down_write_trylock(&sbi->gc_lock)) {
 			ret = -EBUSY;
 			goto out;
 		}
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index c43181ef98c4..67eca7c2d983 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -78,18 +78,18 @@ static int gc_thread_func(void *data)
 		 */
 		if (sbi->gc_mode == GC_URGENT) {
 			wait_ms = gc_th->urgent_sleep_time;
-			mutex_lock(&sbi->gc_mutex);
+			down_write(&sbi->gc_lock);
 			goto do_gc;
 		}
 
-		if (!mutex_trylock(&sbi->gc_mutex)) {
+		if (!down_write_trylock(&sbi->gc_lock)) {
 			stat_other_skip_bggc_count(sbi);
 			goto next;
 		}
 
 		if (!is_idle(sbi, GC_TIME)) {
 			increase_sleep_time(gc_th, &wait_ms);
-			mutex_unlock(&sbi->gc_mutex);
+			up_write(&sbi->gc_lock);
 			stat_io_skip_bggc_count(sbi);
 			goto next;
 		}
@@ -1370,7 +1370,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
 				reserved_segments(sbi),
 				prefree_segments(sbi));
 
-	mutex_unlock(&sbi->gc_mutex);
+	up_write(&sbi->gc_lock);
 
 	put_gc_inode(&gc_list);
 
@@ -1409,9 +1409,9 @@ static int free_segment_range(struct f2fs_sb_info *sbi, unsigned int start,
 			.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
 		};
 
-		mutex_lock(&sbi->gc_mutex);
+		down_write(&sbi->gc_lock);
 		do_garbage_collect(sbi, segno, &gc_list, FG_GC);
-		mutex_unlock(&sbi->gc_mutex);
+		up_write(&sbi->gc_lock);
 		put_gc_inode(&gc_list);
 
 		if (get_valid_blocks(sbi, segno, true))
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 311fe4937f6a..6d03b89242f5 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -504,7 +504,7 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 	 * dir/node pages without enough free segments.
 	 */
 	if (has_not_enough_free_secs(sbi, 0, 0)) {
-		mutex_lock(&sbi->gc_mutex);
+		down_write(&sbi->gc_lock);
 		f2fs_gc(sbi, false, false, NULL_SEGNO);
 	}
 }
@@ -2860,9 +2860,9 @@ int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range)
 	if (sbi->discard_blks == 0)
 		goto out;
 
-	mutex_lock(&sbi->gc_mutex);
+	down_write(&sbi->gc_lock);
 	err = f2fs_write_checkpoint(sbi, &cpc);
-	mutex_unlock(&sbi->gc_mutex);
+	up_write(&sbi->gc_lock);
 	if (err)
 		goto out;
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 593dc3d2b80b..65a7a432dfee 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1238,9 +1238,9 @@ int f2fs_sync_fs(struct super_block *sb, int sync)
 
 		cpc.reason = __get_cp_reason(sbi);
 
-		mutex_lock(&sbi->gc_mutex);
+		down_write(&sbi->gc_lock);
 		err = f2fs_write_checkpoint(sbi, &cpc);
-		mutex_unlock(&sbi->gc_mutex);
+		up_write(&sbi->gc_lock);
 	}
 	f2fs_trace_ios(NULL, 1);
 
@@ -1621,7 +1621,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 	f2fs_update_time(sbi, DISABLE_TIME);
 
 	while (!f2fs_time_over(sbi, DISABLE_TIME)) {
-		mutex_lock(&sbi->gc_mutex);
+		down_write(&sbi->gc_lock);
 		err = f2fs_gc(sbi, true, false, NULL_SEGNO);
 		if (err == -ENODATA) {
 			err = 0;
@@ -1643,7 +1643,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 		goto restore_flag;
 	}
 
-	mutex_lock(&sbi->gc_mutex);
+	down_write(&sbi->gc_lock);
 	cpc.reason = CP_PAUSE;
 	set_sbi_flag(sbi, SBI_CP_DISABLED);
 	err = f2fs_write_checkpoint(sbi, &cpc);
@@ -1655,7 +1655,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 	spin_unlock(&sbi->stat_lock);
 
 out_unlock:
-	mutex_unlock(&sbi->gc_mutex);
+	up_write(&sbi->gc_lock);
 restore_flag:
 	sbi->sb->s_flags = s_flags;	/* Restore MS_RDONLY status */
 	return err;
@@ -1663,12 +1663,12 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 
 static void f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 {
-	mutex_lock(&sbi->gc_mutex);
+	down_write(&sbi->gc_lock);
 	f2fs_dirty_to_prefree(sbi);
 
 	clear_sbi_flag(sbi, SBI_CP_DISABLED);
 	set_sbi_flag(sbi, SBI_IS_DIRTY);
-	mutex_unlock(&sbi->gc_mutex);
+	up_write(&sbi->gc_lock);
 
 	f2fs_sync_fs(sbi->sb, 1);
 }
@@ -3398,7 +3398,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 
 	/* init f2fs-specific super block info */
 	sbi->valid_super_block = valid_super_block;
-	mutex_init(&sbi->gc_mutex);
+	init_rwsem(&sbi->gc_lock);
 	mutex_init(&sbi->writepages);
 	mutex_init(&sbi->cp_mutex);
 	mutex_init(&sbi->resize_mutex);
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
