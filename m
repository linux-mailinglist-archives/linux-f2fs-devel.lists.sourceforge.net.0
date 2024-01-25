Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF6783C96B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jan 2024 18:09:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rT3ES-0001aF-SB;
	Thu, 25 Jan 2024 17:09:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=747d02328=johannes.thumshirn@wdc.com>)
 id 1rT3EQ-0001a4-QY for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jan 2024 17:09:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CLhezGN2ooOqwf1rRyp++iPoYB+U7gUCrqzkKgaViR0=; b=Sui7xFcZoTdemx9o16XSUVoVpL
 m9myWMeYdShsNY4uv+53VFr15dkcPBqPZzNsASTg+5U4l9ppl7dc9vzV+56yTtJKq0uhhKVVtxkw0
 wFfsTo/vi+iGeAT0Vm40tgxhSKpahyLKLsscxOY+D75JkhwTvip8M6gf5NOejTxHfRjs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CLhezGN2ooOqwf1rRyp++iPoYB+U7gUCrqzkKgaViR0=; b=nIkdy4uQB7n57Us90zXxQKYxGk
 cgfz8oezZUGswVQ/mO3wx5pOVUvY4t5zO3vqdQ0tU/TacBkt+PbeRLxZ9W2MMN8wkDLFIvGTwlXn/
 Y7M+ztvpHsA89KGsMJDX9/hO0lhzRfvQFKTpEDdAzR7QIKhgW3yGAMyZox5/3UXCC7p8=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rT3EP-0006th-8J for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jan 2024 17:09:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1706202577; x=1737738577;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=aOQGuVXVKnWXSkXzQjMJhwwtHyTg4oH1lbCa+QOjXsc=;
 b=MI6K1t/OckqA+bb7xSqN7gMnDE7IjotUNmVi6WHKPEQUVoY5jx2WrYFw
 lq/X6CrUYpO0MsvpqH6hyXAzAqNWF7GHiFXBhHVGvhEPDbF9BUetgqGcM
 Ds3di3ipviNJQI81t/T2ncmrVMK20yc4Wo4aRfI4uQQ9Zg0MHZC3ohgiA
 6eh2vlXIli+MhPcA+Ao+o/pi6A2B0egxC4ar7gvMK0wU9KvBT7o59T2lH
 uRJD1l2FTQYjcz5rAq3QSDntFWfVjHRlD85/wRNfJOqoPMfYzoKhEz8x0
 Fwycnb6axZXfT/S6p/YBOlfoJEIcVYFTWrBXSeOwzIwcpDWkIhR+245YZ A==;
X-CSE-ConnectionGUID: 0ArXqVS/Q8GWTyswGyjMOw==
X-CSE-MsgGUID: 3drb8QGLRFymR+l5oyjpRA==
X-IronPort-AV: E=Sophos;i="6.05,216,1701100800"; 
   d="scan'208";a="7967116"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Jan 2024 00:53:52 +0800
IronPort-SDR: 0LThULu3Mvnyij5E6Mx+kO4AAW5SOYYhDS1EF6rD4bgMkUupwkRVZ08JYg+xxnFq9zZmuhvV6W
 qdSAC6OtdnWg==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jan 2024 08:03:52 -0800
IronPort-SDR: TBCDD4Thkm8BrPR1XzWIPOZqfzdkz1041ne0LyGGutnRmfcC/stR3be2CIXXIpt7JC9paTeRFa
 RFgyYlmFlmlA==
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.6])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Jan 2024 08:53:49 -0800
Date: Thu, 25 Jan 2024 08:53:28 -0800
MIME-Version: 1.0
Message-Id: <20240125-zonefs_nofs-v2-5-2d975c8c1690@wdc.com>
References: <20240125-zonefs_nofs-v2-0-2d975c8c1690@wdc.com>
In-Reply-To: <20240125-zonefs_nofs-v2-0-2d975c8c1690@wdc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706201608; l=8572;
 i=johannes.thumshirn@wdc.com; s=20230613; h=from:subject:message-id;
 bh=aOQGuVXVKnWXSkXzQjMJhwwtHyTg4oH1lbCa+QOjXsc=;
 b=8HbsS72JbdVISVJtRSkp1fHOlxfE3YR6cby4sKXHjUFnvYpEI/MMFArO04UDtfIQfvhJkYxY5
 sfwKGXTd9KAAbvVOsOHpZ6pmMpLCZkWaDj9z/EQE1RRI+WHbigR7Vc0
X-Developer-Key: i=johannes.thumshirn@wdc.com; a=ed25519;
 pk=TGmHKs78FdPi+QhrViEvjKIGwReUGCfa+3LEnGoR2KM=
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 medium trust [68.232.141.245 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rT3EP-0006th-8J
Subject: [f2fs-dev] [PATCH v2 5/5] block: remove gfp_flags from
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
 block/blk-zoned.c         | 19 ++++++++-----------
 drivers/nvme/target/zns.c |  5 ++---
 fs/btrfs/zoned.c          | 14 +++++---------
 fs/f2fs/segment.c         |  4 ++--
 fs/zonefs/super.c         |  2 +-
 include/linux/blkdev.h    |  2 +-
 6 files changed, 19 insertions(+), 27 deletions(-)

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
