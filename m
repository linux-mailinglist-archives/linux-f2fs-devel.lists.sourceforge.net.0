Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4DD213485
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Jul 2020 08:54:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jrFao-0004m6-KI; Fri, 03 Jul 2020 06:54:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jrFan-0004lz-KJ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jul 2020 06:54:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wrm96WwHAY7NcmiKOn3dljT8L1OhqnpuLxqvg48PumA=; b=gvVTbfCiYPkBVUpGLlAeBoYe+K
 S5zi33ymR5rt3Y9lb0BPUUEPy7QWhKM3wHUCXpz49pIzUbrUCKHeto/B9uhHffetemFckcoVRS8Jl
 kdJx0H4K8VrGgHTegYvzbsLud3SzHocXvDQKfiP/QzMXKCWm1tzN2EzzTbJzdcSSMn6U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wrm96WwHAY7NcmiKOn3dljT8L1OhqnpuLxqvg48PumA=; b=c
 ETDLRDlkPJIPb0Jta87Y37WaxY2jowZRsitjbNcUdbtGlVqkKo/PiwajMnKCFSNZOvalzJLHjlGZT
 S17Srd+v4PphjJwlYANUADys7rteqBP/XTvgbywq4l2Bl1jGrVBDzCErTCobMFnYvT0f3m7/8Mwwr
 cYxRtCAp9Cyf1qd4=;
Received: from mail-pj1-f66.google.com ([209.85.216.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jrFak-00Bdsl-1m
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jul 2020 06:54:37 +0000
Received: by mail-pj1-f66.google.com with SMTP id k71so9999283pje.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 02 Jul 2020 23:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wrm96WwHAY7NcmiKOn3dljT8L1OhqnpuLxqvg48PumA=;
 b=sCLm88+vkuRQY6ys7VFVSVrDtAebX7oYvKYStBKqLq8LA5KxvoGDVYpPxCe6DAM2KK
 gVkbR/39VlRkxGe3FM2wbraa2c9DL3PhOF7wK4yJO8HLUX/Zd+la/1ZR9WDjfbF/r8nY
 KSiV6Sb2Aed1W4EdtxNjwhQrpgU6JNuUIOJ7pgpNrTO4LJG/XdlER0j4Bamrrqq80R9B
 S4rIwSUXSDqRheVC3LNh7h4qlZlqOmA7PejkOLL0DBvunpvdPOawNJD0QnT/Ai7h/ErG
 vOBBU5fnZMFJbeG683ybX6Rr8ewBx6FjQPc4AgCAWzShkoINhWPM8QfB7I05KoHY+Jek
 H4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wrm96WwHAY7NcmiKOn3dljT8L1OhqnpuLxqvg48PumA=;
 b=C0XL+8LLoP/YljU97ItqbLsLnRT0SY8gU+l2s9b3VE16uRrDoCuUnryGJx4qySJCA6
 h82BcTDlmAjwRJISCMCbKSMR+0Czj6f6SQo6/mgN8ovRSGI4tskcmxmtWquN/V6kEAxI
 BdnSOn3ma91u4UdV3kaLBLMq6hUZOEazvuAq6+5BWbbCq8ErmavdHVEjHKyK2qz/jhVV
 rQwatSyeRYdxlzwhTQkm3mMtyZneMPLBd2Oj6peHtLHb/8DdCgBRURPXEyF/3QdQvWG9
 3ikOfubsNFgQ78JR3O9MyenqMRpoZJ9fwoUp/D9osyZ4+TVk3nFEm1IEfVAwM+ywSQym
 hrLQ==
X-Gm-Message-State: AOAM530Ve2Jz60m2c/E+BBExDbKCiCA47FFupMrSz7BJs1ddEcapDM+o
 4RnVC/Aqdut8vcRHUqgGz3c=
X-Google-Smtp-Source: ABdhPJzaaweCWAO9H20DaJW4o6GMcuLpt1uhD39YL08FGVQMNekiW2THDFuGNU+a2KJ8950pygM/pw==
X-Received: by 2002:a17:902:8a85:: with SMTP id
 p5mr2277820plo.308.1593759268136; 
 Thu, 02 Jul 2020 23:54:28 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id s188sm10295612pfb.118.2020.07.02.23.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 23:54:27 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri,  3 Jul 2020 15:54:20 +0900
Message-Id: <20200703065420.3544269-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.66 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.66 listed in wl.mailspike.net]
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
X-Headers-End: 1jrFak-00Bdsl-1m
Subject: [f2fs-dev] [PATCH v3] f2fs: add symbolic link to kobject in sysfs
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

Added a symbolic link to directory of sysfs. It will
create a symbolic link such as "mount_0" and "mount_1" to
each f2fs mount in the order of mounting filesystem. But
once one mount point was umounted, that sequential number
@x in "mount_@x" could be reused by later newly mounted
point. It will provide easy access to sysfs node even if
not knowing the specific device node name like sda19 and
dm-3.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 Documentation/filesystems/f2fs.rst | 13 ++++++++++++-
 fs/f2fs/f2fs.h                     |  4 ++++
 fs/f2fs/sysfs.c                    | 31 ++++++++++++++++++++++++++----
 3 files changed, 43 insertions(+), 5 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 535021c46260..916956d433b2 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -279,7 +279,18 @@ Sysfs Entries
 
 Information about mounted f2fs file systems can be found in
 /sys/fs/f2fs.  Each mounted filesystem will have a directory in
-/sys/fs/f2fs based on its device name (i.e., /sys/fs/f2fs/sda).
+/sys/fs/f2fs based on its device name (i.e., /sys/fs/f2fs/sda),
+or mount_#x (#x is the number representing the order of mounting).
+But once one mount point was umounted, that sequential number @x
+in "mount_@x" could be reused by later newly mounted point.
+
+Here is an example of this.
+
+mount dev0 mount0 (mount_0 -> dev0)
+mount dev1 mount1 (mount_1 -> dev1)
+umount mount0
+mount dev2 (mount_0 -> dev2)
+
 The files in each per-device directory are shown in table below.
 
 Files in /sys/fs/f2fs/<devname>
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4b28fd42fdbc..7d6c5f8ce16b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1419,6 +1419,8 @@ struct decompress_io_ctx {
 #define MAX_COMPRESS_LOG_SIZE		8
 #define MAX_COMPRESS_WINDOW_SIZE	((PAGE_SIZE) << MAX_COMPRESS_LOG_SIZE)
 
+#define MOUNT_NAME_SIZE			20
+
 struct f2fs_sb_info {
 	struct super_block *sb;			/* pointer to VFS super block */
 	struct proc_dir_entry *s_proc;		/* proc entry */
@@ -1599,6 +1601,8 @@ struct f2fs_sb_info {
 	/* For sysfs suppport */
 	struct kobject s_kobj;
 	struct completion s_kobj_unregister;
+	int s_mount_id;
+	char s_mount_name[MOUNT_NAME_SIZE];
 
 	/* For shrinker support */
 	struct list_head s_list;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 2a140657fc4d..703d9f460d03 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -18,6 +18,7 @@
 #include <trace/events/f2fs.h>
 
 static struct proc_dir_entry *f2fs_proc_root;
+static struct ida f2fs_mount_ida;
 
 /* Sysfs support for f2fs */
 enum {
@@ -908,6 +909,9 @@ int __init f2fs_init_sysfs(void)
 	} else {
 		f2fs_proc_root = proc_mkdir("fs/f2fs", NULL);
 	}
+
+	ida_init(&f2fs_mount_ida);
+
 	return ret;
 }
 
@@ -917,6 +921,7 @@ void f2fs_exit_sysfs(void)
 	kset_unregister(&f2fs_kset);
 	remove_proc_entry("fs/f2fs", NULL);
 	f2fs_proc_root = NULL;
+	ida_destroy(&f2fs_mount_ida);
 }
 
 int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
@@ -928,12 +933,22 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
 	init_completion(&sbi->s_kobj_unregister);
 	err = kobject_init_and_add(&sbi->s_kobj, &f2fs_sb_ktype, NULL,
 				"%s", sb->s_id);
-	if (err) {
-		kobject_put(&sbi->s_kobj);
-		wait_for_completion(&sbi->s_kobj_unregister);
-		return err;
+	if (err)
+		goto err1;
+
+	sbi->s_mount_id = ida_simple_get(&f2fs_mount_ida, 0, 0, GFP_KERNEL);
+	if (sbi->s_mount_id < 0) {
+		err = sbi->s_mount_id;
+		goto err1;
 	}
 
+	snprintf(sbi->s_mount_name, MOUNT_NAME_SIZE, "mount_%d",
+			sbi->s_mount_id);
+	err = sysfs_create_link(&f2fs_kset.kobj, &sbi->s_kobj,
+			sbi->s_mount_name);
+	if (err)
+		goto err2;
+
 	if (f2fs_proc_root)
 		sbi->s_proc = proc_mkdir(sb->s_id, f2fs_proc_root);
 
@@ -948,6 +963,12 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
 				victim_bits_seq_show, sb);
 	}
 	return 0;
+err2:
+	ida_simple_remove(&f2fs_mount_ida, sbi->s_mount_id);
+err1:
+	kobject_put(&sbi->s_kobj);
+	wait_for_completion(&sbi->s_kobj_unregister);
+	return err;
 }
 
 void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
@@ -959,6 +980,8 @@ void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
 		remove_proc_entry("victim_bits", sbi->s_proc);
 		remove_proc_entry(sbi->sb->s_id, f2fs_proc_root);
 	}
+	sysfs_remove_link(&f2fs_kset.kobj, sbi->s_mount_name);
+	ida_simple_remove(&f2fs_mount_ida, sbi->s_mount_id);
 	kobject_del(&sbi->s_kobj);
 	kobject_put(&sbi->s_kobj);
 }
-- 
2.27.0.383.g050319c2ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
