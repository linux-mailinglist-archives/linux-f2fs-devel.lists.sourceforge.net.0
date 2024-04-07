Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B61589B0ED
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  7 Apr 2024 15:02:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rtS9z-000525-1H;
	Sun, 07 Apr 2024 13:02:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rtS9x-00051y-GP
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 07 Apr 2024 13:02:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q8beweUiGNNklRhRa9bmp83y4OUcSBvAkT54hYB0BoM=; b=I4OIpL8aN6ZbKn4qeTI+AIQnrc
 svDCFm0tWdDzvhqlOniP7W9dm/2KOIeJH9Q9U5N8KTR36HD8ddIzfNzARlIipn3QF8nqsecQWYkMR
 lXUmaSd9poLdyX1nngFKDzxYEEgI5jW3fntbambADlizUXz6jCVoxUfr1SEScP99oBh0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q8beweUiGNNklRhRa9bmp83y4OUcSBvAkT54hYB0BoM=; b=MLDNvkTmfwes+I2PX+SK+bDXKc
 5weRC//rnl0GsSX0zlB+NnBAUvkTHvaW2S6hy6hGjT0v1zL9D/fkL51JzUKIa+2uLD3hQOjBB019m
 wyenKIcJslcpITH3MyZhAkhRHYA42z2k+sZfleWIU55KEKxobPlpAiXow+rbW7SA7DL4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rtS9w-0000Uu-Bk for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 07 Apr 2024 13:02:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4163A60C5B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  7 Apr 2024 13:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 837FBC433F1;
 Sun,  7 Apr 2024 13:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712494922;
 bh=vlwwBg4ZiQTSQiT1cbzo/lmslvX2+yGwLAwsr5WpIc0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MIQsKGWBWYK7m/q3+X1qpdn9/qBUVzHdHBnWu7e1zMKCHCf0Vb+QYzMDS7w76YKSW
 xxDoxsmQ9xCjapjbDlZgVCkAga2Ekutjs1UkPZqcd6uGTrZkdJSf6OmwNEZBrjkwDX
 LXj7Ygn6/f8cC9+bX5sNdKrIxhdNmVeGxHi7SjCLAGUl7sFOuRmZ6FPTdUt507olqk
 ifdqlrtfh7Wjk++PQseDpyHAt0KDI4bk3KiUUtv1H97LVuBok6ghbgKr6BGp+KMiQ+
 fsrHIjDcoVEi5ILxAcDpuEoxamM2mAw7MFDKqRvw9nev8wuQqLoQuX2cGdN4Fq2BgJ
 NP0m8Y6ZWu3XA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun,  7 Apr 2024 21:01:55 +0800
Message-Id: <20240407130155.3602415-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240407130155.3602415-1-chao@kernel.org>
References: <20240407130155.3602415-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -7.6 (-------)
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
 Content analysis details:   (-7.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rtS9w-0000Uu-Bk
Subject: [f2fs-dev] [PATCH 2/2] f2fs: introduce written_map to indicate
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
 fs/f2fs/segment.c | 24 ++++++++++++------------
 fs/f2fs/segment.h |  6 ++++++
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index ecb9ee80d5e0..ec3288381397 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2456,13 +2456,12 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 			sbi->discard_blks--;
 
 		/*
-		 * SSR should never reuse block which is checkpointed
-		 * or newly invalidated.
+		 * if CP disabling is enable, it allows SSR to reuse newly
+		 * invalidated block, otherwise forbidding it to pretect fsyned
+		 * datas.
 		 */
-		if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
-			if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map))
-				se->ckpt_valid_blocks++;
-		}
+		if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED))
+			f2fs_set_bit(offset, se->written_map);
 	} else {
 		exist = f2fs_test_and_clear_bit(offset, se->cur_valid_map);
 #ifdef CONFIG_F2FS_CHECK_FS
@@ -2498,8 +2497,6 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 			f2fs_test_and_clear_bit(offset, se->discard_map))
 			sbi->discard_blks++;
 	}
-	if (!f2fs_test_bit(offset, se->ckpt_valid_map))
-		se->ckpt_valid_blocks += del;
 
 	__mark_sit_entry_dirty(sbi, segno);
 
@@ -2847,11 +2844,11 @@ static void __get_segment_bitmap(struct f2fs_sb_info *sbi,
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
@@ -4529,9 +4526,9 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
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
@@ -4546,6 +4543,9 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 		sit_i->sentries[start].ckpt_valid_map = bitmap;
 		bitmap += SIT_VBLOCK_MAP_SIZE;
 
+		sit_i->sentries[start].written_map = bitmap;
+		bitmap += SIT_VBLOCK_MAP_SIZE;
+
 #ifdef CONFIG_F2FS_CHECK_FS
 		sit_i->sentries[start].cur_valid_map_mir = bitmap;
 		bitmap += SIT_VBLOCK_MAP_SIZE;
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 08d667e6a36f..eda04d9ed5a5 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -205,6 +205,10 @@ struct seg_entry {
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
@@ -370,6 +374,7 @@ static inline void seg_info_from_raw_sit(struct seg_entry *se,
 	se->ckpt_valid_blocks = GET_SIT_VBLOCKS(rs);
 	memcpy(se->cur_valid_map, rs->valid_map, SIT_VBLOCK_MAP_SIZE);
 	memcpy(se->ckpt_valid_map, rs->valid_map, SIT_VBLOCK_MAP_SIZE);
+	memcpy(se->written_map, rs->valid_map, SIT_VBLOCK_MAP_SIZE);
 #ifdef CONFIG_F2FS_CHECK_FS
 	memcpy(se->cur_valid_map_mir, rs->valid_map, SIT_VBLOCK_MAP_SIZE);
 #endif
@@ -412,6 +417,7 @@ static inline void seg_info_to_raw_sit(struct seg_entry *se,
 	__seg_info_to_raw_sit(se, rs);
 
 	memcpy(se->ckpt_valid_map, rs->valid_map, SIT_VBLOCK_MAP_SIZE);
+	memcpy(se->written_map, rs->valid_map, SIT_VBLOCK_MAP_SIZE);
 	se->ckpt_valid_blocks = se->valid_blocks;
 }
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
