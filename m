Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E800155F20C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jun 2022 01:47:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o6Kvw-00069G-2e; Tue, 28 Jun 2022 23:47:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1o6Kvu-000699-PX
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jun 2022 23:47:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tiqqew0VE4YNaLOsPLPiJKGaEQNp9XMSShBLcVGtflk=; b=HnNpWp7YKP0auaquNS9mqXll16
 yFSCpggg9leI2YQgJ9UWTH4VaUmqzmAIJ/YCXQxif6lMnJL4/+1IB4xnD2pT6G5Tr2sc/UEEk3Es7
 +eC0qOTNM/3fWRHjpsojLIFFZ0ka4STmZHYDPaOC7CRQAc+qVTq2dknd0gSWEQ8rTScA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Tiqqew0VE4YNaLOsPLPiJKGaEQNp9XMSShBLcVGtflk=; b=U
 ONiLH32ipzXTfyYfakNtI8o2g2TyxOfgdFjAy0+mbEKeCOPw3vLk1jWjMrBVHcu8rtZR1SU9Epzv3
 1r4sN6BBDYE4lm9b6ypgGxOpuDvM6LL2tVi5+X7RBeGMum6ChFmAtdY7e6zBsmYdwP5s7Sdv7mYM+
 KrtdAZmmdHowKlfk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o6Kvs-0001xX-G8
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jun 2022 23:47:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5F391B81E0A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 28 Jun 2022 23:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13242C341C8;
 Tue, 28 Jun 2022 23:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656460056;
 bh=53mXwbi49s8zWq2OJGvJkwTI8FumVuSeqxQjgBaYmYc=;
 h=From:To:Cc:Subject:Date:From;
 b=mVnK5DLhNZXPdhOP/lPSu8JBsgAPIoA0nfQtGaRY18xGxY/z2Ho6QarvDVd1TC/qL
 cM5pid4KDdMZCjnfhrE4AAfe3Hwm4qL4JNFXJK6VBV27ABq0ByG8/cHjDUi/jSci2g
 mp4v/U0OvL9J145lyd0YxSNRrH34/MOFoeMVqAfIuAydkr8ZSYc11oJW53dfaiL2Pc
 zxFtywvX2KUGgb0iVJhptT0rlRpvhJBWizUIvz+Ub19x9KcUMFryHNLaXOWXEskaYL
 gtlRp0kM1eByncAnSIJktR7GPSUVgtED5a/OlKitIVQMQOvRqTesZ1CY1VMP2GX4VL
 HS1pIAdzRHKkw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 28 Jun 2022 16:47:31 -0700
Message-Id: <20220628234733.3330502-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In order to simplify the complicated per-zone capacity, let's
 support only one capacity for entire zoned device. Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> --- fs/f2fs/f2fs.h | 2 +- fs/f2fs/segment.c | 19
 ++++++ fs/f2fs/segment.h | 3 +++ fs/f2fs/super.c | 33 ++++++++++++ 4 [...]
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o6Kvs-0001xX-G8
Subject: [f2fs-dev] [PATCH 1/3] f2fs: enforce single zone capacity
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

In order to simplify the complicated per-zone capacity, let's support
only one capacity for entire zoned device.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/f2fs.h    |  2 +-
 fs/f2fs/segment.c | 19 ++++++-------------
 fs/f2fs/segment.h |  3 +++
 fs/f2fs/super.c   | 33 ++++++++++++---------------------
 4 files changed, 22 insertions(+), 35 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c9a31934b948..1d97d06e0d87 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1235,7 +1235,6 @@ struct f2fs_dev_info {
 #ifdef CONFIG_BLK_DEV_ZONED
 	unsigned int nr_blkz;		/* Total number of zones */
 	unsigned long *blkz_seq;	/* Bitmap indicating sequential zones */
-	block_t *zone_capacity_blocks;  /* Array of zone capacity in blks */
 #endif
 };
 
@@ -1673,6 +1672,7 @@ struct f2fs_sb_info {
 	unsigned int meta_ino_num;		/* meta inode number*/
 	unsigned int log_blocks_per_seg;	/* log2 blocks per segment */
 	unsigned int blocks_per_seg;		/* blocks per segment */
+	unsigned int unusable_blocks_per_sec;	/* unusable blocks per section */
 	unsigned int segs_per_sec;		/* segments per section */
 	unsigned int secs_per_zone;		/* sections per zone */
 	unsigned int total_sections;		/* total section count */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 874c1b9c41a2..447b03579049 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4895,7 +4895,7 @@ static unsigned int get_zone_idx(struct f2fs_sb_info *sbi, unsigned int secno,
 static inline unsigned int f2fs_usable_zone_segs_in_sec(
 		struct f2fs_sb_info *sbi, unsigned int segno)
 {
-	unsigned int dev_idx, zone_idx, unusable_segs_in_sec;
+	unsigned int dev_idx, zone_idx;
 
 	dev_idx = f2fs_target_device_index(sbi, START_BLOCK(sbi, segno));
 	zone_idx = get_zone_idx(sbi, GET_SEC_FROM_SEG(sbi, segno), dev_idx);
@@ -4904,18 +4904,12 @@ static inline unsigned int f2fs_usable_zone_segs_in_sec(
 	if (is_conv_zone(sbi, zone_idx, dev_idx))
 		return sbi->segs_per_sec;
 
-	/*
-	 * If the zone_capacity_blocks array is NULL, then zone capacity
-	 * is equal to the zone size for all zones
-	 */
-	if (!FDEV(dev_idx).zone_capacity_blocks)
+	if (!sbi->unusable_blocks_per_sec)
 		return sbi->segs_per_sec;
 
 	/* Get the segment count beyond zone capacity block */
-	unusable_segs_in_sec = (sbi->blocks_per_blkz -
-				FDEV(dev_idx).zone_capacity_blocks[zone_idx]) >>
-				sbi->log_blocks_per_seg;
-	return sbi->segs_per_sec - unusable_segs_in_sec;
+	return sbi->segs_per_sec - (sbi->unusable_blocks_per_sec >>
+						sbi->log_blocks_per_seg);
 }
 
 /*
@@ -4944,12 +4938,11 @@ static inline unsigned int f2fs_usable_zone_blks_in_seg(
 	if (is_conv_zone(sbi, zone_idx, dev_idx))
 		return sbi->blocks_per_seg;
 
-	if (!FDEV(dev_idx).zone_capacity_blocks)
+	if (!sbi->unusable_blocks_per_sec)
 		return sbi->blocks_per_seg;
 
 	sec_start_blkaddr = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi, secno));
-	sec_cap_blkaddr = sec_start_blkaddr +
-				FDEV(dev_idx).zone_capacity_blocks[zone_idx];
+	sec_cap_blkaddr = sec_start_blkaddr + CAP_BLKS_PER_SEC(sbi);
 
 	/*
 	 * If segment starts before zone capacity and spans beyond
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 3f277dfcb131..813a892cd979 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -101,6 +101,9 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
 		GET_SEGNO_FROM_SEG0(sbi, blk_addr)))
 #define BLKS_PER_SEC(sbi)					\
 	((sbi)->segs_per_sec * (sbi)->blocks_per_seg)
+#define CAP_BLKS_PER_SEC(sbi)					\
+	((sbi)->segs_per_sec * (sbi)->blocks_per_seg -		\
+	 (sbi)->unusable_blocks_per_sec)
 #define GET_SEC_FROM_SEG(sbi, segno)				\
 	(((segno) == -1) ? -1: (segno) / (sbi)->segs_per_sec)
 #define GET_SEG_FROM_SEC(sbi, secno)				\
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index cf9cf24f9b56..faf9a767d05a 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1522,7 +1522,6 @@ static void destroy_device_list(struct f2fs_sb_info *sbi)
 		blkdev_put(FDEV(i).bdev, FMODE_EXCL);
 #ifdef CONFIG_BLK_DEV_ZONED
 		kvfree(FDEV(i).blkz_seq);
-		kfree(FDEV(i).zone_capacity_blocks);
 #endif
 	}
 	kvfree(sbi->devs);
@@ -3673,24 +3672,29 @@ static int init_percpu_info(struct f2fs_sb_info *sbi)
 #ifdef CONFIG_BLK_DEV_ZONED
 
 struct f2fs_report_zones_args {
+	struct f2fs_sb_info *sbi;
 	struct f2fs_dev_info *dev;
-	bool zone_cap_mismatch;
 };
 
 static int f2fs_report_zone_cb(struct blk_zone *zone, unsigned int idx,
 			      void *data)
 {
 	struct f2fs_report_zones_args *rz_args = data;
+	block_t unusable_blocks = (zone->len - zone->capacity) >>
+					F2FS_LOG_SECTORS_PER_BLOCK;
 
 	if (zone->type == BLK_ZONE_TYPE_CONVENTIONAL)
 		return 0;
 
 	set_bit(idx, rz_args->dev->blkz_seq);
-	rz_args->dev->zone_capacity_blocks[idx] = zone->capacity >>
-						F2FS_LOG_SECTORS_PER_BLOCK;
-	if (zone->len != zone->capacity && !rz_args->zone_cap_mismatch)
-		rz_args->zone_cap_mismatch = true;
-
+	if (!rz_args->sbi->unusable_blocks_per_sec) {
+		rz_args->sbi->unusable_blocks_per_sec = unusable_blocks;
+		return 0;
+	}
+	if (rz_args->sbi->unusable_blocks_per_sec != unusable_blocks) {
+		f2fs_err(rz_args->sbi, "F2FS supports single zone capacity\n");
+		return -EINVAL;
+	}
 	return 0;
 }
 
@@ -3731,26 +3735,13 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
 	if (!FDEV(devi).blkz_seq)
 		return -ENOMEM;
 
-	/* Get block zones type and zone-capacity */
-	FDEV(devi).zone_capacity_blocks = f2fs_kzalloc(sbi,
-					FDEV(devi).nr_blkz * sizeof(block_t),
-					GFP_KERNEL);
-	if (!FDEV(devi).zone_capacity_blocks)
-		return -ENOMEM;
-
+	rep_zone_arg.sbi = sbi;
 	rep_zone_arg.dev = &FDEV(devi);
-	rep_zone_arg.zone_cap_mismatch = false;
 
 	ret = blkdev_report_zones(bdev, 0, BLK_ALL_ZONES, f2fs_report_zone_cb,
 				  &rep_zone_arg);
 	if (ret < 0)
 		return ret;
-
-	if (!rep_zone_arg.zone_cap_mismatch) {
-		kfree(FDEV(devi).zone_capacity_blocks);
-		FDEV(devi).zone_capacity_blocks = NULL;
-	}
-
 	return 0;
 }
 #endif
-- 
2.37.0.rc0.161.g10f37bed90-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
