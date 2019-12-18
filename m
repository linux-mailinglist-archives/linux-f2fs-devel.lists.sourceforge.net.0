Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26ACC124B02
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Dec 2019 16:13:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jsLQjvqGIcWLQtbqCccTYi40xiro920gdoGJfBW56ZU=; b=gZl6/Dv8qcpBWmfX075GdwpWH
	tr7jNbos853Fu2hefUYIXhQzyu9iQl0zMxnorpcsZDB72FXIrpI5RDriPlhCevKJA0q6TUs2PafRU
	Ygi77ntD7HVFpyi6MBEgJUKAeUADwl4WGNbkSkYpzrDIzomP0ZTXslhqc1JRRs7AO0mYw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ihb17-00078Q-SU; Wed, 18 Dec 2019 15:13:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3NT36XQYKAI4AsBGsBy66y3w.u64@flex--satyat.bounces.google.com>)
 id 1ihb12-000782-VU
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 15:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MD9iODfGdrdneW0lEheldLxnQvOrzagJeVUS8KyRsys=; b=exWvKPGMGpHQ8cSioGtuOQiOu
 28QzzPHIy7GXiC0FKxGdVcE7Auu7tHlJQ0rjKULwlw9m6wtp7Jjnm2/kUZ3aaqC/nxyZzPobB7dS0
 2vOetvYek2kLvyQaK4icokcf6AkOtfsPnFgSs8MEASl2BItv8l/ZaA2VKstBW2HYnKYJ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MD9iODfGdrdneW0lEheldLxnQvOrzagJeVUS8KyRsys=; b=U5Av7OawQKCkLnRwZOljzsgnqs
 MSM7ssn+tgxiK9FetOLA6JY8elIYQ84zLEVj1kV85nkpQq43WRc5jdLKCOEjNuNC8rkX3CoLrxZef
 yf79ml8OtDdEzZrXltpyEtDjY5jz0foCEgphM25j0H4nyffWvYAStHxszkagoWOBqlj0=;
Received: from mail-pl1-f201.google.com ([209.85.214.201])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ihb0x-008vA1-F3
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 15:13:30 +0000
Received: by mail-pl1-f201.google.com with SMTP id b8so1290817plz.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Dec 2019 07:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=MD9iODfGdrdneW0lEheldLxnQvOrzagJeVUS8KyRsys=;
 b=IB2O7WAiewN4A3bPqURKAE9KNJuaIwv4j21/rmNOzYDtA0eUwIWGSVyiXcdsgT03vN
 b2zRI9dpV/YyG8DQRYk2qO6tAI10ic9tlG3MFX8KzSKGqtMiFeZEyeamjVjQ1PMRpVPS
 DkY33cfOucBoSUeMviuFfnEgfogUXIW1p3tSJ44fq8tYBojXMdKJt2cDVCecHGkTu1QQ
 N9FXbagolHGi56jE5qWV37MRlEgeMxFaaNBVRG6JA93e0lElF1RSZagVPNc/xD0fM/Su
 XHVMxvm+UFfhGZqiBSwYVk60oFzpifn3ArdR2qtAjyN5bimZ3hOpD31W4dv28Q6CbRSh
 /Fdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=MD9iODfGdrdneW0lEheldLxnQvOrzagJeVUS8KyRsys=;
 b=dfDDSbvTuEM2GCkZy+LXiXoC+NgZtW9fLCtPq/BmPHXgBNh8IuMQSpKKynGZNmTzCv
 KbGZ0hMyOZ0K66itZvwl/LZ95R35II6XV7l9kTrbVg2YyGD/IZaB74AtsGmqctz/2dBg
 7sR71kHhumRnW31Emv0+a0Ips8VsRyB7xhmSN2N0V6c+PiMyjIdiVs/MjG1MLBJJk8g+
 PTB2m4ww/YYWigwtzpRlkt+PddvfnZZk38aaHX2llTyFSt70Y0Wk1Exn0csX8k3Q8A1+
 OmSnDUtbvq/oENhjSZnhfILXkT/a/o5Cdoml/+UFtFkAGwxdry3yaoKyh596FXaThXm2
 tKVQ==
X-Gm-Message-State: APjAAAXBFrkLGlup9nemTaCCHO4fQDurWBFiNE6M0IWYE4m9dIayh9oO
 W36e+zBuvegHQFR7IbogkqHSMA2Vgao=
X-Google-Smtp-Source: APXvYqwjBjJkjPC7oIXF8g8/ZxkJYCMiXgWdeNLkOP63NOOlgWfSwJIYEhNhq5dmTKZKgwKiIkOLRi2lg7I=
X-Received: by 2002:a65:680f:: with SMTP id l15mr3606741pgt.307.1576680757404; 
 Wed, 18 Dec 2019 06:52:37 -0800 (PST)
Date: Wed, 18 Dec 2019 06:51:34 -0800
In-Reply-To: <20191218145136.172774-1-satyat@google.com>
Message-Id: <20191218145136.172774-8-satyat@google.com>
Mime-Version: 1.0
References: <20191218145136.172774-1-satyat@google.com>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -8.0 (--------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.201 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.201 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ihb0x-008vA1-F3
Subject: [f2fs-dev] [PATCH v6 7/9] fscrypt: add inline encryption support
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: Kuohong Wang <kuohong.wang@mediatek.com>,
 Satya Tangirala <satyat@google.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Eric Biggers <ebiggers@google.com>, Kim Boojin <boojin.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add support for inline encryption to fs/crypto/.  With "inline
encryption", the block layer handles the decryption/encryption as part
of the bio, instead of the filesystem doing the crypto itself via
Linux's crypto API.  This model is needed in order to take advantage of
the inline encryption hardware present on most modern mobile SoCs.

To use inline encryption, the filesystem needs to be mounted with
'-o inlinecrypt'.  The contents of any encrypted files will then be
encrypted using blk-crypto, instead of using the traditional
filesystem-layer crypto. Fscrypt still provides the key and IV to use,
and the actual ciphertext on-disk is still the same; therefore it's
testable using the existing fscrypt ciphertext verification tests.

Note that since blk-crypto has a fallack to Linux's crypto API, and
also supports all the encryption modes currently supported by fscrypt,
this feature is usable and testable even without actual inline
encryption hardware.

Per-filesystem changes will be needed to set encryption contexts when
submitting bios and to implement the 'inlinecrypt' mount option.  This
patch just adds the common code.

Co-developed-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
---
 fs/crypto/Kconfig           |   6 +
 fs/crypto/Makefile          |   1 +
 fs/crypto/bio.c             |  28 +++-
 fs/crypto/crypto.c          |   2 +-
 fs/crypto/fname.c           |   4 +-
 fs/crypto/fscrypt_private.h | 122 ++++++++++++--
 fs/crypto/inline_crypt.c    | 319 ++++++++++++++++++++++++++++++++++++
 fs/crypto/keyring.c         |   4 +-
 fs/crypto/keysetup.c        | 102 ++++++++----
 fs/crypto/keysetup_v1.c     |  16 +-
 include/linux/fscrypt.h     |  58 +++++++
 11 files changed, 591 insertions(+), 71 deletions(-)
 create mode 100644 fs/crypto/inline_crypt.c

diff --git a/fs/crypto/Kconfig b/fs/crypto/Kconfig
index ff5a1746cbae..5061aa546202 100644
--- a/fs/crypto/Kconfig
+++ b/fs/crypto/Kconfig
@@ -16,3 +16,9 @@ config FS_ENCRYPTION
 	  efficient since it avoids caching the encrypted and
 	  decrypted pages in the page cache.  Currently Ext4,
 	  F2FS and UBIFS make use of this feature.
+
+config FS_ENCRYPTION_INLINE_CRYPT
+	bool "Enable fscrypt to use inline crypto"
+	depends on FS_ENCRYPTION && BLK_INLINE_ENCRYPTION
+	help
+	  Enable fscrypt to use inline encryption hardware if available.
diff --git a/fs/crypto/Makefile b/fs/crypto/Makefile
index 232e2bb5a337..652c7180ec6d 100644
--- a/fs/crypto/Makefile
+++ b/fs/crypto/Makefile
@@ -11,3 +11,4 @@ fscrypto-y := crypto.o \
 	      policy.o
 
 fscrypto-$(CONFIG_BLOCK) += bio.o
+fscrypto-$(CONFIG_FS_ENCRYPTION_INLINE_CRYPT) += inline_crypt.o
diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index 1f4b8a277060..d28d8e803554 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -46,26 +46,35 @@ int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 {
 	const unsigned int blockbits = inode->i_blkbits;
 	const unsigned int blocksize = 1 << blockbits;
+	const bool inlinecrypt = fscrypt_inode_uses_inline_crypto(inode);
 	struct page *ciphertext_page;
 	struct bio *bio;
 	int ret, err = 0;
 
-	ciphertext_page = fscrypt_alloc_bounce_page(GFP_NOWAIT);
-	if (!ciphertext_page)
-		return -ENOMEM;
+	if (inlinecrypt) {
+		ciphertext_page = ZERO_PAGE(0);
+	} else {
+		ciphertext_page = fscrypt_alloc_bounce_page(GFP_NOWAIT);
+		if (!ciphertext_page)
+			return -ENOMEM;
+	}
 
 	while (len--) {
-		err = fscrypt_crypt_block(inode, FS_ENCRYPT, lblk,
-					  ZERO_PAGE(0), ciphertext_page,
-					  blocksize, 0, GFP_NOFS);
-		if (err)
-			goto errout;
+		if (!inlinecrypt) {
+			err = fscrypt_crypt_block(inode, FS_ENCRYPT, lblk,
+						  ZERO_PAGE(0), ciphertext_page,
+						  blocksize, 0, GFP_NOFS);
+			if (err)
+				goto errout;
+		}
 
 		bio = bio_alloc(GFP_NOWAIT, 1);
 		if (!bio) {
 			err = -ENOMEM;
 			goto errout;
 		}
+		fscrypt_set_bio_crypt_ctx(bio, inode, lblk, GFP_NOIO);
+
 		bio_set_dev(bio, inode->i_sb->s_bdev);
 		bio->bi_iter.bi_sector = pblk << (blockbits - 9);
 		bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
@@ -87,7 +96,8 @@ int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 	}
 	err = 0;
 errout:
-	fscrypt_free_bounce_page(ciphertext_page);
+	if (!inlinecrypt)
+		fscrypt_free_bounce_page(ciphertext_page);
 	return err;
 }
 EXPORT_SYMBOL(fscrypt_zeroout_range);
diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 3719efa546c6..7549d76a0aba 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -97,7 +97,7 @@ int fscrypt_crypt_block(const struct inode *inode, fscrypt_direction_t rw,
 	DECLARE_CRYPTO_WAIT(wait);
 	struct scatterlist dst, src;
 	struct fscrypt_info *ci = inode->i_crypt_info;
-	struct crypto_skcipher *tfm = ci->ci_ctfm;
+	struct crypto_skcipher *tfm = ci->ci_key.tfm;
 	int res = 0;
 
 	if (WARN_ON_ONCE(len <= 0))
diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index 3da3707c10e3..3aafddaab703 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -40,7 +40,7 @@ int fname_encrypt(struct inode *inode, const struct qstr *iname,
 	struct skcipher_request *req = NULL;
 	DECLARE_CRYPTO_WAIT(wait);
 	struct fscrypt_info *ci = inode->i_crypt_info;
-	struct crypto_skcipher *tfm = ci->ci_ctfm;
+	struct crypto_skcipher *tfm = ci->ci_key.tfm;
 	union fscrypt_iv iv;
 	struct scatterlist sg;
 	int res;
@@ -93,7 +93,7 @@ static int fname_decrypt(struct inode *inode,
 	DECLARE_CRYPTO_WAIT(wait);
 	struct scatterlist src_sg, dst_sg;
 	struct fscrypt_info *ci = inode->i_crypt_info;
-	struct crypto_skcipher *tfm = ci->ci_ctfm;
+	struct crypto_skcipher *tfm = ci->ci_key.tfm;
 	union fscrypt_iv iv;
 	int res;
 
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 130b50e5a011..7005dbe6bfec 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -13,6 +13,7 @@
 
 #include <linux/fscrypt.h>
 #include <crypto/hash.h>
+#include <linux/bio-crypt-ctx.h>
 
 #define CONST_STRLEN(str)	(sizeof(str) - 1)
 
@@ -151,6 +152,20 @@ struct fscrypt_symlink_data {
 	char encrypted_path[1];
 } __packed;
 
+/**
+ * struct fscrypt_prepared_key - a key prepared for actual encryption/decryption
+ * @tfm: crypto API transform object
+ * @blk_key: key for blk-crypto
+ *
+ * Normally only one of the fields will be non-NULL.
+ */
+struct fscrypt_prepared_key {
+	struct crypto_skcipher *tfm;
+#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
+	struct fscrypt_blk_crypto_key *blk_key;
+#endif
+};
+
 /*
  * fscrypt_info - the "encryption key" for an inode
  *
@@ -160,12 +175,20 @@ struct fscrypt_symlink_data {
  */
 struct fscrypt_info {
 
-	/* The actual crypto transform used for encryption and decryption */
-	struct crypto_skcipher *ci_ctfm;
+	/* The key in a form prepared for actual encryption/decryption */
+	struct fscrypt_prepared_key	ci_key;
 
 	/* True if the key should be freed when this fscrypt_info is freed */
 	bool ci_owns_key;
 
+#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
+	/*
+	 * True if this inode will use inline encryption (blk-crypto) instead of
+	 * the traditional filesystem-layer encryption.
+	 */
+	bool ci_inlinecrypt;
+#endif
+
 	/*
 	 * Encryption mode used for this inode.  It corresponds to either the
 	 * contents or filenames encryption mode, depending on the inode type.
@@ -190,7 +213,7 @@ struct fscrypt_info {
 
 	/*
 	 * If non-NULL, then encryption is done using the master key directly
-	 * and ci_ctfm will equal ci_direct_key->dk_ctfm.
+	 * and ci_key will equal ci_direct_key->dk_key.
 	 */
 	struct fscrypt_direct_key *ci_direct_key;
 
@@ -254,6 +277,7 @@ union fscrypt_iv {
 		u8 nonce[FS_KEY_DERIVATION_NONCE_SIZE];
 	};
 	u8 raw[FSCRYPT_MAX_IV_SIZE];
+	__le64 dun[FSCRYPT_MAX_IV_SIZE / sizeof(__le64)];
 };
 
 void fscrypt_generate_iv(union fscrypt_iv *iv, u64 lblk_num,
@@ -293,6 +317,76 @@ extern int fscrypt_hkdf_expand(struct fscrypt_hkdf *hkdf, u8 context,
 
 extern void fscrypt_destroy_hkdf(struct fscrypt_hkdf *hkdf);
 
+/* inline_crypt.c */
+#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
+extern void fscrypt_select_encryption_impl(struct fscrypt_info *ci);
+
+static inline bool
+fscrypt_using_inline_encryption(const struct fscrypt_info *ci)
+{
+	return ci->ci_inlinecrypt;
+}
+
+extern int fscrypt_prepare_inline_crypt_key(
+					struct fscrypt_prepared_key *prep_key,
+					const u8 *raw_key,
+					const struct fscrypt_info *ci);
+
+extern void fscrypt_destroy_inline_crypt_key(
+					struct fscrypt_prepared_key *prep_key);
+
+/*
+ * Check whether the crypto transform or blk-crypto key has been allocated in
+ * @prep_key, depending on which encryption implementation the file will use.
+ */
+static inline bool
+fscrypt_is_key_prepared(struct fscrypt_prepared_key *prep_key,
+			const struct fscrypt_info *ci)
+{
+	/*
+	 * The READ_ONCE() here pairs with the smp_store_release() in
+	 * fscrypt_prepare_key().  (This only matters for the per-mode keys,
+	 * which are shared by multiple inodes.)
+	 */
+	if (fscrypt_using_inline_encryption(ci))
+		return READ_ONCE(prep_key->blk_key) != NULL;
+	return READ_ONCE(prep_key->tfm) != NULL;
+}
+
+#else /* CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
+
+static inline void fscrypt_select_encryption_impl(struct fscrypt_info *ci)
+{
+}
+
+static inline bool fscrypt_using_inline_encryption(
+					const struct fscrypt_info *ci)
+{
+	return false;
+}
+
+static inline int
+fscrypt_prepare_inline_crypt_key(struct fscrypt_prepared_key *prep_key,
+				 const u8 *raw_key,
+				 const struct fscrypt_info *ci)
+{
+	WARN_ON(1);
+	return -EOPNOTSUPP;
+}
+
+static inline void
+fscrypt_destroy_inline_crypt_key(struct fscrypt_prepared_key *prep_key)
+{
+}
+
+static inline bool
+fscrypt_is_key_prepared(struct fscrypt_prepared_key *prep_key,
+			const struct fscrypt_info *ci)
+{
+	return READ_ONCE(prep_key->tfm) != NULL;
+}
+#endif /* !CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
+
 /* keyring.c */
 
 /*
@@ -382,14 +476,11 @@ struct fscrypt_master_key {
 	struct list_head	mk_decrypted_inodes;
 	spinlock_t		mk_decrypted_inodes_lock;
 
-	/* Crypto API transforms for DIRECT_KEY policies, allocated on-demand */
-	struct crypto_skcipher	*mk_direct_tfms[__FSCRYPT_MODE_MAX + 1];
+	/* Per-mode keys for DIRECT_KEY policies, allocated on-demand */
+	struct fscrypt_prepared_key mk_direct_keys[__FSCRYPT_MODE_MAX + 1];
 
-	/*
-	 * Crypto API transforms for filesystem-layer implementation of
-	 * IV_INO_LBLK_64 policies, allocated on-demand.
-	 */
-	struct crypto_skcipher	*mk_iv_ino_lblk_64_tfms[__FSCRYPT_MODE_MAX + 1];
+	/* Per-mode keys for IV_INO_LBLK_64 policies, allocated on-demand */
+	struct fscrypt_prepared_key mk_iv_ino_lblk_64_keys[__FSCRYPT_MODE_MAX + 1];
 
 } __randomize_layout;
 
@@ -446,17 +537,22 @@ struct fscrypt_mode {
 	int keysize;
 	int ivsize;
 	int logged_impl_name;
+	enum blk_crypto_mode_num blk_crypto_mode;
 };
 
+extern struct fscrypt_mode fscrypt_modes[];
+
 static inline bool
 fscrypt_mode_supports_direct_key(const struct fscrypt_mode *mode)
 {
 	return mode->ivsize >= offsetofend(union fscrypt_iv, nonce);
 }
 
-extern struct crypto_skcipher *
-fscrypt_allocate_skcipher(struct fscrypt_mode *mode, const u8 *raw_key,
-			  const struct inode *inode);
+extern int fscrypt_prepare_key(struct fscrypt_prepared_key *prep_key,
+			       const u8 *raw_key,
+			       const struct fscrypt_info *ci);
+
+extern void fscrypt_destroy_prepared_key(struct fscrypt_prepared_key *prep_key);
 
 extern int fscrypt_set_derived_key(struct fscrypt_info *ci,
 				   const u8 *derived_key);
diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
new file mode 100644
index 000000000000..aa04e8a7d674
--- /dev/null
+++ b/fs/crypto/inline_crypt.c
@@ -0,0 +1,319 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Inline encryption support for fscrypt
+ *
+ * Copyright 2019 Google LLC
+ */
+
+/*
+ * With "inline encryption", the block layer handles the decryption/encryption
+ * as part of the bio, instead of the filesystem doing the crypto itself via
+ * crypto API.  See Documentation/block/inline-encryption.rst.  fscrypt still
+ * provides the key and IV to use.
+ */
+
+#include <linux/blk-crypto.h>
+#include <linux/blkdev.h>
+#include <linux/buffer_head.h>
+
+#include "fscrypt_private.h"
+
+struct fscrypt_blk_crypto_key {
+	struct blk_crypto_key base;
+	int num_devs;
+	struct request_queue *devs[];
+};
+
+/* Enable inline encryption for this file if supported. */
+void fscrypt_select_encryption_impl(struct fscrypt_info *ci)
+{
+	const struct inode *inode = ci->ci_inode;
+	struct super_block *sb = inode->i_sb;
+
+	/* The file must need contents encryption, not filenames encryption */
+	if (!S_ISREG(inode->i_mode))
+		return;
+
+	/* blk-crypto must implement the needed encryption algorithm */
+	if (ci->ci_mode->blk_crypto_mode == BLK_ENCRYPTION_MODE_INVALID)
+		return;
+
+	/* The filesystem must be mounted with -o inlinecrypt */
+	if (!sb->s_cop->inline_crypt_enabled ||
+	    !sb->s_cop->inline_crypt_enabled(sb))
+		return;
+
+	ci->ci_inlinecrypt = true;
+}
+
+int fscrypt_prepare_inline_crypt_key(struct fscrypt_prepared_key *prep_key,
+				     const u8 *raw_key,
+				     const struct fscrypt_info *ci)
+{
+	const struct inode *inode = ci->ci_inode;
+	struct super_block *sb = inode->i_sb;
+	enum blk_crypto_mode_num crypto_mode = ci->ci_mode->blk_crypto_mode;
+	int num_devs = 1;
+	int queue_refs = 0;
+	struct fscrypt_blk_crypto_key *blk_key;
+	int err;
+	int i;
+
+	if (sb->s_cop->get_num_devices)
+		num_devs = sb->s_cop->get_num_devices(sb);
+	if (WARN_ON(num_devs < 1))
+		return -EINVAL;
+
+	blk_key = kzalloc(struct_size(blk_key, devs, num_devs), GFP_NOFS);
+	if (!blk_key)
+		return -ENOMEM;
+
+	blk_key->num_devs = num_devs;
+	if (num_devs == 1)
+		blk_key->devs[0] = bdev_get_queue(sb->s_bdev);
+	else
+		sb->s_cop->get_devices(sb, blk_key->devs);
+
+	err = blk_crypto_init_key(&blk_key->base, raw_key, crypto_mode,
+				  sb->s_blocksize);
+	if (err) {
+		fscrypt_err(inode, "error %d initializing blk-crypto key", err);
+		goto fail;
+	}
+
+	/*
+	 * We have to start using blk-crypto on all the filesystem's devices.
+	 * We also have to save all the request_queue's for later so that the
+	 * key can be evicted from them.  This is needed because some keys
+	 * aren't destroyed until after the filesystem was already unmounted
+	 * (namely, the per-mode keys in struct fscrypt_master_key).
+	 */
+	for (i = 0; i < num_devs; i++) {
+		if (!blk_get_queue(blk_key->devs[i])) {
+			fscrypt_err(inode, "couldn't get request_queue");
+			err = -EAGAIN;
+			goto fail;
+		}
+		queue_refs++;
+
+		err = blk_crypto_start_using_mode(crypto_mode, sb->s_blocksize,
+						  blk_key->devs[i]);
+		if (err) {
+			fscrypt_err(inode,
+				    "error %d starting to use blk-crypto", err);
+			goto fail;
+		}
+	}
+	/*
+	 * Pairs with READ_ONCE() in fscrypt_is_key_prepared().  (Only matters
+	 * for the per-mode keys, which are shared by multiple inodes.)
+	 */
+	smp_store_release(&prep_key->blk_key, blk_key);
+	return 0;
+
+fail:
+	for (i = 0; i < queue_refs; i++)
+		blk_put_queue(blk_key->devs[i]);
+	kzfree(blk_key);
+	return err;
+}
+
+void fscrypt_destroy_inline_crypt_key(struct fscrypt_prepared_key *prep_key)
+{
+	struct fscrypt_blk_crypto_key *blk_key = prep_key->blk_key;
+	int i;
+
+	if (blk_key) {
+		for (i = 0; i < blk_key->num_devs; i++) {
+			blk_crypto_evict_key(blk_key->devs[i], &blk_key->base);
+			blk_put_queue(blk_key->devs[i]);
+		}
+		kzfree(blk_key);
+	}
+}
+
+/**
+ * fscrypt_inode_uses_inline_crypto - test whether an inode uses inline
+ *				      encryption
+ * @inode: an inode
+ *
+ * Return: true if the inode requires file contents encryption and if the
+ *	   encryption should be done in the block layer via blk-crypto rather
+ *	   than in the filesystem layer.
+ */
+bool fscrypt_inode_uses_inline_crypto(const struct inode *inode)
+{
+	return IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode) &&
+		inode->i_crypt_info->ci_inlinecrypt;
+}
+EXPORT_SYMBOL_GPL(fscrypt_inode_uses_inline_crypto);
+
+/**
+ * fscrypt_inode_uses_fs_layer_crypto - test whether an inode uses fs-layer
+ *					encryption
+ * @inode: an inode
+ *
+ * Return: true if the inode requires file contents encryption and if the
+ *	   encryption should be done in the filesystem layer rather than in the
+ *	   block layer via blk-crypto.
+ */
+bool fscrypt_inode_uses_fs_layer_crypto(const struct inode *inode)
+{
+	return IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode) &&
+		!inode->i_crypt_info->ci_inlinecrypt;
+}
+EXPORT_SYMBOL_GPL(fscrypt_inode_uses_fs_layer_crypto);
+
+static void fscrypt_generate_dun(const struct fscrypt_info *ci, u64 lblk_num,
+				 u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE])
+{
+	union fscrypt_iv iv;
+	int i;
+
+	fscrypt_generate_iv(&iv, lblk_num, ci);
+
+	BUILD_BUG_ON(FSCRYPT_MAX_IV_SIZE > BLK_CRYPTO_MAX_IV_SIZE);
+	memset(dun, 0, BLK_CRYPTO_MAX_IV_SIZE);
+	for (i = 0; i < ci->ci_mode->ivsize/sizeof(dun[0]); i++)
+		dun[i] = le64_to_cpu(iv.dun[i]);
+}
+
+/**
+ * fscrypt_set_bio_crypt_ctx - prepare a file contents bio for inline encryption
+ * @bio: a bio which will eventually be submitted to the file
+ * @inode: the file's inode
+ * @first_lblk: the first file logical block number in the I/O
+ * @gfp_mask: memory allocation flags - these must be a waiting mask so that
+ *					bio_crypt_set_ctx can't fail.
+ *
+ * If the contents of the file should be encrypted (or decrypted) with inline
+ * encryption, then assign the appropriate encryption context to the bio.
+ *
+ * Normally the bio should be newly allocated (i.e. no pages added yet), as
+ * otherwise fscrypt_mergeable_bio() won't work as intended.
+ *
+ * The encryption context will be freed automatically when the bio is freed.
+ */
+void fscrypt_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
+			       u64 first_lblk, gfp_t gfp_mask)
+{
+	const struct fscrypt_info *ci = inode->i_crypt_info;
+	u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE];
+
+	if (!fscrypt_inode_uses_inline_crypto(inode))
+		return;
+
+	fscrypt_generate_dun(ci, first_lblk, dun);
+	bio_crypt_set_ctx(bio, &ci->ci_key.blk_key->base, dun, gfp_mask);
+}
+EXPORT_SYMBOL_GPL(fscrypt_set_bio_crypt_ctx);
+
+/* Extract the inode and logical block number from a buffer_head. */
+static bool bh_get_inode_and_lblk_num(const struct buffer_head *bh,
+				      const struct inode **inode_ret,
+				      u64 *lblk_num_ret)
+{
+	struct page *page = bh->b_page;
+	const struct address_space *mapping;
+	const struct inode *inode;
+
+	/*
+	 * The ext4 journal (jbd2) can submit a buffer_head it directly created
+	 * for a non-pagecache page.  fscrypt doesn't care about these.
+	 */
+	mapping = page_mapping(page);
+	if (!mapping)
+		return false;
+	inode = mapping->host;
+
+	*inode_ret = inode;
+	*lblk_num_ret = ((u64)page->index << (PAGE_SHIFT - inode->i_blkbits)) +
+			(bh_offset(bh) >> inode->i_blkbits);
+	return true;
+}
+
+/**
+ * fscrypt_set_bio_crypt_ctx_bh - prepare a file contents bio for inline
+ *				  encryption
+ * @bio: a bio which will eventually be submitted to the file
+ * @first_bh: the first buffer_head for which I/O will be submitted
+ * @gfp_mask: memory allocation flags
+ *
+ * Same as fscrypt_set_bio_crypt_ctx(), except this takes a buffer_head instead
+ * of an inode and block number directly.
+ */
+void fscrypt_set_bio_crypt_ctx_bh(struct bio *bio,
+				 const struct buffer_head *first_bh,
+				 gfp_t gfp_mask)
+{
+	const struct inode *inode;
+	u64 first_lblk;
+
+	if (bh_get_inode_and_lblk_num(first_bh, &inode, &first_lblk))
+		fscrypt_set_bio_crypt_ctx(bio, inode, first_lblk, gfp_mask);
+}
+EXPORT_SYMBOL_GPL(fscrypt_set_bio_crypt_ctx_bh);
+
+/**
+ * fscrypt_mergeable_bio - test whether data can be added to a bio
+ * @bio: the bio being built up
+ * @inode: the inode for the next part of the I/O
+ * @next_lblk: the next file logical block number in the I/O
+ *
+ * When building a bio which may contain data which should undergo inline
+ * encryption (or decryption) via fscrypt, filesystems should call this function
+ * to ensure that the resulting bio contains only logically contiguous data.
+ * This will return false if the next part of the I/O cannot be merged with the
+ * bio because either the encryption key would be different or the encryption
+ * data unit numbers would be discontiguous.
+ *
+ * fscrypt_set_bio_crypt_ctx() must have already been called on the bio.
+ *
+ * Return: true iff the I/O is mergeable
+ */
+bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
+			   u64 next_lblk)
+{
+	const struct bio_crypt_ctx *bc = bio->bi_crypt_context;
+	u64 next_dun[BLK_CRYPTO_DUN_ARRAY_SIZE];
+
+	if (!!bc != fscrypt_inode_uses_inline_crypto(inode))
+		return false;
+	if (!bc)
+		return true;
+
+	/*
+	 * Comparing the key pointers is good enough, as all I/O for each key
+	 * uses the same pointer.  I.e., there's currently no need to support
+	 * merging requests where the keys are the same but the pointers differ.
+	 */
+	if (bc->bc_key != &inode->i_crypt_info->ci_key.blk_key->base)
+		return false;
+
+	fscrypt_generate_dun(inode->i_crypt_info, next_lblk, next_dun);
+	return bio_crypt_dun_is_contiguous(bc, bio->bi_iter.bi_size, next_dun);
+}
+EXPORT_SYMBOL_GPL(fscrypt_mergeable_bio);
+
+/**
+ * fscrypt_mergeable_bio_bh - test whether data can be added to a bio
+ * @bio: the bio being built up
+ * @next_bh: the next buffer_head for which I/O will be submitted
+ *
+ * Same as fscrypt_mergeable_bio(), except this takes a buffer_head instead of
+ * an inode and block number directly.
+ *
+ * Return: true iff the I/O is mergeable
+ */
+bool fscrypt_mergeable_bio_bh(struct bio *bio,
+			      const struct buffer_head *next_bh)
+{
+	const struct inode *inode;
+	u64 next_lblk;
+
+	if (!bh_get_inode_and_lblk_num(next_bh, &inode, &next_lblk))
+		return !bio->bi_crypt_context;
+
+	return fscrypt_mergeable_bio(bio, inode, next_lblk);
+}
+EXPORT_SYMBOL_GPL(fscrypt_mergeable_bio_bh);
diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index 40cca351273f..54256b24f255 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -44,8 +44,8 @@ static void free_master_key(struct fscrypt_master_key *mk)
 	wipe_master_key_secret(&mk->mk_secret);
 
 	for (i = 0; i <= __FSCRYPT_MODE_MAX; i++) {
-		crypto_free_skcipher(mk->mk_direct_tfms[i]);
-		crypto_free_skcipher(mk->mk_iv_ino_lblk_64_tfms[i]);
+		fscrypt_destroy_prepared_key(&mk->mk_direct_keys[i]);
+		fscrypt_destroy_prepared_key(&mk->mk_iv_ino_lblk_64_keys[i]);
 	}
 
 	key_put(mk->mk_users);
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index f577bb6613f9..92ff4eafaefe 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -13,12 +13,13 @@
 
 #include "fscrypt_private.h"
 
-static struct fscrypt_mode available_modes[] = {
+struct fscrypt_mode fscrypt_modes[] = {
 	[FSCRYPT_MODE_AES_256_XTS] = {
 		.friendly_name = "AES-256-XTS",
 		.cipher_str = "xts(aes)",
 		.keysize = 64,
 		.ivsize = 16,
+		.blk_crypto_mode = BLK_ENCRYPTION_MODE_AES_256_XTS,
 	},
 	[FSCRYPT_MODE_AES_256_CTS] = {
 		.friendly_name = "AES-256-CTS-CBC",
@@ -31,6 +32,7 @@ static struct fscrypt_mode available_modes[] = {
 		.cipher_str = "essiv(cbc(aes),sha256)",
 		.keysize = 16,
 		.ivsize = 16,
+		.blk_crypto_mode = BLK_ENCRYPTION_MODE_AES_128_CBC_ESSIV,
 	},
 	[FSCRYPT_MODE_AES_128_CTS] = {
 		.friendly_name = "AES-128-CTS-CBC",
@@ -43,6 +45,7 @@ static struct fscrypt_mode available_modes[] = {
 		.cipher_str = "adiantum(xchacha12,aes)",
 		.keysize = 32,
 		.ivsize = 32,
+		.blk_crypto_mode = BLK_ENCRYPTION_MODE_ADIANTUM,
 	},
 };
 
@@ -51,10 +54,10 @@ select_encryption_mode(const union fscrypt_policy *policy,
 		       const struct inode *inode)
 {
 	if (S_ISREG(inode->i_mode))
-		return &available_modes[fscrypt_policy_contents_mode(policy)];
+		return &fscrypt_modes[fscrypt_policy_contents_mode(policy)];
 
 	if (S_ISDIR(inode->i_mode) || S_ISLNK(inode->i_mode))
-		return &available_modes[fscrypt_policy_fnames_mode(policy)];
+		return &fscrypt_modes[fscrypt_policy_fnames_mode(policy)];
 
 	WARN_ONCE(1, "fscrypt: filesystem tried to load encryption info for inode %lu, which is not encryptable (file type %d)\n",
 		  inode->i_ino, (inode->i_mode & S_IFMT));
@@ -62,9 +65,9 @@ select_encryption_mode(const union fscrypt_policy *policy,
 }
 
 /* Create a symmetric cipher object for the given encryption mode and key */
-struct crypto_skcipher *fscrypt_allocate_skcipher(struct fscrypt_mode *mode,
-						  const u8 *raw_key,
-						  const struct inode *inode)
+static struct crypto_skcipher *
+fscrypt_allocate_skcipher(struct fscrypt_mode *mode, const u8 *raw_key,
+			  const struct inode *inode)
 {
 	struct crypto_skcipher *tfm;
 	int err;
@@ -104,30 +107,55 @@ struct crypto_skcipher *fscrypt_allocate_skcipher(struct fscrypt_mode *mode,
 	return ERR_PTR(err);
 }
 
-/* Given the per-file key, set up the file's crypto transform object */
-int fscrypt_set_derived_key(struct fscrypt_info *ci, const u8 *derived_key)
+/*
+ * Prepare the crypto transform object or blk-crypto key in @prep_key, given the
+ * raw key, encryption mode, and flag indicating which encryption implementation
+ * (fs-layer or blk-crypto) will be used.
+ */
+int fscrypt_prepare_key(struct fscrypt_prepared_key *prep_key,
+			const u8 *raw_key, const struct fscrypt_info *ci)
 {
 	struct crypto_skcipher *tfm;
 
-	tfm = fscrypt_allocate_skcipher(ci->ci_mode, derived_key, ci->ci_inode);
+	if (fscrypt_using_inline_encryption(ci))
+		return fscrypt_prepare_inline_crypt_key(prep_key, raw_key, ci);
+
+	tfm = fscrypt_allocate_skcipher(ci->ci_mode, raw_key, ci->ci_inode);
 	if (IS_ERR(tfm))
 		return PTR_ERR(tfm);
+	/*
+	 * Pairs with READ_ONCE() in fscrypt_is_key_prepared().  (Only matters
+	 * for the per-mode keys, which are shared by multiple inodes.)
+	 */
+	smp_store_release(&prep_key->tfm, tfm);
+	return 0;
+}
+
+/* Destroy a crypto transform object and/or blk-crypto key. */
+void fscrypt_destroy_prepared_key(struct fscrypt_prepared_key *prep_key)
+{
+	crypto_free_skcipher(prep_key->tfm);
+	fscrypt_destroy_inline_crypt_key(prep_key);
+}
 
-	ci->ci_ctfm = tfm;
+/* Given the per-file key, set up the file's crypto transform object */
+int fscrypt_set_derived_key(struct fscrypt_info *ci, const u8 *derived_key)
+{
 	ci->ci_owns_key = true;
-	return 0;
+	return fscrypt_prepare_key(&ci->ci_key, derived_key, ci);
 }
 
 static int setup_per_mode_key(struct fscrypt_info *ci,
 			      struct fscrypt_master_key *mk,
-			      struct crypto_skcipher **tfms,
+			      struct fscrypt_prepared_key *keys,
 			      u8 hkdf_context, bool include_fs_uuid)
 {
+	static DEFINE_MUTEX(mode_key_setup_mutex);
 	const struct inode *inode = ci->ci_inode;
 	const struct super_block *sb = inode->i_sb;
 	struct fscrypt_mode *mode = ci->ci_mode;
-	u8 mode_num = mode - available_modes;
-	struct crypto_skcipher *tfm, *prev_tfm;
+	const u8 mode_num = mode - fscrypt_modes;
+	struct fscrypt_prepared_key *prep_key;
 	u8 mode_key[FSCRYPT_MAX_KEY_SIZE];
 	u8 hkdf_info[sizeof(mode_num) + sizeof(sb->s_uuid)];
 	unsigned int hkdf_infolen = 0;
@@ -136,10 +164,16 @@ static int setup_per_mode_key(struct fscrypt_info *ci,
 	if (WARN_ON(mode_num > __FSCRYPT_MODE_MAX))
 		return -EINVAL;
 
-	/* pairs with cmpxchg() below */
-	tfm = READ_ONCE(tfms[mode_num]);
-	if (likely(tfm != NULL))
-		goto done;
+	prep_key = &keys[mode_num];
+	if (fscrypt_is_key_prepared(prep_key, ci)) {
+		ci->ci_key = *prep_key;
+		return 0;
+	}
+
+	mutex_lock(&mode_key_setup_mutex);
+
+	if (fscrypt_is_key_prepared(prep_key, ci))
+		goto done_unlock;
 
 	BUILD_BUG_ON(sizeof(mode_num) != 1);
 	BUILD_BUG_ON(sizeof(sb->s_uuid) != 16);
@@ -154,21 +188,17 @@ static int setup_per_mode_key(struct fscrypt_info *ci,
 				  hkdf_context, hkdf_info, hkdf_infolen,
 				  mode_key, mode->keysize);
 	if (err)
-		return err;
-	tfm = fscrypt_allocate_skcipher(mode, mode_key, inode);
+		goto out_unlock;
+	err = fscrypt_prepare_key(prep_key, mode_key, ci);
 	memzero_explicit(mode_key, mode->keysize);
-	if (IS_ERR(tfm))
-		return PTR_ERR(tfm);
-
-	/* pairs with READ_ONCE() above */
-	prev_tfm = cmpxchg(&tfms[mode_num], NULL, tfm);
-	if (prev_tfm != NULL) {
-		crypto_free_skcipher(tfm);
-		tfm = prev_tfm;
-	}
-done:
-	ci->ci_ctfm = tfm;
-	return 0;
+	if (err)
+		goto out_unlock;
+done_unlock:
+	ci->ci_key = *prep_key;
+	err = 0;
+out_unlock:
+	mutex_unlock(&mode_key_setup_mutex);
+	return err;
 }
 
 static int fscrypt_setup_v2_file_key(struct fscrypt_info *ci,
@@ -192,7 +222,7 @@ static int fscrypt_setup_v2_file_key(struct fscrypt_info *ci,
 				     ci->ci_mode->friendly_name);
 			return -EINVAL;
 		}
-		return setup_per_mode_key(ci, mk, mk->mk_direct_tfms,
+		return setup_per_mode_key(ci, mk, mk->mk_direct_keys,
 					  HKDF_CONTEXT_DIRECT_KEY, false);
 	} else if (ci->ci_policy.v2.flags &
 		   FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64) {
@@ -202,7 +232,7 @@ static int fscrypt_setup_v2_file_key(struct fscrypt_info *ci,
 		 * the IVs.  This format is optimized for use with inline
 		 * encryption hardware compliant with the UFS or eMMC standards.
 		 */
-		return setup_per_mode_key(ci, mk, mk->mk_iv_ino_lblk_64_tfms,
+		return setup_per_mode_key(ci, mk, mk->mk_iv_ino_lblk_64_keys,
 					  HKDF_CONTEXT_IV_INO_LBLK_64_KEY,
 					  true);
 	}
@@ -237,6 +267,8 @@ static int setup_file_encryption_key(struct fscrypt_info *ci,
 	struct fscrypt_key_specifier mk_spec;
 	int err;
 
+	fscrypt_select_encryption_impl(ci);
+
 	switch (ci->ci_policy.version) {
 	case FSCRYPT_POLICY_V1:
 		mk_spec.type = FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR;
@@ -329,7 +361,7 @@ static void put_crypt_info(struct fscrypt_info *ci)
 	if (ci->ci_direct_key)
 		fscrypt_put_direct_key(ci->ci_direct_key);
 	else if (ci->ci_owns_key)
-		crypto_free_skcipher(ci->ci_ctfm);
+		fscrypt_destroy_prepared_key(&ci->ci_key);
 
 	key = ci->ci_master_key;
 	if (key) {
diff --git a/fs/crypto/keysetup_v1.c b/fs/crypto/keysetup_v1.c
index 5298ef22aa85..423ee9b64108 100644
--- a/fs/crypto/keysetup_v1.c
+++ b/fs/crypto/keysetup_v1.c
@@ -146,7 +146,7 @@ struct fscrypt_direct_key {
 	struct hlist_node		dk_node;
 	refcount_t			dk_refcount;
 	const struct fscrypt_mode	*dk_mode;
-	struct crypto_skcipher		*dk_ctfm;
+	struct fscrypt_prepared_key	dk_key;
 	u8				dk_descriptor[FSCRYPT_KEY_DESCRIPTOR_SIZE];
 	u8				dk_raw[FSCRYPT_MAX_KEY_SIZE];
 };
@@ -154,7 +154,7 @@ struct fscrypt_direct_key {
 static void free_direct_key(struct fscrypt_direct_key *dk)
 {
 	if (dk) {
-		crypto_free_skcipher(dk->dk_ctfm);
+		fscrypt_destroy_prepared_key(&dk->dk_key);
 		kzfree(dk);
 	}
 }
@@ -199,6 +199,8 @@ find_or_insert_direct_key(struct fscrypt_direct_key *to_insert,
 			continue;
 		if (ci->ci_mode != dk->dk_mode)
 			continue;
+		if (!fscrypt_is_key_prepared(&dk->dk_key, ci))
+			continue;
 		if (crypto_memneq(raw_key, dk->dk_raw, ci->ci_mode->keysize))
 			continue;
 		/* using existing tfm with same (descriptor, mode, raw_key) */
@@ -231,13 +233,9 @@ fscrypt_get_direct_key(const struct fscrypt_info *ci, const u8 *raw_key)
 		return ERR_PTR(-ENOMEM);
 	refcount_set(&dk->dk_refcount, 1);
 	dk->dk_mode = ci->ci_mode;
-	dk->dk_ctfm = fscrypt_allocate_skcipher(ci->ci_mode, raw_key,
-						ci->ci_inode);
-	if (IS_ERR(dk->dk_ctfm)) {
-		err = PTR_ERR(dk->dk_ctfm);
-		dk->dk_ctfm = NULL;
+	err = fscrypt_prepare_key(&dk->dk_key, raw_key, ci);
+	if (err)
 		goto err_free_dk;
-	}
 	memcpy(dk->dk_descriptor, ci->ci_policy.v1.master_key_descriptor,
 	       FSCRYPT_KEY_DESCRIPTOR_SIZE);
 	memcpy(dk->dk_raw, raw_key, ci->ci_mode->keysize);
@@ -274,7 +272,7 @@ static int setup_v1_file_key_direct(struct fscrypt_info *ci,
 	if (IS_ERR(dk))
 		return PTR_ERR(dk);
 	ci->ci_direct_key = dk;
-	ci->ci_ctfm = dk->dk_ctfm;
+	ci->ci_key = dk->dk_key;
 	return 0;
 }
 
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 1a7bffe78ed5..12750090063b 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -64,6 +64,10 @@ struct fscrypt_operations {
 	bool (*has_stable_inodes)(struct super_block *sb);
 	void (*get_ino_and_lblk_bits)(struct super_block *sb,
 				      int *ino_bits_ret, int *lblk_bits_ret);
+	bool (*inline_crypt_enabled)(struct super_block *sb);
+	int (*get_num_devices)(struct super_block *sb);
+	void (*get_devices)(struct super_block *sb,
+			    struct request_queue **devs);
 };
 
 static inline bool fscrypt_has_encryption_key(const struct inode *inode)
@@ -529,6 +533,60 @@ static inline void fscrypt_set_ops(struct super_block *sb,
 
 #endif	/* !CONFIG_FS_ENCRYPTION */
 
+/* inline_crypt.c */
+#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
+extern bool fscrypt_inode_uses_inline_crypto(const struct inode *inode);
+
+extern bool fscrypt_inode_uses_fs_layer_crypto(const struct inode *inode);
+
+extern void fscrypt_set_bio_crypt_ctx(struct bio *bio,
+				      const struct inode *inode,
+				      u64 first_lblk, gfp_t gfp_mask);
+
+extern void fscrypt_set_bio_crypt_ctx_bh(struct bio *bio,
+					 const struct buffer_head *first_bh,
+					 gfp_t gfp_mask);
+
+extern bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
+				  u64 next_lblk);
+
+extern bool fscrypt_mergeable_bio_bh(struct bio *bio,
+				     const struct buffer_head *next_bh);
+
+#else /* CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
+static inline bool fscrypt_inode_uses_inline_crypto(const struct inode *inode)
+{
+	return false;
+}
+
+static inline bool fscrypt_inode_uses_fs_layer_crypto(const struct inode *inode)
+{
+	return IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode);
+}
+
+static inline void fscrypt_set_bio_crypt_ctx(struct bio *bio,
+					     const struct inode *inode,
+					     u64 first_lblk, gfp_t gfp_mask) { }
+
+static inline void fscrypt_set_bio_crypt_ctx_bh(
+					 struct bio *bio,
+					 const struct buffer_head *first_bh,
+					 gfp_t gfp_mask) { }
+
+static inline bool fscrypt_mergeable_bio(struct bio *bio,
+					 const struct inode *inode,
+					 u64 next_lblk)
+{
+	return true;
+}
+
+static inline bool fscrypt_mergeable_bio_bh(struct bio *bio,
+					    const struct buffer_head *next_bh)
+{
+	return true;
+}
+#endif /* !CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
+
 /**
  * fscrypt_require_key - require an inode's encryption key
  * @inode: the inode we need the key for
-- 
2.24.1.735.g03f4e72817-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
