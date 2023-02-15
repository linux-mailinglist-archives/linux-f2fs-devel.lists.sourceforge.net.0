Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC3E697485
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Feb 2023 03:49:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pS7r4-0000jl-Ig;
	Wed, 15 Feb 2023 02:49:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1pS7r2-0000jf-TJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Feb 2023 02:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WBBMh11k+5k+trQqfhsCGIiCubTA7xgMqB9364lgdrs=; b=WY1/sCpThvKEUL0FhZ5t9S9HQv
 /LQ0E6mlcrAm0HbjqDNt08y+9Z9zjFU9KkeSlnPdCjt67TKhKUVD2kDAhtGCOCj0RqQOwyuNJToks
 bh7k0Mih/0MJD4uFzFkybveRKnjI3fsb0HEQlvAV8cjiQwSwqWkfh2LGdjbp8l9Dow5A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WBBMh11k+5k+trQqfhsCGIiCubTA7xgMqB9364lgdrs=; b=D
 sH4LKalvdKann+PYwRtwOkKk4vh18s6HVkTDewgYcvpcPDlOy5jo+AiHKr3Kmg/MiBcBfnoe2ngAO
 D91Qc3dwBEcOk+qN9SoY9Ucc+mD/csnO1naOPOMaSuwmIbSWNBFb/j59vjP4jF4NO6NsMCXGGJhgq
 +bkqEuDLSUBGXWkc=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pS7qv-0004g1-1R for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Feb 2023 02:49:08 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20230215024851epoutp01e007812fd2bd97280e063b7d9ad2c388~D35hgBQVs1625816258epoutp01P
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 Feb 2023 02:48:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20230215024851epoutp01e007812fd2bd97280e063b7d9ad2c388~D35hgBQVs1625816258epoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1676429331;
 bh=WBBMh11k+5k+trQqfhsCGIiCubTA7xgMqB9364lgdrs=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=liNxrF0aVnd/iaPaj38Nn3N/k2G6HTrz8wt2BDoqSJcfrLwMEwG045diS7RGhvrxC
 R4jVHWpIb1EFhh4n6yASjyBg51KBZIYlaJaCaCuAw9DiiP//iOwqHf6dC7Cr008wy6
 dKw1a0LjKfM3XOjyCc63ptXbxjOSOFfElIbZlOrc=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20230215024851epcas2p1f721c7342ecb6dc5a28c0b732bbe6d64~D35g-T9mH1382613826epcas2p1-;
 Wed, 15 Feb 2023 02:48:51 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.88]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4PGjFZ756Rz4x9Px; Wed, 15 Feb
 2023 02:48:50 +0000 (GMT)
X-AuditID: b6c32a46-cee5fa8000007a4b-57-63ec48127d0c
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 A7.56.31307.2184CE36; Wed, 15 Feb 2023 11:48:50 +0900 (KST)
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
Message-ID: <20230215024850epcms2p22be2cc864d82b44f31c19a7ef28770b6@epcms2p2>
Date: Wed, 15 Feb 2023 11:48:50 +0900
X-CMS-MailID: 20230215024850epcms2p22be2cc864d82b44f31c19a7ef28770b6
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLKsWRmVeSWpSXmKPExsWy7bCmha6Qx5tkg8VdVhanp55lslj1INzi
 yfpZzBaXFrlbXN41h81iVcdcRoup548wObB7bFrVyeaxe8FnJo++LasYPT5vkgtgicq2yUhN
 TEktUkjNS85PycxLt1XyDo53jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXLzAHar6RQlphTChQK
 SCwuVtK3synKLy1JVcjILy6xVUotSMkpMC/QK07MLS7NS9fLSy2xMjQwMDIFKkzIzmhZ/IK5
 4AVbxeR5v9kbGG+wdjFyckgImEj0XfnL0sXIxSEksINR4vn+dWxdjBwcvAKCEn93CIPUCAvY
 SHQtvMkGYgsJKElcO9DLAhHXl9i8eBk7iM0moCvxd8NyMFtE4BWjxJnVoiA2s0CQxP0pD6B2
 8UrMaH/KAmFLS2xfvpURwtaQ+LGslxnCFpW4ufotO4z9/th8qBoRidZ7Z6FqBCUe/NwNFZeU
 WHToPBOEnS/xd8V1Ngi7RmJrQxtUXF/iWsdGFoi3fCVmXBcBCbMIqEr8nTEX6hwXiWUzrrBD
 nCwvsf3tHGaQcmYBTYn1u/RBTAkBZYkjt1ggKvgkOg7/ZYd5ase8J1CL1CQ2b9oM9ayMxIXH
 bVBHekhM2nqPGRKAgRKHtt1jncCoMAsRzLOQ7J2FsHcBI/MqRrHUguLc9NRiowIjeMwm5+du
 YgSnQy23HYxT3n7QO8TIxMF4iFGCg1lJhFf46YtkId6UxMqq1KL8+KLSnNTiQ4ymQB9PZJYS
 Tc4HJuS8knhDE0sDEzMzQ3MjUwNzJXFeaduTyUIC6YklqdmpqQWpRTB9TBycUg1MocqPVGuy
 1T/5FXpy2kfaFviWyvzV//uR4ePBGX26d2fem2YVtpP10x9+tt/qVoe6rIOKGtZMizbI/To3
 9N0W3kCNf390DRNfhsbtOnP4s7dQzu4Qhvq1jGu3T5uutTOoU6f9w5wdvXvaHx4XtXJ7zWIW
 a/6l5HOR+Unxf+1T3dq3NWqwV175vq9J69ZTLQvZqKLLqdub1jvKHAgU6TW9d4VttoJD/7/d
 LNpmMgoX3j3eWSK7R7O1p5pt5/2AScIX9s54eJz30iNBBVOPNWnPzj9eGmb1sOzio5D5ixJ+
 Kn3gWJ0vyP38UKGmZKDnT0vxS/cTF9xW2rv2QOHE+/vFA6MWbzRZuGxukF9My+cFSizFGYmG
 WsxFxYkAqa50JxAEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230215024850epcms2p22be2cc864d82b44f31c19a7ef28770b6
References: <CGME20230215024850epcms2p22be2cc864d82b44f31c19a7ef28770b6@epcms2p2>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When f2fs skipped a gc round during victim migration, there
 was a bug which would skip all upcoming gc rounds unconditionally because
 skipped_gc_rwsem was not initialized. It fixes the bug by correctl [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
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
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pS7qv-0004g1-1R
Subject: [f2fs-dev] [PATCH v1] f2fs: fix uninitialized skipped_gc_rwsem
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
Cc: Seokhwan Kim <sukka.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When f2fs skipped a gc round during victim migration, there was a bug which
would skip all upcoming gc rounds unconditionally because skipped_gc_rwsem
was not initialized. It fixes the bug by correctly initializing the
skipped_gc_rwsem inside the gc loop.

Fixes: d147ea4adb96 ("f2fs: introduce f2fs_gc_control to consolidate f2fs_gc parameters")
Signed-off-by: Yonggil Song <yonggil.song@samsung.com>

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index b22f49a6f128..81d326abaac1 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1786,8 +1786,8 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 				prefree_segments(sbi));
 
 	cpc.reason = __get_cp_reason(sbi);
-	sbi->skipped_gc_rwsem = 0;
 gc_more:
+	sbi->skipped_gc_rwsem = 0;
 	if (unlikely(!(sbi->sb->s_flags & SB_ACTIVE))) {
 		ret = -EINVAL;
 		goto stop;
-- 
2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
