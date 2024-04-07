Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0A489B0EE
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  7 Apr 2024 15:02:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rtSAD-0005xe-0X;
	Sun, 07 Apr 2024 13:02:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rtSAA-0005x1-Ny
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 07 Apr 2024 13:02:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+O1GNke8O9CoGS1WIEDQlxDZXFSpcoUqYMcmOBIc4gs=; b=CDyEGrpcfXeXzaLbgfqluwnR/F
 Ndu7qna4UWKTZwDLiBCIX6DLQkffhcV1ImKzzlq6hpZwv1UqywEVub2pD2MohQtPzruDnUT8KM4SF
 Z5TeHryR+MKajOh5WzNnuFRkrJdW9XfCMeIQCKsX0rr6TKwIAXlwYPmuMTHQvLi7WtZc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+O1GNke8O9CoGS1WIEDQlxDZXFSpcoUqYMcmOBIc4gs=; b=b
 i9QJljhb0I1sl3MjHWMP6lwCiRY4C3294E6dbuvgG2McNUxI92lRTPcrV9APOkABCxgnjWfeR9wil
 YTwZlPI5uhwkfhJ53PC9txyw69m/dXqFww+RPMw7ecYXYzvm5secTPekHYqUMIqdUFI4SiUCGparh
 coge0axcQkSrV6+k=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rtSA1-0000V9-8Z for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 07 Apr 2024 13:02:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BA2CCCE0A1D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  7 Apr 2024 13:02:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A97C433C7;
 Sun,  7 Apr 2024 13:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712494921;
 bh=83E515a2nO7sRb4gFRv6JWkPvQiwSgf/9QRVASfeg24=;
 h=From:To:Cc:Subject:Date:From;
 b=akv/2Iv9tOQN9h9nheDTrnyaoqEAJVxBglrU0gpJtOIebqXXkg/adFuM68hRzfiQ2
 ioXnCXgGAg8OQlmyQuAaKaGIKLJzD/v4SZ4h3RSVujiS7knJ7D6oVD/AUb6/pQJSIq
 NkA/MnwxzWnvlVDT2J395YklxKlLJNcnaTD6yzy0qtgtVyCVp/YX3d91HnM2bLeMsR
 3ISX11LLmkX5CGMwunJMXjzf1MPVzPpBecFSVZiC6UXLyZQpQiWXtRwLNDxBIcw6Nc
 U+j9F1LP0Q5W6qqRrQmQdcCVN+b5yAFTuvC+8l2w7FwmUFOZGbbLcVjFPe0HAuuvc7
 ObMcskCm7RnKg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun,  7 Apr 2024 21:01:54 +0800
Message-Id: <20240407130155.3602415-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -4.9 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: After commit 899fee36fac0 ("f2fs: fix to avoid data
 corruption
 by forbidding SSR overwrite"), valid block bitmap of current openned segment
 is fixed, let's introduce a per-log bitmap instead of temp b [...] 
 Content analysis details:   (-4.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -2.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rtSA1-0000V9-8Z
Subject: [f2fs-dev] [PATCH 1/2] f2fs: use per-log target_bitmap to improve
 lookup performace of ssr allocation
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

After commit 899fee36fac0 ("f2fs: fix to avoid data corruption by
forbidding SSR overwrite"), valid block bitmap of current openned
segment is fixed, let's introduce a per-log bitmap instead of temp
bitmap to avoid unnecessary calculation overhead whenever allocating
free slot w/ SSR allocator.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c | 30 ++++++++++++++++++++++--------
 fs/f2fs/segment.h |  1 +
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 4a3cf2888faf..ecb9ee80d5e0 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2840,31 +2840,39 @@ static int new_curseg(struct f2fs_sb_info *sbi, int type, bool new_sec)
 	return 0;
 }
 
-static int __next_free_blkoff(struct f2fs_sb_info *sbi,
-					int segno, block_t start)
+static void __get_segment_bitmap(struct f2fs_sb_info *sbi,
+					unsigned long *target_map,
+					int segno)
 {
 	struct seg_entry *se = get_seg_entry(sbi, segno);
 	int entries = SIT_VBLOCK_MAP_SIZE / sizeof(unsigned long);
-	unsigned long *target_map = SIT_I(sbi)->tmp_map;
 	unsigned long *ckpt_map = (unsigned long *)se->ckpt_valid_map;
 	unsigned long *cur_map = (unsigned long *)se->cur_valid_map;
 	int i;
 
 	for (i = 0; i < entries; i++)
 		target_map[i] = ckpt_map[i] | cur_map[i];
+}
+
+static int __next_free_blkoff(struct f2fs_sb_info *sbi, unsigned long *bitmap,
+					int segno, block_t start)
+{
+	__get_segment_bitmap(sbi, bitmap, segno);
 
-	return __find_rev_next_zero_bit(target_map, BLKS_PER_SEG(sbi), start);
+	return __find_rev_next_zero_bit(bitmap, BLKS_PER_SEG(sbi), start);
 }
 
 static int f2fs_find_next_ssr_block(struct f2fs_sb_info *sbi,
-		struct curseg_info *seg)
+					struct curseg_info *seg)
 {
-	return __next_free_blkoff(sbi, seg->segno, seg->next_blkoff + 1);
+	return __find_rev_next_zero_bit(seg->target_map,
+				BLKS_PER_SEG(sbi), seg->next_blkoff + 1);
 }
 
 bool f2fs_segment_has_free_slot(struct f2fs_sb_info *sbi, int segno)
 {
-	return __next_free_blkoff(sbi, segno, 0) < BLKS_PER_SEG(sbi);
+	return __next_free_blkoff(sbi, SIT_I(sbi)->tmp_map, segno, 0) <
+							BLKS_PER_SEG(sbi);
 }
 
 /*
@@ -2890,7 +2898,8 @@ static int change_curseg(struct f2fs_sb_info *sbi, int type)
 
 	reset_curseg(sbi, type, 1);
 	curseg->alloc_type = SSR;
-	curseg->next_blkoff = __next_free_blkoff(sbi, curseg->segno, 0);
+	curseg->next_blkoff = __next_free_blkoff(sbi, curseg->target_map,
+							curseg->segno, 0);
 
 	sum_page = f2fs_get_sum_page(sbi, new_segno);
 	if (IS_ERR(sum_page)) {
@@ -4652,6 +4661,10 @@ static int build_curseg(struct f2fs_sb_info *sbi)
 				sizeof(struct f2fs_journal), GFP_KERNEL);
 		if (!array[i].journal)
 			return -ENOMEM;
+		array[i].target_map = f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE,
+								GFP_KERNEL);
+		if (!array[i].target_map)
+			return -ENOMEM;
 		if (i < NR_PERSISTENT_LOG)
 			array[i].seg_type = CURSEG_HOT_DATA + i;
 		else if (i == CURSEG_COLD_DATA_PINNED)
@@ -5470,6 +5483,7 @@ static void destroy_curseg(struct f2fs_sb_info *sbi)
 	for (i = 0; i < NR_CURSEG_TYPE; i++) {
 		kfree(array[i].sum_blk);
 		kfree(array[i].journal);
+		kfree(array[i].target_map);
 
 #ifdef CONFIG_BLK_DEV_ZONED
 		if (f2fs_sb_has_blkzoned(sbi)) {
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 855978ca869f..08d667e6a36f 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -293,6 +293,7 @@ struct curseg_info {
 	struct f2fs_summary_block *sum_blk;	/* cached summary block */
 	struct rw_semaphore journal_rwsem;	/* protect journal area */
 	struct f2fs_journal *journal;		/* cached journal info */
+	unsigned long *target_map;		/* bitmap for SSR allocator */
 	unsigned char alloc_type;		/* current allocation type */
 	unsigned short seg_type;		/* segment type like CURSEG_XXX_TYPE */
 	unsigned int segno;			/* current segment number */
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
