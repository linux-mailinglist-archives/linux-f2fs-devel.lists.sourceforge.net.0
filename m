Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCA9143401
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jan 2020 23:34:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1itfcu-0002hA-Fj; Mon, 20 Jan 2020 22:34:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1itfcs-0002gg-VV
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jan 2020 22:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iU3Y3viLYACKUUoV9/SXTV/n2s12bpkxERDqgwkyZ3g=; b=OAoZkTsZkzB3iWI2Z1Qk0CFjgD
 WiTTvNV099zQrakjyfSLOSBhMgRaRLb7hQi6GkCATSQss9gGr0ulcPbRD+yRVBk8+uimwDLcV/ych
 MDYH1sFbr801vkZMBZM6GCAGtZ3UskM9QdpUvRBNvbkCL+c/ayQFOLXLjo0oo7PsgJHU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iU3Y3viLYACKUUoV9/SXTV/n2s12bpkxERDqgwkyZ3g=; b=bdJUcME9eZpR9MytKdC/4vPLqp
 8cyoVeXvGYmFwICV/KCIHDFv6XshUoIEwpPJ9keH1PpLKzHiU99rQjncow4UVoUfUYZAsrIQEUxKN
 R4Z6etSL2hKPgsS/caT7HA27boOIVeZwzm0WFW1lXOEsb/Aq8h5XpZep7L8lJ3f7NWZ4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1itfcp-00BrPH-R0
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jan 2020 22:34:30 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F28224653;
 Mon, 20 Jan 2020 22:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579559658;
 bh=3GsTwrhKWubkVOsog2c7B6F+lDuYVeeynMA/s90tqzI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iiQV6zQShw6vXY9eYKMzoDDlLg4Z5+7Zz+Apw4p8beyOOIuzj7ENWAsm3911e3aFm
 nLH6VTCqKwvLstz0uoPDZQKkLZu/gBGLR/QPxlsboE9RSnzrizXJR86xeiLNJeiTQn
 Hv72riL4fjRKz3rvJ6LX3kN7Onb0WHw/Uo7YG/98=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 20 Jan 2020 14:31:58 -0800
Message-Id: <20200120223201.241390-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120223201.241390-1-ebiggers@kernel.org>
References: <20200120223201.241390-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1itfcp-00BrPH-R0
Subject: [f2fs-dev] [PATCH v5 3/6] fscrypt: clarify what is meant by a
 per-file key
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
Cc: Daniel Rosenberg <drosen@google.com>,
 Gabriel Krisman Bertazi <krisman@collabora.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Now that there's sometimes a second type of per-file key (the dirhash
key), clarify some function names, macros, and documentation that
specifically deal with per-file *encryption* keys.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/fscrypt.rst | 24 ++++++++---------
 fs/crypto/fscrypt_private.h           |  6 ++---
 fs/crypto/keysetup.c                  | 39 ++++++++++++++-------------
 fs/crypto/keysetup_v1.c               |  4 +--
 4 files changed, 37 insertions(+), 36 deletions(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index c45f5bcc13e17..d5b1b49c3d002 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -234,8 +234,8 @@ HKDF is more flexible, is nonreversible, and evenly distributes
 entropy from the master key.  HKDF is also standardized and widely
 used by other software, whereas the AES-128-ECB based KDF is ad-hoc.
 
-Per-file keys
--------------
+Per-file encryption keys
+------------------------
 
 Since each master key can protect many files, it is necessary to
 "tweak" the encryption of each file so that the same plaintext in two
@@ -268,9 +268,9 @@ is greater than that of an AES-256-XTS key.
 Therefore, to improve performance and save memory, for Adiantum a
 "direct key" configuration is supported.  When the user has enabled
 this by setting FSCRYPT_POLICY_FLAG_DIRECT_KEY in the fscrypt policy,
-per-file keys are not used.  Instead, whenever any data (contents or
-filenames) is encrypted, the file's 16-byte nonce is included in the
-IV.  Moreover:
+per-file encryption keys are not used.  Instead, whenever any data
+(contents or filenames) is encrypted, the file's 16-byte nonce is
+included in the IV.  Moreover:
 
 - For v1 encryption policies, the encryption is done directly with the
   master key.  Because of this, users **must not** use the same master
@@ -335,11 +335,11 @@ used.
 Adiantum is a (primarily) stream cipher-based mode that is fast even
 on CPUs without dedicated crypto instructions.  It's also a true
 wide-block mode, unlike XTS.  It can also eliminate the need to derive
-per-file keys.  However, it depends on the security of two primitives,
-XChaCha12 and AES-256, rather than just one.  See the paper
-"Adiantum: length-preserving encryption for entry-level processors"
-(https://eprint.iacr.org/2018/720.pdf) for more details.  To use
-Adiantum, CONFIG_CRYPTO_ADIANTUM must be enabled.  Also, fast
+per-file encryption keys.  However, it depends on the security of two
+primitives, XChaCha12 and AES-256, rather than just one.  See the
+paper "Adiantum: length-preserving encryption for entry-level
+processors" (https://eprint.iacr.org/2018/720.pdf) for more details.
+To use Adiantum, CONFIG_CRYPTO_ADIANTUM must be enabled.  Also, fast
 implementations of ChaCha and NHPoly1305 should be enabled, e.g.
 CONFIG_CRYPTO_CHACHA20_NEON and CONFIG_CRYPTO_NHPOLY1305_NEON for ARM.
 
@@ -1149,8 +1149,8 @@ The context structs contain the same information as the corresponding
 policy structs (see `Setting an encryption policy`_), except that the
 context structs also contain a nonce.  The nonce is randomly generated
 by the kernel and is used as KDF input or as a tweak to cause
-different files to be encrypted differently; see `Per-file keys`_ and
-`DIRECT_KEY policies`_.
+different files to be encrypted differently; see `Per-file encryption
+keys`_ and `DIRECT_KEY policies`_.
 
 Data path changes
 -----------------
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index e79d5fd6236a8..f0b0bfae5fa2d 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -268,7 +268,7 @@ extern int fscrypt_init_hkdf(struct fscrypt_hkdf *hkdf, const u8 *master_key,
  * output doesn't reveal another.
  */
 #define HKDF_CONTEXT_KEY_IDENTIFIER	1
-#define HKDF_CONTEXT_PER_FILE_KEY	2
+#define HKDF_CONTEXT_PER_FILE_ENC_KEY	2
 #define HKDF_CONTEXT_DIRECT_KEY		3
 #define HKDF_CONTEXT_IV_INO_LBLK_64_KEY	4
 #define HKDF_CONTEXT_DIRHASH_KEY	5
@@ -440,8 +440,8 @@ extern struct crypto_skcipher *
 fscrypt_allocate_skcipher(struct fscrypt_mode *mode, const u8 *raw_key,
 			  const struct inode *inode);
 
-extern int fscrypt_set_derived_key(struct fscrypt_info *ci,
-				   const u8 *derived_key);
+extern int fscrypt_set_per_file_enc_key(struct fscrypt_info *ci,
+					const u8 *raw_key);
 
 extern int fscrypt_derive_dirhash_key(struct fscrypt_info *ci,
 				      const struct fscrypt_master_key *mk);
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index 74d61d827d913..65cb09fa6ead9 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -107,12 +107,12 @@ struct crypto_skcipher *fscrypt_allocate_skcipher(struct fscrypt_mode *mode,
 	return ERR_PTR(err);
 }
 
-/* Given the per-file key, set up the file's crypto transform object */
-int fscrypt_set_derived_key(struct fscrypt_info *ci, const u8 *derived_key)
+/* Given a per-file encryption key, set up the file's crypto transform object */
+int fscrypt_set_per_file_enc_key(struct fscrypt_info *ci, const u8 *raw_key)
 {
 	struct crypto_skcipher *tfm;
 
-	tfm = fscrypt_allocate_skcipher(ci->ci_mode, derived_key, ci->ci_inode);
+	tfm = fscrypt_allocate_skcipher(ci->ci_mode, raw_key, ci->ci_inode);
 	if (IS_ERR(tfm))
 		return PTR_ERR(tfm);
 
@@ -121,10 +121,10 @@ int fscrypt_set_derived_key(struct fscrypt_info *ci, const u8 *derived_key)
 	return 0;
 }
 
-static int setup_per_mode_key(struct fscrypt_info *ci,
-			      struct fscrypt_master_key *mk,
-			      struct crypto_skcipher **tfms,
-			      u8 hkdf_context, bool include_fs_uuid)
+static int setup_per_mode_enc_key(struct fscrypt_info *ci,
+				  struct fscrypt_master_key *mk,
+				  struct crypto_skcipher **tfms,
+				  u8 hkdf_context, bool include_fs_uuid)
 {
 	const struct inode *inode = ci->ci_inode;
 	const struct super_block *sb = inode->i_sb;
@@ -196,15 +196,15 @@ static int fscrypt_setup_v2_file_key(struct fscrypt_info *ci,
 
 	if (ci->ci_policy.v2.flags & FSCRYPT_POLICY_FLAG_DIRECT_KEY) {
 		/*
-		 * DIRECT_KEY: instead of deriving per-file keys, the per-file
-		 * nonce will be included in all the IVs.  But unlike v1
-		 * policies, for v2 policies in this case we don't encrypt with
-		 * the master key directly but rather derive a per-mode key.
-		 * This ensures that the master key is consistently used only
-		 * for HKDF, avoiding key reuse issues.
+		 * DIRECT_KEY: instead of deriving per-file encryption keys, the
+		 * per-file nonce will be included in all the IVs.  But unlike
+		 * v1 policies, for v2 policies in this case we don't encrypt
+		 * with the master key directly but rather derive a per-mode
+		 * encryption key.  This ensures that the master key is
+		 * consistently used only for HKDF, avoiding key reuse issues.
 		 */
-		err = setup_per_mode_key(ci, mk, mk->mk_direct_tfms,
-					 HKDF_CONTEXT_DIRECT_KEY, false);
+		err = setup_per_mode_enc_key(ci, mk, mk->mk_direct_tfms,
+					     HKDF_CONTEXT_DIRECT_KEY, false);
 	} else if (ci->ci_policy.v2.flags &
 		   FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64) {
 		/*
@@ -213,20 +213,21 @@ static int fscrypt_setup_v2_file_key(struct fscrypt_info *ci,
 		 * the IVs.  This format is optimized for use with inline
 		 * encryption hardware compliant with the UFS or eMMC standards.
 		 */
-		err = setup_per_mode_key(ci, mk, mk->mk_iv_ino_lblk_64_tfms,
-					 HKDF_CONTEXT_IV_INO_LBLK_64_KEY, true);
+		err = setup_per_mode_enc_key(ci, mk, mk->mk_iv_ino_lblk_64_tfms,
+					     HKDF_CONTEXT_IV_INO_LBLK_64_KEY,
+					     true);
 	} else {
 		u8 derived_key[FSCRYPT_MAX_KEY_SIZE];
 
 		err = fscrypt_hkdf_expand(&mk->mk_secret.hkdf,
-					  HKDF_CONTEXT_PER_FILE_KEY,
+					  HKDF_CONTEXT_PER_FILE_ENC_KEY,
 					  ci->ci_nonce,
 					  FS_KEY_DERIVATION_NONCE_SIZE,
 					  derived_key, ci->ci_mode->keysize);
 		if (err)
 			return err;
 
-		err = fscrypt_set_derived_key(ci, derived_key);
+		err = fscrypt_set_per_file_enc_key(ci, derived_key);
 		memzero_explicit(derived_key, ci->ci_mode->keysize);
 	}
 	if (err)
diff --git a/fs/crypto/keysetup_v1.c b/fs/crypto/keysetup_v1.c
index 3578c1c607c51..801b48c0cd7f3 100644
--- a/fs/crypto/keysetup_v1.c
+++ b/fs/crypto/keysetup_v1.c
@@ -9,7 +9,7 @@
  * This file implements compatibility functions for the original encryption
  * policy version ("v1"), including:
  *
- * - Deriving per-file keys using the AES-128-ECB based KDF
+ * - Deriving per-file encryption keys using the AES-128-ECB based KDF
  *   (rather than the new method of using HKDF-SHA512)
  *
  * - Retrieving fscrypt master keys from process-subscribed keyrings
@@ -283,7 +283,7 @@ static int setup_v1_file_key_derived(struct fscrypt_info *ci,
 	if (err)
 		goto out;
 
-	err = fscrypt_set_derived_key(ci, derived_key);
+	err = fscrypt_set_per_file_enc_key(ci, derived_key);
 out:
 	kzfree(derived_key);
 	return err;
-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
