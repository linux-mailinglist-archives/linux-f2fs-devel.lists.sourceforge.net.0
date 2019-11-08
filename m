Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B87DF3DBD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2019 02:57:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iStWf-00069s-R7; Fri, 08 Nov 2019 01:57:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=208d19533=damien.lemoal@wdc.com>)
 id 1iStWe-00069j-Eg
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 01:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KkwjrNBwLilglckmrThvSz9JXOCe47Nl2Gtkfx4QVkc=; b=JJ5k5z5YOjPukjl17KRbh9cB7U
 3x9e7PvtN1bruAqX3NKfhZigmquUXFFw0BYGTZOUidcSJbMfCN+dR8W5uAkeAjT8UVili4QfRrnsj
 vzc93M6PCIjTTSsHSr5dMf6WzsFBSvCMRo5hjB+KVTRC1DWTErXwWwxKtHapC81vsh1o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KkwjrNBwLilglckmrThvSz9JXOCe47Nl2Gtkfx4QVkc=; b=Z/MXFMd7jfaG16lVdxDvtQBKF0
 DTiVGEN42NhCnICbiYQHv4x7BCiyud/h6X7jJ7wy4U912STX+Pq1J2FtndH8wPxMCucObBHNlzDO1
 S1sooSi/np4GUwLxcBBwxE0ArOawCB45UELjSt6bQS7jc2IeVct4gU7mbzYcG84ewhNM=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iStWc-004Ptm-IC
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 01:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573178283; x=1604714283;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1n0Nb/Nk+xgPczd8to649AuxcaKoknq+zLbCWhS06z4=;
 b=pp6+h3/QO+p0FCF2sBF6x04KpeM6Qv7GTCAt8oJac3+0LpVanGHi+avK
 20AOnIHOiq6Gwa7n3nLRGStiCUBNVDJcCsVxJgwVlCDFS0vTP38Oni8L0
 cGFX/IeJosQHEekLMq7zZmahxfMx2q0RlVspWk90rKejratat9gbjfPaP
 AxjuL9nqXwo0pnLaUayyyOgCPUrdQIQq/vRltmQhQ7nl9rSl+4UM73rj0
 4z4qO5KAS++X1ImsdIMaIkqIU0aQylMGi73VC1a49wZb29r0Qzf8vYJ1p
 M5KCeUY3OHUwuUxsyWDH3a3kPanbz2y9+lf0uNHI53rJF55qshXGEghgi w==;
IronPort-SDR: ywlLga+mJ59wllKDln1CIzFVwnhQLrvBzJkKZr9Vlp1nvFMrRC/17U+iekKJ/jbO07/o09hJKa
 kHsxaH5gBxV8r1fetjkhn41KOr6RJf3+MdF9c5shFRJMAHCgilgS/4wyriMxXclPizqpyP9Msv
 4S2tTamWt7ou5LcZJekbtUhEuHmCpEmvTrmTMvhlKfJRKEgbfcwvn1s+Ijm+yA8NotTb79tEAy
 r5lL6lNArCkP++LbvmjaSo2Smiug+F7XKZojz/eIzskP+693hjca0V4B0qITR9BiSsctN8c2Wd
 klI=
X-IronPort-AV: E=Sophos;i="5.68,279,1569254400"; d="scan'208";a="223636902"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Nov 2019 09:57:44 +0800
IronPort-SDR: /hqQbm9draaVjIFwukBm23jPHi5UPSj9amCDj3iKtGcHmnWegh1YgLJcoqCj5ap8rQtsotZ3X6
 g5VpZWK72u/rk6vzDJ7q2KjJKztusK8uk9jWYnwmpTq6fYrl8TU9fZmTEnsj7mO3cnWBrqvENs
 +eBtA3RoY2wD4UyWwGAZj95AvyRpBcYixT/d96YVRe3R0emoCgcGQwCRPcgYDtIAa6wVKNMBth
 PyEHViRI5OOKvSnccG5DHmhFABx7luqHx5T1mCu1A9+tEvcRxzBASGBTTYE27+Ju2s87+G05Eb
 5GpLFE0WylJGMCyGKFgyu6ee
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 17:52:19 -0800
IronPort-SDR: yFxw+3zg+bWdVM0Egku9aB0+avk5K/U+jlSZuFcq5p8pgi+NK086WURpaQvdjC41VqBol0XJfF
 eOWWicAhbCgCgPjJAlEezKks83eHZd1GcNhyOkk6oyQey+NWwxMo+7OyhlDAgo+nwtDRYuu8/5
 0CMRf6E6Dapy5Nb/nR0rvlvfTaX74H1ZSHxAUqlAkNIXCImw/1kvmYL9cHClz1bL0a7sjyZh77
 O0mPWoIbknDb2a01N6G1u7Awsvu03sW3aFNGIcW87UO4xzQsfJY/3e7B2iPDwXmNjpBwIaZ5kX
 FlM=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2019 17:57:08 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, dm-devel@redhat.com,
 Mike Snitzer <snitzer@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Fri,  8 Nov 2019 10:56:56 +0900
Message-Id: <20191108015702.233102-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108015702.233102-1-damien.lemoal@wdc.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iStWc-004Ptm-IC
Subject: [f2fs-dev] [PATCH 3/9] block: Simplify report zones execution
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

All kernel users of blkdev_report_zones() as well as applications use
through ioctl(BLKZONEREPORT) expect to potentially get less zone
descriptors than requested. As such, the use of the internal report
zones command execution loop implemented by blk_report_zones() is
not necessary and can even be harmful to performance by causing the
execution of inefficient small zones report command to service the
reminder of a requested zone array.

This patch removes blk_report_zones(), simplifying the code. Also
remove a now incorrect comment in dm_blk_report_zones().

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Javier Gonzalez <javier@javigon.com>
---
 block/blk-zoned.c | 34 +++++-----------------------------
 drivers/md/dm.c   |  6 ------
 2 files changed, 5 insertions(+), 35 deletions(-)

diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 523a28d7a15c..ea4e086ba00e 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -119,31 +119,6 @@ static bool blkdev_report_zone(struct block_device *bdev, struct blk_zone *rep)
 	return true;
 }
 
-static int blk_report_zones(struct gendisk *disk, sector_t sector,
-			    struct blk_zone *zones, unsigned int *nr_zones)
-{
-	struct request_queue *q = disk->queue;
-	unsigned int z = 0, n, nrz = *nr_zones;
-	sector_t capacity = get_capacity(disk);
-	int ret;
-
-	while (z < nrz && sector < capacity) {
-		n = nrz - z;
-		ret = disk->fops->report_zones(disk, sector, &zones[z], &n);
-		if (ret)
-			return ret;
-		if (!n)
-			break;
-		sector += blk_queue_zone_sectors(q) * n;
-		z += n;
-	}
-
-	WARN_ON(z > *nr_zones);
-	*nr_zones = z;
-
-	return 0;
-}
-
 /**
  * blkdev_report_zones - Get zones information
  * @bdev:	Target block device
@@ -164,6 +139,7 @@ int blkdev_report_zones(struct block_device *bdev, sector_t sector,
 			struct blk_zone *zones, unsigned int *nr_zones)
 {
 	struct request_queue *q = bdev_get_queue(bdev);
+	struct gendisk *disk = bdev->bd_disk;
 	unsigned int i, nrz;
 	int ret;
 
@@ -175,7 +151,7 @@ int blkdev_report_zones(struct block_device *bdev, sector_t sector,
 	 * report_zones method. If it does not have one defined, the device
 	 * driver has a bug. So warn about that.
 	 */
-	if (WARN_ON_ONCE(!bdev->bd_disk->fops->report_zones))
+	if (WARN_ON_ONCE(!disk->fops->report_zones))
 		return -EOPNOTSUPP;
 
 	if (!*nr_zones || sector >= bdev->bd_part->nr_sects) {
@@ -185,8 +161,8 @@ int blkdev_report_zones(struct block_device *bdev, sector_t sector,
 
 	nrz = min(*nr_zones,
 		  __blkdev_nr_zones(q, bdev->bd_part->nr_sects - sector));
-	ret = blk_report_zones(bdev->bd_disk, get_start_sect(bdev) + sector,
-			       zones, &nrz);
+	ret = disk->fops->report_zones(disk, get_start_sect(bdev) + sector,
+				       zones, &nrz);
 	if (ret)
 		return ret;
 
@@ -561,7 +537,7 @@ int blk_revalidate_disk_zones(struct gendisk *disk)
 
 	while (z < nr_zones) {
 		nrz = min(nr_zones - z, rep_nr_zones);
-		ret = blk_report_zones(disk, sector, zones, &nrz);
+		ret = disk->fops->report_zones(disk, sector, zones, &nrz);
 		if (ret)
 			goto out;
 		if (!nrz)
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index bc143c1b2333..89189c29438f 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -473,12 +473,6 @@ static int dm_blk_report_zones(struct gendisk *disk, sector_t sector,
 		goto out;
 	}
 
-	/*
-	 * blkdev_report_zones() will loop and call this again to cover all the
-	 * zones of the target, eventually moving on to the next target.
-	 * So there is no need to loop here trying to fill the entire array
-	 * of zones.
-	 */
 	ret = tgt->type->report_zones(tgt, sector, zones, nr_zones);
 
 out:
-- 
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
