Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C1A30BAD4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Feb 2021 10:23:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l6ruY-0000sQ-RI; Tue, 02 Feb 2021 09:23:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1l6ruX-0000sJ-Pc
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Feb 2021 09:23:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=02o59vXLINonMWY3lvfSKv5YhEgXWDRF+6oMw1Rtfck=; b=BFJMoEl2ja3ac+Aa+1Dwrhkl+f
 bndDFTgoQhIc7OPIqhcldpkr921zln5ezilkmMlg3g76lIeLa7gKG88IsQ/hG/TYCH5WSr4Bm11xQ
 q+1M9OdS2jtA4aFK4QpbRFwPXX1/2ovT+dJktpBow+BivQzR6GgAA836V5UBq1v0WJ6Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=02o59vXLINonMWY3lvfSKv5YhEgXWDRF+6oMw1Rtfck=; b=O
 yCy8xl8ygin8heFYsaZ3YYDKZe9D5ykTqPOsV/eVsb1velX99ubWAeSG5NimcdgZc7Y0i2f4brbDF
 3mI2JPJsLiPtUc9jHbGJTepqp1qtxjZjGDw8w4VOUuoOFSm0MOns+bhsyXCRDF4SVzNTpAGrf/VOQ
 xgoRNDP5dcWu/ewE=;
Received: from mail-pj1-f51.google.com ([209.85.216.51])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l6ruT-00E7qf-8F
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Feb 2021 09:23:49 +0000
Received: by mail-pj1-f51.google.com with SMTP id z9so1966410pjl.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 02 Feb 2021 01:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=02o59vXLINonMWY3lvfSKv5YhEgXWDRF+6oMw1Rtfck=;
 b=dvbZHCCC2wCsFsn3ZB9On5c6cv6BpRNVs3k61OPBo37tW3+zqLhBwdcJcIJdN4Q2tO
 9vV8uFB59sKgFfT5fgwOsBSYs9++tJ5vw4g1a7fIjkhuK5HcTn9ZrZqh9cd6bH4ot/2J
 pMMHqLqRBNz9OmzXk+Tw6XB1LBgKleptIn4jcKjRpOSfSAldAj1awOBr9+3fEwNhQI3/
 qbRZlpJUsEyYFJyG6SYJkTUPAnnHvyvRC6oj9Q8zkQTrbR8Y5fk2o29CSkpsbu2Zip12
 Zj5rHaXq/dqYeuxOLcfi3TNUpGm5M7WcpvVxs4CsGhFiqsgeDCDGMgcd7ePOxrPy5Mhn
 vJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=02o59vXLINonMWY3lvfSKv5YhEgXWDRF+6oMw1Rtfck=;
 b=lKUkgINOUUjP58Q7h0JL131u9c/MFlVwjET8xmCB9Vn8hp63CWOEw4IhWx9nQktjOT
 7hLjPdw7OaYcY7/SPKOCBEjiXg9F+eYiHMB9vQDzhpv9YOYWmKCe8w7b+ZzWyS18K7zt
 GLB4Co5KYgqBD+zzpVp2laFYEObBPHmEopyN8OSHr0M98OFOSMoGZm7wT0JWkX/FfO7+
 iasL+EDrWB+kl9RBOo2fzDWVMhQBPEUfEeXYFIHW7X5qi2QSLfMtxIwKXzUAgD17/Q/G
 W2B5kezfliG2wuG/LtHtNWYJjAHuuI8t4/tC+/0o3Nltkj1UzSI+yZdeu3iWeRu5TJ9h
 0wPw==
X-Gm-Message-State: AOAM533qHMTSOlra8vj1VPXolWsUviw8PfR6AhqQTuuMprqUAeHZ0XqL
 3WGYKsX80c63Rt1RQj19ALw=
X-Google-Smtp-Source: ABdhPJyrpSlsbXTUEFQmm5lItZjG9ycKquBR69ihP6zuhUjP2PimNHtffhLU1BiQP3++7bDakdDwxA==
X-Received: by 2002:a17:90a:de8a:: with SMTP id
 n10mr1494113pjv.227.1612257819588; 
 Tue, 02 Feb 2021 01:23:39 -0800 (PST)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:11:4f5:ae3a:569d:491a])
 by smtp.gmail.com with ESMTPSA id c5sm21724500pgt.73.2021.02.02.01.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 01:23:38 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue,  2 Feb 2021 18:23:32 +0900
Message-Id: <20210202092332.2562006-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.51 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.51 listed in wl.mailspike.net]
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
X-Headers-End: 1l6ruT-00E7qf-8F
Subject: [f2fs-dev] [PATCH v3] f2fs: rename checkpoint=merge mount option to
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
---
 Documentation/filesystems/f2fs.rst |  6 +++---
 fs/f2fs/super.c                    | 21 +++++++++------------
 2 files changed, 12 insertions(+), 15 deletions(-)

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
index 56696f6cfa86..b60dcef7f9d0 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -215,7 +215,7 @@ static match_table_t f2fs_tokens = {
 	{Opt_checkpoint_disable_cap, "checkpoint=disable:%u"},
 	{Opt_checkpoint_disable_cap_perc, "checkpoint=disable:%u%%"},
 	{Opt_checkpoint_enable, "checkpoint=enable"},
-	{Opt_checkpoint_merge, "checkpoint=merge"},
+	{Opt_checkpoint_merge, "checkpoint_merge"},
 	{Opt_compress_algorithm, "compress_algorithm=%s"},
 	{Opt_compress_log_size, "compress_log_size=%u"},
 	{Opt_compress_extension, "compress_extension=%s"},
@@ -1142,12 +1142,6 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
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
@@ -1782,7 +1776,7 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 		seq_printf(seq, ",checkpoint=disable:%u",
 				F2FS_OPTION(sbi).unusable_cap);
 	if (test_opt(sbi, MERGE_CHECKPOINT))
-		seq_puts(seq, ",checkpoint=merge");
+		seq_puts(seq, ",checkpoint_merge");
 	if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_POSIX)
 		seq_printf(seq, ",fsync_mode=%s", "posix");
 	else if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_STRICT)
@@ -1827,6 +1821,7 @@ static void default_options(struct f2fs_sb_info *sbi)
 	sbi->sb->s_flags |= SB_LAZYTIME;
 	set_opt(sbi, FLUSH_MERGE);
 	set_opt(sbi, DISCARD);
+	clear_opt(sbi, MERGE_CHECKPOINT);
 	if (f2fs_sb_has_blkzoned(sbi))
 		F2FS_OPTION(sbi).fs_mode = FS_MODE_LFS;
 	else
@@ -2066,9 +2061,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
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
@@ -2076,6 +2070,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 			    err);
 			goto restore_gc;
 		}
+	} else {
+		f2fs_stop_ckpt_thread(sbi);
 	}
 
 	/*
@@ -3831,7 +3827,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 
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
