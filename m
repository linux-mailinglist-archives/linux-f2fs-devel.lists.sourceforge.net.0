Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4417751E1B9
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 May 2022 01:23:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nn7I1-0002wE-Mb; Fri, 06 May 2022 23:23:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nn7I0-0002w8-Kj
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 May 2022 23:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ji5JCkDFjwsf57CGhB2PRt0+tdQOftXI1sB2m4AX3Lg=; b=NUgzyyjK1v7qb+4vVZX3P7dGe1
 xw3T9Qzz0WdtmwMQBqzmQIxTxgwp/LVAaDBCI0gifjj1PLctxzACsrmtrFj5fEMAbuewVtjwDUkaj
 AbQirrPVFDfJdATFgsLf6/yLooqkulMCK7oKxDQAFJS93xBI4ayHKW/vABh4TNk7zm/U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Ji5JCkDFjwsf57CGhB2PRt0+tdQOftXI1sB2m4AX3Lg=; b=G
 BEsZ6NBrQRNq3TAGfJJ9m4xAYegI2aiv0M7rnE+nfQedW+jx77zAOxmTewShN8bWjt7R2AgVDFzxH
 4TU/+HUtuivPr4XdyRrOo8cWuC8M5O+zaa/qvLGGDam+WTXIv85Ht0idQ1O9R141lWJeb1IcuCr1Q
 Ke44vb3qCfmOrxpo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nn7Hy-003dGr-H3
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 May 2022 23:23:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1EA99619F2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  6 May 2022 23:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 781F1C385A9;
 Fri,  6 May 2022 23:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651879384;
 bh=vo5043PSzfcS7GsGaGcTVAsUJxoZIcBgRSYY43iCzdc=;
 h=From:To:Cc:Subject:Date:From;
 b=piVAQ5xZtAgFz/A39pa1ElTPXE+AJsFJg54DWNPBmm3fNG+NW3g/3LIBf0SiGFf+3
 uQqAicY4A5ZowlkxJrW4T+QGJ0XifH8bzIeus41CBTE30fZbMyElybiRRowao5/vyR
 U//6RuRFBDYAk3IGAQ5oBN8DhxqPRyOw+k55aYrlc0jjh0WbJK/8X4auYou9zn1J/1
 2RmCw7Hu1o5F2WaQDB57E+7EMNhFbqrnmwO5AogAfi7OrzaoLvgQ4ep6XaOuUuweFp
 nuJl7fEcZlsvlV090iDxFztzcfUcii/gcjPd3vcLVSEE7tgqSlK+rIYCmLrkexWrVU
 o57aBtLqbyzhg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri,  6 May 2022 16:23:02 -0700
Message-Id: <20220506232302.1264915-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.36.0.512.ge40c2bad7a-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  There's no user,
 since all can use atomic writes simply. Let's
 kill it. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 fs/f2fs/checkpoint.c
 | 4 +- fs/f2fs/data.c | 5 -- fs/f2fs/debug.c | 10 +--- fs/f2fs/f2fs.h | 27
 +--------- fs/f2fs/file.c | 116 ++ [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nn7Hy-003dGr-H3
Subject: [f2fs-dev] [PATCH] f2fs: kill volatile write support
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There's no user, since all can use atomic writes simply.
Let's kill it.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/checkpoint.c |   4 +-
 fs/f2fs/data.c       |   5 --
 fs/f2fs/debug.c      |  10 +---
 fs/f2fs/f2fs.h       |  27 +---------
 fs/f2fs/file.c       | 116 ++-----------------------------------------
 fs/f2fs/segment.c    |   3 +-
 fs/f2fs/verity.c     |   2 +-
 7 files changed, 10 insertions(+), 157 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index beceac9885c3..63ab8c9d674e 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1004,9 +1004,7 @@ static void __add_dirty_inode(struct inode *inode, enum inode_type type)
 		return;
 
 	set_inode_flag(inode, flag);
-	if (!f2fs_is_volatile_file(inode))
-		list_add_tail(&F2FS_I(inode)->dirty_list,
-						&sbi->inode_list[type]);
+	list_add_tail(&F2FS_I(inode)->dirty_list, &sbi->inode_list[type]);
 	stat_inc_dirty_inode(sbi, type);
 }
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 8763a4690aaf..54a7a8ad994d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2741,11 +2741,6 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 write:
 	if (f2fs_is_drop_cache(inode))
 		goto out;
-	/* we should not write 0'th page having journal header */
-	if (f2fs_is_volatile_file(inode) && (!page->index ||
-			(!wbc->for_reclaim &&
-			f2fs_available_free_memory(sbi, BASE_CHECK))))
-		goto redirty_out;
 
 	/* Dentry/quota blocks are controlled by checkpoint */
 	if (S_ISDIR(inode->i_mode) || IS_NOQUOTA(inode)) {
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 65f0bcf498bb..c92625ef16d0 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -92,9 +92,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 	si->nquota_files = sbi->nquota_files;
 	si->ndirty_all = sbi->ndirty_inode[DIRTY_META];
 	si->aw_cnt = sbi->atomic_files;
-	si->vw_cnt = atomic_read(&sbi->vw_cnt);
 	si->max_aw_cnt = atomic_read(&sbi->max_aw_cnt);
-	si->max_vw_cnt = atomic_read(&sbi->max_vw_cnt);
 	si->nr_dio_read = get_pages(sbi, F2FS_DIO_READ);
 	si->nr_dio_write = get_pages(sbi, F2FS_DIO_WRITE);
 	si->nr_wb_cp_data = get_pages(sbi, F2FS_WB_CP_DATA);
@@ -511,10 +509,8 @@ static int stat_show(struct seq_file *s, void *v)
 			   si->flush_list_empty,
 			   si->nr_discarding, si->nr_discarded,
 			   si->nr_discard_cmd, si->undiscard_blks);
-		seq_printf(s, "  - atomic IO: %4d (Max. %4d), "
-			"volatile IO: %4d (Max. %4d)\n",
-			   si->aw_cnt, si->max_aw_cnt,
-			   si->vw_cnt, si->max_vw_cnt);
+		seq_printf(s, "  - atomic IO: %4d (Max. %4d)\n",
+			   si->aw_cnt, si->max_aw_cnt);
 		seq_printf(s, "  - compress: %4d, hit:%8d\n", si->compress_pages, si->compress_page_hit);
 		seq_printf(s, "  - nodes: %4d in %4d\n",
 			   si->ndirty_node, si->node_pages);
@@ -615,9 +611,7 @@ int f2fs_build_stats(struct f2fs_sb_info *sbi)
 	for (i = META_CP; i < META_MAX; i++)
 		atomic_set(&sbi->meta_count[i], 0);
 
-	atomic_set(&sbi->vw_cnt, 0);
 	atomic_set(&sbi->max_aw_cnt, 0);
-	atomic_set(&sbi->max_vw_cnt, 0);
 
 	raw_spin_lock_irqsave(&f2fs_stat_lock, flags);
 	list_add_tail(&si->stat_list, &f2fs_stat_list);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 2787797df576..492af5b96de1 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -737,7 +737,6 @@ enum {
 	FI_UPDATE_WRITE,	/* inode has in-place-update data */
 	FI_NEED_IPU,		/* used for ipu per file */
 	FI_ATOMIC_FILE,		/* indicate atomic file */
-	FI_VOLATILE_FILE,	/* indicate volatile file */
 	FI_FIRST_BLOCK_WRITTEN,	/* indicate #0 data block was written */
 	FI_DROP_CACHE,		/* drop dirty page cache */
 	FI_DATA_EXIST,		/* indicate data exists */
@@ -1747,9 +1746,7 @@ struct f2fs_sb_info {
 	atomic_t inline_dir;			/* # of inline_dentry inodes */
 	atomic_t compr_inode;			/* # of compressed inodes */
 	atomic64_t compr_blocks;		/* # of compressed blocks */
-	atomic_t vw_cnt;			/* # of volatile writes */
 	atomic_t max_aw_cnt;			/* max # of atomic writes */
-	atomic_t max_vw_cnt;			/* max # of volatile writes */
 	unsigned int io_skip_bggc;		/* skip background gc for in-flight IO */
 	unsigned int other_skip_bggc;		/* skip background gc for other reasons */
 	unsigned int ndirty_inode[NR_INODE_TYPE];	/* # of dirty inodes */
@@ -3200,11 +3197,6 @@ static inline bool f2fs_is_atomic_file(struct inode *inode)
 	return is_inode_flag_set(inode, FI_ATOMIC_FILE);
 }
 
-static inline bool f2fs_is_volatile_file(struct inode *inode)
-{
-	return is_inode_flag_set(inode, FI_VOLATILE_FILE);
-}
-
 static inline bool f2fs_is_first_block_written(struct inode *inode)
 {
 	return is_inode_flag_set(inode, FI_FIRST_BLOCK_WRITTEN);
@@ -3823,7 +3815,7 @@ struct f2fs_stat_info {
 	int inline_xattr, inline_inode, inline_dir, append, update, orphans;
 	int compr_inode;
 	unsigned long long compr_blocks;
-	int aw_cnt, max_aw_cnt, vw_cnt, max_vw_cnt;
+	int aw_cnt, max_aw_cnt;
 	unsigned int valid_count, valid_node_count, valid_inode_count, discard_blks;
 	unsigned int bimodal, avg_vblocks;
 	int util_free, util_valid, util_invalid;
@@ -3934,17 +3926,6 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
 		if (cur > max)						\
 			atomic_set(&F2FS_I_SB(inode)->max_aw_cnt, cur);	\
 	} while (0)
-#define stat_inc_volatile_write(inode)					\
-		(atomic_inc(&F2FS_I_SB(inode)->vw_cnt))
-#define stat_dec_volatile_write(inode)					\
-		(atomic_dec(&F2FS_I_SB(inode)->vw_cnt))
-#define stat_update_max_volatile_write(inode)				\
-	do {								\
-		int cur = atomic_read(&F2FS_I_SB(inode)->vw_cnt);	\
-		int max = atomic_read(&F2FS_I_SB(inode)->max_vw_cnt);	\
-		if (cur > max)						\
-			atomic_set(&F2FS_I_SB(inode)->max_vw_cnt, cur);	\
-	} while (0)
 #define stat_inc_seg_count(sbi, type, gc_type)				\
 	do {								\
 		struct f2fs_stat_info *si = F2FS_STAT(sbi);		\
@@ -4006,9 +3987,6 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
 #define stat_add_compr_blocks(inode, blocks)		do { } while (0)
 #define stat_sub_compr_blocks(inode, blocks)		do { } while (0)
 #define stat_update_max_atomic_write(inode)		do { } while (0)
-#define stat_inc_volatile_write(inode)			do { } while (0)
-#define stat_dec_volatile_write(inode)			do { } while (0)
-#define stat_update_max_volatile_write(inode)		do { } while (0)
 #define stat_inc_meta_count(sbi, blkaddr)		do { } while (0)
 #define stat_inc_seg_type(sbi, curseg)			do { } while (0)
 #define stat_inc_block_count(sbi, curseg)		do { } while (0)
@@ -4411,8 +4389,7 @@ static inline bool f2fs_lfs_mode(struct f2fs_sb_info *sbi)
 static inline bool f2fs_may_compress(struct inode *inode)
 {
 	if (IS_SWAPFILE(inode) || f2fs_is_pinned_file(inode) ||
-				f2fs_is_atomic_file(inode) ||
-				f2fs_is_volatile_file(inode))
+				f2fs_is_atomic_file(inode))
 		return false;
 	return S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode);
 }
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index b7d7c609b407..09287876dbb7 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1820,13 +1820,6 @@ static int f2fs_release_file(struct inode *inode, struct file *filp)
 
 	if (f2fs_is_atomic_file(inode))
 		f2fs_abort_atomic_write(inode, true);
-	if (f2fs_is_volatile_file(inode)) {
-		set_inode_flag(inode, FI_DROP_CACHE);
-		filemap_fdatawrite(inode->i_mapping);
-		clear_inode_flag(inode, FI_DROP_CACHE);
-		clear_inode_flag(inode, FI_VOLATILE_FILE);
-		stat_dec_volatile_write(inode);
-	}
 	return 0;
 }
 
@@ -2100,15 +2093,10 @@ static int f2fs_ioc_commit_atomic_write(struct file *filp)
 
 	inode_lock(inode);
 
-	if (f2fs_is_volatile_file(inode)) {
-		ret = -EINVAL;
-		goto err_out;
-	}
-
 	if (f2fs_is_atomic_file(inode)) {
 		ret = f2fs_commit_atomic_write(inode);
 		if (ret)
-			goto err_out;
+			goto unlock_out;
 
 		ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 0, true);
 		if (!ret)
@@ -2116,108 +2104,12 @@ static int f2fs_ioc_commit_atomic_write(struct file *filp)
 	} else {
 		ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 1, false);
 	}
-err_out:
+unlock_out:
 	inode_unlock(inode);
 	mnt_drop_write_file(filp);
 	return ret;
 }
 
-static int f2fs_ioc_start_volatile_write(struct file *filp)
-{
-	struct inode *inode = file_inode(filp);
-	struct user_namespace *mnt_userns = file_mnt_user_ns(filp);
-	int ret;
-
-	if (!inode_owner_or_capable(mnt_userns, inode))
-		return -EACCES;
-
-	if (!S_ISREG(inode->i_mode))
-		return -EINVAL;
-
-	ret = mnt_want_write_file(filp);
-	if (ret)
-		return ret;
-
-	inode_lock(inode);
-
-	if (f2fs_is_volatile_file(inode))
-		goto out;
-
-	ret = f2fs_convert_inline_inode(inode);
-	if (ret)
-		goto out;
-
-	stat_inc_volatile_write(inode);
-	stat_update_max_volatile_write(inode);
-
-	set_inode_flag(inode, FI_VOLATILE_FILE);
-	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
-out:
-	inode_unlock(inode);
-	mnt_drop_write_file(filp);
-	return ret;
-}
-
-static int f2fs_ioc_release_volatile_write(struct file *filp)
-{
-	struct inode *inode = file_inode(filp);
-	struct user_namespace *mnt_userns = file_mnt_user_ns(filp);
-	int ret;
-
-	if (!inode_owner_or_capable(mnt_userns, inode))
-		return -EACCES;
-
-	ret = mnt_want_write_file(filp);
-	if (ret)
-		return ret;
-
-	inode_lock(inode);
-
-	if (!f2fs_is_volatile_file(inode))
-		goto out;
-
-	if (!f2fs_is_first_block_written(inode)) {
-		ret = truncate_partial_data_page(inode, 0, true);
-		goto out;
-	}
-
-	ret = punch_hole(inode, 0, F2FS_BLKSIZE);
-out:
-	inode_unlock(inode);
-	mnt_drop_write_file(filp);
-	return ret;
-}
-
-static int f2fs_ioc_abort_volatile_write(struct file *filp)
-{
-	struct inode *inode = file_inode(filp);
-	struct user_namespace *mnt_userns = file_mnt_user_ns(filp);
-	int ret;
-
-	if (!inode_owner_or_capable(mnt_userns, inode))
-		return -EACCES;
-
-	ret = mnt_want_write_file(filp);
-	if (ret)
-		return ret;
-
-	inode_lock(inode);
-
-	if (f2fs_is_atomic_file(inode))
-		f2fs_abort_atomic_write(inode, true);
-	if (f2fs_is_volatile_file(inode)) {
-		clear_inode_flag(inode, FI_VOLATILE_FILE);
-		stat_dec_volatile_write(inode);
-		ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 0, true);
-	}
-
-	inode_unlock(inode);
-
-	mnt_drop_write_file(filp);
-	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
-	return ret;
-}
-
 static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
@@ -4174,11 +4066,9 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_COMMIT_ATOMIC_WRITE:
 		return f2fs_ioc_commit_atomic_write(filp);
 	case F2FS_IOC_START_VOLATILE_WRITE:
-		return f2fs_ioc_start_volatile_write(filp);
 	case F2FS_IOC_RELEASE_VOLATILE_WRITE:
-		return f2fs_ioc_release_volatile_write(filp);
 	case F2FS_IOC_ABORT_VOLATILE_WRITE:
-		return f2fs_ioc_abort_volatile_write(filp);
+		return -EOPNOTSUPP;
 	case F2FS_IOC_SHUTDOWN:
 		return f2fs_ioc_shutdown(filp, arg);
 	case FITRIM:
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 268f341d8963..0a4180f64291 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3173,8 +3173,7 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
 			return CURSEG_COLD_DATA;
 		if (file_is_hot(inode) ||
 				is_inode_flag_set(inode, FI_HOT_DATA) ||
-				f2fs_is_atomic_file(inode) ||
-				f2fs_is_volatile_file(inode))
+				f2fs_is_atomic_file(inode))
 			return CURSEG_HOT_DATA;
 		return f2fs_rw_hint_to_seg_type(inode->i_write_hint);
 	} else {
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index 3d793202cc9f..5ac7e756a1bb 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -128,7 +128,7 @@ static int f2fs_begin_enable_verity(struct file *filp)
 	if (f2fs_verity_in_progress(inode))
 		return -EBUSY;
 
-	if (f2fs_is_atomic_file(inode) || f2fs_is_volatile_file(inode))
+	if (f2fs_is_atomic_file(inode))
 		return -EOPNOTSUPP;
 
 	/*
-- 
2.36.0.512.ge40c2bad7a-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
