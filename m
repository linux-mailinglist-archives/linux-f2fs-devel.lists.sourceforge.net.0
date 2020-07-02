Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23416212911
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Jul 2020 18:10:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jr1mz-0002d6-VA; Thu, 02 Jul 2020 16:10:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=44573aa05=aravind.ramesh@wdc.com>)
 id 1jr1mz-0002cw-0h
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jul 2020 16:10:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xCKjIlPaA7JFTATK0obclbXby+jF7EY7JMfly+LykHo=; b=d2Vq3f6p9HQeMOvAYOOVLJUGfZ
 cjSUr7+yhgBD9+n8I2GJTRBMp+kIhqSfRvhLXPUMSGGfoWHzMbZG5o/WOqO22VOnyVZQICTJ+ntZX
 kFqKHBK3n7nTbS1tetX0PKqa/K6Kav33XZDQBCXOpUAaoE3X3W1h3g9dhtTlwIp0/GDg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xCKjIlPaA7JFTATK0obclbXby+jF7EY7JMfly+LykHo=; b=nONnwnthRc4fgp0jrFjJLJJprD
 xp5S5oIhyLsNg6un5+bTcIma/U8wBW5ipnplmVoFC3o5rhTwFg95aah/uWcSAe1sPTEt0lndWXYcj
 hVK0JkB3LfeovkLPGqaL5Ts1IITyrhdxd3jLQJBmz/zxvehUQ+Z0WBuA3KlEhnx3MJVE=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jr1mv-008t5N-6w
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jul 2020 16:10:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1593706213; x=1625242213;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qcxNNA8zMpGAEr7DVYkjjU/qY0WOgivgsY/X9fFqK3Q=;
 b=EKi9uIXafcfrVpGUo3xUNty7A/Kq763rtzeOz6ioL1vfxabCvSg6ceL4
 tcDCCuEg1F5tUoMuTAhDiMVPc9+VQZ/VuMv5P3Iss8s4Z01Jj+qWQ/Ut1
 RsCATshVK7YUGGk3R9TuidSWPvmCJSX3ep4MRGBNwjG+dk6CHY/nownFY
 E1LjKHf5iy/OJOUMoXX1WD1LqZz9yGbscadYv484A+U8CEEVOidCNOJH2
 pROHVDvBLBEoMi7bu4Exbel/DgZu/83z1/zQUk7DvbH2CngYznhUnzQar
 4mDpJaJyVnpOij67h1PTVV/fNlhTTXnDtGhQJb0PjwBIQSE6fr+PQJC13 Q==;
IronPort-SDR: nXgeX1wINxx8WnO2J/FanDcGhOS1bY0vIk0y6AuoNG2LRW+36WNizlqBsNwOfFnHKIhurhZuCT
 xBk+XOdc1t/QDobSQrPq5RY7qYOvy9UG9qidcPuWJPqcOBhSUhTz0kbykxOj+vbU3Xcp0oVsmb
 ZunB+ztt38CQctk+wbgeGmT8CNyWjSu0uthCSl/ayLptbmFrlCnLl1fTU5HTfvHhB9noW71HyS
 yrrB5bgrbOx/78NfBHKq3SWG2c/QiY104wkspfJH81BKKomWHKO3pYediitgDJrz4eOgmOehQq
 Dxo=
X-IronPort-AV: E=Sophos;i="5.75,304,1589212800"; d="scan'208";a="145822155"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 Jul 2020 23:54:36 +0800
IronPort-SDR: b3vBug7Zj+RXvfK9R9bbYrWnQREVM/wcHu6McQXAwmrX3/8cMEKbTeQb7N8+D39JEbZxhZfjOw
 0k32PVSgm5Nc7HRe9EzBtnjsibFgm7GwQ=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 08:42:49 -0700
IronPort-SDR: oehjMbT6UoYVCoGn5Xz6XApvU+Ty+ijPaYeJsFYQN5w4yg3UgbNVIErKo+j+bEjeDsABRI57pu
 eBdTBIGHfF6Q==
WDCIronportException: Internal
Received: from aravind-workstation.hgst.com (HELO localhost.localdomain)
 ([10.64.18.44])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Jul 2020 08:54:33 -0700
From: Aravind Ramesh <aravind.ramesh@wdc.com>
To: jaegeuk@kernel.org, yuchao0@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  2 Jul 2020 21:24:26 +0530
Message-Id: <20200702155427.13372-2-aravind.ramesh@wdc.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200702155427.13372-1-aravind.ramesh@wdc.com>
References: <20200702155427.13372-1-aravind.ramesh@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jr1mv-008t5N-6w
Subject: [f2fs-dev] [PATCH 1/2] mkfs.f2fs: zns zone-capacity support.
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
Cc: Aravind Ramesh <aravind.ramesh@wdc.com>, matias.bjorling@wdc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

NVM Express Zoned Namespace (ZNS) devices can have zone-capacity(zc) less
than the zone-size. ZNS defines a per zone capacity which can be equal
or less than the zone-size. Zone-capacity is the number of usable blocks
in the zone. In such cases, the filesystem should not write/read beyond the
zone-capacity. Update the super block with the usable number of blocks
and free segment count in the ZNS device zones, if zone-capacity is less
than zone-size. Set reserved segment count and overprovision ratio based
on the usable segments in the zone.

Signed-off-by: Aravind Ramesh <aravind.ramesh@wdc.com>
Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 configure.ac        |  4 ++++
 include/f2fs_fs.h   | 40 +++++++++++++++++++++++++++++++----
 lib/libf2fs_io.c    |  1 +
 lib/libf2fs_zoned.c | 51 +++++++++++++++++++++++++++++++++++++++++++--
 mkfs/f2fs_format.c  | 26 ++++++++++++++++++-----
 5 files changed, 111 insertions(+), 11 deletions(-)

diff --git a/configure.ac b/configure.ac
index 9ac0c24..e9acd1a 100644
--- a/configure.ac
+++ b/configure.ac
@@ -213,6 +213,10 @@ AC_CONFIG_FILES([
 	tools/f2fs_io/Makefile
 ])
 
+AC_CHECK_MEMBER([struct blk_zone.capacity],
+		[AC_DEFINE(HAVE_BLK_ZONE_REP_V2, [1], [report zones includes zone capacity])],
+		[], [[#include <linux/blkzoned.h>]])
+
 # export library version info for mkfs/libf2fs_format_la
 AC_SUBST(FMT_CURRENT, 6)
 AC_SUBST(FMT_REVISION, 0)
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 709bfd8..40165ed 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -332,6 +332,7 @@ struct device_info {
 	u_int32_t nr_zones;
 	u_int32_t nr_rnd_zones;
 	size_t zone_blocks;
+	size_t *zone_cap_blocks;
 };
 
 typedef struct {
@@ -1324,13 +1325,42 @@ blk_zone_cond_str(struct blk_zone *blkz)
 	return "Unknown-cond";
 }
 
-#define blk_zone_empty(z)	(blk_zone_cond(z) == BLK_ZONE_COND_EMPTY)
+/*
+ * Handle kernel zone capacity support
+ */
+#ifndef HAVE_BLK_ZONE_REP_V2
+#define BLK_ZONE_REP_CAPACITY   (1 << 0)
+struct blk_zone_v2 {
+	__u64   start;          /* Zone start sector */
+	__u64   len;            /* Zone length in number of sectors */
+	__u64   wp;             /* Zone write pointer position */
+	__u8    type;           /* Zone type */
+	__u8    cond;           /* Zone condition */
+	__u8    non_seq;        /* Non-sequential write resources active */
+	__u8    reset;          /* Reset write pointer recommended */
+	__u8    resv[4];
+	__u64   capacity;       /* Zone capacity in number of sectors */
+	__u8    reserved[24];
+};
+#define blk_zone blk_zone_v2
 
+struct blk_zone_report_v2 {
+	__u64   sector;
+	__u32   nr_zones;
+	__u32   flags;
+struct blk_zone zones[0];
+};
+#define blk_zone_report blk_zone_report_v2
+#endif /* HAVE_BLK_ZONE_REP_V2 */
+
+#define blk_zone_empty(z)	(blk_zone_cond(z) == BLK_ZONE_COND_EMPTY)
 #define blk_zone_sector(z)	(z)->start
 #define blk_zone_length(z)	(z)->len
 #define blk_zone_wp_sector(z)	(z)->wp
 #define blk_zone_need_reset(z)	(int)(z)->reset
 #define blk_zone_non_seq(z)	(int)(z)->non_seq
+#define blk_zone_capacity(z, f) ((f & BLK_ZONE_REP_CAPACITY) ? \
+					(z)->capacity : (z)->len)
 
 #endif
 
@@ -1342,6 +1372,7 @@ extern int f2fs_report_zones(int, report_zones_cb_t *, void *);
 extern int f2fs_check_zones(int);
 int f2fs_reset_zone(int, void *);
 extern int f2fs_reset_zones(int);
+extern uint32_t f2fs_get_usable_segments(struct f2fs_super_block *sb);
 
 #define SIZE_ALIGN(val, size)	((val) + (size) - 1) / (size)
 #define SEG_ALIGN(blks)		SIZE_ALIGN(blks, c.blks_per_seg)
@@ -1352,6 +1383,7 @@ static inline double get_best_overprovision(struct f2fs_super_block *sb)
 {
 	double reserved, ovp, candidate, end, diff, space;
 	double max_ovp = 0, max_space = 0;
+	u_int32_t usable_main_segs = f2fs_get_usable_segments(sb);
 
 	if (get_sb(segment_count_main) < 256) {
 		candidate = 10;
@@ -1365,9 +1397,9 @@ static inline double get_best_overprovision(struct f2fs_super_block *sb)
 
 	for (; candidate <= end; candidate += diff) {
 		reserved = (2 * (100 / candidate + 1) + 6) *
-						get_sb(segs_per_sec);
-		ovp = (get_sb(segment_count_main) - reserved) * candidate / 100;
-		space = get_sb(segment_count_main) - reserved - ovp;
+				(usable_main_segs / get_sb(section_count));
+		ovp = (usable_main_segs - reserved) * candidate / 100;
+		space = usable_main_segs - reserved - ovp;
 		if (max_space < space) {
 			max_space = space;
 			max_ovp = candidate;
diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index 1f597a9..138285d 100644
--- a/lib/libf2fs_io.c
+++ b/lib/libf2fs_io.c
@@ -784,6 +784,7 @@ int f2fs_finalize_device(void)
 			break;
 		}
 		free(c.devices[i].path);
+		free(c.devices[i].zone_cap_blocks);
 	}
 	close(c.kd);
 
diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
index efc687c..f98fcdb 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -291,6 +291,13 @@ int f2fs_check_zones(int j)
 		return -ENOMEM;
 	}
 
+	dev->zone_cap_blocks = malloc(dev->nr_zones * sizeof(size_t));
+	if (!dev->zone_cap_blocks) {
+		ERR_MSG("No memory for zone capacity list.\n");
+		return -ENOMEM;
+	}
+	memset(dev->zone_cap_blocks, 0, (dev->nr_zones * sizeof(size_t)));
+
 	dev->nr_rnd_zones = 0;
 	sector = 0;
 	total_sectors = (dev->total_sectors * c.sector_size) >> 9;
@@ -335,10 +342,15 @@ int f2fs_check_zones(int j)
 				    blk_zone_cond_str(blkz),
 				    blk_zone_sector(blkz),
 				    blk_zone_length(blkz));
+				dev->zone_cap_blocks[n] =
+					blk_zone_length(blkz) >>
+					(F2FS_BLKSIZE_BITS - SECTOR_SHIFT);
 			} else {
 				DBG(2,
-				    "Zone %05u: type 0x%x (%s), cond 0x%x (%s), need_reset %d, "
-				    "non_seq %d, sector %llu, %llu sectors, wp sector %llu\n",
+				    "Zone %05u: type 0x%x (%s), cond 0x%x (%s),"
+				    " need_reset %d, non_seq %d, sector %llu,"
+				    " %llu sectors, capacity %llu,"
+				    " wp sector %llu\n",
 				    n,
 				    blk_zone_type(blkz),
 				    blk_zone_type_str(blkz),
@@ -348,7 +360,11 @@ int f2fs_check_zones(int j)
 				    blk_zone_non_seq(blkz),
 				    blk_zone_sector(blkz),
 				    blk_zone_length(blkz),
+				    blk_zone_capacity(blkz, rep->flags),
 				    blk_zone_wp_sector(blkz));
+				dev->zone_cap_blocks[n] =
+					blk_zone_capacity(blkz, rep->flags) >>
+					(F2FS_BLKSIZE_BITS - SECTOR_SHIFT);
 			}
 
 			sector = blk_zone_sector(blkz) + blk_zone_length(blkz);
@@ -473,6 +489,33 @@ out:
 	return ret;
 }
 
+uint32_t f2fs_get_usable_segments(struct f2fs_super_block *sb)
+{
+#ifdef HAVE_BLK_ZONE_REP_V2
+	int i, j;
+	uint32_t usable_segs = 0, zone_segs;
+	for (i = 0; i < c.ndevs; i++) {
+		if (c.devices[i].zoned_model != F2FS_ZONED_HM) {
+			usable_segs += c.devices[i].total_segments;
+			continue;
+		}
+		for (j = 0; j < c.devices[i].nr_zones; j++) {
+			zone_segs = c.devices[i].zone_cap_blocks[j] >>
+					get_sb(log_blocks_per_seg);
+			if (c.devices[i].zone_cap_blocks[j] %
+						DEFAULT_BLOCKS_PER_SEGMENT)
+				usable_segs += zone_segs + 1;
+			else
+				usable_segs += zone_segs;
+		}
+	}
+	usable_segs -= (get_sb(main_blkaddr) - get_sb(segment0_blkaddr)) >>
+						get_sb(log_blocks_per_seg);
+	return usable_segs;
+#endif
+	return get_sb(segment_count_main);
+}
+
 #else
 
 int f2fs_report_zone(int i, u_int64_t UNUSED(sector), void *UNUSED(blkzone))
@@ -527,5 +570,9 @@ int f2fs_reset_zones(int i)
 	return -1;
 }
 
+uint32_t f2fs_get_usable_segments(struct f2fs_super_block *sb)
+{
+	return get_sb(segment_count_main);
+}
 #endif
 
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 4999cac..74a81c8 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -425,13 +425,19 @@ static int f2fs_prepare_super_block(void)
 
 	set_sb(segment_count_main, get_sb(section_count) * c.segs_per_sec);
 
-	/* Let's determine the best reserved and overprovisioned space */
+	/*
+	 * Let's determine the best reserved and overprovisioned space.
+	 * For Zoned device, if zone capacity less than zone size, the segments
+	 * starting after the zone capacity are unusable in each zone. So get
+	 * overprovision ratio and reserved seg count based on avg usable
+	 * segs_per_sec.
+	 */
 	if (c.overprovision == 0)
 		c.overprovision = get_best_overprovision(sb);
 
 	c.reserved_segments =
-			(2 * (100 / c.overprovision + 1) + NR_CURSEG_TYPE)
-			* c.segs_per_sec;
+			(2 * (100 / c.overprovision + 1) + NR_CURSEG_TYPE) *
+			(f2fs_get_usable_segments(sb) / get_sb(section_count));
 
 	if (c.overprovision == 0 || c.total_segments < F2FS_MIN_SEGMENTS ||
 		(c.devices[0].total_sectors *
@@ -672,19 +678,29 @@ static int f2fs_write_check_point_pack(void)
 	set_cp(valid_block_count, 2 + c.quota_inum + c.quota_dnum +
 			c.lpf_inum + c.lpf_dnum);
 	set_cp(rsvd_segment_count, c.reserved_segments);
-	set_cp(overprov_segment_count, (get_sb(segment_count_main) -
+
+	/*
+	 * For zoned devices, if zone capacity less than zone size, get
+	 * overprovision segment count based on usable segments in the device.
+	 */
+	set_cp(overprov_segment_count, (f2fs_get_usable_segments(sb) -
 			get_cp(rsvd_segment_count)) *
 			c.overprovision / 100);
 	set_cp(overprov_segment_count, get_cp(overprov_segment_count) +
 			get_cp(rsvd_segment_count));
 
+	if (f2fs_get_usable_segments(sb) < (get_cp(rsvd_segment_count) +
+					get_cp(overprov_segment_count))) {
+		MSG(0, "\tError: Not enough segments to create F2FS Volume\n");
+		goto free_nat_bits;
+	}
 	MSG(0, "Info: Overprovision ratio = %.3lf%%\n", c.overprovision);
 	MSG(0, "Info: Overprovision segments = %u (GC reserved = %u)\n",
 					get_cp(overprov_segment_count),
 					c.reserved_segments);
 
 	/* main segments - reserved segments - (node + data segments) */
-	set_cp(free_segment_count, get_sb(segment_count_main) - 6);
+	set_cp(free_segment_count, f2fs_get_usable_segments(sb) - 6);
 	set_cp(user_block_count, ((get_cp(free_segment_count) + 6 -
 			get_cp(overprov_segment_count)) * c.blks_per_seg));
 	/* cp page (2), data summaries (1), node summaries (3) */
-- 
2.19.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
