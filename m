Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A25702DE751
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Dec 2020 17:17:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kqIRl-000540-Hd; Fri, 18 Dec 2020 16:17:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kqIRk-00053t-3l
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Dec 2020 16:17:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nrFZMiCIu1z8GAxAePmTBnI0nlN005LkXpGdEddydzs=; b=A5aLDQFf815UP+WKUvPduOqinr
 az1/caFpVA60EtfS2AqW0jHKljrkP+UOLto/hh2sFME3Xu1CXiQtp1ddMq8JRr+9O+/1Ltj6SkHTZ
 DxkdAZ1zMqs2q+3rlrty8V/mkQUd2stPrFfEkyq+MyNdxtqSJnimykt3TwQIGihiI6x8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nrFZMiCIu1z8GAxAePmTBnI0nlN005LkXpGdEddydzs=; b=K
 OfnhvsG8mIZLqNG/qPp87JQ3gxYZTBWdZt8gENTS57RCG/BlA072V00PqpuOI/6QnqYF3bRxjZ5PL
 sXCJRBlDBW8rMZ2tYIkJTBRVLpnk3y/Uh9s4+xBcyTcIllqAPi45VnFOm36/+dZU8Tu6FMfRL3xaE
 gUwqLwWev4oXoXlE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kqIRg-001TpV-OG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Dec 2020 16:17:36 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 18 Dec 2020 08:17:06 -0800
Message-Id: <20201218161708.927900-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kqIRg-001TpV-OG
Subject: [f2fs-dev] [PATCH 1/3] fsck.f2fs: fix alignment on multi-partition
 support
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

- mkfs.f2fs -s 4 -c second_dev first_dev
- fsck.f2fs first

Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 69668488 (34017 MB)
Segment count (19128) mismatch with total segments from devices (19130)	Can't find a valid F2FS superblock at 0x0
Segment count (19128) mismatch with total segments from devices (19130)	Can't find a valid F2FS superblock at 0x1

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/mount.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index fc3ecb959737..6b2f17ebe8f3 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -793,7 +793,7 @@ static int verify_sb_chksum(struct f2fs_super_block *sb)
 int sanity_check_raw_super(struct f2fs_super_block *sb, enum SB_ADDR sb_addr)
 {
 	unsigned int blocksize;
-	unsigned int segment_count, segs_per_sec, secs_per_zone;
+	unsigned int segment_count, segs_per_sec, secs_per_zone, segs_per_zone;
 	unsigned int total_sections, blocks_per_seg;
 
 	if ((get_sb(feature) & F2FS_FEATURE_SB_CHKSUM) &&
@@ -845,6 +845,7 @@ int sanity_check_raw_super(struct f2fs_super_block *sb, enum SB_ADDR sb_addr)
 	segs_per_sec = get_sb(segs_per_sec);
 	secs_per_zone = get_sb(secs_per_zone);
 	total_sections = get_sb(section_count);
+	segs_per_zone = segs_per_sec * secs_per_zone;
 
 	/* blocks_per_seg should be 512, given the above check */
 	blocks_per_seg = 1 << get_sb(log_blocks_per_seg);
@@ -883,7 +884,7 @@ int sanity_check_raw_super(struct f2fs_super_block *sb, enum SB_ADDR sb_addr)
 			dev_segs += le32_to_cpu(sb->devs[i].total_segments);
 			i++;
 		}
-		if (segment_count != dev_segs) {
+		if (segment_count != dev_segs / segs_per_zone * segs_per_zone) {
 			MSG(0, "Segment count (%u) mismatch with total segments from devices (%u)",
 				segment_count, dev_segs);
 			return 1;
-- 
2.29.2.729.g45daf8777d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
