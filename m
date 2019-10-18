Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2D3DBDF5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Oct 2019 08:59:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iLMEB-0006gN-Rt; Fri, 18 Oct 2019 06:59:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=187ff726d=shinichiro.kawasaki@wdc.com>)
 id 1iLMEB-0006g9-3q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 06:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x+tSWVNUAISDjfq0WRmiwB5Qb2gI+jUGcJtvN6zRZmg=; b=PaYhJHBbZxuioyWEIKPpiaMZyA
 MLO+QIQFEnAe0O/lmIlrreewzJU8LFTvVHkvObQ0KOOsb6IWr81N+5xyB2iEoXP5O84hh3W35IInO
 ijzV61Vg7R+yZObvtiv3QIsFMXqtSWd1kd3SXEkFuzovpzOht5l7gem4AJ12pncOzFFE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x+tSWVNUAISDjfq0WRmiwB5Qb2gI+jUGcJtvN6zRZmg=; b=GS4qcF6AHhuFa4kL48vLqEZwTM
 rC9gUG7rwir1jp16nMwqq2DxOENMAX3av1BewhKJeeZB5JzBGZtXh9OSL5+TWSPxfoAP0HN5ZPVAU
 d0rVaRqPvUMDLx3mronF5dx6JZWbrATXU/HKlEZr6ib+BobXQ2tZbuK+76zRmf4s+g+o=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iLME9-00DAxW-PU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 06:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1571382009; x=1602918009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n+6u5+CS7eC4MJK0MYALRRnl2qgRcaim5JSpZykXMpk=;
 b=hzpgbmIfN8xyiOIqQ+g60G3VBtgfWmpuJNWwLNlBQdobJbjS9iEpHl3X
 DH/ryZEHlHLcXtn41jzGk5cAvaNgmMxEgVd9MW9iESFZL8Mo6LK3qBcVr
 h9nYUnvM3L9eTVlm3huZg87hzxoXLMZu2KNhIptafwV3tnB1mTprekYyX
 wNQUccqSVjxnAFDK8YdfdzX20NCDNvgPQ1Ii/RVmoPLM/fPEfIiyWQJyq
 Mfx5QLwWeHxLgOZEgL+q8FX8AniB7TxHTqbkFpGLTHh+qlfrWyBZGvy0U
 5oSuV0Yq5WNvnWWMZiWeMA5YXiD1ar8dDmQNoStQKmzitVcO5T2Qw7nPL g==;
IronPort-SDR: Ud/lvwTE9b7L+hHn8J0srywRVBGGJccQHeLrA6P5WaYye9HO18KhE8dOGjOS56yaTcv/AEJ0se
 V3eWyl6FY/5m18IyLbKZgctwP4nW7HoaY6sMqZq474RVvHIVwGrVBmQKvTUqPYQHRfPIAomklJ
 kTFhdbLJfGOqVqod4NBFWMD6QelX0pJxj0AUsOAEfmrvnXu5gd2B+TO32p7Nlpb99ZAOM8cxPM
 2KiN3YYoAuyzneB2y5ErcBOJc+EvCRZo8eF/kU1rEXw4iQo8DQNPZvQY9/eddHa2JUF0S7OQGI
 jxE=
X-IronPort-AV: E=Sophos;i="5.67,310,1566835200"; d="scan'208";a="221884352"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2019 14:38:15 +0800
IronPort-SDR: uqgj0nvcOWFiQqvw9Hm5g7DIot2R7oT/jkm6J4QvkYHzatL4L2UlmbL7OmIYceRArj4XkSabg6
 YsOxPYKHgKnWKkrJcgrqp6ASAsborSs5ALfXHQilmmuVBtVfg6sq240IAGcKRbSHuOiul2nYEC
 6H9h1PRvM09IW6iPOrJ7WtqRb9hALMAbjYGUi0beDlXpuHOA8vmNIyX7uxLYgVix8+R4RVPdHz
 Q5W+HKN0fE1c9XUU6w58yP9NnOynAi0e64oVFVN6v9kRe+iBjjW6pnz94Skvja5tJgRADXYYh+
 ZuC9XO5VuopqoY8BqTWrFO9D
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2019 23:33:35 -0700
IronPort-SDR: ZfnR2uTuXUpco4mDAeO93C/cYZnKFGDpH+Lh3tduZXDSD7IZzTYRIZnQSEwVAIlGCES/I+xBmX
 yrSFPz8kUWMAOZmpEDZIjrxK9tZBKlirUNSFNgET60xdv8oxeCRnwcAgz35nq0WmjizY3ALsQ2
 HqVG6F2tmXbG6nrjQyGtosHvKAX3ON2CMqxcRaykTXGuZx4wcyWA7GZ+gMl/0cX/6X82uYl70f
 xNm9qc63pqRSp3TQ+I3NUBHRxSju9yM3c5q5+7JFgiOtbsqpj7qo8cXdpbfbeChWRMikBArntT
 moc=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.166])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Oct 2019 23:37:50 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 18 Oct 2019 15:37:40 +0900
Message-Id: <20191018063740.2746-9-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191018063740.2746-1-shinichiro.kawasaki@wdc.com>
References: <20191018063740.2746-1-shinichiro.kawasaki@wdc.com>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iLME9-00DAxW-PU
Subject: [f2fs-dev] [PATCH v5 8/8] fsck: Check write pointer consistency of
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

To catch f2fs bug in write pointer handling code for zoned block devices,
have fsck check consistency of write pointers of non-open zones, that
current segments do not point to. Check two items comparing write pointer
positions with valid block maps in SIT.

The first item is check for zones with no valid blocks. When there is no
valid blocks in a zone, the write pointer should be at the start of the
zone. If not, next write operation to the zone will cause unaligned write
error. If write pointer is not at the zone start, reset the zone to move
the write pointer to the zone start.

The second item is check between write pointer position and the last
valid block in the zone. It is unexpected that the last valid block
position is beyond the write pointer. In such a case, report as the bug.
Fix is not required for such zone, because the zone is not selected for
next write operation until the zone get discarded.

In the same manner as the consistency check for current segments, do the
check and fix twice: at the beginning of do_fsck() to avoid unaligned
write error during fsck, and at fsck_verify() to reflect meta data
updates by fsck.

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 fsck/fsck.c | 116 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index e0eda4e..718da15 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2751,6 +2751,119 @@ out:
 	return cnt;
 }
 
+#ifdef HAVE_LINUX_BLKZONED_H
+
+struct write_pointer_check_data {
+	struct f2fs_sb_info *sbi;
+	int dev_index;
+};
+
+static int chk_and_fix_wp_with_sit(int i, void *blkzone, void *opaque)
+{
+	struct blk_zone *blkz = (struct blk_zone *)blkzone;
+	struct write_pointer_check_data *wpd = opaque;
+	struct f2fs_sb_info *sbi = wpd->sbi;
+	struct device_info *dev = c.devices + wpd->dev_index;
+	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
+	block_t zone_block, wp_block, wp_blkoff;
+	unsigned int zone_segno, wp_segno;
+	struct curseg_info *cs;
+	int cs_index, ret, last_valid_blkoff;
+	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
+	unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
+
+	if (blk_zone_conv(blkz))
+		return 0;
+
+	zone_block = dev->start_blkaddr
+		+ (blk_zone_sector(blkz) >> log_sectors_per_block);
+	zone_segno = GET_SEGNO(sbi, zone_block);
+	wp_block = dev->start_blkaddr
+		+ (blk_zone_wp_sector(blkz) >> log_sectors_per_block);
+	wp_segno = GET_SEGNO(sbi, wp_block);
+	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
+
+	/* if a curseg points to the zone, skip the check */
+	for (cs_index = 0; cs_index < NO_CHECK_TYPE; cs_index++) {
+		cs = &SM_I(sbi)->curseg_array[cs_index];
+		if (zone_segno <= cs->segno &&
+		    cs->segno < zone_segno + segs_per_zone)
+			return 0;
+	}
+
+	last_valid_blkoff = last_vblk_off_in_zone(sbi, zone_segno);
+
+	/*
+	 * When there is no valid block in the zone, check write pointer is
+	 * at zone start. If not, reset the write pointer.
+	 */
+	if (last_valid_blkoff < 0 &&
+	    blk_zone_wp_sector(blkz) != blk_zone_sector(blkz)) {
+		if (!c.fix_on) {
+			MSG(0, "Inconsistent write pointer: wp[0x%x,0x%x]\n",
+			    wp_segno, wp_blkoff);
+			fsck->chk.wp_inconsistent_zones++;
+			return 0;
+		}
+
+		FIX_MSG("Reset write pointer of zone at segment 0x%x",
+			zone_segno);
+		ret = f2fs_reset_zone(wpd->dev_index, blkz);
+		if (ret) {
+			printf("[FSCK] Write pointer reset failed: %s "
+			       "(errno=%d)\n", dev->path, ret);
+			return ret;
+		}
+		fsck->chk.wp_fixed = 1;
+		return 0;
+	}
+
+	/*
+	 * If valid blocks exist in the zone beyond the write pointer, it
+	 * is a f2fs bug. No need to fix because the zone is not selected
+	 * for the write. Just report it.
+	 */
+	if (last_valid_blkoff + zone_block > wp_block) {
+		MSG(0, "Unexpected invalid write pointer: wp[0x%x,0x%x]\n",
+		    wp_segno, wp_blkoff);
+		return 0;
+	}
+
+	return 0;
+}
+
+static void fix_wp_sit_alignment(struct f2fs_sb_info *sbi)
+{
+	unsigned int i;
+	struct write_pointer_check_data wpd = {	sbi, 0 };
+
+	if (c.zoned_model != F2FS_ZONED_HM)
+		return;
+
+	for (i = 0; i < MAX_DEVICES; i++) {
+		if (!c.devices[i].path)
+			break;
+		if (c.devices[i].zoned_model != F2FS_ZONED_HM)
+			break;
+
+		wpd.dev_index = i;
+		if (f2fs_report_zones(i, chk_and_fix_wp_with_sit, &wpd)) {
+			printf("[FSCK] Write pointer check failed: %s\n",
+			       c.devices[i].path);
+			return;
+		}
+	}
+}
+
+#else
+
+static void fix_wp_sit_alignment(struct f2fs_sb_info *sbi)
+{
+	return;
+}
+
+#endif
+
 /*
  * Check and fix consistency with write pointers at the beginning of
  * fsck so that following writes by fsck do not fail.
@@ -2766,6 +2879,8 @@ void fsck_chk_and_fix_write_pointers(struct f2fs_sb_info *sbi)
 		fix_curseg_info(sbi);
 		fsck->chk.wp_fixed = 1;
 	}
+
+	fix_wp_sit_alignment(sbi);
 }
 
 int fsck_chk_curseg_info(struct f2fs_sb_info *sbi)
@@ -2984,6 +3099,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 			fix_hard_links(sbi);
 			fix_nat_entries(sbi);
 			rewrite_sit_area_bitmap(sbi);
+			fix_wp_sit_alignment(sbi);
 			fix_curseg_info(sbi);
 			fix_checksum(sbi);
 			fix_checkpoints(sbi);
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
