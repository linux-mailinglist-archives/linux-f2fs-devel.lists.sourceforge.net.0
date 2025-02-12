Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9204AA31C1E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Feb 2025 03:35:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ti2bG-0001Ib-SY;
	Wed, 12 Feb 2025 02:35:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ti2bF-0001IV-JE
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Feb 2025 02:35:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lssEXlBGNxUue7nC9yvbVWDDJr1O0j/03QzkGqLjF/Y=; b=ctC5F8evV9AL5oJruUa2sCAHju
 7Wgx7NmyyhfA7nAfdP7lJE2FOg2xG0WeJPoK9o7Bf2r+WAwLO6AgJDBIMmCmqXHu4qwCW9vEdB1hT
 1JOKSV8GMEU1N3MeWYTpCwZ2JN9AonAQ9OLHcSGj1Put1g2mtqbpcOJi1U/9Mnc8HlMA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lssEXlBGNxUue7nC9yvbVWDDJr1O0j/03QzkGqLjF/Y=; b=MfQX041TNtiMo//1F1n2lJ7hVj
 ovfjru7LBcrMg6hOubOzrDJpBCA/hsVNAJilYXtuPTQrm96GSXaHEkI4VZLPV/AGgdwp4eRT++VXj
 AoS6kqidsBlwQUOlkeZRAUhbdwBuqmimuVLWzDEEaqyAnTC0IBVa1wsbTfydJM554whg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ti2bE-0000Mw-Mm for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Feb 2025 02:35:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B489F5C5752
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Feb 2025 02:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB5CC4CEDD;
 Wed, 12 Feb 2025 02:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739327730;
 bh=523usukJQiQ4zNcD63qCVaINbRFHn+sdeIQlaijqliQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YkKnt5vvGa/xIPlVfKDMouO+DK9lMgbn5SFP0stiRCTSMFckyKCgBEAz6A1AfAiu7
 JVSAQBZbtnrIrHeos5jVEkdK1sFL37wBrqLPVXxzJebsGx+k3hQYFvzthsp61kxeMK
 g/T32gFkgIm4luPXvKPcmF/7DO4IT/r20ZjE51zdvyr2z6o7pBhhbwDKfXoPiZpVKk
 dOPUU7pgy8R8RlZkB4lI6MytmpotL07AWneL8xhg6ggYzog2ApVjBO31HTELfbVFMG
 lSzfc2DggZ59WbB48BP/KsIRj8+hiT25bTARBnzvikGWWrCdl96EiE/ergZ2cg9NOr
 v0R9xtuAcabZQ==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 12 Feb 2025 02:31:56 +0000
Message-ID: <20250212023518.897942-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
In-Reply-To: <20250212023518.897942-1-jaegeuk@kernel.org>
References: <20250212023518.897942-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -6.7 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch records POSIX_FADV_NOREUSE ranges for users to
 reclaim the caches instantly off from LRU. Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 --- fs/f2fs/debug.c | 3 +++ fs/f2fs/f2fs.h | 12 +++++++++- fs/f2fs/file.c
 | 60 ++++++++++++++++++++++++++++++++++++++++++++----- fs/f2fs/inode.c |
 14 ++ [...] 
 Content analysis details:   (-6.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ti2bE-0000Mw-Mm
Subject: [f2fs-dev] [PATCH 1/2] f2fs: keep POSIX_FADV_NOREUSE ranges
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch records POSIX_FADV_NOREUSE ranges for users to reclaim the caches
instantly off from LRU.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/debug.c |  3 +++
 fs/f2fs/f2fs.h  | 12 +++++++++-
 fs/f2fs/file.c  | 60 ++++++++++++++++++++++++++++++++++++++++++++-----
 fs/f2fs/inode.c | 14 ++++++++++++
 fs/f2fs/super.c |  1 +
 5 files changed, 84 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 468828288a4a..16c2dfb4f595 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -164,6 +164,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 	si->ndirty_imeta = get_pages(sbi, F2FS_DIRTY_IMETA);
 	si->ndirty_dirs = sbi->ndirty_inode[DIR_INODE];
 	si->ndirty_files = sbi->ndirty_inode[FILE_INODE];
+	si->ndonate_files = sbi->donate_files;
 	si->nquota_files = sbi->nquota_files;
 	si->ndirty_all = sbi->ndirty_inode[DIRTY_META];
 	si->aw_cnt = atomic_read(&sbi->atomic_files);
@@ -501,6 +502,8 @@ static int stat_show(struct seq_file *s, void *v)
 			   si->compr_inode, si->compr_blocks);
 		seq_printf(s, "  - Swapfile Inode: %u\n",
 			   si->swapfile_inode);
+		seq_printf(s, "  - Donate Inode: %u\n",
+			   si->ndonate_files);
 		seq_printf(s, "  - Orphan/Append/Update Inode: %u, %u, %u\n",
 			   si->orphans, si->append, si->update);
 		seq_printf(s, "\nMain area: %d segs, %d secs %d zones\n",
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 395f9d37449c..3abcb84a0d47 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -850,6 +850,11 @@ struct f2fs_inode_info {
 #endif
 	struct list_head dirty_list;	/* dirty list for dirs and files */
 	struct list_head gdirty_list;	/* linked in global dirty list */
+
+	/* linked in global inode list for cache donation */
+	struct list_head gdonate_list;
+	pgoff_t donate_start, donate_end; /* inclusive */
+
 	struct task_struct *atomic_write_task;	/* store atomic write task */
 	struct extent_tree *extent_tree[NR_EXTENT_CACHES];
 					/* cached extent_tree entry */
@@ -1274,6 +1279,7 @@ enum inode_type {
 	DIR_INODE,			/* for dirty dir inode */
 	FILE_INODE,			/* for dirty regular/symlink inode */
 	DIRTY_META,			/* for all dirtied inode metadata */
+	DONATE_INODE,			/* for all inode to donate pages */
 	NR_INODE_TYPE,
 };
 
@@ -1629,6 +1635,9 @@ struct f2fs_sb_info {
 	unsigned int warm_data_age_threshold;
 	unsigned int last_age_weight;
 
+	/* control donate caches */
+	unsigned int donate_files;
+
 	/* basic filesystem units */
 	unsigned int log_sectors_per_block;	/* log2 sectors per block */
 	unsigned int log_blocksize;		/* log2 block size */
@@ -3968,7 +3977,8 @@ struct f2fs_stat_info {
 	unsigned long long allocated_data_blocks;
 	int ndirty_node, ndirty_dent, ndirty_meta, ndirty_imeta;
 	int ndirty_data, ndirty_qdata;
-	unsigned int ndirty_dirs, ndirty_files, nquota_files, ndirty_all;
+	unsigned int ndirty_dirs, ndirty_files, ndirty_all;
+	unsigned int nquota_files, ndonate_files;
 	int nats, dirty_nats, sits, dirty_sits;
 	int free_nids, avail_nids, alloc_nids;
 	int total_count, utilization;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index f2f298c75921..014cb7660a9a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2450,6 +2450,52 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
 	return ret;
 }
 
+static void f2fs_keep_noreuse_range(struct inode *inode,
+				loff_t offset, loff_t len)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	u64 max_bytes = F2FS_BLK_TO_BYTES(max_file_blocks(inode));
+	u64 start, end;
+
+	if (!S_ISREG(inode->i_mode))
+		return;
+
+	if (offset >= max_bytes || len > max_bytes ||
+	    (offset + len) > max_bytes)
+		return;
+
+	start = offset >> PAGE_SHIFT;
+	end = DIV_ROUND_UP(offset + len, PAGE_SIZE);
+
+	inode_lock(inode);
+	if (f2fs_is_atomic_file(inode)) {
+		inode_unlock(inode);
+		return;
+	}
+
+	spin_lock(&sbi->inode_lock[DONATE_INODE]);
+	/* let's remove the range, if len = 0 */
+	if (!len) {
+		if (!list_empty(&F2FS_I(inode)->gdonate_list)) {
+			list_del_init(&F2FS_I(inode)->gdonate_list);
+			sbi->donate_files--;
+		}
+	} else {
+		if (list_empty(&F2FS_I(inode)->gdonate_list)) {
+			list_add_tail(&F2FS_I(inode)->gdonate_list,
+					&sbi->inode_list[DONATE_INODE]);
+			sbi->donate_files++;
+		} else {
+			list_move_tail(&F2FS_I(inode)->gdonate_list,
+					&sbi->inode_list[DONATE_INODE]);
+		}
+		F2FS_I(inode)->donate_start = start;
+		F2FS_I(inode)->donate_end = end - 1;
+	}
+	spin_unlock(&sbi->inode_lock[DONATE_INODE]);
+	inode_unlock(inode);
+}
+
 static int f2fs_ioc_fitrim(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
@@ -5168,12 +5214,16 @@ static int f2fs_file_fadvise(struct file *filp, loff_t offset, loff_t len,
 	}
 
 	err = generic_fadvise(filp, offset, len, advice);
-	if (!err && advice == POSIX_FADV_DONTNEED &&
-		test_opt(F2FS_I_SB(inode), COMPRESS_CACHE) &&
-		f2fs_compressed_file(inode))
-		f2fs_invalidate_compress_pages(F2FS_I_SB(inode), inode->i_ino);
+	if (err)
+		return err;
 
-	return err;
+	if (advice == POSIX_FADV_DONTNEED &&
+	    (test_opt(F2FS_I_SB(inode), COMPRESS_CACHE) &&
+	     f2fs_compressed_file(inode)))
+		f2fs_invalidate_compress_pages(F2FS_I_SB(inode), inode->i_ino);
+	else if (advice == POSIX_FADV_NOREUSE)
+		f2fs_keep_noreuse_range(inode, offset, len);
+	return 0;
 }
 
 #ifdef CONFIG_COMPAT
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 3f03b1c9b7f1..543fb942bec1 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -814,6 +814,19 @@ int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc)
 	return 0;
 }
 
+static void f2fs_remove_donate_inode(struct inode *inode)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+
+	if (list_empty(&F2FS_I(inode)->gdonate_list))
+		return;
+
+	spin_lock(&sbi->inode_lock[DONATE_INODE]);
+	list_del_init(&F2FS_I(inode)->gdonate_list);
+	sbi->donate_files--;
+	spin_unlock(&sbi->inode_lock[DONATE_INODE]);
+}
+
 /*
  * Called at the last iput() if i_nlink is zero
  */
@@ -848,6 +861,7 @@ void f2fs_evict_inode(struct inode *inode)
 
 	f2fs_bug_on(sbi, get_dirty_pages(inode));
 	f2fs_remove_dirty_inode(inode);
+	f2fs_remove_donate_inode(inode);
 
 	if (!IS_DEVICE_ALIASING(inode))
 		f2fs_destroy_extent_tree(inode);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 759b642991d4..f5c69cc2de72 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1441,6 +1441,7 @@ static struct inode *f2fs_alloc_inode(struct super_block *sb)
 	spin_lock_init(&fi->i_size_lock);
 	INIT_LIST_HEAD(&fi->dirty_list);
 	INIT_LIST_HEAD(&fi->gdirty_list);
+	INIT_LIST_HEAD(&fi->gdonate_list);
 	init_f2fs_rwsem(&fi->i_gc_rwsem[READ]);
 	init_f2fs_rwsem(&fi->i_gc_rwsem[WRITE]);
 	init_f2fs_rwsem(&fi->i_xattr_sem);
-- 
2.48.1.601.g30ceb7b040-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
