Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9992FAA69E7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 May 2025 06:42:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLdnzTHhFLosG+viD3D71FHd7YN+WPjCGvUV61YtBmY=; b=IRceXH7yFZ5QNRXDMOyc0OLo+0
	2m62+Q/oFiejmPofmBS8ibAPz0MGmN/06pkr9jj3qg3FGeztt4zWOQULvWtHTRVykk5Ho3p7UW9A6
	LkhlWEZrfTJY1G8dRmw37yM982kBdgWCHpsHarBg5Mlz2hCo6MCoUg0UeqrraoIjotY4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uAiEa-0004Z0-Cn;
	Fri, 02 May 2025 04:42:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1uAiEZ-0004Yt-IF
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 May 2025 04:42:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gIxkADXBMjVS6RCtgCqDSrjckUtVBi7pgQODS/kaQHY=; b=cKpoe/HZO676wetjlemG6KDQWn
 pmqFUJ9/EZWuHMLIYFBxznceF5PdGMFlKcFX8tXy0jp6DpRLtqBXhvu+cLc0RQf4dnluvqXsDlZ/K
 RDWEPJXJKholgMdGdXzMWtPeZv68zRoiDo8y+OanLfNOWn/+DPZaToiPEhBG6zouUPf4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gIxkADXBMjVS6RCtgCqDSrjckUtVBi7pgQODS/kaQHY=; b=Xc9WrA51mpSWoz8+rctVElVNdi
 NJ/yzwlLJVxgAUPAWF/4EGvfOiBCxAXy9XD55LBMG/oFWaGvJdpx8IrerRFf5fqrNJcrIBbRXweMR
 KH6awUxco0vGDcuxFvpwJxE/eqmDXD0Ls5tgMGXJmpatc91e8VRCwIh5Y5qIQDGUFtJs=;
Received: from exvmail3.skhynix.com ([166.125.252.90]
 helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1uAiEJ-00030t-KR for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 May 2025 04:42:47 +0000
X-AuditID: a67dfc59-057ff7000000aab6-48-68144d21cb0b
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daehojeong@google.com
Date: Fri,  2 May 2025 13:41:45 +0900
Message-ID: <20250502044146.552-2-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250502044146.552-1-yohan.joung@sk.com>
References: <20250502044146.552-1-yohan.joung@sk.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrALMWRmVeSWpSXmKPExsXC9ZZnoa6Sr0iGQbe/xempZ5ksprbvZbR4
 sn4Ws8WlRe4Wl3fNYXNg9ViwqdRj06pONo/dCz4zeXzeJBfAEsVlk5Kak1mWWqRvl8CVceLF
 dNaC/zoVn/7cYG9gnKLaxcjJISFgIvHq5z9GGPv/wl8sIDabgIbEn95eZhBbRMBJ4v+NdvYu
 Ri4OZoE2Ron2o02sIAlhAQ+JQw9/gNksAqoSvz79YgOxeQVMJV5cPcIEMVRTYseX80A2Bwen
 gJlEzws7kLAQUMmfPy/ZIcoFJU7OfAK2l1lAXqJ562xmkF0SAh1sEvs372OBmCMpcXDFDZYJ
 jPyzkPTMQtKzgJFpFaNIZl5ZbmJmjrFecXZGZV5mhV5yfu4mRmA4Lqv9E7mD8duF4EOMAhyM
 Sjy8AQXCGUKsiWXFlbmHGCU4mJVEeGMMgEK8KYmVValF+fFFpTmpxYcYpTlYlMR5jb6VpwgJ
 pCeWpGanphakFsFkmTg4pRoYTWx9dy6xepx7e0VsqIp32pvsNfuLjs5K2jV3720xhj0sd9MO
 G5SXzjI557Kl//G1f2bGH1IbL/C+auA9sapxv7J5oaFC8cmDf48YPuL1fST3ekKM+Nw37Q7c
 3T9/5AVKLP//x2LCHX813+UpE6WdHTYsiz+4/3adjurl+EbvtuWzf99WbZ94UImlOCPRUIu5
 qDgRAGjytjdDAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFLMWRmVeSWpSXmKPExsXCNUNljq6ir0iGwd1Hhhanp55lspjavpfR
 4sn6WcwWlxa5W1zeNYfNYsLcq0wW77feY3Rg91iwqdRj06pONo/dCz4zeXy77eHxeZNcAGsU
 l01Kak5mWWqRvl0CV8aJF9NZC/7rVHz6c4O9gXGKahcjJ4eEgInE/4W/WEBsNgENiT+9vcwg
 toiAk8T/G+3sXYxcHMwCbYwS7UebWEESwgIeEoce/gCzWQRUJX59+sUGYvMKmEq8uHqECWKo
 psSOL+eBbA4OTgEziZ4XdiBhIaCSP39eskOUC0qcnPkEbC+zgLxE89bZzBMYeWYhSc1CklrA
 yLSKUSQzryw3MTPHTK84O6MyL7NCLzk/dxMjMMSW1f6ZtIPx22X3Q4wCHIxKPLwBBcIZQqyJ
 ZcWVuYcYJTiYlUR4YwyAQrwpiZVVqUX58UWlOanFhxilOViUxHm9wlMThATSE0tSs1NTC1KL
 YLJMHJxSDYyyOZ+/LayT2fOoL/e0je1ylbtlFaW2uZeumnz6x7jS5cK/UxqbV8pKsRbs2dSz
 XO6dib/pVA/ddK4e37l6v9tuOp6eyygz88O+wKwvSTc1We6bFW7bdJhFb3Hs7Gv3t7gUL9q8
 fhGHTNKDiuR9Ky8l/RHc49jlx2E7N/CT0+GowD2NyjYKUQFKLMUZiYZazEXFiQAFdf92LQIA
 AA==
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  when performing buffered writes in a large section, overhead
 is incurred due to the iteration through ckpt_valid_blocks within the section.
 when SEGS_PER_SEC is 128, this overhead accounts for 20% wit [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1uAiEJ-00030t-KR
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: add ckpt_valid_blocks to the
 section entry
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
Cc: pilhyun.kim@sk.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

when performing buffered writes in a large section,
overhead is incurred due to the iteration through
ckpt_valid_blocks within the section.
when SEGS_PER_SEC is 128, this overhead accounts for 20% within
the f2fs_write_single_data_page routine.
as the size of the section increases, the overhead also grows.
to handle this problem ckpt_valid_blocks is
added within the section entries.

Test
insmod null_blk.ko nr_devices=1 completion_nsec=1  submit_queues=8
hw_queue_depth=64 max_sectors=512 bs=4096 memory_backed=1
make_f2fs /dev/block/nullb0
make_f2fs -s 128 /dev/block/nullb0
fio --bs=512k --size=1536M --rw=write --name=1
--filename=/mnt/test_dir/seq_write
--ioengine=io_uring --iodepth=64 --end_fsync=1

before
SEGS_PER_SEC 1
2556MiB/s
SEGS_PER_SEC 128
2145MiB/s

after
SEGS_PER_SEC 1
2556MiB/s
SEGS_PER_SEC 128
2556MiB/s

Signed-off-by: yohan.joung <yohan.joung@sk.com>
---
 fs/f2fs/segment.c | 29 ++++++++++++++++++++++-------
 fs/f2fs/segment.h | 29 ++++++++++++++++++-----------
 2 files changed, 40 insertions(+), 18 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 671bc5a8fd4a..09b66a755559 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2447,7 +2447,7 @@ static void update_segment_mtime(struct f2fs_sb_info *sbi, block_t blkaddr,
  * that the consecutive input blocks belong to the same segment.
  */
 static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_entry *se,
-				block_t blkaddr, unsigned int offset, int del)
+				unsigned int segno, block_t blkaddr, unsigned int offset, int del)
 {
 	bool exist;
 #ifdef CONFIG_F2FS_CHECK_FS
@@ -2492,15 +2492,18 @@ static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_ent
 				f2fs_test_and_clear_bit(offset + i, se->discard_map))
 			sbi->discard_blks++;
 
-		if (!f2fs_test_bit(offset + i, se->ckpt_valid_map))
+		if (!f2fs_test_bit(offset + i, se->ckpt_valid_map)) {
 			se->ckpt_valid_blocks -= 1;
+			if (__is_large_section(sbi))
+				get_sec_entry(sbi, segno)->ckpt_valid_blocks -= 1;
+		}
 	}
 
 	return del;
 }
 
 static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry *se,
-				block_t blkaddr, unsigned int offset, int del)
+				unsigned int segno, block_t blkaddr, unsigned int offset, int del)
 {
 	bool exist;
 #ifdef CONFIG_F2FS_CHECK_FS
@@ -2533,12 +2536,18 @@ static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry
 	 * or newly invalidated.
 	 */
 	if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
-		if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map))
+		if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map)) {
 			se->ckpt_valid_blocks++;
+			if (__is_large_section(sbi))
+				get_sec_entry(sbi, segno)->ckpt_valid_blocks++;
+		}
 	}
 
-	if (!f2fs_test_bit(offset, se->ckpt_valid_map))
+	if (!f2fs_test_bit(offset, se->ckpt_valid_map)) {
 		se->ckpt_valid_blocks += del;
+		if (__is_large_section(sbi))
+			get_sec_entry(sbi, segno)->ckpt_valid_blocks += del;
+	}
 
 	return del;
 }
@@ -2569,9 +2578,9 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 
 	/* Update valid block bitmap */
 	if (del > 0) {
-		del = update_sit_entry_for_alloc(sbi, se, blkaddr, offset, del);
+		del = update_sit_entry_for_alloc(sbi, se, segno, blkaddr, offset, del);
 	} else {
-		del = update_sit_entry_for_release(sbi, se, blkaddr, offset, del);
+		del = update_sit_entry_for_release(sbi, se, segno, blkaddr, offset, del);
 	}
 
 	__mark_sit_entry_dirty(sbi, segno);
@@ -5029,6 +5038,12 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 	}
 	up_read(&curseg->journal_rwsem);
 
+	/* update ckpt_ckpt_valid_block */
+	if (__is_large_section(sbi)) {
+		for (unsigned int segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi))
+			set_ckpt_valid_blocks(sbi, segno);
+	}
+
 	if (err)
 		return err;
 
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 345da052f0e1..cabcec5af1ae 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -209,6 +209,7 @@ struct seg_entry {
 
 struct sec_entry {
 	unsigned int valid_blocks;	/* # of valid blocks in a section */
+	unsigned int ckpt_valid_blocks; /* # of valid blocks last cp in a section */
 };
 
 #define MAX_SKIP_GC_COUNT			16
@@ -345,20 +346,26 @@ static inline unsigned int get_valid_blocks(struct f2fs_sb_info *sbi,
 static inline unsigned int get_ckpt_valid_blocks(struct f2fs_sb_info *sbi,
 				unsigned int segno, bool use_section)
 {
-	if (use_section && __is_large_section(sbi)) {
-		unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
-		unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
-		unsigned int blocks = 0;
-		int i;
+	if (use_section && __is_large_section(sbi))
+		return get_sec_entry(sbi, segno)->ckpt_valid_blocks;
+	else
+		return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
+}
+
+static inline void set_ckpt_valid_blocks(struct f2fs_sb_info *sbi,
+		unsigned int segno)
+{
+	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
+	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
+	unsigned int blocks = 0;
+	int i;
 
-		for (i = 0; i < SEGS_PER_SEC(sbi); i++, start_segno++) {
-			struct seg_entry *se = get_seg_entry(sbi, start_segno);
+	for (i = 0; i < SEGS_PER_SEC(sbi); i++, start_segno++) {
+		struct seg_entry *se = get_seg_entry(sbi, start_segno);
 
-			blocks += se->ckpt_valid_blocks;
-		}
-		return blocks;
+		blocks += se->ckpt_valid_blocks;
 	}
-	return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
+	get_sec_entry(sbi, segno)->ckpt_valid_blocks = blocks;
 }
 
 static inline void seg_info_from_raw_sit(struct seg_entry *se,
-- 
2.33.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
