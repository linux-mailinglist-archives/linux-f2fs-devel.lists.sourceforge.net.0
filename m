Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0210D30BFA3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Feb 2021 14:38:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l6vtH-0002lh-Hr; Tue, 02 Feb 2021 13:38:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1l6vtF-0002lZ-Tc
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Feb 2021 13:38:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C69QpALUz/Vmi9PK2ISxOpgUe2yzE/S6S1X6OGff0v8=; b=jVz/MyQJYNcffBUQfFQmRryGpz
 xSiUOow6ooVT7aZ9XDlpgzGFrIIyTTgHCZ5GbyPGg+iBpVqRrux7gQK8KhLApIG9T5Pp6iA5RX4+V
 aI5LnxrfGoNxLt+nvyTGIWdtG8/JZFhLwS3KEOh9AMpIMQQrc3K9yZMovYJ5yLYKV7DM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=C69QpALUz/Vmi9PK2ISxOpgUe2yzE/S6S1X6OGff0v8=; b=f
 nylNFDtUQnRv3LtaO0Im1qUq9jhylNl5qNuku0GODwSY3dV3T88vbis6rMNn0BJ+QNQG0EBKTh1lS
 ct3AtrqqIWjqUkHcUBV8jTB3grR7wjCaLcqO4EYWZ0UALN5eCfer1epgxSmUwRfbtWFiO7C5EAw2a
 EKFLDOX/JgigA4ok=;
Received: from mail-pl1-f169.google.com ([209.85.214.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1l6vtB-0003ng-Ep
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Feb 2021 13:38:45 +0000
Received: by mail-pl1-f169.google.com with SMTP id d13so12496856plg.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 02 Feb 2021 05:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C69QpALUz/Vmi9PK2ISxOpgUe2yzE/S6S1X6OGff0v8=;
 b=lE5QgpRQANr285lptntXBKpZ0mfRKgwqNpjOT4+XiB148qmXATeLVDvu1BnjzBs2Z2
 UtIZd7vv8CGDG28WO9VtH0WpLxZwP1uMzhkWOEsEBsGMi3dNtDd6aRYsijDmnHDjVf+3
 t4dS8TUA1pb9fx1bpa0fgGwdM/OzUuA1PcK5a0/TaDWTr+9VzA/cfYuYUmp4d3SFIhHw
 u3K4EoxvXxm80jN/Xoajzw+HvvlYV7+DRJT9ODIdZhzHkP6CoI3yo/zPEBYTzJaKKNLR
 RpoUlBQ/2H1uEA73njCQbaSLtfChGVyHMkVqYAinMhNVxf+4b/hoUq09iNvivlI4iV2c
 gAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C69QpALUz/Vmi9PK2ISxOpgUe2yzE/S6S1X6OGff0v8=;
 b=lC7gVpf/6EUZh+r8etAX4lpNwmwWGXGPvnESxQ+yuTEXBh54tF/qJod/1EKEk1Ng3S
 2sgHgB2SC7NSjvwhFVKKkVIgKY4ELXyTHSMQY3yHNSrtPrv9h9WASOOPPOuekW/2GKwY
 k4zO/u5Hzvu3RrVeRf7IYqDdMX6AIJLaa2BNRCfNeeE2KziQWs8VQCgUycjJKHEYgdP0
 iLr504ZBlEUsfbNlsxKJ/MXJatc1bYdxVKg26MOOncEa08c9Wh7g7u8lD7Ert5KdTBFf
 tLSecZCb/lnTVYRkpafnin09dpSdln/jJpdMF0pAzLg+P+izfZmdkVz0wJCYEs3wNBUS
 7GpA==
X-Gm-Message-State: AOAM533qNyAIyo/sn6mX40K8h29U4Re/sTTy6iIFvq9qeniabjZoKIgu
 nQHHPW3pou5329fMNskywNL/KF5vilw=
X-Google-Smtp-Source: ABdhPJxZTcDSxyk50PeK+2qJYkaWv2iltg+9IXpptRym6j1r1bYGeqBheNDqoMYhaRfz4bta/h0G5w==
X-Received: by 2002:a17:90a:dc01:: with SMTP id
 i1mr4309237pjv.134.1612273115992; 
 Tue, 02 Feb 2021 05:38:35 -0800 (PST)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:11:4f5:ae3a:569d:491a])
 by smtp.gmail.com with ESMTPSA id a30sm21367022pfh.66.2021.02.02.05.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 05:38:35 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue,  2 Feb 2021 22:38:29 +0900
Message-Id: <20210202133829.2671108-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.169 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.169 listed in wl.mailspike.net]
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
X-Headers-End: 1l6vtB-0003ng-Ep
Subject: [f2fs-dev] [PATCH v5] f2fs: rename checkpoint=merge mount option to
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
v3: removed "nocheckpoint_merge" option
v4: re-added "nocheckpoint_merge" option to make it possible to disable
    just only "checkpoint_merge" when remount
v5: added the description about "nocheckpoint_merge" in rst and added it
    in show_options
---
 Documentation/filesystems/f2fs.rst |  7 ++++---
 fs/f2fs/super.c                    | 27 +++++++++++++++------------
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index d0ead45dc706..f75ec244762f 100644
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
@@ -257,6 +257,7 @@ checkpoint=%s[:%u[%]]	 Set to "disable" to turn off checkpointing. Set to "enabl
 			 to "3", to give one higher priority than other kernel threads.
 			 This is the same way to give a I/O priority to the jbd2
 			 journaling thread of ext4 filesystem.
+nocheckpoint_merge	 Disable checkpoint merge feature.
 compress_algorithm=%s	 Control compress algorithm, currently f2fs supports "lzo",
 			 "lz4", "zstd" and "lzo-rle" algorithm.
 compress_algorithm=%s:%d Control compress algorithm and its compress level, now, only
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 56696f6cfa86..1000d21120ca 100644
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
@@ -1782,7 +1781,9 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 		seq_printf(seq, ",checkpoint=disable:%u",
 				F2FS_OPTION(sbi).unusable_cap);
 	if (test_opt(sbi, MERGE_CHECKPOINT))
-		seq_puts(seq, ",checkpoint=merge");
+		seq_puts(seq, ",checkpoint_merge");
+	else
+		seq_puts(seq, ",nocheckpoint_merge");
 	if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_POSIX)
 		seq_printf(seq, ",fsync_mode=%s", "posix");
 	else if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_STRICT)
@@ -2066,9 +2067,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
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
@@ -2076,6 +2076,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 			    err);
 			goto restore_gc;
 		}
+	} else {
+		f2fs_stop_ckpt_thread(sbi);
 	}
 
 	/*
@@ -3831,7 +3833,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 
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
