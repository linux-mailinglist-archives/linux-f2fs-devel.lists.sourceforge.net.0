Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 102142CCC6D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 03:23:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkeH3-0007se-Qt; Thu, 03 Dec 2020 02:23:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kkeH1-0007sK-QN
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 02:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=joOhkiizMSHOzftLZw9YGnCPsszU5Hr+pxRtyo6g7Yo=; b=UxlvyBnlWBy4lRPPgcfo7IM+uU
 jVYHdsfd2WAhQozW/AwdF+bSawkfvDlhMsWt2syvPRZyGSOxm7gYbkRYhMqe6zcHN6RT1Ft/OpX9z
 z8IvI+mmsqMsAfKvMEicaDmbApAfJm/E5QwHKyXYecvy7d8j8a2Ue4FFPOsGY/TJbpyo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=joOhkiizMSHOzftLZw9YGnCPsszU5Hr+pxRtyo6g7Yo=; b=GEoXJoVeY7RfWxnbkQHIlvQ4i4
 aMYMXzcQSdrIndaGuxmQvKyjwsOpuHmvFNKtIiB83oXb+vif6ZuFReVbxTy06ZdbESAudll9MBTeW
 ChbM3ebBNfUtkd3BCaXKdB100/XMTNE/VeeKq/Ohh6xRQ0qr9yOpLFSbaZw8719Bent4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkeGx-00Gwbf-Vv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 02:23:11 +0000
From: Eric Biggers <ebiggers@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-fscrypt@vger.kernel.org
Date: Wed,  2 Dec 2020 18:20:41 -0800
Message-Id: <20201203022041.230976-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203022041.230976-1-ebiggers@kernel.org>
References: <20201203022041.230976-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 2.5 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
X-Headers-End: 1kkeGx-00Gwbf-Vv
Subject: [f2fs-dev] [PATCH v2 9/9] fscrypt: allow deleting files with
 unsupported encryption policy
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
Cc: linux-fsdevel@vger.kernel.org, Andreas Dilger <adilger@dilger.ca>,
 linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Currently it's impossible to delete files that use an unsupported
encryption policy, as the kernel will just return an error when
performing any operation on the top-level encrypted directory, even just
a path lookup into the directory or opening the directory for readdir.

More specifically, this occurs in any of the following cases:

- The encryption context has an unrecognized version number.  Current
  kernels know about v1 and v2, but there could be more versions in the
  future.

- The encryption context has unrecognized encryption modes
  (FSCRYPT_MODE_*) or flags (FSCRYPT_POLICY_FLAG_*), an unrecognized
  combination of modes, or reserved bits set.

- The encryption key has been added and the encryption modes are
  recognized but aren't available in the crypto API -- for example, a
  directory is encrypted with FSCRYPT_MODE_ADIANTUM but the kernel
  doesn't have CONFIG_CRYPTO_ADIANTUM enabled.

It's desirable to return errors for most operations on files that use an
unsupported encryption policy, but the current behavior is too strict.
We need to allow enough to delete files, so that people can't be stuck
with undeletable files when downgrading kernel versions.  That includes
allowing directories to be listed and allowing dentries to be looked up.

Fix this by modifying the key setup logic to treat an unsupported
encryption policy in the same way as "key unavailable" in the cases that
are required for a recursive delete to work: preparing for a readdir or
a dentry lookup, revalidating a dentry, or checking whether an inode has
the same encryption policy as its parent directory.

Reviewed-by: Andreas Dilger <adilger@dilger.ca>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fname.c           |  8 ++++++--
 fs/crypto/fscrypt_private.h |  4 ++--
 fs/crypto/hooks.c           |  4 ++--
 fs/crypto/keysetup.c        | 19 +++++++++++++++++--
 fs/crypto/policy.c          | 22 ++++++++++++++--------
 include/linux/fscrypt.h     |  9 ++++++---
 6 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index 1fbe6c24d7052..988dadf7a94d5 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -404,7 +404,7 @@ int fscrypt_setup_filename(struct inode *dir, const struct qstr *iname,
 		fname->disk_name.len = iname->len;
 		return 0;
 	}
-	ret = fscrypt_get_encryption_info(dir);
+	ret = fscrypt_get_encryption_info(dir, lookup);
 	if (ret)
 		return ret;
 
@@ -560,7 +560,11 @@ int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
 		return -ECHILD;
 
 	dir = dget_parent(dentry);
-	err = fscrypt_get_encryption_info(d_inode(dir));
+	/*
+	 * Pass allow_unsupported=true, so that files with an unsupported
+	 * encryption policy can be deleted.
+	 */
+	err = fscrypt_get_encryption_info(d_inode(dir), true);
 	valid = !fscrypt_has_encryption_key(d_inode(dir));
 	dput(dir);
 
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index c1c302656c345..f0bed6b06fa69 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -571,7 +571,7 @@ int fscrypt_derive_dirhash_key(struct fscrypt_info *ci,
 void fscrypt_hash_inode_number(struct fscrypt_info *ci,
 			       const struct fscrypt_master_key *mk);
 
-int fscrypt_get_encryption_info(struct inode *inode);
+int fscrypt_get_encryption_info(struct inode *inode, bool allow_unsupported);
 
 /**
  * fscrypt_require_key() - require an inode's encryption key
@@ -589,7 +589,7 @@ int fscrypt_get_encryption_info(struct inode *inode);
 static inline int fscrypt_require_key(struct inode *inode)
 {
 	if (IS_ENCRYPTED(inode)) {
-		int err = fscrypt_get_encryption_info(inode);
+		int err = fscrypt_get_encryption_info(inode, false);
 
 		if (err)
 			return err;
diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 1c16dba222d95..79570e0e8e619 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -116,7 +116,7 @@ EXPORT_SYMBOL_GPL(__fscrypt_prepare_lookup);
 
 int __fscrypt_prepare_readdir(struct inode *dir)
 {
-	return fscrypt_get_encryption_info(dir);
+	return fscrypt_get_encryption_info(dir, true);
 }
 EXPORT_SYMBOL_GPL(__fscrypt_prepare_readdir);
 
@@ -332,7 +332,7 @@ const char *fscrypt_get_symlink(struct inode *inode, const void *caddr,
 	 * Try to set up the symlink's encryption key, but we can continue
 	 * regardless of whether the key is available or not.
 	 */
-	err = fscrypt_get_encryption_info(inode);
+	err = fscrypt_get_encryption_info(inode, false);
 	if (err)
 		return ERR_PTR(err);
 	has_key = fscrypt_has_encryption_key(inode);
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index 6339b3069a400..261293fb70974 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -546,6 +546,11 @@ fscrypt_setup_encryption_info(struct inode *inode,
 /**
  * fscrypt_get_encryption_info() - set up an inode's encryption key
  * @inode: the inode to set up the key for.  Must be encrypted.
+ * @allow_unsupported: if %true, treat an unsupported encryption policy (or
+ *		       unrecognized encryption context) the same way as the key
+ *		       being unavailable, instead of returning an error.  Use
+ *		       %false unless the operation being performed is needed in
+ *		       order for files (or directories) to be deleted.
  *
  * Set up ->i_crypt_info, if it hasn't already been done.
  *
@@ -556,7 +561,7 @@ fscrypt_setup_encryption_info(struct inode *inode,
  *	   encryption key is unavailable.  (Use fscrypt_has_encryption_key() to
  *	   distinguish these cases.)  Also can return another -errno code.
  */
-int fscrypt_get_encryption_info(struct inode *inode)
+int fscrypt_get_encryption_info(struct inode *inode, bool allow_unsupported)
 {
 	int res;
 	union fscrypt_context ctx;
@@ -567,24 +572,34 @@ int fscrypt_get_encryption_info(struct inode *inode)
 
 	res = inode->i_sb->s_cop->get_context(inode, &ctx, sizeof(ctx));
 	if (res < 0) {
+		if (res == -ERANGE && allow_unsupported)
+			return 0;
 		fscrypt_warn(inode, "Error %d getting encryption context", res);
 		return res;
 	}
 
 	res = fscrypt_policy_from_context(&policy, &ctx, res);
 	if (res) {
+		if (allow_unsupported)
+			return 0;
 		fscrypt_warn(inode,
 			     "Unrecognized or corrupt encryption context");
 		return res;
 	}
 
-	if (!fscrypt_supported_policy(&policy, inode))
+	if (!fscrypt_supported_policy(&policy, inode)) {
+		if (allow_unsupported)
+			return 0;
 		return -EINVAL;
+	}
 
 	res = fscrypt_setup_encryption_info(inode, &policy,
 					    fscrypt_context_nonce(&ctx),
 					    IS_CASEFOLDED(inode) &&
 					    S_ISDIR(inode->i_mode));
+
+	if (res == -ENOPKG && allow_unsupported) /* Algorithm unavailable? */
+		res = 0;
 	if (res == -ENOKEY)
 		res = 0;
 	return res;
diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index faa0f21daa684..a51cef6bd27ff 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -590,7 +590,7 @@ EXPORT_SYMBOL_GPL(fscrypt_ioctl_get_nonce);
 int fscrypt_has_permitted_context(struct inode *parent, struct inode *child)
 {
 	union fscrypt_policy parent_policy, child_policy;
-	int err;
+	int err, err1, err2;
 
 	/* No restrictions on file types which are never encrypted */
 	if (!S_ISREG(child->i_mode) && !S_ISDIR(child->i_mode) &&
@@ -620,19 +620,25 @@ int fscrypt_has_permitted_context(struct inode *parent, struct inode *child)
 	 * In any case, if an unexpected error occurs, fall back to "forbidden".
 	 */
 
-	err = fscrypt_get_encryption_info(parent);
+	err = fscrypt_get_encryption_info(parent, true);
 	if (err)
 		return 0;
-	err = fscrypt_get_encryption_info(child);
+	err = fscrypt_get_encryption_info(child, true);
 	if (err)
 		return 0;
 
-	err = fscrypt_get_policy(parent, &parent_policy);
-	if (err)
-		return 0;
+	err1 = fscrypt_get_policy(parent, &parent_policy);
+	err2 = fscrypt_get_policy(child, &child_policy);
 
-	err = fscrypt_get_policy(child, &child_policy);
-	if (err)
+	/*
+	 * Allow the case where the parent and child both have an unrecognized
+	 * encryption policy, so that files with an unrecognized encryption
+	 * policy can be deleted.
+	 */
+	if (err1 == -EINVAL && err2 == -EINVAL)
+		return 1;
+
+	if (err1 || err2)
 		return 0;
 
 	return fscrypt_policies_equal(&parent_policy, &child_policy);
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 4b163f5e58e9f..d23156d1ac949 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -753,8 +753,9 @@ static inline int fscrypt_prepare_rename(struct inode *old_dir,
  *
  * Prepare for ->lookup() in a directory which may be encrypted by determining
  * the name that will actually be used to search the directory on-disk.  If the
- * directory's encryption key is available, then the lookup is assumed to be by
- * plaintext name; otherwise, it is assumed to be by no-key name.
+ * directory's encryption policy is supported by this kernel and its encryption
+ * key is available, then the lookup is assumed to be by plaintext name;
+ * otherwise, it is assumed to be by no-key name.
  *
  * This also installs a custom ->d_revalidate() method which will invalidate the
  * dentry if it was created without the key and the key is later added.
@@ -786,7 +787,9 @@ static inline int fscrypt_prepare_lookup(struct inode *dir,
  * form rather than in no-key form.
  *
  * Return: 0 on success; -errno on error.  Note that the encryption key being
- *	   unavailable is not considered an error.
+ *	   unavailable is not considered an error.  It is also not an error if
+ *	   the encryption policy is unsupported by this kernel; that is treated
+ *	   like the key being unavailable, so that files can still be deleted.
  */
 static inline int fscrypt_prepare_readdir(struct inode *dir)
 {
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
