Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9904EE8BD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Apr 2022 09:04:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1naBCw-0002GT-48; Fri, 01 Apr 2022 07:04:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <yuyufen@huawei.com>) id 1naBCv-0002GG-0u
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Apr 2022 07:04:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WHZEbyC0C5owL0phmJNRRz8HKyrNwvXha5YD14XerUE=; b=BT77sjw36S5hyk2otkPvzhhY9+
 jH6KtrqPQ4nPcgCEAZbon2pBVp3/Ngw/SUYc+OSLPXojXHRY8PDvGmHy/HJhPwh4dE7l/rVgQDnl0
 DNzbVGe5IKXKN8ST23MVPi5pnNN2yACorrQ/hp5k/N2XVPyyXVl68aQqm+hlGhvqn5xs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WHZEbyC0C5owL0phmJNRRz8HKyrNwvXha5YD14XerUE=; b=m/Eyjap797JJ9HBDJONKwndqke
 2UxFfOiM7mPleW1ePedS5eIWFQ4bmMqCxby7tGqpJ5jXiO/5m68NGPSwCFkvr+GA3h0phmcaEM+vj
 ltc9KSn2qdwfjQus6cBtR2IAtS1y5krMUUfpvqhYITutu/5me2sohDSr04MzbzwKTTWc=;
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1naBKm-0005fe-Sx
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Apr 2022 07:04:40 +0000
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KVB3p3Pg2z1HBKp;
 Fri,  1 Apr 2022 15:04:06 +0800 (CST)
Received: from dggpeml500009.china.huawei.com (7.185.36.209) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 1 Apr 2022 15:04:26 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500009.china.huawei.com
 (7.185.36.209) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Fri, 1 Apr
 2022 15:04:25 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Fri, 1 Apr 2022 15:19:06 +0800
Message-ID: <20220401071909.505086-3-yuyufen@huawei.com>
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
 Content preview:  For now,
 f2fs use mount options 'fault_injection' and 'fault_type'
 to enable fault injection. We set inject_type and inject_rate in sysfs to
 control fault injection. In fact,
 common fault injection framework have provided
 a systematic way to support error injection via debugfs, which has more richer
 and easier control means than the current one. 
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
X-Headers-End: 1naBKm-0005fe-Sx
Subject: [f2fs-dev] [PATCH 2/5] f2fs: use common fault injection frmework
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

For now, f2fs use mount options 'fault_injection' and 'fault_type'
to enable fault injection. We set inject_type and inject_rate in sysfs
to control fault injection.

In fact, common fault injection framework have provided a systematic
way to support error injection via debugfs, which has more richer
and easier control means than the current one.

For example, we can set 'interval' to specify the interval between
failures, and set 'times' to specify how many times failures may happen
at most. More fault injection usage can be seen in (Documentation/
fault-injection/fault-injection.rst)

Signed-off-by: Yufen Yu <yuyufen@huawei.com>
---
 fs/f2fs/Kconfig        |  2 +-
 fs/f2fs/Makefile       |  1 +
 fs/f2fs/f2fs.h         | 26 ++++++++++++++++
 fs/f2fs/fault_inject.c | 67 ++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/super.c        |  3 ++
 5 files changed, 98 insertions(+), 1 deletion(-)
 create mode 100644 fs/f2fs/fault_inject.c

diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index 03ef087537c7..d40a69077383 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -86,7 +86,7 @@ config F2FS_CHECK_FS
 
 config F2FS_FAULT_INJECTION
 	bool "F2FS fault injection facility"
-	depends on F2FS_FS
+	depends on F2FS_FS && FAULT_INJECTION && DEBUG_FS
 	help
 	  Test F2FS to inject faults such as ENOMEM, ENOSPC, and so on.
 
diff --git a/fs/f2fs/Makefile b/fs/f2fs/Makefile
index 8a7322d229e4..ff25d7095b95 100644
--- a/fs/f2fs/Makefile
+++ b/fs/f2fs/Makefile
@@ -10,3 +10,4 @@ f2fs-$(CONFIG_F2FS_FS_POSIX_ACL) += acl.o
 f2fs-$(CONFIG_FS_VERITY) += verity.o
 f2fs-$(CONFIG_F2FS_FS_COMPRESSION) += compress.o
 f2fs-$(CONFIG_F2FS_IOSTAT) += iostat.o
+f2fs-$(CONFIG_F2FS_FAULT_INJECTION)	+= fault_inject.o
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index be3014029a4e..50077b0388d1 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -27,6 +27,7 @@
 
 #include <linux/fscrypt.h>
 #include <linux/fsverity.h>
+#include <linux/fault-inject.h>
 
 struct pagevec;
 
@@ -1592,6 +1593,14 @@ struct decompress_io_ctx {
 	struct work_struct verity_work;	/* work to verify the decompressed pages */
 };
 
+struct f2fs_fault_inject {
+#ifdef CONFIG_F2FS_FAULT_INJECTION
+	struct fault_attr attr;
+	struct dentry *parent;
+	unsigned int inject_type;
+#endif
+};
+
 #define NULL_CLUSTER			((unsigned int)(~0))
 #define MIN_COMPRESS_LOG_SIZE		2
 #define MAX_COMPRESS_LOG_SIZE		8
@@ -1846,6 +1855,8 @@ struct f2fs_sb_info {
 	spinlock_t iostat_lat_lock;
 	struct iostat_lat_info *iostat_io_lat;
 #endif
+
+	struct f2fs_fault_inject fault_inject;
 };
 
 #ifdef CONFIG_F2FS_FAULT_INJECTION
@@ -1879,6 +1890,21 @@ static inline bool time_to_inject(struct f2fs_sb_info *sbi, int type)
 }
 #endif
 
+#ifdef CONFIG_F2FS_FAULT_INJECTION
+bool f2fs_should_fail(struct f2fs_sb_info *sbi, unsigned int type);
+void f2fs_fault_inject_init(struct f2fs_sb_info *sbi);
+void f2fs_fault_inject_fini(struct f2fs_sb_info *sbi);
+void f2fs_stop_fault_inject(struct f2fs_sb_info *sbi);
+#else
+static inline bool f2fs_should_fail(struct f2fs_sb_info *sbi, unsigned int type)
+{
+	return false;
+};
+static inline void f2fs_fault_inject_init(struct f2fs_sb_info *sbi) {};
+static inline void f2fs_fault_inject_fini(struct f2fs_sb_info *sbi) {};
+static inline void f2fs_stop_fault_inject(struct f2fs_sb_info *sbi) {};
+#endif
+
 /*
  * Test if the mounted volume is a multi-device volume.
  *   - For a single regular disk volume, sbi->s_ndevs is 0.
diff --git a/fs/f2fs/fault_inject.c b/fs/f2fs/fault_inject.c
new file mode 100644
index 000000000000..a62328b38ad6
--- /dev/null
+++ b/fs/f2fs/fault_inject.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 Huawei Technologies Co., Ltd.
+ *
+ */
+#include <linux/f2fs_fs.h>
+#include "f2fs.h"
+
+static DECLARE_FAULT_ATTR(fail_default_attr);
+
+void f2fs_fault_inject_init(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_fault_inject *fault_inj = &sbi->fault_inject;
+	struct dentry *dir, *parent;
+	struct fault_attr *attr = &fault_inj->attr;
+	const char *name = sbi->sb->s_id;
+
+	if (!f2fs_debugfs_root) {
+		f2fs_warn(sbi, "root debugfs have not created");
+		return;
+	}
+
+	/* create debugfs directory and attribute */
+	parent = debugfs_create_dir(name, f2fs_debugfs_root);
+	if (!parent) {
+		f2fs_warn(sbi, "%s: failed to create debugfs directory\n", name);
+		return;
+	}
+
+	*attr = fail_default_attr;
+	dir = fault_create_debugfs_attr("fault_inject", parent, attr);
+	if (IS_ERR(dir)) {
+		f2fs_warn(sbi, "%s: failed to create debugfs attr\n", name);
+		debugfs_remove_recursive(parent);
+		return;
+	}
+	fault_inj->parent = parent;
+
+	debugfs_create_x32("inject_type", 0600, dir, &fault_inj->inject_type);
+}
+
+void f2fs_fault_inject_fini(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_fault_inject *fault_inj = &sbi->fault_inject;
+
+	debugfs_remove_recursive(fault_inj->parent);
+}
+
+bool f2fs_should_fail(struct f2fs_sb_info *sbi, unsigned int type)
+{
+	struct f2fs_fault_inject *fault_inj = &sbi->fault_inject;
+
+	if (!(fault_inj->inject_type & (1 << type)))
+		return false;
+
+	if (!should_fail(&fault_inj->attr, 1))
+		return false;
+
+	return true;
+}
+
+void f2fs_stop_fault_inject(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_fault_inject *fault_inj = &sbi->fault_inject;
+
+	fault_inj->inject_type = 0;
+}
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 04e41360303c..4366469aae80 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1600,6 +1600,8 @@ static void f2fs_put_super(struct super_block *sb)
 	 */
 	f2fs_destroy_stats(sbi);
 
+	f2fs_fault_inject_fini(sbi);
+
 	/* destroy f2fs internal modules */
 	f2fs_destroy_node_manager(sbi);
 	f2fs_destroy_segment_manager(sbi);
@@ -4418,6 +4420,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	f2fs_update_time(sbi, CP_TIME);
 	f2fs_update_time(sbi, REQ_TIME);
 	clear_sbi_flag(sbi, SBI_CP_DISABLED_QUICK);
+	f2fs_fault_inject_init(sbi);
 	return 0;
 
 sync_free_meta:
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
