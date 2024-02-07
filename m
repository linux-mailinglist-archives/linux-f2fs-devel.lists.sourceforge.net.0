Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D01C84C18A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Feb 2024 01:52:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rXWAO-0006cH-Js;
	Wed, 07 Feb 2024 00:51:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rXWAM-0006cB-NZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Feb 2024 00:51:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5KzFmWFDpVk/rGhXFHsMldNPzVW7iYYfoCW7NEW1wTA=; b=RUup7II5QQdU+E9gu+3FXLTRbw
 kNDtCBU8fSOPAe3oQYWYr3GZFdMIZTizXWK1sEmbBPE1M2RINVYEisa7E+dw047dQqg57G24sI4xx
 6CD6dcPHG8kdywii9d2ps+urvrT9uL+kj2s0YRFw3Kj7Vipdgof02qh1yp0wk3B7lXkc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5KzFmWFDpVk/rGhXFHsMldNPzVW7iYYfoCW7NEW1wTA=; b=m9BhqrE+lSUeKUtBKeVSkKe7qx
 s6bO38Das9lOnVXrioJa0lHx8yJST2ePaAaPTXm0e5ynTj77qapMcmX3yA5GGfy98E3JtkK+/XKtZ
 eGzRNMKubNuDPT/QUzNuG6VpfBzDW6XpMnsmu2b1hOyv7jISfJTS9JxnzRXSlN8Cjuj4=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rXWAK-0003hI-Q4 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Feb 2024 00:51:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 75BA8CE17A3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  7 Feb 2024 00:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80855C43399;
 Wed,  7 Feb 2024 00:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707267070;
 bh=3roBpLE1kKniym4xk8CnLmPc4JAReI/FrS9w7C5UDH8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oqxmPvUy5ygxhPxuo4v6TEdrLHdnDwlkvIzLJ2Je3QqP8eb1W7SKEbyKXDwxjXXqA
 GDmiDHTiVPj5RlOEFSSOvJxFHizkHZmr/MbQXdzCEisqjSSpJU3MbXGVwkWWgOnuUg
 eypNo/nNGdqYc4BGD9Lj50tdp0Cosusbj59NhiPJ6m9Ep+KHTPkN8DmwwtCXwHkn/W
 rnF000YdGY/g/461oXlaPwxMNdTBMAfjBmaSD6c944aLstyRE2ONqo0sxVn4qhB/lp
 zCXdr6wr+gPFzRRpss4+Yk+PLRGV9HtJauvZ7zMisv14tF8cXxLGZ4HTWK/RBTTKgM
 stERV7p6S1w6A==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  6 Feb 2024 16:51:04 -0800
Message-ID: <20240207005105.3744811-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
In-Reply-To: <20240207005105.3744811-1-jaegeuk@kernel.org>
References: <20240207005105.3744811-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.8 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: No functional change. Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 --- fs/f2fs/checkpoint.c | 10 ++-- fs/f2fs/debug.c | 6 +-- fs/f2fs/f2fs.h
 | 19 +++++--- fs/f2fs/file.c | 12 ++--- fs/f2fs/gc.c | 40 ++++++++--------
 fs/ [...] 
 Content analysis details:   (-2.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rXWAK-0003hI-Q4
Subject: [f2fs-dev] [PATCH 2/3] f2fs: use BLKS_PER_SEG, BLKS_PER_SEC,
 and SEGS_PER_SEC
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

No functional change.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/checkpoint.c |  10 ++--
 fs/f2fs/debug.c      |   6 +--
 fs/f2fs/f2fs.h       |  19 +++++---
 fs/f2fs/file.c       |  12 ++---
 fs/f2fs/gc.c         |  40 ++++++++--------
 fs/f2fs/node.c       |   4 +-
 fs/f2fs/node.h       |   4 +-
 fs/f2fs/recovery.c   |   2 +-
 fs/f2fs/segment.c    | 109 +++++++++++++++++++++----------------------
 fs/f2fs/segment.h    |  18 ++++---
 fs/f2fs/super.c      |   8 ++--
 fs/f2fs/sysfs.c      |   6 +--
 12 files changed, 119 insertions(+), 119 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index b85820e70f5e..a09a9609e228 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -900,7 +900,7 @@ static struct page *validate_checkpoint(struct f2fs_sb_info *sbi,
 
 	cp_blocks = le32_to_cpu(cp_block->cp_pack_total_block_count);
 
-	if (cp_blocks > sbi->blocks_per_seg || cp_blocks <= F2FS_CP_PACKS) {
+	if (cp_blocks > BLKS_PER_SEG(sbi) || cp_blocks <= F2FS_CP_PACKS) {
 		f2fs_warn(sbi, "invalid cp_pack_total_block_count:%u",
 			  le32_to_cpu(cp_block->cp_pack_total_block_count));
 		goto invalid_cp;
@@ -1335,7 +1335,7 @@ static void update_ckpt_flags(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 
 	if (cpc->reason & CP_UMOUNT) {
 		if (le32_to_cpu(ckpt->cp_pack_total_block_count) +
-			NM_I(sbi)->nat_bits_blocks > sbi->blocks_per_seg) {
+			NM_I(sbi)->nat_bits_blocks > BLKS_PER_SEG(sbi)) {
 			clear_ckpt_flags(sbi, CP_NAT_BITS_FLAG);
 			f2fs_notice(sbi, "Disable nat_bits due to no space");
 		} else if (!is_set_ckpt_flags(sbi, CP_NAT_BITS_FLAG) &&
@@ -1538,7 +1538,7 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 		cp_ver |= ((__u64)crc32 << 32);
 		*(__le64 *)nm_i->nat_bits = cpu_to_le64(cp_ver);
 
-		blk = start_blk + sbi->blocks_per_seg - nm_i->nat_bits_blocks;
+		blk = start_blk + BLKS_PER_SEG(sbi) - nm_i->nat_bits_blocks;
 		for (i = 0; i < nm_i->nat_bits_blocks; i++)
 			f2fs_update_meta_page(sbi, nm_i->nat_bits +
 					(i << F2FS_BLKSIZE_BITS), blk + i);
@@ -1741,9 +1741,9 @@ void f2fs_init_ino_entry_info(struct f2fs_sb_info *sbi)
 		im->ino_num = 0;
 	}
 
-	sbi->max_orphans = (sbi->blocks_per_seg - F2FS_CP_PACKS -
+	sbi->max_orphans = (BLKS_PER_SEG(sbi) - F2FS_CP_PACKS -
 			NR_CURSEG_PERSIST_TYPE - __cp_payload(sbi)) *
-				F2FS_ORPHANS_PER_BLOCK;
+			F2FS_ORPHANS_PER_BLOCK;
 }
 
 int __init f2fs_create_checkpoint_caches(void)
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index fdbf994f1271..0d02224b99b7 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -41,7 +41,7 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi)
 	total_vblocks = 0;
 	blks_per_sec = CAP_BLKS_PER_SEC(sbi);
 	hblks_per_sec = blks_per_sec / 2;
-	for (segno = 0; segno < MAIN_SEGS(sbi); segno += sbi->segs_per_sec) {
+	for (segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi)) {
 		vblocks = get_valid_blocks(sbi, segno, true);
 		dist = abs(vblocks - hblks_per_sec);
 		bimodal += dist * dist;
@@ -135,7 +135,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 	si->cur_ckpt_time = sbi->cprc_info.cur_time;
 	si->peak_ckpt_time = sbi->cprc_info.peak_time;
 	spin_unlock(&sbi->cprc_info.stat_lock);
-	si->total_count = (int)sbi->user_block_count / sbi->blocks_per_seg;
+	si->total_count = (int)sbi->user_block_count / BLKS_PER_SEG(sbi);
 	si->rsvd_segs = reserved_segments(sbi);
 	si->overp_segs = overprovision_segments(sbi);
 	si->valid_count = valid_user_blocks(sbi);
@@ -208,7 +208,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 		if (!blks)
 			continue;
 
-		if (blks == sbi->blocks_per_seg)
+		if (blks == BLKS_PER_SEG(sbi))
 			si->full_seg[type]++;
 		else
 			si->dirty_seg[type]++;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4c52136cbc10..9a9e858083af 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1813,6 +1813,14 @@ struct f2fs_sb_info {
 #endif
 };
 
+/* Definitions to access f2fs_sb_info */
+#define BLKS_PER_SEG(sbi)					\
+	((sbi)->blocks_per_seg)
+#define BLKS_PER_SEC(sbi)					\
+	((sbi)->segs_per_sec << (sbi)->log_blocks_per_seg)
+#define SEGS_PER_SEC(sbi)					\
+	((sbi)->segs_per_sec)
+
 __printf(3, 4)
 void f2fs_printk(struct f2fs_sb_info *sbi, bool limit_rate, const char *fmt, ...);
 
@@ -2511,11 +2519,8 @@ static inline int get_dirty_pages(struct inode *inode)
 
 static inline int get_blocktype_secs(struct f2fs_sb_info *sbi, int block_type)
 {
-	unsigned int pages_per_sec = sbi->segs_per_sec * sbi->blocks_per_seg;
-	unsigned int segs = (get_pages(sbi, block_type) + pages_per_sec - 1) >>
-						sbi->log_blocks_per_seg;
-
-	return segs / sbi->segs_per_sec;
+	return (get_pages(sbi, block_type) + BLKS_PER_SEC(sbi) - 1) /
+							BLKS_PER_SEC(sbi);
 }
 
 static inline block_t valid_user_blocks(struct f2fs_sb_info *sbi)
@@ -2579,7 +2584,7 @@ static inline block_t __start_cp_addr(struct f2fs_sb_info *sbi)
 	block_t start_addr = le32_to_cpu(F2FS_RAW_SUPER(sbi)->cp_blkaddr);
 
 	if (sbi->cur_cp_pack == 2)
-		start_addr += sbi->blocks_per_seg;
+		start_addr += BLKS_PER_SEG(sbi);
 	return start_addr;
 }
 
@@ -2588,7 +2593,7 @@ static inline block_t __start_cp_next_addr(struct f2fs_sb_info *sbi)
 	block_t start_addr = le32_to_cpu(F2FS_RAW_SUPER(sbi)->cp_blkaddr);
 
 	if (sbi->cur_cp_pack == 1)
-		start_addr += sbi->blocks_per_seg;
+		start_addr += BLKS_PER_SEG(sbi);
 	return start_addr;
 }
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index c6cd9474ba2d..b0be576b2090 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2580,7 +2580,6 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 					.m_may_create = false };
 	struct extent_info ei = {};
 	pgoff_t pg_start, pg_end, next_pgofs;
-	unsigned int blk_per_seg = sbi->blocks_per_seg;
 	unsigned int total = 0, sec_num;
 	block_t blk_end = 0;
 	bool fragmented = false;
@@ -2689,7 +2688,8 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 		set_inode_flag(inode, FI_SKIP_WRITES);
 
 		idx = map.m_lblk;
-		while (idx < map.m_lblk + map.m_len && cnt < blk_per_seg) {
+		while (idx < map.m_lblk + map.m_len &&
+						cnt < BLKS_PER_SEG(sbi)) {
 			struct page *page;
 
 			page = f2fs_get_lock_data_page(inode, idx, true);
@@ -2709,7 +2709,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 
 		map.m_lblk = idx;
 check:
-		if (map.m_lblk < pg_end && cnt < blk_per_seg)
+		if (map.m_lblk < pg_end && cnt < BLKS_PER_SEG(sbi))
 			goto do_map;
 
 		clear_inode_flag(inode, FI_SKIP_WRITES);
@@ -4081,7 +4081,6 @@ static int f2fs_ioc_decompress_file(struct file *filp)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 	pgoff_t page_idx = 0, last_idx;
-	unsigned int blk_per_seg = sbi->blocks_per_seg;
 	int cluster_size = fi->i_cluster_size;
 	int count, ret;
 
@@ -4125,7 +4124,7 @@ static int f2fs_ioc_decompress_file(struct file *filp)
 		if (ret < 0)
 			break;
 
-		if (get_dirty_pages(inode) >= blk_per_seg) {
+		if (get_dirty_pages(inode) >= BLKS_PER_SEG(sbi)) {
 			ret = filemap_fdatawrite(inode->i_mapping);
 			if (ret < 0)
 				break;
@@ -4160,7 +4159,6 @@ static int f2fs_ioc_compress_file(struct file *filp)
 	struct inode *inode = file_inode(filp);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	pgoff_t page_idx = 0, last_idx;
-	unsigned int blk_per_seg = sbi->blocks_per_seg;
 	int cluster_size = F2FS_I(inode)->i_cluster_size;
 	int count, ret;
 
@@ -4203,7 +4201,7 @@ static int f2fs_ioc_compress_file(struct file *filp)
 		if (ret < 0)
 			break;
 
-		if (get_dirty_pages(inode) >= blk_per_seg) {
+		if (get_dirty_pages(inode) >= BLKS_PER_SEG(sbi)) {
 			ret = filemap_fdatawrite(inode->i_mapping);
 			if (ret < 0)
 				break;
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 6899f434ad68..d61a60c1c844 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -259,7 +259,7 @@ static void select_policy(struct f2fs_sb_info *sbi, int gc_type,
 		p->ofs_unit = 1;
 	} else {
 		p->gc_mode = select_gc_type(sbi, gc_type);
-		p->ofs_unit = sbi->segs_per_sec;
+		p->ofs_unit = SEGS_PER_SEC(sbi);
 		if (__is_large_section(sbi)) {
 			p->dirty_bitmap = dirty_i->dirty_secmap;
 			p->max_search = count_bits(p->dirty_bitmap,
@@ -282,7 +282,8 @@ static void select_policy(struct f2fs_sb_info *sbi, int gc_type,
 
 	/* let's select beginning hot/small space first in no_heap mode*/
 	if (f2fs_need_rand_seg(sbi))
-		p->offset = get_random_u32_below(MAIN_SECS(sbi) * sbi->segs_per_sec);
+		p->offset = get_random_u32_below(MAIN_SECS(sbi) *
+						SEGS_PER_SEC(sbi));
 	else if (test_opt(sbi, NOHEAP) &&
 		(type == CURSEG_HOT_DATA || IS_NODESEG(type)))
 		p->offset = 0;
@@ -295,13 +296,13 @@ static unsigned int get_max_cost(struct f2fs_sb_info *sbi,
 {
 	/* SSR allocates in a segment unit */
 	if (p->alloc_mode == SSR)
-		return sbi->blocks_per_seg;
+		return BLKS_PER_SEG(sbi);
 	else if (p->alloc_mode == AT_SSR)
 		return UINT_MAX;
 
 	/* LFS */
 	if (p->gc_mode == GC_GREEDY)
-		return 2 * sbi->blocks_per_seg * p->ofs_unit;
+		return 2 * BLKS_PER_SEG(sbi) * p->ofs_unit;
 	else if (p->gc_mode == GC_CB)
 		return UINT_MAX;
 	else if (p->gc_mode == GC_AT)
@@ -496,9 +497,9 @@ static void add_victim_entry(struct f2fs_sb_info *sbi,
 			return;
 	}
 
-	for (i = 0; i < sbi->segs_per_sec; i++)
+	for (i = 0; i < SEGS_PER_SEC(sbi); i++)
 		mtime += get_seg_entry(sbi, start + i)->mtime;
-	mtime = div_u64(mtime, sbi->segs_per_sec);
+	mtime = div_u64(mtime, SEGS_PER_SEC(sbi));
 
 	/* Handle if the system time has changed by the user */
 	if (mtime < sit_i->min_mtime)
@@ -599,7 +600,6 @@ static void atssr_lookup_victim(struct f2fs_sb_info *sbi,
 	unsigned long long age;
 	unsigned long long max_mtime = sit_i->dirty_max_mtime;
 	unsigned long long min_mtime = sit_i->dirty_min_mtime;
-	unsigned int seg_blocks = sbi->blocks_per_seg;
 	unsigned int vblocks;
 	unsigned int dirty_threshold = max(am->max_candidate_count,
 					am->candidate_ratio *
@@ -629,7 +629,7 @@ static void atssr_lookup_victim(struct f2fs_sb_info *sbi,
 	f2fs_bug_on(sbi, !vblocks);
 
 	/* rare case */
-	if (vblocks == seg_blocks)
+	if (vblocks == BLKS_PER_SEG(sbi))
 		goto skip_node;
 
 	iter++;
@@ -755,7 +755,7 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 	int ret = 0;
 
 	mutex_lock(&dirty_i->seglist_lock);
-	last_segment = MAIN_SECS(sbi) * sbi->segs_per_sec;
+	last_segment = MAIN_SECS(sbi) * SEGS_PER_SEC(sbi);
 
 	p.alloc_mode = alloc_mode;
 	p.age = age;
@@ -896,7 +896,7 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 			else
 				sm->last_victim[p.gc_mode] = segno + p.ofs_unit;
 			sm->last_victim[p.gc_mode] %=
-				(MAIN_SECS(sbi) * sbi->segs_per_sec);
+				(MAIN_SECS(sbi) * SEGS_PER_SEC(sbi));
 			break;
 		}
 	}
@@ -1670,7 +1670,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 	struct f2fs_summary_block *sum;
 	struct blk_plug plug;
 	unsigned int segno = start_segno;
-	unsigned int end_segno = start_segno + sbi->segs_per_sec;
+	unsigned int end_segno = start_segno + SEGS_PER_SEC(sbi);
 	int seg_freed = 0, migrated = 0;
 	unsigned char type = IS_DATASEG(get_seg_entry(sbi, segno)->type) ?
 						SUM_TYPE_DATA : SUM_TYPE_NODE;
@@ -1678,7 +1678,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 	int submitted = 0;
 
 	if (__is_large_section(sbi))
-		end_segno = rounddown(end_segno, sbi->segs_per_sec);
+		end_segno = rounddown(end_segno, SEGS_PER_SEC(sbi));
 
 	/*
 	 * zone-capacity can be less than zone-size in zoned devices,
@@ -1686,7 +1686,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 	 * calculate the end segno in the zone which can be garbage collected
 	 */
 	if (f2fs_sb_has_blkzoned(sbi))
-		end_segno -= sbi->segs_per_sec -
+		end_segno -= SEGS_PER_SEC(sbi) -
 					f2fs_usable_segs_in_sec(sbi, segno);
 
 	sanity_check_seg_type(sbi, get_seg_entry(sbi, segno)->type);
@@ -1986,7 +1986,7 @@ static int free_segment_range(struct f2fs_sb_info *sbi,
 
 	/* Force block allocation for GC */
 	MAIN_SECS(sbi) -= secs;
-	start = MAIN_SECS(sbi) * sbi->segs_per_sec;
+	start = MAIN_SECS(sbi) * SEGS_PER_SEC(sbi);
 	end = MAIN_SEGS(sbi) - 1;
 
 	mutex_lock(&DIRTY_I(sbi)->seglist_lock);
@@ -2004,7 +2004,7 @@ static int free_segment_range(struct f2fs_sb_info *sbi,
 		f2fs_allocate_segment_for_resize(sbi, type, start, end);
 
 	/* do GC to move out valid blocks in the range */
-	for (segno = start; segno <= end; segno += sbi->segs_per_sec) {
+	for (segno = start; segno <= end; segno += SEGS_PER_SEC(sbi)) {
 		struct gc_inode_list gc_list = {
 			.ilist = LIST_HEAD_INIT(gc_list.ilist),
 			.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
@@ -2048,7 +2048,7 @@ static void update_sb_metadata(struct f2fs_sb_info *sbi, int secs)
 	int segment_count;
 	int segment_count_main;
 	long long block_count;
-	int segs = secs * sbi->segs_per_sec;
+	int segs = secs * SEGS_PER_SEC(sbi);
 
 	f2fs_down_write(&sbi->sb_lock);
 
@@ -2061,7 +2061,7 @@ static void update_sb_metadata(struct f2fs_sb_info *sbi, int secs)
 	raw_sb->segment_count = cpu_to_le32(segment_count + segs);
 	raw_sb->segment_count_main = cpu_to_le32(segment_count_main + segs);
 	raw_sb->block_count = cpu_to_le64(block_count +
-					(long long)segs * sbi->blocks_per_seg);
+			(long long)(segs << sbi->log_blocks_per_seg));
 	if (f2fs_is_multi_device(sbi)) {
 		int last_dev = sbi->s_ndevs - 1;
 		int dev_segs =
@@ -2076,8 +2076,8 @@ static void update_sb_metadata(struct f2fs_sb_info *sbi, int secs)
 
 static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
 {
-	int segs = secs * sbi->segs_per_sec;
-	long long blks = (long long)segs * sbi->blocks_per_seg;
+	int segs = secs * SEGS_PER_SEC(sbi);
+	long long blks = (long long)(segs << sbi->log_blocks_per_seg);
 	long long user_block_count =
 				le64_to_cpu(F2FS_CKPT(sbi)->user_block_count);
 
@@ -2119,7 +2119,7 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
 		int last_dev = sbi->s_ndevs - 1;
 		__u64 last_segs = FDEV(last_dev).total_segments;
 
-		if (block_count + last_segs * sbi->blocks_per_seg <=
+		if (block_count + (last_segs << sbi->log_blocks_per_seg) <=
 								old_block_count)
 			return -EINVAL;
 	}
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 1d898a16f05a..51241996b9ec 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2841,7 +2841,7 @@ int f2fs_restore_node_summary(struct f2fs_sb_info *sbi,
 	int i, idx, last_offset, nrpages;
 
 	/* scan the node segment */
-	last_offset = sbi->blocks_per_seg;
+	last_offset = BLKS_PER_SEG(sbi);
 	addr = START_BLOCK(sbi, segno);
 	sum_entry = &sum->entries[0];
 
@@ -3158,7 +3158,7 @@ static int __get_nat_bitmaps(struct f2fs_sb_info *sbi)
 	if (!is_set_ckpt_flags(sbi, CP_NAT_BITS_FLAG))
 		return 0;
 
-	nat_bits_addr = __start_cp_addr(sbi) + sbi->blocks_per_seg -
+	nat_bits_addr = __start_cp_addr(sbi) + BLKS_PER_SEG(sbi) -
 						nm_i->nat_bits_blocks;
 	for (i = 0; i < nm_i->nat_bits_blocks; i++) {
 		struct page *page;
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 5bd16a95eef8..6aea13024ac1 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -208,10 +208,10 @@ static inline pgoff_t current_nat_addr(struct f2fs_sb_info *sbi, nid_t start)
 
 	block_addr = (pgoff_t)(nm_i->nat_blkaddr +
 		(block_off << 1) -
-		(block_off & (sbi->blocks_per_seg - 1)));
+		(block_off & (BLKS_PER_SEG(sbi) - 1)));
 
 	if (f2fs_test_bit(block_off, nm_i->nat_bitmap))
-		block_addr += sbi->blocks_per_seg;
+		block_addr += BLKS_PER_SEG(sbi);
 
 	return block_addr;
 }
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index aad1d1a9b3d6..b3baec666afe 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -354,7 +354,7 @@ static unsigned int adjust_por_ra_blocks(struct f2fs_sb_info *sbi,
 	if (blkaddr + 1 == next_blkaddr)
 		ra_blocks = min_t(unsigned int, RECOVERY_MAX_RA_BLOCKS,
 							ra_blocks * 2);
-	else if (next_blkaddr % sbi->blocks_per_seg)
+	else if (next_blkaddr % BLKS_PER_SEG(sbi))
 		ra_blocks = max_t(unsigned int, RECOVERY_MIN_RA_BLOCKS,
 							ra_blocks / 2);
 	return ra_blocks;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index e5759813276a..8d330664b925 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -448,8 +448,8 @@ static inline bool excess_dirty_threshold(struct f2fs_sb_info *sbi)
 	unsigned int nodes = get_pages(sbi, F2FS_DIRTY_NODES);
 	unsigned int meta = get_pages(sbi, F2FS_DIRTY_META);
 	unsigned int imeta = get_pages(sbi, F2FS_DIRTY_IMETA);
-	unsigned int threshold = sbi->blocks_per_seg * factor *
-					DEFAULT_DIRTY_THRESHOLD;
+	unsigned int threshold = (factor * DEFAULT_DIRTY_THRESHOLD) <<
+				sbi->log_blocks_per_seg;
 	unsigned int global_threshold = threshold * 3 / 2;
 
 	if (dents >= threshold || qdata >= threshold ||
@@ -1134,8 +1134,7 @@ static void __check_sit_bitmap(struct f2fs_sb_info *sbi,
 	struct seg_entry *sentry;
 	unsigned int segno;
 	block_t blk = start;
-	unsigned long offset, size, max_blocks = sbi->blocks_per_seg;
-	unsigned long *map;
+	unsigned long offset, size, *map;
 
 	while (blk < end) {
 		segno = GET_SEGNO(sbi, blk);
@@ -1145,7 +1144,7 @@ static void __check_sit_bitmap(struct f2fs_sb_info *sbi,
 		if (end < START_BLOCK(sbi, segno + 1))
 			size = GET_BLKOFF_FROM_SEG0(sbi, end);
 		else
-			size = max_blocks;
+			size = BLKS_PER_SEG(sbi);
 		map = (unsigned long *)(sentry->cur_valid_map);
 		offset = __find_rev_next_bit(map, size, offset);
 		f2fs_bug_on(sbi, offset != size);
@@ -2044,7 +2043,6 @@ static bool add_discard_addrs(struct f2fs_sb_info *sbi, struct cp_control *cpc,
 							bool check_only)
 {
 	int entries = SIT_VBLOCK_MAP_SIZE / sizeof(unsigned long);
-	int max_blocks = sbi->blocks_per_seg;
 	struct seg_entry *se = get_seg_entry(sbi, cpc->trim_start);
 	unsigned long *cur_map = (unsigned long *)se->cur_valid_map;
 	unsigned long *ckpt_map = (unsigned long *)se->ckpt_valid_map;
@@ -2056,8 +2054,9 @@ static bool add_discard_addrs(struct f2fs_sb_info *sbi, struct cp_control *cpc,
 	struct list_head *head = &SM_I(sbi)->dcc_info->entry_list;
 	int i;
 
-	if (se->valid_blocks == max_blocks || !f2fs_hw_support_discard(sbi) ||
-			!f2fs_block_unit_discard(sbi))
+	if (se->valid_blocks == BLKS_PER_SEG(sbi) ||
+	    !f2fs_hw_support_discard(sbi) ||
+	    !f2fs_block_unit_discard(sbi))
 		return false;
 
 	if (!force) {
@@ -2074,13 +2073,14 @@ static bool add_discard_addrs(struct f2fs_sb_info *sbi, struct cp_control *cpc,
 
 	while (force || SM_I(sbi)->dcc_info->nr_discards <=
 				SM_I(sbi)->dcc_info->max_discards) {
-		start = __find_rev_next_bit(dmap, max_blocks, end + 1);
-		if (start >= max_blocks)
+		start = __find_rev_next_bit(dmap, BLKS_PER_SEG(sbi), end + 1);
+		if (start >= BLKS_PER_SEG(sbi))
 			break;
 
-		end = __find_rev_next_zero_bit(dmap, max_blocks, start + 1);
-		if (force && start && end != max_blocks
-					&& (end - start) < cpc->trim_minlen)
+		end = __find_rev_next_zero_bit(dmap,
+						BLKS_PER_SEG(sbi), start + 1);
+		if (force && start && end != BLKS_PER_SEG(sbi) &&
+		    (end - start) < cpc->trim_minlen)
 			continue;
 
 		if (check_only)
@@ -2162,8 +2162,8 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 								start + 1);
 
 		if (section_alignment) {
-			start = rounddown(start, sbi->segs_per_sec);
-			end = roundup(end, sbi->segs_per_sec);
+			start = rounddown(start, SEGS_PER_SEC(sbi));
+			end = roundup(end, SEGS_PER_SEC(sbi));
 		}
 
 		for (i = start; i < end; i++) {
@@ -2191,9 +2191,9 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 		if (!IS_CURSEC(sbi, secno) &&
 			!get_valid_blocks(sbi, start, true))
 			f2fs_issue_discard(sbi, START_BLOCK(sbi, start_segno),
-				sbi->segs_per_sec << sbi->log_blocks_per_seg);
+						BLKS_PER_SEC(sbi));
 
-		start = start_segno + sbi->segs_per_sec;
+		start = start_segno + SEGS_PER_SEC(sbi);
 		if (start < end)
 			goto next;
 		else
@@ -2212,7 +2212,7 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 find_next:
 		if (is_valid) {
 			next_pos = find_next_zero_bit_le(entry->discard_map,
-					sbi->blocks_per_seg, cur_pos);
+						BLKS_PER_SEG(sbi), cur_pos);
 			len = next_pos - cur_pos;
 
 			if (f2fs_sb_has_blkzoned(sbi) ||
@@ -2224,13 +2224,13 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 			total_len += len;
 		} else {
 			next_pos = find_next_bit_le(entry->discard_map,
-					sbi->blocks_per_seg, cur_pos);
+						BLKS_PER_SEG(sbi), cur_pos);
 		}
 skip:
 		cur_pos = next_pos;
 		is_valid = !is_valid;
 
-		if (cur_pos < sbi->blocks_per_seg)
+		if (cur_pos < BLKS_PER_SEG(sbi))
 			goto find_next;
 
 		release_discard_addr(entry);
@@ -2279,7 +2279,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 	dcc->max_ordered_discard = DEFAULT_MAX_ORDERED_DISCARD_GRANULARITY;
 	dcc->discard_io_aware = DPOLICY_IO_AWARE_ENABLE;
 	if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SEGMENT)
-		dcc->discard_granularity = sbi->blocks_per_seg;
+		dcc->discard_granularity = BLKS_PER_SEG(sbi);
 	else if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SECTION)
 		dcc->discard_granularity = BLKS_PER_SEC(sbi);
 
@@ -2542,7 +2542,7 @@ static unsigned short f2fs_curseg_valid_blocks(struct f2fs_sb_info *sbi, int typ
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
 
 	if (sbi->ckpt->alloc_type[type] == SSR)
-		return sbi->blocks_per_seg;
+		return BLKS_PER_SEG(sbi);
 	return curseg->next_blkoff;
 }
 
@@ -2630,7 +2630,7 @@ static int is_next_segment_free(struct f2fs_sb_info *sbi,
 	unsigned int segno = curseg->segno + 1;
 	struct free_segmap_info *free_i = FREE_I(sbi);
 
-	if (segno < MAIN_SEGS(sbi) && segno % sbi->segs_per_sec)
+	if (segno < MAIN_SEGS(sbi) && segno % SEGS_PER_SEC(sbi))
 		return !test_bit(segno, free_i->free_segmap);
 	return 0;
 }
@@ -2654,7 +2654,7 @@ static void get_new_segment(struct f2fs_sb_info *sbi,
 
 	spin_lock(&free_i->segmap_lock);
 
-	if (!new_sec && ((*newseg + 1) % sbi->segs_per_sec)) {
+	if (!new_sec && ((*newseg + 1) % SEGS_PER_SEC(sbi))) {
 		segno = find_next_zero_bit(free_i->free_segmap,
 			GET_SEG_FROM_SEC(sbi, hint + 1), *newseg + 1);
 		if (segno < GET_SEG_FROM_SEC(sbi, hint + 1))
@@ -2757,7 +2757,7 @@ static unsigned int __get_next_segno(struct f2fs_sb_info *sbi, int type)
 
 	sanity_check_seg_type(sbi, seg_type);
 	if (f2fs_need_rand_seg(sbi))
-		return get_random_u32_below(MAIN_SECS(sbi) * sbi->segs_per_sec);
+		return get_random_u32_below(MAIN_SECS(sbi) * SEGS_PER_SEC(sbi));
 
 	/* if segs_per_sec is large than 1, we need to keep original policy. */
 	if (__is_large_section(sbi))
@@ -2827,7 +2827,7 @@ static int __next_free_blkoff(struct f2fs_sb_info *sbi,
 	for (i = 0; i < entries; i++)
 		target_map[i] = ckpt_map[i] | cur_map[i];
 
-	return __find_rev_next_zero_bit(target_map, sbi->blocks_per_seg, start);
+	return __find_rev_next_zero_bit(target_map, BLKS_PER_SEG(sbi), start);
 }
 
 static int f2fs_find_next_ssr_block(struct f2fs_sb_info *sbi,
@@ -2838,7 +2838,7 @@ static int f2fs_find_next_ssr_block(struct f2fs_sb_info *sbi,
 
 bool f2fs_segment_has_free_slot(struct f2fs_sb_info *sbi, int segno)
 {
-	return __next_free_blkoff(sbi, segno, 0) < sbi->blocks_per_seg;
+	return __next_free_blkoff(sbi, segno, 0) < BLKS_PER_SEG(sbi);
 }
 
 /*
@@ -3238,8 +3238,8 @@ int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range)
 	end_segno = (end >= MAX_BLKADDR(sbi)) ? MAIN_SEGS(sbi) - 1 :
 						GET_SEGNO(sbi, end);
 	if (need_align) {
-		start_segno = rounddown(start_segno, sbi->segs_per_sec);
-		end_segno = roundup(end_segno + 1, sbi->segs_per_sec) - 1;
+		start_segno = rounddown(start_segno, SEGS_PER_SEC(sbi));
+		end_segno = roundup(end_segno + 1, SEGS_PER_SEC(sbi)) - 1;
 	}
 
 	cpc.reason = CP_DISCARD;
@@ -3437,7 +3437,7 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 	}
 	*new_blkaddr = NEXT_FREE_BLKADDR(sbi, curseg);
 
-	f2fs_bug_on(sbi, curseg->next_blkoff >= sbi->blocks_per_seg);
+	f2fs_bug_on(sbi, curseg->next_blkoff >= BLKS_PER_SEG(sbi));
 
 	f2fs_wait_discard_bio(sbi, *new_blkaddr);
 
@@ -3881,7 +3881,7 @@ static int read_compacted_summaries(struct f2fs_sb_info *sbi)
 		seg_i->next_blkoff = blk_off;
 
 		if (seg_i->alloc_type == SSR)
-			blk_off = sbi->blocks_per_seg;
+			blk_off = BLKS_PER_SEG(sbi);
 
 		for (j = 0; j < blk_off; j++) {
 			struct f2fs_summary *s;
@@ -3949,7 +3949,7 @@ static int read_normal_summaries(struct f2fs_sb_info *sbi, int type)
 			struct f2fs_summary *ns = &sum->entries[0];
 			int i;
 
-			for (i = 0; i < sbi->blocks_per_seg; i++, ns++) {
+			for (i = 0; i < BLKS_PER_SEG(sbi); i++, ns++) {
 				ns->version = 0;
 				ns->ofs_in_node = 0;
 			}
@@ -4582,21 +4582,20 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 
 			sit_valid_blocks[SE_PAGETYPE(se)] += se->valid_blocks;
 
-			if (f2fs_block_unit_discard(sbi)) {
-				/* build discard map only one time */
-				if (is_set_ckpt_flags(sbi, CP_TRIMMED_FLAG)) {
-					memset(se->discard_map, 0xff,
+			if (!f2fs_block_unit_discard(sbi))
+				goto init_discard_map_done;
+
+			/* build discard map only one time */
+			if (is_set_ckpt_flags(sbi, CP_TRIMMED_FLAG)) {
+				memset(se->discard_map, 0xff,
 						SIT_VBLOCK_MAP_SIZE);
-				} else {
-					memcpy(se->discard_map,
-						se->cur_valid_map,
+				goto init_discard_map_done;
+			}
+			memcpy(se->discard_map, se->cur_valid_map,
 						SIT_VBLOCK_MAP_SIZE);
-					sbi->discard_blks +=
-						sbi->blocks_per_seg -
+			sbi->discard_blks += BLKS_PER_SEG(sbi) -
 						se->valid_blocks;
-				}
-			}
-
+init_discard_map_done:
 			if (__is_large_section(sbi))
 				get_sec_entry(sbi, start)->valid_blocks +=
 							se->valid_blocks;
@@ -4736,7 +4735,7 @@ static void init_dirty_segmap(struct f2fs_sb_info *sbi)
 		return;
 
 	mutex_lock(&dirty_i->seglist_lock);
-	for (segno = 0; segno < MAIN_SEGS(sbi); segno += sbi->segs_per_sec) {
+	for (segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi)) {
 		valid_blocks = get_valid_blocks(sbi, segno, true);
 		secno = GET_SEC_FROM_SEG(sbi, segno);
 
@@ -4835,7 +4834,7 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
 		if (curseg->alloc_type == SSR)
 			continue;
 
-		for (blkofs += 1; blkofs < sbi->blocks_per_seg; blkofs++) {
+		for (blkofs += 1; blkofs < BLKS_PER_SEG(sbi); blkofs++) {
 			if (!f2fs_test_bit(blkofs, se->cur_valid_map))
 				continue;
 out:
@@ -5114,7 +5113,7 @@ static inline unsigned int f2fs_usable_zone_blks_in_seg(
 	unsigned int secno;
 
 	if (!sbi->unusable_blocks_per_sec)
-		return sbi->blocks_per_seg;
+		return BLKS_PER_SEG(sbi);
 
 	secno = GET_SEC_FROM_SEG(sbi, segno);
 	seg_start = START_BLOCK(sbi, segno);
@@ -5129,10 +5128,10 @@ static inline unsigned int f2fs_usable_zone_blks_in_seg(
 	 */
 	if (seg_start >= sec_cap_blkaddr)
 		return 0;
-	if (seg_start + sbi->blocks_per_seg > sec_cap_blkaddr)
+	if (seg_start + BLKS_PER_SEG(sbi) > sec_cap_blkaddr)
 		return sec_cap_blkaddr - seg_start;
 
-	return sbi->blocks_per_seg;
+	return BLKS_PER_SEG(sbi);
 }
 #else
 int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi)
@@ -5158,7 +5157,7 @@ unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
 	if (f2fs_sb_has_blkzoned(sbi))
 		return f2fs_usable_zone_blks_in_seg(sbi, segno);
 
-	return sbi->blocks_per_seg;
+	return BLKS_PER_SEG(sbi);
 }
 
 unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
@@ -5167,7 +5166,7 @@ unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
 	if (f2fs_sb_has_blkzoned(sbi))
 		return CAP_SEGS_PER_SEC(sbi);
 
-	return sbi->segs_per_sec;
+	return SEGS_PER_SEC(sbi);
 }
 
 /*
@@ -5182,14 +5181,14 @@ static void init_min_max_mtime(struct f2fs_sb_info *sbi)
 
 	sit_i->min_mtime = ULLONG_MAX;
 
-	for (segno = 0; segno < MAIN_SEGS(sbi); segno += sbi->segs_per_sec) {
+	for (segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi)) {
 		unsigned int i;
 		unsigned long long mtime = 0;
 
-		for (i = 0; i < sbi->segs_per_sec; i++)
+		for (i = 0; i < SEGS_PER_SEC(sbi); i++)
 			mtime += get_seg_entry(sbi, segno + i)->mtime;
 
-		mtime = div_u64(mtime, sbi->segs_per_sec);
+		mtime = div_u64(mtime, SEGS_PER_SEC(sbi));
 
 		if (sit_i->min_mtime > mtime)
 			sit_i->min_mtime = mtime;
@@ -5228,7 +5227,7 @@ int f2fs_build_segment_manager(struct f2fs_sb_info *sbi)
 		sm_info->ipu_policy = BIT(F2FS_IPU_FSYNC);
 	sm_info->min_ipu_util = DEF_MIN_IPU_UTIL;
 	sm_info->min_fsync_blocks = DEF_MIN_FSYNC_BLOCKS;
-	sm_info->min_seq_blocks = sbi->blocks_per_seg;
+	sm_info->min_seq_blocks = BLKS_PER_SEG(sbi);
 	sm_info->min_hot_blocks = DEF_MIN_HOT_BLOCKS;
 	sm_info->min_ssr_sections = reserved_sections(sbi);
 
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 8129be788bd5..96cec83012f1 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -99,8 +99,6 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
 	((!__is_valid_data_blkaddr(blk_addr)) ?			\
 	NULL_SEGNO : GET_L2R_SEGNO(FREE_I(sbi),			\
 		GET_SEGNO_FROM_SEG0(sbi, blk_addr)))
-#define BLKS_PER_SEC(sbi)					\
-	((sbi)->segs_per_sec * (sbi)->blocks_per_seg)
 #define CAP_BLKS_PER_SEC(sbi)					\
 	((sbi)->segs_per_sec * (sbi)->blocks_per_seg -		\
 	 (sbi)->unusable_blocks_per_sec)
@@ -364,7 +362,7 @@ static inline unsigned int get_ckpt_valid_blocks(struct f2fs_sb_info *sbi,
 		unsigned int blocks = 0;
 		int i;
 
-		for (i = 0; i < sbi->segs_per_sec; i++, start_segno++) {
+		for (i = 0; i < SEGS_PER_SEC(sbi); i++, start_segno++) {
 			struct seg_entry *se = get_seg_entry(sbi, start_segno);
 
 			blocks += se->ckpt_valid_blocks;
@@ -449,7 +447,7 @@ static inline void __set_free(struct f2fs_sb_info *sbi, unsigned int segno)
 	free_i->free_segments++;
 
 	next = find_next_bit(free_i->free_segmap,
-			start_segno + sbi->segs_per_sec, start_segno);
+			start_segno + SEGS_PER_SEC(sbi), start_segno);
 	if (next >= start_segno + usable_segs) {
 		clear_bit(secno, free_i->free_secmap);
 		free_i->free_sections++;
@@ -485,7 +483,7 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
 		if (!inmem && IS_CURSEC(sbi, secno))
 			goto skip_free;
 		next = find_next_bit(free_i->free_segmap,
-				start_segno + sbi->segs_per_sec, start_segno);
+				start_segno + SEGS_PER_SEC(sbi), start_segno);
 		if (next >= start_segno + usable_segs) {
 			if (test_and_clear_bit(secno, free_i->free_secmap))
 				free_i->free_sections++;
@@ -793,10 +791,10 @@ static inline int check_block_count(struct f2fs_sb_info *sbi,
 		return -EFSCORRUPTED;
 	}
 
-	if (usable_blks_per_seg < sbi->blocks_per_seg)
+	if (usable_blks_per_seg < BLKS_PER_SEG(sbi))
 		f2fs_bug_on(sbi, find_next_bit_le(&raw_sit->valid_map,
-				sbi->blocks_per_seg,
-				usable_blks_per_seg) != sbi->blocks_per_seg);
+				BLKS_PER_SEG(sbi),
+				usable_blks_per_seg) != BLKS_PER_SEG(sbi));
 
 	/* check segment usage, and check boundary of a given segment number */
 	if (unlikely(GET_SIT_VBLOCKS(raw_sit) > usable_blks_per_seg
@@ -915,9 +913,9 @@ static inline int nr_pages_to_skip(struct f2fs_sb_info *sbi, int type)
 		return 0;
 
 	if (type == DATA)
-		return sbi->blocks_per_seg;
+		return BLKS_PER_SEG(sbi);
 	else if (type == NODE)
-		return 8 * sbi->blocks_per_seg;
+		return 8 * BLKS_PER_SEG(sbi);
 	else if (type == META)
 		return 8 * BIO_MAX_VECS;
 	else
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f1516fd5088a..c0688c124aa7 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3643,7 +3643,7 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 	}
 
 	main_segs = le32_to_cpu(raw_super->segment_count_main);
-	blocks_per_seg = sbi->blocks_per_seg;
+	blocks_per_seg = BLKS_PER_SEG(sbi);
 
 	for (i = 0; i < NR_CURSEG_NODE_TYPE; i++) {
 		if (le32_to_cpu(ckpt->cur_node_segno[i]) >= main_segs ||
@@ -3756,8 +3756,8 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->secs_per_zone = le32_to_cpu(raw_super->secs_per_zone);
 	sbi->total_sections = le32_to_cpu(raw_super->section_count);
 	sbi->total_node_count =
-		(le32_to_cpu(raw_super->segment_count_nat) / 2)
-			* sbi->blocks_per_seg * NAT_ENTRY_PER_BLOCK;
+		((le32_to_cpu(raw_super->segment_count_nat) / 2) *
+		NAT_ENTRY_PER_BLOCK) << sbi->log_blocks_per_seg;
 	F2FS_ROOT_INO(sbi) = le32_to_cpu(raw_super->root_ino);
 	F2FS_NODE_INO(sbi) = le32_to_cpu(raw_super->node_ino);
 	F2FS_META_INO(sbi) = le32_to_cpu(raw_super->meta_ino);
@@ -3766,7 +3766,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
 	sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
 	sbi->max_victim_search = DEF_MAX_VICTIM_SEARCH;
-	sbi->migration_granularity = sbi->segs_per_sec;
+	sbi->migration_granularity = SEGS_PER_SEC(sbi);
 	sbi->seq_file_ra_mul = MIN_RA_MUL;
 	sbi->max_fragment_chunk = DEF_FRAGMENT_SIZE;
 	sbi->max_fragment_hole = DEF_FRAGMENT_SIZE;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index a7ec55c7bb20..906d2af2d849 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -493,8 +493,8 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		spin_lock(&sbi->stat_lock);
 		if (t > (unsigned long)(sbi->user_block_count -
 				F2FS_OPTION(sbi).root_reserved_blocks -
-				sbi->blocks_per_seg *
-				SM_I(sbi)->additional_reserved_segments)) {
+				(SM_I(sbi)->additional_reserved_segments <<
+					sbi->log_blocks_per_seg))) {
 			spin_unlock(&sbi->stat_lock);
 			return -EINVAL;
 		}
@@ -551,7 +551,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 	}
 
 	if (!strcmp(a->attr.name, "migration_granularity")) {
-		if (t == 0 || t > sbi->segs_per_sec)
+		if (t == 0 || t > SEGS_PER_SEC(sbi))
 			return -EINVAL;
 	}
 
-- 
2.43.0.594.gd9cf4e227d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
