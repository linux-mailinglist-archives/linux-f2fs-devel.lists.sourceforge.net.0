Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2B54EE8BB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Apr 2022 09:04:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1naBKz-00065j-1j; Fri, 01 Apr 2022 07:04:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <yuyufen@huawei.com>) id 1naBKs-00065M-FC
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Apr 2022 07:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=78c/L/EuFQAbVdjRLfNMD53PLZ1OJPydeTPByfXHdpc=; b=jDRPvr6GdoVy+aoJw3gLo0mTRc
 7Psj66DEjxwMn7uDQfCf/OTZ2+kVRcgj+LCJa6Nj7Ucimg0LgvoPhP9mKsg/GNhvOIGZVqXkBaPa8
 Z2Cvt6bWr42aUcUXse/1qA/uPI4HbqZ/A+DUKYVFRLGC1I2DoMie95+2cssgyESN4A2I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=78c/L/EuFQAbVdjRLfNMD53PLZ1OJPydeTPByfXHdpc=; b=kLkJ369GdzX2IGzph5OpJicKp8
 6fy1YQmoU6WzuAZytuAbhEI/31pVhc3adsmemxnKhQdzX5GpWsIK4tGFwWKqa2HetW+GpoaEpLbd7
 prX9TDzZOKJ02ZzJ896N9OIA+zBAiF+BzN6paPVKUJD35zivhIfOfHOAonWNe1NgJkEc=;
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1naBKn-0005ff-02
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Apr 2022 07:04:40 +0000
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KVB3p0gZTz1HBJn;
 Fri,  1 Apr 2022 15:04:06 +0800 (CST)
Received: from dggpeml500009.china.huawei.com (7.185.36.209) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 1 Apr 2022 15:04:25 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500009.china.huawei.com
 (7.185.36.209) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Fri, 1 Apr
 2022 15:04:25 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Fri, 1 Apr 2022 15:19:05 +0800
Message-ID: <20220401071909.505086-2-yuyufen@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220401071909.505086-1-yuyufen@huawei.com>
References: <20220401071909.505086-1-yuyufen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500009.china.huawei.com (7.185.36.209)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Then,
 we don't need to depend on CONFIG_F2FS_STAT_FS to create
 f2fs root debugfs directory /sys/kernel/debug/f2fs. This patch is prepared
 for following f2fs fault injection,
 which will create sub directory 'fault_inject'
 into f2fs root debugfs. 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [45.249.212.255 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.255 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1naBKn-0005ff-02
Subject: [f2fs-dev] [PATCH 1/5] f2fs: extract f2fs root debugfs to
 init_f2fs_fs
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
From: Yufen Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yufen Yu <yuyufen@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Then, we don't need to depend on CONFIG_F2FS_STAT_FS to create
f2fs root debugfs directory /sys/kernel/debug/f2fs.

This patch is prepared for following f2fs fault injection,
which will create sub directory 'fault_inject' into f2fs root debugfs.

Signed-off-by: Yufen Yu <yuyufen@huawei.com>
---
 fs/f2fs/debug.c | 19 ++-----------------
 fs/f2fs/f2fs.h  |  4 ++--
 fs/f2fs/super.c | 22 ++++++++++++++++++++--
 3 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index fcdf253cd211..15b3567cd208 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -22,9 +22,6 @@
 
 static LIST_HEAD(f2fs_stat_list);
 static DEFINE_RAW_SPINLOCK(f2fs_stat_lock);
-#ifdef CONFIG_DEBUG_FS
-static struct dentry *f2fs_debugfs_root;
-#endif
 
 /*
  * This function calculates BDF of every segments
@@ -648,18 +645,6 @@ void f2fs_destroy_stats(struct f2fs_sb_info *sbi)
 
 void __init f2fs_create_root_stats(void)
 {
-#ifdef CONFIG_DEBUG_FS
-	f2fs_debugfs_root = debugfs_create_dir("f2fs", NULL);
-
-	debugfs_create_file("status", 0444, f2fs_debugfs_root, NULL,
-			    &stat_fops);
-#endif
-}
-
-void f2fs_destroy_root_stats(void)
-{
-#ifdef CONFIG_DEBUG_FS
-	debugfs_remove_recursive(f2fs_debugfs_root);
-	f2fs_debugfs_root = NULL;
-#endif
+	if (f2fs_debugfs_root)
+		debugfs_create_file("status", 0444, f2fs_debugfs_root, NULL, &stat_fops);
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index cd1e65bcf0b0..be3014029a4e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -62,6 +62,8 @@ enum {
 	FAULT_MAX,
 };
 
+extern struct dentry *f2fs_debugfs_root;
+
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 #define F2FS_ALL_FAULT_TYPE		((1 << FAULT_MAX) - 1)
 
@@ -3994,7 +3996,6 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
 int f2fs_build_stats(struct f2fs_sb_info *sbi);
 void f2fs_destroy_stats(struct f2fs_sb_info *sbi);
 void __init f2fs_create_root_stats(void);
-void f2fs_destroy_root_stats(void);
 void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
 #else
 #define stat_inc_cp_count(si)				do { } while (0)
@@ -4035,7 +4036,6 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
 static inline int f2fs_build_stats(struct f2fs_sb_info *sbi) { return 0; }
 static inline void f2fs_destroy_stats(struct f2fs_sb_info *sbi) { }
 static inline void __init f2fs_create_root_stats(void) { }
-static inline void f2fs_destroy_root_stats(void) { }
 static inline void f2fs_update_sit_info(struct f2fs_sb_info *sbi) {}
 #endif
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ea939db18f88..04e41360303c 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -27,6 +27,7 @@
 #include <linux/part_stat.h>
 #include <linux/zstd.h>
 #include <linux/lz4.h>
+#include <linux/debugfs.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -39,6 +40,7 @@
 #include <trace/events/f2fs.h>
 
 static struct kmem_cache *f2fs_inode_cachep;
+struct dentry *f2fs_debugfs_root;
 
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 
@@ -4575,6 +4577,21 @@ static void destroy_inodecache(void)
 	kmem_cache_destroy(f2fs_inode_cachep);
 }
 
+static void f2fs_create_debugfs(void)
+{
+#ifdef CONFIG_DEBUG_FS
+	f2fs_debugfs_root = debugfs_create_dir("f2fs", NULL);
+#endif
+}
+
+static void f2fs_destroy_debugfs(void)
+{
+#ifdef CONFIG_DEBUG_FS
+	debugfs_remove_recursive(f2fs_debugfs_root);
+	f2fs_debugfs_root = NULL;
+#endif
+}
+
 static int __init init_f2fs_fs(void)
 {
 	int err;
@@ -4615,6 +4632,7 @@ static int __init init_f2fs_fs(void)
 	err = register_filesystem(&f2fs_fs_type);
 	if (err)
 		goto free_shrinker;
+	f2fs_create_debugfs();
 	f2fs_create_root_stats();
 	err = f2fs_init_post_read_processing();
 	if (err)
@@ -4651,7 +4669,7 @@ static int __init init_f2fs_fs(void)
 free_post_read:
 	f2fs_destroy_post_read_processing();
 free_root_stats:
-	f2fs_destroy_root_stats();
+	f2fs_destroy_debugfs();
 	unregister_filesystem(&f2fs_fs_type);
 free_shrinker:
 	unregister_shrinker(&f2fs_shrinker_info);
@@ -4684,7 +4702,7 @@ static void __exit exit_f2fs_fs(void)
 	f2fs_destroy_bio_entry_cache();
 	f2fs_destroy_iostat_processing();
 	f2fs_destroy_post_read_processing();
-	f2fs_destroy_root_stats();
+	f2fs_destroy_debugfs();
 	unregister_filesystem(&f2fs_fs_type);
 	unregister_shrinker(&f2fs_shrinker_info);
 	f2fs_exit_sysfs();
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
