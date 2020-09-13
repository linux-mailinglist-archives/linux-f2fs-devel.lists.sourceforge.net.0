Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4382267EA3
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 13 Sep 2020 10:38:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kHNWY-0005Rv-0o; Sun, 13 Sep 2020 08:38:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kHNWX-0005Ro-0X
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 13 Sep 2020 08:38:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iEua5vIhu5l/wu3LRnab70PMI1Jeyke29AGzNL9Ahxo=; b=Okd9ZPA95LPetxK2TthNbdPULY
 FKAS8RncUjRg5oZw4JKVUIvFhFpgaHm5z7hH6TG1bk+A+8L1RdzlHT/DiwHEBL3Pzar8ui3vsTfkc
 XmCkWh2nEgSfejf0ol8cPMFg1hqA+ljqqXUntYOJa4tDrgTy1F07Gob+GtLbnTvupB1E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iEua5vIhu5l/wu3LRnab70PMI1Jeyke29AGzNL9Ahxo=; b=H9EUPXGrUz7d7El04FQxcPYuN/
 ZjkrBy5ep9k8ef4LZylwVnbhF5FUH+gLdL+CjMUxbG4nCKO/20gX6iG4sZ0sDJMROHucW+T+eFAT5
 kfSPrEfvfSajmKPHNAAInOjAWbAe+fkpMlhi+UxcI04nwyc2x2uWm0dmxTjNTSfYhyQQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kHNWN-006q6A-Gp
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 13 Sep 2020 08:38:12 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E83F12158C;
 Sun, 13 Sep 2020 08:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599986278;
 bh=GtuuizJcLTW3bGJL00gWeJR50PJRhFYvFxYZjc4ncd8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZaFapO37bkQppa6Mfy7/oCRTuVCkGxIItwG0O6+zThp0LVIBFMBSRlYNmPNE0hm/3
 gpgrbhjQ36hK2NIGs7AQxe4umMm/89OcvQsbIwyCjRtz2+JfILGzoZtJHr8nJtZiII
 TL35ICsyN32gYSXf069tqnTiexq92a0uA3QpB+vU=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Sun, 13 Sep 2020 01:36:10 -0700
Message-Id: <20200913083620.170627-2-ebiggers@kernel.org>
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
X-Headers-End: 1kHNWN-006q6A-Gp
Subject: [f2fs-dev] [PATCH v2 01/11] fscrypt: add
 fscrypt_prepare_new_inode() and fscrypt_set_context()
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

fscrypt_get_encryption_info() is intended to be GFP_NOFS-safe.  But
actually it isn't, since it uses functions like crypto_alloc_skcipher()
which aren't GFP_NOFS-safe, even when called under memalloc_nofs_save().
Therefore it can deadlock when called from a context that needs
GFP_NOFS, e.g. during an ext4 transaction or between f2fs_lock_op() and
f2fs_unlock_op().  This happens when creating a new encrypted file.

We can't fix this by just not setting up the key for new inodes right
away, since new symlinks need their key to encrypt the symlink target.

So we need to set up the new inode's key before starting the
transaction.  But just calling fscrypt_get_encryption_info() earlier
doesn't work, since it assumes the encryption context is already set,
and the encryption context can't be set until the transaction.

The recently proposed fscrypt support for the ceph filesystem
(https://lkml.kernel.org/linux-fscrypt/20200821182813.52570-1-jlayton@kernel.org/T/#u)
will have this same ordering problem too, since ceph will need to
encrypt new symlinks before setting their encryption context.

Finally, f2fs can deadlock when the filesystem is mounted with
'-o test_dummy_encryption' and a new file is created in an existing
unencrypted directory.  Similarly, this is caused by holding too many
locks when calling fscrypt_get_encryption_info().

To solve all these problems, add new helper functions:

- fscrypt_prepare_new_inode() sets up a new inode's encryption key
  (fscrypt_info), using the parent directory's encryption policy and a
  new random nonce.  It neither reads nor writes the encryption context.

- fscrypt_set_context() persists the encryption context of a new inode,
  using the information from the fscrypt_info already in memory.  This
  replaces fscrypt_inherit_context().

Temporarily keep fscrypt_inherit_context() around until all filesystems
have been converted to use fscrypt_set_context().

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fscrypt_private.h |   3 +
 fs/crypto/keysetup.c        | 176 ++++++++++++++++++++++++++++--------
 fs/crypto/policy.c          |  62 +++++++++++--
 include/linux/fscrypt.h     |  17 ++++
 4 files changed, 209 insertions(+), 49 deletions(-)

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
index fea6226afc2b0..5371eee8f4b30 100644
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
@@ -254,8 +265,14 @@ static int fscrypt_setup_iv_ino_lblk_32_key(struct fscrypt_info *ci,
 			return err;
 	}
 
-	ci->ci_hashed_ino = (u32)siphash_1u64(ci->ci_inode->i_ino,
-					      &mk->mk_ino_hash_key);
+	/*
+	 * New inodes may not have an inode number assigned yet.
+	 * Hashing their inode number is delayed until later.
+	 */
+	if (ci->ci_inode->i_ino == 0)
+		WARN_ON(!(ci->ci_inode->i_state & I_CREATING));
+	else
+		fscrypt_hash_inode_number(ci, mk);
 	return 0;
 }
 
@@ -454,57 +471,27 @@ static void put_crypt_info(struct fscrypt_info *ci)
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
 	res = fscrypt_initialize(inode->i_sb->s_cop->flags);
 	if (res)
 		return res;
 
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
@@ -519,8 +506,8 @@ int fscrypt_get_encryption_info(struct inode *inode)
 		goto out;
 
 	/*
-	 * Multiple tasks may race to set ->i_crypt_info, so use
-	 * cmpxchg_release().  This pairs with the smp_load_acquire() in
+	 * For existing inodes, multiple tasks may race to set ->i_crypt_info.
+	 * So use cmpxchg_release().  This pairs with the smp_load_acquire() in
 	 * fscrypt_get_info().  I.e., here we publish ->i_crypt_info with a
 	 * RELEASE barrier so that other tasks can ACQUIRE it.
 	 */
@@ -555,8 +542,117 @@ int fscrypt_get_encryption_info(struct inode *inode)
 	put_crypt_info(crypt_info);
 	return res;
 }
+
+/**
+ * fscrypt_get_encryption_info() - set up an inode's encryption key
+ * @inode: the inode to set up the key for
+ *
+ * Set up ->i_crypt_info, if it hasn't already been done.
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
+ * @inode: the new inode.  ->i_mode must be set already.
+ *	   ->i_ino doesn't need to be set yet.
+ * @encrypt_ret: (output) set to %true if the new inode will be encrypted
+ *
+ * If the directory is encrypted, set up its ->i_crypt_info in preparation for
+ * encrypting the name of the new file.  Also, if the new inode will be
+ * encrypted, set up its ->i_crypt_info and set *encrypt_ret=true.
+ *
+ * This isn't %GFP_NOFS-safe, and therefore it should be called before starting
+ * any filesystem transaction to create the inode.  For this reason, ->i_ino
+ * isn't required to be set yet, as the filesystem may not have set it yet.
+ *
+ * This doesn't persist the new inode's encryption context.  That still needs to
+ * be done later by calling fscrypt_set_context().
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
index b92f345231780..7e96953d385ec 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -236,18 +236,19 @@ bool fscrypt_supported_policy(const union fscrypt_policy *policy_u,
 }
 
 /**
- * fscrypt_new_context_from_policy() - create a new fscrypt_context from
- *				       an fscrypt_policy
+ * fscrypt_new_context() - create a new fscrypt_context
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
+static int fscrypt_new_context(union fscrypt_context *ctx_u,
+			       const union fscrypt_policy *policy_u,
+			       const u8 nonce[FSCRYPT_FILE_NONCE_SIZE])
 {
 	memset(ctx_u, 0, sizeof(*ctx_u));
 
@@ -265,7 +266,7 @@ static int fscrypt_new_context_from_policy(union fscrypt_context *ctx_u,
 		memcpy(ctx->master_key_descriptor,
 		       policy->master_key_descriptor,
 		       sizeof(ctx->master_key_descriptor));
-		get_random_bytes(ctx->nonce, sizeof(ctx->nonce));
+		memcpy(ctx->nonce, nonce, FSCRYPT_FILE_NONCE_SIZE);
 		return sizeof(*ctx);
 	}
 	case FSCRYPT_POLICY_V2: {
@@ -281,7 +282,7 @@ static int fscrypt_new_context_from_policy(union fscrypt_context *ctx_u,
 		memcpy(ctx->master_key_identifier,
 		       policy->master_key_identifier,
 		       sizeof(ctx->master_key_identifier));
-		get_random_bytes(ctx->nonce, sizeof(ctx->nonce));
+		memcpy(ctx->nonce, nonce, FSCRYPT_FILE_NONCE_SIZE);
 		return sizeof(*ctx);
 	}
 	}
@@ -377,6 +378,7 @@ static int fscrypt_get_policy(struct inode *inode, union fscrypt_policy *policy)
 static int set_encryption_policy(struct inode *inode,
 				 const union fscrypt_policy *policy)
 {
+	u8 nonce[FSCRYPT_FILE_NONCE_SIZE];
 	union fscrypt_context ctx;
 	int ctxsize;
 	int err;
@@ -414,7 +416,8 @@ static int set_encryption_policy(struct inode *inode,
 		return -EINVAL;
 	}
 
-	ctxsize = fscrypt_new_context_from_policy(&ctx, policy);
+	get_random_bytes(nonce, FSCRYPT_FILE_NONCE_SIZE);
+	ctxsize = fscrypt_new_context(&ctx, policy, nonce);
 
 	return inode->i_sb->s_cop->set_context(inode, &ctx, ctxsize, NULL);
 }
@@ -637,6 +640,7 @@ EXPORT_SYMBOL(fscrypt_has_permitted_context);
 int fscrypt_inherit_context(struct inode *parent, struct inode *child,
 						void *fs_data, bool preload)
 {
+	u8 nonce[FSCRYPT_FILE_NONCE_SIZE];
 	union fscrypt_context ctx;
 	int ctxsize;
 	struct fscrypt_info *ci;
@@ -650,7 +654,8 @@ int fscrypt_inherit_context(struct inode *parent, struct inode *child,
 	if (ci == NULL)
 		return -ENOKEY;
 
-	ctxsize = fscrypt_new_context_from_policy(&ctx, &ci->ci_policy);
+	get_random_bytes(nonce, FSCRYPT_FILE_NONCE_SIZE);
+	ctxsize = fscrypt_new_context(&ctx, &ci->ci_policy, nonce);
 
 	BUILD_BUG_ON(sizeof(ctx) != FSCRYPT_SET_CONTEXT_MAX_SIZE);
 	res = parent->i_sb->s_cop->set_context(child, &ctx, ctxsize, fs_data);
@@ -660,6 +665,45 @@ int fscrypt_inherit_context(struct inode *parent, struct inode *child,
 }
 EXPORT_SYMBOL(fscrypt_inherit_context);
 
+/**
+ * fscrypt_set_context() - Set the fscrypt context of a new inode
+ * @inode: a new inode
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
+	BUILD_BUG_ON(sizeof(ctx) != FSCRYPT_SET_CONTEXT_MAX_SIZE);
+	ctxsize = fscrypt_new_context(&ctx, &ci->ci_policy, ci->ci_nonce);
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
+	return inode->i_sb->s_cop->set_context(inode, &ctx, ctxsize, fs_data);
+}
+EXPORT_SYMBOL_GPL(fscrypt_set_context);
+
 /**
  * fscrypt_set_test_dummy_encryption() - handle '-o test_dummy_encryption'
  * @sb: the filesystem on which test_dummy_encryption is being specified
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index eaf16eb557887..9cf7ca90f3abb 100644
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
