Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 109872132AF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Jul 2020 06:19:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jrDB0-0001i6-DY; Fri, 03 Jul 2020 04:19:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jrDAz-0001hz-IL
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jul 2020 04:19:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EvLTEidoAGZVVhYEfJ1iRMW1yqo2GUTqtH2XjpP1cdI=; b=Y6McXHREFTnIKJCaMRJnpPaaRL
 bVllhaFEesUaKZ4yCjf/CuBLHC04XLWwymk0uLyyYEsV9w047nAAGBamYhTf63642aAFa6iS4hWEb
 vnNen9LmkcJ6+4bSYUBJhiY1YPZrUCaDdpZnyvg+Qzo4TtwEiIeicIASFbcr+Y8tU1dU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EvLTEidoAGZVVhYEfJ1iRMW1yqo2GUTqtH2XjpP1cdI=; b=c
 EOII9KEKLwQepnzb5Ea+GBLMiLSy6KHKWjT9OTQxbFlGCbMnEdP6a9sYUfz/TL5jdMgwNUz15D7+R
 k0wuZYhrrxdrtRyLGqExuns8VT0qjwxgjREattliMbzIoNGBCW6eZ+1VQW0fDkyrKKr69Wv7pz8Kn
 maMZPs/MZgSZIhEk=;
Received: from mail-pf1-f194.google.com ([209.85.210.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jrDAu-006VzQ-2r
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jul 2020 04:19:49 +0000
Received: by mail-pf1-f194.google.com with SMTP id 207so13262000pfu.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 02 Jul 2020 21:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EvLTEidoAGZVVhYEfJ1iRMW1yqo2GUTqtH2XjpP1cdI=;
 b=dae73+uy+g+DPGJTvHno9/JIfwzZ+ouEgSwh/WQpD+Evttdxkvo/JHXoaZ99vF4MyY
 6jp7GTQ2vBBWKKGv0rc4H4kPMGafGqb/NiQdaAx7KHfdPKmV/ul3/V5mv508RuDSA2nJ
 LKpEybpiuxOAL9IRXBlg6aRj82NaOVUlZs8X0lGR3iY3TvSXeX8z9CWqShk70OD4I+m2
 ZE20xVAhWGV7bPQsDJI/zxYxRsZqZ+kTZQ6Gr980wPD/OsL5K+MvnFpshjmaM/8w3Zg0
 0QHjy6X9aal2dymKloturpL2STcXCtoYlzsb14zyV3L/1VxQ89RvG+4mdAyFT73hqvg5
 L7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EvLTEidoAGZVVhYEfJ1iRMW1yqo2GUTqtH2XjpP1cdI=;
 b=P/4AwjDtc8nfnUmDA7VAvKR7ibFB6k3o34lhvWfuRjh/rVzKe1XDDKW0P8k6YOvLx5
 60Sr/g2PYhmBoX3+QM1gv5J9VZx+Yuwk7O89FfLklQlaktWKZCf15iMKWG63Nus0s6XM
 gqdRv7FCDSyyec6WnvLQjA29umUB091mDo08TorbU0z1hpgpoMQy2V7iCuU1XYhmI9nA
 yQS63AmZeIrh8DsypLE9OZGX5DApaJ1HU0Z8yutKV9jjZ9yVGqbW5qMtyoWJS02cMe8j
 PoNnNsuKtneyfNMxBvhrjCYgkpJTpneNrqeVSnPx5C8/AzCgCK3DGjgKq40HJkhtBwDp
 rVLA==
X-Gm-Message-State: AOAM5326ej/wrSSB3fyhGpgmjDkm8Q71BCYtyZvdtmuSTI7j2OYaKX+C
 Uo51mcSglRhPifg55LDPjFs=
X-Google-Smtp-Source: ABdhPJwzVTvQq9xkJUChZhhcG9h0YRPIxbVXnm0+G5A8bNIBIVaEUatdjjmHDZNV3VYLMiJzDHyuLA==
X-Received: by 2002:aa7:8389:: with SMTP id u9mr30319839pfm.269.1593749975964; 
 Thu, 02 Jul 2020 21:19:35 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id n18sm10622481pfd.99.2020.07.02.21.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 21:19:35 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri,  3 Jul 2020 13:19:29 +0900
Message-Id: <20200703041929.3290946-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.194 listed in wl.mailspike.net]
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
X-Headers-End: 1jrDAu-006VzQ-2r
Subject: [f2fs-dev] [PATCH v2] f2fs: add symbolic link to kobject in sysfs
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
