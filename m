Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6313810C4A7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Nov 2019 09:00:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iaEiw-0003MO-7v; Thu, 28 Nov 2019 08:00:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2285f8a38=shinichiro.kawasaki@wdc.com>)
 id 1iaEiq-0003J5-UZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Nov 2019 08:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yscz470sO/B+kvsxBOip9tei7aFWU2CFjulXRHEIqo4=; b=S+ksCkmYquIfzdAGitE2ApsRBb
 op55nLzTh+eYJxin/ZHvnDrDntm7MjZIegEQmJZ5BfEo20xT7/RtfdBShKxTaFKTD5S5mrtb04uZi
 Sz6anZAxeyIOH1wYwjOnTgk1G3HwlV+fcetBc39tGM3P+cDJfpmWoSp1+uTr6ZYz4jgg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yscz470sO/B+kvsxBOip9tei7aFWU2CFjulXRHEIqo4=; b=jOKxKezo+FE2dzHLZ1bQVTvcZy
 9c1rPf1+q6n5qMAA/eg9cOoa5JRiao2yVBofGX0tsuqVX0yOHZFnJozan5wG2HnzNIv7x+fcruZ3T
 VjBpWdYgS48TC+Dg/IJgS87O87uDuXXM7udOnv7cFGYf5fkDzMC7n5rN31uf2/K2BkwU=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iaEin-00Fq8f-AJ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Nov 2019 08:00:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1574928078; x=1606464078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LsNkFs+3r6U4kdozlgT7f/e8gSUzGYrgsrjnXvLU6IY=;
 b=mbbKv5HVrYBKZsV+C1bpdI4b3Ti+IQ4YKG1aGGUJjun2rw9aHRz19my3
 gCNBRB3SVvzofR/TvrZxxHEoX0VgZcNFJ4sWe2+fW/9GJ5mFmeO5rCnvx
 2/HX1uiYYqTYmNE0Pj5C3ktJAiOQozy9hY5qGq2AVYDcQWQOFvmvtTrqG
 QQiskdp7yvjcoG9WedkYyjPHln/XsLKCA7vQZ2L+eu2Ct6XdId+n+zScK
 q9Hd53tup9jmmCtL0oZQyqr1ESERav+Y0DqCK7J7MNVzyZ05r400+n9GB
 GPneuv3ZJIxp7dJzKtlwLZz54frDI5Usa9Ff08EyO6b9/mWGP/kFxWfN1 w==;
IronPort-SDR: ZAfWf2O+odzApSL8XwC8lTpLQAMdbet46i/3z/EXazv5qBYRwIZH1E05WynQVGKFTFjFUh6ZZk
 Fx/0WkFtc5WjgjNx1FPbnfZp6fvS898dBWZOnLTyADocu9pZCVfw7UMnH4TmNhrh9q92DqlqUB
 8Dhcvu3hmN4xjiRdqIpgcBoTq/9hJdWykzUXi5Rf2EmXg5YgGxAhTzUXufEnUYzTgGQJkns3Y9
 Ly1aaVq13Vk6cweS61o+N8T+M7qY4F8ue2AX4WRuaPxdE9AS/w2wPA2lckya8GcXR3uGl1edEG
 mQ4=
X-IronPort-AV: E=Sophos;i="5.69,252,1571673600"; d="scan'208";a="225597367"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2019 16:00:53 +0800
IronPort-SDR: DQDYwhSGYx3f/g3DtT1za08Y2cfSeeX7fE7MIh85IBP0DG/CXaylhwhPt4R6451bUPFXlGbUsI
 vQCjsDiU3QvXlc3TgWL8LDW7DMHBViTwXaAHltpJcr1+VA2AU65biZllqfV/3KZ4d3BoRzQSi1
 EdXt3zBryPcLbU5aMKadBMmGFIzRNrMiCyJOEAIlO1rRt1d9++OE8+bRodgjWehp6YF1+DESRw
 QOga4ouNzYbu9prbjDhxZXQTWrq4D8y/rNEd6JeUNnFCKvFPJ2PNstjUOqeEAe13Fotx5iaqWe
 K+MLGuGaujqnJML8lns9k7W3
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 23:54:35 -0800
IronPort-SDR: qg5uk2t0+1GpFFNaVyS+e18W4OnNRKx6MnGT1XVLpdHY9WRayKhayv69rY/HZ3kKFMhzV+2IH/
 ahQkZzzaGjV6txKufJD0Szh4P43eDLhCBpsfEWnJo680gkRUj9EDNCLpQgr9lqCrWR36/zZzby
 vzoc5nOgTqBqu5+/scXWY1LVJjr3tBOuCS6KlyMZcIZY3o+72choXGBAuDibDj3G+0zOsfifTT
 iLcsi6bwrKWJF2ePPre8ty/O0rlXtcimDAy3xEDH4xqrDVokBDcq3UaaHc1iqzPc61T7ERR+wU
 CVk=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.53.87])
 by uls-op-cesaip02.wdc.com with ESMTP; 28 Nov 2019 00:00:00 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 28 Nov 2019 16:59:30 +0900
Message-Id: <20191128075930.467833-9-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128075930.467833-1-shinichiro.kawasaki@wdc.com>
References: <20191128075930.467833-1-shinichiro.kawasaki@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iaEin-00Fq8f-AJ
Subject: [f2fs-dev] [PATCH v8 8/8] fsck: Check write pointer consistency of
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

To catch bugs in write pointer handling code for zoned block devices,
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
Reviewed-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/fsck.c | 119 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index a8cd824..f1cb438 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2756,6 +2756,122 @@ out:
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
+	if (zone_segno >= MAIN_SEGS(sbi))
+		return 0;
+
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
+			printf("[FSCK] Write pointer reset failed: %s\n",
+			       dev->path);
+			return ret;
+		}
+		fsck->chk.wp_fixed = 1;
+		return 0;
+	}
+
+	/*
+	 * If valid blocks exist in the zone beyond the write pointer, it
+	 * is a bug. No need to fix because the zone is not selected for the
+	 * write. Just report it.
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
@@ -2771,6 +2887,8 @@ void fsck_chk_and_fix_write_pointers(struct f2fs_sb_info *sbi)
 		fix_curseg_info(sbi);
 		fsck->chk.wp_fixed = 1;
 	}
+
+	fix_wp_sit_alignment(sbi);
 }
 
 int fsck_chk_curseg_info(struct f2fs_sb_info *sbi)
@@ -2989,6 +3107,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 			fix_hard_links(sbi);
 			fix_nat_entries(sbi);
 			rewrite_sit_area_bitmap(sbi);
+			fix_wp_sit_alignment(sbi);
 			fix_curseg_info(sbi);
 			fix_checksum(sbi);
 			fix_checkpoints(sbi);
-- 
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
