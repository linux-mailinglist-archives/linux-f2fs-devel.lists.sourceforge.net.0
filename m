Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A92FD511C23
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Apr 2022 18:03:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njk8P-0006KX-80; Wed, 27 Apr 2022 16:03:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.raghav@samsung.com>) id 1njk8I-0006Ji-0F
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 16:03:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K2H4xPkIz91YDFdyCv2zwfrxVTdulhy1N1SKCVAIbPs=; b=YX3syBio7vOraVl3GJAolfPNRv
 50B0i852HylYC50TZj2VohakZNOggi8uVD7LPvKytaY2Gu5h+rWR4kHtYMDrd62s6W97oQIUx+Vbi
 Sn1vOgHzTgfYIGdKoCHdhZ3vdYrAO34F85xG++tvFV74fpQ+0iLpJZWz5ksO6gbED+V8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K2H4xPkIz91YDFdyCv2zwfrxVTdulhy1N1SKCVAIbPs=; b=YXFFMg5gFw3NdTY6SnqpPQOYms
 Q5Dh2OSHIc37+Gh7O8JoGsQnNN+AZ5eZz+Gi31X6fyRbCstD/PDHPdT9qkrQlDJ+Z05lNXpcIf17Z
 9x+a7Jx4thpuETfae22hQIIRR+H+sG5L9MZ9m0FgHB7CS6FaxKvGPYZ3/AL50vQvnfSE=;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njk8E-00Bt4Z-DR
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 16:03:14 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220427160304euoutp018d9a3cef9a37842b1a6925b0430996b0~pzFBj1Ubx0317803178euoutp01e
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 16:03:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220427160304euoutp018d9a3cef9a37842b1a6925b0430996b0~pzFBj1Ubx0317803178euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1651075384;
 bh=K2H4xPkIz91YDFdyCv2zwfrxVTdulhy1N1SKCVAIbPs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Sp9VM4Td3vG0k/ykXWvXxR97Y5i8f0rspVz80mZPqaOhHumhgp4oLd1W8BLafa8E2
 3RbXSp50mXqyaR3MMrmEGSO7olnmxv+LbJjrs7YBgPFTVwViPj6MLFBnkolTteuyzm
 0rqWeHE7dXk8asdvUZUddbVpo2lcA9uM/SY+7G6c=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220427160302eucas1p21c415084c0ee2461ca1f2112d95ba2cb~pzFAAgkwA2336123361eucas1p2m;
 Wed, 27 Apr 2022 16:03:02 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 27.0A.10260.63969626; Wed, 27
 Apr 2022 17:03:02 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220427160301eucas1p147d0dced70946e20dd2dd046b94b8224~pzE-LcsQc0330603306eucas1p1R;
 Wed, 27 Apr 2022 16:03:01 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220427160301eusmtrp22fb9b18976fb07e36270ff54bf0dfad9~pzE-HzO9m2598325983eusmtrp2i;
 Wed, 27 Apr 2022 16:03:01 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-87-62696936abd5
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id D1.81.09522.53969626; Wed, 27
 Apr 2022 17:03:01 +0100 (BST)
Received: from localhost (unknown [106.210.248.162]) by eusmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20220427160301eusmtip23507d9cdffdd2cc397776ec30d69ca54~pzE_2Psd42569125691eusmtip2H;
 Wed, 27 Apr 2022 16:03:01 +0000 (GMT)
From: Pankaj Raghav <p.raghav@samsung.com>
To: jaegeuk@kernel.org, axboe@kernel.dk, snitzer@kernel.org, hch@lst.de,
 mcgrof@kernel.org, naohiro.aota@wdc.com, sagi@grimberg.me,
 damien.lemoal@opensource.wdc.com, dsterba@suse.com,
 johannes.thumshirn@wdc.com
Date: Wed, 27 Apr 2022 18:02:44 +0200
Message-Id: <20220427160255.300418-6-p.raghav@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427160255.300418-1-p.raghav@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTVxjGd+69vS11xWvBcCKbG+DG0AgjM/MElM2FjJssUWKmQ7PICl6h
 WaGshYEQGUhh2AmULoBUFosKdshWbMGs0C6ujs9SISACOkQ+GrHGIgJRwiijXsz87znv+T3P
 c97k8HBhI7mFJ05NZ2SpIkkgySeudyzd2vmxWJzwYUu1D9L3dODo6lgZiSqfLuHIVmHHkLrs
 HBct2/twZHGd56D+F/kYGr1hwtCvV9sxNK3X4OjsjacEWlHeX5spJnD070Q4UlvvAOQY0mDI
 cncHGpjScdHAxRhktnQTaLC1hkQX6h1cpCpaxNGIygFQeaeRg+brFFz0++NZAnXd9f/0bXrw
 9he0u6uRpMsLXFy67/41gh60Z9CGhjMkXZtXgdPGyz/Qbdp5jG4bzSPpkgIXSZsKxzn07J9D
 JF3a3ABoffMQQauM1zixwqP8PccZifh7RhYW9Q0/WdE+Q6ZNbcyauVlF5IFKgRJ48SC1Cyom
 L3OUgM8TUjoAF/VWgj0sAOi6bcc9lJCaB/Ce7oNXjovLeoKdXwHQYAllDY8ALO2tJZWAxyOp
 7TD/DNcz96VGACxvasI8B5xy4rC/eRjzuH2or+CjKe3LJIJ6D+rbn5EeLaAioNltJNi2d2D1
 wHOuJ9SLioSqZ3Essgl2V0+/RPA1pKDlPO7Jh1QdH9bfqcU9PKSioW36MBvjA52dzVxWvwVX
 TRcwVudAx8jyulcBYJlJT7LeyLVlJB6JUyFQ3xrG4vtg+y9PCJbwhiNPNrEv8Ibq61XrpQJY
 XCRk6UBoWppeL4Vw8HTNupOGNneICgRoXltF89oqmv9rtQBvAH5MhjwliZF/lMpkhspFKfKM
 1KTQRGmKAax9aJu7c/EPoHPOhVoBxgNWAHl4oK9goS05QSg4LjqZzcik8bIMCSO3An8eEegn
 SBQ3iYRUkiid+ZZh0hjZq1uM57UlD1P7Zfee0rdv7iqdeRePPZKd+2X8uYCYltiI+Lgg8Qnn
 zvePbTT/1FD0l8GWOVGs6tElfJ772+oLlbz70uoDaYAjPdRU0ev45KFZusEV9I/85705ZNbX
 mfzGylHDHNpq+Cy+JKTOnV04GXTlZK569jsf35LoaPvNN7bRwZK6LOGwq2K82zhelC39O3js
 SOEGbY639dLuW/POowvFHclRe4INO/r99+/KHzo1vNTx0G3uC+NkHjhI7TshniheOa2rCq8O
 j7oXabFWOR8f7Dk8Q8D9NX7lWmWEceDBXmV9IseqftN+tjVt5VD+geBGv9rdm21We4wibmyr
 +ZgzZM45/+Pk80BCniwK347L5KL/ANv7M6o/BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPKsWRmVeSWpSXmKPExsVy+t/xe7qmmZlJBs/XilmsP3WM2WL13X42
 i2kffjJbnJ56lsliUv8MdovfZ88zW+x9N5vV4sKPRiaLmwd2MlmsXH2UyeLJ+lnMFj0HPrBY
 /O26BxRrechs8eehocWkQ9cYLZ5encVksfeWtsWlxyvYLS4tcrfYs/cki8XlXXPYLOYve8pu
 MaHtK7PFjQlPGS0mHt/MavF5aQu7xbrX71ksTtySdpD1uHzF2+PfiTVsHhOb37F7nL+3kcXj
 8tlSj02rOtk8FjZMZfbYvKTeY/eCz0weu282sHn0Nr9j89jZep/V4/2+q2wefVtWMXqs33KV
 xWPC5o2sAUJRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF
 +nYJehktR1+wFTzmr3hxeDpLA+M03i5GTg4JAROJRb/Xs3QxcnEICSxllLg/cT8LREJC4vbC
 JkYIW1jiz7UuNoii54wSG6evZ+pi5OBgE9CSaOxkB4mLCDwBav75GGwSs0ADi8StibuYQLqF
 BUIlln9qYwexWQRUJdYf/cQGYvMKWEns+bcZapu8xMxL39lBhnIKWEtM+BQBEhYCKuledIsV
 olxQ4uTMJ2DlzEDlzVtnM09gFJiFJDULSWoBI9MqRpHU0uLc9NxiQ73ixNzi0rx0veT83E2M
 wJSy7djPzTsY5736qHeIkYmD8RCjBAezkgjvl90ZSUK8KYmVValF+fFFpTmpxYcYTYHOnsgs
 JZqcD0xqeSXxhmYGpoYmZpYGppZmxkrivJ4FHYlCAumJJanZqakFqUUwfUwcnFINTBt0uMpi
 LR7M/tjxO8sx2OtUwnq+RenK1fraUaZHbYKOSVomTnnVofXeZJHr4i2HThfGvpKdYN6c2ZDZ
 dE5gao+D/OSvXf3CMwq3vEhj1XvTPinwAlds/+3OWt0nLNG31dYU7eq8x7CcrUGScadnzBlr
 P4l779anlkaf/jo57oDM1MhPgtwsv/zOB8o2iB89t/2eVOdcZpHY3oK2+r8C1+8JJO7TNPA9
 s12XeUecU3u/lI/OhpA13bqcv04WuEl7+Yh+m12o52AbJbH8UDTjCvmXvGe1W/75MIYumtYg
 ee7VpIW9T2+1/bZ8efTdEQGV9d33Qlep3re7dYXPJMq9Mf62H/s1NZ+TFunCbAlKLMUZiYZa
 zEXFiQBD5j4jsgMAAA==
X-CMS-MailID: 20220427160301eucas1p147d0dced70946e20dd2dd046b94b8224
X-Msg-Generator: CA
X-RootMTR: 20220427160301eucas1p147d0dced70946e20dd2dd046b94b8224
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220427160301eucas1p147d0dced70946e20dd2dd046b94b8224
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160301eucas1p147d0dced70946e20dd2dd046b94b8224@eucas1p1.samsung.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Remove the condition which disallows non-power_of_2 zone size
 ZNS drive to be updated and use generic method to calculate number of zones
 instead of relying on log and shift based calculation on zone [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [210.118.77.11 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [210.118.77.11 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1njk8E-00Bt4Z-DR
Subject: [f2fs-dev] [PATCH 05/16] nvme: zns: Allow ZNS drives that have
 non-power_of_2 zone size
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
Cc: jiangbo.365@bytedance.com, Pankaj Raghav <p.raghav@samsung.com>,
 kch@nvidia.com, bvanassche@acm.org, matias.bjorling@wdc.com,
 gost.dev@samsung.com, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, clm@fb.com, dm-devel@redhat.com, agk@redhat.com,
 jonathan.derrick@linux.dev, kbusch@kernel.org, linux-fsdevel@vger.kernel.org,
 josef@toxicpanda.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Remove the condition which disallows non-power_of_2 zone size ZNS drive
to be updated and use generic method to calculate number of zones
instead of relying on log and shift based calculation on zone size.

The power_of_2 calculation has been replaced directly with generic
calculation without special handling. Both modified functions are not
used in hot paths, they are only used during initialization &
revalidation of the ZNS device.

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
---
 drivers/nvme/host/zns.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/nvme/host/zns.c b/drivers/nvme/host/zns.c
index 9f81beb4df4e..2087de0768ee 100644
--- a/drivers/nvme/host/zns.c
+++ b/drivers/nvme/host/zns.c
@@ -101,13 +101,6 @@ int nvme_update_zone_info(struct nvme_ns *ns, unsigned lbaf)
 	}
 
 	ns->zsze = nvme_lba_to_sect(ns, le64_to_cpu(id->lbafe[lbaf].zsze));
-	if (!is_power_of_2(ns->zsze)) {
-		dev_warn(ns->ctrl->device,
-			"invalid zone size:%llu for namespace:%u\n",
-			ns->zsze, ns->head->ns_id);
-		status = -ENODEV;
-		goto free_data;
-	}
 
 	blk_queue_set_zoned(ns->disk, BLK_ZONED_HM);
 	blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, q);
@@ -129,7 +122,7 @@ static void *nvme_zns_alloc_report_buffer(struct nvme_ns *ns,
 				   sizeof(struct nvme_zone_descriptor);
 
 	nr_zones = min_t(unsigned int, nr_zones,
-			 get_capacity(ns->disk) >> ilog2(ns->zsze));
+			 div64_u64(get_capacity(ns->disk), ns->zsze));
 
 	bufsize = sizeof(struct nvme_zone_report) +
 		nr_zones * sizeof(struct nvme_zone_descriptor);
@@ -197,7 +190,7 @@ int nvme_ns_report_zones(struct nvme_ns *ns, sector_t sector,
 	c.zmr.zrasf = NVME_ZRASF_ZONE_REPORT_ALL;
 	c.zmr.pr = NVME_REPORT_ZONE_PARTIAL;
 
-	sector &= ~(ns->zsze - 1);
+	sector = rounddown(sector, ns->zsze);
 	while (zone_idx < nr_zones && sector < get_capacity(ns->disk)) {
 		memset(report, 0, buflen);
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
