Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8893E6EDDB1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Apr 2023 10:11:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1prDlw-0005PY-4Z;
	Tue, 25 Apr 2023 08:11:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1prDls-0005PR-RL
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Apr 2023 08:11:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N9nZClz1ANv1MSriHoOK5Bg8AtRXHwknq59cqaN77a4=; b=AJ7kuYf2tBy8Ag+O00d+Zd/FRz
 59+AtB05n9FxoW5IlY5Fi5UFxV+b6aVYae8FiStuNoYXU8OOIciu2dXu9UBWHtmtaLVzf6C060yyQ
 /sXxdNIXtWUnja1iI2JKYDrEV3KCjtQyyiPvlc/tgT8cCkqXG4d7MspsHzw7q/Dpucrw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=N9nZClz1ANv1MSriHoOK5Bg8AtRXHwknq59cqaN77a4=; b=T
 kUPCoUPcZMs0MZGrZaxcAEHMcuFLCJcCYiz8IiaWpFEGmsrSh24ikTvOoarjwhhbqZar7po0m6DYz
 UBjHc0gHYEj11oxCa8xwPTFZ4nHyx119rr62E9R3iwitJFVu73rcq7DHoAnqBLyuaFD/HjIagxvdP
 idN+Y3K3jBUD7d8A=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1prDln-0005q2-4c for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Apr 2023 08:11:31 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20230425081120epoutp037c5c705c72a0aa570fd930f2079c33e2~ZHzxqgAnr2974329743epoutp03a
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Apr 2023 08:11:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20230425081120epoutp037c5c705c72a0aa570fd930f2079c33e2~ZHzxqgAnr2974329743epoutp03a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1682410280;
 bh=N9nZClz1ANv1MSriHoOK5Bg8AtRXHwknq59cqaN77a4=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=JPa8CrndElNzSJWpeOsGXwQC+8o6nAe5vbZIuIT7Trin2OzMPOe03uAWRa2V70hpR
 qtSv176bCa9oVUFdrt2gTns5vKovX0whwoDnmzUDiry2hvE64bCuS58u0FrSxfb0lV
 3zj28oAoUOOUtXZuvnXmyVokfhYolURM+bT0An9o=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTP id
 20230425081119epcas2p362a5ce622a454811946cb125facd264a~ZHzxQFGPs1780917809epcas2p3A;
 Tue, 25 Apr 2023 08:11:19 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.97]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4Q5F7q19vfz4x9QN; Tue, 25 Apr
 2023 08:11:19 +0000 (GMT)
X-AuditID: b6c32a48-c8660a8000005998-9c-64478b26d1f2
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 69.24.22936.62B87446; Tue, 25 Apr 2023 17:11:19 +0900 (KST)
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
Message-ID: <20230425081018epcms2p8fefa94810f0b341d2cbd70ba587e9e8c@epcms2p8>
Date: Tue, 25 Apr 2023 17:10:18 +0900
X-CMS-MailID: 20230425081018epcms2p8fefa94810f0b341d2cbd70ba587e9e8c
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFJsWRmVeSWpSXmKPExsWy7bCmha56t3uKwbm7TBYX5n1ktjg99SyT
 xctDmharHoRbPFk/i9ni0iJ3i8u75rBZHFl/lsVi8XI1i30dD5gsVnXMZbSYev4IkwOPR8u+
 W+wem1Z1snnsXvCZyaNvyypGj8+b5AJYo7JtMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1
 DS0tzJUU8hJzU22VXHwCdN0yc4BuU1IoS8wpBQoFJBYXK+nb2RTll5akKmTkF5fYKqUWpOQU
 mBfoFSfmFpfmpevlpZZYGRoYGJkCFSZkZ0x7s4+5YJlhxeT791gbGN9qdDFyckgImEgs+HGf
 vYuRi0NIYAejRO/tZpYuRg4OXgFBib87hEFqhAXsJDYt3sYIYgsJKEmsvziLHSKuJ3Hr4Rqw
 OJuAjsT0E/fB4iICU5klDm9KBZnJLLCYUWLtohlMEMt4JWa0P2WBsKUlti/fyghha0j8WNbL
 DGGLStxc/ZYdxn5/bD5UjYhE672zUDWCEg9+7oaKS0rcnrsJqj5f4v+V5VB2jcS2A/OgbH2J
 ax0bwfbyCvhKnF14GizOIqAq8XLfA1aIGheJ21vegc1nFpCX2P52DjMoHJgFNCXW79IHMSUE
 lCWO3GKBqOCT6Dj8lx3mq4aNv7Gyd8x7AvW5msS6n+uZIMbISNyaxziBUWkWIpxnIVk7C2Ht
 AkbmVYxiqQXFuempxUYFJvCoTc7P3cQITqRaHjsYZ7/9oHeIkYmD8RCjBAezkggvb6V7ihBv
 SmJlVWpRfnxRaU5q8SFGU6CHJzJLiSbnA1N5Xkm8oYmlgYmZmaG5kamBuZI478cO5RQhgfTE
 ktTs1NSC1CKYPiYOTqkGpujkxt8rwpxr2WZX/Sk/2cfSlVm6nkGna4bOM4d/r+zn3m+ffuhR
 fsG0jb8iNljeZdq5UshX7Nbv+hgxqcs6E+a6uX2u843wu6ye/EjyeZVlybK+e9dvP1x7hXfT
 id1Psg48/n/+p4xL/QrxJfrqfjWbF54NYfX6z8y+WlvOOeV6MNeUWRfeyBv9uh/OfZz1stXG
 NzOrzfaL3VuaKr/N826L3M4rR3dpz1BeaxRnm5b8/8irM8Knclc7Xj9a8vudZ6pzd3qi3jXl
 jq6adze2rilx/BV9QX6vTeCfnSxnVz9MXVYvuH7GhMsfLBR9l6mb/mRb/JI9IJ5rbcasjNCf
 ruHmM1LPMnGmOmSczcpzXaTEUpyRaKjFXFScCABwcRX+LQQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230425081018epcms2p8fefa94810f0b341d2cbd70ba587e9e8c
References: <CGME20230425081018epcms2p8fefa94810f0b341d2cbd70ba587e9e8c@epcms2p8>
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Changelog: v1 -> v2 Changed to apply the optional async reset
 write pointer by default. This patch enables submit reset zone command
 asynchornously.
 It helps decrease average latency of write IOs in high utilization scenario
 by faster checkpointing. 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.33 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
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
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1prDln-0005q2-4c
Subject: [f2fs-dev] [PATCH v2] f2fs: add async reset zone command support
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

v1 -> v2
Changed to apply the optional async reset write pointer by default.


This patch enables submit reset zone command asynchornously. It helps
decrease average latency of write IOs in high utilization scenario by
faster checkpointing.

Signed-off-by: Daejun Park <daejun7.park@samsung.com>
---
 fs/f2fs/segment.c           | 95 ++++++++++++++++++++++++++++++++++---
 include/trace/events/f2fs.h | 18 ++++++-
 2 files changed, 105 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 82430f80c5da..27074a6eaf20 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1195,6 +1195,46 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
 static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
 				struct block_device *bdev, block_t lstart,
 				block_t start, block_t len);
+
+#ifdef CONFIG_BLK_DEV_ZONED
+static int __submit_zone_reset_cmd(struct f2fs_sb_info *sbi,
+				   struct discard_cmd *dc, blk_opf_t flag,
+				   struct list_head *wait_list,
+				   unsigned int *issued)
+{
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	struct block_device *bdev = dc->bdev;
+	struct bio *bio = bio_alloc(bdev, 0, REQ_OP_ZONE_RESET | flag, GFP_NOFS);
+	unsigned long flags;
+
+	trace_f2fs_issue_reset_zone(bdev, SECTOR_FROM_BLOCK(dc->di.start));
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
+
+	return 0;
+}
+#endif
+
 /* this function is copied from blkdev_issue_discard from block/blk-lib.c */
 static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 				struct discard_policy *dpolicy,
@@ -1216,6 +1256,11 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK))
 		return 0;
 
+#ifdef CONFIG_BLK_DEV_ZONED
+	if (f2fs_sb_has_blkzoned(sbi) && bdev_is_zoned(bdev))
+		return __submit_zone_reset_cmd(sbi, dc, flag, wait_list, issued);
+#endif
+
 	trace_f2fs_issue_discard(bdev, dc->di.start, dc->di.len);
 
 	lstart = dc->di.lstart;
@@ -1460,21 +1505,42 @@ static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
 	}
 }
 
+#ifdef CONFIG_BLK_DEV_ZONED
+static void __queue_zone_reset_cmd(struct f2fs_sb_info *sbi,
+		struct block_device *bdev, block_t blkstart, block_t blklen)
+{
+	block_t lblkstart = blkstart;
+
+	if (f2fs_is_multi_device(sbi)) {
+		int devi = f2fs_target_device_index(sbi, blkstart);
+
+		blkstart -= FDEV(devi).start_blk;
+	}
+
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
 	block_t lblkstart = blkstart;
 
+	trace_f2fs_queue_discard(bdev, blkstart, blklen);
+
 	if (!f2fs_bdev_support_discard(bdev))
 		return;
 
-	trace_f2fs_queue_discard(bdev, blkstart, blklen);
-
 	if (f2fs_is_multi_device(sbi)) {
 		int devi = f2fs_target_device_index(sbi, blkstart);
 
 		blkstart -= FDEV(devi).start_blk;
 	}
+
 	mutex_lock(&SM_I(sbi)->dcc_info->cmd_lock);
 	__update_discard_tree_range(sbi, bdev, lblkstart, blkstart, blklen);
 	mutex_unlock(&SM_I(sbi)->dcc_info->cmd_lock);
@@ -1725,7 +1791,18 @@ static void f2fs_wait_discard_bio(struct f2fs_sb_info *sbi, block_t blkaddr)
 	dc = __lookup_discard_cmd(sbi, blkaddr);
 	if (dc) {
 		if (dc->state == D_PREP) {
-			__punch_discard_cmd(sbi, dc, blkaddr);
+			if (f2fs_sb_has_blkzoned(sbi) &&
+			    bdev_is_zoned(dc->bdev)) {
+				struct discard_policy dpolicy;
+				/* force submit zone reset */
+				__init_discard_policy(sbi, &dpolicy,
+						      DPOLICY_FORCE, 1);
+				__submit_discard_cmd(sbi, &dpolicy, dc, NULL);
+				dc->ref++;
+				need_wait = true;
+			} else {
+				__punch_discard_cmd(sbi, dc, blkaddr);
+			}
 		} else {
 			dc->ref++;
 			need_wait = true;
@@ -1875,9 +1952,15 @@ static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
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
+		__queue_zone_reset_cmd(sbi, bdev, lblkstart, blklen);
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
