Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5B46C3E51
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Mar 2023 00:12:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pel9F-0006t1-Fh;
	Tue, 21 Mar 2023 23:12:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pel9D-0006su-CR
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Mar 2023 23:12:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=etQbrzhC+tWh1RuW8CA3W6T4xIdk2JomYciHs7pgPo8=; b=I4y+1qALsjjKhPk1/55ZQvIaiy
 6wKg5aWtgqHNVXQfoqDcEBM1tZWAbO0Nheny5tK9u1/vQgMp2sMQ5+AaFkPdvhQL9J1MmLdhj+Hdq
 d3Jqgy21v69UUa2AwAD2FlLfopbr5duqcF4j2kJJg1MyCHwfwaLaVP/dz3J5m0SIm7bY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=etQbrzhC+tWh1RuW8CA3W6T4xIdk2JomYciHs7pgPo8=; b=L
 nSnS7So3cce3sGnCuZfbD6sIQyyTIOAh3H/KhQHEp7FFpt9nrxKhPZ1yVn2K55k5tyC6Kqi6lYeLe
 aH/ugLOf/hkBpPSkwXuKfRP6Ki093hvybccRS9gL+rL4vEZzL1fNuem57I1FFMzcb8jkOixMVFvyE
 ajlv5RqWgtcV9Nzs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pel9B-00FzwN-Pn for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Mar 2023 23:12:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9173861ECC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Mar 2023 23:11:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D9EC433EF;
 Tue, 21 Mar 2023 23:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679440319;
 bh=LqxLIrrbcTEUIKFvohX7QfSRI4ssWYPirw+0Jq92hLU=;
 h=From:To:Cc:Subject:Date:From;
 b=Tkh2eSZreiY8+7oliQ0G8kMG6ypRH6+TNgCwx5nG6STgajOVdzd206T8D4nk8sNdN
 uf1nRhzKtFrK8dpDNFZZWQcoD8mcOvt6b3yhggXUVKEP7au7sks2r+X6oG084I7hDi
 dVrgVkpE4lHPZzBOzwqzLV5qy90q5iosHHKkOrQtvkpBn8KUVgMZFTlKvf8IabZIjZ
 QZlc5KQCnS5tO8Xw8A/NnWPSaYXXJoV6KgRycpny5H95BaNhUxXdFx01EjqbtTvwAK
 j7Sfn89zHnVbfjb+SCMaiBFYq4UHPz0U7joBxP6QAwZctVD44SkmG3g98HcBMsSfrw
 vId62QZBaaLng==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 21 Mar 2023 16:11:57 -0700
Message-Id: <20230321231157.963598-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If we manage the zone capacity per zone type, it'll break
 the GC assumption. And, the current logic complains valid block count mismatch.
 Let's apply zone capacity to all zone type, if specified. Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/segment.c | 65 +++
 fs/f2fs/segment.h
 | 3 +++ 2 files changed, 7 insertions(+), 61 deletions(-) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pel9B-00FzwN-Pn
Subject: [f2fs-dev] [PATCH] f2fs: apply zone capacity to all zone type
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

If we manage the zone capacity per zone type, it'll break the GC assumption.
And, the current logic complains valid block count mismatch.
Let's apply zone capacity to all zone type, if specified.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/segment.c | 65 +++--------------------------------------------
 fs/f2fs/segment.h |  3 +++
 2 files changed, 7 insertions(+), 61 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 055e70e77aa2..6c11789da884 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4999,48 +4999,6 @@ int f2fs_check_write_pointer(struct f2fs_sb_info *sbi)
 	return 0;
 }
 
-static bool is_conv_zone(struct f2fs_sb_info *sbi, unsigned int zone_idx,
-						unsigned int dev_idx)
-{
-	if (!bdev_is_zoned(FDEV(dev_idx).bdev))
-		return true;
-	return !test_bit(zone_idx, FDEV(dev_idx).blkz_seq);
-}
-
-/* Return the zone index in the given device */
-static unsigned int get_zone_idx(struct f2fs_sb_info *sbi, unsigned int secno,
-					int dev_idx)
-{
-	block_t sec_start_blkaddr = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi, secno));
-
-	return (sec_start_blkaddr - FDEV(dev_idx).start_blk) >>
-						sbi->log_blocks_per_blkz;
-}
-
-/*
- * Return the usable segments in a section based on the zone's
- * corresponding zone capacity. Zone is equal to a section.
- */
-static inline unsigned int f2fs_usable_zone_segs_in_sec(
-		struct f2fs_sb_info *sbi, unsigned int segno)
-{
-	unsigned int dev_idx, zone_idx;
-
-	dev_idx = f2fs_target_device_index(sbi, START_BLOCK(sbi, segno));
-	zone_idx = get_zone_idx(sbi, GET_SEC_FROM_SEG(sbi, segno), dev_idx);
-
-	/* Conventional zone's capacity is always equal to zone size */
-	if (is_conv_zone(sbi, zone_idx, dev_idx))
-		return sbi->segs_per_sec;
-
-	if (!sbi->unusable_blocks_per_sec)
-		return sbi->segs_per_sec;
-
-	/* Get the segment count beyond zone capacity block */
-	return sbi->segs_per_sec - (sbi->unusable_blocks_per_sec >>
-						sbi->log_blocks_per_seg);
-}
-
 /*
  * Return the number of usable blocks in a segment. The number of blocks
  * returned is always equal to the number of blocks in a segment for
@@ -5053,23 +5011,13 @@ static inline unsigned int f2fs_usable_zone_blks_in_seg(
 			struct f2fs_sb_info *sbi, unsigned int segno)
 {
 	block_t seg_start, sec_start_blkaddr, sec_cap_blkaddr;
-	unsigned int zone_idx, dev_idx, secno;
-
-	secno = GET_SEC_FROM_SEG(sbi, segno);
-	seg_start = START_BLOCK(sbi, segno);
-	dev_idx = f2fs_target_device_index(sbi, seg_start);
-	zone_idx = get_zone_idx(sbi, secno, dev_idx);
-
-	/*
-	 * Conventional zone's capacity is always equal to zone size,
-	 * so, blocks per segment is unchanged.
-	 */
-	if (is_conv_zone(sbi, zone_idx, dev_idx))
-		return sbi->blocks_per_seg;
+	unsigned int secno;
 
 	if (!sbi->unusable_blocks_per_sec)
 		return sbi->blocks_per_seg;
 
+	secno = GET_SEC_FROM_SEG(sbi, segno);
+	seg_start = START_BLOCK(sbi, segno);
 	sec_start_blkaddr = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi, secno));
 	sec_cap_blkaddr = sec_start_blkaddr + CAP_BLKS_PER_SEC(sbi);
 
@@ -5103,11 +5051,6 @@ static inline unsigned int f2fs_usable_zone_blks_in_seg(struct f2fs_sb_info *sbi
 	return 0;
 }
 
-static inline unsigned int f2fs_usable_zone_segs_in_sec(struct f2fs_sb_info *sbi,
-							unsigned int segno)
-{
-	return 0;
-}
 #endif
 unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
 					unsigned int segno)
@@ -5122,7 +5065,7 @@ unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
 					unsigned int segno)
 {
 	if (f2fs_sb_has_blkzoned(sbi))
-		return f2fs_usable_zone_segs_in_sec(sbi, segno);
+		return CAP_SEGS_PER_SEC(sbi);
 
 	return sbi->segs_per_sec;
 }
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index efdb7fc3b797..babb29a1c034 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -104,6 +104,9 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
 #define CAP_BLKS_PER_SEC(sbi)					\
 	((sbi)->segs_per_sec * (sbi)->blocks_per_seg -		\
 	 (sbi)->unusable_blocks_per_sec)
+#define CAP_SEGS_PER_SEC(sbi)					\
+	((sbi)->segs_per_sec - ((sbi)->unusable_blocks_per_sec >>\
+	(sbi)->log_blocks_per_seg))
 #define GET_SEC_FROM_SEG(sbi, segno)				\
 	(((segno) == -1) ? -1: (segno) / (sbi)->segs_per_sec)
 #define GET_SEG_FROM_SEC(sbi, secno)				\
-- 
2.40.0.rc1.284.g88254d51c5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
