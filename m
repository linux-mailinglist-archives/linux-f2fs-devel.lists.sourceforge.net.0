Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0E0F3DC4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2019 02:57:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iStWj-0006mx-QM; Fri, 08 Nov 2019 01:57:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=208d19533=damien.lemoal@wdc.com>)
 id 1iStWi-0006mL-BA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 01:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+wRhUlX1Ra64fSrhvyvMOAZwc5mvI7aAyffn/qFlc2M=; b=HVe8s/O16ryxIE1s+WbLZLwJ52
 +oRaT3APbvf7zRngypQ+ThVmGmy1ZD56wF6bmf/Lg7b0tLRSl8QVPR5DKgCzvQa8QZluIrSut0thC
 J1eT+w1S3FF/IDteL+fUG7bt6MX0qtW+YmpmJROCkZl/9DXh13jQ0UxbP00VV935VpoU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+wRhUlX1Ra64fSrhvyvMOAZwc5mvI7aAyffn/qFlc2M=; b=b5bYqJ3QK6oZNBXJIXLiV0JvIF
 re0mVbzTeCsxfgwu5y8sCYrLPMI7RuZjrNeyYXBfaUs/zpnua9BZUQlo/QUTCtbot7xBNOGBQzOcQ
 Ic386YYSGbOi8/+u8wsp4W+daVDtDyIu/aZyhom1eUnLzDAMu8h072g2sV2MRyZP6qHI=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iStWf-004Ptm-Rt
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 01:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573178288; x=1604714288;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=fojTwNWUfQUxrW9EjpaQ2ccUsK1Huk2B8sMfmws0/yk=;
 b=XhWP7cgpKH7WFng59dhgaN//EmlsSHDfCvNZv50IPbTuFl5VfrCIoCcj
 bud3BXRIqSGVqYz0swL7VMwLJgzKb6WEUYWD/GG5bBv1Jwo+7l2Mog2Dx
 PxorCQYtZr7MVT8ufugJx8sIBY9lWiAj5CSPsM1P8yKaukfZEYrpPyxfn
 oD2vh6VUZ5bXoAQlhpTRMiDytX5h6zRB3qxN3GOE8/x9C+KYphZsJnwuM
 7oTxR0fCH4JKxrPsWiKrLeRg1BbPvTrAGg+PF1L71/FPNY8ZeIKeRbhJl
 Nu4JIqOHUP9xm5svLvgzkuUxpeCMSw8QHzCXYUcu9yq3VZPCdgx3IRYPE A==;
IronPort-SDR: q0cEWI6cFDXZ+geNN0Ooyz+8CxaJyGXLaq3dZG8SEMcrWlK/dHuiVG32rQV2+m5cMP4BCe27CN
 4zwqVPHhjk9/E/LLD8HycHu3inj78YgIwMIKcAaLJYUIGLOvh7ydF4e7B82niyb3tTnO3EqUw5
 I1uHGfwnrEV1QHvxzwFi2t3fHRM+tx0nJNxjgXCUKz3fTT6A/Rlk03NJhBVEurpMtROhO3Kfbw
 loV5rejo4Evtk93e//zfnvP9kIzMobmLa2UfrX5126rF5z5XOr76EqNSm2X8L1kmgP6h59Z/Hd
 hCk=
X-IronPort-AV: E=Sophos;i="5.68,279,1569254400"; d="scan'208";a="223636919"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Nov 2019 09:57:59 +0800
IronPort-SDR: ctwgtEP3wb0FGojZHUmU8n9pGpnNuDJn27Y503i3pnvAdkobFlrrF6VHjUdKwz8iPDE93ie/N3
 /Y8JS3sQfs+LVFAyM6TpYJipjfvjujOeNFFHKhLDCWCkDB+AFhaoVKYUQ7L8vrpGA3F4+aApxh
 saSt7Zl40YxWx4eiRKWHBNgKRzCfvSQt1D+/ChEd7ngPprzKpbeyQ9Yea6Q+1wpXNWCXqceMA6
 fLGeJMFHp1ioihCLN+jCcXeqb7iKeqYiSdcm14LS1V7rNYxaIQPqoj+9adsIBR5us59WlqKbGv
 wt6+E4ajbfxRlre8DQTDgecA
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 17:52:29 -0800
IronPort-SDR: JZ9JqtpAtyOQSTuPZkWZHzG9bbbtt2UihSUp9oHqlRMJdVYXmhEiqU9sqM82PVkKYltJKtEiha
 SIZsrMrZplJ0vJzBfw/BONSPDASufUdlPFiVbE2s1jyuILjPL8uajROTGDa8kiwSNmQtsMwKxO
 drdfGq6n8toSDT4hIDaQv8hRnnQ1B78+zZiQqg5hW+qoDEaBmhk02xe+aH34Da6xjIX7Kk9B7j
 +Xt+AIrkvJ3REXvcSv4jfuHCvqv909mATtGKulLW5CGxe8WyYl4VIu12mIKrlHz9Qb8PO6sNv6
 wew=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2019 17:57:18 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, dm-devel@redhat.com,
 Mike Snitzer <snitzer@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Fri,  8 Nov 2019 10:57:02 +0900
Message-Id: <20191108015702.233102-10-damien.lemoal@wdc.com>
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
 for more information. [URIs: lst.de]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iStWf-004Ptm-Rt
Subject: [f2fs-dev] [PATCH 9/9] block: rework zone reporting
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

From: Christoph Hellwig <hch@lst.de>

Avoid the need to allocate a potentially large array of struct blk_zone
in the block layer by switching the ->report_zones method interface to
a callback model. Now the caller simply supplies a callback that is
executed on each reported zone, and private data for it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 block/blk-zoned.c              | 253 +++++++++++++--------------------
 drivers/block/null_blk.h       |   2 +-
 drivers/block/null_blk_zoned.c |  31 ++--
 drivers/md/dm-flakey.c         |  18 +--
 drivers/md/dm-linear.c         |  20 +--
 drivers/md/dm-zoned-metadata.c | 131 +++++++----------
 drivers/md/dm.c                | 121 +++++++---------
 drivers/scsi/sd.h              |   4 +-
 drivers/scsi/sd_zbc.c          | 106 +++++++-------
 fs/f2fs/super.c                |  51 +++----
 include/linux/blkdev.h         |  15 +-
 include/linux/device-mapper.h  |  24 +++-
 12 files changed, 329 insertions(+), 447 deletions(-)

diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index ae665e490858..6fad6f3f6980 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -101,44 +101,35 @@ EXPORT_SYMBOL_GPL(blkdev_nr_zones);
  * blkdev_report_zones - Get zones information
  * @bdev:	Target block device
  * @sector:	Sector from which to report zones
- * @zones:	Array of zone structures where to return the zones information
- * @nr_zones:	Number of zone structures in the zone array
+ * @nr_zones:	Maximum number of zones to report
+ * @cb:		Callback function called for each reported zone
+ * @data:	Private data for the callback
  *
  * Description:
- *    Get zone information starting from the zone containing @sector.
- *    The number of zone information reported may be less than the number
- *    requested by @nr_zones. The number of zones actually reported is
- *    returned in @nr_zones.
- *    The caller must use memalloc_noXX_save/restore() calls to control
- *    memory allocations done within this function (zone array and command
- *    buffer allocation by the device driver).
+ *    Get zone information starting from the zone containing @sector for at most
+ *    @nr_zones, and call @cb for each zone reported by the device.
+ *    To report all zones in a device starting from @sector, the BLK_ALL_ZONES
+ *    constant can be passed to @nr_zones.
+ *    Returns the number of zones reported by the device, or a negative errno
+ *    value in case of failure.
+ *
+ *    Note: The caller must use memalloc_noXX_save/restore() calls to control
+ *    memory allocations done within this function.
  */
 int blkdev_report_zones(struct block_device *bdev, sector_t sector,
-			struct blk_zone *zones, unsigned int *nr_zones)
+			unsigned int nr_zones, report_zones_cb cb, void *data)
 {
-	struct request_queue *q = bdev_get_queue(bdev);
 	struct gendisk *disk = bdev->bd_disk;
 	sector_t capacity = get_capacity(disk);
 
-	if (!blk_queue_is_zoned(q))
-		return -EOPNOTSUPP;
-
-	/*
-	 * A block device that advertized itself as zoned must have a
-	 * report_zones method. If it does not have one defined, the device
-	 * driver has a bug. So warn about that.
-	 */
-	if (WARN_ON_ONCE(!disk->fops->report_zones))
+	if (!blk_queue_is_zoned(bdev_get_queue(bdev)) ||
+	    WARN_ON_ONCE(!disk->fops->report_zones))
 		return -EOPNOTSUPP;
 
-	if (!*nr_zones || sector >= capacity) {
-		*nr_zones = 0;
+	if (!nr_zones || sector >= capacity)
 		return 0;
-	}
 
-	*nr_zones = min(*nr_zones, __blkdev_nr_zones(q, capacity - sector));
-
-	return disk->fops->report_zones(disk, sector, zones, nr_zones);
+	return disk->fops->report_zones(disk, sector, nr_zones, cb, data);
 }
 EXPORT_SYMBOL_GPL(blkdev_report_zones);
 
@@ -232,6 +223,20 @@ int blkdev_zone_mgmt(struct block_device *bdev, enum req_opf op,
 }
 EXPORT_SYMBOL_GPL(blkdev_zone_mgmt);
 
+struct zone_report_args {
+	struct blk_zone __user *zones;
+};
+
+static int blkdev_copy_zone_to_user(struct blk_zone *zone, unsigned int idx,
+				    void *data)
+{
+	struct zone_report_args *args = data;
+
+	if (copy_to_user(&args->zones[idx], zone, sizeof(struct blk_zone)))
+		return -EFAULT;
+	return 0;
+}
+
 /*
  * BLKREPORTZONE ioctl processing.
  * Called from blkdev_ioctl.
@@ -240,9 +245,9 @@ int blkdev_report_zones_ioctl(struct block_device *bdev, fmode_t mode,
 			      unsigned int cmd, unsigned long arg)
 {
 	void __user *argp = (void __user *)arg;
+	struct zone_report_args args;
 	struct request_queue *q;
 	struct blk_zone_report rep;
-	struct blk_zone *zones;
 	int ret;
 
 	if (!argp)
@@ -264,32 +269,16 @@ int blkdev_report_zones_ioctl(struct block_device *bdev, fmode_t mode,
 	if (!rep.nr_zones)
 		return -EINVAL;
 
-	rep.nr_zones = min(blkdev_nr_zones(bdev), rep.nr_zones);
-
-	zones = kvmalloc_array(rep.nr_zones, sizeof(struct blk_zone),
-			       GFP_KERNEL | __GFP_ZERO);
-	if (!zones)
-		return -ENOMEM;
-
-	ret = blkdev_report_zones(bdev, rep.sector, zones, &rep.nr_zones);
-	if (ret)
-		goto out;
-
-	if (copy_to_user(argp, &rep, sizeof(struct blk_zone_report))) {
-		ret = -EFAULT;
-		goto out;
-	}
-
-	if (rep.nr_zones) {
-		if (copy_to_user(argp + sizeof(struct blk_zone_report), zones,
-				 sizeof(struct blk_zone) * rep.nr_zones))
-			ret = -EFAULT;
-	}
+	args.zones = argp + sizeof(struct blk_zone_report);
+	ret = blkdev_report_zones(bdev, rep.sector, rep.nr_zones,
+				  blkdev_copy_zone_to_user, &args);
+	if (ret < 0)
+		return ret;
 
- out:
-	kvfree(zones);
-
-	return ret;
+	rep.nr_zones = ret;
+	if (copy_to_user(argp, &rep, sizeof(struct blk_zone_report)))
+		return -EFAULT;
+	return 0;
 }
 
 /*
@@ -351,31 +340,6 @@ static inline unsigned long *blk_alloc_zone_bitmap(int node,
 			    GFP_NOIO, node);
 }
 
-/*
- * Allocate an array of struct blk_zone to get nr_zones zone information.
- * The allocated array may be smaller than nr_zones.
- */
-static struct blk_zone *blk_alloc_zones(unsigned int *nr_zones)
-{
-	struct blk_zone *zones;
-	size_t nrz = min(*nr_zones, BLK_ZONED_REPORT_MAX_ZONES);
-
-	/*
-	 * GFP_KERNEL here is meaningless as the caller task context has
-	 * the PF_MEMALLOC_NOIO flag set in blk_revalidate_disk_zones()
-	 * with memalloc_noio_save().
-	 */
-	zones = kvcalloc(nrz, sizeof(struct blk_zone), GFP_KERNEL);
-	if (!zones) {
-		*nr_zones = 0;
-		return NULL;
-	}
-
-	*nr_zones = nrz;
-
-	return zones;
-}
-
 void blk_queue_free_zone_bitmaps(struct request_queue *q)
 {
 	kfree(q->seq_zones_bitmap);
@@ -384,12 +348,21 @@ void blk_queue_free_zone_bitmaps(struct request_queue *q)
 	q->seq_zones_wlock = NULL;
 }
 
+struct blk_revalidate_zone_args {
+	struct gendisk	*disk;
+	unsigned long	*seq_zones_bitmap;
+	unsigned long	*seq_zones_wlock;
+	sector_t	sector;
+};
+
 /*
  * Helper function to check the validity of zones of a zoned block device.
  */
-static bool blk_zone_valid(struct gendisk *disk, struct blk_zone *zone,
-			   sector_t *sector)
+static int blk_revalidate_zone_cb(struct blk_zone *zone, unsigned int idx,
+				  void *data)
 {
+	struct blk_revalidate_zone_args *args = data;
+	struct gendisk *disk = args->disk;
 	struct request_queue *q = disk->queue;
 	sector_t zone_sectors = blk_queue_zone_sectors(q);
 	sector_t capacity = get_capacity(disk);
@@ -409,14 +382,14 @@ static bool blk_zone_valid(struct gendisk *disk, struct blk_zone *zone,
 	    zone->len > zone_sectors) {
 		pr_warn("%s: Invalid zoned device with larger last zone size\n",
 			disk->disk_name);
-		return false;
+		return -ENODEV;
 	}
 
 	/* Check for holes in the zone report */
-	if (zone->start != *sector) {
+	if (zone->start != args->sector) {
 		pr_warn("%s: Zone gap at sectors %llu..%llu\n",
-			disk->disk_name, *sector, zone->start);
-		return false;
+			disk->disk_name, args->sector, zone->start);
+		return -ENODEV;
 	}
 
 	/* Check zone type */
@@ -428,12 +401,38 @@ static bool blk_zone_valid(struct gendisk *disk, struct blk_zone *zone,
 	default:
 		pr_warn("%s: Invalid zone type 0x%x at sectors %llu\n",
 			disk->disk_name, (int)zone->type, zone->start);
-		return false;
+		return -ENODEV;
 	}
 
-	*sector += zone->len;
+	if (zone->type != BLK_ZONE_TYPE_CONVENTIONAL)
+		set_bit(idx, args->seq_zones_bitmap);
 
-	return true;
+	args->sector += zone->len;
+	return 0;
+}
+
+static int blk_update_zone_info(struct gendisk *disk, unsigned int nr_zones,
+				struct blk_revalidate_zone_args *args)
+{
+	/*
+	 * Ensure that all memory allocations in this context are done as
+	 * if GFP_NOIO was specified.
+	 */
+	unsigned int noio_flag = memalloc_noio_save();
+	struct request_queue *q = disk->queue;
+	int ret;
+
+	args->seq_zones_wlock = blk_alloc_zone_bitmap(q->node, nr_zones);
+	if (!args->seq_zones_wlock)
+		return -ENOMEM;
+	args->seq_zones_bitmap = blk_alloc_zone_bitmap(q->node, nr_zones);
+	if (!args->seq_zones_bitmap)
+		return -ENOMEM;
+
+	ret = disk->fops->report_zones(disk, 0, nr_zones,
+				       blk_revalidate_zone_cb, args);
+	memalloc_noio_restore(noio_flag);
+	return ret;
 }
 
 /**
@@ -449,11 +448,7 @@ int blk_revalidate_disk_zones(struct gendisk *disk)
 {
 	struct request_queue *q = disk->queue;
 	unsigned int nr_zones = __blkdev_nr_zones(q, get_capacity(disk));
-	unsigned long *seq_zones_wlock = NULL, *seq_zones_bitmap = NULL;
-	unsigned int i, rep_nr_zones = 0, z = 0, nrz;
-	struct blk_zone *zones = NULL;
-	unsigned int noio_flag;
-	sector_t sector = 0;
+	struct blk_revalidate_zone_args args = { .disk = disk };
 	int ret = 0;
 
 	if (WARN_ON_ONCE(!blk_queue_is_zoned(q)))
@@ -468,82 +463,28 @@ int blk_revalidate_disk_zones(struct gendisk *disk)
 		return 0;
 	}
 
-	/*
-	 * Ensure that all memory allocations in this context are done as
-	 * if GFP_NOIO was specified.
-	 */
-	noio_flag = memalloc_noio_save();
-
-	if (!nr_zones)
-		goto update;
-
-	/* Allocate bitmaps */
-	ret = -ENOMEM;
-	seq_zones_wlock = blk_alloc_zone_bitmap(q->node, nr_zones);
-	if (!seq_zones_wlock)
-		goto out;
-	seq_zones_bitmap = blk_alloc_zone_bitmap(q->node, nr_zones);
-	if (!seq_zones_bitmap)
-		goto out;
-
-	/*
-	 * Get zone information to check the zones and initialize
-	 * seq_zones_bitmap.
-	 */
-	rep_nr_zones = nr_zones;
-	zones = blk_alloc_zones(&rep_nr_zones);
-	if (!zones)
-		goto out;
-
-	while (z < nr_zones) {
-		nrz = min(nr_zones - z, rep_nr_zones);
-		ret = disk->fops->report_zones(disk, sector, zones, &nrz);
-		if (ret)
-			goto out;
-		if (!nrz)
-			break;
-		for (i = 0; i < nrz; i++) {
-			if (!blk_zone_valid(disk, &zones[i], &sector)) {
-				ret = -ENODEV;
-				goto out;
-			}
-			if (zones[i].type != BLK_ZONE_TYPE_CONVENTIONAL)
-				set_bit(z, seq_zones_bitmap);
-			z++;
-		}
-	}
-
-	if (WARN_ON(z != nr_zones)) {
-		ret = -EIO;
-		goto out;
-	}
+	if (nr_zones)
+		ret = blk_update_zone_info(disk, nr_zones, &args);
 
-update:
 	/*
 	 * Install the new bitmaps, making sure the queue is stopped and
 	 * all I/Os are completed (i.e. a scheduler is not referencing the
 	 * bitmaps).
 	 */
 	blk_mq_freeze_queue(q);
-	q->nr_zones = nr_zones;
-	swap(q->seq_zones_wlock, seq_zones_wlock);
-	swap(q->seq_zones_bitmap, seq_zones_bitmap);
-	blk_mq_unfreeze_queue(q);
-
-out:
-	memalloc_noio_restore(noio_flag);
-
-	kvfree(zones);
-	kfree(seq_zones_wlock);
-	kfree(seq_zones_bitmap);
-
-	if (ret) {
+	if (ret >= 0) {
+		q->nr_zones = nr_zones;
+		swap(q->seq_zones_wlock, args.seq_zones_wlock);
+		swap(q->seq_zones_bitmap, args.seq_zones_bitmap);
+		ret = 0;
+	} else {
 		pr_warn("%s: failed to revalidate zones\n", disk->disk_name);
-		blk_mq_freeze_queue(q);
 		blk_queue_free_zone_bitmaps(q);
-		blk_mq_unfreeze_queue(q);
 	}
+	blk_mq_unfreeze_queue(q);
 
+	kfree(args.seq_zones_wlock);
+	kfree(args.seq_zones_bitmap);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(blk_revalidate_disk_zones);
diff --git a/drivers/block/null_blk.h b/drivers/block/null_blk.h
index 9bf56fbab091..bc837862b767 100644
--- a/drivers/block/null_blk.h
+++ b/drivers/block/null_blk.h
@@ -92,7 +92,7 @@ struct nullb {
 int null_zone_init(struct nullb_device *dev);
 void null_zone_exit(struct nullb_device *dev);
 int null_report_zones(struct gendisk *disk, sector_t sector,
-		      struct blk_zone *zones, unsigned int *nr_zones);
+		      unsigned int nr_zones, report_zones_cb cb, void *data);
 blk_status_t null_handle_zoned(struct nullb_cmd *cmd,
 				enum req_opf op, sector_t sector,
 				sector_t nr_sectors);
diff --git a/drivers/block/null_blk_zoned.c b/drivers/block/null_blk_zoned.c
index 00696f16664b..d4d88b581822 100644
--- a/drivers/block/null_blk_zoned.c
+++ b/drivers/block/null_blk_zoned.c
@@ -67,21 +67,34 @@ void null_zone_exit(struct nullb_device *dev)
 }
 
 int null_report_zones(struct gendisk *disk, sector_t sector,
-		      struct blk_zone *zones, unsigned int *nr_zones)
+		unsigned int nr_zones, report_zones_cb cb, void *data)
 {
 	struct nullb *nullb = disk->private_data;
 	struct nullb_device *dev = nullb->dev;
-	unsigned int zno, nrz = 0;
+	unsigned int first_zone, i;
+	struct blk_zone zone;
+	int error;
 
-	zno = null_zone_no(dev, sector);
-	if (zno < dev->nr_zones) {
-		nrz = min_t(unsigned int, *nr_zones, dev->nr_zones - zno);
-		memcpy(zones, &dev->zones[zno], nrz * sizeof(struct blk_zone));
-	}
+	first_zone = null_zone_no(dev, sector);
+	if (first_zone >= dev->nr_zones)
+		return 0;
 
-	*nr_zones = nrz;
+	nr_zones = min(nr_zones, dev->nr_zones - first_zone);
+	for (i = 0; i < nr_zones; i++) {
+		/*
+		 * Stacked DM target drivers will remap the zone information by
+		 * modifying the zone information passed to the report callback.
+		 * So use a local copy to avoid corruption of the device zone
+		 * array.
+		 */
+		memcpy(&zone, &dev->zones[first_zone + i],
+		       sizeof(struct blk_zone));
+		error = cb(&zone, i, data);
+		if (error)
+			return error;
+	}
 
-	return 0;
+	return nr_zones;
 }
 
 size_t null_zone_valid_read_len(struct nullb *nullb,
diff --git a/drivers/md/dm-flakey.c b/drivers/md/dm-flakey.c
index 76587e9af0ef..a2cc9e45cbba 100644
--- a/drivers/md/dm-flakey.c
+++ b/drivers/md/dm-flakey.c
@@ -459,21 +459,15 @@ static int flakey_prepare_ioctl(struct dm_target *ti, struct block_device **bdev
 }
 
 #ifdef CONFIG_BLK_DEV_ZONED
-static int flakey_report_zones(struct dm_target *ti, sector_t sector,
-			       struct blk_zone *zones, unsigned int *nr_zones)
+static int flakey_report_zones(struct dm_target *ti,
+		struct dm_report_zones_args *args, unsigned int nr_zones)
 {
 	struct flakey_c *fc = ti->private;
-	int ret;
+	sector_t sector = flakey_map_sector(ti, args->next_sector);
 
-	/* Do report and remap it */
-	ret = blkdev_report_zones(fc->dev->bdev, flakey_map_sector(ti, sector),
-				  zones, nr_zones);
-	if (ret != 0)
-		return ret;
-
-	if (*nr_zones)
-		dm_remap_zone_report(ti, fc->start, zones, nr_zones);
-	return 0;
+	args->start = fc->start;
+	return blkdev_report_zones(fc->dev->bdev, sector, nr_zones,
+				   dm_report_zones_cb, args);
 }
 #endif
 
diff --git a/drivers/md/dm-linear.c b/drivers/md/dm-linear.c
index 97acafd48c85..8d07fdf63a47 100644
--- a/drivers/md/dm-linear.c
+++ b/drivers/md/dm-linear.c
@@ -136,21 +136,15 @@ static int linear_prepare_ioctl(struct dm_target *ti, struct block_device **bdev
 }
 
 #ifdef CONFIG_BLK_DEV_ZONED
-static int linear_report_zones(struct dm_target *ti, sector_t sector,
-			       struct blk_zone *zones, unsigned int *nr_zones)
+static int linear_report_zones(struct dm_target *ti,
+		struct dm_report_zones_args *args, unsigned int nr_zones)
 {
-	struct linear_c *lc = (struct linear_c *) ti->private;
-	int ret;
-
-	/* Do report and remap it */
-	ret = blkdev_report_zones(lc->dev->bdev, linear_map_sector(ti, sector),
-				  zones, nr_zones);
-	if (ret != 0)
-		return ret;
+	struct linear_c *lc = ti->private;
+	sector_t sector = linear_map_sector(ti, args->next_sector);
 
-	if (*nr_zones)
-		dm_remap_zone_report(ti, lc->start, zones, nr_zones);
-	return 0;
+	args->start = lc->start;
+	return blkdev_report_zones(lc->dev->bdev, sector, nr_zones,
+				   dm_report_zones_cb, args);
 }
 #endif
 
diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index feb4718ce6a6..069e4675da6b 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1080,9 +1080,10 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
 /*
  * Initialize a zone descriptor.
  */
-static int dmz_init_zone(struct dmz_metadata *zmd, struct dm_zone *zone,
-			 struct blk_zone *blkz)
+static int dmz_init_zone(struct blk_zone *blkz, unsigned int idx, void *data)
 {
+	struct dmz_metadata *zmd = data;
+	struct dm_zone *zone = &zmd->zones[idx];
 	struct dmz_dev *dev = zmd->dev;
 
 	/* Ignore the eventual last runt (smaller) zone */
@@ -1096,26 +1097,29 @@ static int dmz_init_zone(struct dmz_metadata *zmd, struct dm_zone *zone,
 	atomic_set(&zone->refcount, 0);
 	zone->chunk = DMZ_MAP_UNMAPPED;
 
-	if (blkz->type == BLK_ZONE_TYPE_CONVENTIONAL) {
+	switch (blkz->type) {
+	case BLK_ZONE_TYPE_CONVENTIONAL:
 		set_bit(DMZ_RND, &zone->flags);
 		zmd->nr_rnd_zones++;
-	} else if (blkz->type == BLK_ZONE_TYPE_SEQWRITE_REQ ||
-		   blkz->type == BLK_ZONE_TYPE_SEQWRITE_PREF) {
+		break;
+	case BLK_ZONE_TYPE_SEQWRITE_REQ:
+	case BLK_ZONE_TYPE_SEQWRITE_PREF:
 		set_bit(DMZ_SEQ, &zone->flags);
-	} else
+		break;
+	default:
 		return -ENXIO;
-
-	if (blkz->cond == BLK_ZONE_COND_OFFLINE)
-		set_bit(DMZ_OFFLINE, &zone->flags);
-	else if (blkz->cond == BLK_ZONE_COND_READONLY)
-		set_bit(DMZ_READ_ONLY, &zone->flags);
+	}
 
 	if (dmz_is_rnd(zone))
 		zone->wp_block = 0;
 	else
 		zone->wp_block = dmz_sect2blk(blkz->wp - blkz->start);
 
-	if (!dmz_is_offline(zone) && !dmz_is_readonly(zone)) {
+	if (blkz->cond == BLK_ZONE_COND_OFFLINE)
+		set_bit(DMZ_OFFLINE, &zone->flags);
+	else if (blkz->cond == BLK_ZONE_COND_READONLY)
+		set_bit(DMZ_READ_ONLY, &zone->flags);
+	else {
 		zmd->nr_useable_zones++;
 		if (dmz_is_rnd(zone)) {
 			zmd->nr_rnd_zones++;
@@ -1138,12 +1142,6 @@ static void dmz_drop_zones(struct dmz_metadata *zmd)
 	zmd->zones = NULL;
 }
 
-/*
- * The size of a zone report in number of zones.
- * This results in 4096*64B=256KB report zones commands.
- */
-#define DMZ_REPORT_NR_ZONES	4096
-
 /*
  * Allocate and initialize zone descriptors using the zone
  * information from disk.
@@ -1151,11 +1149,7 @@ static void dmz_drop_zones(struct dmz_metadata *zmd)
 static int dmz_init_zones(struct dmz_metadata *zmd)
 {
 	struct dmz_dev *dev = zmd->dev;
-	struct dm_zone *zone;
-	struct blk_zone *blkz;
-	unsigned int nr_blkz;
-	sector_t sector = 0;
-	int i, ret = 0;
+	int ret;
 
 	/* Init */
 	zmd->zone_bitmap_size = dev->zone_nr_blocks >> 3;
@@ -1169,54 +1163,38 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
 	dmz_dev_info(dev, "Using %zu B for zone information",
 		     sizeof(struct dm_zone) * dev->nr_zones);
 
-	/* Get zone information */
-	nr_blkz = DMZ_REPORT_NR_ZONES;
-	blkz = kcalloc(nr_blkz, sizeof(struct blk_zone), GFP_KERNEL);
-	if (!blkz) {
-		ret = -ENOMEM;
-		goto out;
-	}
-
 	/*
-	 * Get zone information and initialize zone descriptors.
-	 * At the same time, determine where the super block
-	 * should be: first block of the first randomly writable
-	 * zone.
+	 * Get zone information and initialize zone descriptors.  At the same
+	 * time, determine where the super block should be: first block of the
+	 * first randomly writable zone.
 	 */
-	zone = zmd->zones;
-	while (sector < dev->capacity) {
-		/* Get zone information */
-		nr_blkz = DMZ_REPORT_NR_ZONES;
-		ret = blkdev_report_zones(dev->bdev, sector, blkz, &nr_blkz);
-		if (ret) {
-			dmz_dev_err(dev, "Report zones failed %d", ret);
-			goto out;
-		}
+	ret = blkdev_report_zones(dev->bdev, 0, BLK_ALL_ZONES, dmz_init_zone,
+				  zmd);
+	if (ret < 0) {
+		dmz_drop_zones(zmd);
+		return ret;
+	}
 
-		if (!nr_blkz)
-			break;
+	return 0;
+}
 
-		/* Process report */
-		for (i = 0; i < nr_blkz; i++) {
-			ret = dmz_init_zone(zmd, zone, &blkz[i]);
-			if (ret)
-				goto out;
-			sector += dev->zone_nr_sectors;
-			zone++;
-		}
-	}
+static int dmz_update_zone_cb(struct blk_zone *blkz, unsigned int idx,
+			      void *data)
+{
+	struct dm_zone *zone = data;
 
-	/* The entire zone configuration of the disk should now be known */
-	if (sector < dev->capacity) {
-		dmz_dev_err(dev, "Failed to get correct zone information");
-		ret = -ENXIO;
-	}
-out:
-	kfree(blkz);
-	if (ret)
-		dmz_drop_zones(zmd);
+	clear_bit(DMZ_OFFLINE, &zone->flags);
+	clear_bit(DMZ_READ_ONLY, &zone->flags);
+	if (blkz->cond == BLK_ZONE_COND_OFFLINE)
+		set_bit(DMZ_OFFLINE, &zone->flags);
+	else if (blkz->cond == BLK_ZONE_COND_READONLY)
+		set_bit(DMZ_READ_ONLY, &zone->flags);
 
-	return ret;
+	if (dmz_is_seq(zone))
+		zone->wp_block = dmz_sect2blk(blkz->wp - blkz->start);
+	else
+		zone->wp_block = 0;
+	return 0;
 }
 
 /*
@@ -1224,9 +1202,7 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
  */
 static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 {
-	unsigned int nr_blkz = 1;
 	unsigned int noio_flag;
-	struct blk_zone blkz;
 	int ret;
 
 	/*
@@ -1236,29 +1212,18 @@ static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 	 * GFP_NOIO was specified.
 	 */
 	noio_flag = memalloc_noio_save();
-	ret = blkdev_report_zones(zmd->dev->bdev, dmz_start_sect(zmd, zone),
-				  &blkz, &nr_blkz);
+	ret = blkdev_report_zones(zmd->dev->bdev, dmz_start_sect(zmd, zone), 1,
+				  dmz_update_zone_cb, zone);
 	memalloc_noio_restore(noio_flag);
-	if (!nr_blkz)
+
+	if (ret == 0)
 		ret = -EIO;
-	if (ret) {
+	if (ret < 0) {
 		dmz_dev_err(zmd->dev, "Get zone %u report failed",
 			    dmz_id(zmd, zone));
 		return ret;
 	}
 
-	clear_bit(DMZ_OFFLINE, &zone->flags);
-	clear_bit(DMZ_READ_ONLY, &zone->flags);
-	if (blkz.cond == BLK_ZONE_COND_OFFLINE)
-		set_bit(DMZ_OFFLINE, &zone->flags);
-	else if (blkz.cond == BLK_ZONE_COND_READONLY)
-		set_bit(DMZ_READ_ONLY, &zone->flags);
-
-	if (dmz_is_seq(zone))
-		zone->wp_block = dmz_sect2blk(blkz.wp - blkz.start);
-	else
-		zone->wp_block = 0;
-
 	return 0;
 }
 
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 76f4cfdd6b41..e8f9661a10a1 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -440,14 +440,48 @@ static int dm_blk_getgeo(struct block_device *bdev, struct hd_geometry *geo)
 	return dm_get_geometry(md, geo);
 }
 
+#ifdef CONFIG_BLK_DEV_ZONED
+int dm_report_zones_cb(struct blk_zone *zone, unsigned int idx, void *data)
+{
+	struct dm_report_zones_args *args = data;
+	sector_t sector_diff = args->tgt->begin - args->start;
+
+	/*
+	 * Ignore zones beyond the target range.
+	 */
+	if (zone->start >= args->start + args->tgt->len)
+		return 0;
+
+	/*
+	 * Remap the start sector and write pointer position of the zone
+	 * to match its position in the target range.
+	 */
+	zone->start += sector_diff;
+	if (zone->type != BLK_ZONE_TYPE_CONVENTIONAL) {
+		if (zone->cond == BLK_ZONE_COND_FULL)
+			zone->wp = zone->start + zone->len;
+		else if (zone->cond == BLK_ZONE_COND_EMPTY)
+			zone->wp = zone->start;
+		else
+			zone->wp += sector_diff;
+	}
+
+	args->next_sector = zone->start + zone->len;
+	return args->orig_cb(zone, args->zone_idx++, args->orig_data);
+}
+EXPORT_SYMBOL_GPL(dm_report_zones_cb);
+
 static int dm_blk_report_zones(struct gendisk *disk, sector_t sector,
-			       struct blk_zone *zones, unsigned int *nr_zones)
+		unsigned int nr_zones, report_zones_cb cb, void *data)
 {
-#ifdef CONFIG_BLK_DEV_ZONED
 	struct mapped_device *md = disk->private_data;
-	struct dm_target *tgt;
 	struct dm_table *map;
 	int srcu_idx, ret;
+	struct dm_report_zones_args args = {
+		.next_sector = sector,
+		.orig_data = data,
+		.orig_cb = cb,
+	};
 
 	if (dm_suspended_md(md))
 		return -EAGAIN;
@@ -456,32 +490,30 @@ static int dm_blk_report_zones(struct gendisk *disk, sector_t sector,
 	if (!map)
 		return -EIO;
 
-	tgt = dm_table_find_target(map, sector);
-	if (!tgt) {
-		ret = -EIO;
-		goto out;
-	}
+	do {
+		struct dm_target *tgt;
 
-	/*
-	 * If we are executing this, we already know that the block device
-	 * is a zoned device and so each target should have support for that
-	 * type of drive. A missing report_zones method means that the target
-	 * driver has a problem.
-	 */
-	if (WARN_ON(!tgt->type->report_zones)) {
-		ret = -EIO;
-		goto out;
-	}
+		tgt = dm_table_find_target(map, args.next_sector);
+		if (WARN_ON_ONCE(!tgt->type->report_zones)) {
+			ret = -EIO;
+			goto out;
+		}
 
-	ret = tgt->type->report_zones(tgt, sector, zones, nr_zones);
+		args.tgt = tgt;
+		ret = tgt->type->report_zones(tgt, &args, nr_zones);
+		if (ret < 0)
+			goto out;
+	} while (args.zone_idx < nr_zones &&
+		 args.next_sector < get_capacity(disk));
 
+	ret = args.zone_idx;
 out:
 	dm_put_live_table(md, srcu_idx);
 	return ret;
-#else
-	return -ENOTSUPP;
-#endif
 }
+#else
+#define dm_blk_report_zones		NULL
+#endif /* CONFIG_BLK_DEV_ZONED */
 
 static int dm_prepare_ioctl(struct mapped_device *md, int *srcu_idx,
 			    struct block_device **bdev)
@@ -1207,51 +1239,6 @@ void dm_accept_partial_bio(struct bio *bio, unsigned n_sectors)
 }
 EXPORT_SYMBOL_GPL(dm_accept_partial_bio);
 
-/*
- * The zone descriptors obtained with a zone report indicate
- * zone positions within the underlying device of the target. The zone
- * descriptors must be remapped to match their position within the dm device.
- */
-void dm_remap_zone_report(struct dm_target *ti, sector_t start,
-			  struct blk_zone *zones, unsigned int *nr_zones)
-{
-#ifdef CONFIG_BLK_DEV_ZONED
-	struct blk_zone *zone;
-	unsigned int nrz = *nr_zones;
-	int i;
-
-	/*
-	 * Remap the start sector and write pointer position of the zones in
-	 * the array. Since we may have obtained from the target underlying
-	 * device more zones that the target size, also adjust the number
-	 * of zones.
-	 */
-	for (i = 0; i < nrz; i++) {
-		zone = zones + i;
-		if (zone->start >= start + ti->len) {
-			memset(zone, 0, sizeof(struct blk_zone) * (nrz - i));
-			break;
-		}
-
-		zone->start = zone->start + ti->begin - start;
-		if (zone->type == BLK_ZONE_TYPE_CONVENTIONAL)
-			continue;
-
-		if (zone->cond == BLK_ZONE_COND_FULL)
-			zone->wp = zone->start + zone->len;
-		else if (zone->cond == BLK_ZONE_COND_EMPTY)
-			zone->wp = zone->start;
-		else
-			zone->wp = zone->wp + ti->begin - start;
-	}
-
-	*nr_zones = i;
-#else /* !CONFIG_BLK_DEV_ZONED */
-	*nr_zones = 0;
-#endif
-}
-EXPORT_SYMBOL_GPL(dm_remap_zone_report);
-
 static blk_qc_t __map_bio(struct dm_target_io *tio)
 {
 	int r;
diff --git a/drivers/scsi/sd.h b/drivers/scsi/sd.h
index bf2102a749bc..42fd3f00e4a5 100644
--- a/drivers/scsi/sd.h
+++ b/drivers/scsi/sd.h
@@ -213,8 +213,8 @@ blk_status_t sd_zbc_setup_zone_mgmt_cmnd(struct scsi_cmnd *cmd,
 					 unsigned char op, bool all);
 extern void sd_zbc_complete(struct scsi_cmnd *cmd, unsigned int good_bytes,
 			    struct scsi_sense_hdr *sshdr);
-extern int sd_zbc_report_zones(struct gendisk *disk, sector_t sector,
-			       struct blk_zone *zones, unsigned int *nr_zones);
+int sd_zbc_report_zones(struct gendisk *disk, sector_t sector,
+		unsigned int nr_zones, report_zones_cb cb, void *data);
 
 #else /* CONFIG_BLK_DEV_ZONED */
 
diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
index f191af15de1b..62b908aa1d21 100644
--- a/drivers/scsi/sd_zbc.c
+++ b/drivers/scsi/sd_zbc.c
@@ -19,34 +19,27 @@
 
 #include "sd.h"
 
-/**
- * sd_zbc_parse_report - Convert a zone descriptor to a struct blk_zone,
- * @sdkp: The disk the report originated from
- * @buf: Address of the report zone descriptor
- * @zone: the destination zone structure
- *
- * All LBA sized values are converted to 512B sectors unit.
- */
-static void sd_zbc_parse_report(struct scsi_disk *sdkp, u8 *buf,
-				struct blk_zone *zone)
+static int sd_zbc_parse_report(struct scsi_disk *sdkp, u8 *buf,
+			       unsigned int idx, report_zones_cb cb, void *data)
 {
 	struct scsi_device *sdp = sdkp->device;
+	struct blk_zone zone = { 0 };
 
-	memset(zone, 0, sizeof(struct blk_zone));
-
-	zone->type = buf[0] & 0x0f;
-	zone->cond = (buf[1] >> 4) & 0xf;
+	zone.type = buf[0] & 0x0f;
+	zone.cond = (buf[1] >> 4) & 0xf;
 	if (buf[1] & 0x01)
-		zone->reset = 1;
+		zone.reset = 1;
 	if (buf[1] & 0x02)
-		zone->non_seq = 1;
-
-	zone->len = logical_to_sectors(sdp, get_unaligned_be64(&buf[8]));
-	zone->start = logical_to_sectors(sdp, get_unaligned_be64(&buf[16]));
-	zone->wp = logical_to_sectors(sdp, get_unaligned_be64(&buf[24]));
-	if (zone->type != ZBC_ZONE_TYPE_CONV &&
-	    zone->cond == ZBC_ZONE_COND_FULL)
-		zone->wp = zone->start + zone->len;
+		zone.non_seq = 1;
+
+	zone.len = logical_to_sectors(sdp, get_unaligned_be64(&buf[8]));
+	zone.start = logical_to_sectors(sdp, get_unaligned_be64(&buf[16]));
+	zone.wp = logical_to_sectors(sdp, get_unaligned_be64(&buf[24]));
+	if (zone.type != ZBC_ZONE_TYPE_CONV &&
+	    zone.cond == ZBC_ZONE_COND_FULL)
+		zone.wp = zone.start + zone.len;
+
+	return cb(&zone, idx, data);
 }
 
 /**
@@ -152,60 +145,61 @@ static void *sd_zbc_alloc_report_buffer(struct scsi_disk *sdkp,
 }
 
 /**
- * sd_zbc_report_zones - Disk report zones operation.
- * @disk: The target disk
- * @sector: Start 512B sector of the report
- * @zones: Array of zone descriptors
- * @nr_zones: Number of descriptors in the array
- *
- * Execute a report zones command on the target disk.
+ * sd_zbc_zone_sectors - Get the device zone size in number of 512B sectors.
+ * @sdkp: The target disk
  */
+static inline sector_t sd_zbc_zone_sectors(struct scsi_disk *sdkp)
+{
+	return logical_to_sectors(sdkp->device, sdkp->zone_blocks);
+}
+
 int sd_zbc_report_zones(struct gendisk *disk, sector_t sector,
-			struct blk_zone *zones, unsigned int *nr_zones)
+			unsigned int nr_zones, report_zones_cb cb, void *data)
 {
 	struct scsi_disk *sdkp = scsi_disk(disk);
-	unsigned int i, nrz = *nr_zones;
+	unsigned int nr, i;
 	unsigned char *buf;
-	size_t buflen = 0, offset = 0;
-	int ret = 0;
+	size_t offset, buflen = 0;
+	int zone_idx = 0;
+	int ret;
 
 	if (!sd_is_zoned(sdkp))
 		/* Not a zoned device */
 		return -EOPNOTSUPP;
 
-	buf = sd_zbc_alloc_report_buffer(sdkp, nrz, &buflen);
+	buf = sd_zbc_alloc_report_buffer(sdkp, nr_zones, &buflen);
 	if (!buf)
 		return -ENOMEM;
 
-	ret = sd_zbc_do_report_zones(sdkp, buf, buflen,
-			sectors_to_logical(sdkp->device, sector), true);
-	if (ret)
-		goto out;
+	while (zone_idx < nr_zones && sector < get_capacity(disk)) {
+		ret = sd_zbc_do_report_zones(sdkp, buf, buflen,
+				sectors_to_logical(sdkp->device, sector), true);
+		if (ret)
+			goto out;
+
+		offset = 0;
+		nr = min(nr_zones, get_unaligned_be32(&buf[0]) / 64);
+		if (!nr)
+			break;
+
+		for (i = 0; i < nr && zone_idx < nr_zones; i++) {
+			offset += 64;
+			ret = sd_zbc_parse_report(sdkp, buf + offset, zone_idx,
+						  cb, data);
+			if (ret)
+				goto out;
+			zone_idx++;
+		}
 
-	nrz = min(nrz, get_unaligned_be32(&buf[0]) / 64);
-	for (i = 0; i < nrz; i++) {
-		offset += 64;
-		sd_zbc_parse_report(sdkp, buf + offset, zones);
-		zones++;
+		sector += sd_zbc_zone_sectors(sdkp) * i;
 	}
 
-	*nr_zones = nrz;
-
+	ret = zone_idx;
 out:
 	kvfree(buf);
-
 	return ret;
 }
 
-/**
- * sd_zbc_zone_sectors - Get the device zone size in number of 512B sectors.
- * @sdkp: The target disk
- */
-static inline sector_t sd_zbc_zone_sectors(struct scsi_disk *sdkp)
-{
-	return logical_to_sectors(sdkp->device, sdkp->zone_blocks);
-}
-
 /**
  * sd_zbc_setup_zone_mgmt_cmnd - Prepare a zone ZBC_OUT command. The operations
  *			can be RESET WRITE POINTER, OPEN, CLOSE or FINISH.
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1443cee15863..95761740cf1f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2857,15 +2857,21 @@ static int init_percpu_info(struct f2fs_sb_info *sbi)
 }
 
 #ifdef CONFIG_BLK_DEV_ZONED
+static int f2fs_report_zone_cb(struct blk_zone *zone, unsigned int idx,
+			       void *data)
+{
+	struct f2fs_dev_info *dev = data;
+
+	if (zone->type != BLK_ZONE_TYPE_CONVENTIONAL)
+		set_bit(idx, dev->blkz_seq);
+	return 0;
+}
+
 static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
 {
 	struct block_device *bdev = FDEV(devi).bdev;
 	sector_t nr_sectors = bdev->bd_part->nr_sects;
-	sector_t sector = 0;
-	struct blk_zone *zones;
-	unsigned int i, nr_zones;
-	unsigned int n = 0;
-	int err = -EIO;
+	int ret;
 
 	if (!f2fs_sb_has_blkzoned(sbi))
 		return 0;
@@ -2890,38 +2896,13 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
 	if (!FDEV(devi).blkz_seq)
 		return -ENOMEM;
 
-#define F2FS_REPORT_NR_ZONES   4096
-
-	zones = f2fs_kzalloc(sbi,
-			     array_size(F2FS_REPORT_NR_ZONES,
-					sizeof(struct blk_zone)),
-			     GFP_KERNEL);
-	if (!zones)
-		return -ENOMEM;
-
 	/* Get block zones type */
-	while (zones && sector < nr_sectors) {
-
-		nr_zones = F2FS_REPORT_NR_ZONES;
-		err = blkdev_report_zones(bdev, sector, zones, &nr_zones);
-		if (err)
-			break;
-		if (!nr_zones) {
-			err = -EIO;
-			break;
-		}
-
-		for (i = 0; i < nr_zones; i++) {
-			if (zones[i].type != BLK_ZONE_TYPE_CONVENTIONAL)
-				set_bit(n, FDEV(devi).blkz_seq);
-			sector += zones[i].len;
-			n++;
-		}
-	}
-
-	kvfree(zones);
+	ret = blkdev_report_zones(bdev, 0, BLK_ALL_ZONES, f2fs_report_zone_cb,
+				  &FDEV(devi));
+	if (ret < 0)
+		return ret;
 
-	return err;
+	return 0;
 }
 #endif
 
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index dbef541c2530..17e384aa5a94 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -349,17 +349,16 @@ struct queue_limits {
 	enum blk_zoned_model	zoned;
 };
 
+typedef int (*report_zones_cb)(struct blk_zone *zone, unsigned int idx,
+			       void *data);
+
 #ifdef CONFIG_BLK_DEV_ZONED
 
-/*
- * Maximum number of zones to report with a single report zones command.
- */
-#define BLK_ZONED_REPORT_MAX_ZONES	8192U
+#define BLK_ALL_ZONES  ((unsigned int)-1)
+int blkdev_report_zones(struct block_device *bdev, sector_t sector,
+			unsigned int nr_zones, report_zones_cb cb, void *data);
 
 extern unsigned int blkdev_nr_zones(struct block_device *bdev);
-extern int blkdev_report_zones(struct block_device *bdev,
-			       sector_t sector, struct blk_zone *zones,
-			       unsigned int *nr_zones);
 extern int blkdev_zone_mgmt(struct block_device *bdev, enum req_opf op,
 			    sector_t sectors, sector_t nr_sectors,
 			    gfp_t gfp_mask);
@@ -1710,7 +1709,7 @@ struct block_device_operations {
 	/* this callback is with swap_lock and sometimes page table lock held */
 	void (*swap_slot_free_notify) (struct block_device *, unsigned long);
 	int (*report_zones)(struct gendisk *, sector_t sector,
-			    struct blk_zone *zones, unsigned int *nr_zones);
+			unsigned int nr_zones, report_zones_cb cb, void *data);
 	struct module *owner;
 	const struct pr_ops *pr_ops;
 };
diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
index 399ad8632356..a164cc81b710 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -17,6 +17,7 @@
 struct dm_dev;
 struct dm_target;
 struct dm_table;
+struct dm_report_zones_args;
 struct mapped_device;
 struct bio_vec;
 
@@ -93,9 +94,9 @@ typedef int (*dm_message_fn) (struct dm_target *ti, unsigned argc, char **argv,
 
 typedef int (*dm_prepare_ioctl_fn) (struct dm_target *ti, struct block_device **bdev);
 
-typedef int (*dm_report_zones_fn) (struct dm_target *ti, sector_t sector,
-				   struct blk_zone *zones,
-				   unsigned int *nr_zones);
+typedef int (*dm_report_zones_fn) (struct dm_target *ti,
+				   struct dm_report_zones_args *args,
+				   unsigned int nr_zones);
 
 /*
  * These iteration functions are typically used to check (and combine)
@@ -422,10 +423,23 @@ struct gendisk *dm_disk(struct mapped_device *md);
 int dm_suspended(struct dm_target *ti);
 int dm_noflush_suspending(struct dm_target *ti);
 void dm_accept_partial_bio(struct bio *bio, unsigned n_sectors);
-void dm_remap_zone_report(struct dm_target *ti, sector_t start,
-			  struct blk_zone *zones, unsigned int *nr_zones);
 union map_info *dm_get_rq_mapinfo(struct request *rq);
 
+#ifdef CONFIG_BLK_DEV_ZONED
+struct dm_report_zones_args {
+	struct dm_target *tgt;
+	sector_t next_sector;
+
+	void *orig_data;
+	report_zones_cb orig_cb;
+	unsigned int zone_idx;
+
+	/* must be filled by ->report_zones before calling dm_report_zones_cb */
+	sector_t start;
+};
+int dm_report_zones_cb(struct blk_zone *zone, unsigned int idx, void *data);
+#endif /* CONFIG_BLK_DEV_ZONED */
+
 /*
  * Device mapper functions to parse and create devices specified by the
  * parameter "dm-mod.create="
-- 
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
