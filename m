Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E72381A69AB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Apr 2020 18:17:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jO1ld-0002mB-6Q; Mon, 13 Apr 2020 16:17:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jO1lc-0002lx-27
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Apr 2020 16:17:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yiz3bK3sjJz3E8LEF5YJot3DsXNpvV5m8eoPYztP8CU=; b=M6LGwMdxmL1GdnJlvdtTz/bLHj
 oIaOFKv2v90rn+2v4zVZbIxnRqZYy6KEiPyNGdMQ4trKAowaNuup9B23/ACmVSWx9K5A0/hcr6nFZ
 zc9Axpd9BZ/gcT2HSO6K5t1JYpfRGYVL7onMnAOivO1fa+I0YDbdjwyPovr1LvIjwNlQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Yiz3bK3sjJz3E8LEF5YJot3DsXNpvV5m8eoPYztP8CU=; b=T
 aEiFUJppfq82j74SHZNGhznSrj2ub5hOkKy3AdyRsZtL6I9FoXEtr/8Fg8xIIQMmljwu9oTSTM9Wk
 d6PtTYfiT2BogqL2BS69MOGGOxyCLp7rlgfZwUAzUa/QO/dMZc4GNYqzRpjkCAwsLw+X5pPhwC+jj
 5unrv6o1sZT3luj8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jO1lX-00HQBU-PU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Apr 2020 16:17:00 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 356612072C;
 Mon, 13 Apr 2020 16:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586794610;
 bh=00NfhYZ8RL0JxCpNolUpraJn5ePTrwODtHaKcWmumkM=;
 h=From:To:Cc:Subject:Date:From;
 b=IONbqX8E0ThhePaqxTvRFuFNjKhxQbD2iIOQReMMU0IDGKXLH/BAk1q3o2iAkvmFY
 qhb667+CauT1QoL4Tnib3bkDyegY05vSk8KzkDlE/y4N8Xh5mMzrxmPNw3XMlqy7uK
 VHNcwBNIaxnQxs0Ni0L6cgfWluE+cfbYWjFgjX9I=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 13 Apr 2020 09:16:49 -0700
Message-Id: <20200413161649.38177-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jO1lX-00HQBU-PU
Subject: [f2fs-dev] [PATCH] f2fs: add tracepoint for f2fs iostat
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Added a tracepoint to see iostat of f2fs. Default period of that
is 3 second. This tracepoint can be used to be monitoring
I/O statistics periodically.

Bug: 152162885
Change-Id: I6fbe010b9cf1a90caa0f4793a6dab77c4cba7da6
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/f2fs.h              | 10 ++++++-
 fs/f2fs/sysfs.c             | 34 ++++++++++++++++++++++++
 include/trace/events/f2fs.h | 52 +++++++++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c2788738aa0d4..87baa09f76fb2 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2999,16 +2999,22 @@ static inline int get_inline_xattr_addrs(struct inode *inode)
 		sizeof((f2fs_inode)->field))			\
 		<= (F2FS_OLD_ATTRIBUTE_SIZE + (extra_isize)))	\
 
+extern unsigned long long f2fs_prev_iostat[NR_IO_TYPE];
+
 static inline void f2fs_reset_iostat(struct f2fs_sb_info *sbi)
 {
 	int i;
 
 	spin_lock(&sbi->iostat_lock);
-	for (i = 0; i < NR_IO_TYPE; i++)
+	for (i = 0; i < NR_IO_TYPE; i++) {
 		sbi->write_iostat[i] = 0;
+		f2fs_prev_iostat[i] = 0;
+	}
 	spin_unlock(&sbi->iostat_lock);
 }
 
+extern void f2fs_record_iostat(struct f2fs_sb_info *sbi);
+
 static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi,
 			enum iostat_type type, unsigned long long io_bytes)
 {
@@ -3022,6 +3028,8 @@ static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi,
 			sbi->write_iostat[APP_WRITE_IO] -
 			sbi->write_iostat[APP_DIRECT_IO];
 	spin_unlock(&sbi->iostat_lock);
+
+	f2fs_record_iostat(sbi);
 }
 
 #define __is_large_section(sbi)		((sbi)->segs_per_sec > 1)
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index aeebfb5024a22..f34cb75cd039c 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -15,6 +15,7 @@
 #include "f2fs.h"
 #include "segment.h"
 #include "gc.h"
+#include <trace/events/f2fs.h>
 
 static struct proc_dir_entry *f2fs_proc_root;
 
@@ -751,6 +752,39 @@ static int __maybe_unused segment_bits_seq_show(struct seq_file *seq,
 	return 0;
 }
 
+static const unsigned long period_ms = 3000;
+static unsigned long next_period;
+unsigned long long f2fs_prev_iostat[NR_IO_TYPE] = {0};
+
+static DEFINE_SPINLOCK(iostat_lock);
+
+void f2fs_record_iostat(struct f2fs_sb_info *sbi)
+{
+	unsigned long long iostat_diff[NR_IO_TYPE];
+	int i;
+
+	if (time_is_after_jiffies(next_period))
+		return;
+
+	/* Need double check under the lock */
+	spin_lock(&iostat_lock);
+	if (time_is_after_jiffies(next_period)) {
+		spin_unlock(&iostat_lock);
+		return;
+	}
+	next_period = jiffies + msecs_to_jiffies(period_ms);
+	spin_unlock(&iostat_lock);
+
+	spin_lock(&sbi->iostat_lock);
+	for (i = 0; i < NR_IO_TYPE; i++) {
+		iostat_diff[i] = sbi->write_iostat[i] - f2fs_prev_iostat[i];
+		f2fs_prev_iostat[i] = sbi->write_iostat[i];
+	}
+	spin_unlock(&sbi->iostat_lock);
+
+	trace_f2fs_iostat(sbi, iostat_diff);
+}
+
 static int __maybe_unused iostat_info_seq_show(struct seq_file *seq,
 					       void *offset)
 {
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index d97adfc327f03..e78c8696e2adc 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1812,6 +1812,58 @@ DEFINE_EVENT(f2fs_zip_end, f2fs_decompress_pages_end,
 	TP_ARGS(inode, cluster_idx, compressed_size, ret)
 );
 
+TRACE_EVENT(f2fs_iostat,
+
+	TP_PROTO(struct f2fs_sb_info *sbi, unsigned long long *iostat),
+
+	TP_ARGS(sbi, iostat),
+
+	TP_STRUCT__entry(
+		__field(dev_t,	dev)
+		__field(unsigned long long,	app_dio)
+		__field(unsigned long long,	app_bio)
+		__field(unsigned long long,	app_wio)
+		__field(unsigned long long,	app_mio)
+		__field(unsigned long long,	fs_dio)
+		__field(unsigned long long,	fs_nio)
+		__field(unsigned long long,	fs_mio)
+		__field(unsigned long long,	fs_gc_dio)
+		__field(unsigned long long,	fs_gc_nio)
+		__field(unsigned long long,	fs_cp_dio)
+		__field(unsigned long long,	fs_cp_nio)
+		__field(unsigned long long,	fs_cp_mio)
+		__field(unsigned long long,	fs_discard)
+	),
+
+	TP_fast_assign(
+		__entry->dev		= sbi->sb->s_dev;
+		__entry->app_dio	= iostat[APP_DIRECT_IO];
+		__entry->app_bio	= iostat[APP_BUFFERED_IO];
+		__entry->app_wio	= iostat[APP_WRITE_IO];
+		__entry->app_mio	= iostat[APP_MAPPED_IO];
+		__entry->fs_dio		= iostat[FS_DATA_IO];
+		__entry->fs_nio		= iostat[FS_NODE_IO];
+		__entry->fs_mio		= iostat[FS_META_IO];
+		__entry->fs_gc_dio	= iostat[FS_GC_DATA_IO];
+		__entry->fs_gc_nio	= iostat[FS_GC_NODE_IO];
+		__entry->fs_cp_dio	= iostat[FS_CP_DATA_IO];
+		__entry->fs_cp_nio	= iostat[FS_CP_NODE_IO];
+		__entry->fs_cp_mio	= iostat[FS_CP_META_IO];
+		__entry->fs_discard	= iostat[FS_DISCARD];
+	),
+
+	TP_printk("dev = (%d,%d), "
+		"app [write=%llu (direct=%llu, buffered=%llu), mapped=%llu], "
+		"fs [data=%llu, node=%llu, meta=%llu, discard=%llu], "
+		"gc [data=%llu, node=%llu], "
+		"cp [data=%llu, node=%llu, meta=%llu]",
+		show_dev(__entry->dev), __entry->app_wio, __entry->app_dio,
+		__entry->app_bio, __entry->app_mio, __entry->fs_dio,
+		__entry->fs_nio, __entry->fs_mio, __entry->fs_discard,
+		__entry->fs_gc_dio, __entry->fs_gc_nio, __entry->fs_cp_dio,
+		__entry->fs_cp_nio, __entry->fs_cp_mio)
+);
+
 #endif /* _TRACE_F2FS_H */
 
  /* This part must be outside protection */
-- 
2.26.0.110.g2183baf09c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
