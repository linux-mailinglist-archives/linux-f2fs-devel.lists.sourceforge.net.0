Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC84469295D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Feb 2023 22:34:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pQb2F-0002gi-Hj;
	Fri, 10 Feb 2023 21:34:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pQb2E-0002gc-1M
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Feb 2023 21:34:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C5RyWcsWWh1pdtR+GZUq+Wfy4616tsluKMfyTjmFGUY=; b=ZRQGImMSiy0fUvsjyzvgR5il6G
 v1hNVUx6eg5GGDCC3Jg+3aBVj/C0Uxqlypz7N4fQA5n+JgV1PdFBAkejJyVNkrBV+H4KfiaHolZJB
 ne6be0c0bJp4ekHFOK5IYBdG9uQSB1f4K01dW4ZjeXD2sqjG3qgEiI++w6q4Pto98FUg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=C5RyWcsWWh1pdtR+GZUq+Wfy4616tsluKMfyTjmFGUY=; b=S
 GnGyvuUC8D+YmWy51S3PHCc7qmS8Tny6aTKxT3efVh5Z4EPNySTyJWEblUVqC17JsqVq5FR5zN1rr
 noDXNsH8KV4Oyrma7reaeSx2nFHYU6BlieZmpoXrLUryQFH7/CoyZFLHijVxtzBck04GTSH05ztQ5
 qvyi1dodnSH3IeG4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pQb2B-0005Fz-Qf for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Feb 2023 21:34:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3656561E9C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 10 Feb 2023 21:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897E5C433EF;
 Fri, 10 Feb 2023 21:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676064854;
 bh=JKgxZT9FfN6ITm5BxjyDn0CJZw60PYnKzaRX+4hhUgY=;
 h=From:To:Cc:Subject:Date:From;
 b=Gn4VNtQ3UtUqJTjlUNyuCDW8+F/siz/O7jr8jaiL/UOH3TUHCnOCgudBPBMHw/4GH
 xcy8NZgUyIv8CKwGj8YHeW2h7118h5mxNvaEKu6XkTlTh3Am/1NNvhtdAkHrKXxvwI
 ZGkNwPHmLDIPTYPfDcyIC565CXE1A3M76O9gwWIowveGcXOSL6fdVJwHyn4fQnrGMD
 1HCoQ7Z5wacNfhz9QqMHyvaiTyzQIb6tm51LaznWZct0OtalOBUB8WFmsS9etij5Wd
 yHiLICtrvxhqgG5FNnzoLr6dbo++xZ9M0+RkXyzt0BLcABLXmEXrI541nkYpGzt8Dy
 /GNpksPXAlXFQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 10 Feb 2023 13:34:13 -0800
Message-Id: <20230210213413.3472621-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: TOTAL_SEGS should include metadata segments and main
 segments.
 Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- fsck/f2fs.h | 2 +-
 fsck/fsck.c
 | 4 ++-- fsck/mount.c | 26 +++++++++++++ fsck/resize.c | 8 ++++---- 4 files
 changed, 20 insertions(+), 2 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pQb2B-0005Fz-Qf
Subject: [f2fs-dev] [PATCH] f2fs-tools: fix # of total segments
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

TOTAL_SEGS should include metadata segments and main segments.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/f2fs.h   |  2 +-
 fsck/fsck.c   |  4 ++--
 fsck/mount.c  | 26 +++++++++++++-------------
 fsck/resize.c |  8 ++++----
 4 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 703f34074ef1..e65644e9ccf3 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -463,6 +463,7 @@ static inline block_t __end_block_addr(struct f2fs_sb_info *sbi)
 #define GET_R2L_SEGNO(sbi, segno)	(segno + FREE_I_START_SEGNO(sbi))
 
 #define MAIN_SEGS(sbi)	(SM_I(sbi)->main_segments)
+#define TOTAL_SEGS(sbi)	(SM_I(sbi)->segment_count)
 #define TOTAL_BLKS(sbi)	(TOTAL_SEGS(sbi) << (sbi)->log_blocks_per_seg)
 #define MAX_BLKADDR(sbi)	(SEG0_BLKADDR(sbi) + TOTAL_BLKS(sbi))
 
@@ -511,7 +512,6 @@ struct fsync_inode_entry {
 	((segno) % sit_i->sents_per_block)
 #define SIT_BLOCK_OFFSET(sit_i, segno)                                  \
 	((segno) / SIT_ENTRY_PER_BLOCK)
-#define TOTAL_SEGS(sbi) (SM_I(sbi)->main_segments)
 
 static inline bool IS_VALID_NID(struct f2fs_sb_info *sbi, u32 nid)
 {
diff --git a/fsck/fsck.c b/fsck/fsck.c
index df91c82bb6d7..1b6f2c20b2b3 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2064,7 +2064,7 @@ int fsck_chk_meta(struct f2fs_sb_info *sbi)
 	unsigned int i;
 
 	/* 1. check sit usage with CP: curseg is lost? */
-	for (i = 0; i < TOTAL_SEGS(sbi); i++) {
+	for (i = 0; i < MAIN_SEGS(sbi); i++) {
 		se = get_seg_entry(sbi, i);
 		if (se->valid_blocks != 0)
 			sit_valid_segs++;
@@ -2607,7 +2607,7 @@ int check_sit_types(struct f2fs_sb_info *sbi)
 	unsigned int i;
 	int err = 0;
 
-	for (i = 0; i < TOTAL_SEGS(sbi); i++) {
+	for (i = 0; i < MAIN_SEGS(sbi); i++) {
 		struct seg_entry *se;
 
 		se = get_seg_entry(sbi, i);
diff --git a/fsck/mount.c b/fsck/mount.c
index 2a87759c6e34..2b26701852b5 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -80,7 +80,7 @@ unsigned int get_usable_seg_count(struct f2fs_sb_info *sbi)
 {
 	unsigned int i, usable_seg_count = 0;
 
-	for (i = 0; i < TOTAL_SEGS(sbi); i++)
+	for (i = 0; i < MAIN_SEGS(sbi); i++)
 		if (is_usable_seg(sbi, i))
 			usable_seg_count++;
 
@@ -96,7 +96,7 @@ bool is_usable_seg(struct f2fs_sb_info *UNUSED(sbi), unsigned int UNUSED(segno))
 
 unsigned int get_usable_seg_count(struct f2fs_sb_info *sbi)
 {
-	return TOTAL_SEGS(sbi);
+	return MAIN_SEGS(sbi);
 }
 
 #endif
@@ -105,7 +105,7 @@ u32 get_free_segments(struct f2fs_sb_info *sbi)
 {
 	u32 i, free_segs = 0;
 
-	for (i = 0; i < TOTAL_SEGS(sbi); i++) {
+	for (i = 0; i < MAIN_SEGS(sbi); i++) {
 		struct seg_entry *se = get_seg_entry(sbi, i);
 
 		if (se->valid_blocks == 0x0 && !IS_CUR_SEGNO(sbi, i) &&
@@ -1789,13 +1789,13 @@ int build_sit_info(struct f2fs_sb_info *sbi)
 
 	SM_I(sbi)->sit_info = sit_i;
 
-	sit_i->sentries = calloc(TOTAL_SEGS(sbi) * sizeof(struct seg_entry), 1);
+	sit_i->sentries = calloc(MAIN_SEGS(sbi) * sizeof(struct seg_entry), 1);
 	if (!sit_i->sentries) {
 		MSG(1, "\tError: Calloc failed for build_sit_info!\n");
 		goto free_sit_info;
 	}
 
-	bitmap_size = TOTAL_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE;
+	bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE;
 
 	if (need_fsync_data_record(sbi))
 		bitmap_size += bitmap_size;
@@ -1808,7 +1808,7 @@ int build_sit_info(struct f2fs_sb_info *sbi)
 
 	bitmap = sit_i->bitmap;
 
-	for (start = 0; start < TOTAL_SEGS(sbi); start++) {
+	for (start = 0; start < MAIN_SEGS(sbi); start++) {
 		sit_i->sentries[start].cur_valid_map = bitmap;
 		bitmap += SIT_VBLOCK_MAP_SIZE;
 
@@ -2060,7 +2060,7 @@ static int build_curseg(struct f2fs_sb_info *sbi)
 			blk_off = get_cp(cur_node_blkoff[i - CURSEG_HOT_NODE]);
 			segno = get_cp(cur_node_segno[i - CURSEG_HOT_NODE]);
 		}
-		ASSERT(segno < TOTAL_SEGS(sbi));
+		ASSERT(segno < MAIN_SEGS(sbi));
 		ASSERT(blk_off < DEFAULT_BLOCKS_PER_SEGMENT);
 
 		array[i].segno = segno;
@@ -2422,7 +2422,7 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 		segno = start_blk * sit_i->sents_per_block;
 		end = (start_blk + readed) * sit_i->sents_per_block;
 
-		for (; segno < end && segno < TOTAL_SEGS(sbi); segno++) {
+		for (; segno < end && segno < MAIN_SEGS(sbi); segno++) {
 			se = &sit_i->sentries[segno];
 
 			get_current_sit_page(sbi, segno, sit_blk);
@@ -2448,7 +2448,7 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 	for (i = 0; i < sits_in_cursum(journal); i++) {
 		segno = le32_to_cpu(segno_in_journal(journal, i));
 
-		if (segno >= TOTAL_SEGS(sbi)) {
+		if (segno >= MAIN_SEGS(sbi)) {
 			MSG(0, "\tError: build_sit_entries: segno(%u) is invalid!!!\n", segno);
 			journal->n_sits = cpu_to_le16(i);
 			c.fix_on = 1;
@@ -2525,7 +2525,7 @@ void build_sit_area_bitmap(struct f2fs_sb_info *sbi)
 
 	ASSERT(fsck->sit_area_bitmap_sz == fsck->main_area_bitmap_sz);
 
-	for (segno = 0; segno < TOTAL_SEGS(sbi); segno++) {
+	for (segno = 0; segno < MAIN_SEGS(sbi); segno++) {
 		se = get_seg_entry(sbi, segno);
 
 		memcpy(ptr, se->cur_valid_map, SIT_VBLOCK_MAP_SIZE);
@@ -2571,7 +2571,7 @@ void rewrite_sit_area_bitmap(struct f2fs_sb_info *sbi)
 
 	ptr = fsck->main_area_bitmap;
 
-	for (segno = 0; segno < TOTAL_SEGS(sbi); segno++) {
+	for (segno = 0; segno < MAIN_SEGS(sbi); segno++) {
 		struct f2fs_sit_entry *sit;
 		struct seg_entry *se;
 		u16 valid_blocks = 0;
@@ -2694,7 +2694,7 @@ void flush_sit_entries(struct f2fs_sb_info *sbi)
 	sit_blk = calloc(BLOCK_SZ, 1);
 	ASSERT(sit_blk);
 	/* update free segments */
-	for (segno = 0; segno < TOTAL_SEGS(sbi); segno++) {
+	for (segno = 0; segno < MAIN_SEGS(sbi); segno++) {
 		struct f2fs_sit_entry *sit;
 		struct seg_entry *se;
 
@@ -3400,7 +3400,7 @@ static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
 	struct f2fs_node *node_blk;
 	block_t blkaddr;
 	unsigned int loop_cnt = 0;
-	unsigned int free_blocks = TOTAL_SEGS(sbi) * sbi->blocks_per_seg -
+	unsigned int free_blocks = MAIN_SEGS(sbi) * sbi->blocks_per_seg -
 						sbi->total_valid_block_count;
 	int err = 0;
 
diff --git a/fsck/resize.c b/fsck/resize.c
index c545dd950743..2fd394154799 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -175,7 +175,7 @@ static void migrate_main(struct f2fs_sb_info *sbi, unsigned int offset)
 
 	ASSERT(raw != NULL);
 
-	for (i = TOTAL_SEGS(sbi) - 1; i >= 0; i--) {
+	for (i = MAIN_SEGS(sbi) - 1; i >= 0; i--) {
 		se = get_seg_entry(sbi, i);
 		if (!se->valid_blocks)
 			continue;
@@ -240,7 +240,7 @@ static void migrate_ssa(struct f2fs_sb_info *sbi,
 	block_t new_sum_blkaddr = get_newsb(ssa_blkaddr);
 	block_t end_sum_blkaddr = get_newsb(main_blkaddr);
 	block_t expand_sum_blkaddr = new_sum_blkaddr +
-					TOTAL_SEGS(sbi) - offset;
+					MAIN_SEGS(sbi) - offset;
 	block_t blkaddr;
 	int ret;
 	void *zero_block = calloc(BLOCK_SZ, 1);
@@ -258,7 +258,7 @@ static void migrate_ssa(struct f2fs_sb_info *sbi,
 		}
 	} else {
 		blkaddr = end_sum_blkaddr - 1;
-		offset = TOTAL_SEGS(sbi) - 1;
+		offset = MAIN_SEGS(sbi) - 1;
 		while (blkaddr >= new_sum_blkaddr) {
 			if (blkaddr >= expand_sum_blkaddr) {
 				ret = dev_write_block(zero_block, blkaddr--);
@@ -412,7 +412,7 @@ static void migrate_sit(struct f2fs_sb_info *sbi,
 		DBG(3, "Write zero sit: %x\n", get_newsb(sit_blkaddr) + index);
 	}
 
-	for (segno = 0; segno < TOTAL_SEGS(sbi); segno++) {
+	for (segno = 0; segno < MAIN_SEGS(sbi); segno++) {
 		struct f2fs_sit_entry *sit;
 
 		se = get_seg_entry(sbi, segno);
-- 
2.39.1.581.gbfd45094c4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
