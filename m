Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B86C9923DB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Oct 2024 07:21:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sxgBg-0006bC-8N;
	Mon, 07 Oct 2024 05:21:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1sxgBe-0006b5-2z
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Oct 2024 05:21:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:To:From:Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XkPIRM3U4jCdaiGC4n343ikwc4gQdie3fQQ4q/mvRqQ=; b=AlAtzQVClbO6nHx/DCS9T2RyBK
 LaxGdin/bR0GWPJLf5hl4hktQfxSv4BGICjsmgYRrgvwC+bEZmHrWrxIj6DVFhEEA3Waws2kCYePO
 N4U1Gm1DTrUjGFpjdNhmPehExa6OW4tOC+gGGhH84mKsAI06w3COdffrzzToU50Z9SAQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:To:From
 :Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XkPIRM3U4jCdaiGC4n343ikwc4gQdie3fQQ4q/mvRqQ=; b=K
 YhV6HNwjrq0mHLNj0A1RmWgE7yqadsHhveGuPh8MvI7PtnHQAW4WPb0hVRZH4Z9ReoKHhGo/03tup
 +lOEX8AgN7Koh0jMK9zLQDfu2XlPHCSfDAwbfkFbGxIXdyLTX64PJiFSzBhd/tQ/XiiUViFZnkhtW
 Ckx8cBWMzVXRBsbY=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sxgBb-0002oV-Fm for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Oct 2024 05:21:38 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20241007052123epoutp0162001d0c9502fd171680f6f076a09bcb~8FB_z1VT72939029390epoutp01W
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  7 Oct 2024 05:21:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20241007052123epoutp0162001d0c9502fd171680f6f076a09bcb~8FB_z1VT72939029390epoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1728278483;
 bh=XkPIRM3U4jCdaiGC4n343ikwc4gQdie3fQQ4q/mvRqQ=;
 h=Subject:Reply-To:From:To:Date:References:From;
 b=cpMQn3yQZNbEOsIPwpxlHj6Aar/SeHAbVzrOO791fLvXwkojSVEGSs2Ynn75zem0K
 rpgY5MjmAiNT/tpzaHsq/EovNGzXUBsg2Ui77dLONghgCMjMyNBuVf08IWjz93FUzO
 4RdOXUCmeh1wYKk6dv2CEr7oQSeCcE6hxG2szh+s=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20241007052123epcas2p447dbc2e44eb1561a43a0686ad3fe3151~8FB_exGLD3151631516epcas2p4g;
 Mon,  7 Oct 2024 05:21:23 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.70]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4XMSDf32gpz4x9Q3; Mon,  7 Oct
 2024 05:21:22 +0000 (GMT)
X-AuditID: b6c32a4d-183ff70000004a06-ad-67036fd2976e
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
 C7.AA.18950.2DF63076; Mon,  7 Oct 2024 14:21:22 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Dongjin Kim <dongjin_.kim@samsung.com>,
 Yonggil Song <yonggil.song@samsung.com>, Siwoo Jung <siu.jung@samsung.com>,
 Daejun Park <daejun7.park@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20241007052122epcms2p8a7a733c92a8da751ac64af8a29de0303@epcms2p8>
Date: Mon, 07 Oct 2024 14:21:22 +0900
X-CMS-MailID: 20241007052122epcms2p8a7a733c92a8da751ac64af8a29de0303
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJKsWRmVeSWpSXmKPExsWy7bCmme6lfOZ0g9fXxSxOTz3LZLHqQbjF
 j5MmFk/Wz2K2uLTI3eLyrjlsFucnvmaymHr+CJMDh8emVZ1sHrsXfGby6NuyitHj8ya5AJao
 bJuM1MSU1CKF1Lzk/JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoBuUFMoS
 c0qBQgGJxcVK+nY2RfmlJakKGfnFJbZKqQUpOQXmBXrFibnFpXnpenmpJVaGBgZGpkCFCdkZ
 D/bOZyu4xlXRd/AfWwPjA44uRk4OCQETiZa5B5i6GLk4hAT2MErsuP2bvYuRg4NXQFDi7w5h
 kBphAX+JR/uuMYHYQgJKEtcO9LJAxPUlNi9exg5iswnoSvzdsJwdZI6IQBezxKqGm4wQC3gl
 ZrQ/ZYGwpSW2L98KFdeQ+LGslxnCFpW4ufotO4z9/th8qBoRidZ7Z6FqBCUe/NwNFZeUWHTo
 PBOEnS/xd8V1Ngi7RmJrQxtUXF/iWsdGsL28Ar4S86ZfYQWxWQRUJbqbFzGD/Cgh4CLxYxcn
 SJhZQF5i+9s5YGFmAU2J9bv0ISqUJY7cYoGo4JPoOPyXHeapHfOeQC1Sk9i8aTMrhC0jceFx
 GyNEq4fE2c9BkEALlPhxcBnjBEb5WYignYVk7SyEtQsYmVcxSqUWFOempyYbFRjq5qWWw2M0
 OT93EyM4DWr57mB8vf6v3iFGJg7GQ4wSHMxKIrwRaxjThXhTEiurUovy44tKc1KLDzGaAv08
 kVlKNDkfmIjzSuINTSwNTMzMDM2NTA3MlcR577XOTRESSE8sSc1OTS1ILYLpY+LglGpgMn5n
 sl7LN0JA6ncjp4/Bhrnyin33DSf8ONeyUoDb6dqUx4vcZk2PievsL2OL3T9bJon/9t/GFaIq
 alv6LTgOVIvq3+2NX37lmLxjUsnzPfZ6qjMO1q9jMoiN5TuWcybkSMOCnc82F+nv3HHmx8MD
 BkxrZM4GPpPpNffaPnk6W9R+J911M111b5+Mfuotp2A5e3dR4fcDZpP2HbZ/6sV5rlxyqqO2
 wqU3oUY5VmebfjS+uHNs59TwpTs+irVteXrG7e/ZO2xbwjUX5izva2ef6NH6oTFzRbrIko6d
 qyWKzu4QafKI1u88VpHYKvzkh0XR+qyNp9osFv3rurFls0NMRrPnCaHeWc/zhNzu3/BerMRS
 nJFoqMVcVJwIANoEqBEMBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241007052122epcms2p8a7a733c92a8da751ac64af8a29de0303
References: <CGME20241007052122epcms2p8a7a733c92a8da751ac64af8a29de0303@epcms2p8>
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  There was a bug that did not subtract the super block area
 when calculating the usable segments for a single zoned device with a
 conventional
 zone. This bug resulted in incorrect the overprovision and [...] 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.24 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sxgBb-0002oV-Fm
Subject: [f2fs-dev] [PATCH] libf2fs: Fix calculation of usable segments for
 single zoned
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There was a bug that did not subtract the super block area when calculating
the usable segments for a single zoned device with a conventional zone.
This bug resulted in incorrect the overprovision and reserved area.

	<256MiB legacy block + zoned block w/ 32MiB zone size>
	Info: Overprovision ratio = 3.570%
	Info: Overprovision segments = 656 (GC reserved = 560)

	<8 conventional zone + 1016 sequential zone w/ 32MiB zone size>
	Info: Overprovision ratio = 3.700%
	Info: Overprovision segments = 676 (GC reserved = 578)

This patch fixes the bug by subtracting the super block area when there is
only one zoned device.

Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
---
 lib/libf2fs_zoned.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
index 89ba5ad73a76..cc5c064b7e3e 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -555,6 +555,11 @@ uint32_t f2fs_get_usable_segments(struct f2fs_super_block *sb)
 	}
 	usable_segs -= (get_sb(main_blkaddr) - get_sb(segment0_blkaddr)) >>
 						get_sb(log_blocks_per_seg);
+
+	/* single zoned device needs to remove a super block area */
+	if (c.ndevs == 1)
+		usable_segs -= (get_sb(segment0_blkaddr) >> get_sb(log_blocks_per_seg));
+
 	return usable_segs;
 #endif
 	return get_sb(segment_count_main);
-- 
2.43.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
