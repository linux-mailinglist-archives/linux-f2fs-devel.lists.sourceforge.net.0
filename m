Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 687686E3DBF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Apr 2023 05:07:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1poFDN-0004M7-RY;
	Mon, 17 Apr 2023 03:07:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1poFDM-0004M1-9c
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Apr 2023 03:07:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VN4j28XByM78biV+HGbwwldIp/XH+q9xrErrO7r2R+I=; b=mVkHwgw1Putq7vJQQKpQjz4bbx
 PPWoenA7BP65o0x+x5VHf/Nr8d/vIs8FvG91mdnIUqMwcCMO1JoG/QIVVWI7KQvnfskLqVcoJ/mwH
 tjoJS1YekXyG3LqWB5tSjfPn+bIWlufKpvCGebbqP6l5FDawPi7mv/G/cQQE7g1KYiSs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VN4j28XByM78biV+HGbwwldIp/XH+q9xrErrO7r2R+I=; b=eUYMWcrmBGAnmG72pc5xr1Q9ia
 sjKLOQYXpNZ4sClD5PQGILFRfFcjPdEbURS5CNJbSvX/SchZ+ojl+e28x0X5V4E27K9LBhV/K0p5m
 lv+SwjntbnTRrrluCoSwRrIsmNnBdO90E2SIhG8zKSV479BBZJIUDifNsASjV3Q7Zlyc=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1poFDF-00AAT9-BP for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Apr 2023 03:07:35 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20230417030718epoutp01a238a96896a9ee2be1c4e2f10b1e5958~WmgDCZhmr2357023570epoutp01j
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Apr 2023 03:07:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20230417030718epoutp01a238a96896a9ee2be1c4e2f10b1e5958~WmgDCZhmr2357023570epoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1681700838;
 bh=VN4j28XByM78biV+HGbwwldIp/XH+q9xrErrO7r2R+I=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=lbOv5YldJWSUU9H/GGJmgSANuR6rA/8huJlI0cigqCgujqqjak0XZnUCy2N5jQd5C
 n2Au53yojHDIoO/osRowCmysjfDGoyFkTXUcHA6eXfaJntPwvlciNA1BgG4sJt7Kz8
 0gak1CEsKLKHe7Ab063YTN3Ic6exi3BhVjbxfkkY=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20230417030718epcas2p19a00917811bd9ce3f4f7bbeb084e126c~WmgCpBnCl0766907669epcas2p1R;
 Mon, 17 Apr 2023 03:07:18 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.98]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4Q0Bmk19ZTz4x9Pq; Mon, 17 Apr
 2023 03:07:18 +0000 (GMT)
X-AuditID: b6c32a48-023fa700000025b2-ec-643cb7e303ef
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 A9.6E.09650.3E7BC346; Mon, 17 Apr 2023 12:07:15 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20230414035146.1381029-1-chao@kernel.org>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230417030715epcms2p23a6154070f7140a5ae49c6e07114b88e@epcms2p2>
Date: Mon, 17 Apr 2023 12:07:15 +0900
X-CMS-MailID: 20230417030715epcms2p23a6154070f7140a5ae49c6e07114b88e
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAKsWRmVeSWpSXmKPExsWy7bCmme7j7TYpBnf/m1qcnnqWyeLJ+lnM
 FpcWuTswe2xa1cnmsXvBZ6YApqhsm4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwNDXUNLC3Ml
 hbzE3FRbJRefAF23zBygHUoKZYk5pUChgMTiYiV9O5ui/NKSVIWM/OISW6XUgpScAvMCveLE
 3OLSvHS9vNQSK0MDAyNToMKE7IyeyxfYCzrEK9Zu/cLewHheqIuRg0NCwETiyZrQLkYuDiGB
 HYwSHb83MIHEeQUEJf7uEAYxhQWcJVaeU+ti5AQqUZK4dqCXBcQWFtCX2Lx4GTuIzSagK/F3
 w3IwW0TAQ2LbhOlgNcwC4RI/vt1hBLElBHglZrQ/ZYGwpSW2L98KFucUMJdY8n8tE0RcQ+LH
 sl5mCFtU4ubqt+ww9vtj86HmiEi03jsLVSMo8eDnbqi4pMSiQ+eh5uRL/F1xnQ3CrpHY2tAG
 FdeXuNaxEewGXgFfia5Ti1lBbBYBVYltt9ZB7XKRWDbtNRvE/fIS29/OYQYFA7OApsT6XfqQ
 QFOWOHIL6kM+iY7Df9lhPtwx7wnUJjWJzZs2s0LYMhIXHrdBXekhcezGC+YJjIqzEME8C8mu
 WQi7FjAyr2IUSy0ozk1PLTYqMIFHbHJ+7iZGcFLT8tjBOPvtB71DjEwcjIcYJTiYlUR4z7ha
 pQjxpiRWVqUW5ccXleakFh9iNAX6ciKzlGhyPjCt5pXEG5pYGpiYmRmaG5kamCuJ837sUE4R
 EkhPLEnNTk0tSC2C6WPi4JRqYOIRE8/ZMfXUxoKDz46Y2x5/zPBK4qqCXfSqM6nVje6uB/sT
 +95+/9rgcfOqV3/LTScp94gzPPYb//4Nd7gvLRJ+ibkzeIrBuw/J7MdC5VNLAiK9t6iozdp+
 R8t1HW9yp9/2qVkTE/0is1YdNUvStjEx4dZUuuPCFfh6QmHMXk7hcuME+YISQ+7Z7N9sTa9L
 NB2fU6YdFvDj0YyVl4M/+M6zkt8qFFDHF+FuVS3ltvTa5EQ3CaWWYhGjlC8hoZaCVsfN4x7c
 PXWeS9GwsCWHMc7F21H0ynaejr6+E1v5zxq82dR7/kHKhf74myaeO6SPnvz5/NxTjhKbBUl/
 4kyvN3+wvmaYJz8hRX9nyGMlluKMREMt5qLiRABRgdZW8wMAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230414035331epcas2p2bdf8280ca5eb9a5050dd2cc5dfff0f14
References: <20230414035146.1381029-1-chao@kernel.org>
 <CGME20230414035331epcas2p2bdf8280ca5eb9a5050dd2cc5dfff0f14@epcms2p2>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: >Fixed a xfstests failure. > >From
 400c722c2117660b83190c88e5442d63fbbffe6e
 Mon Sep 17 00:00:00 2001 >From: Jaegeuk Kim <jaegeuk@kernel.org> >Date: Mon,
 10 Apr 2023 14:48:50 -0700 >Subject: [PATCH] f2 [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.24 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1poFDF-00AAT9-BP
Subject: Re: [f2fs-dev] [PATCH] f2fs_io: support checkpoint command
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>Fixed a xfstests failure.
>
>From 400c722c2117660b83190c88e5442d63fbbffe6e Mon Sep 17 00:00:00 2001
>From: Jaegeuk Kim <jaegeuk@kernel.org>
>Date: Mon, 10 Apr 2023 14:48:50 -0700
>Subject: [PATCH] f2fs: refactor f2fs_gc to call checkpoint in urgent condition
>
>The major change is to call checkpoint, if there's not enough space while having
>some prefree segments in FG_GC case.
>
>Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>---
> fs/f2fs/gc.c | 27 +++++++++++++--------------
> 1 file changed, 13 insertions(+), 14 deletions(-)
>
>diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>index c748cdfb0501..ba5775dcade6 100644
>--- a/fs/f2fs/gc.c
>+++ b/fs/f2fs/gc.c
>@@ -1829,7 +1829,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
> 		goto stop;
> 	}
> 
>-	if (gc_type == BG_GC && has_not_enough_free_secs(sbi, 0, 0)) {
>+	/* Let's run FG_GC, if we don't have enough space. */
>+	if (has_not_enough_free_secs(sbi, 0, 0)) {
>+		gc_type = FG_GC;
>+

Hi, Jaegeuk & Chao

Would it be possible to clarify if this patch is intended to perform checkpoint every gc round?

Thanks.

> 		/*
> 		 * For example, if there are many prefree_segments below given
> 		 * threshold, we can make them free by checkpoint. Then, we
>@@ -1840,8 +1843,6 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
> 			if (ret)
> 				goto stop;
> 		}
>-		if (has_not_enough_free_secs(sbi, 0, 0))
>-			gc_type = FG_GC;
> 	}
> 
> 	/* f2fs_balance_fs doesn't need to do BG_GC in critical path. */
>@@ -1868,19 +1869,15 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
> 	if (seg_freed == f2fs_usable_segs_in_sec(sbi, segno))
> 		sec_freed++;
> 
>-	if (gc_type == FG_GC)
>+	if (gc_type == FG_GC) {
> 		sbi->cur_victim_sec = NULL_SEGNO;
> 
>-	if (gc_control->init_gc_type == FG_GC ||
>-	    !has_not_enough_free_secs(sbi,
>-				(gc_type == FG_GC) ? sec_freed : 0, 0)) {
>-		if (gc_type == FG_GC && sec_freed < gc_control->nr_free_secs)
>-			goto go_gc_more;
>-		goto stop;
>-	}
>-
>-	/* FG_GC stops GC by skip_count */
>-	if (gc_type == FG_GC) {
>+		if (!has_not_enough_free_secs(sbi, sec_freed, 0)) {
>+			if (!gc_control->no_bg_gc &&
>+			    sec_freed < gc_control->nr_free_secs)
>+				goto go_gc_more;
>+			goto stop;
>+		}
> 		if (sbi->skipped_gc_rwsem)
> 			skipped_round++;
> 		round++;
>@@ -1889,6 +1886,8 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
> 			ret = f2fs_write_checkpoint(sbi, &cpc);
> 			goto stop;
> 		}
>+	} else if (!has_not_enough_free_secs(sbi, 0, 0)) {
>+		goto stop;
> 	}
> 
> 	__get_secs_required(sbi, NULL, &upper_secs, NULL);
>-- 
>2.40.0.634.g4ca3ef3211-goog
>
>
>
>_______________________________________________
>Linux-f2fs-devel mailing list
>Linux-f2fs-devel@lists.sourceforge.net
>https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
