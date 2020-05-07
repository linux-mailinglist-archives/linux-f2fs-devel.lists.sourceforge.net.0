Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B89DE1C8427
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 May 2020 10:02:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWbU1-00086A-96; Thu, 07 May 2020 08:02:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jWbTz-00085y-Ui
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 May 2020 08:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BD1mzJiJYWUs3wYPJxGVojgYmCogYFHIQkYQOqeBW9s=; b=k2THVv6WjiksmGK/UMkyfy9z9R
 OuSH1rK4PcD4GwRtI90G3FhhjWmXloZC0ZivPIxgQdTq6IDvUX3aNxfT7uWcFcl5ZUYqC5w9RM4mC
 Oxh2e/7R/PRoVZC8as8mLurbRcoIkS8rW0bhFBRMptoWhdj/z5/FRE+mjjsms34WBwXM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BD1mzJiJYWUs3wYPJxGVojgYmCogYFHIQkYQOqeBW9s=; b=c/xzSpQlg2A4UJXkOwJ0q2jaiU
 5Mcz8t5iEYsIngRBjDlMChJUQhTkOptu4dWpXc5Kouv5E/93EvCEU6buh1Z4mfxzwm7t7x4k8xaCD
 GASJFdRIqhPeymiFArD6qdzAL/0+zaSDQmDxgynfcsktZeVEUlGR8GqlOyA35f8a+HDQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWbTv-00Duvh-Q9
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 May 2020 08:02:15 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 21AA5208CA;
 Thu,  7 May 2020 08:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588838526;
 bh=3/Fe8PbPjhNoEtpcLRo6GkSRcE/rxZGDpOZoykNTL5k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KTUOgKOvNnrwkjQQvKTgcU5buNCGa+2xOzYn9XZ22CPLoltuBGuIx3sFi9TF+kBZ0
 h68qO3K502bUCuUiL+GI67NlnjyJQU6SGN6whJtLbY1dfKcIKJHeuJK/JiM8364r9G
 3bUa1xlt9cobxc/X/yp6YqznKFHqocX0fyeQxCCI=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  7 May 2020 00:59:04 -0700
Message-Id: <20200507075905.953777-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200507075905.953777-1-ebiggers@kernel.org>
References: <20200507075905.953777-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWbTv-00Duvh-Q9
Subject: [f2fs-dev] [PATCH 3/4] f2fs: rework filename handling
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
Cc: linux-fscrypt@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>,
 Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Rework f2fs's handling of filenames to use a new 'struct f2fs_filename'.
Similar to 'struct ext4_filename', this stores the usr_fname, disk_name,
dirhash, crypto_buf, and casefolded name.  Some of these names can be
NULL in some cases.  'struct f2fs_filename' differs from
'struct fscrypt_name' mainly in that the casefolded name is included.

For user-initiated directory operations like lookup() and create(),
initialize the f2fs_filename by translating the corresponding
fscrypt_name, then computing the dirhash and casefolded name if needed.

This makes the dirhash and casefolded name be cached for each syscall,
so we don't have to recompute them repeatedly.  (Previously, f2fs
computed the dirhash once per directory level, and the casefolded name
once per directory block.)  This improves performance.

This rework also makes it much easier to correctly handle all
combinations of normal, encrypted, casefolded, and encrypted+casefolded
directories.  (The fourth isn't supported yet but is being worked on.)

The only other cases where an f2fs_filename gets initialized are for two
filesystem-internal operations: (1) when converting an inline directory
to a regular one, we grab the needed disk_name and hash from an existing
f2fs_dir_entry; and (2) when roll-forward recovering a new dentry, we
grab the needed disk_name from f2fs_inode::i_name and compute the hash.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/dir.c      | 310 +++++++++++++++++++++++++--------------------
 fs/f2fs/f2fs.h     |  78 +++++++++---
 fs/f2fs/hash.c     |  76 +++++------
 fs/f2fs/inline.c   |  45 ++++---
 fs/f2fs/namei.c    |   6 +-
 fs/f2fs/recovery.c |  51 ++++++--
 6 files changed, 331 insertions(+), 235 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 44eb12a00cd0ed..29f70f2295cce8 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -70,6 +70,111 @@ unsigned char f2fs_get_de_type(struct f2fs_dir_entry *de)
 	return DT_UNKNOWN;
 }
 
+/* If @dir is casefolded, initialize @fname->cf_name from @fname->usr_fname. */
+int f2fs_init_casefolded_name(const struct inode *dir,
+			      struct f2fs_filename *fname)
+{
+#ifdef CONFIG_UNICODE
+	struct f2fs_sb_info *sbi = F2FS_SB(dir->i_sb);
+
+	if (IS_CASEFOLDED(dir)) {
+		fname->cf_name.name = f2fs_kmalloc(sbi, F2FS_NAME_LEN,
+						   GFP_NOFS);
+		if (!fname->cf_name.name)
+			return -ENOMEM;
+		fname->cf_name.len = utf8_casefold(sbi->s_encoding,
+						   fname->usr_fname,
+						   fname->cf_name.name,
+						   F2FS_NAME_LEN);
+		if ((int)fname->cf_name.len <= 0) {
+			kfree(fname->cf_name.name);
+			fname->cf_name.name = NULL;
+			if (f2fs_has_strict_mode(sbi))
+				return -EINVAL;
+			/* fall back to treating name as opaque byte sequence */
+		}
+	}
+#endif
+	return 0;
+}
+
+static int __f2fs_setup_filename(const struct inode *dir,
+				 const struct fscrypt_name *crypt_name,
+				 struct f2fs_filename *fname)
+{
+	int err;
+
+	memset(fname, 0, sizeof(*fname));
+
+	fname->usr_fname = crypt_name->usr_fname;
+	fname->disk_name = crypt_name->disk_name;
+#ifdef CONFIG_FS_ENCRYPTION
+	fname->crypto_buf = crypt_name->crypto_buf;
+#endif
+	if (crypt_name->is_ciphertext_name) {
+		/* hash was decoded from the no-key name */
+		fname->hash = cpu_to_le32(crypt_name->hash);
+	} else {
+		err = f2fs_init_casefolded_name(dir, fname);
+		if (err) {
+			f2fs_free_filename(fname);
+			return err;
+		}
+		f2fs_hash_filename(dir, fname);
+	}
+	return 0;
+}
+
+/*
+ * Prepare to search for @iname in @dir.  This is similar to
+ * fscrypt_setup_filename(), but this also handles computing the casefolded name
+ * and the f2fs dirhash if needed, then packing all the information about this
+ * filename up into a 'struct f2fs_filename'.
+ */
+int f2fs_setup_filename(struct inode *dir, const struct qstr *iname,
+			int lookup, struct f2fs_filename *fname)
+{
+	struct fscrypt_name crypt_name;
+	int err;
+
+	err = fscrypt_setup_filename(dir, iname, lookup, &crypt_name);
+	if (err)
+		return err;
+
+	return __f2fs_setup_filename(dir, &crypt_name, fname);
+}
+
+/*
+ * Prepare to look up @dentry in @dir.  This is similar to
+ * fscrypt_prepare_lookup(), but this also handles computing the casefolded name
+ * and the f2fs dirhash if needed, then packing all the information about this
+ * filename up into a 'struct f2fs_filename'.
+ */
+int f2fs_prepare_lookup(struct inode *dir, struct dentry *dentry,
+			struct f2fs_filename *fname)
+{
+	struct fscrypt_name crypt_name;
+	int err;
+
+	err = fscrypt_prepare_lookup(dir, dentry, &crypt_name);
+	if (err)
+		return err;
+
+	return __f2fs_setup_filename(dir, &crypt_name, fname);
+}
+
+void f2fs_free_filename(struct f2fs_filename *fname)
+{
+#ifdef CONFIG_FS_ENCRYPTION
+	kfree(fname->crypto_buf.name);
+	fname->crypto_buf.name = NULL;
+#endif
+#ifdef CONFIG_UNICODE
+	kfree(fname->cf_name.name);
+	fname->cf_name.name = NULL;
+#endif
+}
+
 static unsigned long dir_block_index(unsigned int level,
 				int dir_level, unsigned int idx)
 {
@@ -84,8 +189,7 @@ static unsigned long dir_block_index(unsigned int level,
 
 static struct f2fs_dir_entry *find_in_block(struct inode *dir,
 				struct page *dentry_page,
-				struct fscrypt_name *fname,
-				f2fs_hash_t namehash,
+				const struct f2fs_filename *fname,
 				int *max_slots,
 				struct page **res_page)
 {
@@ -96,7 +200,7 @@ static struct f2fs_dir_entry *find_in_block(struct inode *dir,
 	dentry_blk = (struct f2fs_dentry_block *)page_address(dentry_page);
 
 	make_dentry_ptr_block(dir, &d, dentry_blk);
-	de = f2fs_find_target_dentry(fname, namehash, max_slots, &d);
+	de = f2fs_find_target_dentry(&d, fname, max_slots);
 	if (de)
 		*res_page = dentry_page;
 
@@ -109,102 +213,55 @@ static struct f2fs_dir_entry *find_in_block(struct inode *dir,
  * being searched for.
  */
 static bool f2fs_match_ci_name(const struct inode *dir, const struct qstr *name,
-			       const struct qstr *entry, bool quick)
+			       const u8 *de_name, u32 de_name_len)
 {
 	const struct f2fs_sb_info *sbi = F2FS_SB(dir->i_sb);
 	const struct unicode_map *um = sbi->s_encoding;
+	struct qstr entry = QSTR_INIT(de_name, de_name_len);
 	int res;
 
-	if (quick)
-		res = utf8_strncasecmp_folded(um, name, entry);
-	else
-		res = utf8_strncasecmp(um, name, entry);
+	res = utf8_strncasecmp_folded(um, name, &entry);
 	if (res < 0) {
 		/*
 		 * In strict mode, ignore invalid names.  In non-strict mode,
 		 * fall back to treating them as opaque byte sequences.
 		 */
-		if (f2fs_has_strict_mode(sbi) || name->len != entry->len)
+		if (f2fs_has_strict_mode(sbi) || name->len != entry.len)
 			return false;
-		return !memcmp(name->name, entry->name, name->len);
+		return !memcmp(name->name, entry.name, name->len);
 	}
 	return res == 0;
 }
+#endif /* CONFIG_UNICODE */
 
-static void f2fs_fname_setup_ci_filename(struct inode *dir,
-					const struct qstr *iname,
-					struct fscrypt_str *cf_name)
+static inline bool f2fs_match_name(const struct inode *dir,
+				   const struct f2fs_filename *fname,
+				   const u8 *de_name, u32 de_name_len)
 {
-	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
+	struct fscrypt_name f;
 
-	if (!IS_CASEFOLDED(dir)) {
-		cf_name->name = NULL;
-		return;
-	}
-
-	cf_name->name = f2fs_kmalloc(sbi, F2FS_NAME_LEN, GFP_NOFS);
-	if (!cf_name->name)
-		return;
-
-	cf_name->len = utf8_casefold(sbi->s_encoding,
-					iname, cf_name->name,
-					F2FS_NAME_LEN);
-	if ((int)cf_name->len <= 0) {
-		kvfree(cf_name->name);
-		cf_name->name = NULL;
-	}
-}
-#endif
-
-static inline bool f2fs_match_name(struct f2fs_dentry_ptr *d,
-					struct f2fs_dir_entry *de,
-					struct fscrypt_name *fname,
-					struct fscrypt_str *cf_str,
-					unsigned long bit_pos,
-					f2fs_hash_t namehash)
-{
 #ifdef CONFIG_UNICODE
-	struct inode *parent = d->inode;
-	struct f2fs_sb_info *sbi = F2FS_I_SB(parent);
-	struct qstr entry;
-#endif
+	if (fname->cf_name.name) {
+		struct qstr cf = FSTR_TO_QSTR(&fname->cf_name);
 
-	if (de->hash_code != namehash)
-		return false;
-
-#ifdef CONFIG_UNICODE
-	entry.name = d->filename[bit_pos];
-	entry.len = de->name_len;
-
-	if (sbi->s_encoding && IS_CASEFOLDED(parent)) {
-		if (cf_str->name) {
-			struct qstr cf = {.name = cf_str->name,
-					  .len = cf_str->len};
-			return f2fs_match_ci_name(parent, &cf, &entry, true);
-		}
-		return f2fs_match_ci_name(parent, fname->usr_fname, &entry,
-					  false);
+		return f2fs_match_ci_name(dir, &cf, de_name, de_name_len);
 	}
 #endif
-	if (fscrypt_match_name(fname, d->filename[bit_pos],
-				le16_to_cpu(de->name_len)))
-		return true;
-	return false;
+	f.usr_fname = fname->usr_fname;
+	f.disk_name = fname->disk_name;
+#ifdef CONFIG_FS_ENCRYPTION
+	f.crypto_buf = fname->crypto_buf;
+#endif
+	return fscrypt_match_name(&f, de_name, de_name_len);
 }
 
-struct f2fs_dir_entry *f2fs_find_target_dentry(struct fscrypt_name *fname,
-			f2fs_hash_t namehash, int *max_slots,
-			struct f2fs_dentry_ptr *d)
+struct f2fs_dir_entry *f2fs_find_target_dentry(const struct f2fs_dentry_ptr *d,
+			const struct f2fs_filename *fname, int *max_slots)
 {
 	struct f2fs_dir_entry *de;
-	struct fscrypt_str cf_str = { .name = NULL, .len = 0 };
 	unsigned long bit_pos = 0;
 	int max_len = 0;
 
-#ifdef CONFIG_UNICODE
-	f2fs_fname_setup_ci_filename(d->inode, fname->usr_fname, &cf_str);
-#endif
-
 	if (max_slots)
 		*max_slots = 0;
 	while (bit_pos < d->max) {
@@ -221,7 +278,9 @@ struct f2fs_dir_entry *f2fs_find_target_dentry(struct fscrypt_name *fname,
 			continue;
 		}
 
-		if (f2fs_match_name(d, de, fname, &cf_str, bit_pos, namehash))
+		if (de->hash_code == fname->hash &&
+		    f2fs_match_name(d->inode, fname, d->filename[bit_pos],
+				    le16_to_cpu(de->name_len)))
 			goto found;
 
 		if (max_slots && max_len > *max_slots)
@@ -235,33 +294,27 @@ struct f2fs_dir_entry *f2fs_find_target_dentry(struct fscrypt_name *fname,
 found:
 	if (max_slots && max_len > *max_slots)
 		*max_slots = max_len;
-
-#ifdef CONFIG_UNICODE
-	kvfree(cf_str.name);
-#endif
 	return de;
 }
 
 static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 					unsigned int level,
-					struct fscrypt_name *fname,
+					const struct f2fs_filename *fname,
 					struct page **res_page)
 {
-	struct qstr name = FSTR_TO_QSTR(&fname->disk_name);
-	int s = GET_DENTRY_SLOTS(name.len);
+	int s = GET_DENTRY_SLOTS(fname->disk_name.len);
 	unsigned int nbucket, nblock;
 	unsigned int bidx, end_block;
 	struct page *dentry_page;
 	struct f2fs_dir_entry *de = NULL;
 	bool room = false;
 	int max_slots;
-	f2fs_hash_t namehash = f2fs_dentry_hash(dir, &name, fname);
 
 	nbucket = dir_buckets(level, F2FS_I(dir)->i_dir_level);
 	nblock = bucket_blocks(level);
 
 	bidx = dir_block_index(level, F2FS_I(dir)->i_dir_level,
-					le32_to_cpu(namehash) % nbucket);
+			       le32_to_cpu(fname->hash) % nbucket);
 	end_block = bidx + nblock;
 
 	for (; bidx < end_block; bidx++) {
@@ -277,8 +330,8 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 			}
 		}
 
-		de = find_in_block(dir, dentry_page, fname, namehash,
-							&max_slots, res_page);
+		de = find_in_block(dir, dentry_page, fname, &max_slots,
+				   res_page);
 		if (de)
 			break;
 
@@ -287,8 +340,8 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 		f2fs_put_page(dentry_page, 0);
 	}
 
-	if (!de && room && F2FS_I(dir)->chash != namehash) {
-		F2FS_I(dir)->chash = namehash;
+	if (!de && room && F2FS_I(dir)->chash != fname->hash) {
+		F2FS_I(dir)->chash = fname->hash;
 		F2FS_I(dir)->clevel = level;
 	}
 
@@ -296,7 +349,8 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 }
 
 struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
-			struct fscrypt_name *fname, struct page **res_page)
+					 const struct f2fs_filename *fname,
+					 struct page **res_page)
 {
 	unsigned long npages = dir_blocks(dir);
 	struct f2fs_dir_entry *de = NULL;
@@ -345,18 +399,10 @@ struct f2fs_dir_entry *f2fs_find_entry(struct inode *dir,
 			const struct qstr *child, struct page **res_page)
 {
 	struct f2fs_dir_entry *de = NULL;
-	struct fscrypt_name fname;
+	struct f2fs_filename fname;
 	int err;
 
-#ifdef CONFIG_UNICODE
-	if (f2fs_has_strict_mode(F2FS_I_SB(dir)) && IS_CASEFOLDED(dir) &&
-			utf8_validate(F2FS_I_SB(dir)->s_encoding, child)) {
-		*res_page = ERR_PTR(-EINVAL);
-		return NULL;
-	}
-#endif
-
-	err = fscrypt_setup_filename(dir, child, 1, &fname);
+	err = f2fs_setup_filename(dir, child, 1, &fname);
 	if (err) {
 		if (err == -ENOENT)
 			*res_page = NULL;
@@ -367,7 +413,7 @@ struct f2fs_dir_entry *f2fs_find_entry(struct inode *dir,
 
 	de = __f2fs_find_entry(dir, &fname, res_page);
 
-	fscrypt_free_filename(&fname);
+	f2fs_free_filename(&fname);
 	return de;
 }
 
@@ -408,7 +454,8 @@ void f2fs_set_link(struct inode *dir, struct f2fs_dir_entry *de,
 	f2fs_put_page(page, 1);
 }
 
-static void init_dent_inode(const struct qstr *name, struct page *ipage)
+static void init_dent_inode(const struct f2fs_filename *fname,
+			    struct page *ipage)
 {
 	struct f2fs_inode *ri;
 
@@ -416,16 +463,16 @@ static void init_dent_inode(const struct qstr *name, struct page *ipage)
 
 	/* copy name info. to this inode page */
 	ri = F2FS_INODE(ipage);
-	ri->i_namelen = cpu_to_le32(name->len);
-	memcpy(ri->i_name, name->name, name->len);
+	ri->i_namelen = cpu_to_le32(fname->disk_name.len);
+	memcpy(ri->i_name, fname->disk_name.name, fname->disk_name.len);
 	set_page_dirty(ipage);
 }
 
 void f2fs_do_make_empty_dir(struct inode *inode, struct inode *parent,
 					struct f2fs_dentry_ptr *d)
 {
-	struct qstr dot = QSTR_INIT(".", 1);
-	struct qstr dotdot = QSTR_INIT("..", 2);
+	struct fscrypt_str dot = FSTR_INIT(".", 1);
+	struct fscrypt_str dotdot = FSTR_INIT("..", 2);
 
 	/* update dirent of "." */
 	f2fs_update_dentry(inode->i_ino, inode->i_mode, d, &dot, 0, 0);
@@ -459,8 +506,7 @@ static int make_empty_dir(struct inode *inode,
 }
 
 struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
-			const struct qstr *new_name, const struct qstr *orig_name,
-			struct page *dpage)
+			const struct f2fs_filename *fname, struct page *dpage)
 {
 	struct page *page;
 	int err;
@@ -485,7 +531,8 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
 		if (err)
 			goto put_error;
 
-		err = f2fs_init_security(inode, dir, orig_name, page);
+		err = f2fs_init_security(inode, dir,
+					 fname ? fname->usr_fname : NULL, page);
 		if (err)
 			goto put_error;
 
@@ -500,8 +547,8 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
 			return page;
 	}
 
-	if (new_name) {
-		init_dent_inode(new_name, page);
+	if (fname) {
+		init_dent_inode(fname, page);
 		if (IS_ENCRYPTED(dir))
 			file_set_enc_name(inode);
 	}
@@ -569,11 +616,11 @@ int f2fs_room_for_filename(const void *bitmap, int slots, int max_slots)
 }
 
 bool f2fs_has_enough_room(struct inode *dir, struct page *ipage,
-					struct fscrypt_name *fname)
+			  const struct f2fs_filename *fname)
 {
 	struct f2fs_dentry_ptr d;
 	unsigned int bit_pos;
-	int slots = GET_DENTRY_SLOTS(fname_len(fname));
+	int slots = GET_DENTRY_SLOTS(fname->disk_name.len);
 
 	make_dentry_ptr_inline(dir, &d, inline_data_addr(dir, ipage));
 
@@ -583,8 +630,8 @@ bool f2fs_has_enough_room(struct inode *dir, struct page *ipage,
 }
 
 void f2fs_update_dentry(nid_t ino, umode_t mode, struct f2fs_dentry_ptr *d,
-				const struct qstr *name, f2fs_hash_t name_hash,
-				unsigned int bit_pos)
+			const struct fscrypt_str *name, f2fs_hash_t name_hash,
+			unsigned int bit_pos)
 {
 	struct f2fs_dir_entry *de;
 	int slots = GET_DENTRY_SLOTS(name->len);
@@ -604,15 +651,13 @@ void f2fs_update_dentry(nid_t ino, umode_t mode, struct f2fs_dentry_ptr *d,
 	}
 }
 
-int f2fs_add_regular_entry(struct inode *dir, const struct qstr *new_name,
-				const struct qstr *orig_name,
-				struct inode *inode, nid_t ino, umode_t mode)
+int f2fs_add_regular_entry(struct inode *dir, const struct f2fs_filename *fname,
+			   struct inode *inode, nid_t ino, umode_t mode)
 {
 	unsigned int bit_pos;
 	unsigned int level;
 	unsigned int current_depth;
 	unsigned long bidx, block;
-	f2fs_hash_t dentry_hash;
 	unsigned int nbucket, nblock;
 	struct page *dentry_page = NULL;
 	struct f2fs_dentry_block *dentry_blk = NULL;
@@ -621,11 +666,10 @@ int f2fs_add_regular_entry(struct inode *dir, const struct qstr *new_name,
 	int slots, err = 0;
 
 	level = 0;
-	slots = GET_DENTRY_SLOTS(new_name->len);
-	dentry_hash = f2fs_dentry_hash(dir, new_name, NULL);
+	slots = GET_DENTRY_SLOTS(fname->disk_name.len);
 
 	current_depth = F2FS_I(dir)->i_current_depth;
-	if (F2FS_I(dir)->chash == dentry_hash) {
+	if (F2FS_I(dir)->chash == fname->hash) {
 		level = F2FS_I(dir)->clevel;
 		F2FS_I(dir)->chash = 0;
 	}
@@ -647,7 +691,7 @@ int f2fs_add_regular_entry(struct inode *dir, const struct qstr *new_name,
 	nblock = bucket_blocks(level);
 
 	bidx = dir_block_index(level, F2FS_I(dir)->i_dir_level,
-				(le32_to_cpu(dentry_hash) % nbucket));
+				(le32_to_cpu(fname->hash) % nbucket));
 
 	for (block = bidx; block <= (bidx + nblock - 1); block++) {
 		dentry_page = f2fs_get_new_data_page(dir, NULL, block, true);
@@ -671,8 +715,7 @@ int f2fs_add_regular_entry(struct inode *dir, const struct qstr *new_name,
 
 	if (inode) {
 		down_write(&F2FS_I(inode)->i_sem);
-		page = f2fs_init_inode_metadata(inode, dir, new_name,
-						orig_name, NULL);
+		page = f2fs_init_inode_metadata(inode, dir, fname, NULL);
 		if (IS_ERR(page)) {
 			err = PTR_ERR(page);
 			goto fail;
@@ -680,7 +723,8 @@ int f2fs_add_regular_entry(struct inode *dir, const struct qstr *new_name,
 	}
 
 	make_dentry_ptr_block(NULL, &d, dentry_blk);
-	f2fs_update_dentry(ino, mode, &d, new_name, dentry_hash, bit_pos);
+	f2fs_update_dentry(ino, mode, &d, &fname->disk_name, fname->hash,
+			   bit_pos);
 
 	set_page_dirty(dentry_page);
 
@@ -704,21 +748,15 @@ int f2fs_add_regular_entry(struct inode *dir, const struct qstr *new_name,
 	return err;
 }
 
-int f2fs_add_dentry(struct inode *dir, struct fscrypt_name *fname,
-				struct inode *inode, nid_t ino, umode_t mode)
+int f2fs_add_dentry(struct inode *dir, const struct f2fs_filename *fname,
+		    struct inode *inode, nid_t ino, umode_t mode)
 {
-	struct qstr new_name;
 	int err = -EAGAIN;
 
-	new_name.name = fname_name(fname);
-	new_name.len = fname_len(fname);
-
 	if (f2fs_has_inline_dentry(dir))
-		err = f2fs_add_inline_entry(dir, &new_name, fname->usr_fname,
-							inode, ino, mode);
+		err = f2fs_add_inline_entry(dir, fname, inode, ino, mode);
 	if (err == -EAGAIN)
-		err = f2fs_add_regular_entry(dir, &new_name, fname->usr_fname,
-							inode, ino, mode);
+		err = f2fs_add_regular_entry(dir, fname, inode, ino, mode);
 
 	f2fs_update_time(F2FS_I_SB(dir), REQ_TIME);
 	return err;
@@ -731,12 +769,12 @@ int f2fs_add_dentry(struct inode *dir, struct fscrypt_name *fname,
 int f2fs_do_add_link(struct inode *dir, const struct qstr *name,
 				struct inode *inode, nid_t ino, umode_t mode)
 {
-	struct fscrypt_name fname;
+	struct f2fs_filename fname;
 	struct page *page = NULL;
 	struct f2fs_dir_entry *de = NULL;
 	int err;
 
-	err = fscrypt_setup_filename(dir, name, 0, &fname);
+	err = f2fs_setup_filename(dir, name, 0, &fname);
 	if (err)
 		return err;
 
@@ -759,7 +797,7 @@ int f2fs_do_add_link(struct inode *dir, const struct qstr *name,
 	} else {
 		err = f2fs_add_dentry(dir, &fname, inode, ino, mode);
 	}
-	fscrypt_free_filename(&fname);
+	f2fs_free_filename(&fname);
 	return err;
 }
 
@@ -769,7 +807,7 @@ int f2fs_do_tmpfile(struct inode *inode, struct inode *dir)
 	int err = 0;
 
 	down_write(&F2FS_I(inode)->i_sem);
-	page = f2fs_init_inode_metadata(inode, dir, NULL, NULL, NULL);
+	page = f2fs_init_inode_metadata(inode, dir, NULL, NULL);
 	if (IS_ERR(page)) {
 		err = PTR_ERR(page);
 		goto fail;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a953a622f260e3..1df50d9224bb71 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -506,6 +506,42 @@ static inline int get_inline_xattr_addrs(struct inode *inode);
  * For INODE and NODE manager
  */
 /* for directory operations */
+
+struct f2fs_filename {
+	/*
+	 * The filename the user specified.  This is NULL for some
+	 * filesystem-internal operations, e.g. converting an inline directory
+	 * to a non-inline one, or roll-forward recovering an encrypted dentry.
+	 */
+	const struct qstr *usr_fname;
+
+	/*
+	 * The on-disk filename.  For encrypted directories, this is encrypted.
+	 * This may be NULL for lookups in an encrypted dir without the key.
+	 */
+	struct fscrypt_str disk_name;
+
+	/* The dirhash of this filename */
+	f2fs_hash_t hash;
+
+#ifdef CONFIG_FS_ENCRYPTION
+	/*
+	 * For lookups in encrypted directories: either the buffer backing
+	 * disk_name, or a buffer that holds the decoded no-key name.
+	 */
+	struct fscrypt_str crypto_buf;
+#endif
+#ifdef CONFIG_UNICODE
+	/*
+	 * For casefolded directories: the casefolded name, but it's left NULL
+	 * if the original name is not valid Unicode or if the filesystem is
+	 * doing an internal operation where usr_fname is also NULL.  In these
+	 * cases we fall back to treating the name as an opaque byte sequence.
+	 */
+	struct fscrypt_str cf_name;
+#endif
+};
+
 struct f2fs_dentry_ptr {
 	struct inode *inode;
 	void *bitmap;
@@ -2920,12 +2956,12 @@ static inline bool f2fs_cp_error(struct f2fs_sb_info *sbi)
 	return is_set_ckpt_flags(sbi, CP_ERROR_FLAG);
 }
 
-static inline bool is_dot_dotdot(const struct qstr *str)
+static inline bool is_dot_dotdot(const u8 *name, size_t len)
 {
-	if (str->len == 1 && str->name[0] == '.')
+	if (len == 1 && name[0] == '.')
 		return true;
 
-	if (str->len == 2 && str->name[0] == '.' && str->name[1] == '.')
+	if (len == 2 && name[0] == '.' && name[1] == '.')
 		return true;
 
 	return false;
@@ -3138,22 +3174,28 @@ struct dentry *f2fs_get_parent(struct dentry *child);
  * dir.c
  */
 unsigned char f2fs_get_de_type(struct f2fs_dir_entry *de);
-struct f2fs_dir_entry *f2fs_find_target_dentry(struct fscrypt_name *fname,
-			f2fs_hash_t namehash, int *max_slots,
-			struct f2fs_dentry_ptr *d);
+int f2fs_init_casefolded_name(const struct inode *dir,
+			      struct f2fs_filename *fname);
+int f2fs_setup_filename(struct inode *dir, const struct qstr *iname,
+			int lookup, struct f2fs_filename *fname);
+int f2fs_prepare_lookup(struct inode *dir, struct dentry *dentry,
+			struct f2fs_filename *fname);
+void f2fs_free_filename(struct f2fs_filename *fname);
+struct f2fs_dir_entry *f2fs_find_target_dentry(const struct f2fs_dentry_ptr *d,
+			const struct f2fs_filename *fname, int *max_slots);
 int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
 			unsigned int start_pos, struct fscrypt_str *fstr);
 void f2fs_do_make_empty_dir(struct inode *inode, struct inode *parent,
 			struct f2fs_dentry_ptr *d);
 struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
-			const struct qstr *new_name,
-			const struct qstr *orig_name, struct page *dpage);
+			const struct f2fs_filename *fname, struct page *dpage);
 void f2fs_update_parent_metadata(struct inode *dir, struct inode *inode,
 			unsigned int current_depth);
 int f2fs_room_for_filename(const void *bitmap, int slots, int max_slots);
 void f2fs_drop_nlink(struct inode *dir, struct inode *inode);
 struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
-			struct fscrypt_name *fname, struct page **res_page);
+					 const struct f2fs_filename *fname,
+					 struct page **res_page);
 struct f2fs_dir_entry *f2fs_find_entry(struct inode *dir,
 			const struct qstr *child, struct page **res_page);
 struct f2fs_dir_entry *f2fs_parent_dir(struct inode *dir, struct page **p);
@@ -3162,14 +3204,13 @@ ino_t f2fs_inode_by_name(struct inode *dir, const struct qstr *qstr,
 void f2fs_set_link(struct inode *dir, struct f2fs_dir_entry *de,
 			struct page *page, struct inode *inode);
 bool f2fs_has_enough_room(struct inode *dir, struct page *ipage,
-			struct fscrypt_name *fname);
+			  const struct f2fs_filename *fname);
 void f2fs_update_dentry(nid_t ino, umode_t mode, struct f2fs_dentry_ptr *d,
-			const struct qstr *name, f2fs_hash_t name_hash,
+			const struct fscrypt_str *name, f2fs_hash_t name_hash,
 			unsigned int bit_pos);
-int f2fs_add_regular_entry(struct inode *dir, const struct qstr *new_name,
-			const struct qstr *orig_name,
+int f2fs_add_regular_entry(struct inode *dir, const struct f2fs_filename *fname,
 			struct inode *inode, nid_t ino, umode_t mode);
-int f2fs_add_dentry(struct inode *dir, struct fscrypt_name *fname,
+int f2fs_add_dentry(struct inode *dir, const struct f2fs_filename *fname,
 			struct inode *inode, nid_t ino, umode_t mode);
 int f2fs_do_add_link(struct inode *dir, const struct qstr *name,
 			struct inode *inode, nid_t ino, umode_t mode);
@@ -3199,8 +3240,7 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi);
 /*
  * hash.c
  */
-f2fs_hash_t f2fs_dentry_hash(const struct inode *dir,
-		const struct qstr *name_info, struct fscrypt_name *fname);
+void f2fs_hash_filename(const struct inode *dir, struct f2fs_filename *fname);
 
 /*
  * node.c
@@ -3711,11 +3751,11 @@ int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry);
 int f2fs_write_inline_data(struct inode *inode, struct page *page);
 bool f2fs_recover_inline_data(struct inode *inode, struct page *npage);
 struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
-			struct fscrypt_name *fname, struct page **res_page);
+					const struct f2fs_filename *fname,
+					struct page **res_page);
 int f2fs_make_empty_inline_dir(struct inode *inode, struct inode *parent,
 			struct page *ipage);
-int f2fs_add_inline_entry(struct inode *dir, const struct qstr *new_name,
-			const struct qstr *orig_name,
+int f2fs_add_inline_entry(struct inode *dir, const struct f2fs_filename *fname,
 			struct inode *inode, nid_t ino, umode_t mode);
 void f2fs_delete_inline_entry(struct f2fs_dir_entry *dentry,
 				struct page *page, struct inode *dir,
diff --git a/fs/f2fs/hash.c b/fs/f2fs/hash.c
index 5bc4dcd8fc03fb..e5997919472d4f 100644
--- a/fs/f2fs/hash.c
+++ b/fs/f2fs/hash.c
@@ -68,22 +68,9 @@ static void str2hashbuf(const unsigned char *msg, size_t len,
 		*buf++ = pad;
 }
 
-static f2fs_hash_t __f2fs_dentry_hash(const struct qstr *name_info,
-				struct fscrypt_name *fname)
+static u32 TEA_hash_name(const u8 *p, size_t len)
 {
-	__u32 hash;
-	f2fs_hash_t f2fs_hash;
-	const unsigned char *p;
 	__u32 in[8], buf[4];
-	const unsigned char *name = name_info->name;
-	size_t len = name_info->len;
-
-	/* encrypted bigname case */
-	if (fname && !fname->disk_name.name)
-		return cpu_to_le32(fname->hash);
-
-	if (is_dot_dotdot(name_info))
-		return 0;
 
 	/* Initialize the default seed for the hash checksum functions */
 	buf[0] = 0x67452301;
@@ -91,7 +78,6 @@ static f2fs_hash_t __f2fs_dentry_hash(const struct qstr *name_info,
 	buf[2] = 0x98badcfe;
 	buf[3] = 0x10325476;
 
-	p = name;
 	while (1) {
 		str2hashbuf(p, len, in, 4);
 		TEA_transform(buf, in);
@@ -100,41 +86,43 @@ static f2fs_hash_t __f2fs_dentry_hash(const struct qstr *name_info,
 			break;
 		len -= 16;
 	}
-	hash = buf[0];
-	f2fs_hash = cpu_to_le32(hash & ~F2FS_HASH_COL_BIT);
-	return f2fs_hash;
+	return buf[0] & ~F2FS_HASH_COL_BIT;
 }
 
-f2fs_hash_t f2fs_dentry_hash(const struct inode *dir,
-		const struct qstr *name_info, struct fscrypt_name *fname)
+/*
+ * Compute @fname->hash.  For all directories, @fname->disk_name must be set.
+ * For casefolded directories, @fname->usr_fname must be set, and also
+ * @fname->cf_name if the filename is valid Unicode.
+ */
+void f2fs_hash_filename(const struct inode *dir, struct f2fs_filename *fname)
 {
-#ifdef CONFIG_UNICODE
-	struct f2fs_sb_info *sbi = F2FS_SB(dir->i_sb);
-	const struct unicode_map *um = sbi->s_encoding;
-	int r, dlen;
-	unsigned char *buff;
-	struct qstr folded;
+	const u8 *name = fname->disk_name.name;
+	size_t len = fname->disk_name.len;
 
-	if (!name_info->len || !IS_CASEFOLDED(dir))
-		goto opaque_seq;
+	WARN_ON_ONCE(!name);
 
-	buff = f2fs_kzalloc(sbi, sizeof(char) * PATH_MAX, GFP_KERNEL);
-	if (!buff)
-		return -ENOMEM;
-
-	dlen = utf8_casefold(um, name_info, buff, PATH_MAX);
-	if (dlen < 0) {
-		kvfree(buff);
-		goto opaque_seq;
+	if (is_dot_dotdot(name, len)) {
+		fname->hash = 0;
+		return;
 	}
-	folded.name = buff;
-	folded.len = dlen;
-	r = __f2fs_dentry_hash(&folded, fname);
-
-	kvfree(buff);
-	return r;
 
-opaque_seq:
+#ifdef CONFIG_UNICODE
+	if (IS_CASEFOLDED(dir)) {
+		/*
+		 * If the casefolded name is provided, hash it instead of the
+		 * on-disk name.  If the casefolded name is *not* provided, that
+		 * should only be because the name wasn't valid Unicode, so fall
+		 * back to treating the name as an opaque byte sequence.
+		 */
+		WARN_ON_ONCE(!fname->usr_fname->name);
+		if (fname->cf_name.name) {
+			name = fname->cf_name.name;
+			len = fname->cf_name.len;
+		} else {
+			name = fname->usr_fname->name;
+			len = fname->usr_fname->len;
+		}
+	}
 #endif
-	return __f2fs_dentry_hash(name_info, fname);
+	fname->hash = cpu_to_le32(TEA_hash_name(name, len));
 }
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 59a4b7ff11e17a..751a012ff8404f 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -305,15 +305,14 @@ bool f2fs_recover_inline_data(struct inode *inode, struct page *npage)
 }
 
 struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
-			struct fscrypt_name *fname, struct page **res_page)
+					const struct f2fs_filename *fname,
+					struct page **res_page)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(dir->i_sb);
-	struct qstr name = FSTR_TO_QSTR(&fname->disk_name);
 	struct f2fs_dir_entry *de;
 	struct f2fs_dentry_ptr d;
 	struct page *ipage;
 	void *inline_dentry;
-	f2fs_hash_t namehash;
 
 	ipage = f2fs_get_node_page(sbi, dir->i_ino);
 	if (IS_ERR(ipage)) {
@@ -321,12 +320,10 @@ struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
 		return NULL;
 	}
 
-	namehash = f2fs_dentry_hash(dir, &name, fname);
-
 	inline_dentry = inline_data_addr(dir, ipage);
 
 	make_dentry_ptr_inline(dir, &d, inline_dentry);
-	de = f2fs_find_target_dentry(fname, namehash, NULL, &d);
+	de = f2fs_find_target_dentry(&d, fname, NULL);
 	unlock_page(ipage);
 	if (de)
 		*res_page = ipage;
@@ -443,7 +440,7 @@ static int f2fs_add_inline_entries(struct inode *dir, void *inline_dentry)
 
 	while (bit_pos < d.max) {
 		struct f2fs_dir_entry *de;
-		struct qstr new_name;
+		struct f2fs_filename fname;
 		nid_t ino;
 		umode_t fake_mode;
 
@@ -459,14 +456,19 @@ static int f2fs_add_inline_entries(struct inode *dir, void *inline_dentry)
 			continue;
 		}
 
-		new_name.name = d.filename[bit_pos];
-		new_name.len = le16_to_cpu(de->name_len);
+		/*
+		 * We only need the disk_name and hash to move the dentry.
+		 * We don't need the original or casefolded filenames.
+		 */
+		memset(&fname, 0, sizeof(fname));
+		fname.disk_name.name = d.filename[bit_pos];
+		fname.disk_name.len = le16_to_cpu(de->name_len);
+		fname.hash = de->hash_code;
 
 		ino = le32_to_cpu(de->ino);
 		fake_mode = f2fs_get_de_type(de) << S_SHIFT;
 
-		err = f2fs_add_regular_entry(dir, &new_name, NULL, NULL,
-							ino, fake_mode);
+		err = f2fs_add_regular_entry(dir, &fname, NULL, ino, fake_mode);
 		if (err)
 			goto punch_dentry_pages;
 
@@ -543,7 +545,7 @@ int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
 	struct page *ipage;
-	struct fscrypt_name fname;
+	struct f2fs_filename fname;
 	void *inline_dentry = NULL;
 	int err = 0;
 
@@ -552,7 +554,7 @@ int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry)
 
 	f2fs_lock_op(sbi);
 
-	err = fscrypt_setup_filename(dir, &dentry->d_name, 0, &fname);
+	err = f2fs_setup_filename(dir, &dentry->d_name, 0, &fname);
 	if (err)
 		goto out;
 
@@ -573,23 +575,21 @@ int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry)
 	if (!err)
 		f2fs_put_page(ipage, 1);
 out_fname:
-	fscrypt_free_filename(&fname);
+	f2fs_free_filename(&fname);
 out:
 	f2fs_unlock_op(sbi);
 	return err;
 }
 
-int f2fs_add_inline_entry(struct inode *dir, const struct qstr *new_name,
-				const struct qstr *orig_name,
-				struct inode *inode, nid_t ino, umode_t mode)
+int f2fs_add_inline_entry(struct inode *dir, const struct f2fs_filename *fname,
+			  struct inode *inode, nid_t ino, umode_t mode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
 	struct page *ipage;
 	unsigned int bit_pos;
-	f2fs_hash_t name_hash;
 	void *inline_dentry = NULL;
 	struct f2fs_dentry_ptr d;
-	int slots = GET_DENTRY_SLOTS(new_name->len);
+	int slots = GET_DENTRY_SLOTS(fname->disk_name.len);
 	struct page *page = NULL;
 	int err = 0;
 
@@ -611,8 +611,7 @@ int f2fs_add_inline_entry(struct inode *dir, const struct qstr *new_name,
 
 	if (inode) {
 		down_write(&F2FS_I(inode)->i_sem);
-		page = f2fs_init_inode_metadata(inode, dir, new_name,
-						orig_name, ipage);
+		page = f2fs_init_inode_metadata(inode, dir, fname, ipage);
 		if (IS_ERR(page)) {
 			err = PTR_ERR(page);
 			goto fail;
@@ -621,8 +620,8 @@ int f2fs_add_inline_entry(struct inode *dir, const struct qstr *new_name,
 
 	f2fs_wait_on_page_writeback(ipage, NODE, true, true);
 
-	name_hash = f2fs_dentry_hash(dir, new_name, NULL);
-	f2fs_update_dentry(ino, mode, &d, new_name, name_hash, bit_pos);
+	f2fs_update_dentry(ino, mode, &d, &fname->disk_name, fname->hash,
+			   bit_pos);
 
 	set_page_dirty(ipage);
 
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index f54119da2217ff..58db1de7ca9476 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -482,7 +482,7 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 	nid_t ino = -1;
 	int err = 0;
 	unsigned int root_ino = F2FS_ROOT_INO(F2FS_I_SB(dir));
-	struct fscrypt_name fname;
+	struct f2fs_filename fname;
 
 	trace_f2fs_lookup_start(dir, dentry, flags);
 
@@ -491,13 +491,13 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 		goto out;
 	}
 
-	err = fscrypt_prepare_lookup(dir, dentry, &fname);
+	err = f2fs_prepare_lookup(dir, dentry, &fname);
 	if (err == -ENOENT)
 		goto out_splice;
 	if (err)
 		goto out;
 	de = __f2fs_find_entry(dir, &fname, &page);
-	fscrypt_free_filename(&fname);
+	f2fs_free_filename(&fname);
 
 	if (!de) {
 		if (IS_ERR(page)) {
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index dd804c07eeb059..ae5310f02e7ff1 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -107,13 +107,51 @@ static void del_fsync_inode(struct fsync_inode_entry *entry, int drop)
 	kmem_cache_free(fsync_entry_slab, entry);
 }
 
+static int init_recovered_filename(const struct inode *dir,
+				   struct f2fs_inode *raw_inode,
+				   struct f2fs_filename *fname,
+				   struct qstr *usr_fname)
+{
+	int err;
+
+	memset(fname, 0, sizeof(*fname));
+	fname->disk_name.len = le32_to_cpu(raw_inode->i_namelen);
+	fname->disk_name.name = raw_inode->i_name;
+
+	if (WARN_ON(fname->disk_name.len > F2FS_NAME_LEN))
+		return -ENAMETOOLONG;
+
+	if (!IS_ENCRYPTED(dir)) {
+		usr_fname->name = fname->disk_name.name;
+		usr_fname->len = fname->disk_name.len;
+		fname->usr_fname = usr_fname;
+	}
+
+	/* Compute the hash of the filename */
+	if (IS_CASEFOLDED(dir)) {
+		err = f2fs_init_casefolded_name(dir, fname);
+		if (err)
+			return err;
+		f2fs_hash_filename(dir, fname);
+#ifdef CONFIG_UNICODE
+		/* Case-sensitive match is fine for recovery */
+		kfree(fname->cf_name.name);
+		fname->cf_name.name = NULL;
+#endif
+	} else {
+		f2fs_hash_filename(dir, fname);
+	}
+	return 0;
+}
+
 static int recover_dentry(struct inode *inode, struct page *ipage,
 						struct list_head *dir_list)
 {
 	struct f2fs_inode *raw_inode = F2FS_INODE(ipage);
 	nid_t pino = le32_to_cpu(raw_inode->i_pino);
 	struct f2fs_dir_entry *de;
-	struct fscrypt_name fname;
+	struct f2fs_filename fname;
+	struct qstr usr_fname;
 	struct page *page;
 	struct inode *dir, *einode;
 	struct fsync_inode_entry *entry;
@@ -132,16 +170,9 @@ static int recover_dentry(struct inode *inode, struct page *ipage,
 	}
 
 	dir = entry->inode;
-
-	memset(&fname, 0, sizeof(struct fscrypt_name));
-	fname.disk_name.len = le32_to_cpu(raw_inode->i_namelen);
-	fname.disk_name.name = raw_inode->i_name;
-
-	if (unlikely(fname.disk_name.len > F2FS_NAME_LEN)) {
-		WARN_ON(1);
-		err = -ENAMETOOLONG;
+	err = init_recovered_filename(dir, raw_inode, &fname, &usr_fname);
+	if (err)
 		goto out;
-	}
 retry:
 	de = __f2fs_find_entry(dir, &fname, &page);
 	if (de && inode->i_ino == le32_to_cpu(de->ino))
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
