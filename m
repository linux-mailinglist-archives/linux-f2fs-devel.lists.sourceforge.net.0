Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA49772FEA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Aug 2023 21:52:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qT6HG-0005Q4-LA;
	Mon, 07 Aug 2023 19:52:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qT6HE-0005Py-PQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 19:52:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W3hMiDy61XIVoHaX8DmtWZeopoblqARvJBnAwI4Yt3A=; b=iE5j/YDKDP+CpQd47r0Ph2mTPZ
 c1hK55ELKyE3gbUCwJJ5Y7x1BKFsibA+JlHWuD31Suo9VdbRXtAuAkfPdI9JJbyn3gQ7Dpw7pIqnN
 +QWSwgxV5/tKQvynnGASmqU/8tP8T43B/5n+x2MrDWCI3W7caSfX6rj0dvVC9scbjad0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=W3hMiDy61XIVoHaX8DmtWZeopoblqARvJBnAwI4Yt3A=; b=m
 T6bLKUN2cwXjApn5PKxyBNa1+YiPV/ARkyU6EQPzJA0UklQbhZEx2aQfkoi5PQcuCKKI6WzeRBQ5y
 E9vNqy539xZ9rDX5IxoGPlIeTa6L4WwTpeuQCzAG2KmHqcw10dbhKoc1J89mCFh4/1is2Yz5i9hVd
 NZng0kkIL/IolGFI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qT6HD-0002xW-UG for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 19:52:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4D01662058;
 Mon,  7 Aug 2023 19:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C9F5C433C7;
 Mon,  7 Aug 2023 19:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691437941;
 bh=IH39znwDLBIRmDZcSbrudFffMeVXA/5wEHS2vZgdSZM=;
 h=From:To:Cc:Subject:Date:From;
 b=VuDazwdxCMW48TtNWpF2UIaT3LPyGTUqYykkRTPr27gutEDYmNWtAILZDTGmOt3U7
 CcHoKK8lfvBimNqmG/2RaIHME/vWlsmBwSV151wA8hhGH3HWqMD07MI1B30ikxMvfc
 vdZfIuFW8XLxmU9YFYyZxggC/29Megg7X2eft+x3lyHmfUF9IiRfBig43oEyH1QtYh
 gbaNRZkcw2EK/W1cjSzLb3le+0d48ZMvDwDfySvjtvoitxT+cvLuv5RRU3uQntj6gA
 MjvLh9Ur//LvQkc+lYTDkIS93PL06c7QK6cJ7vKocg6Q4L3Rmv1d7x9RjLEuqVxZlT
 DrsANJX3Pc6GQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  7 Aug 2023 12:52:19 -0700
Message-ID: <20230807195219.371131-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This reverts commit bfd476623999118d9c509cb0fa9380f2912bc225.
 Shinichiro Kawasaki reported: When I ran workloads on f2fs using v6.5-rcX
 with fixes [1][2] and a zoned block devices with 4kb logical block size,
 I observe mount failure as follows. When I revert this commit, the failure
 goes awa [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qT6HD-0002xW-UG
Subject: [f2fs-dev] [PATCH] Revert "f2fs: clean up w/
 sbi->log_sectors_per_block"
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
Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This reverts commit bfd476623999118d9c509cb0fa9380f2912bc225.

Shinichiro Kawasaki reported:

When I ran workloads on f2fs using v6.5-rcX with fixes [1][2] and a zoned block
devices with 4kb logical block size, I observe mount failure as follows. When
I revert this commit, the failure goes away.

[  167.781975][ T1555] F2FS-fs (dm-0): IO Block Size:        4 KB
[  167.890728][ T1555] F2FS-fs (dm-0): Found nat_bits in checkpoint
[  171.482588][ T1555] F2FS-fs (dm-0): Zone without valid block has non-zero write pointer. Reset the write pointer: wp[0x1300,0x8]
[  171.496000][ T1555] F2FS-fs (dm-0): (0) : Unaligned zone reset attempted (block 280000 + 80000)
[  171.505037][ T1555] F2FS-fs (dm-0): Discard zone failed:  (errno=-5)

The patch replaced "sbi->log_blocksize - SECTOR_SHIFT" with
"sbi->log_sectors_per_block". However, I think these two are not equal when the
device has 4k logical block size. The former uses Linux kernel sector size 512
byte. The latter use 512b sector size or 4kb sector size depending on the
device. mkfs.f2fs obtains logical block size via BLKSSZGET ioctl from the device
and reflects it to the value sbi->log_sector_size_per_block. This causes
unexpected write pointer calculations in check_zone_write_pointer(). This
resulted in unexpected zone reset and the mount failure.

[1] https://lkml.kernel.org/linux-f2fs-devel/20230711050101.GA19128@lst.de/
[2] https://lore.kernel.org/linux-f2fs-devel/20230804091556.2372567-1-shinichiro.kawasaki@wdc.com/

Cc: stable@vger.kernel.org
Reported-by: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Fixes: bfd476623999 ("f2fs: clean up w/ sbi->log_sectors_per_block")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/segment.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 0457d620011f..cbb4bd95ea19 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4846,17 +4846,17 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
 {
 	unsigned int wp_segno, wp_blkoff, zone_secno, zone_segno, segno;
 	block_t zone_block, wp_block, last_valid_block;
+	unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
 	int i, s, b, ret;
 	struct seg_entry *se;
 
 	if (zone->type != BLK_ZONE_TYPE_SEQWRITE_REQ)
 		return 0;
 
-	wp_block = fdev->start_blk + (zone->wp >> sbi->log_sectors_per_block);
+	wp_block = fdev->start_blk + (zone->wp >> log_sectors_per_block);
 	wp_segno = GET_SEGNO(sbi, wp_block);
 	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
-	zone_block = fdev->start_blk + (zone->start >>
-						sbi->log_sectors_per_block);
+	zone_block = fdev->start_blk + (zone->start >> log_sectors_per_block);
 	zone_segno = GET_SEGNO(sbi, zone_block);
 	zone_secno = GET_SEC_FROM_SEG(sbi, zone_segno);
 
@@ -4906,7 +4906,7 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
 			    "pointer. Reset the write pointer: wp[0x%x,0x%x]",
 			    wp_segno, wp_blkoff);
 		ret = __f2fs_issue_discard_zone(sbi, fdev->bdev, zone_block,
-				zone->len >> sbi->log_sectors_per_block);
+					zone->len >> log_sectors_per_block);
 		if (ret)
 			f2fs_err(sbi, "Discard zone failed: %s (errno=%d)",
 				 fdev->path, ret);
@@ -4967,6 +4967,7 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 	struct blk_zone zone;
 	unsigned int cs_section, wp_segno, wp_blkoff, wp_sector_off;
 	block_t cs_zone_block, wp_block;
+	unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
 	sector_t zone_sector;
 	int err;
 
@@ -4978,8 +4979,8 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 		return 0;
 
 	/* report zone for the sector the curseg points to */
-	zone_sector = (sector_t)(cs_zone_block - zbd->start_blk) <<
-						sbi->log_sectors_per_block;
+	zone_sector = (sector_t)(cs_zone_block - zbd->start_blk)
+		<< log_sectors_per_block;
 	err = blkdev_report_zones(zbd->bdev, zone_sector, 1,
 				  report_one_zone_cb, &zone);
 	if (err != 1) {
@@ -4991,10 +4992,10 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 	if (zone.type != BLK_ZONE_TYPE_SEQWRITE_REQ)
 		return 0;
 
-	wp_block = zbd->start_blk + (zone.wp >> sbi->log_sectors_per_block);
+	wp_block = zbd->start_blk + (zone.wp >> log_sectors_per_block);
 	wp_segno = GET_SEGNO(sbi, wp_block);
 	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
-	wp_sector_off = zone.wp & GENMASK(sbi->log_sectors_per_block - 1, 0);
+	wp_sector_off = zone.wp & GENMASK(log_sectors_per_block - 1, 0);
 
 	if (cs->segno == wp_segno && cs->next_blkoff == wp_blkoff &&
 		wp_sector_off == 0)
@@ -5021,8 +5022,8 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 	if (!zbd)
 		return 0;
 
-	zone_sector = (sector_t)(cs_zone_block - zbd->start_blk) <<
-						sbi->log_sectors_per_block;
+	zone_sector = (sector_t)(cs_zone_block - zbd->start_blk)
+		<< log_sectors_per_block;
 	err = blkdev_report_zones(zbd->bdev, zone_sector, 1,
 				  report_one_zone_cb, &zone);
 	if (err != 1) {
@@ -5040,7 +5041,7 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 			    "Reset the zone: curseg[0x%x,0x%x]",
 			    type, cs->segno, cs->next_blkoff);
 		err = __f2fs_issue_discard_zone(sbi, zbd->bdev,	cs_zone_block,
-					zone.len >> sbi->log_sectors_per_block);
+					zone.len >> log_sectors_per_block);
 		if (err) {
 			f2fs_err(sbi, "Discard zone failed: %s (errno=%d)",
 				 zbd->path, err);
-- 
2.41.0.640.ga95def55d0-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
