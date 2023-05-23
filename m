Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC78870DCB0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 May 2023 14:35:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q1REq-0001rU-9r;
	Tue, 23 May 2023 12:35:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q1REo-0001rL-KL
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 May 2023 12:35:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HQ6Qh5jGVx8tlQ+w/PXoG8FE76HBp2ZfQVfH2GVPJAQ=; b=aSzzE8QtYupJ/AHCOQt/A7XjS+
 KZIagjysnE65e0cNdS9uwplJ7FMNMHF01mTvrTFGWQFFk4jKUtFX9Je/5NSDgJKyMs5Ru3NR2kvI/
 z3XMHgVMFHrqW1YAzOnv3SUBoiuWrh1g/PBBO28t4VPs5jqNaJQgq+vawvedng0xiuZI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=HQ6Qh5jGVx8tlQ+w/PXoG8FE76HBp2ZfQVfH2GVPJAQ=; b=H
 m/8cROYO1JGnr2i7LBMFAU4sB/6wmL/vWHLk/+6sanSS/RIZJmrTIaGzRFTFptNjAEPqbd0dVgtwC
 hq6vwiV3R37Ci9Gl2B24WIvMcAEZK5Y7G+EW+fNDKJHIfrUefG+vd1F3lqUrpq+/lyifXDWJ86ADr
 so6M8deZmoaFiu1M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q1REo-000TQc-NF for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 May 2023 12:35:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 56167631DD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 23 May 2023 12:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 996DFC433EF;
 Tue, 23 May 2023 12:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684845328;
 bh=5URJ0niupsFX+DKwvQymh4lC2dqDWe3nA3EpbyGLCMQ=;
 h=From:To:Cc:Subject:Date:From;
 b=BavkA/EXyBhl+LzyUGOz7k0/foOqHh6AVOumTFGjo8pIFxeBJG6j6mfZ1Y57sOeft
 BGq9k0WlLazMd/LvKexUp0/uOIsoU36fAfgZNY3qIpN6wlwbPh+jxkfHU/VbYqSZz3
 bOw6/H3H9n3f4UIy1MjlKISHausqPgXUiblgcfusfsZs/aIN8xzvxD+9A+08sdYNJm
 3g5JCx1fuxpIeyFxNNBke/AF4dkWbFOQDDZGB9WqHW0S/XZVmapz/oBL6NJRFaJoPE
 rIbOBLpWzHibC6ejzpz3XM1oxZosBy9PbsOUUG1cGnUeKAjOPaAmUHu4ejD6dFAxAA
 a5mjuJMXqDy/A==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 23 May 2023 20:35:21 +0800
Message-Id: <20230523123521.67656-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use sbi->log_sectors_per_block to clean up below calculated
 one: unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
 Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/segment.c | 23
 +++++++++++ 1 file changed, 11 insertions(+), 12 deletions(-) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q1REo-000TQc-NF
Subject: [f2fs-dev] [PATCH] f2fs: clean up w/ sbi->log_sectors_per_block
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use sbi->log_sectors_per_block to clean up below calculated one:

unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 43d537d29b52..9282399cc810 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4768,17 +4768,17 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
 {
 	unsigned int wp_segno, wp_blkoff, zone_secno, zone_segno, segno;
 	block_t zone_block, wp_block, last_valid_block;
-	unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
 	int i, s, b, ret;
 	struct seg_entry *se;
 
 	if (zone->type != BLK_ZONE_TYPE_SEQWRITE_REQ)
 		return 0;
 
-	wp_block = fdev->start_blk + (zone->wp >> log_sectors_per_block);
+	wp_block = fdev->start_blk + (zone->wp >> sbi->log_sectors_per_block);
 	wp_segno = GET_SEGNO(sbi, wp_block);
 	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
-	zone_block = fdev->start_blk + (zone->start >> log_sectors_per_block);
+	zone_block = fdev->start_blk + (zone->start >>
+						sbi->log_sectors_per_block);
 	zone_segno = GET_SEGNO(sbi, zone_block);
 	zone_secno = GET_SEC_FROM_SEG(sbi, zone_segno);
 
@@ -4824,7 +4824,7 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
 			    "pointer. Reset the write pointer: wp[0x%x,0x%x]",
 			    wp_segno, wp_blkoff);
 		ret = __f2fs_issue_discard_zone(sbi, fdev->bdev, zone_block,
-					zone->len >> log_sectors_per_block);
+				zone->len >> sbi->log_sectors_per_block);
 		if (ret)
 			f2fs_err(sbi, "Discard zone failed: %s (errno=%d)",
 				 fdev->path, ret);
@@ -4885,7 +4885,6 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 	struct blk_zone zone;
 	unsigned int cs_section, wp_segno, wp_blkoff, wp_sector_off;
 	block_t cs_zone_block, wp_block;
-	unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
 	sector_t zone_sector;
 	int err;
 
@@ -4897,8 +4896,8 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 		return 0;
 
 	/* report zone for the sector the curseg points to */
-	zone_sector = (sector_t)(cs_zone_block - zbd->start_blk)
-		<< log_sectors_per_block;
+	zone_sector = (sector_t)(cs_zone_block - zbd->start_blk) <<
+						sbi->log_sectors_per_block;
 	err = blkdev_report_zones(zbd->bdev, zone_sector, 1,
 				  report_one_zone_cb, &zone);
 	if (err != 1) {
@@ -4910,10 +4909,10 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 	if (zone.type != BLK_ZONE_TYPE_SEQWRITE_REQ)
 		return 0;
 
-	wp_block = zbd->start_blk + (zone.wp >> log_sectors_per_block);
+	wp_block = zbd->start_blk + (zone.wp >> sbi->log_sectors_per_block);
 	wp_segno = GET_SEGNO(sbi, wp_block);
 	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
-	wp_sector_off = zone.wp & GENMASK(log_sectors_per_block - 1, 0);
+	wp_sector_off = zone.wp & GENMASK(sbi->log_sectors_per_block - 1, 0);
 
 	if (cs->segno == wp_segno && cs->next_blkoff == wp_blkoff &&
 		wp_sector_off == 0)
@@ -4940,8 +4939,8 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 	if (!zbd)
 		return 0;
 
-	zone_sector = (sector_t)(cs_zone_block - zbd->start_blk)
-		<< log_sectors_per_block;
+	zone_sector = (sector_t)(cs_zone_block - zbd->start_blk) <<
+						sbi->log_sectors_per_block;
 	err = blkdev_report_zones(zbd->bdev, zone_sector, 1,
 				  report_one_zone_cb, &zone);
 	if (err != 1) {
@@ -4959,7 +4958,7 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 			    "Reset the zone: curseg[0x%x,0x%x]",
 			    type, cs->segno, cs->next_blkoff);
 		err = __f2fs_issue_discard_zone(sbi, zbd->bdev,	cs_zone_block,
-					zone.len >> log_sectors_per_block);
+					zone.len >> sbi->log_sectors_per_block);
 		if (err) {
 			f2fs_err(sbi, "Discard zone failed: %s (errno=%d)",
 				 zbd->path, err);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
