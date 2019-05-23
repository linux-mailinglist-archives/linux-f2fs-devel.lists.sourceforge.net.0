Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 455EC282DE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 May 2019 18:20:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hTqSc-00068d-RE; Thu, 23 May 2019 16:20:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hTqSZ-000687-QX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 16:20:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lnxiAykkNOgyQYDu+IyD8FS5/8zXRYpXI+Btf70N80Q=; b=JhOAZtw1geemcHBVruJx5eWAtB
 r7pB9UjjEo/IukVmlr8KcKtL1q2krqxQ/RxuGB1BX6NIvo/zYnxwJ6lKU8ayR3lWrvooQ6rbEqPEO
 XXIF0t3rdqps3Q6/AyLkk+ZhKqq9hAJctNw9rXNJkNi/bOlryH5iMuUzZaBtJy/W7TvE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lnxiAykkNOgyQYDu+IyD8FS5/8zXRYpXI+Btf70N80Q=; b=PwLDieMcYDizWyM4T+zDd8JHqZ
 o6B4YT80yM6M0omtuYPQRtCD9BdKsAotWhU6a9BbHErakqAl9GHBf4XQz+UNHYHGMkWlYDTXQvBa2
 25bl9Cv1c5Y/zYvegAj1bEZ8iD8PiDxXlnzmi/VtHzXi1f8igmxVrSLMKMrj0igpZ0Yw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hTqSX-003559-Px
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 16:20:51 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 39FA721874;
 Thu, 23 May 2019 16:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558628438;
 bh=nF50IWo4NWHpGd5GxwVVTmdjO+8JlCt7542Zfb4Ujik=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PM+fIpWw6yT/YJwpRqE1Gg9k9qyg4wHyEAG8JPaGG/5d1i9eOR5u8J57vsac+Y//V
 vQBXguRnp67h7gMhUU2t834+gB5dk/VqYBFLVTeTg/jGittAQ1tFq8kE7mWA8xPbb4
 n+H6HKVT0cf2mYxovNwy7oUZcyJQFvkkvKqBb2MM=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Thu, 23 May 2019 09:18:05 -0700
Message-Id: <20190523161811.6259-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190523161811.6259-1-ebiggers@kernel.org>
References: <20190523161811.6259-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hTqSX-003559-Px
Subject: [f2fs-dev] [PATCH v3 09/15] fs-verity: implement
 FS_IOC_ENABLE_VERITY ioctl
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-integrity@vger.kernel.org,
 linux-ext4@vger.kernel.org, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Add a function for filesystems to call to implement the
FS_IOC_ENABLE_VERITY ioctl.  This ioctl enables fs-verity on a file.

See the "FS_IOC_ENABLE_VERITY" section of
Documentation/filesystems/fsverity.rst for the documentation.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/Makefile       |   3 +-
 fs/verity/enable.c       | 323 +++++++++++++++++++++++++++++++++++++++
 include/linux/fsverity.h |  64 ++++++++
 3 files changed, 389 insertions(+), 1 deletion(-)
 create mode 100644 fs/verity/enable.c

diff --git a/fs/verity/Makefile b/fs/verity/Makefile
index 7fa628cd5eba2..04b37475fd280 100644
--- a/fs/verity/Makefile
+++ b/fs/verity/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_FS_VERITY) += hash_algs.o \
+obj-$(CONFIG_FS_VERITY) += enable.o \
+			   hash_algs.o \
 			   init.o \
 			   open.o \
 			   verify.o
diff --git a/fs/verity/enable.c b/fs/verity/enable.c
new file mode 100644
index 0000000000000..82ffbdd03d6a8
--- /dev/null
+++ b/fs/verity/enable.c
@@ -0,0 +1,323 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * fs/verity/enable.c: ioctl to enable verity on a file
+ *
+ * Copyright 2019 Google LLC
+ */
+
+#include "fsverity_private.h"
+
+#include <crypto/hash.h>
+#include <linux/mount.h>
+#include <linux/pagemap.h>
+#include <linux/sched/signal.h>
+#include <linux/uaccess.h>
+
+static int build_merkle_tree_level(struct inode *inode, unsigned int level,
+				   u64 num_blocks_to_hash,
+				   const struct merkle_tree_params *params,
+				   u8 *pending_hashes,
+				   struct ahash_request *req)
+{
+	const struct fsverity_operations *vops = inode->i_sb->s_vop;
+	unsigned int pending_size = 0;
+	u64 dst_block_num = (level < params->num_levels) ?
+			    params->level_start[level] : 0;
+	u64 i;
+	int err;
+
+	if (WARN_ON(params->block_size != PAGE_SIZE)) /* checked earlier too */
+		return -EINVAL;
+
+	for (i = 0; i < num_blocks_to_hash; i++) {
+		struct page *src_page;
+
+		if ((pgoff_t)i % 10000 == 0 || i + 1 == num_blocks_to_hash)
+			pr_debug("Hashing block %llu for level %u\n", i, level);
+
+		if (level == 0)
+			/* Leaf: hashing a data block */
+			src_page = read_mapping_page(inode->i_mapping, i, NULL);
+		else
+			/* Non-leaf: hashing hash block from level below */
+			src_page = vops->read_merkle_tree_page(inode,
+					params->level_start[level - 1] + i);
+		if (IS_ERR(src_page)) {
+			err = PTR_ERR(src_page);
+			fsverity_err(inode,
+				     "Error %d reading Merkle tree page %llu",
+				     err, params->level_start[level - 1] + i);
+			return err;
+		}
+
+		err = fsverity_hash_page(params, inode, req, src_page,
+					 &pending_hashes[pending_size]);
+		put_page(src_page);
+		if (err)
+			return err;
+		pending_size += params->digest_size;
+
+		if (level == params->num_levels) {
+			/* Root hash */
+			if (WARN_ON(num_blocks_to_hash != 1))
+				return -EINVAL;
+			if (WARN_ON(pending_size != params->digest_size))
+				return -EINVAL;
+			return 0;
+		}
+
+		if (pending_size + params->digest_size > params->block_size ||
+		    i + 1 == num_blocks_to_hash) {
+			/* Flush the pending hash block */
+			memset(&pending_hashes[pending_size], 0,
+			       params->block_size - pending_size);
+			err = vops->write_merkle_tree_block(inode,
+					pending_hashes,
+					dst_block_num,
+					params->log_blocksize);
+			if (err) {
+				fsverity_err(inode,
+					     "Error %d writing Merkle tree block %llu",
+					     err, dst_block_num);
+				return err;
+			}
+			dst_block_num++;
+			pending_size = 0;
+		}
+
+		if (fatal_signal_pending(current))
+			return -EINTR;
+		cond_resched();
+	}
+	return 0;
+}
+
+/*
+ * Build the Merkle tree for the given inode using the given parameters, and
+ * return the root hash in @root_hash.
+ *
+ * The tree is written to a filesystem-specific location as determined by the
+ * ->write_merkle_tree_block() method.  However, the blocks that comprise the
+ * tree are the same for all filesystems.
+ */
+static int build_merkle_tree(struct inode *inode,
+			     const struct merkle_tree_params *params,
+			     u8 *root_hash)
+{
+	u8 *pending_hashes;
+	struct ahash_request *req;
+	u64 blocks;
+	unsigned int level;
+	int err = -ENOMEM;
+
+	pending_hashes = kmalloc(params->block_size, GFP_KERNEL);
+	req = ahash_request_alloc(params->hash_alg->tfm, GFP_KERNEL);
+	if (!pending_hashes || !req)
+		goto out;
+
+	/*
+	 * Build each level of the Merkle tree, starting at the leaf level
+	 * (level 0) and ascending to the root node (level 'num_levels - 1').
+	 * Then at the end (level 'num_levels'), calculate the root hash.
+	 */
+	blocks = (params->data_size + params->block_size - 1) >>
+		 params->log_blocksize;
+	for (level = 0; level <= params->num_levels; level++) {
+		err = build_merkle_tree_level(inode, level, blocks, params,
+					      pending_hashes, req);
+		if (err)
+			goto out;
+		blocks = (blocks + params->hashes_per_block - 1) >>
+			 params->log_arity;
+	}
+	memcpy(root_hash, pending_hashes, params->digest_size);
+	err = 0;
+out:
+	kfree(pending_hashes);
+	ahash_request_free(req);
+	return err;
+}
+
+static int enable_verity(struct file *filp,
+			 const struct fsverity_enable_arg *arg)
+{
+	struct inode *inode = file_inode(filp);
+	struct merkle_tree_params params = { };
+	struct fsverity_descriptor *desc;
+	size_t desc_size = sizeof(*desc);
+	struct fsverity_info *vi;
+	int err, err2;
+
+	/* Start initializing the fsverity_descriptor */
+	desc = kzalloc(desc_size, GFP_KERNEL);
+	if (!desc)
+		return -ENOMEM;
+	desc->version = 1;
+	desc->hash_algorithm = arg->hash_algorithm;
+	desc->log_blocksize = ilog2(arg->block_size);
+
+	/* Get the salt if the user provided one */
+	if (arg->salt_size &&
+	    copy_from_user(desc->salt,
+			   (const u8 __user *)(uintptr_t)arg->salt_ptr,
+			   arg->salt_size)) {
+		err = -EFAULT;
+		goto out;
+	}
+	desc->salt_size = arg->salt_size;
+
+	desc->data_size = cpu_to_le64(inode->i_size);
+
+	pr_debug("Building Merkle tree...\n");
+
+	/* Prepare the Merkle tree parameters */
+	err = fsverity_init_merkle_tree_params(&params, inode,
+					       desc->hash_algorithm,
+					       desc->log_blocksize,
+					       desc->salt, desc->salt_size);
+	if (err)
+		goto out;
+
+	/* Tell the filesystem that verity is being enabled on the file */
+	err = inode->i_sb->s_vop->begin_enable_verity(filp);
+	if (err)
+		goto out;
+
+	/* Build the Merkle tree */
+	BUILD_BUG_ON(sizeof(desc->root_hash) < FS_VERITY_MAX_DIGEST_SIZE);
+	err = build_merkle_tree(inode, &params, desc->root_hash);
+	if (err) {
+		fsverity_err(inode, "Error %d building Merkle tree", err);
+		goto out_end;
+	}
+	pr_debug("Done building Merkle tree.  Root hash is %s:%*phN\n",
+		 params.hash_alg->name, params.digest_size, desc->root_hash);
+	/*
+	 * Set up ->i_verity_info.  Don't bother trying to save work by reusing
+	 * the merkle_tree_params from above.  Instead, just set up the
+	 * fsverity_info from the fsverity_descriptor as if it were just loaded
+	 * from disk.  This is simpler, and it serves as an extra check that the
+	 * metadata we're writing is valid before actually enabling verity.
+	 */
+	vi = fsverity_create_info(inode, desc, desc_size);
+	if (IS_ERR(vi)) {
+		err = PTR_ERR(vi);
+		goto out_end;
+	}
+	if (WARN_ON(inode->i_verity_info)) {
+		err = -EEXIST;
+		goto out_end;
+	}
+	inode->i_verity_info = vi;
+	err = 0;
+out_end:
+	if (err) {
+		kfree(desc);
+		desc = NULL;
+		desc_size = 0;
+	}
+	/*
+	 * Tell the filesystem to finish enabling verity on this file
+	 * (desc != NULL), or to clean up after an error (desc == NULL).
+	 */
+	err2 = inode->i_sb->s_vop->end_enable_verity(filp, desc, desc_size,
+						     params.tree_size);
+	if (err2)
+		fsverity_err(inode, "%ps() failed with err %d",
+			     inode->i_sb->s_vop->end_enable_verity, err2);
+	/* On success, the filesystem must have set the verity bit */
+	WARN_ON(desc != NULL && err2 == 0 && !IS_VERITY(inode));
+	err = err ?: err2;
+out:
+	kfree(params.hashstate);
+	kfree(desc);
+	return err;
+}
+
+/**
+ * fsverity_ioctl_enable() - enable verity on a file
+ *
+ * Enable fs-verity on a file.  See the "FS_IOC_ENABLE_VERITY" section of
+ * Documentation/filesystems/fsverity.rst for the documentation.
+ *
+ * Return: 0 on success, -errno on failure
+ */
+int fsverity_ioctl_enable(struct file *filp, const void __user *uarg)
+{
+	struct inode *inode = file_inode(filp);
+	struct fsverity_enable_arg arg;
+	int err;
+
+	if (copy_from_user(&arg, uarg, sizeof(arg)))
+		return -EFAULT;
+
+	if (arg.version != 1)
+		return -EINVAL;
+
+	if (arg.__reserved1 ||
+	    memchr_inv(arg.__reserved2, 0, sizeof(arg.__reserved2)))
+		return -EINVAL;
+
+	if (arg.block_size != PAGE_SIZE)
+		return -EINVAL;
+
+	if (arg.salt_size > FIELD_SIZEOF(struct fsverity_descriptor, salt))
+		return -EMSGSIZE;
+
+	if (arg.sig_size)
+		return -EINVAL;
+
+	/*
+	 * Require a regular file with write access.  But the actual fd must
+	 * still be readonly so that we can lock out all writers.  This is
+	 * needed to guarantee that no writable fds exist to the file once it
+	 * has verity enabled, and to stabilize the data being hashed.
+	 */
+
+	err = inode_permission(inode, MAY_WRITE);
+	if (err)
+		return err;
+
+	if (IS_APPEND(inode))
+		return -EPERM;
+
+	if (S_ISDIR(inode->i_mode))
+		return -EISDIR;
+
+	if (!S_ISREG(inode->i_mode))
+		return -EINVAL;
+
+	err = mnt_want_write_file(filp);
+	if (err) /* -EROFS */
+		return err;
+
+	err = deny_write_access(filp);
+	if (err) /* -ETXTBSY */
+		goto out_drop_write;
+
+	inode_lock(inode);
+
+	if (IS_VERITY(inode)) {
+		err = -EEXIST;
+		goto out_unlock;
+	}
+
+	if (inode->i_size <= 0) {
+		err = -EINVAL;
+		goto out_unlock;
+	}
+
+	err = enable_verity(filp, &arg);
+
+	/*
+	 * allow_write_access() is needed to pair with deny_write_access().
+	 * Regardless, the filesystem won't allow writing to verity files.
+	 */
+out_unlock:
+	inode_unlock(inode);
+	allow_write_access(filp);
+out_drop_write:
+	mnt_drop_write_file(filp);
+	return err;
+}
+EXPORT_SYMBOL_GPL(fsverity_ioctl_enable);
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index a9f43c66eb572..9a84fe4bcfc88 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -17,6 +17,42 @@
 /* Verity operations for filesystems */
 struct fsverity_operations {
 
+	/**
+	 * Begin enabling verity on the given file.
+	 *
+	 * @filp: a readonly file descriptor for the file
+	 *
+	 * The filesystem must do any needed filesystem-specific preparations
+	 * for enabling verity, e.g. evicting inline data.
+	 *
+	 * i_rwsem is held for write.
+	 *
+	 * Return: 0 on success, -errno on failure
+	 */
+	int (*begin_enable_verity)(struct file *filp);
+
+	/**
+	 * End enabling verity on the given file.
+	 *
+	 * @filp: a readonly file descriptor for the file
+	 * @desc: the verity descriptor to write, or NULL on failure
+	 * @desc_size: size of verity descriptor, or 0 on failure
+	 * @merkle_tree_size: total bytes the Merkle tree took up
+	 *
+	 * If desc == NULL, then enabling verity failed and the filesystem only
+	 * must do any necessary cleanups.  Else, it must also store the given
+	 * verity descriptor to a fs-specific location associated with the inode
+	 * and do any fs-specific actions needed to mark the inode as a verity
+	 * inode, e.g. setting a bit in the on-disk inode.  The filesystem is
+	 * also responsible for setting the S_VERITY flag in the VFS inode.
+	 *
+	 * i_rwsem is held for write.
+	 *
+	 * Return: 0 on success, -errno on failure
+	 */
+	int (*end_enable_verity)(struct file *filp, const void *desc,
+				 size_t desc_size, u64 merkle_tree_size);
+
 	/**
 	 * Get the verity descriptor of the given inode.
 	 *
@@ -50,10 +86,30 @@ struct fsverity_operations {
 	 */
 	struct page *(*read_merkle_tree_page)(struct inode *inode,
 					      pgoff_t index);
+
+	/**
+	 * Write a Merkle tree block to the given inode.
+	 *
+	 * @inode: the inode for which the Merkle tree is being built
+	 * @buf: block to write
+	 * @index: 0-based index of the block within the Merkle tree
+	 * @log_blocksize: log base 2 of the Merkle tree block size
+	 *
+	 * This is only called between ->begin_enable_verity() and
+	 * ->end_enable_verity().  i_rwsem is held for write.
+	 *
+	 * Return: 0 on success, -errno on failure
+	 */
+	int (*write_merkle_tree_block)(struct inode *inode, const void *buf,
+				       u64 index, int log_blocksize);
 };
 
 #ifdef CONFIG_FS_VERITY
 
+/* enable.c */
+
+extern int fsverity_ioctl_enable(struct file *filp, const void __user *arg);
+
 /* open.c */
 
 extern int fsverity_file_open(struct inode *inode, struct file *filp);
@@ -68,6 +124,14 @@ extern void fsverity_enqueue_verify_work(struct work_struct *work);
 
 #else /* !CONFIG_FS_VERITY */
 
+/* enable.c */
+
+static inline int fsverity_ioctl_enable(struct file *filp,
+					const void __user *arg)
+{
+	return -EOPNOTSUPP;
+}
+
 /* open.c */
 
 static inline int fsverity_file_open(struct inode *inode, struct file *filp)
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
