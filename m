Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 418DB9FAB72
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Dec 2024 09:13:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tPdYh-0008Io-0h;
	Mon, 23 Dec 2024 08:12:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Yi.Sun@unisoc.com>) id 1tPdYe-0008ID-Pe
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Dec 2024 08:12:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d+sDygFdY5rjU9y6e1LIWsTMDe/WgwJXcLZMT+O9F1k=; b=V0EvpvAcD/ERFqoWRYdo/+JfD2
 OtGBUp2HECxVL/HHKkrjB8qzbKIEJwx3tkJemHgpk0cTIwI9FZlnHmHsQOWta8O8NyGBRf64bTWzI
 ABWa00g2k1AwZyyh2NJW25j2bbeir8OyzqIdvFKHjlZdTfaP8rzuWVyG7ZEO0BU/5ZOs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d+sDygFdY5rjU9y6e1LIWsTMDe/WgwJXcLZMT+O9F1k=; b=by9VoW5lG4z3cHN+8Xv49ofpX2
 QNy1FrYgpRSkLGmFXIVijZRfsZ5jbGHoyG6BN5f5aAqJPke4O5lBvsek+O5aG4yDc/jSNfCLy5Jg4
 oW53+1jYQFMaHI1XiP28LQtbYtXJF2c6gIIN5AsHIZ+2Gy7yl7twXbKd7PRZ/moUKmog=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tPdYd-0007Ea-QK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Dec 2024 08:12:56 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 4BN8AnKr033236;
 Mon, 23 Dec 2024 16:10:49 +0800 (+08)
 (envelope-from Yi.Sun@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4YGrHr1TsXz2NksVq;
 Mon, 23 Dec 2024 16:08:24 +0800 (CST)
Received: from tj10379pcu1.spreadtrum.com (10.5.32.15) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Mon, 23 Dec 2024 16:10:47 +0800
From: Yi Sun <yi.sun@unisoc.com>
To: <chao@kernel.org>, <jaegeuk@kernel.org>
Date: Mon, 23 Dec 2024 16:10:41 +0800
Message-ID: <20241223081044.1126291-2-yi.sun@unisoc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241223081044.1126291-1-yi.sun@unisoc.com>
References: <20241223081044.1126291-1-yi.sun@unisoc.com>
MIME-Version: 1.0
X-Originating-IP: [10.5.32.15]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 4BN8AnKr033236
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  No logical changes, just for cleanliness. Signed-off-by: Yi
 Sun <yi.sun@unisoc.com> --- fs/f2fs/segment.c | 162 ++++++++++++++++++++++++++
 1 file changed, 93 insertions(+), 69 deletions(-) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1tPdYd-0007Ea-QK
Subject: [f2fs-dev] [PATCH v4 1/4] f2fs: introduce
 update_sit_entry_for_release/alloc()
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

No logical changes, just for cleanliness.

Signed-off-by: Yi Sun <yi.sun@unisoc.com>
---
 fs/f2fs/segment.c | 162 ++++++++++++++++++++++++++--------------------
 1 file changed, 93 insertions(+), 69 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 86e547f008f9..bc761d9b889a 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2426,16 +2426,103 @@ static void update_segment_mtime(struct f2fs_sb_info *sbi, block_t blkaddr,
 		SIT_I(sbi)->max_mtime = ctime;
 }
 
-static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
+static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_entry *se,
+				block_t blkaddr, unsigned int offset, int del)
+{
+	bool exist;
+#ifdef CONFIG_F2FS_CHECK_FS
+	bool mir_exist;
+#endif
+
+	exist = f2fs_test_and_clear_bit(offset, se->cur_valid_map);
+#ifdef CONFIG_F2FS_CHECK_FS
+	mir_exist = f2fs_test_and_clear_bit(offset,
+					se->cur_valid_map_mir);
+	if (unlikely(exist != mir_exist)) {
+		f2fs_err(sbi, "Inconsistent error when clearing bitmap, blk:%u, old bit:%d",
+			blkaddr, exist);
+		f2fs_bug_on(sbi, 1);
+	}
+#endif
+	if (unlikely(!exist)) {
+		f2fs_err(sbi, "Bitmap was wrongly cleared, blk:%u", blkaddr);
+		f2fs_bug_on(sbi, 1);
+		se->valid_blocks++;
+		del = 0;
+	} else if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
+		/*
+		 * If checkpoints are off, we must not reuse data that
+		 * was used in the previous checkpoint. If it was used
+		 * before, we must track that to know how much space we
+		 * really have.
+		 */
+		if (f2fs_test_bit(offset, se->ckpt_valid_map)) {
+			spin_lock(&sbi->stat_lock);
+			sbi->unusable_block_count++;
+			spin_unlock(&sbi->stat_lock);
+		}
+	}
+
+	if (f2fs_block_unit_discard(sbi) &&
+			f2fs_test_and_clear_bit(offset, se->discard_map))
+		sbi->discard_blks++;
+
+	if (!f2fs_test_bit(offset, se->ckpt_valid_map))
+		se->ckpt_valid_blocks += del;
+
+	return del;
+}
+
+static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry *se,
+				block_t blkaddr, unsigned int offset, int del)
 {
-	struct seg_entry *se;
-	unsigned int segno, offset;
-	long int new_vblocks;
 	bool exist;
 #ifdef CONFIG_F2FS_CHECK_FS
 	bool mir_exist;
 #endif
 
+	exist = f2fs_test_and_set_bit(offset, se->cur_valid_map);
+#ifdef CONFIG_F2FS_CHECK_FS
+	mir_exist = f2fs_test_and_set_bit(offset,
+					se->cur_valid_map_mir);
+	if (unlikely(exist != mir_exist)) {
+		f2fs_err(sbi, "Inconsistent error when setting bitmap, blk:%u, old bit:%d",
+			blkaddr, exist);
+		f2fs_bug_on(sbi, 1);
+	}
+#endif
+	if (unlikely(exist)) {
+		f2fs_err(sbi, "Bitmap was wrongly set, blk:%u", blkaddr);
+		f2fs_bug_on(sbi, 1);
+		se->valid_blocks--;
+		del = 0;
+	}
+
+	if (f2fs_block_unit_discard(sbi) &&
+			!f2fs_test_and_set_bit(offset, se->discard_map))
+		sbi->discard_blks--;
+
+	/*
+	 * SSR should never reuse block which is checkpointed
+	 * or newly invalidated.
+	 */
+	if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
+		if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map))
+			se->ckpt_valid_blocks++;
+	}
+
+	if (!f2fs_test_bit(offset, se->ckpt_valid_map))
+		se->ckpt_valid_blocks += del;
+
+	return del;
+}
+
+static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
+{
+	struct seg_entry *se;
+	unsigned int segno, offset;
+	long int new_vblocks;
+
 	segno = GET_SEGNO(sbi, blkaddr);
 	if (segno == NULL_SEGNO)
 		return;
@@ -2451,73 +2538,10 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 
 	/* Update valid block bitmap */
 	if (del > 0) {
-		exist = f2fs_test_and_set_bit(offset, se->cur_valid_map);
-#ifdef CONFIG_F2FS_CHECK_FS
-		mir_exist = f2fs_test_and_set_bit(offset,
-						se->cur_valid_map_mir);
-		if (unlikely(exist != mir_exist)) {
-			f2fs_err(sbi, "Inconsistent error when setting bitmap, blk:%u, old bit:%d",
-				 blkaddr, exist);
-			f2fs_bug_on(sbi, 1);
-		}
-#endif
-		if (unlikely(exist)) {
-			f2fs_err(sbi, "Bitmap was wrongly set, blk:%u",
-				 blkaddr);
-			f2fs_bug_on(sbi, 1);
-			se->valid_blocks--;
-			del = 0;
-		}
-
-		if (f2fs_block_unit_discard(sbi) &&
-				!f2fs_test_and_set_bit(offset, se->discard_map))
-			sbi->discard_blks--;
-
-		/*
-		 * SSR should never reuse block which is checkpointed
-		 * or newly invalidated.
-		 */
-		if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
-			if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map))
-				se->ckpt_valid_blocks++;
-		}
+		del = update_sit_entry_for_alloc(sbi, se, blkaddr, offset, del);
 	} else {
-		exist = f2fs_test_and_clear_bit(offset, se->cur_valid_map);
-#ifdef CONFIG_F2FS_CHECK_FS
-		mir_exist = f2fs_test_and_clear_bit(offset,
-						se->cur_valid_map_mir);
-		if (unlikely(exist != mir_exist)) {
-			f2fs_err(sbi, "Inconsistent error when clearing bitmap, blk:%u, old bit:%d",
-				 blkaddr, exist);
-			f2fs_bug_on(sbi, 1);
-		}
-#endif
-		if (unlikely(!exist)) {
-			f2fs_err(sbi, "Bitmap was wrongly cleared, blk:%u",
-				 blkaddr);
-			f2fs_bug_on(sbi, 1);
-			se->valid_blocks++;
-			del = 0;
-		} else if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
-			/*
-			 * If checkpoints are off, we must not reuse data that
-			 * was used in the previous checkpoint. If it was used
-			 * before, we must track that to know how much space we
-			 * really have.
-			 */
-			if (f2fs_test_bit(offset, se->ckpt_valid_map)) {
-				spin_lock(&sbi->stat_lock);
-				sbi->unusable_block_count++;
-				spin_unlock(&sbi->stat_lock);
-			}
-		}
-
-		if (f2fs_block_unit_discard(sbi) &&
-			f2fs_test_and_clear_bit(offset, se->discard_map))
-			sbi->discard_blks++;
+		del = update_sit_entry_for_release(sbi, se, blkaddr, offset, del);
 	}
-	if (!f2fs_test_bit(offset, se->ckpt_valid_map))
-		se->ckpt_valid_blocks += del;
 
 	__mark_sit_entry_dirty(sbi, segno);
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
