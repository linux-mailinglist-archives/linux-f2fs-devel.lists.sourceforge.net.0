Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F0E83FFA8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jan 2024 09:08:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUMgw-0007Aj-9u;
	Mon, 29 Jan 2024 08:08:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=751dad7dd=johannes.thumshirn@wdc.com>)
 id 1rUMgu-0007AR-7o for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 08:08:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OprZIc5x3JXJWrYpmAXfh+xYhkGHxMcyNWgp/sjyVgI=; b=GIJsf5/KfzosHUVajKN+0U+ZTZ
 4g7Dts5C1/p6FtGODqhvsQUW3jwLvRh5zWeXHoIg5UTzcU5kp51FpkLyyGkyVn0NDVisEpVcvdxw3
 OEhXlt1LqSlMh0fZH2eP7Y0cDAlrA63bLEWV/IzzXm1L6SzOhmmXS7zZMPjtmRb/YiYo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OprZIc5x3JXJWrYpmAXfh+xYhkGHxMcyNWgp/sjyVgI=; b=VnbgrfRWInRI/TdqSkXRrzmpby
 aNmlxlsqD/iags95AYi26g+GA8h5AupuPEfaXdFn1qEWCAivq8MeUHkPKqA5EUEGPZeyHhgB1DTXU
 IHkakpfbeaU0KB+YPhKf3NUkzbSNthnAhL32NTlaPkFwYAdQLTgW4PK0V+ZK1/3DSnos=;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rUMgs-0003AO-Ia for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 08:08:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1706515707; x=1738051707;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=PpBx+EPFfjh41Vxsoq76s95w7MJ2ZC/siDhDiJq7ERo=;
 b=djHMWJxvbgOWYM6sV7mF+2xTa2DpNeD+drfWNmKXaO1v+3bB6b7xkXFp
 pO5d8I+pyZyJaaUr/Tr+B4/oshOXIMCHTA4B1FHCP/s4qrjwD2OVLUuM7
 RRSvB6bi8kJmYEAvWjIHSRuZ7ntLt5pycNc77n+2Vl4uJ2eThrSYU2s75
 hoZPFnZpfBKQbAN+QvSZgyiCYzBXdtSRDhgUEGZqgDFLYhcx3wFQNn96F
 XNzvMGCkgTuuyo3+GStSwe3TvxBuTDwuM4IrvGWcUbySLVGOfymTy6PP2
 GL2yHccB4y7jjn8S3LUe+eNX3PuIgWJbbThZVgKqpBZmqiPpWQViQT7R+ g==;
X-CSE-ConnectionGUID: /LGbGStpR6SbS0C6FN4wvQ==
X-CSE-MsgGUID: 2VKh8H06TRCN30+0mVhyZg==
X-IronPort-AV: E=Sophos;i="6.05,226,1701100800"; 
   d="scan'208";a="7664689"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Jan 2024 15:52:44 +0800
IronPort-SDR: jHCMw69EQFkVIo4usy3q4TyGHzqREbZo3j+R4c7fuLcHvwJl9ButDL9pN1dZGN1g4aQyPRcsqY
 RmWaeVAKz32A==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jan 2024 22:56:59 -0800
IronPort-SDR: w3d8Eh2UpJd9ku1WKTx1l7lwBk19wKMIxKUulcA1HE+QC0AEAbgf1CiOpn4o1PvGPT4PiPry8K
 e+EhHc5cQv2w==
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.6])
 by uls-op-cesaip02.wdc.com with ESMTP; 28 Jan 2024 23:52:41 -0800
Date: Sun, 28 Jan 2024 23:52:20 -0800
MIME-Version: 1.0
Message-Id: <20240128-zonefs_nofs-v3-5-ae3b7c8def61@wdc.com>
References: <20240128-zonefs_nofs-v3-0-ae3b7c8def61@wdc.com>
In-Reply-To: <20240128-zonefs_nofs-v3-0-ae3b7c8def61@wdc.com>
To: Damien Le Moal <dlemoal@kernel.org>, 
 Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, 
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
 Mikulas Patocka <mpatocka@redhat.com>, dm-devel@lists.linux.dev, 
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Chao Yu <chao@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Chaitanya Kulkarni <kch@nvidia.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706514743; l=9256;
 i=johannes.thumshirn@wdc.com; s=20230613; h=from:subject:message-id;
 bh=PpBx+EPFfjh41Vxsoq76s95w7MJ2ZC/siDhDiJq7ERo=;
 b=oCtzmy3ITlmPQ0I/vbm4lgoeb/xUc1LeL2O2f6dsxxzA35tnxHEs/YC14icO27gxc0NReEIiH
 ZJVjIO0fA0FDTjArN8Omfw25NOwirlGb0nD0Nph+pcgva18XgTyEuAu
X-Developer-Key: i=johannes.thumshirn@wdc.com; a=ed25519;
 pk=TGmHKs78FdPi+QhrViEvjKIGwReUGCfa+3LEnGoR2KM=
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Now that all callers pass in GFP_KERNEL to blkdev_zone_mgmt()
 and use memalloc_no{io,fs}_{save,restore}() to define the allocation scope,
 we can drop the gfp_mask parameter from blkdev_zone_mgmt() as [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [216.71.154.42 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rUMgs-0003AO-Ia
Subject: [f2fs-dev] [PATCH v3 5/5] block: remove gfp_flags from
 blkdev_zone_mgmt
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
From: Johannes Thumshirn via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Cc: Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Now that all callers pass in GFP_KERNEL to blkdev_zone_mgmt() and use
memalloc_no{io,fs}_{save,restore}() to define the allocation scope, we can
drop the gfp_mask parameter from blkdev_zone_mgmt() as well as
blkdev_zone_reset_all() and blkdev_zone_reset_all_emulated().

Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 block/blk-zoned.c              | 19 ++++++++-----------
 drivers/md/dm-zoned-metadata.c |  2 +-
 drivers/nvme/target/zns.c      |  5 ++---
 fs/btrfs/zoned.c               | 14 +++++---------
 fs/f2fs/segment.c              |  4 ++--
 fs/zonefs/super.c              |  2 +-
 include/linux/blkdev.h         |  2 +-
 7 files changed, 20 insertions(+), 28 deletions(-)

diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index d343e5756a9c..d4f4f8325eff 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -177,8 +177,7 @@ static int blk_zone_need_reset_cb(struct blk_zone *zone, unsigned int idx,
 	}
 }
 
-static int blkdev_zone_reset_all_emulated(struct block_device *bdev,
-					  gfp_t gfp_mask)
+static int blkdev_zone_reset_all_emulated(struct block_device *bdev)
 {
 	struct gendisk *disk = bdev->bd_disk;
 	sector_t capacity = bdev_nr_sectors(bdev);
@@ -205,7 +204,7 @@ static int blkdev_zone_reset_all_emulated(struct block_device *bdev,
 		}
 
 		bio = blk_next_bio(bio, bdev, 0, REQ_OP_ZONE_RESET | REQ_SYNC,
-				   gfp_mask);
+				   GFP_KERNEL);
 		bio->bi_iter.bi_sector = sector;
 		sector += zone_sectors;
 
@@ -223,7 +222,7 @@ static int blkdev_zone_reset_all_emulated(struct block_device *bdev,
 	return ret;
 }
 
-static int blkdev_zone_reset_all(struct block_device *bdev, gfp_t gfp_mask)
+static int blkdev_zone_reset_all(struct block_device *bdev)
 {
 	struct bio bio;
 
@@ -238,7 +237,6 @@ static int blkdev_zone_reset_all(struct block_device *bdev, gfp_t gfp_mask)
  * @sector:	Start sector of the first zone to operate on
  * @nr_sectors:	Number of sectors, should be at least the length of one zone and
  *		must be zone size aligned.
- * @gfp_mask:	Memory allocation flags (for bio_alloc)
  *
  * Description:
  *    Perform the specified operation on the range of zones specified by
@@ -248,7 +246,7 @@ static int blkdev_zone_reset_all(struct block_device *bdev, gfp_t gfp_mask)
  *    or finish request.
  */
 int blkdev_zone_mgmt(struct block_device *bdev, enum req_op op,
-		     sector_t sector, sector_t nr_sectors, gfp_t gfp_mask)
+		     sector_t sector, sector_t nr_sectors)
 {
 	struct request_queue *q = bdev_get_queue(bdev);
 	sector_t zone_sectors = bdev_zone_sectors(bdev);
@@ -285,12 +283,12 @@ int blkdev_zone_mgmt(struct block_device *bdev, enum req_op op,
 	 */
 	if (op == REQ_OP_ZONE_RESET && sector == 0 && nr_sectors == capacity) {
 		if (!blk_queue_zone_resetall(q))
-			return blkdev_zone_reset_all_emulated(bdev, gfp_mask);
-		return blkdev_zone_reset_all(bdev, gfp_mask);
+			return blkdev_zone_reset_all_emulated(bdev);
+		return blkdev_zone_reset_all(bdev);
 	}
 
 	while (sector < end_sector) {
-		bio = blk_next_bio(bio, bdev, 0, op | REQ_SYNC, gfp_mask);
+		bio = blk_next_bio(bio, bdev, 0, op | REQ_SYNC, GFP_KERNEL);
 		bio->bi_iter.bi_sector = sector;
 		sector += zone_sectors;
 
@@ -419,8 +417,7 @@ int blkdev_zone_mgmt_ioctl(struct block_device *bdev, blk_mode_t mode,
 		return -ENOTTY;
 	}
 
-	ret = blkdev_zone_mgmt(bdev, op, zrange.sector, zrange.nr_sectors,
-			       GFP_KERNEL);
+	ret = blkdev_zone_mgmt(bdev, op, zrange.sector, zrange.nr_sectors);
 
 fail:
 	if (cmd == BLKRESETZONE)
diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 165996cc966c..8156881a31de 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1660,7 +1660,7 @@ static int dmz_reset_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 		noio_flag = memalloc_noio_save();
 		ret = blkdev_zone_mgmt(dev->bdev, REQ_OP_ZONE_RESET,
 				       dmz_start_sect(zmd, zone),
-				       zmd->zone_nr_sectors, GFP_KERNEL);
+				       zmd->zone_nr_sectors);
 		memalloc_noio_restore(noio_flag);
 		if (ret) {
 			dmz_dev_err(dev, "Reset zone %u failed %d",
diff --git a/drivers/nvme/target/zns.c b/drivers/nvme/target/zns.c
index 5b5c1e481722..3148d9f1bde6 100644
--- a/drivers/nvme/target/zns.c
+++ b/drivers/nvme/target/zns.c
@@ -456,8 +456,7 @@ static u16 nvmet_bdev_execute_zmgmt_send_all(struct nvmet_req *req)
 	switch (zsa_req_op(req->cmd->zms.zsa)) {
 	case REQ_OP_ZONE_RESET:
 		ret = blkdev_zone_mgmt(req->ns->bdev, REQ_OP_ZONE_RESET, 0,
-				       get_capacity(req->ns->bdev->bd_disk),
-				       GFP_KERNEL);
+				       get_capacity(req->ns->bdev->bd_disk));
 		if (ret < 0)
 			return blkdev_zone_mgmt_errno_to_nvme_status(ret);
 		break;
@@ -508,7 +507,7 @@ static void nvmet_bdev_zmgmt_send_work(struct work_struct *w)
 		goto out;
 	}
 
-	ret = blkdev_zone_mgmt(bdev, op, sect, zone_sectors, GFP_KERNEL);
+	ret = blkdev_zone_mgmt(bdev, op, sect, zone_sectors);
 	if (ret < 0)
 		status = blkdev_zone_mgmt_errno_to_nvme_status(ret);
 
diff --git a/fs/btrfs/zoned.c b/fs/btrfs/zoned.c
index 05640d61e435..cf2e779d8ef4 100644
--- a/fs/btrfs/zoned.c
+++ b/fs/btrfs/zoned.c
@@ -830,8 +830,7 @@ static int sb_log_location(struct block_device *bdev, struct blk_zone *zones,
 
 			nofs_flags = memalloc_nofs_save();
 			ret = blkdev_zone_mgmt(bdev, REQ_OP_ZONE_RESET,
-					       reset->start, reset->len,
-					       GFP_KERNEL);
+					       reset->start, reset->len);
 			memalloc_nofs_restore(nofs_flags);
 			if (ret)
 				return ret;
@@ -984,7 +983,7 @@ int btrfs_advance_sb_log(struct btrfs_device *device, int mirror)
 				nofs_flags = memalloc_nofs_save();
 				ret = blkdev_zone_mgmt(device->bdev,
 						REQ_OP_ZONE_FINISH, zone->start,
-						zone->len, GFP_KERNEL);
+						zone->len);
 				memalloc_nofs_restore(nofs_flags);
 				if (ret)
 					return ret;
@@ -1023,8 +1022,7 @@ int btrfs_reset_sb_log_zones(struct block_device *bdev, int mirror)
 	nofs_flags = memalloc_nofs_save();
 	ret = blkdev_zone_mgmt(bdev, REQ_OP_ZONE_RESET,
 			       zone_start_sector(sb_zone, bdev),
-			       zone_sectors * BTRFS_NR_SB_LOG_ZONES,
-			       GFP_KERNEL);
+			       zone_sectors * BTRFS_NR_SB_LOG_ZONES);
 	memalloc_nofs_restore(nofs_flags);
 	return ret;
 }
@@ -1143,8 +1141,7 @@ int btrfs_reset_device_zone(struct btrfs_device *device, u64 physical,
 	*bytes = 0;
 	nofs_flags = memalloc_nofs_save();
 	ret = blkdev_zone_mgmt(device->bdev, REQ_OP_ZONE_RESET,
-			       physical >> SECTOR_SHIFT, length >> SECTOR_SHIFT,
-			       GFP_KERNEL);
+			       physical >> SECTOR_SHIFT, length >> SECTOR_SHIFT);
 	memalloc_nofs_restore(nofs_flags);
 	if (ret)
 		return ret;
@@ -2258,8 +2255,7 @@ static int do_zone_finish(struct btrfs_block_group *block_group, bool fully_writ
 		nofs_flags = memalloc_nofs_save();
 		ret = blkdev_zone_mgmt(device->bdev, REQ_OP_ZONE_FINISH,
 				       physical >> SECTOR_SHIFT,
-				       zinfo->zone_size >> SECTOR_SHIFT,
-				       GFP_KERNEL);
+				       zinfo->zone_size >> SECTOR_SHIFT);
 		memalloc_nofs_restore(nofs_flags);
 
 		if (ret)
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 0094fe491364..e1065ba70207 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1977,7 +1977,7 @@ static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
 			trace_f2fs_issue_reset_zone(bdev, blkstart);
 			nofs_flags = memalloc_nofs_save();
 			ret = blkdev_zone_mgmt(bdev, REQ_OP_ZONE_RESET,
-						sector, nr_sects, GFP_KERNEL);
+						sector, nr_sects);
 			memalloc_nofs_restore(nofs_flags);
 			return ret;
 		}
@@ -4921,7 +4921,7 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
 
 	nofs_flags = memalloc_nofs_save();
 	ret = blkdev_zone_mgmt(fdev->bdev, REQ_OP_ZONE_FINISH,
-				zone->start, zone->len, GFP_KERNEL);
+				zone->start, zone->len);
 	memalloc_nofs_restore(nofs_flags);
 	if (ret == -EOPNOTSUPP) {
 		ret = blkdev_issue_zeroout(fdev->bdev, zone->wp,
diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
index 63fbac018c04..cadb1364f951 100644
--- a/fs/zonefs/super.c
+++ b/fs/zonefs/super.c
@@ -113,7 +113,7 @@ static int zonefs_zone_mgmt(struct super_block *sb,
 
 	trace_zonefs_zone_mgmt(sb, z, op);
 	ret = blkdev_zone_mgmt(sb->s_bdev, op, z->z_sector,
-			       z->z_size >> SECTOR_SHIFT, GFP_KERNEL);
+			       z->z_size >> SECTOR_SHIFT);
 	if (ret) {
 		zonefs_err(sb,
 			   "Zone management operation %s at %llu failed %d\n",
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 99e4f5e72213..8467c1910404 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -325,7 +325,7 @@ void disk_set_zoned(struct gendisk *disk);
 int blkdev_report_zones(struct block_device *bdev, sector_t sector,
 		unsigned int nr_zones, report_zones_cb cb, void *data);
 int blkdev_zone_mgmt(struct block_device *bdev, enum req_op op,
-		sector_t sectors, sector_t nr_sectors, gfp_t gfp_mask);
+		sector_t sectors, sector_t nr_sectors);
 int blk_revalidate_disk_zones(struct gendisk *disk,
 		void (*update_driver_data)(struct gendisk *disk));
 

-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
