Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 998AC29FC00
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Oct 2020 04:07:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kYKlE-0008NW-8C; Fri, 30 Oct 2020 03:07:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kYKlC-0008NP-Pk
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Oct 2020 03:07:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6hQEV0Hg4Dy5at8FQ1nHOvP1v0mBukmMV2zNVWpNWgc=; b=WT7RzotElByDGANVN8iU9Zb4b7
 cQ8i54REwW+dZEbxW8qNFBsPICFsZALIITnK6DDqXRoOF24KbRMUuD4m9kBHTUqbB3gbp5lTkOe2q
 6Zu+sByMztGkDePS3SNlxTO21Rbuwqn9tu/TbJ7NhecE+9lNgQuSwqdxsi2OVS4Ft3Zk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6hQEV0Hg4Dy5at8FQ1nHOvP1v0mBukmMV2zNVWpNWgc=; b=R
 eBQUksA3x8kqgTp8OubQ2IMrU3wAlcMxo3Xn7M+MySjMjELOqO0vIunFH91hmJX1js2A5HxGkpyhG
 06LT7LL+vUQju9iEx7pVRi2vgj30LSpWKY73qBVpzyivb3F3FQY9mBQJYRJVR5ynjT3YVYy7C27Aa
 odHYambAazs4eQh8=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kYKl4-00CPiK-H4
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Oct 2020 03:07:26 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CMnKT53MrzLnsn;
 Fri, 30 Oct 2020 11:07:09 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Fri, 30 Oct 2020 11:07:01 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 30 Oct 2020 11:06:56 +0800
Message-ID: <20201030030656.29098-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kYKl4-00CPiK-H4
Subject: [f2fs-dev] [PATCH] f2fs: move ioctl interface definitions to
 separated file
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Like other filesystem does, we introduce a new file f2fs.h in path of
include/uapi/linux/, and move f2fs-specified ioctl interface definitions
to that file, after then, in order to use those definitions, userspace
developer only need to include the new header file rather than
copy & paste definitions from fs/f2fs/f2fs.h.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 MAINTAINERS                 |  1 +
 fs/f2fs/f2fs.h              | 79 ----------------------------------
 fs/f2fs/file.c              |  1 +
 include/trace/events/f2fs.h |  1 +
 include/uapi/linux/f2fs.h   | 86 +++++++++++++++++++++++++++++++++++++
 5 files changed, 89 insertions(+), 79 deletions(-)
 create mode 100644 include/uapi/linux/f2fs.h

diff --git a/MAINTAINERS b/MAINTAINERS
index d1d4e49a695a..b79a911f1e32 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6686,6 +6686,7 @@ F:	Documentation/filesystems/f2fs.rst
 F:	fs/f2fs/
 F:	include/linux/f2fs_fs.h
 F:	include/trace/events/f2fs.h
+F:	include/uapi/linux/f2fs.h
 
 F71805F HARDWARE MONITORING DRIVER
 M:	Jean Delvare <jdelvare@suse.com>
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4629b5291cb7..c23d60941af7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -403,85 +403,6 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
 	return size <= MAX_SIT_JENTRIES(journal);
 }
 
-/*
- * f2fs-specific ioctl commands
- */
-#define F2FS_IOCTL_MAGIC		0xf5
-#define F2FS_IOC_START_ATOMIC_WRITE	_IO(F2FS_IOCTL_MAGIC, 1)
-#define F2FS_IOC_COMMIT_ATOMIC_WRITE	_IO(F2FS_IOCTL_MAGIC, 2)
-#define F2FS_IOC_START_VOLATILE_WRITE	_IO(F2FS_IOCTL_MAGIC, 3)
-#define F2FS_IOC_RELEASE_VOLATILE_WRITE	_IO(F2FS_IOCTL_MAGIC, 4)
-#define F2FS_IOC_ABORT_VOLATILE_WRITE	_IO(F2FS_IOCTL_MAGIC, 5)
-#define F2FS_IOC_GARBAGE_COLLECT	_IOW(F2FS_IOCTL_MAGIC, 6, __u32)
-#define F2FS_IOC_WRITE_CHECKPOINT	_IO(F2FS_IOCTL_MAGIC, 7)
-#define F2FS_IOC_DEFRAGMENT		_IOWR(F2FS_IOCTL_MAGIC, 8,	\
-						struct f2fs_defragment)
-#define F2FS_IOC_MOVE_RANGE		_IOWR(F2FS_IOCTL_MAGIC, 9,	\
-						struct f2fs_move_range)
-#define F2FS_IOC_FLUSH_DEVICE		_IOW(F2FS_IOCTL_MAGIC, 10,	\
-						struct f2fs_flush_device)
-#define F2FS_IOC_GARBAGE_COLLECT_RANGE	_IOW(F2FS_IOCTL_MAGIC, 11,	\
-						struct f2fs_gc_range)
-#define F2FS_IOC_GET_FEATURES		_IOR(F2FS_IOCTL_MAGIC, 12, __u32)
-#define F2FS_IOC_SET_PIN_FILE		_IOW(F2FS_IOCTL_MAGIC, 13, __u32)
-#define F2FS_IOC_GET_PIN_FILE		_IOR(F2FS_IOCTL_MAGIC, 14, __u32)
-#define F2FS_IOC_PRECACHE_EXTENTS	_IO(F2FS_IOCTL_MAGIC, 15)
-#define F2FS_IOC_RESIZE_FS		_IOW(F2FS_IOCTL_MAGIC, 16, __u64)
-#define F2FS_IOC_GET_COMPRESS_BLOCKS	_IOR(F2FS_IOCTL_MAGIC, 17, __u64)
-#define F2FS_IOC_RELEASE_COMPRESS_BLOCKS				\
-					_IOR(F2FS_IOCTL_MAGIC, 18, __u64)
-#define F2FS_IOC_RESERVE_COMPRESS_BLOCKS				\
-					_IOR(F2FS_IOCTL_MAGIC, 19, __u64)
-#define F2FS_IOC_SEC_TRIM_FILE		_IOW(F2FS_IOCTL_MAGIC, 20,	\
-						struct f2fs_sectrim_range)
-
-/*
- * should be same as XFS_IOC_GOINGDOWN.
- * Flags for going down operation used by FS_IOC_GOINGDOWN
- */
-#define F2FS_IOC_SHUTDOWN	_IOR('X', 125, __u32)	/* Shutdown */
-#define F2FS_GOING_DOWN_FULLSYNC	0x0	/* going down with full sync */
-#define F2FS_GOING_DOWN_METASYNC	0x1	/* going down with metadata */
-#define F2FS_GOING_DOWN_NOSYNC		0x2	/* going down */
-#define F2FS_GOING_DOWN_METAFLUSH	0x3	/* going down with meta flush */
-#define F2FS_GOING_DOWN_NEED_FSCK	0x4	/* going down to trigger fsck */
-
-/*
- * Flags used by F2FS_IOC_SEC_TRIM_FILE
- */
-#define F2FS_TRIM_FILE_DISCARD		0x1	/* send discard command */
-#define F2FS_TRIM_FILE_ZEROOUT		0x2	/* zero out */
-#define F2FS_TRIM_FILE_MASK		0x3
-
-struct f2fs_gc_range {
-	u32 sync;
-	u64 start;
-	u64 len;
-};
-
-struct f2fs_defragment {
-	u64 start;
-	u64 len;
-};
-
-struct f2fs_move_range {
-	u32 dst_fd;		/* destination fd */
-	u64 pos_in;		/* start position in src_fd */
-	u64 pos_out;		/* start position in dst_fd */
-	u64 len;		/* size to move */
-};
-
-struct f2fs_flush_device {
-	u32 dev_num;		/* device number to flush */
-	u32 segments;		/* # of segments to flush */
-};
-
-struct f2fs_sectrim_range {
-	u64 start;
-	u64 len;
-	u64 flags;
-};
-
 /* for inline stuff */
 #define DEF_INLINE_RESERVED_SIZE	1
 static inline int get_extra_isize(struct inode *inode);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ee861c6d9ff0..d898f1e2764b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -31,6 +31,7 @@
 #include "gc.h"
 #include "trace.h"
 #include <trace/events/f2fs.h>
+#include <uapi/linux/f2fs.h>
 
 static vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
 {
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index f8f1e85ff130..56b113e3cd6a 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -6,6 +6,7 @@
 #define _TRACE_F2FS_H
 
 #include <linux/tracepoint.h>
+#include <uapi/linux/f2fs.h>
 
 #define show_dev(dev)		MAJOR(dev), MINOR(dev)
 #define show_dev_ino(entry)	show_dev(entry->dev), (unsigned long)entry->ino
diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
new file mode 100644
index 000000000000..27f7477021e0
--- /dev/null
+++ b/include/uapi/linux/f2fs.h
@@ -0,0 +1,86 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _UAPI_LINUX_F2FS_H
+#define _UAPI_LINUX_F2FS_H
+
+#include <linux/ioctl.h>
+
+/*
+ * f2fs-specific ioctl commands
+ */
+#define F2FS_IOCTL_MAGIC		0xf5
+#define F2FS_IOC_START_ATOMIC_WRITE	_IO(F2FS_IOCTL_MAGIC, 1)
+#define F2FS_IOC_COMMIT_ATOMIC_WRITE	_IO(F2FS_IOCTL_MAGIC, 2)
+#define F2FS_IOC_START_VOLATILE_WRITE	_IO(F2FS_IOCTL_MAGIC, 3)
+#define F2FS_IOC_RELEASE_VOLATILE_WRITE	_IO(F2FS_IOCTL_MAGIC, 4)
+#define F2FS_IOC_ABORT_VOLATILE_WRITE	_IO(F2FS_IOCTL_MAGIC, 5)
+#define F2FS_IOC_GARBAGE_COLLECT	_IOW(F2FS_IOCTL_MAGIC, 6, __u32)
+#define F2FS_IOC_WRITE_CHECKPOINT	_IO(F2FS_IOCTL_MAGIC, 7)
+#define F2FS_IOC_DEFRAGMENT		_IOWR(F2FS_IOCTL_MAGIC, 8,	\
+						struct f2fs_defragment)
+#define F2FS_IOC_MOVE_RANGE		_IOWR(F2FS_IOCTL_MAGIC, 9,	\
+						struct f2fs_move_range)
+#define F2FS_IOC_FLUSH_DEVICE		_IOW(F2FS_IOCTL_MAGIC, 10,	\
+						struct f2fs_flush_device)
+#define F2FS_IOC_GARBAGE_COLLECT_RANGE	_IOW(F2FS_IOCTL_MAGIC, 11,	\
+						struct f2fs_gc_range)
+#define F2FS_IOC_GET_FEATURES		_IOR(F2FS_IOCTL_MAGIC, 12, __u32)
+#define F2FS_IOC_SET_PIN_FILE		_IOW(F2FS_IOCTL_MAGIC, 13, __u32)
+#define F2FS_IOC_GET_PIN_FILE		_IOR(F2FS_IOCTL_MAGIC, 14, __u32)
+#define F2FS_IOC_PRECACHE_EXTENTS	_IO(F2FS_IOCTL_MAGIC, 15)
+#define F2FS_IOC_RESIZE_FS		_IOW(F2FS_IOCTL_MAGIC, 16, __u64)
+#define F2FS_IOC_GET_COMPRESS_BLOCKS	_IOR(F2FS_IOCTL_MAGIC, 17, __u64)
+#define F2FS_IOC_RELEASE_COMPRESS_BLOCKS				\
+					_IOR(F2FS_IOCTL_MAGIC, 18, __u64)
+#define F2FS_IOC_RESERVE_COMPRESS_BLOCKS				\
+					_IOR(F2FS_IOCTL_MAGIC, 19, __u64)
+#define F2FS_IOC_SEC_TRIM_FILE		_IOW(F2FS_IOCTL_MAGIC, 20,	\
+						struct f2fs_sectrim_range)
+
+/*
+ * should be same as XFS_IOC_GOINGDOWN.
+ * Flags for going down operation used by FS_IOC_GOINGDOWN
+ */
+#define F2FS_IOC_SHUTDOWN	_IOR('X', 125, __u32)	/* Shutdown */
+#define F2FS_GOING_DOWN_FULLSYNC	0x0	/* going down with full sync */
+#define F2FS_GOING_DOWN_METASYNC	0x1	/* going down with metadata */
+#define F2FS_GOING_DOWN_NOSYNC		0x2	/* going down */
+#define F2FS_GOING_DOWN_METAFLUSH	0x3	/* going down with meta flush */
+#define F2FS_GOING_DOWN_NEED_FSCK	0x4	/* going down to trigger fsck */
+
+/*
+ * Flags used by F2FS_IOC_SEC_TRIM_FILE
+ */
+#define F2FS_TRIM_FILE_DISCARD		0x1	/* send discard command */
+#define F2FS_TRIM_FILE_ZEROOUT		0x2	/* zero out */
+#define F2FS_TRIM_FILE_MASK		0x3
+
+struct f2fs_gc_range {
+	u32 sync;
+	u64 start;
+	u64 len;
+};
+
+struct f2fs_defragment {
+	u64 start;
+	u64 len;
+};
+
+struct f2fs_move_range {
+	u32 dst_fd;		/* destination fd */
+	u64 pos_in;		/* start position in src_fd */
+	u64 pos_out;		/* start position in dst_fd */
+	u64 len;		/* size to move */
+};
+
+struct f2fs_flush_device {
+	u32 dev_num;		/* device number to flush */
+	u32 segments;		/* # of segments to flush */
+};
+
+struct f2fs_sectrim_range {
+	u64 start;
+	u64 len;
+	u64 flags;
+};
+
+#endif /* _UAPI_LINUX_F2FS_H */
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
