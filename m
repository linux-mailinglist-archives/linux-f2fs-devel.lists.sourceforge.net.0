Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8585D826187
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  6 Jan 2024 21:55:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rMDhg-0002Ch-7R;
	Sat, 06 Jan 2024 20:55:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1rMCJ7-0006zc-08
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 06 Jan 2024 19:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dlHS4M7ROAgh/OrBv7SqmMmdHtmybRqgH56XCuetaD4=; b=W5csD1UNbcG8Rxx9a5SYkgwyAZ
 26kssebK2eyQpOszTXINMWFt7cBgkUNYOmflM0nETS+gTQeAQ9Ng64REzYyDU/fH7n1kbI9wvB+Q+
 udqfPodR3Ra21LUHQJfUpAPZ0xnxMXByvKyK3Gd2hnoAbFP5+FFe5UZ+tLjH9rTlgREE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dlHS4M7ROAgh/OrBv7SqmMmdHtmybRqgH56XCuetaD4=; b=H
 CSU+WDnCrFbRnLIH34YpzbHrfUd8O+WstvUr5cXd5H72yaHg2tdb7VWqP1Nmx7Mr/FPWEE/UgLgHg
 yX47kjn4FBBhh5blZweb/D3LbPuGEcGy/Ps6K5bl/O7owQ44jbsvmHMKxGdUeqcYid+geCAktmcON
 cMoPjT+eqAEolqNg=;
Received: from mail-qt1-f178.google.com ([209.85.160.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rMCJ2-0001T0-Bj for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 06 Jan 2024 19:26:08 +0000
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-4277e2a95edso3191531cf.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 06 Jan 2024 11:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704569153; x=1705173953; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dlHS4M7ROAgh/OrBv7SqmMmdHtmybRqgH56XCuetaD4=;
 b=HMIZkMpP30yco7QPuwopWneOeLKtS68r9j6ohlNo4T692dWwksD28rfM9lcQfJNPib
 uj/bdM2kfw9clHs99lUIZIaT6a+oQ2m6GpdFEH5hu4gDTMW3UTTJpikubMvExvpCdmU7
 Bg1fwk50jV3vfXcW8wo0l5RL6hInGNdzpYMvelSeBkjoTcBs7L8enAXySJHMv0o3CVS3
 n3pm/NdK0jGY9qFr4uphDjWpPtUY8EluWNI7oVS7NBFyvbNL8FHPzFUodRFuC+/tGhep
 K4d3IJ55/yTTofFmtB8roCH2VBgyTFqiCxZS1ikXWzRHiuS+XvXpvt8GtEVNeX/uDGSH
 8xVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704569153; x=1705173953;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dlHS4M7ROAgh/OrBv7SqmMmdHtmybRqgH56XCuetaD4=;
 b=maJZsIHjkqH3xZmvqvYiS+vhsiow7rhugijBvVeosPGCK6rKCGq0ITvUTEJn86GVAA
 n+jWXBXJNqAD2Y5lmVjBLXul1bloUQyI+71L7i4ZO4960ZbsHdxFFuOQjQgq8OGG4uUP
 4rC04uGSbALq8T4oIdO/feFKmexW1Xed2K5B8bKLxC/146ct0V9V0geGb5gG+Q4QHIwg
 U9AuI1E9m3Ux41jtoZ2dH0K03zHixGzt/m2vlFf9EesBwTA+UKVhkFqaelyCIXUSscnW
 EAN8YVWupzvuPh+/mlM/+94u2mQbEIkbXWmRSN6YK+6Sr07QWLN9lxaT3kVttRiQpwa0
 znwA==
X-Gm-Message-State: AOJu0YyEkjwzV+p5diLCrs8Ll8W9yetVvT5+aCu91xAAeLiTtiZs8Qoe
 QJGNk/kyqOg4U7pDau2ZfabF3RW5FN0fjhf+
X-Google-Smtp-Source: AGHT+IGVH3QQm4SSQO0xRDLyK8MGlYUxsqyqDwCoxboEzSbn7vP7ZX/sTjaZWv+mO9A1+cJEyZOl8g==
X-Received: by 2002:a17:902:e549:b0:1d4:e0e:fa1b with SMTP id
 n9-20020a170902e54900b001d40e0efa1bmr780852plf.57.1704535114599; 
 Sat, 06 Jan 2024 01:58:34 -0800 (PST)
Received: from localhost.localdomain ([2001:250:4000:8246:7d2f:b593:5038:2a88])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a17090ad58600b0028c72951de9sm2697730pju.20.2024.01.06.01.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 01:58:34 -0800 (PST)
From: Wenjie <qwjhust@gmail.com>
To: jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Sat,  6 Jan 2024 17:57:56 +0800
Message-ID: <20240106095756.1093-1-qwjhust@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Wenjie Qi 1. If the max active zones of zoned devices
 are less than the active logs of F2FS, the device may error due to insufficient
 zone resources when multiple active logs are being written at the same time.
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qwjhust[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.178 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.178 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1rMCJ2-0001T0-Bj
Subject: [f2fs-dev] [PATCH] f2fs: fix max open zone constraints
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
Cc: Wenjie Qi <qwjhust@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Wenjie Qi <qwjhust@gmail.com>

1. If the max active zones of zoned devices are less than the active logs of F2FS, the device may error due to insufficient zone resources when multiple active logs are being written at the same time.

2. We can get the number of remaining available zone resources by subtracting the number of active logs from the number of max active zones of zoned devices.  We can use these available zone resources to reduce the number of pending bio when switching zones.

Signed-off-by: Wenjie Qi <qwjhust@gmail.com>
---
 fs/f2fs/data.c  | 35 +++++++++++++++++++++++++++++------
 fs/f2fs/f2fs.h  |  3 +++
 fs/f2fs/super.c | 11 +++++++++++
 3 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index dce8defdf4c7..b6809a619171 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -392,6 +392,21 @@ static void f2fs_zone_write_end_io(struct bio *bio)
 	complete(&io->zone_wait);
 	f2fs_write_end_io(bio);
 }
+
+static void f2fs_zone_write_end_io_nowait(struct bio *bio)
+{
+#ifdef CONFIG_F2FS_IOSTAT
+	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
+	struct f2fs_sb_info *sbi = iostat_ctx->sbi;
+#else
+	struct f2fs_sb_info *sbi = (struct f2fs_sb_info *)bio->bi_private;
+#endif
+	
+	spin_lock(&sbi->available_active_zones_lock);
+	sbi->available_active_zones++;
+	spin_unlock(&sbi->available_active_zones_lock);
+	f2fs_write_end_io(bio);
+}
 #endif
 
 struct block_device *f2fs_target_device(struct f2fs_sb_info *sbi,
@@ -1087,12 +1102,20 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 #ifdef CONFIG_BLK_DEV_ZONED
 	if (f2fs_sb_has_blkzoned(sbi) && btype < META &&
 			is_end_zone_blkaddr(sbi, fio->new_blkaddr)) {
-		bio_get(io->bio);
-		reinit_completion(&io->zone_wait);
-		io->bi_private = io->bio->bi_private;
-		io->bio->bi_private = io;
-		io->bio->bi_end_io = f2fs_zone_write_end_io;
-		io->zone_pending_bio = io->bio;
+		spin_lock_bh(&sbi->available_active_zones_lock);
+		if (sbi->available_active_zones > 0){
+			sbi->available_active_zones--;
+			spin_unlock_bh(&sbi->available_active_zones_lock);
+			io->bio->bi_end_io = f2fs_zone_write_end_io_nowait;
+		}else{
+			spin_unlock_bh(&sbi->available_active_zones_lock);
+			bio_get(io->bio);
+			reinit_completion(&io->zone_wait);
+			io->bi_private = io->bio->bi_private;
+			io->bio->bi_private = io;
+			io->bio->bi_end_io = f2fs_zone_write_end_io;
+			io->zone_pending_bio = io->bio;
+		}
 		__submit_merged_bio(io);
 	}
 #endif
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 65294e3b0bef..8637eea1dfb8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1551,6 +1551,9 @@ struct f2fs_sb_info {
 
 #ifdef CONFIG_BLK_DEV_ZONED
 	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
+	unsigned int max_active_zones;		/* max zone resources of the zoned device */
+	unsigned int available_active_zones;		/* remaining available zone resources for active logs */
+	spinlock_t available_active_zones_lock;		/* for available zone resources */
 #endif
 
 	/* for node-related operations */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 206d03c82d96..84f390e4ef49 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3932,6 +3932,17 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
 	if (!f2fs_sb_has_blkzoned(sbi))
 		return 0;
 
+	sbi->max_active_zones = bdev_max_active_zones(bdev);
+	if (sbi->max_active_zones && (sbi->max_active_zones < F2FS_OPTION(sbi).active_logs)) {
+		f2fs_err(sbi,
+			"zoned: max active zones %u is too small, need at least %u active zones",
+				 sbi->max_active_zones, F2FS_OPTION(sbi).active_logs);
+		return -EINVAL;
+	}
+
+	sbi->available_active_zones = sbi->max_active_zones - F2FS_OPTION(sbi).active_logs;
+	spin_lock_init(&sbi->available_active_zones_lock);
+
 	zone_sectors = bdev_zone_sectors(bdev);
 	if (!is_power_of_2(zone_sectors)) {
 		f2fs_err(sbi, "F2FS does not support non power of 2 zone sizes\n");
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
