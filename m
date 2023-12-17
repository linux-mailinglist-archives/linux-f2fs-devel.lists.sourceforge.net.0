Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4588160D0
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Dec 2023 18:23:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rEure-0002SA-KB;
	Sun, 17 Dec 2023 17:23:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+1cffd234e19dbf5c5a3f+7420+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1rEurb-0002Rt-Ie for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 17 Dec 2023 17:23:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MJjD01GsaCXNqJGBk8XaIGbPlf5DMiF6yt4DNbEE94E=; b=mR/SzswbV7UaOEwoCsm/XM68GG
 XRsvxlZ0w4sxEPH6lYtInaNlrSmadEEm/YGXqPtY44+GOChpsboDegX/jvc6om+/iTQc9ascAubwW
 n/luqe2ET8ND/CKQ+8tBOXyCceN1ssAwcxTDV86tsJVTc2oesaCKk+e49RHmUVrdFgjU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MJjD01GsaCXNqJGBk8XaIGbPlf5DMiF6yt4DNbEE94E=; b=NrxRv5uXp5pL1zZrA1ERZqlrap
 8mVZ8EFuOz1mJms9WfQdJUOFCvqrrRP5x/EuPPFy1VcbMB3GBFG3LqbUee08V9IGZuvfk5Tu0er5r
 6WIb3KCdDf+zYJRwciPoI7gXhGmjnDe0FJLg3WSmqh5JzLzW3C4sZWe8rL83LyYWd/GA=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rEurX-0007rf-HF for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 17 Dec 2023 17:23:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=MJjD01GsaCXNqJGBk8XaIGbPlf5DMiF6yt4DNbEE94E=; b=uNUl9LpNBDEEsMIcjXzCWS1CS+
 NuBFkENto4vKXlqWa2I8rt0mYdjgysD1zytkXRtydeM93VJT7ZPPw8cArSK7Hynx2mOKIgbifLIbO
 rcOgrvKv71gvAgBVt+acKoW26RpHW/WhpHrrzX+OnDLn0CWwMpxYhDDGjKE3MR8VhajEWfLOBieo6
 Cfx0k4kMcYTlKsDwmLBZRpR5/+fQ9fz4KhtuNBBN7i/tWA/iua8+0fMiq65q1qH1koTnqMRCOanxr
 HUuxiRLxTj+x+iYLHfspJZ///lvwSqYmXajFaqeUJmDxpdOdSfaJanGoZj5rFhJsyEHLnUO3qSKfO
 dWuVReaQ==;
Received: from [88.128.92.84] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rEuP8-0088NZ-1Z; Sun, 17 Dec 2023 16:54:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Sun, 17 Dec 2023 17:53:58 +0100
Message-Id: <20231217165359.604246-5-hch@lst.de>
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
 Content preview: Only use disk_set_zoned to actually enable zoned device
 support. For clearing it, call disk_clear_zoned,
 which is renamed from disk_clear_zone_settings
 and now directly clears the zoned flag as well. 
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
X-Headers-End: 1rEurX-0007rf-HF
Subject: [f2fs-dev] [PATCH 4/5] block: simplify disk_set_zoned
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

Only use disk_set_zoned to actually enable zoned device support.
For clearing it, call disk_clear_zoned, which is renamed from
disk_clear_zone_settings and now directly clears the zoned flag as
well.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-settings.c           | 32 +++++++++++---------------------
 block/blk-zoned.c              |  3 ++-
 block/blk.h                    |  2 --
 drivers/block/null_blk/zoned.c |  2 +-
 drivers/block/ublk_drv.c       |  2 +-
 drivers/block/virtio_blk.c     |  2 +-
 drivers/nvme/host/zns.c        |  2 +-
 drivers/scsi/sd.c              |  7 +++++--
 include/linux/blkdev.h         |  3 ++-
 9 files changed, 24 insertions(+), 31 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 50e9efb59f67fd..bb94a3d471f4fb 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -881,31 +881,21 @@ bool blk_queue_can_use_dma_map_merging(struct request_queue *q,
 EXPORT_SYMBOL_GPL(blk_queue_can_use_dma_map_merging);
 
 /**
- * disk_set_zoned - configure the zoned model for a disk
- * @disk:	the gendisk of the queue to configure
- * @zoned:	zoned or not.
- *
- * When @zoned is %true, this should be called only if zoned block device
- * support is enabled (CONFIG_BLK_DEV_ZONED option).
+ * disk_set_zoned - inidicate a zoned device
+ * @disk:	gendisk to configure
  */
-void disk_set_zoned(struct gendisk *disk, bool zoned)
+void disk_set_zoned(struct gendisk *disk)
 {
 	struct request_queue *q = disk->queue;
 
-	if (zoned) {
-		WARN_ON_ONCE(!IS_ENABLED(CONFIG_BLK_DEV_ZONED));
-
-		/*
-		 * Set the zone write granularity to the device logical block
-		 * size by default. The driver can change this value if needed.
-		 */
-		q->limits.zoned = true;
-		blk_queue_zone_write_granularity(q,
-						queue_logical_block_size(q));
-	} else if (q->limits.zoned) {
-		q->limits.zoned = false;
-		disk_clear_zone_settings(disk);
-	}
+	WARN_ON_ONCE(!IS_ENABLED(CONFIG_BLK_DEV_ZONED));
+
+	/*
+	 * Set the zone write granularity to the device logical block
+	 * size by default. The driver can change this value if needed.
+	 */
+	q->limits.zoned = true;
+	blk_queue_zone_write_granularity(q, queue_logical_block_size(q));
 }
 EXPORT_SYMBOL_GPL(disk_set_zoned);
 
diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 619ee41a51cc8c..580a58e53efd77 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -616,12 +616,13 @@ int blk_revalidate_disk_zones(struct gendisk *disk,
 }
 EXPORT_SYMBOL_GPL(blk_revalidate_disk_zones);
 
-void disk_clear_zone_settings(struct gendisk *disk)
+void disk_clear_zoned(struct gendisk *disk)
 {
 	struct request_queue *q = disk->queue;
 
 	blk_mq_freeze_queue(q);
 
+	q->limits.zoned = false;
 	disk_free_zone_bitmaps(disk);
 	blk_queue_flag_clear(QUEUE_FLAG_ZONE_RESETALL, q);
 	q->required_elevator_features &= ~ELEVATOR_F_ZBD_SEQ_WRITE;
diff --git a/block/blk.h b/block/blk.h
index 08a358bc0919e2..1ef920f72e0f87 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -395,14 +395,12 @@ static inline struct bio *blk_queue_bounce(struct bio *bio,
 
 #ifdef CONFIG_BLK_DEV_ZONED
 void disk_free_zone_bitmaps(struct gendisk *disk);
-void disk_clear_zone_settings(struct gendisk *disk);
 int blkdev_report_zones_ioctl(struct block_device *bdev, unsigned int cmd,
 		unsigned long arg);
 int blkdev_zone_mgmt_ioctl(struct block_device *bdev, blk_mode_t mode,
 		unsigned int cmd, unsigned long arg);
 #else /* CONFIG_BLK_DEV_ZONED */
 static inline void disk_free_zone_bitmaps(struct gendisk *disk) {}
-static inline void disk_clear_zone_settings(struct gendisk *disk) {}
 static inline int blkdev_report_zones_ioctl(struct block_device *bdev,
 		unsigned int cmd, unsigned long arg)
 {
diff --git a/drivers/block/null_blk/zoned.c b/drivers/block/null_blk/zoned.c
index 369eb1e78bb579..6f5e0994862eae 100644
--- a/drivers/block/null_blk/zoned.c
+++ b/drivers/block/null_blk/zoned.c
@@ -159,7 +159,7 @@ int null_register_zoned_dev(struct nullb *nullb)
 	struct nullb_device *dev = nullb->dev;
 	struct request_queue *q = nullb->q;
 
-	disk_set_zoned(nullb->disk, true);
+	disk_set_zoned(nullb->disk);
 	blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, q);
 	blk_queue_required_elevator_features(q, ELEVATOR_F_ZBD_SEQ_WRITE);
 	blk_queue_chunk_sectors(q, dev->zone_size_sects);
diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 24fb95f19d5284..d50d69b2c023de 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -250,7 +250,7 @@ static int ublk_dev_param_zoned_apply(struct ublk_device *ub)
 {
 	const struct ublk_param_zoned *p = &ub->params.zoned;
 
-	disk_set_zoned(ub->ub_disk, true);
+	disk_set_zoned(ub->ub_disk);
 	blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, ub->ub_disk->queue);
 	blk_queue_required_elevator_features(ub->ub_disk->queue,
 					     ELEVATOR_F_ZBD_SEQ_WRITE);
diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 19a4f20bd1c2f8..7d7a19b2b9a8eb 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -730,7 +730,7 @@ static int virtblk_probe_zoned_device(struct virtio_device *vdev,
 
 	dev_dbg(&vdev->dev, "probing host-managed zoned device\n");
 
-	disk_set_zoned(vblk->disk, true);
+	disk_set_zoned(vblk->disk);
 	blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, q);
 
 	virtio_cread(vdev, struct virtio_blk_config,
diff --git a/drivers/nvme/host/zns.c b/drivers/nvme/host/zns.c
index 6d4c440e97e2a5..3d98e435821e4a 100644
--- a/drivers/nvme/host/zns.c
+++ b/drivers/nvme/host/zns.c
@@ -108,7 +108,7 @@ int nvme_update_zone_info(struct nvme_ns *ns, unsigned lbaf)
 		goto free_data;
 	}
 
-	disk_set_zoned(ns->disk, true);
+	disk_set_zoned(ns->disk);
 	blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, q);
 	disk_set_max_open_zones(ns->disk, le32_to_cpu(id->mor) + 1);
 	disk_set_max_active_zones(ns->disk, le32_to_cpu(id->mar) + 1);
diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 19a19eb277f57d..dbed075cdb981a 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -3135,11 +3135,13 @@ static void sd_read_block_characteristics(struct scsi_disk *sdkp)
 		blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, q);
 	}
 
+
+#ifdef CONFIG_BLK_DEV_ZONED /* sd_probe rejects ZBD devices early otherwise */
 	if (sdkp->device->type == TYPE_ZBC) {
 		/*
 		 * Host-managed.
 		 */
-		disk_set_zoned(sdkp->disk, true);
+		disk_set_zoned(sdkp->disk);
 
 		/*
 		 * Per ZBC and ZAC specifications, writes in sequential write
@@ -3152,8 +3154,9 @@ static void sd_read_block_characteristics(struct scsi_disk *sdkp)
 		 * Anything else.  This includes host-aware device that we treat
 		 * as conventional.
 		 */
-		disk_set_zoned(sdkp->disk, false);
+		disk_clear_zoned(sdkp->disk);
 	}
+#endif /* CONFIG_BLK_DEV_ZONED */
 
 	if (!sdkp->first_scan)
 		return;
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 28cda9fb239eb6..bc236e77d85e1c 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -317,7 +317,8 @@ struct queue_limits {
 typedef int (*report_zones_cb)(struct blk_zone *zone, unsigned int idx,
 			       void *data);
 
-void disk_set_zoned(struct gendisk *disk, bool zoned);
+void disk_set_zoned(struct gendisk *disk);
+void disk_clear_zoned(struct gendisk *disk);
 
 #define BLK_ALL_ZONES  ((unsigned int)-1)
 int blkdev_report_zones(struct block_device *bdev, sector_t sector,
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
