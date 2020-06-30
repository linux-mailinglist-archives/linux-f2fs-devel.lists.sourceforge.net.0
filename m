Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C881A20EA85
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2020 02:56:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jq4Zl-0004HZ-F3; Tue, 30 Jun 2020 00:56:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jq4Zk-0004HQ-K7
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jun 2020 00:56:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lXITmVMDUTrmqOpIM7LrpJSSmhuv7Ic7kn2DxL4oq8s=; b=hLZj1QCrIEIWN2+TP1e+lNje12
 uP0AEwGXMhgrQlhjHQUPei5aXxm7Lo+xkyO/Ino61bNMENcB2U2Un5IPnnKzx3w/di7LewSy+yw6m
 TiKR/rFdDz3+gnapl3Mb75sUS1ikV8WW4jrGtzkybRU6KJgaA26XDKKHdZsw6I5FNcGs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lXITmVMDUTrmqOpIM7LrpJSSmhuv7Ic7kn2DxL4oq8s=; b=A
 NlbRuytJNtzolpFS0xtKft/Rj/9OCzoGfkldaLRvO30mPc6E2kOrYrwdpSMFLejkgElZCEruVZrB+
 f6RM0GvA/HPet0AyQHZZfPLezgBoxriS7+44Ufktor6aPF20/nz6zTOSO3u2q9ZDBLGdfQ8s6PKF1
 crj0WY4Bio7ENakM=;
Received: from mail-pj1-f65.google.com ([209.85.216.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jq4Zh-005WNq-1W
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jun 2020 00:56:40 +0000
Received: by mail-pj1-f65.google.com with SMTP id b92so8747629pjc.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Jun 2020 17:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lXITmVMDUTrmqOpIM7LrpJSSmhuv7Ic7kn2DxL4oq8s=;
 b=cTohZQf7UuAV4F8nd+HEfTb7iR/DP//sAZhOZCpjx1aH1otvJCZr0rDjZ7ZqFSGWG6
 B5yjQfTiA5OpENjblTHvext5EUDh0E1hM0rIoNIXBu25DoZJXGKE6sg0MivEkkx852bm
 PhhbTpN538p6jo4q+2SYA9nSGQLbBnKN48vG6TKxWbwxEyDwEDgQmLCtiX/Gh0ro/u2y
 9NfNaau1B3DIAJ1gp4io2BWwPdWRLImVJVRp6okGhZUAgNa3YNykyGUM0L+U/SNHXtWe
 jdXorTh90R5OPwfxWjmj54WIMpimNcy3Aqa9bl3oTOv/H8TeS54zwL9CTZVMgp1YrBFX
 6aGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lXITmVMDUTrmqOpIM7LrpJSSmhuv7Ic7kn2DxL4oq8s=;
 b=HrpMrIiT8UjFn/3zEn+hh95DCVaO8oEsaqf1jXt2vFRwD3+2jsZ0d2bnJGuKOmp7zJ
 W4HzeKv1xytAy8Ts15Ml5tYJ20HrYgjrJay9/7MWEa042xUCJMhLtg5N6RAIWXl8Umic
 ibQiKygefZ+5yperM08euBUq1/QCNYfMHpqmJBTy4hEy5O8NElgP9B6sPmJiu+yhOlQD
 mIgf/AJ6+JQQbIjWHjaVr8xEvJ9pQ5l7a32Gwejix4mfCwS84r9pO21ir0mDa+D96WBF
 Y81GNQafYHNKFSZNLvISz4348XnJvfVwXxrC56NjSmaOt7LSi5GWIUEcFQB8jjufJHjm
 u3/g==
X-Gm-Message-State: AOAM531IFbMkLYFCePgGP+/OEyq7n27kZeE+O9vb4j7LgQMRI6AYTGQh
 cPQWlMrb+M0P4jkgyNRBbic=
X-Google-Smtp-Source: ABdhPJy2Qawi9gRPaj2nnaa/A8KjGOre/+SdEdZjDGQTuWicoAqOGnqR0MQY4KH2FdTOabKocLtmRg==
X-Received: by 2002:a17:902:b187:: with SMTP id
 s7mr14261435plr.188.1593478591439; 
 Mon, 29 Jun 2020 17:56:31 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:b8f4:bbde:37ba:20bd])
 by smtp.gmail.com with ESMTPSA id 9sm722636pfx.131.2020.06.29.17.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 17:56:30 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 30 Jun 2020 09:56:25 +0900
Message-Id: <20200630005625.2405062-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.65 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.65 listed in wl.mailspike.net]
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
X-Headers-End: 1jq4Zh-005WNq-1W
Subject: [f2fs-dev] [PATCH] f2fs: add symbolic link to kobject in sysfs
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
each f2fs mount in the order of mounting filesystem. It will
provide easy access to sysfs node even if not knowing the
specific device node name like sda19 and dm-3.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/f2fs.h  |  4 ++++
 fs/f2fs/sysfs.c | 31 +++++++++++++++++++++++++++----
 2 files changed, 31 insertions(+), 4 deletions(-)

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
index ab40e1f89f23..64bbe0b3b830 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -18,6 +18,7 @@
 #include <trace/events/f2fs.h>
 
 static struct proc_dir_entry *f2fs_proc_root;
+static struct ida f2fs_mount_ida;
 
 /* Sysfs support for f2fs */
 enum {
@@ -906,6 +907,9 @@ int __init f2fs_init_sysfs(void)
 	} else {
 		f2fs_proc_root = proc_mkdir("fs/f2fs", NULL);
 	}
+
+	ida_init(&f2fs_mount_ida);
+
 	return ret;
 }
 
@@ -915,6 +919,7 @@ void f2fs_exit_sysfs(void)
 	kset_unregister(&f2fs_kset);
 	remove_proc_entry("fs/f2fs", NULL);
 	f2fs_proc_root = NULL;
+	ida_destroy(&f2fs_mount_ida);
 }
 
 int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
@@ -926,12 +931,22 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
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
 
@@ -946,6 +961,12 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
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
@@ -957,6 +978,8 @@ void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
 		remove_proc_entry("victim_bits", sbi->s_proc);
 		remove_proc_entry(sbi->sb->s_id, f2fs_proc_root);
 	}
+	sysfs_remove_link(&f2fs_kset.kobj, sbi->s_mount_name);
+	ida_simple_remove(&f2fs_mount_ida, sbi->s_mount_id);
 	kobject_del(&sbi->s_kobj);
 	kobject_put(&sbi->s_kobj);
 }
-- 
2.27.0.212.ge8ba1cc988-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
