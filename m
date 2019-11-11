Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50287F6CED
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Nov 2019 03:39:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iTzcS-0006yk-5F; Mon, 11 Nov 2019 02:39:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2117e6735=damien.lemoal@wdc.com>)
 id 1iTzcQ-0006yH-TX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Nov 2019 02:39:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FbA5BQTlrJon9Po2biPhQK/pGDGVNly6E7Dq8NRclEw=; b=T6Aczq2DRAFz4w3V+nY5XSIqRC
 MFlFatlySht94hm7th+DNCtFmBEvHDzLYf+iYEjjaDxlJcu+xfJGBBovliTgf02O+I+jDEy2PTFLe
 vDSsm0DjW3YhvfJJDoF/zBcQ9zQkhWSomj+0uzHO3QDjlxvGEL2+hdGgEglUt6isSOHs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FbA5BQTlrJon9Po2biPhQK/pGDGVNly6E7Dq8NRclEw=; b=R2nS2DZ4TIVnygSZpI3EhH8m5P
 raddIOqp1jv/8RkvTT8bX+7M0cjoc/8i9Kb6DDASdmgrNcqdwlo8ZEvsVZdqLmj1rO/xQZ6+xEvte
 vasXbOs3uf7f8uqpAl+OyRvOPBAwiL0Td9uZQxZyblTc+pAr0PROm+u/BnGcBzGinWNs=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iTzcN-00EDr9-Ej
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Nov 2019 02:39:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573440034; x=1604976034;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=QRNHYLozP3GBLyGc1aFL68IZ/69XtP6zwGS2IDkAHaY=;
 b=DZr0IF6Dmw5FeEiLVlMvObGmD1+0f0Ii3CdA2DGlWmQMtC2XFs/sEjOj
 HPsJ/B9Zvu6c57qcLc8pXK28f7WmAXl8E5ArLDJdcHeCTNeVx/UDtDPxq
 oO2rSEe4NPE7PtRFoVt7mq9nrCgiUf83HT9NSYdqlGVNlqbddli5AYIkq
 MVoLtLQ+1LKmd7IFt1IIoLqghyQJBQgHs7V8HlcjgKu/5h0xCePZzDuJr
 b1DAh4KqItgZlj9pAyd1m+mhVHUC1yzsFxlOEG7bKhJ+73lOyyFXfFKcL
 b8zDiLJ7h0qytL4EJd2o+qOgtR3zlv0SBWWN0qietyPHau1iA1WBh2iSe A==;
IronPort-SDR: 2U4/R5JPI5TpYU8auwHTmn/i0AJ6RGOHF0PgC0h3JuzBUioRhHwZIbJbkSHotxSF1vQ5zskBQV
 1sDMucTV7g0rjYU6UI0UoYvTyADpntgA2OP5C4993MnIrV86EFQDnQFnHU297oZ/XkCz7Hrj4F
 bfGHhfz/HFnB3Vt6n2uTnCPTuA9f8PlIv0JaMMs0+1DHeS1OGjHtZvpK7mbBSxDiQe82CPqPHI
 lIAb7/NyPUqcboUO1UFc+EwOdmqnAOAaHhqcWV2j8BG7SAQAlg4XsSI2DRpQ4TGxibeDVnreZN
 GvM=
X-IronPort-AV: E=Sophos;i="5.68,291,1569254400"; d="scan'208";a="223871000"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Nov 2019 10:40:13 +0800
IronPort-SDR: rmXrfGBFCfEZGGU7sTHxK7RChBX3R8CJnpZ7ESK19t7HlVv+Nqpl8bMBMYjf5nB1gz8bQLDnVC
 HqxF65fM/Nkh7g7grkaETFy+ib8Juf/kYjvTP1OuT/KGP/QNp7H3WxwOLBvLpy1F86NxXCaODx
 ZyS5e6yu9FWI00/nNhJEVkMqPJAaR30f0dCkJ6HbiOD+O4wE5tghdYd3OumVJzmSjF+oOqZkep
 Hv8cAjtasRGT2/ySbscF8NtjgEltlfd2t49MmGdML+5u8jkRrmmA5/induSLq26WGyzyRlttYh
 raCDHIBvJbJT+25TCMs7pXme
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2019 18:34:42 -0800
IronPort-SDR: B7knMz2tWWR9ca5USo3tzOeizXPdpEdpYWZVz/33KQ3Z8OzM5F5QnkhkDX7m62qSoCaUftzU4U
 Ic50Gu4JEc65YJv4JYwZ1lCiiz1pqlSQ0sKjQmt5ikknSprgnHkfp9D94Xt2SSx26F7aoun6WP
 CMTTDptq7Fg6197WwXyztPcBBjm9g2USjNPoxAmAi6qrZYvZ4in8tT5OdbsDUQ7lTGSMXdmTxg
 a73cB4IB07UsLASMGju6BzMJEHA5aRzX3qgEfvR2Sm6aBqIzMJz8OIyO/iLbqp0pdj10DTVD1c
 uhg=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip01.wdc.com with ESMTP; 10 Nov 2019 18:39:37 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, dm-devel@redhat.com,
 Mike Snitzer <snitzer@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Mon, 11 Nov 2019 11:39:24 +0900
Message-Id: <20191111023930.638129-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191111023930.638129-1-damien.lemoal@wdc.com>
References: <20191111023930.638129-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iTzcN-00EDr9-Ej
Subject: [f2fs-dev] [PATCH v2 3/9] block: Simplify report zones execution
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
Reviewed-by: Hannes Reinecke <hare@suse.de>
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
