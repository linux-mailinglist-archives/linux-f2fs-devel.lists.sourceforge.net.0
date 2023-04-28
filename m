Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB216F109B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Apr 2023 04:58:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1psEJL-0000FF-J0;
	Fri, 28 Apr 2023 02:58:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1psEJB-0000F8-6p
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Apr 2023 02:58:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iLjn4qcsbkWRcY3G4A9+GX3c/kvOnVDtZ9RCmfpN/c0=; b=Dyl8joL6BUt40LgO6TXYRa2GeB
 hWlIUBO2IEYjl3gbY2KufKYLrhexOlT8dbWT5JFRILqBPLURsoIw20D01J5RJ6VPMIegkc15kN24V
 5ey0pFPsqsthGQGlHgYye7+8+M8lHnxNphaPzZCkWBF37RKiU/DjFjR/fSM9iTiFYbPQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iLjn4qcsbkWRcY3G4A9+GX3c/kvOnVDtZ9RCmfpN/c0=; b=K
 d5jS6L/Ux71Z0hJNqM4voCl/cUrosYe+9hjOIILmnmh65o9N+zICbjDBpj3gHG/9+iXg1+ESDD67j
 euZ2k14zsYBZeV4xyJ2Pl3Mh0+2QkmZFYWLlw2/ZXiYcU0GivsPNDvld6gXy9fc03uKOULDUv8LaS
 Zt+eolUv/rn4Nm+o=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1psEJ7-005ADZ-7v for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Apr 2023 02:58:04 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20230428025749epoutp02ca62f7b28765271e47175330182b579e~Z_d5m9VnQ2887928879epoutp02X
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 28 Apr 2023 02:57:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20230428025749epoutp02ca62f7b28765271e47175330182b579e~Z_d5m9VnQ2887928879epoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1682650669;
 bh=iLjn4qcsbkWRcY3G4A9+GX3c/kvOnVDtZ9RCmfpN/c0=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=iH1XbDZHXA28QsOed3HUYdPClD2dczqSdWorlFifwEvx471wwYZS75oy94gyuo14U
 V3oWABHXb127hleeVZd3vLNOlzXWJSMIrVqPq300CMyYoFErfthNQOAhuOlzxAC5J3
 TcfQVoY1TnBrsSn8bgWDJyQNT1gRwZgpoWEQT2Ew=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20230428025748epcas2p1ac14073aedee8ec2bea8482e64acedf2~Z_d4cmodN2314923149epcas2p1K;
 Fri, 28 Apr 2023 02:57:48 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.102]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Q6y2g41krz4x9Q2; Fri, 28 Apr
 2023 02:57:47 +0000 (GMT)
X-AuditID: b6c32a47-e99fd70000002007-7d-644b362b8aab
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 1E.CA.08199.B263B446; Fri, 28 Apr 2023 11:57:47 +0900 (KST)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-trace-kernel@vger.kernel.org"
 <linux-trace-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230428025646epcms2p35acbea45ee80d36808861edba8a3c84a@epcms2p3>
Date: Fri, 28 Apr 2023 11:56:46 +0900
X-CMS-MailID: 20230428025646epcms2p35acbea45ee80d36808861edba8a3c84a
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJJsWRmVeSWpSXmKPExsWy7bCmqa62mXeKwa8t0hYX5n1ktjg99SyT
 xctDmharHoRbPFk/i9ni0iJ3i8u75rBZHFl/lsVi8XI1i30dD5gsVnXMZbSYev4IkwOPR8u+
 W+wem1Z1snnsXvCZyaNvyypGj8+b5AJYo7JtMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1
 DS0tzJUU8hJzU22VXHwCdN0yc4BuU1IoS8wpBQoFJBYXK+nb2RTll5akKmTkF5fYKqUWpOQU
 mBfoFSfmFpfmpevlpZZYGRoYGJkCFSZkZ7z4cpu1oF+v4tm2o4wNjHPVuhg5OSQETCSO9Dxm
 BbGFBHYwSrxZDmRzcPAKCEr83SEMEhYWsJPomPibBaJESWL9xVnsEHE9iVsP1zCC2GwCOhLT
 T9wHi4sITGWWOLwptYuRi4NZYDGjxNb/F1kgdvFKzGh/CmVLS2xfvpURwtaQ+LGslxnCFpW4
 ufotO4z9/th8qBoRidZ7Z6FqBCUe/NwNFZeUuD13E1R9vsT/K8uh7BqJbQfmQdn6Etc6NoLt
 5RXwlfh9ch5YL4uAqsTz6/+hZrpI3Do8EyzOLCAvsf3tHGZQODALaEqs36UPYkoIKEscucUC
 UcEn0XH4LzvMVw0bf2Nl75j3hAnCVpNY93M9E8QYGYlb8xgnMCrNQoTzLCRrZyGsXcDIvIpR
 LLWgODc9tdiowBges8n5uZsYwWlUy30H44y3H/QOMTJxMB5ilOBgVhLh5a10TxHiTUmsrEot
 yo8vKs1JLT7EaAr08ERmKdHkfGAizyuJNzSxNDAxMzM0NzI1MFcS55W2PZksJJCeWJKanZpa
 kFoE08fEwSnVwDRtkfXZrLKyNxqhx171Zre5zpdvq5l0v8ZOq0Wibbvm7P/S0tG7d/SauOYl
 7KyxvBAqz3olTiNW7I9JTxjb0T+84T/s6udffGT70mWV7+Hy/2ZH3Dkfvjp560aeeMb1SXuf
 bxd++/MCS1Ta+yyfTvkmyU016rt+/e6Nam6drfqKZ3nots3Brsr8r+caXmBp2GTE+flCuVbY
 5olndm/b8z/X4nft80uh996x57/z87v0VyC2beJi0ZUq0TPk8l+blkS9Z/r0bkbXmduKFUt4
 e87nPD542M2/6OLjktiJNe96roos+cVyw/F6fOjfTYqs9zdGvVErslerjH8ddWmDi8WuX2GV
 ds+P3Fvx+c755q9KLMUZiYZazEXFiQC5WNUpLAQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230428025646epcms2p35acbea45ee80d36808861edba8a3c84a
References: <CGME20230428025646epcms2p35acbea45ee80d36808861edba8a3c84a@epcms2p3>
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Changelog: v2 -> v3 Modified arguments to be correct for
 ftrace
 parameter. Changed __submit_zone_reset_cmd to void return. Refactored the
 f2fs_wait_discard_bio function. Fixed code that was previously incorrectl
 [...] Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.25 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1psEJ7-005ADZ-7v
Subject: [f2fs-dev] [PATCH v3] f2fs: add async reset zone command support
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
Reply-To: daejun7.park@samsung.com
Cc: Seokhwan Kim <sukka.kim@samsung.com>, beomsu kim <beomsu7.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Changelog:

v2 -> v3
Modified arguments to be correct for ftrace parameter.
Changed __submit_zone_reset_cmd to void return.
Refactored the f2fs_wait_discard_bio function.
Fixed code that was previously incorrectly merged.

v1 -> v2
Changed to apply the optional async reset write pointer by default.

This patch enables submit reset zone command asynchornously. It helps
decrease average latency of write IOs in high utilization scenario by
faster checkpointing.

Signed-off-by: Daejun Park <daejun7.park@samsung.com>
---
 fs/f2fs/segment.c           | 85 ++++++++++++++++++++++++++++++++++---
 include/trace/events/f2fs.h | 18 +++++++-
 2 files changed, 95 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 6db410f1bb8c..d5be88fada0f 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1196,6 +1196,44 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
 static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
 				struct block_device *bdev, block_t lstart,
 				block_t start, block_t len);
+
+#ifdef CONFIG_BLK_DEV_ZONED
+static void __submit_zone_reset_cmd(struct f2fs_sb_info *sbi,
+				   struct discard_cmd *dc, blk_opf_t flag,
+				   struct list_head *wait_list,
+				   unsigned int *issued)
+{
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	struct block_device *bdev = dc->bdev;
+	struct bio *bio = bio_alloc(bdev, 0, REQ_OP_ZONE_RESET | flag, GFP_NOFS);
+	unsigned long flags;
+
+	trace_f2fs_issue_reset_zone(bdev, dc->di.start);
+
+	spin_lock_irqsave(&dc->lock, flags);
+	dc->state = D_SUBMIT;
+	dc->bio_ref++;
+	spin_unlock_irqrestore(&dc->lock, flags);
+
+	if (issued)
+		(*issued)++;
+
+	atomic_inc(&dcc->queued_discard);
+	dc->queued++;
+	list_move_tail(&dc->list, wait_list);
+
+	/* sanity check on discard range */
+	__check_sit_bitmap(sbi, dc->di.lstart, dc->di.lstart + dc->di.len);
+
+	bio->bi_iter.bi_sector = SECTOR_FROM_BLOCK(dc->di.start);
+	bio->bi_private = dc;
+	bio->bi_end_io = f2fs_submit_discard_endio;
+	submit_bio(bio);
+
+	atomic_inc(&dcc->issued_discard);
+}
+#endif
+
 /* this function is copied from blkdev_issue_discard from block/blk-lib.c */
 static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 				struct discard_policy *dpolicy,
@@ -1217,6 +1255,13 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK))
 		return 0;
 
+#ifdef CONFIG_BLK_DEV_ZONED
+	if (f2fs_sb_has_blkzoned(sbi) && bdev_is_zoned(bdev)) {
+		__submit_zone_reset_cmd(sbi, dc, flag, wait_list, issued);
+		return 0;
+	}
+#endif
+
 	trace_f2fs_issue_discard(bdev, dc->di.start, dc->di.len);
 
 	lstart = dc->di.lstart;
@@ -1461,6 +1506,19 @@ static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
 	}
 }
 
+#ifdef CONFIG_BLK_DEV_ZONED
+static void __queue_zone_reset_cmd(struct f2fs_sb_info *sbi,
+		struct block_device *bdev, block_t blkstart, block_t lblkstart,
+		block_t blklen)
+{
+	trace_f2fs_queue_reset_zone(bdev, blkstart);
+
+	mutex_lock(&SM_I(sbi)->dcc_info->cmd_lock);
+	__insert_discard_cmd(sbi, bdev, lblkstart, blkstart, blklen);
+	mutex_unlock(&SM_I(sbi)->dcc_info->cmd_lock);
+}
+#endif
+
 static void __queue_discard_cmd(struct f2fs_sb_info *sbi,
 		struct block_device *bdev, block_t blkstart, block_t blklen)
 {
@@ -1725,11 +1783,20 @@ static void f2fs_wait_discard_bio(struct f2fs_sb_info *sbi, block_t blkaddr)
 	mutex_lock(&dcc->cmd_lock);
 	dc = __lookup_discard_cmd(sbi, blkaddr);
 	if (dc) {
-		if (dc->state == D_PREP) {
-			__punch_discard_cmd(sbi, dc, blkaddr);
-		} else {
+		if (f2fs_sb_has_blkzoned(sbi) && bdev_is_zoned(dc->bdev)) {
+			/* force submit zone reset */
+			if (dc->state == D_PREP)
+				__submit_zone_reset_cmd(sbi, dc, REQ_SYNC,
+							&dcc->wait_list, NULL);
 			dc->ref++;
 			need_wait = true;
+		} else {
+			if (dc->state == D_PREP) {
+				__punch_discard_cmd(sbi, dc, blkaddr);
+			} else {
+				dc->ref++;
+				need_wait = true;
+			}
 		}
 	}
 	mutex_unlock(&dcc->cmd_lock);
@@ -1876,9 +1943,15 @@ static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
 				 blkstart, blklen);
 			return -EIO;
 		}
-		trace_f2fs_issue_reset_zone(bdev, blkstart);
-		return blkdev_zone_mgmt(bdev, REQ_OP_ZONE_RESET,
-					sector, nr_sects, GFP_NOFS);
+
+		if (unlikely(!is_sbi_flag_set(sbi, SBI_POR_DOING))) {
+			trace_f2fs_issue_reset_zone(bdev, blkstart);
+			return blkdev_zone_mgmt(bdev, REQ_OP_ZONE_RESET,
+						sector, nr_sects, GFP_NOFS);
+		}
+
+		__queue_zone_reset_cmd(sbi, bdev, blkstart, lblkstart, blklen);
+		return 0;
 	}
 
 	/* For conventional zones, use regular discard if supported */
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 99cbc5949e3c..ee1477de8324 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1512,7 +1512,7 @@ DEFINE_EVENT(f2fs_discard, f2fs_remove_discard,
 	TP_ARGS(dev, blkstart, blklen)
 );
 
-TRACE_EVENT(f2fs_issue_reset_zone,
+DECLARE_EVENT_CLASS(f2fs_reset_zone,
 
 	TP_PROTO(struct block_device *dev, block_t blkstart),
 
@@ -1528,11 +1528,25 @@ TRACE_EVENT(f2fs_issue_reset_zone,
 		__entry->blkstart = blkstart;
 	),
 
-	TP_printk("dev = (%d,%d), reset zone at block = 0x%llx",
+	TP_printk("dev = (%d,%d), zone at block = 0x%llx",
 		show_dev(__entry->dev),
 		(unsigned long long)__entry->blkstart)
 );
 
+DEFINE_EVENT(f2fs_reset_zone, f2fs_queue_reset_zone,
+
+	TP_PROTO(struct block_device *dev, block_t blkstart),
+
+	TP_ARGS(dev, blkstart)
+);
+
+DEFINE_EVENT(f2fs_reset_zone, f2fs_issue_reset_zone,
+
+	TP_PROTO(struct block_device *dev, block_t blkstart),
+
+	TP_ARGS(dev, blkstart)
+);
+
 TRACE_EVENT(f2fs_issue_flush,
 
 	TP_PROTO(struct block_device *dev, unsigned int nobarrier,
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
