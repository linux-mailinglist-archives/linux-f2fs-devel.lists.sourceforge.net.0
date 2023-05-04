Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 521F76F634F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 May 2023 05:27:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1puPcz-0003vu-KW;
	Thu, 04 May 2023 03:27:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1puPcy-0003vo-A8
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 03:27:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YApSMyTWLnCEGIbez+Fozg73omjIgxuPxM8KqNfUOD0=; b=E0k/l9Nv0RgMywU4R5zd/T+GNd
 6Me8XzrKIpu8fxLwxzHk8WqG7mXdWko/J3iuwyKIJNivdFppTHgpvMjlqhMQlCp6lUppir33pf9c0
 +cO4HRWG9CxP1ApDi2q0hK2aDTETTZE+KbW1MYkljYXZExs2EzEqASYGewxgkHJcd8vY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YApSMyTWLnCEGIbez+Fozg73omjIgxuPxM8KqNfUOD0=; b=L
 SdOTNjyHgAz7Hh86fmeUaDwmKj8oA+1z3Xvj7t+XFf4oJJGNH7PStWOdM9p5kR3iDP5ThiXg9R70y
 IzzFowjlNxBb4VGfCZQjn6L6hECunNgTo0apZoOqI5Yeoyp/or27y7sOhH+s4t4CSmFBEJ34quyza
 qfAu23RFK6V6beAg=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1puPcw-0000ab-5n for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 03:27:33 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20230504032720epoutp0496c1bbeac0efb8d51a4999e7ee5757be~b0vYWUsSM2620026200epoutp04f
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  4 May 2023 03:27:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20230504032720epoutp0496c1bbeac0efb8d51a4999e7ee5757be~b0vYWUsSM2620026200epoutp04f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683170840;
 bh=YApSMyTWLnCEGIbez+Fozg73omjIgxuPxM8KqNfUOD0=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=kQtU+VO79CNMUN4vSvYpjuMCrT0hECnMJRaNCJ6RiFHopGlecpGmo+f7FSWcFkvyc
 KxO/q/0oUJ5/jUggiUPrfVP1Uod6UA6F9gI9kwykYwV6A8DFEcaVY2Jnb7kcfXzGX5
 IDXAu3NkeD7J51WOhLpEFYFMbSGnsj1Nh5vpiKz0=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20230504032719epcas2p482681baad1a144a688620cab0615f47d~b0vYAsFgG0463404634epcas2p4f;
 Thu,  4 May 2023 03:27:19 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.101]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4QBfPz1R44z4x9Pp; Thu,  4 May
 2023 03:27:19 +0000 (GMT)
X-AuditID: b6c32a48-6d3fa70000005998-c8-645326175088
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 65.56.22936.71623546; Thu,  4 May 2023 12:27:19 +0900 (KST)
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
Message-ID: <20230504032618epcms2p78719fc50d05943b26ae47d74fd14438c@epcms2p7>
Date: Thu, 04 May 2023 12:26:18 +0900
X-CMS-MailID: 20230504032618epcms2p78719fc50d05943b26ae47d74fd14438c
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJJsWRmVeSWpSXmKPExsWy7bCmha64WnCKweud7BYX5n1ktjg99SyT
 xctDmharHoRbPFk/i9ni0iJ3i8u75rBZHFl/lsVi8XI1i30dD5gsVnXMZbSYev4IkwOPR8u+
 W+wem1Z1snnsXvCZyaNvyypGj8+b5AJYo7JtMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1
 DS0tzJUU8hJzU22VXHwCdN0yc4BuU1IoS8wpBQoFJBYXK+nb2RTll5akKmTkF5fYKqUWpOQU
 mBfoFSfmFpfmpevlpZZYGRoYGJkCFSZkZ/RP/MpWsNq0YsvhNpYGxqU6XYycHBICJhLPpnaw
 gdhCAjsYJU7tD+xi5ODgFRCU+LtDGCQsLGAn0dS1lxWiREli/cVZ7BBxPYlbD9cwgthsAjoS
 00/cB4uLCExllji8KbWLkYuDWWAxo8TW/xdZIHbxSsxofwplS0tsX76VEcLWkPixrJcZwhaV
 uLn6LTuM/f7YfKgaEYnWe2ehagQlHvzcDRWXlLg9dxNUfb7E/yvLoewaiW0H5kHZ+hLXOjaC
 7eUV8JU49v8xmM0ioCpx9+BUqDkuEl/mLQCHA7OAvMT2t3OYQeHALKApsX6XPogpIaAsceQW
 C0QFn0TH4b/sMF81bPyNlb1j3hMmCFtNYt3P9UwQY2Qkbs1jnMCoNAsRzrOQrJ2FsHYBI/Mq
 RrHUguLc9NRiowITeMwm5+duYgSnUS2PHYyz337QO8TIxMF4iFGCg1lJhPdDoV+KEG9KYmVV
 alF+fFFpTmrxIUZToIcnMkuJJucDE3leSbyhiaWBiZmZobmRqYG5kjjvxw7lFCGB9MSS1OzU
 1ILUIpg+Jg5OqQam6Bkv2nSPK+75YFux6eN0t5YorspX0isOrTAVKj4wd7ZtTuH5pXuVFZ5o
 hLf/vaFcKLfPNcvzZbSld1Bk+kmhZL9aqSOPJzZ+PzHnjfG6oN/5rwJXPe7+c09OJyFJ86ze
 77ADFRL1Ziu5nEt8lghPXW4snlmUvnBKxI8MCxdbjq1C0T/5vjeWZwgdz97ZVD3Hb823VWd9
 lrg86u7y6vbxWzG707KCceX7D4739sa6LGFh/+R0nMfzxqfrSTdqp/0yXP4xnTlJiT92WdTZ
 6WdLt5o/mDtVnod1lUtW6luHSsf0nGjTmhi235vWpF2Xu9w8ecfOTfsEM7fcmpftFDz9nzvj
 Uo05si9Uej6dX96jxFKckWioxVxUnAgA/O72NiwEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230504032618epcms2p78719fc50d05943b26ae47d74fd14438c
References: <CGME20230504032618epcms2p78719fc50d05943b26ae47d74fd14438c@epcms2p7>
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: v4 -> v5 Added f2fs iostat for zone reset command. v3 -> v4
 Fixed build error caused by unused function. v2 -> v3 Modified arguments
 to be correct for ftrace parameter. Changed __submit_zone_reset_cmd to void
 return. Refactored the f2fs_wait_discard_bio function. Fixed code that was
 previously incorrectl [...] 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.34 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puPcw-0000ab-5n
Subject: [f2fs-dev] [PATCH v5] f2fs: add async reset zone command support
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
 include/trace/events/f2fs.h | 18 +++++++-
 4 files changed, 99 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d211ee89c158..15518206cb31 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1175,6 +1175,7 @@ enum iostat_type {
 	/* other */
 	FS_DISCARD_IO,			/* discard */
 	FS_FLUSH_IO,			/* flush */
+	FS_ZONE_RESET_IO,		/* zone reset*/
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
