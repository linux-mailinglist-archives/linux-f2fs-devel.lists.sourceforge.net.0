Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 110BC89AF1D
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  7 Apr 2024 09:21:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rtMqW-0000f9-Rv;
	Sun, 07 Apr 2024 07:21:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rtMqV-0000f1-85
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 07 Apr 2024 07:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hn/EVwmRvh2jWhHsuYDIEQKDDZf2Qvrh24VJMTUywb8=; b=AhwLulk3wMb8dU6C/D576xzNTf
 ayLkUx2KUCNv64vB+tWJXcC49zta8d6WuTeRwRNgLAHULxpoHYccKy9iJtDv1FE6q46v0xzduE9eV
 +dGT83NlnVZQhXqrICEpi6ISOldP3JnVkXx/OZ07EqHm2arM92iks1wy5YnuKcVidFHg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hn/EVwmRvh2jWhHsuYDIEQKDDZf2Qvrh24VJMTUywb8=; b=Z
 BsF7skvEOZVY5djQxMSjq6OOYCo67eQcyxKXqax8kQOLWC3OzG2m4oNL/N/vO9zsEzqscg64oSMGT
 Vttmzq4OL4z8CKXn9s3a8C5NMpyRoSLtKQth9XVktWwg8QVocI2PDdOqJ+l0xIj7kAWPSvHSyRmzH
 Jr74osx2ucfb8fOc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rtMqU-0001AL-EL for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 07 Apr 2024 07:21:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4BDD160C58;
 Sun,  7 Apr 2024 07:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7155AC433F1;
 Sun,  7 Apr 2024 07:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712474492;
 bh=sTsz2yC68gF80nOn+mrSl6qAbn+Ba4y6BK10ybpuh4M=;
 h=From:To:Cc:Subject:Date:From;
 b=SQ+0NAeLk4GLSCbVM8kSPhXchCX7IyQRx8jlpHKFJxRan3nFoITvLbWB5ywR/k5Xd
 /iQNI3d3k3VzZNOOxx+QXSlbMhSYqJMleRi1k7iATKo3Ntt8SjBqc5Trvj6YZawavH
 J9Ck3otcNhWdMN4mW6bOZ05JaXqDkwp3yzvQUQwSve4z12aOSe0Pq78VjCWZhObMnZ
 z7cONDgKUtMVHn0YAJKWAYGi6Wu1i0xDcB7Lkekwkm4j4fUs16QkiLVha1Z4YB/j5n
 +6Zv1CtpY+6GODRK5dfOCWwWA0HdUqGMMPyJXi37zDkWwQAZVGfxsXLWcBHyQ8ULmj
 RDrwmUQrzEWJw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun,  7 Apr 2024 15:21:23 +0800
Message-Id: <20240407072123.3484300-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Wenjie Qi <qwjhust@gmail.com> If the max open zones
 of zoned devices are less than the active logs of F2FS, the device may error
 due to insufficient zone resources when multiple active logs are being written
 at the same time. 
 Content analysis details:   (-7.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rtMqU-0001AL-EL
Subject: [f2fs-dev] [PATCH v7] f2fs: fix zoned block device information
 initialization
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
Cc: Wenjie Qi <qwjhust@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Wenjie Qi <qwjhust@gmail.com>

If the max open zones of zoned devices are less than
the active logs of F2FS, the device may error due to
insufficient zone resources when multiple active logs
are being written at the same time.

Signed-off-by: Wenjie Qi <qwjhust@gmail.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v7:
- check f2fs_sb_has_blkzoned() instead of multiple-device condition
in f2fs_remount().
 fs/f2fs/f2fs.h  |  1 +
 fs/f2fs/super.c | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 0550929dc6e5..694f8a52cb84 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1559,6 +1559,7 @@ struct f2fs_sb_info {
 
 #ifdef CONFIG_BLK_DEV_ZONED
 	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
+	unsigned int max_open_zones;		/* max open zone resources of the zoned device */
 #endif
 
 	/* for node-related operations */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ba6288e870c5..fdf358c7f808 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2324,6 +2324,17 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	if (err)
 		goto restore_opts;
 
+#ifdef CONFIG_BLK_DEV_ZONED
+	if (f2fs_sb_has_blkzoned(sbi) &&
+		sbi->max_open_zones < F2FS_OPTION(sbi).active_logs) {
+		f2fs_err(sbi,
+			"zoned: max open zones %u is too small, need at least %u open zones",
+				 sbi->max_open_zones, F2FS_OPTION(sbi).active_logs);
+		err = -EINVAL;
+		goto restore_opts;
+	}
+#endif
+
 	/* flush outstanding errors before changing fs state */
 	flush_work(&sbi->s_error_work);
 
@@ -3866,11 +3877,24 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
 	sector_t nr_sectors = bdev_nr_sectors(bdev);
 	struct f2fs_report_zones_args rep_zone_arg;
 	u64 zone_sectors;
+	unsigned int max_open_zones;
 	int ret;
 
 	if (!f2fs_sb_has_blkzoned(sbi))
 		return 0;
 
+	if (bdev_is_zoned(FDEV(devi).bdev)) {
+		max_open_zones = bdev_max_open_zones(bdev);
+		if (max_open_zones && (max_open_zones < sbi->max_open_zones))
+			sbi->max_open_zones = max_open_zones;
+		if (sbi->max_open_zones < F2FS_OPTION(sbi).active_logs) {
+			f2fs_err(sbi,
+				"zoned: max open zones %u is too small, need at least %u open zones",
+				sbi->max_open_zones, F2FS_OPTION(sbi).active_logs);
+			return -EINVAL;
+		}
+	}
+
 	zone_sectors = bdev_zone_sectors(bdev);
 	if (sbi->blocks_per_blkz && sbi->blocks_per_blkz !=
 				SECTOR_TO_BLOCK(zone_sectors))
@@ -4191,6 +4215,9 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 
 	logical_blksize = bdev_logical_block_size(sbi->sb->s_bdev);
 	sbi->aligned_blksize = true;
+#ifdef CONFIG_BLK_DEV_ZONED
+	sbi->max_open_zones = UINT_MAX;
+#endif
 
 	for (i = 0; i < max_devices; i++) {
 		if (i == 0)
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
