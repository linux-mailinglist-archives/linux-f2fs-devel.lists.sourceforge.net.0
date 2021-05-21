Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB0638CDD3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 May 2021 21:00:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lkANv-0001YN-FD; Fri, 21 May 2021 19:00:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lkANu-0001YB-HJ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 May 2021 19:00:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=awHUmZffNhJ/CDtQ3ZnC9tDtZiHofmGVY+4p1sI32Ls=; b=PSyH970LBw8FDkjNdvitpP/aiT
 ba8AR+J+vvdqCKAyjSr59drt2NnUzpk+02KkjoN9LnuXCLrvprWKQzrXPY7B/NsYMKI1jSvdGzUe5
 3MQsj9ApLLw24c8ZguUIWS41GKPGg+pGQbJyczFGz5gLPYxgxHuMbV1rO571fwvX0h10=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=awHUmZffNhJ/CDtQ3ZnC9tDtZiHofmGVY+4p1sI32Ls=; b=OEqrawVp+Yr8e0WJL7awszwVEb
 WcpwIFeqjR8cjL0NUjT/GEhZWWFp3qdSe6YDJWNUmQd7WFlaCjBNl6ua3hA/+nmzAf7YSbjnr3iea
 j7RWu/pTPnrP+TSUSOoHXJWttDFgPDmgLBZwcGGJ5z/QpbTfw/38MdG0EEKUuATVpMbE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lkANl-000gJ3-Aa
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 May 2021 19:00:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D420E61261;
 Fri, 21 May 2021 19:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621623618;
 bh=/A9eC2fH5sshm4LJ1mfGuhLfYUxefjgwKRCEYNbo0vY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IMazRa4nL2hhYCGBe9tisqYmfxqu5LwPy/uwdQvHZBdZYkAtNEI1lpQLZyVNH7INu
 +e4xWbD79A0yiuIZsIhHg20RaxpSKNy0Vm8OxxyLSsKP0NFfiC7FIPMMKSDLRmqyen
 GZxENjB4jVeI2UvhrSSi/3+TJhdiHphEEzw8L1QMVZ9hRkmBhD2gazj8THjG8uGpBm
 OUtDbFPpwjoipQpWOjJSeyU96MTZ3T5ULsQcv8Zb/tXMFOq22/274/CSw1TQaBzC+7
 0DF9yTqG16XIhw1In2UjMBD+q+H/zLvcYJ0BRfLD5wDwU1bQQbK4+gGU/JvUf6DAQG
 H3DNiL4WOm5Rg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 21 May 2021 12:00:05 -0700
Message-Id: <20210521190005.2483242-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210521190005.2483242-1-jaegeuk@kernel.org>
References: <20210521190005.2483242-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lkANl-000gJ3-Aa
Subject: [f2fs-dev] [PATCH 2/2] f2fs-tools: support small RO partition
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

This patch adds a readonly feature on small partitions by eliminating
on-disk layout for data writes such as provisioning/reserved space and
SSA.

This requires f2fs updates to understand RO feature in superblock.

Tested 4 cases:
 sload.f2fs -c -a lz0 -f kernel/fs $DEV
 sload.f2fs -c -a lz4 -f kernel/fs $DEV
 sload.f2fs -c -r -a lz4 -f kernel/fs $DEV
 sload.f2fs -c -L 3 -r -a lz4 -f kernel/fs $DEV

after:
 mkfs.f2fs -O ro,compression,extra_attr -f $DEV
 fsck.f2fs $DEV

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/fsck.c        |  22 ++++++++-
 fsck/main.c        |   5 ++
 fsck/mount.c       |  48 ++++++++++++-------
 fsck/node.c        |   5 ++
 fsck/segment.c     |   5 ++
 include/f2fs_fs.h  |   5 +-
 lib/libf2fs_io.c   |   9 ++++
 mkfs/f2fs_format.c | 117 ++++++++++++++++++++++++++++++++-------------
 8 files changed, 163 insertions(+), 53 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 6019775dcb2d..fdc898d03371 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -144,6 +144,7 @@ static int find_and_dec_hard_link_list(struct f2fs_sb_info *sbi, u32 nid)
 static int is_valid_ssa_node_blk(struct f2fs_sb_info *sbi, u32 nid,
 							u32 blk_addr)
 {
+	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	struct f2fs_summary_block *sum_blk;
 	struct f2fs_summary *sum_entry;
 	struct seg_entry * se;
@@ -151,6 +152,9 @@ static int is_valid_ssa_node_blk(struct f2fs_sb_info *sbi, u32 nid,
 	int need_fix = 0, ret = 0;
 	int type;
 
+	if (get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO))
+		return 0;
+
 	segno = GET_SEGNO(sbi, blk_addr);
 	offset = OFFSET_IN_SEG(sbi, blk_addr);
 
@@ -261,6 +265,7 @@ out:
 static int is_valid_ssa_data_blk(struct f2fs_sb_info *sbi, u32 blk_addr,
 		u32 parent_nid, u16 idx_in_node, u8 version)
 {
+	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	struct f2fs_summary_block *sum_blk;
 	struct f2fs_summary *sum_entry;
 	struct seg_entry * se;
@@ -268,6 +273,9 @@ static int is_valid_ssa_data_blk(struct f2fs_sb_info *sbi, u32 blk_addr,
 	int need_fix = 0, ret = 0;
 	int type;
 
+	if (get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO))
+		return 0;
+
 	segno = GET_SEGNO(sbi, blk_addr);
 	offset = OFFSET_IN_SEG(sbi, blk_addr);
 
@@ -2372,10 +2380,14 @@ static int check_curseg_write_pointer(struct f2fs_sb_info *UNUSED(sbi),
 
 int check_curseg_offset(struct f2fs_sb_info *sbi, int type)
 {
+	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
 	struct seg_entry *se;
 	int j, nblocks;
 
+	if (get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO))
+		return 0;
+
 	if ((curseg->next_blkoff >> 3) >= SIT_VBLOCK_MAP_SIZE) {
 		ASSERT_MSG("Next block offset:%u is invalid, type:%d",
 			curseg->next_blkoff, type);
@@ -2958,6 +2970,7 @@ void fsck_chk_and_fix_write_pointers(struct f2fs_sb_info *sbi)
 
 int fsck_chk_curseg_info(struct f2fs_sb_info *sbi)
 {
+	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	struct curseg_info *curseg;
 	struct seg_entry *se;
 	struct f2fs_summary_block *sum_blk;
@@ -2968,6 +2981,10 @@ int fsck_chk_curseg_info(struct f2fs_sb_info *sbi)
 		se = get_seg_entry(sbi, curseg->segno);
 		sum_blk = curseg->sum_blk;
 
+		if ((get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO)) &&
+			(i != CURSEG_HOT_DATA && i != CURSEG_HOT_NODE))
+			continue;
+
 		if (se->type != i) {
 			ASSERT_MSG("Incorrect curseg [%d]: segno [0x%x] "
 				   "type(SIT) [%d]", i, curseg->segno,
@@ -3050,7 +3067,10 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 		}
 		c.bug_on = 1;
 	}
-
+	printf("[FSCK] Max image size: %"PRIu64" MB, Free space: %u MB\n",
+		c.max_size >> 20,
+		(sbi->user_block_count - sbi->total_valid_block_count) >>
+		(20 - F2FS_BLKSIZE_BITS));
 	printf("[FSCK] Unreachable nat entries                       ");
 	if (nr_unref_nid == 0x0) {
 		printf(" [Ok..] [0x%x]\n", nr_unref_nid);
diff --git a/fsck/main.c b/fsck/main.c
index 64efa8789cd4..392a68710566 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -868,6 +868,11 @@ static int do_defrag(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 
+	if (get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO)) {
+		MSG(0, "Not support on readonly image.\n");
+		return -1;
+	}
+
 	if (c.defrag_start > get_sb(block_count))
 		goto out_range;
 	if (c.defrag_start < SM_I(sbi)->main_blkaddr)
diff --git a/fsck/mount.c b/fsck/mount.c
index cc140a346b67..98262702687d 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -561,6 +561,9 @@ void print_sb_state(struct f2fs_super_block *sb)
 	if (f & cpu_to_le32(F2FS_FEATURE_COMPRESSION)) {
 		MSG(0, "%s", " compression");
 	}
+	if (f & cpu_to_le32(F2FS_FEATURE_RO)) {
+		MSG(0, "%s", " ro");
+	}
 	MSG(0, "\n");
 	MSG(0, "Info: superblock encrypt level = %d, salt = ",
 					sb->encryption_level);
@@ -856,9 +859,10 @@ int sanity_check_raw_super(struct f2fs_super_block *sb, enum SB_ADDR sb_addr)
 		return -1;
 	}
 
-	if (total_sections > segment_count ||
+	if (!(get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO)) &&
+			(total_sections > segment_count ||
 			total_sections < F2FS_MIN_SEGMENTS ||
-			segs_per_sec > segment_count || !segs_per_sec) {
+			segs_per_sec > segment_count || !segs_per_sec)) {
 		MSG(0, "\tInvalid segment/section count (%u, %u x %u)\n",
 			segment_count, total_sections, segs_per_sec);
 		return 1;
@@ -1255,8 +1259,9 @@ int sanity_check_ckpt(struct f2fs_sb_info *sbi)
 	ovp_segments = get_cp(overprov_segment_count);
 	reserved_segments = get_cp(rsvd_segment_count);
 
-	if (fsmeta < F2FS_MIN_SEGMENT || ovp_segments == 0 ||
-					reserved_segments == 0) {
+	if (!(get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO)) &&
+		(fsmeta < F2FS_MIN_SEGMENT || ovp_segments == 0 ||
+					reserved_segments == 0)) {
 		MSG(0, "\tWrong layout: check mkfs.f2fs version\n");
 		return 1;
 	}
@@ -1264,7 +1269,7 @@ int sanity_check_ckpt(struct f2fs_sb_info *sbi)
 	user_block_count = get_cp(user_block_count);
 	segment_count_main = get_sb(segment_count_main);
 	log_blocks_per_seg = get_sb(log_blocks_per_seg);
-	if (!user_block_count || user_block_count >=
+	if (!user_block_count || user_block_count >
 			segment_count_main << log_blocks_per_seg) {
 		ASSERT_MSG("\tWrong user_block_count(%u)\n", user_block_count);
 
@@ -1885,11 +1890,15 @@ static void read_normal_summaries(struct f2fs_sb_info *sbi, int type)
 void update_sum_entry(struct f2fs_sb_info *sbi, block_t blk_addr,
 					struct f2fs_summary *sum)
 {
+	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	struct f2fs_summary_block *sum_blk;
 	u32 segno, offset;
 	int type, ret;
 	struct seg_entry *se;
 
+	if (get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO))
+		return;
+
 	segno = GET_SEGNO(sbi, blk_addr);
 	offset = OFFSET_IN_SEG(sbi, blk_addr);
 
@@ -2724,18 +2733,17 @@ int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left,
 		bitmap = get_seg_bitmap(sbi, se);
 		type = get_seg_type(sbi, se);
 
-		if (vblocks == sbi->blocks_per_seg ||
-				IS_CUR_SEGNO(sbi, segno)) {
-			*to = left ? START_BLOCK(sbi, segno) - 1:
-						START_BLOCK(sbi, segno + 1);
-			continue;
-		}
-
-		if (vblocks == 0 && not_enough) {
+		if (vblocks == sbi->blocks_per_seg) {
+next_segment:
 			*to = left ? START_BLOCK(sbi, segno) - 1:
 						START_BLOCK(sbi, segno + 1);
 			continue;
 		}
+		if (!(get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO)) &&
+						IS_CUR_SEGNO(sbi, segno))
+			goto next_segment;
+		if (vblocks == 0 && not_enough)
+			goto next_segment;
 
 		if (vblocks == 0 && !(segno % sbi->segs_per_sec)) {
 			struct seg_entry *se2;
@@ -2766,12 +2774,16 @@ int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left,
 static void move_one_curseg_info(struct f2fs_sb_info *sbi, u64 from, int left,
 				 int i)
 {
+	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	struct curseg_info *curseg = CURSEG_I(sbi, i);
 	struct f2fs_summary_block buf;
 	u32 old_segno;
 	u64 ssa_blk, to;
 	int ret;
 
+	if ((get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO)))
+		return;
+
 	/* update original SSA too */
 	ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
 	ret = dev_write_block(curseg->sum_blk, ssa_blk);
@@ -3015,10 +3027,12 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
 		ret = dev_write_block(curseg->sum_blk, cp_blk_no++);
 		ASSERT(ret >= 0);
 
-		/* update original SSA too */
-		ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
-		ret = dev_write_block(curseg->sum_blk, ssa_blk);
-		ASSERT(ret >= 0);
+		if (!(get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO))) {
+			/* update original SSA too */
+			ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
+			ret = dev_write_block(curseg->sum_blk, ssa_blk);
+			ASSERT(ret >= 0);
+		}
 	}
 
 	/* Write nat bits */
diff --git a/fsck/node.c b/fsck/node.c
index 1d291caa550f..c7988cbbb0df 100644
--- a/fsck/node.c
+++ b/fsck/node.c
@@ -61,6 +61,7 @@ void set_data_blkaddr(struct dnode_of_data *dn)
 block_t new_node_block(struct f2fs_sb_info *sbi,
 				struct dnode_of_data *dn, unsigned int ofs)
 {
+	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	struct f2fs_node *f2fs_inode;
 	struct f2fs_node *node_blk;
 	struct f2fs_checkpoint *ckpt = F2FS_CKPT(sbi);
@@ -89,6 +90,10 @@ block_t new_node_block(struct f2fs_sb_info *sbi,
 			type = CURSEG_WARM_NODE;
 	}
 
+	if ((get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO)) &&
+					type != CURSEG_HOT_NODE)
+		type = CURSEG_HOT_NODE;
+
 	get_node_info(sbi, dn->nid, &ni);
 	set_summary(&sum, dn->nid, 0, ni.version);
 	ret = reserve_new_block(sbi, &blkaddr, &sum, type, !ofs);
diff --git a/fsck/segment.c b/fsck/segment.c
index 365c7f825f76..0b257364fd5b 100644
--- a/fsck/segment.c
+++ b/fsck/segment.c
@@ -104,11 +104,16 @@ int reserve_new_block(struct f2fs_sb_info *sbi, block_t *to,
 int new_data_block(struct f2fs_sb_info *sbi, void *block,
 				struct dnode_of_data *dn, int type)
 {
+	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	struct f2fs_summary sum;
 	struct node_info ni;
 	unsigned int blkaddr = datablock_addr(dn->node_blk, dn->ofs_in_node);
 	int ret;
 
+	if ((get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO)) &&
+					type != CURSEG_HOT_DATA)
+		type = CURSEG_HOT_DATA;
+
 	ASSERT(dn->node_blk);
 	memset(block, 0, BLOCK_SZ);
 
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index cdcce2cd3b85..580aa6846027 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -439,6 +439,7 @@ struct f2fs_configuration {
 	u_int64_t wanted_total_sectors;
 	u_int64_t wanted_sector_size;
 	u_int64_t target_sectors;
+	u_int64_t max_size;
 	u_int32_t sectors_per_blk;
 	u_int32_t blks_per_seg;
 	__u8 init_version[VERSION_LEN + 1];
@@ -696,7 +697,8 @@ enum {
 #define F2FS_FEATURE_VERITY		0x0400	/* reserved */
 #define F2FS_FEATURE_SB_CHKSUM		0x0800
 #define F2FS_FEATURE_CASEFOLD		0x1000
- #define F2FS_FEATURE_COMPRESSION	0x2000
+#define F2FS_FEATURE_COMPRESSION	0x2000
+#define F2FS_FEATURE_RO			0x4000
 
 #define MAX_VOLUME_NAME		512
 
@@ -1546,6 +1548,7 @@ struct feature feature_table[] = {					\
 	{ "sb_checksum",		F2FS_FEATURE_SB_CHKSUM },	\
 	{ "casefold",			F2FS_FEATURE_CASEFOLD },	\
 	{ "compression",		F2FS_FEATURE_COMPRESSION },	\
+	{ "ro",				F2FS_FEATURE_RO},		\
 	{ NULL,				0x0},				\
 };
 
diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index dcedc173a8d9..320ee6c431f0 100644
--- a/lib/libf2fs_io.c
+++ b/lib/libf2fs_io.c
@@ -507,6 +507,9 @@ int dev_read(void *buf, __u64 offset, size_t len)
 	int fd;
 	int err;
 
+	if (c.max_size < (offset + len))
+		c.max_size = offset + len;
+
 	if (c.sparse_mode)
 		return sparse_read_blk(offset / F2FS_BLKSIZE,
 					len / F2FS_BLKSIZE, buf);
@@ -548,6 +551,9 @@ int dev_write(void *buf, __u64 offset, size_t len)
 {
 	int fd;
 
+	if (c.max_size < (offset + len))
+		c.max_size = offset + len;
+
 	if (c.dry_run)
 		return 0;
 
@@ -590,6 +596,9 @@ int dev_fill(void *buf, __u64 offset, size_t len)
 {
 	int fd;
 
+	if (c.max_size < (offset + len))
+		c.max_size = offset + len;
+
 	if (c.sparse_mode)
 		return sparse_write_zeroed_blk(offset / F2FS_BLKSIZE,
 						len / F2FS_BLKSIZE);
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index fbecb05b3302..3565bd3e4bf1 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -212,7 +212,7 @@ static int f2fs_prepare_super_block(void)
 	u_int64_t total_meta_zones, total_meta_segments;
 	u_int32_t sit_bitmap_size, max_sit_bitmap_size;
 	u_int32_t max_nat_bitmap_size, max_nat_segments;
-	u_int32_t total_zones;
+	u_int32_t total_zones, avail_zones;
 	enum quota_type qtype;
 	int i;
 
@@ -250,6 +250,9 @@ static int f2fs_prepare_super_block(void)
 		zone_size_bytes * zone_size_bytes -
 		(u_int64_t) c.start_sector * DEFAULT_SECTOR_SIZE;
 
+	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO))
+		zone_align_start_offset = 8192;
+
 	if (c.start_sector % DEFAULT_SECTORS_PER_BLOCK) {
 		MSG(1, "\t%s: Align start sector number to the page unit\n",
 				c.zoned_mode ? "FAIL" : "WARN");
@@ -400,7 +403,10 @@ static int f2fs_prepare_super_block(void)
 			get_sb(segment_count_nat))) *
 			c.blks_per_seg;
 
-	blocks_for_ssa = total_valid_blks_available /
+	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO))
+		blocks_for_ssa = 0;
+	else
+		blocks_for_ssa = total_valid_blks_available /
 				c.blks_per_seg + 1;
 
 	set_sb(segment_count_ssa, SEG_ALIGN(blocks_for_ssa));
@@ -457,7 +463,13 @@ static int f2fs_prepare_super_block(void)
 			(2 * (100 / c.overprovision + 1) + NR_CURSEG_TYPE) *
 			round_up(f2fs_get_usable_segments(sb), get_sb(section_count));
 
-	if (c.overprovision == 0 || c.total_segments < F2FS_MIN_SEGMENTS ||
+	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO)) {
+		c.overprovision = 0;
+		c.reserved_segments = 0;
+	}
+	if ((!(c.feature & cpu_to_le32(F2FS_FEATURE_RO)) &&
+		c.overprovision == 0) ||
+		c.total_segments < F2FS_MIN_SEGMENTS ||
 		(c.devices[0].total_sectors *
 			c.sector_size < zone_align_start_offset) ||
 		(get_sb(segment_count_main) - NR_CURSEG_TYPE) <
@@ -503,13 +515,25 @@ static int f2fs_prepare_super_block(void)
 	if (c.feature & cpu_to_le32(F2FS_FEATURE_LOST_FOUND))
 		c.lpf_ino = c.next_free_nid++;
 
-	if (total_zones <= 6) {
+	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO))
+		avail_zones = 2;
+	else
+		avail_zones = 6;
+
+	if (total_zones <= avail_zones) {
 		MSG(1, "\tError: %d zones: Need more zones "
 			"by shrinking zone size\n", total_zones);
 		return -1;
 	}
 
-	if (c.heap) {
+	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO)) {
+		c.cur_seg[CURSEG_HOT_NODE] = 0;
+		c.cur_seg[CURSEG_WARM_NODE] = 0;
+		c.cur_seg[CURSEG_COLD_NODE] = 0;
+		c.cur_seg[CURSEG_HOT_DATA] = 1;
+		c.cur_seg[CURSEG_COLD_DATA] = 0;
+		c.cur_seg[CURSEG_WARM_DATA] = 0;
+	} else if (c.heap) {
 		c.cur_seg[CURSEG_HOT_NODE] =
 				last_section(last_zone(total_zones));
 		c.cur_seg[CURSEG_WARM_NODE] = prev_zone(CURSEG_HOT_NODE);
@@ -538,7 +562,8 @@ static int f2fs_prepare_super_block(void)
 	}
 
 	/* if there is redundancy, reassign it */
-	verify_cur_segs();
+	if (!(c.feature & cpu_to_le32(F2FS_FEATURE_RO)))
+		verify_cur_segs();
 
 	cure_extension_list();
 
@@ -731,9 +756,15 @@ static int f2fs_write_check_point_pack(void)
 					c.reserved_segments);
 
 	/* main segments - reserved segments - (node + data segments) */
-	set_cp(free_segment_count, f2fs_get_usable_segments(sb) - 6);
-	set_cp(user_block_count, ((get_cp(free_segment_count) + 6 -
+	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO)) {
+		set_cp(free_segment_count, f2fs_get_usable_segments(sb) - 2);
+		set_cp(user_block_count, ((get_cp(free_segment_count) + 2 -
 			get_cp(overprov_segment_count)) * c.blks_per_seg));
+	} else {
+		set_cp(free_segment_count, f2fs_get_usable_segments(sb) - 6);
+		set_cp(user_block_count, ((get_cp(free_segment_count) + 6 -
+			get_cp(overprov_segment_count)) * c.blks_per_seg));
+	}
 	/* cp page (2), data summaries (1), node summaries (3) */
 	set_cp(cp_pack_total_block_count, 6 + get_sb(cp_payload));
 	flags = CP_UMOUNT_FLAG | CP_COMPACT_SUM_FLAG;
@@ -847,8 +878,13 @@ static int f2fs_write_check_point_pack(void)
 	sum_compact_p += SUM_JOURNAL_SIZE;
 
 	memset(sum, 0, sizeof(struct f2fs_summary_block));
+
 	/* inode sit for root */
-	journal->n_sits = cpu_to_le16(6);
+	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO))
+		journal->n_sits = cpu_to_le16(2);
+	else
+		journal->n_sits = cpu_to_le16(6);
+
 	journal->sit_j.entries[0].segno = cp->cur_node_segno[0];
 	journal->sit_j.entries[0].se.vblocks =
 				cpu_to_le16((CURSEG_HOT_NODE << 10) |
@@ -859,30 +895,43 @@ static int f2fs_write_check_point_pack(void)
 	if (c.lpf_inum)
 		f2fs_set_bit(i, (char *)journal->sit_j.entries[0].se.valid_map);
 
-	journal->sit_j.entries[1].segno = cp->cur_node_segno[1];
-	journal->sit_j.entries[1].se.vblocks =
-				cpu_to_le16((CURSEG_WARM_NODE << 10));
-	journal->sit_j.entries[2].segno = cp->cur_node_segno[2];
-	journal->sit_j.entries[2].se.vblocks =
-				cpu_to_le16((CURSEG_COLD_NODE << 10));
-
-	/* data sit for root */
-	journal->sit_j.entries[3].segno = cp->cur_data_segno[0];
-	journal->sit_j.entries[3].se.vblocks =
-				cpu_to_le16((CURSEG_HOT_DATA << 10) |
-						(1 + c.quota_dnum + c.lpf_dnum));
-	f2fs_set_bit(0, (char *)journal->sit_j.entries[3].se.valid_map);
-	for (i = 1; i <= c.quota_dnum; i++)
-		f2fs_set_bit(i, (char *)journal->sit_j.entries[3].se.valid_map);
-	if (c.lpf_dnum)
-		f2fs_set_bit(i, (char *)journal->sit_j.entries[3].se.valid_map);
-
-	journal->sit_j.entries[4].segno = cp->cur_data_segno[1];
-	journal->sit_j.entries[4].se.vblocks =
-				cpu_to_le16((CURSEG_WARM_DATA << 10));
-	journal->sit_j.entries[5].segno = cp->cur_data_segno[2];
-	journal->sit_j.entries[5].se.vblocks =
-				cpu_to_le16((CURSEG_COLD_DATA << 10));
+	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO)) {
+		/* data sit for root */
+		journal->sit_j.entries[1].segno = cp->cur_data_segno[0];
+		journal->sit_j.entries[1].se.vblocks =
+					cpu_to_le16((CURSEG_HOT_DATA << 10) |
+							(1 + c.quota_dnum + c.lpf_dnum));
+		f2fs_set_bit(0, (char *)journal->sit_j.entries[1].se.valid_map);
+		for (i = 1; i <= c.quota_dnum; i++)
+			f2fs_set_bit(i, (char *)journal->sit_j.entries[1].se.valid_map);
+		if (c.lpf_dnum)
+			f2fs_set_bit(i, (char *)journal->sit_j.entries[1].se.valid_map);
+	} else {
+		journal->sit_j.entries[1].segno = cp->cur_node_segno[1];
+		journal->sit_j.entries[1].se.vblocks =
+					cpu_to_le16((CURSEG_WARM_NODE << 10));
+		journal->sit_j.entries[2].segno = cp->cur_node_segno[2];
+		journal->sit_j.entries[2].se.vblocks =
+					cpu_to_le16((CURSEG_COLD_NODE << 10));
+
+		/* data sit for root */
+		journal->sit_j.entries[3].segno = cp->cur_data_segno[0];
+		journal->sit_j.entries[3].se.vblocks =
+					cpu_to_le16((CURSEG_HOT_DATA << 10) |
+							(1 + c.quota_dnum + c.lpf_dnum));
+		f2fs_set_bit(0, (char *)journal->sit_j.entries[3].se.valid_map);
+		for (i = 1; i <= c.quota_dnum; i++)
+			f2fs_set_bit(i, (char *)journal->sit_j.entries[3].se.valid_map);
+		if (c.lpf_dnum)
+			f2fs_set_bit(i, (char *)journal->sit_j.entries[3].se.valid_map);
+
+		journal->sit_j.entries[4].segno = cp->cur_data_segno[1];
+		journal->sit_j.entries[4].se.vblocks =
+					cpu_to_le16((CURSEG_WARM_DATA << 10));
+		journal->sit_j.entries[5].segno = cp->cur_data_segno[2];
+		journal->sit_j.entries[5].se.vblocks =
+					cpu_to_le16((CURSEG_COLD_DATA << 10));
+	}
 
 	memcpy(sum_compact_p, &journal->n_sits, SUM_JOURNAL_SIZE);
 	sum_compact_p += SUM_JOURNAL_SIZE;
@@ -1090,7 +1139,7 @@ static int f2fs_discard_obsolete_dnode(void)
 	u_int64_t start_inode_pos = get_sb(main_blkaddr);
 	u_int64_t last_inode_pos;
 
-	if (c.zoned_mode)
+	if (c.zoned_mode || c.feature & cpu_to_le32(F2FS_FEATURE_RO))
 		return 0;
 
 	raw_node = calloc(sizeof(struct f2fs_node), 1);
-- 
2.31.1.818.g46aad6cb9e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
