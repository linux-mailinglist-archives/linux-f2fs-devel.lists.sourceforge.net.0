Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A29C5E26B7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Oct 2019 00:56:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6Cv/08+x6G4F2wVyZmJZxMyfhkBlHKsIEgFoyMGWCPM=; b=mG0evABBhLPqDam613XB8Dakk
	HJPeMwZenTBxu7xAs8KH04U2oVoHzprfVEacmRrhO3V2i/TEcQ1a2Y+Loh3JyvUmmZk+Qss4ClqiT
	IxSZ9F9ldNskDyRwFPczn6Cjad5S6C+Mx/EpRHogScxDbgOl3z0QvfqP+TlhSwHYZisSQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iNPXw-0005mi-BO; Wed, 23 Oct 2019 22:56:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3yMqwXQYKABU2C3yJv19916z.x97@flex--hridya.bounces.google.com>)
 id 1iNPXu-0005ma-HJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Oct 2019 22:56:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5fjuRPiGbd4dGSpwVvC9erNP0hG41pRC8n50P8n1Dpc=; b=k22AetFDrGENUDUcTGS0ZPMEA
 SZhBi6BvWra3m6tCmn1L1owFtLcsJjE/Nr/JutzdxWfGYDirMN6m60Oh+BdSgGTdjKdr548YULgJw
 HsXoAs7nFV5q0HuhXLx1ErIFbEqJzuNg61wbV44o6DMv2ucNXKPQtXbeydCedW0LQnmTg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5fjuRPiGbd4dGSpwVvC9erNP0hG41pRC8n50P8n1Dpc=; b=ZU8v+WccdiOnPJHpdx/vyQ536t
 fhN1CN2gGSMKEmxedXJCtSCDn1A6d9bnHyWY04qvkrouy1G5Z1C6OXjwtiOOHGmyzJxdP8cRIcGux
 p5SDmPpg2TQJdNBUD47xHffvQ/hy4z2qT4TwO4PtllR1JuRZ3tjehcMe8uiXv7qgGUwY=;
Received: from mail-pf1-f202.google.com ([209.85.210.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iNPXd-000qss-V7
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Oct 2019 22:56:01 +0000
Received: by mail-pf1-f202.google.com with SMTP id d126so17353113pfd.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 23 Oct 2019 15:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=5fjuRPiGbd4dGSpwVvC9erNP0hG41pRC8n50P8n1Dpc=;
 b=JL4LP+oo7ROHKI0jl/60dAWVbx09mM9XNtpWqkNyEwM0fPRQ0zjec5pPbdnkw3y3Oh
 UdlFKcWVdd99951f3ojPAdHZ6jtQ/RJa7drImCnO9ghi06JD6+xDJ6WJlDtYYZ4MtuV4
 3WC3lZfpe10N2NGzmw7zCGxLdtwtxmiIQJ5FYUnCIUhL3rawvXdBsHufcQ5E35hUgfSJ
 YuvClbEvwZAyUOYuKfiF/H0PDZ43CF/jaUUkmCc+e6zRV8ut/wgIdCOqFKkVyvfCGZSW
 WjaWm87u1/EqNJaq6cFzDuhAK/1DKJ7HA/BOdtCopB2qnSptVwRfsro6AVWjyIYXi/Z8
 ah8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=5fjuRPiGbd4dGSpwVvC9erNP0hG41pRC8n50P8n1Dpc=;
 b=TtxoQlqZH1MNmdyySstNQ6GC2eb1GBnHc7mD+11sdAYbWeSOg/DWaDJc8lxlmXokcR
 TbkcLWj4o+A2/mx6GA7J35WmXu8tHe0Pi3KP/RAWuz6mdZTYUSzkMzoqvwIY8UcFRWGi
 duYSkDliNgSyRjLekmuJ5ZbmI/CYO3Pl2FEpij0POas3bxhqOrwBrKN6cyRPjftRLzwC
 S3skXMtsjX4vlPPWgrBLSMigTMvrShj/IY03XU5tDz9OBDu18mCEJJ1uM77Hu8h57rj7
 T0MYTDzJRvihcg/mxe+InbI++6DzazNo4Ll+MYU2VwKta0ahSOv6Uc50ikQe5IFEJXz2
 4vxg==
X-Gm-Message-State: APjAAAU9kMDpTTLP/OGSCMPv9Ws6x7IpPFsYGoYrewm0YkFp5LBbBvzQ
 YuEe/kRPqPDqBqHV8sCLm2f05nReiec=
X-Google-Smtp-Source: APXvYqzcNBcQ3VzZzTIxMeYV2fDloPUfx4r7YkBkbvIlDNn0FOo2WjQPa5abhD44Z8Zv383XWD8/1kF4ctQ=
X-Received: by 2002:a63:b211:: with SMTP id x17mr12585601pge.51.1571867336997; 
 Wed, 23 Oct 2019 14:48:56 -0700 (PDT)
Date: Wed, 23 Oct 2019 14:48:20 -0700
In-Reply-To: <20191023214821.107615-1-hridya@google.com>
Message-Id: <20191023214821.107615-2-hridya@google.com>
Mime-Version: 1.0
References: <20191023214821.107615-1-hridya@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 DKIM_ADSP_CUSTOM_MED   No valid author signature, adsp_override is
 CUSTOM_MED
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1iNPXd-000qss-V7
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
From: Hridya Valsaraju via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Hridya Valsaraju <hridya@google.com>
Cc: Hridya Valsaraju <hridya@google.com>, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

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
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  47 +++++++++++
 fs/f2fs/debug.c                         |   2 +-
 fs/f2fs/f2fs.h                          |   2 +
 fs/f2fs/sysfs.c                         | 103 ++++++++++++++++++++++++
 4 files changed, 153 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 8f79a9acefcf..ba4fadf4b78f 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -253,3 +253,50 @@ Contact:	"Daniel Rosenberg" <drosen@google.com>
 Description:	If checkpoint=disable, it displays the number of blocks that are unusable.
 		If checkpoint=enable it displays the enumber of blocks that would be unusable
 		if checkpoint=disable were to be set.
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
index 7706049d23bf..75ecebf7f168 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -148,7 +148,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 /*
  * This function calculates BDF of every segments
  */
-static void update_sit_info(struct f2fs_sb_info *sbi)
+void update_sit_info(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_stat_info *si = F2FS_STAT(sbi);
 	unsigned long long blks_per_sec, hblks_per_sec, total_vblocks;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 17382da7f0bd..fffce57755e4 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3391,6 +3391,7 @@ int f2fs_build_stats(struct f2fs_sb_info *sbi);
 void f2fs_destroy_stats(struct f2fs_sb_info *sbi);
 void __init f2fs_create_root_stats(void);
 void f2fs_destroy_root_stats(void);
+void update_sit_info(struct f2fs_sb_info *sbi);
 #else
 #define stat_inc_cp_count(si)				do { } while (0)
 #define stat_inc_bg_cp_count(si)			do { } while (0)
@@ -3429,6 +3430,7 @@ static inline int f2fs_build_stats(struct f2fs_sb_info *sbi) { return 0; }
 static inline void f2fs_destroy_stats(struct f2fs_sb_info *sbi) { }
 static inline void __init f2fs_create_root_stats(void) { }
 static inline void f2fs_destroy_root_stats(void) { }
+static inline void update_sit_info(struct f2fs_sb_info *sbi) {}
 #endif
 
 extern const struct file_operations f2fs_dir_operations;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 3aeacd0aacfd..c1d111abe5f2 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -24,6 +24,9 @@ enum {
 	DCC_INFO,	/* struct discard_cmd_control */
 	NM_INFO,	/* struct f2fs_nm_info */
 	F2FS_SBI,	/* struct f2fs_sb_info */
+#ifdef CONFIG_F2FS_STAT_FS
+	STAT_INFO,      /* struct f2fs_stat_info */
+#endif
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 	FAULT_INFO_RATE,	/* struct f2fs_fault_info */
 	FAULT_INFO_TYPE,	/* struct f2fs_fault_info */
@@ -41,6 +44,9 @@ struct f2fs_attr {
 	int id;
 };
 
+static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
+			     struct f2fs_sb_info *sbi, char *buf);
+
 static unsigned char *__struct_ptr(struct f2fs_sb_info *sbi, int struct_type)
 {
 	if (struct_type == GC_THREAD)
@@ -57,10 +63,89 @@ static unsigned char *__struct_ptr(struct f2fs_sb_info *sbi, int struct_type)
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
 
+static ssize_t free_segments_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	return sprintf(buf, "%llu\n", (unsigned long long)(free_segments(sbi)));
+}
+
+#ifdef CONFIG_F2FS_STAT_FS
+
+#define F2FS_STAT_ATTR(_struct_type, _struct_name, _name, _elname)	\
+static struct f2fs_attr f2fs_attr_##_name = {			\
+	.attr = {.name = __stringify(_name), .mode = 0444 },	\
+	.show = f2fs_sbi_show,					\
+	.struct_type = _struct_type,				\
+	.offset = offsetof(struct _struct_name, _elname),       \
+}
+
+F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_background_calls, bg_cp_count);
+F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, gc_background_calls, bg_gc);
+
+static ssize_t cp_foreground_calls_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	struct f2fs_stat_info *si;
+
+	si = F2FS_STAT(sbi);
+	return sprintf(buf, "%llu\n",
+		       (unsigned long long)(si->cp_count - si->bg_cp_count));
+}
+
+static ssize_t gc_foreground_calls_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	struct f2fs_stat_info *si;
+
+	si = F2FS_STAT(sbi);
+	return sprintf(buf, "%llu\n",
+		       (unsigned long long)(si->call_count - si->bg_gc));
+}
+
+static ssize_t moved_blocks_foreground_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	struct f2fs_stat_info *si;
+
+	si = F2FS_STAT(sbi);
+	return sprintf(buf, "%llu\n",
+		       (unsigned long long)(si->tot_blks -
+					    (si->bg_data_blks +
+					     si->bg_node_blks)));
+}
+
+static ssize_t moved_blocks_background_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	struct f2fs_stat_info *si;
+
+	si = F2FS_STAT(sbi);
+	return sprintf(buf, "%llu\n",
+		       (unsigned long long)(si->bg_data_blks +
+					    si->bg_node_blks));
+}
+
+static ssize_t avg_vblocks_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	struct f2fs_stat_info *si;
+
+	si = F2FS_STAT(sbi);
+	si->dirty_count = dirty_segments(sbi);
+	update_sit_info(sbi);
+	return sprintf(buf, "%llu\n",
+		       (unsigned long long)(si->avg_vblocks));
+}
+#endif
+
 static ssize_t dirty_segments_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
@@ -451,6 +536,14 @@ F2FS_RW_ATTR(FAULT_INFO_RATE, f2fs_fault_info, inject_rate, inject_rate);
 F2FS_RW_ATTR(FAULT_INFO_TYPE, f2fs_fault_info, inject_type, inject_type);
 #endif
 F2FS_GENERAL_RO_ATTR(dirty_segments);
+F2FS_GENERAL_RO_ATTR(free_segments);
+#ifdef CONFIG_F2FS_STAT_FS
+F2FS_GENERAL_RO_ATTR(cp_foreground_calls);
+F2FS_GENERAL_RO_ATTR(gc_foreground_calls);
+F2FS_GENERAL_RO_ATTR(moved_blocks_background);
+F2FS_GENERAL_RO_ATTR(moved_blocks_foreground);
+F2FS_GENERAL_RO_ATTR(avg_vblocks);
+#endif
 F2FS_GENERAL_RO_ATTR(lifetime_write_kbytes);
 F2FS_GENERAL_RO_ATTR(features);
 F2FS_GENERAL_RO_ATTR(current_reserved_blocks);
@@ -515,6 +608,16 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(features),
 	ATTR_LIST(reserved_blocks),
 	ATTR_LIST(current_reserved_blocks),
+	ATTR_LIST(free_segments),
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
2.23.0.866.gb869b98d4c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
