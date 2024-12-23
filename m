Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 355869FAB6E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Dec 2024 09:13:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tPdYj-0001yp-Cj;
	Mon, 23 Dec 2024 08:13:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Yi.Sun@unisoc.com>) id 1tPdYe-0001yc-Jr
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Dec 2024 08:12:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tBPJUD/i01YeHKBufRYjuqyeoaigV7jzuc5Q+m4+X6I=; b=Ci9IUs31fky7wIQWgBkRWE0R3k
 St8YMj7l+H3VHNdFgPI4JPOb9Nndpit56MTCKPjWicekD1vDz1VSDV3LK4Bcb7l5LR741h2nGovzq
 nyUQILAVt5pEwXd8hOKRcMUEtDNZdLtYH3AdNNTdrdA/F/A+eZd7HgsSu7TuhcCM4zwE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tBPJUD/i01YeHKBufRYjuqyeoaigV7jzuc5Q+m4+X6I=; b=MllPm2iyNQEE+MHdlnqr5NVw+M
 SlDw5XPl3281prwGBoXK08YmqHpu+YJdGcoEHxzGSXVHm5Tj+mcgpNx/oV9DKqcA70F/KVB4uEJzg
 nJ/soqdmM5tZ6Kwh7JRTgnFowhEg/OLz4HXCpDUFfRXcVYsz6D7xSBH5Jf08KKJbgOTo=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tPdYd-0007EW-04 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Dec 2024 08:12:55 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 4BN8Aoh4033354;
 Mon, 23 Dec 2024 16:10:50 +0800 (+08)
 (envelope-from Yi.Sun@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4YGrHs1XbLz2MnTyj;
 Mon, 23 Dec 2024 16:08:25 +0800 (CST)
Received: from tj10379pcu1.spreadtrum.com (10.5.32.15) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Mon, 23 Dec 2024 16:10:48 +0800
From: Yi Sun <yi.sun@unisoc.com>
To: <chao@kernel.org>, <jaegeuk@kernel.org>
Date: Mon, 23 Dec 2024 16:10:42 +0800
Message-ID: <20241223081044.1126291-3-yi.sun@unisoc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241223081044.1126291-1-yi.sun@unisoc.com>
References: <20241223081044.1126291-1-yi.sun@unisoc.com>
MIME-Version: 1.0
X-Originating-IP: [10.5.32.15]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 4BN8Aoh4033354
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This function can process some consecutive blocks at a time.
 When using update_sit_entry() to release consecutive blocks, ensure that
 the consecutive blocks belong to the same segment. Because after
 update_sit_entry_for_realese(), 
 @segno is still in use in upda [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1tPdYd-0007EW-04
Subject: [f2fs-dev] [PATCH v4 2/4] f2fs: update_sit_entry_for_release()
 supports consecutive blocks.
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, sunyibuaa@gmail.com, yi.sun@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This function can process some consecutive blocks at a time.

When using update_sit_entry() to release consecutive blocks,
ensure that the consecutive blocks belong to the same segment.
Because after update_sit_entry_for_realese(), @segno is still
in use in update_sit_entry().

Signed-off-by: Yi Sun <yi.sun@unisoc.com>
---
 fs/f2fs/segment.c | 75 ++++++++++++++++++++++++++++-------------------
 1 file changed, 45 insertions(+), 30 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index bc761d9b889a..67d2859831e4 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2426,6 +2426,10 @@ static void update_segment_mtime(struct f2fs_sb_info *sbi, block_t blkaddr,
 		SIT_I(sbi)->max_mtime = ctime;
 }
 
+/*
+ * NOTE: when updating multiple blocks at the same time, please ensure
+ * that the consecutive input blocks belong to the same segment.
+ */
 static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_entry *se,
 				block_t blkaddr, unsigned int offset, int del)
 {
@@ -2433,42 +2437,48 @@ static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_ent
 #ifdef CONFIG_F2FS_CHECK_FS
 	bool mir_exist;
 #endif
+	int i;
+	int del_count = -del;
+
+	f2fs_bug_on(sbi, GET_SEGNO(sbi, blkaddr) != GET_SEGNO(sbi, blkaddr + del_count - 1));
 
-	exist = f2fs_test_and_clear_bit(offset, se->cur_valid_map);
+	for (i = 0; i < del_count; i++) {
+		exist = f2fs_test_and_clear_bit(offset + i, se->cur_valid_map);
 #ifdef CONFIG_F2FS_CHECK_FS
-	mir_exist = f2fs_test_and_clear_bit(offset,
-					se->cur_valid_map_mir);
-	if (unlikely(exist != mir_exist)) {
-		f2fs_err(sbi, "Inconsistent error when clearing bitmap, blk:%u, old bit:%d",
-			blkaddr, exist);
-		f2fs_bug_on(sbi, 1);
-	}
+		mir_exist = f2fs_test_and_clear_bit(offset + i,
+						se->cur_valid_map_mir);
+		if (unlikely(exist != mir_exist)) {
+			f2fs_err(sbi, "Inconsistent error when clearing bitmap, blk:%u, old bit:%d",
+				blkaddr + i, exist);
+			f2fs_bug_on(sbi, 1);
+		}
 #endif
-	if (unlikely(!exist)) {
-		f2fs_err(sbi, "Bitmap was wrongly cleared, blk:%u", blkaddr);
-		f2fs_bug_on(sbi, 1);
-		se->valid_blocks++;
-		del = 0;
-	} else if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
-		/*
-		 * If checkpoints are off, we must not reuse data that
-		 * was used in the previous checkpoint. If it was used
-		 * before, we must track that to know how much space we
-		 * really have.
-		 */
-		if (f2fs_test_bit(offset, se->ckpt_valid_map)) {
-			spin_lock(&sbi->stat_lock);
-			sbi->unusable_block_count++;
-			spin_unlock(&sbi->stat_lock);
+		if (unlikely(!exist)) {
+			f2fs_err(sbi, "Bitmap was wrongly cleared, blk:%u", blkaddr + i);
+			f2fs_bug_on(sbi, 1);
+			se->valid_blocks++;
+			del += 1;
+		} else if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
+			/*
+			 * If checkpoints are off, we must not reuse data that
+			 * was used in the previous checkpoint. If it was used
+			 * before, we must track that to know how much space we
+			 * really have.
+			 */
+			if (f2fs_test_bit(offset + i, se->ckpt_valid_map)) {
+				spin_lock(&sbi->stat_lock);
+				sbi->unusable_block_count++;
+				spin_unlock(&sbi->stat_lock);
+			}
 		}
-	}
 
-	if (f2fs_block_unit_discard(sbi) &&
-			f2fs_test_and_clear_bit(offset, se->discard_map))
-		sbi->discard_blks++;
+		if (f2fs_block_unit_discard(sbi) &&
+				f2fs_test_and_clear_bit(offset + i, se->discard_map))
+			sbi->discard_blks++;
 
-	if (!f2fs_test_bit(offset, se->ckpt_valid_map))
-		se->ckpt_valid_blocks += del;
+		if (!f2fs_test_bit(offset + i, se->ckpt_valid_map))
+			se->ckpt_valid_blocks -= 1;
+	}
 
 	return del;
 }
@@ -2517,6 +2527,11 @@ static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry
 	return del;
 }
 
+/*
+ * If releasing blocks, this function supports updating multiple consecutive blocks
+ * at one time, but please note that these consecutive blocks need to belong to the
+ * same segment.
+ */
 static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 {
 	struct seg_entry *se;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
