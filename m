Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A09868405
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Feb 2024 23:52:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rejpy-0004GM-KP;
	Mon, 26 Feb 2024 22:52:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rejpw-0004GG-Tm
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 22:52:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vOpMOvXuTswAG66D7mx7NWfrWiKj6FmFsxI+r/6I2iU=; b=bXHlUQrGmwvSIjf8H+PKukPNf1
 r0tZnYmOh2UpBVa/T+caCRUVALgshkyF0Nabd9KvNmmDmtGQBoPCm5ACFLmh3WNpDPimn2XaRNP1v
 pFmsqdi4azL6KXXbz9CcSAviamkJoNe8clYRruy2FZB7uOWyRJHAR7LNx+413hzeWU3A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vOpMOvXuTswAG66D7mx7NWfrWiKj6FmFsxI+r/6I2iU=; b=Wl/TWdVpvhH5n19STZm8aZqbGA
 FV2JxkuCbRbLQir34/WMoLw2JDSM6lfDk0ctZ/VHfXseSwKVnZoH1cmB9IiHAs2y8zNqgHog64euc
 hBojMvc4MVpSudEaWZF8JSCPc+kU+NYggC3tUmsS/s5hWRcegFukRguDikCBF31ZGXw8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rejpx-0002Sj-60 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 22:52:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BF3DF61211
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Feb 2024 22:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D6B9C433C7;
 Mon, 26 Feb 2024 22:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708987950;
 bh=eARabO0/cgBRc/UGX8Aec460i0lvUced5HQ7ISeVL7M=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=TyGRqihJlxSZxTTQOuDtehdRX8prJI0IhnlMRM9L4OSfv/eAnOTpr247UMlKX0fZw
 TfTs6BtkMhZn0Hg5NfBnw8x/BiRoQbftZcrfif9gFbDygojg4b3gOQT6u0klEJizNB
 zasRDGdmRGOgep0i80t8apeQJBPmEbAaf1Tl/pZK2bqE90F+4VoAYUP+uBC/+QG/Ji
 cNtVup4kF06tzgbQitj4wQRREOfaiLmSjS+d31GeCcm+9VrGAVsMoLtYQt9NyYFd0Q
 iiUWl1vhoVT80FQj1ICVh57Sum7SNY6O6mkFg88SMGAdB1VAtTw3iaXiX3uXdtRTYZ
 /2tyQdZOgxRtA==
Date: Mon, 26 Feb 2024 14:52:28 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <Zd0WLOe89pByO7yX@google.com>
References: <20240223205535.307307-1-jaegeuk@kernel.org>
 <20240223205535.307307-3-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240223205535.307307-3-jaegeuk@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  No functional change, but add some more logs. Reviewed-by:
 Chao Yu <chao@kernel.org> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
 --- from v1: - avoid unnecessary log per Daeho's comment 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rejpx-0002Sj-60
Subject: Re: [f2fs-dev] [PATCH 3/5 v2] f2fs: print zone status in string and
 some log
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

No functional change, but add some more logs.

Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 from v1:
  - avoid unnecessary log per Daeho's comment

 fs/f2fs/segment.c | 27 +++++++++++++++++++++------
 fs/f2fs/super.c   |  1 +
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index d4f228e6f771..31a9e7db19e3 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4912,6 +4912,16 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
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
@@ -4932,14 +4942,19 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
 	 * Skip check of zones cursegs point to, since
 	 * fix_curseg_write_pointer() checks them.
 	 */
-	if (zone_segno >= MAIN_SEGS(sbi) ||
-	    IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, zone_segno)))
+	if (zone_segno >= MAIN_SEGS(sbi))
 		return 0;
 
 	/*
 	 * Get # of valid block of the zone.
 	 */
 	valid_block_cnt = get_valid_blocks(sbi, zone_segno, true);
+	if (IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, zone_segno))) {
+		f2fs_notice(sbi, "Open zones: valid block[0x%x,0x%x] cond[%s]",
+				zone_segno, valid_block_cnt,
+				f2fs_zone_status[zone->cond]);
+		return 0;
+	}
 
 	if ((!valid_block_cnt && zone->cond == BLK_ZONE_COND_EMPTY) ||
 	    (valid_block_cnt && zone->cond == BLK_ZONE_COND_FULL))
@@ -4947,8 +4962,8 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
 
 	if (!valid_block_cnt) {
 		f2fs_notice(sbi, "Zone without valid block has non-zero write "
-			    "pointer. Reset the write pointer: cond[0x%x]",
-			    zone->cond);
+			    "pointer. Reset the write pointer: cond[%s]",
+			    f2fs_zone_status[zone->cond]);
 		ret = __f2fs_issue_discard_zone(sbi, fdev->bdev, zone_block,
 					zone->len >> log_sectors_per_block);
 		if (ret)
@@ -4965,8 +4980,8 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
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
index 4d03ce1109ad..fc7f1a9fbbda 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4674,6 +4674,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	 * check zoned block devices' write pointer consistency.
 	 */
 	if (!f2fs_readonly(sb) && f2fs_sb_has_blkzoned(sbi)) {
+		f2fs_notice(sbi, "Checking entire write pointers");
 		err = f2fs_check_write_pointer(sbi);
 		if (err)
 			goto free_meta;
-- 
2.44.0.rc1.240.g4c46232300-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
