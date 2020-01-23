Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16247146F92
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jan 2020 18:24:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iugDH-0002tH-UZ; Thu, 23 Jan 2020 17:24:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iugDG-0002t8-5Y
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jan 2020 17:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S61mK1FKJRT85d/f8BWRxKFp6JftQLGiTKKSc+bIAJA=; b=Eph3c4HszLzRHdv0SsEmglKNdu
 dB/MeC+FqxZ8GklKiQC3BGB6gHU7nzV8nOl1bJpHA77cJqqWHXUA4yXl+X59c90g+UgBmm8nHEk/W
 7/wlBrP9klTv5l1igTjVySl7VRam5z5nSGscQZ5C8nY71/8dMfJ9r09IyGfHVpcfEVPQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S61mK1FKJRT85d/f8BWRxKFp6JftQLGiTKKSc+bIAJA=; b=VfDLzcrd3V2PkZWMm9AYmpVTKQ
 9nJ+KF/9OZFx8LHFRQxWDWI4lWLZ5j5Y1pDgkcMmylYlhYts1Q9t0vdxPw6ZUvnALxM+VstWfvY0X
 4YCf7yBddtJ5inLcmY90wIl6ztVlf9AryzyMlc+7KinBOWzh6bbzkl7PlPpfITPeqRUE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iugDE-002cZU-8q
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jan 2020 17:24:14 +0000
Received: from localhost (unknown [104.132.0.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E07CD207FF;
 Thu, 23 Jan 2020 17:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579800245;
 bh=uY3kZswZQRVgRmS6mXD1UjS1ytIAOvqu/FGXNjxwVDE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BeW3DIECiL33oXv/QchFMZWBVwnNz3TgJKgQ7ErG4uYz7fwiikM6EL0suaWkXevy2
 yM2BhODOnzmzVY4Bny9Xgp/e2Q6Q2mbCjBY2DnVpyOiZ7y5w0x9HktId1OcuDZRXln
 K8vo7ltHaBkItVAHrxa9mgripTuTlSwBFoZ2BX7c=
Date: Thu, 23 Jan 2020 09:24:04 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20200123172404.GA92325@jaegeuk-macbookpro.roam.corp.google.com>
References: <20200123011354.75282-1-jaegeuk@kernel.org>
 <20200123011354.75282-2-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200123011354.75282-2-jaegeuk@kernel.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
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
X-Headers-End: 1iugDE-002cZU-8q
Subject: Re: [f2fs-dev] [PATCH 2/2 v2] f2fs: Add f2fs stats to sysfs
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
Cc: Hridya Valsaraju <hridya@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Currently f2fs stats are only available from /d/f2fs/status. This patch
adds some of the f2fs stats to sysfs so that they are accessible even
when debugfs is not mounted.

The following sysfs nodes are added:
-/sys/fs/f2fs/<disk>/free_segments
-/sys/fs/f2fs/<disk>/cp_foreground_calls
-/sys/fs/f2fs/<disk>/cp_background_calls
-/sys/fs/f2fs/<disk>/gc_foreground_calls
-/sys/fs/f2fs/<disk>/gc_background_calls
-/sys/fs/f2fs/<disk>/moved_blocks_foreground
-/sys/fs/f2fs/<disk>/moved_blocks_background
-/sys/fs/f2fs/<disk>/avg_vblocks

Signed-off-by: Hridya Valsaraju <hridya@google.com>
[Jaegeuk Kim: allow STAT_FS without DEBUG_FS]
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  47 ++++++++
 fs/f2fs/Kconfig                         |   2 +-
 fs/f2fs/debug.c                         |  79 ++++++++------
 fs/f2fs/f2fs.h                          |   9 +-
 fs/f2fs/gc.c                            |   2 +-
 fs/f2fs/sysfs.c                         | 139 ++++++++++++++++++------
 6 files changed, 204 insertions(+), 74 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 7cdaed02981a..1a6cd5397129 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -271,3 +271,50 @@ Date		July 2019
 Contact:	"Daniel Rosenberg" <drosen@google.com>
 Description:	Displays name and version of the encoding set for the filesystem.
 		If no encoding is set, displays (none)
+
+What:		/sys/fs/f2fs/<disk>/free_segments
+Date:		September 2019
+Contact:	"Hridya Valsaraju" <hridya@google.com>
+Description:	Number of free segments in disk.
+
+What:		/sys/fs/f2fs/<disk>/cp_foreground_calls
+Date:		September 2019
+Contact:	"Hridya Valsaraju" <hridya@google.com>
+Description:	Number of checkpoint operations performed on demand. Available when
+		CONFIG_F2FS_STAT_FS=y.
+
+What:		/sys/fs/f2fs/<disk>/cp_background_calls
+Date:		September 2019
+Contact:	"Hridya Valsaraju" <hridya@google.com>
+Description:	Number of checkpoint operations performed in the background to
+		free segments. Available when CONFIG_F2FS_STAT_FS=y.
+
+What:		/sys/fs/f2fs/<disk>/gc_foreground_calls
+Date:		September 2019
+Contact:	"Hridya Valsaraju" <hridya@google.com>
+Description:	Number of garbage collection operations performed on demand.
+		Available when CONFIG_F2FS_STAT_FS=y.
+
+What:		/sys/fs/f2fs/<disk>/gc_background_calls
+Date:		September 2019
+Contact:	"Hridya Valsaraju" <hridya@google.com>
+Description:	Number of garbage collection operations triggered in background.
+		Available when CONFIG_F2FS_STAT_FS=y.
+
+What:		/sys/fs/f2fs/<disk>/moved_blocks_foreground
+Date:		September 2019
+Contact:	"Hridya Valsaraju" <hridya@google.com>
+Description:	Number of blocks moved by garbage collection in foreground.
+		Available when CONFIG_F2FS_STAT_FS=y.
+
+What:		/sys/fs/f2fs/<disk>/moved_blocks_background
+Date:		September 2019
+Contact:	"Hridya Valsaraju" <hridya@google.com>
+Description:	Number of blocks moved by garbage collection in background.
+		Available when CONFIG_F2FS_STAT_FS=y.
+
+What:		/sys/fs/f2fs/<disk>/avg_vblocks
+Date:		September 2019
+Contact:	"Hridya Valsaraju" <hridya@google.com>
+Description:	Average number of valid blocks.
+		Available when CONFIG_F2FS_STAT_FS=y.
diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index a96095d60d67..9c0cae062498 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -21,7 +21,7 @@ config F2FS_FS
 
 config F2FS_STAT_FS
 	bool "F2FS Status Information"
-	depends on F2FS_FS && DEBUG_FS
+	depends on F2FS_FS
 	default y
 	help
 	  /sys/kernel/debug/f2fs/ contains information about all the partitions
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index ce2936554ef8..6b89eae5e4ca 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -21,9 +21,45 @@
 #include "gc.h"
 
 static LIST_HEAD(f2fs_stat_list);
-static struct dentry *f2fs_debugfs_root;
 static DEFINE_MUTEX(f2fs_stat_mutex);
+#ifdef CONFIG_DEBUG_FS
+static struct dentry *f2fs_debugfs_root;
+#endif
+
+/*
+ * This function calculates BDF of every segments
+ */
+void f2fs_update_sit_info(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_stat_info *si = F2FS_STAT(sbi);
+	unsigned long long blks_per_sec, hblks_per_sec, total_vblocks;
+	unsigned long long bimodal, dist;
+	unsigned int segno, vblocks;
+	int ndirty = 0;
+
+	bimodal = 0;
+	total_vblocks = 0;
+	blks_per_sec = BLKS_PER_SEC(sbi);
+	hblks_per_sec = blks_per_sec / 2;
+	for (segno = 0; segno < MAIN_SEGS(sbi); segno += sbi->segs_per_sec) {
+		vblocks = get_valid_blocks(sbi, segno, true);
+		dist = abs(vblocks - hblks_per_sec);
+		bimodal += dist * dist;
+
+		if (vblocks > 0 && vblocks < blks_per_sec) {
+			total_vblocks += vblocks;
+			ndirty++;
+		}
+	}
+	dist = div_u64(MAIN_SECS(sbi) * hblks_per_sec * hblks_per_sec, 100);
+	si->bimodal = div64_u64(bimodal, dist);
+	if (si->dirty_count)
+		si->avg_vblocks = div_u64(total_vblocks, ndirty);
+	else
+		si->avg_vblocks = 0;
+}
 
+#ifdef CONFIG_DEBUG_FS
 static void update_general_status(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_stat_info *si = F2FS_STAT(sbi);
@@ -116,7 +152,6 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 	si->free_nids = NM_I(sbi)->nid_cnt[FREE_NID];
 	si->avail_nids = NM_I(sbi)->available_nids;
 	si->alloc_nids = NM_I(sbi)->nid_cnt[PREALLOC_NID];
-	si->bg_gc = sbi->bg_gc;
 	si->io_skip_bggc = sbi->io_skip_bggc;
 	si->other_skip_bggc = sbi->other_skip_bggc;
 	si->skipped_atomic_files[BG_GC] = sbi->skipped_atomic_files[BG_GC];
@@ -147,39 +182,6 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 	si->inplace_count = atomic_read(&sbi->inplace_count);
 }
 
-/*
- * This function calculates BDF of every segments
- */
-static void update_sit_info(struct f2fs_sb_info *sbi)
-{
-	struct f2fs_stat_info *si = F2FS_STAT(sbi);
-	unsigned long long blks_per_sec, hblks_per_sec, total_vblocks;
-	unsigned long long bimodal, dist;
-	unsigned int segno, vblocks;
-	int ndirty = 0;
-
-	bimodal = 0;
-	total_vblocks = 0;
-	blks_per_sec = BLKS_PER_SEC(sbi);
-	hblks_per_sec = blks_per_sec / 2;
-	for (segno = 0; segno < MAIN_SEGS(sbi); segno += sbi->segs_per_sec) {
-		vblocks = get_valid_blocks(sbi, segno, true);
-		dist = abs(vblocks - hblks_per_sec);
-		bimodal += dist * dist;
-
-		if (vblocks > 0 && vblocks < blks_per_sec) {
-			total_vblocks += vblocks;
-			ndirty++;
-		}
-	}
-	dist = div_u64(MAIN_SECS(sbi) * hblks_per_sec * hblks_per_sec, 100);
-	si->bimodal = div64_u64(bimodal, dist);
-	if (si->dirty_count)
-		si->avg_vblocks = div_u64(total_vblocks, ndirty);
-	else
-		si->avg_vblocks = 0;
-}
-
 /*
  * This function calculates memory footprint.
  */
@@ -445,7 +447,7 @@ static int stat_show(struct seq_file *s, void *v)
 			   si->block_count[LFS], si->segment_count[LFS]);
 
 		/* segment usage info */
-		update_sit_info(si->sbi);
+		f2fs_update_sit_info(si->sbi);
 		seq_printf(s, "\nBDF: %u, avg. vblocks: %u\n",
 			   si->bimodal, si->avg_vblocks);
 
@@ -465,6 +467,7 @@ static int stat_show(struct seq_file *s, void *v)
 }
 
 DEFINE_SHOW_ATTRIBUTE(stat);
+#endif
 
 int f2fs_build_stats(struct f2fs_sb_info *sbi)
 {
@@ -525,14 +528,18 @@ void f2fs_destroy_stats(struct f2fs_sb_info *sbi)
 
 void __init f2fs_create_root_stats(void)
 {
+#ifdef CONFIG_DEBUG_FS
 	f2fs_debugfs_root = debugfs_create_dir("f2fs", NULL);
 
 	debugfs_create_file("status", S_IRUGO, f2fs_debugfs_root, NULL,
 			    &stat_fops);
+#endif
 }
 
 void f2fs_destroy_root_stats(void)
 {
+#ifdef CONFIG_DEBUG_FS
 	debugfs_remove_recursive(f2fs_debugfs_root);
 	f2fs_debugfs_root = NULL;
+#endif
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 61d62cd06449..5355be6b6755 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1435,7 +1435,6 @@ struct f2fs_sb_info {
 	atomic_t vw_cnt;			/* # of volatile writes */
 	atomic_t max_aw_cnt;			/* max # of atomic writes */
 	atomic_t max_vw_cnt;			/* max # of volatile writes */
-	int bg_gc;				/* background gc calls */
 	unsigned int io_skip_bggc;		/* skip background gc for in-flight IO */
 	unsigned int other_skip_bggc;		/* skip background gc for other reasons */
 	unsigned int ndirty_inode[NR_INODE_TYPE];	/* # of dirty inodes */
@@ -3460,7 +3459,7 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
 #define stat_inc_cp_count(si)		((si)->cp_count++)
 #define stat_inc_bg_cp_count(si)	((si)->bg_cp_count++)
 #define stat_inc_call_count(si)		((si)->call_count++)
-#define stat_inc_bggc_count(sbi)	((sbi)->bg_gc++)
+#define stat_inc_bggc_count(si)		((si)->bg_gc++)
 #define stat_io_skip_bggc_count(sbi)	((sbi)->io_skip_bggc++)
 #define stat_other_skip_bggc_count(sbi)	((sbi)->other_skip_bggc++)
 #define stat_inc_dirty_inode(sbi, type)	((sbi)->ndirty_inode[type]++)
@@ -3584,6 +3583,7 @@ int f2fs_build_stats(struct f2fs_sb_info *sbi);
 void f2fs_destroy_stats(struct f2fs_sb_info *sbi);
 void __init f2fs_create_root_stats(void);
 void f2fs_destroy_root_stats(void);
+void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
 #else
 #define stat_inc_cp_count(si)				do { } while (0)
 #define stat_inc_bg_cp_count(si)			do { } while (0)
@@ -3593,8 +3593,8 @@ void f2fs_destroy_root_stats(void);
 #define stat_other_skip_bggc_count(sbi)			do { } while (0)
 #define stat_inc_dirty_inode(sbi, type)			do { } while (0)
 #define stat_dec_dirty_inode(sbi, type)			do { } while (0)
-#define stat_inc_total_hit(sb)				do { } while (0)
-#define stat_inc_rbtree_node_hit(sb)			do { } while (0)
+#define stat_inc_total_hit(sbi)				do { } while (0)
+#define stat_inc_rbtree_node_hit(sbi)			do { } while (0)
 #define stat_inc_largest_node_hit(sbi)			do { } while (0)
 #define stat_inc_cached_node_hit(sbi)			do { } while (0)
 #define stat_inc_inline_xattr(inode)			do { } while (0)
@@ -3626,6 +3626,7 @@ static inline int f2fs_build_stats(struct f2fs_sb_info *sbi) { return 0; }
 static inline void f2fs_destroy_stats(struct f2fs_sb_info *sbi) { }
 static inline void __init f2fs_create_root_stats(void) { }
 static inline void f2fs_destroy_root_stats(void) { }
+static inline void update_sit_info(struct f2fs_sb_info *sbi) {}
 #endif
 
 extern const struct file_operations f2fs_dir_operations;
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 67eca7c2d983..db8725d473b5 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -99,7 +99,7 @@ static int gc_thread_func(void *data)
 		else
 			increase_sleep_time(gc_th, &wait_ms);
 do_gc:
-		stat_inc_bggc_count(sbi);
+		stat_inc_bggc_count(sbi->stat_info);
 
 		/* if return value is not zero, no victim was selected */
 		if (f2fs_gc(sbi, test_opt(sbi, FORCE_FG_GC), true, NULL_SEGNO))
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 5152a7487335..91d649790b1b 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -25,6 +25,9 @@ enum {
 	DCC_INFO,	/* struct discard_cmd_control */
 	NM_INFO,	/* struct f2fs_nm_info */
 	F2FS_SBI,	/* struct f2fs_sb_info */
+#ifdef CONFIG_F2FS_STAT_FS
+	STAT_INFO,      /* struct f2fs_stat_info */
+#endif
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 	FAULT_INFO_RATE,	/* struct f2fs_fault_info */
 	FAULT_INFO_TYPE,	/* struct f2fs_fault_info */
@@ -42,6 +45,9 @@ struct f2fs_attr {
 	int id;
 };
 
+static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
+			     struct f2fs_sb_info *sbi, char *buf);
+
 static unsigned char *__struct_ptr(struct f2fs_sb_info *sbi, int struct_type)
 {
 	if (struct_type == GC_THREAD)
@@ -58,6 +64,10 @@ static unsigned char *__struct_ptr(struct f2fs_sb_info *sbi, int struct_type)
 	else if (struct_type == FAULT_INFO_RATE ||
 					struct_type == FAULT_INFO_TYPE)
 		return (unsigned char *)&F2FS_OPTION(sbi).fault_info;
+#endif
+#ifdef CONFIG_F2FS_STAT_FS
+	else if (struct_type == STAT_INFO)
+		return (unsigned char *)F2FS_STAT(sbi);
 #endif
 	return NULL;
 }
@@ -65,35 +75,15 @@ static unsigned char *__struct_ptr(struct f2fs_sb_info *sbi, int struct_type)
 static ssize_t dirty_segments_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%llu\n",
-		(unsigned long long)(dirty_segments(sbi)));
+	return sprintf(buf, "%llu\n",
+			(unsigned long long)(dirty_segments(sbi)));
 }
 
-static ssize_t unusable_show(struct f2fs_attr *a,
+static ssize_t free_segments_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
-	block_t unusable;
-
-	if (test_opt(sbi, DISABLE_CHECKPOINT))
-		unusable = sbi->unusable_block_count;
-	else
-		unusable = f2fs_get_unusable_blocks(sbi);
-	return snprintf(buf, PAGE_SIZE, "%llu\n",
-		(unsigned long long)unusable);
-}
-
-static ssize_t encoding_show(struct f2fs_attr *a,
-		struct f2fs_sb_info *sbi, char *buf)
-{
-#ifdef CONFIG_UNICODE
-	if (f2fs_sb_has_casefold(sbi))
-		return snprintf(buf, PAGE_SIZE, "%s (%d.%d.%d)\n",
-			sbi->s_encoding->charset,
-			(sbi->s_encoding->version >> 16) & 0xff,
-			(sbi->s_encoding->version >> 8) & 0xff,
-			sbi->s_encoding->version & 0xff);
-#endif
-	return snprintf(buf, PAGE_SIZE, "(none)");
+	return sprintf(buf, "%llu\n",
+			(unsigned long long)(free_segments(sbi)));
 }
 
 static ssize_t lifetime_write_kbytes_show(struct f2fs_attr *a,
@@ -102,10 +92,10 @@ static ssize_t lifetime_write_kbytes_show(struct f2fs_attr *a,
 	struct super_block *sb = sbi->sb;
 
 	if (!sb->s_bdev->bd_part)
-		return snprintf(buf, PAGE_SIZE, "0\n");
+		return sprintf(buf, "0\n");
 
-	return snprintf(buf, PAGE_SIZE, "%llu\n",
-		(unsigned long long)(sbi->kbytes_written +
+	return sprintf(buf, "%llu\n",
+			(unsigned long long)(sbi->kbytes_written +
 			BD_PART_WRITTEN(sbi)));
 }
 
@@ -116,7 +106,7 @@ static ssize_t features_show(struct f2fs_attr *a,
 	int len = 0;
 
 	if (!sb->s_bdev->bd_part)
-		return snprintf(buf, PAGE_SIZE, "0\n");
+		return sprintf(buf, "0\n");
 
 	if (f2fs_sb_has_encrypt(sbi))
 		len += snprintf(buf, PAGE_SIZE - len, "%s",
@@ -166,9 +156,66 @@ static ssize_t features_show(struct f2fs_attr *a,
 static ssize_t current_reserved_blocks_show(struct f2fs_attr *a,
 					struct f2fs_sb_info *sbi, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%u\n", sbi->current_reserved_blocks);
+	return sprintf(buf, "%u\n", sbi->current_reserved_blocks);
+}
+
+static ssize_t unusable_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	block_t unusable;
+
+	if (test_opt(sbi, DISABLE_CHECKPOINT))
+		unusable = sbi->unusable_block_count;
+	else
+		unusable = f2fs_get_unusable_blocks(sbi);
+	return sprintf(buf, "%llu\n", (unsigned long long)unusable);
 }
 
+static ssize_t encoding_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+#ifdef CONFIG_UNICODE
+	if (f2fs_sb_has_casefold(sbi))
+		return snprintf(buf, PAGE_SIZE, "%s (%d.%d.%d)\n",
+			sbi->s_encoding->charset,
+			(sbi->s_encoding->version >> 16) & 0xff,
+			(sbi->s_encoding->version >> 8) & 0xff,
+			sbi->s_encoding->version & 0xff);
+#endif
+	return sprintf(buf, "(none)");
+}
+
+#ifdef CONFIG_F2FS_STAT_FS
+static ssize_t moved_blocks_foreground_show(struct f2fs_attr *a,
+				struct f2fs_sb_info *sbi, char *buf)
+{
+	struct f2fs_stat_info *si = F2FS_STAT(sbi);
+
+	return sprintf(buf, "%llu\n",
+		(unsigned long long)(si->tot_blks -
+			(si->bg_data_blks + si->bg_node_blks)));
+}
+
+static ssize_t moved_blocks_background_show(struct f2fs_attr *a,
+				struct f2fs_sb_info *sbi, char *buf)
+{
+	struct f2fs_stat_info *si = F2FS_STAT(sbi);
+
+	return sprintf(buf, "%llu\n",
+		(unsigned long long)(si->bg_data_blks + si->bg_node_blks));
+}
+
+static ssize_t avg_vblocks_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	struct f2fs_stat_info *si = F2FS_STAT(sbi);
+
+	si->dirty_count = dirty_segments(sbi);
+	f2fs_update_sit_info(sbi);
+	return sprintf(buf, "%llu\n", (unsigned long long)(si->avg_vblocks));
+}
+#endif
+
 static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
 			struct f2fs_sb_info *sbi, char *buf)
 {
@@ -202,7 +249,7 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
 
 	ui = (unsigned int *)(ptr + a->offset);
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", *ui);
+	return sprintf(buf, "%u\n", *ui);
 }
 
 static ssize_t __sbi_store(struct f2fs_attr *a,
@@ -413,7 +460,7 @@ static ssize_t f2fs_feature_show(struct f2fs_attr *a,
 	case FEAT_SB_CHECKSUM:
 	case FEAT_CASEFOLD:
 	case FEAT_COMPRESSION:
-		return snprintf(buf, PAGE_SIZE, "supported\n");
+		return sprintf(buf, "supported\n");
 	}
 	return 0;
 }
@@ -442,6 +489,14 @@ static struct f2fs_attr f2fs_attr_##_name = {			\
 	.id	= _id,						\
 }
 
+#define F2FS_STAT_ATTR(_struct_type, _struct_name, _name, _elname)	\
+static struct f2fs_attr f2fs_attr_##_name = {			\
+	.attr = {.name = __stringify(_name), .mode = 0444 },	\
+	.show = f2fs_sbi_show,					\
+	.struct_type = _struct_type,				\
+	.offset = offsetof(struct _struct_name, _elname),       \
+}
+
 F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_urgent_sleep_time,
 							urgent_sleep_time);
 F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_min_sleep_time, min_sleep_time);
@@ -483,11 +538,21 @@ F2FS_RW_ATTR(FAULT_INFO_RATE, f2fs_fault_info, inject_rate, inject_rate);
 F2FS_RW_ATTR(FAULT_INFO_TYPE, f2fs_fault_info, inject_type, inject_type);
 #endif
 F2FS_GENERAL_RO_ATTR(dirty_segments);
+F2FS_GENERAL_RO_ATTR(free_segments);
 F2FS_GENERAL_RO_ATTR(lifetime_write_kbytes);
 F2FS_GENERAL_RO_ATTR(features);
 F2FS_GENERAL_RO_ATTR(current_reserved_blocks);
 F2FS_GENERAL_RO_ATTR(unusable);
 F2FS_GENERAL_RO_ATTR(encoding);
+#ifdef CONFIG_F2FS_STAT_FS
+F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_foreground_calls, cp_count);
+F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_background_calls, bg_cp_count);
+F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, gc_foreground_calls, call_count);
+F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, gc_background_calls, bg_gc);
+F2FS_GENERAL_RO_ATTR(moved_blocks_background);
+F2FS_GENERAL_RO_ATTR(moved_blocks_foreground);
+F2FS_GENERAL_RO_ATTR(avg_vblocks);
+#endif
 
 #ifdef CONFIG_FS_ENCRYPTION
 F2FS_FEATURE_RO_ATTR(encryption, FEAT_CRYPTO);
@@ -549,12 +614,22 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(inject_type),
 #endif
 	ATTR_LIST(dirty_segments),
+	ATTR_LIST(free_segments),
 	ATTR_LIST(unusable),
 	ATTR_LIST(lifetime_write_kbytes),
 	ATTR_LIST(features),
 	ATTR_LIST(reserved_blocks),
 	ATTR_LIST(current_reserved_blocks),
 	ATTR_LIST(encoding),
+#ifdef CONFIG_F2FS_STAT_FS
+	ATTR_LIST(cp_foreground_calls),
+	ATTR_LIST(cp_background_calls),
+	ATTR_LIST(gc_foreground_calls),
+	ATTR_LIST(gc_background_calls),
+	ATTR_LIST(moved_blocks_foreground),
+	ATTR_LIST(moved_blocks_background),
+	ATTR_LIST(avg_vblocks),
+#endif
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
-- 
2.24.0.525.g8f36a354ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
