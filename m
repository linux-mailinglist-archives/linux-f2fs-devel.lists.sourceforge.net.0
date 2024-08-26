Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F78C95F7B0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Aug 2024 19:14:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sidIi-0007JB-Cd;
	Mon, 26 Aug 2024 17:14:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joshi.k@samsung.com>) id 1sidIh-0007Ix-4w
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Aug 2024 17:14:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5tUKFADzd7xUVDEaIuNQBV6ClteUtrL2aFLyNyXedxs=; b=Z07rhhvHuIjD5khNyvJjlHMTkc
 H0uNak63MdpGvHeGoBBPkMBZ1Z1eZXtiiCGph3Grz0X1wlMXgGGEhioohU8rb2L2aqkvAJmOLo7pK
 f0XHt9VMYZE5RYxoy93UbfpsZboOlssbX94COI+PKAB81Vedv3eSXH64p/i72K/Ug3yk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5tUKFADzd7xUVDEaIuNQBV6ClteUtrL2aFLyNyXedxs=; b=dvUaO97fZbm5C/YvKcqqnq0+xh
 rd7Fw/7EqRvYenAtimNgkPlPbHtbLsUG/f2PVo6D3zYhIwJnb97i0M5iW6HSWgVfwgu+jXJL8Odp9
 ykr0yo/5cnkA/+HtmufaEZZI/Y+zkWQo0j9BveslXAmqBeixyh1xTogRN9pltsztBL2Y=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sidIf-0005Ix-VF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Aug 2024 17:14:43 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20240826171430epoutp0445477166c5324ce4b63011b9528c45a4~vVqnu_wR-0982809828epoutp04j
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Aug 2024 17:14:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20240826171430epoutp0445477166c5324ce4b63011b9528c45a4~vVqnu_wR-0982809828epoutp04j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1724692470;
 bh=5tUKFADzd7xUVDEaIuNQBV6ClteUtrL2aFLyNyXedxs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aHNL1THiEHhEmCRokdU8knTuvgsSymAyuhlTlxo5pnMmOJ9QY5GJqy5xd8NjKrmgn
 KtBE6HF40PRjV5pMfG0rW5sqYneCfXRHF+F+KiZVSBS/OeqLDsiro0OHFglZuySsI9
 GkfJEaG6hifEQRg6/nW1tdlTMPRTmA3NT351UUDA=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20240826171429epcas5p3d316437e37abe737b9cf1feb46a0bb13~vVqm84GMM2945329453epcas5p33;
 Mon, 26 Aug 2024 17:14:29 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.175]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4Wsy2q4HHZz4x9Pq; Mon, 26 Aug
 2024 17:14:27 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 5D.A0.09640.3F7BCC66; Tue, 27 Aug 2024 02:14:27 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20240826171426epcas5p13c5ffabd6a05ee357bf4e9f78bc5de44~vVqkF41jA0279002790epcas5p1G;
 Mon, 26 Aug 2024 17:14:26 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240826171426epsmtrp1c1c4ac8931df3d1325ad85cb6dd79fd8~vVqkE3uYz0078300783epsmtrp1H;
 Mon, 26 Aug 2024 17:14:26 +0000 (GMT)
X-AuditID: b6c32a49-a57ff700000025a8-ad-66ccb7f3091c
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 F7.B2.07567.1F7BCC66; Tue, 27 Aug 2024 02:14:26 +0900 (KST)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240826171422epsmtip2e4bb622f4f1ead189d76183395aa4693~vVqgSFzYe0841308413epsmtip2O;
 Mon, 26 Aug 2024 17:14:21 +0000 (GMT)
From: Kanchan Joshi <joshi.k@samsung.com>
To: axboe@kernel.dk, kbusch@kernel.org, hch@lst.de, sagi@grimberg.me,
 martin.petersen@oracle.com, James.Bottomley@HansenPartnership.com,
 brauner@kernel.org, jack@suse.cz, jaegeuk@kernel.org, jlayton@kernel.org,
 chuck.lever@oracle.com, bvanassche@acm.org
Date: Mon, 26 Aug 2024 22:36:05 +0530
Message-Id: <20240826170606.255718-5-joshi.k@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826170606.255718-1-joshi.k@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta0xTZxjOudAe2LodLupHswh0mQY3oJ1t/SAyXEQ9C2ZilhjjlmADBwqU
 tullE3djY8N5qQiCSEHBG0pxMK6iXEQ6JAwoU1AEKbcBRjrGpZuOQehOOXXz3/O+3/O8z/e8
 3zkE5vU7h08kKnW0RilTCDgeeJ05cGOQ/UZXvLBw7A1YZs3kQJt5AYFn5hYx6LA+QeFAy00U
 lpa1obAgLx2FExVGDFZmEvC3ITsXLpaYuLDNMcOB2a0PEdg0+Da8f3EXbGzqwGFRySQXHu+v
 58Cr7SsorFsqwmC5bRaHPcZC7ra1VG9fFNUzXIlTZ7J/4VC93XqqynSUQ1Vf/ppqKLajVMNA
 GoeanxzEqZM1JoTqKv6ZS9mr1ke/eiB5q5yWxdEaf1oZq4pLVCaEC6I+itkeI5EKRUGiULhF
 4K+UpdDhgsjd0UE7ExVMXIH/pzKFnmlFy7RaQch7WzUqvY72l6u0unABrY5TqMXqYK0sRatX
 JgQraV2YSCh8V8IQDybLpyzTuHrM49Bg00U8DbERxxB3ApBiUNTZzTmGeBBeZAMCzJeGuWyx
 gIBeazvOFs+Yk4c27IVk1tTvYjUh4OlfI67CjoASYwYjIQgOGQh+Pa139n3IdBRU/vjPqglG
 NqAgx/jEzTnKmwwFf8zU4E6Mk2+Bmv7vVjGP6RvuduGsnR/Iv/+c68TuZBhwzM1yWY4n6Mif
 WOVgDCe9tgBzGgAy3R2cXhxbvQUgI8H0iQPsHG8w3V7DZTEfPM3McOFkMDo+6vL6AtRXn3Rj
 cQRIW37k5hyDMWEqboWwVq8Bw9IEyk7ngR8yvFh2ABjOnnQp14Gxs5ddmAKdK+MIux8Ds6wj
 ZdgpxM/4UgLjSwmM/7sVI5gJ8aXV2pQEWitRi5T0Z/+9bKwqpQpZ/ew3fVCPWEfnglsRlEBa
 EUBgAh/e+t6OeC9enCz1MK1RxWj0ClrbikiYFWdh/DWxKua/UepiROJQoVgqlYpDN0tFgnU8
 2/fn4rzIBJmOTqZpNa15oUMJd34amjSSd2d4W+FGt8eTfYaleWG5T22drz1+5lFeTMbevCT9
 qFzc+6B553azD8CmWi54Xj9yqtr3/RxDdH1m7Y67X147XkOfuN5TuKPnguTNv3M7XnkWdXCf
 b3jZSPFCpuPmg+CC/n2dbZZxy4xff/CN8wGWW38eWjYPVH8yVOmpqsAWefyvzGtvO0bO9YFJ
 TaS9cT/cOzRlMkZ5tzw2dlu/Lc5JSbqEvrPSnLF5/hvrh4db9JGvtzvm5+U/rckPqzM+v3ZH
 lxQYUKHJkkfk5KIbrjZb9qSWFrjtxhS2ztsLpR/T/LFG6t6W0nvlZdKzWZ+nei9f2T98dNEQ
 e74PCbF0ReTu6RPgWrlMtAnTaGX/Ajzz1zR/BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsWy7bCSvO6n7WfSDO6vZrZYfbefzeL14U+M
 FtM+/GS2+H/3OZPFzQM7mSxWrj7KZDF7ejOTxZP1s5gtNvZzWDy+85nd4ueyVewWR/+/ZbOY
 dOgao8XeW9oWlxa5W+zZe5LFYv6yp+wW3dd3sFksP/6PyWLb7/nMFutev2exOD9rDruDmMfl
 K94e5+9tZPGYNukUm8fls6Uem1Z1snlsXlLvsXvBZyaP3Tcb2Dw+Pr3F4tG3ZRWjx5kFR9g9
 Pm+SC+CJ4rJJSc3JLEst0rdL4Mp4du4VS8FDropbexexNDC+5uhi5OSQEDCReL/qOnsXIxeH
 kMBuRom5K/cxQiTEJZqv/WCHsIUlVv57DmYLCXxklFixqLyLkYODTUBT4sLkUpBeEYHJTBJN
 D7ewgDjMAkeZJNpaFjGDNAgLWEq8ewuS4ORgEVCV2HK9BczmBYr3HjvDArFAXmLmpe9gCzgF
 rCT+f3gPtcxSYuWZ5ewQ9YISJ2c+AatnBqpv3jqbeQKjwCwkqVlIUgsYmVYxSqYWFOem5yYb
 FhjmpZbrFSfmFpfmpesl5+duYgTHqZbGDsZ78//pHWJk4mA8xCjBwawkwit3+WSaEG9KYmVV
 alF+fFFpTmrxIUZpDhYlcV7DGbNThATSE0tSs1NTC1KLYLJMHJxSDUxXhDqYm44/uszXw3Hf
 +qTy0xe1j5pOXV6az1rkLeGfebx542ebtIodq/ZM4xdIKrK6WxFx5+G7or/Hw38W7hY0vGpU
 Z7fy5hJfz3k1nGKce85r3Vmdc+v5sgmLry/93ssmK6IQUte808BQS+aG3Yai5Z++xGfWPXx4
 OFhuilWBOP92410PHlQ0mZ0q6/ErbCp/euaKmPv3uIs9W/avPrnMkTHQZ6ao6QKZJqn4zhQ5
 E+Ufk7U5NazPCFrGrXTSDbPmOVwX5zmlzrTSijm2WE/2Ytehe06MbN+ehwmVz2dhs5r4OcKs
 RrmDW3l6+z9li+bt6RlfPk/e4Pfg/b5tckI7ni2PzYpJvPzjZ9GpT0osxRmJhlrMRcWJAMUC
 7xRCAwAA
X-CMS-MailID: 20240826171426epcas5p13c5ffabd6a05ee357bf4e9f78bc5de44
X-Msg-Generator: CA
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240826171426epcas5p13c5ffabd6a05ee357bf4e9f78bc5de44
References: <20240826170606.255718-1-joshi.k@samsung.com>
 <CGME20240826171426epcas5p13c5ffabd6a05ee357bf4e9f78bc5de44@epcas5p1.samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Nitesh Shetty <nj.shetty@samsung.com> The incoming hint
 value maybe either life hint or placement hint. Make SCSI interpret only
 temperature-based write life hints. Signed-off-by: Nitesh Shetty
 <nj.shetty@samsung.com>
 Signed-off-by: Kanchan Joshi <joshi.k@samsung.com> --- drivers/scsi/sd.c
 | 7 ++++--- 1 file changed, 4 insertions(+), 3 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.34 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [203.254.224.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sidIf-0005Ix-VF
Subject: [f2fs-dev] [PATCH v4 4/5] sd: limit to use write life hints
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
Cc: vishak.g@samsung.com, linux-scsi@vger.kernel.org, gost.dev@samsung.com,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 javier.gonz@samsung.com, Nitesh Shetty <nj.shetty@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Nitesh Shetty <nj.shetty@samsung.com>

The incoming hint value maybe either life hint or placement hint.
Make SCSI interpret only temperature-based write life hints.

Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
Signed-off-by: Kanchan Joshi <joshi.k@samsung.com>
---
 drivers/scsi/sd.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 699f4f9674d9..32b8a841c497 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -1191,8 +1191,8 @@ static u8 sd_group_number(struct scsi_cmnd *cmd)
 	if (!sdkp->rscs)
 		return 0;
 
-	return min3((u32)rq->write_hint, (u32)sdkp->permanent_stream_count,
-		    0x3fu);
+	return min3((u32)WRITE_LIFE_HINT(rq->write_hint),
+			(u32)sdkp->permanent_stream_count, 0x3fu);
 }
 
 static blk_status_t sd_setup_rw32_cmnd(struct scsi_cmnd *cmd, bool write,
@@ -1390,7 +1390,8 @@ static blk_status_t sd_setup_read_write_cmnd(struct scsi_cmnd *cmd)
 		ret = sd_setup_rw16_cmnd(cmd, write, lba, nr_blocks,
 					 protect | fua, dld);
 	} else if ((nr_blocks > 0xff) || (lba > 0x1fffff) ||
-		   sdp->use_10_for_rw || protect || rq->write_hint) {
+		   sdp->use_10_for_rw || protect ||
+		   WRITE_LIFE_HINT(rq->write_hint)) {
 		ret = sd_setup_rw10_cmnd(cmd, write, lba, nr_blocks,
 					 protect | fua);
 	} else {
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
