Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 846801AB64F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Apr 2020 05:42:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOvQ9-0001p0-Ol; Thu, 16 Apr 2020 03:42:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jOvQ8-0001ot-0m
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Apr 2020 03:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b6bqddh84fqBS4dqXLF4LV9Jn2AXZyriY1okXylbE3I=; b=C12RrWA7o2FlPb9LUukyCgzBio
 LmTWJCJb2lYzNghEWlfmgtcGCr+Jq00f7Vzi/agHQYS779B/HO3ev5a4Axuxisba3FW13a4d5dEHu
 U//jKjdkzOdmL6C3A8svjgQ2zf5zU36U8Pl3hfX796OiZXdNZ89a+oxP2sL5HGD1NugU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b6bqddh84fqBS4dqXLF4LV9Jn2AXZyriY1okXylbE3I=; b=N4AWVDFXNDnT3VdPBIRhk1NNew
 w3uzbsLI+wAa/qovxTR/M2DBouhf2+cf/BFI+tX+HLUXshv3q3cd8NkpyE00meIomawjVH7eAV6o5
 an56ftlzBqtn9CfrP8+gus5KTro4z8yzlta3Sxeiv7rmBlrkVZrw//HYUPh46IwMt2Q4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOvQ4-001MzK-Ok
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Apr 2020 03:42:31 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7724420737;
 Thu, 16 Apr 2020 03:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587008537;
 bh=3bdCitI6DbtfpJ8kO1TDqDqoKTqTZP8xYsOYGObs8do=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=s9vZ1bN22hDMSwhRJNr7GEGww4DRupw6O6A1EJ+JEk2S2hei94WewGsC3RW/fQZL9
 gkoNv6u0FGNAs86g5A+hWgkRlMaTkt44gZTjY38tebmcO/loIEOVxJ9U+FGASJKRkQ
 zIExw821mKKrsnz4Fx02WRWLliw+2d1iqZA+ss78=
Date: Wed, 15 Apr 2020 20:42:17 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Message-ID: <20200416034217.GA254838@google.com>
References: <20200413161649.38177-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200413161649.38177-1-jaegeuk@kernel.org>
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
X-Headers-End: 1jOvQ4-001MzK-Ok
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add tracepoint for f2fs iostat
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

v2:
 - add sysfs entry to give the time period
 - keep stat records in sbi

From 805015f3f2cec3acf43321359129c5382a1d5db4 Mon Sep 17 00:00:00 2001
From: Daeho Jeong <daehojeong@google.com>
Date: Mon, 30 Mar 2020 03:30:59 +0000
Subject: [PATCH] f2fs: add tracepoint for f2fs iostat

Added a tracepoint to see iostat of f2fs. Default period of that
is 3 second. This tracepoint can be used to be monitoring
I/O statistics periodically.

Bug: 152162885
Change-Id: I6fbe010b9cf1a90caa0f4793a6dab77c4cba7da6
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  6 +++
 fs/f2fs/f2fs.h                          | 16 +++++++-
 fs/f2fs/super.c                         |  1 +
 fs/f2fs/sysfs.c                         | 39 +++++++++++++++++++
 include/trace/events/f2fs.h             | 52 +++++++++++++++++++++++++
 5 files changed, 113 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index c8620ea7022a7..427f5b45c67f1 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -332,3 +332,9 @@ Description:	Give a way to attach REQ_META|FUA to data writes
 		*      REQ_META     |      REQ_FUA      |
 		*    5 |    4 |   3 |    2 |    1 |   0 |
 		* Cold | Warm | Hot | Cold | Warm | Hot |
+
+What:		/sys/fs/f2fs/<disk>/iostat_period_ms
+Date:		April 2020
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	Give a way to change iostat_period time. 3secs by default.
+		The new iostat trace gives stats gap given the period.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c2788738aa0d4..6cedbfb2067c5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1505,7 +1505,10 @@ struct f2fs_sb_info {
 	/* For app/fs IO statistics */
 	spinlock_t iostat_lock;
 	unsigned long long write_iostat[NR_IO_TYPE];
+	unsigned long long prev_write_iostat[NR_IO_TYPE];
 	bool iostat_enable;
+	unsigned long iostat_next_period;
+	unsigned int iostat_period_ms;
 
 	/* to attach REQ_META|REQ_FUA flags */
 	unsigned int data_io_flag;
@@ -2999,16 +3002,25 @@ static inline int get_inline_xattr_addrs(struct inode *inode)
 		sizeof((f2fs_inode)->field))			\
 		<= (F2FS_OLD_ATTRIBUTE_SIZE + (extra_isize)))	\
 
+#define DEFAULT_IOSTAT_PERIOD_MS	3000
+#define MIN_IOSTAT_PERIOD_MS		100
+/* maximum period of iostat tracing is 1 day */
+#define MAX_IOSTAT_PERIOD_MS		8640000
+
 static inline void f2fs_reset_iostat(struct f2fs_sb_info *sbi)
 {
 	int i;
 
 	spin_lock(&sbi->iostat_lock);
-	for (i = 0; i < NR_IO_TYPE; i++)
+	for (i = 0; i < NR_IO_TYPE; i++) {
 		sbi->write_iostat[i] = 0;
+		sbi->prev_write_iostat[i] = 0;
+	}
 	spin_unlock(&sbi->iostat_lock);
 }
 
+extern void f2fs_record_iostat(struct f2fs_sb_info *sbi);
+
 static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi,
 			enum iostat_type type, unsigned long long io_bytes)
 {
@@ -3022,6 +3034,8 @@ static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi,
 			sbi->write_iostat[APP_WRITE_IO] -
 			sbi->write_iostat[APP_DIRECT_IO];
 	spin_unlock(&sbi->iostat_lock);
+
+	f2fs_record_iostat(sbi);
 }
 
 #define __is_large_section(sbi)		((sbi)->segs_per_sec > 1)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f2dfc21c6abb0..438296e17183d 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3424,6 +3424,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	/* init iostat info */
 	spin_lock_init(&sbi->iostat_lock);
 	sbi->iostat_enable = false;
+	sbi->iostat_period_ms = DEFAULT_IOSTAT_PERIOD_MS;
 
 	for (i = 0; i < NR_PAGE_TYPE; i++) {
 		int n = (i == META) ? 1: NR_TEMP_TYPE;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index aeebfb5024a22..d05cb68c26374 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -15,6 +15,7 @@
 #include "f2fs.h"
 #include "segment.h"
 #include "gc.h"
+#include <trace/events/f2fs.h>
 
 static struct proc_dir_entry *f2fs_proc_root;
 
@@ -379,6 +380,15 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "iostat_period_ms")) {
+		if (t < MIN_IOSTAT_PERIOD_MS || t > MAX_IOSTAT_PERIOD_MS)
+			return -EINVAL;
+		spin_lock(&sbi->iostat_lock);
+		sbi->iostat_period_ms = (unsigned int)t;
+		spin_unlock(&sbi->iostat_lock);
+		return count;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
@@ -535,6 +545,7 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_idle_interval, interval_time[GC_TIME]);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info,
 		umount_discard_timeout, interval_time[UMOUNT_DISCARD_TIMEOUT]);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, iostat_enable, iostat_enable);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, iostat_period_ms, iostat_period_ms);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, readdir_ra, readdir_ra);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_pin_file_thresh, gc_pin_file_threshold);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_super_block, extension_list, extension_list);
@@ -615,6 +626,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(gc_idle_interval),
 	ATTR_LIST(umount_discard_timeout),
 	ATTR_LIST(iostat_enable),
+	ATTR_LIST(iostat_period_ms),
 	ATTR_LIST(readdir_ra),
 	ATTR_LIST(gc_pin_file_thresh),
 	ATTR_LIST(extension_list),
@@ -751,6 +763,33 @@ static int __maybe_unused segment_bits_seq_show(struct seq_file *seq,
 	return 0;
 }
 
+void f2fs_record_iostat(struct f2fs_sb_info *sbi)
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
+		iostat_diff[i] = sbi->write_iostat[i] -
+				sbi->prev_write_iostat[i];
+		sbi->prev_write_iostat[i] = sbi->write_iostat[i];
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
