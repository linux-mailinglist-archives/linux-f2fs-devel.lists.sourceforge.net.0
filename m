Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EFF4F5574
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Apr 2022 08:06:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nbyoE-0005hK-95; Wed, 06 Apr 2022 06:06:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+4210fbe0094d03a681f9+6800+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1nbyoC-0005gs-Br; Wed, 06 Apr 2022 06:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fS7/GWADeMq24JkrHR7r65A2kLOtCr2spfkGah3kNA8=; b=G1LW+cWqOBK+HIqNSpTnGZ5280
 kChyX7ECoQzue/srsPQyYDCiMjCPwhwUbSouXTQwCizTllxgp8P/Rk0TciUePE/88UEXvMNeiuSaZ
 A5OREU/vu9SudrEniNtY1+zSMI3YXND0Hk4qO5j2C2IulDQCSyba+t8eFQmWyrSSqgd4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fS7/GWADeMq24JkrHR7r65A2kLOtCr2spfkGah3kNA8=; b=JC6Rw3CALK3zo/xqfe68eM8tlR
 Zp+jdwM3OtlPic3m6G/i8joBAipfO2OUiTkAxqUucgHVd4vPfZdEysV/gUP2OwomxMwmc2YUxiXO8
 bIMzEZKkNh1TUU9Infpgf00/bJqrc2GK4FcPok+uLHrz1Rb3afKoI4bcHZf/DZWG2nIY=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nbyo8-0000vs-RB; Wed, 06 Apr 2022 06:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=fS7/GWADeMq24JkrHR7r65A2kLOtCr2spfkGah3kNA8=; b=g32cCmyoUy2MRlX0jWgIKinv+J
 6HwpKjKiI/eRm+arkMK8TDswHRb73J8oTKSPnBofpTn14CEPyZoL01LqRjOtvyeXKFbsLDY3Nu7L4
 anEeb5+Aggr57EqWzZhxUaoJl9+gXGyNXHJMgbvEjwHLJg1kWbsYeqVpTbUmO0PiRUa8HmB2BNopv
 E3SfKbkMcTFFucBFZBhqgBji8PB09nLkBt9kHo7dRWBJH6O6HDJqa04XAMJtLW1qyTBz/MlzTUMIT
 UHal0RTYppwHeRMujtLS1mBLPZW+YY1ixxf0vQcYig56Z67v/avCgsL3+TyKFAe55JAIlZttPrHVS
 y4heheIQ==;
Received: from 213-225-3-188.nat.highway.a1.net ([213.225.3.188]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbynm-003v6R-De; Wed, 06 Apr 2022 06:05:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  6 Apr 2022 08:04:59 +0200
Message-Id: <20220406060516.409838-11-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406060516.409838-1-hch@lst.de>
References: <20220406060516.409838-1-hch@lst.de>
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
 Content preview: Add a helper to check the nonrot flag based on the
 block_device
 instead of having to poke into the block layer internal request_queue.
 Signed-off-by:
 Christoph Hellwig <hch@lst.de> --- block/ioctl.c | 2 +- drivers/block/loop.c
 | 2 +- drivers/md/dm-table.c | 4 +--- drivers/md/md.c | 3 +--
 drivers/md/raid1.c | 2 +- drivers/md/raid10.c [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nbyo8-0000vs-RB
Subject: [f2fs-dev] [PATCH 10/27] block: add a bdev_nonrot helper
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

Add a helper to check the nonrot flag based on the block_device instead
of having to poke into the block layer internal request_queue.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/ioctl.c                       | 2 +-
 drivers/block/loop.c                | 2 +-
 drivers/md/dm-table.c               | 4 +---
 drivers/md/md.c                     | 3 +--
 drivers/md/raid1.c                  | 2 +-
 drivers/md/raid10.c                 | 2 +-
 drivers/md/raid5.c                  | 2 +-
 drivers/target/target_core_file.c   | 3 +--
 drivers/target/target_core_iblock.c | 2 +-
 fs/btrfs/volumes.c                  | 4 ++--
 fs/ext4/mballoc.c                   | 2 +-
 include/linux/blkdev.h              | 5 +++++
 mm/swapfile.c                       | 4 ++--
 13 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/block/ioctl.c b/block/ioctl.c
index 4a86340133e46..ad3771b268b81 100644
--- a/block/ioctl.c
+++ b/block/ioctl.c
@@ -489,7 +489,7 @@ static int blkdev_common_ioctl(struct block_device *bdev, fmode_t mode,
 				    queue_max_sectors(bdev_get_queue(bdev)));
 		return put_ushort(argp, max_sectors);
 	case BLKROTATIONAL:
-		return put_ushort(argp, !blk_queue_nonrot(bdev_get_queue(bdev)));
+		return put_ushort(argp, !bdev_nonrot(bdev));
 	case BLKRASET:
 	case BLKFRASET:
 		if(!capable(CAP_SYS_ADMIN))
diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index a58595f5ee2c8..8d800d46e4985 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -903,7 +903,7 @@ static void loop_update_rotational(struct loop_device *lo)
 
 	/* not all filesystems (e.g. tmpfs) have a sb->s_bdev */
 	if (file_bdev)
-		nonrot = blk_queue_nonrot(bdev_get_queue(file_bdev));
+		nonrot = bdev_nonrot(file_bdev);
 
 	if (nonrot)
 		blk_queue_flag_set(QUEUE_FLAG_NONROT, q);
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 03541cfc2317c..5e38d0dd009d5 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1820,9 +1820,7 @@ static int device_dax_write_cache_enabled(struct dm_target *ti,
 static int device_is_rotational(struct dm_target *ti, struct dm_dev *dev,
 				sector_t start, sector_t len, void *data)
 {
-	struct request_queue *q = bdev_get_queue(dev->bdev);
-
-	return !blk_queue_nonrot(q);
+	return !bdev_nonrot(dev->bdev);
 }
 
 static int device_is_not_random(struct dm_target *ti, struct dm_dev *dev,
diff --git a/drivers/md/md.c b/drivers/md/md.c
index 309b3af906ad3..19636c2f2cda4 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -5991,8 +5991,7 @@ int md_run(struct mddev *mddev)
 		bool nonrot = true;
 
 		rdev_for_each(rdev, mddev) {
-			if (rdev->raid_disk >= 0 &&
-			    !blk_queue_nonrot(bdev_get_queue(rdev->bdev))) {
+			if (rdev->raid_disk >= 0 && !bdev_nonrot(rdev->bdev)) {
 				nonrot = false;
 				break;
 			}
diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index 99d5464a51f81..d81b896855f9f 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -704,7 +704,7 @@ static int read_balance(struct r1conf *conf, struct r1bio *r1_bio, int *max_sect
 			/* At least two disks to choose from so failfast is OK */
 			set_bit(R1BIO_FailFast, &r1_bio->state);
 
-		nonrot = blk_queue_nonrot(bdev_get_queue(rdev->bdev));
+		nonrot = bdev_nonrot(rdev->bdev);
 		has_nonrot_disk |= nonrot;
 		pending = atomic_read(&rdev->nr_pending);
 		dist = abs(this_sector - conf->mirrors[disk].head_position);
diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index dfe7d62d3fbdd..7816c8b2e8087 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -796,7 +796,7 @@ static struct md_rdev *read_balance(struct r10conf *conf,
 		if (!do_balance)
 			break;
 
-		nonrot = blk_queue_nonrot(bdev_get_queue(rdev->bdev));
+		nonrot = bdev_nonrot(rdev->bdev);
 		has_nonrot_disk |= nonrot;
 		pending = atomic_read(&rdev->nr_pending);
 		if (min_pending > pending && nonrot) {
diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index 351d341a1ffa4..0bbae0e638666 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -7242,7 +7242,7 @@ static struct r5conf *setup_conf(struct mddev *mddev)
 	rdev_for_each(rdev, mddev) {
 		if (test_bit(Journal, &rdev->flags))
 			continue;
-		if (blk_queue_nonrot(bdev_get_queue(rdev->bdev))) {
+		if (bdev_nonrot(rdev->bdev)) {
 			conf->batch_bio_dispatch = false;
 			break;
 		}
diff --git a/drivers/target/target_core_file.c b/drivers/target/target_core_file.c
index 8d191fdc33217..b6ba582b06775 100644
--- a/drivers/target/target_core_file.c
+++ b/drivers/target/target_core_file.c
@@ -135,7 +135,6 @@ static int fd_configure_device(struct se_device *dev)
 	inode = file->f_mapping->host;
 	if (S_ISBLK(inode->i_mode)) {
 		struct block_device *bdev = I_BDEV(inode);
-		struct request_queue *q = bdev_get_queue(bdev);
 		unsigned long long dev_size;
 
 		fd_dev->fd_block_size = bdev_logical_block_size(bdev);
@@ -160,7 +159,7 @@ static int fd_configure_device(struct se_device *dev)
 		 */
 		dev->dev_attrib.max_write_same_len = 0xFFFF;
 
-		if (blk_queue_nonrot(q))
+		if (bdev_nonrot(bdev))
 			dev->dev_attrib.is_nonrot = 1;
 	} else {
 		if (!(fd_dev->fbd_flags & FBDF_HAS_SIZE)) {
diff --git a/drivers/target/target_core_iblock.c b/drivers/target/target_core_iblock.c
index b886ce1770bfd..b41ee5c3b5b82 100644
--- a/drivers/target/target_core_iblock.c
+++ b/drivers/target/target_core_iblock.c
@@ -133,7 +133,7 @@ static int iblock_configure_device(struct se_device *dev)
 	else
 		dev->dev_attrib.max_write_same_len = 0xFFFF;
 
-	if (blk_queue_nonrot(q))
+	if (bdev_nonrot(bd))
 		dev->dev_attrib.is_nonrot = 1;
 
 	bi = bdev_get_integrity(bd);
diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index 1be7cb2f955fc..1e68674e2cd82 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -643,7 +643,7 @@ static int btrfs_open_one_device(struct btrfs_fs_devices *fs_devices,
 			set_bit(BTRFS_DEV_STATE_WRITEABLE, &device->dev_state);
 	}
 
-	if (!blk_queue_nonrot(bdev_get_queue(bdev)))
+	if (!bdev_nonrot(bdev))
 		fs_devices->rotating = true;
 
 	device->bdev = bdev;
@@ -2715,7 +2715,7 @@ int btrfs_init_new_device(struct btrfs_fs_info *fs_info, const char *device_path
 
 	atomic64_add(device->total_bytes, &fs_info->free_chunk_space);
 
-	if (!blk_queue_nonrot(bdev_get_queue(bdev)))
+	if (!bdev_nonrot(bdev))
 		fs_devices->rotating = true;
 
 	orig_super_total_bytes = btrfs_super_total_bytes(fs_info->super_copy);
diff --git a/fs/ext4/mballoc.c b/fs/ext4/mballoc.c
index 252c168454c7f..c3668c977cd99 100644
--- a/fs/ext4/mballoc.c
+++ b/fs/ext4/mballoc.c
@@ -3498,7 +3498,7 @@ int ext4_mb_init(struct super_block *sb)
 		spin_lock_init(&lg->lg_prealloc_lock);
 	}
 
-	if (blk_queue_nonrot(bdev_get_queue(sb->s_bdev)))
+	if (bdev_nonrot(sb->s_bdev))
 		sbi->s_mb_max_linear_groups = 0;
 	else
 		sbi->s_mb_max_linear_groups = MB_DEFAULT_LINEAR_LIMIT;
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 60d0161389971..3a9578e14a6b0 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1326,6 +1326,11 @@ static inline unsigned int bdev_write_zeroes_sectors(struct block_device *bdev)
 	return 0;
 }
 
+static inline bool bdev_nonrot(struct block_device *bdev)
+{
+	return blk_queue_nonrot(bdev_get_queue(bdev));
+}
+
 static inline enum blk_zoned_model bdev_zoned_model(struct block_device *bdev)
 {
 	struct request_queue *q = bdev_get_queue(bdev);
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 4c7537162af5e..d5ab7ec4d92ca 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -2466,7 +2466,7 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	if (p->flags & SWP_CONTINUED)
 		free_swap_count_continuations(p);
 
-	if (!p->bdev || !blk_queue_nonrot(bdev_get_queue(p->bdev)))
+	if (!p->bdev || !bdev_nonrot(p->bdev))
 		atomic_dec(&nr_rotate_swap);
 
 	mutex_lock(&swapon_mutex);
@@ -3071,7 +3071,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	if (p->bdev && p->bdev->bd_disk->fops->rw_page)
 		p->flags |= SWP_SYNCHRONOUS_IO;
 
-	if (p->bdev && blk_queue_nonrot(bdev_get_queue(p->bdev))) {
+	if (p->bdev && bdev_nonrot(p->bdev)) {
 		int cpu;
 		unsigned long ci, nr_cluster;
 
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
