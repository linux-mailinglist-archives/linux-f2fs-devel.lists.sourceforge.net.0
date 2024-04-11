Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DE38A0B16
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Apr 2024 10:24:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rupjE-0002vH-Aw;
	Thu, 11 Apr 2024 08:24:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rupjD-0002vA-67
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Apr 2024 08:24:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r1ug/qSJCZq/++Bx7vjscSyog+DPdnfsiwWoXEuOK4E=; b=UZBeb/cgFjaKM0+9hmIGT8l6Rz
 6eCC9EtObOf8EfVO1tcJLwnNXJ4vJIf9AOqmws4O4EDATq5mquhXZExY6RmoVYplSbVpFGIwclGI5
 w8eGjqRX7tZBxPnLdT5XGEHOOsrJEKzga4BLHmJNtpa0O+Bgs1wgbpPDqdVBakoc+70g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r1ug/qSJCZq/++Bx7vjscSyog+DPdnfsiwWoXEuOK4E=; b=YeKYQlY1lEURpbrUeC0KzbTufJ
 fEvK7vAgtBWanyH438NV1uLAUdwCG14yssNTlG+qfSHt5lRTBbdDKG7ZT+TwVdnBbR0+E8AsRRUSX
 0oggMU64tz7hZ1LO5jzi9wUkrBbn46YvoaqPjBdVFX3dQmskLbnIMw+J0aeuY3ny5TeA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rupjB-0003lx-UD for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Apr 2024 08:24:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D517F61FF2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Apr 2024 08:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB15C433F1;
 Thu, 11 Apr 2024 08:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712823846;
 bh=1hvUBYI/Rg9a1ewLzoki6lOEsbXv62celAuWn3Eyce4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LBO7JyDp9Z7Qfi+TjJIrQJLvtZM7idRVKoSbN14Z98ReA0VGOLXiqvI5fZbzVvw0a
 bXIfjeXNbFpBApDcNGi79qinkcxy6+e8BIaUe5R+ZTEHMg0Rh4Ipawcs709UfBxTOL
 eHo93ey64etY/MDir4ZWtG7J7LVpYzkvmfscUsE40eAmDoJtGRLs0lr59MNzm57OLr
 IxBqbQLQUdlxuc3zW8gk8Ay4/2r7ldC25JM+6klvJFbYbVcKHipvFXk6Tzou8SE3jj
 GOtwSKdYYDwHQPIP/4coNnr0sn4xMgSyGbtF6rw350BzlUPg+oy+DOy6lDjyAK6hV9
 zg/bPrBX4pAoQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 11 Apr 2024 16:23:54 +0800
Message-Id: <20240411082354.1691820-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240411082354.1691820-1-chao@kernel.org>
References: <20240411082354.1691820-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently, __exchange_data_block() will check checkpointed
 state of data, if it is not checkpointed, it will try to exchange blkaddrs
 directly in dnode. However, after commit 899fee36fac0 ("f2fs: fix to avoid
 data corruption by forbidding SSR overwrite"),
 in order to disallow SSR allocator
 to reuse all written data/node type blocks, all written blocks [...] 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rupjB-0003lx-UD
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: introduce written_map to indicate
 written datas
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

Currently, __exchange_data_block() will check checkpointed state of data,
if it is not checkpointed, it will try to exchange blkaddrs directly in
dnode.

However, after commit 899fee36fac0 ("f2fs: fix to avoid data corruption
by forbidding SSR overwrite"), in order to disallow SSR allocator to
reuse all written data/node type blocks, all written blocks were set as
checkpointed.

In order to reenable metadata exchange functionality, let's introduce
written_map to indicate all written blocks including checkpointed one,
or newly written and invalidated one, and use it for SSR allocation,
and then ckpt_valid_bitmap can indicate real checkpointed status, and
we can use it correctly in __exchange_data_block().

[testcase]
xfs_io -f /mnt/f2fs/src -c "pwrite 0 2m"
xfs_io -f /mnt/f2fs/dst -c "pwrite 0 2m"
xfs_io /mnt/f2fs/src -c "fiemap -v"
xfs_io /mnt/f2fs/dst -c "fiemap -v"
f2fs_io move_range /mnt/f2fs/src /mnt/f2fs/dst 0 0 2097152
xfs_io /mnt/f2fs/src -c "fiemap -v"
xfs_io /mnt/f2fs/dst -c "fiemap -v"

[before]
/mnt/f2fs/src:
 EXT: FILE-OFFSET      BLOCK-RANGE      TOTAL FLAGS
   0: [0..4095]:       8445952..8450047  4096 0x1001
/mnt/f2fs/dst:
 EXT: FILE-OFFSET      BLOCK-RANGE      TOTAL FLAGS
   0: [0..4095]:       143360..147455    4096 0x1001

/mnt/f2fs/src:
/mnt/f2fs/dst:
 EXT: FILE-OFFSET      BLOCK-RANGE      TOTAL FLAGS
   0: [0..4095]:       4284416..4288511  4096 0x1001

[after]
/mnt/f2fs/src:
 EXT: FILE-OFFSET      BLOCK-RANGE      TOTAL FLAGS
   0: [0..4095]:       147456..151551    4096 0x1001
/mnt/f2fs/dst:
 EXT: FILE-OFFSET      BLOCK-RANGE      TOTAL FLAGS
   0: [0..4095]:       151552..155647    4096 0x1001

/mnt/f2fs/src:
/mnt/f2fs/dst:
 EXT: FILE-OFFSET      BLOCK-RANGE      TOTAL FLAGS
   0: [0..4095]:       147456..151551    4096 0x1001

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- introduce written_blocks in struct seg_entry for
ssr allocator.
 fs/f2fs/gc.c      |  2 +-
 fs/f2fs/segment.c | 22 ++++++++++++----------
 fs/f2fs/segment.h | 19 ++++++++++++++-----
 3 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 8852814dab7f..ea7b5ca6f09b 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -366,7 +366,7 @@ static inline unsigned int get_gc_cost(struct f2fs_sb_info *sbi,
 			unsigned int segno, struct victim_sel_policy *p)
 {
 	if (p->alloc_mode == SSR)
-		return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
+		return get_seg_entry(sbi, segno)->written_blocks;
 
 	/* alloc_mode == LFS */
 	if (p->gc_mode == GC_GREEDY)
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index af716925db19..0d110908e383 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2456,12 +2456,13 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 			sbi->discard_blks--;
 
 		/*
-		 * SSR should never reuse block which is checkpointed
-		 * or newly invalidated.
+		 * if CP disabling is enable, it allows SSR to reuse newly
+		 * invalidated block, otherwise forbidding it to pretect fsyned
+		 * datas.
 		 */
 		if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
-			if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map))
-				se->ckpt_valid_blocks++;
+			if (!f2fs_test_and_set_bit(offset, se->written_map))
+				se->written_blocks++;
 		}
 	} else {
 		exist = f2fs_test_and_clear_bit(offset, se->cur_valid_map);
@@ -2498,8 +2499,6 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 			f2fs_test_and_clear_bit(offset, se->discard_map))
 			sbi->discard_blks++;
 	}
-	if (!f2fs_test_bit(offset, se->ckpt_valid_map))
-		se->ckpt_valid_blocks += del;
 
 	__mark_sit_entry_dirty(sbi, segno);
 
@@ -2847,11 +2846,11 @@ static void __get_segment_bitmap(struct f2fs_sb_info *sbi,
 	struct seg_entry *se = get_seg_entry(sbi, segno);
 	int entries = SIT_VBLOCK_MAP_SIZE / sizeof(unsigned long);
 	unsigned long *ckpt_map = (unsigned long *)se->ckpt_valid_map;
-	unsigned long *cur_map = (unsigned long *)se->cur_valid_map;
+	unsigned long *written_map = (unsigned long *)se->written_map;
 	int i;
 
 	for (i = 0; i < entries; i++)
-		target_map[i] = ckpt_map[i] | cur_map[i];
+		target_map[i] = ckpt_map[i] | written_map[i];
 }
 
 static int __next_free_blkoff(struct f2fs_sb_info *sbi, unsigned long *bitmap,
@@ -4512,9 +4511,9 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 		return -ENOMEM;
 
 #ifdef CONFIG_F2FS_CHECK_FS
-	bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * (3 + discard_map);
+	bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * (4 + discard_map);
 #else
-	bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * (2 + discard_map);
+	bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * (3 + discard_map);
 #endif
 	sit_i->bitmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
 	if (!sit_i->bitmap)
@@ -4529,6 +4528,9 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 		sit_i->sentries[start].ckpt_valid_map = bitmap;
 		bitmap += SIT_VBLOCK_MAP_SIZE;
 
+		sit_i->sentries[start].written_map = bitmap;
+		bitmap += SIT_VBLOCK_MAP_SIZE;
+
 #ifdef CONFIG_F2FS_CHECK_FS
 		sit_i->sentries[start].cur_valid_map_mir = bitmap;
 		bitmap += SIT_VBLOCK_MAP_SIZE;
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 10f3e44f036f..71131a0b00d7 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -191,10 +191,11 @@ struct victim_sel_policy {
 };
 
 struct seg_entry {
-	unsigned int type:6;		/* segment type like CURSEG_XXX_TYPE */
-	unsigned int valid_blocks:10;	/* # of valid blocks */
-	unsigned int ckpt_valid_blocks:10;	/* # of valid blocks last cp */
-	unsigned int padding:6;		/* padding */
+	unsigned long long type:6;		/* segment type like CURSEG_XXX_TYPE */
+	unsigned long long valid_blocks:10;	/* # of valid blocks */
+	unsigned long long ckpt_valid_blocks:10;/* # of valid blocks last cp */
+	unsigned long long written_blocks:10;	/* # of written blocks */
+	unsigned long long padding:28;		/* padding */
 	unsigned char *cur_valid_map;	/* validity bitmap of blocks */
 #ifdef CONFIG_F2FS_CHECK_FS
 	unsigned char *cur_valid_map_mir;	/* mirror of current valid bitmap */
@@ -204,6 +205,10 @@ struct seg_entry {
 	 * checkpoint pack. This information is used by the SSR mode.
 	 */
 	unsigned char *ckpt_valid_map;	/* validity bitmap of blocks last cp */
+	unsigned char *written_map;	/*
+					 * blocks were written, including newly
+					 * invalidated data
+					 */
 	unsigned char *discard_map;
 	unsigned long long mtime;	/* modification time of the segment */
 };
@@ -366,9 +371,11 @@ static inline void seg_info_from_raw_sit(struct seg_entry *se,
 					struct f2fs_sit_entry *rs)
 {
 	se->valid_blocks = GET_SIT_VBLOCKS(rs);
-	se->ckpt_valid_blocks = GET_SIT_VBLOCKS(rs);
+	se->ckpt_valid_blocks = se->valid_blocks;
+	se->written_blocks = se->valid_blocks;
 	memcpy(se->cur_valid_map, rs->valid_map, SIT_VBLOCK_MAP_SIZE);
 	memcpy(se->ckpt_valid_map, rs->valid_map, SIT_VBLOCK_MAP_SIZE);
+	memcpy(se->written_map, rs->valid_map, SIT_VBLOCK_MAP_SIZE);
 #ifdef CONFIG_F2FS_CHECK_FS
 	memcpy(se->cur_valid_map_mir, rs->valid_map, SIT_VBLOCK_MAP_SIZE);
 #endif
@@ -411,7 +418,9 @@ static inline void seg_info_to_raw_sit(struct seg_entry *se,
 	__seg_info_to_raw_sit(se, rs);
 
 	memcpy(se->ckpt_valid_map, rs->valid_map, SIT_VBLOCK_MAP_SIZE);
+	memcpy(se->written_map, rs->valid_map, SIT_VBLOCK_MAP_SIZE);
 	se->ckpt_valid_blocks = se->valid_blocks;
+	se->written_blocks = se->valid_blocks;
 }
 
 static inline unsigned int find_next_inuse(struct free_segmap_info *free_i,
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
