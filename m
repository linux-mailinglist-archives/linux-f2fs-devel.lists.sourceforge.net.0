Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D87E838B39
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jan 2024 10:59:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rSDZM-0000AI-TH;
	Tue, 23 Jan 2024 09:59:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=745eb970d=johannes.thumshirn@wdc.com>)
 id 1rSDZJ-0000AB-LX for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jan 2024 09:59:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2i0P4UtDfM2GvJlRWNENr44DBD4bzBaFXfbBxw+clIM=; b=Vw09GhZmsq1fd1Rd/eNE54Vno7
 SlOX0y4nb7P0qO0RZxXJmsPYj7bNgLV9L6/HbS6Z0xKGSN4hoZoCFD6cw9w1cEY0klvitm7HEnvB9
 J9xspCCY4YmYFZ4z9qR4rlX6jwiBJnRj494X14Cg3Z1XvzXRJF1l6kqS9n/8BHH+sE7I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2i0P4UtDfM2GvJlRWNENr44DBD4bzBaFXfbBxw+clIM=; b=JHf0jSgc4P8/I8MY+SEWitXqFH
 TYpiGYVOURtkP6/kfBtaWxcof9Vc4XXnhwJhr6lsBoSu6Xbep1TBlsqKdOXP72r9fm0+tfSQsDD/s
 j0XxAEwBWacuTYPWug7iNjlHWlcUbT/ciAIrQmXcFBruSOEZPb2Yi4tv2Atf75IurbU0=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rSDZJ-0000SS-8g for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jan 2024 09:59:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1706003986; x=1737539986;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=MadywNv3PPpA8atuGcDj3Vd17mnoG/ezGAm6iZoKSro=;
 b=KU5yLQpeuHIYwFAIiDTELFVCyikrNDpKDvtn/qs+ojBIT+AZ7ZnYifzO
 V5L6fiDs7Hj6Fplfk8LNXjznn0VmotcsNMg7qzRMcewN31T5HNBjEukNi
 wWLgJLncMeuNrSUdhU1g1zGVLLIoLd+OuMJ1IyYyEA2UJ92OOzrkqMqAS
 GqZGQGL8bHgFvYrDVB5Vp3IPDxdDHhadZ17huPSp7sZ+j3xFuzMSAJZVP
 9yJsJ6HyMfQyfzYaPr64f0EJTb6YtJw9Vc/ujlQMCeIX/yg2yqL89mtX7
 vAMQQpICvfADf3c64iC8JSV0edbE5ehEzVFZxHm/RRhh8yXp31pgUs5Oq A==;
X-CSE-ConnectionGUID: y00rko1RRRuoXptPGYqwYQ==
X-CSE-MsgGUID: Q46SjgMsT7GvD0TWSWgkLw==
X-IronPort-AV: E=Sophos;i="6.05,214,1701100800"; 
   d="scan'208";a="7462069"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 23 Jan 2024 17:44:03 +0800
IronPort-SDR: QLj5/rXcItOLwaqhv7jBVrfTygx/BFb7Bzvv0qTL4G6EOdEk9MgutYYrTwQ28kg4W4gE8XHMSn
 Bg4QMp2vuIsQ==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jan 2024 00:48:24 -0800
IronPort-SDR: 7xViEHS0YVoU8QIBSZlE2HNgQcFT3xfQ37Zri4MllgAiZa3c0o68mcJ0f96h/q8NdnY3wFm02f
 wGbJDLOULVdw==
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.6])
 by uls-op-cesaip02.wdc.com with ESMTP; 23 Jan 2024 01:43:58 -0800
Date: Tue, 23 Jan 2024 01:43:44 -0800
MIME-Version: 1.0
Message-Id: <20240123-zonefs_nofs-v1-3-cc0b0308ef25@wdc.com>
References: <20240123-zonefs_nofs-v1-0-cc0b0308ef25@wdc.com>
In-Reply-To: <20240123-zonefs_nofs-v1-0-cc0b0308ef25@wdc.com>
To: Damien Le Moal <dlemoal@kernel.org>, 
 Naohiro Aota <naohiro.aota@wdc.com>, Mike Snitzer <snitzer@kernel.org>, 
 dm-devel@lists.linux.dev, Chris Mason <clm@fb.com>, 
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706003027; l=3714;
 i=johannes.thumshirn@wdc.com; s=20230613; h=from:subject:message-id;
 bh=MadywNv3PPpA8atuGcDj3Vd17mnoG/ezGAm6iZoKSro=;
 b=jPU1qJgKMZ/i7HaHjlom8VTdj+Lx2qczH6TOXRim9mYZ5nEhblVM5XvcT7furce1UQ/gp5Wif
 ATsugvKlk0ZDra9L5KrCXBHheheUpRSNG72vZtsTjnurB7EKtxGltU1
X-Developer-Key: i=johannes.thumshirn@wdc.com; a=ed25519;
 pk=TGmHKs78FdPi+QhrViEvjKIGwReUGCfa+3LEnGoR2KM=
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add a memalloc_nofs scope around all calls to
 blkdev_zone_mgmt().
 This allows us to further get rid of the GFP_NOFS argument for
 blkdev_zone_mgmt().
 Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com> ---
 fs/btrfs/zoned.c
 | 33 ++++++++++++++++++++++++++------- 1 file changed, 26 insertions(+),
 7 deletions(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [216.71.153.141 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rSDZJ-0000SS-8g
Subject: [f2fs-dev] [PATCH 3/5] btrfs: zoned: call blkdev_zone_mgmt in nofs
 scope
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
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add a memalloc_nofs scope around all calls to blkdev_zone_mgmt(). This
allows us to further get rid of the GFP_NOFS argument for
blkdev_zone_mgmt().

Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 fs/btrfs/zoned.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/fs/btrfs/zoned.c b/fs/btrfs/zoned.c
index 168af9d000d1..05640d61e435 100644
--- a/fs/btrfs/zoned.c
+++ b/fs/btrfs/zoned.c
@@ -824,11 +824,15 @@ static int sb_log_location(struct block_device *bdev, struct blk_zone *zones,
 			reset = &zones[1];
 
 		if (reset && reset->cond != BLK_ZONE_COND_EMPTY) {
+			unsigned int nofs_flags;
+
 			ASSERT(sb_zone_is_full(reset));
 
+			nofs_flags = memalloc_nofs_save();
 			ret = blkdev_zone_mgmt(bdev, REQ_OP_ZONE_RESET,
 					       reset->start, reset->len,
-					       GFP_NOFS);
+					       GFP_KERNEL);
+			memalloc_nofs_restore(nofs_flags);
 			if (ret)
 				return ret;
 
@@ -974,11 +978,14 @@ int btrfs_advance_sb_log(struct btrfs_device *device, int mirror)
 			 * explicit ZONE_FINISH is not necessary.
 			 */
 			if (zone->wp != zone->start + zone->capacity) {
+				unsigned int nofs_flags;
 				int ret;
 
+				nofs_flags = memalloc_nofs_save();
 				ret = blkdev_zone_mgmt(device->bdev,
 						REQ_OP_ZONE_FINISH, zone->start,
-						zone->len, GFP_NOFS);
+						zone->len, GFP_KERNEL);
+				memalloc_nofs_restore(nofs_flags);
 				if (ret)
 					return ret;
 			}
@@ -996,11 +1003,13 @@ int btrfs_advance_sb_log(struct btrfs_device *device, int mirror)
 
 int btrfs_reset_sb_log_zones(struct block_device *bdev, int mirror)
 {
+	unsigned int nofs_flags;
 	sector_t zone_sectors;
 	sector_t nr_sectors;
 	u8 zone_sectors_shift;
 	u32 sb_zone;
 	u32 nr_zones;
+	int ret;
 
 	zone_sectors = bdev_zone_sectors(bdev);
 	zone_sectors_shift = ilog2(zone_sectors);
@@ -1011,9 +1020,13 @@ int btrfs_reset_sb_log_zones(struct block_device *bdev, int mirror)
 	if (sb_zone + 1 >= nr_zones)
 		return -ENOENT;
 
-	return blkdev_zone_mgmt(bdev, REQ_OP_ZONE_RESET,
-				zone_start_sector(sb_zone, bdev),
-				zone_sectors * BTRFS_NR_SB_LOG_ZONES, GFP_NOFS);
+	nofs_flags = memalloc_nofs_save();
+	ret = blkdev_zone_mgmt(bdev, REQ_OP_ZONE_RESET,
+			       zone_start_sector(sb_zone, bdev),
+			       zone_sectors * BTRFS_NR_SB_LOG_ZONES,
+			       GFP_KERNEL);
+	memalloc_nofs_restore(nofs_flags);
+	return ret;
 }
 
 /*
@@ -1124,12 +1137,15 @@ static void btrfs_dev_clear_active_zone(struct btrfs_device *device, u64 pos)
 int btrfs_reset_device_zone(struct btrfs_device *device, u64 physical,
 			    u64 length, u64 *bytes)
 {
+	unsigned int nofs_flags;
 	int ret;
 
 	*bytes = 0;
+	nofs_flags = memalloc_nofs_save();
 	ret = blkdev_zone_mgmt(device->bdev, REQ_OP_ZONE_RESET,
 			       physical >> SECTOR_SHIFT, length >> SECTOR_SHIFT,
-			       GFP_NOFS);
+			       GFP_KERNEL);
+	memalloc_nofs_restore(nofs_flags);
 	if (ret)
 		return ret;
 
@@ -2234,14 +2250,17 @@ static int do_zone_finish(struct btrfs_block_group *block_group, bool fully_writ
 		struct btrfs_device *device = map->stripes[i].dev;
 		const u64 physical = map->stripes[i].physical;
 		struct btrfs_zoned_device_info *zinfo = device->zone_info;
+		unsigned int nofs_flags;
 
 		if (zinfo->max_active_zones == 0)
 			continue;
 
+		nofs_flags = memalloc_nofs_save();
 		ret = blkdev_zone_mgmt(device->bdev, REQ_OP_ZONE_FINISH,
 				       physical >> SECTOR_SHIFT,
 				       zinfo->zone_size >> SECTOR_SHIFT,
-				       GFP_NOFS);
+				       GFP_KERNEL);
+		memalloc_nofs_restore(nofs_flags);
 
 		if (ret)
 			return ret;

-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
