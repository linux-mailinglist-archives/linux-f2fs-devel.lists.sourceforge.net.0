Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5AA6EB90B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Apr 2023 14:08:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pqC2I-0000ZY-4p;
	Sat, 22 Apr 2023 12:08:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pqC2F-0000ZR-3B
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 22 Apr 2023 12:08:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b0h0Kbswod5uOo4DPtOj50C0BEG6u2FcfiZ+fwfrO90=; b=kj02gMtj9U7ZR7bKChrqNg/YKZ
 9vh4gfxHwSjD0034QS5nnE78y4KHlyxSySX/kns3zz0Lbu3bHWSotA+Ql09TvbD+MsqPct8qK/jDv
 /U6C7sjA9ftxaAr3eVnaMixSxV8ow3HPGGnkTHXNEP8XGLsvaxYIvTprfJNZ0HJJjaTo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=b0h0Kbswod5uOo4DPtOj50C0BEG6u2FcfiZ+fwfrO90=; b=g
 d/DC4dojhoESucqKpa94YVKk+6tHBgQspHDOfnt007Tqyg3ShpOpgrU42CVWgnOr1/Qh3hhzCglWr
 KfopeOt7MLN8Fb3Hrnym0NTXfJDa8akYgOJT4ncI/iEqq4WCRF+Gv4Ja5W4TjWZ2rKTtp2iyk8igA
 n99Yos2j95DvmWPM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pqC2A-00FuHu-1t for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 22 Apr 2023 12:08:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 94DA76141D;
 Sat, 22 Apr 2023 12:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB950C433EF;
 Sat, 22 Apr 2023 12:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682165280;
 bh=Oxc0z5LR+8nud8UzZWcoquO1CkQb9wCIYGwFZDmiUKo=;
 h=From:To:Cc:Subject:Date:From;
 b=lSnF0SOq0bm6FzzKxphkYUIVXsDx0XRiBIw9t6B52cj2i7xuAUSCTRKdapkIDXfXt
 0VnqnSWJQIEjd0LkhVIZpKR7BNGkE3RmO9K/Tn8A/8Ndvmupcdmtx3mVgw4bqHVIw9
 Defiy2+MGFRVLn+3VGPpjeGYcCF44ySaaEaMxSQKPW29ub7epSMDdwdnWBxS0VWKpe
 LhtY6DcM7PEOxXY8lFZzVHgeX33VQ89vp6vSbCqrSDBiin/xHYyf86JzPRuD4mc7SY
 QY1Yk21+ZSdYFS5RITdFfv3cDG9LP/b7d4781a/2es7F+SPnwBa28ggShtNLGqE3kt
 Ev8Qu+idDNTXQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sat, 22 Apr 2023 20:07:54 +0800
Message-Id: <20230422120754.97345-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch supports errors=remount-ro|continue|panic mount
 option,
 by default it uses "continue" mode. Signed-off-by: Yangtao Li
 <frank.li@vivo.com>
 Signed-off-by: Chao Yu <chao@kernel.org> --- v10: - add description of error
 mode in f2fs.rst - keep pending node/non-dir pages in remount-ro mode Documen
 [...] Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pqC2A-00FuHu-1t
Subject: [f2fs-dev] [PATCH v10] f2fs: support
 errors=remount-ro|continue|panic mountoption
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
Cc: linux-kernel@vger.kernel.org, Yangtao Li <frank.li@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch supports errors=remount-ro|continue|panic mount option,
by default it uses "continue" mode.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v10:
- add description of error mode in f2fs.rst
- keep pending node/non-dir pages in remount-ro mode
 Documentation/filesystems/f2fs.rst |  13 +++
 fs/f2fs/checkpoint.c               |   7 +-
 fs/f2fs/data.c                     |   4 +
 fs/f2fs/f2fs.h                     |  20 ++++-
 fs/f2fs/file.c                     |   5 --
 fs/f2fs/gc.c                       |   2 +-
 fs/f2fs/node.c                     |   3 +
 fs/f2fs/super.c                    | 134 ++++++++++++++++++++++++++---
 8 files changed, 164 insertions(+), 24 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index c57745375edb..79670e182250 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -351,6 +351,19 @@ age_extent_cache	 Enable an age extent cache based on rb-tree. It records
 			 data block update frequency of the extent per inode, in
 			 order to provide better temperature hints for data block
 			 allocation.
+errors=%s		 Specify f2fs behavior on critical errors. This supports modes:
+			 "panic", "continue" and "remount-ro", respectively, trigger
+			 panic immediately, continue without doing anything, and remount
+			 the partition in read-only mode. By default it uses "continue"
+			 mode.
+			 			continue	remount-ro	panic
+			 access ops		normal		noraml		N/A
+			 syscall errors		-EIO		-EROFS		N/A
+			 mount option		rw		ro		N/A
+			 pending dir write	keep		keep		N/A
+			 pending non-dir write	drop		keep		N/A
+			 pending node write	drop		keep		N/A
+			 pending meta write	keep		keep		N/A
 ======================== ============================================================
 
 Debugfs Entries
diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 64b3860f50ee..8fd3b7f9fb88 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -30,12 +30,9 @@ void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io,
 						unsigned char reason)
 {
 	f2fs_build_fault_attr(sbi, 0, 0);
-	set_ckpt_flags(sbi, CP_ERROR_FLAG);
-	if (!end_io) {
+	if (!end_io)
 		f2fs_flush_merged_writes(sbi);
-
-		f2fs_handle_stop(sbi, reason);
-	}
+	f2fs_handle_critical_error(sbi, reason, end_io);
 }
 
 /*
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 7165b1202f53..f26eac327d6e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2807,6 +2807,10 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 		if (S_ISDIR(inode->i_mode) &&
 				!is_sbi_flag_set(sbi, SBI_IS_CLOSE))
 			goto redirty_out;
+
+		/* keep data pages in remount-ro mode */
+		if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_READONLY)
+			goto redirty_out;
 		goto out;
 	}
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d211ee89c158..7afc9aef127a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -162,6 +162,7 @@ struct f2fs_mount_info {
 	int fs_mode;			/* fs mode: LFS or ADAPTIVE */
 	int bggc_mode;			/* bggc mode: off, on or sync */
 	int memory_mode;		/* memory mode */
+	int errors;			/* errors parameter */
 	int discard_unit;		/*
 					 * discard command's offset/size should
 					 * be aligned to this unit: block,
@@ -1370,6 +1371,12 @@ enum {
 	MEMORY_MODE_LOW,	/* memory mode for low memry devices */
 };
 
+enum errors_option {
+	MOUNT_ERRORS_READONLY,	/* remount fs ro on errors */
+	MOUNT_ERRORS_CONTINUE,	/* continue on errors */
+	MOUNT_ERRORS_PANIC,	/* panic on errors */
+};
+
 static inline int f2fs_test_bit(unsigned int nr, char *addr);
 static inline void f2fs_set_bit(unsigned int nr, char *addr);
 static inline void f2fs_clear_bit(unsigned int nr, char *addr);
@@ -1721,8 +1728,14 @@ struct f2fs_sb_info {
 
 	struct workqueue_struct *post_read_wq;	/* post read workqueue */
 
-	unsigned char errors[MAX_F2FS_ERRORS];	/* error flags */
-	spinlock_t error_lock;			/* protect errors array */
+	/*
+	 * If we are in irq context, let's update error information into
+	 * on-disk superblock in the work.
+	 */
+	struct work_struct s_error_work;
+	unsigned char errors[MAX_F2FS_ERRORS];		/* error flags */
+	unsigned char stop_reason[MAX_STOP_REASON];	/* stop reason */
+	spinlock_t error_lock;			/* protect errors/stop_reason array */
 	bool error_dirty;			/* errors of sb is dirty */
 
 	struct kmem_cache *inline_xattr_slab;	/* inline xattr entry */
@@ -3541,8 +3554,9 @@ int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly);
 int f2fs_quota_sync(struct super_block *sb, int type);
 loff_t max_file_blocks(struct inode *inode);
 void f2fs_quota_off_umount(struct super_block *sb);
-void f2fs_handle_stop(struct f2fs_sb_info *sbi, unsigned char reason);
 void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag);
+void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason,
+							bool irq_context);
 void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error);
 int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover);
 int f2fs_sync_fs(struct super_block *sb, int sync);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5ac53d2627d2..9c9c3f660e01 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2225,7 +2225,6 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
 				ret = 0;
 				f2fs_stop_checkpoint(sbi, false,
 						STOP_CP_REASON_SHUTDOWN);
-				set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
 				trace_f2fs_shutdown(sbi, in, ret);
 			}
 			return ret;
@@ -2238,7 +2237,6 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
 		if (ret)
 			goto out;
 		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN);
-		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
 		thaw_bdev(sb->s_bdev);
 		break;
 	case F2FS_GOING_DOWN_METASYNC:
@@ -2247,16 +2245,13 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
 		if (ret)
 			goto out;
 		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN);
-		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
 		break;
 	case F2FS_GOING_DOWN_NOSYNC:
 		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN);
-		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
 		break;
 	case F2FS_GOING_DOWN_METAFLUSH:
 		f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_META_IO);
 		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN);
-		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
 		break;
 	case F2FS_GOING_DOWN_NEED_FSCK:
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 61c5f9d26018..d455140322a8 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -59,7 +59,7 @@ static int gc_thread_func(void *data)
 		if (gc_th->gc_wake)
 			gc_th->gc_wake = false;
 
-		if (try_to_freeze()) {
+		if (try_to_freeze() || f2fs_readonly(sbi->sb)) {
 			stat_other_skip_bggc_count(sbi);
 			continue;
 		}
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index bd1dad523796..834c6f099c95 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1596,6 +1596,9 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
 	trace_f2fs_writepage(page, NODE);
 
 	if (unlikely(f2fs_cp_error(sbi))) {
+		/* keep node pages in remount-ro mode */
+		if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_READONLY)
+			goto redirty_out;
 		ClearPageUptodate(page);
 		dec_page_count(sbi, F2FS_DIRTY_NODES);
 		unlock_page(page);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9f15b03037db..51812f459581 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -164,6 +164,7 @@ enum {
 	Opt_discard_unit,
 	Opt_memory_mode,
 	Opt_age_extent_cache,
+	Opt_errors,
 	Opt_err,
 };
 
@@ -243,6 +244,7 @@ static match_table_t f2fs_tokens = {
 	{Opt_discard_unit, "discard_unit=%s"},
 	{Opt_memory_mode, "memory=%s"},
 	{Opt_age_extent_cache, "age_extent_cache"},
+	{Opt_errors, "errors=%s"},
 	{Opt_err, NULL},
 };
 
@@ -1268,6 +1270,25 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		case Opt_age_extent_cache:
 			set_opt(sbi, AGE_EXTENT_CACHE);
 			break;
+		case Opt_errors:
+			name = match_strdup(&args[0]);
+			if (!name)
+				return -ENOMEM;
+			if (!strcmp(name, "remount-ro")) {
+				F2FS_OPTION(sbi).errors =
+						MOUNT_ERRORS_READONLY;
+			} else if (!strcmp(name, "continue")) {
+				F2FS_OPTION(sbi).errors =
+						MOUNT_ERRORS_CONTINUE;
+			} else if (!strcmp(name, "panic")) {
+				F2FS_OPTION(sbi).errors =
+						MOUNT_ERRORS_PANIC;
+			} else {
+				kfree(name);
+				return -EINVAL;
+			}
+			kfree(name);
+			break;
 		default:
 			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
 				 p);
@@ -1622,6 +1643,9 @@ static void f2fs_put_super(struct super_block *sb)
 	f2fs_destroy_node_manager(sbi);
 	f2fs_destroy_segment_manager(sbi);
 
+	/* flush s_error_work before sbi destroy */
+	flush_work(&sbi->s_error_work);
+
 	f2fs_destroy_post_read_wq(sbi);
 
 	kvfree(sbi->ckpt);
@@ -2052,6 +2076,13 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 	else if (F2FS_OPTION(sbi).memory_mode == MEMORY_MODE_LOW)
 		seq_printf(seq, ",memory=%s", "low");
 
+	if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_READONLY)
+		seq_printf(seq, ",errors=%s", "remount-ro");
+	else if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_CONTINUE)
+		seq_printf(seq, ",errors=%s", "continue");
+	else if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_PANIC)
+		seq_printf(seq, ",errors=%s", "panic");
+
 	return 0;
 }
 
@@ -2080,6 +2111,7 @@ static void default_options(struct f2fs_sb_info *sbi)
 	}
 	F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_ON;
 	F2FS_OPTION(sbi).memory_mode = MEMORY_MODE_NORMAL;
+	F2FS_OPTION(sbi).errors = MOUNT_ERRORS_CONTINUE;
 
 	sbi->sb->s_flags &= ~SB_INLINECRYPT;
 
@@ -2281,6 +2313,9 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	if (err)
 		goto restore_opts;
 
+	/* flush outstanding errors before changing fs state */
+	flush_work(&sbi->s_error_work);
+
 	/*
 	 * Previous and new state of filesystem is RO,
 	 * so skip checking GC and FLUSH_MERGE conditions.
@@ -3926,45 +3961,60 @@ int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover)
 	return err;
 }
 
-void f2fs_handle_stop(struct f2fs_sb_info *sbi, unsigned char reason)
+static void save_stop_reason(struct f2fs_sb_info *sbi, unsigned char reason)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&sbi->error_lock, flags);
+	if (sbi->stop_reason[reason] < GENMASK(BITS_PER_BYTE - 1, 0))
+		sbi->stop_reason[reason]++;
+	spin_unlock_irqrestore(&sbi->error_lock, flags);
+}
+
+static void f2fs_record_stop_reason(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
+	unsigned long flags;
 	int err;
 
 	f2fs_down_write(&sbi->sb_lock);
 
-	if (raw_super->s_stop_reason[reason] < GENMASK(BITS_PER_BYTE - 1, 0))
-		raw_super->s_stop_reason[reason]++;
+	spin_lock_irqsave(&sbi->error_lock, flags);
+	memcpy(raw_super->s_stop_reason, sbi->stop_reason, MAX_STOP_REASON);
+	spin_unlock_irqrestore(&sbi->error_lock, flags);
 
 	err = f2fs_commit_super(sbi, false);
-	if (err)
-		f2fs_err(sbi, "f2fs_commit_super fails to record reason:%u err:%d",
-								reason, err);
+
 	f2fs_up_write(&sbi->sb_lock);
+	if (err)
+		f2fs_err(sbi, "f2fs_commit_super fails to record err:%d", err);
 }
 
 void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag)
 {
-	spin_lock(&sbi->error_lock);
+	unsigned long flags;
+
+	spin_lock_irqsave(&sbi->error_lock, flags);
 	if (!test_bit(flag, (unsigned long *)sbi->errors)) {
 		set_bit(flag, (unsigned long *)sbi->errors);
 		sbi->error_dirty = true;
 	}
-	spin_unlock(&sbi->error_lock);
+	spin_unlock_irqrestore(&sbi->error_lock, flags);
 }
 
 static bool f2fs_update_errors(struct f2fs_sb_info *sbi)
 {
+	unsigned long flags;
 	bool need_update = false;
 
-	spin_lock(&sbi->error_lock);
+	spin_lock_irqsave(&sbi->error_lock, flags);
 	if (sbi->error_dirty) {
 		memcpy(F2FS_RAW_SUPER(sbi)->s_errors, sbi->errors,
 							MAX_F2FS_ERRORS);
 		sbi->error_dirty = false;
 		need_update = true;
 	}
-	spin_unlock(&sbi->error_lock);
+	spin_unlock_irqrestore(&sbi->error_lock, flags);
 
 	return need_update;
 }
@@ -3988,6 +4038,66 @@ void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error)
 	f2fs_up_write(&sbi->sb_lock);
 }
 
+static bool system_going_down(void)
+{
+	return system_state == SYSTEM_HALT || system_state == SYSTEM_POWER_OFF
+		|| system_state == SYSTEM_RESTART;
+}
+
+void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason,
+							bool irq_context)
+{
+	struct super_block *sb = sbi->sb;
+	bool shutdown = reason == STOP_CP_REASON_SHUTDOWN;
+	bool continue_fs = !shutdown &&
+			F2FS_OPTION(sbi).errors == MOUNT_ERRORS_CONTINUE;
+
+	set_ckpt_flags(sbi, CP_ERROR_FLAG);
+
+	if (!f2fs_hw_is_readonly(sbi)) {
+		save_stop_reason(sbi, reason);
+
+		if (irq_context && !shutdown)
+			schedule_work(&sbi->s_error_work);
+		else
+			f2fs_record_stop_reason(sbi);
+	}
+
+	/*
+	 * We force ERRORS_RO behavior when system is rebooting. Otherwise we
+	 * could panic during 'reboot -f' as the underlying device got already
+	 * disabled.
+	 */
+	if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_PANIC &&
+				!shutdown && !system_going_down() &&
+				!is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN))
+		panic("F2FS-fs (device %s): panic forced after error\n",
+							sb->s_id);
+
+	if (shutdown)
+		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
+
+	/* continue filesystem operators if errors=continue */
+	if (continue_fs || f2fs_readonly(sb))
+		return;
+
+	f2fs_warn(sbi, "Remounting filesystem read-only");
+	/*
+	 * Make sure updated value of ->s_mount_flags will be visible before
+	 * ->s_flags update
+	 */
+	smp_wmb();
+	sb->s_flags |= SB_RDONLY;
+}
+
+static void f2fs_record_error_work(struct work_struct *work)
+{
+	struct f2fs_sb_info *sbi = container_of(work,
+					struct f2fs_sb_info, s_error_work);
+
+	f2fs_record_stop_reason(sbi);
+}
+
 static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
@@ -4218,7 +4328,9 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	sb->s_fs_info = sbi;
 	sbi->raw_super = raw_super;
 
+	INIT_WORK(&sbi->s_error_work, f2fs_record_error_work);
 	memcpy(sbi->errors, raw_super->s_errors, MAX_F2FS_ERRORS);
+	memcpy(sbi->stop_reason, raw_super->s_stop_reason, MAX_STOP_REASON);
 
 	/* precompute checksum seed for metadata */
 	if (f2fs_sb_has_inode_chksum(sbi))
@@ -4615,6 +4727,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	f2fs_destroy_segment_manager(sbi);
 stop_ckpt_thread:
 	f2fs_stop_ckpt_thread(sbi);
+	/* flush s_error_work before sbi destroy */
+	flush_work(&sbi->s_error_work);
 	f2fs_destroy_post_read_wq(sbi);
 free_devices:
 	destroy_device_list(sbi);
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
