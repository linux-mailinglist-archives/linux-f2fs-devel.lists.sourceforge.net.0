Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 526362A1D5D
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  1 Nov 2020 11:38:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZAkz-0000al-2X; Sun, 01 Nov 2020 10:38:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1kZAky-0000ad-DA
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 Nov 2020 10:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:In-Reply-To:Date:From:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7A7WD4azvCgoWjy3MJu9/iRgPnSN0tQYTOZyCYjhQpI=; b=DBokVUcz46cNLuGIJy/okdYWF5
 FwPEQ7mM6KElSh/n5i2WUdMRe9KeBVRI+QVOGYSYAIvMsc49vQNRIpmclubTR+gDlKmLQkhdmBtcK
 jVbWyf1Gqj7+A00MtXfqQPcZSu4kv+mgBpk9sf+yFlMGeIYP3eQva6+olZ8qlnn4T4wc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:From:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7A7WD4azvCgoWjy3MJu9/iRgPnSN0tQYTOZyCYjhQpI=; b=L5zv9+qyFBSpwVSWvYmj+FmofQ
 0FYRIlq15IejQqr61E5ET6yZMFEqm6dYEBTiQYsJpoDrGwCjBx2uKaGf0xur1ywSRfcG07jvfhLnK
 3QphmJ0IEYHVZT0b81So9TfU7mECcLtAx9FJqTKlA5uApLNUzOfS1Jt9TRs5AQIJfj54=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZAkr-0053vv-BY
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 Nov 2020 10:38:40 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 60B1E207F7;
 Sun,  1 Nov 2020 10:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604227108;
 bh=jjn8igeyhXuApvBjulCaIHWXjQTFoouu9gExcD7HsEY=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=IXJLpU9qEsR04Ou46uARudTQW5ThDbKR5Dmgx5tMd0LRbddi/fSJKyBgpYgKZKu/r
 0fuLtXFHZNO9Qi4bI7gFRQXgW3rApDrl4JZ6x+Y2WnLJxuVZB77LzyTaxG3ttdvprv
 JVRg31Boanzu6NKZHyOZeG8e1xdZ7o6SzUxvk7Ss=
To: ebiggers@google.com, ebiggers@kernel.org, gregkh@linuxfoundation.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 tytso@mit.edu
From: <gregkh@linuxfoundation.org>
Date: Sun, 01 Nov 2020 11:39:02 +0100
In-Reply-To: <20201031220553.1085782-6-ebiggers@kernel.org>
Message-ID: <16042271428274@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kZAkr-0053vv-BY
Subject: [f2fs-dev] Patch "fscrypt: fix race where ->lookup() marks
 plaintext dentry as ciphertext" has been added to the 4.19-stable tree
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


This is a note to let you know that I've just added the patch titled

    fscrypt: fix race where ->lookup() marks plaintext dentry as ciphertext

to the 4.19-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     fscrypt-fix-race-where-lookup-marks-plaintext-dentry-as-ciphertext.patch
and it can be found in the queue-4.19 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Sun Nov  1 11:35:18 AM CET 2020
From: Eric Biggers <ebiggers@kernel.org>
Date: Sat, 31 Oct 2020 15:05:53 -0700
Subject: fscrypt: fix race where ->lookup() marks plaintext dentry as ciphertext
To: stable@vger.kernel.org
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org, Theodore Ts'o <tytso@mit.edu>
Message-ID: <20201031220553.1085782-6-ebiggers@kernel.org>

From: Eric Biggers <ebiggers@google.com>

commit b01531db6cec2aa330dbc91bfbfaaef4a0d387a4 upstream.

->lookup() in an encrypted directory begins as follows:

1. fscrypt_prepare_lookup():
    a. Try to load the directory's encryption key.
    b. If the key is unavailable, mark the dentry as a ciphertext name
       via d_flags.
2. fscrypt_setup_filename():
    a. Try to load the directory's encryption key.
    b. If the key is available, encrypt the name (treated as a plaintext
       name) to get the on-disk name.  Otherwise decode the name
       (treated as a ciphertext name) to get the on-disk name.

But if the key is concurrently added, it may be found at (2a) but not at
(1a).  In this case, the dentry will be wrongly marked as a ciphertext
name even though it was actually treated as plaintext.

This will cause the dentry to be wrongly invalidated on the next lookup,
potentially causing problems.  For example, if the racy ->lookup() was
part of sys_mount(), then the new mount will be detached when anything
tries to access it.  This is despite the mountpoint having a plaintext
path, which should remain valid now that the key was added.

Of course, this is only possible if there's a userspace race.  Still,
the additional kernel-side race is confusing and unexpected.

Close the kernel-side race by changing fscrypt_prepare_lookup() to also
set the on-disk filename (step 2b), consistent with the d_flags update.

Fixes: 28b4c263961c ("ext4 crypto: revalidate dentry after adding or removing the key")
Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Theodore Ts'o <tytso@mit.edu>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/crypto/fname.c               |    1 
 fs/crypto/hooks.c               |   11 +++--
 fs/ext4/ext4.h                  |   62 ++++++++++++++++++++++++--------
 fs/ext4/namei.c                 |   76 +++++++++++++++++++++++++++-------------
 fs/f2fs/namei.c                 |   17 +++++---
 fs/ubifs/dir.c                  |    8 +---
 include/linux/fscrypt.h         |   22 +++++++----
 include/linux/fscrypt_notsupp.h |    5 +-
 include/linux/fscrypt_supp.h    |    3 +
 9 files changed, 139 insertions(+), 66 deletions(-)

--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -354,6 +354,7 @@ int fscrypt_setup_filename(struct inode
 	}
 	if (!lookup)
 		return -ENOKEY;
+	fname->is_ciphertext_name = true;
 
 	/*
 	 * We don't have the key and we are doing a lookup; decode the
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -104,20 +104,21 @@ int __fscrypt_prepare_rename(struct inod
 }
 EXPORT_SYMBOL_GPL(__fscrypt_prepare_rename);
 
-int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry)
+int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
+			     struct fscrypt_name *fname)
 {
-	int err = fscrypt_get_encryption_info(dir);
+	int err = fscrypt_setup_filename(dir, &dentry->d_name, 1, fname);
 
-	if (err)
+	if (err && err != -ENOENT)
 		return err;
 
-	if (!fscrypt_has_encryption_key(dir)) {
+	if (fname->is_ciphertext_name) {
 		spin_lock(&dentry->d_lock);
 		dentry->d_flags |= DCACHE_ENCRYPTED_NAME;
 		spin_unlock(&dentry->d_lock);
 		d_set_d_op(dentry, &fscrypt_d_ops);
 	}
-	return 0;
+	return err;
 }
 EXPORT_SYMBOL_GPL(__fscrypt_prepare_lookup);
 
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -2326,23 +2326,47 @@ static inline bool ext4_encrypted_inode(
 }
 
 #ifdef CONFIG_EXT4_FS_ENCRYPTION
+static inline void ext4_fname_from_fscrypt_name(struct ext4_filename *dst,
+						const struct fscrypt_name *src)
+{
+	memset(dst, 0, sizeof(*dst));
+
+	dst->usr_fname = src->usr_fname;
+	dst->disk_name = src->disk_name;
+	dst->hinfo.hash = src->hash;
+	dst->hinfo.minor_hash = src->minor_hash;
+	dst->crypto_buf = src->crypto_buf;
+}
+
 static inline int ext4_fname_setup_filename(struct inode *dir,
-			const struct qstr *iname,
-			int lookup, struct ext4_filename *fname)
+					    const struct qstr *iname,
+					    int lookup,
+					    struct ext4_filename *fname)
 {
 	struct fscrypt_name name;
 	int err;
 
-	memset(fname, 0, sizeof(struct ext4_filename));
-
 	err = fscrypt_setup_filename(dir, iname, lookup, &name);
+	if (err)
+		return err;
 
-	fname->usr_fname = name.usr_fname;
-	fname->disk_name = name.disk_name;
-	fname->hinfo.hash = name.hash;
-	fname->hinfo.minor_hash = name.minor_hash;
-	fname->crypto_buf = name.crypto_buf;
-	return err;
+	ext4_fname_from_fscrypt_name(fname, &name);
+	return 0;
+}
+
+static inline int ext4_fname_prepare_lookup(struct inode *dir,
+					    struct dentry *dentry,
+					    struct ext4_filename *fname)
+{
+	struct fscrypt_name name;
+	int err;
+
+	err = fscrypt_prepare_lookup(dir, dentry, &name);
+	if (err)
+		return err;
+
+	ext4_fname_from_fscrypt_name(fname, &name);
+	return 0;
 }
 
 static inline void ext4_fname_free_filename(struct ext4_filename *fname)
@@ -2356,19 +2380,27 @@ static inline void ext4_fname_free_filen
 	fname->usr_fname = NULL;
 	fname->disk_name.name = NULL;
 }
-#else
+#else /* !CONFIG_EXT4_FS_ENCRYPTION */
 static inline int ext4_fname_setup_filename(struct inode *dir,
-		const struct qstr *iname,
-		int lookup, struct ext4_filename *fname)
+					    const struct qstr *iname,
+					    int lookup,
+					    struct ext4_filename *fname)
 {
 	fname->usr_fname = iname;
 	fname->disk_name.name = (unsigned char *) iname->name;
 	fname->disk_name.len = iname->len;
 	return 0;
 }
-static inline void ext4_fname_free_filename(struct ext4_filename *fname) { }
 
-#endif
+static inline int ext4_fname_prepare_lookup(struct inode *dir,
+					    struct dentry *dentry,
+					    struct ext4_filename *fname)
+{
+	return ext4_fname_setup_filename(dir, &dentry->d_name, 1, fname);
+}
+
+static inline void ext4_fname_free_filename(struct ext4_filename *fname) { }
+#endif /* !CONFIG_EXT4_FS_ENCRYPTION */
 
 /* dir.c */
 extern int __ext4_check_dir_entry(const char *, unsigned int, struct inode *,
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1343,7 +1343,7 @@ static int is_dx_internal_node(struct in
 }
 
 /*
- *	ext4_find_entry()
+ *	__ext4_find_entry()
  *
  * finds an entry in the specified directory with the wanted name. It
  * returns the cache buffer in which the entry was found, and the entry
@@ -1353,39 +1353,32 @@ static int is_dx_internal_node(struct in
  * The returned buffer_head has ->b_count elevated.  The caller is expected
  * to brelse() it when appropriate.
  */
-static struct buffer_head * ext4_find_entry (struct inode *dir,
-					const struct qstr *d_name,
-					struct ext4_dir_entry_2 **res_dir,
-					int *inlined)
+static struct buffer_head *__ext4_find_entry(struct inode *dir,
+					     struct ext4_filename *fname,
+					     struct ext4_dir_entry_2 **res_dir,
+					     int *inlined)
 {
 	struct super_block *sb;
 	struct buffer_head *bh_use[NAMEI_RA_SIZE];
 	struct buffer_head *bh, *ret = NULL;
 	ext4_lblk_t start, block;
-	const u8 *name = d_name->name;
+	const u8 *name = fname->usr_fname->name;
 	size_t ra_max = 0;	/* Number of bh's in the readahead
 				   buffer, bh_use[] */
 	size_t ra_ptr = 0;	/* Current index into readahead
 				   buffer */
 	ext4_lblk_t  nblocks;
 	int i, namelen, retval;
-	struct ext4_filename fname;
 
 	*res_dir = NULL;
 	sb = dir->i_sb;
-	namelen = d_name->len;
+	namelen = fname->usr_fname->len;
 	if (namelen > EXT4_NAME_LEN)
 		return NULL;
 
-	retval = ext4_fname_setup_filename(dir, d_name, 1, &fname);
-	if (retval == -ENOENT)
-		return NULL;
-	if (retval)
-		return ERR_PTR(retval);
-
 	if (ext4_has_inline_data(dir)) {
 		int has_inline_data = 1;
-		ret = ext4_find_inline_entry(dir, &fname, res_dir,
+		ret = ext4_find_inline_entry(dir, fname, res_dir,
 					     &has_inline_data);
 		if (has_inline_data) {
 			if (inlined)
@@ -1405,7 +1398,7 @@ static struct buffer_head * ext4_find_en
 		goto restart;
 	}
 	if (is_dx(dir)) {
-		ret = ext4_dx_find_entry(dir, &fname, res_dir);
+		ret = ext4_dx_find_entry(dir, fname, res_dir);
 		/*
 		 * On success, or if the error was file not found,
 		 * return.  Otherwise, fall back to doing a search the
@@ -1470,7 +1463,7 @@ restart:
 			goto cleanup_and_exit;
 		}
 		set_buffer_verified(bh);
-		i = search_dirblock(bh, dir, &fname,
+		i = search_dirblock(bh, dir, fname,
 			    block << EXT4_BLOCK_SIZE_BITS(sb), res_dir);
 		if (i == 1) {
 			EXT4_I(dir)->i_dir_start_lookup = block;
@@ -1501,10 +1494,50 @@ cleanup_and_exit:
 	/* Clean up the read-ahead blocks */
 	for (; ra_ptr < ra_max; ra_ptr++)
 		brelse(bh_use[ra_ptr]);
-	ext4_fname_free_filename(&fname);
 	return ret;
 }
 
+static struct buffer_head *ext4_find_entry(struct inode *dir,
+					   const struct qstr *d_name,
+					   struct ext4_dir_entry_2 **res_dir,
+					   int *inlined)
+{
+	int err;
+	struct ext4_filename fname;
+	struct buffer_head *bh;
+
+	err = ext4_fname_setup_filename(dir, d_name, 1, &fname);
+	if (err == -ENOENT)
+		return NULL;
+	if (err)
+		return ERR_PTR(err);
+
+	bh = __ext4_find_entry(dir, &fname, res_dir, inlined);
+
+	ext4_fname_free_filename(&fname);
+	return bh;
+}
+
+static struct buffer_head *ext4_lookup_entry(struct inode *dir,
+					     struct dentry *dentry,
+					     struct ext4_dir_entry_2 **res_dir)
+{
+	int err;
+	struct ext4_filename fname;
+	struct buffer_head *bh;
+
+	err = ext4_fname_prepare_lookup(dir, dentry, &fname);
+	if (err == -ENOENT)
+		return NULL;
+	if (err)
+		return ERR_PTR(err);
+
+	bh = __ext4_find_entry(dir, &fname, res_dir, NULL);
+
+	ext4_fname_free_filename(&fname);
+	return bh;
+}
+
 static struct buffer_head * ext4_dx_find_entry(struct inode *dir,
 			struct ext4_filename *fname,
 			struct ext4_dir_entry_2 **res_dir)
@@ -1563,16 +1596,11 @@ static struct dentry *ext4_lookup(struct
 	struct inode *inode;
 	struct ext4_dir_entry_2 *de;
 	struct buffer_head *bh;
-	int err;
-
-	err = fscrypt_prepare_lookup(dir, dentry, flags);
-	if (err)
-		return ERR_PTR(err);
 
 	if (dentry->d_name.len > EXT4_NAME_LEN)
 		return ERR_PTR(-ENAMETOOLONG);
 
-	bh = ext4_find_entry(dir, &dentry->d_name, &de, NULL);
+	bh = ext4_lookup_entry(dir, dentry, &de);
 	if (IS_ERR(bh))
 		return (struct dentry *) bh;
 	inode = NULL;
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -432,19 +432,23 @@ static struct dentry *f2fs_lookup(struct
 	nid_t ino = -1;
 	int err = 0;
 	unsigned int root_ino = F2FS_ROOT_INO(F2FS_I_SB(dir));
+	struct fscrypt_name fname;
 
 	trace_f2fs_lookup_start(dir, dentry, flags);
 
-	err = fscrypt_prepare_lookup(dir, dentry, flags);
-	if (err)
-		goto out;
-
 	if (dentry->d_name.len > F2FS_NAME_LEN) {
 		err = -ENAMETOOLONG;
 		goto out;
 	}
 
-	de = f2fs_find_entry(dir, &dentry->d_name, &page);
+	err = fscrypt_prepare_lookup(dir, dentry, &fname);
+	if (err == -ENOENT)
+		goto out_splice;
+	if (err)
+		goto out;
+	de = __f2fs_find_entry(dir, &fname, &page);
+	fscrypt_free_filename(&fname);
+
 	if (!de) {
 		if (IS_ERR(page)) {
 			err = PTR_ERR(page);
@@ -484,8 +488,7 @@ static struct dentry *f2fs_lookup(struct
 	}
 out_splice:
 	new = d_splice_alias(inode, dentry);
-	if (IS_ERR(new))
-		err = PTR_ERR(new);
+	err = PTR_ERR_OR_ZERO(new);
 	trace_f2fs_lookup_end(dir, dentry, ino, err);
 	return new;
 out_iput:
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -220,11 +220,9 @@ static struct dentry *ubifs_lookup(struc
 
 	dbg_gen("'%pd' in dir ino %lu", dentry, dir->i_ino);
 
-	err = fscrypt_prepare_lookup(dir, dentry, flags);
-	if (err)
-		return ERR_PTR(err);
-
-	err = fscrypt_setup_filename(dir, &dentry->d_name, 1, &nm);
+	err = fscrypt_prepare_lookup(dir, dentry, &nm);
+	if (err == -ENOENT)
+		return d_splice_alias(NULL, dentry);
 	if (err)
 		return ERR_PTR(err);
 
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -32,6 +32,7 @@ struct fscrypt_name {
 	u32 hash;
 	u32 minor_hash;
 	struct fscrypt_str crypto_buf;
+	bool is_ciphertext_name;
 };
 
 #define FSTR_INIT(n, l)		{ .name = n, .len = l }
@@ -138,25 +139,32 @@ static inline int fscrypt_prepare_rename
  * fscrypt_prepare_lookup - prepare to lookup a name in a possibly-encrypted directory
  * @dir: directory being searched
  * @dentry: filename being looked up
- * @flags: lookup flags
+ * @fname: (output) the name to use to search the on-disk directory
  *
- * Prepare for ->lookup() in a directory which may be encrypted.  Lookups can be
- * done with or without the directory's encryption key; without the key,
+ * Prepare for ->lookup() in a directory which may be encrypted by determining
+ * the name that will actually be used to search the directory on-disk.  Lookups
+ * can be done with or without the directory's encryption key; without the key,
  * filenames are presented in encrypted form.  Therefore, we'll try to set up
  * the directory's encryption key, but even without it the lookup can continue.
  *
  * This also installs a custom ->d_revalidate() method which will invalidate the
  * dentry if it was created without the key and the key is later added.
  *
- * Return: 0 on success, -errno if a problem occurred while setting up the
- * encryption key
+ * Return: 0 on success; -ENOENT if key is unavailable but the filename isn't a
+ * correctly formed encoded ciphertext name, so a negative dentry should be
+ * created; or another -errno code.
  */
 static inline int fscrypt_prepare_lookup(struct inode *dir,
 					 struct dentry *dentry,
-					 unsigned int flags)
+					 struct fscrypt_name *fname)
 {
 	if (IS_ENCRYPTED(dir))
-		return __fscrypt_prepare_lookup(dir, dentry);
+		return __fscrypt_prepare_lookup(dir, dentry, fname);
+
+	memset(fname, 0, sizeof(*fname));
+	fname->usr_fname = &dentry->d_name;
+	fname->disk_name.name = (unsigned char *)dentry->d_name.name;
+	fname->disk_name.len = dentry->d_name.len;
 	return 0;
 }
 
--- a/include/linux/fscrypt_notsupp.h
+++ b/include/linux/fscrypt_notsupp.h
@@ -112,7 +112,7 @@ static inline int fscrypt_setup_filename
 	if (IS_ENCRYPTED(dir))
 		return -EOPNOTSUPP;
 
-	memset(fname, 0, sizeof(struct fscrypt_name));
+	memset(fname, 0, sizeof(*fname));
 	fname->usr_fname = iname;
 	fname->disk_name.name = (unsigned char *)iname->name;
 	fname->disk_name.len = iname->len;
@@ -199,7 +199,8 @@ static inline int __fscrypt_prepare_rena
 }
 
 static inline int __fscrypt_prepare_lookup(struct inode *dir,
-					   struct dentry *dentry)
+					   struct dentry *dentry,
+					   struct fscrypt_name *fname)
 {
 	return -EOPNOTSUPP;
 }
--- a/include/linux/fscrypt_supp.h
+++ b/include/linux/fscrypt_supp.h
@@ -191,7 +191,8 @@ extern int __fscrypt_prepare_rename(stru
 				    struct inode *new_dir,
 				    struct dentry *new_dentry,
 				    unsigned int flags);
-extern int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry);
+extern int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
+				    struct fscrypt_name *fname);
 extern int __fscrypt_prepare_symlink(struct inode *dir, unsigned int len,
 				     unsigned int max_len,
 				     struct fscrypt_str *disk_link);


Patches currently in stable-queue which might be from ebiggers@kernel.org are

queue-4.19/fscrypt-only-set-dentry_operations-on-ciphertext-dentries.patch
queue-4.19/fscrypt-clean-up-and-improve-dentry-revalidation.patch
queue-4.19/fscrypt-fix-race-allowing-rename-and-link-of-ciphertext-dentries.patch
queue-4.19/fs-fscrypt-clear-dcache_encrypted_name-when-unaliasing-directory.patch
queue-4.19/fscrypt-fix-race-where-lookup-marks-plaintext-dentry-as-ciphertext.patch


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
