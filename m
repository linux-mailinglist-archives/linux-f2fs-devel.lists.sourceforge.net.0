Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2B3224FD5
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Jul 2020 07:44:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jx27n-00055Q-4A; Sun, 19 Jul 2020 05:44:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jx27l-00055J-Hh
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jul 2020 05:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AyFRPd1KqAbJdK62U99Tk4B0iYN4wPv7oVxjjBvR+KE=; b=gl+QuAJTu3OF80OpFntUkum4BG
 2tdfPFexrhMTRvJRUO1DgLuIXqnQGjm+ziKtNBRpwLuTl9ZMMnYEWQzt1IorgpJ7WnAamA/OHNkBg
 EVEhfIqSZYspD73f9KXFhWiLcetJLbCw0K9T54uuQgPbrknFtt96Z7RcMVDF+niCrmB0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=AyFRPd1KqAbJdK62U99Tk4B0iYN4wPv7oVxjjBvR+KE=; b=e
 LgSRTbHrpy0VY+vEesNe+ts68TW2xLbhLG7xnoUTIByWbnaDAYzo4yYfYTFEFGnC8+CPATMhzEJp9
 eNTVBKmvOv6kKq/qIFTSe9wAnGkVbg/Jlh4gKG5lZgnmr6Zwt92FcwkBo+mtCubkAROR9Igee8nTV
 +qEVhuKFRIZd1y4M=;
Received: from mail-pg1-f193.google.com ([209.85.215.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jx27k-009P0y-8m
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jul 2020 05:44:33 +0000
Received: by mail-pg1-f193.google.com with SMTP id w2so8731388pgg.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 18 Jul 2020 22:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AyFRPd1KqAbJdK62U99Tk4B0iYN4wPv7oVxjjBvR+KE=;
 b=jV22vwSG6dcFHuT7GYez0ARiif9z2x5vdRW2U7MxbX2PIWs82Y2UA0LILo1r/ksBkg
 hyIj7TGEc3F2a+jszVtQyXp39d+yUVN9/MG6myjjhkVhCmiwCOYtUIAbR6M2RVtWv88x
 9+bDPR4IYuO4De9frT3ebHUDpzYeUWOt6iFch9vWMJswtVvXCH/Ur5rKku2jzmV3sF4T
 O4mrNZTcGscxbcoTmpbjiV9/FT9PYWakEPesbn/PlYM5+b7BDREtfUad9fPSKwbBWSmF
 iDLfSNtSvB5t/woG0Jwrdb5zw2JyxpXxV7B+/dkJ9PS8RtC0KPHdRNvdAvD3xaJMJSmk
 Pejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AyFRPd1KqAbJdK62U99Tk4B0iYN4wPv7oVxjjBvR+KE=;
 b=XWGMDjPEUTkdZ065boLwEXCGUwYuCPd8q6NeKWutF3qs1I6eV7ph2FxtZ4tBDNWQvb
 +meJgcsUZpdrsb3YiZ6bO8HRnxDyOQbZJqs5cJALe+zeaw7gBSjoDVS/ilpyjie9mar3
 y8ic1uuJJg7D8Bz4RnDGpkKra3X7dDFbbqkU1t/YBgxw4XHg+mZmvG9kZTOpEXy+CfGG
 Tdw7k9tlyvWhYbwHMSKCwYJenLEtSg8SN107gHq7uCigduW1XHUlBWmyoFm17YiipHFo
 euX9Vjh22eEocih6PnKlxP0TSWV7XeQvTlizFuZRtjlnehMjAA6P9zdp6u0Id7IyHHdm
 GyOQ==
X-Gm-Message-State: AOAM530jjKC6SO/7IsJ+2oNODTUnWoKHBYXpNFiDjN8YnK7QbLpvFqaf
 jcKPQgl3kBPBALyl1jO3p1U=
X-Google-Smtp-Source: ABdhPJwe25PkmSdtqQJnV2SBBq7sAbbmcQFZ4dEOa9/YxfarO35nCykbdoUrs2kgzJA9fqLRnrCR7Q==
X-Received: by 2002:a62:8848:: with SMTP id l69mr14135010pfd.314.1595137466463; 
 Sat, 18 Jul 2020 22:44:26 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id l207sm12573821pfd.79.2020.07.18.22.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 22:44:25 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Sun, 19 Jul 2020 14:44:08 +0900
Message-Id: <20200719054409.3050516-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.193 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.193 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jx27k-009P0y-8m
Subject: [f2fs-dev] [PATCH 1/2] f2fs: add sysfs symbolic link to kobject
 with volume name
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

Added a symbolic link directory pointing to its device name
directory using the volume name of the partition in sysfs.
(i.e., /sys/fs/f2fs/vol_#x -> /sys/fs/f2fs/sda1)
"vol" is the volume name of the partition, "#x" is the number
representing the order of mounting with the same volume name.
We allow the volume name duplication within 100, which means the
range of #x should be 0 ~ 99. Once one mount point was umounted,
that sequential number #x in "vol_#x" could be reused by later
newly mounted point.

It will provide easy access to sysfs node using volume name,
even if not knowing the specific device node name like sda1 and
dm-3.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 Documentation/filesystems/f2fs.rst | 21 +++++++++++--
 fs/f2fs/f2fs.h                     | 14 +++++++++
 fs/f2fs/file.c                     |  2 ++
 fs/f2fs/super.c                    |  1 +
 fs/f2fs/sysfs.c                    | 50 ++++++++++++++++++++++++++++++
 5 files changed, 86 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index de43239a3c31..8221f3af6042 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -278,8 +278,25 @@ Sysfs Entries
 =============
 
 Information about mounted f2fs file systems can be found in
-/sys/fs/f2fs.  Each mounted filesystem will have a directory in
-/sys/fs/f2fs based on its device name (i.e., /sys/fs/f2fs/sda).
+/sys/fs/f2fs. Each mounted filesystem will have a directory in
+/sys/fs/f2fs based on its device name (i.e., /sys/fs/f2fs/sda),
+or, if the partition has the volume name in the on-disk super
+block, the volume name with the number (i.e., /sys/fs/f2fs/vol_#x).
+"vol" is the volume name of the partition, "#x" is the number
+representing the order of mounting with the same volume name.
+We allow the volume name duplication within 100, which means the
+range of #x should be 0 ~ 99. Once one mount point was umounted,
+that sequential number #x in "vol_#x" could be reused by later
+newly mounted point.
+
+Here is an example of this.
+
+mount dev0 mount0 (vol_0 -> dev0)
+mount dev1 mount1 (vol_1 -> dev1)
+umount mount0
+mount dev2 mount2 (vol_0 -> dev2)
+* dev0, dev1 and dev2 have the same volume name "vol".
+
 The files in each per-device directory are shown in table below.
 
 Files in /sys/fs/f2fs/<devname>
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a555377cf51f..392ee7d7a37d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1382,6 +1382,10 @@ struct decompress_io_ctx {
 #define MAX_COMPRESS_LOG_SIZE		8
 #define MAX_COMPRESS_WINDOW_SIZE	((PAGE_SIZE) << MAX_COMPRESS_LOG_SIZE)
 
+#define MAX_DUP_NAME			8
+#define MAX_SYSLINK_NAME		(MAX_VOLUME_NAME + MAX_DUP_NAME)
+#define MAX_DUP_NUM			100
+
 struct f2fs_sb_info {
 	struct super_block *sb;			/* pointer to VFS super block */
 	struct proc_dir_entry *s_proc;		/* proc entry */
@@ -1586,6 +1590,10 @@ struct f2fs_sb_info {
 
 	struct kmem_cache *inline_xattr_slab;	/* inline xattr entry */
 	unsigned int inline_xattr_slab_size;	/* default inline xattr slab size */
+
+	/* For sysfs symlink per volume */
+	char syslink_name[MAX_SYSLINK_NAME];
+	struct mutex syslink_mutex;
 };
 
 struct f2fs_private_dio {
@@ -3816,6 +3824,12 @@ int __init f2fs_init_sysfs(void);
 void f2fs_exit_sysfs(void);
 int f2fs_register_sysfs(struct f2fs_sb_info *sbi);
 void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi);
+void f2fs_reload_syslink(struct f2fs_sb_info *sbi);
+
+static inline bool f2fs_has_syslink(struct f2fs_sb_info *sbi)
+{
+	return strlen(sbi->syslink_name);
+}
 
 /* verity.c */
 extern const struct fsverity_operations f2fs_verityops;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 521987cd8772..4612f645007a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3418,6 +3418,8 @@ static int f2fs_ioc_setfslabel(struct file *filp, unsigned long arg)
 
 	up_write(&sbi->sb_lock);
 
+	f2fs_reload_syslink(sbi);
+
 	mnt_drop_write_file(filp);
 out:
 	kfree(vbuf);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 2686b07ae7eb..7b002785417a 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3021,6 +3021,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 
 	init_rwsem(&sbi->sb_lock);
 	init_rwsem(&sbi->pin_sem);
+	mutex_init(&sbi->syslink_mutex);
 }
 
 static int init_percpu_info(struct f2fs_sb_info *sbi)
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 50524401c8e6..e9818dd338c1 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -11,6 +11,7 @@
 #include <linux/f2fs_fs.h>
 #include <linux/seq_file.h>
 #include <linux/unicode.h>
+#include <linux/nls.h>
 
 #include "f2fs.h"
 #include "segment.h"
@@ -897,6 +898,51 @@ static int __maybe_unused victim_bits_seq_show(struct seq_file *seq,
 	return 0;
 }
 
+static void f2fs_unload_syslink(struct f2fs_sb_info *sbi)
+{
+	if (!f2fs_has_syslink(sbi))
+		return;
+
+	sysfs_remove_link(&f2fs_kset.kobj, sbi->syslink_name);
+	memset(sbi->syslink_name, 0, MAX_SYSLINK_NAME);
+}
+
+static int f2fs_load_syslink(struct f2fs_sb_info *sbi)
+{
+	int idx, count, ret;
+
+	down_read(&sbi->sb_lock);
+	count = utf16s_to_utf8s(sbi->raw_super->volume_name,
+			ARRAY_SIZE(sbi->raw_super->volume_name),
+			UTF16_LITTLE_ENDIAN, sbi->syslink_name,
+			MAX_VOLUME_NAME);
+	up_read(&sbi->sb_lock);
+
+	if (!count)
+		return -ENOENT;
+
+	for (idx = 0; idx < MAX_DUP_NUM; idx++) {
+		snprintf(sbi->syslink_name + count, MAX_DUP_NAME, "_%d", idx);
+		ret = sysfs_create_link(&f2fs_kset.kobj, &sbi->s_kobj,
+				sbi->syslink_name);
+		if (ret != -EEXIST)
+			break;
+	}
+
+	if (ret)
+		memset(sbi->syslink_name, 0, MAX_SYSLINK_NAME);
+
+	return ret;
+}
+
+void f2fs_reload_syslink(struct f2fs_sb_info *sbi)
+{
+	mutex_lock(&sbi->syslink_mutex);
+	f2fs_unload_syslink(sbi);
+	f2fs_load_syslink(sbi);
+	mutex_unlock(&sbi->syslink_mutex);
+}
+
 int __init f2fs_init_sysfs(void)
 {
 	int ret;
@@ -954,11 +1000,15 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
 		proc_create_single_data("victim_bits", S_IRUGO, sbi->s_proc,
 				victim_bits_seq_show, sb);
 	}
+
+	f2fs_load_syslink(sbi);
+
 	return 0;
 }
 
 void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
 {
+	f2fs_unload_syslink(sbi);
 	if (sbi->s_proc) {
 		remove_proc_entry("iostat_info", sbi->s_proc);
 		remove_proc_entry("segment_info", sbi->s_proc);
-- 
2.28.0.rc0.105.gf9edc3c819-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
