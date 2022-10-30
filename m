Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5D061273C
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 30 Oct 2022 04:51:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oozLv-0004Jp-0A;
	Sun, 30 Oct 2022 03:51:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oozLu-0004Jj-1K
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 30 Oct 2022 03:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xf5hkRlzfsU+tMBu9Uh8mKMO/51z9+Y96kKZIxaQHA8=; b=TC3hcD/crXM0PGzA6hK7vqc77h
 gW759tVPrOhEyCq1yuCyNDKacDHuF/p1otObiFMUcnzAx/fMbLKOMl1kEQWvGrcZLHMBKsuKFE02h
 TDoupfWVRkyrnnYmzd0OrQ/cG++lEyGBBmmElbbtvIVxRql+Q/ASmXpPUIxCfbq3q3II=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xf5hkRlzfsU+tMBu9Uh8mKMO/51z9+Y96kKZIxaQHA8=; b=d
 iqJGgL9PMGMrj66WzrpeqeYQ/54qqPDMGgWFmET6BXNOJRvwt4atGJx7MpzAUqSgaSZR4w895kWNr
 q/aVASPZEMQVaOJZjqxRVt50kO7DUaiS0twJmf8xdp5u+Oc4gMbc+yEUrz003nxw44nl75rE60HAS
 cLrVJWVMmNRV629k=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oozLo-0000O2-SS for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 30 Oct 2022 03:51:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 65D89B80C69;
 Sun, 30 Oct 2022 03:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64EC1C433D6;
 Sun, 30 Oct 2022 03:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667101852;
 bh=Pk8/QGOchZy6T20CMeMgam5/Uwhdcai1BuY2rKXhu+0=;
 h=From:To:Cc:Subject:Date:From;
 b=jYqii6mlhT5INhnCNdA4fScXELhRR96pqKoOG8zSgTMOn+R6HsJjo8GHkciN/kqVi
 Ma/kQZ5BMmi0YeAtkIgB2arorxfwd6XoMR9cxhJCQLnr6HcIoUjAnVndLJrv+BYRde
 6aJbfBLPcNyq07edJsBMS4DfBSFAM491DAuqn5Y9p7d2Lakl0TD3RQKsgLZf9pVjWH
 nmqNYOfLjSaAqrcDsLSnO3bCOMCPqVQ3mncq1EK3buDDH9TWDqHztalB8Dm2PeY++M
 pr83vNatXY9xcUnDwm5zlUi/d/CTO6BZkk+f04kmr94heQAWoZkGZAwebqj+lMb2In
 A1ISPeYTcX+1A==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 30 Oct 2022 11:50:46 +0800
Message-Id: <20221030035046.1254368-1-chao@kernel.org>
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
 option. Signed-off-by: Chao Yu <chao@kernel.org> Signed-off-by: Yangtao Li
 <frank.li@vivo.com> --- v4: Yangtao: - rename flush_error_work() to
 f2fs_record_error_work()
 for better debug in backtrace - stop flu [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oozLo-0000O2-SS
Subject: [f2fs-dev] [PATCH v4] f2fs: support
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

This patch supports errors=remount-ro|continue|panic mount option.

Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v4:
Yangtao:
- rename flush_error_work() to f2fs_record_error_work() for better
debug in backtrace
- stop flush thread in f2fs_handle_critical_error()
Jaegeuk:
- do not stop threads in irq context
Chao
- call flush_work() to flush s_error_work before sbi destroy
- use spin_lock_irqsave() in irq context
 Documentation/filesystems/f2fs.rst |   4 +
 fs/f2fs/checkpoint.c               |  17 +++-
 fs/f2fs/f2fs.h                     |  20 +++-
 fs/f2fs/file.c                     |   5 -
 fs/f2fs/segment.c                  |  10 +-
 fs/f2fs/super.c                    | 148 ++++++++++++++++++++++++++---
 6 files changed, 175 insertions(+), 29 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 6e67c5e6c7c3..1d73bc91b9ae 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -343,6 +343,10 @@ memory=%s		 Control memory mode. This supports "normal" and "low" modes.
 			 Because of the nature of low memory devices, in this mode, f2fs
 			 will try to save memory sometimes by sacrificing performance.
 			 "normal" mode is the default mode and same as before.
+errors=%s		 Specify f2fs behavior on critical errors. This supports modes:
+			 "panic", "continue" and "remount-ro", respectively, trigger
+			 panic immediately, continue without doing anything, and remount
+			 the partition in read-only mode (default behavior).
 ======================== ============================================================
 
 Debugfs Entries
diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 56f7d0d6a8b2..ea098e1161ee 100644
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
@@ -1924,6 +1921,16 @@ void f2fs_stop_ckpt_thread(struct f2fs_sb_info *sbi)
 	ckpt_task = cprc->f2fs_issue_ckpt;
 	cprc->f2fs_issue_ckpt = NULL;
 	kthread_stop(ckpt_task);
+}
+
+void f2fs_destroy_ckpt_thread(struct f2fs_sb_info *sbi)
+{
+	struct ckpt_req_control *cprc = &sbi->cprc_info;
+
+	if (!cprc->f2fs_issue_ckpt)
+		return;
+
+	f2fs_stop_ckpt_thread(sbi);
 
 	f2fs_flush_ckpt_thread(sbi);
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 7c054a3e419d..ca1f99f6bcc7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -161,6 +161,7 @@ struct f2fs_mount_info {
 	int fs_mode;			/* fs mode: LFS or ADAPTIVE */
 	int bggc_mode;			/* bggc mode: off, on or sync */
 	int memory_mode;		/* memory mode */
+	int errors;			/* errors parameter */
 	int discard_unit;		/*
 					 * discard command's offset/size should
 					 * be aligned to this unit: block,
@@ -1384,7 +1385,11 @@ enum {
 	MEMORY_MODE_LOW,	/* memory mode for low memry devices */
 };
 
-
+enum errors_option {
+	MOUNT_ERRORS_READONLY,	/* remount fs ro on errors */
+	MOUNT_ERRORS_CONTINUE,	/* continue on errors */
+	MOUNT_ERRORS_PANIC,	/* panic on errors */
+};
 
 static inline int f2fs_test_bit(unsigned int nr, char *addr);
 static inline void f2fs_set_bit(unsigned int nr, char *addr);
@@ -1821,7 +1826,13 @@ struct f2fs_sb_info {
 
 	struct workqueue_struct *post_read_wq;	/* post read workqueue */
 
-	unsigned char errors[MAX_F2FS_ERRORS];	/* error flags */
+	/*
+	 * If we are in irq context, let's update error information into
+	 * on-disk superblock in the work.
+	 */
+	struct work_struct s_error_work;
+	unsigned char errors[MAX_F2FS_ERRORS];		/* error flags */
+	unsigned char stop_reason[MAX_STOP_REASON];	/* stop reason */
 	spinlock_t error_lock;			/* protect errors array */
 	bool error_dirty;			/* errors of sb is dirty */
 
@@ -3572,7 +3583,8 @@ int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly);
 int f2fs_quota_sync(struct super_block *sb, int type);
 loff_t max_file_blocks(struct inode *inode);
 void f2fs_quota_off_umount(struct super_block *sb);
-void f2fs_handle_stop(struct f2fs_sb_info *sbi, unsigned char reason);
+void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason,
+							bool irq_context);
 void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error);
 int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover);
 int f2fs_sync_fs(struct super_block *sb, int sync);
@@ -3719,6 +3731,7 @@ unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
 			unsigned int segno);
 unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
 			unsigned int segno);
+void f2fs_stop_flush_thread(struct f2fs_sb_info *sbi);
 
 #define DEF_FRAGMENT_SIZE	4
 #define MIN_FRAGMENT_SIZE	1
@@ -3776,6 +3789,7 @@ void f2fs_destroy_checkpoint_caches(void);
 int f2fs_issue_checkpoint(struct f2fs_sb_info *sbi);
 int f2fs_start_ckpt_thread(struct f2fs_sb_info *sbi);
 void f2fs_stop_ckpt_thread(struct f2fs_sb_info *sbi);
+void f2fs_destroy_ckpt_thread(struct f2fs_sb_info *sbi);
 void f2fs_init_ckpt_req_control(struct f2fs_sb_info *sbi);
 
 /*
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index c623667ee3ca..aafdf5fbb825 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2207,7 +2207,6 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
 				ret = 0;
 				f2fs_stop_checkpoint(sbi, false,
 						STOP_CP_REASON_SHUTDOWN);
-				set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
 				trace_f2fs_shutdown(sbi, in, ret);
 			}
 			return ret;
@@ -2220,7 +2219,6 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
 		if (ret)
 			goto out;
 		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN);
-		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
 		thaw_bdev(sb->s_bdev);
 		break;
 	case F2FS_GOING_DOWN_METASYNC:
@@ -2229,16 +2227,13 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
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
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 7786351de429..0ba37b66d8d5 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -671,7 +671,7 @@ int f2fs_create_flush_cmd_control(struct f2fs_sb_info *sbi)
 	return 0;
 }
 
-void f2fs_destroy_flush_cmd_control(struct f2fs_sb_info *sbi, bool free)
+void f2fs_stop_flush_thread(struct f2fs_sb_info *sbi)
 {
 	struct flush_cmd_control *fcc = SM_I(sbi)->fcc_info;
 
@@ -681,8 +681,14 @@ void f2fs_destroy_flush_cmd_control(struct f2fs_sb_info *sbi, bool free)
 		fcc->f2fs_issue_flush = NULL;
 		kthread_stop(flush_thread);
 	}
+}
+
+void f2fs_destroy_flush_cmd_control(struct f2fs_sb_info *sbi, bool free)
+{
+	f2fs_stop_flush_thread(sbi);
+
 	if (free) {
-		kfree(fcc);
+		kfree(SM_I(sbi)->fcc_info);
 		SM_I(sbi)->fcc_info = NULL;
 	}
 }
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 5fc800444f86..4199ff3a89ab 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -163,6 +163,7 @@ enum {
 	Opt_nogc_merge,
 	Opt_discard_unit,
 	Opt_memory_mode,
+	Opt_errors,
 	Opt_err,
 };
 
@@ -241,6 +242,7 @@ static match_table_t f2fs_tokens = {
 	{Opt_nogc_merge, "nogc_merge"},
 	{Opt_discard_unit, "discard_unit=%s"},
 	{Opt_memory_mode, "memory=%s"},
+	{Opt_errors, "errors=%s"},
 	{Opt_err, NULL},
 };
 
@@ -1259,6 +1261,25 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			}
 			kfree(name);
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
@@ -1561,7 +1582,7 @@ static void f2fs_put_super(struct super_block *sb)
 	 * flush all issued checkpoints and stop checkpoint issue thread.
 	 * after then, all checkpoints should be done by each process context.
 	 */
-	f2fs_stop_ckpt_thread(sbi);
+	f2fs_destroy_ckpt_thread(sbi);
 
 	/*
 	 * We don't need to do checkpoint when superblock is clean.
@@ -1621,6 +1642,9 @@ static void f2fs_put_super(struct super_block *sb)
 	f2fs_destroy_node_manager(sbi);
 	f2fs_destroy_segment_manager(sbi);
 
+	/* flush s_error_work before sbi destroy */
+	flush_work(&sbi->s_error_work);
+
 	f2fs_destroy_post_read_wq(sbi);
 
 	kvfree(sbi->ckpt);
@@ -2047,6 +2071,13 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
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
 
@@ -2069,6 +2100,7 @@ static void default_options(struct f2fs_sb_info *sbi)
 	F2FS_OPTION(sbi).compress_mode = COMPR_MODE_FS;
 	F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_ON;
 	F2FS_OPTION(sbi).memory_mode = MEMORY_MODE_NORMAL;
+	F2FS_OPTION(sbi).errors = MOUNT_ERRORS_READONLY;
 
 	sbi->sb->s_flags &= ~SB_INLINECRYPT;
 
@@ -2270,6 +2302,9 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	if (err)
 		goto restore_opts;
 
+	/* flush outstanding errors before changing fs state */
+	flush_work(&sbi->s_error_work);
+
 	/*
 	 * Previous and new state of filesystem is RO,
 	 * so skip checking GC and FLUSH_MERGE conditions.
@@ -2367,7 +2402,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 
 	if ((*flags & SB_RDONLY) || test_opt(sbi, DISABLE_CHECKPOINT) ||
 			!test_opt(sbi, MERGE_CHECKPOINT)) {
-		f2fs_stop_ckpt_thread(sbi);
+		f2fs_destroy_ckpt_thread(sbi);
 		need_restart_ckpt = true;
 	} else {
 		/* Flush if the prevous checkpoint, if exists. */
@@ -2457,7 +2492,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		if (f2fs_start_ckpt_thread(sbi))
 			f2fs_warn(sbi, "background ckpt thread has stopped");
 	} else if (need_stop_ckpt) {
-		f2fs_stop_ckpt_thread(sbi);
+		f2fs_destroy_ckpt_thread(sbi);
 	}
 restore_gc:
 	if (need_restart_gc) {
@@ -3863,45 +3898,65 @@ int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover)
 	return err;
 }
 
-void f2fs_handle_stop(struct f2fs_sb_info *sbi, unsigned char reason)
+static void save_stop_reason(struct f2fs_sb_info *sbi, unsigned char reason)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&sbi->error_lock, flags);
+	if (sbi->stop_reason[reason] < ((1 << BITS_PER_BYTE) - 1))
+		sbi->stop_reason[reason]++;
+	spin_unlock_irqrestore(&sbi->error_lock, flags);
+}
+
+static void f2fs_record_stop_reason(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
+	unsigned long flags;
 	int err;
 
+	f2fs_stop_gc_thread(sbi);
+	f2fs_stop_discard_thread(sbi);
+	f2fs_stop_flush_thread(sbi);
+	f2fs_stop_ckpt_thread(sbi);
+
 	f2fs_down_write(&sbi->sb_lock);
 
-	if (raw_super->s_stop_reason[reason] < ((1 << BITS_PER_BYTE) - 1))
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
 
 static void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag)
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
@@ -3925,6 +3980,67 @@ void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error)
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
+	if (!continue_fs && !f2fs_readonly(sb))
+		set_ckpt_flags(sbi, CP_ERROR_FLAG);
+
+	if (!bdev_read_only(sb->s_bdev)) {
+		save_stop_reason(sbi, reason);
+
+		if (irq_context)
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
@@ -4272,8 +4388,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		goto free_devices;
 	}
 
+	INIT_WORK(&sbi->s_error_work, f2fs_record_error_work);
 	spin_lock_init(&sbi->error_lock);
 	memcpy(sbi->errors, raw_super->s_errors, MAX_F2FS_ERRORS);
+	memcpy(sbi->stop_reason, raw_super->s_stop_reason, MAX_STOP_REASON);
 
 	sbi->total_valid_node_count =
 				le32_to_cpu(sbi->ckpt->valid_node_count);
@@ -4541,7 +4659,9 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 free_sm:
 	f2fs_destroy_segment_manager(sbi);
 stop_ckpt_thread:
-	f2fs_stop_ckpt_thread(sbi);
+	f2fs_destroy_ckpt_thread(sbi);
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
