Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F34DE74E62E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Jul 2023 07:01:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qJ5Uy-0003vk-Lv;
	Tue, 11 Jul 2023 05:01:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1qJ5Ux-0003ve-Hn
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Jul 2023 05:01:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ei7eps8BVoQjwq/GzBbarZemDnrTg5OhoVFdBbrnXac=; b=bcVpji8+eJYa/eZ3+vgWCtRS/Z
 4KZACTKHaxJKzPBBsHoy/Ig4ng/GEnfmQsIuCBE+R8trlfHrVbsEHeqIRc6Y1Njtlfy3DXZmlqL2F
 XnKvKSXm7R9cmpamk4eKpgoU5CRWMlyoVCoQ4Z44ic5oAp795ZVjqaY/6IceXIKOQwcs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ei7eps8BVoQjwq/GzBbarZemDnrTg5OhoVFdBbrnXac=; b=LANPqBx+xO1YMrARVnILc4/dxA
 WKf1UzTs5Ttio3RduldQ7zy8/O/q/Jcb522MI1R+KJY6n7XXLp2Fn8Mer0aC1Mu6qN5SN/eqDQ6df
 sPCAzIuQcGVA++NtngygpZQ7m8KiQDv51bQuP5OtejfYNey9O76h/eNjZ7bL5411zW/U=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qJ5Uw-003wWR-NI for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Jul 2023 05:01:15 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3A0A768B05; Tue, 11 Jul 2023 07:01:02 +0200 (CEST)
Date: Tue, 11 Jul 2023 07:01:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20230711050101.GA19128@lst.de>
References: <20230707094028.107898-1-hch@lst.de> <ZKx2jVONy35B0/S1@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZKx2jVONy35B0/S1@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  I think that's because it doesn't look at sbi->s_ndevs in
 destroy_device_list. Let's try the variant below, which also fixes the buildbot
 warning for non-zoned configfs: --- From
 645d8dceaa97b6ee73be067495b111b15b187498
 Mon Sep 17 00:00:00 2001 From: Christoph Hellwig <hch@lst.de> Date: Fri,
 7 Jul 2023 10:31:49 +0200 Subject: f2fs: don't reopen the main block device
 i [...] Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Headers-End: 1qJ5Uw-003wWR-NI
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't reopen the main block device in
 f2fs_scan_devices
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
Cc: linux-block@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I think that's because it doesn't look at sbi->s_ndevs in
destroy_device_list.  Let's try the variant below, which also fixes
the buildbot warning for non-zoned configfs:

---
From 645d8dceaa97b6ee73be067495b111b15b187498 Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Fri, 7 Jul 2023 10:31:49 +0200
Subject: f2fs: don't reopen the main block device in f2fs_scan_devices

f2fs_scan_devices reopens the main device since the very beginning, which
has always been useless, and also means that we don't pass the right
holder for the reopen, which now leads to a warning as the core super.c
holder ops aren't passed in for the reopen.

Fixes: 3c62be17d4f5 ("f2fs: support multiple devices")
Fixes: 0718afd47f70 ("block: introduce holder ops")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-flush.c |  2 +-
 fs/f2fs/super.c   | 20 ++++++++------------
 2 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ca31163da00a55..30883beb750a59 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1561,7 +1561,8 @@ static void destroy_device_list(struct f2fs_sb_info *sbi)
 	int i;
 
 	for (i = 0; i < sbi->s_ndevs; i++) {
-		blkdev_put(FDEV(i).bdev, sbi->sb->s_type);
+		if (i > 0)
+			blkdev_put(FDEV(i).bdev, sbi->sb->s_type);
 #ifdef CONFIG_BLK_DEV_ZONED
 		kvfree(FDEV(i).blkz_seq);
 #endif
@@ -4190,16 +4191,12 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 	sbi->aligned_blksize = true;
 
 	for (i = 0; i < max_devices; i++) {
-
-		if (i > 0 && !RDEV(i).path[0])
+		if (i == 0)
+			FDEV(0).bdev = sbi->sb->s_bdev;
+		else if (!RDEV(i).path[0])
 			break;
 
-		if (max_devices == 1) {
-			/* Single zoned block device mount */
-			FDEV(0).bdev =
-				blkdev_get_by_dev(sbi->sb->s_bdev->bd_dev, mode,
-						  sbi->sb->s_type, NULL);
-		} else {
+		if (max_devices > 1) {
 			/* Multi-device mount */
 			memcpy(FDEV(i).path, RDEV(i).path, MAX_PATH_LEN);
 			FDEV(i).total_segments =
@@ -4215,10 +4212,9 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 				FDEV(i).end_blk = FDEV(i).start_blk +
 					(FDEV(i).total_segments <<
 					sbi->log_blocks_per_seg) - 1;
+				FDEV(i).bdev = blkdev_get_by_path(FDEV(i).path,
+					mode, sbi->sb->s_type, NULL);
 			}
-			FDEV(i).bdev = blkdev_get_by_path(FDEV(i).path, mode,
-							  sbi->sb->s_type,
-							  NULL);
 		}
 		if (IS_ERR(FDEV(i).bdev))
 			return PTR_ERR(FDEV(i).bdev);
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
