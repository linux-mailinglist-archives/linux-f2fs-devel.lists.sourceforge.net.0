Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F2A30B6D1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Feb 2021 06:19:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l6o5Z-0005Of-3Z; Tue, 02 Feb 2021 05:18:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1l6o5X-0005OY-S7
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Feb 2021 05:18:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xxIbWKQee057BvPC22C9Txak/5Uxcdgh3GFtE4n47FM=; b=LNBa351cc7TpfOIm5QKs7kCtUC
 xcbiAWImJM/WvgsXVRPXubT8mTNpzk0Mwl9VbVEFXC4IBv9WDGcSZ4GSWb39yDrg2lJKphJFV00xx
 YX8N64T/OrFOUq2Myoex24ta6NUIGku2Rg0LN62IqdCATO9HGUMzlI1bfm6NNMDCA1KM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xxIbWKQee057BvPC22C9Txak/5Uxcdgh3GFtE4n47FM=; b=f
 xdt2Bq+HuKNZdPtkVgpPjPTEoFnqk18Xm31mL+9i8IlH5Ght4DHwwBhkU/kH+CoZ1SiL0igJCzZRG
 xKKl4HDqt1LsOVCCoOVDhI9pHC1lfeOhdyzEG9oIZ87d0Iv6CrfYj6WHxHQDbx+zQrFKILW6AqX+Q
 vv15HckOjiTQ/4Pk=;
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l6o5K-00DT0w-5z
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Feb 2021 05:18:55 +0000
Received: by mail-pf1-f182.google.com with SMTP id y205so13559897pfc.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 01 Feb 2021 21:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xxIbWKQee057BvPC22C9Txak/5Uxcdgh3GFtE4n47FM=;
 b=lANVz08oLU4V8erca40vM8pxbXD9ghcPYs+gn1O4VX6vuBFqLPoYigIdbxUH/OF3Le
 SoJlunknn8GNQMlFZsao2B13JJAUKyFgdkTB7+Dy3YyOSIiqT4Qce9ap1pHK7ow2KLqC
 gdfiu50z4giYPiNgmKy+QEWBnUusJ1g4sUtU2OBltnNa9ZikMaxtpNdEC13iM702hyQ6
 9qiBmJvy0jpazrY84HeufFd+AHJaZsKMEbxmtncsk4uDTpcEYEWAoXCtO8P/MzNZn+HZ
 KaDkZhGwzAmFWLAEl5HpsiWdGjQl0zHUsdpIwIuMSJ+/eeGVrKneG9is7/YDBSgKA6DS
 IXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xxIbWKQee057BvPC22C9Txak/5Uxcdgh3GFtE4n47FM=;
 b=lS0IRjy1eoCPqMHlzW4IyupG1XeZSXHmIIejw6HSgV5lLAP1HwlDfRUK7jxAXgfhY3
 oInG0HkUwOInI9NrbyPAXcSNtKjPoHrFACoQ96mZae+JAl1zy09oGg6OzaSA5KwGeCop
 I/y5+ZD4t+frfpSttROJaCG5H9FFC+4YChpbnw6L0j2/s02hbY5af/b657cLUqAFFZl6
 hD7g8ElcCDlGmPEu/5pbK47lXwOFK5SbtTE+wNmOgai9yr1oaww1iF0YFNTTmEwhqOk8
 l8GrtqDAXL/N4kd8Q9/obzqAyVZhR6QcpRwVj0BLa+hX0UYDSibAJlaI2ljZoq0kJIOc
 xoUw==
X-Gm-Message-State: AOAM531bqek874U9A+qMjRQypp0H0KF1ZSKuylMOrHH3EojLB4tQ4XFq
 bnXLJtGev2yImZ6TdW1t9W4=
X-Google-Smtp-Source: ABdhPJzWUBfvxKz37SEcLy+cwh/xiWGcQzvjJO+SePo3yBIDDj8LHKdhN91HBzxZEosc2bncxFRxJQ==
X-Received: by 2002:a62:5344:0:b029:1c7:eeea:8bad with SMTP id
 h65-20020a6253440000b02901c7eeea8badmr19597264pfb.1.1612243116589; 
 Mon, 01 Feb 2021 21:18:36 -0800 (PST)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:11:3d90:5212:5281:e85d])
 by smtp.gmail.com with ESMTPSA id z16sm21318282pgj.51.2021.02.01.21.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 21:18:35 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue,  2 Feb 2021 14:18:29 +0900
Message-Id: <20210202051829.2127214-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.182 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1l6o5K-00DT0w-5z
Subject: [f2fs-dev] [PATCH v2] f2fs: rename checkpoint=merge mount option to
 checkpoint_merge
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

As checkpoint=merge comes in, mount option setting related to checkpoint
had been mixed up and it became hard to understand. So, I separated
this option from "checkpoint=" and made another mount option
"checkpoint_merge" for this.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v2: renamed "checkpoint=merge" to "checkpoint_merge"
---
 Documentation/filesystems/f2fs.rst |  6 +++---
 fs/f2fs/super.c                    | 26 ++++++++++++++------------
 2 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index d0ead45dc706..475994ed8b15 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -247,9 +247,9 @@ checkpoint=%s[:%u[%]]	 Set to "disable" to turn off checkpointing. Set to "enabl
 			 hide up to all remaining free space. The actual space that
 			 would be unusable can be viewed at /sys/fs/f2fs/<disk>/unusable
 			 This space is reclaimed once checkpoint=enable.
-			 Here is another option "merge", which creates a kernel daemon
-			 and makes it to merge concurrent checkpoint requests as much
-			 as possible to eliminate redundant checkpoint issues. Plus,
+checkpoint_merge	 When checkpoint is enabled, this can be used to create a kernel
+			 daemon and make it to merge concurrent checkpoint requests as
+			 much as possible to eliminate redundant checkpoint issues. Plus,
 			 we can eliminate the sluggish issue caused by slow checkpoint
 			 operation when the checkpoint is done in a process context in
 			 a cgroup having low i/o budget and cpu shares. To make this
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 56696f6cfa86..d8603e6c4916 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -145,6 +145,7 @@ enum {
 	Opt_checkpoint_disable_cap_perc,
 	Opt_checkpoint_enable,
 	Opt_checkpoint_merge,
+	Opt_nocheckpoint_merge,
 	Opt_compress_algorithm,
 	Opt_compress_log_size,
 	Opt_compress_extension,
@@ -215,7 +216,8 @@ static match_table_t f2fs_tokens = {
 	{Opt_checkpoint_disable_cap, "checkpoint=disable:%u"},
 	{Opt_checkpoint_disable_cap_perc, "checkpoint=disable:%u%%"},
 	{Opt_checkpoint_enable, "checkpoint=enable"},
-	{Opt_checkpoint_merge, "checkpoint=merge"},
+	{Opt_checkpoint_merge, "checkpoint_merge"},
+	{Opt_nocheckpoint_merge, "nocheckpoint_merge"},
 	{Opt_compress_algorithm, "compress_algorithm=%s"},
 	{Opt_compress_log_size, "compress_log_size=%u"},
 	{Opt_compress_extension, "compress_extension=%s"},
@@ -946,6 +948,9 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		case Opt_checkpoint_merge:
 			set_opt(sbi, MERGE_CHECKPOINT);
 			break;
+		case Opt_nocheckpoint_merge:
+			clear_opt(sbi, MERGE_CHECKPOINT);
+			break;
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 		case Opt_compress_algorithm:
 			if (!f2fs_sb_has_compression(sbi)) {
@@ -1142,12 +1147,6 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		return -EINVAL;
 	}
 
-	if (test_opt(sbi, DISABLE_CHECKPOINT) &&
-			test_opt(sbi, MERGE_CHECKPOINT)) {
-		f2fs_err(sbi, "checkpoint=merge cannot be used with checkpoint=disable\n");
-		return -EINVAL;
-	}
-
 	/* Not pass down write hints if the number of active logs is lesser
 	 * than NR_CURSEG_PERSIST_TYPE.
 	 */
@@ -1782,7 +1781,7 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 		seq_printf(seq, ",checkpoint=disable:%u",
 				F2FS_OPTION(sbi).unusable_cap);
 	if (test_opt(sbi, MERGE_CHECKPOINT))
-		seq_puts(seq, ",checkpoint=merge");
+		seq_puts(seq, ",checkpoint_merge");
 	if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_POSIX)
 		seq_printf(seq, ",fsync_mode=%s", "posix");
 	else if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_STRICT)
@@ -1827,6 +1826,7 @@ static void default_options(struct f2fs_sb_info *sbi)
 	sbi->sb->s_flags |= SB_LAZYTIME;
 	set_opt(sbi, FLUSH_MERGE);
 	set_opt(sbi, DISCARD);
+	clear_opt(sbi, MERGE_CHECKPOINT);
 	if (f2fs_sb_has_blkzoned(sbi))
 		F2FS_OPTION(sbi).fs_mode = FS_MODE_LFS;
 	else
@@ -2066,9 +2066,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		}
 	}
 
-	if (!test_opt(sbi, MERGE_CHECKPOINT)) {
-		f2fs_stop_ckpt_thread(sbi);
-	} else {
+	if (!test_opt(sbi, DISABLE_CHECKPOINT) &&
+			test_opt(sbi, MERGE_CHECKPOINT)) {
 		err = f2fs_start_ckpt_thread(sbi);
 		if (err) {
 			f2fs_err(sbi,
@@ -2076,6 +2075,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 			    err);
 			goto restore_gc;
 		}
+	} else {
+		f2fs_stop_ckpt_thread(sbi);
 	}
 
 	/*
@@ -3831,7 +3832,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 
 	/* setup checkpoint request control and start checkpoint issue thread */
 	f2fs_init_ckpt_req_control(sbi);
-	if (test_opt(sbi, MERGE_CHECKPOINT)) {
+	if (!test_opt(sbi, DISABLE_CHECKPOINT) &&
+			test_opt(sbi, MERGE_CHECKPOINT)) {
 		err = f2fs_start_ckpt_thread(sbi);
 		if (err) {
 			f2fs_err(sbi,
-- 
2.30.0.365.g02bc693789-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
