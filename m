Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 501B7511C1C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Apr 2022 18:03:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njk8K-0006bV-OH; Wed, 27 Apr 2022 16:03:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.raghav@samsung.com>) id 1njk8F-0006Z0-Ps
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 16:03:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kk01EsRG9bOHVzhx2cg7vI10rthuoQfVL8TCej8gbAs=; b=dIEaoTzixL7zg7YEOYEGwd8Ugv
 K7Ok5DVpGMCPbwaO+wVMn+ySQS4b56Vw7xKOT0/NZ9RSpLOadUiX+9FFdfhYeEzsfXHM40YM5o+cK
 rjaYtP+O/QhoOKrGuDRbyMVHbMSaz4IP4yREcrmAg6r/3l7T7QNz9/2k9TcNaNbcwh7Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kk01EsRG9bOHVzhx2cg7vI10rthuoQfVL8TCej8gbAs=; b=bThgOSm32j08TKhUKh1QcVp0wV
 eneMBmqOKNARPSO/xHCO+tKCSRtH8hdVw0xgfr0lq19PnvDMwxKPfptIDqLlt9nxVVo/Sx9sxTDON
 oIDl1vDzqKelCKybudbShL74ddP3ImJQraSWviJvXy1griqjaNZuBUdxkoXl90a+HjRw=;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njk8C-0004ds-MI
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 16:03:10 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220427160259euoutp0119a81ef7137cbcfa1a47a9411af76a0f~pzE9MVVCo0746107461euoutp01O
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 16:02:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220427160259euoutp0119a81ef7137cbcfa1a47a9411af76a0f~pzE9MVVCo0746107461euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1651075379;
 bh=kk01EsRG9bOHVzhx2cg7vI10rthuoQfVL8TCej8gbAs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FqFqteqGXSEnxZPhnX9rym6n42YAt++KmTUYH1akFOm0A7L9YLhwHpvVJ5z+0TJl9
 A71EFZm4I1wTNw7c+GIBonIM8041uzM6cxt8uvhd7XeS0ftGXi1kqVecDOT0q+lFCo
 xeb6kGclgglBpZfHmT9Vj1NgpQ/SIdZW/rLg5myE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220427160257eucas1p248f9fb67b38f65e92cd401d8333f1f48~pzE7tOLRh2334023340eucas1p2g;
 Wed, 27 Apr 2022 16:02:57 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 40.0A.10260.13969626; Wed, 27
 Apr 2022 17:02:57 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220427160257eucas1p21fb58d0129376a135fdf0b9c2fe88895~pzE7TkyRS2335223352eucas1p2Z;
 Wed, 27 Apr 2022 16:02:57 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220427160257eusmtrp29abf9fbaa39f05eb9b4bd28a52f41a07~pzE7Sr62r2598325983eusmtrp2c;
 Wed, 27 Apr 2022 16:02:57 +0000 (GMT)
X-AuditID: cbfec7f5-bddff70000002814-7e-62696931489b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 9B.71.09522.13969626; Wed, 27
 Apr 2022 17:02:57 +0100 (BST)
Received: from localhost (unknown [106.210.248.162]) by eusmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20220427160256eusmtip1cbd768be896ffc9fa5c108cd32dcf1a6~pzE67wefT0884308843eusmtip1h;
 Wed, 27 Apr 2022 16:02:56 +0000 (GMT)
From: Pankaj Raghav <p.raghav@samsung.com>
To: jaegeuk@kernel.org, axboe@kernel.dk, snitzer@kernel.org, hch@lst.de,
 mcgrof@kernel.org, naohiro.aota@wdc.com, sagi@grimberg.me,
 damien.lemoal@opensource.wdc.com, dsterba@suse.com,
 johannes.thumshirn@wdc.com
Date: Wed, 27 Apr 2022 18:02:40 +0200
Message-Id: <20220427160255.300418-2-p.raghav@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427160255.300418-1-p.raghav@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se1BUZRjG+8539pzDjmuH1dEv6ebOaGGGMEZ+E0YxOniwGeCf2GiYkQVO
 sAWr7Epg6bTcDFaTywTCAgNYEFeXe1xEaUEuIcGwYMAQRrKjILAYEpctjOXQ5H/P+36/533f
 Z+ZjoPQ6tYdRqs7yapUiXEaJyYbO1f43XZTKIOdLeY7Y8HMnxOW/pVA4c2EV4t6MPgKnp2TR
 2NrXD3HrfI4ID6zEEni0rYnApeW3CTxl0EN8uW2BxP/oJjZ6CZMQ/z3pgtONdwE2D+sJ3Dr2
 Bh68X0LjwWsn8I3WHhKbmnMpnF9spnHqxSWIR1LNAKd11YrwYlECja8/spC4e8zh/Zc409AH
 3Hp3BcWlxc/TXP9ENcmZ+qK4mrJkiivUZkCu9vuvuJaCRYJrGdVS3Dfx8xTXlHhPxFluDlPc
 lboywBnqhkkutbZa5Cv9WHw0hA9Xfs6rD7kHisMst/afSWJjLGurQAsaJTpgxyD2LZRQnAJ1
 QMxI2RKAEjtnCaF4AtBYaRYtFIsAxa0li3SA2bQs1kcI/R8Aim9cEwnFNEC5+krKBlHsARSb
 vGneyY4AlFZVtTkWsjMQDdT9StiW72AD0f2lAdqmSXYfmjMvQ5uWsO+gnyz1pHDgKyh7cJm2
 DbVj3VDqnx8JiD3qyZ7aROAGEl+fs5kBsUVi9G3hVUrwHkdzGfNQ0DvQTFcdLegX0dOmfELQ
 XyLziHXLnABQSpOBEmK6oSt3wm0Sso7I0HxIwD2QtqN+i9iORubshRO2o/SGq1BoS1DSRalA
 y1DT6tTWUoRMcblboTiUXRVHpIK9+mfC6J8Jo/9/bwGAZWA3H6WJCOU1h1V8tJNGEaGJUoU6
 BZ+OqAEbX7p3vWupEZTMPHYyAoIBRoAYKNspedISFiSVhCjOfcGrT59SR4XzGiNwYEjZbkmw
 skohZUMVZ/nPeP4Mr/7vlWDs9mgJ57FrxzpaypPk28yPjpS997Z94ct7f/8x0hCou6Ct+DTT
 xzQiD5qCmdW3tnnq7PhdFTEOQSGqx9Ou4wULN2oVp9r78Yf+d/c93OUXG3D+QnPA5TKmx+Ne
 a87t4NKObBQ9kCaK9HTeb0l54fga3VnSoPOdtVLe098praqAoIyArNcr7Y95JMBqpf+Kw8MA
 l+wVL6/JyEsFeHbtqOcvbWLSNOeGcr52Hf9kVO7zHHKslOe99m510Tlv18SV5UBj++Gbzxe7
 6yas3Udq8h7QXvLxkxPrMX5yX+apn7d/dO+DO/nuV17V5p4kq+rP5x/kR2eHRq0KY277wT9i
 PIdkPieS/gqUkZowhcsBqNYo/gWtMydhQQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLKsWRmVeSWpSXmKPExsVy+t/xu7qGmZlJBmsu8VisP3WM2WL13X42
 i2kffjJbnJ56lsliUv8MdovfZ88zW+x9N5vV4sKPRiaLmwd2MlmsXH2UyeLJ+lnMFj0HPrBY
 /O26BxRrechs8eehocWkQ9cYLZ5encVksfeWtsWlxyvYLS4tcrfYs/cki8XlXXPYLOYve8pu
 MaHtK7PFjQlPGS0mHt/MavF5aQu7xbrX71ksTtySdpD1uHzF2+PfiTVsHhOb37F7nL+3kcXj
 8tlSj02rOtk8FjZMZfbYvKTeY/eCz0weu282sHn0Nr9j89jZep/V4/2+q2wefVtWMXqs33KV
 xWPC5o2sAUJRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF
 +nYJehnv96sVdAhUvP/1k7GBcQdvFyMHh4SAicTnrbldjFwcQgJLGSV+PNjF2MXICRSXkLi9
 sAnKFpb4c62LDaLoOaPEll2TmECa2QS0JBo72UHiIgJPGCXu/3zMAuIwCzSwSNyauIsJpFtY
 IE5i5rFDzCA2i4CqxNun38FsXgEriYPvt7JAbJCXmHnpOzvIUE4Ba4kJnyJAwkJAJd2LbrFC
 lAtKnJz5BKycGai8eets5gmMArOQpGYhSS1gZFrFKJJaWpybnltsqFecmFtcmpeul5yfu4kR
 mE62Hfu5eQfjvFcf9Q4xMnEwHmKU4GBWEuH9sjsjSYg3JbGyKrUoP76oNCe1+BCjKdDZE5ml
 RJPzgQktryTe0MzA1NDEzNLA1NLMWEmc17OgI1FIID2xJDU7NbUgtQimj4mDU6qBidvFgLde
 KU2Y82fPlJdpbQYOeVKdrT8nT3Zp9Pj6z2de32p1k57g7xxG05c4HVkckRoT84zVlGX/068R
 548EqHmt61bz5bh/wTjjCUfeQ4bqHexaC7W2bOSLuPV7i+rMeyH8OUptHw5s2bp94dn6fd48
 xw08429uNq5fmZm7q8uq/KTxmvVfZy5uYXjf25yisU2u2EFIbncqy0K7WYa9j2bz3DRWNlwc
 /0XLevpHofcCOleeiO5kuMZeM2mD2aZzB1k4tN5POijOtaC4/L/gnT1nPbS5plTdKfk1cZv4
 KyPNxzP+OphweMVyeCp8dXoVczXr7Lbu0mUBOSv/Oa3N3OHt8YV/9cX87Pf163yclFiKMxIN
 tZiLihMBAepjMLADAAA=
X-CMS-MailID: 20220427160257eucas1p21fb58d0129376a135fdf0b9c2fe88895
X-Msg-Generator: CA
X-RootMTR: 20220427160257eucas1p21fb58d0129376a135fdf0b9c2fe88895
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220427160257eucas1p21fb58d0129376a135fdf0b9c2fe88895
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160257eucas1p21fb58d0129376a135fdf0b9c2fe88895@eucas1p2.samsung.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Adapt blkdev_nr_zones and blk_queue_zone_no function so that
 it can also work for non-power-of-2 zone sizes. As the existing deployments
 of zoned devices had power-of-2 assumption, power-of-2 optimized calculation
 is kept for those devices. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [210.118.77.11 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [210.118.77.11 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1njk8C-0004ds-MI
Subject: [f2fs-dev] [PATCH 01/16] block: make blkdev_nr_zones and
 blk_queue_zone_no generic for npo2 zsze
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

Adapt blkdev_nr_zones and blk_queue_zone_no function so that it can
also work for non-power-of-2 zone sizes.

As the existing deployments of zoned devices had power-of-2
assumption, power-of-2 optimized calculation is kept for those devices.

There are no direct hot paths modified and the changes just
introduce one new branch per call.

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
---
 block/blk-zoned.c      | 8 +++++++-
 include/linux/blkdev.h | 8 +++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 38cd840d8838..1dff4a8bd51d 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -117,10 +117,16 @@ EXPORT_SYMBOL_GPL(__blk_req_zone_write_unlock);
 unsigned int blkdev_nr_zones(struct gendisk *disk)
 {
 	sector_t zone_sectors = blk_queue_zone_sectors(disk->queue);
+	sector_t capacity = get_capacity(disk);
 
 	if (!blk_queue_is_zoned(disk->queue))
 		return 0;
-	return (get_capacity(disk) + zone_sectors - 1) >> ilog2(zone_sectors);
+
+	if (is_power_of_2(zone_sectors))
+		return (capacity + zone_sectors - 1) >>
+		       ilog2(zone_sectors);
+
+	return div64_u64(capacity + zone_sectors - 1, zone_sectors);
 }
 EXPORT_SYMBOL_GPL(blkdev_nr_zones);
 
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 60d016138997..c4e4c7071b7b 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -665,9 +665,15 @@ static inline unsigned int blk_queue_nr_zones(struct request_queue *q)
 static inline unsigned int blk_queue_zone_no(struct request_queue *q,
 					     sector_t sector)
 {
+	sector_t zone_sectors = blk_queue_zone_sectors(q);
+
 	if (!blk_queue_is_zoned(q))
 		return 0;
-	return sector >> ilog2(q->limits.chunk_sectors);
+
+	if (is_power_of_2(zone_sectors))
+		return sector >> ilog2(zone_sectors);
+
+	return div64_u64(sector, zone_sectors);
 }
 
 static inline bool blk_queue_zone_is_seq(struct request_queue *q,
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
