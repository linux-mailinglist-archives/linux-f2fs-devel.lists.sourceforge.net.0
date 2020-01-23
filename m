Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB648146039
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jan 2020 02:14:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iuR4X-0002FM-6P; Thu, 23 Jan 2020 01:14:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iuR4U-0002FE-A9
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jan 2020 01:14:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wR5VrU4/+Dw7BrC/DnqYysTW8cA5Vx6zrSOR53q6dO4=; b=dyFRCXGGuYRzHbRcYeXqsHTJrx
 sSSQhTZaJ2fliy8TncUKHN9D801Wef7AeqXJd9R6uGwzuHDgItvpJO5wwobhnQPV5IoDymJPany7j
 Y+W2KEZtwKxqJEOWgPjA4mhaW39ZTFeWZPXtdfGaGCBlddBG0NCQSuQtNMQsuo2Xi1Mw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wR5VrU4/+Dw7BrC/DnqYysTW8cA5Vx6zrSOR53q6dO4=; b=Ryd1q7e1I2gMGvywmdZPkuiDg1
 2HmazpO7jQuxfhYCS9Z0SvSQSPkhIoh06162nTq5roEoZrBAa8erzeJW4LZ1Zq4bmP1HXk0kVu3o8
 BvoRVNqKuE0Zue4SZ9Jg4yPXTqbbiXy3vTuWNITe3spAzrOFS1McXO8UoOX/k8wzeDuc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iuR4R-00FEpG-5I
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jan 2020 01:14:10 +0000
Received: from localhost (unknown [104.132.0.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 914DE24676;
 Thu, 23 Jan 2020 01:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579742036;
 bh=qyzRU2B7Xw6wKUGaKGWwp7d9aPqqAiGcaZX9p0fHTig=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ye9RnSu0VR9FN913KwuHQWrkDJAdtEMYR+7blrY7O+7JYtORwpaP26bTeo/lWHbik
 WfGNQ01AWTQlj/Cz75V3yJF3znBccOgakPXjUL36QHS3mKdh1aEm7S8NH3vDYxhYHa
 2YLTPpBzVPPTzdU7cYmJD7HeleO4R5FnjFvRWZTA=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 22 Jan 2020 17:13:54 -0800
Message-Id: <20200123011354.75282-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
In-Reply-To: <20200123011354.75282-1-jaegeuk@kernel.org>
References: <20200123011354.75282-1-jaegeuk@kernel.org>
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
X-Headers-End: 1iuR4R-00FEpG-5I
Subject: [f2fs-dev] [PATCH 2/2] f2fs: Add f2fs stats to sysfs
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
Cc: Hridya Valsaraju <hridya@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Hridya Valsaraju <hridya@google.com>

Currently f2fs stats are only available from /d/f2fs/status. This patch
adds some of the f2fs stats to sysfs so that they are accessible even
when debugfs is not mounted.

The following sysfs nodes are added:
-/sys/fs/f2fs/<disk>/free_segments
-/sys/fs/f2fs/<disk>/cp_foreground_calls
-/sys/fs/f2fs/<disk>/cp_background_calls
-/sys/fs/f2fs/<disk>/gc_foreground_calls
-/sys/fs/f2fs/<disk>/gc_background_calls
-/sys/fs/f2fs/<disk>/moved_blocks_foreground
-/sys/fs/f2fs/<disk>/moved_blocks_background
-/sys/fs/f2fs/<disk>/avg_vblocks

Signed-off-by: Hridya Valsaraju <hridya@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  47 ++++++++
 fs/f2fs/debug.c                         |   2 +-
 fs/f2fs/f2fs.h                          |   2 +
 fs/f2fs/sysfs.c                         | 139 ++++++++++++++++++------
 4 files changed, 157 insertions(+), 33 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 7cdaed02981a..1a6cd5397129 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -271,3 +271,50 @@ Date		July 2019
 Contact:	"Daniel Rosenberg" <drosen@google.com>
 Description:	Displays name and version of the encoding set for the filesystem.
 		If no encoding is set, displays (none)
+
+What:		/sys/fs/f2fs/<disk>/free_segments
+Date:		September 2019
+Contact:	"Hridya Valsaraju" <hridya@google.com>
+Description:	Number of free segments in disk.
+
+What:		/sys/fs/f2fs/<disk>/cp_foreground_calls
+Date:		September 2019
+Contact:	"Hridya Valsaraju" <hridya@google.com>
+Description:	Number of checkpoint operations performed on demand. Available when
+		CONFIG_F2FS_STAT_FS=y.
+
+What:		/sys/fs/f2fs/<disk>/cp_background_calls
+Date:		September 2019
+Contact:	"Hridya Valsaraju" <hridya@google.com>
+Description:	Number of checkpoint operations performed in the background to
+		free segments. Available when CONFIG_F2FS_STAT_FS=y.
+
+What:		/sys/fs/f2fs/<disk>/gc_foreground_calls
+Date:		September 2019
+Contact:	"Hridya Valsaraju" <hridya@google.com>
+Description:	Number of garbage collection operations performed on demand.
+		Available when CONFIG_F2FS_STAT_FS=y.
+
+What:		/sys/fs/f2fs/<disk>/gc_background_calls
+Date:		September 2019
+Contact:	"Hridya Valsaraju" <hridya@google.com>
+Description:	Number of garbage collection operations triggered in background.
+		Available when CONFIG_F2FS_STAT_FS=y.
+
+What:		/sys/fs/f2fs/<disk>/moved_blocks_foreground
+Date:		September 2019
+Contact:	"Hridya Valsaraju" <hridya@google.com>
+Description:	Number of blocks moved by garbage collection in foreground.
+		Available when CONFIG_F2FS_STAT_FS=y.
+
+What:		/sys/fs/f2fs/<disk>/moved_blocks_background
+Date:		September 2019
+Contact:	"Hridya Valsaraju" <hridya@google.com>
+Description:	Number of blocks moved by garbage collection in background.
+		Available when CONFIG_F2FS_STAT_FS=y.
+
+What:		/sys/fs/f2fs/<disk>/avg_vblocks
+Date:		September 2019
+Contact:	"Hridya Valsaraju" <hridya@google.com>
+Description:	Average number of valid blocks.
+		Available when CONFIG_F2FS_STAT_FS=y.
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index ce2936554ef8..7565ba9967dd 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -150,7 +150,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 /*
  * This function calculates BDF of every segments
  */
-static void update_sit_info(struct f2fs_sb_info *sbi)
+void update_sit_info(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_stat_info *si = F2FS_STAT(sbi);
 	unsigned long long blks_per_sec, hblks_per_sec, total_vblocks;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 61d62cd06449..148f45f3ea0e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3584,6 +3584,7 @@ int f2fs_build_stats(struct f2fs_sb_info *sbi);
 void f2fs_destroy_stats(struct f2fs_sb_info *sbi);
 void __init f2fs_create_root_stats(void);
 void f2fs_destroy_root_stats(void);
+void update_sit_info(struct f2fs_sb_info *sbi);
 #else
 #define stat_inc_cp_count(si)				do { } while (0)
 #define stat_inc_bg_cp_count(si)			do { } while (0)
@@ -3626,6 +3627,7 @@ static inline int f2fs_build_stats(struct f2fs_sb_info *sbi) { return 0; }
 static inline void f2fs_destroy_stats(struct f2fs_sb_info *sbi) { }
 static inline void __init f2fs_create_root_stats(void) { }
 static inline void f2fs_destroy_root_stats(void) { }
+static inline void update_sit_info(struct f2fs_sb_info *sbi) {}
 #endif
 
 extern const struct file_operations f2fs_dir_operations;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 5152a7487335..0ea95c06f2cf 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -25,6 +25,9 @@ enum {
 	DCC_INFO,	/* struct discard_cmd_control */
 	NM_INFO,	/* struct f2fs_nm_info */
 	F2FS_SBI,	/* struct f2fs_sb_info */
+#ifdef CONFIG_F2FS_STAT_FS
+	STAT_INFO,      /* struct f2fs_stat_info */
+#endif
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 	FAULT_INFO_RATE,	/* struct f2fs_fault_info */
 	FAULT_INFO_TYPE,	/* struct f2fs_fault_info */
@@ -42,6 +45,9 @@ struct f2fs_attr {
 	int id;
 };
 
+static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
+			     struct f2fs_sb_info *sbi, char *buf);
+
 static unsigned char *__struct_ptr(struct f2fs_sb_info *sbi, int struct_type)
 {
 	if (struct_type == GC_THREAD)
@@ -58,6 +64,10 @@ static unsigned char *__struct_ptr(struct f2fs_sb_info *sbi, int struct_type)
 	else if (struct_type == FAULT_INFO_RATE ||
 					struct_type == FAULT_INFO_TYPE)
 		return (unsigned char *)&F2FS_OPTION(sbi).fault_info;
+#endif
+#ifdef CONFIG_F2FS_STAT_FS
+	else if (struct_type == STAT_INFO)
+		return (unsigned char *)F2FS_STAT(sbi);
 #endif
 	return NULL;
 }
@@ -65,35 +75,15 @@ static unsigned char *__struct_ptr(struct f2fs_sb_info *sbi, int struct_type)
 static ssize_t dirty_segments_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%llu\n",
-		(unsigned long long)(dirty_segments(sbi)));
+	return sprintf(buf, "%llu\n",
+			(unsigned long long)(dirty_segments(sbi)));
 }
 
-static ssize_t unusable_show(struct f2fs_attr *a,
+static ssize_t free_segments_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
-	block_t unusable;
-
-	if (test_opt(sbi, DISABLE_CHECKPOINT))
-		unusable = sbi->unusable_block_count;
-	else
-		unusable = f2fs_get_unusable_blocks(sbi);
-	return snprintf(buf, PAGE_SIZE, "%llu\n",
-		(unsigned long long)unusable);
-}
-
-static ssize_t encoding_show(struct f2fs_attr *a,
-		struct f2fs_sb_info *sbi, char *buf)
-{
-#ifdef CONFIG_UNICODE
-	if (f2fs_sb_has_casefold(sbi))
-		return snprintf(buf, PAGE_SIZE, "%s (%d.%d.%d)\n",
-			sbi->s_encoding->charset,
-			(sbi->s_encoding->version >> 16) & 0xff,
-			(sbi->s_encoding->version >> 8) & 0xff,
-			sbi->s_encoding->version & 0xff);
-#endif
-	return snprintf(buf, PAGE_SIZE, "(none)");
+	return sprintf(buf, "%llu\n",
+			(unsigned long long)(free_segments(sbi)));
 }
 
 static ssize_t lifetime_write_kbytes_show(struct f2fs_attr *a,
@@ -102,10 +92,10 @@ static ssize_t lifetime_write_kbytes_show(struct f2fs_attr *a,
 	struct super_block *sb = sbi->sb;
 
 	if (!sb->s_bdev->bd_part)
-		return snprintf(buf, PAGE_SIZE, "0\n");
+		return sprintf(buf, "0\n");
 
-	return snprintf(buf, PAGE_SIZE, "%llu\n",
-		(unsigned long long)(sbi->kbytes_written +
+	return sprintf(buf, "%llu\n",
+			(unsigned long long)(sbi->kbytes_written +
 			BD_PART_WRITTEN(sbi)));
 }
 
@@ -116,7 +106,7 @@ static ssize_t features_show(struct f2fs_attr *a,
 	int len = 0;
 
 	if (!sb->s_bdev->bd_part)
-		return snprintf(buf, PAGE_SIZE, "0\n");
+		return sprintf(buf, "0\n");
 
 	if (f2fs_sb_has_encrypt(sbi))
 		len += snprintf(buf, PAGE_SIZE - len, "%s",
@@ -166,9 +156,66 @@ static ssize_t features_show(struct f2fs_attr *a,
 static ssize_t current_reserved_blocks_show(struct f2fs_attr *a,
 					struct f2fs_sb_info *sbi, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%u\n", sbi->current_reserved_blocks);
+	return sprintf(buf, "%u\n", sbi->current_reserved_blocks);
+}
+
+static ssize_t unusable_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	block_t unusable;
+
+	if (test_opt(sbi, DISABLE_CHECKPOINT))
+		unusable = sbi->unusable_block_count;
+	else
+		unusable = f2fs_get_unusable_blocks(sbi);
+	return sprintf(buf, "%llu\n", (unsigned long long)unusable);
 }
 
+static ssize_t encoding_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+#ifdef CONFIG_UNICODE
+	if (f2fs_sb_has_casefold(sbi))
+		return snprintf(buf, PAGE_SIZE, "%s (%d.%d.%d)\n",
+			sbi->s_encoding->charset,
+			(sbi->s_encoding->version >> 16) & 0xff,
+			(sbi->s_encoding->version >> 8) & 0xff,
+			sbi->s_encoding->version & 0xff);
+#endif
+	return sprintf(buf, "(none)");
+}
+
+#ifdef CONFIG_F2FS_STAT_FS
+static ssize_t moved_blocks_foreground_show(struct f2fs_attr *a,
+				struct f2fs_sb_info *sbi, char *buf)
+{
+	struct f2fs_stat_info *si = F2FS_STAT(sbi);
+
+	return sprintf(buf, "%llu\n",
+		(unsigned long long)(si->tot_blks -
+			(si->bg_data_blks + si->bg_node_blks)));
+}
+
+static ssize_t moved_blocks_background_show(struct f2fs_attr *a,
+				struct f2fs_sb_info *sbi, char *buf)
+{
+	struct f2fs_stat_info *si = F2FS_STAT(sbi);
+
+	return sprintf(buf, "%llu\n",
+		(unsigned long long)(si->bg_data_blks + si->bg_node_blks));
+}
+
+static ssize_t avg_vblocks_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	struct f2fs_stat_info *si = F2FS_STAT(sbi);
+
+	si->dirty_count = dirty_segments(sbi);
+	update_sit_info(sbi);
+	return sprintf(buf, "%llu\n", (unsigned long long)(si->avg_vblocks));
+}
+#endif
+
 static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
 			struct f2fs_sb_info *sbi, char *buf)
 {
@@ -202,7 +249,7 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
 
 	ui = (unsigned int *)(ptr + a->offset);
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", *ui);
+	return sprintf(buf, "%u\n", *ui);
 }
 
 static ssize_t __sbi_store(struct f2fs_attr *a,
@@ -413,7 +460,7 @@ static ssize_t f2fs_feature_show(struct f2fs_attr *a,
 	case FEAT_SB_CHECKSUM:
 	case FEAT_CASEFOLD:
 	case FEAT_COMPRESSION:
-		return snprintf(buf, PAGE_SIZE, "supported\n");
+		return sprintf(buf, "supported\n");
 	}
 	return 0;
 }
@@ -442,6 +489,14 @@ static struct f2fs_attr f2fs_attr_##_name = {			\
 	.id	= _id,						\
 }
 
+#define F2FS_STAT_ATTR(_struct_type, _struct_name, _name, _elname)	\
+static struct f2fs_attr f2fs_attr_##_name = {			\
+	.attr = {.name = __stringify(_name), .mode = 0444 },	\
+	.show = f2fs_sbi_show,					\
+	.struct_type = _struct_type,				\
+	.offset = offsetof(struct _struct_name, _elname),       \
+}
+
 F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_urgent_sleep_time,
 							urgent_sleep_time);
 F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_min_sleep_time, min_sleep_time);
@@ -483,11 +538,21 @@ F2FS_RW_ATTR(FAULT_INFO_RATE, f2fs_fault_info, inject_rate, inject_rate);
 F2FS_RW_ATTR(FAULT_INFO_TYPE, f2fs_fault_info, inject_type, inject_type);
 #endif
 F2FS_GENERAL_RO_ATTR(dirty_segments);
+F2FS_GENERAL_RO_ATTR(free_segments);
 F2FS_GENERAL_RO_ATTR(lifetime_write_kbytes);
 F2FS_GENERAL_RO_ATTR(features);
 F2FS_GENERAL_RO_ATTR(current_reserved_blocks);
 F2FS_GENERAL_RO_ATTR(unusable);
 F2FS_GENERAL_RO_ATTR(encoding);
+#ifdef CONFIG_F2FS_STAT_FS
+F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_foreground_calls, cp_count);
+F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_background_calls, bg_cp_count);
+F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, gc_foreground_calls, call_count);
+F2FS_STAT_ATTR(F2FS_SBI, f2fs_sb_info, gc_background_calls, bg_gc);
+F2FS_GENERAL_RO_ATTR(moved_blocks_background);
+F2FS_GENERAL_RO_ATTR(moved_blocks_foreground);
+F2FS_GENERAL_RO_ATTR(avg_vblocks);
+#endif
 
 #ifdef CONFIG_FS_ENCRYPTION
 F2FS_FEATURE_RO_ATTR(encryption, FEAT_CRYPTO);
@@ -549,12 +614,22 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(inject_type),
 #endif
 	ATTR_LIST(dirty_segments),
+	ATTR_LIST(free_segments),
 	ATTR_LIST(unusable),
 	ATTR_LIST(lifetime_write_kbytes),
 	ATTR_LIST(features),
 	ATTR_LIST(reserved_blocks),
 	ATTR_LIST(current_reserved_blocks),
 	ATTR_LIST(encoding),
+#ifdef CONFIG_F2FS_STAT_FS
+	ATTR_LIST(cp_foreground_calls),
+	ATTR_LIST(cp_background_calls),
+	ATTR_LIST(gc_foreground_calls),
+	ATTR_LIST(gc_background_calls),
+	ATTR_LIST(moved_blocks_foreground),
+	ATTR_LIST(moved_blocks_background),
+	ATTR_LIST(avg_vblocks),
+#endif
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
-- 
2.24.0.525.g8f36a354ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
