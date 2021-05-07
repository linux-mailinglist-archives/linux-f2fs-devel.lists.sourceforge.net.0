Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DA337642E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 May 2021 13:01:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1leyEE-00073d-8j; Fri, 07 May 2021 11:01:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sw0312.kim@samsung.com>) id 1leyEB-00072x-FI
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 07 May 2021 11:01:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tRpPkArbZBpkXQslb2SD9zz4SzVnlk8bxz+PJZpLwdM=; b=bX4/oMWJ7EQ0kWPusJtFs1DXpU
 GvYuFZgarfju1cAX+6CE9d0HOJlK3TgwtxW8vP1PplcgkOBlJVCpiCX90bX05n4gTxkee6mrEKbeI
 Eu6B4TRBa0qK9vVncpV8ATpSuZCxq0Su+V1ZJgg2stY+GE6bKn62jRdniuL1PtDa3zu4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tRpPkArbZBpkXQslb2SD9zz4SzVnlk8bxz+PJZpLwdM=; b=YFSezMn/aKxwbmEx2koBG75EP0
 yUZFjaU7P8zPYlwvUt0pBb3r+JzKFH9YxKXoL9dni5Z33I86XpPErfc05EM3sWCpLBunDoyD7FVC0
 wgdP77FOQfO93gGnInRzZy0/yfmnwqmpzIlGTquo8Wb0GtN1383+boW/ZuvTvgeGK3Y8=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1leyE2-0000D8-U4
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 07 May 2021 11:01:03 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210507110041epoutp011c47b7bde8a9c66b5a70095c9a642e09~8w8rNbXxN2482224822epoutp01j
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  7 May 2021 11:00:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210507110041epoutp011c47b7bde8a9c66b5a70095c9a642e09~8w8rNbXxN2482224822epoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1620385241;
 bh=tRpPkArbZBpkXQslb2SD9zz4SzVnlk8bxz+PJZpLwdM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hnQmt6i9gg5I6U0MGmQ9fJV6eDFvUMEJH9rPSgOcLp2mbB/6j8U6lpDgUdyRHmRrA
 uBjcJWMamGavzFDZNaTWFeqTDHoAlW32YmZ+aTTN1Nj9KpgtyYPdJcWzgKDc5ojYWs
 h/SxGWVp6/EWWsEH9JDZWTbYj/IiF3VKqRntj0Js=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210507110041epcas1p2c0fad718b4a69d44f9f95f3c132d0fe0~8w8q2rgxw2478824788epcas1p24;
 Fri,  7 May 2021 11:00:41 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.158]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4Fc6tZ666Gz4x9Q2; Fri,  7 May
 2021 11:00:38 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 FA.48.09736.6DD15906; Fri,  7 May 2021 20:00:38 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210507110037epcas1p2da2c78057f68167196bf68cd35604bad~8w8nadNM82235622356epcas1p2D;
 Fri,  7 May 2021 11:00:37 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210507110037epsmtrp24b662a129fcaad3f390b30418208dfbb~8w8nZnkdD2429324293epsmtrp2g;
 Fri,  7 May 2021 11:00:37 +0000 (GMT)
X-AuditID: b6c32a39-8efff70000002608-a4-60951dd620d8
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 CC.8D.08163.5DD15906; Fri,  7 May 2021 20:00:37 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.223]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210507110037epsmtip1903587f5b7ff04da9bc31cbd1c2e0e14~8w8nKPjJV0653706537epsmtip1D;
 Fri,  7 May 2021 11:00:37 +0000 (GMT)
From: Seung-Woo Kim <sw0312.kim@samsung.com>
To: aegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Fri,  7 May 2021 20:03:42 +0900
Message-Id: <20210507110342.29566-2-sw0312.kim@samsung.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20210507110342.29566-1-sw0312.kim@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDKsWRmVeSWpSXmKPExsWy7bCmge412akJBj826Vhc+LmRyeL01LNM
 FpcWuVtc3jWHzWLG5JdsDqwem1Z1snnsXvCZyaNvyypGj8+b5AJYorJtMlITU1KLFFLzkvNT
 MvPSbZW8g+Od403NDAx1DS0tzJUU8hJzU22VXHwCdN0yc4DWKimUJeaUAoUCEouLlfTtbIry
 S0tSFTLyi0tslVILUnIKLAv0ihNzi0vz0vWS83OtDA0MjEyBChOyM/YfvMJYsIWtYva1XawN
 jGtZuxg5OSQETCTafx5l7mLk4hAS2MEocXr5NnaQhJDAJ0aJmXutIBKfGSU2n9rDDtOx5NdG
 FojELkaJ10++QbV/YZRo+fiHCaSKTUBHYv+S32A7RARsJZbvPwbUzcHBLOApsWBSBEhYWCBY
 YsPEGWBDWQRUJbZ3zGYDsXkFrCWu31sMtUxe4sKGW2BjOAVsJGbPWgZVIyhxcuYTFhCbGaim
 eetssBskBC6xS8x/cIwZotlF4tLMfVCDhCVeHd8CZUtJfH63lw2ioZlRYumSXywQTg+jxJxF
 t6EhYyyxf+lkJoirNSXW79KHCCtK7Pw9lxFiM5/Eu689rCAlEgK8Eh1tQhAlKhI7j05igwhL
 SczaEAwR9pD40PMeGlb9jBJ9j1awTWBUmIXkn1lI/pmFsHgBI/MqRrHUguLc9NRiwwJT5Bje
 xAhOhlqWOxinv/2gd4iRiYPxEKMEB7OSCO/pRZMThHhTEiurUovy44tKc1KLDzGaAkN7IrOU
 aHI+MB3nlcQbmhoZGxtbmBiamRoaKonzpjtXJwgJpCeWpGanphakFsH0MXFwSjUwSV64NZ3N
 Irtu3RxBUZbM6HYJdaGPrHvrf7zJWzvJL2TP7HT+ovrbO3M13i6MDqqwsT7Ha/PZj7v9XINR
 YJIw080ku036c39HzpR+1flgn2nm5xuljTuedl2Yd3tvcVK54roaHjuhg+xJXG2topJZl7pe
 Z/R9DN4qMW2zQFHEriYrZzbTm9OtEtM//crdKpURF2C1ci2z5r76ZJ0vc9gfdkxjnvD+c2LW
 mf+RIQy/77pIH3ZNPP/9vsT+vrK1LJIXM1yvNG2sv8etrqq7fPrhRanJXxOaLy63qIt64H5J
 9E3ZM2aG/JUtnrO3TVn9ns0st0Tfd/Imrim793FZmL7Zb1xq80LlpONnVcEPoqpKLMUZiYZa
 zEXFiQDV8EU/DwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGLMWRmVeSWpSXmKPExsWy7bCSnO5V2akJBmcuK1lc+LmRyeL01LNM
 FpcWuVtc3jWHzWLG5JdsDqwem1Z1snnsXvCZyaNvyypGj8+b5AJYorhsUlJzMstSi/TtErgy
 9h+8wliwha1i9rVdrA2Ma1m7GDk5JARMJJb82sjSxcjFISSwg1Hi/sN5zBAJKYm537YzdjFy
 ANnCEocPF0PUfGKUOP/vABNIDZuAjsT+Jb/BBokI2Et83fyXEcRmFvCVmPZ0JRuILSwQKHHm
 4GGwehYBVYntHbPB4rwC1hLX7y1mh9glL3Fhwy2wOZwCNhKzZy0DqxECqjna280OUS8ocXLm
 ExaI+fISzVtnM09gFJiFJDULSWoBI9MqRsnUguLc9NxiwwKjvNRyveLE3OLSvHS95PzcTYzg
 oNXS2sG4Z9UHvUOMTByMhxglOJiVRHhPL5qcIMSbklhZlVqUH19UmpNafIhRmoNFSZz3QtfJ
 eCGB9MSS1OzU1ILUIpgsEwenVAOTXt3+uGTzlI4PayKfPej+9LzivGEE+6VGjq41PTWZxof2
 WssH7vyy/7jv3q/S19YXZId6tpULyQQsm/HA55aO85e4HT6lLE9ev3GPeBvWzcVjmjz9mqT0
 hV3q0mnmSvMl++LLExSmpW61envLuV5mRcldlz/z9CVnbDv5mkFFjuf9DXERYX+Tcx9OcV2/
 qdCu4J56kndvzCpO61f9J8z8L+Vta0yqbzPs+BmyIWytYEeg4Ku9nqduLrjLErXFeN3XHMdP
 D3TD76Zbm5r8+ug+O1jjza1dtq1v8t8++ZHs9Fxvw4pr279e5tVlX7Yw2kP7Y31f/TdRHdno
 zeKc2v/mP/8szJtfYRzvYP7Y54QSS3FGoqEWc1FxIgCYZSjByQIAAA==
X-CMS-MailID: 20210507110037epcas1p2da2c78057f68167196bf68cd35604bad
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210507110037epcas1p2da2c78057f68167196bf68cd35604bad
References: <20210507110342.29566-1-sw0312.kim@samsung.com>
 <CGME20210507110037epcas1p2da2c78057f68167196bf68cd35604bad@epcas1p2.samsung.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1leyE2-0000D8-U4
Subject: [f2fs-dev] [PATCH 2/2] mkfs.f2fs: fix memory leak in not enough
 segments error path
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
Cc: sw0312.kim@samsung.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In not enough segements error path of f2fs_write_check_point_pack(),
cp_payload is not freed. Fix the error path.

Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
---
 mkfs/f2fs_format.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 3f1fa32a407a..fbecb05b3302 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -723,7 +723,7 @@ static int f2fs_write_check_point_pack(void)
 
 	if (f2fs_get_usable_segments(sb) <= get_cp(overprov_segment_count)) {
 		MSG(0, "\tError: Not enough segments to create F2FS Volume\n");
-		goto free_nat_bits;
+		goto free_cp_payload;
 	}
 	MSG(0, "Info: Overprovision ratio = %.3lf%%\n", c.overprovision);
 	MSG(0, "Info: Overprovision segments = %u (GC reserved = %u)\n",
-- 
2.19.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
