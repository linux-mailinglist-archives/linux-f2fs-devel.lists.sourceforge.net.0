Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B01D3858886
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Feb 2024 23:32:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rb6ks-0006gk-7z;
	Fri, 16 Feb 2024 22:32:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rb6kp-0006gd-VY
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Feb 2024 22:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4xPjPyyohDCitC/Sqf3LzbeIlAmGng9ri3/WSzUa+/8=; b=Z4GIVMUeuZs8uQ/3gPVonsa05a
 EHv3yiTxOvBRwzrMy+G2ctDl79DhbQ4qsI6m7ktcAsvFrU2ZeFJBWZuFm977s8wpSzRWpOW2hipdH
 A06/AvdWl+Ebq6DxgmTUbG+gpToVhddvcJ7LnNuyABrv3AJGI1DY4YjuMswzDtTnKvTs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4xPjPyyohDCitC/Sqf3LzbeIlAmGng9ri3/WSzUa+/8=; b=EINqPvLK96fCfGuKbcT3lw7zSU
 uhVnPcaaq/PCfws4zgTEWSohhJ+C3rMWPS0BL68cQDI9eQWn/vp1GFfGjPOwyJKGIqbxtlauHfD5J
 lpPvvbqnTIiw58ez74mcHum+lGMiEm6wrrGlyeQ4m3w5pZlbyq5twgtSG1efpZ9swqp4=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rb6ko-0001BA-F0 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Feb 2024 22:32:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 14322CE2D63
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 Feb 2024 22:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F928C433F1;
 Fri, 16 Feb 2024 22:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708122731;
 bh=BNjwzfz+8rUOwJ8I6tUQYA45nCwEW2fVJcmb1pvmVYk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LT7HqGzw8AW3DgO12/pwHOdv/1xgeeTvVSJyVm/jEoyEfkahOj0Y9yvKRVrdxsgYu
 P7pGkT0+vFqnAg6/LCybblKkUMvKP+m0kJD51Z58xs2BwzSByUwAww+WZvn0qgmrmo
 xjZlPBfFNTEIVQhU6H1Qil8jt99zACJlqE9vMqC86BrTrREejXK2drgcfp4Un8DmpN
 qvFb8jbO29TnfaU4lqnSrUkmB09sbknwOcBXEFxE9fzlYZ3o46b0C6W/7Cp/8JE4ag
 SLVEOxQUrn+fQrvKdt2bx01wiumnaL8aMeHuQul6L6gdPhNw7REIOw9BXnJq8cFzym
 2mBe/PzOYJ9AQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 16 Feb 2024 14:32:08 -0800
Message-ID: <20240216223208.443024-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
In-Reply-To: <20240216223208.443024-1-jaegeuk@kernel.org>
References: <20240216223208.443024-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  No functional change, but add some more logs. Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/segment.c | 34
 ++++++++++++++++++++++++
 fs/f2fs/super.c | 1 + 2 files changed, 25 insertions(+), 10 deletions(-) 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rb6ko-0001BA-F0
Subject: [f2fs-dev] [PATCH 2/2] f2fs: print zone status in string and some
 log
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

No functional change, but add some more logs.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/segment.c | 34 ++++++++++++++++++++++++----------
 fs/f2fs/super.c   |  1 +
 2 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 4e248be030a6..3bbb80487b13 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4855,6 +4855,16 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
 }
 
 #ifdef CONFIG_BLK_DEV_ZONED
+const char *f2fs_zone_status[BLK_ZONE_COND_OFFLINE + 1] = {
+	[BLK_ZONE_COND_NOT_WP]		= "NOT_WP",
+	[BLK_ZONE_COND_EMPTY]		= "EMPTY",
+	[BLK_ZONE_COND_IMP_OPEN]	= "IMPLICITE_OPEN",
+	[BLK_ZONE_COND_EXP_OPEN]	= "EXPLICITE_OPEN",
+	[BLK_ZONE_COND_CLOSED]		= "CLOSED",
+	[BLK_ZONE_COND_READONLY]	= "READONLY",
+	[BLK_ZONE_COND_FULL]		= "FULL",
+	[BLK_ZONE_COND_OFFLINE]		= "OFFLINE",
+};
 
 static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
 				    struct f2fs_dev_info *fdev,
@@ -4871,18 +4881,22 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
 	zone_block = fdev->start_blk + (zone->start >> log_sectors_per_block);
 	zone_segno = GET_SEGNO(sbi, zone_block);
 
+	/*
+	 * Get # of valid block of the zone.
+	 */
+	valid_block_cnt = get_valid_blocks(sbi, zone_segno, true);
+
 	/*
 	 * Skip check of zones cursegs point to, since
 	 * fix_curseg_write_pointer() checks them.
 	 */
 	if (zone_segno >= MAIN_SEGS(sbi) ||
-	    IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, zone_segno)))
+	    IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, zone_segno))) {
+		f2fs_notice(sbi, "Open zones: valid block[0x%x,0x%x] cond[%s]",
+				zone_segno, valid_block_cnt,
+				f2fs_zone_status[zone->cond]);
 		return 0;
-
-	/*
-	 * Get # of valid block of the zone.
-	 */
-	valid_block_cnt = get_valid_blocks(sbi, zone_segno, true);
+	}
 
 	if ((!valid_block_cnt && zone->cond == BLK_ZONE_COND_EMPTY) ||
 	    (valid_block_cnt && zone->cond == BLK_ZONE_COND_FULL))
@@ -4890,8 +4904,8 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
 
 	if (!valid_block_cnt) {
 		f2fs_notice(sbi, "Zone without valid block has non-zero write "
-			    "pointer. Reset the write pointer: cond[0x%x]",
-			    zone->cond);
+			    "pointer. Reset the write pointer: cond[%s]",
+			    f2fs_zone_status[zone->cond]);
 		ret = __f2fs_issue_discard_zone(sbi, fdev->bdev, zone_block,
 					zone->len >> log_sectors_per_block);
 		if (ret)
@@ -4908,8 +4922,8 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
 	 * selected for write operation until it get discarded.
 	 */
 	f2fs_notice(sbi, "Valid blocks are not aligned with write "
-		    "pointer: valid block[0x%x,0x%x] cond[0x%x]",
-		    zone_segno, valid_block_cnt, zone->cond);
+		    "pointer: valid block[0x%x,0x%x] cond[%s]",
+		    zone_segno, valid_block_cnt, f2fs_zone_status[zone->cond]);
 
 	ret = blkdev_zone_mgmt(fdev->bdev, REQ_OP_ZONE_FINISH,
 				zone->start, zone->len, GFP_NOFS);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a2b7a5c448b5..cb597b8e8ec5 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4657,6 +4657,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	 * check zoned block devices' write pointer consistency.
 	 */
 	if (!f2fs_readonly(sb) && f2fs_sb_has_blkzoned(sbi)) {
+		f2fs_notice(sbi, "Checking entire write pointers");
 		err = f2fs_check_write_pointer(sbi);
 		if (err)
 			goto free_meta;
-- 
2.44.0.rc0.258.g7320e95886-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
