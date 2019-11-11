Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AAFF6CEA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Nov 2019 03:39:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iTzcO-0007nz-Ta; Mon, 11 Nov 2019 02:39:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2117e6735=damien.lemoal@wdc.com>)
 id 1iTzcN-0007ng-9y
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Nov 2019 02:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xVnFvlBia519ipQSJs87sKz4zcebzCwKijy7K9MqmoI=; b=h38m5Hu7CmfR65y9iRTii/Ikp5
 neRrmluQXJTH9oeRMu2Zt/zXgzk9mYFOB62BWhooL3M4KH5gvcP8Lh3t0WIHAbDWrAnmvM7NOdDXn
 Rh6Qv1fSPsqX2pP4JJ0EdotnccECd50CSkOqP73k6dQfDakMaLdb7oY2MiXnRxUE8SSU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xVnFvlBia519ipQSJs87sKz4zcebzCwKijy7K9MqmoI=; b=Pg9fnrDPMes29AQj9x/pWQNM1H
 zEmdxzKdKUyhJmLLJ1nUNkadMp0YiyrYDbW7lmrKRHtV7+V/rE8wdNV/52HCUx7lTGQmNOxIgu5d3
 sHtYP2t1ylaGBmpsxG+HGreQOxg3sQBhbd4vt9IRG84CV36b9PaKprD6O3+HVIm9IYKM=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iTzcJ-00EDq9-Ob
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Nov 2019 02:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573440028; x=1604976028;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=FdDMBM8oW2SBfdkbPDmth/Mj8PXjLYk7YajwPtVTjXo=;
 b=bqOF0I8ZX3W5kV1c77zQeMYmhBP/d+FF5JoxdPH6J9qKFJzSOhc3dBg+
 yNwFAcL0WEAIkf7DmxaerZXiRJGxtpN4zEATt06g4rfN2lln9hijFTOHH
 CFigIyGRGkFa5sV84KJXAapnVZdqyqEtrATopxVqftPZzijS8bx/fw6PY
 QDMwYXkS7TGJ9LUJkDEFa2/SNaWm77/k+vtSMff9F7aUneqrdsRhrB/4b
 Qj05LLpi+WSXrbHQ8ynFJ49Q4qV/Gf3vFeJQBPtDfcRIp5eg/eclWrbSo
 H9mO6fx/LaImhou2WZV5icG/ejRIJO6cTen540tPNE9jLJyJHQUakX7H3 A==;
IronPort-SDR: GWTayTc0cZQl8sRUEgBxk0fKdSi8U8uE6Agnuf+tw8FFlV85Zr0Ktv4t9UFnBTWROE61I9inYF
 JcXErgnOBibYjpT/TKZJF1hlHKnYdlghUNVklOkIbIxQ8/rIwBzvXHs9D5s8+So5ENGyGvnVVs
 9xfloMIRxroYg++aEXyEvs7Qw4yJRrXmPQD5bNYrXUD8DELVsNcX/hWpm898QcB0f3U5PK+mRb
 hsAqA5hw/4VqPNRtUGNXXUvLJVG1ZLEvSEBg+ACuMbGUq6Y3cmQkmdu5eOz2LghPLAsedvDoMk
 36k=
X-IronPort-AV: E=Sophos;i="5.68,291,1569254400"; d="scan'208";a="223870991"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Nov 2019 10:40:07 +0800
IronPort-SDR: kbO561nm6guir52lw+9cx75pN5nZ4sCoU0LQTh848ZCG9cUIeXw0acvJ7ChUiCBcToKNV1t7bs
 o0W1dfik7QYLVnxEoM8CmWyGrhAtnl6+2YnOMM2L9J7gPR7ojZ5uyuHWweTIJ8cKduJNzcPqx2
 6+p7dvCkviQ6gSUc13cQFBSVp5ljpJEzVj/7MuKkN54MY5ADLzMG1LainZZkcSCr4ZJ0RVkaGx
 wIR2CQmCdm12bSb3MnBepq4kuApk833vaOejL06PRw4fbTHELuzm0i+m+l9d704dzM1zkXHiZ3
 Ya6vqcy0PIkkMxEDAH9SkrZd
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2019 18:34:39 -0800
IronPort-SDR: 4oxQANO3Le6zwGzSh84WyY/rR6HLvilbmxQhOVSuP4qz734lp+9TQlCDsh2oXnApWZuFEYGinl
 xIbAznCo/WIgVk0WVuLYnczVGMa0iIt+2ucgguDebEO5GaRSSVw+7yUHCC0MR/N7Pv5LBknbKY
 8hDnJaTQgc0y0tK0Dk8bg8RNdNmhFjp2mARQ0sXmp32jMzh3qiY3zMxOqmU+d8P7fnY45nDRVG
 k5oX+zOEY/IrPFo93bYDDT3zTJ3Q0f2d41WyR/BA2m17hxK8GTVWx68OLqKIWNQGOZ+0+6wePk
 56s=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip01.wdc.com with ESMTP; 10 Nov 2019 18:39:34 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, dm-devel@redhat.com,
 Mike Snitzer <snitzer@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Mon, 11 Nov 2019 11:39:22 +0900
Message-Id: <20191111023930.638129-2-damien.lemoal@wdc.com>
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
X-Headers-End: 1iTzcJ-00EDq9-Ob
Subject: [f2fs-dev] [PATCH v2 1/9] block: Enhance blk_revalidate_disk_zones()
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

For ZBC and ZAC zoned devices, the scsi driver revalidation processing
implemented by sd_revalidate_disk() includes a call to
sd_zbc_read_zones() which executes a full disk zone report used to
check that all zones of the disk are the same size. This processing is
followed by a call to blk_revalidate_disk_zones(), used to initialize
the device request queue zone bitmaps (zone type and zone write lock
bitmaps). To do so, blk_revalidate_disk_zones() also executes a full
device zone report to obtain zone types. As a result, the entire
zoned block device revalidation process includes two full device zone
report.

By moving the zone size checks into blk_revalidate_disk_zones(), this
process can be optimized to a single full device zone report, leading to
shorter device scan and revalidation times. This patch implements this
optimization, reducing the original full device zone report implemented
in sd_zbc_check_zones() to a single, small, report zones command
execution to obtain the size of the first zone of the device. Checks
whether all zones of the device are the same size as the first zone
size are moved to the generic blk_check_zone() function called from
blk_revalidate_disk_zones().

This optimization also has the following benefits:
1) fewer memory allocations in the scsi layer during disk revalidation
   as the potentailly large buffer for zone report execution is not
   needed.
2) Implement zone checks in a generic manner, reducing the burden on
   device driver which only need to obtain the zone size and check that
   this size is a power of 2 number of LBAs. Any new type of zoned
   block device will benefit from this.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 block/blk-zoned.c     |  62 +++++++++++++++++++++++-
 drivers/scsi/sd_zbc.c | 107 ++++++++----------------------------------
 2 files changed, 80 insertions(+), 89 deletions(-)

diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 481eaf7d04d4..dae787f67019 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -448,6 +448,58 @@ void blk_queue_free_zone_bitmaps(struct request_queue *q)
 	q->seq_zones_wlock = NULL;
 }
 
+/*
+ * Helper function to check the validity of zones of a zoned block device.
+ */
+static bool blk_zone_valid(struct gendisk *disk, struct blk_zone *zone,
+			   sector_t *sector)
+{
+	struct request_queue *q = disk->queue;
+	sector_t zone_sectors = blk_queue_zone_sectors(q);
+	sector_t capacity = get_capacity(disk);
+
+	/*
+	 * All zones must have the same size, with the exception on an eventual
+	 * smaller last zone.
+	 */
+	if (zone->start + zone_sectors < capacity &&
+	    zone->len != zone_sectors) {
+		pr_warn("%s: Invalid zoned device with non constant zone size\n",
+			disk->disk_name);
+		return false;
+	}
+
+	if (zone->start + zone->len >= capacity &&
+	    zone->len > zone_sectors) {
+		pr_warn("%s: Invalid zoned device with larger last zone size\n",
+			disk->disk_name);
+		return false;
+	}
+
+	/* Check for holes in the zone report */
+	if (zone->start != *sector) {
+		pr_warn("%s: Zone gap at sectors %llu..%llu\n",
+			disk->disk_name, *sector, zone->start);
+		return false;
+	}
+
+	/* Check zone type */
+	switch (zone->type) {
+	case BLK_ZONE_TYPE_CONVENTIONAL:
+	case BLK_ZONE_TYPE_SEQWRITE_REQ:
+	case BLK_ZONE_TYPE_SEQWRITE_PREF:
+		break;
+	default:
+		pr_warn("%s: Invalid zone type 0x%x at sectors %llu\n",
+			disk->disk_name, (int)zone->type, zone->start);
+		return false;
+	}
+
+	*sector += zone->len;
+
+	return true;
+}
+
 /**
  * blk_revalidate_disk_zones - (re)allocate and initialize zone bitmaps
  * @disk:	Target disk
@@ -497,7 +549,10 @@ int blk_revalidate_disk_zones(struct gendisk *disk)
 	if (!seq_zones_bitmap)
 		goto out;
 
-	/* Get zone information and initialize seq_zones_bitmap */
+	/*
+	 * Get zone information to check the zones and initialize
+	 * seq_zones_bitmap.
+	 */
 	rep_nr_zones = nr_zones;
 	zones = blk_alloc_zones(&rep_nr_zones);
 	if (!zones)
@@ -511,11 +566,14 @@ int blk_revalidate_disk_zones(struct gendisk *disk)
 		if (!nrz)
 			break;
 		for (i = 0; i < nrz; i++) {
+			if (!blk_zone_valid(disk, &zones[i], &sector)) {
+				ret = -ENODEV;
+				goto out;
+			}
 			if (zones[i].type != BLK_ZONE_TYPE_CONVENTIONAL)
 				set_bit(z, seq_zones_bitmap);
 			z++;
 		}
-		sector += nrz * blk_queue_zone_sectors(q);
 	}
 
 	if (WARN_ON(z != nr_zones)) {
diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
index 39f10ec0dfcf..7c4690f26698 100644
--- a/drivers/scsi/sd_zbc.c
+++ b/drivers/scsi/sd_zbc.c
@@ -339,32 +339,19 @@ static int sd_zbc_check_zoned_characteristics(struct scsi_disk *sdkp,
  * Returns the zone size in number of blocks upon success or an error code
  * upon failure.
  */
-static int sd_zbc_check_zones(struct scsi_disk *sdkp, u32 *zblocks)
+static int sd_zbc_check_zones(struct scsi_disk *sdkp, unsigned char *buf,
+			      u32 *zblocks)
 {
-	size_t bufsize, buflen;
-	unsigned int noio_flag;
+	size_t buflen;
 	u64 zone_blocks = 0;
-	sector_t max_lba, block = 0;
-	unsigned char *buf;
+	sector_t max_lba;
 	unsigned char *rec;
 	int ret;
-	u8 same;
-
-	/* Do all memory allocations as if GFP_NOIO was specified */
-	noio_flag = memalloc_noio_save();
 
-	/* Get a buffer */
-	buf = sd_zbc_alloc_report_buffer(sdkp, SD_ZBC_REPORT_MAX_ZONES,
-					 &bufsize);
-	if (!buf) {
-		ret = -ENOMEM;
-		goto out;
-	}
-
-	/* Do a report zone to get max_lba and the same field */
-	ret = sd_zbc_do_report_zones(sdkp, buf, bufsize, 0, false);
+	/* Do a report zone to get max_lba and the size of the first zone */
+	ret = sd_zbc_do_report_zones(sdkp, buf, SD_BUF_SIZE, 0, false);
 	if (ret)
-		goto out_free;
+		return ret;
 
 	if (sdkp->rc_basis == 0) {
 		/* The max_lba field is the capacity of this device */
@@ -379,82 +366,28 @@ static int sd_zbc_check_zones(struct scsi_disk *sdkp, u32 *zblocks)
 		}
 	}
 
-	/*
-	 * Check same field: for any value other than 0, we know that all zones
-	 * have the same size.
-	 */
-	same = buf[4] & 0x0f;
-	if (same > 0) {
-		rec = &buf[64];
-		zone_blocks = get_unaligned_be64(&rec[8]);
-		goto out;
-	}
-
-	/*
-	 * Check the size of all zones: all zones must be of
-	 * equal size, except the last zone which can be smaller
-	 * than other zones.
-	 */
-	do {
-
-		/* Parse REPORT ZONES header */
-		buflen = min_t(size_t, get_unaligned_be32(&buf[0]) + 64,
-			       bufsize);
-		rec = buf + 64;
-
-		/* Parse zone descriptors */
-		while (rec < buf + buflen) {
-			u64 this_zone_blocks = get_unaligned_be64(&rec[8]);
-
-			if (zone_blocks == 0) {
-				zone_blocks = this_zone_blocks;
-			} else if (this_zone_blocks != zone_blocks &&
-				   (block + this_zone_blocks < sdkp->capacity
-				    || this_zone_blocks > zone_blocks)) {
-				zone_blocks = 0;
-				goto out;
-			}
-			block += this_zone_blocks;
-			rec += 64;
-		}
-
-		if (block < sdkp->capacity) {
-			ret = sd_zbc_do_report_zones(sdkp, buf, bufsize, block,
-						     true);
-			if (ret)
-				goto out_free;
-		}
-
-	} while (block < sdkp->capacity);
-
-out:
-	if (!zone_blocks) {
-		if (sdkp->first_scan)
-			sd_printk(KERN_NOTICE, sdkp,
-				  "Devices with non constant zone "
-				  "size are not supported\n");
-		ret = -ENODEV;
-	} else if (!is_power_of_2(zone_blocks)) {
+	/* Parse REPORT ZONES header */
+	buflen = min_t(size_t, get_unaligned_be32(&buf[0]) + 64, SD_BUF_SIZE);
+	rec = buf + 64;
+	zone_blocks = get_unaligned_be64(&rec[8]);
+	if (!zone_blocks || !is_power_of_2(zone_blocks)) {
 		if (sdkp->first_scan)
 			sd_printk(KERN_NOTICE, sdkp,
 				  "Devices with non power of 2 zone "
 				  "size are not supported\n");
-		ret = -ENODEV;
-	} else if (logical_to_sectors(sdkp->device, zone_blocks) > UINT_MAX) {
+		return -ENODEV;
+	}
+
+	if (logical_to_sectors(sdkp->device, zone_blocks) > UINT_MAX) {
 		if (sdkp->first_scan)
 			sd_printk(KERN_NOTICE, sdkp,
 				  "Zone size too large\n");
-		ret = -EFBIG;
-	} else {
-		*zblocks = zone_blocks;
-		ret = 0;
+		return -EFBIG;
 	}
 
-out_free:
-	memalloc_noio_restore(noio_flag);
-	kvfree(buf);
+	*zblocks = zone_blocks;
 
-	return ret;
+	return 0;
 }
 
 int sd_zbc_read_zones(struct scsi_disk *sdkp, unsigned char *buf)
@@ -480,7 +413,7 @@ int sd_zbc_read_zones(struct scsi_disk *sdkp, unsigned char *buf)
 	 * Check zone size: only devices with a constant zone size (except
 	 * an eventual last runt zone) that is a power of 2 are supported.
 	 */
-	ret = sd_zbc_check_zones(sdkp, &zone_blocks);
+	ret = sd_zbc_check_zones(sdkp, buf, &zone_blocks);
 	if (ret != 0)
 		goto err;
 
-- 
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
