Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 77930723960
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Jun 2023 09:40:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6RJD-0001L7-BO;
	Tue, 06 Jun 2023 07:40:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+c7f58ba0a08136e81302+7226+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1q6RJA-0001Kw-UM for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 07:40:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CPDpKYJSnLYZhDc3U+EJIIIIm2ortrY+xO7VGsSNxTs=; b=D56HSs7ji6GjSWp4DfaHlJ+zqu
 /Bx3GRqlVpzaAck1j9vNaYXXEPe/7u9iONeX0p/mUfg6IuQnneijidcFeM6BpoGKf1vIpiU5FfnXx
 SWkBxjAV1Uz0uZQYlN/rVUwFrbXrzpRsC4vhTnr9rkjS3brCMXpT8O81u6oR6YclDoPA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CPDpKYJSnLYZhDc3U+EJIIIIm2ortrY+xO7VGsSNxTs=; b=aB/SlfvYpgpaSuWW7hdnRctyB1
 g4iZAt1TDtJ6CZsZgZ1WxCsNlQo9x64zXzVShxjzAHNsHTy/xjjYgN9jY+yC5WYhHFnGoHvrrGRpt
 kdXgv1lYCvtmwEUmo0wxsZcGkQ9lbkyEOUUZH2w0rdyu4eCwekjoWJZKvsrSE/EAzn/s=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6RJA-0003ZS-1r for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 07:40:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=CPDpKYJSnLYZhDc3U+EJIIIIm2ortrY+xO7VGsSNxTs=; b=DPjW2lr61HwYG7kn8UrnLGtnG4
 Jo1SAlgSzanH0bzj7QwS0IoBl+dHnlXCoPJBY9Sz5mUvvfMEkqi/6SoFw3/l2KiENLtF9mGFxOXzh
 pAaqy4klzMv0wyi646VVDQGb88OMIk6kKGw0404a7ug3rdA45OhtLLDnNL3tM546NDnNLMJu4tHBJ
 q3wyS098roi9WnflPGFk5lY3Ls1rFoWAnv75Rayu+7SiQQg5/sFhyTayj40BBI8aRveRML8wrbY+B
 dw8VZJGDX/VadvFPueCCohbBTONifAeg2CVtUlg73rRosZVsbgyn4U1C3B0K/9LlQtZNBPzOtX9Hc
 Z6D06zHw==;
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q6RIc-000Yoc-30; Tue, 06 Jun 2023 07:40:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue,  6 Jun 2023 09:39:26 +0200
Message-Id: <20230606073950.225178-8-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230606073950.225178-1-hch@lst.de>
References: <20230606073950.225178-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  bdev_check_media_change should only ever be called for the
 whole device. Pass a gendisk to make that explicit and rename the function
 to disk_check_media_change. Signed-off-by: Christoph Hellwig <hch@lst.de>
 --- block/disk-events.c | 18 +++++++++--------- drivers/block/amiflop.c |
 2 +- drivers/block/ataflop.c | 6 +++--- drivers/block/floppy.c | 16
 ++++++++---- [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q6RJA-0003ZS-1r
Subject: [f2fs-dev] [PATCH 07/31] block: pass a gendisk on
 bdev_check_media_change
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-nvme@lists.infradead.org,
 Phillip Potter <phil@philpotter.co.uk>, Chris Mason <clm@fb.com>,
 dm-devel@redhat.com, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Jack Wang <jinpu.wang@ionos.com>, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, linux-um@lists.infradead.org,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Christian Brauner <brauner@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

bdev_check_media_change should only ever be called for the whole device.
Pass a gendisk to make that explicit and rename the function to
disk_check_media_change.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/disk-events.c     | 18 +++++++++---------
 drivers/block/amiflop.c |  2 +-
 drivers/block/ataflop.c |  6 +++---
 drivers/block/floppy.c  | 16 ++++++++--------
 drivers/block/swim.c    |  2 +-
 drivers/block/swim3.c   |  2 +-
 drivers/cdrom/gdrom.c   |  2 +-
 drivers/md/md.c         |  2 +-
 drivers/scsi/sd.c       |  9 ++++-----
 drivers/scsi/sr.c       |  2 +-
 include/linux/blkdev.h  |  2 +-
 11 files changed, 31 insertions(+), 32 deletions(-)

diff --git a/block/disk-events.c b/block/disk-events.c
index aee25a7e1ab7de..8b1b63225738f8 100644
--- a/block/disk-events.c
+++ b/block/disk-events.c
@@ -263,31 +263,31 @@ static unsigned int disk_clear_events(struct gendisk *disk, unsigned int mask)
 }
 
 /**
- * bdev_check_media_change - check if a removable media has been changed
- * @bdev: block device to check
+ * disk_check_media_change - check if a removable media has been changed
+ * @disk: gendisk to check
  *
  * Check whether a removable media has been changed, and attempt to free all
  * dentries and inodes and invalidates all block device page cache entries in
  * that case.
  *
- * Returns %true if the block device changed, or %false if not.
+ * Returns %true if the media has changed, or %false if not.
  */
-bool bdev_check_media_change(struct block_device *bdev)
+bool disk_check_media_change(struct gendisk *disk)
 {
 	unsigned int events;
 
-	events = disk_clear_events(bdev->bd_disk, DISK_EVENT_MEDIA_CHANGE |
+	events = disk_clear_events(disk, DISK_EVENT_MEDIA_CHANGE |
 				   DISK_EVENT_EJECT_REQUEST);
 	if (!(events & DISK_EVENT_MEDIA_CHANGE))
 		return false;
 
-	if (__invalidate_device(bdev, true))
+	if (__invalidate_device(disk->part0, true))
 		pr_warn("VFS: busy inodes on changed media %s\n",
-			bdev->bd_disk->disk_name);
-	set_bit(GD_NEED_PART_SCAN, &bdev->bd_disk->state);
+			disk->disk_name);
+	set_bit(GD_NEED_PART_SCAN, &disk->state);
 	return true;
 }
-EXPORT_SYMBOL(bdev_check_media_change);
+EXPORT_SYMBOL(disk_check_media_change);
 
 /**
  * disk_force_media_change - force a media change event
diff --git a/drivers/block/amiflop.c b/drivers/block/amiflop.c
index 4c8b2ba579ee6d..6de12b311749a1 100644
--- a/drivers/block/amiflop.c
+++ b/drivers/block/amiflop.c
@@ -1675,7 +1675,7 @@ static int floppy_open(struct block_device *bdev, fmode_t mode)
 	}
 
 	if (mode & (FMODE_READ|FMODE_WRITE)) {
-		bdev_check_media_change(bdev);
+		disk_check_media_change(bdev->bd_disk);
 		if (mode & FMODE_WRITE) {
 			int wrprot;
 
diff --git a/drivers/block/ataflop.c b/drivers/block/ataflop.c
index 9deb4df6bdb8b2..da481ddbca90db 100644
--- a/drivers/block/ataflop.c
+++ b/drivers/block/ataflop.c
@@ -1760,8 +1760,8 @@ static int fd_locked_ioctl(struct block_device *bdev, fmode_t mode,
 		/* invalidate the buffer track to force a reread */
 		BufferDrive = -1;
 		set_bit(drive, &fake_change);
-		if (bdev_check_media_change(bdev))
-			floppy_revalidate(bdev->bd_disk);
+		if (disk_check_media_change(disk))
+			floppy_revalidate(disk);
 		return 0;
 	default:
 		return -EINVAL;
@@ -1938,7 +1938,7 @@ static int floppy_open(struct block_device *bdev, fmode_t mode)
 		return 0;
 
 	if (mode & (FMODE_READ|FMODE_WRITE)) {
-		if (bdev_check_media_change(bdev))
+		if (disk_check_media_change(bdev->bd_disk))
 			floppy_revalidate(bdev->bd_disk);
 		if (mode & FMODE_WRITE) {
 			if (p->wpstat) {
diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index 28ec6b442e9c58..3accafcbc95c85 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -3210,13 +3210,13 @@ static int floppy_raw_cmd_ioctl(int type, int drive, int cmd,
 
 #endif
 
-static int invalidate_drive(struct block_device *bdev)
+static int invalidate_drive(struct gendisk *disk)
 {
 	/* invalidate the buffer track to force a reread */
-	set_bit((long)bdev->bd_disk->private_data, &fake_change);
+	set_bit((long)disk->private_data, &fake_change);
 	process_fd_request();
-	if (bdev_check_media_change(bdev))
-		floppy_revalidate(bdev->bd_disk);
+	if (disk_check_media_change(disk))
+		floppy_revalidate(disk);
 	return 0;
 }
 
@@ -3287,7 +3287,7 @@ static int set_geometry(unsigned int cmd, struct floppy_struct *g,
 		    drive_state[current_drive].maxtrack ||
 		    ((user_params[drive].sect ^ oldStretch) &
 		     (FD_SWAPSIDES | FD_SECTBASEMASK)))
-			invalidate_drive(bdev);
+			invalidate_drive(bdev->bd_disk);
 		else
 			process_fd_request();
 	}
@@ -3464,7 +3464,7 @@ static int fd_locked_ioctl(struct block_device *bdev, fmode_t mode, unsigned int
 		current_type[drive] = NULL;
 		floppy_sizes[drive] = MAX_DISK_SIZE << 1;
 		drive_state[drive].keep_data = 0;
-		return invalidate_drive(bdev);
+		return invalidate_drive(bdev->bd_disk);
 	case FDSETPRM:
 	case FDDEFPRM:
 		return set_geometry(cmd, &inparam.g, drive, type, bdev);
@@ -3503,7 +3503,7 @@ static int fd_locked_ioctl(struct block_device *bdev, fmode_t mode, unsigned int
 	case FDFLUSH:
 		if (lock_fdc(drive))
 			return -EINTR;
-		return invalidate_drive(bdev);
+		return invalidate_drive(bdev->bd_disk);
 	case FDSETEMSGTRESH:
 		drive_params[drive].max_errors.reporting = (unsigned short)(param & 0x0f);
 		return 0;
@@ -4054,7 +4054,7 @@ static int floppy_open(struct block_device *bdev, fmode_t mode)
 			drive_state[drive].last_checked = 0;
 			clear_bit(FD_OPEN_SHOULD_FAIL_BIT,
 				  &drive_state[drive].flags);
-			if (bdev_check_media_change(bdev))
+			if (disk_check_media_change(bdev->bd_disk))
 				floppy_revalidate(bdev->bd_disk);
 			if (test_bit(FD_DISK_CHANGED_BIT, &drive_state[drive].flags))
 				goto out;
diff --git a/drivers/block/swim.c b/drivers/block/swim.c
index 42b4b682869096..105bc5fd1b8c62 100644
--- a/drivers/block/swim.c
+++ b/drivers/block/swim.c
@@ -640,7 +640,7 @@ static int floppy_open(struct block_device *bdev, fmode_t mode)
 		return 0;
 
 	if (mode & (FMODE_READ|FMODE_WRITE)) {
-		if (bdev_check_media_change(bdev) && fs->disk_in)
+		if (disk_check_media_change(bdev->bd_disk) && fs->disk_in)
 			fs->ejected = 0;
 		if ((mode & FMODE_WRITE) && fs->write_protected) {
 			err = -EROFS;
diff --git a/drivers/block/swim3.c b/drivers/block/swim3.c
index da811a7da03f3d..3d689ba312f568 100644
--- a/drivers/block/swim3.c
+++ b/drivers/block/swim3.c
@@ -963,7 +963,7 @@ static int floppy_open(struct block_device *bdev, fmode_t mode)
 
 	if (err == 0 && (mode & FMODE_NDELAY) == 0
 	    && (mode & (FMODE_READ|FMODE_WRITE))) {
-		if (bdev_check_media_change(bdev))
+		if (disk_check_media_change(bdev->bd_disk))
 			floppy_revalidate(bdev->bd_disk);
 		if (fs->ejected)
 			err = -ENXIO;
diff --git a/drivers/cdrom/gdrom.c b/drivers/cdrom/gdrom.c
index a401dc4218a998..3cb92df38ebeb8 100644
--- a/drivers/cdrom/gdrom.c
+++ b/drivers/cdrom/gdrom.c
@@ -478,7 +478,7 @@ static int gdrom_bdops_open(struct block_device *bdev, fmode_t mode)
 {
 	int ret;
 
-	bdev_check_media_change(bdev);
+	disk_check_media_change(bdev->bd_disk);
 
 	mutex_lock(&gdrom_mutex);
 	ret = cdrom_open(gd.cd_info);
diff --git a/drivers/md/md.c b/drivers/md/md.c
index fabf9c543735b6..77046c91bea439 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -7789,7 +7789,7 @@ static int md_open(struct block_device *bdev, fmode_t mode)
 	atomic_inc(&mddev->openers);
 	mutex_unlock(&mddev->open_mutex);
 
-	bdev_check_media_change(bdev);
+	disk_check_media_change(bdev->bd_disk);
 	return 0;
 
 out_unlock:
diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 1624d528aa1f9c..aab649d5bad3f8 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -1280,11 +1280,10 @@ static void sd_uninit_command(struct scsi_cmnd *SCpnt)
 		mempool_free(rq->special_vec.bv_page, sd_page_pool);
 }
 
-static bool sd_need_revalidate(struct block_device *bdev,
-		struct scsi_disk *sdkp)
+static bool sd_need_revalidate(struct gendisk *disk, struct scsi_disk *sdkp)
 {
 	if (sdkp->device->removable || sdkp->write_prot) {
-		if (bdev_check_media_change(bdev))
+		if (disk_check_media_change(disk))
 			return true;
 	}
 
@@ -1293,7 +1292,7 @@ static bool sd_need_revalidate(struct block_device *bdev,
 	 * nothing to do with partitions, BLKRRPART is used to force a full
 	 * revalidate after things like a format for historical reasons.
 	 */
-	return test_bit(GD_NEED_PART_SCAN, &bdev->bd_disk->state);
+	return test_bit(GD_NEED_PART_SCAN, &disk->state);
 }
 
 /**
@@ -1330,7 +1329,7 @@ static int sd_open(struct block_device *bdev, fmode_t mode)
 	if (!scsi_block_when_processing_errors(sdev))
 		goto error_out;
 
-	if (sd_need_revalidate(bdev, sdkp))
+	if (sd_need_revalidate(bdev->bd_disk, sdkp))
 		sd_revalidate_disk(bdev->bd_disk);
 
 	/*
diff --git a/drivers/scsi/sr.c b/drivers/scsi/sr.c
index 6d33120ee5ba85..1592e6e10c7452 100644
--- a/drivers/scsi/sr.c
+++ b/drivers/scsi/sr.c
@@ -494,7 +494,7 @@ static int sr_block_open(struct block_device *bdev, fmode_t mode)
 		return -ENXIO;
 
 	scsi_autopm_get_device(sdev);
-	if (bdev_check_media_change(bdev))
+	if (disk_check_media_change(bdev->bd_disk))
 		sr_revalidate_disk(cd);
 
 	mutex_lock(&cd->lock);
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index f4c339d9dd03de..a1688eba7e5e9a 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -817,7 +817,7 @@ int __register_blkdev(unsigned int major, const char *name,
 	__register_blkdev(major, name, NULL)
 void unregister_blkdev(unsigned int major, const char *name);
 
-bool bdev_check_media_change(struct block_device *bdev);
+bool disk_check_media_change(struct gendisk *disk);
 int __invalidate_device(struct block_device *bdev, bool kill_dirty);
 void set_capacity(struct gendisk *disk, sector_t size);
 
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
