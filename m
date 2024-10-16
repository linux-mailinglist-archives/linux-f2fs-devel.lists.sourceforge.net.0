Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ABD9A0099
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Oct 2024 07:28:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t0waR-0007ef-Nn;
	Wed, 16 Oct 2024 05:28:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Yi.Sun@unisoc.com>) id 1t0waP-0007eV-6E
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Oct 2024 05:28:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lsrTbhLpjCQT092BQouSxdIVKpgBDa/1AFgyIB3KTNs=; b=g/NRUmp+0wBoMpqoKzgXWmwr7r
 zLCqwFkD9rWV7+pxh+cKzCZgDPfj+gLll1Lmgnje1BfuxcIoY7f+l3PAX8zdlUVK3TNxvk1OEbAyW
 oKtSG+X5IM7SEdSc7799aJcLqF/kN2UqtYB16DXpKiFP4JotIzuqRB4Nns0+RmAcM3hE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lsrTbhLpjCQT092BQouSxdIVKpgBDa/1AFgyIB3KTNs=; b=cHW7AdM5BtrnRoNWm+V7QBeIRF
 VbkaFrGV1ynsoGARJ7zPrts6R3IMJqKGFG0fWfHmvWMQRDJ0GUwPcJmSNGLhgwVkVLwKWy4Npbe4I
 DzXI0wIb3axgvHgIeOYYJt7eD5LoRwuN1ht6N/11wUxlWiSeO2lm1CPKqla0NrLRy/kk=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t0waM-00044b-Dw for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Oct 2024 05:28:39 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 49G5S4Tx033842;
 Wed, 16 Oct 2024 13:28:04 +0800 (+08)
 (envelope-from Yi.Sun@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4XSzy30xyXz2SWtk8;
 Wed, 16 Oct 2024 13:27:55 +0800 (CST)
Received: from tj10379pcu.spreadtrum.com (10.5.32.15) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Wed, 16 Oct 2024 13:28:02 +0800
From: Yi Sun <yi.sun@unisoc.com>
To: <chao@kernel.org>
Date: Wed, 16 Oct 2024 13:27:57 +0800
Message-ID: <20241016052758.3400359-2-yi.sun@unisoc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241016052758.3400359-1-yi.sun@unisoc.com>
References: <20241016052758.3400359-1-yi.sun@unisoc.com>
MIME-Version: 1.0
X-Originating-IP: [10.5.32.15]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 49G5S4Tx033842
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This function can process some consecutive blocks at a time.
 Signed-off-by: Yi Sun <yi.sun@unisoc.com> --- fs/f2fs/segment.c | 91
 +++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+), 35 deletions(-) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1t0waM-00044b-Dw
Subject: [f2fs-dev] [RFC PATCH 1/2] f2fs: introduce
 update_sit_entry_for_release()
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
Cc: ke.wang@unisoc.com, yi.sun@unisoc.com, linux-kernel@vger.kernel.org,
 sunyibuaa@gmail.com, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hao_hao.wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This function can process some consecutive blocks at a time.

Signed-off-by: Yi Sun <yi.sun@unisoc.com>
---
 fs/f2fs/segment.c | 91 +++++++++++++++++++++++++++++------------------
 1 file changed, 56 insertions(+), 35 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index d91fbd1b27ba..f118faf36d35 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2424,6 +2424,58 @@ static void update_segment_mtime(struct f2fs_sb_info *sbi, block_t blkaddr,
 		SIT_I(sbi)->max_mtime = ctime;
 }
 
+static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_entry *se,
+				block_t blkaddr, unsigned int offset, int del)
+{
+	bool exist;
+#ifdef CONFIG_F2FS_CHECK_FS
+	bool mir_exist;
+#endif
+	int i;
+	int del_count = -del;
+
+	for (i = 0; i < del_count; i++) {
+		exist = f2fs_test_and_clear_bit(offset + i, se->cur_valid_map);
+#ifdef CONFIG_F2FS_CHECK_FS
+		mir_exist = f2fs_test_and_clear_bit(offset + i,
+						se->cur_valid_map_mir);
+		if (unlikely(exist != mir_exist)) {
+			f2fs_err(sbi, "Inconsistent error when clearing bitmap, blk:%u, old bit:%d",
+				 blkaddr + i, exist);
+			f2fs_bug_on(sbi, 1);
+		}
+#endif
+		if (unlikely(!exist)) {
+			f2fs_err(sbi, "Bitmap was wrongly cleared, blk:%u",
+				 blkaddr + i);
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
+		}
+
+		if (f2fs_block_unit_discard(sbi) &&
+			f2fs_test_and_clear_bit(offset + i, se->discard_map))
+			sbi->discard_blks++;
+
+		if (!f2fs_test_bit(offset + i, se->ckpt_valid_map))
+			se->ckpt_valid_blocks -= 1;
+	}
+
+	return del;
+}
+
 static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 {
 	struct seg_entry *se;
@@ -2479,43 +2531,12 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 			if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map))
 				se->ckpt_valid_blocks++;
 		}
-	} else {
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
 
-		if (f2fs_block_unit_discard(sbi) &&
-			f2fs_test_and_clear_bit(offset, se->discard_map))
-			sbi->discard_blks++;
+		if (!f2fs_test_bit(offset, se->ckpt_valid_map))
+			se->ckpt_valid_blocks += del;
+	} else {
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
