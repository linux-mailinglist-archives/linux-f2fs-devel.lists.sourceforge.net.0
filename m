Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3030705F7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jul 2019 18:54:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hpbZe-00008b-Dj; Mon, 22 Jul 2019 16:54:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hpbZd-000085-8u
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Jul 2019 16:54:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sdBrNyXcKr+vgytoXv4facvejQlY1kxpXShuMIJJzKo=; b=Hx2dRaRvtozf4Ow+FHF8Apl3L9
 u78p2SOPaP7mADw35rKTfDK2BeN3l9PJ/+lQEu8GpCZj+QtwkTKMd/SS+DwtHeqGUIeJ3exdknNUV
 fg7UW5L4diJybDbTto9Q4RalGZFk6BRpIvEfq2/Ri/kyyyccezCI02coAhc1eqTqrvIw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sdBrNyXcKr+vgytoXv4facvejQlY1kxpXShuMIJJzKo=; b=IAkhSnV4fCQJ//w+q0tAoW2PG0
 zSjR+V+4kse8ygsS99EDSS52jdzce3D48AWbSU5Z2cgvRcW2gWqfNvDrtI6JJ3HsRYo09sQYZlmd8
 9am5YCj9NCtbcfOguWHN8p2W1dTnWX6HgGr59299OtRfx8Jr64rmJrf8TcQIvkkO9TWo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hpbZa-00CTNa-Eg
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Jul 2019 16:54:05 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BF6552238C;
 Mon, 22 Jul 2019 16:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563814436;
 bh=a1lt2im1dXQZLoUo2SwT51vUdJjd+Q3r+XWFt6KXi5Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NOEwJOnpBv+Nhp2k6WGxiiUqnvzOGKL1WSv2ZDNeRvgVTOs5PqM18KSy18aOE6Gee
 tYEDOI1JJ8iEPEKR0UR94V327fOcPks1Lr6WebWo1I5LAGKx+hJ6l8sP/6eVfcyWSS
 EGBfIqqJWX6m1ogUAFCiHYiHu35Z3hbkAAXeZ+wk=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 22 Jul 2019 09:50:58 -0700
Message-Id: <20190722165101.12840-15-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190722165101.12840-1-ebiggers@kernel.org>
References: <20190722165101.12840-1-ebiggers@kernel.org>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hpbZa-00CTNa-Eg
Subject: [f2fs-dev] [PATCH v7 14/17] ext4: add basic fs-verity support
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>,
 "Darrick J . Wong" <darrick.wong@oracle.com>, linux-api@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-integrity@vger.kernel.org, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Add most of fs-verity support to ext4.  fs-verity is a filesystem
feature that enables transparent integrity protection and authentication
of read-only files.  It uses a dm-verity like mechanism at the file
level: a Merkle tree is used to verify any block in the file in
log(filesize) time.  It is implemented mainly by helper functions in
fs/verity/.  See Documentation/filesystems/fsverity.rst for the full
documentation.

This commit adds all of ext4 fs-verity support except for the actual
data verification, including:

- Adding a filesystem feature flag and an inode flag for fs-verity.

- Implementing the fsverity_operations to support enabling verity on an
  inode and reading/writing the verity metadata.

- Updating ->write_begin(), ->write_end(), and ->writepages() to support
  writing verity metadata pages.

- Calling the fs-verity hooks for ->open(), ->setattr(), and ->ioctl().

ext4 stores the verity metadata (Merkle tree and fsverity_descriptor)
past the end of the file, starting at the first 64K boundary beyond
i_size.  This approach works because (a) verity files are readonly, and
(b) pages fully beyond i_size aren't visible to userspace but can be
read/written internally by ext4 with only some relatively small changes
to ext4.  This approach avoids having to depend on the EA_INODE feature
and on rearchitecturing ext4's xattr support to support paging
multi-gigabyte xattrs into memory, and to support encrypting xattrs.
Note that the verity metadata *must* be encrypted when the file is,
since it contains hashes of the plaintext data.

This patch incorporates work by Theodore Ts'o and Chandan Rajendra.

Reviewed-by: Theodore Ts'o <tytso@mit.edu>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/Makefile |   1 +
 fs/ext4/ext4.h   |  21 ++-
 fs/ext4/file.c   |   4 +
 fs/ext4/inode.c  |  46 ++++--
 fs/ext4/ioctl.c  |  12 ++
 fs/ext4/super.c  |   9 ++
 fs/ext4/sysfs.c  |   6 +
 fs/ext4/verity.c | 367 +++++++++++++++++++++++++++++++++++++++++++++++
 8 files changed, 451 insertions(+), 15 deletions(-)
 create mode 100644 fs/ext4/verity.c

diff --git a/fs/ext4/Makefile b/fs/ext4/Makefile
index 8fdfcd3c3e043..b17ddc229ac5f 100644
--- a/fs/ext4/Makefile
+++ b/fs/ext4/Makefile
@@ -13,3 +13,4 @@ ext4-y	:= balloc.o bitmap.o block_validity.o dir.o ext4_jbd2.o extents.o \
 
 ext4-$(CONFIG_EXT4_FS_POSIX_ACL)	+= acl.o
 ext4-$(CONFIG_EXT4_FS_SECURITY)		+= xattr_security.o
+ext4-$(CONFIG_FS_VERITY)		+= verity.o
diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index bf660aa7a9e08..736972f46ea69 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -41,6 +41,7 @@
 #endif
 
 #include <linux/fscrypt.h>
+#include <linux/fsverity.h>
 
 #include <linux/compiler.h>
 
@@ -395,6 +396,7 @@ struct flex_groups {
 #define EXT4_TOPDIR_FL			0x00020000 /* Top of directory hierarchies*/
 #define EXT4_HUGE_FILE_FL               0x00040000 /* Set to each huge file */
 #define EXT4_EXTENTS_FL			0x00080000 /* Inode uses extents */
+#define EXT4_VERITY_FL			0x00100000 /* Verity protected inode */
 #define EXT4_EA_INODE_FL	        0x00200000 /* Inode used for large EA */
 #define EXT4_EOFBLOCKS_FL		0x00400000 /* Blocks allocated beyond EOF */
 #define EXT4_INLINE_DATA_FL		0x10000000 /* Inode has inline data. */
@@ -402,7 +404,7 @@ struct flex_groups {
 #define EXT4_CASEFOLD_FL		0x40000000 /* Casefolded file */
 #define EXT4_RESERVED_FL		0x80000000 /* reserved for ext4 lib */
 
-#define EXT4_FL_USER_VISIBLE		0x704BDFFF /* User visible flags */
+#define EXT4_FL_USER_VISIBLE		0x705BDFFF /* User visible flags */
 #define EXT4_FL_USER_MODIFIABLE		0x604BC0FF /* User modifiable flags */
 
 /* Flags we can manipulate with through EXT4_IOC_FSSETXATTR */
@@ -467,6 +469,7 @@ enum {
 	EXT4_INODE_TOPDIR	= 17,	/* Top of directory hierarchies*/
 	EXT4_INODE_HUGE_FILE	= 18,	/* Set to each huge file */
 	EXT4_INODE_EXTENTS	= 19,	/* Inode uses extents */
+	EXT4_INODE_VERITY	= 20,	/* Verity protected inode */
 	EXT4_INODE_EA_INODE	= 21,	/* Inode used for large EA */
 	EXT4_INODE_EOFBLOCKS	= 22,	/* Blocks allocated beyond EOF */
 	EXT4_INODE_INLINE_DATA	= 28,	/* Data in inode. */
@@ -512,6 +515,7 @@ static inline void ext4_check_flag_values(void)
 	CHECK_FLAG_VALUE(TOPDIR);
 	CHECK_FLAG_VALUE(HUGE_FILE);
 	CHECK_FLAG_VALUE(EXTENTS);
+	CHECK_FLAG_VALUE(VERITY);
 	CHECK_FLAG_VALUE(EA_INODE);
 	CHECK_FLAG_VALUE(EOFBLOCKS);
 	CHECK_FLAG_VALUE(INLINE_DATA);
@@ -1560,6 +1564,7 @@ enum {
 	EXT4_STATE_MAY_INLINE_DATA,	/* may have in-inode data */
 	EXT4_STATE_EXT_PRECACHED,	/* extents have been precached */
 	EXT4_STATE_LUSTRE_EA_INODE,	/* Lustre-style ea_inode */
+	EXT4_STATE_VERITY_IN_PROGRESS,	/* building fs-verity Merkle tree */
 };
 
 #define EXT4_INODE_BIT_FNS(name, field, offset)				\
@@ -1610,6 +1615,12 @@ static inline void ext4_clear_state_flags(struct ext4_inode_info *ei)
 #define EXT4_SB(sb)	(sb)
 #endif
 
+static inline bool ext4_verity_in_progress(struct inode *inode)
+{
+	return IS_ENABLED(CONFIG_FS_VERITY) &&
+	       ext4_test_inode_state(inode, EXT4_STATE_VERITY_IN_PROGRESS);
+}
+
 #define NEXT_ORPHAN(inode) EXT4_I(inode)->i_dtime
 
 /*
@@ -1662,6 +1673,7 @@ static inline void ext4_clear_state_flags(struct ext4_inode_info *ei)
 #define EXT4_FEATURE_RO_COMPAT_METADATA_CSUM	0x0400
 #define EXT4_FEATURE_RO_COMPAT_READONLY		0x1000
 #define EXT4_FEATURE_RO_COMPAT_PROJECT		0x2000
+#define EXT4_FEATURE_RO_COMPAT_VERITY		0x8000
 
 #define EXT4_FEATURE_INCOMPAT_COMPRESSION	0x0001
 #define EXT4_FEATURE_INCOMPAT_FILETYPE		0x0002
@@ -1756,6 +1768,7 @@ EXT4_FEATURE_RO_COMPAT_FUNCS(bigalloc,		BIGALLOC)
 EXT4_FEATURE_RO_COMPAT_FUNCS(metadata_csum,	METADATA_CSUM)
 EXT4_FEATURE_RO_COMPAT_FUNCS(readonly,		READONLY)
 EXT4_FEATURE_RO_COMPAT_FUNCS(project,		PROJECT)
+EXT4_FEATURE_RO_COMPAT_FUNCS(verity,		VERITY)
 
 EXT4_FEATURE_INCOMPAT_FUNCS(compression,	COMPRESSION)
 EXT4_FEATURE_INCOMPAT_FUNCS(filetype,		FILETYPE)
@@ -1813,7 +1826,8 @@ EXT4_FEATURE_INCOMPAT_FUNCS(casefold,		CASEFOLD)
 					 EXT4_FEATURE_RO_COMPAT_BIGALLOC |\
 					 EXT4_FEATURE_RO_COMPAT_METADATA_CSUM|\
 					 EXT4_FEATURE_RO_COMPAT_QUOTA |\
-					 EXT4_FEATURE_RO_COMPAT_PROJECT)
+					 EXT4_FEATURE_RO_COMPAT_PROJECT |\
+					 EXT4_FEATURE_RO_COMPAT_VERITY)
 
 #define EXTN_FEATURE_FUNCS(ver) \
 static inline bool ext4_has_unknown_ext##ver##_compat_features(struct super_block *sb) \
@@ -3283,6 +3297,9 @@ extern int ext4_bio_write_page(struct ext4_io_submit *io,
 /* mmp.c */
 extern int ext4_multi_mount_protect(struct super_block *, ext4_fsblk_t);
 
+/* verity.c */
+extern const struct fsverity_operations ext4_verityops;
+
 /*
  * Add new method to test whether block and inode bitmaps are properly
  * initialized. With uninit_bg reading the block from disk is not enough
diff --git a/fs/ext4/file.c b/fs/ext4/file.c
index 70b0438dbc944..b8a20bb9a1453 100644
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@ -457,6 +457,10 @@ static int ext4_file_open(struct inode * inode, struct file * filp)
 	if (ret)
 		return ret;
 
+	ret = fsverity_file_open(inode, filp);
+	if (ret)
+		return ret;
+
 	/*
 	 * Set up the jbd2_inode if we are opening the inode for
 	 * writing and the journal is present
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 420fe3deed397..515b9ea4c78e9 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -1406,6 +1406,7 @@ static int ext4_write_end(struct file *file,
 	int ret = 0, ret2;
 	int i_size_changed = 0;
 	int inline_data = ext4_has_inline_data(inode);
+	bool verity = ext4_verity_in_progress(inode);
 
 	trace_ext4_write_end(inode, pos, len, copied);
 	if (inline_data) {
@@ -1423,12 +1424,16 @@ static int ext4_write_end(struct file *file,
 	/*
 	 * it's important to update i_size while still holding page lock:
 	 * page writeout could otherwise come in and zero beyond i_size.
+	 *
+	 * If FS_IOC_ENABLE_VERITY is running on this inode, then Merkle tree
+	 * blocks are being written past EOF, so skip the i_size update.
 	 */
-	i_size_changed = ext4_update_inode_size(inode, pos + copied);
+	if (!verity)
+		i_size_changed = ext4_update_inode_size(inode, pos + copied);
 	unlock_page(page);
 	put_page(page);
 
-	if (old_size < pos)
+	if (old_size < pos && !verity)
 		pagecache_isize_extended(inode, old_size, pos);
 	/*
 	 * Don't mark the inode dirty under page lock. First, it unnecessarily
@@ -1439,7 +1444,7 @@ static int ext4_write_end(struct file *file,
 	if (i_size_changed || inline_data)
 		ext4_mark_inode_dirty(handle, inode);
 
-	if (pos + len > inode->i_size && ext4_can_truncate(inode))
+	if (pos + len > inode->i_size && !verity && ext4_can_truncate(inode))
 		/* if we have allocated more blocks and copied
 		 * less. We will have blocks allocated outside
 		 * inode->i_size. So truncate them
@@ -1450,7 +1455,7 @@ static int ext4_write_end(struct file *file,
 	if (!ret)
 		ret = ret2;
 
-	if (pos + len > inode->i_size) {
+	if (pos + len > inode->i_size && !verity) {
 		ext4_truncate_failed_write(inode);
 		/*
 		 * If truncate failed early the inode might still be
@@ -1511,6 +1516,7 @@ static int ext4_journalled_write_end(struct file *file,
 	unsigned from, to;
 	int size_changed = 0;
 	int inline_data = ext4_has_inline_data(inode);
+	bool verity = ext4_verity_in_progress(inode);
 
 	trace_ext4_journalled_write_end(inode, pos, len, copied);
 	from = pos & (PAGE_SIZE - 1);
@@ -1540,13 +1546,14 @@ static int ext4_journalled_write_end(struct file *file,
 		if (!partial)
 			SetPageUptodate(page);
 	}
-	size_changed = ext4_update_inode_size(inode, pos + copied);
+	if (!verity)
+		size_changed = ext4_update_inode_size(inode, pos + copied);
 	ext4_set_inode_state(inode, EXT4_STATE_JDATA);
 	EXT4_I(inode)->i_datasync_tid = handle->h_transaction->t_tid;
 	unlock_page(page);
 	put_page(page);
 
-	if (old_size < pos)
+	if (old_size < pos && !verity)
 		pagecache_isize_extended(inode, old_size, pos);
 
 	if (size_changed || inline_data) {
@@ -1555,7 +1562,7 @@ static int ext4_journalled_write_end(struct file *file,
 			ret = ret2;
 	}
 
-	if (pos + len > inode->i_size && ext4_can_truncate(inode))
+	if (pos + len > inode->i_size && !verity && ext4_can_truncate(inode))
 		/* if we have allocated more blocks and copied
 		 * less. We will have blocks allocated outside
 		 * inode->i_size. So truncate them
@@ -1566,7 +1573,7 @@ static int ext4_journalled_write_end(struct file *file,
 	ret2 = ext4_journal_stop(handle);
 	if (!ret)
 		ret = ret2;
-	if (pos + len > inode->i_size) {
+	if (pos + len > inode->i_size && !verity) {
 		ext4_truncate_failed_write(inode);
 		/*
 		 * If truncate failed early the inode might still be
@@ -2162,7 +2169,8 @@ static int ext4_writepage(struct page *page,
 
 	trace_ext4_writepage(page);
 	size = i_size_read(inode);
-	if (page->index == size >> PAGE_SHIFT)
+	if (page->index == size >> PAGE_SHIFT &&
+	    !ext4_verity_in_progress(inode))
 		len = size & ~PAGE_MASK;
 	else
 		len = PAGE_SIZE;
@@ -2246,7 +2254,8 @@ static int mpage_submit_page(struct mpage_da_data *mpd, struct page *page)
 	 * after page tables are updated.
 	 */
 	size = i_size_read(mpd->inode);
-	if (page->index == size >> PAGE_SHIFT)
+	if (page->index == size >> PAGE_SHIFT &&
+	    !ext4_verity_in_progress(mpd->inode))
 		len = size & ~PAGE_MASK;
 	else
 		len = PAGE_SIZE;
@@ -2345,6 +2354,9 @@ static int mpage_process_page_bufs(struct mpage_da_data *mpd,
 	ext4_lblk_t blocks = (i_size_read(inode) + i_blocksize(inode) - 1)
 							>> inode->i_blkbits;
 
+	if (ext4_verity_in_progress(inode))
+		blocks = EXT_MAX_BLOCKS;
+
 	do {
 		BUG_ON(buffer_locked(bh));
 
@@ -3061,8 +3073,8 @@ static int ext4_da_write_begin(struct file *file, struct address_space *mapping,
 
 	index = pos >> PAGE_SHIFT;
 
-	if (ext4_nonda_switch(inode->i_sb) ||
-	    S_ISLNK(inode->i_mode)) {
+	if (ext4_nonda_switch(inode->i_sb) || S_ISLNK(inode->i_mode) ||
+	    ext4_verity_in_progress(inode)) {
 		*fsdata = (void *)FALL_BACK_TO_NONDELALLOC;
 		return ext4_write_begin(file, mapping, pos,
 					len, flags, pagep, fsdata);
@@ -4739,6 +4751,8 @@ static bool ext4_should_use_dax(struct inode *inode)
 		return false;
 	if (ext4_test_inode_flag(inode, EXT4_INODE_ENCRYPT))
 		return false;
+	if (ext4_test_inode_flag(inode, EXT4_INODE_VERITY))
+		return false;
 	return true;
 }
 
@@ -4763,9 +4777,11 @@ void ext4_set_inode_flags(struct inode *inode)
 		new_fl |= S_ENCRYPTED;
 	if (flags & EXT4_CASEFOLD_FL)
 		new_fl |= S_CASEFOLD;
+	if (flags & EXT4_VERITY_FL)
+		new_fl |= S_VERITY;
 	inode_set_flags(inode, new_fl,
 			S_SYNC|S_APPEND|S_IMMUTABLE|S_NOATIME|S_DIRSYNC|S_DAX|
-			S_ENCRYPTED|S_CASEFOLD);
+			S_ENCRYPTED|S_CASEFOLD|S_VERITY);
 }
 
 static blkcnt_t ext4_inode_blocks(struct ext4_inode *raw_inode,
@@ -5555,6 +5571,10 @@ int ext4_setattr(struct dentry *dentry, struct iattr *attr)
 	if (error)
 		return error;
 
+	error = fsverity_prepare_setattr(dentry, attr);
+	if (error)
+		return error;
+
 	if (is_quota_modification(inode, attr)) {
 		error = dquot_initialize(inode);
 		if (error)
diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
index 442f7ef873fc3..ddce231d0086c 100644
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -1115,6 +1115,16 @@ long ext4_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	case EXT4_IOC_GET_ENCRYPTION_POLICY:
 		return fscrypt_ioctl_get_policy(filp, (void __user *)arg);
 
+	case FS_IOC_ENABLE_VERITY:
+		if (!ext4_has_feature_verity(sb))
+			return -EOPNOTSUPP;
+		return fsverity_ioctl_enable(filp, (const void __user *)arg);
+
+	case FS_IOC_MEASURE_VERITY:
+		if (!ext4_has_feature_verity(sb))
+			return -EOPNOTSUPP;
+		return fsverity_ioctl_measure(filp, (void __user *)arg);
+
 	case EXT4_IOC_FSGETXATTR:
 	{
 		struct fsxattr fa;
@@ -1231,6 +1241,8 @@ long ext4_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case EXT4_IOC_SET_ENCRYPTION_POLICY:
 	case EXT4_IOC_GET_ENCRYPTION_PWSALT:
 	case EXT4_IOC_GET_ENCRYPTION_POLICY:
+	case FS_IOC_ENABLE_VERITY:
+	case FS_IOC_MEASURE_VERITY:
 	case EXT4_IOC_SHUTDOWN:
 	case FS_IOC_GETFSMAP:
 		break;
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 4079605d437ae..05a9874687c36 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1179,6 +1179,7 @@ void ext4_clear_inode(struct inode *inode)
 		EXT4_I(inode)->jinode = NULL;
 	}
 	fscrypt_put_encryption_info(inode);
+	fsverity_cleanup_inode(inode);
 }
 
 static struct inode *ext4_nfs_get_inode(struct super_block *sb,
@@ -4272,6 +4273,9 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
 #ifdef CONFIG_FS_ENCRYPTION
 	sb->s_cop = &ext4_cryptops;
 #endif
+#ifdef CONFIG_FS_VERITY
+	sb->s_vop = &ext4_verityops;
+#endif
 #ifdef CONFIG_QUOTA
 	sb->dq_op = &ext4_quota_operations;
 	if (ext4_has_feature_quota(sb))
@@ -4419,6 +4423,11 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
 		goto failed_mount_wq;
 	}
 
+	if (ext4_has_feature_verity(sb) && blocksize != PAGE_SIZE) {
+		ext4_msg(sb, KERN_ERR, "Unsupported blocksize for fs-verity");
+		goto failed_mount_wq;
+	}
+
 	if (DUMMY_ENCRYPTION_ENABLED(sbi) && !sb_rdonly(sb) &&
 	    !ext4_has_feature_encrypt(sb)) {
 		ext4_set_feature_encrypt(sb);
diff --git a/fs/ext4/sysfs.c b/fs/ext4/sysfs.c
index b3cd7655a6ff8..eb1efad0e20a3 100644
--- a/fs/ext4/sysfs.c
+++ b/fs/ext4/sysfs.c
@@ -242,6 +242,9 @@ EXT4_ATTR_FEATURE(encryption);
 #ifdef CONFIG_UNICODE
 EXT4_ATTR_FEATURE(casefold);
 #endif
+#ifdef CONFIG_FS_VERITY
+EXT4_ATTR_FEATURE(verity);
+#endif
 EXT4_ATTR_FEATURE(metadata_csum_seed);
 
 static struct attribute *ext4_feat_attrs[] = {
@@ -253,6 +256,9 @@ static struct attribute *ext4_feat_attrs[] = {
 #endif
 #ifdef CONFIG_UNICODE
 	ATTR_LIST(casefold),
+#endif
+#ifdef CONFIG_FS_VERITY
+	ATTR_LIST(verity),
 #endif
 	ATTR_LIST(metadata_csum_seed),
 	NULL,
diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
new file mode 100644
index 0000000000000..bb0a3b8e6ea71
--- /dev/null
+++ b/fs/ext4/verity.c
@@ -0,0 +1,367 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * fs/ext4/verity.c: fs-verity support for ext4
+ *
+ * Copyright 2019 Google LLC
+ */
+
+/*
+ * Implementation of fsverity_operations for ext4.
+ *
+ * ext4 stores the verity metadata (Merkle tree and fsverity_descriptor) past
+ * the end of the file, starting at the first 64K boundary beyond i_size.  This
+ * approach works because (a) verity files are readonly, and (b) pages fully
+ * beyond i_size aren't visible to userspace but can be read/written internally
+ * by ext4 with only some relatively small changes to ext4.  This approach
+ * avoids having to depend on the EA_INODE feature and on rearchitecturing
+ * ext4's xattr support to support paging multi-gigabyte xattrs into memory, and
+ * to support encrypting xattrs.  Note that the verity metadata *must* be
+ * encrypted when the file is, since it contains hashes of the plaintext data.
+ *
+ * Using a 64K boundary rather than a 4K one keeps things ready for
+ * architectures with 64K pages, and it doesn't necessarily waste space on-disk
+ * since there can be a hole between i_size and the start of the Merkle tree.
+ */
+
+#include <linux/quotaops.h>
+
+#include "ext4.h"
+#include "ext4_extents.h"
+#include "ext4_jbd2.h"
+
+static inline loff_t ext4_verity_metadata_pos(const struct inode *inode)
+{
+	return round_up(inode->i_size, 65536);
+}
+
+/*
+ * Read some verity metadata from the inode.  __vfs_read() can't be used because
+ * we need to read beyond i_size.
+ */
+static int pagecache_read(struct inode *inode, void *buf, size_t count,
+			  loff_t pos)
+{
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
+	return 0;
+}
+
+/*
+ * Write some verity metadata to the inode for FS_IOC_ENABLE_VERITY.
+ * kernel_write() can't be used because the file descriptor is readonly.
+ */
+static int pagecache_write(struct inode *inode, const void *buf, size_t count,
+			   loff_t pos)
+{
+	if (pos + count > inode->i_sb->s_maxbytes)
+		return -EFBIG;
+
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
+static int ext4_begin_enable_verity(struct file *filp)
+{
+	struct inode *inode = file_inode(filp);
+	const int credits = 2; /* superblock and inode for ext4_orphan_add() */
+	handle_t *handle;
+	int err;
+
+	if (ext4_verity_in_progress(inode))
+		return -EBUSY;
+
+	/*
+	 * Since the file was opened readonly, we have to initialize the jbd
+	 * inode and quotas here and not rely on ->open() doing it.  This must
+	 * be done before evicting the inline data.
+	 */
+
+	err = ext4_inode_attach_jinode(inode);
+	if (err)
+		return err;
+
+	err = dquot_initialize(inode);
+	if (err)
+		return err;
+
+	err = ext4_convert_inline_data(inode);
+	if (err)
+		return err;
+
+	if (!ext4_test_inode_flag(inode, EXT4_INODE_EXTENTS)) {
+		ext4_warning_inode(inode,
+				   "verity is only allowed on extent-based files");
+		return -EOPNOTSUPP;
+	}
+
+	/*
+	 * ext4 uses the last allocated block to find the verity descriptor, so
+	 * we must remove any other blocks past EOF which might confuse things.
+	 */
+	err = ext4_truncate(inode);
+	if (err)
+		return err;
+
+	handle = ext4_journal_start(inode, EXT4_HT_INODE, credits);
+	if (IS_ERR(handle))
+		return PTR_ERR(handle);
+
+	err = ext4_orphan_add(handle, inode);
+	if (err == 0)
+		ext4_set_inode_state(inode, EXT4_STATE_VERITY_IN_PROGRESS);
+
+	ext4_journal_stop(handle);
+	return err;
+}
+
+/*
+ * ext4 stores the verity descriptor beginning on the next filesystem block
+ * boundary after the Merkle tree.  Then, the descriptor size is stored in the
+ * last 4 bytes of the last allocated filesystem block --- which is either the
+ * block in which the descriptor ends, or the next block after that if there
+ * weren't at least 4 bytes remaining.
+ *
+ * We can't simply store the descriptor in an xattr because it *must* be
+ * encrypted when ext4 encryption is used, but ext4 encryption doesn't encrypt
+ * xattrs.  Also, if the descriptor includes a large signature blob it may be
+ * too large to store in an xattr without the EA_INODE feature.
+ */
+static int ext4_write_verity_descriptor(struct inode *inode, const void *desc,
+					size_t desc_size, u64 merkle_tree_size)
+{
+	const u64 desc_pos = round_up(ext4_verity_metadata_pos(inode) +
+				      merkle_tree_size, i_blocksize(inode));
+	const u64 desc_end = desc_pos + desc_size;
+	const __le32 desc_size_disk = cpu_to_le32(desc_size);
+	const u64 desc_size_pos = round_up(desc_end + sizeof(desc_size_disk),
+					   i_blocksize(inode)) -
+				  sizeof(desc_size_disk);
+	int err;
+
+	err = pagecache_write(inode, desc, desc_size, desc_pos);
+	if (err)
+		return err;
+
+	return pagecache_write(inode, &desc_size_disk, sizeof(desc_size_disk),
+			       desc_size_pos);
+}
+
+static int ext4_end_enable_verity(struct file *filp, const void *desc,
+				  size_t desc_size, u64 merkle_tree_size)
+{
+	struct inode *inode = file_inode(filp);
+	const int credits = 2; /* superblock and inode for ext4_orphan_add() */
+	handle_t *handle;
+	int err = 0;
+	int err2;
+
+	if (desc != NULL) {
+		/* Succeeded; write the verity descriptor. */
+		err = ext4_write_verity_descriptor(inode, desc, desc_size,
+						   merkle_tree_size);
+
+		/* Write all pages before clearing VERITY_IN_PROGRESS. */
+		if (!err)
+			err = filemap_write_and_wait(inode->i_mapping);
+	}
+
+	/* If we failed, truncate anything we wrote past i_size. */
+	if (desc == NULL || err)
+		ext4_truncate(inode);
+
+	/*
+	 * We must always clean up by clearing EXT4_STATE_VERITY_IN_PROGRESS and
+	 * deleting the inode from the orphan list, even if something failed.
+	 * If everything succeeded, we'll also set the verity bit in the same
+	 * transaction.
+	 */
+
+	ext4_clear_inode_state(inode, EXT4_STATE_VERITY_IN_PROGRESS);
+
+	handle = ext4_journal_start(inode, EXT4_HT_INODE, credits);
+	if (IS_ERR(handle)) {
+		ext4_orphan_del(NULL, inode);
+		return PTR_ERR(handle);
+	}
+
+	err2 = ext4_orphan_del(handle, inode);
+	if (err2)
+		goto out_stop;
+
+	if (desc != NULL && !err) {
+		struct ext4_iloc iloc;
+
+		err = ext4_reserve_inode_write(handle, inode, &iloc);
+		if (err)
+			goto out_stop;
+		ext4_set_inode_flag(inode, EXT4_INODE_VERITY);
+		ext4_set_inode_flags(inode);
+		err = ext4_mark_iloc_dirty(handle, inode, &iloc);
+	}
+out_stop:
+	ext4_journal_stop(handle);
+	return err ?: err2;
+}
+
+static int ext4_get_verity_descriptor_location(struct inode *inode,
+					       size_t *desc_size_ret,
+					       u64 *desc_pos_ret)
+{
+	struct ext4_ext_path *path;
+	struct ext4_extent *last_extent;
+	u32 end_lblk;
+	u64 desc_size_pos;
+	__le32 desc_size_disk;
+	u32 desc_size;
+	u64 desc_pos;
+	int err;
+
+	/*
+	 * Descriptor size is in last 4 bytes of last allocated block.
+	 * See ext4_write_verity_descriptor().
+	 */
+
+	if (!ext4_test_inode_flag(inode, EXT4_INODE_EXTENTS)) {
+		EXT4_ERROR_INODE(inode, "verity file doesn't use extents");
+		return -EFSCORRUPTED;
+	}
+
+	path = ext4_find_extent(inode, EXT_MAX_BLOCKS - 1, NULL, 0);
+	if (IS_ERR(path))
+		return PTR_ERR(path);
+
+	last_extent = path[path->p_depth].p_ext;
+	if (!last_extent) {
+		EXT4_ERROR_INODE(inode, "verity file has no extents");
+		ext4_ext_drop_refs(path);
+		kfree(path);
+		return -EFSCORRUPTED;
+	}
+
+	end_lblk = le32_to_cpu(last_extent->ee_block) +
+		   ext4_ext_get_actual_len(last_extent);
+	desc_size_pos = (u64)end_lblk << inode->i_blkbits;
+	ext4_ext_drop_refs(path);
+	kfree(path);
+
+	if (desc_size_pos < sizeof(desc_size_disk))
+		goto bad;
+	desc_size_pos -= sizeof(desc_size_disk);
+
+	err = pagecache_read(inode, &desc_size_disk, sizeof(desc_size_disk),
+			     desc_size_pos);
+	if (err)
+		return err;
+	desc_size = le32_to_cpu(desc_size_disk);
+
+	/*
+	 * The descriptor is stored just before the desc_size_disk, but starting
+	 * on a filesystem block boundary.
+	 */
+
+	if (desc_size > INT_MAX || desc_size > desc_size_pos)
+		goto bad;
+
+	desc_pos = round_down(desc_size_pos - desc_size, i_blocksize(inode));
+	if (desc_pos < ext4_verity_metadata_pos(inode))
+		goto bad;
+
+	*desc_size_ret = desc_size;
+	*desc_pos_ret = desc_pos;
+	return 0;
+
+bad:
+	EXT4_ERROR_INODE(inode, "verity file corrupted; can't find descriptor");
+	return -EFSCORRUPTED;
+}
+
+static int ext4_get_verity_descriptor(struct inode *inode, void *buf,
+				      size_t buf_size)
+{
+	size_t desc_size = 0;
+	u64 desc_pos = 0;
+	int err;
+
+	err = ext4_get_verity_descriptor_location(inode, &desc_size, &desc_pos);
+	if (err)
+		return err;
+
+	if (buf_size) {
+		if (desc_size > buf_size)
+			return -ERANGE;
+		err = pagecache_read(inode, buf, desc_size, desc_pos);
+		if (err)
+			return err;
+	}
+	return desc_size;
+}
+
+static struct page *ext4_read_merkle_tree_page(struct inode *inode,
+					       pgoff_t index)
+{
+	index += ext4_verity_metadata_pos(inode) >> PAGE_SHIFT;
+
+	return read_mapping_page(inode->i_mapping, index, NULL);
+}
+
+static int ext4_write_merkle_tree_block(struct inode *inode, const void *buf,
+					u64 index, int log_blocksize)
+{
+	loff_t pos = ext4_verity_metadata_pos(inode) + (index << log_blocksize);
+
+	return pagecache_write(inode, buf, 1 << log_blocksize, pos);
+}
+
+const struct fsverity_operations ext4_verityops = {
+	.begin_enable_verity	= ext4_begin_enable_verity,
+	.end_enable_verity	= ext4_end_enable_verity,
+	.get_verity_descriptor	= ext4_get_verity_descriptor,
+	.read_merkle_tree_page	= ext4_read_merkle_tree_page,
+	.write_merkle_tree_block = ext4_write_merkle_tree_block,
+};
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
