Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2BFA2D31D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  8 Feb 2025 03:34:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tgafW-00081k-FT;
	Sat, 08 Feb 2025 02:34:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tgafV-00081b-Ry
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 08 Feb 2025 02:34:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aRby4BOJP2lJ+3i41v2VSlHGWFe9HJfIV9e+Oh8lhfU=; b=CT7pbW2KoYPC2PMg8zW74g1Pet
 p88fu84Mt3CxhrZtm5cKF0Ok4kuBWdUcfv394dqIaI8/mP45jGr+cWKTqjcFpsCljpgXXX2JjZwzS
 XWK8zn4XUbhDVv+LAi0zzjrAfN+PyRprXqebwUVN/gEPVCw9twn8Q9rym03i4tNWxxlo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=aRby4BOJP2lJ+3i41v2VSlHGWFe9HJfIV9e+Oh8lhfU=; b=E
 2hPNtr57YYgadeOKSC9dT14f4VWctT59MdOiXTQ5UDZRI/dDcHKFVddSWCGvHromRReajy1i6GIE1
 s9rj/a+40VcyS5tsqNXsiM/XnbmmjStsv7jRycTdFU0DSqbnoQSoe+/Ruiu4YO0x/ck/HWRHf2XNz
 HDX1CQZnjdMWnFC4=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tgafU-0005Mk-6x for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 08 Feb 2025 02:34:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9EA04A43E07
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  8 Feb 2025 02:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 981A7C4CED1;
 Sat,  8 Feb 2025 02:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738982032;
 bh=ZUvBqpJF9KmOEeD31WrhpF+5Q/MBZlgRg9bUED/47fM=;
 h=From:To:Cc:Subject:Date:From;
 b=uMFoMM3nBniA7lAxhXVq/bxRAFHqYxPS504JHiiHqfMbOmE0w08z+CMsc/Z+FO9YH
 4jnYAmWhLv0+8zdFg1PVM2fkSp5N2Gtiivm5MThoX6wTOXVbdrWGQlwU+mEusbGi7G
 JZB+ns7WVSxo4ktcXCx/Oaf+aEjZ/X2RHryrTfBZWRi1KsqkhnI8ZTOHi9qOZXOQ9w
 L6BouwStXSYR2OCxvh6DjUB8Tj9Psayi/f/PKk0JMzBKcl4KRzB23EM9bTMUM8GdtN
 fqmSG/PWgPt/A+dcB7iQWD9c3IU4ZsT8m+10tzJPVzMkwPYft1cLDvoUc3f7nP1y7i
 ALYg1OGRnttkQ==
To: jaegeuk@kernel.org
Date: Sat,  8 Feb 2025 10:33:21 +0800
Message-ID: <20250208023321.3736348-1-chao@kernel.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: F2FS-fs (dm-59): checkpoint=enable has some unwritten data.
 [ cut here ] WARNING: CPU: 6 PID: 8013 at fs/quota/dquot.c:691
 dquot_writeback_dquots+0x2fc/0x308
 pc : dquot_writeback_dquots+0x2fc/0x308 lr : f2fs_quota_sync+0xcc/0x1c4 Call
 t [...] Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tgafU-0005Mk-6x
Subject: [f2fs-dev] [PATCH v3] f2fs: quota: fix to avoid warning in
 dquot_writeback_dquots()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

F2FS-fs (dm-59): checkpoint=enable has some unwritten data.

------------[ cut here ]------------
WARNING: CPU: 6 PID: 8013 at fs/quota/dquot.c:691 dquot_writeback_dquots+0x2fc/0x308
pc : dquot_writeback_dquots+0x2fc/0x308
lr : f2fs_quota_sync+0xcc/0x1c4
Call trace:
dquot_writeback_dquots+0x2fc/0x308
f2fs_quota_sync+0xcc/0x1c4
f2fs_write_checkpoint+0x3d4/0x9b0
f2fs_issue_checkpoint+0x1bc/0x2c0
f2fs_sync_fs+0x54/0x150
f2fs_do_sync_file+0x2f8/0x814
__f2fs_ioctl+0x1960/0x3244
f2fs_ioctl+0x54/0xe0
__arm64_sys_ioctl+0xa8/0xe4
invoke_syscall+0x58/0x114

checkpoint and f2fs_remount may race as below, resulting triggering warning
in dquot_writeback_dquots().

atomic write                                    remount
                                                - do_remount
                                                 - down_write(&sb->s_umount);
                                                  - f2fs_remount
- ioctl
 - f2fs_do_sync_file
  - f2fs_sync_fs
   - f2fs_write_checkpoint
    - block_operations
     - locked = down_read_trylock(&sbi->sb->s_umount)
       : fail to lock due to the write lock was held by remount
                                                 - up_write(&sb->s_umount);
     - f2fs_quota_sync
      - dquot_writeback_dquots
       - WARN_ON_ONCE(!rwsem_is_locked(&sb->s_umount))
       : trigger warning because s_umount lock was unlocked by remount

If checkpoint comes from mount/umount/remount/freeze/quotactl, caller of
checkpoint has already held s_umount lock, calling dquot_writeback_dquots()
in the context should be safe.

So let's record task to sbi->umount_lock_holder, so that checkpoint can
know whether the lock has held in the context or not by checking current
w/ it.

In addition, in order to not misrepresent caller of checkpoint, we should
not allow to trigger async checkpoint for those callers: mount/umount/remount/
freeze/quotactl.

Fixes: af033b2aa8a8 ("f2fs: guarantee journalled quota data by checkpoint")
Signed-off-by: Chao Yu <chao@kernel.org>
---
v3:
- fix wrong name of exported function.
 fs/f2fs/checkpoint.c | 15 ++++++----
 fs/f2fs/f2fs.h       |  3 +-
 fs/f2fs/super.c      | 65 ++++++++++++++++++++++++++++++++++----------
 3 files changed, 61 insertions(+), 22 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index efda9a022981..bd890738b94d 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1237,7 +1237,7 @@ static int block_operations(struct f2fs_sb_info *sbi)
 retry_flush_quotas:
 	f2fs_lock_all(sbi);
 	if (__need_flush_quota(sbi)) {
-		int locked;
+		bool need_lock = sbi->umount_lock_holder != current;
 
 		if (++cnt > DEFAULT_RETRY_QUOTA_FLUSH_COUNT) {
 			set_sbi_flag(sbi, SBI_QUOTA_SKIP_FLUSH);
@@ -1246,11 +1246,13 @@ static int block_operations(struct f2fs_sb_info *sbi)
 		}
 		f2fs_unlock_all(sbi);
 
-		/* only failed during mount/umount/freeze/quotactl */
-		locked = down_read_trylock(&sbi->sb->s_umount);
-		f2fs_quota_sync(sbi->sb, -1);
-		if (locked)
+		/* don't grab s_umount lock during mount/umount/remount/freeze/quotactl */
+		if (!need_lock) {
+			f2fs_do_quota_sync(sbi->sb, -1);
+		} else if (down_read_trylock(&sbi->sb->s_umount)) {
+			f2fs_do_quota_sync(sbi->sb, -1);
 			up_read(&sbi->sb->s_umount);
+		}
 		cond_resched();
 		goto retry_flush_quotas;
 	}
@@ -1867,7 +1869,8 @@ int f2fs_issue_checkpoint(struct f2fs_sb_info *sbi)
 	struct cp_control cpc;
 
 	cpc.reason = __get_cp_reason(sbi);
-	if (!test_opt(sbi, MERGE_CHECKPOINT) || cpc.reason != CP_SYNC) {
+	if (!test_opt(sbi, MERGE_CHECKPOINT) || cpc.reason != CP_SYNC ||
+		sbi->umount_lock_holder == current) {
 		int ret;
 
 		f2fs_down_write(&sbi->gc_lock);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 59470ac485f2..05879c6dc4d6 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1669,6 +1669,7 @@ struct f2fs_sb_info {
 
 	unsigned int nquota_files;		/* # of quota sysfile */
 	struct f2fs_rwsem quota_sem;		/* blocking cp for flags */
+	struct task_struct *umount_lock_holder;	/* s_umount lock holder */
 
 	/* # of pages, see count_type */
 	atomic_t nr_pages[NR_COUNT_TYPE];
@@ -3634,7 +3635,7 @@ int f2fs_inode_dirtied(struct inode *inode, bool sync);
 void f2fs_inode_synced(struct inode *inode);
 int f2fs_dquot_initialize(struct inode *inode);
 int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly);
-int f2fs_quota_sync(struct super_block *sb, int type);
+int f2fs_do_quota_sync(struct super_block *sb, int type);
 loff_t max_file_blocks(struct inode *inode);
 void f2fs_quota_off_umount(struct super_block *sb);
 void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 24ded06c8980..ab8e57a9097e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1738,22 +1738,28 @@ int f2fs_sync_fs(struct super_block *sb, int sync)
 
 static int f2fs_freeze(struct super_block *sb)
 {
+	struct f2fs_sb_info *sbi = F2FS_SB(sb);
+
 	if (f2fs_readonly(sb))
 		return 0;
 
 	/* IO error happened before */
-	if (unlikely(f2fs_cp_error(F2FS_SB(sb))))
+	if (unlikely(f2fs_cp_error(sbi)))
 		return -EIO;
 
 	/* must be clean, since sync_filesystem() was already called */
-	if (is_sbi_flag_set(F2FS_SB(sb), SBI_IS_DIRTY))
+	if (is_sbi_flag_set(sbi, SBI_IS_DIRTY))
 		return -EINVAL;
 
+	sbi->umount_lock_holder = current;
+
 	/* Let's flush checkpoints and stop the thread. */
-	f2fs_flush_ckpt_thread(F2FS_SB(sb));
+	f2fs_flush_ckpt_thread(sbi);
+
+	sbi->umount_lock_holder = NULL;
 
 	/* to avoid deadlock on f2fs_evict_inode->SB_FREEZE_FS */
-	set_sbi_flag(F2FS_SB(sb), SBI_IS_FREEZING);
+	set_sbi_flag(sbi, SBI_IS_FREEZING);
 	return 0;
 }
 
@@ -2330,6 +2336,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	org_mount_opt = sbi->mount_opt;
 	old_sb_flags = sb->s_flags;
 
+	sbi->umount_lock_holder = current;
+
 #ifdef CONFIG_QUOTA
 	org_mount_opt.s_jquota_fmt = F2FS_OPTION(sbi).s_jquota_fmt;
 	for (i = 0; i < MAXQUOTAS; i++) {
@@ -2553,6 +2561,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 
 	limit_reserve_root(sbi);
 	*flags = (*flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYTIME);
+
+	sbi->umount_lock_holder = NULL;
 	return 0;
 restore_checkpoint:
 	if (need_enable_checkpoint) {
@@ -2593,6 +2603,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 #endif
 	sbi->mount_opt = org_mount_opt;
 	sb->s_flags = old_sb_flags;
+
+	sbi->umount_lock_holder = NULL;
 	return err;
 }
 
@@ -2909,7 +2921,7 @@ static int f2fs_quota_sync_file(struct f2fs_sb_info *sbi, int type)
 	return ret;
 }
 
-int f2fs_quota_sync(struct super_block *sb, int type)
+int f2fs_do_quota_sync(struct super_block *sb, int type)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 	struct quota_info *dqopt = sb_dqopt(sb);
@@ -2957,11 +2969,21 @@ int f2fs_quota_sync(struct super_block *sb, int type)
 	return ret;
 }
 
+static int f2fs_quota_sync(struct super_block *sb, int type)
+{
+	int ret;
+
+	F2FS_SB(sb)->umount_lock_holder = current;
+	ret = f2fs_do_quota_sync(sb, type);
+	F2FS_SB(sb)->umount_lock_holder = NULL;
+	return ret;
+}
+
 static int f2fs_quota_on(struct super_block *sb, int type, int format_id,
 							const struct path *path)
 {
 	struct inode *inode;
-	int err;
+	int err = 0;
 
 	/* if quota sysfile exists, deny enabling quota with specific file */
 	if (f2fs_sb_has_quota_ino(F2FS_SB(sb))) {
@@ -2972,31 +2994,34 @@ static int f2fs_quota_on(struct super_block *sb, int type, int format_id,
 	if (path->dentry->d_sb != sb)
 		return -EXDEV;
 
-	err = f2fs_quota_sync(sb, type);
+	F2FS_SB(sb)->umount_lock_holder = current;
+
+	err = f2fs_do_quota_sync(sb, type);
 	if (err)
-		return err;
+		goto out;
 
 	inode = d_inode(path->dentry);
 
 	err = filemap_fdatawrite(inode->i_mapping);
 	if (err)
-		return err;
+		goto out;
 
 	err = filemap_fdatawait(inode->i_mapping);
 	if (err)
-		return err;
+		goto out;
 
 	err = dquot_quota_on(sb, type, format_id, path);
 	if (err)
-		return err;
+		goto out;
 
 	inode_lock(inode);
 	F2FS_I(inode)->i_flags |= F2FS_QUOTA_DEFAULT_FL;
 	f2fs_set_inode_flags(inode);
 	inode_unlock(inode);
 	f2fs_mark_inode_dirty_sync(inode, false);
-
-	return 0;
+out:
+	F2FS_SB(sb)->umount_lock_holder = NULL;
+	return err;
 }
 
 static int __f2fs_quota_off(struct super_block *sb, int type)
@@ -3007,7 +3032,7 @@ static int __f2fs_quota_off(struct super_block *sb, int type)
 	if (!inode || !igrab(inode))
 		return dquot_quota_off(sb, type);
 
-	err = f2fs_quota_sync(sb, type);
+	err = f2fs_do_quota_sync(sb, type);
 	if (err)
 		goto out_put;
 
@@ -3030,6 +3055,8 @@ static int f2fs_quota_off(struct super_block *sb, int type)
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 	int err;
 
+	F2FS_SB(sb)->umount_lock_holder = current;
+
 	err = __f2fs_quota_off(sb, type);
 
 	/*
@@ -3039,6 +3066,9 @@ static int f2fs_quota_off(struct super_block *sb, int type)
 	 */
 	if (is_journalled_quota(sbi))
 		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
+
+	F2FS_SB(sb)->umount_lock_holder = NULL;
+
 	return err;
 }
 
@@ -3171,7 +3201,7 @@ int f2fs_dquot_initialize(struct inode *inode)
 	return 0;
 }
 
-int f2fs_quota_sync(struct super_block *sb, int type)
+int f2fs_do_quota_sync(struct super_block *sb, int type)
 {
 	return 0;
 }
@@ -4704,6 +4734,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	if (err)
 		goto free_compress_inode;
 
+	sbi->umount_lock_holder = current;
 #ifdef CONFIG_QUOTA
 	/* Enable quota usage during mount */
 	if (f2fs_sb_has_quota_ino(sbi) && !f2fs_readonly(sb)) {
@@ -4830,6 +4861,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	f2fs_update_time(sbi, CP_TIME);
 	f2fs_update_time(sbi, REQ_TIME);
 	clear_sbi_flag(sbi, SBI_CP_DISABLED_QUICK);
+
+	sbi->umount_lock_holder = NULL;
 	return 0;
 
 sync_free_meta:
@@ -4932,6 +4965,8 @@ static void kill_f2fs_super(struct super_block *sb)
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 
 	if (sb->s_root) {
+		sbi->umount_lock_holder = current;
+
 		set_sbi_flag(sbi, SBI_IS_CLOSE);
 		f2fs_stop_gc_thread(sbi);
 		f2fs_stop_discard_thread(sbi);
-- 
2.48.1.502.g6dc24dfdaf-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
