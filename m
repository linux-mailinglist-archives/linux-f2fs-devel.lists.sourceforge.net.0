Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E16805EA1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Dec 2023 20:30:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rAb7M-0006Qn-HZ;
	Tue, 05 Dec 2023 19:30:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rAb7K-0006Qb-8g
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Dec 2023 19:30:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8XHBBZctn32p99jKyFNoQCHUKkKB5QHCUvdsqtJZOes=; b=MldRwMnF8gcqFgPpoqdk26ygzR
 F5b3uQ+TCxbDdqq4fQkfMgfmWPEYR3KHG1fLh8ZWraRcSvwqJVqHFxwuywvEVwbttZDZJVx+cLl5T
 MzHYlfbNQnf75QxwcAS4AqWYY7o+qZ3sapiucIXCaIwehVBMP2oTdrwtf4dVI6j/fdxM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8XHBBZctn32p99jKyFNoQCHUKkKB5QHCUvdsqtJZOes=; b=j86lhzKnVwD6PYrbuh8FbTOGmn
 KxkquuwzrgcsjOBk7MaT9Z5eEJp2JFYt7Y7iGcTGYZzwXvwuUl09X3jHDiB0xbP0pBfXgIyuyWip4
 eyuS3z5QK6I9ZDe5FS4N7Yg2q1X2kJOau0Keygpw3c9Nob3Hjp/jqLa4JNSdTxRKxUt8=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rAb7I-000567-Lo for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Dec 2023 19:30:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D6604CE180D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  5 Dec 2023 19:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D86DC433C7;
 Tue,  5 Dec 2023 19:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701804585;
 bh=icfD1/c6dcAxTv3VQ2Fva2oj2NvRmskfgjhm2BQup5k=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=FLdOiwErQLm7TnmxWUgGRAwvpuE6c6fqacxbNJxs3SVnrAEp128VpkzWAIZmulnfS
 gHubPTgp1bIwILDDmksZXSkRZZD+XcRlJe8bHYeqvojNnywR6j87YLSj3d+bbYuE13
 rj37I/yK8IiLzfZcSC4xKKavNqhIFfYwAhbPZtVjqhCX4RUbfskRGjKCP9ORnb3JAt
 aQbwuWwC3SBRoSg22BsWg0+XGqhR8bHQVgYQOQiSEMH5yddJasHYp2wmD9eu8kXo0l
 ErXeRLHD4+hmvuvAQpAxKTPp2TiIrT1OwfwbzKvn9DbP1DCpQwucO/yZysr6YeiADY
 lcZK0HSEC5l1g==
Date: Tue, 5 Dec 2023 11:29:43 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <ZW96J6UnvzHgPqb1@google.com>
References: <20231204180428.925779-1-jaegeuk@kernel.org>
 <20231204180428.925779-4-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231204180428.925779-4-jaegeuk@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In order to limit # of open zones,
 let's finish or reset zones
 given # of valid blocks per section and its zone condition. Reviewed-by:
 Daeho Jeong <daehojeong@google.com> Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org> --- 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rAb7I-000567-Lo
Subject: Re: [f2fs-dev] [PATCH 4/4 v2] f2fs: let's finish or reset zones all
 the time
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In order to limit # of open zones, let's finish or reset zones given # of
valid blocks per section and its zone condition.

Reviewed-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 - remove unnecessary wp_block

 fs/f2fs/segment.c | 75 +++++++++++------------------------------------
 1 file changed, 17 insertions(+), 58 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 9081c9af977a..007ebb107236 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4870,82 +4870,43 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
 				    struct f2fs_dev_info *fdev,
 				    struct blk_zone *zone)
 {
-	unsigned int wp_segno, wp_blkoff, zone_secno, zone_segno, segno;
-	block_t zone_block, wp_block, last_valid_block;
+	unsigned int zone_segno;
+	block_t zone_block, valid_block_cnt;
 	unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
-	int i, s, b, ret;
-	struct seg_entry *se;
+	int ret;
 
 	if (zone->type != BLK_ZONE_TYPE_SEQWRITE_REQ)
 		return 0;
 
-	wp_block = fdev->start_blk + (zone->wp >> log_sectors_per_block);
-	wp_segno = GET_SEGNO(sbi, wp_block);
-	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
 	zone_block = fdev->start_blk + (zone->start >> log_sectors_per_block);
 	zone_segno = GET_SEGNO(sbi, zone_block);
-	zone_secno = GET_SEC_FROM_SEG(sbi, zone_segno);
-
-	if (zone_segno >= MAIN_SEGS(sbi))
-		return 0;
 
 	/*
 	 * Skip check of zones cursegs point to, since
 	 * fix_curseg_write_pointer() checks them.
 	 */
-	for (i = 0; i < NO_CHECK_TYPE; i++)
-		if (zone_secno == GET_SEC_FROM_SEG(sbi,
-						   CURSEG_I(sbi, i)->segno))
-			return 0;
+	if (zone_segno >= MAIN_SEGS(sbi) ||
+	    IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, zone_segno)))
+		return 0;
 
 	/*
-	 * Get last valid block of the zone.
+	 * Get # of valid block of the zone.
 	 */
-	last_valid_block = zone_block - 1;
-	for (s = sbi->segs_per_sec - 1; s >= 0; s--) {
-		segno = zone_segno + s;
-		se = get_seg_entry(sbi, segno);
-		for (b = sbi->blocks_per_seg - 1; b >= 0; b--)
-			if (f2fs_test_bit(b, se->cur_valid_map)) {
-				last_valid_block = START_BLOCK(sbi, segno) + b;
-				break;
-			}
-		if (last_valid_block >= zone_block)
-			break;
-	}
+	valid_block_cnt = get_valid_blocks(sbi, zone_segno, true);
 
-	/*
-	 * When safely unmounted in the previous mount, we can trust write
-	 * pointers. Otherwise, finish zones.
-	 */
-	if (is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG)) {
-		/*
-		 * The write pointer matches with the valid blocks or
-		 * already points to the end of the zone.
-		 */
-		if ((last_valid_block + 1 == wp_block) ||
-				(zone->wp == zone->start + zone->len))
-			return 0;
-	}
+	if ((!valid_block_cnt && zone->cond == BLK_ZONE_COND_EMPTY) ||
+	    (valid_block_cnt && zone->cond == BLK_ZONE_COND_FULL))
+		return 0;
 
-	if (last_valid_block + 1 == zone_block) {
-		if (is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG)) {
-			/*
-			 * If there is no valid block in the zone and if write
-			 * pointer is not at zone start, reset the write
-			 * pointer.
-			 */
-			f2fs_notice(sbi,
-			      "Zone without valid block has non-zero write "
-			      "pointer. Reset the write pointer: wp[0x%x,0x%x]",
-			      wp_segno, wp_blkoff);
-		}
+	if (!valid_block_cnt) {
+		f2fs_notice(sbi, "Zone without valid block has non-zero write "
+			    "pointer. Reset the write pointer: cond[0x%x]",
+			    zone->cond);
 		ret = __f2fs_issue_discard_zone(sbi, fdev->bdev, zone_block,
 					zone->len >> log_sectors_per_block);
 		if (ret)
 			f2fs_err(sbi, "Discard zone failed: %s (errno=%d)",
 				 fdev->path, ret);
-
 		return ret;
 	}
 
@@ -4957,10 +4918,8 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
 	 * selected for write operation until it get discarded.
 	 */
 	f2fs_notice(sbi, "Valid blocks are not aligned with write "
-			    "pointer: valid block[0x%x,0x%x] wp[0x%x,0x%x]",
-			    GET_SEGNO(sbi, last_valid_block),
-			    GET_BLKOFF_FROM_SEG0(sbi, last_valid_block),
-			    wp_segno, wp_blkoff);
+		    "pointer: valid block[0x%x,0x%x] cond[0x%x]",
+		    zone_segno, valid_block_cnt, zone->cond);
 
 	ret = blkdev_zone_mgmt(fdev->bdev, REQ_OP_ZONE_FINISH,
 				zone->start, zone->len, GFP_NOFS);
-- 
2.43.0.rc2.451.g8631bc7472-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
