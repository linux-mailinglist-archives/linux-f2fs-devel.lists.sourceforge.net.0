Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 356502C357A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Nov 2020 01:26:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1khidH-00053O-R5; Wed, 25 Nov 2020 00:26:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1khicX-00050C-Qh
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Nov 2020 00:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bCUIyXzKsXSWX7JADyItuyDw3aBeI+9UFjfS46JY3Nk=; b=EbBxjNHMyb5yF1Ou5WcyhFiSCk
 NsPZUchc323Vd+MH/s5AsuTUFB8ouXb3yiqz4V/CFf6NCKvRBHqXBrsg5GJhsriChIsnzPAEzEN/r
 1Bwu5QyHGLDUE7rsS1Q2w4dTXbj/tksULuPYXEWE0iKgRJr1QNevvS+BQ78ljt8KNbXQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bCUIyXzKsXSWX7JADyItuyDw3aBeI+9UFjfS46JY3Nk=; b=DSBj5OrKC6jSKeR9Fkc4MQML0S
 VREm3xSQZB/LBpSg/oTw15rtX8D6pDYs9/1fdVYGSCFySsMcH3pyY9DiqtwAmuPOy0fcINg+g4Cqm
 /+Grip73nkzVoSt5yNn3ONilD/BPt492RFeBY+dTLIri+GJM9TQr3fBoKlL4hSWZ2xGI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1khicT-002qN7-IL
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Nov 2020 00:25:17 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1722821973;
 Wed, 25 Nov 2020 00:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606263888;
 bh=DVK6Cv8eMmHD4Mdw9Fv5x1aRtgQJLUbKLl+tIxUBawc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HUM7wu+uioFHT8DZk0TfcbzTpxC8O/Aoezrvrc7iOwGX/o2T3iNqSLbnO0OrGF5up
 QCYRscl8eF0gn6U/d7CHvdGUsX7SznDUYUggS/2BFrgUfQnAaSUYfuKMkYn/eM6oI4
 xsTTt4by8u5QS83DDBVwY4GNiHqbuk1n0N1s7x2k=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Tue, 24 Nov 2020 16:23:36 -0800
Message-Id: <20201125002336.274045-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201125002336.274045-1-ebiggers@kernel.org>
References: <20201125002336.274045-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 2.4 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1khicT-002qN7-IL
Subject: [f2fs-dev] [PATCH 9/9] fscrypt: allow deleting files with
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
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
index 1fbe6c24d705..988dadf7a94d 100644
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
index c1c302656c34..f0bed6b06fa6 100644
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
index 1c16dba222d9..79570e0e8e61 100644
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
index 6339b3069a40..261293fb7097 100644
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
index faa0f21daa68..a51cef6bd27f 100644
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
index 4b163f5e58e9..d23156d1ac94 100644
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
