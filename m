Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6F0282DB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 May 2019 18:20:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hTqSZ-0002C0-Rk; Thu, 23 May 2019 16:20:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hTqSZ-0002BZ-2M
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 16:20:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GOeKYAspXJhzmOt6AhQl5bhfphxculP86OYnbcyHSuk=; b=hFfd5xg4dICJV4qKkCOOx7xHrd
 3yvAq1y23cZnMehOIWNc0YcrdDCo8LM1EGgrNxLHk5/yIGXgIu+rfy/VVVmkvF6HmB92+yqWXCJCo
 q/djoNkBmEEmyWiEc25B9F9yQ3Nrpw+ipxbIBm5k9Q9dq1j1LgZr6cBgVvMcQBjDXiU8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GOeKYAspXJhzmOt6AhQl5bhfphxculP86OYnbcyHSuk=; b=ZhhhuKJwNaarxl2CHdDWZf+sRQ
 8QqFL2x1k0Fg1W0dgP2xgCZnU5g3ZUetWfff1rb9L0KWv2+QkTPAVJcss88hV4cmwE9R2jVtXLDHV
 pT2wIaHL3Kfotz3OEINo6ekTbBSSaGaXqTF6nq69bwZYr83C/M/xo6ZQms0cFgPTRC6o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hTqSX-009b3x-2T
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 16:20:50 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED25F21871;
 Thu, 23 May 2019 16:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558628437;
 bh=lh0vOUI/tFua+0a7RkRewqOX67qGGIt5kJLiRK08E5Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0tb91zfrpC0OGvAOC1TYk7ucoPZJcLvE5C0ull6AZg1/PMQuquWSWgGO1bKTL3Gxp
 CjHPInxY+u0+U/zaYKm37tiDoHAu2bbEEN9t5GREbpYBC/rBhuVmMV/8FT5MGdlzAA
 q1N8des1mX9hNBAr0MtGQykYT3XofizrOH1rAfFg=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Thu, 23 May 2019 09:18:02 -0700
Message-Id: <20190523161811.6259-7-ebiggers@kernel.org>
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
X-Headers-End: 1hTqSX-009b3x-2T
Subject: [f2fs-dev] [PATCH v3 06/15] fs-verity: add the hook for file
 ->open()
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

Add the fsverity_file_open() function, which prepares an fs-verity file
to be read from.  If not already done, it loads the fs-verity descriptor
from the filesystem and sets up an fsverity_info structure for the inode
which describes the Merkle tree and contains the file measurement.  It
also denies all attempts to open verity files for writing.

This commit also begins the include/linux/fsverity.h header, which
declares the interface between fs/verity/ and filesystems.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/Makefile           |   3 +-
 fs/verity/fsverity_private.h |  56 ++++++-
 fs/verity/init.c             |   6 +
 fs/verity/open.c             | 315 +++++++++++++++++++++++++++++++++++
 include/linux/fsverity.h     |  60 +++++++
 5 files changed, 437 insertions(+), 3 deletions(-)
 create mode 100644 fs/verity/open.c
 create mode 100644 include/linux/fsverity.h

diff --git a/fs/verity/Makefile b/fs/verity/Makefile
index 398f3f85fa184..e6a8951c493a5 100644
--- a/fs/verity/Makefile
+++ b/fs/verity/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_FS_VERITY) += hash_algs.o \
-			   init.o
+			   init.o \
+			   open.o
diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index abb5f452f11dd..ef96bec290ff9 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -15,8 +15,7 @@
 #define pr_fmt(fmt) "fs-verity: " fmt
 
 #include <crypto/sha.h>
-#include <linux/fs.h>
-#include <uapi/linux/fsverity.h>
+#include <linux/fsverity.h>
 
 struct ahash_request;
 
@@ -62,6 +61,40 @@ struct merkle_tree_params {
 	u64 level_start[FS_VERITY_MAX_LEVELS];
 };
 
+/**
+ * fsverity_info - cached verity metadata for an inode
+ *
+ * When a verity file is first opened, an instance of this struct is allocated
+ * and stored in ->i_verity_info; it remains until the inode is evicted.  It
+ * caches information about the Merkle tree that's needed to efficiently verify
+ * data read from the file.  It also caches the file measurement.  The Merkle
+ * tree pages themselves are not cached here, but the filesystem may cache them.
+ */
+struct fsverity_info {
+	struct merkle_tree_params tree_params;
+	u8 root_hash[FS_VERITY_MAX_DIGEST_SIZE];
+	u8 measurement[FS_VERITY_MAX_DIGEST_SIZE];
+	const struct inode *inode;
+};
+
+/*
+ * Merkle tree properties.  The file measurement is the hash of this structure.
+ */
+struct fsverity_descriptor {
+	__u8 version;		/* must be 1 */
+	__u8 hash_algorithm;	/* Merkle tree hash algorithm */
+	__u8 log_blocksize;	/* log2 of size of data and tree blocks */
+	__u8 salt_size;		/* size of salt in bytes; 0 if none */
+	__le32 sig_size;	/* reserved, must be 0 */
+	__le64 data_size;	/* size of file the Merkle tree is built over */
+	__u8 root_hash[64];	/* Merkle tree root hash */
+	__u8 salt[32];		/* salt prepended to each hashed block */
+	__u8 __reserved[144];	/* must be 0's */
+};
+
+/* Arbitrary limit to bound the kmalloc() size.  Can be changed. */
+#define FS_VERITY_MAX_DESCRIPTOR_SIZE	16384
+
 /* hash_algs.c */
 
 extern struct fsverity_hash_alg fsverity_hash_algs[];
@@ -88,4 +121,23 @@ fsverity_msg(const struct inode *inode, const char *level,
 #define fsverity_err(inode, fmt, ...)		\
 	fsverity_msg((inode), KERN_ERR, fmt, ##__VA_ARGS__)
 
+/* open.c */
+
+int fsverity_init_merkle_tree_params(struct merkle_tree_params *params,
+				     const struct inode *inode,
+				     unsigned int hash_algorithm,
+				     unsigned int log_blocksize,
+				     const u8 *salt, size_t salt_size);
+
+struct fsverity_info *fsverity_create_info(const struct inode *inode,
+					   const void *desc, size_t desc_size);
+
+static inline struct fsverity_info *get_verity_info(const struct inode *inode)
+{
+	/* pairs with the cmpxchg_release() in ensure_verity_info() */
+	return READ_ONCE(inode->i_verity_info);
+}
+
+int __init fsverity_init_info_cache(void);
+
 #endif /* _FSVERITY_PRIVATE_H */
diff --git a/fs/verity/init.c b/fs/verity/init.c
index 40076bbe452a4..fff1fd6343357 100644
--- a/fs/verity/init.c
+++ b/fs/verity/init.c
@@ -33,8 +33,14 @@ void fsverity_msg(const struct inode *inode, const char *level,
 
 static int __init fsverity_init(void)
 {
+	int err;
+
 	fsverity_check_hash_algs();
 
+	err = fsverity_init_info_cache();
+	if (err)
+		return err;
+
 	pr_debug("Initialized fs-verity\n");
 	return 0;
 }
diff --git a/fs/verity/open.c b/fs/verity/open.c
new file mode 100644
index 0000000000000..e6d73d73b000d
--- /dev/null
+++ b/fs/verity/open.c
@@ -0,0 +1,315 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * fs/verity/open.c: opening fs-verity files
+ *
+ * Copyright 2019 Google LLC
+ */
+
+#include "fsverity_private.h"
+
+#include <linux/slab.h>
+
+static struct kmem_cache *fsverity_info_cachep;
+
+/**
+ * fsverity_init_merkle_tree_params() - initialize Merkle tree parameters
+ * @params: the parameters struct to initialize
+ * @inode: the inode for which the Merkle tree is being built
+ * @hash_algorithm: number of hash algorithm to use
+ * @log_blocksize: log base 2 of block size to use
+ * @salt: pointer to salt (optional)
+ * @salt_size: size of salt, possibly 0
+ *
+ * Validate the hash algorithm and block size, then compute the tree topology
+ * (num levels, num blocks in each level, etc.) and initialize @params.
+ *
+ * Return: 0 on success, -errno on failure
+ */
+int fsverity_init_merkle_tree_params(struct merkle_tree_params *params,
+				     const struct inode *inode,
+				     unsigned int hash_algorithm,
+				     unsigned int log_blocksize,
+				     const u8 *salt, size_t salt_size)
+{
+	const struct fsverity_hash_alg *hash_alg;
+	int err;
+	u64 blocks;
+	u64 offset;
+	int level;
+
+	memset(params, 0, sizeof(*params));
+
+	hash_alg = fsverity_get_hash_alg(inode, hash_algorithm);
+	if (IS_ERR(hash_alg))
+		return PTR_ERR(hash_alg);
+	params->hash_alg = hash_alg;
+	params->digest_size = hash_alg->digest_size;
+
+	params->hashstate = fsverity_prepare_hash_state(hash_alg, salt,
+							salt_size);
+	if (IS_ERR(params->hashstate)) {
+		err = PTR_ERR(params->hashstate);
+		params->hashstate = NULL;
+		fsverity_err(inode, "Error %d preparing hash state", err);
+		goto out_err;
+	}
+
+	if (log_blocksize != PAGE_SHIFT) {
+		fsverity_warn(inode, "Unsupported log_blocksize: %u",
+			      log_blocksize);
+		err = -EINVAL;
+		goto out_err;
+	}
+	params->log_blocksize = log_blocksize;
+	params->block_size = 1 << log_blocksize;
+
+	if (WARN_ON(!is_power_of_2(params->digest_size))) {
+		err = -EINVAL;
+		goto out_err;
+	}
+	if (params->block_size < 2 * params->digest_size) {
+		fsverity_warn(inode,
+			      "Merkle tree block size (%u) too small for hash algorithm \"%s\"",
+			      params->block_size, hash_alg->name);
+		err = -EINVAL;
+		goto out_err;
+	}
+	params->log_arity = params->log_blocksize - ilog2(params->digest_size);
+	params->hashes_per_block = 1 << params->log_arity;
+
+	pr_debug("Merkle tree uses %s with %u-byte blocks (%u hashes/block), salt=%*phN\n",
+		 hash_alg->name, params->block_size, params->hashes_per_block,
+		 (int)salt_size, salt);
+
+	/*
+	 * Compute the number of levels in the Merkle tree and create a map from
+	 * level to the starting block of that level.  Level 'num_levels - 1' is
+	 * the root and is stored first.  Level 0 is the level directly "above"
+	 * the data blocks and is stored last.
+	 */
+
+	/* Compute number of levels and the number of blocks in each level */
+	blocks = (inode->i_size + params->block_size - 1) >> log_blocksize;
+	pr_debug("Data is %lld bytes (%llu blocks)\n", inode->i_size, blocks);
+	while (blocks > 1) {
+		if (params->num_levels >= FS_VERITY_MAX_LEVELS) {
+			fsverity_err(inode, "Too many levels in Merkle tree");
+			err = -EINVAL;
+			goto out_err;
+		}
+		blocks = (blocks + params->hashes_per_block - 1) >>
+			 params->log_arity;
+		/* temporarily using level_start[] to store blocks in level */
+		params->level_start[params->num_levels++] = blocks;
+	}
+
+	/* Compute the starting block of each level */
+	offset = 0;
+	for (level = (int)params->num_levels - 1; level >= 0; level--) {
+		blocks = params->level_start[level];
+		params->level_start[level] = offset;
+		pr_debug("Level %d is %llu blocks starting at index %llu\n",
+			 level, blocks, offset);
+		offset += blocks;
+	}
+
+	params->data_size = inode->i_size;
+	params->tree_size = offset << log_blocksize;
+	return 0;
+
+out_err:
+	kfree(params->hashstate);
+	memset(params, 0, sizeof(*params));
+	return err;
+}
+
+/* Compute the file measurement by hashing the fsverity_descriptor. */
+static int compute_file_measurement(const struct fsverity_hash_alg *hash_alg,
+				    const struct fsverity_descriptor *desc,
+				    u8 *measurement)
+{
+	return fsverity_hash_buffer(hash_alg, desc, sizeof(*desc), measurement);
+}
+
+static void free_verity_info(struct fsverity_info *vi)
+{
+	if (!vi)
+		return;
+	kfree(vi->tree_params.hashstate);
+	kmem_cache_free(fsverity_info_cachep, vi);
+}
+
+/*
+ * Validate the given fsverity_descriptor and create a new fsverity_info from
+ * it.  The signature (if present) is also checked.
+ */
+struct fsverity_info *fsverity_create_info(const struct inode *inode,
+					   const void *_desc, size_t desc_size)
+{
+	const struct fsverity_descriptor *desc = _desc;
+	struct fsverity_info *vi;
+	int err;
+
+	if (desc_size < sizeof(*desc)) {
+		fsverity_err(inode, "Unrecognized descriptor size (%zu)",
+			     desc_size);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (desc->version != 1) {
+		fsverity_err(inode, "Unrecognized descriptor version: %u",
+			     desc->version);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (desc->sig_size ||
+	    memchr_inv(desc->__reserved, 0, sizeof(desc->__reserved))) {
+		fsverity_err(inode, "Reserved bits set in descriptor");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (desc->salt_size > sizeof(desc->salt)) {
+		fsverity_err(inode, "Invalid salt_size: %u", desc->salt_size);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (le64_to_cpu(desc->data_size) != inode->i_size) {
+		fsverity_err(inode,
+			     "Wrong data_size: %llu (desc) != %lld (inode)",
+			     le64_to_cpu(desc->data_size), inode->i_size);
+		return ERR_PTR(-EINVAL);
+	}
+
+	vi = kmem_cache_zalloc(fsverity_info_cachep, GFP_KERNEL);
+	if (!vi)
+		return ERR_PTR(-ENOMEM);
+	vi->inode = inode;
+
+	err = fsverity_init_merkle_tree_params(&vi->tree_params, inode,
+					       desc->hash_algorithm,
+					       desc->log_blocksize,
+					       desc->salt, desc->salt_size);
+	if (err) {
+		fsverity_err(inode,
+			     "Error %d initializing Merkle tree parameters",
+			     err);
+		goto out;
+	}
+
+	memcpy(vi->root_hash, desc->root_hash, vi->tree_params.digest_size);
+
+	err = compute_file_measurement(vi->tree_params.hash_alg, desc,
+				       vi->measurement);
+	if (err) {
+		fsverity_err(vi->inode, "Error %d computing file measurement",
+			     err);
+		goto out;
+	}
+	pr_debug("Computed file measurement: %s:%*phN\n",
+		 vi->tree_params.hash_alg->name,
+		 vi->tree_params.hash_alg->digest_size, vi->measurement);
+out:
+	if (err) {
+		free_verity_info(vi);
+		vi = ERR_PTR(err);
+	}
+	return vi;
+}
+
+/* Ensure the inode has an ->i_verity_info */
+static int ensure_verity_info(struct inode *inode)
+{
+	struct fsverity_info *vi = get_verity_info(inode);
+	struct fsverity_descriptor *desc;
+	int res;
+
+	if (vi)
+		return 0;
+
+	res = inode->i_sb->s_vop->get_verity_descriptor(inode, NULL, 0);
+	if (res < 0) {
+		fsverity_err(inode,
+			     "Error %d getting verity descriptor size", res);
+		return res;
+	}
+	if (res > FS_VERITY_MAX_DESCRIPTOR_SIZE) {
+		fsverity_err(inode, "Verity descriptor is too large (%d bytes)",
+			     res);
+		return -EMSGSIZE;
+	}
+	desc = kmalloc(res, GFP_KERNEL);
+	if (!desc)
+		return -ENOMEM;
+	res = inode->i_sb->s_vop->get_verity_descriptor(inode, desc, res);
+	if (res < 0) {
+		fsverity_err(inode, "Error %d reading verity descriptor", res);
+		goto out_free_desc;
+	}
+
+	vi = fsverity_create_info(inode, desc, res);
+	if (IS_ERR(vi)) {
+		res = PTR_ERR(vi);
+		goto out_free_desc;
+	}
+
+	/*
+	 * Multiple processes may race to set ->i_verity_info, so use cmpxchg.
+	 * This pairs with the READ_ONCE() in get_verity_info().
+	 */
+	if (cmpxchg_release(&inode->i_verity_info, NULL, vi) != NULL)
+		free_verity_info(vi);
+	res = 0;
+out_free_desc:
+	kfree(desc);
+	return res;
+}
+
+/**
+ * fsverity_file_open - prepare to open a verity file
+ * @inode: the inode being opened
+ * @filp: the struct file being set up
+ *
+ * When opening a verity file, deny the open if it is for writing.  Otherwise,
+ * set up the inode's ->i_verity_info if not already done.
+ *
+ * When combined with fscrypt, this must be called after fscrypt_file_open().
+ * Otherwise, we won't have the key set up to decrypt the verity metadata.
+ *
+ * Return: 0 on success, -errno on failure
+ */
+int fsverity_file_open(struct inode *inode, struct file *filp)
+{
+	if (!IS_VERITY(inode))
+		return 0;
+
+	if (filp->f_mode & FMODE_WRITE) {
+		pr_debug("Denying opening verity file (ino %lu) for write\n",
+			 inode->i_ino);
+		return -EPERM;
+	}
+
+	return ensure_verity_info(inode);
+}
+EXPORT_SYMBOL_GPL(fsverity_file_open);
+
+/**
+ * fsverity_cleanup_inode - free the inode's verity info, if present
+ *
+ * Filesystems must call this on inode eviction to free ->i_verity_info.
+ */
+void fsverity_cleanup_inode(struct inode *inode)
+{
+	free_verity_info(inode->i_verity_info);
+	inode->i_verity_info = NULL;
+}
+EXPORT_SYMBOL_GPL(fsverity_cleanup_inode);
+
+int __init fsverity_init_info_cache(void)
+{
+	fsverity_info_cachep = KMEM_CACHE_USERCOPY(fsverity_info,
+						   SLAB_RECLAIM_ACCOUNT,
+						   measurement);
+	if (!fsverity_info_cachep)
+		return -ENOMEM;
+	return 0;
+}
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
new file mode 100644
index 0000000000000..3b60195e3c51a
--- /dev/null
+++ b/include/linux/fsverity.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * fs-verity: read-only file-based authenticity protection
+ *
+ * This header declares the interface between the fs/verity/ support layer and
+ * filesystems that support fs-verity.
+ *
+ * Copyright 2019 Google LLC
+ */
+
+#ifndef _LINUX_FSVERITY_H
+#define _LINUX_FSVERITY_H
+
+#include <linux/fs.h>
+#include <uapi/linux/fsverity.h>
+
+/* Verity operations for filesystems */
+struct fsverity_operations {
+
+	/**
+	 * Get the verity descriptor of the given inode.
+	 *
+	 * @inode: an inode with the S_VERITY flag set
+	 * @buf: buffer in which to place the verity descriptor
+	 * @bufsize: size of @buf, or 0 to retrieve the size only
+	 *
+	 * If bufsize == 0, then the size of the verity descriptor is returned.
+	 * Otherwise the verity descriptor is written to 'buf' and its actual
+	 * size is returned; -ERANGE is returned if it's too large.  This may be
+	 * called by multiple processes concurrently on the same inode.
+	 *
+	 * Return: the size on success, -errno on failure
+	 */
+	int (*get_verity_descriptor)(struct inode *inode, void *buf,
+				     size_t bufsize);
+};
+
+#ifdef CONFIG_FS_VERITY
+
+/* open.c */
+
+extern int fsverity_file_open(struct inode *inode, struct file *filp);
+extern void fsverity_cleanup_inode(struct inode *inode);
+
+#else /* !CONFIG_FS_VERITY */
+
+/* open.c */
+
+static inline int fsverity_file_open(struct inode *inode, struct file *filp)
+{
+	return IS_VERITY(inode) ? -EOPNOTSUPP : 0;
+}
+
+static inline void fsverity_cleanup_inode(struct inode *inode)
+{
+}
+
+#endif	/* !CONFIG_FS_VERITY */
+
+#endif	/* _LINUX_FSVERITY_H */
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
