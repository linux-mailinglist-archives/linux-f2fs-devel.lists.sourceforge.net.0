Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4522D816157
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Dec 2023 18:43:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rEvAd-00023v-Lf;
	Sun, 17 Dec 2023 17:43:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+1cffd234e19dbf5c5a3f+7420+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1rEvAa-00023n-Ie for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 17 Dec 2023 17:43:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KrruIGWCuS8QqW1BC8cBymUF0/BpZdBwJB9irrQY9L4=; b=YV9CJjNwUATMiWv4LQGYp2VBBd
 rKqC4eQG0OiYUbS3bclTb6n4TrKMZQKboCM5R6N12S29ZOtcI+xH9BFck6Biiv/BG3Nf8PdxObBOp
 4xUtrTlgSBhN3J8NxWOIYjmISr85y/O7eLCdqVExgiMhm+2OQjSSnMB/hPtytmmFPMyU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KrruIGWCuS8QqW1BC8cBymUF0/BpZdBwJB9irrQY9L4=; b=nQhq1VDhj8crCAV6lFnhh7ueL4
 mZwlpDuuK5b1bx0r7OvBS0D50iSKpms8kooSBMJNccGRrgTdQT0fg4xIPdBQAAj9Ma3E0bZcbR7p3
 SYjTPZiK+AH8+b5rCvR//eL55Sw4RAkx9PbV+DYMMTv4AwmuiD2d4Lo979sH7T9Jzj/c=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rEvAZ-0004xG-HI for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 17 Dec 2023 17:43:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=KrruIGWCuS8QqW1BC8cBymUF0/BpZdBwJB9irrQY9L4=; b=hqtQRC/ZbKzDKO8Wp1Rt5oQQOs
 ZPyvqammZhFoQtYqZ5n/XvPRagkRYFAERi2iT18xooubZmFJbIHynGC4pfCvNi3hdEWodjDAmR8/b
 2fX4WbkGHhQC+ikgdoRqirIp+02KszTri69fZd8pJfI/EKdxBrYu1NlL5xfDKfYS5Lcz8o9D+nh0d
 Vm0yijVbF52AuVz/9wREU/7QlANqevoJ3kWC8byNobvE5P7P4VkkBhphrwRcAGzTrq1VWL5Y7OOpn
 z92lD7vt073i7QKDn+5p/GyZ/NFtkV/unEcIy66u6KkLLF/j0aJ2JW8sPXMC03329Epd8d0nfMVd2
 NxlDijdA==;
Received: from [88.128.92.84] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rEuP5-0088Mb-1K; Sun, 17 Dec 2023 16:54:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Sun, 17 Dec 2023 17:53:57 +0100
Message-Id: <20231217165359.604246-4-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231217165359.604246-1-hch@lst.de>
References: <20231217165359.604246-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When zones were first added the SCSI and ATA specs,
 two different
 models were supported (in addition to the drive managed one that is invisible
 to the host): - host managed where non-conventional zones there is strict
 requirement to write at the write pointer, or else an error is returned -
 host aware where a write point is maintained if writes always hap [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rEvAZ-0004xG-HI
Subject: [f2fs-dev] [PATCH 3/5] block: remove support for the host aware
 zone model
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
Cc: dm-devel@lists.linux.dev, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 virtualization@lists.linux.dev, Damien Le Moal <dlemoal@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When zones were first added the SCSI and ATA specs, two different
models were supported (in addition to the drive managed one that
is invisible to the host):

 - host managed where non-conventional zones there is strict requirement
   to write at the write pointer, or else an error is returned
 - host aware where a write point is maintained if writes always happen
   at it, otherwise it is left in an under-defined state and the
   sequential write preferred zones behave like conventional zones
   (probably very badly performing ones, though)

Not surprisingly this lukewarm model didn't prove to be very useful and
was finally removed from the ZBC and SBC specs (NVMe never implemented
it).  Due to to the easily disappearing write pointer host software
could never rely on the write pointer to actually be useful for say
recovery.

Fortunately only a few HDD prototypes shipped using this model which
never made it to mass production.  Drop the support before it is too
late.  Note that any such host aware prototype HDD can still be used
with Linux as we'll now treat it as a conventional HDD.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-settings.c           | 67 +++++-----------------------------
 block/blk-sysfs.c              |  9 +----
 block/partitions/core.c        | 12 +-----
 drivers/block/null_blk/zoned.c |  2 +-
 drivers/block/ublk_drv.c       |  2 +-
 drivers/block/virtio_blk.c     |  2 +-
 drivers/md/dm-kcopyd.c         |  2 +-
 drivers/md/dm-table.c          | 45 ++++++++++-------------
 drivers/md/dm-zoned-metadata.c |  7 ++--
 drivers/md/dm-zoned-target.c   |  4 +-
 drivers/nvme/host/zns.c        |  2 +-
 drivers/scsi/scsi_debug.c      | 27 +++++++-------
 drivers/scsi/sd.c              | 45 ++++++++++-------------
 drivers/scsi/sd_zbc.c          | 16 +-------
 fs/btrfs/zoned.c               | 23 ++----------
 fs/btrfs/zoned.h               |  2 +-
 fs/f2fs/data.c                 |  2 +-
 fs/f2fs/super.c                | 17 ++++-----
 include/linux/blkdev.h         | 37 ++-----------------
 19 files changed, 92 insertions(+), 231 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 09e3a4d5e4d20f..50e9efb59f67fd 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -56,7 +56,7 @@ void blk_set_default_limits(struct queue_limits *lim)
 	lim->alignment_offset = 0;
 	lim->io_opt = 0;
 	lim->misaligned = 0;
-	lim->zoned = BLK_ZONED_NONE;
+	lim->zoned = false;
 	lim->zone_write_granularity = 0;
 	lim->dma_alignment = 511;
 }
@@ -880,79 +880,30 @@ bool blk_queue_can_use_dma_map_merging(struct request_queue *q,
 }
 EXPORT_SYMBOL_GPL(blk_queue_can_use_dma_map_merging);
 
-static bool disk_has_partitions(struct gendisk *disk)
-{
-	unsigned long idx;
-	struct block_device *part;
-	bool ret = false;
-
-	rcu_read_lock();
-	xa_for_each(&disk->part_tbl, idx, part) {
-		if (bdev_is_partition(part)) {
-			ret = true;
-			break;
-		}
-	}
-	rcu_read_unlock();
-
-	return ret;
-}
-
 /**
  * disk_set_zoned - configure the zoned model for a disk
  * @disk:	the gendisk of the queue to configure
- * @model:	the zoned model to set
- *
- * Set the zoned model of @disk to @model.
+ * @zoned:	zoned or not.
  *
- * When @model is BLK_ZONED_HM (host managed), this should be called only
- * if zoned block device support is enabled (CONFIG_BLK_DEV_ZONED option).
- * If @model specifies BLK_ZONED_HA (host aware), the effective model used
- * depends on CONFIG_BLK_DEV_ZONED settings and on the existence of partitions
- * on the disk.
+ * When @zoned is %true, this should be called only if zoned block device
+ * support is enabled (CONFIG_BLK_DEV_ZONED option).
  */
-void disk_set_zoned(struct gendisk *disk, enum blk_zoned_model model)
+void disk_set_zoned(struct gendisk *disk, bool zoned)
 {
 	struct request_queue *q = disk->queue;
-	unsigned int old_model = q->limits.zoned;
 
-	switch (model) {
-	case BLK_ZONED_HM:
-		/*
-		 * Host managed devices are supported only if
-		 * CONFIG_BLK_DEV_ZONED is enabled.
-		 */
+	if (zoned) {
 		WARN_ON_ONCE(!IS_ENABLED(CONFIG_BLK_DEV_ZONED));
-		break;
-	case BLK_ZONED_HA:
-		/*
-		 * Host aware devices can be treated either as regular block
-		 * devices (similar to drive managed devices) or as zoned block
-		 * devices to take advantage of the zone command set, similarly
-		 * to host managed devices. We try the latter if there are no
-		 * partitions and zoned block device support is enabled, else
-		 * we do nothing special as far as the block layer is concerned.
-		 */
-		if (!IS_ENABLED(CONFIG_BLK_DEV_ZONED) ||
-		    disk_has_partitions(disk))
-			model = BLK_ZONED_NONE;
-		break;
-	case BLK_ZONED_NONE:
-	default:
-		if (WARN_ON_ONCE(model != BLK_ZONED_NONE))
-			model = BLK_ZONED_NONE;
-		break;
-	}
 
-	q->limits.zoned = model;
-	if (model != BLK_ZONED_NONE) {
 		/*
 		 * Set the zone write granularity to the device logical block
 		 * size by default. The driver can change this value if needed.
 		 */
+		q->limits.zoned = true;
 		blk_queue_zone_write_granularity(q,
 						queue_logical_block_size(q));
-	} else if (old_model != BLK_ZONED_NONE) {
+	} else if (q->limits.zoned) {
+		q->limits.zoned = false;
 		disk_clear_zone_settings(disk);
 	}
 }
diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index 63e4812623361d..d5e669a401b0cc 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -309,14 +309,9 @@ QUEUE_SYSFS_BIT_FNS(stable_writes, STABLE_WRITES, 0);
 
 static ssize_t queue_zoned_show(struct request_queue *q, char *page)
 {
-	switch (blk_queue_zoned_model(q)) {
-	case BLK_ZONED_HA:
-		return sprintf(page, "host-aware\n");
-	case BLK_ZONED_HM:
+	if (blk_queue_is_zoned(q))
 		return sprintf(page, "host-managed\n");
-	default:
-		return sprintf(page, "none\n");
-	}
+	return sprintf(page, "none\n");
 }
 
 static ssize_t queue_nr_zones_show(struct request_queue *q, char *page)
diff --git a/block/partitions/core.c b/block/partitions/core.c
index f47ffcfdfcec22..e6ac73617f3e12 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -305,18 +305,10 @@ static struct block_device *add_partition(struct gendisk *disk, int partno,
 	 * Partitions are not supported on zoned block devices that are used as
 	 * such.
 	 */
-	switch (disk->queue->limits.zoned) {
-	case BLK_ZONED_HM:
+	if (bdev_is_zoned(disk->part0)) {
 		pr_warn("%s: partitions not supported on host managed zoned block device\n",
 			disk->disk_name);
 		return ERR_PTR(-ENXIO);
-	case BLK_ZONED_HA:
-		pr_info("%s: disabling host aware zoned block device support due to partitions\n",
-			disk->disk_name);
-		disk_set_zoned(disk, BLK_ZONED_NONE);
-		break;
-	case BLK_ZONED_NONE:
-		break;
 	}
 
 	if (xa_load(&disk->part_tbl, partno))
@@ -613,7 +605,7 @@ static int blk_add_partitions(struct gendisk *disk)
 	/*
 	 * Partitions are not supported on host managed zoned block devices.
 	 */
-	if (disk->queue->limits.zoned == BLK_ZONED_HM) {
+	if (bdev_is_zoned(disk->part0)) {
 		pr_warn("%s: ignoring partition table on host managed zoned block device\n",
 			disk->disk_name);
 		ret = 0;
diff --git a/drivers/block/null_blk/zoned.c b/drivers/block/null_blk/zoned.c
index 55c5b48bc276fe..369eb1e78bb579 100644
--- a/drivers/block/null_blk/zoned.c
+++ b/drivers/block/null_blk/zoned.c
@@ -159,7 +159,7 @@ int null_register_zoned_dev(struct nullb *nullb)
 	struct nullb_device *dev = nullb->dev;
 	struct request_queue *q = nullb->q;
 
-	disk_set_zoned(nullb->disk, BLK_ZONED_HM);
+	disk_set_zoned(nullb->disk, true);
 	blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, q);
 	blk_queue_required_elevator_features(q, ELEVATOR_F_ZBD_SEQ_WRITE);
 	blk_queue_chunk_sectors(q, dev->zone_size_sects);
diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 83600b45e12a28..24fb95f19d5284 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -250,7 +250,7 @@ static int ublk_dev_param_zoned_apply(struct ublk_device *ub)
 {
 	const struct ublk_param_zoned *p = &ub->params.zoned;
 
-	disk_set_zoned(ub->ub_disk, BLK_ZONED_HM);
+	disk_set_zoned(ub->ub_disk, true);
 	blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, ub->ub_disk->queue);
 	blk_queue_required_elevator_features(ub->ub_disk->queue,
 					     ELEVATOR_F_ZBD_SEQ_WRITE);
diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index a28f1687066bb4..19a4f20bd1c2f8 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -730,7 +730,7 @@ static int virtblk_probe_zoned_device(struct virtio_device *vdev,
 
 	dev_dbg(&vdev->dev, "probing host-managed zoned device\n");
 
-	disk_set_zoned(vblk->disk, BLK_ZONED_HM);
+	disk_set_zoned(vblk->disk, true);
 	blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, q);
 
 	virtio_cread(vdev, struct virtio_blk_config,
diff --git a/drivers/md/dm-kcopyd.c b/drivers/md/dm-kcopyd.c
index d01807c50f20b9..36bcfdccae0461 100644
--- a/drivers/md/dm-kcopyd.c
+++ b/drivers/md/dm-kcopyd.c
@@ -807,7 +807,7 @@ void dm_kcopyd_copy(struct dm_kcopyd_client *kc, struct dm_io_region *from,
 	 */
 	if (!(job->flags & BIT(DM_KCOPYD_WRITE_SEQ))) {
 		for (i = 0; i < job->num_dests; i++) {
-			if (bdev_zoned_model(dests[i].bdev) == BLK_ZONED_HM) {
+			if (bdev_is_zoned(dests[i].bdev)) {
 				job->flags |= BIT(DM_KCOPYD_WRITE_SEQ);
 				break;
 			}
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 198d38b53322c1..260b5b8f2b0d7e 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1579,21 +1579,18 @@ bool dm_table_has_no_data_devices(struct dm_table *t)
 	return true;
 }
 
-static int device_not_zoned_model(struct dm_target *ti, struct dm_dev *dev,
-				  sector_t start, sector_t len, void *data)
+static int device_not_zoned(struct dm_target *ti, struct dm_dev *dev,
+			    sector_t start, sector_t len, void *data)
 {
-	struct request_queue *q = bdev_get_queue(dev->bdev);
-	enum blk_zoned_model *zoned_model = data;
+	bool *zoned = data;
 
-	return blk_queue_zoned_model(q) != *zoned_model;
+	return bdev_is_zoned(dev->bdev) != *zoned;
 }
 
 static int device_is_zoned_model(struct dm_target *ti, struct dm_dev *dev,
 				 sector_t start, sector_t len, void *data)
 {
-	struct request_queue *q = bdev_get_queue(dev->bdev);
-
-	return blk_queue_zoned_model(q) != BLK_ZONED_NONE;
+	return bdev_is_zoned(dev->bdev);
 }
 
 /*
@@ -1603,8 +1600,7 @@ static int device_is_zoned_model(struct dm_target *ti, struct dm_dev *dev,
  * has the DM_TARGET_MIXED_ZONED_MODEL feature set, the devices can have any
  * zoned model with all zoned devices having the same zone size.
  */
-static bool dm_table_supports_zoned_model(struct dm_table *t,
-					  enum blk_zoned_model zoned_model)
+static bool dm_table_supports_zoned(struct dm_table *t, bool zoned)
 {
 	for (unsigned int i = 0; i < t->num_targets; i++) {
 		struct dm_target *ti = dm_table_get_target(t, i);
@@ -1623,11 +1619,11 @@ static bool dm_table_supports_zoned_model(struct dm_table *t,
 
 		if (dm_target_supports_zoned_hm(ti->type)) {
 			if (!ti->type->iterate_devices ||
-			    ti->type->iterate_devices(ti, device_not_zoned_model,
-						      &zoned_model))
+			    ti->type->iterate_devices(ti, device_not_zoned,
+						      &zoned))
 				return false;
 		} else if (!dm_target_supports_mixed_zoned_model(ti->type)) {
-			if (zoned_model == BLK_ZONED_HM)
+			if (zoned)
 				return false;
 		}
 	}
@@ -1650,14 +1646,13 @@ static int device_not_matches_zone_sectors(struct dm_target *ti, struct dm_dev *
  * zone sectors, if the destination device is a zoned block device, it shall
  * have the specified zone_sectors.
  */
-static int validate_hardware_zoned_model(struct dm_table *t,
-					 enum blk_zoned_model zoned_model,
-					 unsigned int zone_sectors)
+static int validate_hardware_zoned(struct dm_table *t, bool zoned,
+				   unsigned int zone_sectors)
 {
-	if (zoned_model == BLK_ZONED_NONE)
+	if (!zoned)
 		return 0;
 
-	if (!dm_table_supports_zoned_model(t, zoned_model)) {
+	if (!dm_table_supports_zoned(t, zoned)) {
 		DMERR("%s: zoned model is not consistent across all devices",
 		      dm_device_name(t->md));
 		return -EINVAL;
@@ -1683,8 +1678,8 @@ int dm_calculate_queue_limits(struct dm_table *t,
 			      struct queue_limits *limits)
 {
 	struct queue_limits ti_limits;
-	enum blk_zoned_model zoned_model = BLK_ZONED_NONE;
 	unsigned int zone_sectors = 0;
+	bool zoned = false;
 
 	blk_set_stacking_limits(limits);
 
@@ -1706,12 +1701,12 @@ int dm_calculate_queue_limits(struct dm_table *t,
 		ti->type->iterate_devices(ti, dm_set_device_limits,
 					  &ti_limits);
 
-		if (zoned_model == BLK_ZONED_NONE && ti_limits.zoned != BLK_ZONED_NONE) {
+		if (!zoned && ti_limits.zoned) {
 			/*
 			 * After stacking all limits, validate all devices
 			 * in table support this zoned model and zone sectors.
 			 */
-			zoned_model = ti_limits.zoned;
+			zoned = ti_limits.zoned;
 			zone_sectors = ti_limits.chunk_sectors;
 		}
 
@@ -1744,18 +1739,18 @@ int dm_calculate_queue_limits(struct dm_table *t,
 	 * Verify that the zoned model and zone sectors, as determined before
 	 * any .io_hints override, are the same across all devices in the table.
 	 * - this is especially relevant if .io_hints is emulating a disk-managed
-	 *   zoned model (aka BLK_ZONED_NONE) on host-managed zoned block devices.
+	 *   zoned model on host-managed zoned block devices.
 	 * BUT...
 	 */
-	if (limits->zoned != BLK_ZONED_NONE) {
+	if (limits->zoned) {
 		/*
 		 * ...IF the above limits stacking determined a zoned model
 		 * validate that all of the table's devices conform to it.
 		 */
-		zoned_model = limits->zoned;
+		zoned = limits->zoned;
 		zone_sectors = limits->chunk_sectors;
 	}
-	if (validate_hardware_zoned_model(t, zoned_model, zone_sectors))
+	if (validate_hardware_zoned(t, zoned, zone_sectors))
 		return -EINVAL;
 
 	return validate_hardware_logical_block_alignment(t, limits);
diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 60a4dc01ea187d..fdfe30f7b6973d 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -2836,12 +2836,11 @@ static void dmz_print_dev(struct dmz_metadata *zmd, int num)
 {
 	struct dmz_dev *dev = &zmd->dev[num];
 
-	if (bdev_zoned_model(dev->bdev) == BLK_ZONED_NONE)
+	if (!bdev_is_zoned(dev->bdev))
 		dmz_dev_info(dev, "Regular block device");
 	else
-		dmz_dev_info(dev, "Host-%s zoned block device",
-			     bdev_zoned_model(dev->bdev) == BLK_ZONED_HA ?
-			     "aware" : "managed");
+		dmz_dev_info(dev, "Host-managed zoned block device");
+
 	if (zmd->sb_version > 1) {
 		sector_t sector_offset =
 			dev->zone_offset << zmd->zone_nr_sectors_shift;
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index b487f7acc860f7..621794a9edd65e 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -702,7 +702,7 @@ static int dmz_get_zoned_device(struct dm_target *ti, char *path,
 	}
 
 	bdev = ddev->bdev;
-	if (bdev_zoned_model(bdev) == BLK_ZONED_NONE) {
+	if (!bdev_is_zoned(bdev)) {
 		if (nr_devs == 1) {
 			ti->error = "Invalid regular device";
 			goto err;
@@ -1010,7 +1010,7 @@ static void dmz_io_hints(struct dm_target *ti, struct queue_limits *limits)
 	limits->max_sectors = chunk_sectors;
 
 	/* We are exposing a drive-managed zoned block device */
-	limits->zoned = BLK_ZONED_NONE;
+	limits->zoned = false;
 }
 
 /*
diff --git a/drivers/nvme/host/zns.c b/drivers/nvme/host/zns.c
index ec8557810c2102..6d4c440e97e2a5 100644
--- a/drivers/nvme/host/zns.c
+++ b/drivers/nvme/host/zns.c
@@ -108,7 +108,7 @@ int nvme_update_zone_info(struct nvme_ns *ns, unsigned lbaf)
 		goto free_data;
 	}
 
-	disk_set_zoned(ns->disk, BLK_ZONED_HM);
+	disk_set_zoned(ns->disk, true);
 	blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, q);
 	disk_set_max_open_zones(ns->disk, le32_to_cpu(id->mor) + 1);
 	disk_set_max_active_zones(ns->disk, le32_to_cpu(id->mar) + 1);
diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
index 6d8218a4412264..d03d66f1149301 100644
--- a/drivers/scsi/scsi_debug.c
+++ b/drivers/scsi/scsi_debug.c
@@ -339,7 +339,7 @@ struct sdebug_dev_info {
 	bool used;
 
 	/* For ZBC devices */
-	enum blk_zoned_model zmodel;
+	bool zoned;
 	unsigned int zcap;
 	unsigned int zsize;
 	unsigned int zsize_shift;
@@ -844,8 +844,11 @@ static bool write_since_sync;
 static bool sdebug_statistics = DEF_STATISTICS;
 static bool sdebug_wp;
 static bool sdebug_allow_restart;
-/* Following enum: 0: no zbc, def; 1: host aware; 2: host managed */
-static enum blk_zoned_model sdeb_zbc_model = BLK_ZONED_NONE;
+static enum {
+	BLK_ZONED_NONE	= 0,
+	BLK_ZONED_HA	= 1,
+	BLK_ZONED_HM	= 2,
+} sdeb_zbc_model = BLK_ZONED_NONE;
 static char *sdeb_zbc_model_s;
 
 enum sam_lun_addr_method {SAM_LUN_AM_PERIPHERAL = 0x0,
@@ -1815,8 +1818,6 @@ static int inquiry_vpd_b1(struct sdebug_dev_info *devip, unsigned char *arr)
 	arr[1] = 1;	/* non rotating medium (e.g. solid state) */
 	arr[2] = 0;
 	arr[3] = 5;	/* less than 1.8" */
-	if (devip->zmodel == BLK_ZONED_HA)
-		arr[4] = 1 << 4;	/* zoned field = 01b */
 
 	return 0x3c;
 }
@@ -1883,7 +1884,7 @@ static int resp_inquiry(struct scsi_cmnd *scp, struct sdebug_dev_info *devip)
 	if (! arr)
 		return DID_REQUEUE << 16;
 	is_disk = (sdebug_ptype == TYPE_DISK);
-	is_zbc = (devip->zmodel != BLK_ZONED_NONE);
+	is_zbc = devip->zoned;
 	is_disk_zbc = (is_disk || is_zbc);
 	have_wlun = scsi_is_wlun(scp->device->lun);
 	if (have_wlun)
@@ -2195,7 +2196,7 @@ static int resp_readcap16(struct scsi_cmnd *scp,
 	 * Since the scsi_debug READ CAPACITY implementation always reports the
 	 * total disk capacity, set RC BASIS = 1 for host-managed ZBC devices.
 	 */
-	if (devip->zmodel == BLK_ZONED_HM)
+	if (devip->zoned)
 		arr[12] |= 1 << 4;
 
 	arr[15] = sdebug_lowest_aligned & 0xff;
@@ -2648,7 +2649,7 @@ static int resp_mode_sense(struct scsi_cmnd *scp,
 	msense_6 = (MODE_SENSE == cmd[0]);
 	llbaa = msense_6 ? false : !!(cmd[1] & 0x10);
 	is_disk = (sdebug_ptype == TYPE_DISK);
-	is_zbc = (devip->zmodel != BLK_ZONED_NONE);
+	is_zbc = devip->zoned;
 	if ((is_disk || is_zbc) && !dbd)
 		bd_len = llbaa ? 16 : 8;
 	else
@@ -3194,8 +3195,6 @@ static int check_zbc_access_params(struct scsi_cmnd *scp,
 	struct sdeb_zone_state *zsp_end = zbc_zone(devip, lba + num - 1);
 
 	if (!write) {
-		if (devip->zmodel == BLK_ZONED_HA)
-			return 0;
 		/* For host-managed, reads cannot cross zone types boundaries */
 		if (zsp->z_type != zsp_end->z_type) {
 			mk_sense_buffer(scp, ILLEGAL_REQUEST,
@@ -5322,7 +5321,7 @@ static int sdebug_device_create_zones(struct sdebug_dev_info *devip)
 	if (devip->zcap < devip->zsize)
 		devip->nr_zones += devip->nr_seq_zones;
 
-	if (devip->zmodel == BLK_ZONED_HM) {
+	if (devip->zoned) {
 		/* zbc_max_open_zones can be 0, meaning "not reported" */
 		if (sdeb_zbc_max_open >= devip->nr_zones - 1)
 			devip->max_open = (devip->nr_zones - 1) / 2;
@@ -5347,7 +5346,7 @@ static int sdebug_device_create_zones(struct sdebug_dev_info *devip)
 			zsp->z_size =
 				min_t(u64, devip->zsize, capacity - zstart);
 		} else if ((zstart & (devip->zsize - 1)) == 0) {
-			if (devip->zmodel == BLK_ZONED_HM)
+			if (devip->zoned)
 				zsp->z_type = ZBC_ZTYPE_SWR;
 			else
 				zsp->z_type = ZBC_ZTYPE_SWP;
@@ -5390,13 +5389,13 @@ static struct sdebug_dev_info *sdebug_device_create(
 		}
 		devip->sdbg_host = sdbg_host;
 		if (sdeb_zbc_in_use) {
-			devip->zmodel = sdeb_zbc_model;
+			devip->zoned = sdeb_zbc_model == BLK_ZONED_HM;
 			if (sdebug_device_create_zones(devip)) {
 				kfree(devip);
 				return NULL;
 			}
 		} else {
-			devip->zmodel = BLK_ZONED_NONE;
+			devip->zoned = false;
 		}
 		devip->create_ts = ktime_get_boottime();
 		atomic_set(&devip->stopped, (sdeb_tur_ms_to_ready > 0 ? 2 : 0));
diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index fa00dd503cbf61..19a19eb277f57d 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -3117,7 +3117,6 @@ static void sd_read_block_characteristics(struct scsi_disk *sdkp)
 	struct request_queue *q = sdkp->disk->queue;
 	struct scsi_vpd *vpd;
 	u16 rot;
-	u8 zoned;
 
 	rcu_read_lock();
 	vpd = rcu_dereference(sdkp->device->vpd_pgb1);
@@ -3128,7 +3127,7 @@ static void sd_read_block_characteristics(struct scsi_disk *sdkp)
 	}
 
 	rot = get_unaligned_be16(&vpd->data[4]);
-	zoned = (vpd->data[8] >> 4) & 3;
+	sdkp->zoned = (vpd->data[8] >> 4) & 3;
 	rcu_read_unlock();
 
 	if (rot == 1) {
@@ -3138,37 +3137,33 @@ static void sd_read_block_characteristics(struct scsi_disk *sdkp)
 
 	if (sdkp->device->type == TYPE_ZBC) {
 		/*
-		 * Host-managed: Per ZBC and ZAC specifications, writes in
-		 * sequential write required zones of host-managed devices must
-		 * be aligned to the device physical block size.
+		 * Host-managed.
+		 */
+		disk_set_zoned(sdkp->disk, true);
+
+		/*
+		 * Per ZBC and ZAC specifications, writes in sequential write
+		 * required zones of host-managed devices must be aligned to
+		 * the device physical block size.
 		 */
-		disk_set_zoned(sdkp->disk, BLK_ZONED_HM);
 		blk_queue_zone_write_granularity(q, sdkp->physical_block_size);
 	} else {
-		sdkp->zoned = zoned;
-		if (sdkp->zoned == 1) {
-			/* Host-aware */
-			disk_set_zoned(sdkp->disk, BLK_ZONED_HA);
-		} else {
-			/* Regular disk or drive managed disk */
-			disk_set_zoned(sdkp->disk, BLK_ZONED_NONE);
-		}
+		/*
+		 * Anything else.  This includes host-aware device that we treat
+		 * as conventional.
+		 */
+		disk_set_zoned(sdkp->disk, false);
 	}
 
 	if (!sdkp->first_scan)
 		return;
 
-	if (blk_queue_is_zoned(q)) {
-		sd_printk(KERN_NOTICE, sdkp, "Host-%s zoned block device\n",
-		      q->limits.zoned == BLK_ZONED_HM ? "managed" : "aware");
-	} else {
-		if (sdkp->zoned == 1)
-			sd_printk(KERN_NOTICE, sdkp,
-				  "Host-aware SMR disk used as regular disk\n");
-		else if (sdkp->zoned == 2)
-			sd_printk(KERN_NOTICE, sdkp,
-				  "Drive-managed SMR disk\n");
-	}
+	if (blk_queue_is_zoned(q))
+		sd_printk(KERN_NOTICE, sdkp, "Host-managed zoned block device\n");
+	else if (sdkp->zoned == 1)
+		sd_printk(KERN_NOTICE, sdkp, "Host-aware SMR disk used as regular disk\n");
+	else if (sdkp->zoned == 2)
+		sd_printk(KERN_NOTICE, sdkp, "Drive-managed SMR disk\n");
 }
 
 /**
diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
index a25215507668d8..26af5ab7d7c173 100644
--- a/drivers/scsi/sd_zbc.c
+++ b/drivers/scsi/sd_zbc.c
@@ -836,10 +836,7 @@ int sd_zbc_revalidate_zones(struct scsi_disk *sdkp)
 
 	/*
 	 * For all zoned disks, initialize zone append emulation data if not
-	 * already done. This is necessary also for host-aware disks used as
-	 * regular disks due to the presence of partitions as these partitions
-	 * may be deleted and the disk zoned model changed back from
-	 * BLK_ZONED_NONE to BLK_ZONED_HA.
+	 * already done.
 	 */
 	if (sd_is_zoned(sdkp) && !sdkp->zone_wp_update_buf) {
 		ret = sd_zbc_init_disk(sdkp);
@@ -932,17 +929,6 @@ int sd_zbc_read_zones(struct scsi_disk *sdkp, u8 buf[SD_BUF_SIZE])
 	sdkp->device->use_10_for_rw = 0;
 	sdkp->device->use_16_for_sync = 1;
 
-	if (!blk_queue_is_zoned(q)) {
-		/*
-		 * This can happen for a host aware disk with partitions.
-		 * The block device zone model was already cleared by
-		 * disk_set_zoned(). Only free the scsi disk zone
-		 * information and exit early.
-		 */
-		sd_zbc_free_zone_info(sdkp);
-		return 0;
-	}
-
 	/* Check zoned block device characteristics (unconstrained reads) */
 	ret = sd_zbc_check_zoned_characteristics(sdkp, buf);
 	if (ret)
diff --git a/fs/btrfs/zoned.c b/fs/btrfs/zoned.c
index 188378ca19c7f6..23c1e6b19a653b 100644
--- a/fs/btrfs/zoned.c
+++ b/fs/btrfs/zoned.c
@@ -578,26 +578,12 @@ int btrfs_get_dev_zone_info(struct btrfs_device *device, bool populate_cache)
 
 	kvfree(zones);
 
-	switch (bdev_zoned_model(bdev)) {
-	case BLK_ZONED_HM:
+	if (bdev_is_zoned(bdev)) {
 		model = "host-managed zoned";
 		emulated = "";
-		break;
-	case BLK_ZONED_HA:
-		model = "host-aware zoned";
-		emulated = "";
-		break;
-	case BLK_ZONED_NONE:
+	} else {
 		model = "regular";
 		emulated = "emulated ";
-		break;
-	default:
-		/* Just in case */
-		btrfs_err_in_rcu(fs_info, "zoned: unsupported model %d on %s",
-				 bdev_zoned_model(bdev),
-				 rcu_str_deref(device->name));
-		ret = -EOPNOTSUPP;
-		goto out_free_zone_info;
 	}
 
 	btrfs_info_in_rcu(fs_info,
@@ -609,9 +595,7 @@ int btrfs_get_dev_zone_info(struct btrfs_device *device, bool populate_cache)
 
 out:
 	kvfree(zones);
-out_free_zone_info:
 	btrfs_destroy_dev_zone_info(device);
-
 	return ret;
 }
 
@@ -688,8 +672,7 @@ static int btrfs_check_for_zoned_device(struct btrfs_fs_info *fs_info)
 	struct btrfs_device *device;
 
 	list_for_each_entry(device, &fs_info->fs_devices->devices, dev_list) {
-		if (device->bdev &&
-		    bdev_zoned_model(device->bdev) == BLK_ZONED_HM) {
+		if (device->bdev && bdev_is_zoned(device->bdev)) {
 			btrfs_err(fs_info,
 				"zoned: mode not enabled but zoned device found: %pg",
 				device->bdev);
diff --git a/fs/btrfs/zoned.h b/fs/btrfs/zoned.h
index b9cec523b77842..bc1b540c1597ab 100644
--- a/fs/btrfs/zoned.h
+++ b/fs/btrfs/zoned.h
@@ -324,7 +324,7 @@ static inline bool btrfs_check_device_zone_type(const struct btrfs_fs_info *fs_i
 	}
 
 	/* Do not allow Host Manged zoned device */
-	return bdev_zoned_model(bdev) != BLK_ZONED_HM;
+	return !bdev_is_zoned(bdev);
 }
 
 static inline bool btrfs_check_super_location(struct btrfs_device *device, u64 pos)
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 4e42b5f24debec..9b62549a29ced0 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -995,7 +995,7 @@ static bool is_end_zone_blkaddr(struct f2fs_sb_info *sbi, block_t blkaddr)
 		}
 		blkaddr -= FDEV(devi).start_blk;
 	}
-	return bdev_zoned_model(FDEV(devi).bdev) == BLK_ZONED_HM &&
+	return bdev_is_zoned(FDEV(devi).bdev) &&
 		f2fs_blkz_is_seq(sbi, devi, blkaddr) &&
 		(blkaddr % sbi->blocks_per_blkz == sbi->blocks_per_blkz - 1);
 }
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 033af907c3b1dc..850c87ae7d98ad 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4282,24 +4282,21 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 			sbi->aligned_blksize = false;
 
 #ifdef CONFIG_BLK_DEV_ZONED
-		if (bdev_zoned_model(FDEV(i).bdev) == BLK_ZONED_HM &&
-				!f2fs_sb_has_blkzoned(sbi)) {
-			f2fs_err(sbi, "Zoned block device feature not enabled");
-			return -EINVAL;
-		}
-		if (bdev_zoned_model(FDEV(i).bdev) != BLK_ZONED_NONE) {
+		if (bdev_is_zoned(FDEV(i).bdev)) {
+			if (!f2fs_sb_has_blkzoned(sbi)) {
+				f2fs_err(sbi, "Zoned block device feature not enabled");
+				return -EINVAL;
+			}
 			if (init_blkz_info(sbi, i)) {
 				f2fs_err(sbi, "Failed to initialize F2FS blkzone information");
 				return -EINVAL;
 			}
 			if (max_devices == 1)
 				break;
-			f2fs_info(sbi, "Mount Device [%2d]: %20s, %8u, %8x - %8x (zone: %s)",
+			f2fs_info(sbi, "Mount Device [%2d]: %20s, %8u, %8x - %8x (zone: Host-managed)",
 				  i, FDEV(i).path,
 				  FDEV(i).total_segments,
-				  FDEV(i).start_blk, FDEV(i).end_blk,
-				  bdev_zoned_model(FDEV(i).bdev) == BLK_ZONED_HA ?
-				  "Host-aware" : "Host-managed");
+				  FDEV(i).start_blk, FDEV(i).end_blk);
 			continue;
 		}
 #endif
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 185ed3770e3a96..28cda9fb239eb6 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -263,18 +263,6 @@ static inline bool blk_op_is_passthrough(blk_opf_t op)
 	return op == REQ_OP_DRV_IN || op == REQ_OP_DRV_OUT;
 }
 
-/*
- * Zoned block device models (zoned limit).
- *
- * Note: This needs to be ordered from the least to the most severe
- * restrictions for the inheritance in blk_stack_limits() to work.
- */
-enum blk_zoned_model {
-	BLK_ZONED_NONE = 0,	/* Regular block device */
-	BLK_ZONED_HA,		/* Host-aware zoned block device */
-	BLK_ZONED_HM,		/* Host-managed zoned block device */
-};
-
 /*
  * BLK_BOUNCE_NONE:	never bounce (default)
  * BLK_BOUNCE_HIGH:	bounce all highmem pages
@@ -316,7 +304,7 @@ struct queue_limits {
 	unsigned char		misaligned;
 	unsigned char		discard_misaligned;
 	unsigned char		raid_partial_stripes_expensive;
-	enum blk_zoned_model	zoned;
+	bool			zoned;
 
 	/*
 	 * Drivers that set dma_alignment to less than 511 must be prepared to
@@ -329,7 +317,7 @@ struct queue_limits {
 typedef int (*report_zones_cb)(struct blk_zone *zone, unsigned int idx,
 			       void *data);
 
-void disk_set_zoned(struct gendisk *disk, enum blk_zoned_model model);
+void disk_set_zoned(struct gendisk *disk, bool zoned);
 
 #define BLK_ALL_ZONES  ((unsigned int)-1)
 int blkdev_report_zones(struct block_device *bdev, sector_t sector,
@@ -617,23 +605,9 @@ static inline enum rpm_status queue_rpm_status(struct request_queue *q)
 }
 #endif
 
-static inline enum blk_zoned_model
-blk_queue_zoned_model(struct request_queue *q)
-{
-	if (IS_ENABLED(CONFIG_BLK_DEV_ZONED))
-		return q->limits.zoned;
-	return BLK_ZONED_NONE;
-}
-
 static inline bool blk_queue_is_zoned(struct request_queue *q)
 {
-	switch (blk_queue_zoned_model(q)) {
-	case BLK_ZONED_HA:
-	case BLK_ZONED_HM:
-		return true;
-	default:
-		return false;
-	}
+	return IS_ENABLED(CONFIG_BLK_DEV_ZONED) && q->limits.zoned;
 }
 
 #ifdef CONFIG_BLK_DEV_ZONED
@@ -1260,11 +1234,6 @@ static inline bool bdev_nowait(struct block_device *bdev)
 	return test_bit(QUEUE_FLAG_NOWAIT, &bdev_get_queue(bdev)->queue_flags);
 }
 
-static inline enum blk_zoned_model bdev_zoned_model(struct block_device *bdev)
-{
-	return blk_queue_zoned_model(bdev_get_queue(bdev));
-}
-
 static inline bool bdev_is_zoned(struct block_device *bdev)
 {
 	return blk_queue_is_zoned(bdev_get_queue(bdev));
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
