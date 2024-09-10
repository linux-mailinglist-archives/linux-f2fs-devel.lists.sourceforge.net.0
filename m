Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A16FE973B18
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Sep 2024 17:11:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1so2WS-0005z3-EJ;
	Tue, 10 Sep 2024 15:11:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joshi.k@samsung.com>) id 1so2WP-0005yq-S5
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Sep 2024 15:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kDAlnsSf6+fQcESYLjvnBr4Ul7FSOPIoyRTSELKQNY8=; b=cNU++aVXVr+RuluW2PLNNJAilt
 E1OXT01ZFV+2ANOEeNE3UR83/dw9eg8nHu3mNEV0L7J5Jn2SUVBAwR/2ofnqVTJAyXtgHG8+xCQ/r
 F3VV7powZ89DSP9d5J9AxHVuc/Q46tXP9y2JC/LQ1VyAeO4TCs11USYpUi59Li7rkohw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kDAlnsSf6+fQcESYLjvnBr4Ul7FSOPIoyRTSELKQNY8=; b=CH3JCkOamXkLf72ZoflRiwLxHc
 R6hFDFbzeuIYUIpt7DJQQNyuYayz8oRLu0kS4vsKFwxdjtwSipIkwOPjFA0m0VN8LeKM0G8DCqvCz
 vgIgz6YeNyizOsBX0ax+Zmg9hNaDj5NYoh5haHJHgINaZWlgiajzQW9ZpyN1pONSM5Lg=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1so2WO-0006JA-Ry for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Sep 2024 15:11:13 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20240910151101epoutp027eadc56177869b466cb39aae173716f6~z6qFvMGWg2369423694epoutp02r
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Sep 2024 15:11:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20240910151101epoutp027eadc56177869b466cb39aae173716f6~z6qFvMGWg2369423694epoutp02r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1725981061;
 bh=kDAlnsSf6+fQcESYLjvnBr4Ul7FSOPIoyRTSELKQNY8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lzD0bH/DyhG9JSoiUA6y0vgKdmCRz9nZ7S+vyxUxDhxf0AEPXiiOjZBBV3XB6EiJ6
 m47D9953n+81Y6d7IYrH6p4F4WAgSqNrr9lWRZZXVkfQk841U2B7fJjdJsYbLlh32T
 5vfYytHIa+EaUznHwjarBvZju7cHzUQickfmOe30=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20240910151100epcas5p2681730c3de752f6820679dcd4fe7927e~z6qFEM1LQ2551025510epcas5p2m;
 Tue, 10 Sep 2024 15:11:00 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.183]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4X36bP5DNNz4x9Px; Tue, 10 Sep
 2024 15:10:57 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
 0D.6F.19863.18160E66; Wed, 11 Sep 2024 00:10:57 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20240910151057epcas5p3369c6257a6f169b4caa6dd59548b538c~z6qBz-63r3222232222epcas5p3U;
 Tue, 10 Sep 2024 15:10:57 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240910151057epsmtrp2126a8f34a06203ecb93029dde710d3e6~z6qBzAS1z0448904489epsmtrp22;
 Tue, 10 Sep 2024 15:10:57 +0000 (GMT)
X-AuditID: b6c32a50-ef5fe70000004d97-53-66e061816a21
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 3B.DC.08964.08160E66; Wed, 11 Sep 2024 00:10:56 +0900 (KST)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240910151052epsmtip2a6272dcf0635487a8ae424134981622e~z6p98Iw6Q1662516625epsmtip2n;
 Tue, 10 Sep 2024 15:10:52 +0000 (GMT)
From: Kanchan Joshi <joshi.k@samsung.com>
To: axboe@kernel.dk, kbusch@kernel.org, hch@lst.de, sagi@grimberg.me,
 martin.petersen@oracle.com, James.Bottomley@HansenPartnership.com,
 brauner@kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz,
 jaegeuk@kernel.org, jlayton@kernel.org, chuck.lever@oracle.com,
 bvanassche@acm.org
Date: Tue, 10 Sep 2024 20:31:59 +0530
Message-Id: <20240910150200.6589-5-joshi.k@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240910150200.6589-1-joshi.k@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TbTBcVxh2790vZlZvkXGy2pA7bSe02K3ddZig0kzdSTpTM2mnKdPqjb2s
 WXZ39gPRThCDRNJoUKlFmEZlWEQQ9TlpVraKNBLaJFTYKKU0hEXH+Op+SJt/z/vO85z3ed5z
 DgdzWWXxOAlyDa2SU4kEy4nR2uPt45tJmeL4+u/fgPrH+Sw437OMwOJn6xjceTyDwpEf21FY
 ozeisPRSFgqnrukweD2fA/8YM7PhenUtGxp3nrJggeEBArtH34RD30XAru4+BqyonmbDcw/b
 WPBq7zYKWzcqMNgwv8iAg1u9TDioK2O/404O/3qUHBy/ziCLC/pZ5PAvWrKp9iyLbK5KJzsr
 zSjZOZLBIpemRxnkhZZahLxTeZtNmpv2kU1TT9FIbpTsoJSmJLTKi5bHKiQJ8vgQ4uixmHdj
 RGK+wFcQBAMJLzmVRIcQh9+P9H0vIdESnPBKphK1llYkpVYT/qEHVQqthvaSKtSaEIJWShKV
 QqWfmkpSa+XxfnJaEyzg898WWYify6QmvYmhXHJKvdUoyUA2OHmIIwfgQlBXOMfIQ5w4LngX
 ArLySln2YhkBmfdvYvZiDQGnr+QynkuM5w27rG4E3N0xI/bCjIC17SGLhMNh4d7gXqHW2nfD
 L6Pgp3tGGwnDO1FQpJthWo9yxYPAtnEZtWIG/joYu7zCtIq5eCDY6ne3T/MEJUP/sK3YEYdg
 5mqdjc7FXwZ9JVM2R5iFk3Wj1GYV4JccQb+uedfqYVA4cR6zY1cw19vCtmMeMC90s+xYBkyT
 pl3+l6Ct+QLTjsNAxuYjmx/MEuZah799ljP4amMKtbYBzgVnclzs7P1gvGB6V+kOnnxbxbRT
 SGDM3GtfzzkETA7Vsb9GPHUvJNC9kED3/7BKBKtFeLRSnRRPx4qUAl85nfLfxcYqkpoQ2/v3
 iWxD9I1bfgYE5SAGBHAwwo2bHzoe58KVUCfTaJUiRqVNpNUGRGRZ8UWMtydWYflAck2MQBjE
 F4rFYmFQgFhAuHPns8slLng8paFlNK2kVc91KMeRl4FGn/qiiKIWgsv0VxqQ1ZPRq4HSoR8c
 Ws88yK8cGfzNf+BZTtVLCU7hEfdrwoeFY/JPAzY16vVV/UciN+/97Q7TfR/0PnJc2XuWDLu4
 b+AbV+eOHvmpMNENGYGmeyzMOATseW3K47in1qOaTE438ApN4tq0ub+jZsu1jXeeaB0msyMW
 j2mWZCllqQFSWVpuTVfbgZXk8I/fuos5t2d/Nrod0aP4s54vnD/SshOZSnjlbGr5f5VPDOT6
 Bfff7pj1bFhMiVthOLdhN4sORZ2oN33oN8PO+cR7sT4zd2w2FGP2vBJ9a/HEccUBbWfJIUnY
 2unktN8rqhqOTLCz/X9udH31YXsxwVBLKYEPplJT/wIXmJIwiAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRmVeSWpSXmKPExsWy7bCSvG5D4oM0g41brC1W3+1ns3h9+BOj
 xbQPP5kt/t99zmRx88BOJouVq48yWcye3sxk8WT9LGaLjf0cFo/vfGa3+LlsFbvF0f9v2Swm
 HbrGaLH3lrbFpUXuFnv2nmSxmL/sKbtF9/UdbBbLj/9jstj2ez6zxbrX71kszv89zmpxftYc
 dgdxj8tXvD3O39vI4jFt0ik2j8tnSz02repk89i8pN5j94LPTB67bzaweXx8eovFo2/LKkaP
 MwuOsHt83iTnsenJW6YA3igum5TUnMyy1CJ9uwSujAerH7AUfOSqOLghpYHxN0cXIyeHhICJ
 xNGeQ2xdjFwcQgK7GSVa1i5gh0iISzRf+wFlC0us/PecHaLoI6PE26NTmLsYOTjYBDQlLkwu
 BakREVjHJLFimg9IDbPAUSaJtpZFzCAJYQFLiX9HPzGB2CwCqhJ35n1hBenlFTCX+HtKHGK+
 vMTMS9/BdnEKWEg8X74GrFwIqORD/wJWEJtXQFDi5MwnLCA2M1B989bZzBMYBWYhSc1CklrA
 yLSKUTK1oDg3PbfYsMAwL7Vcrzgxt7g0L10vOT93EyM4brU0dzBuX/VB7xAjEwfjIUYJDmYl
 Ed5+u3tpQrwpiZVVqUX58UWlOanFhxilOViUxHnFX/SmCAmkJ5akZqemFqQWwWSZODilGphS
 WebtPPDIx/VC/hKXm9J2S3aniYkq3Ps9TUjv+dJo8ZrLe/u/za3Iz2Fd/ugC51TN71qPlm3K
 7l2ZqByuEhz+vTn9mfEV84RTax1figVHa52+L2/N+Pf034kbZztFZf+PPrd+o9zZj3vecDX5
 WF/4fPhM516nKYYrXFPP7Z7K9erFhT1flyqbz+uT/R2n/2LXMnVgOs6yX/N/8syFB2+vfKOQ
 dff1uvVfhBdGLjdbnFUS8OqUiPFBTWcdhtKL65bNsJ+Qb7Dk7J1TYTyBNdw76hJ2zWhzjDc0
 0n/WZD1z+8EIjZmzDzmzVu19ErfbzZ+viqP1pkSuU87fg6nZX/4Ivlc1OmRSvXDZ0W2Ma9c8
 UGIpzkg01GIuKk4EAGXB181KAwAA
X-CMS-MailID: 20240910151057epcas5p3369c6257a6f169b4caa6dd59548b538c
X-Msg-Generator: CA
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240910151057epcas5p3369c6257a6f169b4caa6dd59548b538c
References: <20240910150200.6589-1-joshi.k@samsung.com>
 <CGME20240910151057epcas5p3369c6257a6f169b4caa6dd59548b538c@epcas5p3.samsung.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Nitesh Shetty <nj.shetty@samsung.com> The incoming hint
 value maybe either lifetime hint or placement hint. Make SCSI interpret only
 temperature-based write lifetime hints. Signed-off-by: Nitesh Shetty
 <nj.shetty@samsung.com>
 Signed-off-by: Kanchan Joshi <joshi.k@samsung.com> --- drivers/scsi/sd.c
 | 7 ++++--- 1 file changed, 4 insertions(+), 3 deletions(-) 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.25 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1so2WO-0006JA-Ry
Subject: [f2fs-dev] [PATCH v5 4/5] sd: limit to use write life hints
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

The incoming hint value maybe either lifetime hint or placement hint.
Make SCSI interpret only temperature-based write lifetime hints.

Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
Signed-off-by: Kanchan Joshi <joshi.k@samsung.com>
---
 drivers/scsi/sd.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index dad3991397cf..82bd4b07314e 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -1191,8 +1191,8 @@ static u8 sd_group_number(struct scsi_cmnd *cmd)
 	if (!sdkp->rscs)
 		return 0;
 
-	return min3((u32)rq->write_hint, (u32)sdkp->permanent_stream_count,
-		    0x3fu);
+	return min3((u32)WRITE_LIFETIME_HINT(rq->write_hint),
+			(u32)sdkp->permanent_stream_count, 0x3fu);
 }
 
 static blk_status_t sd_setup_rw32_cmnd(struct scsi_cmnd *cmd, bool write,
@@ -1390,7 +1390,8 @@ static blk_status_t sd_setup_read_write_cmnd(struct scsi_cmnd *cmd)
 		ret = sd_setup_rw16_cmnd(cmd, write, lba, nr_blocks,
 					 protect | fua, dld);
 	} else if ((nr_blocks > 0xff) || (lba > 0x1fffff) ||
-		   sdp->use_10_for_rw || protect || rq->write_hint) {
+		   sdp->use_10_for_rw || protect ||
+		   WRITE_LIFETIME_HINT(rq->write_hint)) {
 		ret = sd_setup_rw10_cmnd(cmd, write, lba, nr_blocks,
 					 protect | fua);
 	} else {
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
