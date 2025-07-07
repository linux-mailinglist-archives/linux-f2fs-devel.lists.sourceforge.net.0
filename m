Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A09AAFB284
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Jul 2025 13:46:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aO3hgbIapWzuaC+23lXiURb9BHoSAh4JbvPOhX3229M=; b=Lfl/mzS0i8bzpyW/NMBP1WUfrD
	X9P0ngv1UDPHa7CppLX1IOBRGe/yOE5tbS+d13Zd10OBYqHKmroYVX5mGLGtP4OGBRbr6M48bRiKY
	hB0ONuDIYqzptLHo997gsNY1ixzgmwogrikePU7Y5VzEL2UnvemthWidz6FQGjUtJonU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uYkIm-0007Uo-Rg;
	Mon, 07 Jul 2025 11:46:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uYkIl-0007Ui-3S
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Jul 2025 11:46:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LL7o5PXloUqZt0vwSmKftFKib1xfQ2/jF5QPDFltWCs=; b=cAdY2wVRsxGsK7+C05Uz4iyEXs
 qBrnprnQvysyYCbkkMOuXkB/IPphOga8+03yNqS6q9TjQ9qlQTbiOxv4IaeiQFKJMkP/ZLQ9nwaS2
 RVcGRNrOO5NYmzp5rpb8q9NZbrTqXLWYN4QYc2y9unWv5K75GL/q1YgI0ge6lL62XN8o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LL7o5PXloUqZt0vwSmKftFKib1xfQ2/jF5QPDFltWCs=; b=W
 tx35d7obyiU5hmTjshZ7IpjA0nxTr2v1EJzQLzbcXyssWJeDUu9qtLOZWg/uxyQ5alwV6FWjpzeID
 EQt+Tb0BATF1gVYxJqritTnBXA231L3zMyYk15i4/kT78wDxkGrnQJcl8G9zuvi1ICl3ZgAw8BEGk
 tVvgXNMlomM5qwrU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uYkIk-0005OQ-FD for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Jul 2025 11:46:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2787346363
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  7 Jul 2025 11:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D381BC4CEE3;
 Mon,  7 Jul 2025 11:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751888781;
 bh=vSpdhkUn9gPJJ6V9ECMgBURaaWe4k/H2/r+sHlnGl9E=;
 h=From:To:Cc:Subject:Date:From;
 b=trF6yRzLhzsOzkC6KU3yDfzydSNyi6XBGAgdo1gqGKGtqbdjYBVmO+Gso/tTi1q7p
 mdTF5j/OEnI5ZInf9sOG9+ea1dkb01MM4Tx9CG2XJREWVn9gYqH+ut5UGnfPiDQY3A
 FCFbkcZeez7P9s7yMR2R1jLl3TvYuNXTqPvzLrbY7v1Jzg1chGvjy/jZUL9TRM+FNF
 PDrRaZmekzrWqQGLkATlpoZQDhfSWGu/PR84j3yKfAlBm4DjANSxQ5NzT0ymr53L7c
 i2e1vi5kAdbn2E6bB/9egeUgQsNAifd64sNUDG00NJ8XbZgqhOCQBMNh3sKHe4G14R
 0c6XkTdVNycmg==
To: jaegeuk@kernel.org
Date: Mon,  7 Jul 2025 19:46:14 +0800
Message-ID: <20250707114614.2769306-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  There are redundant codes in IS_CUR{SEG, SEC}() macros, let's
 introduce inline is_cur{seg, sec}() functions,
 and use a loop in it for cleanup.
 Meanwhile, it enhances expansibility, as it doesn't need to change is_cur{seg,
 sec}() when we add a new log header. 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uYkIk-0005OQ-FD
Subject: [f2fs-dev] [PATCH] f2fs: introduce is_cur{seg,sec}()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There are redundant codes in IS_CUR{SEG,SEC}() macros, let's introduce
inline is_cur{seg,sec}() functions, and use a loop in it for cleanup.

Meanwhile, it enhances expansibility, as it doesn't need to change
is_cur{seg,sec}() when we add a new log header.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/debug.c   |  4 ++--
 fs/f2fs/gc.c      |  2 +-
 fs/f2fs/segment.c | 22 +++++++++----------
 fs/f2fs/segment.h | 54 +++++++++++++++++++++--------------------------
 4 files changed, 38 insertions(+), 44 deletions(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 3417e7e550b2..43a83bbd3bc5 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -91,7 +91,7 @@ static void update_multidevice_stats(struct f2fs_sb_info *sbi)
 			seg_blks = get_seg_entry(sbi, j)->valid_blocks;
 
 			/* update segment stats */
-			if (IS_CURSEG(sbi, j))
+			if (is_curseg(sbi, j))
 				dev_stats[i].devstats[0][DEVSTAT_INUSE]++;
 			else if (seg_blks == BLKS_PER_SEG(sbi))
 				dev_stats[i].devstats[0][DEVSTAT_FULL]++;
@@ -109,7 +109,7 @@ static void update_multidevice_stats(struct f2fs_sb_info *sbi)
 			sec_blks = get_sec_entry(sbi, j)->valid_blocks;
 
 			/* update section stats */
-			if (IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, j)))
+			if (is_cursec(sbi, GET_SEC_FROM_SEG(sbi, j)))
 				dev_stats[i].devstats[1][DEVSTAT_INUSE]++;
 			else if (sec_blks == BLKS_PER_SEC(sbi))
 				dev_stats[i].devstats[1][DEVSTAT_FULL]++;
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 30b95ebb4499..778f9ec40b70 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -2065,7 +2065,7 @@ int f2fs_gc_range(struct f2fs_sb_info *sbi,
 			.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
 		};
 
-		if (IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, segno)))
+		if (is_cursec(sbi, GET_SEC_FROM_SEG(sbi, segno)))
 			continue;
 
 		do_garbage_collect(sbi, segno, &gc_list, FG_GC, true, false);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index b89bdb867508..5dd6eb8ccaae 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -773,7 +773,7 @@ static void __locate_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
 	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
 
 	/* need not be added */
-	if (IS_CURSEG(sbi, segno))
+	if (is_curseg(sbi, segno))
 		return;
 
 	if (!test_and_set_bit(segno, dirty_i->dirty_segmap[dirty_type]))
@@ -800,7 +800,7 @@ static void __locate_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
 				!valid_blocks) ||
 				valid_blocks == CAP_BLKS_PER_SEC(sbi));
 
-			if (!IS_CURSEC(sbi, secno))
+			if (!is_cursec(sbi, secno))
 				set_bit(secno, dirty_i->dirty_secmap);
 		}
 	}
@@ -839,7 +839,7 @@ static void __remove_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
 				return;
 			}
 
-			if (!IS_CURSEC(sbi, secno))
+			if (!is_cursec(sbi, secno))
 				set_bit(secno, dirty_i->dirty_secmap);
 		}
 	}
@@ -856,7 +856,7 @@ static void locate_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno)
 	unsigned short valid_blocks, ckpt_valid_blocks;
 	unsigned int usable_blocks;
 
-	if (segno == NULL_SEGNO || IS_CURSEG(sbi, segno))
+	if (segno == NULL_SEGNO || is_curseg(sbi, segno))
 		return;
 
 	usable_blocks = f2fs_usable_blks_in_seg(sbi, segno);
@@ -889,7 +889,7 @@ void f2fs_dirty_to_prefree(struct f2fs_sb_info *sbi)
 	for_each_set_bit(segno, dirty_i->dirty_segmap[DIRTY], MAIN_SEGS(sbi)) {
 		if (get_valid_blocks(sbi, segno, false))
 			continue;
-		if (IS_CURSEG(sbi, segno))
+		if (is_curseg(sbi, segno))
 			continue;
 		__locate_dirty_segment(sbi, segno, PRE);
 		__remove_dirty_segment(sbi, segno, DIRTY);
@@ -2108,7 +2108,7 @@ static bool add_discard_addrs(struct f2fs_sb_info *sbi, struct cp_control *cpc,
 	if (!force) {
 		if (!f2fs_realtime_discard_enable(sbi) ||
 			(!se->valid_blocks &&
-				!IS_CURSEG(sbi, cpc->trim_start)) ||
+				!is_curseg(sbi, cpc->trim_start)) ||
 			SM_I(sbi)->dcc_info->nr_discards >=
 				SM_I(sbi)->dcc_info->max_discards)
 			return false;
@@ -2236,7 +2236,7 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 next:
 		secno = GET_SEC_FROM_SEG(sbi, start);
 		start_segno = GET_SEG_FROM_SEC(sbi, secno);
-		if (!IS_CURSEC(sbi, secno) &&
+		if (!is_cursec(sbi, secno) &&
 			!get_valid_blocks(sbi, start, true))
 			f2fs_issue_discard(sbi, START_BLOCK(sbi, start_segno),
 						BLKS_PER_SEC(sbi));
@@ -4107,14 +4107,14 @@ void f2fs_do_replace_block(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 
 	if (!recover_curseg) {
 		/* for recovery flow */
-		if (se->valid_blocks == 0 && !IS_CURSEG(sbi, segno)) {
+		if (se->valid_blocks == 0 && !is_curseg(sbi, segno)) {
 			if (old_blkaddr == NULL_ADDR)
 				type = CURSEG_COLD_DATA;
 			else
 				type = CURSEG_WARM_DATA;
 		}
 	} else {
-		if (IS_CURSEG(sbi, segno)) {
+		if (is_curseg(sbi, segno)) {
 			/* se->type is volatile as SSR allocation */
 			type = __f2fs_get_curseg(sbi, segno);
 			f2fs_bug_on(sbi, type == NO_CHECK_TYPE);
@@ -5150,7 +5150,7 @@ static void init_dirty_segmap(struct f2fs_sb_info *sbi)
 
 		if (!valid_blocks || valid_blocks == CAP_BLKS_PER_SEC(sbi))
 			continue;
-		if (IS_CURSEC(sbi, secno))
+		if (is_cursec(sbi, secno))
 			continue;
 		set_bit(secno, dirty_i->dirty_secmap);
 	}
@@ -5286,7 +5286,7 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
 	 * Get # of valid block of the zone.
 	 */
 	valid_block_cnt = get_valid_blocks(sbi, zone_segno, true);
-	if (IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, zone_segno))) {
+	if (is_cursec(sbi, GET_SEC_FROM_SEG(sbi, zone_segno))) {
 		f2fs_notice(sbi, "Open zones: valid block[0x%x,0x%x] cond[%s]",
 				zone_segno, valid_block_cnt,
 				blk_zone_cond_str(zone->cond));
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index db619fd2f51a..d2c73f641134 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -34,34 +34,6 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
 	f2fs_bug_on(sbi, seg_type >= NR_PERSISTENT_LOG);
 }
 
-#define IS_CURSEG(sbi, seg)						\
-	(((seg) == CURSEG_I(sbi, CURSEG_HOT_DATA)->segno) ||	\
-	 ((seg) == CURSEG_I(sbi, CURSEG_WARM_DATA)->segno) ||	\
-	 ((seg) == CURSEG_I(sbi, CURSEG_COLD_DATA)->segno) ||	\
-	 ((seg) == CURSEG_I(sbi, CURSEG_HOT_NODE)->segno) ||	\
-	 ((seg) == CURSEG_I(sbi, CURSEG_WARM_NODE)->segno) ||	\
-	 ((seg) == CURSEG_I(sbi, CURSEG_COLD_NODE)->segno) ||	\
-	 ((seg) == CURSEG_I(sbi, CURSEG_COLD_DATA_PINNED)->segno) ||	\
-	 ((seg) == CURSEG_I(sbi, CURSEG_ALL_DATA_ATGC)->segno))
-
-#define IS_CURSEC(sbi, secno)						\
-	(((secno) == CURSEG_I(sbi, CURSEG_HOT_DATA)->segno /		\
-	  SEGS_PER_SEC(sbi)) ||	\
-	 ((secno) == CURSEG_I(sbi, CURSEG_WARM_DATA)->segno /		\
-	  SEGS_PER_SEC(sbi)) ||	\
-	 ((secno) == CURSEG_I(sbi, CURSEG_COLD_DATA)->segno /		\
-	  SEGS_PER_SEC(sbi)) ||	\
-	 ((secno) == CURSEG_I(sbi, CURSEG_HOT_NODE)->segno /		\
-	  SEGS_PER_SEC(sbi)) ||	\
-	 ((secno) == CURSEG_I(sbi, CURSEG_WARM_NODE)->segno /		\
-	  SEGS_PER_SEC(sbi)) ||	\
-	 ((secno) == CURSEG_I(sbi, CURSEG_COLD_NODE)->segno /		\
-	  SEGS_PER_SEC(sbi)) ||	\
-	 ((secno) == CURSEG_I(sbi, CURSEG_COLD_DATA_PINNED)->segno /	\
-	  SEGS_PER_SEC(sbi)) ||	\
-	 ((secno) == CURSEG_I(sbi, CURSEG_ALL_DATA_ATGC)->segno /	\
-	  SEGS_PER_SEC(sbi)))
-
 #define MAIN_BLKADDR(sbi)						\
 	(SM_I(sbi) ? SM_I(sbi)->main_blkaddr : 				\
 		le32_to_cpu(F2FS_RAW_SUPER(sbi)->main_blkaddr))
@@ -318,6 +290,28 @@ static inline struct curseg_info *CURSEG_I(struct f2fs_sb_info *sbi, int type)
 	return (struct curseg_info *)(SM_I(sbi)->curseg_array + type);
 }
 
+static inline bool is_curseg(struct f2fs_sb_info *sbi, unsigned int segno)
+{
+	int i;
+
+	for (i = CURSEG_HOT_DATA; i < NO_CHECK_TYPE; i++) {
+		if (segno == CURSEG_I(sbi, i)->segno)
+			return true;
+	}
+	return false;
+}
+
+static inline bool is_cursec(struct f2fs_sb_info *sbi, unsigned int secno)
+{
+	int i;
+
+	for (i = CURSEG_HOT_DATA; i < NO_CHECK_TYPE; i++) {
+		if (secno == GET_SEC_FROM_SEG(sbi, CURSEG_I(sbi, i)->segno))
+			return true;
+	}
+	return false;
+}
+
 static inline struct seg_entry *get_seg_entry(struct f2fs_sb_info *sbi,
 						unsigned int segno)
 {
@@ -509,7 +503,7 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
 
 	free_i->free_segments++;
 
-	if (!inmem && IS_CURSEC(sbi, secno))
+	if (!inmem && is_cursec(sbi, secno))
 		goto unlock_out;
 
 	/* check large section */
@@ -986,7 +980,7 @@ static inline block_t sum_blk_addr(struct f2fs_sb_info *sbi, int base, int type)
 
 static inline bool sec_usage_check(struct f2fs_sb_info *sbi, unsigned int secno)
 {
-	if (IS_CURSEC(sbi, secno) || (sbi->cur_victim_sec == secno))
+	if (is_cursec(sbi, secno) || (sbi->cur_victim_sec == secno))
 		return true;
 	return false;
 }
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
