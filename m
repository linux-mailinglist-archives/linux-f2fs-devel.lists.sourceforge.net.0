Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C266B731A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Mar 2023 10:48:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pbenP-0004yO-S4;
	Mon, 13 Mar 2023 09:48:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1pbenO-0004yI-8y
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Mar 2023 09:48:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:To:From:Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IJ4uA0edrYRShANGVQu8z7uWX3r+wVwyvh58KR1qTbQ=; b=SMxo2XyDHOR/SbIIn9iVl6o6+i
 ao70Ki1gCpf7+F5QW3HsalVRiXUsf4MB0uLGYtiI9Cq6aUO+TWx07hPQxJ498jkPidFURdt/RoREX
 sjT3Cfae/kbG8N+DrktzOByI9kdSg+65QajNyXNhvjFL9oJpibjoWyNgiBNIEM4MVqus=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:To:From
 :Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IJ4uA0edrYRShANGVQu8z7uWX3r+wVwyvh58KR1qTbQ=; b=b
 k/WiBcsJNCw4UMqf4ml9oNTDwV4zhRU+k+3U7KiSwWxGzN+sRsSoqbAsMh+1BDKdjQjTj+MWfa0Tw
 wNhu1mJsgA2pPW4TXd/ShQ6fw+jswdY1c5LOFHEdJGw/7sJyp7dv003r8yyemQneExkuZdxtQBzNH
 gXAh6/BeFrI6aeqo=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pbenJ-006Nh4-Hv for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Mar 2023 09:48:46 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20230313094827epoutp0334e8fb27dcb432ba4984f62449a21a62~L8ZTEdHU91418814188epoutp03a
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Mar 2023 09:48:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20230313094827epoutp0334e8fb27dcb432ba4984f62449a21a62~L8ZTEdHU91418814188epoutp03a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1678700907;
 bh=IJ4uA0edrYRShANGVQu8z7uWX3r+wVwyvh58KR1qTbQ=;
 h=Subject:Reply-To:From:To:Date:References:From;
 b=sYYr1nJRi+tcZ81xDTCXAFeacWPR37kp1tpOrxvgNsrotHj56LRlaEBK2ufB9TAPE
 6r/m3v4XEnzH147NXCa0V+HZUU5+E9kLHtIsdR1SqKcXDskaeBwUEXQAx7FYZGPqWW
 U6sBMIJQItvsaSfrMLR49vbST0UL24u8aON2rKJU=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20230313094826epcas2p2e769dc1e9a07591bfb1d75bfc878dae8~L8ZR5SBGz2865928659epcas2p2H;
 Mon, 13 Mar 2023 09:48:26 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.88]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4PZsKj3VvLz4x9Pw; Mon, 13 Mar
 2023 09:48:25 +0000 (GMT)
X-AuditID: b6c32a45-e942ca800001f1e7-65-640ef1694088
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 E0.98.61927.961FE046; Mon, 13 Mar 2023 18:48:25 +0900 (KST)
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
Message-ID: <20230313094825epcms2p71e6cb549251dc55e8d202dd64b9913a6@epcms2p7>
Date: Mon, 13 Mar 2023 18:48:25 +0900
X-CMS-MailID: 20230313094825epcms2p71e6cb549251dc55e8d202dd64b9913a6
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJKsWRmVeSWpSXmKPExsWy7bCmmW7mR74Ug6ZpYhanp55lsniyfhaz
 xaVF7haXd81hs5h6/giTA6vHplWdbB67F3xm8ujbsorR4/MmuQCWqGybjNTElNQihdS85PyU
 zLx0WyXv4HjneFMzA0NdQ0sLcyWFvMTcVFslF58AXbfMHKC1SgpliTmlQKGAxOJiJX07m6L8
 0pJUhYz84hJbpdSClJwC8wK94sTc4tK8dL281BIrQwMDI1OgwoTsjB133jAVnOasWH1pC1sD
 4xP2LkZODgkBE4kn99YzdzFycQgJ7GCUODp/NpDDwcErICjxd4cwSI2wQJjExkefmEFsIQEl
 iWsHelkg4voSmxcvA5vDJqAr8XfDcjBbROAVo8SZ1aIQ83klZrQ/ZYGwpSW2L9/KCGFrSPxY
 1ssMYYtK3Fz9lh3Gfn9sPlSNiETrvbNQNYISD37uhopLSiw6dJ4Jws6X+LviOhuEXSOxtaEN
 Kq4vca1jI9heXgFfiS/t58F6WQRUJa5P/gpV7yLRfmEu2HxmAXmJ7W/ngL3OLKApsX6XPogp
 IaAsceQWC0QFn0TH4b/sMF/tmPcEapOaxOZNm1khbBmJC4/boK70kHi7vIUJEmqBEmvvvWGZ
 wCg/CxG2s5DsnYWwdwEj8ypGsdSC4tz01GKjAkN4dCbn525iBKc5LdcdjJPfftA7xMjEwXiI
 UYKDWUmEdws/T4oQb0piZVVqUX58UWlOavEhRlOgjycyS4km5wMTbV5JvKGJpYGJmZmhuZGp
 gbmSOK+07clkIYH0xJLU7NTUgtQimD4mDk6pBib+f5c4nUtXThH32bukQGLW4zyOtetexgXe
 1fhYb87s8fy1ctetBV3r2w7lnZy6r/Wz2MlTT1buX1LtOm2eVZ/bosojbXWPHyU8mblBYO7B
 wOsLHt+Zycig87b/TWj1gagjV+zWc66Y6XX2j+qLi7IPp229ffMP3+qTl4x/Xnh/I2dRcB/X
 8dDMN7MkVIyP98lPXsxxfI3gX6OzDmcOKHTr7dk49ZNzUt2/0C2GOU9ie1fIX5hb9POnsJJF
 k9zyJ1dXM8xkjI64+dtVoW5TncvuSfNuz/2xMpuX29VGbuL/n58sTfsKeHNe/p64vzOZ17qi
 jGtJ0PP1CmX2GVp25YLtSy6ucdmrk5byxe+F7cbSo0osxRmJhlrMRcWJAI4dXln8AwAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230313094825epcms2p71e6cb549251dc55e8d202dd64b9913a6
References: <CGME20230313094825epcms2p71e6cb549251dc55e8d202dd64b9913a6@epcms2p7>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When using f2fs on a zoned block device with 2MiB zone size, 
 IO errors occurs because f2fs tries to write data to a zone that has not
 been reset. The cause is that f2fs tries to discard multiple zones at once.
 This is caused by a condition in f2fs_clear_prefree_segments that does not
 check for zoned block devices when setting the discard range. [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.33 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
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
X-Headers-End: 1pbenJ-006Nh4-Hv
Subject: [f2fs-dev] [PATCH v1] f2fs: Fix discard bug on zoned block devices
 with 2MiB zone size
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

When using f2fs on a zoned block device with 2MiB zone size, IO errors
occurs because f2fs tries to write data to a zone that has not been reset.

The cause is that f2fs tries to discard multiple zones at once. This is
caused by a condition in f2fs_clear_prefree_segments that does not check
for zoned block devices when setting the discard range. This leads to
invalid reset commands and write pointer mismatches.

This patch fixes the zoned block device with 2MiB zone size to reset one
zone at a time.

Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
---
 fs/f2fs/segment.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index acf3d3fa4363..2b6cb6df623b 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1953,7 +1953,8 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 					(end - 1) <= cpc->trim_end)
 				continue;
 
-		if (!f2fs_lfs_mode(sbi) || !__is_large_section(sbi)) {
+		if (!f2fs_sb_has_blkzoned(sbi) &&
+		    (!f2fs_lfs_mode(sbi) || !__is_large_section(sbi))) {
 			f2fs_issue_discard(sbi, START_BLOCK(sbi, start),
 				(end - start) << sbi->log_blocks_per_seg);
 			continue;
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
