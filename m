Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 718CE6E68BA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Apr 2023 17:56:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ponge-0003n6-G2;
	Tue, 18 Apr 2023 15:56:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pongc-0003mw-Fm
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Apr 2023 15:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iHFWnUNRYpiA0gyWQ4fekF2pw4f4et73NRPSl7G/ljg=; b=ZqxkRttDOeuX2yWk/zUMeL7Em8
 DWmCLYAC6DYR/douvhKQoABQSzmW5zqYHkJby3fYoiKkjwPLNsWbn5BK3Oy27EIpVdt40aAdvSDF5
 hjMVz9SWDUKSNv/j3lHxtERZVS8NAbpOEqNWjyc9ftxBENg8EnseRwC8F3hcmKk6MMWw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iHFWnUNRYpiA0gyWQ4fekF2pw4f4et73NRPSl7G/ljg=; b=R4tscy2Aw1HF0CGt7fW9Fqwz5r
 6a+GZFs5JtgYgwKlpXL+f7ZMWvHw/ihLv1I1frdqQCS8P71YwvpIzypwsNBeV9Qkv1RjbSXjqYwT3
 gmzWaaRyazRgOdy5riHh0pIEpiKdXAgICZ1TRqOt/xLGxlejyUUvflwTk9bDm2mkt2cA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pongc-00BXk2-4z for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Apr 2023 15:56:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C9E43635C8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Apr 2023 15:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B6CC4339C;
 Tue, 18 Apr 2023 15:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681833360;
 bh=XhwoNE3hOdeXm3s+cs5zqqi+93Su9LmADaKSVChDM2I=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=PfQ9eUr/S32fmXcHSFrwvsb934TYobydU7TP+e6wnQ2EolewCWl5IA9dTA5wx1qMt
 shR08XyFA2QhXj9FIYt3zbg3KZFAhkswTdnStiypaKQxJx03lE7V4Du9eCUC735T+0
 E0pJe4GexJYeSRDZU+1jMUT9kOZhsxI8fz8g5X916YnkjQF+aOZDRppBjwqysQvtBC
 4kISwa+gwDQJYF7wKpU1TBqmTiwT3xKNqNrJR2f1rFfmpBj2Ya6BrkYAK95bOZl+4F
 k+KsAqvPphboEDB7l32GNBcuMu702NoURj9KofWQyVpvvr1xKi0xJXJrniFbasLGfi
 LttiF0fswNytA==
Date: Tue, 18 Apr 2023 08:55:58 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <ZD69jto/SFPycuHm@google.com>
References: <20230418004049.3262659-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230418004049.3262659-1-jaegeuk@kernel.org>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In f2fs,
 there's no reason to force po2. Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> --- Change log from v1: - fix udiv 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 2.3 TVD_SUBJ_WIPE_DEBT     Spam advertising a way to eliminate debt
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pongc-00BXk2-4z
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: remove power-of-two limitation fo
 zoned device
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

In f2fs, there's no reason to force po2.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 Change log from v1:
  - fix udiv

 fs/f2fs/f2fs.h    | 3 +--
 fs/f2fs/gc.c      | 4 ++--
 fs/f2fs/segment.c | 2 +-
 fs/f2fs/super.c   | 8 ++------
 4 files changed, 6 insertions(+), 11 deletions(-)

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
index a6a0dc471b74..61c5f9d26018 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -2093,8 +2093,8 @@ static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
 		FDEV(last_dev).end_blk =
 				(long long)FDEV(last_dev).end_blk + blks;
 #ifdef CONFIG_BLK_DEV_ZONED
-		FDEV(last_dev).nr_blkz = (int)FDEV(last_dev).nr_blkz +
-					(int)(blks >> sbi->log_blocks_per_blkz);
+		FDEV(last_dev).nr_blkz = FDEV(last_dev).nr_blkz +
+					div_u64(blks, sbi->blocks_per_blkz);
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
index 4e53b1100b84..9f15b03037db 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3806,12 +3806,8 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
 				SECTOR_TO_BLOCK(zone_sectors))
 		return -EINVAL;
 	sbi->blocks_per_blkz = SECTOR_TO_BLOCK(zone_sectors);
-	if (sbi->log_blocks_per_blkz && sbi->log_blocks_per_blkz !=
-				__ilog2_u32(sbi->blocks_per_blkz))
-		return -EINVAL;
-	sbi->log_blocks_per_blkz = __ilog2_u32(sbi->blocks_per_blkz);
-	FDEV(devi).nr_blkz = SECTOR_TO_BLOCK(nr_sectors) >>
-					sbi->log_blocks_per_blkz;
+	FDEV(devi).nr_blkz = div_u64(SECTOR_TO_BLOCK(nr_sectors),
+					sbi->blocks_per_blkz);
 	if (nr_sectors & (zone_sectors - 1))
 		FDEV(devi).nr_blkz++;
 
-- 
2.40.0.634.g4ca3ef3211-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
