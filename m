Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 518866FFF91
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 May 2023 06:16:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pxKCh-0006zq-DY;
	Fri, 12 May 2023 04:16:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1pxKCf-0006zk-Pz
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 May 2023 04:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v0F36rdhCqmYHzWYCcSPoz47p9NTpAJZ63jsBopms9k=; b=KRfzbrrbbh8V7Xt3A9VRPEQme2
 84aKiByA4hueiWnc6zkrmj9TakJqvG6V5TJXmTkrJZVFjH2fdr71D2tG9DAXLBUw2A+L6XI+lhY+B
 34SuI3tTfnwBNhXGxAL3THevR2tgW6SN/DLk70NroaegitXM6VUC4RB2XEZjzK+nBnhU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=v0F36rdhCqmYHzWYCcSPoz47p9NTpAJZ63jsBopms9k=; b=Q
 3yef0PHygOv2elh9aUmSFabAMHlUtdE/9Ouck0HDpnbAvA05llqQNEbMoqKkwingHJQ20IoqZMj7y
 VIfFGl+eFzgf10rXST9FgHammri4lPe/8zVtzLwJ6dbxLvmh2DLWCCb5whiJPxbGCq3Wg/u9Sn6sw
 x57D6ZG0tdzYSkVM=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pxKCb-0044K3-T8 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 May 2023 04:16:25 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20230512041611epoutp022d5ab48045c057861aa0c5d5401b9086~eSkUr3OJX1771217712epoutp02-
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 May 2023 04:16:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20230512041611epoutp022d5ab48045c057861aa0c5d5401b9086~eSkUr3OJX1771217712epoutp02-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683864971;
 bh=v0F36rdhCqmYHzWYCcSPoz47p9NTpAJZ63jsBopms9k=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=uxvtEuD/qycRzM3UlP2AR/4D8BIUc7CpiQ/9/UtV4bJm9eFjAfzqrKvFw75diVJyz
 hO9oQardNXTuYcKqdSLF+TYrMvYAVsbd+TdusCtPV+XyNEoAOGQNqjUeXMmjVSywwK
 ZCY34nSp2Zm9N5spgEzKePDL1mk7pnwK8k0ixjsA=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20230512041611epcas2p205e0bc905f352e9afb7f95c468911e09~eSkUWIr0p0853708537epcas2p2R;
 Fri, 12 May 2023 04:16:11 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.92]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4QHb6f6fd4z4x9QB; Fri, 12 May
 2023 04:16:10 +0000 (GMT)
X-AuditID: b6c32a48-475ff70000005998-af-645dbd8ab9e8
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 7D.2D.22936.A8DBD546; Fri, 12 May 2023 13:16:10 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230512041610epcms2p506e7539079670524146ba6eeeb9dbd63@epcms2p5>
Date: Fri, 12 May 2023 13:16:10 +0900
X-CMS-MailID: 20230512041610epcms2p506e7539079670524146ba6eeeb9dbd63
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpik+LIzCtJLcpLzFFi42LZdljTVLdrb2yKwYENZhYX5n1ktjg99SyT
 xaoH4RZP1s9itri0yN3i8q45bBarOuYyWkw9f4TJgcNj06pONo/dCz4zefRtWcXo8XmTXABL
 VLZNRmpiSmqRQmpecn5KZl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtARSgpl
 iTmlQKGAxOJiJX07m6L80pJUhYz84hJbpdSClJwC8wK94sTc4tK8dL281BIrQwMDI1OgwoTs
 jLMPZ7EVdIhWvLwq38D4TqCLkZNDQsBEYm/nQdYuRi4OIYEdjBITXp9l6WLk4OAVEJT4u0MY
 pEZYwF3i4oa9rCC2kICSxLUDvSwQcX2JzYuXsYPYbAK6En83LAezRQReMUqcWS0KYjMLVEhs
 /vCSBWIXr8SM9qdQtrTE9uVbGSFsDYkfy3qZIWxRiZur37LD2O+PzYeqEZFovXcWqkZQ4sHP
 3VBxSYlFh84zQdj5En9XXGeDsGsktja0QcX1Ja51bATbyyvgK3HteDNYnEVAVWLLrC9Q9S4S
 879tY4e4WV5i+9s5zKBgYBbQlFi/Sx/ElBBQljhyiwWigk+i4/Bfdpivdsx7ArVJTWLzps2s
 ELaMxIXHbVBXekgcf3WZCRKCgRI3O5tZJjAqzEKE8ywke2ch7F3AyLyKUSy1oDg3PbXYqMAE
 HrPJ+bmbGMGJUctjB+Pstx/0DjEycTAeYpTgYFYS4X27JDpFiDclsbIqtSg/vqg0J7X4EKMp
 0McTmaVEk/OBqTmvJN7QxNLAxMzM0NzI1MBcSZz3Y4dyipBAemJJanZqakFqEUwfEwenVAOT
 p2fyuYo1LrvzqpJSXnQ7PiqbwLJ5fejyZAXlj5LSxy9FmvWku+i/nfTRnsv8mOfsmTNnPDr0
 /6rR1tTc/b0L5KMnrJNbm/z/S5dHwsqQlR1sM24Z8dTdOK54Q/LPltWdykkXc3K2sVXfKG+9
 e3i3ic0H9R9yJspMX5jd9zl/Dw5fxPb4YYqhzYNbm9dcu6jFt3R/2AQb6Yt/mo4IOGv/XLcr
 LWnl1p0MwYzsAXczXzCtCH3/TX7/P9EDM1/JbJe3C57zprEp9mVg/ySJOO63h/XZJn1Ysdgp
 1Pv36hVnyhPqUt7w+MnGHHWYtCNvjsgb9gM7PhZsnZp7zde76nfqLeWj5v2NecHbA7WfJKzO
 VGIpzkg01GIuKk4EABRcudwVBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230512041610epcms2p506e7539079670524146ba6eeeb9dbd63
References: <CGME20230512041610epcms2p506e7539079670524146ba6eeeb9dbd63@epcms2p5>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: There was a bug that finishing FG GC unconditionally because
 free sections are over-estimated after checkpoint in FG GC. This patch
 initializes
 sec_freed by every checkpoint in FG GC. Signed-off-by: Yonggil Song
 <yonggil.song@samsung.com>
 --- fs/f2fs/gc.c | 16 +++++++++++----- 1 file changed, 11 insertions(+),
 5 deletions(-) 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.25 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [203.254.224.25 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pxKCb-0044K3-T8
Subject: [f2fs-dev] [PATCH v1] f2fs: Fix over-estimating free section during
 FG GC
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
Reply-To: yonggil.song@samsung.com
Cc: Seokhwan Kim <sukka.kim@samsung.com>, beomsu kim <beomsu7.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There was a bug that finishing FG GC unconditionally because free sections
are over-estimated after checkpoint in FG GC.
This patch initializes sec_freed by every checkpoint in FG GC.

Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
---
 fs/f2fs/gc.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index d455140322a8..51d7e8d29bf1 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1797,7 +1797,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 {
 	int gc_type = gc_control->init_gc_type;
 	unsigned int segno = gc_control->victim_segno;
-	int sec_freed = 0, seg_freed = 0, total_freed = 0;
+	int sec_freed = 0, seg_freed = 0, total_freed = 0, total_sec_freed = 0;
 	int ret = 0;
 	struct cp_control cpc;
 	struct gc_inode_list gc_list = {
@@ -1842,6 +1842,8 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 			ret = f2fs_write_checkpoint(sbi, &cpc);
 			if (ret)
 				goto stop;
+			/* Reset due to checkpoint */
+			sec_freed = 0;
 		}
 	}
 
@@ -1866,15 +1868,17 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 				gc_control->should_migrate_blocks);
 	total_freed += seg_freed;
 
-	if (seg_freed == f2fs_usable_segs_in_sec(sbi, segno))
+	if (seg_freed == f2fs_usable_segs_in_sec(sbi, segno)) {
 		sec_freed++;
+		total_sec_freed++;
+	}
 
 	if (gc_type == FG_GC) {
 		sbi->cur_victim_sec = NULL_SEGNO;
 
 		if (has_enough_free_secs(sbi, sec_freed, 0)) {
 			if (!gc_control->no_bg_gc &&
-			    sec_freed < gc_control->nr_free_secs)
+			    total_sec_freed < gc_control->nr_free_secs)
 				goto go_gc_more;
 			goto stop;
 		}
@@ -1901,6 +1905,8 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 		ret = f2fs_write_checkpoint(sbi, &cpc);
 		if (ret)
 			goto stop;
+		/* Reset due to checkpoint */
+		sec_freed = 0;
 	}
 go_gc_more:
 	segno = NULL_SEGNO;
@@ -1913,7 +1919,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 	if (gc_type == FG_GC)
 		f2fs_unpin_all_sections(sbi, true);
 
-	trace_f2fs_gc_end(sbi->sb, ret, total_freed, sec_freed,
+	trace_f2fs_gc_end(sbi->sb, ret, total_freed, total_sec_freed,
 				get_pages(sbi, F2FS_DIRTY_NODES),
 				get_pages(sbi, F2FS_DIRTY_DENTS),
 				get_pages(sbi, F2FS_DIRTY_IMETA),
@@ -1927,7 +1933,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 	put_gc_inode(&gc_list);
 
 	if (gc_control->err_gc_skipped && !ret)
-		ret = sec_freed ? 0 : -EAGAIN;
+		ret = total_sec_freed ? 0 : -EAGAIN;
 	return ret;
 }
 
-- 
2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
