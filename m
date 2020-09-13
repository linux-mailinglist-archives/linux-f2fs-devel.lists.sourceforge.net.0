Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D350267EB3
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 13 Sep 2020 10:38:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kHNWt-0005UH-9P; Sun, 13 Sep 2020 08:38:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kHNWo-0005TG-9H
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 13 Sep 2020 08:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ennFi/kbgwIAl/LH9DnCEYclTH0nuGijnzOf1AZ5r1M=; b=TvRPng9p8YC4c5iwJR1UFuxwgI
 ZJkkfBt2DS4st6DdczrSUZ/obfxahk+bExy0/ziaazNK6UzJErH2mLO0W2xzV9q4KDL2uAmpKxEE5
 BtnLubeey7PwemIDN83WxHD8BHH4eDA8t/IwdqK9rlZnR2ZWw0Cv77XG7PCcIelX3R28=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ennFi/kbgwIAl/LH9DnCEYclTH0nuGijnzOf1AZ5r1M=; b=WBL0/t3AqZJ/6Ca8x3w+KYndCy
 Efl47ip7h9ObfR9z75hdTtl8sY78P3AeI5Jgb63WTzMccwSRldqscsVwE2Am7WwnftLaKLqf5ZtVB
 TzYFBpmqIjJoBHmjTe1GxKjAObUlVa+skQkLhG4/aV+8nhQpQLzL4pxfFqsVSfFXpWHQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kHNWi-006qC9-CZ
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 13 Sep 2020 08:38:27 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D722E221EB;
 Sun, 13 Sep 2020 08:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599986281;
 bh=uXAKQEyo1ZibZ5pKuVwr5khIlDHKT/16U27Bj6ZSiSg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H4FhAQ9OassN3Ahd6a1Jk1M8V7lIvacumPHEdPr+RhjizjRaA4LYqyyhFaUoeync7
 OHCltlxvvbn902LgbjZBcnEK/9m2gM/7pNZ0kWJ/BLB7SohmPX7uqVzIrluoUQx9Su
 SVArXciITuHXr6I1fKyXl9uaDvkngq/+hey9augM=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Sun, 13 Sep 2020 01:36:20 -0700
Message-Id: <20200913083620.170627-12-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200913083620.170627-1-ebiggers@kernel.org>
References: <20200913083620.170627-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -1.8 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.7 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kHNWi-006qC9-CZ
Subject: [f2fs-dev] [PATCH v2 11/11] fscrypt: handle test_dummy_encryption
 in more logical way
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
Cc: Daniel Rosenberg <drosen@google.com>, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

The behavior of the test_dummy_encryption mount option is that when a
new file (or directory or symlink) is created in an unencrypted
directory, it's automatically encrypted using a dummy encryption policy.
That's it; in particular, the encryption (or lack thereof) of existing
files (or directories or symlinks) doesn't change.

Unfortunately the implementation of test_dummy_encryption is a bit weird
and confusing.  When test_dummy_encryption is enabled and a file is
being created in an unencrypted directory, we set up an encryption key
(->i_crypt_info) for the directory.  This isn't actually used to do any
encryption, however, since the directory is still unencrypted!  Instead,
->i_crypt_info is only used for inheriting the encryption policy.

One consequence of this is that the filesystem ends up providing a
"dummy context" (policy + nonce) instead of a "dummy policy".  In
commit ed318a6cc0b6 ("fscrypt: support test_dummy_encryption=v2"), I
mistakenly thought this was required.  However, actually the nonce only
ends up being used to derive a key that is never used.

Another consequence of this implementation is that it allows for
'inode->i_crypt_info != NULL && !IS_ENCRYPTED(inode)', which is an edge
case that can be forgotten about.  For example, currently
FS_IOC_GET_ENCRYPTION_POLICY on an unencrypted directory may return the
dummy encryption policy when the filesystem is mounted with
test_dummy_encryption.  That seems like the wrong thing to do, since
again, the directory itself is not actually encrypted.

Therefore, switch to a more logical and maintainable implementation
where the dummy encryption policy inheritance is done without setting up
keys for unencrypted directories.  This involves:

- Adding a function fscrypt_policy_to_inherit() which returns the
  encryption policy to inherit from a directory.  This can be a real
  policy, a dummy policy, or no policy.

- Replacing struct fscrypt_dummy_context, ->get_dummy_context(), etc.
  with struct fscrypt_dummy_policy, ->get_dummy_policy(), etc.

- Making fscrypt_fname_encrypted_size() take an fscrypt_policy instead
  of an inode.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fname.c           |  11 ++--
 fs/crypto/fscrypt_private.h |   6 +-
 fs/crypto/hooks.c           |  30 ++++------
 fs/crypto/keysetup.c        |  33 +++--------
 fs/crypto/policy.c          | 113 ++++++++++++++++++++++--------------
 fs/ext4/ext4.h              |   6 +-
 fs/ext4/super.c             |  17 +++---
 fs/f2fs/f2fs.h              |   2 +-
 fs/f2fs/super.c             |  16 ++---
 include/linux/fscrypt.h     |  40 +++++--------
 10 files changed, 134 insertions(+), 140 deletions(-)

diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index 47bcfddb278ba..eb13408b50a70 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -242,11 +242,11 @@ static int base64_decode(const char *src, int len, u8 *dst)
 	return cp - dst;
 }
 
-bool fscrypt_fname_encrypted_size(const struct inode *inode, u32 orig_len,
-				  u32 max_len, u32 *encrypted_len_ret)
+bool fscrypt_fname_encrypted_size(const union fscrypt_policy *policy,
+				  u32 orig_len, u32 max_len,
+				  u32 *encrypted_len_ret)
 {
-	const struct fscrypt_info *ci = inode->i_crypt_info;
-	int padding = 4 << (fscrypt_policy_flags(&ci->ci_policy) &
+	int padding = 4 << (fscrypt_policy_flags(policy) &
 			    FSCRYPT_POLICY_FLAGS_PAD_MASK);
 	u32 encrypted_len;
 
@@ -418,7 +418,8 @@ int fscrypt_setup_filename(struct inode *dir, const struct qstr *iname,
 		return ret;
 
 	if (fscrypt_has_encryption_key(dir)) {
-		if (!fscrypt_fname_encrypted_size(dir, iname->len,
+		if (!fscrypt_fname_encrypted_size(&dir->i_crypt_info->ci_policy,
+						  iname->len,
 						  dir->i_sb->s_cop->max_namelen,
 						  &fname->crypto_buf.len))
 			return -ENAMETOOLONG;
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index ac3352086ee44..4f5806a3b73d7 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -291,8 +291,9 @@ void fscrypt_generate_iv(union fscrypt_iv *iv, u64 lblk_num,
 /* fname.c */
 int fscrypt_fname_encrypt(const struct inode *inode, const struct qstr *iname,
 			  u8 *out, unsigned int olen);
-bool fscrypt_fname_encrypted_size(const struct inode *inode, u32 orig_len,
-				  u32 max_len, u32 *encrypted_len_ret);
+bool fscrypt_fname_encrypted_size(const union fscrypt_policy *policy,
+				  u32 orig_len, u32 max_len,
+				  u32 *encrypted_len_ret);
 extern const struct dentry_operations fscrypt_d_ops;
 
 /* hkdf.c */
@@ -592,5 +593,6 @@ bool fscrypt_supported_policy(const union fscrypt_policy *policy_u,
 int fscrypt_policy_from_context(union fscrypt_policy *policy_u,
 				const union fscrypt_context *ctx_u,
 				int ctx_size);
+const union fscrypt_policy *fscrypt_policy_to_inherit(struct inode *dir);
 
 #endif /* _FSCRYPT_PRIVATE_H */
diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index a399c54947f28..42f5ee9f592d1 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -193,30 +193,24 @@ int fscrypt_prepare_symlink(struct inode *dir, const char *target,
 			    unsigned int len, unsigned int max_len,
 			    struct fscrypt_str *disk_link)
 {
-	int err;
+	const union fscrypt_policy *policy;
 
-	if (!IS_ENCRYPTED(dir) && !fscrypt_get_dummy_context(dir->i_sb)) {
+	/*
+	 * To calculate the size of the encrypted symlink target we need to know
+	 * the amount of NUL padding, which is determined by the flags set in
+	 * the encryption policy which will be inherited from the directory.
+	 */
+	policy = fscrypt_policy_to_inherit(dir);
+	if (policy == NULL) {
+		/* Not encrypted */
 		disk_link->name = (unsigned char *)target;
 		disk_link->len = len + 1;
 		if (disk_link->len > max_len)
 			return -ENAMETOOLONG;
 		return 0;
 	}
-
-	/*
-	 * To calculate the size of the encrypted symlink target we need to know
-	 * the amount of NUL padding, which is determined by the flags set in
-	 * the encryption policy which will be inherited from the directory.
-	 * The easiest way to get access to this is to just load the directory's
-	 * fscrypt_info, since we'll need it to create the dir_entry anyway.
-	 *
-	 * Note: in test_dummy_encryption mode, @dir may be unencrypted.
-	 */
-	err = fscrypt_get_encryption_info(dir);
-	if (err)
-		return err;
-	if (!fscrypt_has_encryption_key(dir))
-		return -ENOKEY;
+	if (IS_ERR(policy))
+		return PTR_ERR(policy);
 
 	/*
 	 * Calculate the size of the encrypted symlink and verify it won't
@@ -229,7 +223,7 @@ int fscrypt_prepare_symlink(struct inode *dir, const char *target,
 	 * counting it (even though it is meaningless for ciphertext) is simpler
 	 * for now since filesystems will assume it is there and subtract it.
 	 */
-	if (!fscrypt_fname_encrypted_size(dir, len,
+	if (!fscrypt_fname_encrypted_size(policy, len,
 					  max_len - sizeof(struct fscrypt_symlink_data),
 					  &disk_link->len))
 		return -ENAMETOOLONG;
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index 7f5fbc2654d57..f38fb71501ae9 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -545,7 +545,7 @@ fscrypt_setup_encryption_info(struct inode *inode,
 
 /**
  * fscrypt_get_encryption_info() - set up an inode's encryption key
- * @inode: the inode to set up the key for
+ * @inode: the inode to set up the key for.  Must be encrypted.
  *
  * Set up ->i_crypt_info, if it hasn't already been done.
  *
@@ -567,18 +567,8 @@ int fscrypt_get_encryption_info(struct inode *inode)
 
 	res = inode->i_sb->s_cop->get_context(inode, &ctx, sizeof(ctx));
 	if (res < 0) {
-		const union fscrypt_context *dummy_ctx =
-			fscrypt_get_dummy_context(inode->i_sb);
-
-		if (IS_ENCRYPTED(inode) || !dummy_ctx) {
-			fscrypt_warn(inode,
-				     "Error %d getting encryption context",
-				     res);
-			return res;
-		}
-		/* Fake up a context for an unencrypted directory */
-		res = fscrypt_context_size(dummy_ctx);
-		memcpy(&ctx, dummy_ctx, res);
+		fscrypt_warn(inode, "Error %d getting encryption context", res);
+		return res;
 	}
 
 	res = fscrypt_policy_from_context(&policy, &ctx, res);
@@ -620,17 +610,14 @@ EXPORT_SYMBOL(fscrypt_get_encryption_info);
 int fscrypt_prepare_new_inode(struct inode *dir, struct inode *inode,
 			      bool *encrypt_ret)
 {
-	int err;
+	const union fscrypt_policy *policy;
 	u8 nonce[FSCRYPT_FILE_NONCE_SIZE];
 
-	if (!IS_ENCRYPTED(dir) && fscrypt_get_dummy_context(dir->i_sb) == NULL)
+	policy = fscrypt_policy_to_inherit(dir);
+	if (policy == NULL)
 		return 0;
-
-	err = fscrypt_get_encryption_info(dir);
-	if (err)
-		return err;
-	if (!fscrypt_has_encryption_key(dir))
-		return -ENOKEY;
+	if (IS_ERR(policy))
+		return PTR_ERR(policy);
 
 	if (WARN_ON_ONCE(inode->i_mode == 0))
 		return -EINVAL;
@@ -647,9 +634,7 @@ int fscrypt_prepare_new_inode(struct inode *dir, struct inode *inode,
 	*encrypt_ret = true;
 
 	get_random_bytes(nonce, FSCRYPT_FILE_NONCE_SIZE);
-	return fscrypt_setup_encryption_info(inode,
-					     &dir->i_crypt_info->ci_policy,
-					     nonce);
+	return fscrypt_setup_encryption_info(inode, policy, nonce);
 }
 EXPORT_SYMBOL_GPL(fscrypt_prepare_new_inode);
 
diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index 4ff893f7b030a..97cf07543651f 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -32,6 +32,14 @@ bool fscrypt_policies_equal(const union fscrypt_policy *policy1,
 	return !memcmp(policy1, policy2, fscrypt_policy_size(policy1));
 }
 
+static const union fscrypt_policy *
+fscrypt_get_dummy_policy(struct super_block *sb)
+{
+	if (!sb->s_cop->get_dummy_policy)
+		return NULL;
+	return sb->s_cop->get_dummy_policy(sb);
+}
+
 static bool fscrypt_valid_enc_modes(u32 contents_mode, u32 filenames_mode)
 {
 	if (contents_mode == FSCRYPT_MODE_AES_256_XTS &&
@@ -628,6 +636,25 @@ int fscrypt_has_permitted_context(struct inode *parent, struct inode *child)
 }
 EXPORT_SYMBOL(fscrypt_has_permitted_context);
 
+/*
+ * Return the encryption policy that new files in the directory will inherit, or
+ * NULL if none, or an ERR_PTR() on error.  If the directory is encrypted, also
+ * ensure that its key is set up, so that the new filename can be encrypted.
+ */
+const union fscrypt_policy *fscrypt_policy_to_inherit(struct inode *dir)
+{
+	int err;
+
+	if (IS_ENCRYPTED(dir)) {
+		err = fscrypt_require_key(dir);
+		if (err)
+			return ERR_PTR(err);
+		return &dir->i_crypt_info->ci_policy;
+	}
+
+	return fscrypt_get_dummy_policy(dir->i_sb);
+}
+
 /**
  * fscrypt_set_context() - Set the fscrypt context of a new inode
  * @inode: a new inode
@@ -672,31 +699,28 @@ EXPORT_SYMBOL_GPL(fscrypt_set_context);
  * @sb: the filesystem on which test_dummy_encryption is being specified
  * @arg: the argument to the test_dummy_encryption option.
  *	 If no argument was specified, then @arg->from == NULL.
- * @dummy_ctx: the filesystem's current dummy context (input/output, see below)
+ * @dummy_policy: the filesystem's current dummy policy (input/output, see
+ *		  below)
  *
  * Handle the test_dummy_encryption mount option by creating a dummy encryption
- * context, saving it in @dummy_ctx, and adding the corresponding dummy
- * encryption key to the filesystem.  If the @dummy_ctx is already set, then
+ * policy, saving it in @dummy_policy, and adding the corresponding dummy
+ * encryption key to the filesystem.  If the @dummy_policy is already set, then
  * instead validate that it matches @arg.  Don't support changing it via
  * remount, as that is difficult to do safely.
  *
- * The reason we use an fscrypt_context rather than an fscrypt_policy is because
- * we mustn't generate a new nonce each time we access a dummy-encrypted
- * directory, as that would change the way filenames are encrypted.
- *
- * Return: 0 on success (dummy context set, or the same context is already set);
- *         -EEXIST if a different dummy context is already set;
+ * Return: 0 on success (dummy policy set, or the same policy is already set);
+ *         -EEXIST if a different dummy policy is already set;
  *         or another -errno value.
  */
 int fscrypt_set_test_dummy_encryption(struct super_block *sb,
 				      const substring_t *arg,
-				      struct fscrypt_dummy_context *dummy_ctx)
+				      struct fscrypt_dummy_policy *dummy_policy)
 {
 	const char *argstr = "v2";
 	const char *argstr_to_free = NULL;
 	struct fscrypt_key_specifier key_spec = { 0 };
 	int version;
-	union fscrypt_context *ctx = NULL;
+	union fscrypt_policy *policy = NULL;
 	int err;
 
 	if (arg->from) {
@@ -706,12 +730,12 @@ int fscrypt_set_test_dummy_encryption(struct super_block *sb,
 	}
 
 	if (!strcmp(argstr, "v1")) {
-		version = FSCRYPT_CONTEXT_V1;
+		version = FSCRYPT_POLICY_V1;
 		key_spec.type = FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR;
 		memset(key_spec.u.descriptor, 0x42,
 		       FSCRYPT_KEY_DESCRIPTOR_SIZE);
 	} else if (!strcmp(argstr, "v2")) {
-		version = FSCRYPT_CONTEXT_V2;
+		version = FSCRYPT_POLICY_V2;
 		key_spec.type = FSCRYPT_KEY_SPEC_TYPE_IDENTIFIER;
 		/* key_spec.u.identifier gets filled in when adding the key */
 	} else {
@@ -719,21 +743,8 @@ int fscrypt_set_test_dummy_encryption(struct super_block *sb,
 		goto out;
 	}
 
-	if (dummy_ctx->ctx) {
-		/*
-		 * Note: if we ever make test_dummy_encryption support
-		 * specifying other encryption settings, such as the encryption
-		 * modes, we'll need to compare those settings here.
-		 */
-		if (dummy_ctx->ctx->version == version)
-			err = 0;
-		else
-			err = -EEXIST;
-		goto out;
-	}
-
-	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
-	if (!ctx) {
+	policy = kzalloc(sizeof(*policy), GFP_KERNEL);
+	if (!policy) {
 		err = -ENOMEM;
 		goto out;
 	}
@@ -742,18 +753,18 @@ int fscrypt_set_test_dummy_encryption(struct super_block *sb,
 	if (err)
 		goto out;
 
-	ctx->version = version;
-	switch (ctx->version) {
-	case FSCRYPT_CONTEXT_V1:
-		ctx->v1.contents_encryption_mode = FSCRYPT_MODE_AES_256_XTS;
-		ctx->v1.filenames_encryption_mode = FSCRYPT_MODE_AES_256_CTS;
-		memcpy(ctx->v1.master_key_descriptor, key_spec.u.descriptor,
+	policy->version = version;
+	switch (policy->version) {
+	case FSCRYPT_POLICY_V1:
+		policy->v1.contents_encryption_mode = FSCRYPT_MODE_AES_256_XTS;
+		policy->v1.filenames_encryption_mode = FSCRYPT_MODE_AES_256_CTS;
+		memcpy(policy->v1.master_key_descriptor, key_spec.u.descriptor,
 		       FSCRYPT_KEY_DESCRIPTOR_SIZE);
 		break;
-	case FSCRYPT_CONTEXT_V2:
-		ctx->v2.contents_encryption_mode = FSCRYPT_MODE_AES_256_XTS;
-		ctx->v2.filenames_encryption_mode = FSCRYPT_MODE_AES_256_CTS;
-		memcpy(ctx->v2.master_key_identifier, key_spec.u.identifier,
+	case FSCRYPT_POLICY_V2:
+		policy->v2.contents_encryption_mode = FSCRYPT_MODE_AES_256_XTS;
+		policy->v2.filenames_encryption_mode = FSCRYPT_MODE_AES_256_CTS;
+		memcpy(policy->v2.master_key_identifier, key_spec.u.identifier,
 		       FSCRYPT_KEY_IDENTIFIER_SIZE);
 		break;
 	default:
@@ -761,11 +772,19 @@ int fscrypt_set_test_dummy_encryption(struct super_block *sb,
 		err = -EINVAL;
 		goto out;
 	}
-	dummy_ctx->ctx = ctx;
-	ctx = NULL;
+
+	if (dummy_policy->policy) {
+		if (fscrypt_policies_equal(policy, dummy_policy->policy))
+			err = 0;
+		else
+			err = -EEXIST;
+		goto out;
+	}
+	dummy_policy->policy = policy;
+	policy = NULL;
 	err = 0;
 out:
-	kfree(ctx);
+	kfree(policy);
 	kfree(argstr_to_free);
 	return err;
 }
@@ -783,10 +802,16 @@ EXPORT_SYMBOL_GPL(fscrypt_set_test_dummy_encryption);
 void fscrypt_show_test_dummy_encryption(struct seq_file *seq, char sep,
 					struct super_block *sb)
 {
-	const union fscrypt_context *ctx = fscrypt_get_dummy_context(sb);
+	const union fscrypt_policy *policy = fscrypt_get_dummy_policy(sb);
+	int vers;
 
-	if (!ctx)
+	if (!policy)
 		return;
-	seq_printf(seq, "%ctest_dummy_encryption=v%d", sep, ctx->version);
+
+	vers = policy->version;
+	if (vers == FSCRYPT_POLICY_V1) /* Handle numbering quirk */
+		vers = 1;
+
+	seq_printf(seq, "%ctest_dummy_encryption=v%d", sep, vers);
 }
 EXPORT_SYMBOL_GPL(fscrypt_show_test_dummy_encryption);
diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 523e00d7b3924..f9a692c0a66c3 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -1401,7 +1401,7 @@ struct ext4_super_block {
 #define EXT4_MF_FS_ABORTED		0x0002	/* Fatal error detected */
 
 #ifdef CONFIG_FS_ENCRYPTION
-#define DUMMY_ENCRYPTION_ENABLED(sbi) ((sbi)->s_dummy_enc_ctx.ctx != NULL)
+#define DUMMY_ENCRYPTION_ENABLED(sbi) ((sbi)->s_dummy_enc_policy.policy != NULL)
 #else
 #define DUMMY_ENCRYPTION_ENABLED(sbi) (0)
 #endif
@@ -1596,8 +1596,8 @@ struct ext4_sb_info {
 	atomic_t s_warning_count;
 	atomic_t s_msg_count;
 
-	/* Encryption context for '-o test_dummy_encryption' */
-	struct fscrypt_dummy_context s_dummy_enc_ctx;
+	/* Encryption policy for '-o test_dummy_encryption' */
+	struct fscrypt_dummy_policy s_dummy_enc_policy;
 
 	/*
 	 * Barrier between writepages ops and changing any inode's JOURNAL_DATA
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index ea425b49b3456..7e77722406e2f 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1104,7 +1104,7 @@ static void ext4_put_super(struct super_block *sb)
 		crypto_free_shash(sbi->s_chksum_driver);
 	kfree(sbi->s_blockgroup_lock);
 	fs_put_dax(sbi->s_daxdev);
-	fscrypt_free_dummy_context(&sbi->s_dummy_enc_ctx);
+	fscrypt_free_dummy_policy(&sbi->s_dummy_enc_policy);
 #ifdef CONFIG_UNICODE
 	utf8_unload(sbi->s_encoding);
 #endif
@@ -1392,10 +1392,10 @@ static int ext4_set_context(struct inode *inode, const void *ctx, size_t len,
 	return res;
 }
 
-static const union fscrypt_context *
-ext4_get_dummy_context(struct super_block *sb)
+static const union fscrypt_policy *
+ext4_get_dummy_policy(struct super_block *sb)
 {
-	return EXT4_SB(sb)->s_dummy_enc_ctx.ctx;
+	return EXT4_SB(sb)->s_dummy_enc_policy.policy;
 }
 
 static bool ext4_has_stable_inodes(struct super_block *sb)
@@ -1414,7 +1414,7 @@ static const struct fscrypt_operations ext4_cryptops = {
 	.key_prefix		= "ext4:",
 	.get_context		= ext4_get_context,
 	.set_context		= ext4_set_context,
-	.get_dummy_context	= ext4_get_dummy_context,
+	.get_dummy_policy	= ext4_get_dummy_policy,
 	.empty_dir		= ext4_empty_dir,
 	.max_namelen		= EXT4_NAME_LEN,
 	.has_stable_inodes	= ext4_has_stable_inodes,
@@ -1888,12 +1888,13 @@ static int ext4_set_test_dummy_encryption(struct super_block *sb,
 	 * needed to allow it to be set or changed during remount.  We do allow
 	 * it to be specified during remount, but only if there is no change.
 	 */
-	if (is_remount && !sbi->s_dummy_enc_ctx.ctx) {
+	if (is_remount && !sbi->s_dummy_enc_policy.policy) {
 		ext4_msg(sb, KERN_WARNING,
 			 "Can't set test_dummy_encryption on remount");
 		return -1;
 	}
-	err = fscrypt_set_test_dummy_encryption(sb, arg, &sbi->s_dummy_enc_ctx);
+	err = fscrypt_set_test_dummy_encryption(sb, arg,
+						&sbi->s_dummy_enc_policy);
 	if (err) {
 		if (err == -EEXIST)
 			ext4_msg(sb, KERN_WARNING,
@@ -4935,7 +4936,7 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
 	for (i = 0; i < EXT4_MAXQUOTAS; i++)
 		kfree(get_qf_name(sb, sbi, i));
 #endif
-	fscrypt_free_dummy_context(&sbi->s_dummy_enc_ctx);
+	fscrypt_free_dummy_policy(&sbi->s_dummy_enc_policy);
 	ext4_blkdev_remove(sbi);
 	brelse(bh);
 out_fail:
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 0503371f88ed4..7c089ff7ff943 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -138,7 +138,7 @@ struct f2fs_mount_info {
 	int fsync_mode;			/* fsync policy */
 	int fs_mode;			/* fs mode: LFS or ADAPTIVE */
 	int bggc_mode;			/* bggc mode: off, on or sync */
-	struct fscrypt_dummy_context dummy_enc_ctx; /* test dummy encryption */
+	struct fscrypt_dummy_policy dummy_enc_policy; /* test dummy encryption */
 	block_t unusable_cap_perc;	/* percentage for cap */
 	block_t unusable_cap;		/* Amount of space allowed to be
 					 * unusable when disabling checkpoint
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index dfa072fa80815..f2b3d1a279fb7 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -433,12 +433,12 @@ static int f2fs_set_test_dummy_encryption(struct super_block *sb,
 	 * needed to allow it to be set or changed during remount.  We do allow
 	 * it to be specified during remount, but only if there is no change.
 	 */
-	if (is_remount && !F2FS_OPTION(sbi).dummy_enc_ctx.ctx) {
+	if (is_remount && !F2FS_OPTION(sbi).dummy_enc_policy.policy) {
 		f2fs_warn(sbi, "Can't set test_dummy_encryption on remount");
 		return -EINVAL;
 	}
 	err = fscrypt_set_test_dummy_encryption(
-		sb, arg, &F2FS_OPTION(sbi).dummy_enc_ctx);
+		sb, arg, &F2FS_OPTION(sbi).dummy_enc_policy);
 	if (err) {
 		if (err == -EEXIST)
 			f2fs_warn(sbi,
@@ -1275,7 +1275,7 @@ static void f2fs_put_super(struct super_block *sb)
 	for (i = 0; i < MAXQUOTAS; i++)
 		kfree(F2FS_OPTION(sbi).s_qf_names[i]);
 #endif
-	fscrypt_free_dummy_context(&F2FS_OPTION(sbi).dummy_enc_ctx);
+	fscrypt_free_dummy_policy(&F2FS_OPTION(sbi).dummy_enc_policy);
 	destroy_percpu_info(sbi);
 	for (i = 0; i < NR_PAGE_TYPE; i++)
 		kvfree(sbi->write_io[i]);
@@ -2482,10 +2482,10 @@ static int f2fs_set_context(struct inode *inode, const void *ctx, size_t len,
 				ctx, len, fs_data, XATTR_CREATE);
 }
 
-static const union fscrypt_context *
-f2fs_get_dummy_context(struct super_block *sb)
+static const union fscrypt_policy *
+f2fs_get_dummy_policy(struct super_block *sb)
 {
-	return F2FS_OPTION(F2FS_SB(sb)).dummy_enc_ctx.ctx;
+	return F2FS_OPTION(F2FS_SB(sb)).dummy_enc_policy.policy;
 }
 
 static bool f2fs_has_stable_inodes(struct super_block *sb)
@@ -2523,7 +2523,7 @@ static const struct fscrypt_operations f2fs_cryptops = {
 	.key_prefix		= "f2fs:",
 	.get_context		= f2fs_get_context,
 	.set_context		= f2fs_set_context,
-	.get_dummy_context	= f2fs_get_dummy_context,
+	.get_dummy_policy	= f2fs_get_dummy_policy,
 	.empty_dir		= f2fs_empty_dir,
 	.max_namelen		= F2FS_NAME_LEN,
 	.has_stable_inodes	= f2fs_has_stable_inodes,
@@ -3864,7 +3864,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	for (i = 0; i < MAXQUOTAS; i++)
 		kfree(F2FS_OPTION(sbi).s_qf_names[i]);
 #endif
-	fscrypt_free_dummy_context(&F2FS_OPTION(sbi).dummy_enc_ctx);
+	fscrypt_free_dummy_policy(&F2FS_OPTION(sbi).dummy_enc_policy);
 	kvfree(options);
 free_sb_buf:
 	kfree(raw_super);
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 39e7397a3f103..b3b0c5675c6b1 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -21,7 +21,7 @@
 
 #define FS_CRYPTO_BLOCK_SIZE		16
 
-union fscrypt_context;
+union fscrypt_policy;
 struct fscrypt_info;
 struct seq_file;
 
@@ -62,8 +62,7 @@ struct fscrypt_operations {
 	int (*get_context)(struct inode *inode, void *ctx, size_t len);
 	int (*set_context)(struct inode *inode, const void *ctx, size_t len,
 			   void *fs_data);
-	const union fscrypt_context *(*get_dummy_context)(
-		struct super_block *sb);
+	const union fscrypt_policy *(*get_dummy_policy)(struct super_block *sb);
 	bool (*empty_dir)(struct inode *inode);
 	unsigned int max_namelen;
 	bool (*has_stable_inodes)(struct super_block *sb);
@@ -101,14 +100,6 @@ static inline bool fscrypt_needs_contents_encryption(const struct inode *inode)
 	return IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode);
 }
 
-static inline const union fscrypt_context *
-fscrypt_get_dummy_context(struct super_block *sb)
-{
-	if (!sb->s_cop->get_dummy_context)
-		return NULL;
-	return sb->s_cop->get_dummy_context(sb);
-}
-
 /*
  * When d_splice_alias() moves a directory's encrypted alias to its decrypted
  * alias as a result of the encryption key being added, DCACHE_ENCRYPTED_NAME
@@ -158,20 +149,21 @@ int fscrypt_ioctl_get_nonce(struct file *filp, void __user *arg);
 int fscrypt_has_permitted_context(struct inode *parent, struct inode *child);
 int fscrypt_set_context(struct inode *inode, void *fs_data);
 
-struct fscrypt_dummy_context {
-	const union fscrypt_context *ctx;
+struct fscrypt_dummy_policy {
+	const union fscrypt_policy *policy;
 };
 
-int fscrypt_set_test_dummy_encryption(struct super_block *sb,
-				      const substring_t *arg,
-				      struct fscrypt_dummy_context *dummy_ctx);
+int fscrypt_set_test_dummy_encryption(
+				struct super_block *sb,
+				const substring_t *arg,
+				struct fscrypt_dummy_policy *dummy_policy);
 void fscrypt_show_test_dummy_encryption(struct seq_file *seq, char sep,
 					struct super_block *sb);
 static inline void
-fscrypt_free_dummy_context(struct fscrypt_dummy_context *dummy_ctx)
+fscrypt_free_dummy_policy(struct fscrypt_dummy_policy *dummy_policy)
 {
-	kfree(dummy_ctx->ctx);
-	dummy_ctx->ctx = NULL;
+	kfree(dummy_policy->policy);
+	dummy_policy->policy = NULL;
 }
 
 /* keyring.c */
@@ -250,12 +242,6 @@ static inline bool fscrypt_needs_contents_encryption(const struct inode *inode)
 	return false;
 }
 
-static inline const union fscrypt_context *
-fscrypt_get_dummy_context(struct super_block *sb)
-{
-	return NULL;
-}
-
 static inline void fscrypt_handle_d_move(struct dentry *dentry)
 {
 }
@@ -346,7 +332,7 @@ static inline int fscrypt_set_context(struct inode *inode, void *fs_data)
 	return -EOPNOTSUPP;
 }
 
-struct fscrypt_dummy_context {
+struct fscrypt_dummy_policy {
 };
 
 static inline void fscrypt_show_test_dummy_encryption(struct seq_file *seq,
@@ -356,7 +342,7 @@ static inline void fscrypt_show_test_dummy_encryption(struct seq_file *seq,
 }
 
 static inline void
-fscrypt_free_dummy_context(struct fscrypt_dummy_context *dummy_ctx)
+fscrypt_free_dummy_policy(struct fscrypt_dummy_policy *dummy_policy)
 {
 }
 
-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
