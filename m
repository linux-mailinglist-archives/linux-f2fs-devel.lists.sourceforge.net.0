Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C5A3DC293
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 31 Jul 2021 04:11:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m9eTQ-0004sG-8X; Sat, 31 Jul 2021 02:11:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1m9eTO-0004sA-Ra
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Jul 2021 02:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NpCpp0YYXXn5tt3i7kUYh02VD8FmujMJBuW7QgZcY8M=; b=lSaxR429OIUSSulHOLEBI8UNGP
 Y5sT/ftevbg31AxKsbHaMHU+bbs0k2VhlpEugIyObeEjHk7DP+VLMbb1xyULtp2Ngaa+77FFMP4FY
 hhQbBtP3Pqb4HKNsL4dApmze1fg++wc6VYncBIgDUwW0QaHysK4COxrpOc00VngGg574=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NpCpp0YYXXn5tt3i7kUYh02VD8FmujMJBuW7QgZcY8M=; b=V
 LI/x5h4LUEVC7u9+FKrIKHfmk4UvUsZznl2PUn88HXPC6FRDUkDDXJlWvOXiqpURFJBF6ueq0i0cb
 HASg6PlzinuPx+9GDjHvGQ6ZvvmzNojjYSfnpUfVaAvVvVRTUOXnmHaRTM/9gu+4wrDmq0BTnRQjC
 9NhRJpgQReuPxBkA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m9eTJ-008GED-35
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Jul 2021 02:11:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B5B560EFE;
 Sat, 31 Jul 2021 02:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627697478;
 bh=5bZ1pvvQvcQ8BuMfxK8+TcXWXqDvoEz4Ktd4tNa4VDg=;
 h=From:To:Cc:Subject:Date:From;
 b=nRxheijTshg5Z8RjCkqPsQERiL6ihGwrwXtsa1Nb9Uq3Ql/fLhpS2DEK8WSyjLx8q
 ZQDQVNdM9XEXgAZgbBS71fhug9YCZOEFnL503nYZEaoCG37OWO/xqZiUWngMrx3Oi7
 IiGhwpnGWSv1Vr1cU16VnkolxIFg/sD/LT2kq2g1ZDjVRugh4fQrMtE1Tf/sw4J5gz
 5JDvVE13pVoPkVWmKYByiT42jHL4uoo+/Iowvh8zebb2jjVseBhegr3TOFUlz5MVi9
 3d4Ha/bZNiqarfTY/oPpfociLgNcqMoI9EoivPgqHKVKYUKJS1E3yVmedG25JfI42A
 Ld3h04rKkAbQw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sat, 31 Jul 2021 10:11:11 +0800
Message-Id: <20210731021111.14108-1-chao@kernel.org>
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
X-Headers-End: 1m9eTJ-008GED-35
Subject: [f2fs-dev] [PATCH] f2fs: introduce discard_unit mount option
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

This patch introduces a new mountoption "discard_unit=block|segment|
section" to support issuing discard with different basic unit which is
aligned to block, segment or section, so that user can specify
"discard_unit=segment" or "discard_unit=section" to disable small
discard functionality.

Note that this mount option can not be changed by remount() due to
related metadata need to be initialized during mount().

In order to save memory, let's use "discard_unit=section" for blkzoned
device by default.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/filesystems/f2fs.rst |  8 +++
 fs/f2fs/f2fs.h                     | 16 +++++
 fs/f2fs/segment.c                  | 93 ++++++++++++++++++++----------
 fs/f2fs/super.c                    | 54 ++++++++++++++++-
 fs/f2fs/sysfs.c                    |  2 +
 5 files changed, 138 insertions(+), 35 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index ff9e7cc97c65..8f251a662542 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -312,6 +312,14 @@ inlinecrypt		 When possible, encrypt/decrypt the contents of encrypted
 			 Documentation/block/inline-encryption.rst.
 atgc			 Enable age-threshold garbage collection, it provides high
 			 effectiveness and efficiency on background GC.
+discard_unit=%s		 Control discard unit, the argument can be "block", "segment"
+			 and "section", issued discard command's offset/size will be
+			 aligned to the unit, by default, "discard_unit=block" is set,
+			 so that small discard functionality is enabled.
+			 For blkzoned device, "discard_unit=section" will be set by
+			 default, it is helpful for large sized SMR or ZNS devices to
+			 reduce memory cost by getting rid of fs metadata supports small
+			 discard.
 ======================== ============================================================
 
 Debugfs Entries
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5d16486feb8f..316334a25c32 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -139,6 +139,11 @@ struct f2fs_mount_info {
 	int fsync_mode;			/* fsync policy */
 	int fs_mode;			/* fs mode: LFS or ADAPTIVE */
 	int bggc_mode;			/* bggc mode: off, on or sync */
+	int discard_unit;		/*
+					 * discard command's offset/size should
+					 * be aligned to this unit: block,
+					 * segment or section
+					 */
 	struct fscrypt_dummy_policy dummy_enc_policy; /* test dummy encryption */
 	block_t unusable_cap_perc;	/* percentage for cap */
 	block_t unusable_cap;		/* Amount of space allowed to be
@@ -1299,6 +1304,12 @@ enum {
 				 */
 };
 
+enum {
+	DISCARD_UNIT_BLOCK,	/* basic discard unit is block */
+	DISCARD_UNIT_SEGMENT,	/* basic discard unit is segment */
+	DISCARD_UNIT_SECTION,	/* basic discard unit is section */
+};
+
 static inline int f2fs_test_bit(unsigned int nr, char *addr);
 static inline void f2fs_set_bit(unsigned int nr, char *addr);
 static inline void f2fs_clear_bit(unsigned int nr, char *addr);
@@ -4367,6 +4378,11 @@ static inline bool is_journalled_quota(struct f2fs_sb_info *sbi)
 	return false;
 }
 
+static inline bool f2fs_enable_small_discard(struct f2fs_sb_info *sbi)
+{
+	return F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_BLOCK;
+}
+
 #define EFSBADCRC	EBADMSG		/* Bad CRC detected */
 #define EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index f9b7fb785e1d..d5d3a231de25 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1871,6 +1871,7 @@ static int f2fs_issue_discard(struct f2fs_sb_info *sbi,
 	unsigned int offset;
 	block_t i;
 	int err = 0;
+	bool small_discard = f2fs_enable_small_discard(sbi);
 
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
+			!f2fs_enable_small_discard(sbi))
 		return false;
 
 	if (!force) {
@@ -2003,14 +2007,18 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 	unsigned int start = 0, end = -1;
 	unsigned int secno, start_segno;
 	bool force = (cpc->reason & CP_DISCARD);
-	bool need_align = f2fs_lfs_mode(sbi) && __is_large_section(sbi);
+	bool section_alignment = F2FS_OPTION(sbi).discard_unit ==
+						DISCARD_UNIT_SECTION;
+
+	if (f2fs_lfs_mode(sbi) && __is_large_section(sbi))
+		section_alignment = true;
 
 	mutex_lock(&dirty_i->seglist_lock);
 
 	while (1) {
 		int i;
 
-		if (need_align && end != -1)
+		if (section_alignment && end != -1)
 			end--;
 		start = find_next_bit(prefree_map, MAIN_SEGS(sbi), end + 1);
 		if (start >= MAIN_SEGS(sbi))
@@ -2018,7 +2026,7 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 		end = find_next_zero_bit(prefree_map, MAIN_SEGS(sbi),
 								start + 1);
 
-		if (need_align) {
+		if (section_alignment) {
 			start = rounddown(start, sbi->segs_per_sec);
 			end = roundup(end, sbi->segs_per_sec);
 		}
@@ -2056,6 +2064,9 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 	}
 	mutex_unlock(&dirty_i->seglist_lock);
 
+	if (!f2fs_enable_small_discard(sbi))
+		goto wakeup;
+
 	/* send small discards */
 	list_for_each_entry_safe(entry, this, head, list) {
 		unsigned int cur_pos = 0, next_pos, len, total_len = 0;
@@ -2089,6 +2100,7 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 		dcc->nr_discards -= total_len;
 	}
 
+wakeup:
 	wake_up_discard_thread(sbi, false);
 }
 
@@ -2108,6 +2120,11 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 		return -ENOMEM;
 
 	dcc->discard_granularity = DEFAULT_DISCARD_GRANULARITY;
+	if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SEGMENT)
+		dcc->discard_granularity = sbi->blocks_per_seg;
+	else if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SECTION)
+		dcc->discard_granularity = BLKS_PER_SEC(sbi);
+
 	INIT_LIST_HEAD(&dcc->entry_list);
 	for (i = 0; i < MAX_PLIST_NUM; i++)
 		INIT_LIST_HEAD(&dcc->pend_list[i]);
@@ -2255,8 +2272,10 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 			del = 0;
 		}
 
-		if (!f2fs_test_and_set_bit(offset, se->discard_map))
-			sbi->discard_blks--;
+		if (f2fs_enable_small_discard(sbi)) {
+			if (!f2fs_test_and_set_bit(offset, se->discard_map))
+				sbi->discard_blks--;
+		}
 
 		/*
 		 * SSR should never reuse block which is checkpointed
@@ -2297,8 +2316,10 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 			}
 		}
 
-		if (f2fs_test_and_clear_bit(offset, se->discard_map))
-			sbi->discard_blks++;
+		if (f2fs_enable_small_discard(sbi)) {
+			if (f2fs_test_and_clear_bit(offset, se->discard_map))
+				sbi->discard_blks++;
+		}
 	}
 	if (!f2fs_test_bit(offset, se->ckpt_valid_map))
 		se->ckpt_valid_blocks += del;
@@ -4282,6 +4303,7 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 	unsigned int sit_segs, start;
 	char *src_bitmap, *bitmap;
 	unsigned int bitmap_size, main_bitmap_size, sit_bitmap_size;
+	unsigned int discard_map = f2fs_enable_small_discard(sbi) ? 1 : 0;
 
 	/* allocate memory for SIT information */
 	sit_i = f2fs_kzalloc(sbi, sizeof(struct sit_info), GFP_KERNEL);
@@ -4304,9 +4326,9 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
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
@@ -4326,8 +4348,10 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
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
@@ -4462,6 +4486,7 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 	unsigned int readed, start_blk = 0;
 	int err = 0;
 	block_t total_node_blocks = 0;
+	bool small_discard = f2fs_enable_small_discard(sbi);
 
 	do {
 		readed = f2fs_ra_meta_pages(sbi, start_blk, BIO_MAX_VECS,
@@ -4489,17 +4514,19 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
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
@@ -4535,13 +4562,15 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
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
index 18c1ffb8710e..e472ebf5c84b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -155,6 +155,7 @@ enum {
 	Opt_atgc,
 	Opt_gc_merge,
 	Opt_nogc_merge,
+	Opt_discard_unit,
 	Opt_err,
 };
 
@@ -231,6 +232,7 @@ static match_table_t f2fs_tokens = {
 	{Opt_atgc, "atgc"},
 	{Opt_gc_merge, "gc_merge"},
 	{Opt_nogc_merge, "nogc_merge"},
+	{Opt_discard_unit, "discard_unit=%s"},
 	{Opt_err, NULL},
 };
 
@@ -1173,6 +1175,25 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		case Opt_nogc_merge:
 			clear_opt(sbi, GC_MERGE);
 			break;
+		case Opt_discard_unit:
+			name = match_strdup(&args[0]);
+			if (!name)
+				return -ENOMEM;
+			if (!strcmp(name, "block")) {
+				F2FS_OPTION(sbi).discard_unit =
+						DISCARD_UNIT_BLOCK;
+			} else if (!strcmp(name, "segment")) {
+				F2FS_OPTION(sbi).discard_unit =
+						DISCARD_UNIT_SEGMENT;
+			} else if (!strcmp(name, "section")) {
+				F2FS_OPTION(sbi).discard_unit =
+						DISCARD_UNIT_SECTION;
+			} else {
+				kfree(name);
+				return -EINVAL;
+			}
+			kfree(name);
+			break;
 		default:
 			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
 				 p);
@@ -1211,6 +1232,14 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		return -EINVAL;
 	}
 #endif
+	if (f2fs_sb_has_blkzoned(sbi)) {
+		if (F2FS_OPTION(sbi).discard_unit !=
+						DISCARD_UNIT_SECTION) {
+			f2fs_info(sbi, "Zoned block device doesn't need small discard, set discard_unit=section by default");
+			F2FS_OPTION(sbi).discard_unit =
+					DISCARD_UNIT_SECTION;
+		}
+	}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	if (f2fs_test_compress_extension(sbi)) {
@@ -1925,6 +1954,14 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 
 	if (test_opt(sbi, ATGC))
 		seq_puts(seq, ",atgc");
+
+	if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_BLOCK)
+		seq_printf(seq, ",discard_unit=%s", "block");
+	else if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SEGMENT)
+		seq_printf(seq, ",discard_unit=%s", "segment");
+	else if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SECTION)
+		seq_printf(seq, ",discard_unit=%s", "section");
+
 	return 0;
 }
 
@@ -1961,10 +1998,13 @@ static void default_options(struct f2fs_sb_info *sbi)
 	sbi->sb->s_flags |= SB_LAZYTIME;
 	set_opt(sbi, FLUSH_MERGE);
 	set_opt(sbi, DISCARD);
-	if (f2fs_sb_has_blkzoned(sbi))
+	if (f2fs_sb_has_blkzoned(sbi)) {
 		F2FS_OPTION(sbi).fs_mode = FS_MODE_LFS;
-	else
+		F2FS_OPTION(sbi).discard_unit = DISCARD_UNIT_SECTION;
+	} else {
 		F2FS_OPTION(sbi).fs_mode = FS_MODE_ADAPTIVE;
+		F2FS_OPTION(sbi).discard_unit = DISCARD_UNIT_BLOCK;
+	}
 
 #ifdef CONFIG_F2FS_FS_XATTR
 	set_opt(sbi, XATTR_USER);
@@ -2066,6 +2106,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	bool no_io_align = !F2FS_IO_ALIGNED(sbi);
 	bool no_atgc = !test_opt(sbi, ATGC);
 	bool no_compress_cache = !test_opt(sbi, COMPRESS_CACHE);
+	bool small_discard = f2fs_enable_small_discard(sbi);
 #ifdef CONFIG_QUOTA
 	int i, j;
 #endif
@@ -2166,6 +2207,12 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		goto restore_opts;
 	}
 
+	if (small_discard != f2fs_enable_small_discard(sbi)) {
+		err = -EINVAL;
+		f2fs_warn(sbi, "switch discard_unit option is not allowed");
+		goto restore_opts;
+	}
+
 	if ((*flags & SB_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
 		err = -EINVAL;
 		f2fs_warn(sbi, "disabling checkpoint not compatible with read-only");
@@ -3779,7 +3826,8 @@ static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
 	/* adjust parameters according to the volume size */
 	if (sm_i->main_segments <= SMALL_VOLUME_SEGMENTS) {
 		F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_REUSE;
-		sm_i->dcc_info->discard_granularity = 1;
+		if (f2fs_enable_small_discard(sbi))
+			sm_i->dcc_info->discard_granularity = 1;
 		sm_i->ipu_policy = 1 << F2FS_IPU_FORCE;
 	}
 
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 20bd6f09da09..bc0ecb84dab2 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -428,6 +428,8 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 	if (!strcmp(a->attr.name, "discard_granularity")) {
 		if (t == 0 || t > MAX_PLIST_NUM)
 			return -EINVAL;
+		if (!f2fs_enable_small_discard(sbi))
+			return -EINVAL;
 		if (t == *ui)
 			return count;
 		*ui = t;
-- 
2.22.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
