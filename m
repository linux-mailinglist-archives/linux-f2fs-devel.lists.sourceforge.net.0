Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E71D682F091
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jan 2024 15:34:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rPkWd-0006GF-S1;
	Tue, 16 Jan 2024 14:34:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1rPkWc-0006G9-56
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jan 2024 14:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wVLeCLs+UC4LCws3JCkyo7iN6KY4LoEJi4nfZy2Uvf0=; b=YItekvS3+yDLevZEI7FhoB7Tki
 PjO9kWIeo1raIbxo54NkKKYuJgi9rAdS+QCdlj5POORJC9bt9BcKfuxRZKgz9PZ6h20NgVaSZps0j
 5iiBEMuKBhrYghvKuthYlabO+zJ4fGoUzcAyKa1nq4s/XuKkN5tPdJJxnmHq7Lta54t0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wVLeCLs+UC4LCws3JCkyo7iN6KY4LoEJi4nfZy2Uvf0=; b=I
 Gi4RgWxsRbZeMLFuRSHL/ES+4fSt5IPFdsHNHWTRMuK86uWxt/7r138xOyhFTj6+OjiLmyFrNOrNf
 Q9cLpF+amzst2Iqvar1z/pbr/Y0QQdqpmj1LTqt2+3khNwPygXpLvgTNm+RVpAvC45HaymycjuhSx
 zOVcpNvFTE30MOOg=;
Received: from mail-pg1-f178.google.com ([209.85.215.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rPkWb-0002JL-BJ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jan 2024 14:34:46 +0000
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-5ce6b5e3c4eso4386344a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jan 2024 06:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705415679; x=1706020479; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wVLeCLs+UC4LCws3JCkyo7iN6KY4LoEJi4nfZy2Uvf0=;
 b=CnP9bOqKN6RB1gu8DK8xDor7mKFNTma5IF/F7Y5NaPvK5yqw4GWHbwN9BBeUxyWc/+
 yolryUC7fZRNsHsdqdXzLYZqLWVY3UzXPycZvOPgnfhajZliuWWq6prcONC0hFzvA0tZ
 KQrgNcrxuN8zSKwaeRhQVTormIKadz9qcqwRJfY6qbGvIHoJD7Jcsx20Ej1qTzhkyPD/
 AE2xfEAYkV4+2AeEbdVvcOs6pmpQBHYdpEEBotoB0FPj7OSoPVXEFtzpJkTnEu7rIy9I
 qCRsdUAX9yeJ/tYM5uwcnLTIrYWLuoKrKImH7jE4gifjZYR3OEbs81t3d+FUqMZwPwTa
 9DVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705415679; x=1706020479;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wVLeCLs+UC4LCws3JCkyo7iN6KY4LoEJi4nfZy2Uvf0=;
 b=udyGN+DAKjK+0fIkWfH+pg5UZshX+Ev8as1GlffJp9Y60FVybEPO4nt+DJEwFTtsPb
 TVsd+dWFOptgcQ/TqhZRKRBtkMLAo7YbZ7PFrljOu/GTqcB2vM++FCjnATvNjHAdVLt7
 U65217X4n/RD9uy8ONkQj4A3lssTBZrdZOxa+VxDwEMU1tNvZX7CP5dW8HjEQ5f1dHf/
 rJbrcXWMjhjyOC9zy8o9rTU1r1xr/ZWahgRdfTqobdDnGOEMJxzoCy8tG/ZjwBpI/9Oj
 fSPfORZzoXKmhuzuMapieCvRRU0dwGxyoiNH+ZwQW9X6Lh5M4VZom7bc/P5r5rr8fh0/
 szJQ==
X-Gm-Message-State: AOJu0YxcqkeaFVzSRh98Y58u/8Y/QDmdHodJqXNwOh8i7FVKXQmH22a3
 WDPojt7nJErt7NcdMql8xmA=
X-Google-Smtp-Source: AGHT+IGHaN9YxTeIzJrPa8gr5TI0NPSj8v/Q4JIkg6Iko/WVK14HfcXfvs1OU5hQ9bSc8XXrKZKWHg==
X-Received: by 2002:a17:902:c409:b0:1d4:f77c:a8e4 with SMTP id
 k9-20020a170902c40900b001d4f77ca8e4mr4207509plk.79.1705415679435; 
 Tue, 16 Jan 2024 06:34:39 -0800 (PST)
Received: from localhost.localdomain ([2001:250:4000:8246:8dd2:f82d:e185:367f])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a170902f74d00b001d3c23a6862sm9402603plw.25.2024.01.16.06.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 06:34:39 -0800 (PST)
From: Wenjie Qi <qwjhust@gmail.com>
To: jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Tue, 16 Jan 2024 22:34:22 +0800
Message-ID: <20240116143422.1268-1-qwjhust@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: We can get the number of remaining available zone resources
 by subtracting the number of active logs from the number of max active zones
 of zoned devices. We can use these available zone resources to [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qwjhust[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.178 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.178 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rPkWb-0002JL-BJ
Subject: [f2fs-dev] [PATCH v1] f2fs: fix max open zone constraints
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

We can get the number of remaining available zone
resources by subtracting the number of active logs from
the number of max active zones of zoned devices. We can
use these available zone resources to reduce the number
of pending bio when switching zones.
If max active zones is 0, there is no limit.

Signed-off-by: Wenjie Qi <qwjhust@gmail.com>
---
 fs/f2fs/data.c  | 32 +++++++++++++++++++++++++-------
 fs/f2fs/f2fs.h  |  2 ++
 fs/f2fs/super.c | 11 +++++++++++
 3 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index dce8defdf4c7..0b62ca296074 100644
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
@@ -1085,14 +1098,19 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 		goto next;
 out:
 #ifdef CONFIG_BLK_DEV_ZONED
-	if (f2fs_sb_has_blkzoned(sbi) && btype < META &&
+	if (f2fs_sb_has_blkzoned(sbi) && sbi->max_active_zones && btype < META &&
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
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 65294e3b0bef..2aade367ac66 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1551,6 +1551,8 @@ struct f2fs_sb_info {
 
 #ifdef CONFIG_BLK_DEV_ZONED
 	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
+	unsigned int max_active_zones;		/* max zone resources of the zoned device */
+	atomic_t available_active_zones;	/* remaining zone resources for zone switch */
 #endif
 
 	/* for node-related operations */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 206d03c82d96..6711283ff187 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2385,6 +2385,12 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	if (err)
 		goto restore_opts;
 
+#ifdef CONFIG_BLK_DEV_ZONED
+	if (sbi->max_active_zones)
+		atomic_set(&sbi->available_active_zones,
+				sbi->max_active_zones - F2FS_OPTION(sbi).active_logs);
+#endif
+
 	/* flush outstanding errors before changing fs state */
 	flush_work(&sbi->s_error_work);
 
@@ -3932,6 +3938,11 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
 	if (!f2fs_sb_has_blkzoned(sbi))
 		return 0;
 
+	sbi->max_active_zones = bdev_max_active_zones(bdev);
+	if (sbi->max_active_zones)
+		atomic_set(&sbi->available_active_zones,
+				sbi->max_active_zones - F2FS_OPTION(sbi).active_logs);
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
