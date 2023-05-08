Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E40C6FA1FB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 May 2023 10:15:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pvw1f-0001s9-FI;
	Mon, 08 May 2023 08:15:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1pvvyT-0000Rq-EG
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 May 2023 08:12:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yDLIrghah5Nq9w1zHb2JAr9X6r6l9mF3EzuVTGurF8Q=; b=ODrTFK0gyKRMyciFLFHztMFXEv
 rndnr5+6HYxujyDr28P2kJD/oAfaXv7pRrSyFro9dNWjLP5ZZN2iW2h0So7pF6DadkaL9waCbe6iX
 jLO7I0OpDXlhE+QLLVbRcXO7Ufwmku2cUgzG3q0JJrNCMxmODI6bZHNGVJYMVPLkQIUk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yDLIrghah5Nq9w1zHb2JAr9X6r6l9mF3EzuVTGurF8Q=; b=f
 OMBL8EVI7kl5aZWru3nxg6UV9iklstmJMH1X50s7KbL6lsEggzv9DHwEVIrG1+T7H6tiUO0Ci5+oZ
 10bCmS8ZKyWhAd/EI4S3t3zleXyNbqnsWHPz6cTs+QEFX44+XfPrVp7VptbQ//nq3quJjF845r1Xc
 Z5XLDTXN1xBDG5rM=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pvvyP-001kZg-Mt for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 May 2023 08:12:02 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20230508081144epoutp019f5bd0e920b701ea39a4d3464ff6202f~dHM1o82Fo3163731637epoutp01N
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  8 May 2023 08:11:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20230508081144epoutp019f5bd0e920b701ea39a4d3464ff6202f~dHM1o82Fo3163731637epoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683533504;
 bh=yDLIrghah5Nq9w1zHb2JAr9X6r6l9mF3EzuVTGurF8Q=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=Qd8a0i7zCGSmgucPJbG+NwEq4e5aRivJ9U5ThnzGk1yddIIJUEJHJIDkKGnzCd4ar
 5qlJW95lCDrhZUXOVXhgxp5iZGUU2Z3cyx8Xqb2DSHJ8GxrwqKkj9Y/6Yg+wgxmanv
 mE5atB4QtG+QDsaggjsJnEdGvq6VvTFlzdgZontA=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20230508081143epcas2p2f6e6149ac35656956768d00085b1e8a2~dHM1KzgTr2764627646epcas2p2-;
 Mon,  8 May 2023 08:11:43 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.98]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4QFDXH1bHRz4x9Q4; Mon,  8 May
 2023 08:11:43 +0000 (GMT)
X-AuditID: b6c32a46-b23fd7000001438d-1c-6458aebf90eb
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 D0.8E.17293.FBEA8546; Mon,  8 May 2023 17:11:43 +0900 (KST)
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
Message-ID: <20230508081042epcms2p8a637deae7de1829f54614e09d5fde5e5@epcms2p8>
Date: Mon, 08 May 2023 17:10:42 +0900
X-CMS-MailID: 20230508081042epcms2p8a637deae7de1829f54614e09d5fde5e5
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJJsWRmVeSWpSXmKPExsWy7bCmme7+dREpBse3c1pcmPeR2eL01LNM
 Fi8PaVqsehBu8WT9LGaLS4vcLS7vmsNmcWT9WRaLxcvVLPZ1PGCyWNUxl9Fi6vkjTA48Hi37
 brF7bFrVyeaxe8FnJo++LasYPT5vkgtgjcq2yUhNTEktUkjNS85PycxLt1XyDo53jjc1MzDU
 NbS0MFdSyEvMTbVVcvEJ0HXLzAG6TUmhLDGnFCgUkFhcrKRvZ1OUX1qSqpCRX1xiq5RakJJT
 YF6gV5yYW1yal66Xl1piZWhgYGQKVJiQnbH56wPGglsOFTebfjI3ML4z7WLk5JAQMJFY8uEK
 axcjF4eQwA5Gie6zv9m7GDk4eAUEJf7uEAapERawk9i8bzITiC0koCSx/uIsdoi4nsSth2sY
 QWw2AR2J6Sfug8VFBKYySxzelAoyk1lgMaPE1v8XWSCW8UrMaH8KZUtLbF++lRHC1pD4sayX
 GcIWlbi5+i07jP3+2HyoGhGJ1ntnoWoEJR783A0Vl5S4PXcTVH2+xP8ry6HsGoltB+ZB2foS
 1zo2gu3lFfCV+H7tFdiPLAKqEv0LMyBKXCT6nj4CG8ksIC+x/e0cZpASZgFNifW79EFMCQFl
 iSO3WCAq+CQ6Dv9lh3mqYeNvrOwd854wQdhqEut+rmeCGCMjcWse4wRGpVmIYJ6FZO0shLUL
 GJlXMYqlFhTnpqcWGxUYwWM2OT93EyM4jWq57WCc8vaD3iFGJg7GQ4wSHMxKIryrEsJShHhT
 EiurUovy44tKc1KLDzGaAv07kVlKNDkfmMjzSuINTSwNTMzMDM2NTA3MlcR5pW1PJgsJpCeW
 pGanphakFsH0MXFwSjUw2bDuvnc2dIMWJ3PNgZaAknfh77z8Xb5fqj1VfPOE1Kq0JsZbxy3b
 FcWahUQtVJw0YrSNnE8WxV+S7dSbWOVopZzz/aGQJdeyBV8vnV/7zUbnnEmSzy233cdSI5h8
 L89WvbTqwaNfD8+e053F1Hvm3vMXvK97v8tePWsz/6mBf6KAhIR5kedvP2kVIUuHhZkZ+2as
 r70TZphudfv1nmUpd69wX9pWms+1JGeRhcDGW59zBb61vjmlscBkZou7keDhZbJL2XsCJkg8
 mlVoeUhEMtxeYd2HL80FTJfz4y0nrc0VOM7ecX7Lgxubu3evbciw38zVycD7xG/jho6axcvj
 Vt9pvbWpKTqg0/rAvc96SizFGYmGWsxFxYkAkK26GCwEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230508081042epcms2p8a637deae7de1829f54614e09d5fde5e5
References: <CGME20230508081042epcms2p8a637deae7de1829f54614e09d5fde5e5@epcms2p8>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: v5 -> v6 Added trace_f2fs_iostat support for zone reset
 command.
 v4 -> v5 Added f2fs iostat for zone reset command. v3 -> v4 Fixed build error
 caused by unused function. 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.24 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pvvyP-001kZg-Mt
Subject: [f2fs-dev] [PATCH v6] f2fs: add async reset zone command support
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

v5 -> v6
Added trace_f2fs_iostat support for zone reset command.

v4 -> v5
Added f2fs iostat for zone reset command.

v3 -> v4
Fixed build error caused by unused function.

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
 fs/f2fs/f2fs.h              |  1 +
 fs/f2fs/iostat.c            |  1 +
 fs/f2fs/segment.c           | 84 +++++++++++++++++++++++++++++++++++--
 include/trace/events/f2fs.h | 24 +++++++++--
 4 files changed, 104 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d211ee89c158..51b68a629814 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1175,6 +1175,7 @@ enum iostat_type {
 	/* other */
 	FS_DISCARD_IO,			/* discard */
 	FS_FLUSH_IO,			/* flush */
+	FS_ZONE_RESET_IO,		/* zone reset */
 	NR_IO_TYPE,
 };
 
diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
index 3d5bfb1ad585..f8703038e1d8 100644
--- a/fs/f2fs/iostat.c
+++ b/fs/f2fs/iostat.c
@@ -80,6 +80,7 @@ int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
 	seq_puts(seq, "[OTHER]\n");
 	IOSTAT_INFO_SHOW("fs discard", FS_DISCARD_IO);
 	IOSTAT_INFO_SHOW("fs flush", FS_FLUSH_IO);
+	IOSTAT_INFO_SHOW("fs zone reset", FS_ZONE_RESET_IO);
 
 	return 0;
 }
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 6db410f1bb8c..4802b05a795b 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1196,6 +1196,45 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
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
+	f2fs_update_iostat(sbi, NULL, FS_ZONE_RESET_IO, dc->di.len * F2FS_BLKSIZE);
+}
+#endif
+
 /* this function is copied from blkdev_issue_discard from block/blk-lib.c */
 static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 				struct discard_policy *dpolicy,
@@ -1217,6 +1256,13 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
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
@@ -1461,6 +1507,19 @@ static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
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
@@ -1724,6 +1783,19 @@ static void f2fs_wait_discard_bio(struct f2fs_sb_info *sbi, block_t blkaddr)
 
 	mutex_lock(&dcc->cmd_lock);
 	dc = __lookup_discard_cmd(sbi, blkaddr);
+#ifdef CONFIG_BLK_DEV_ZONED
+	if (dc && f2fs_sb_has_blkzoned(sbi) && bdev_is_zoned(dc->bdev)) {
+		/* force submit zone reset */
+		if (dc->state == D_PREP)
+			__submit_zone_reset_cmd(sbi, dc, REQ_SYNC,
+						&dcc->wait_list, NULL);
+		dc->ref++;
+		mutex_unlock(&dcc->cmd_lock);
+		/* wait zone reset */
+		__wait_one_discard_bio(sbi, dc);
+		return;
+	}
+#endif
 	if (dc) {
 		if (dc->state == D_PREP) {
 			__punch_discard_cmd(sbi, dc, blkaddr);
@@ -1876,9 +1948,15 @@ static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
 				 blkstart, blklen);
 			return -EIO;
 		}
-		trace_f2fs_issue_reset_zone(bdev, blkstart);
-		return blkdev_zone_mgmt(bdev, REQ_OP_ZONE_RESET,
-					sector, nr_sects, GFP_NOFS);
+
+		if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING))) {
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
index 99cbc5949e3c..793f82cc1515 100644
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
@@ -1979,6 +1993,7 @@ TRACE_EVENT(f2fs_iostat,
 		__field(unsigned long long,	fs_nrio)
 		__field(unsigned long long,	fs_mrio)
 		__field(unsigned long long,	fs_discard)
+		__field(unsigned long long,	fs_reset_zone)
 	),
 
 	TP_fast_assign(
@@ -2010,12 +2025,14 @@ TRACE_EVENT(f2fs_iostat,
 		__entry->fs_nrio	= iostat[FS_NODE_READ_IO];
 		__entry->fs_mrio	= iostat[FS_META_READ_IO];
 		__entry->fs_discard	= iostat[FS_DISCARD_IO];
+		__entry->fs_reset_zone	= iostat[FS_ZONE_RESET_IO];
 	),
 
 	TP_printk("dev = (%d,%d), "
 		"app [write=%llu (direct=%llu, buffered=%llu), mapped=%llu, "
 		"compr(buffered=%llu, mapped=%llu)], "
-		"fs [data=%llu, cdata=%llu, node=%llu, meta=%llu, discard=%llu], "
+		"fs [data=%llu, cdata=%llu, node=%llu, meta=%llu, discard=%llu, "
+		"reset_zone=%llu], "
 		"gc [data=%llu, node=%llu], "
 		"cp [data=%llu, node=%llu, meta=%llu], "
 		"app [read=%llu (direct=%llu, buffered=%llu), mapped=%llu], "
@@ -2026,6 +2043,7 @@ TRACE_EVENT(f2fs_iostat,
 		__entry->app_bio, __entry->app_mio, __entry->app_bcdio,
 		__entry->app_mcdio, __entry->fs_dio, __entry->fs_cdio,
 		__entry->fs_nio, __entry->fs_mio, __entry->fs_discard,
+		__entry->fs_reset_zone,
 		__entry->fs_gc_dio, __entry->fs_gc_nio, __entry->fs_cp_dio,
 		__entry->fs_cp_nio, __entry->fs_cp_mio,
 		__entry->app_rio, __entry->app_drio, __entry->app_brio,
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
