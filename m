Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE34B915D3B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jun 2024 05:16:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sLwfO-0001LA-Q0;
	Tue, 25 Jun 2024 03:16:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sLwfN-0001L3-DW
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 03:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GSu69bhZN3fMlsKaSuBGCV9ehLdyEQQwtY4JPZvZ9pc=; b=NWd37OZ/0r09XFNmOtXOi8POuC
 13rLSjdT9XywTnufa6aTmxzg/QaQyNIGBsNhkuGeJLRaAyGxiW4AMUIce2EX8RH57r98HUlf+gpu+
 ePpQN/K0TtOpp+q2EvhccGonQHDAN/NoX9zlBKoaLIQ3YmFuStcQB4kmkGxuiFxTIRRA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GSu69bhZN3fMlsKaSuBGCV9ehLdyEQQwtY4JPZvZ9pc=; b=m
 Bc08GOe+1u69aFiQl4a6Nfa+V3lWbdjEa1m8uMcPddcr4uZjFPNtSbcf4xJUOB8W0vmaVWUoc033u
 fTlX9XOs9Sm1kK7umcaNyX/Dw05e3yxPCyE9rcg7xhliicKolSsGLatXEvh3yS1cU7c+SpLJZKPJJ
 J3mKOFObYdlkbEWo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sLwfN-0001mN-Ni for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 03:16:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8AE0160F78
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Jun 2024 03:16:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED304C32782;
 Tue, 25 Jun 2024 03:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719285370;
 bh=6Rglquvyxioi6UiW3APlZPWPADnqnzvx28cYgeo8yyc=;
 h=From:To:Cc:Subject:Date:From;
 b=njEzkDX5DdtnE6itvLk3mT/8+u4zNoc1s80CHx98IfSdjCp1qac+N8jvP35e87LC5
 IORpPPYFkPw3W8gqL2zxRReyIgGw+462yvgG2umCrQpaLzEHHDdA7JgUr6R7p8nVCj
 6mWgUox9mAHO7rN752lvt0rnS4DRDhg5etpOmS8qW7soaflm72fmpRQ53F/XXkzDKp
 VItatSlh36LCTret9LUzU9Eao7bd66DCSIDtaBHhD2ooazAnKulki17Jw9njAHmuqH
 zqESEUEyghd1X8uZbfSoH2yEhj6wQl6pvu07B46bxtz9ASdJPUQNef5GLXybEzfYgK
 hfw85jKeTOcSA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 25 Jun 2024 11:16:02 +0800
Message-Id: <20240625031604.3587691-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use temporary variable instead of F2FS_I() for cleanup.
 Signed-off-by:
 Chao Yu <chao@kernel.org> --- fs/f2fs/f2fs.h | 32 ++++++++++ fs/f2fs/file.c
 | 64 ++++++++++++++++++++++++ fs/f2fs/inode.c | 54 +++++++++++++++++------
 [...] Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sLwfN-0001mN-Ni
Subject: [f2fs-dev] [PATCH 1/3] f2fs: clean up F2FS_I()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use temporary variable instead of F2FS_I() for cleanup.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h     | 32 ++++++++++-------------
 fs/f2fs/file.c     | 64 ++++++++++++++++++++++++----------------------
 fs/f2fs/inode.c    | 54 +++++++++++++++++---------------------
 fs/f2fs/namei.c    | 20 ++++++++-------
 fs/f2fs/recovery.c | 11 ++++----
 5 files changed, 88 insertions(+), 93 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 777497919c62..45451ca3b438 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4398,22 +4398,18 @@ static inline int set_compress_context(struct inode *inode)
 {
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_inode_info *fi = F2FS_I(inode);
 
-	F2FS_I(inode)->i_compress_algorithm =
-			F2FS_OPTION(sbi).compress_algorithm;
-	F2FS_I(inode)->i_log_cluster_size =
-			F2FS_OPTION(sbi).compress_log_size;
-	F2FS_I(inode)->i_compress_flag =
-			F2FS_OPTION(sbi).compress_chksum ?
-				BIT(COMPRESS_CHKSUM) : 0;
-	F2FS_I(inode)->i_cluster_size =
-			BIT(F2FS_I(inode)->i_log_cluster_size);
-	if ((F2FS_I(inode)->i_compress_algorithm == COMPRESS_LZ4 ||
-		F2FS_I(inode)->i_compress_algorithm == COMPRESS_ZSTD) &&
+	fi->i_compress_algorithm = F2FS_OPTION(sbi).compress_algorithm;
+	fi->i_log_cluster_size = F2FS_OPTION(sbi).compress_log_size;
+	fi->i_compress_flag = F2FS_OPTION(sbi).compress_chksum ?
+					BIT(COMPRESS_CHKSUM) : 0;
+	fi->i_cluster_size = BIT(fi->i_log_cluster_size);
+	if ((fi->i_compress_algorithm == COMPRESS_LZ4 ||
+		fi->i_compress_algorithm == COMPRESS_ZSTD) &&
 			F2FS_OPTION(sbi).compress_level)
-		F2FS_I(inode)->i_compress_level =
-				F2FS_OPTION(sbi).compress_level;
-	F2FS_I(inode)->i_flags |= F2FS_COMPR_FL;
+		fi->i_compress_level = F2FS_OPTION(sbi).compress_level;
+	fi->i_flags |= F2FS_COMPR_FL;
 	set_inode_flag(inode, FI_COMPRESSED_FILE);
 	stat_inc_compr_inode(inode);
 	inc_compr_inode_stat(inode);
@@ -4428,15 +4424,15 @@ static inline bool f2fs_disable_compressed_file(struct inode *inode)
 {
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 
-	f2fs_down_write(&F2FS_I(inode)->i_sem);
+	f2fs_down_write(&fi->i_sem);
 
 	if (!f2fs_compressed_file(inode)) {
-		f2fs_up_write(&F2FS_I(inode)->i_sem);
+		f2fs_up_write(&fi->i_sem);
 		return true;
 	}
 	if (f2fs_is_mmap_file(inode) ||
 		(S_ISREG(inode->i_mode) && F2FS_HAS_BLOCKS(inode))) {
-		f2fs_up_write(&F2FS_I(inode)->i_sem);
+		f2fs_up_write(&fi->i_sem);
 		return false;
 	}
 
@@ -4445,7 +4441,7 @@ static inline bool f2fs_disable_compressed_file(struct inode *inode)
 	clear_inode_flag(inode, FI_COMPRESSED_FILE);
 	f2fs_mark_inode_dirty_sync(inode, true);
 
-	f2fs_up_write(&F2FS_I(inode)->i_sem);
+	f2fs_up_write(&fi->i_sem);
 	return true;
 }
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 7508c744c157..2203904383a6 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -980,6 +980,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		 struct iattr *attr)
 {
 	struct inode *inode = d_inode(dentry);
+	struct f2fs_inode_info *fi = F2FS_I(inode);
 	int err;
 
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
@@ -998,7 +999,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 			return -EOPNOTSUPP;
 		if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED) &&
 			!IS_ALIGNED(attr->ia_size,
-			F2FS_BLK_TO_BYTES(F2FS_I(inode)->i_cluster_size)))
+			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
 			return -EINVAL;
 	}
 
@@ -1052,7 +1053,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 				return err;
 		}
 
-		f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+		f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
 		filemap_invalidate_lock(inode->i_mapping);
 
 		truncate_setsize(inode, attr->ia_size);
@@ -1064,14 +1065,14 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		 * larger than i_size.
 		 */
 		filemap_invalidate_unlock(inode->i_mapping);
-		f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+		f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
 		if (err)
 			return err;
 
-		spin_lock(&F2FS_I(inode)->i_size_lock);
+		spin_lock(&fi->i_size_lock);
 		inode_set_mtime_to_ts(inode, inode_set_ctime_current(inode));
-		F2FS_I(inode)->last_disk_size = i_size_read(inode);
-		spin_unlock(&F2FS_I(inode)->i_size_lock);
+		fi->last_disk_size = i_size_read(inode);
+		spin_unlock(&fi->i_size_lock);
 	}
 
 	__setattr_copy(idmap, inode, attr);
@@ -1081,7 +1082,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 
 		if (is_inode_flag_set(inode, FI_ACL_MODE)) {
 			if (!err)
-				inode->i_mode = F2FS_I(inode)->i_acl_mode;
+				inode->i_mode = fi->i_acl_mode;
 			clear_inode_flag(inode, FI_ACL_MODE);
 		}
 	}
@@ -1989,15 +1990,15 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 			if (err)
 				return err;
 
-			f2fs_down_write(&F2FS_I(inode)->i_sem);
+			f2fs_down_write(&fi->i_sem);
 			if (!f2fs_may_compress(inode) ||
 					(S_ISREG(inode->i_mode) &&
 					F2FS_HAS_BLOCKS(inode))) {
-				f2fs_up_write(&F2FS_I(inode)->i_sem);
+				f2fs_up_write(&fi->i_sem);
 				return -EINVAL;
 			}
 			err = set_compress_context(inode);
-			f2fs_up_write(&F2FS_I(inode)->i_sem);
+			f2fs_up_write(&fi->i_sem);
 
 			if (err)
 				return err;
@@ -3584,6 +3585,7 @@ static int release_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
 static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
+	struct f2fs_inode_info *fi = F2FS_I(inode);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	pgoff_t page_idx = 0, last_idx;
 	unsigned int released_blocks = 0;
@@ -3621,7 +3623,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 	if (ret)
 		goto out;
 
-	if (!atomic_read(&F2FS_I(inode)->i_compr_blocks)) {
+	if (!atomic_read(&fi->i_compr_blocks)) {
 		ret = -EPERM;
 		goto out;
 	}
@@ -3630,7 +3632,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 	inode_set_ctime_current(inode);
 	f2fs_mark_inode_dirty_sync(inode, true);
 
-	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+	f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
 	filemap_invalidate_lock(inode->i_mapping);
 
 	last_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
@@ -3656,7 +3658,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 
 		end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
 		count = min(end_offset - dn.ofs_in_node, last_idx - page_idx);
-		count = round_up(count, F2FS_I(inode)->i_cluster_size);
+		count = round_up(count, fi->i_cluster_size);
 
 		ret = release_compress_blocks(&dn, count);
 
@@ -3672,7 +3674,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 	}
 
 	filemap_invalidate_unlock(inode->i_mapping);
-	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+	f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
 out:
 	if (released_blocks)
 		f2fs_update_time(sbi, REQ_TIME);
@@ -3683,14 +3685,14 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 	if (ret >= 0) {
 		ret = put_user(released_blocks, (u64 __user *)arg);
 	} else if (released_blocks &&
-			atomic_read(&F2FS_I(inode)->i_compr_blocks)) {
+			atomic_read(&fi->i_compr_blocks)) {
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "%s: partial blocks were released i_ino=%lx "
 			"iblocks=%llu, released=%u, compr_blocks=%u, "
 			"run fsck to fix.",
 			__func__, inode->i_ino, inode->i_blocks,
 			released_blocks,
-			atomic_read(&F2FS_I(inode)->i_compr_blocks));
+			atomic_read(&fi->i_compr_blocks));
 	}
 
 	return ret;
@@ -3779,6 +3781,7 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count,
 static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
+	struct f2fs_inode_info *fi = F2FS_I(inode);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	pgoff_t page_idx = 0, last_idx;
 	unsigned int reserved_blocks = 0;
@@ -3804,10 +3807,10 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 		goto unlock_inode;
 	}
 
-	if (atomic_read(&F2FS_I(inode)->i_compr_blocks))
+	if (atomic_read(&fi->i_compr_blocks))
 		goto unlock_inode;
 
-	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+	f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
 	filemap_invalidate_lock(inode->i_mapping);
 
 	last_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
@@ -3833,7 +3836,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 
 		end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
 		count = min(end_offset - dn.ofs_in_node, last_idx - page_idx);
-		count = round_up(count, F2FS_I(inode)->i_cluster_size);
+		count = round_up(count, fi->i_cluster_size);
 
 		ret = reserve_compress_blocks(&dn, count, &reserved_blocks);
 
@@ -3848,7 +3851,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	}
 
 	filemap_invalidate_unlock(inode->i_mapping);
-	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+	f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
 
 	if (!ret) {
 		clear_inode_flag(inode, FI_COMPRESS_RELEASED);
@@ -3864,14 +3867,14 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	if (!ret) {
 		ret = put_user(reserved_blocks, (u64 __user *)arg);
 	} else if (reserved_blocks &&
-			atomic_read(&F2FS_I(inode)->i_compr_blocks)) {
+			atomic_read(&fi->i_compr_blocks)) {
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "%s: partial blocks were reserved i_ino=%lx "
 			"iblocks=%llu, reserved=%u, compr_blocks=%u, "
 			"run fsck to fix.",
 			__func__, inode->i_ino, inode->i_blocks,
 			reserved_blocks,
-			atomic_read(&F2FS_I(inode)->i_compr_blocks));
+			atomic_read(&fi->i_compr_blocks));
 	}
 
 	return ret;
@@ -4097,6 +4100,7 @@ static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
 static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
+	struct f2fs_inode_info *fi = F2FS_I(inode);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_comp_option option;
 	int ret = 0;
@@ -4137,25 +4141,25 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 		goto out;
 	}
 
-	F2FS_I(inode)->i_compress_algorithm = option.algorithm;
-	F2FS_I(inode)->i_log_cluster_size = option.log_cluster_size;
-	F2FS_I(inode)->i_cluster_size = BIT(option.log_cluster_size);
+	fi->i_compress_algorithm = option.algorithm;
+	fi->i_log_cluster_size = option.log_cluster_size;
+	fi->i_cluster_size = BIT(option.log_cluster_size);
 	/* Set default level */
-	if (F2FS_I(inode)->i_compress_algorithm == COMPRESS_ZSTD)
-		F2FS_I(inode)->i_compress_level = F2FS_ZSTD_DEFAULT_CLEVEL;
+	if (fi->i_compress_algorithm == COMPRESS_ZSTD)
+		fi->i_compress_level = F2FS_ZSTD_DEFAULT_CLEVEL;
 	else
-		F2FS_I(inode)->i_compress_level = 0;
+		fi->i_compress_level = 0;
 	/* Adjust mount option level */
 	if (option.algorithm == F2FS_OPTION(sbi).compress_algorithm &&
 	    F2FS_OPTION(sbi).compress_level)
-		F2FS_I(inode)->i_compress_level = F2FS_OPTION(sbi).compress_level;
+		fi->i_compress_level = F2FS_OPTION(sbi).compress_level;
 	f2fs_mark_inode_dirty_sync(inode, true);
 
 	if (!f2fs_is_compress_backend_ready(inode))
 		f2fs_warn(sbi, "compression algorithm is successfully set, "
 			"but current kernel doesn't support this algorithm.");
 out:
-	f2fs_up_write(&F2FS_I(inode)->i_sem);
+	f2fs_up_write(&fi->i_sem);
 	inode_unlock(inode);
 	mnt_drop_write_file(filp);
 
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index a3456b29b5ff..11aab5fdf71b 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -635,8 +635,9 @@ struct inode *f2fs_iget_retry(struct super_block *sb, unsigned long ino)
 
 void f2fs_update_inode(struct inode *inode, struct page *node_page)
 {
+	struct f2fs_inode_info *fi = F2FS_I(inode);
 	struct f2fs_inode *ri;
-	struct extent_tree *et = F2FS_I(inode)->extent_tree[EX_READ];
+	struct extent_tree *et = fi->extent_tree[EX_READ];
 
 	f2fs_wait_on_page_writeback(node_page, NODE, true, true);
 	set_page_dirty(node_page);
@@ -646,7 +647,7 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
 	ri = F2FS_INODE(node_page);
 
 	ri->i_mode = cpu_to_le16(inode->i_mode);
-	ri->i_advise = F2FS_I(inode)->i_advise;
+	ri->i_advise = fi->i_advise;
 	ri->i_uid = cpu_to_le32(i_uid_read(inode));
 	ri->i_gid = cpu_to_le32(i_gid_read(inode));
 	ri->i_links = cpu_to_le32(inode->i_nlink);
@@ -672,58 +673,49 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
 	ri->i_ctime_nsec = cpu_to_le32(inode_get_ctime_nsec(inode));
 	ri->i_mtime_nsec = cpu_to_le32(inode_get_mtime_nsec(inode));
 	if (S_ISDIR(inode->i_mode))
-		ri->i_current_depth =
-			cpu_to_le32(F2FS_I(inode)->i_current_depth);
+		ri->i_current_depth = cpu_to_le32(fi->i_current_depth);
 	else if (S_ISREG(inode->i_mode))
-		ri->i_gc_failures = cpu_to_le16(F2FS_I(inode)->i_gc_failures);
-	ri->i_xattr_nid = cpu_to_le32(F2FS_I(inode)->i_xattr_nid);
-	ri->i_flags = cpu_to_le32(F2FS_I(inode)->i_flags);
-	ri->i_pino = cpu_to_le32(F2FS_I(inode)->i_pino);
+		ri->i_gc_failures = cpu_to_le16(fi->i_gc_failures);
+	ri->i_xattr_nid = cpu_to_le32(fi->i_xattr_nid);
+	ri->i_flags = cpu_to_le32(fi->i_flags);
+	ri->i_pino = cpu_to_le32(fi->i_pino);
 	ri->i_generation = cpu_to_le32(inode->i_generation);
-	ri->i_dir_level = F2FS_I(inode)->i_dir_level;
+	ri->i_dir_level = fi->i_dir_level;
 
 	if (f2fs_has_extra_attr(inode)) {
-		ri->i_extra_isize = cpu_to_le16(F2FS_I(inode)->i_extra_isize);
+		ri->i_extra_isize = cpu_to_le16(fi->i_extra_isize);
 
 		if (f2fs_sb_has_flexible_inline_xattr(F2FS_I_SB(inode)))
 			ri->i_inline_xattr_size =
-				cpu_to_le16(F2FS_I(inode)->i_inline_xattr_size);
+				cpu_to_le16(fi->i_inline_xattr_size);
 
 		if (f2fs_sb_has_project_quota(F2FS_I_SB(inode)) &&
-			F2FS_FITS_IN_INODE(ri, F2FS_I(inode)->i_extra_isize,
-								i_projid)) {
+			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_projid)) {
 			projid_t i_projid;
 
-			i_projid = from_kprojid(&init_user_ns,
-						F2FS_I(inode)->i_projid);
+			i_projid = from_kprojid(&init_user_ns, fi->i_projid);
 			ri->i_projid = cpu_to_le32(i_projid);
 		}
 
 		if (f2fs_sb_has_inode_crtime(F2FS_I_SB(inode)) &&
-			F2FS_FITS_IN_INODE(ri, F2FS_I(inode)->i_extra_isize,
-								i_crtime)) {
-			ri->i_crtime =
-				cpu_to_le64(F2FS_I(inode)->i_crtime.tv_sec);
-			ri->i_crtime_nsec =
-				cpu_to_le32(F2FS_I(inode)->i_crtime.tv_nsec);
+			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_crtime)) {
+			ri->i_crtime = cpu_to_le64(fi->i_crtime.tv_sec);
+			ri->i_crtime_nsec = cpu_to_le32(fi->i_crtime.tv_nsec);
 		}
 
 		if (f2fs_sb_has_compression(F2FS_I_SB(inode)) &&
-			F2FS_FITS_IN_INODE(ri, F2FS_I(inode)->i_extra_isize,
+			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
 							i_compress_flag)) {
 			unsigned short compress_flag;
 
-			ri->i_compr_blocks =
-				cpu_to_le64(atomic_read(
-					&F2FS_I(inode)->i_compr_blocks));
-			ri->i_compress_algorithm =
-				F2FS_I(inode)->i_compress_algorithm;
-			compress_flag = F2FS_I(inode)->i_compress_flag |
-				F2FS_I(inode)->i_compress_level <<
+			ri->i_compr_blocks = cpu_to_le64(
+					atomic_read(&fi->i_compr_blocks));
+			ri->i_compress_algorithm = fi->i_compress_algorithm;
+			compress_flag = fi->i_compress_flag |
+						fi->i_compress_level <<
 						COMPRESS_LEVEL_OFFSET;
 			ri->i_compress_flag = cpu_to_le16(compress_flag);
-			ri->i_log_cluster_size =
-				F2FS_I(inode)->i_log_cluster_size;
+			ri->i_log_cluster_size = fi->i_log_cluster_size;
 		}
 	}
 
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index e54f8c08bda8..3d9d2b710796 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -221,6 +221,7 @@ static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
 						const char *name)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
+	struct f2fs_inode_info *fi;
 	nid_t ino;
 	struct inode *inode;
 	bool nid_free = false;
@@ -241,14 +242,15 @@ static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
 
 	inode_init_owner(idmap, inode, dir, mode);
 
+	fi = F2FS_I(inode);
 	inode->i_ino = ino;
 	inode->i_blocks = 0;
 	simple_inode_init_ts(inode);
-	F2FS_I(inode)->i_crtime = inode_get_mtime(inode);
+	fi->i_crtime = inode_get_mtime(inode);
 	inode->i_generation = get_random_u32();
 
 	if (S_ISDIR(inode->i_mode))
-		F2FS_I(inode)->i_current_depth = 1;
+		fi->i_current_depth = 1;
 
 	err = insert_inode_locked(inode);
 	if (err) {
@@ -258,9 +260,9 @@ static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
 
 	if (f2fs_sb_has_project_quota(sbi) &&
 		(F2FS_I(dir)->i_flags & F2FS_PROJINHERIT_FL))
-		F2FS_I(inode)->i_projid = F2FS_I(dir)->i_projid;
+		fi->i_projid = F2FS_I(dir)->i_projid;
 	else
-		F2FS_I(inode)->i_projid = make_kprojid(&init_user_ns,
+		fi->i_projid = make_kprojid(&init_user_ns,
 							F2FS_DEF_PROJID);
 
 	err = fscrypt_prepare_new_inode(dir, inode, &encrypt);
@@ -278,7 +280,7 @@ static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
 
 	if (f2fs_sb_has_extra_attr(sbi)) {
 		set_inode_flag(inode, FI_EXTRA_ATTR);
-		F2FS_I(inode)->i_extra_isize = F2FS_TOTAL_EXTRA_ATTR_SIZE;
+		fi->i_extra_isize = F2FS_TOTAL_EXTRA_ATTR_SIZE;
 	}
 
 	if (test_opt(sbi, INLINE_XATTR))
@@ -296,15 +298,15 @@ static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
 				f2fs_has_inline_dentry(inode)) {
 		xattr_size = DEFAULT_INLINE_XATTR_ADDRS;
 	}
-	F2FS_I(inode)->i_inline_xattr_size = xattr_size;
+	fi->i_inline_xattr_size = xattr_size;
 
-	F2FS_I(inode)->i_flags =
+	fi->i_flags =
 		f2fs_mask_flags(mode, F2FS_I(dir)->i_flags & F2FS_FL_INHERITED);
 
 	if (S_ISDIR(inode->i_mode))
-		F2FS_I(inode)->i_flags |= F2FS_INDEX_FL;
+		fi->i_flags |= F2FS_INDEX_FL;
 
-	if (F2FS_I(inode)->i_flags & F2FS_PROJINHERIT_FL)
+	if (fi->i_flags & F2FS_PROJINHERIT_FL)
 		set_inode_flag(inode, FI_PROJ_INHERIT);
 
 	/* Check compression first. */
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 496aee53c38a..c74ffdeedc4c 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -287,6 +287,7 @@ static void recover_inline_flags(struct inode *inode, struct f2fs_inode *ri)
 static int recover_inode(struct inode *inode, struct page *page)
 {
 	struct f2fs_inode *raw = F2FS_INODE(page);
+	struct f2fs_inode_info *fi = F2FS_I(inode);
 	char *name;
 	int err;
 
@@ -309,12 +310,12 @@ static int recover_inode(struct inode *inode, struct page *page)
 			i_projid = (projid_t)le32_to_cpu(raw->i_projid);
 			kprojid = make_kprojid(&init_user_ns, i_projid);
 
-			if (!projid_eq(kprojid, F2FS_I(inode)->i_projid)) {
+			if (!projid_eq(kprojid, fi->i_projid)) {
 				err = f2fs_transfer_project_quota(inode,
 								kprojid);
 				if (err)
 					return err;
-				F2FS_I(inode)->i_projid = kprojid;
+				fi->i_projid = kprojid;
 			}
 		}
 	}
@@ -327,10 +328,10 @@ static int recover_inode(struct inode *inode, struct page *page)
 	inode_set_mtime(inode, le64_to_cpu(raw->i_mtime),
 			le32_to_cpu(raw->i_mtime_nsec));
 
-	F2FS_I(inode)->i_advise = raw->i_advise;
-	F2FS_I(inode)->i_flags = le32_to_cpu(raw->i_flags);
+	fi->i_advise = raw->i_advise;
+	fi->i_flags = le32_to_cpu(raw->i_flags);
 	f2fs_set_inode_flags(inode);
-	F2FS_I(inode)->i_gc_failures = le16_to_cpu(raw->i_gc_failures);
+	fi->i_gc_failures = le16_to_cpu(raw->i_gc_failures);
 
 	recover_inline_flags(inode, raw);
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
