Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA51496EA39
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Sep 2024 08:27:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1smSRc-0007Q3-Ux;
	Fri, 06 Sep 2024 06:27:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1smSRa-0007Pu-Mz
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Sep 2024 06:27:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mTtvfNGeD5mfifNg0xY6Hvv0brv6czMhhFE2XNte9wg=; b=IsbwuOlVW5BEVs5L7Z1sUGIbGv
 5Ktc7nAkLagUZ0JGpJaR8sdYGKY0lHWbogcHobm2AyoJMfXWZB4+DivQLWJghKPrunGELU+BdW3Dc
 9K/vX04+v1Rdjf8ptnSAoB3sA+OB952rUgTmVEtz21L4dLAWMz30yjxwVUtV+ZjRlb38=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mTtvfNGeD5mfifNg0xY6Hvv0brv6czMhhFE2XNte9wg=; b=P
 8KUvVeB0YjgU6hJS2Kvpb77yvvhfnERwgcEREv+BJhmpuab6Gcw5BAn0BCqMXu1QyWbunaJ5M6Eav
 RdvzVIpOoZ5W/Tn8Y8VhkmuNG3Sxvv2IU0Xa7DozdVdJj+5mztiY70VXpdEuQ5SR2vhWxoQDj5oyZ
 f8BK/5sGX/3IcTw8=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1smSRZ-0001uE-6f for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Sep 2024 06:27:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 281F3A44770;
 Fri,  6 Sep 2024 06:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6FBDC4CEC4;
 Fri,  6 Sep 2024 06:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725604055;
 bh=CoOEbAggfh217kPkgbX+dUxoPywR5THB11oX8gQOwn0=;
 h=From:To:Cc:Subject:Date:From;
 b=m7HyKsMP2mz1QuP8pcPdn/42CA7vIDxMS7lJ8vcfC01QI2qv/5aUckVrz4TIU8+Tq
 KpfcsSiPq6ELZwpNkX0myT27UejgnRWIKmSLp8r9hwIjbrXM7MiXeVEchlJ7PP/V0a
 A7ojDtYJpIvKc+pW8/em9g5udzdTnkyY7hxdF6My3gv8Pq8tdu+CJ3tO2eIicf4ZS2
 jZie67R7B3crV5eRiBHhGmntbMEPiFgCwm9jHcLRVrfmaBzU09ZtEjZ77x5mFMcUFv
 it2U62Fuy5rOW50Jbid3Ov+SCiztnqQsiK3/qEvAxzNwA09TOCWagpOCj4h9Px2qb5
 UlJ0rVg4FE3iQ==
To: jaegeuk@kernel.org
Date: Fri,  6 Sep 2024 14:27:24 +0800
Message-Id: <20240906062724.3569496-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot reports a f2fs bug as below: kernel BUG at
 fs/f2fs/inode.c:896!
 RIP: 0010:f2fs_evict_inode+0x1598/0x15c0 fs/f2fs/inode.c:896 Call Trace:
 evict+0x532/0x950 fs/inode.c:704 dispose_list fs/inode.c:747 [inline]
 evict_inodes+0x5f9/0x6 [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1smSRZ-0001uE-6f
Subject: [f2fs-dev] [PATCH] f2fs: get rid of online repaire on corrupted
 directory
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
Cc: syzbot+ebea2790904673d7c618@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

syzbot reports a f2fs bug as below:

kernel BUG at fs/f2fs/inode.c:896!
RIP: 0010:f2fs_evict_inode+0x1598/0x15c0 fs/f2fs/inode.c:896
Call Trace:
 evict+0x532/0x950 fs/inode.c:704
 dispose_list fs/inode.c:747 [inline]
 evict_inodes+0x5f9/0x690 fs/inode.c:797
 generic_shutdown_super+0x9d/0x2d0 fs/super.c:627
 kill_block_super+0x44/0x90 fs/super.c:1696
 kill_f2fs_super+0x344/0x690 fs/f2fs/super.c:4898
 deactivate_locked_super+0xc4/0x130 fs/super.c:473
 cleanup_mnt+0x41f/0x4b0 fs/namespace.c:1373
 task_work_run+0x24f/0x310 kernel/task_work.c:228
 ptrace_notify+0x2d2/0x380 kernel/signal.c:2402
 ptrace_report_syscall include/linux/ptrace.h:415 [inline]
 ptrace_report_syscall_exit include/linux/ptrace.h:477 [inline]
 syscall_exit_work+0xc6/0x190 kernel/entry/common.c:173
 syscall_exit_to_user_mode_prepare kernel/entry/common.c:200 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:205 [inline]
 syscall_exit_to_user_mode+0x279/0x370 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0010:f2fs_evict_inode+0x1598/0x15c0 fs/f2fs/inode.c:896

Online repaire on corrupted directory in f2fs_lookup() can generate
dirty data/meta while racing w/ readonly remount, it may leave dirty
inode after filesystem becomes readonly, however, checkpoint() will
skips flushing dirty inode in a state of readonly mode, result in
above panic.

Let's get rid of online repaire in f2fs_lookup(), and leave the work
to fsck.f2fs.

Fixes: 510022a85839 ("f2fs: add F2FS_INLINE_DOTS to recover missing dot dentries")
Reported-by: syzbot+ebea2790904673d7c618@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/000000000000a7b20f061ff2d56a@google.com
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h          | 11 -------
 fs/f2fs/namei.c         | 68 -----------------------------------------
 include/linux/f2fs_fs.h |  2 +-
 3 files changed, 1 insertion(+), 80 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f280b757c590..729b264b3bab 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -790,7 +790,6 @@ enum {
 	FI_NEED_IPU,		/* used for ipu per file */
 	FI_ATOMIC_FILE,		/* indicate atomic file */
 	FI_DATA_EXIST,		/* indicate data exists */
-	FI_INLINE_DOTS,		/* indicate inline dot dentries */
 	FI_SKIP_WRITES,		/* should skip data page writeback */
 	FI_OPU_WRITE,		/* used for opu per file */
 	FI_DIRTY_FILE,		/* indicate regular/symlink has dirty pages */
@@ -3082,7 +3081,6 @@ static inline void __mark_inode_dirty_flag(struct inode *inode,
 			return;
 		fallthrough;
 	case FI_DATA_EXIST:
-	case FI_INLINE_DOTS:
 	case FI_PIN_FILE:
 	case FI_COMPRESS_RELEASED:
 		f2fs_mark_inode_dirty_sync(inode, true);
@@ -3206,8 +3204,6 @@ static inline void get_inline_info(struct inode *inode, struct f2fs_inode *ri)
 		set_bit(FI_INLINE_DENTRY, fi->flags);
 	if (ri->i_inline & F2FS_DATA_EXIST)
 		set_bit(FI_DATA_EXIST, fi->flags);
-	if (ri->i_inline & F2FS_INLINE_DOTS)
-		set_bit(FI_INLINE_DOTS, fi->flags);
 	if (ri->i_inline & F2FS_EXTRA_ATTR)
 		set_bit(FI_EXTRA_ATTR, fi->flags);
 	if (ri->i_inline & F2FS_PIN_FILE)
@@ -3228,8 +3224,6 @@ static inline void set_raw_inline(struct inode *inode, struct f2fs_inode *ri)
 		ri->i_inline |= F2FS_INLINE_DENTRY;
 	if (is_inode_flag_set(inode, FI_DATA_EXIST))
 		ri->i_inline |= F2FS_DATA_EXIST;
-	if (is_inode_flag_set(inode, FI_INLINE_DOTS))
-		ri->i_inline |= F2FS_INLINE_DOTS;
 	if (is_inode_flag_set(inode, FI_EXTRA_ATTR))
 		ri->i_inline |= F2FS_EXTRA_ATTR;
 	if (is_inode_flag_set(inode, FI_PIN_FILE))
@@ -3310,11 +3304,6 @@ static inline int f2fs_exist_data(struct inode *inode)
 	return is_inode_flag_set(inode, FI_DATA_EXIST);
 }
 
-static inline int f2fs_has_inline_dots(struct inode *inode)
-{
-	return is_inode_flag_set(inode, FI_INLINE_DOTS);
-}
-
 static inline int f2fs_is_mmap_file(struct inode *inode)
 {
 	return is_inode_flag_set(inode, FI_MMAP_FILE);
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 38b4750475db..57d46e1439de 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -457,62 +457,6 @@ struct dentry *f2fs_get_parent(struct dentry *child)
 	return d_obtain_alias(f2fs_iget(child->d_sb, ino));
 }
 
-static int __recover_dot_dentries(struct inode *dir, nid_t pino)
-{
-	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
-	struct qstr dot = QSTR_INIT(".", 1);
-	struct f2fs_dir_entry *de;
-	struct page *page;
-	int err = 0;
-
-	if (f2fs_readonly(sbi->sb)) {
-		f2fs_info(sbi, "skip recovering inline_dots inode (ino:%lu, pino:%u) in readonly mountpoint",
-			  dir->i_ino, pino);
-		return 0;
-	}
-
-	if (!S_ISDIR(dir->i_mode)) {
-		f2fs_err(sbi, "inconsistent inode status, skip recovering inline_dots inode (ino:%lu, i_mode:%u, pino:%u)",
-			  dir->i_ino, dir->i_mode, pino);
-		set_sbi_flag(sbi, SBI_NEED_FSCK);
-		return -ENOTDIR;
-	}
-
-	err = f2fs_dquot_initialize(dir);
-	if (err)
-		return err;
-
-	f2fs_balance_fs(sbi, true);
-
-	f2fs_lock_op(sbi);
-
-	de = f2fs_find_entry(dir, &dot, &page);
-	if (de) {
-		f2fs_put_page(page, 0);
-	} else if (IS_ERR(page)) {
-		err = PTR_ERR(page);
-		goto out;
-	} else {
-		err = f2fs_do_add_link(dir, &dot, NULL, dir->i_ino, S_IFDIR);
-		if (err)
-			goto out;
-	}
-
-	de = f2fs_find_entry(dir, &dotdot_name, &page);
-	if (de)
-		f2fs_put_page(page, 0);
-	else if (IS_ERR(page))
-		err = PTR_ERR(page);
-	else
-		err = f2fs_do_add_link(dir, &dotdot_name, NULL, pino, S_IFDIR);
-out:
-	if (!err)
-		clear_inode_flag(dir, FI_INLINE_DOTS);
-
-	f2fs_unlock_op(sbi);
-	return err;
-}
-
 static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 		unsigned int flags)
 {
@@ -522,7 +466,6 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 	struct dentry *new;
 	nid_t ino = -1;
 	int err = 0;
-	unsigned int root_ino = F2FS_ROOT_INO(F2FS_I_SB(dir));
 	struct f2fs_filename fname;
 
 	trace_f2fs_lookup_start(dir, dentry, flags);
@@ -558,17 +501,6 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 		goto out;
 	}
 
-	if ((dir->i_ino == root_ino) && f2fs_has_inline_dots(dir)) {
-		err = __recover_dot_dentries(dir, root_ino);
-		if (err)
-			goto out_iput;
-	}
-
-	if (f2fs_has_inline_dots(inode)) {
-		err = __recover_dot_dentries(inode, dir->i_ino);
-		if (err)
-			goto out_iput;
-	}
 	if (IS_ENCRYPTED(dir) &&
 	    (S_ISDIR(inode->i_mode) || S_ISLNK(inode->i_mode)) &&
 	    !fscrypt_has_permitted_context(dir, inode)) {
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index f17f89a259e2..b0b821edfd97 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -278,7 +278,7 @@ struct node_footer {
 #define F2FS_INLINE_DATA	0x02	/* file inline data flag */
 #define F2FS_INLINE_DENTRY	0x04	/* file inline dentry flag */
 #define F2FS_DATA_EXIST		0x08	/* file inline data exist flag */
-#define F2FS_INLINE_DOTS	0x10	/* file having implicit dot dentries */
+#define F2FS_INLINE_DOTS	0x10	/* file having implicit dot dentries (obsolete) */
 #define F2FS_EXTRA_ATTR		0x20	/* file having extra attribute */
 #define F2FS_PIN_FILE		0x40	/* file should not be gced */
 #define F2FS_COMPRESS_RELEASED	0x80	/* file released compressed blocks */
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
