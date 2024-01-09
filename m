Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D70A827DA0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Jan 2024 04:58:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rN3G7-0006ug-2H;
	Tue, 09 Jan 2024 03:58:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1rN3G6-0006ua-6n
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Jan 2024 03:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b+JGySNzF1TxXICx+IoE0CwzPZDyIzoBhgAgBf0mPnw=; b=flNKI0M3K6Z6NjzBOHoKdCUGL2
 M2wqOK0GA+rr+QzOvMnRFPRSy5ccW9jsAKSCLAvrd/F4mzDPn+BMYAyeME/no5OQwILAW3qHKO+pb
 zXYpL6gqEgY2HfhTuUzX18Ie2YlHdkjFgfqcYJPsHNvKqYYkmJN9WgDUiia6zqwIL8ls=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=b+JGySNzF1TxXICx+IoE0CwzPZDyIzoBhgAgBf0mPnw=; b=g
 3SbTXIMrJ66ztkzm8Kjdmd8ZcYcnFV83/i3J7WvlU/6wuWlno59uWmG2ct2IzoTYWvYI5yUGEiQkh
 2N3/bnCUW8ZwneIjg8w9XHyG0HfiB476cUyUlAn2PvDEIaYwfLHN0ELkzZhWVs1x12A23Cegej27y
 TQ5aj4+hulT9MxRI=;
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rN3G2-0003ry-J0 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Jan 2024 03:58:34 +0000
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1d427518d52so17451485ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 08 Jan 2024 19:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704772700; x=1705377500; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b+JGySNzF1TxXICx+IoE0CwzPZDyIzoBhgAgBf0mPnw=;
 b=ckMsSJjnbsz4Nxc6moRD2hRhifOXqM1Drza5HKN9N4PEkgsMZ20mOOMIridFayIBph
 Ll3/Jbvmh0g7UZFTYnBPSohpx2nGJdquu5uzUp4KajAMFd9k0URxmsWQQMzS9AH0LUgm
 7TrpdeOYc6CZdkEMFp987qv5VA2iSQ4iwz/0fNpIBqISXX6tg2MrfYpe+87su6aHNrGI
 6thI0IYtoTE1SpPOx1vHMd8aUq1HJAWzRRXVxwOjx+7NBsnmFjmauUNIqPZ64u39JSmD
 HaC25QFgIaYfj13BRZ17KwsPSj9R8qsONjjuRDG4VAY+x2G7s8BJxSQYNKouvI1U7Ty8
 L7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704772700; x=1705377500;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b+JGySNzF1TxXICx+IoE0CwzPZDyIzoBhgAgBf0mPnw=;
 b=uL0JJddiZNAYodtuwkOeVURpcycHZ5m7C3XwhIwvBy58DLWdDMc1WdXvAksF46hgZi
 6m3EyYS6NKnBNZ6qD5vx6XjW+xqCyiEtBcGdJXbbA+BrpmH6q4zn1l6DbVxb2yURzNq9
 3FBCuMAspOfYVlLJeZyocZVfcqkbA9PMns6u3Dagk0m5Bu7QaOlFmp4ZfKj5Q/y5BJJC
 JFdjb5aaCnPSg93yLq6bZ97I8edfIfqO8VuYaGA0er1sfpp6Zr2lTO31a7pI7M7hEXn0
 jzQWzEZQwr47MR/ZpEdrSd39Ft6fxtFIAysBKBimdhi4ZzruwFm4jRymVRiSyw4QbLi+
 kjTA==
X-Gm-Message-State: AOJu0YywgAWYLrnpK9S0mED2uZ3qbc7e9JOucJ+xZJURGWfWHLuddd0A
 rxTZ8/+OvK5b/GSkFbbVbY0=
X-Google-Smtp-Source: AGHT+IG7oanF79UWlje51X1cFGF4No3FJX0a+t24EfCMq48WW1ffXcRhMq6cXjlehe94atY17VaM6w==
X-Received: by 2002:a17:903:278e:b0:1d4:cae:99f9 with SMTP id
 jw14-20020a170903278e00b001d40cae99f9mr134076plb.45.1704772699727; 
 Mon, 08 Jan 2024 19:58:19 -0800 (PST)
Received: from localhost.localdomain ([115.156.141.114])
 by smtp.gmail.com with ESMTPSA id
 m20-20020a170902c45400b001cf96a0e4e6sm645452plm.242.2024.01.08.19.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 19:58:19 -0800 (PST)
From: Wenjie <qwjhust@gmail.com>
To: jaegeuk@kernel.org, chao@kernel.org, guoweichao@oppo.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Tue,  9 Jan 2024 11:58:04 +0800
Message-ID: <20240109035804.642-1-qwjhust@gmail.com>
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
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.174 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qwjhust[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.174 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rN3G2-0003ry-J0
Subject: [f2fs-dev] [PATCH v2] f2fs: fix max open zone constraints
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
Cc: Wenjie Qi <qwjhust@gmail.com>, hustqwj@hust.edu.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Wenjie Qi <qwjhust@gmail.com>

1. If the max active zones of zoned devices are less than
the active logs of F2FS, the device may error due to
insufficient zone resources when multiple active logs are
being written at the same time.

2. We can get the number of remaining available zone
resources by subtracting the number of active logs from
the number of max active zones of zoned devices.  We can
use these available zone resources to reduce the number
of pending bio when switching zones.

3. The original code for determining zone end was
after "out":, which would have missed some fio's
where is_end_zone_blkaddr(sbi, fio->new_blkaddr)
was true. I've moved this code before "skip:" to
make sure it's done for each fio.

Signed-off-by: Wenjie Qi <qwjhust@gmail.com>
---
 fs/f2fs/data.c  | 38 ++++++++++++++++++++++++++++----------
 fs/f2fs/f2fs.h  |  2 ++
 fs/f2fs/super.c |  9 +++++++++
 3 files changed, 39 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index dce8defdf4c7..6b11364e94b8 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -392,6 +392,19 @@ static void f2fs_zone_write_end_io(struct bio *bio)
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
+	atomic_inc(&sbi->available_active_zones);
+	f2fs_write_end_io(bio);
+}
 #endif
 
 struct block_device *f2fs_target_device(struct f2fs_sb_info *sbi,
@@ -1080,22 +1093,27 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	io->last_block_in_bio = fio->new_blkaddr;
 
 	trace_f2fs_submit_page_write(fio->page, fio);
-skip:
-	if (fio->in_list)
-		goto next;
-out:
 #ifdef CONFIG_BLK_DEV_ZONED
 	if (f2fs_sb_has_blkzoned(sbi) && btype < META &&
 			is_end_zone_blkaddr(sbi, fio->new_blkaddr)) {
-		bio_get(io->bio);
-		reinit_completion(&io->zone_wait);
-		io->bi_private = io->bio->bi_private;
-		io->bio->bi_private = io;
-		io->bio->bi_end_io = f2fs_zone_write_end_io;
-		io->zone_pending_bio = io->bio;
+		if (!atomic_add_negative(-1, &sbi->available_active_zones)) {
+			io->bio->bi_end_io = f2fs_zone_write_end_io_nowait;
+		} else {
+			atomic_inc(&sbi->available_active_zones);
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
+skip:
+	if (fio->in_list)
+		goto next;
+out:
 	if (is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN) ||
 				!f2fs_is_checkpoint_ready(sbi))
 		__submit_merged_bio(io);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 65294e3b0bef..1b1833e1d10e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1551,6 +1551,8 @@ struct f2fs_sb_info {
 
 #ifdef CONFIG_BLK_DEV_ZONED
 	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
+	unsigned int max_active_zones;		/* max zone resources of the zoned device */
+	atomic_t available_active_zones;		/* remaining zone resources */
 #endif
 
 	/* for node-related operations */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 206d03c82d96..c79919425d63 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3932,6 +3932,15 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
 	if (!f2fs_sb_has_blkzoned(sbi))
 		return 0;
 
+	sbi->max_active_zones = bdev_max_active_zones(bdev);
+	if (sbi->max_active_zones && (sbi->max_active_zones < F2FS_OPTION(sbi).active_logs)) {
+		f2fs_err(sbi,
+			"zoned: max active zones %u is too small, need at least %u active zones",
+				 sbi->max_active_zones, F2FS_OPTION(sbi).active_logs);
+		return -EINVAL;
+	}
+	atomic_set(&sbi->available_active_zones, sbi->max_active_zones - F2FS_OPTION(sbi).active_logs);
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
