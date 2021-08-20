Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBF53F257F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Aug 2021 06:03:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mGvke-00088l-Cn; Fri, 20 Aug 2021 04:03:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1mGvaZ-0007CE-1J
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 03:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K9GAlN7ymln4E2TZmqE6qCIbdLHxLj4jJIJD8WG9zfQ=; b=k6sK9slgHXYBmyEeKMRa1UIilA
 RlYrv/Vz6ayEoGLc0oFIcFiMmMXY1r/PJ3FtFL5GsMz5Ls2qCVnRGBq1qzpjFVAJXbGAyeZcx1JT1
 FCdmUCwJ11sdIP92aBRRZsFRzYWbw9cDdAn1PYEMbuGTZTWvC4jW5ulTJW2D9Go99fC8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=K9GAlN7ymln4E2TZmqE6qCIbdLHxLj4jJIJD8WG9zfQ=; b=K
 +9v1BzfLrFpXhur2iTQNjLWOXdtncYIEbrA3pv3I75uKQqdEelnJcujhsYH474WxO+DXeXJCQIwuN
 DG76Zr5qs2fH2YP/dWiru56mgxHBOF4VZcqWccqo1gq01zpQJrt/wbTboHEcaPBxJj5Up2R3/Brni
 Q6+FRp2OvxAdxOPc=;
Received: from mail-pg1-f169.google.com ([209.85.215.169])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mGvaE-00CFgJ-Dh
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 03:53:02 +0000
Received: by mail-pg1-f169.google.com with SMTP id w8so7890334pgf.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 19 Aug 2021 20:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K9GAlN7ymln4E2TZmqE6qCIbdLHxLj4jJIJD8WG9zfQ=;
 b=SypIkfS3PMgkruX1i7+dixLlJGj0ZCcHgQc9tZ4nIwE3ObjCIJvg9JC5jihzUxdiYm
 7MpnQqm71a+2W3+nd/AKM+0BR32J0yQWmuw0Og7xYXQZ+nONg2DIjVXA4Rd8vsks6axw
 zI3PoIqRntNrXe/xHJYCXW41315MKe7E2d+iLDJVo4c30tR6w4NkgTVz2ijnaiE5A/zK
 5CSQaeh/xFruD/JECIOX43EhcCyCE7hV2qv3lsi2035VyedBBWoD+Gjf7MzpYRWscbTO
 glHM2CSrDqlDwXtmhY3b6EKc1qIykJbjKROi4lVi3LjsFsSOIsVLQ5ZE+QpJN4Jc08dd
 sE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K9GAlN7ymln4E2TZmqE6qCIbdLHxLj4jJIJD8WG9zfQ=;
 b=iihD/qarldTmBQl4OTvQ50P9zUcC/HCvAIoClB0sOvaYDMaV12nJt+LyXYEh1ORuuS
 YmhcOK5yaHWvU5AP+DOb7aKjBVKWF+3/HWL9hdhzasz0OqH6UqVqhshVhEqb+RAkmgXE
 SUj5wC61fPqx/a7ivNnty5zvEf7lFvWXxT9PeNpQiYy/UH3e8f/N1bWRzLrDN7oYiEAF
 SRD7JdMdCc/eIq37PIrWm4C5OHxHayYYn3eOHFaSSyuzlsuVa+vvMAYmOG9x7kke8uh7
 mV+jp4HFr6GQcjudzdOgGR2tGWcMlNVTypjb29y3zw3FCKRgTHDpZ9+SDUG4OfaC601f
 JaLw==
X-Gm-Message-State: AOAM532YgUOoUKlSLr+DIt9m9bcnQxikf8he0CyLx03s+BbkJ2A0pKrL
 ft/3YklTb7Z/CFrqrwNjURA=
X-Google-Smtp-Source: ABdhPJyWkYXvw0jgO8yg1wYz3AGNVOilG6x8m4guyWZa+nBBO1wEscHltpMU5YbZrLARtE7OK2QEOA==
X-Received: by 2002:a62:f90d:0:b0:3e3:5739:d075 with SMTP id
 o13-20020a62f90d000000b003e35739d075mr3580610pfh.19.1629431555792; 
 Thu, 19 Aug 2021 20:52:35 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:ab38:89b9:1824:6a27])
 by smtp.gmail.com with ESMTPSA id q1sm4617515pjl.44.2021.08.19.20.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 20:52:35 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 19 Aug 2021 20:52:28 -0700
Message-Id: <20210820035229.216975-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Added F2FS_IOSTAT config option to support
 getting IO statistics through sysfs and printing out periodic IO statistics
 tracepoint events and moved I/O statistics related codes into separate files
 for [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.169 listed in list.dnswl.org]
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1mGvaE-00CFgJ-Dh
Subject: [f2fs-dev] [PATCH v4 1/2] f2fs: separate out iostat feature
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

Added F2FS_IOSTAT config option to support getting IO statistics through
sysfs and printing out periodic IO statistics tracepoint events and
moved I/O statistics related codes into separate files for better
maintenance.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/Kconfig             |   9 +++
 fs/f2fs/Makefile            |   1 +
 fs/f2fs/checkpoint.c        |   1 +
 fs/f2fs/data.c              |   1 +
 fs/f2fs/f2fs.h              |  59 +++-----------
 fs/f2fs/file.c              |   1 +
 fs/f2fs/gc.c                |   1 +
 fs/f2fs/iostat.c            | 154 ++++++++++++++++++++++++++++++++++++
 fs/f2fs/iostat.h            |  27 +++++++
 fs/f2fs/node.c              |   1 +
 fs/f2fs/segment.c           |   1 +
 fs/f2fs/super.c             |  10 +--
 fs/f2fs/sysfs.c             | 106 +++----------------------
 include/trace/events/f2fs.h |   2 +
 14 files changed, 225 insertions(+), 149 deletions(-)
 create mode 100644 fs/f2fs/iostat.c
 create mode 100644 fs/f2fs/iostat.h

diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index 2ac026fc3564..f1f292d3b8ce 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -133,3 +133,12 @@ config F2FS_FS_ZSTD
 	default y
 	help
 	  Support ZSTD compress algorithm, if unsure, say Y.
+
+config F2FS_IOSTAT
+	bool "F2FS IO statistics information"
+	depends on F2FS_FS
+	default n
+	help
+	  Support getting IO statistics through sysfs and printing out periodic
+	  IO statistics tracepoint events. You have to turn on "iostat_enable"
+	  sysfs node to enable this feature.
diff --git a/fs/f2fs/Makefile b/fs/f2fs/Makefile
index e5295746208b..8a7322d229e4 100644
--- a/fs/f2fs/Makefile
+++ b/fs/f2fs/Makefile
@@ -9,3 +9,4 @@ f2fs-$(CONFIG_F2FS_FS_XATTR) += xattr.o
 f2fs-$(CONFIG_F2FS_FS_POSIX_ACL) += acl.o
 f2fs-$(CONFIG_FS_VERITY) += verity.o
 f2fs-$(CONFIG_F2FS_FS_COMPRESSION) += compress.o
+f2fs-$(CONFIG_F2FS_IOSTAT) += iostat.o
diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 41960c55c343..3962cfeb4a57 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -18,6 +18,7 @@
 #include "f2fs.h"
 #include "node.h"
 #include "segment.h"
+#include "iostat.h"
 #include <trace/events/f2fs.h>
 
 #define DEFAULT_CHECKPOINT_IOPRIO (IOPRIO_PRIO_VALUE(IOPRIO_CLASS_BE, 3))
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index e4e4eb800d2b..fd16c4fc4507 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -25,6 +25,7 @@
 #include "f2fs.h"
 #include "node.h"
 #include "segment.h"
+#include "iostat.h"
 #include <trace/events/f2fs.h>
 
 #define NUM_PREALLOC_POST_READ_CTXS	128
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index fe5f280f6ac0..12ecf6ee9cb5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1713,14 +1713,6 @@ struct f2fs_sb_info {
 #endif
 	spinlock_t stat_lock;			/* lock for stat operations */
 
-	/* For app/fs IO statistics */
-	spinlock_t iostat_lock;
-	unsigned long long rw_iostat[NR_IO_TYPE];
-	unsigned long long prev_rw_iostat[NR_IO_TYPE];
-	bool iostat_enable;
-	unsigned long iostat_next_period;
-	unsigned int iostat_period_ms;
-
 	/* to attach REQ_META|REQ_FUA flags */
 	unsigned int data_io_flag;
 	unsigned int node_io_flag;
@@ -1780,6 +1772,16 @@ struct f2fs_sb_info {
 	unsigned int compress_watermark;	/* cache page watermark */
 	atomic_t compress_page_hit;		/* cache hit count */
 #endif
+
+#ifdef CONFIG_F2FS_IOSTAT
+	/* For app/fs IO statistics */
+	spinlock_t iostat_lock;
+	unsigned long long rw_iostat[NR_IO_TYPE];
+	unsigned long long prev_rw_iostat[NR_IO_TYPE];
+	bool iostat_enable;
+	unsigned long iostat_next_period;
+	unsigned int iostat_period_ms;
+#endif
 };
 
 struct f2fs_private_dio {
@@ -3257,47 +3259,6 @@ static inline int get_inline_xattr_addrs(struct inode *inode)
 		sizeof((f2fs_inode)->field))			\
 		<= (F2FS_OLD_ATTRIBUTE_SIZE + (extra_isize)))	\
 
-#define DEFAULT_IOSTAT_PERIOD_MS	3000
-#define MIN_IOSTAT_PERIOD_MS		100
-/* maximum period of iostat tracing is 1 day */
-#define MAX_IOSTAT_PERIOD_MS		8640000
-
-static inline void f2fs_reset_iostat(struct f2fs_sb_info *sbi)
-{
-	int i;
-
-	spin_lock(&sbi->iostat_lock);
-	for (i = 0; i < NR_IO_TYPE; i++) {
-		sbi->rw_iostat[i] = 0;
-		sbi->prev_rw_iostat[i] = 0;
-	}
-	spin_unlock(&sbi->iostat_lock);
-}
-
-extern void f2fs_record_iostat(struct f2fs_sb_info *sbi);
-
-static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi,
-			enum iostat_type type, unsigned long long io_bytes)
-{
-	if (!sbi->iostat_enable)
-		return;
-	spin_lock(&sbi->iostat_lock);
-	sbi->rw_iostat[type] += io_bytes;
-
-	if (type == APP_WRITE_IO || type == APP_DIRECT_IO)
-		sbi->rw_iostat[APP_BUFFERED_IO] =
-			sbi->rw_iostat[APP_WRITE_IO] -
-			sbi->rw_iostat[APP_DIRECT_IO];
-
-	if (type == APP_READ_IO || type == APP_DIRECT_READ_IO)
-		sbi->rw_iostat[APP_BUFFERED_READ_IO] =
-			sbi->rw_iostat[APP_READ_IO] -
-			sbi->rw_iostat[APP_DIRECT_READ_IO];
-	spin_unlock(&sbi->iostat_lock);
-
-	f2fs_record_iostat(sbi);
-}
-
 #define __is_large_section(sbi)		((sbi)->segs_per_sec > 1)
 
 #define __is_meta_io(fio) (PAGE_TYPE_OF_BIO((fio)->type) == META)
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index d4fc5e0d2ffe..ab4ea2ddcc8b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -31,6 +31,7 @@
 #include "xattr.h"
 #include "acl.h"
 #include "gc.h"
+#include "iostat.h"
 #include <trace/events/f2fs.h>
 #include <uapi/linux/f2fs.h>
 
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 3bc0f0162e31..2c18443972b6 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -19,6 +19,7 @@
 #include "node.h"
 #include "segment.h"
 #include "gc.h"
+#include "iostat.h"
 #include <trace/events/f2fs.h>
 
 static struct kmem_cache *victim_entry_slab;
diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
new file mode 100644
index 000000000000..21c29e121a86
--- /dev/null
+++ b/fs/f2fs/iostat.c
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * f2fs iostat support
+ *
+ * Copyright 2021 Google LLC
+ * Author: Daeho Jeong <daehojeong@google.com>
+ */
+
+#include <linux/fs.h>
+#include <linux/f2fs_fs.h>
+#include <linux/seq_file.h>
+
+#include "f2fs.h"
+#include "iostat.h"
+#include <trace/events/f2fs.h>
+
+int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
+{
+	struct super_block *sb = seq->private;
+	struct f2fs_sb_info *sbi = F2FS_SB(sb);
+	time64_t now = ktime_get_real_seconds();
+
+	if (!sbi->iostat_enable)
+		return 0;
+
+	seq_printf(seq, "time:		%-16llu\n", now);
+
+	/* print app write IOs */
+	seq_puts(seq, "[WRITE]\n");
+	seq_printf(seq, "app buffered:	%-16llu\n",
+				sbi->rw_iostat[APP_BUFFERED_IO]);
+	seq_printf(seq, "app direct:	%-16llu\n",
+				sbi->rw_iostat[APP_DIRECT_IO]);
+	seq_printf(seq, "app mapped:	%-16llu\n",
+				sbi->rw_iostat[APP_MAPPED_IO]);
+
+	/* print fs write IOs */
+	seq_printf(seq, "fs data:	%-16llu\n",
+				sbi->rw_iostat[FS_DATA_IO]);
+	seq_printf(seq, "fs node:	%-16llu\n",
+				sbi->rw_iostat[FS_NODE_IO]);
+	seq_printf(seq, "fs meta:	%-16llu\n",
+				sbi->rw_iostat[FS_META_IO]);
+	seq_printf(seq, "fs gc data:	%-16llu\n",
+				sbi->rw_iostat[FS_GC_DATA_IO]);
+	seq_printf(seq, "fs gc node:	%-16llu\n",
+				sbi->rw_iostat[FS_GC_NODE_IO]);
+	seq_printf(seq, "fs cp data:	%-16llu\n",
+				sbi->rw_iostat[FS_CP_DATA_IO]);
+	seq_printf(seq, "fs cp node:	%-16llu\n",
+				sbi->rw_iostat[FS_CP_NODE_IO]);
+	seq_printf(seq, "fs cp meta:	%-16llu\n",
+				sbi->rw_iostat[FS_CP_META_IO]);
+
+	/* print app read IOs */
+	seq_puts(seq, "[READ]\n");
+	seq_printf(seq, "app buffered:	%-16llu\n",
+				sbi->rw_iostat[APP_BUFFERED_READ_IO]);
+	seq_printf(seq, "app direct:	%-16llu\n",
+				sbi->rw_iostat[APP_DIRECT_READ_IO]);
+	seq_printf(seq, "app mapped:	%-16llu\n",
+				sbi->rw_iostat[APP_MAPPED_READ_IO]);
+
+	/* print fs read IOs */
+	seq_printf(seq, "fs data:	%-16llu\n",
+				sbi->rw_iostat[FS_DATA_READ_IO]);
+	seq_printf(seq, "fs gc data:	%-16llu\n",
+				sbi->rw_iostat[FS_GDATA_READ_IO]);
+	seq_printf(seq, "fs compr_data:	%-16llu\n",
+				sbi->rw_iostat[FS_CDATA_READ_IO]);
+	seq_printf(seq, "fs node:	%-16llu\n",
+				sbi->rw_iostat[FS_NODE_READ_IO]);
+	seq_printf(seq, "fs meta:	%-16llu\n",
+				sbi->rw_iostat[FS_META_READ_IO]);
+
+	/* print other IOs */
+	seq_puts(seq, "[OTHER]\n");
+	seq_printf(seq, "fs discard:	%-16llu\n",
+				sbi->rw_iostat[FS_DISCARD]);
+
+	return 0;
+}
+
+static inline void f2fs_record_iostat(struct f2fs_sb_info *sbi)
+{
+	unsigned long long iostat_diff[NR_IO_TYPE];
+	int i;
+
+	if (time_is_after_jiffies(sbi->iostat_next_period))
+		return;
+
+	/* Need double check under the lock */
+	spin_lock(&sbi->iostat_lock);
+	if (time_is_after_jiffies(sbi->iostat_next_period)) {
+		spin_unlock(&sbi->iostat_lock);
+		return;
+	}
+	sbi->iostat_next_period = jiffies +
+				msecs_to_jiffies(sbi->iostat_period_ms);
+
+	for (i = 0; i < NR_IO_TYPE; i++) {
+		iostat_diff[i] = sbi->rw_iostat[i] -
+				sbi->prev_rw_iostat[i];
+		sbi->prev_rw_iostat[i] = sbi->rw_iostat[i];
+	}
+	spin_unlock(&sbi->iostat_lock);
+
+	trace_f2fs_iostat(sbi, iostat_diff);
+}
+
+void f2fs_reset_iostat(struct f2fs_sb_info *sbi)
+{
+	int i;
+
+	spin_lock(&sbi->iostat_lock);
+	for (i = 0; i < NR_IO_TYPE; i++) {
+		sbi->rw_iostat[i] = 0;
+		sbi->prev_rw_iostat[i] = 0;
+	}
+	spin_unlock(&sbi->iostat_lock);
+}
+
+void f2fs_update_iostat(struct f2fs_sb_info *sbi,
+			enum iostat_type type, unsigned long long io_bytes)
+{
+	if (!sbi->iostat_enable)
+		return;
+
+	spin_lock(&sbi->iostat_lock);
+	sbi->rw_iostat[type] += io_bytes;
+
+	if (type == APP_WRITE_IO || type == APP_DIRECT_IO)
+		sbi->rw_iostat[APP_BUFFERED_IO] =
+			sbi->rw_iostat[APP_WRITE_IO] -
+			sbi->rw_iostat[APP_DIRECT_IO];
+
+	if (type == APP_READ_IO || type == APP_DIRECT_READ_IO)
+		sbi->rw_iostat[APP_BUFFERED_READ_IO] =
+			sbi->rw_iostat[APP_READ_IO] -
+			sbi->rw_iostat[APP_DIRECT_READ_IO];
+	spin_unlock(&sbi->iostat_lock);
+
+	f2fs_record_iostat(sbi);
+}
+
+int f2fs_init_iostat(struct f2fs_sb_info *sbi)
+{
+	/* init iostat info */
+	spin_lock_init(&sbi->iostat_lock);
+	sbi->iostat_enable = false;
+	sbi->iostat_period_ms = DEFAULT_IOSTAT_PERIOD_MS;
+
+	return 0;
+}
diff --git a/fs/f2fs/iostat.h b/fs/f2fs/iostat.h
new file mode 100644
index 000000000000..46e4a36fc8e9
--- /dev/null
+++ b/fs/f2fs/iostat.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2021 Google LLC
+ * Author: Daeho Jeong <daehojeong@google.com>
+ */
+#ifndef __F2FS_IOSTAT_H__
+#define __F2FS_IOSTAT_H__
+
+#ifdef CONFIG_F2FS_IOSTAT
+
+#define DEFAULT_IOSTAT_PERIOD_MS	3000
+#define MIN_IOSTAT_PERIOD_MS		100
+/* maximum period of iostat tracing is 1 day */
+#define MAX_IOSTAT_PERIOD_MS		8640000
+
+extern int __maybe_unused iostat_info_seq_show(struct seq_file *seq,
+			void *offset);
+extern void f2fs_reset_iostat(struct f2fs_sb_info *sbi);
+extern void f2fs_update_iostat(struct f2fs_sb_info *sbi,
+			enum iostat_type type, unsigned long long io_bytes);
+extern int f2fs_init_iostat(struct f2fs_sb_info *sbi);
+#else
+static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi,
+		enum iostat_type type, unsigned long long io_bytes) {}
+static inline int f2fs_init_iostat(struct f2fs_sb_info *sbi) { return 0; }
+#endif
+#endif /* __F2FS_IOSTAT_H__ */
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 161173de5a2d..043cb831b289 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -17,6 +17,7 @@
 #include "node.h"
 #include "segment.h"
 #include "xattr.h"
+#include "iostat.h"
 #include <trace/events/f2fs.h>
 
 #define on_f2fs_build_free_nids(nmi) mutex_is_locked(&(nm_i)->build_lock)
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index b4dd22134a73..73abec9988e9 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -20,6 +20,7 @@
 #include "segment.h"
 #include "node.h"
 #include "gc.h"
+#include "iostat.h"
 #include <trace/events/f2fs.h>
 
 #define __reverse_ffz(x) __reverse_ffs(~(x))
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index b556ca38f0fb..a23926d1a77b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -33,6 +33,7 @@
 #include "segment.h"
 #include "xattr.h"
 #include "gc.h"
+#include "iostat.h"
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/f2fs.h>
@@ -3964,11 +3965,6 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	set_sbi_flag(sbi, SBI_POR_DOING);
 	spin_lock_init(&sbi->stat_lock);
 
-	/* init iostat info */
-	spin_lock_init(&sbi->iostat_lock);
-	sbi->iostat_enable = false;
-	sbi->iostat_period_ms = DEFAULT_IOSTAT_PERIOD_MS;
-
 	for (i = 0; i < NR_PAGE_TYPE; i++) {
 		int n = (i == META) ? 1 : NR_TEMP_TYPE;
 		int j;
@@ -3999,6 +3995,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	init_waitqueue_head(&sbi->cp_wait);
 	init_sb_info(sbi);
 
+	err = f2fs_init_iostat(sbi);
+	if (err)
+		goto free_bio_info;
+
 	err = init_percpu_info(sbi);
 	if (err)
 		goto free_bio_info;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 36d7e40bf12e..a1a3e0f6d658 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -17,6 +17,7 @@
 #include "f2fs.h"
 #include "segment.h"
 #include "gc.h"
+#include "iostat.h"
 #include <trace/events/f2fs.h>
 
 static struct proc_dir_entry *f2fs_proc_root;
@@ -477,6 +478,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+#ifdef CONFIG_F2FS_IOSTAT
 	if (!strcmp(a->attr.name, "iostat_enable")) {
 		sbi->iostat_enable = !!t;
 		if (!sbi->iostat_enable)
@@ -492,6 +494,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		spin_unlock(&sbi->iostat_lock);
 		return count;
 	}
+#endif
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	if (!strcmp(a->attr.name, "compr_written_block") ||
@@ -700,8 +703,10 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, discard_idle_interval,
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_idle_interval, interval_time[GC_TIME]);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info,
 		umount_discard_timeout, interval_time[UMOUNT_DISCARD_TIMEOUT]);
+#ifdef CONFIG_F2FS_IOSTAT
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, iostat_enable, iostat_enable);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, iostat_period_ms, iostat_period_ms);
+#endif
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, readdir_ra, readdir_ra);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_io_bytes, max_io_bytes);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_pin_file_thresh, gc_pin_file_threshold);
@@ -807,8 +812,10 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(discard_idle_interval),
 	ATTR_LIST(gc_idle_interval),
 	ATTR_LIST(umount_discard_timeout),
+#ifdef CONFIG_F2FS_IOSTAT
 	ATTR_LIST(iostat_enable),
 	ATTR_LIST(iostat_period_ms),
+#endif
 	ATTR_LIST(readdir_ra),
 	ATTR_LIST(max_io_bytes),
 	ATTR_LIST(gc_pin_file_thresh),
@@ -1076,101 +1083,6 @@ static int __maybe_unused segment_bits_seq_show(struct seq_file *seq,
 	return 0;
 }
 
-void f2fs_record_iostat(struct f2fs_sb_info *sbi)
-{
-	unsigned long long iostat_diff[NR_IO_TYPE];
-	int i;
-
-	if (time_is_after_jiffies(sbi->iostat_next_period))
-		return;
-
-	/* Need double check under the lock */
-	spin_lock(&sbi->iostat_lock);
-	if (time_is_after_jiffies(sbi->iostat_next_period)) {
-		spin_unlock(&sbi->iostat_lock);
-		return;
-	}
-	sbi->iostat_next_period = jiffies +
-				msecs_to_jiffies(sbi->iostat_period_ms);
-
-	for (i = 0; i < NR_IO_TYPE; i++) {
-		iostat_diff[i] = sbi->rw_iostat[i] -
-				sbi->prev_rw_iostat[i];
-		sbi->prev_rw_iostat[i] = sbi->rw_iostat[i];
-	}
-	spin_unlock(&sbi->iostat_lock);
-
-	trace_f2fs_iostat(sbi, iostat_diff);
-}
-
-static int __maybe_unused iostat_info_seq_show(struct seq_file *seq,
-					       void *offset)
-{
-	struct super_block *sb = seq->private;
-	struct f2fs_sb_info *sbi = F2FS_SB(sb);
-	time64_t now = ktime_get_real_seconds();
-
-	if (!sbi->iostat_enable)
-		return 0;
-
-	seq_printf(seq, "time:		%-16llu\n", now);
-
-	/* print app write IOs */
-	seq_puts(seq, "[WRITE]\n");
-	seq_printf(seq, "app buffered:	%-16llu\n",
-				sbi->rw_iostat[APP_BUFFERED_IO]);
-	seq_printf(seq, "app direct:	%-16llu\n",
-				sbi->rw_iostat[APP_DIRECT_IO]);
-	seq_printf(seq, "app mapped:	%-16llu\n",
-				sbi->rw_iostat[APP_MAPPED_IO]);
-
-	/* print fs write IOs */
-	seq_printf(seq, "fs data:	%-16llu\n",
-				sbi->rw_iostat[FS_DATA_IO]);
-	seq_printf(seq, "fs node:	%-16llu\n",
-				sbi->rw_iostat[FS_NODE_IO]);
-	seq_printf(seq, "fs meta:	%-16llu\n",
-				sbi->rw_iostat[FS_META_IO]);
-	seq_printf(seq, "fs gc data:	%-16llu\n",
-				sbi->rw_iostat[FS_GC_DATA_IO]);
-	seq_printf(seq, "fs gc node:	%-16llu\n",
-				sbi->rw_iostat[FS_GC_NODE_IO]);
-	seq_printf(seq, "fs cp data:	%-16llu\n",
-				sbi->rw_iostat[FS_CP_DATA_IO]);
-	seq_printf(seq, "fs cp node:	%-16llu\n",
-				sbi->rw_iostat[FS_CP_NODE_IO]);
-	seq_printf(seq, "fs cp meta:	%-16llu\n",
-				sbi->rw_iostat[FS_CP_META_IO]);
-
-	/* print app read IOs */
-	seq_puts(seq, "[READ]\n");
-	seq_printf(seq, "app buffered:	%-16llu\n",
-				sbi->rw_iostat[APP_BUFFERED_READ_IO]);
-	seq_printf(seq, "app direct:	%-16llu\n",
-				sbi->rw_iostat[APP_DIRECT_READ_IO]);
-	seq_printf(seq, "app mapped:	%-16llu\n",
-				sbi->rw_iostat[APP_MAPPED_READ_IO]);
-
-	/* print fs read IOs */
-	seq_printf(seq, "fs data:	%-16llu\n",
-				sbi->rw_iostat[FS_DATA_READ_IO]);
-	seq_printf(seq, "fs gc data:	%-16llu\n",
-				sbi->rw_iostat[FS_GDATA_READ_IO]);
-	seq_printf(seq, "fs compr_data:	%-16llu\n",
-				sbi->rw_iostat[FS_CDATA_READ_IO]);
-	seq_printf(seq, "fs node:	%-16llu\n",
-				sbi->rw_iostat[FS_NODE_READ_IO]);
-	seq_printf(seq, "fs meta:	%-16llu\n",
-				sbi->rw_iostat[FS_META_READ_IO]);
-
-	/* print other IOs */
-	seq_puts(seq, "[OTHER]\n");
-	seq_printf(seq, "fs discard:	%-16llu\n",
-				sbi->rw_iostat[FS_DISCARD]);
-
-	return 0;
-}
-
 static int __maybe_unused victim_bits_seq_show(struct seq_file *seq,
 						void *offset)
 {
@@ -1257,8 +1169,10 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
 				segment_info_seq_show, sb);
 		proc_create_single_data("segment_bits", 0444, sbi->s_proc,
 				segment_bits_seq_show, sb);
+#ifdef CONFIG_F2FS_IOSTAT
 		proc_create_single_data("iostat_info", 0444, sbi->s_proc,
 				iostat_info_seq_show, sb);
+#endif
 		proc_create_single_data("victim_bits", 0444, sbi->s_proc,
 				victim_bits_seq_show, sb);
 	}
@@ -1278,7 +1192,9 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
 void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
 {
 	if (sbi->s_proc) {
+#ifdef CONFIG_F2FS_IOSTAT
 		remove_proc_entry("iostat_info", sbi->s_proc);
+#endif
 		remove_proc_entry("segment_info", sbi->s_proc);
 		remove_proc_entry("segment_bits", sbi->s_proc);
 		remove_proc_entry("victim_bits", sbi->s_proc);
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 56b113e3cd6a..3eaf19aa89af 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1818,6 +1818,7 @@ DEFINE_EVENT(f2fs_zip_end, f2fs_decompress_pages_end,
 	TP_ARGS(inode, cluster_idx, compressed_size, ret)
 );
 
+#ifdef CONFIG_F2FS_IOSTAT
 TRACE_EVENT(f2fs_iostat,
 
 	TP_PROTO(struct f2fs_sb_info *sbi, unsigned long long *iostat),
@@ -1893,6 +1894,7 @@ TRACE_EVENT(f2fs_iostat,
 		__entry->app_mrio, __entry->fs_drio, __entry->fs_gdrio,
 		__entry->fs_cdrio, __entry->fs_nrio, __entry->fs_mrio)
 );
+#endif
 
 TRACE_EVENT(f2fs_bmap,
 
-- 
2.33.0.rc2.250.ged5fa647cd-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
