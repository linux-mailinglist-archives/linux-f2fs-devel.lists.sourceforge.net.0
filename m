Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C197783C96D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jan 2024 18:09:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rT3ER-00023L-Rf;
	Thu, 25 Jan 2024 17:09:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=747d02328=johannes.thumshirn@wdc.com>)
 id 1rT3EO-000232-NH for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jan 2024 17:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2i0P4UtDfM2GvJlRWNENr44DBD4bzBaFXfbBxw+clIM=; b=g2u3i0ax+k7Z/dq45xgGkV17RC
 BaRxd+6Kz7f0ik6BLz0oCF4ultVTNCJFUbpdpMUI4WwDAQmpI3UxnTCkjNiIx2BBp9rDvl3/Upt5b
 LENukTW50JuDC7DXeGI7g53txy6AQS3Ymy1BzW7X9ofykTX1GOsMKU3mFHzRdpuJzJtE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2i0P4UtDfM2GvJlRWNENr44DBD4bzBaFXfbBxw+clIM=; b=E5AzLs63ttB1Ye8YTyoJARun8H
 lWw+IBCD/LQQXRdulsVPYlHEbnpA76+pKnlwx8qJ5ijvUeKxiUEcMkDP527gq1wXdxEalzEuouvAf
 owJaBvv7QeXzx2Gk32xOpTMxm3O/d9Cb3G/DS6PVs37BrIa96BsIekXccBNmkapS25/0=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rT3EN-0006th-RL for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jan 2024 17:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1706202576; x=1737738576;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=MadywNv3PPpA8atuGcDj3Vd17mnoG/ezGAm6iZoKSro=;
 b=SVNV2wc10GTLntt4hH/yB1SVh0uZS1D1Zd+7s6wcxVUryg6j7rdHpWI3
 A8S2YM8xAWJ8WeHFKQ78W+5pj+6ImAU41+PNhWKHtfw4PMAhuLd2gPNId
 cV3pjCVB8mt/meFbjpg3lxieplxPyGBco27HW79c+HdBLC3ySQFeazttJ
 1LqkMNYIOLrSYRiuISy/Go3MjxS6T1cOBma5vhpqTnXp6sdV6UJhH8So5
 eLVox7UmnO4yUnPLqEfBeJ14HxzdsMM1b9KCIgUmFHPG3klp/FZLYRyaC
 txOmaf76zUkwGk49/KPLW3XxCNPy3DxBmaRvFMQladPDbHIHUILYcszzL A==;
X-CSE-ConnectionGUID: GW1GCGGxRP65caKXT8zRRw==
X-CSE-MsgGUID: 8NvXJGmVR8+R6wWFnO/6kQ==
X-IronPort-AV: E=Sophos;i="6.05,216,1701100800"; 
   d="scan'208";a="7967092"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Jan 2024 00:53:44 +0800
IronPort-SDR: ssmk45hnkMR36xSw1tavbIuSuEbiYzKt+7uj5nnvR/vMWDSWoVnbReFUsBYhsGM589e5kMs4iE
 GWcR/DaWpctQ==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jan 2024 08:03:44 -0800
IronPort-SDR: iGbJfwTm9aux0HAHn2Hu4+5MaKexoPy7oBPg1gDFb4sShWjqtqNmtHUakx83XvcY7OzLhKfXSU
 svTD8SbpHGFQ==
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.6])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Jan 2024 08:53:41 -0800
Date: Thu, 25 Jan 2024 08:53:26 -0800
MIME-Version: 1.0
Message-Id: <20240125-zonefs_nofs-v2-3-2d975c8c1690@wdc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706201608; l=3714;
 i=johannes.thumshirn@wdc.com; s=20230613; h=from:subject:message-id;
 bh=MadywNv3PPpA8atuGcDj3Vd17mnoG/ezGAm6iZoKSro=;
 b=OeiWcP8kl57wFLapxrMUtXeqJjNXTQJbNM0ivK0560YCzP4hJ0iOZeaEiCTU0BJrEPblLrrlV
 hEAm7xgua+VD3na0CHCBXETqitu+y+6zukGX52zzUrvhHVDMFcgECJ1
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
 medium trust [68.232.141.245 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rT3EN-0006th-RL
Subject: [f2fs-dev] [PATCH v2 3/5] btrfs: zoned: call blkdev_zone_mgmt in
 nofs scope
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
