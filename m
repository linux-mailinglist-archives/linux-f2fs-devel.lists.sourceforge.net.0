Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B713282E5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 May 2019 18:21:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hTqSh-00069t-4B; Thu, 23 May 2019 16:20:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hTqSf-00069e-Kl
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 16:20:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5JnOdeGUhmEQE6Nxk67/CAqLZJ96Dgw7k3pwEUP+SFo=; b=A6n+X/YxCHlKY4s1OFG4AJl3Px
 nMb5JT4wJ7qzQnnFpJDmGHQZqTTADPCIt4PsuMw2vi8Mp+GKhsAJWUxhg2ClHgFWFqkk/jLWPcWjr
 pNSJmBTHyU6J7AOAbh/vL91WwaFdBIiW542VhzJKaPVBc8Pjq7Xckyj3LNmhX789bex0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5JnOdeGUhmEQE6Nxk67/CAqLZJ96Dgw7k3pwEUP+SFo=; b=UqbopQdoDQVAuSzq1vHKGHRbOp
 h3PRwrKNtNQD+1yMqXHwXcAChOmXLMbrhqxI3N3EjZTiMYjkEDgJjw7wdEJ9X72ZvCm4n27U1KzJG
 OpbwRRmaCTGLVwJ+IlV4ZIc/jacGqnvkdlqRxpsIjiPt8kUCWozb38/DfCsfGtqvMzII=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hTqSd-00356g-Ox
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 16:20:57 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B56FA21882;
 Thu, 23 May 2019 16:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558628441;
 bh=k/9SN4bhxRJTXByl5jr8ICENSoNTXp8Ufx7bFr8Cpb8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wsjvKcALUckE3Vioxtko5f857IN5AIlJ2i5siGL5Mc8rOa2aurPQn1lJgYHRCKH1W
 jhOrr5ezPVTCT9njgbXeNetrn2AqhYVxdMEXvALCeJdRNCfC1dKuK964e/pcjar0R4
 GqPOGn7ViiNNSdW27m2Ibz2Dy8kDe/3d61uV3S/M=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Thu, 23 May 2019 09:18:11 -0700
Message-Id: <20190523161811.6259-16-ebiggers@kernel.org>
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
X-Headers-End: 1hTqSd-00356g-Ox
Subject: [f2fs-dev] [PATCH v3 15/15] f2fs: add fs-verity support
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

Add fs-verity support to f2fs.  fs-verity is a filesystem feature that
enables transparent integrity protection and authentication of read-only
files.  It uses a dm-verity like mechanism at the file level: a Merkle
tree is used to verify any block in the file in log(filesize) time.  It
is implemented mainly by helper functions in fs/verity/.  See
Documentation/filesystems/fsverity.rst for the full documentation.

The f2fs support for fs-verity consists of:

- Adding a filesystem feature flag and an inode flag for fs-verity.

- Implementing the fsverity_operations to support enabling verity on an
  inode and reading/writing the verity metadata.

- Updating ->readpages() to verify data as it's read from verity files
  and to support reading verity metadata pages.

- Updating ->write_begin(), ->write_end(), and ->writepages() to support
  writing verity metadata pages.

- Calling the fs-verity hooks for ->open(), ->setattr(), and ->ioctl().

Like ext4, f2fs stores the verity metadata (Merkle tree and
fsverity_descriptor) past the end of the file, starting at the first
page fully beyond i_size.  This approach works because (a) verity files
are readonly, and (b) pages fully beyond i_size aren't visible to
userspace but can be read/written internally by f2fs with only some
relatively small changes to f2fs.  Extended attributes cannot be used
because (a) f2fs limits the total size of an inode's xattr entries to
4096 bytes, which wouldn't be enough for even a single Merkle tree
block, and (b) f2fs encryption doesn't encrypt xattrs, yet the verity
metadata *must* be encrypted when the file is because it contains hashes
of the plaintext data.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/Makefile |   1 +
 fs/f2fs/data.c   |  72 +++++++++++++--
 fs/f2fs/f2fs.h   |  21 ++++-
 fs/f2fs/file.c   |  38 ++++++++
 fs/f2fs/inode.c  |   5 +-
 fs/f2fs/super.c  |   3 +
 fs/f2fs/sysfs.c  |  11 +++
 fs/f2fs/verity.c | 224 +++++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/xattr.h  |   2 +
 9 files changed, 364 insertions(+), 13 deletions(-)
 create mode 100644 fs/f2fs/verity.c

diff --git a/fs/f2fs/Makefile b/fs/f2fs/Makefile
index 776c4b9365049..2aaecc63834fc 100644
--- a/fs/f2fs/Makefile
+++ b/fs/f2fs/Makefile
@@ -8,3 +8,4 @@ f2fs-$(CONFIG_F2FS_STAT_FS) += debug.o
 f2fs-$(CONFIG_F2FS_FS_XATTR) += xattr.o
 f2fs-$(CONFIG_F2FS_FS_POSIX_ACL) += acl.o
 f2fs-$(CONFIG_F2FS_IO_TRACE) += trace.o
+f2fs-$(CONFIG_FS_VERITY) += verity.o
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index eda4181d20926..2b918619668ba 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -73,6 +73,7 @@ static enum count_type __read_io_type(struct page *page)
 enum bio_post_read_step {
 	STEP_INITIAL = 0,
 	STEP_DECRYPT,
+	STEP_VERITY,
 };
 
 struct bio_post_read_ctx {
@@ -119,8 +120,23 @@ static void decrypt_work(struct work_struct *work)
 	bio_post_read_processing(ctx);
 }
 
+static void verity_work(struct work_struct *work)
+{
+	struct bio_post_read_ctx *ctx =
+		container_of(work, struct bio_post_read_ctx, work);
+
+	fsverity_verify_bio(ctx->bio);
+
+	bio_post_read_processing(ctx);
+}
+
 static void bio_post_read_processing(struct bio_post_read_ctx *ctx)
 {
+	/*
+	 * We use different work queues for decryption and for verity because
+	 * verity may require reading metadata pages that need decryption, and
+	 * we shouldn't recurse to the same workqueue.
+	 */
 	switch (++ctx->cur_step) {
 	case STEP_DECRYPT:
 		if (ctx->enabled_steps & (1 << STEP_DECRYPT)) {
@@ -130,6 +146,14 @@ static void bio_post_read_processing(struct bio_post_read_ctx *ctx)
 		}
 		ctx->cur_step++;
 		/* fall-through */
+	case STEP_VERITY:
+		if (ctx->enabled_steps & (1 << STEP_VERITY)) {
+			INIT_WORK(&ctx->work, verity_work);
+			fsverity_enqueue_verify_work(&ctx->work);
+			return;
+		}
+		ctx->cur_step++;
+		/* fall-through */
 	default:
 		__read_end_io(ctx->bio);
 	}
@@ -553,8 +577,15 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	up_write(&io->io_rwsem);
 }
 
+static inline bool f2fs_need_verity(const struct inode *inode, pgoff_t idx)
+{
+	return IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode) &&
+	       idx < (inode->i_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
+}
+
 static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
-					unsigned nr_pages, unsigned op_flag)
+				      unsigned nr_pages, unsigned op_flag,
+				      pgoff_t first_idx)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct bio *bio;
@@ -570,6 +601,10 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 
 	if (f2fs_encrypted_file(inode))
 		post_read_steps |= 1 << STEP_DECRYPT;
+
+	if (f2fs_need_verity(inode, first_idx))
+		post_read_steps |= 1 << STEP_VERITY;
+
 	if (post_read_steps) {
 		ctx = mempool_alloc(bio_post_read_ctx_pool, GFP_NOFS);
 		if (!ctx) {
@@ -591,7 +626,7 @@ static int f2fs_submit_page_read(struct inode *inode, struct page *page,
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct bio *bio;
 
-	bio = f2fs_grab_read_bio(inode, blkaddr, 1, 0);
+	bio = f2fs_grab_read_bio(inode, blkaddr, 1, 0, page->index);
 	if (IS_ERR(bio))
 		return PTR_ERR(bio);
 
@@ -1514,6 +1549,15 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	return ret;
 }
 
+static inline loff_t f2fs_readpage_limit(struct inode *inode)
+{
+	if (IS_ENABLED(CONFIG_FS_VERITY) &&
+	    (IS_VERITY(inode) || f2fs_verity_in_progress(inode)))
+		return inode->i_sb->s_maxbytes;
+
+	return i_size_read(inode);
+}
+
 static int f2fs_read_single_page(struct inode *inode, struct page *page,
 					unsigned nr_pages,
 					struct f2fs_map_blocks *map,
@@ -1532,7 +1576,7 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 
 	block_in_file = (sector_t)page->index;
 	last_block = block_in_file + nr_pages;
-	last_block_in_file = (i_size_read(inode) + blocksize - 1) >>
+	last_block_in_file = (f2fs_readpage_limit(inode) + blocksize - 1) >>
 							blkbits;
 	if (last_block > last_block_in_file)
 		last_block = last_block_in_file;
@@ -1576,6 +1620,11 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 	} else {
 zero_out:
 		zero_user_segment(page, 0, PAGE_SIZE);
+		if (f2fs_need_verity(inode, page->index) &&
+		    !fsverity_verify_page(page)) {
+			ret = -EIO;
+			goto out;
+		}
 		if (!PageUptodate(page))
 			SetPageUptodate(page);
 		unlock_page(page);
@@ -1594,7 +1643,7 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 	}
 	if (bio == NULL) {
 		bio = f2fs_grab_read_bio(inode, block_nr, nr_pages,
-				is_readahead ? REQ_RAHEAD : 0);
+				is_readahead ? REQ_RAHEAD : 0, page->index);
 		if (IS_ERR(bio)) {
 			ret = PTR_ERR(bio);
 			bio = NULL;
@@ -1991,7 +2040,7 @@ static int __write_data_page(struct page *page, bool *submitted,
 	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
 		goto redirty_out;
 
-	if (page->index < end_index)
+	if (page->index < end_index || f2fs_verity_in_progress(inode))
 		goto write;
 
 	/*
@@ -2383,7 +2432,8 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 	 * the block addresses when there is no need to fill the page.
 	 */
 	if (!f2fs_has_inline_data(inode) && len == PAGE_SIZE &&
-			!is_inode_flag_set(inode, FI_NO_PREALLOC))
+	    !is_inode_flag_set(inode, FI_NO_PREALLOC) &&
+	    !f2fs_verity_in_progress(inode))
 		return 0;
 
 	/* f2fs_lock_op avoids race between write CP and convert_inline_page */
@@ -2522,7 +2572,8 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 	if (len == PAGE_SIZE || PageUptodate(page))
 		return 0;
 
-	if (!(pos & (PAGE_SIZE - 1)) && (pos + len) >= i_size_read(inode)) {
+	if (!(pos & (PAGE_SIZE - 1)) && (pos + len) >= i_size_read(inode) &&
+	    !f2fs_verity_in_progress(inode)) {
 		zero_user_segment(page, len, PAGE_SIZE);
 		return 0;
 	}
@@ -2585,7 +2636,8 @@ static int f2fs_write_end(struct file *file,
 
 	set_page_dirty(page);
 
-	if (pos + copied > i_size_read(inode))
+	if (pos + copied > i_size_read(inode) &&
+	    !f2fs_verity_in_progress(inode))
 		f2fs_i_size_write(inode, pos + copied);
 unlock_out:
 	f2fs_put_page(page, 1);
@@ -2906,7 +2958,9 @@ void f2fs_clear_page_cache_dirty_tag(struct page *page)
 
 int __init f2fs_init_post_read_processing(void)
 {
-	bio_post_read_ctx_cache = KMEM_CACHE(bio_post_read_ctx, 0);
+	bio_post_read_ctx_cache =
+		kmem_cache_create("f2fs_bio_post_read_ctx",
+				  sizeof(struct bio_post_read_ctx), 0, 0, NULL);
 	if (!bio_post_read_ctx_cache)
 		goto fail;
 	bio_post_read_ctx_pool =
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 06b89a9862ab2..4362e2ca9e38d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -25,6 +25,7 @@
 #include <crypto/hash.h>
 
 #include <linux/fscrypt.h>
+#include <linux/fsverity.h>
 
 #ifdef CONFIG_F2FS_CHECK_FS
 #define f2fs_bug_on(sbi, condition)	BUG_ON(condition)
@@ -148,7 +149,7 @@ struct f2fs_mount_info {
 #define F2FS_FEATURE_QUOTA_INO		0x0080
 #define F2FS_FEATURE_INODE_CRTIME	0x0100
 #define F2FS_FEATURE_LOST_FOUND		0x0200
-#define F2FS_FEATURE_VERITY		0x0400	/* reserved */
+#define F2FS_FEATURE_VERITY		0x0400
 #define F2FS_FEATURE_SB_CHKSUM		0x0800
 
 #define __F2FS_HAS_FEATURE(raw_super, mask)				\
@@ -626,7 +627,7 @@ enum {
 #define FADVISE_ENC_NAME_BIT	0x08
 #define FADVISE_KEEP_SIZE_BIT	0x10
 #define FADVISE_HOT_BIT		0x20
-#define FADVISE_VERITY_BIT	0x40	/* reserved */
+#define FADVISE_VERITY_BIT	0x40
 
 #define FADVISE_MODIFIABLE_BITS	(FADVISE_COLD_BIT | FADVISE_HOT_BIT)
 
@@ -646,6 +647,8 @@ enum {
 #define file_is_hot(inode)	is_file(inode, FADVISE_HOT_BIT)
 #define file_set_hot(inode)	set_file(inode, FADVISE_HOT_BIT)
 #define file_clear_hot(inode)	clear_file(inode, FADVISE_HOT_BIT)
+#define file_is_verity(inode)	is_file(inode, FADVISE_VERITY_BIT)
+#define file_set_verity(inode)	set_file(inode, FADVISE_VERITY_BIT)
 
 #define DEF_DIR_LEVEL		0
 
@@ -2417,6 +2420,7 @@ enum {
 	FI_PROJ_INHERIT,	/* indicate file inherits projectid */
 	FI_PIN_FILE,		/* indicate file should not be gced */
 	FI_ATOMIC_REVOKE_REQUEST, /* request to drop atomic data */
+	FI_VERITY_IN_PROGRESS,	/* building fs-verity Merkle tree */
 };
 
 static inline void __mark_inode_dirty_flag(struct inode *inode,
@@ -2456,6 +2460,12 @@ static inline void clear_inode_flag(struct inode *inode, int flag)
 	__mark_inode_dirty_flag(inode, flag, false);
 }
 
+static inline bool f2fs_verity_in_progress(struct inode *inode)
+{
+	return IS_ENABLED(CONFIG_FS_VERITY) &&
+	       is_inode_flag_set(inode, FI_VERITY_IN_PROGRESS);
+}
+
 static inline void set_acl_inode(struct inode *inode, umode_t mode)
 {
 	F2FS_I(inode)->i_acl_mode = mode;
@@ -3524,6 +3534,9 @@ void f2fs_exit_sysfs(void);
 int f2fs_register_sysfs(struct f2fs_sb_info *sbi);
 void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi);
 
+/* verity.c */
+extern const struct fsverity_operations f2fs_verityops;
+
 /*
  * crypto support
  */
@@ -3546,7 +3559,8 @@ static inline void f2fs_set_encrypted_inode(struct inode *inode)
  */
 static inline bool f2fs_post_read_required(struct inode *inode)
 {
-	return f2fs_encrypted_file(inode);
+	return S_ISREG(inode->i_mode) &&
+	       (IS_ENCRYPTED(inode) || IS_VERITY(inode));
 }
 
 #define F2FS_FEATURE_FUNCS(name, flagname) \
@@ -3564,6 +3578,7 @@ F2FS_FEATURE_FUNCS(flexible_inline_xattr, FLEXIBLE_INLINE_XATTR);
 F2FS_FEATURE_FUNCS(quota_ino, QUOTA_INO);
 F2FS_FEATURE_FUNCS(inode_crtime, INODE_CRTIME);
 F2FS_FEATURE_FUNCS(lost_found, LOST_FOUND);
+F2FS_FEATURE_FUNCS(verity, VERITY);
 F2FS_FEATURE_FUNCS(sb_chksum, SB_CHKSUM);
 
 #ifdef CONFIG_BLK_DEV_ZONED
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 45b45f37d347e..f6a7a67291c53 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -493,6 +493,10 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
 {
 	int err = fscrypt_file_open(inode, filp);
 
+	if (err)
+		return err;
+
+	err = fsverity_file_open(inode, filp);
 	if (err)
 		return err;
 
@@ -781,6 +785,10 @@ int f2fs_setattr(struct dentry *dentry, struct iattr *attr)
 	if (err)
 		return err;
 
+	err = fsverity_prepare_setattr(dentry, attr);
+	if (err)
+		return err;
+
 	if (is_quota_modification(inode, attr)) {
 		err = dquot_initialize(inode);
 		if (err)
@@ -2980,6 +2988,30 @@ static int f2fs_ioc_precache_extents(struct file *filp, unsigned long arg)
 	return f2fs_precache_extents(file_inode(filp));
 }
 
+static int f2fs_ioc_enable_verity(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+
+	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
+
+	if (!f2fs_sb_has_verity(F2FS_I_SB(inode))) {
+		f2fs_msg(inode->i_sb, KERN_WARNING,
+			 "Can't enable fs-verity on inode %lu: the verity feature is not enabled on this filesystem.\n",
+			 inode->i_ino);
+		return -EOPNOTSUPP;
+	}
+
+	return fsverity_ioctl_enable(filp, (const void __user *)arg);
+}
+
+static int f2fs_ioc_measure_verity(struct file *filp, unsigned long arg)
+{
+	if (!f2fs_sb_has_verity(F2FS_I_SB(file_inode(filp))))
+		return -EOPNOTSUPP;
+
+	return fsverity_ioctl_measure(filp, (void __user *)arg);
+}
+
 long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(filp)))))
@@ -3036,6 +3068,10 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_ioc_set_pin_file(filp, arg);
 	case F2FS_IOC_PRECACHE_EXTENTS:
 		return f2fs_ioc_precache_extents(filp, arg);
+	case FS_IOC_ENABLE_VERITY:
+		return f2fs_ioc_enable_verity(filp, arg);
+	case FS_IOC_MEASURE_VERITY:
+		return f2fs_ioc_measure_verity(filp, arg);
 	default:
 		return -ENOTTY;
 	}
@@ -3149,6 +3185,8 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_GET_PIN_FILE:
 	case F2FS_IOC_SET_PIN_FILE:
 	case F2FS_IOC_PRECACHE_EXTENTS:
+	case FS_IOC_ENABLE_VERITY:
+	case FS_IOC_MEASURE_VERITY:
 		break;
 	default:
 		return -ENOIOCTLCMD;
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index ccb02226dd2c0..b2f945b1afe50 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -46,9 +46,11 @@ void f2fs_set_inode_flags(struct inode *inode)
 		new_fl |= S_DIRSYNC;
 	if (file_is_encrypt(inode))
 		new_fl |= S_ENCRYPTED;
+	if (file_is_verity(inode))
+		new_fl |= S_VERITY;
 	inode_set_flags(inode, new_fl,
 			S_SYNC|S_APPEND|S_IMMUTABLE|S_NOATIME|S_DIRSYNC|
-			S_ENCRYPTED);
+			S_ENCRYPTED|S_VERITY);
 }
 
 static void __get_inode_rdev(struct inode *inode, struct f2fs_inode *ri)
@@ -749,6 +751,7 @@ void f2fs_evict_inode(struct inode *inode)
 	}
 out_clear:
 	fscrypt_put_encryption_info(inode);
+	fsverity_cleanup_inode(inode);
 	clear_inode(inode);
 }
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 6b959bbb336a3..ea4a247d6ed6f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3177,6 +3177,9 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	sb->s_op = &f2fs_sops;
 #ifdef CONFIG_FS_ENCRYPTION
 	sb->s_cop = &f2fs_cryptops;
+#endif
+#ifdef CONFIG_FS_VERITY
+	sb->s_vop = &f2fs_verityops;
 #endif
 	sb->s_xattr = f2fs_xattr_handlers;
 	sb->s_export_op = &f2fs_export_ops;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 729f46a3c9ee0..b3e28467db727 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -117,6 +117,9 @@ static ssize_t features_show(struct f2fs_attr *a,
 	if (f2fs_sb_has_lost_found(sbi))
 		len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
 				len ? ", " : "", "lost_found");
+	if (f2fs_sb_has_verity(sbi))
+		len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
+				len ? ", " : "", "verity");
 	if (f2fs_sb_has_sb_chksum(sbi))
 		len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
 				len ? ", " : "", "sb_checksum");
@@ -350,6 +353,7 @@ enum feat_id {
 	FEAT_QUOTA_INO,
 	FEAT_INODE_CRTIME,
 	FEAT_LOST_FOUND,
+	FEAT_VERITY,
 	FEAT_SB_CHECKSUM,
 };
 
@@ -367,6 +371,7 @@ static ssize_t f2fs_feature_show(struct f2fs_attr *a,
 	case FEAT_QUOTA_INO:
 	case FEAT_INODE_CRTIME:
 	case FEAT_LOST_FOUND:
+	case FEAT_VERITY:
 	case FEAT_SB_CHECKSUM:
 		return snprintf(buf, PAGE_SIZE, "supported\n");
 	}
@@ -455,6 +460,9 @@ F2FS_FEATURE_RO_ATTR(flexible_inline_xattr, FEAT_FLEXIBLE_INLINE_XATTR);
 F2FS_FEATURE_RO_ATTR(quota_ino, FEAT_QUOTA_INO);
 F2FS_FEATURE_RO_ATTR(inode_crtime, FEAT_INODE_CRTIME);
 F2FS_FEATURE_RO_ATTR(lost_found, FEAT_LOST_FOUND);
+#ifdef CONFIG_FS_VERITY
+F2FS_FEATURE_RO_ATTR(verity, FEAT_VERITY);
+#endif
 F2FS_FEATURE_RO_ATTR(sb_checksum, FEAT_SB_CHECKSUM);
 
 #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
@@ -517,6 +525,9 @@ static struct attribute *f2fs_feat_attrs[] = {
 	ATTR_LIST(quota_ino),
 	ATTR_LIST(inode_crtime),
 	ATTR_LIST(lost_found),
+#ifdef CONFIG_FS_VERITY
+	ATTR_LIST(verity),
+#endif
 	ATTR_LIST(sb_checksum),
 	NULL,
 };
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
new file mode 100644
index 0000000000000..65ff3a959a10a
--- /dev/null
+++ b/fs/f2fs/verity.c
@@ -0,0 +1,224 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * fs/f2fs/verity.c: fs-verity support for f2fs
+ *
+ * Copyright 2019 Google LLC
+ */
+
+/*
+ * Implementation of fsverity_operations for f2fs.
+ *
+ * Like ext4, f2fs stores the verity metadata (Merkle tree and
+ * fsverity_descriptor) past the end of the file, starting at the first page
+ * fully beyond i_size.  This approach works because (a) verity files are
+ * readonly, and (b) pages fully beyond i_size aren't visible to userspace but
+ * can be read/written internally by f2fs with only some relatively small
+ * changes to f2fs.  Extended attributes cannot be used because (a) f2fs limits
+ * the total size of an inode's xattr entries to 4096 bytes, which wouldn't be
+ * enough for even a single Merkle tree block, and (b) f2fs encryption doesn't
+ * encrypt xattrs, yet the verity metadata *must* be encrypted when the file is
+ * because it contains hashes of the plaintext data.
+ */
+
+#include <linux/f2fs_fs.h>
+
+#include "f2fs.h"
+#include "xattr.h"
+
+/*
+ * Read some verity metadata from the inode.  __vfs_read() can't be used because
+ * we need to read beyond i_size.
+ */
+static int pagecache_read(struct inode *inode, void *buf, size_t count,
+			  loff_t pos)
+{
+	const size_t orig_count = count;
+
+	while (count) {
+		size_t n = min_t(size_t, count,
+				 PAGE_SIZE - offset_in_page(pos));
+		struct page *page;
+		void *addr;
+
+		page = read_mapping_page(inode->i_mapping, pos >> PAGE_SHIFT,
+					 NULL);
+		if (IS_ERR(page))
+			return PTR_ERR(page);
+
+		addr = kmap_atomic(page);
+		memcpy(buf, addr + offset_in_page(pos), n);
+		kunmap_atomic(addr);
+
+		put_page(page);
+
+		buf += n;
+		pos += n;
+		count -= n;
+	}
+	return orig_count;
+}
+
+/*
+ * Write some verity metadata to the inode for FS_IOC_ENABLE_VERITY.
+ * kernel_write() can't be used because the file descriptor is readonly.
+ */
+static int pagecache_write(struct inode *inode, const void *buf, size_t count,
+			   loff_t pos)
+{
+	while (count) {
+		size_t n = min_t(size_t, count,
+				 PAGE_SIZE - offset_in_page(pos));
+		struct page *page;
+		void *fsdata;
+		void *addr;
+		int res;
+
+		res = pagecache_write_begin(NULL, inode->i_mapping, pos, n, 0,
+					    &page, &fsdata);
+		if (res)
+			return res;
+
+		addr = kmap_atomic(page);
+		memcpy(addr + offset_in_page(pos), buf, n);
+		kunmap_atomic(addr);
+
+		res = pagecache_write_end(NULL, inode->i_mapping, pos, n, n,
+					  page, fsdata);
+		if (res < 0)
+			return res;
+		if (res != n)
+			return -EIO;
+
+		buf += n;
+		pos += n;
+		count -= n;
+	}
+	return 0;
+}
+
+/*
+ * Format of f2fs verity xattr.  This points to the location of the verity
+ * descriptor within the file data rather than containing it directly because
+ * the verity descriptor *must* be encrypted when f2fs encryption is used.  But,
+ * f2fs encryption does not encrypt xattrs.
+ */
+struct fsverity_descriptor_location {
+	__le32 version;
+	__le32 size;
+	__le64 pos;
+};
+
+static int f2fs_begin_enable_verity(struct file *filp)
+{
+	struct inode *inode = file_inode(filp);
+	int err;
+
+	err = f2fs_convert_inline_inode(inode);
+	if (err)
+		return err;
+
+	err = dquot_initialize(inode);
+	if (err)
+		return err;
+
+	set_inode_flag(inode, FI_VERITY_IN_PROGRESS);
+	return 0;
+}
+
+static int f2fs_end_enable_verity(struct file *filp, const void *desc,
+				  size_t desc_size, u64 merkle_tree_size)
+{
+	struct inode *inode = file_inode(filp);
+	u64 desc_pos = round_up(inode->i_size, PAGE_SIZE) + merkle_tree_size;
+	struct fsverity_descriptor_location dloc = {
+		.version = cpu_to_le32(1),
+		.size = cpu_to_le32(desc_size),
+		.pos = cpu_to_le64(desc_pos),
+	};
+	int err = 0;
+
+	if (desc != NULL) {
+		/* Succeeded; write the verity descriptor. */
+		err = pagecache_write(inode, desc, desc_size, desc_pos);
+
+		/* Write all pages before clearing FI_VERITY_IN_PROGRESS. */
+		if (!err)
+			err = filemap_write_and_wait(inode->i_mapping);
+	} else {
+		/* Failed; truncate anything we wrote past i_size. */
+		f2fs_truncate(inode);
+	}
+
+	clear_inode_flag(inode, FI_VERITY_IN_PROGRESS);
+
+	if (desc != NULL && !err) {
+		err = f2fs_setxattr(inode, F2FS_XATTR_INDEX_VERITY,
+				    F2FS_XATTR_NAME_VERITY, &dloc, sizeof(dloc),
+				    NULL, XATTR_CREATE);
+		if (!err) {
+			file_set_verity(inode);
+			f2fs_set_inode_flags(inode);
+			f2fs_mark_inode_dirty_sync(inode, true);
+		}
+	}
+	return err;
+}
+
+static int f2fs_get_verity_descriptor(struct inode *inode, void *buf,
+				      size_t buf_size)
+{
+	struct fsverity_descriptor_location dloc;
+	int res;
+	u32 size;
+	u64 pos;
+
+	/* Get the descriptor location */
+	res = f2fs_getxattr(inode, F2FS_XATTR_INDEX_VERITY,
+			    F2FS_XATTR_NAME_VERITY, &dloc, sizeof(dloc), NULL);
+	if (res < 0 && res != -ERANGE)
+		return res;
+	if (res != sizeof(dloc) || dloc.version != cpu_to_le32(1)) {
+		f2fs_msg(inode->i_sb, KERN_WARNING,
+			 "unknown verity xattr format");
+		return -EINVAL;
+	}
+	size = le32_to_cpu(dloc.size);
+	pos = le64_to_cpu(dloc.pos);
+
+	/* Get the descriptor */
+	if (pos + size < pos || pos + size > inode->i_sb->s_maxbytes ||
+	    pos < round_up(inode->i_size, PAGE_SIZE)) {
+		f2fs_msg(inode->i_sb, KERN_WARNING, "invalid verity xattr");
+		return -EUCLEAN; /* EFSCORRUPTED */
+	}
+	if (buf_size == 0)
+		return size;
+	if (size > buf_size)
+		return -ERANGE;
+	return pagecache_read(inode, buf, size, pos);
+}
+
+static struct page *f2fs_read_merkle_tree_page(struct inode *inode,
+					       pgoff_t index)
+{
+	index += DIV_ROUND_UP(inode->i_size, PAGE_SIZE);
+
+	return read_mapping_page(inode->i_mapping, index, NULL);
+}
+
+static int f2fs_write_merkle_tree_block(struct inode *inode, const void *buf,
+					u64 index, int log_blocksize)
+{
+	loff_t pos = round_up(inode->i_size, PAGE_SIZE) +
+		     (index << log_blocksize);
+
+	return pagecache_write(inode, buf, 1 << log_blocksize, pos);
+}
+
+const struct fsverity_operations f2fs_verityops = {
+	.begin_enable_verity	= f2fs_begin_enable_verity,
+	.end_enable_verity	= f2fs_end_enable_verity,
+	.get_verity_descriptor	= f2fs_get_verity_descriptor,
+	.read_merkle_tree_page	= f2fs_read_merkle_tree_page,
+	.write_merkle_tree_block = f2fs_write_merkle_tree_block,
+};
diff --git a/fs/f2fs/xattr.h b/fs/f2fs/xattr.h
index a90920e2f9498..de0c600b9cab0 100644
--- a/fs/f2fs/xattr.h
+++ b/fs/f2fs/xattr.h
@@ -34,8 +34,10 @@
 #define F2FS_XATTR_INDEX_ADVISE			7
 /* Should be same as EXT4_XATTR_INDEX_ENCRYPTION */
 #define F2FS_XATTR_INDEX_ENCRYPTION		9
+#define F2FS_XATTR_INDEX_VERITY			11
 
 #define F2FS_XATTR_NAME_ENCRYPTION_CONTEXT	"c"
+#define F2FS_XATTR_NAME_VERITY			"v"
 
 struct f2fs_xattr_header {
 	__le32  h_magic;        /* magic number for identification */
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
