Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC0AA144CB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Jan 2025 23:52:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tYYik-0007Jj-69;
	Thu, 16 Jan 2025 22:52:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tYYiZ-0007IW-4V
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Jan 2025 22:52:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wSSXarR5BrsPemiA7t4mnmF13CNHUzq+yaYimrGzAls=; b=UkD1/pSuZvM21kX2TS3GtG0s3n
 iJZFa/Nk3y5+4W/trxy/Una8dvpO59kTKIk6Vi0x/8oPoMZBSF/Fkl1qT9vtQYAusTpFJy3Sh7DPv
 nMXO4+9xp8uolsiw2vwA6YbhZpfKRTxsb5Yug8f2euEZC5pdDU3BaN6I5emXQqgc+Au8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wSSXarR5BrsPemiA7t4mnmF13CNHUzq+yaYimrGzAls=; b=O32PLFhSrRHbexZwSt7ta5qHVI
 63lC3eeTLwcYhTGCCrcAb1soJarngd659N8NAPXPd/CGn4kTJYDAW6fxIWDJyKO6TRluwA8O4O2MT
 wSyM3MrNMy6mlXgLq+SAz1tPohvvx8ebgVCO/hl1OdERqzmWSs67uS6F3+K+onKT50Xk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tYYiV-0000MM-8u for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Jan 2025 22:52:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1FB455C5FFD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Jan 2025 22:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74D46C4CEDD;
 Thu, 16 Jan 2025 22:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737067908;
 bh=1Mt+kwV2/qznO/9hwXpVL9elohxVZTXjZVZDaTcZu38=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hk0Cr9tpWbDLgteBq5sbYoZCn27UZ/0ZrrouD4yw8LIEwyV/cINQRCFuC9wOxjzwT
 xC4KMTdVNJJ60HONYF5qO0ZMk+fXIk6vmjpDdnpH+SyqKbmH8TtCFTv6KTJLobg+tu
 RJZEdEPfMnV2h6Oe7Dbe8uZ2+RyhlKIX8bHKG6KvFTWtYcCzbZckpzaEIGShX0gUM4
 ZXsr50zZ7Jzs1by9tiSZ6RseTb28sR8bGhzpqKQOXEnAeB+mFA9+ZW02CESjNbQ1xO
 ++KNDsASrtAWMbPQpboFDeqYifsSPaOQe3FiNKPARWEKbOeDJflKLVDrV205sJ4GSj
 Wt5w48tHlTdkA==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 16 Jan 2025 22:51:06 +0000
Message-ID: <20250116225143.2208852-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
In-Reply-To: <20250116225143.2208852-1-jaegeuk@kernel.org>
References: <20250116225143.2208852-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch introduces an inode list to keep the page cache
 ranges that users can donate pages together. #define F2FS_IOC_DONATE_RANGE
 _IOW(F2FS_IOCTL_MAGIC, 27, \ struct f2fs_donate_range) struct f2fs_donate_range
 { __u64 start; __u64 len; }; 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tYYiV-0000MM-8u
Subject: [f2fs-dev] [PATCH 1/2] f2fs: register inodes which is able to
 donate pages
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

This patch introduces an inode list to keep the page cache ranges that users
can donate pages together.

 #define F2FS_IOC_DONATE_RANGE		_IOW(F2FS_IOCTL_MAGIC, 27,	\
						struct f2fs_donate_range)
 struct f2fs_donate_range {
	__u64 start;
	__u64 len;
 };

e.g., ioctl(F2FS_IOC_DONATE_RANGE, &range);

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/debug.c           |  3 ++
 fs/f2fs/f2fs.h            | 12 +++++++-
 fs/f2fs/file.c            | 65 +++++++++++++++++++++++++++++++++++++++
 fs/f2fs/inode.c           | 14 +++++++++
 fs/f2fs/super.c           |  1 +
 include/uapi/linux/f2fs.h |  7 +++++
 6 files changed, 101 insertions(+), 1 deletion(-)

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
index 4bfe162eefd3..951fbc3f94c7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -850,6 +850,11 @@ struct f2fs_inode_info {
 #endif
 	struct list_head dirty_list;	/* dirty list for dirs and files */
 	struct list_head gdirty_list;	/* linked in global dirty list */
+
+	/* linked in global inode list for cache donation */
+	struct list_head gdonate_list;
+	loff_t donate_start, donate_end; /* inclusive */
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
@@ -3984,7 +3993,8 @@ struct f2fs_stat_info {
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
index 3e06fea9795c..6572970a988a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2450,6 +2450,68 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
 	return ret;
 }
 
+static int f2fs_ioc_donate_range(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+	struct mnt_idmap *idmap = file_mnt_idmap(filp);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_donate_range range;
+	u64 max_pages = F2FS_BLK_TO_BYTES(max_file_blocks(inode)) >> PAGE_SHIFT;
+	u64 start, end;
+	int ret;
+
+	if (copy_from_user(&range, (struct f2fs_donate_range __user *)arg,
+							sizeof(range)))
+		return -EFAULT;
+
+	if (!inode_owner_or_capable(idmap, inode))
+		return -EACCES;
+
+	if (!S_ISREG(inode->i_mode))
+		return -EINVAL;
+
+	if (range.start >= max_pages || range.len > max_pages ||
+	    (range.start + range.len) > max_pages)
+		return -EINVAL;
+
+	start = range.start >> PAGE_SHIFT;
+	end = DIV_ROUND_UP(range.start + range.len, PAGE_SIZE);
+
+	ret = mnt_want_write_file(filp);
+	if (ret)
+		return ret;
+
+	inode_lock(inode);
+
+	if (f2fs_is_atomic_file(inode))
+		goto out;
+
+	spin_lock(&sbi->inode_lock[DONATE_INODE]);
+	/* let's remove the range, if len = 0 */
+	if (!range.len) {
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
+out:
+	inode_unlock(inode);
+	mnt_drop_write_file(filp);
+	return ret;
+}
+
 static int f2fs_ioc_fitrim(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
@@ -4479,6 +4541,8 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return -EOPNOTSUPP;
 	case F2FS_IOC_SHUTDOWN:
 		return f2fs_ioc_shutdown(filp, arg);
+	case F2FS_IOC_DONATE_RANGE:
+		return f2fs_ioc_donate_range(filp, arg);
 	case FITRIM:
 		return f2fs_ioc_fitrim(filp, arg);
 	case FS_IOC_SET_ENCRYPTION_POLICY:
@@ -5230,6 +5294,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_RELEASE_VOLATILE_WRITE:
 	case F2FS_IOC_ABORT_ATOMIC_WRITE:
 	case F2FS_IOC_SHUTDOWN:
+	case F2FS_IOC_DONATE_RANGE:
 	case FITRIM:
 	case FS_IOC_SET_ENCRYPTION_POLICY:
 	case FS_IOC_GET_ENCRYPTION_PWSALT:
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 7de33da8b3ea..f9fc58f313f2 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -804,6 +804,19 @@ int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc)
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
@@ -838,6 +851,7 @@ void f2fs_evict_inode(struct inode *inode)
 
 	f2fs_bug_on(sbi, get_dirty_pages(inode));
 	f2fs_remove_dirty_inode(inode);
+	f2fs_remove_donate_inode(inode);
 
 	if (!IS_DEVICE_ALIASING(inode))
 		f2fs_destroy_extent_tree(inode);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index fc7d463dee15..ef639a6d82e5 100644
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
diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
index f7aaf8d23e20..cd38a7c166e6 100644
--- a/include/uapi/linux/f2fs.h
+++ b/include/uapi/linux/f2fs.h
@@ -44,6 +44,8 @@
 #define F2FS_IOC_COMPRESS_FILE		_IO(F2FS_IOCTL_MAGIC, 24)
 #define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
 #define F2FS_IOC_GET_DEV_ALIAS_FILE	_IOR(F2FS_IOCTL_MAGIC, 26, __u32)
+#define F2FS_IOC_DONATE_RANGE		_IOW(F2FS_IOCTL_MAGIC, 27,	\
+						struct f2fs_donate_range)
 
 /*
  * should be same as XFS_IOC_GOINGDOWN.
@@ -97,4 +99,9 @@ struct f2fs_comp_option {
 	__u8 log_cluster_size;
 };
 
+struct f2fs_donate_range {
+	__u64 start;
+	__u64 len;
+};
+
 #endif /* _UAPI_LINUX_F2FS_H */
-- 
2.48.0.rc2.279.g1de40edade-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
