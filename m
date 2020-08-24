Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E2A24F25E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Aug 2020 08:18:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kA5oP-0004d0-Vv; Mon, 24 Aug 2020 06:18:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kA5oN-0004cQ-8W
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Aug 2020 06:18:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6FS2DhL5cOpJRRD98zGyHY6116ia0U5FyATGV0xG3oE=; b=eN0nLljNLL0WCeKn53myz1jI5N
 ri5Xwd9hyjKJawE2fzjC7Zry8c5O8Q7loY+LSQogxbmDHunfWbhCuXKF7Nv2SXVBAoergIsvvdWJ/
 IWLuzFT0+H2lOaTd5nxBR2kMuZA4OahNWPbXLpPx89XOm0kAMu6ouYxPzesDE4N2WUdw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6FS2DhL5cOpJRRD98zGyHY6116ia0U5FyATGV0xG3oE=; b=SNJK/n/W+hS+ijNn9+Y3CNHvpS
 quzR4UDPKK+zyI/5Q35kZLcEOC7LkZ1443EzedaAo3OrLvNGZYvowLHbH2hVtXC2fPgQTFAGsAigk
 aOs2SE3kqP9PgXpwhcKQSFgD+mU8vKZ8o3XUpS2ykw9nyMS73j5keNYnC3H7XmbwVVKk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kA5oK-002EvP-LT
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Aug 2020 06:18:31 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 327A52075B;
 Mon, 24 Aug 2020 06:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598249898;
 bh=SFmfsUnLK+4W74C/ycs9mwCfp/2Xoq657U+GMuM5Dpw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wPvgO2A2311NePQ56q9wpmSWrGRcXt2EGfWtyfOqu8VUU4IS+xUxwLqL4SHuJPFYf
 RrRldgUXkAGd+aJ2zLujmKqIojAMQXJRbomHlUxkQOZMmDDMmLT/KigfPqi5WxvDkr
 H6rg0PmCmDxQhYA0BT2JM2ZgWQJjHkoC2zebtlo0=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Sun, 23 Aug 2020 23:17:05 -0700
Message-Id: <20200824061712.195654-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200824061712.195654-1-ebiggers@kernel.org>
References: <20200824061712.195654-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kA5oK-002EvP-LT
Subject: [f2fs-dev] [RFC PATCH 1/8] fscrypt: add fscrypt_prepare_new_inode()
 and fscrypt_set_context()
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
Cc: Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

fscrypt_get_encryption_info() (setting up an inode's encryption key) is
intended to be GFP_NOFS safe.  But actually it isn't, since it uses
functions like crypto_alloc_skcipher() which aren't GFP_NOFS safe, even
when called with memalloc_nofs_save().  Therefore it can deadlock when
called from a context that needs GFP_NOFS, e.g. during an ext4
filesystem transaction or between f2fs_lock_op() and f2fs_unlock_op().
Currently, this happens when creating a new encrypted file.

We can't fix this just by not setting up the key for new inodes right
away, since new symlinks need their key to encrypt the symlink target.

So we need to set up the new inode's key before starting the
transaction.  But fscrypt_get_encryption_info() can't do this currently,
since it assumes the encryption xattr is already set, and the encryption
xattr can't be set until the transaction.

The recently proposed fscrypt support for the ceph filesystem
(https://lkml.kernel.org/linux-fscrypt/20200821182813.52570-1-jlayton@kernel.org/T/#u)
will have this same ordering problem too, since when ceph creates a new
symlink, it will need to encrypt it before setting its encryption xattr.

To solve this problem, add new helper functions:

- fscrypt_prepare_new_inode() sets up a new inode's encryption key
  (fscrypt_info), using the parent directory's encryption policy and a
  new random nonce.  It neither reads nor writes the xattr.

- fscrypt_set_context() sets the encryption xattr from the fscrypt_info
  already in memory.  This replaces fscrypt_inherit_context().

Keep fscrypt_inherit_context() around temporarily until all filesystems
are converted to use fscrypt_set_context().

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fscrypt_private.h |   3 +
 fs/crypto/keysetup.c        | 188 ++++++++++++++++++++++++++++--------
 fs/crypto/policy.c          |  61 ++++++++++--
 include/linux/fscrypt.h     |  17 ++++
 4 files changed, 220 insertions(+), 49 deletions(-)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 8117a61b6f558..355f6d9377517 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -572,6 +572,9 @@ int fscrypt_set_per_file_enc_key(struct fscrypt_info *ci, const u8 *raw_key);
 int fscrypt_derive_dirhash_key(struct fscrypt_info *ci,
 			       const struct fscrypt_master_key *mk);
 
+void fscrypt_hash_inode_number(struct fscrypt_info *ci,
+			       const struct fscrypt_master_key *mk);
+
 /* keysetup_v1.c */
 
 void fscrypt_put_direct_key(struct fscrypt_direct_key *dk);
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index fea6226afc2b0..6ac816d3e8478 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -10,6 +10,7 @@
 
 #include <crypto/skcipher.h>
 #include <linux/key.h>
+#include <linux/random.h>
 
 #include "fscrypt_private.h"
 
@@ -222,6 +223,16 @@ int fscrypt_derive_dirhash_key(struct fscrypt_info *ci,
 	return 0;
 }
 
+void fscrypt_hash_inode_number(struct fscrypt_info *ci,
+			       const struct fscrypt_master_key *mk)
+{
+	WARN_ON(ci->ci_inode->i_ino == 0);
+	WARN_ON(!mk->mk_ino_hash_key_initialized);
+
+	ci->ci_hashed_ino = (u32)siphash_1u64(ci->ci_inode->i_ino,
+					      &mk->mk_ino_hash_key);
+}
+
 static int fscrypt_setup_iv_ino_lblk_32_key(struct fscrypt_info *ci,
 					    struct fscrypt_master_key *mk)
 {
@@ -254,8 +265,10 @@ static int fscrypt_setup_iv_ino_lblk_32_key(struct fscrypt_info *ci,
 			return err;
 	}
 
-	ci->ci_hashed_ino = (u32)siphash_1u64(ci->ci_inode->i_ino,
-					      &mk->mk_ino_hash_key);
+	if (ci->ci_inode->i_ino == 0)
+		WARN_ON(!(ci->ci_inode->i_state & I_NEW));
+	else
+		fscrypt_hash_inode_number(ci, mk);
 	return 0;
 }
 
@@ -454,57 +467,23 @@ static void put_crypt_info(struct fscrypt_info *ci)
 	kmem_cache_free(fscrypt_info_cachep, ci);
 }
 
-int fscrypt_get_encryption_info(struct inode *inode)
+static int
+fscrypt_setup_encryption_info(struct inode *inode,
+			      const union fscrypt_policy *policy,
+			      const u8 nonce[FSCRYPT_FILE_NONCE_SIZE])
 {
 	struct fscrypt_info *crypt_info;
-	union fscrypt_context ctx;
 	struct fscrypt_mode *mode;
 	struct key *master_key = NULL;
 	int res;
 
-	if (fscrypt_has_encryption_key(inode))
-		return 0;
-
-	res = fscrypt_initialize(inode->i_sb->s_cop->flags);
-	if (res)
-		return res;
-
-	res = inode->i_sb->s_cop->get_context(inode, &ctx, sizeof(ctx));
-	if (res < 0) {
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
-	}
-
 	crypt_info = kmem_cache_zalloc(fscrypt_info_cachep, GFP_NOFS);
 	if (!crypt_info)
 		return -ENOMEM;
 
 	crypt_info->ci_inode = inode;
-
-	res = fscrypt_policy_from_context(&crypt_info->ci_policy, &ctx, res);
-	if (res) {
-		fscrypt_warn(inode,
-			     "Unrecognized or corrupt encryption context");
-		goto out;
-	}
-
-	memcpy(crypt_info->ci_nonce, fscrypt_context_nonce(&ctx),
-	       FSCRYPT_FILE_NONCE_SIZE);
-
-	if (!fscrypt_supported_policy(&crypt_info->ci_policy, inode)) {
-		res = -EINVAL;
-		goto out;
-	}
+	crypt_info->ci_policy = *policy;
+	memcpy(crypt_info->ci_nonce, nonce, FSCRYPT_FILE_NONCE_SIZE);
 
 	mode = select_encryption_mode(&crypt_info->ci_policy, inode);
 	if (IS_ERR(mode)) {
@@ -555,8 +534,133 @@ int fscrypt_get_encryption_info(struct inode *inode)
 	put_crypt_info(crypt_info);
 	return res;
 }
+
+/**
+ * fscrypt_get_encryption_info() - set up an inode's encryption key
+ * @inode: the inode to set up the key for.  Must either be encrypted, or be an
+ *	   unencrypted directory with '-o test_dummy_encryption'.
+ *
+ * Create ->i_crypt_info, if it's not already set.
+ *
+ * Note: unless ->i_crypt_info is already set, this isn't %GFP_NOFS-safe.  So
+ * generally this shouldn't be called from within a filesystem transaction.
+ *
+ * Return: 0 if ->i_crypt_info was set or was already set, *or* if the
+ *	   encryption key is unavailable.  (Use fscrypt_has_encryption_key() to
+ *	   distinguish these cases.)  Also can return another -errno code.
+ */
+int fscrypt_get_encryption_info(struct inode *inode)
+{
+	int res;
+	union fscrypt_context ctx;
+	union fscrypt_policy policy;
+
+	if (fscrypt_has_encryption_key(inode))
+		return 0;
+
+	res = fscrypt_initialize(inode->i_sb->s_cop->flags);
+	if (res)
+		return res;
+
+	res = inode->i_sb->s_cop->get_context(inode, &ctx, sizeof(ctx));
+	if (res < 0) {
+		const union fscrypt_context *dummy_ctx =
+			fscrypt_get_dummy_context(inode->i_sb);
+
+		if (IS_ENCRYPTED(inode) || !dummy_ctx) {
+			fscrypt_warn(inode,
+				     "Error %d getting encryption context",
+				     res);
+			return res;
+		}
+		/* Fake up a context for an unencrypted directory */
+		res = fscrypt_context_size(dummy_ctx);
+		memcpy(&ctx, dummy_ctx, res);
+	}
+
+	res = fscrypt_policy_from_context(&policy, &ctx, res);
+	if (res) {
+		fscrypt_warn(inode,
+			     "Unrecognized or corrupt encryption context");
+		return res;
+	}
+
+	if (!fscrypt_supported_policy(&policy, inode))
+		return -EINVAL;
+
+	return fscrypt_setup_encryption_info(inode, &policy,
+					     fscrypt_context_nonce(&ctx));
+}
 EXPORT_SYMBOL(fscrypt_get_encryption_info);
 
+/**
+ * fscrypt_prepare_new_inode() - prepare to create a new inode in a directory
+ * @dir: a possibly-encrypted directory
+ * @inode: the inode that is being created.  ->i_mode must be set already.
+ *	   ->i_ino does *not* need to be set yet.
+ * @encrypt_ret: (output) set to true if the new inode will be encrypted.
+ *
+ * Prepares to create a new inode in a directory.  If either the inode or its
+ * filename will be encrypted, this sets up the directory's
+ * ->i_crypt_info.  Additionally, if the inode will be encrypted, this sets up
+ * its ->i_crypt_info and sets *encrypt_ret to true.
+ *
+ * Note that the new inode's ->i_crypt_info *usually* isn't actually needed
+ * right away.  However, symlinks do need it.
+ *
+ * This isn't %GFP_NOFS-safe, and therefore it should be called before starting
+ * any filesystem transaction to create the inode.  For this reason, ->i_ino
+ * isn't required to be set yet, as the filesystem may not have set it yet.
+ *
+ * This doesn't actually store the new inode's encryption context to disk.
+ * That still needs to be done later by calling fscrypt_set_context().
+ *
+ * Return: 0 on success, -ENOKEY if the directory's encryption key is missing,
+ *	   or another -errno code
+ */
+int fscrypt_prepare_new_inode(struct inode *dir, struct inode *inode,
+			      bool *encrypt_ret)
+{
+	int err;
+	u8 nonce[FSCRYPT_FILE_NONCE_SIZE];
+
+	/*
+	 * If the filesystem is mounted with '-o test_dummy_encryption', files
+	 * created in unencrypted directories are automatically encrypted.  For
+	 * that case, we just need to treat the directory as encrypted here.
+	 */
+
+	if (!IS_ENCRYPTED(dir) && fscrypt_get_dummy_context(dir->i_sb) == NULL)
+		return 0;
+
+	err = fscrypt_get_encryption_info(dir);
+	if (err)
+		return err;
+	if (!fscrypt_has_encryption_key(dir))
+		return -ENOKEY;
+
+	if (WARN_ON_ONCE(inode->i_mode == 0))
+		return -EINVAL;
+
+	/*
+	 * Only regular files, directories, and symlinks are encrypted.
+	 * Special files like device nodes and named pipes aren't.
+	 */
+	if (!S_ISREG(inode->i_mode) &&
+	    !S_ISDIR(inode->i_mode) &&
+	    !S_ISLNK(inode->i_mode))
+		return 0;
+
+	*encrypt_ret = true;
+
+	get_random_bytes(nonce, FSCRYPT_FILE_NONCE_SIZE);
+
+	return fscrypt_setup_encryption_info(inode,
+					     &dir->i_crypt_info->ci_policy,
+					     nonce);
+}
+EXPORT_SYMBOL_GPL(fscrypt_prepare_new_inode);
+
 /**
  * fscrypt_put_encryption_info() - free most of an inode's fscrypt data
  * @inode: an inode being evicted
diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index 2d73fd39ad96f..fbe4933206469 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -235,14 +235,17 @@ bool fscrypt_supported_policy(const union fscrypt_policy *policy_u,
  *				       an fscrypt_policy
  * @ctx_u: output context
  * @policy_u: input policy
+ * @nonce: nonce to use
  *
  * Create an fscrypt_context for an inode that is being assigned the given
- * encryption policy.  A new nonce is randomly generated.
+ * encryption policy.  @nonce must be a new random nonce.
  *
  * Return: the size of the new context in bytes.
  */
-static int fscrypt_new_context_from_policy(union fscrypt_context *ctx_u,
-					   const union fscrypt_policy *policy_u)
+static int
+fscrypt_new_context_from_policy(union fscrypt_context *ctx_u,
+				const union fscrypt_policy *policy_u,
+				const u8 nonce[FSCRYPT_FILE_NONCE_SIZE])
 {
 	memset(ctx_u, 0, sizeof(*ctx_u));
 
@@ -260,7 +263,7 @@ static int fscrypt_new_context_from_policy(union fscrypt_context *ctx_u,
 		memcpy(ctx->master_key_descriptor,
 		       policy->master_key_descriptor,
 		       sizeof(ctx->master_key_descriptor));
-		get_random_bytes(ctx->nonce, sizeof(ctx->nonce));
+		memcpy(ctx->nonce, nonce, FSCRYPT_FILE_NONCE_SIZE);
 		return sizeof(*ctx);
 	}
 	case FSCRYPT_POLICY_V2: {
@@ -276,7 +279,7 @@ static int fscrypt_new_context_from_policy(union fscrypt_context *ctx_u,
 		memcpy(ctx->master_key_identifier,
 		       policy->master_key_identifier,
 		       sizeof(ctx->master_key_identifier));
-		get_random_bytes(ctx->nonce, sizeof(ctx->nonce));
+		memcpy(ctx->nonce, nonce, FSCRYPT_FILE_NONCE_SIZE);
 		return sizeof(*ctx);
 	}
 	}
@@ -372,6 +375,7 @@ static int fscrypt_get_policy(struct inode *inode, union fscrypt_policy *policy)
 static int set_encryption_policy(struct inode *inode,
 				 const union fscrypt_policy *policy)
 {
+	u8 nonce[FSCRYPT_FILE_NONCE_SIZE];
 	union fscrypt_context ctx;
 	int ctxsize;
 	int err;
@@ -409,7 +413,8 @@ static int set_encryption_policy(struct inode *inode,
 		return -EINVAL;
 	}
 
-	ctxsize = fscrypt_new_context_from_policy(&ctx, policy);
+	get_random_bytes(nonce, FSCRYPT_FILE_NONCE_SIZE);
+	ctxsize = fscrypt_new_context_from_policy(&ctx, policy, nonce);
 
 	return inode->i_sb->s_cop->set_context(inode, &ctx, ctxsize, NULL);
 }
@@ -632,6 +637,7 @@ EXPORT_SYMBOL(fscrypt_has_permitted_context);
 int fscrypt_inherit_context(struct inode *parent, struct inode *child,
 						void *fs_data, bool preload)
 {
+	u8 nonce[FSCRYPT_FILE_NONCE_SIZE];
 	union fscrypt_context ctx;
 	int ctxsize;
 	struct fscrypt_info *ci;
@@ -645,7 +651,8 @@ int fscrypt_inherit_context(struct inode *parent, struct inode *child,
 	if (ci == NULL)
 		return -ENOKEY;
 
-	ctxsize = fscrypt_new_context_from_policy(&ctx, &ci->ci_policy);
+	get_random_bytes(nonce, FSCRYPT_FILE_NONCE_SIZE);
+	ctxsize = fscrypt_new_context_from_policy(&ctx, &ci->ci_policy, nonce);
 
 	BUILD_BUG_ON(sizeof(ctx) != FSCRYPT_SET_CONTEXT_MAX_SIZE);
 	res = parent->i_sb->s_cop->set_context(child, &ctx, ctxsize, fs_data);
@@ -655,6 +662,46 @@ int fscrypt_inherit_context(struct inode *parent, struct inode *child,
 }
 EXPORT_SYMBOL(fscrypt_inherit_context);
 
+/**
+ * fscrypt_set_context() - Set the fscrypt context of a new inode
+ * @inode: A new inode
+ * @fs_data: private data given by FS and passed to ->set_context()
+ *
+ * This should be called after fscrypt_prepare_new_inode(), generally during a
+ * filesystem transaction.  Everything here must be %GFP_NOFS-safe.
+ *
+ * Return: 0 on success, -errno on failure
+ */
+int fscrypt_set_context(struct inode *inode, void *fs_data)
+{
+	struct fscrypt_info *ci = inode->i_crypt_info;
+	union fscrypt_context ctx;
+	int ctxsize;
+
+	/* fscrypt_prepare_new_inode() should have set up the key already. */
+	if (WARN_ON_ONCE(!ci))
+		return -ENOKEY;
+
+	/*
+	 * This may be the first time the inode number is available, so do any
+	 * delayed key setup that requires the inode number.
+	 */
+	if (ci->ci_policy.version == FSCRYPT_POLICY_V2 &&
+	    (ci->ci_policy.v2.flags & FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32)) {
+		const struct fscrypt_master_key *mk =
+			ci->ci_master_key->payload.data[0];
+
+		fscrypt_hash_inode_number(ci, mk);
+	}
+
+	ctxsize = fscrypt_new_context_from_policy(&ctx, &ci->ci_policy,
+						  ci->ci_nonce);
+
+	BUILD_BUG_ON(sizeof(ctx) != FSCRYPT_SET_CONTEXT_MAX_SIZE);
+	return inode->i_sb->s_cop->set_context(inode, &ctx, ctxsize, fs_data);
+}
+EXPORT_SYMBOL_GPL(fscrypt_set_context);
+
 /**
  * fscrypt_set_test_dummy_encryption() - handle '-o test_dummy_encryption'
  * @sb: the filesystem on which test_dummy_encryption is being specified
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 991ff8575d0e7..726131dfa0a9b 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -158,6 +158,7 @@ int fscrypt_ioctl_get_nonce(struct file *filp, void __user *arg);
 int fscrypt_has_permitted_context(struct inode *parent, struct inode *child);
 int fscrypt_inherit_context(struct inode *parent, struct inode *child,
 			    void *fs_data, bool preload);
+int fscrypt_set_context(struct inode *inode, void *fs_data);
 
 struct fscrypt_dummy_context {
 	const union fscrypt_context *ctx;
@@ -184,6 +185,8 @@ int fscrypt_ioctl_get_key_status(struct file *filp, void __user *arg);
 
 /* keysetup.c */
 int fscrypt_get_encryption_info(struct inode *inode);
+int fscrypt_prepare_new_inode(struct inode *dir, struct inode *inode,
+			      bool *encrypt_ret);
 void fscrypt_put_encryption_info(struct inode *inode);
 void fscrypt_free_inode(struct inode *inode);
 int fscrypt_drop_inode(struct inode *inode);
@@ -347,6 +350,11 @@ static inline int fscrypt_inherit_context(struct inode *parent,
 	return -EOPNOTSUPP;
 }
 
+static inline int fscrypt_set_context(struct inode *inode, void *fs_data)
+{
+	return -EOPNOTSUPP;
+}
+
 struct fscrypt_dummy_context {
 };
 
@@ -394,6 +402,15 @@ static inline int fscrypt_get_encryption_info(struct inode *inode)
 	return -EOPNOTSUPP;
 }
 
+static inline int fscrypt_prepare_new_inode(struct inode *dir,
+					    struct inode *inode,
+					    bool *encrypt_ret)
+{
+	if (IS_ENCRYPTED(dir))
+		return -EOPNOTSUPP;
+	return 0;
+}
+
 static inline void fscrypt_put_encryption_info(struct inode *inode)
 {
 	return;
-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
