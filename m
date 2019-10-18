Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D151FDBDBC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Oct 2019 08:39:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iLLur-00065G-CF; Fri, 18 Oct 2019 06:39:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=187ff726d=shinichiro.kawasaki@wdc.com>)
 id 1iLLup-000650-Pp
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 06:39:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TuNY+zMHKMHRvOuv0NQJ2n65rWMatx+EoS4P9Lbw0wU=; b=gcmO2Cf4CPbq75HkcYeqhM20WM
 LUGRuc5ZAVo8qFycDDmLh3DZZapjru6BTd90PQMrQL+L7As+XcSyfAtS79oIsAyzNs3jumf49Foo+
 VU6Qcse9YX2nUjXgoK0CJFZ517Y0Fm/6RaCnYERqRgMyrzBdhOgcDQn1DJocMXM392Ro=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TuNY+zMHKMHRvOuv0NQJ2n65rWMatx+EoS4P9Lbw0wU=; b=YWa7/R6o3lhv0VMynIhI75SmJa
 TltpyFElGO2IAc1Y7gYUQQiWonSSLlnPfhVkQoUPu1VLsOhpf4YFVYToeUoFteVngLqY1eoa6Daek
 ho8M3Eoez3cjmbrv/4mLQ0yGXU5aVKgrj3wcez84aU6vprpb2O0k3nZ3jYgZnpUlilsA=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iLLuo-006I5b-CT
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 06:39:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1571380751; x=1602916751;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Do/SvaJSekhCT2l4ixiEbV1AB1spSNe3kCZO41tsjyo=;
 b=Sws/lpqRBdlY9hTCNsVZNreD/lcoBNFc87PsKW0enLWlGpRIM49SVZub
 1mENVLXjzkoa6pd9b/cFYE4teVJ6bt1CEIuYHsZgu9+UyIS4WIssBZPt5
 FCK0/ARaxqWw46r/CF5ygcu4bEhCiC36y45ImoaR7nsIyoV7VLxj+0nCI
 uIbaoZmdY6u6fAMzlsZB/fEhFi6wjQ3Wi33qZAx91Ru6NiEnVsQPb0Y8M
 vmXzdKc81EFhylAkO3bEyRbOR1f1iOX56et8HkuV9hUIDzCLz9vZIF8zd
 O7S4WVb+y5XsnFrbHMZy1CqlhE3/O4VXKq1s62a5uwz+RzWSVmlOSUru1 g==;
IronPort-SDR: V5HiH14Vz0tya0b55bFZUaRrN0H8XUF0Cwb0FndICFu25TcuRblkAGxKvoWMWGkCz3CGaB69l5
 fkbkDfl6y2qI0C6PuygilRq3gI7Lf7y6lLbBTI3JcWQCQukgyUct4UCkPb7JM1XFh0CwztmZ7t
 0XWYUUOtTCAcuOaFxgxsinbObrCiPrgxbfKQewHR8/HCE8WceYdbVWXEzpQ3ZofmHoj8D41k6H
 TiX8Ns4O7pTSHFDRLDHN7+K+/nMusbXNZ8R9lvT68eCm5Nr1rNven7pNMmgt/FOrcNAP6nbWoc
 A2s=
X-IronPort-AV: E=Sophos;i="5.67,310,1566835200"; d="scan'208";a="121585268"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2019 14:39:04 +0800
IronPort-SDR: WmlE6gc0m/AZs/ySrnKHAOIs6zOihJxcIGDyOkkURDIega3HAzjJviwKN1OuKdBUpVP/Jv6vog
 3GuDqQNPO3TAgaByh+DnEIy9J4/NTQ0CEzBWNbRlyBemFK7gSeb3gGjMly19x0eonoSBHP+7AO
 OZ8TAzRaciq9eB9hb9WnR/b+R0Rsu+qvP/9uHZ05+YH8VmSDQSKanQpX/LP1KdAYYh22olMbmG
 0Kq5sJbcGvot9uRhhu8fgmGbLXEEA3qlakdUkBZfz2F8A9S6IrdxVEyHjWBksbGpLequE3D/c3
 giTbARg7rzeXu3Jrh866Anv7
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2019 23:34:48 -0700
IronPort-SDR: mvIFHoMBiMSRf3LB7O9VR5ITvoEBpjktEsMhJ7AVwVLmEyevr9sm8EwmeNKznIBeo7j9C3Ppst
 1kbXkB7g7W7BKT2SrNZvftRRrpmcXUGxBwiBmTvlnOtene+959ex9gqHUmcauUMaQw0ttPdeuk
 7419FK7ihZgyL3nVidBU2VH1EueXc8NS3+0tn73Ku1+SwPsLtMfhDhz6u0pjjOiFHGCiyYLtcU
 1+yBfvXlsdjoj/3k4xe3zoKdKmlgKPMd5hrdBrZFmxrADAElkBjvp3+G99LeMCz5se2G+F7BjP
 uPs=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.166])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Oct 2019 23:39:03 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 18 Oct 2019 15:38:59 +0900
Message-Id: <20191018063859.3082-3-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191018063859.3082-1-shinichiro.kawasaki@wdc.com>
References: <20191018063859.3082-1-shinichiro.kawasaki@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iLLuo-006I5b-CT
Subject: [f2fs-dev] [PATCH 2/2] f2fs: Check write pointer consistency of
 non-open zones
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

To catch f2fs bugs in write pointer handling code for zoned block
devices, check write pointers of non-open zones that current segments do
not point to. Do this check at mount time, after the fsync data recovery
and current segments' write pointer consistency fix. Check two items
comparing write pointers with valid block maps in SIT.

The first item is check for zones with no valid blocks. When there is no
valid blocks in a zone, the write pointer should be at the start of the
zone. If not, next write operation to the zone will cause unaligned write
error. If write pointer is not at the zone start, make mount fail and ask
users to run fsck.

The second item is check between the write pointer position and the last
valid block in the zone. It is unexpected that the last valid block
position is beyond the write pointer. In such a case, report as the bug.
Fix is not required for such zone, because the zone is not selected for
next write operation until the zone get discarded.

Also move a constant F2FS_REPORT_ZONE from super.c to f2fs.h to use it
in segment.c also.

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 fs/f2fs/f2fs.h    |   3 +
 fs/f2fs/segment.c | 144 ++++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/super.c   |  11 ++--
 3 files changed, 154 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 0216282c5b80..e8524be17852 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3137,6 +3137,7 @@ int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
 			unsigned int val, int alloc);
 void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc);
 int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi, bool check_only);
+int f2fs_check_write_pointer(struct f2fs_sb_info *sbi);
 int f2fs_build_segment_manager(struct f2fs_sb_info *sbi);
 void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi);
 int __init f2fs_create_segment_manager_caches(void);
@@ -3610,6 +3611,8 @@ static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
 
 	return test_bit(zno, FDEV(devi).blkz_seq);
 }
+
+#define F2FS_REPORT_NR_ZONES   4096
 #endif
 
 static inline bool f2fs_hw_should_discard(struct f2fs_sb_info *sbi)
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 2b6e637dd6d3..d00d3f16b750 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4333,6 +4333,128 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
 
 #ifdef CONFIG_BLK_DEV_ZONED
 
+static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
+				    struct f2fs_dev_info *fdev,
+				    struct blk_zone *zone)
+{
+	unsigned int s, wp_segno, wp_blkoff, zone_secno, zone_segno, segno;
+	block_t zone_block, wp_block, last_valid_block, b;
+	unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
+	int i;
+	struct seg_entry *se;
+
+	wp_block = fdev->start_blk + (zone->wp >> log_sectors_per_block);
+	wp_segno = GET_SEGNO(sbi, wp_block);
+	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
+	zone_block = fdev->start_blk + (zone->start >> log_sectors_per_block);
+	zone_segno = GET_SEGNO(sbi, zone_block);
+	zone_secno = GET_SEC_FROM_SEG(sbi, zone_segno);
+
+	/*
+	 * If a curseg points to the zone, skip check because the zone
+	 * may have fsync data that valid block map does not mark.
+	 */
+	for (i = 0; i < NO_CHECK_TYPE; i++)
+		if (zone_secno == GET_SEC_FROM_SEG(sbi,
+						   CURSEG_I(sbi, i)->segno))
+			return 0;
+
+	/*
+	 * Get last valid block of the zone.
+	 */
+	last_valid_block = zone_block - 1;
+	for (s = 0; s < sbi->segs_per_sec; s++) {
+		segno = zone_segno + s;
+		se = get_seg_entry(sbi, segno);
+		for (b = 0; b < sbi->blocks_per_seg; b++)
+			if (f2fs_test_bit(b, se->cur_valid_map))
+				last_valid_block = START_BLOCK(sbi, segno) + b;
+	}
+
+	/*
+	 * If last valid block is beyond the write pointer, report the
+	 * inconsistency. This inconsistency does not cause write error
+	 * because the zone will not be selected for write operation until
+	 * it get discarded. Just report it.
+	 */
+	if (last_valid_block >= wp_block) {
+		f2fs_notice(sbi, "Valid block beyond write pointer: "
+			    "valid block[0x%x,0x%x] wp[0x%x,0x%x]",
+			    GET_SEGNO(sbi, last_valid_block),
+			    GET_BLKOFF_FROM_SEG0(sbi, last_valid_block),
+			    wp_segno, wp_blkoff);
+		return 0;
+	}
+
+	/*
+	 * If there is no valid block in the zone and if write pointer is
+	 * not at zone start, report the error to run fsck and mark the
+	 * zone as used.
+	 */
+	if (last_valid_block + 1 == zone_block && zone->wp != zone->start) {
+		f2fs_notice(sbi,
+			    "Zone without valid block has non-zero write "
+			    "pointer, run fsck to fix: wp[0x%x,0x%x]",
+			    wp_segno, wp_blkoff);
+		__set_inuse(sbi, zone_segno);
+		f2fs_stop_checkpoint(sbi, true);
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int check_dev_write_pointer(struct f2fs_sb_info *sbi,
+				   struct f2fs_dev_info *fdev) {
+	sector_t nr_sectors = fdev->bdev->bd_part->nr_sects;
+	sector_t sector = 0;
+	struct blk_zone *zones;
+	unsigned int i, nr_zones;
+	unsigned int n = 0;
+	int err = -EIO;
+
+	if (!bdev_is_zoned(fdev->bdev))
+		return 0;
+
+	zones = f2fs_kzalloc(sbi,
+			     array_size(F2FS_REPORT_NR_ZONES,
+					sizeof(struct blk_zone)),
+			     GFP_KERNEL);
+	if (!zones)
+		return -ENOMEM;
+
+	/* Get block zones type */
+	while (zones && sector < nr_sectors) {
+
+		nr_zones = F2FS_REPORT_NR_ZONES;
+		err = blkdev_report_zones(fdev->bdev, sector, zones, &nr_zones);
+		if (err)
+			break;
+		if (!nr_zones) {
+			err = -EIO;
+			break;
+		}
+
+		for (i = 0; i < nr_zones; i++) {
+			if (zones[i].type == BLK_ZONE_TYPE_SEQWRITE_REQ) {
+				err = check_zone_write_pointer(sbi, fdev,
+							       &zones[i]);
+				if (err)
+					break;
+			}
+			sector += zones[i].len;
+			n++;
+		}
+		if (err)
+			break;
+	}
+
+	kvfree(zones);
+
+	return err;
+}
+
 static struct f2fs_dev_info *get_target_zoned_dev(struct f2fs_sb_info *sbi,
 						  block_t zone_blkaddr)
 {
@@ -4404,6 +4526,10 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type,
 		    "curseg[0x%x,0x%x]", type, cs->segno, cs->next_blkoff);
 	allocate_segment_by_default(sbi, type, true);
 
+	/* check consistency of the zone curseg pointed to */
+	if (check_zone_write_pointer(sbi, zbd, &zone))
+		return -EIO;
+
 	/* check newly assigned zone */
 	cs_section = GET_SEC_FROM_SEG(sbi, cs->segno);
 	cs_zone_block = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi, cs_section));
@@ -4451,11 +4577,29 @@ int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi, bool check_only)
 
 	return 0;
 }
+
+int f2fs_check_write_pointer(struct f2fs_sb_info *sbi)
+{
+	int i, ret;
+
+	for (i = 0; i < sbi->s_ndevs; i++) {
+		ret = check_dev_write_pointer(sbi, &FDEV(i));
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
 #else
 int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi, bool check_only)
 {
 	return 0;
 }
+
+int f2fs_check_write_pointer(struct f2fs_sb_info *sbi)
+{
+	return 0;
+}
 #endif
 
 /*
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ebd0ae02a260..357b8f7fd333 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2890,8 +2890,6 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
 	if (!FDEV(devi).blkz_seq)
 		return -ENOMEM;
 
-#define F2FS_REPORT_NR_ZONES   4096
-
 	zones = f2fs_kzalloc(sbi,
 			     array_size(F2FS_REPORT_NR_ZONES,
 					sizeof(struct blk_zone)),
@@ -3509,7 +3507,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 
 		err = f2fs_recover_fsync_data(sbi, false);
 		if (err < 0) {
-			if (err != -ENOMEM)
+			if (err != -ENOMEM &&
+			    !is_sbi_flag_set(sbi, SBI_NEED_FSCK))
 				skip_recovery = true;
 			need_fsck = true;
 			f2fs_err(sbi, "Cannot recover all fsync data errno=%d",
@@ -3526,8 +3525,12 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		}
 	}
 
-	/* check zoned block devices' write pointer consistency */
+	/* fix and check zoned block devices' write pointer consistency */
 	if (f2fs_sb_has_blkzoned(sbi)) {
+		err = f2fs_check_write_pointer(sbi);
+		if (err)
+			goto free_meta;
+
 		err = f2fs_fix_curseg_write_pointer(sbi, f2fs_readonly(sb));
 		if (err)
 			goto free_meta;
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
