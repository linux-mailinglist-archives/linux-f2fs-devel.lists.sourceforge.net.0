Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC6661E25B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  6 Nov 2022 14:28:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1orfgw-00013S-SX;
	Sun, 06 Nov 2022 13:28:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1orfgv-00013B-SO
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 06 Nov 2022 13:28:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nlnquIysZyS21B/UaI/yv+8YIK3GLFtdjRILHmZx9tg=; b=BONEw4nSwNj7UbzBuShXSsYLnj
 aeqiChC/RdYZ8MezslzxmzNkbRGA4R2FPGHUY2CZmKMN/T/IaOJdjffTXTz2lF/4P0dd454wdhvU8
 2HOTOw2hYYKETm1s6ns1HLxTxQ3MEho5DUE4i3Xm2QdpIVvd9o9KLqTpHmL8QxBILnwg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nlnquIysZyS21B/UaI/yv+8YIK3GLFtdjRILHmZx9tg=; b=R
 3BxE2CCXsiVY7Wn3fFa+iQPLwUK6xlWG4Y9HUcCkCiBnW6ZkE5aygjRfjsYyEJiU1tq8tv/dTURTi
 U6idPKTHqbR8mkg53VKF7Exnw95svDOMvWYvjJqXZ2dNAM58IkhKtMRJH286bdYbKePgffc4LtPO9
 AGZHwAxsObD7hLBY=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1orfgu-00E7ZI-MG for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 06 Nov 2022 13:28:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6EA88B80B35;
 Sun,  6 Nov 2022 13:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F1EC433C1;
 Sun,  6 Nov 2022 13:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667741272;
 bh=fL3Sd0+DJPdbCS+2ZcretOJMS9J/D3idIpK3MNizBZk=;
 h=From:To:Cc:Subject:Date:From;
 b=DbJ0eMW/sQ5Es8ZCq/NEkuwXb23TRE4u7J3iSDeEK8GzUIF/kZ9tBfdyBT0fnCYTK
 F5MeD3eAlo7+zcZsjL96dtp/20gk6i1gf885/ZZ66uAh/RslmNg1Z9iSn05viX5Ggs
 Xh08jvYUlUna5NT3N09PRxLaKbbs37FgcAcNOcjOwI0EfDWbu5aiD8LoXxhckvCGLW
 8DcsqFQqgD2EupaBqGR7wXdCDqF63BYAspZK0CnM1VZoDu6MSnUqjq0bVdLF0fQ4PJ
 3eZJkBHLUNc72vY8EW+yKI6sDhMAfwaIOwF1rhQ4qEGxoyfzupgv+vFo76R1Qdzm/8
 vpQ4iJwIA9gBA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun,  6 Nov 2022 21:27:48 +0800
Message-Id: <20221106132748.134306-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch supports errors=remount-ro|continue|panic mount
 option. Signed-off-by: Chao Yu <chao@kernel.org> Signed-off-by: Yangtao Li
 <frank.li@vivo.com> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- v6:
 - rebase the code Documentation/filesystems/f2fs.rst | 4 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1orfgu-00E7ZI-MG
Subject: [f2fs-dev] [PATCH v6] f2fs: support
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
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
v6:
- rebase the code
 Documentation/filesystems/f2fs.rst |   4 +
 fs/f2fs/checkpoint.c               |   7 +-
 fs/f2fs/f2fs.h                     |  18 +++-
 fs/f2fs/file.c                     |   5 --
 fs/f2fs/gc.c                       |   2 +-
 fs/f2fs/super.c                    | 135 ++++++++++++++++++++++++++---
 6 files changed, 147 insertions(+), 24 deletions(-)

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
index 56f7d0d6a8b2..913cea4ebea4 100644
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
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 04ef4cce3d7f..af9e114d03a6 100644
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
@@ -1381,7 +1382,11 @@ enum {
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
@@ -1818,7 +1823,13 @@ struct f2fs_sb_info {
 
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
 
@@ -3563,7 +3574,8 @@ int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly);
 int f2fs_quota_sync(struct super_block *sb, int type);
 loff_t max_file_blocks(struct inode *inode);
 void f2fs_quota_off_umount(struct super_block *sb);
-void f2fs_handle_stop(struct f2fs_sb_info *sbi, unsigned char reason);
+void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason,
+							bool irq_context);
 void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error);
 int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover);
 int f2fs_sync_fs(struct super_block *sb, int sync);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index c605a4f2bce2..9df5fac57666 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2197,7 +2197,6 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
 				ret = 0;
 				f2fs_stop_checkpoint(sbi, false,
 						STOP_CP_REASON_SHUTDOWN);
-				set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
 				trace_f2fs_shutdown(sbi, in, ret);
 			}
 			return ret;
@@ -2210,7 +2209,6 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
 		if (ret)
 			goto out;
 		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN);
-		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
 		thaw_bdev(sb->s_bdev);
 		break;
 	case F2FS_GOING_DOWN_METASYNC:
@@ -2219,16 +2217,13 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
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
index 6466db75af5d..72f165048a3c 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -59,7 +59,7 @@ static int gc_thread_func(void *data)
 		if (gc_th->gc_wake)
 			gc_th->gc_wake = 0;
 
-		if (try_to_freeze()) {
+		if (try_to_freeze() || f2fs_readonly(sbi->sb)) {
 			stat_other_skip_bggc_count(sbi);
 			continue;
 		}
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index afa6f9155bed..3e06b2acc73a 100644
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
@@ -3863,45 +3898,60 @@ int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover)
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
@@ -3925,6 +3975,67 @@ void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error)
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
@@ -4205,8 +4316,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	if (err)
 		goto free_bio_info;
 
+	INIT_WORK(&sbi->s_error_work, f2fs_record_error_work);
 	spin_lock_init(&sbi->error_lock);
 	memcpy(sbi->errors, raw_super->s_errors, MAX_F2FS_ERRORS);
+	memcpy(sbi->stop_reason, raw_super->s_stop_reason, MAX_STOP_REASON);
 
 	init_f2fs_rwsem(&sbi->cp_rwsem);
 	init_f2fs_rwsem(&sbi->quota_sem);
@@ -4542,6 +4655,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
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
