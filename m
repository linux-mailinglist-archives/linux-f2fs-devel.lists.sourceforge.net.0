Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FB44F55A2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Apr 2022 08:07:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nbyp5-00060C-2y; Wed, 06 Apr 2022 06:07:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+4210fbe0094d03a681f9+6800+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1nbyp3-0005z7-DS; Wed, 06 Apr 2022 06:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NOp84q6++z+7Q8uHeg5Eo+6RpSy907DQLMlmJxz0jNA=; b=d3jmUqLy+YHddkkwugjK7lu5+r
 tTLWEqApblJazS1LR9BbnBX9P0xTiRJ5uXCUZRVtdmUoBRI0a5fPRU02z6A4xQAJxlvNDcF2OUuKL
 Gk75wZXW/k5H+VwriYg9b1OBCl+DPPpnJV+TAFXw6Swb1XKArLFig/RldWZCHCB7gors=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NOp84q6++z+7Q8uHeg5Eo+6RpSy907DQLMlmJxz0jNA=; b=El2uvFk0LCHAg1+vC7QcFFr4X0
 0ODyOKVw+1f+ZQtmVOxCqiJAIPln+wYVpeXXQPqou3cPqk5538Q960UUb0P6uWE5XJrSUwF7PpSe6
 JYMCB3y6FWbmH7a6YfR5BunR/jPY8VncR6yKUXPYXcovcW/gAdqfNUK6DdvNVzb8T450=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nbyp0-0075Es-Dg; Wed, 06 Apr 2022 06:07:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=NOp84q6++z+7Q8uHeg5Eo+6RpSy907DQLMlmJxz0jNA=; b=x0wNRTcLaeYftxiAQHKnjFl7Vn
 /hNIgg5ccry8wDU5TCE6WgYOjTiZp9YqujuI++whmFTqsw0fREkq1tH7klAVk3pmLAa/vHev3jFYr
 5Uo3rvvo1MWb8QwRAP1dZFxhI0Bfnu3BhYUA18htho7Gml6Q9eqPi5Sf4OizAOcOpoH+YZW1H8RhC
 099eZsjue0ogmbtNemjif1xsWLrKF+3Ham/efjGVY9mH4VelWmsVaGjlStwrG8r8LKRw52oTWsFAM
 Fx2izGgUXVgVMYfVg1h9A89tjacutX9KXFnHjFje4IpvhhHqLIBqpqsszQ64x2qdAggtSvuRGQNGP
 5ZrfWKSw==;
Received: from 213-225-3-188.nat.highway.a1.net ([213.225.3.188]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbyoj-003vxb-Ew; Wed, 06 Apr 2022 06:06:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  6 Apr 2022 08:05:14 +0200
Message-Id: <20220406060516.409838-26-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406060516.409838-1-hch@lst.de>
References: <20220406060516.409838-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Just use a non-zero max_discard_sectors as an indicator for
 discard support, similar to what is done for write zeroes. The only places
 where needs special attention is the RAID5 driver, which must clear discard
 support for security reasons by default, even if the default stacking rules
 would allow for it. 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1nbyp0-0075Es-Dg
Subject: [f2fs-dev] [PATCH 25/27] block: remove QUEUE_FLAG_DISCARD
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
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 linux-um@lists.infradead.org, nbd@other.debian.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Just use a non-zero max_discard_sectors as an indicator for discard
support, similar to what is done for write zeroes.

The only places where needs special attention is the RAID5 driver,
which must clear discard support for security reasons by default,
even if the default stacking rules would allow for it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/um/drivers/ubd_kern.c    |  2 --
 block/blk-mq-debugfs.c        |  1 -
 drivers/block/drbd/drbd_nl.c  | 15 ---------------
 drivers/block/loop.c          |  2 --
 drivers/block/nbd.c           |  3 ---
 drivers/block/null_blk/main.c |  1 -
 drivers/block/rbd.c           |  1 -
 drivers/block/rnbd/rnbd-clt.c |  2 --
 drivers/block/virtio_blk.c    |  2 --
 drivers/block/xen-blkfront.c  |  2 --
 drivers/block/zram/zram_drv.c |  1 -
 drivers/md/bcache/super.c     |  1 -
 drivers/md/dm-table.c         |  5 +----
 drivers/md/dm-thin.c          |  2 --
 drivers/md/dm.c               |  1 -
 drivers/md/md-linear.c        |  9 ---------
 drivers/md/raid0.c            |  7 -------
 drivers/md/raid1.c            | 14 --------------
 drivers/md/raid10.c           | 14 --------------
 drivers/md/raid5.c            | 12 ++++--------
 drivers/mmc/core/queue.c      |  1 -
 drivers/mtd/mtd_blkdevs.c     |  1 -
 drivers/nvme/host/core.c      |  6 ++----
 drivers/s390/block/dasd_fba.c |  1 -
 drivers/scsi/sd.c             |  2 --
 include/linux/blkdev.h        |  2 --
 26 files changed, 7 insertions(+), 103 deletions(-)

diff --git a/arch/um/drivers/ubd_kern.c b/arch/um/drivers/ubd_kern.c
index b03269faef714..085ffdf98e57e 100644
--- a/arch/um/drivers/ubd_kern.c
+++ b/arch/um/drivers/ubd_kern.c
@@ -483,7 +483,6 @@ static void ubd_handler(void)
 			if ((io_req->error == BLK_STS_NOTSUPP) && (req_op(io_req->req) == REQ_OP_DISCARD)) {
 				blk_queue_max_discard_sectors(io_req->req->q, 0);
 				blk_queue_max_write_zeroes_sectors(io_req->req->q, 0);
-				blk_queue_flag_clear(QUEUE_FLAG_DISCARD, io_req->req->q);
 			}
 			blk_mq_end_request(io_req->req, io_req->error);
 			kfree(io_req);
@@ -803,7 +802,6 @@ static int ubd_open_dev(struct ubd *ubd_dev)
 		ubd_dev->queue->limits.discard_alignment = SECTOR_SIZE;
 		blk_queue_max_discard_sectors(ubd_dev->queue, UBD_MAX_REQUEST);
 		blk_queue_max_write_zeroes_sectors(ubd_dev->queue, UBD_MAX_REQUEST);
-		blk_queue_flag_set(QUEUE_FLAG_DISCARD, ubd_dev->queue);
 	}
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, ubd_dev->queue);
 	return 0;
diff --git a/block/blk-mq-debugfs.c b/block/blk-mq-debugfs.c
index aa0349e9f083b..fd111c5001256 100644
--- a/block/blk-mq-debugfs.c
+++ b/block/blk-mq-debugfs.c
@@ -113,7 +113,6 @@ static const char *const blk_queue_flag_name[] = {
 	QUEUE_FLAG_NAME(FAIL_IO),
 	QUEUE_FLAG_NAME(NONROT),
 	QUEUE_FLAG_NAME(IO_STAT),
-	QUEUE_FLAG_NAME(DISCARD),
 	QUEUE_FLAG_NAME(NOXMERGES),
 	QUEUE_FLAG_NAME(ADD_RANDOM),
 	QUEUE_FLAG_NAME(SECERASE),
diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 94ac3737723a8..0b3e43be6414d 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -1230,30 +1230,16 @@ static void decide_on_discard_support(struct drbd_device *device,
 	 */
 	blk_queue_discard_granularity(q, 512);
 	q->limits.max_discard_sectors = drbd_max_discard_sectors(connection);
-	blk_queue_flag_set(QUEUE_FLAG_DISCARD, q);
 	q->limits.max_write_zeroes_sectors =
 		drbd_max_discard_sectors(connection);
 	return;
 
 not_supported:
-	blk_queue_flag_clear(QUEUE_FLAG_DISCARD, q);
 	blk_queue_discard_granularity(q, 0);
 	q->limits.max_discard_sectors = 0;
 	q->limits.max_write_zeroes_sectors = 0;
 }
 
-static void fixup_discard_if_not_supported(struct request_queue *q)
-{
-	/* To avoid confusion, if this queue does not support discard, clear
-	 * max_discard_sectors, which is what lsblk -D reports to the user.
-	 * Older kernels got this wrong in "stack limits".
-	 * */
-	if (!blk_queue_discard(q)) {
-		blk_queue_max_discard_sectors(q, 0);
-		blk_queue_discard_granularity(q, 0);
-	}
-}
-
 static void fixup_write_zeroes(struct drbd_device *device, struct request_queue *q)
 {
 	/* Fixup max_write_zeroes_sectors after blk_stack_limits():
@@ -1300,7 +1286,6 @@ static void drbd_setup_queue_param(struct drbd_device *device, struct drbd_backi
 		blk_stack_limits(&q->limits, &b->limits, 0);
 		disk_update_readahead(device->vdisk);
 	}
-	fixup_discard_if_not_supported(q);
 	fixup_write_zeroes(device, q);
 }
 
diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index d5499795a1fec..976cf987b3920 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -784,12 +784,10 @@ static void loop_config_discard(struct loop_device *lo)
 		q->limits.discard_granularity = granularity;
 		blk_queue_max_discard_sectors(q, max_discard_sectors);
 		blk_queue_max_write_zeroes_sectors(q, max_discard_sectors);
-		blk_queue_flag_set(QUEUE_FLAG_DISCARD, q);
 	} else {
 		q->limits.discard_granularity = 0;
 		blk_queue_max_discard_sectors(q, 0);
 		blk_queue_max_write_zeroes_sectors(q, 0);
-		blk_queue_flag_clear(QUEUE_FLAG_DISCARD, q);
 	}
 	q->limits.discard_alignment = 0;
 }
diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 5a1f98494dddf..c7e03eabd205f 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1231,8 +1231,6 @@ static void nbd_parse_flags(struct nbd_device *nbd)
 		set_disk_ro(nbd->disk, true);
 	else
 		set_disk_ro(nbd->disk, false);
-	if (config->flags & NBD_FLAG_SEND_TRIM)
-		blk_queue_flag_set(QUEUE_FLAG_DISCARD, nbd->disk->queue);
 	if (config->flags & NBD_FLAG_SEND_FLUSH) {
 		if (config->flags & NBD_FLAG_SEND_FUA)
 			blk_queue_write_cache(nbd->disk->queue, true, true);
@@ -1320,7 +1318,6 @@ static void nbd_config_put(struct nbd_device *nbd)
 		nbd->disk->queue->limits.discard_granularity = 0;
 		nbd->disk->queue->limits.discard_alignment = 0;
 		blk_queue_max_discard_sectors(nbd->disk->queue, UINT_MAX);
-		blk_queue_flag_clear(QUEUE_FLAG_DISCARD, nbd->disk->queue);
 
 		mutex_unlock(&nbd->config_lock);
 		nbd_put(nbd);
diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
index 05b1120e66234..f6493a9e85ed3 100644
--- a/drivers/block/null_blk/main.c
+++ b/drivers/block/null_blk/main.c
@@ -1767,7 +1767,6 @@ static void null_config_discard(struct nullb *nullb)
 	nullb->q->limits.discard_granularity = nullb->dev->blocksize;
 	nullb->q->limits.discard_alignment = nullb->dev->blocksize;
 	blk_queue_max_discard_sectors(nullb->q, UINT_MAX >> 9);
-	blk_queue_flag_set(QUEUE_FLAG_DISCARD, nullb->q);
 }
 
 static const struct block_device_operations null_bio_ops = {
diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index b844432bad20b..2b21f717cce1a 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -4942,7 +4942,6 @@ static int rbd_init_disk(struct rbd_device *rbd_dev)
 	blk_queue_io_opt(q, rbd_dev->opts->alloc_size);
 
 	if (rbd_dev->opts->trim) {
-		blk_queue_flag_set(QUEUE_FLAG_DISCARD, q);
 		q->limits.discard_granularity = rbd_dev->opts->alloc_size;
 		blk_queue_max_discard_sectors(q, objset_bytes >> SECTOR_SHIFT);
 		blk_queue_max_write_zeroes_sectors(q, objset_bytes >> SECTOR_SHIFT);
diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
index b66e8840b94b8..efa99a3884507 100644
--- a/drivers/block/rnbd/rnbd-clt.c
+++ b/drivers/block/rnbd/rnbd-clt.c
@@ -1364,8 +1364,6 @@ static void setup_request_queue(struct rnbd_clt_dev *dev)
 	blk_queue_max_discard_sectors(dev->queue, dev->max_discard_sectors);
 	dev->queue->limits.discard_granularity	= dev->discard_granularity;
 	dev->queue->limits.discard_alignment	= dev->discard_alignment;
-	if (dev->max_discard_sectors)
-		blk_queue_flag_set(QUEUE_FLAG_DISCARD, dev->queue);
 	if (dev->secure_discard)
 		blk_queue_flag_set(QUEUE_FLAG_SECERASE, dev->queue);
 
diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index a8bcf3f664af1..6ccf15253dee1 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -888,8 +888,6 @@ static int virtblk_probe(struct virtio_device *vdev)
 			v = sg_elems;
 		blk_queue_max_discard_segments(q,
 					       min(v, MAX_DISCARD_SEGMENTS));
-
-		blk_queue_flag_set(QUEUE_FLAG_DISCARD, q);
 	}
 
 	if (virtio_has_feature(vdev, VIRTIO_BLK_F_WRITE_ZEROES)) {
diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 003056d4f7f5f..253bf835aca1f 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -944,7 +944,6 @@ static void blkif_set_queue_limits(struct blkfront_info *info)
 	blk_queue_flag_set(QUEUE_FLAG_VIRT, rq);
 
 	if (info->feature_discard) {
-		blk_queue_flag_set(QUEUE_FLAG_DISCARD, rq);
 		blk_queue_max_discard_sectors(rq, get_capacity(gd));
 		rq->limits.discard_granularity = info->discard_granularity ?:
 						 info->physical_sector_size;
@@ -1606,7 +1605,6 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
 				blkif_req(req)->error = BLK_STS_NOTSUPP;
 				info->feature_discard = 0;
 				info->feature_secdiscard = 0;
-				blk_queue_flag_clear(QUEUE_FLAG_DISCARD, rq);
 				blk_queue_flag_clear(QUEUE_FLAG_SECERASE, rq);
 			}
 			break;
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index e9474b02012de..59ff444bf6c76 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1952,7 +1952,6 @@ static int zram_add(void)
 	blk_queue_io_opt(zram->disk->queue, PAGE_SIZE);
 	zram->disk->queue->limits.discard_granularity = PAGE_SIZE;
 	blk_queue_max_discard_sectors(zram->disk->queue, UINT_MAX);
-	blk_queue_flag_set(QUEUE_FLAG_DISCARD, zram->disk->queue);
 
 	/*
 	 * zram_bio_discard() will clear all logical blocks if logical block
diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
index 296f200b2e208..2f49e31142f62 100644
--- a/drivers/md/bcache/super.c
+++ b/drivers/md/bcache/super.c
@@ -973,7 +973,6 @@ static int bcache_device_init(struct bcache_device *d, unsigned int block_size,
 
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, d->disk->queue);
 	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, d->disk->queue);
-	blk_queue_flag_set(QUEUE_FLAG_DISCARD, d->disk->queue);
 
 	blk_queue_write_cache(q, true, true);
 
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 4297c38328a9b..0dff6907fd00d 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1968,15 +1968,12 @@ int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
 		blk_queue_flag_clear(QUEUE_FLAG_NOWAIT, q);
 
 	if (!dm_table_supports_discards(t)) {
-		blk_queue_flag_clear(QUEUE_FLAG_DISCARD, q);
-		/* Must also clear discard limits... */
 		q->limits.max_discard_sectors = 0;
 		q->limits.max_hw_discard_sectors = 0;
 		q->limits.discard_granularity = 0;
 		q->limits.discard_alignment = 0;
 		q->limits.discard_misaligned = 0;
-	} else
-		blk_queue_flag_set(QUEUE_FLAG_DISCARD, q);
+	}
 
 	if (dm_table_supports_secure_erase(t))
 		blk_queue_flag_set(QUEUE_FLAG_SECERASE, q);
diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index cd333a3e4c33b..eded4bcc4545f 100644
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -4050,8 +4050,6 @@ static void pool_io_hints(struct dm_target *ti, struct queue_limits *limits)
 		/*
 		 * Must explicitly disallow stacking discard limits otherwise the
 		 * block layer will stack them if pool's data device has support.
-		 * QUEUE_FLAG_DISCARD wouldn't be set but there is no way for the
-		 * user to see that, so make sure to set all discard limits to 0.
 		 */
 		limits->discard_granularity = 0;
 		return;
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index ba75933cc22ca..dbbf64ce7e927 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -955,7 +955,6 @@ void disable_discard(struct mapped_device *md)
 
 	/* device doesn't really support DISCARD, disable it */
 	limits->max_discard_sectors = 0;
-	blk_queue_flag_clear(QUEUE_FLAG_DISCARD, md->queue);
 }
 
 void disable_write_zeroes(struct mapped_device *md)
diff --git a/drivers/md/md-linear.c b/drivers/md/md-linear.c
index 4dd5afff72844..138a3b25c5c82 100644
--- a/drivers/md/md-linear.c
+++ b/drivers/md/md-linear.c
@@ -64,7 +64,6 @@ static struct linear_conf *linear_conf(struct mddev *mddev, int raid_disks)
 	struct linear_conf *conf;
 	struct md_rdev *rdev;
 	int i, cnt;
-	bool discard_supported = false;
 
 	conf = kzalloc(struct_size(conf, disks, raid_disks), GFP_KERNEL);
 	if (!conf)
@@ -96,9 +95,6 @@ static struct linear_conf *linear_conf(struct mddev *mddev, int raid_disks)
 
 		conf->array_sectors += rdev->sectors;
 		cnt++;
-
-		if (bdev_max_discard_sectors(rdev->bdev))
-			discard_supported = true;
 	}
 	if (cnt != raid_disks) {
 		pr_warn("md/linear:%s: not enough drives present. Aborting!\n",
@@ -106,11 +102,6 @@ static struct linear_conf *linear_conf(struct mddev *mddev, int raid_disks)
 		goto out;
 	}
 
-	if (!discard_supported)
-		blk_queue_flag_clear(QUEUE_FLAG_DISCARD, mddev->queue);
-	else
-		blk_queue_flag_set(QUEUE_FLAG_DISCARD, mddev->queue);
-
 	/*
 	 * Here we calculate the device offsets.
 	 */
diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
index 02ac3ab213c72..7231f5e1eaa73 100644
--- a/drivers/md/raid0.c
+++ b/drivers/md/raid0.c
@@ -399,7 +399,6 @@ static int raid0_run(struct mddev *mddev)
 	conf = mddev->private;
 	if (mddev->queue) {
 		struct md_rdev *rdev;
-		bool discard_supported = false;
 
 		blk_queue_max_hw_sectors(mddev->queue, mddev->chunk_sectors);
 		blk_queue_max_write_zeroes_sectors(mddev->queue, mddev->chunk_sectors);
@@ -412,13 +411,7 @@ static int raid0_run(struct mddev *mddev)
 		rdev_for_each(rdev, mddev) {
 			disk_stack_limits(mddev->gendisk, rdev->bdev,
 					  rdev->data_offset << 9);
-			if (bdev_max_discard_sectors(rdev->bdev))
-				discard_supported = true;
 		}
-		if (!discard_supported)
-			blk_queue_flag_clear(QUEUE_FLAG_DISCARD, mddev->queue);
-		else
-			blk_queue_flag_set(QUEUE_FLAG_DISCARD, mddev->queue);
 	}
 
 	/* calculate array device size */
diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index 39b9cb4d54ee0..3da749d150a17 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -1826,8 +1826,6 @@ static int raid1_add_disk(struct mddev *mddev, struct md_rdev *rdev)
 			break;
 		}
 	}
-	if (mddev->queue && bdev_max_discard_sectors(rdev->bdev))
-		blk_queue_flag_set(QUEUE_FLAG_DISCARD, mddev->queue);
 	print_conf(conf);
 	return err;
 }
@@ -3106,7 +3104,6 @@ static int raid1_run(struct mddev *mddev)
 	int i;
 	struct md_rdev *rdev;
 	int ret;
-	bool discard_supported = false;
 
 	if (mddev->level != 1) {
 		pr_warn("md/raid1:%s: raid level not set to mirroring (%d)\n",
@@ -3141,8 +3138,6 @@ static int raid1_run(struct mddev *mddev)
 			continue;
 		disk_stack_limits(mddev->gendisk, rdev->bdev,
 				  rdev->data_offset << 9);
-		if (bdev_max_discard_sectors(rdev->bdev))
-			discard_supported = true;
 	}
 
 	mddev->degraded = 0;
@@ -3179,15 +3174,6 @@ static int raid1_run(struct mddev *mddev)
 
 	md_set_array_sectors(mddev, raid1_size(mddev, 0, 0));
 
-	if (mddev->queue) {
-		if (discard_supported)
-			blk_queue_flag_set(QUEUE_FLAG_DISCARD,
-						mddev->queue);
-		else
-			blk_queue_flag_clear(QUEUE_FLAG_DISCARD,
-						  mddev->queue);
-	}
-
 	ret = md_integrity_register(mddev);
 	if (ret) {
 		md_unregister_thread(&mddev->thread);
diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index eaa86c6a35a55..36a460015cf58 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -2144,8 +2144,6 @@ static int raid10_add_disk(struct mddev *mddev, struct md_rdev *rdev)
 		rcu_assign_pointer(p->rdev, rdev);
 		break;
 	}
-	if (mddev->queue && bdev_max_discard_sectors(rdev->bdev))
-		blk_queue_flag_set(QUEUE_FLAG_DISCARD, mddev->queue);
 
 	print_conf(conf);
 	return err;
@@ -4069,7 +4067,6 @@ static int raid10_run(struct mddev *mddev)
 	sector_t size;
 	sector_t min_offset_diff = 0;
 	int first = 1;
-	bool discard_supported = false;
 
 	if (mddev_init_writes_pending(mddev) < 0)
 		return -ENOMEM;
@@ -4140,20 +4137,9 @@ static int raid10_run(struct mddev *mddev)
 					  rdev->data_offset << 9);
 
 		disk->head_position = 0;
-
-		if (bdev_max_discard_sectors(rdev->bdev))
-			discard_supported = true;
 		first = 0;
 	}
 
-	if (mddev->queue) {
-		if (discard_supported)
-			blk_queue_flag_set(QUEUE_FLAG_DISCARD,
-						mddev->queue);
-		else
-			blk_queue_flag_clear(QUEUE_FLAG_DISCARD,
-						  mddev->queue);
-	}
 	/* need to check that every block has at least one working mirror */
 	if (!enough(conf, -1)) {
 		pr_err("md/raid10:%s: not enough operational mirrors.\n",
diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index 0bbae0e638666..59f91e392a2ae 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -7776,14 +7776,10 @@ static int raid5_run(struct mddev *mddev)
 		 * A better idea might be to turn DISCARD into WRITE_ZEROES
 		 * requests, as that is required to be safe.
 		 */
-		if (devices_handle_discard_safely &&
-		    mddev->queue->limits.max_discard_sectors >= (stripe >> 9) &&
-		    mddev->queue->limits.discard_granularity >= stripe)
-			blk_queue_flag_set(QUEUE_FLAG_DISCARD,
-						mddev->queue);
-		else
-			blk_queue_flag_clear(QUEUE_FLAG_DISCARD,
-						mddev->queue);
+		if (!devices_handle_discard_safely ||
+		    mddev->queue->limits.max_discard_sectors < (stripe >> 9) ||
+		    mddev->queue->limits.discard_granularity < stripe)
+			blk_queue_max_discard_sectors(mddev->queue, 0);
 
 		blk_queue_max_hw_sectors(mddev->queue, UINT_MAX);
 	}
diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
index c69b2d9df6f16..cac6315010a3d 100644
--- a/drivers/mmc/core/queue.c
+++ b/drivers/mmc/core/queue.c
@@ -183,7 +183,6 @@ static void mmc_queue_setup_discard(struct request_queue *q,
 	if (!max_discard)
 		return;
 
-	blk_queue_flag_set(QUEUE_FLAG_DISCARD, q);
 	blk_queue_max_discard_sectors(q, max_discard);
 	q->limits.discard_granularity = card->pref_erase << 9;
 	/* granularity must not be greater than max. discard */
diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 64d2b093f114b..f731721114655 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -377,7 +377,6 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, new->rq);
 
 	if (tr->discard) {
-		blk_queue_flag_set(QUEUE_FLAG_DISCARD, new->rq);
 		blk_queue_max_discard_sectors(new->rq, UINT_MAX);
 		new->rq->limits.discard_granularity = tr->blksize;
 	}
diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index efb85c6d8e2d5..7e07dd69262a7 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -1607,10 +1607,8 @@ static void nvme_config_discard(struct gendisk *disk, struct nvme_ns *ns)
 	struct request_queue *queue = disk->queue;
 	u32 size = queue_logical_block_size(queue);
 
-	if (ctrl->max_discard_sectors == 0) {
-		blk_queue_flag_clear(QUEUE_FLAG_DISCARD, queue);
+	if (ctrl->max_discard_sectors == 0)
 		return;
-	}
 
 	BUILD_BUG_ON(PAGE_SIZE / sizeof(struct nvme_dsm_range) <
 			NVME_DSM_MAX_RANGES);
@@ -1619,7 +1617,7 @@ static void nvme_config_discard(struct gendisk *disk, struct nvme_ns *ns)
 	queue->limits.discard_granularity = size;
 
 	/* If discard is already enabled, don't reset queue limits */
-	if (blk_queue_flag_test_and_set(QUEUE_FLAG_DISCARD, queue))
+	if (queue->limits.max_discard_sectors)
 		return;
 
 	blk_queue_max_discard_sectors(queue, ctrl->max_discard_sectors);
diff --git a/drivers/s390/block/dasd_fba.c b/drivers/s390/block/dasd_fba.c
index e084f4deddddd..8bd5665db9198 100644
--- a/drivers/s390/block/dasd_fba.c
+++ b/drivers/s390/block/dasd_fba.c
@@ -791,7 +791,6 @@ static void dasd_fba_setup_blk_queue(struct dasd_block *block)
 
 	blk_queue_max_discard_sectors(q, max_discard_sectors);
 	blk_queue_max_write_zeroes_sectors(q, max_discard_sectors);
-	blk_queue_flag_set(QUEUE_FLAG_DISCARD, q);
 }
 
 static int dasd_fba_pe_handler(struct dasd_device *device,
diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index a390679cf4584..444479657b7fd 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -797,7 +797,6 @@ static void sd_config_discard(struct scsi_disk *sdkp, unsigned int mode)
 	case SD_LBP_FULL:
 	case SD_LBP_DISABLE:
 		blk_queue_max_discard_sectors(q, 0);
-		blk_queue_flag_clear(QUEUE_FLAG_DISCARD, q);
 		return;
 
 	case SD_LBP_UNMAP:
@@ -830,7 +829,6 @@ static void sd_config_discard(struct scsi_disk *sdkp, unsigned int mode)
 	}
 
 	blk_queue_max_discard_sectors(q, max_blocks * (logical_block_size >> 9));
-	blk_queue_flag_set(QUEUE_FLAG_DISCARD, q);
 }
 
 static blk_status_t sd_setup_unmap_cmnd(struct scsi_cmnd *cmd)
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 7b9c0cf95d2d5..f1cf557ea20ef 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -540,7 +540,6 @@ struct request_queue {
 #define QUEUE_FLAG_NONROT	6	/* non-rotational device (SSD) */
 #define QUEUE_FLAG_VIRT		QUEUE_FLAG_NONROT /* paravirt device */
 #define QUEUE_FLAG_IO_STAT	7	/* do disk/partitions IO accounting */
-#define QUEUE_FLAG_DISCARD	8	/* supports DISCARD */
 #define QUEUE_FLAG_NOXMERGES	9	/* No extended merges */
 #define QUEUE_FLAG_ADD_RANDOM	10	/* Contributes to random pool */
 #define QUEUE_FLAG_SECERASE	11	/* supports secure erase */
@@ -582,7 +581,6 @@ bool blk_queue_flag_test_and_set(unsigned int flag, struct request_queue *q);
 	test_bit(QUEUE_FLAG_STABLE_WRITES, &(q)->queue_flags)
 #define blk_queue_io_stat(q)	test_bit(QUEUE_FLAG_IO_STAT, &(q)->queue_flags)
 #define blk_queue_add_random(q)	test_bit(QUEUE_FLAG_ADD_RANDOM, &(q)->queue_flags)
-#define blk_queue_discard(q)	test_bit(QUEUE_FLAG_DISCARD, &(q)->queue_flags)
 #define blk_queue_zone_resetall(q)	\
 	test_bit(QUEUE_FLAG_ZONE_RESETALL, &(q)->queue_flags)
 #define blk_queue_secure_erase(q) \
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
