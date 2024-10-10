Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E33997C17
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Oct 2024 07:00:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sylHF-0005QJ-Pd;
	Thu, 10 Oct 2024 04:59:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1sylHD-0005QD-7R
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Oct 2024 04:59:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:To:From:Sender:Reply-To:Subject:Mime-Version:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kDPmTXhPX6cxQzuvSTnQ8wrHQwVwp7TSgQJ6vfD5NDg=; b=VDAd33uMWMookaYmHPR8Mg6Dmc
 cyHhFV1A5tcUKh7+MFNNy0nVJ4gbiZKM7ZumNUhcRoGE0lkhjaHx4EVJmjhM2fIGkYV30p/RhuxP2
 5LD37f6YgtzhMzqy6/C1yUekJrOc2KQ2/0Qt/6j4bLuhNIEuPMBFKfZLUkLJBYONKgIw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:To:From:Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kDPmTXhPX6cxQzuvSTnQ8wrHQwVwp7TSgQJ6vfD5NDg=; b=MYPKTI/dNHlJQ+fJbW2Rdd/AMN
 bae9/unU5olPzehQHSAE/4LOUznnTg2gkGO77ebZ9r0uYY5d0PlL7FY1fIImkuipP3dM6oimMeYvU
 iLfBgu14VzxQLaESNfkEd5a/0A6+ubI7J+KLwUtCyp/mOzhAFBQc5GDX7VtxBN5+gnZE=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sylHB-0007Tc-6w for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Oct 2024 04:59:50 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20241010045936epoutp02d1f203aea4a5afc396187ad85dd82839~8-q06s5IF0894008940epoutp02B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Oct 2024 04:59:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20241010045936epoutp02d1f203aea4a5afc396187ad85dd82839~8-q06s5IF0894008940epoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1728536377;
 bh=kDPmTXhPX6cxQzuvSTnQ8wrHQwVwp7TSgQJ6vfD5NDg=;
 h=Subject:Reply-To:From:To:In-Reply-To:Date:References:From;
 b=f5ULp6EpU2pFt/uhR450E/XBce8kPbtb8U+DPMSMKtB4Sk5crkFXWu33dB2YK1ArE
 OoeAZ2LUFf7WCqIL5wj8QjIunbP3Pkzb0kcxGzcbPq7FGST+ot0Pa68M2XmWS3+XS5
 1Fg+EAolZUCf8OQszRsGxF1Denco2p3cjMWQIFzE=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20241010045936epcas2p2c75963a640c770267156f4a7902f055f~8-q0k7RzD1895418954epcas2p2w;
 Thu, 10 Oct 2024 04:59:36 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.101]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4XPHc7604Vz4x9Q4; Thu, 10 Oct
 2024 04:59:35 +0000 (GMT)
X-AuditID: b6c32a48-7f9ff70000002653-fb-67075f37b5f1
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 D3.51.09811.73F57076; Thu, 10 Oct 2024 13:59:35 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: Yonggil Song <yonggil.song@samsung.com>, Chao Yu <chao@kernel.org>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Dongjin Kim <dongjin_.kim@samsung.com>,
 Siwoo Jung <siu.jung@samsung.com>, Daejun Park <daejun7.park@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20241010043123epcms2p2ad514eb5e4a94413d8b26aea56f772a8@epcms2p2>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20241010045935epcms2p7ab5f54e9789b36ea496abcb100a7878f@epcms2p7>
Date: Thu, 10 Oct 2024 13:59:35 +0900
X-CMS-MailID: 20241010045935epcms2p7ab5f54e9789b36ea496abcb100a7878f
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpik+LIzCtJLcpLzFFi42LZdljTVNc8nj3doOeBvsXpqWeZLFY9CLf4
 cdLE4sn6WcwWlxa5W1zeNYfN4vzE10wWU88fYXLg8Ni0qpPNY/eCz0wefVtWMXp83iQXwBKV
 bZORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6DrlpkDdIOSQlli
 TilQKCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8C8QK84Mbe4NC9dLy+1xMrQwMDIFKgwITtj
 ws0vbAW93BUbrzaxNzBO4uxi5OCQEDCRaHpe2cXIxSEksINRovn2BnaQOK+AoMTfHcJdjJwc
 wgJeEtsW3GUDsYUElCSuHehlgYjrS2xevIwdxGYT0JX4u2E5O8gcEYEGZondTzcxgSQkBHgl
 ZrQ/ZYGwpSW2L9/KCGJzCvhJXFv0kg0iriHxY1kvM4QtKnFz9Vt2GPv9sfmMELaIROu9s1A1
 ghIPfu6GiktKLDp0HmpXvsTfFdehZtZIbG1og4rrS1zr2Ah2A6+Ar8TtHd/B5rMIqEqsmTUH
 ao6LxI9HM8DqmQXkJba/ncMMCgdmAU2J9bv0IUGlLHHkFgtEBZ9Ex+G/7DAf7pj3BGqTmsTm
 TZtZIWwZiQuP2xghWj0kzn4OgoTyRSaJNY1v2CYwKsxCBPQsJHtnIexdwMi8ilEstaA4Nz21
 2KjABB61yfm5mxjBiVHLYwfj7Lcf9A4xMnEwHmKU4GBWEuHVXciaLsSbklhZlVqUH19UmpNa
 fIjRFOjjicxSosn5wNScVxJvaGJpYGJmZmhuZGpgriTOe691boqQQHpiSWp2ampBahFMHxMH
 p1QDk47Yowe/lYs6NeYud2VYOlP2clHuqvfedkI6L5Ycnts6WW++x8+su49XcJcUNXVmr5z7
 JOTJs7Mx56xL8yaqXpIzbfDdmryX5e33NI5CHaEd8R/+2s178jG+qPOr0oM25i6On0em+sQr
 hCbFn3vQ1BL9x8HTaY6f33zz3XcFWxmX3tnzyEc/RPkr/xSBScFL907Y6t5w/qpX0gSe+y9v
 GUXNbVer72a66GxY2rpZ54nkLj8/uQf3uXf5PD6vu323nucSdVFRxU1HFWr1Js1a7LhuqZFW
 98SnX3LOMC5/EfT+w/TXee+6edcxpub7hCds1/7o7tB4eVGpDm/tg+srAsPd4s7dX9ntqbil
 zeLnPyWW4oxEQy3mouJEAICP38MVBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241007052122epcms2p8a7a733c92a8da751ac64af8a29de0303
References: <20241010043123epcms2p2ad514eb5e4a94413d8b26aea56f772a8@epcms2p2>
 <20241010021506epcms2p21d877e3c72389b41805db31f391d2b42@epcms2p2>
 <e26d7399-a0a7-4646-8e93-267cb20018cf@kernel.org>
 <20241007052122epcms2p8a7a733c92a8da751ac64af8a29de0303@epcms2p8>
 <CGME20241007052122epcms2p8a7a733c92a8da751ac64af8a29de0303@epcms2p7>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  There was a problem that did not subtract the super block
 area when calculating the usable segments for a single zoned device with a
 conventional zone. This resulted in incorrect the overprovision and [...]
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.25 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [203.254.224.25 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sylHB-0007Tc-6w
Subject: [f2fs-dev] [PATCH v2] libf2fs: Fix calculation of usable segments
 for single
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

There was a problem that did not subtract the super block area when calculating
the usable segments for a single zoned device with a conventional zone.
This resulted in incorrect the overprovision and reserved area.

	<256MiB legacy block + zoned block w/ 32MiB zone size>
	Info: Overprovision ratio = 3.570%
	Info: Overprovision segments = 656 (GC reserved = 560)

	<8 conventional zone + 1016 sequential zone w/ 32MiB zone size>
	Info: Overprovision ratio = 3.700%
	Info: Overprovision segments = 676 (GC reserved = 578)

This patch addresses the problem by subtracting the super block area when
there is only one zoned device.

Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
---
 lib/libf2fs_zoned.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
index 89ba5ad73a76..1a0985378789 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -555,6 +555,11 @@ uint32_t f2fs_get_usable_segments(struct f2fs_super_block *sb)
 	}
 	usable_segs -= (get_sb(main_blkaddr) - get_sb(segment0_blkaddr)) >>
 						get_sb(log_blocks_per_seg);
+
+	/* single zoned device needs to remove a super block area */
+	if (c.ndevs == 1 && c.devices[0].zoned_model == F2FS_ZONED_HM)
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
