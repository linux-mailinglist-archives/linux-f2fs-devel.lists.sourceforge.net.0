Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B6949A10D79
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jan 2025 18:21:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tXkbA-0001tp-CY;
	Tue, 14 Jan 2025 17:21:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tXkb8-0001tX-8m
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Jan 2025 17:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p11fs2li5+Mli+O1cqv890VLjcus4ckggUlZz0dziZ4=; b=bXhJo4WIVmajKQnAHvk+bhX1Dx
 Q3wIk24JGQH400o+WlD+ZZCtSvGAo7kXGUJFJIZL+PjXELB0nhiIvOD6+bATHD/EHT79nTRtrGSD5
 Mn42c+EytalfDqA3jQ1XIoedSMlSoN4qy5mbf9QBcI7gNne4iBbAJRI2Dheqc9CTgZcE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p11fs2li5+Mli+O1cqv890VLjcus4ckggUlZz0dziZ4=; b=g9f0G5qHmopEQYIbBLxMBTE6io
 e9SbO8EQzrbGGdY/Jn5SxSu4KZfhIkaPpf0gFXxqdiR0FRZ2XKdZjf05WREJ/4pVU0yBJZGW8p6ww
 iU6W6YOrQ6xIyrDudo2ZoqLM5fiFnXNDf5+VskFT7MR07FiY1Dq0yr+HzXVa3shPi+RQ=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tXkb7-0002ew-6h for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Jan 2025 17:21:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5902AA41799
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Jan 2025 17:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFFCEC4CEDD;
 Tue, 14 Jan 2025 17:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736875250;
 bh=ukBLs4KeKi/tNLDqWghIgDAoZGLd6TAZi6SkOoH8l+o=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=U1KDOzrHs63ovwBEr9oFU6uJDi2fuQqgjB5TnIKsjoxydjhjtQsOGaozMJlAd/5sA
 nOODsW5PWz5FTYpeSUfgtxMeM+sprySJSUhsRwKFEjek7OKmFqeYwZDLevUC65FpQ/
 EGJzS9dEV/ZkOIMIFb63Eex1f6TFuhGRrJPi/XXVwiAbVFGzhjyEU/fb8XCn1XuQQD
 ciTJnE2p1/gmYUwqah0+HIcxDWsH9flPtDs6aksMw72RTm38VvUi++5q5NUjTmTSHc
 3UNCDnQ/rGaB4+yFcjfV+k7OrxbUOZFRrrQ3m2l1rx5orkVTvxiqnAR6q+gcXRxuEx
 5c/IKixwSmPJQ==
Date: Tue, 14 Jan 2025 17:20:48 +0000
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <Z4ac8Kvz0BlMbd7C@google.com>
References: <20250113183933.1268282-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250113183933.1268282-1-jaegeuk@kernel.org>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch introduces an inode list to keep the page cache
 ranges that users can donate pages together. #define F2FS_IOC_DONATE_RANGE
 _IOW(F2FS_IOCTL_MAGIC, 27, \ struct f2fs_donate_range) struct f2fs_donate_range
 { __u64 start; __u64 len; }; 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tXkb7-0002ew-6h
Subject: Re: [f2fs-dev] [PATCH 1/2 v2] f2fs: register inodes which is able
 to donate pages
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

 Change log from v1:
  - change %u print format
  - check range boundary

 fs/f2fs/debug.c           |  3 +++
 fs/f2fs/f2fs.h            |  9 ++++++-
 fs/f2fs/file.c            | 52 +++++++++++++++++++++++++++++++++++++++
 fs/f2fs/inode.c           | 14 +++++++++++
 fs/f2fs/super.c           |  1 +
 include/uapi/linux/f2fs.h |  7 ++++++
 6 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 468828288a4a..f7aea4dc9565 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -164,6 +164,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 	si->ndirty_imeta = get_pages(sbi, F2FS_DIRTY_IMETA);
 	si->ndirty_dirs = sbi->ndirty_inode[DIR_INODE];
 	si->ndirty_files = sbi->ndirty_inode[FILE_INODE];
+	si->ndonate_files = sbi->ndirty_inode[DONATE_INODE];
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
index 4bfe162eefd3..7ce3e3eab17a 100644
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
 
@@ -3984,7 +3990,8 @@ struct f2fs_stat_info {
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
index 9980d17ef9f5..eb44999bb079 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2493,6 +2493,55 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
 	return ret;
 }
 
+static int f2fs_ioc_donate_range(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+	struct mnt_idmap *idmap = file_mnt_idmap(filp);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_donate_range range;
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
+	if (unlikely((range.start + range.len) >> PAGE_SHIFT >
+					max_file_blocks(inode)))
+		return -EINVAL;
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
+	if (list_empty(&F2FS_I(inode)->gdonate_list)) {
+		list_add_tail(&F2FS_I(inode)->gdonate_list,
+				&sbi->inode_list[DONATE_INODE]);
+		stat_inc_dirty_inode(sbi, DONATE_INODE);
+	} else {
+		list_move_tail(&F2FS_I(inode)->gdonate_list,
+				&sbi->inode_list[DONATE_INODE]);
+	}
+	F2FS_I(inode)->donate_start = range.start;
+	F2FS_I(inode)->donate_end = range.start + range.len - 1;
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
@@ -4522,6 +4571,8 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return -EOPNOTSUPP;
 	case F2FS_IOC_SHUTDOWN:
 		return f2fs_ioc_shutdown(filp, arg);
+	case F2FS_IOC_DONATE_RANGE:
+		return f2fs_ioc_donate_range(filp, arg);
 	case FITRIM:
 		return f2fs_ioc_fitrim(filp, arg);
 	case FS_IOC_SET_ENCRYPTION_POLICY:
@@ -5273,6 +5324,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_RELEASE_VOLATILE_WRITE:
 	case F2FS_IOC_ABORT_ATOMIC_WRITE:
 	case F2FS_IOC_SHUTDOWN:
+	case F2FS_IOC_DONATE_RANGE:
 	case FITRIM:
 	case FS_IOC_SET_ENCRYPTION_POLICY:
 	case FS_IOC_GET_ENCRYPTION_PWSALT:
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 7de33da8b3ea..e38dc5fe2f2e 100644
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
+	stat_dec_dirty_inode(sbi, DONATE_INODE);
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
2.47.1.688.g23fc6f90ad-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
