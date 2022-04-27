Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC8F511C22
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Apr 2022 18:03:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njk8O-0006KI-So; Wed, 27 Apr 2022 16:03:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.raghav@samsung.com>) id 1njk8E-0006JJ-JE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 16:03:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hUBpZxkDXTvCbRzniY5oQe/mcS4maRVWN0mf8iYt6nk=; b=aT1dTyis7c7iODF8OLdDAOXwlf
 RuVquHP30oD2SDkDaNP/Pq12+R1a8NIzWutiTvwWjYx89qr/3HA7o+SH29td7b2Go1VWmNzGRSCYJ
 0C+lwsGNIBsGBmLSNKfSM+sTHGNrQyR10OflXqh+BybG+pzsdWI46RWxWV72tnIcCvSs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hUBpZxkDXTvCbRzniY5oQe/mcS4maRVWN0mf8iYt6nk=; b=DaZ+VkUBJeiRPFoNZPCswkj9BY
 5Z1tWeCnQKn64OamQkmcI3n606AKnyTKgvDuneITuMdB1BHqkETkGDSIoxWPFKfZMu7c8uzqf6dX1
 gKkS6peO+cxVGnO/VGaLzkPDJVOC85EvZltlEMFYKATEMIW7A740KmyJj0vQJ3/oQV8g=;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njk8E-00Bt4P-Dt
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 16:03:11 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220427160302euoutp01bd385ba4dae93b0af8b0358bfd5711e8~pzFAck6oM0317703177euoutp01e
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 16:03:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220427160302euoutp01bd385ba4dae93b0af8b0358bfd5711e8~pzFAck6oM0317703177euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1651075382;
 bh=hUBpZxkDXTvCbRzniY5oQe/mcS4maRVWN0mf8iYt6nk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a4BfuNHkRiInn1pXKeFIa9X+x0suINO6WL3wg2Nl1owsNN7ayA3etMnYu3rGQmYkW
 ehsfyRV9xTOcPixUYu/L0beUreCYD90oO8cgrRpB1ykdtGP7BMcd1hZ22YJaIeaZEE
 JO7ptnuZQ5c+lWAXVOQSPCA5Ge0vMylS0+QXtuE0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220427160300eucas1p2820b4ac90e9eb0636191f5d6b6009ac5~pzE_szwrg2336123361eucas1p2k;
 Wed, 27 Apr 2022 16:03:00 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id D4.0A.10260.43969626; Wed, 27
 Apr 2022 17:03:00 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220427160300eucas1p1470fe30535849de6204bb78d7083cb3a~pzE_QB5uM0602706027eucas1p1M;
 Wed, 27 Apr 2022 16:03:00 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220427160300eusmtrp11a05ef21462b132cd88f3aeacf09747f~pzE_N2fo72077420774eusmtrp1H;
 Wed, 27 Apr 2022 16:03:00 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-85-626969340c0e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id CC.97.09404.43969626; Wed, 27
 Apr 2022 17:03:00 +0100 (BST)
Received: from localhost (unknown [106.210.248.162]) by eusmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20220427160300eusmtip201f34f7356e5fa50793f41df667dbd86~pzE93FBDa0262002620eusmtip2N;
 Wed, 27 Apr 2022 16:03:00 +0000 (GMT)
From: Pankaj Raghav <p.raghav@samsung.com>
To: jaegeuk@kernel.org, axboe@kernel.dk, snitzer@kernel.org, hch@lst.de,
 mcgrof@kernel.org, naohiro.aota@wdc.com, sagi@grimberg.me,
 damien.lemoal@opensource.wdc.com, dsterba@suse.com,
 johannes.thumshirn@wdc.com
Date: Wed, 27 Apr 2022 18:02:43 +0200
Message-Id: <20220427160255.300418-5-p.raghav@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427160255.300418-1-p.raghav@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTVxjGOffc3luq1duKcoZDA3GZ6AA/WHYG09Fs2a66LOr8w5EsrsAN
 EFsgLR0CWyjCXGGMQpkyCjJQRD62tUgVscUwIl8ilBUrYBiECcvEUBigjoFs7Voz/3ve9/ze
 5znvyeFDsZHy4yckpnCKRKkskBKQ1zqXrMFhCQnRuzpb92LD7U6IG37VUvjc3BLEvWf7CKzT
 fkfj5T4rxK2OMh4e+CuLwCNtLQSua+gg8KRBD3F+2xyJn+WNOXs5ExCvTOzGuvZ7AE/Z9QRu
 vb8T2x7U0th24X1sae0h8eCNcgp/XzNF48IzjyEeLpwCuKiriYcXLuXQ+KdHsyTuvr850p8d
 vHuIXe3+gWKLsh00ax1rJNnBPhV7pT6XYqvUZyHbVJ3JmisXCNY8oqbYb7IdFNvy5TiPnb1p
 p9gCUz1gDSY7yRY2NfIOi6MEb8VysoTPOEXo/k8F8Y1VD+jk3o2nzFoLrQa3RXnAm4+YMPR1
 7yWQBwR8MVMLkLZ5zlMsAnTBbCPcxQJA/6ibqecj7W0mD3UZoDvTpR7qIUCdZQPOgs+nmB0o
 K5d29X2YYYCKjMb/IMhMQzRgGiJcVhuY4+jb0XHo0iTzCsr/e4jn0kImHFXUnOe547aiUttT
 2mXqzUSgwvnjbkSEekonSZeGTiT7ahl0+SOmToB0agdwz76Lhn6f8fhsQNNdJtqtX0a9xfmk
 W2egqeFlz3CO8wVaDJQrDDnDCu7IXBIyQchwI9SNS9Dq5RwPsQ4Nz4jcV1iHdNdKoLstRJoz
 YjcdiFqWJj2hCA2eLveEsiinoo0uBAH6F5bRv7CM/v/cSgDrgS+nUsrjOOXeRC41RCmVK1WJ
 cSExSfIrwPmpe1e7Hl8HtdN/hrQDgg/aAeLDQB/hojk+WiyMlaalc4qkEwqVjFO2g818MtBX
 GJNglIqZOGkKd5LjkjnF81OC7+2nJjIWnn08sk3U9V7cB4pHofbqXVlfjRO6AEPW3U82pd5q
 YJPD7dvfWGO9KB+lFHHF8TMy66g6WHAycmv6kST52E6tRXJs7b4hWlG+/ORNSVpfz/XuCT/J
 bMpyR2rUO7+t2ZS+RTN+9ZfKe9qCqvhtPlBy86gl4+fXS95e9Boit1N7cmUzH22xcRsLin6E
 1ijB06bGksOOiy+l+b52LJJ3KrdWmKc63TNazjR1HInwPuB/6/ND4cUHeOv7g/YsZOp8+873
 9wOvCvMKnH015ol1Ler8IrvGWHzUcOLhfs2HB5k/kg9aYvdF+4u85jW1mSt1460RzfqgxID1
 loBzydXB80v5YZpAUhkv3b0DKpTSfwG1UqsyQwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPKsWRmVeSWpSXmKPExsVy+t/xe7ommZlJBjO3iFmsP3WM2WL13X42
 i2kffjJbnJ56lsliUv8MdovfZ88zW+x9N5vV4sKPRiaLmwd2MlmsXH2UyeLJ+lnMFj0HPrBY
 /O26BxRrechs8eehocWkQ9cYLZ5encVksfeWtsWlxyvYLS4tcrfYs/cki8XlXXPYLOYve8pu
 MaHtK7PFjQlPGS0mHt/MavF5aQu7xbrX71ksTtySdpD1uHzF2+PfiTVsHhOb37F7nL+3kcXj
 8tlSj02rOtk8FjZMZfbYvKTeY/eCz0weu282sHn0Nr9j89jZep/V4/2+q2wefVtWMXqs33KV
 xWPC5o2sAUJRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF
 +nYJehkbFz5mLzgtWrG7fw97A+MpwS5GTg4JAROJQwe2MHYxcnEICSxllFi/fj8rREJC4vbC
 JkYIW1jiz7UuNoii54wS9w7uB3I4ONgEtCQaO9lB4iICTxgl7v98zALiMAs0sEjcmriLCaRb
 WCBMYtGrScwgNouAqkTPr+tgG3gFrCTmLZsLtU1eYual7+wgQzkFrCUmfIoACQsBlXQvugVV
 LihxcuYTFhCbGai8eets5gmMArOQpGYhSS1gZFrFKJJaWpybnltspFecmFtcmpeul5yfu4kR
 mFK2Hfu5ZQfjylcf9Q4xMnEwHmKU4GBWEuH9sjsjSYg3JbGyKrUoP76oNCe1+BCjKdDZE5ml
 RJPzgUktryTe0MzA1NDEzNLA1NLMWEmc17OgI1FIID2xJDU7NbUgtQimj4mDU6qBKU0o8r2c
 c0vGDb+Q+80WSYcz9VMqFQJXmlr3rDjkvSuF6+j/Llk+9atRm7jPldSJbjlj8zXssc7Li6rc
 zI9Zfz2vemEqe/lL4M4V8y7O3sGeVlD3c1/SyWMh+6fv2iavcjNQTPpmROjh7Nq1T65JWh64
 qcdQ77JNV/DM6hn3pzQs0lDmEHL2vX3280kOownb3x/vnDRjVva6xaqyTzdHfqy/s+6Ktk9T
 pO/R7x3+PVfOqG2Z+jdbbTLnprD3AQ1q7wXMvc9POl6rMJFZ+XCW2ffljOKruvI1Us5+Zn63
 zvts5/bb59ledTZtEoxalqum/V0s+hVb8CG2swu3K/ZoXVwlVmcjEfzgz4t/O1c+P6zEUpyR
 aKjFXFScCAAgq28nsgMAAA==
X-CMS-MailID: 20220427160300eucas1p1470fe30535849de6204bb78d7083cb3a
X-Msg-Generator: CA
X-RootMTR: 20220427160300eucas1p1470fe30535849de6204bb78d7083cb3a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220427160300eucas1p1470fe30535849de6204bb78d7083cb3a
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160300eucas1p1470fe30535849de6204bb78d7083cb3a@eucas1p1.samsung.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Convert the calculations on zone size to be generic instead
 of relying on power_of_2 based logic in the block layer using the helpers
 wherever possible. The only hot path affected by this change for power_of_2
 zoned devices is in blk_check_zone_append() but the effects should be
 negligible
 as the helper blk_queue_zone_aligned() optimizes the calculati [...] 
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
X-Headers-End: 1njk8E-00Bt4P-Dt
Subject: [f2fs-dev] [PATCH 04/16] block: allow blk-zoned devices to have
 non-power-of-2 zone size
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

Convert the calculations on zone size to be generic instead of relying on
power_of_2 based logic in the block layer using the helpers wherever
possible.

The only hot path affected by this change for power_of_2 zoned devices
is in blk_check_zone_append() but the effects should be negligible as the
helper blk_queue_zone_aligned() optimizes the calculation for those
devices. Note that the append path cannot be accessed by direct raw access
to the block device but only through a filesystem abstraction.

Finally, remove the check for power_of_2 zone size requirement in
blk-zoned.c

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
---
 block/blk-core.c  |  3 +--
 block/blk-zoned.c | 12 ++++++------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 937bb6b86331..850caf311064 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -634,8 +634,7 @@ static inline blk_status_t blk_check_zone_append(struct request_queue *q,
 		return BLK_STS_NOTSUPP;
 
 	/* The bio sector must point to the start of a sequential zone */
-	if (pos & (blk_queue_zone_sectors(q) - 1) ||
-	    !blk_queue_zone_is_seq(q, pos))
+	if (!blk_queue_zone_aligned(q, pos) || !blk_queue_zone_is_seq(q, pos))
 		return BLK_STS_IOERR;
 
 	/*
diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 1dff4a8bd51d..f7c7c3bd148d 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -288,10 +288,10 @@ int blkdev_zone_mgmt(struct block_device *bdev, enum req_opf op,
 		return -EINVAL;
 
 	/* Check alignment (handle eventual smaller last zone) */
-	if (sector & (zone_sectors - 1))
+	if (!blk_queue_zone_aligned(q, sector))
 		return -EINVAL;
 
-	if ((nr_sectors & (zone_sectors - 1)) && end_sector != capacity)
+	if (!blk_queue_zone_aligned(q, nr_sectors) && end_sector != capacity)
 		return -EINVAL;
 
 	/*
@@ -489,14 +489,14 @@ static int blk_revalidate_zone_cb(struct blk_zone *zone, unsigned int idx,
 	 * smaller last zone.
 	 */
 	if (zone->start == 0) {
-		if (zone->len == 0 || !is_power_of_2(zone->len)) {
-			pr_warn("%s: Invalid zoned device with non power of two zone size (%llu)\n",
-				disk->disk_name, zone->len);
+		if (zone->len == 0) {
+			pr_warn("%s: Invalid zoned device size",
+				disk->disk_name);
 			return -ENODEV;
 		}
 
 		args->zone_sectors = zone->len;
-		args->nr_zones = (capacity + zone->len - 1) >> ilog2(zone->len);
+		args->nr_zones = div64_u64(capacity + zone->len - 1, zone->len);
 	} else if (zone->start + args->zone_sectors < capacity) {
 		if (zone->len != args->zone_sectors) {
 			pr_warn("%s: Invalid zoned device with non constant zone size\n",
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
