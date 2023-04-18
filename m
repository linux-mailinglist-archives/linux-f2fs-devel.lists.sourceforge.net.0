Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A18016E55F7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Apr 2023 02:41:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1poZP4-0007Qo-7r;
	Tue, 18 Apr 2023 00:41:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1poZP3-0007Qi-8m
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Apr 2023 00:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+Eo+JWun+Qgz3N9AiZy12Naydujuhu5225U+6bNxpVg=; b=MwEnOooEyUDeHjH3/lYDRdpYPO
 6AbxLCvNsMkFV0GqYKikYFzn0vUnvkv6g82n2u/4JBnP1ogiEhWsFHGlioBJC6ya1qlauod486AkX
 wmxnI9OLKCMPOXabKWRTikGSaEgjJKjGAD0QuV/R/LqFkT15twmVA9DF0CC3vRIW1C7A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+Eo+JWun+Qgz3N9AiZy12Naydujuhu5225U+6bNxpVg=; b=l
 Mdr6Uxb0EAfHMY/piVsRPxsFWQbyaxbKLy0QoCVOezmW9b2QuHbatRplecLeX2eGA9DdSvLCmNCI8
 ViPc3E7o3kWrKo+F5oJDQAZ57dkQ7EGWbO2wVG1cW7S9W4H3kl7tEuVxqlDt7KiQzfiAvhNBHksiu
 EZvDhq8GjO+6FzQo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1poZP1-00AzO9-Nn for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Apr 2023 00:41:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1E22A62B68
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Apr 2023 00:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C10C433D2;
 Tue, 18 Apr 2023 00:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681778450;
 bh=Krcthgy/LtBAbgtwEWXCvP7D8f3/FPztsZJremvZ+pc=;
 h=From:To:Cc:Subject:Date:From;
 b=AKN4e+dc/NrZ1J0iY7FvCl3YxkSnnDvmqDcQmi9dHi0r90pQUbEvY1N8Oi+AgT+yW
 8JJ82dqNVEkZrDqenv7WTZn+L9QptitG+lZ8XsWMsQr1zu9PodE1lyKO+V9CO2rnPA
 3KgNF3Nh4ItUAFjvDbKlr6WjgZr8b3zHpXLBmwMMuaNJpPPSWtAWqrbKbeKKelQQAJ
 bAWKAtL2NagrCrRZwUP1L3NWd5KVr8omIecC0dfdQsOKGT2RWpDSDnslxM1VfoSjRI
 pp9QSSFuQKCfDYNWoI2a0621GBUtHC+Ap2gSnPzvJSeeE2u41VMzhRm7d82dykff0v
 aiHnZPqgOMkiw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 17 Apr 2023 17:40:49 -0700
Message-ID: <20230418004049.3262659-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
MIME-Version: 1.0
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In f2fs,
 there's no reason to force po2. Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> --- fs/f2fs/f2fs.h | 3 +-- fs/f2fs/gc.c | 2 +-
 fs/f2fs/segment.c
 | 2 +- fs/f2fs/super.c | 7 +------ 4 files changed, 4 insertions(+),
 10 deletions(-)
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 2.3 TVD_SUBJ_WIPE_DEBT     Spam advertising a way to eliminate debt
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1poZP1-00AzO9-Nn
Subject: [f2fs-dev] [PATCH] f2fs: remove power-of-two limitation fo zoned
 device
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

In f2fs, there's no reason to force po2.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/f2fs.h    | 3 +--
 fs/f2fs/gc.c      | 2 +-
 fs/f2fs/segment.c | 2 +-
 fs/f2fs/super.c   | 7 +------
 4 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6cae94d51821..d8cb1dc09f9f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1523,7 +1523,6 @@ struct f2fs_sb_info {
 
 #ifdef CONFIG_BLK_DEV_ZONED
 	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
-	unsigned int log_blocks_per_blkz;	/* log2 F2FS blocks per zone */
 #endif
 
 	/* for node-related operations */
@@ -4377,7 +4376,7 @@ F2FS_FEATURE_FUNCS(readonly, RO);
 static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
 				    block_t blkaddr)
 {
-	unsigned int zno = blkaddr >> sbi->log_blocks_per_blkz;
+	unsigned int zno = blkaddr / sbi->blocks_per_blkz;
 
 	return test_bit(zno, FDEV(devi).blkz_seq);
 }
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index a6a0dc471b74..d69b5c7544eb 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -2094,7 +2094,7 @@ static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
 				(long long)FDEV(last_dev).end_blk + blks;
 #ifdef CONFIG_BLK_DEV_ZONED
 		FDEV(last_dev).nr_blkz = (int)FDEV(last_dev).nr_blkz +
-					(int)(blks >> sbi->log_blocks_per_blkz);
+					(int)(blks / sbi->blocks_per_blkz);
 #endif
 	}
 }
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c35476b3c075..641bd8cc54da 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2075,7 +2075,7 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 
 		if (force && start >= cpc->trim_start &&
 					(end - 1) <= cpc->trim_end)
-				continue;
+			continue;
 
 		/* Should cover 2MB zoned device for zone-based reset */
 		if (!f2fs_sb_has_blkzoned(sbi) &&
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 4e53b1100b84..5e4cd0249ffd 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3806,12 +3806,7 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
 				SECTOR_TO_BLOCK(zone_sectors))
 		return -EINVAL;
 	sbi->blocks_per_blkz = SECTOR_TO_BLOCK(zone_sectors);
-	if (sbi->log_blocks_per_blkz && sbi->log_blocks_per_blkz !=
-				__ilog2_u32(sbi->blocks_per_blkz))
-		return -EINVAL;
-	sbi->log_blocks_per_blkz = __ilog2_u32(sbi->blocks_per_blkz);
-	FDEV(devi).nr_blkz = SECTOR_TO_BLOCK(nr_sectors) >>
-					sbi->log_blocks_per_blkz;
+	FDEV(devi).nr_blkz = SECTOR_TO_BLOCK(nr_sectors) / sbi->blocks_per_blkz;
 	if (nr_sectors & (zone_sectors - 1))
 		FDEV(devi).nr_blkz++;
 
-- 
2.40.0.634.g4ca3ef3211-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
