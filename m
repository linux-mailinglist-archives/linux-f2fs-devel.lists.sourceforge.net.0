Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E867DF869
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Oct 2019 01:07:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iMgm3-0006q4-G9; Mon, 21 Oct 2019 23:07:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iMglv-0006mA-Ft
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Oct 2019 23:07:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rncXJSlm7l08IxyHfqY2pk4edcl7Ev5WIo6r9oXl6ls=; b=h7WV9AQzwIk2rlF7hw3SwCetRp
 0U39pVySQHZPK9vVrS5qTyd9TACJ7COvQ5OipuUag+/8rHfi3+N+h/+4qVqX3iEAagiEveqQVHkUs
 oI9hsKCXyYHjTYYk4s0NsIYrE10bU90EMjaN9XVQnZifwYOTDyO5l+nd7WZeCFlmbXVk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rncXJSlm7l08IxyHfqY2pk4edcl7Ev5WIo6r9oXl6ls=; b=g4594IDTq70tL2m82DHl5TpBrZ
 tDsEss1n4bmxdO7bSKtzu2mfBniK/qxJFfaWItdN6YOsTyJBFLiNdiN9gvq10zPVH1ao6CG16Duxk
 +FkSdFqAlMsTnjOBoGTIk6ly0Oxg4fzZXmCUaWuBO0jFO6JOtxKBq5JEDGf62Uxvhvak=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iMglt-00Alot-Nr
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Oct 2019 23:07:31 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3DC4F20B7C;
 Mon, 21 Oct 2019 23:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571699242;
 bh=LkX3mcHBsA0rmZwz4gicgA9NG27gLTP77vG2qHSOGio=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S/pv2cR4NYtB4zTSkabgWJhhDdn6pn9bO9ysPGRdfd/g7SaKM+MWr6FjOIf/q1bWl
 A7tKYMtAjbph09lv39SjHi6680khwsTQqHFkgxN/ZPoeHb/WbGoqsHJiSUDSBYyduE
 3nwwf+oJpRttcPbFwT8q/bbTBFwyM547PR5oMbrM=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 21 Oct 2019 16:03:53 -0700
Message-Id: <20191021230355.23136-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191021230355.23136-1-ebiggers@kernel.org>
References: <20191021230355.23136-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
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
 0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iMglt-00Alot-Nr
Subject: [f2fs-dev] [PATCH 1/3] fscrypt: add support for
 inline-encryption-optimized policies
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
Cc: linux-f2fs-devel@lists.sourceforge.net, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Satya Tangirala <satyat@google.com>, Paul Lawrence <paullawrence@google.com>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Some inline encryption hardware has only a small number of keyslots,
which would make it inefficient to use the traditional fscrypt per-file
keys.  The existing DIRECT_KEY encryption policy flag doesn't solve this
because it assumes that file contents and names are encrypted by the
same algorithm and that IVs are at least 24 bytes.

Therefore, add a new encryption policy flag INLINE_CRYPT_OPTIMIZED which
causes the encryption to modified as follows:

- The key for file contents encryption is derived from the values
  (master_key, mode_num, filesystem_uuid).  The per-file nonce is not
  included, so many files may share the same contents encryption key.

- The IV for encrypting each block of file contents is built as
  (inode_number << 32) | file_logical_block_num.

Including the inode number in the IVs ensures that data in different
files is encrypted differently, despite per-file keys not being used.
Limiting the inode and block numbers to 32 bits and putting the block
number in the low bits is needed to be compatible with inline encryption
hardware which only supports specifying a 64-bit data unit number which
is auto-incremented; this is what the UFS and EMMC standards support.

This IV generation method places extra constraints on filesystems: inode
numbers must be stable, which may preclude filesystem shrinking; and
inode and file logical block numbers can be at most 32-bit.  Therefore,
only allow INLINE_CRYPT_OPTIMIZED policies on filesystems that declare
that they meet these constraints.

Note that INLINE_CRYPT_OPTIMIZED is an on-disk format, not an
implementation; it doesn't require the use of inline encryption.  This
patch adds support for it using the existing filesystem layer
encryption.  A later patch will add inline encryption support.

Co-developed-by: Satya Tangirala <satyat@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/fscrypt.rst | 53 +++++++++++++++++++--------
 fs/crypto/crypto.c                    | 11 +++++-
 fs/crypto/fscrypt_private.h           | 20 +++++++---
 fs/crypto/keyring.c                   |  6 ++-
 fs/crypto/keysetup.c                  | 47 +++++++++++++++++++-----
 fs/crypto/policy.c                    | 42 ++++++++++++++++++++-
 include/linux/fscrypt.h               |  3 ++
 include/uapi/linux/fscrypt.h          | 15 ++++----
 8 files changed, 155 insertions(+), 42 deletions(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index 6ec459be3de16..d059185f79ba9 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -257,12 +257,13 @@ the master keys may be wrapped in userspace, e.g. as is done by the
 `fscrypt <https://github.com/google/fscrypt>`_ tool.
 
 Including the inode number in the IVs was considered.  However, it was
-rejected as it would have prevented ext4 filesystems from being
-resized, and by itself still wouldn't have been sufficient to prevent
-the same key from being directly reused for both XTS and CTS-CBC.
+rejected (except for INLINE_CRYPT_OPTIMIZED policies) as it would have
+prevented ext4 filesystems from being resized, and by itself still
+wouldn't have been sufficient to prevent the same key from being
+directly reused for both XTS and CTS-CBC.
 
-DIRECT_KEY and per-mode keys
-----------------------------
+DIRECT_KEY policies
+-------------------
 
 The Adiantum encryption mode (see `Encryption modes and usage`_) is
 suitable for both contents and filenames encryption, and it accepts
@@ -285,6 +286,22 @@ IV.  Moreover:
   key derived using the KDF.  Users may use the same master key for
   other v2 encryption policies.
 
+INLINE_CRYPT_OPTIMIZED policies
+-------------------------------
+
+When FSCRYPT_POLICY_FLAG_INLINE_CRYPT_OPTIMIZED is set in an
+encryption policy, file contents are encrypted using a key derived
+from the master key, encryption mode number, and filesystem UUID.  In
+this case, many files may share the same key.  To still encrypt
+different files' data differently, inode numbers are included in the
+IVs.  Consequently, shrinking the filesystem may not be allowed.
+
+This format is optimized for use with inline encryption hardware that
+supports only a small number of keyslots and allows specifying only 8
+IV bytes, e.g. the crypto capabilities in the UFSHCI v2.1+ standard.
+
+This flag has no effect on filenames encryption.
+
 Key identifiers
 ---------------
 
@@ -342,11 +359,14 @@ a little endian number, except that:
   is encrypted with AES-256 where the AES-256 key is the SHA-256 hash
   of the file's data encryption key.
 
-- In the "direct key" configuration (FSCRYPT_POLICY_FLAG_DIRECT_KEY
-  set in the fscrypt_policy), the file's nonce is also appended to the
-  IV.  Currently this is only allowed with the Adiantum encryption
+- With `DIRECT_KEY policies`_, the file's nonce is also appended to
+  the IV.  Currently this is only allowed with the Adiantum encryption
   mode.
 
+- With `INLINE_CRYPT_OPTIMIZED policies`_, the block number is limited
+  to 32 bits and is placed in bits 0-31 of the IV.  The inode number
+  (which is also limited to 32 bits) is placed in bits 32-63.
+
 Filenames encryption
 --------------------
 
@@ -432,12 +452,15 @@ This structure must be initialized as follows:
   (1) for ``contents_encryption_mode`` and FSCRYPT_MODE_AES_256_CTS
   (4) for ``filenames_encryption_mode``.
 
-- ``flags`` must contain a value from ``<linux/fscrypt.h>`` which
-  identifies the amount of NUL-padding to use when encrypting
-  filenames.  If unsure, use FSCRYPT_POLICY_FLAGS_PAD_32 (0x3).
-  Additionally, if the encryption modes are both
-  FSCRYPT_MODE_ADIANTUM, this can contain
-  FSCRYPT_POLICY_FLAG_DIRECT_KEY; see `DIRECT_KEY and per-mode keys`_.
+- ``flags`` contains optional flags from ``<linux/fscrypt.h>``:
+
+  - FSCRYPT_POLICY_FLAGS_PAD_*: The amount of NUL padding to use when
+    encrypting filenames.  If unsure, use FSCRYPT_POLICY_FLAGS_PAD_32
+    (0x3).
+  - FSCRYPT_POLICY_FLAG_DIRECT_KEY: See `DIRECT_KEY policies`_.
+  - FSCRYPT_POLICY_FLAG_INLINE_CRYPT_OPTIMIZED: See
+    `INLINE_CRYPT_OPTIMIZED policies`_.  This is mutually exclusive
+    with DIRECT_KEY and is not supported on v1 policies.
 
 - For v2 encryption policies, ``__reserved`` must be zeroed.
 
@@ -1090,7 +1113,7 @@ policy structs (see `Setting an encryption policy`_), except that the
 context structs also contain a nonce.  The nonce is randomly generated
 by the kernel and is used as KDF input or as a tweak to cause
 different files to be encrypted differently; see `Per-file keys`_ and
-`DIRECT_KEY and per-mode keys`_.
+`DIRECT_KEY policies`_.
 
 Data path changes
 -----------------
diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index ced8ad9f2d019..6be16837accdd 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -73,11 +73,18 @@ EXPORT_SYMBOL(fscrypt_free_bounce_page);
 void fscrypt_generate_iv(union fscrypt_iv *iv, u64 lblk_num,
 			 const struct fscrypt_info *ci)
 {
+	u8 flags = fscrypt_policy_flags(&ci->ci_policy);
+
 	memset(iv, 0, ci->ci_mode->ivsize);
-	iv->lblk_num = cpu_to_le64(lblk_num);
 
-	if (fscrypt_is_direct_key_policy(&ci->ci_policy))
+	if ((flags & FSCRYPT_POLICY_FLAG_INLINE_CRYPT_OPTIMIZED) &&
+	    S_ISREG(ci->ci_inode->i_mode)) {
+		WARN_ON_ONCE((u32)lblk_num != lblk_num);
+		lblk_num |= (u64)ci->ci_inode->i_ino << 32;
+	} else if (flags & FSCRYPT_POLICY_FLAG_DIRECT_KEY) {
 		memcpy(iv->nonce, ci->ci_nonce, FS_KEY_DERIVATION_NONCE_SIZE);
+	}
+	iv->lblk_num = cpu_to_le64(lblk_num);
 }
 
 /* Encrypt or decrypt a single filesystem block of file contents */
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index dacf8fcbac3be..3428488612b84 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -163,6 +163,9 @@ struct fscrypt_info {
 	/* The actual crypto transform used for encryption and decryption */
 	struct crypto_skcipher *ci_ctfm;
 
+	/* True if the key should be freed when this fscrypt_info is freed */
+	bool ci_owns_key;
+
 	/*
 	 * Encryption mode used for this inode.  It corresponds to either the
 	 * contents or filenames encryption mode, depending on the inode type.
@@ -279,9 +282,10 @@ extern int fscrypt_init_hkdf(struct fscrypt_hkdf *hkdf, const u8 *master_key,
  * outputs are unique and cryptographically isolated, i.e. knowledge of one
  * output doesn't reveal another.
  */
-#define HKDF_CONTEXT_KEY_IDENTIFIER	1
-#define HKDF_CONTEXT_PER_FILE_KEY	2
-#define HKDF_CONTEXT_PER_MODE_KEY	3
+#define HKDF_CONTEXT_KEY_IDENTIFIER		1
+#define HKDF_CONTEXT_PER_FILE_KEY		2
+#define HKDF_CONTEXT_DIRECT_KEY			3
+#define HKDF_CONTEXT_INLINE_CRYPT_OPTIMIZED_KEY	4
 
 extern int fscrypt_hkdf_expand(struct fscrypt_hkdf *hkdf, u8 context,
 			       const u8 *info, unsigned int infolen,
@@ -378,8 +382,14 @@ struct fscrypt_master_key {
 	struct list_head	mk_decrypted_inodes;
 	spinlock_t		mk_decrypted_inodes_lock;
 
-	/* Per-mode tfms for DIRECT_KEY policies, allocated on-demand */
-	struct crypto_skcipher	*mk_mode_keys[__FSCRYPT_MODE_MAX + 1];
+	/* Crypto API transforms for DIRECT_KEY policies, allocated on-demand */
+	struct crypto_skcipher	*mk_direct_tfms[__FSCRYPT_MODE_MAX + 1];
+
+	/*
+	 * Crypto API transforms for filesystem-layer implementation of
+	 * INLINE_CRYPT_OPTIMIZED policies, allocated on-demand.
+	 */
+	struct crypto_skcipher	*mk_inline_crypt_optimized_tfms[__FSCRYPT_MODE_MAX + 1];
 
 } __randomize_layout;
 
diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index c34fa7c61b43b..6ca3364b2c968 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -43,8 +43,10 @@ static void free_master_key(struct fscrypt_master_key *mk)
 
 	wipe_master_key_secret(&mk->mk_secret);
 
-	for (i = 0; i < ARRAY_SIZE(mk->mk_mode_keys); i++)
-		crypto_free_skcipher(mk->mk_mode_keys[i]);
+	for (i = 0; i <= __FSCRYPT_MODE_MAX; i++) {
+		crypto_free_skcipher(mk->mk_direct_tfms[i]);
+		crypto_free_skcipher(mk->mk_inline_crypt_optimized_tfms[i]);
+	}
 
 	key_put(mk->mk_users);
 	kzfree(mk);
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index b03b33643e4b2..79af9c2713057 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -116,40 +116,54 @@ int fscrypt_set_derived_key(struct fscrypt_info *ci, const u8 *derived_key)
 		return PTR_ERR(tfm);
 
 	ci->ci_ctfm = tfm;
+	ci->ci_owns_key = true;
 	return 0;
 }
 
 static int setup_per_mode_key(struct fscrypt_info *ci,
-			      struct fscrypt_master_key *mk)
+			      struct fscrypt_master_key *mk,
+			      struct crypto_skcipher **tfms,
+			      u8 hkdf_context, bool include_fs_uuid)
 {
+	const struct inode *inode = ci->ci_inode;
+	const struct super_block *sb = inode->i_sb;
 	struct fscrypt_mode *mode = ci->ci_mode;
 	u8 mode_num = mode - available_modes;
 	struct crypto_skcipher *tfm, *prev_tfm;
 	u8 mode_key[FSCRYPT_MAX_KEY_SIZE];
+	u8 hkdf_info[sizeof(mode_num) + sizeof(sb->s_uuid)];
+	unsigned int hkdf_infolen = 0;
 	int err;
 
-	if (WARN_ON(mode_num >= ARRAY_SIZE(mk->mk_mode_keys)))
+	if (WARN_ON(mode_num > __FSCRYPT_MODE_MAX))
 		return -EINVAL;
 
 	/* pairs with cmpxchg() below */
-	tfm = READ_ONCE(mk->mk_mode_keys[mode_num]);
+	tfm = READ_ONCE(tfms[mode_num]);
 	if (likely(tfm != NULL))
 		goto done;
 
 	BUILD_BUG_ON(sizeof(mode_num) != 1);
+	BUILD_BUG_ON(sizeof(sb->s_uuid) != 16);
+	BUILD_BUG_ON(sizeof(hkdf_info) != 17);
+	hkdf_info[hkdf_infolen++] = mode_num;
+	if (include_fs_uuid) {
+		memcpy(&hkdf_info[hkdf_infolen], &sb->s_uuid,
+		       sizeof(sb->s_uuid));
+		hkdf_infolen += sizeof(sb->s_uuid);
+	}
 	err = fscrypt_hkdf_expand(&mk->mk_secret.hkdf,
-				  HKDF_CONTEXT_PER_MODE_KEY,
-				  &mode_num, sizeof(mode_num),
+				  hkdf_context, hkdf_info, hkdf_infolen,
 				  mode_key, mode->keysize);
 	if (err)
 		return err;
-	tfm = fscrypt_allocate_skcipher(mode, mode_key, ci->ci_inode);
+	tfm = fscrypt_allocate_skcipher(mode, mode_key, inode);
 	memzero_explicit(mode_key, mode->keysize);
 	if (IS_ERR(tfm))
 		return PTR_ERR(tfm);
 
 	/* pairs with READ_ONCE() above */
-	prev_tfm = cmpxchg(&mk->mk_mode_keys[mode_num], NULL, tfm);
+	prev_tfm = cmpxchg(&tfms[mode_num], NULL, tfm);
 	if (prev_tfm != NULL) {
 		crypto_free_skcipher(tfm);
 		tfm = prev_tfm;
@@ -180,7 +194,21 @@ static int fscrypt_setup_v2_file_key(struct fscrypt_info *ci,
 				     ci->ci_mode->friendly_name);
 			return -EINVAL;
 		}
-		return setup_per_mode_key(ci, mk);
+		return setup_per_mode_key(ci, mk, mk->mk_direct_tfms,
+					  HKDF_CONTEXT_DIRECT_KEY, false);
+	} else if ((ci->ci_policy.v2.flags &
+		    FSCRYPT_POLICY_FLAG_INLINE_CRYPT_OPTIMIZED) &&
+		   S_ISREG(ci->ci_inode->i_mode)) {
+		/*
+		 * INLINE_CRYPT_OPTIMIZED: file contents keys are derived from
+		 * (master_key, mode_num, filesystem_uuid), and inode number is
+		 * included in the IVs.  This format is optimized for use with
+		 * inline encryption hardware.
+		 */
+		return setup_per_mode_key(ci, mk,
+					  mk->mk_inline_crypt_optimized_tfms,
+					  HKDF_CONTEXT_INLINE_CRYPT_OPTIMIZED_KEY,
+					  true);
 	}
 
 	err = fscrypt_hkdf_expand(&mk->mk_secret.hkdf,
@@ -304,8 +332,7 @@ static void put_crypt_info(struct fscrypt_info *ci)
 
 	if (ci->ci_direct_key)
 		fscrypt_put_direct_key(ci->ci_direct_key);
-	else if (ci->ci_ctfm != NULL &&
-		 !fscrypt_is_direct_key_policy(&ci->ci_policy))
+	else if (ci->ci_owns_key)
 		crypto_free_skcipher(ci->ci_ctfm);
 
 	key = ci->ci_master_key;
diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index 4072ba644595b..fddd90db2d787 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -29,6 +29,41 @@ bool fscrypt_policies_equal(const union fscrypt_policy *policy1,
 	return !memcmp(policy1, policy2, fscrypt_policy_size(policy1));
 }
 
+static bool supported_inline_crypt_optimized_policy(
+					const struct fscrypt_policy_v2 *policy,
+					const struct inode *inode)
+{
+	struct super_block *sb = inode->i_sb;
+	int ino_bits = 64, lblk_bits = 64;
+
+	if (policy->flags & FSCRYPT_POLICY_FLAG_DIRECT_KEY) {
+		fscrypt_warn(inode,
+			     "The DIRECT_KEY and INLINE_CRYPT_OPTIMIZED flags are mutually exclusive");
+		return false;
+	}
+	/*
+	 * Since INLINE_CRYPT_OPTIMIZED policies include the inode number in the
+	 * IVs, it must not be allowed for the filesystem to renumber the
+	 * inodes, e.g. via filesystem shrinking.
+	 */
+	if (!sb->s_cop->has_stable_inodes ||
+	    !sb->s_cop->has_stable_inodes(sb)) {
+		fscrypt_warn(inode,
+			     "Can't use INLINE_CRYPT_OPTIMIZED policy on filesystem '%s' because it doesn't have stable inode numbers",
+			     sb->s_id);
+		return false;
+	}
+	if (sb->s_cop->get_ino_and_lblk_bits)
+		sb->s_cop->get_ino_and_lblk_bits(sb, &ino_bits, &lblk_bits);
+	if (ino_bits > 32 || lblk_bits > 32) {
+		fscrypt_warn(inode,
+			     "Can't use INLINE_CRYPT_OPTIMIZED policy on filesystem '%s' because it doesn't use 32-bit inode and block numbers",
+			     sb->s_id);
+		return false;
+	}
+	return true;
+}
+
 /**
  * fscrypt_supported_policy - check whether an encryption policy is supported
  *
@@ -55,7 +90,8 @@ bool fscrypt_supported_policy(const union fscrypt_policy *policy_u,
 			return false;
 		}
 
-		if (policy->flags & ~FSCRYPT_POLICY_FLAGS_VALID) {
+		if (policy->flags & ~(FSCRYPT_POLICY_FLAGS_PAD_MASK |
+				      FSCRYPT_POLICY_FLAG_DIRECT_KEY)) {
 			fscrypt_warn(inode,
 				     "Unsupported encryption flags (0x%02x)",
 				     policy->flags);
@@ -83,6 +119,10 @@ bool fscrypt_supported_policy(const union fscrypt_policy *policy_u,
 			return false;
 		}
 
+		if ((policy->flags & FSCRYPT_POLICY_FLAG_INLINE_CRYPT_OPTIMIZED)
+		    && !supported_inline_crypt_optimized_policy(policy, inode))
+			return false;
+
 		if (memchr_inv(policy->__reserved, 0,
 			       sizeof(policy->__reserved))) {
 			fscrypt_warn(inode,
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 04f5ed6284454..1a7bffe78ed56 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -61,6 +61,9 @@ struct fscrypt_operations {
 	bool (*dummy_context)(struct inode *);
 	bool (*empty_dir)(struct inode *);
 	unsigned int max_namelen;
+	bool (*has_stable_inodes)(struct super_block *sb);
+	void (*get_ino_and_lblk_bits)(struct super_block *sb,
+				      int *ino_bits_ret, int *lblk_bits_ret);
 };
 
 static inline bool fscrypt_has_encryption_key(const struct inode *inode)
diff --git a/include/uapi/linux/fscrypt.h b/include/uapi/linux/fscrypt.h
index 39ccfe9311c38..6a8fd8ff2d2ac 100644
--- a/include/uapi/linux/fscrypt.h
+++ b/include/uapi/linux/fscrypt.h
@@ -11,13 +11,14 @@
 #include <linux/types.h>
 
 /* Encryption policy flags */
-#define FSCRYPT_POLICY_FLAGS_PAD_4		0x00
-#define FSCRYPT_POLICY_FLAGS_PAD_8		0x01
-#define FSCRYPT_POLICY_FLAGS_PAD_16		0x02
-#define FSCRYPT_POLICY_FLAGS_PAD_32		0x03
-#define FSCRYPT_POLICY_FLAGS_PAD_MASK		0x03
-#define FSCRYPT_POLICY_FLAG_DIRECT_KEY		0x04
-#define FSCRYPT_POLICY_FLAGS_VALID		0x07
+#define FSCRYPT_POLICY_FLAGS_PAD_4			0x00
+#define FSCRYPT_POLICY_FLAGS_PAD_8			0x01
+#define FSCRYPT_POLICY_FLAGS_PAD_16			0x02
+#define FSCRYPT_POLICY_FLAGS_PAD_32			0x03
+#define FSCRYPT_POLICY_FLAGS_PAD_MASK			0x03
+#define FSCRYPT_POLICY_FLAG_DIRECT_KEY			0x04
+#define FSCRYPT_POLICY_FLAG_INLINE_CRYPT_OPTIMIZED	0x08
+#define FSCRYPT_POLICY_FLAGS_VALID			0x0F
 
 /* Encryption algorithms */
 #define FSCRYPT_MODE_AES_256_XTS		1
-- 
2.23.0.866.gb869b98d4c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
