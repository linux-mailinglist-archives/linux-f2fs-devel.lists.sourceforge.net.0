Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8EF3DB6CF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Jul 2021 12:05:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m9POo-0006od-Qb; Fri, 30 Jul 2021 10:05:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1m9POn-0006oW-Gq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Jul 2021 10:05:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9XqZXpOUD4fvHtCfaXg6Hcvi/lXbTXIkdftpfsLQVqA=; b=XW1OOsgK2dCKOlOvsQQNv484Ls
 35xroiy9Arbq9XMTfvSQbP/78dsCrBlTcokPnpox1mJOQUJX28TaxzUKTc3gAbXFA+fN+LCUA97zI
 woo4eS8wu/857ex8dk4mWwnthOwIc1zygLEjhloJc0ORINONYW6BhkYqJ9iXa1hsDVsA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9XqZXpOUD4fvHtCfaXg6Hcvi/lXbTXIkdftpfsLQVqA=; b=Z
 UjHdS0N7p8xCsTuoDo7tbiqiy9iHJtskInpyUfaVWNBi3InnoDS2mPVNuqo4CGSjTnSwtITTdQuz2
 u0I1cZNERJucK91NZbbAfW2OJ2j8/E7nKEoT/TuyGMNaMBX3aBAB2SMtwZjlMTGzpIqblApsqi0C0
 QD9ZuoCIZhglEt5k=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m9POg-007dOt-Kh
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Jul 2021 10:05:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B929460F12;
 Fri, 30 Jul 2021 10:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627639536;
 bh=MiGJ5tAiT7WWd+8Ka3WiO9RRDncQn21ay0hbxcmXhzI=;
 h=From:To:Cc:Subject:Date:From;
 b=JIHInTtgTr/rk+RipxHra15BDI0L1w8T3lYIMlW9chqAHNXC5qjAEch68n1chHlbB
 XQSDFFIubmjsCqr7/c0o2lVpQ5BWaevBV3Ik/K+rMPCCcCAZCTjZqIzHxnc9OoLDM5
 +BJMcN4hnbqJCpJ2Tyr56sWQMjDEFv2yhX5Q1G5LeAvjJl29JU6GoG6bhYU/Fj2LAA
 wzkzXkbHkgxyokZMtz66fHZ4L4NBTbndcyht0kQBLxie0bjxHvubkvbt1whOivm4BZ
 b5TFzw9rp2e1hCJ7u1rHT4TARiOX7KVMLFXJCcSSwggRSaGu1XauKGNEGEkTg2S+uS
 Ol13tQ/LYE//Q==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 30 Jul 2021 18:05:30 +0800
Message-Id: <20210730100530.4401-1-chao@kernel.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m9POg-007dOt-Kh
Subject: [f2fs-dev] [PATCH] f2fs: introduce nosmall_discard mount option
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
Cc: Chao Yu <chao.yu@linux.dev>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As James Z reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=213877

[1.] One-line summary of the problem:
Mount multiple SMR block devices exceed certain number cause system non-response

[2.] Full description of the problem/report:
Created some F2FS on SMR devices (mkfs.f2fs -m), then mounted in sequence. Each device is the same Model: HGST HSH721414AL (Size 14TB).
Empirically, found that when the amount of SMR device * 1.5Gb > System RAM, the system ran out of memory and hung. No dmesg output. For example, 24 SMR Disk need 24*1.5GB = 36GB. A system with 32G RAM can only mount 21 devices, the 22nd device will be a reproducible cause of system hang.
The number of SMR devices with other FS mounted on this system does not interfere with the result above.

[3.] Keywords (i.e., modules, networking, kernel):
F2FS, SMR, Memory

[4.] Kernel information
[4.1.] Kernel version (uname -a):
Linux 5.13.4-200.fc34.x86_64 #1 SMP Tue Jul 20 20:27:29 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux

[4.2.] Kernel .config file:
Default Fedora 34 with f2fs-tools-1.14.0-2.fc34.x86_64

[5.] Most recent kernel version which did not have the bug:
None

[6.] Output of Oops.. message (if applicable) with symbolic information
     resolved (see Documentation/admin-guide/oops-tracing.rst)
None

[7.] A small shell script or example program which triggers the
     problem (if possible)
mount /dev/sdX /mnt/0X

[8.] Memory consumption

With 24 * 14T SMR Block device with F2FS
free -g
              total        used        free      shared  buff/cache   available
Mem:             46          36           0           0          10          10
Swap:             0           0           0

With 3 * 14T SMR Block device with F2FS
free -g
               total        used        free      shared  buff/cache   available
Mem:               7           5           0           0           1           1
Swap:              7           0           7

The root cause is, there are three bitmaps:
- cur_valid_map
- ckpt_valid_map
- discard_map
and each of them will cost ~500MB memory, {cur, ckpt}_valid_map are
necessary, but discard_map is optional, since this bitmap will only be
useful in mountpoint that small discard is enabled.

For a blkzoned device such as SMR or ZNS devices, f2fs will only issue
discard for a section(zone) when all blocks of that section are invalid,
so, for such device, we don't need small discard functionality at all.

This patch introduces a new mountoption "nosmall_discard" to support
disabling small discard functionality, note that the mountoption can not
be removed by remount() due to related metadata should always be
initialized during mount().

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/filesystems/f2fs.rst |  4 ++
 fs/f2fs/f2fs.h                     |  3 ++
 fs/f2fs/segment.c                  | 81 +++++++++++++++++++-----------
 fs/f2fs/super.c                    | 17 ++++++-
 4 files changed, 75 insertions(+), 30 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index ff9e7cc97c65..9ce32fd1c90f 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -312,6 +312,10 @@ inlinecrypt		 When possible, encrypt/decrypt the contents of encrypted
 			 Documentation/block/inline-encryption.rst.
 atgc			 Enable age-threshold garbage collection, it provides high
 			 effectiveness and efficiency on background GC.
+nosmall_discard		 Support to disable small discard, with this, filesystem will
+			 only issue discard aligned to segment or section in lfs mode,
+			 it is useful for large sized SMR or ZNS devices to reduce
+			 memory cost.
 ======================== ============================================================
 
 Debugfs Entries
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5d16486feb8f..fb0ce582808f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -99,6 +99,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
 #define F2FS_MOUNT_MERGE_CHECKPOINT	0x10000000
 #define	F2FS_MOUNT_GC_MERGE		0x20000000
 #define F2FS_MOUNT_COMPRESS_CACHE	0x40000000
+#define F2FS_MOUNT_NOSMALL_DISCARD	0x80000000
 
 #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
 #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
@@ -302,6 +303,8 @@ struct discard_entry {
 /* default discard granularity of inner discard thread, unit: block count */
 #define DEFAULT_DISCARD_GRANULARITY		16
 
+#define SEGMENT_ALIGNED_DISCARD_GRANULARITY	512
+
 /* max discard pend list number */
 #define MAX_PLIST_NUM		512
 #define plist_idx(blk_num)	((blk_num) >= MAX_PLIST_NUM ?		\
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index f9b7fb785e1d..73b532601aef 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1871,6 +1871,7 @@ static int f2fs_issue_discard(struct f2fs_sb_info *sbi,
 	unsigned int offset;
 	block_t i;
 	int err = 0;
+	bool small_discard = !test_opt(sbi, NOSMALL_DISCARD);
 
 	bdev = f2fs_target_device(sbi, blkstart, NULL);
 
@@ -1893,8 +1894,10 @@ static int f2fs_issue_discard(struct f2fs_sb_info *sbi,
 		se = get_seg_entry(sbi, GET_SEGNO(sbi, i));
 		offset = GET_BLKOFF_FROM_SEG0(sbi, i);
 
-		if (!f2fs_test_and_set_bit(offset, se->discard_map))
-			sbi->discard_blks--;
+		if (small_discard) {
+			if (!f2fs_test_and_set_bit(offset, se->discard_map))
+				sbi->discard_blks--;
+		}
 	}
 
 	if (len)
@@ -1918,7 +1921,8 @@ static bool add_discard_addrs(struct f2fs_sb_info *sbi, struct cp_control *cpc,
 	struct list_head *head = &SM_I(sbi)->dcc_info->entry_list;
 	int i;
 
-	if (se->valid_blocks == max_blocks || !f2fs_hw_support_discard(sbi))
+	if (se->valid_blocks == max_blocks || !f2fs_hw_support_discard(sbi) ||
+			test_opt(sbi, NOSMALL_DISCARD))
 		return false;
 
 	if (!force) {
@@ -2056,6 +2060,9 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 	}
 	mutex_unlock(&dirty_i->seglist_lock);
 
+	if (test_opt(sbi, NOSMALL_DISCARD))
+		goto wakeup;
+
 	/* send small discards */
 	list_for_each_entry_safe(entry, this, head, list) {
 		unsigned int cur_pos = 0, next_pos, len, total_len = 0;
@@ -2089,6 +2096,7 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 		dcc->nr_discards -= total_len;
 	}
 
+wakeup:
 	wake_up_discard_thread(sbi, false);
 }
 
@@ -2108,6 +2116,9 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 		return -ENOMEM;
 
 	dcc->discard_granularity = DEFAULT_DISCARD_GRANULARITY;
+	if (test_opt(sbi, NOSMALL_DISCARD))
+		dcc->discard_granularity = SEGMENT_ALIGNED_DISCARD_GRANULARITY;
+
 	INIT_LIST_HEAD(&dcc->entry_list);
 	for (i = 0; i < MAX_PLIST_NUM; i++)
 		INIT_LIST_HEAD(&dcc->pend_list[i]);
@@ -2255,8 +2266,10 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 			del = 0;
 		}
 
-		if (!f2fs_test_and_set_bit(offset, se->discard_map))
-			sbi->discard_blks--;
+		if (!test_opt(sbi, NOSMALL_DISCARD)) {
+			if (!f2fs_test_and_set_bit(offset, se->discard_map))
+				sbi->discard_blks--;
+		}
 
 		/*
 		 * SSR should never reuse block which is checkpointed
@@ -2297,8 +2310,10 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 			}
 		}
 
-		if (f2fs_test_and_clear_bit(offset, se->discard_map))
-			sbi->discard_blks++;
+		if (!test_opt(sbi, NOSMALL_DISCARD)) {
+			if (f2fs_test_and_clear_bit(offset, se->discard_map))
+				sbi->discard_blks++;
+		}
 	}
 	if (!f2fs_test_bit(offset, se->ckpt_valid_map))
 		se->ckpt_valid_blocks += del;
@@ -4282,6 +4297,7 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 	unsigned int sit_segs, start;
 	char *src_bitmap, *bitmap;
 	unsigned int bitmap_size, main_bitmap_size, sit_bitmap_size;
+	unsigned int discard_map = test_opt(sbi, NOSMALL_DISCARD) ? 0 : 1;
 
 	/* allocate memory for SIT information */
 	sit_i = f2fs_kzalloc(sbi, sizeof(struct sit_info), GFP_KERNEL);
@@ -4304,9 +4320,9 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 		return -ENOMEM;
 
 #ifdef CONFIG_F2FS_CHECK_FS
-	bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * 4;
+	bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * (3 + discard_map);
 #else
-	bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * 3;
+	bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * (2 + discard_map);
 #endif
 	sit_i->bitmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
 	if (!sit_i->bitmap)
@@ -4326,8 +4342,10 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 		bitmap += SIT_VBLOCK_MAP_SIZE;
 #endif
 
-		sit_i->sentries[start].discard_map = bitmap;
-		bitmap += SIT_VBLOCK_MAP_SIZE;
+		if (discard_map) {
+			sit_i->sentries[start].discard_map = bitmap;
+			bitmap += SIT_VBLOCK_MAP_SIZE;
+		}
 	}
 
 	sit_i->tmp_map = f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE, GFP_KERNEL);
@@ -4462,6 +4480,7 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 	unsigned int readed, start_blk = 0;
 	int err = 0;
 	block_t total_node_blocks = 0;
+	bool small_discard = !test_opt(sbi, NOSMALL_DISCARD);
 
 	do {
 		readed = f2fs_ra_meta_pages(sbi, start_blk, BIO_MAX_VECS,
@@ -4489,17 +4508,19 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 			if (IS_NODESEG(se->type))
 				total_node_blocks += se->valid_blocks;
 
-			/* build discard map only one time */
-			if (is_set_ckpt_flags(sbi, CP_TRIMMED_FLAG)) {
-				memset(se->discard_map, 0xff,
-					SIT_VBLOCK_MAP_SIZE);
-			} else {
-				memcpy(se->discard_map,
-					se->cur_valid_map,
-					SIT_VBLOCK_MAP_SIZE);
-				sbi->discard_blks +=
-					sbi->blocks_per_seg -
-					se->valid_blocks;
+			if (small_discard) {
+				/* build discard map only one time */
+				if (is_set_ckpt_flags(sbi, CP_TRIMMED_FLAG)) {
+					memset(se->discard_map, 0xff,
+						SIT_VBLOCK_MAP_SIZE);
+				} else {
+					memcpy(se->discard_map,
+						se->cur_valid_map,
+						SIT_VBLOCK_MAP_SIZE);
+					sbi->discard_blks +=
+						sbi->blocks_per_seg -
+						se->valid_blocks;
+				}
 			}
 
 			if (__is_large_section(sbi))
@@ -4535,13 +4556,15 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 		if (IS_NODESEG(se->type))
 			total_node_blocks += se->valid_blocks;
 
-		if (is_set_ckpt_flags(sbi, CP_TRIMMED_FLAG)) {
-			memset(se->discard_map, 0xff, SIT_VBLOCK_MAP_SIZE);
-		} else {
-			memcpy(se->discard_map, se->cur_valid_map,
-						SIT_VBLOCK_MAP_SIZE);
-			sbi->discard_blks += old_valid_blocks;
-			sbi->discard_blks -= se->valid_blocks;
+		if (small_discard) {
+			if (is_set_ckpt_flags(sbi, CP_TRIMMED_FLAG)) {
+				memset(se->discard_map, 0xff, SIT_VBLOCK_MAP_SIZE);
+			} else {
+				memcpy(se->discard_map, se->cur_valid_map,
+							SIT_VBLOCK_MAP_SIZE);
+				sbi->discard_blks += old_valid_blocks;
+				sbi->discard_blks -= se->valid_blocks;
+			}
 		}
 
 		if (__is_large_section(sbi)) {
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 18c1ffb8710e..98f0a84d1b1f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -155,6 +155,7 @@ enum {
 	Opt_atgc,
 	Opt_gc_merge,
 	Opt_nogc_merge,
+	Opt_nosmall_discard,
 	Opt_err,
 };
 
@@ -231,6 +232,7 @@ static match_table_t f2fs_tokens = {
 	{Opt_atgc, "atgc"},
 	{Opt_gc_merge, "gc_merge"},
 	{Opt_nogc_merge, "nogc_merge"},
+	{Opt_nosmall_discard, "nosmall_discard"},
 	{Opt_err, NULL},
 };
 
@@ -1173,6 +1175,9 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		case Opt_nogc_merge:
 			clear_opt(sbi, GC_MERGE);
 			break;
+		case Opt_nosmall_discard:
+			set_opt(sbi, NOSMALL_DISCARD);
+			break;
 		default:
 			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
 				 p);
@@ -1925,6 +1930,8 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 
 	if (test_opt(sbi, ATGC))
 		seq_puts(seq, ",atgc");
+	if (test_opt(sbi, NOSMALL_DISCARD))
+		seq_puts(seq, ",nosmall_discard");
 	return 0;
 }
 
@@ -2066,6 +2073,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	bool no_io_align = !F2FS_IO_ALIGNED(sbi);
 	bool no_atgc = !test_opt(sbi, ATGC);
 	bool no_compress_cache = !test_opt(sbi, COMPRESS_CACHE);
+	bool small_discard = !test_opt(sbi, NOSMALL_DISCARD);
 #ifdef CONFIG_QUOTA
 	int i, j;
 #endif
@@ -2166,6 +2174,12 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		goto restore_opts;
 	}
 
+	if (small_discard == !!test_opt(sbi, NOSMALL_DISCARD)) {
+		err = -EINVAL;
+		f2fs_warn(sbi, "switch nosmall_discard option is not allowed");
+		goto restore_opts;
+	}
+
 	if ((*flags & SB_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
 		err = -EINVAL;
 		f2fs_warn(sbi, "disabling checkpoint not compatible with read-only");
@@ -3779,7 +3793,8 @@ static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
 	/* adjust parameters according to the volume size */
 	if (sm_i->main_segments <= SMALL_VOLUME_SEGMENTS) {
 		F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_REUSE;
-		sm_i->dcc_info->discard_granularity = 1;
+		if (!test_opt(sbi, NOSMALL_DISCARD))
+			sm_i->dcc_info->discard_granularity = 1;
 		sm_i->ipu_policy = 1 << F2FS_IPU_FORCE;
 	}
 
-- 
2.22.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
