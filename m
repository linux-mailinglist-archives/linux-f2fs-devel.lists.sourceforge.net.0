Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B19E5AD6082
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Jun 2025 23:00:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F0Rknz3GwRKDm2CB8INubpUQJ6wRRQuynbl4EFzzxLw=; b=aKwU5pyzN/Ocz7PgVmmV4t25Jq
	I1Gdt1CwIHUX3PdupjjrQ3rHZLU4JxN0jUOOpzJbh0p6y3hlIkOC441RP4uicew7v3F/OfCvQz4sm
	M+TUi3TkTfOP0cfTCqvP8C9xguDWRnyrHAc4jsNJ+NJvzutbdCUSyfBZYHyEYTGWzoyg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPSYn-0002Kn-Up;
	Wed, 11 Jun 2025 21:00:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1uPSYn-0002Kg-0D
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jun 2025 21:00:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E7PQf49Y0eYnCUaRiiff3IQCCzuGLqeGpnGoL3oO8uM=; b=J5zGF8xaOUWX+D/Nb9rA4w3F63
 u7OSwOzibOxLhQDogTGFipjrCqoagVigdZpD0kb3GFeA50jJrzt2DRcGEgg6H9PCwk9fRqY5T7Lml
 2AQfDbJaZGpl1QN+qUMEcVEqdZXBVreRO/ogkxYFJyltomt5dp3TRbWoQpnXsBaBTJP8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=E7PQf49Y0eYnCUaRiiff3IQCCzuGLqeGpnGoL3oO8uM=; b=J
 hbeTfdyJn2urY4URVqIIw+pdt2eQNdEr6Q3CVN8vwObHY4j8lxoYW2mOvIDlNpg2YnHLpm2/HXr5Z
 k8kQjrcLpwSuFEfd0OTTFEDddh59rnj7vAyqnqDx2sQjXRyrekZHuhPrmaCI5ksV0ywOzaRibrR9F
 WKgPcNYC0HbMqwNQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPSYm-0005Nk-8H for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jun 2025 21:00:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 24F9D5C62E2;
 Wed, 11 Jun 2025 20:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C44C4CEE3;
 Wed, 11 Jun 2025 21:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749675630;
 bh=ufdekVOYWt8m3xq4jkK/O28QDQm1sAnVWeCFEjZjOhw=;
 h=From:To:Cc:Subject:Date:From;
 b=RvTiMFEpxUD4MzFZRsyUdiXQH0upKQl4nEyPUOFBiaCI7vET0SorY8i8il3dXTZMS
 edik1QH0PF4rSwwha/q0PR7wYYxOagItYezlwJgpK2qU3A44yrdFiIKbRDLx33D57E
 GO2Gg1p8X4GPddbngPnV/fuclAPMmULwzEV/3wrgXFmDr9vaR4DIPiYQcdPn87+/XJ
 agWoe8yQStLctGQfdX3PTZAqQ/R/mC6GsqUBQQt1jAl/qFIVvNX1PgLTGjjO7hORJi
 Z1JnvyWIf2cmCGyowvkW8AwGDJ0tTuplmjW3s/i67PvKd1LfzTh5puWEIvdV3H5GQM
 E2hR+5dqNIs8g==
To: linux-fscrypt@vger.kernel.org
Date: Wed, 11 Jun 2025 13:58:59 -0700
Message-ID: <20250611205859.80819-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Spam-Score: 2.2 (++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Eric Biggers <ebiggers@google.com> fscrypt has never
 properly supported the old-school Crypto API hardware offload drivers, as
 it processes each request synchronously. There was one report of someone
 successfully using such a driver 8 [...] 
 Content analysis details:   (2.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uPSYm-0005Nk-8H
Subject: [f2fs-dev] [PATCH] fscrypt: don't use hardware offload Crypto API
 drivers
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

fscrypt has never properly supported the old-school Crypto API hardware
offload drivers, as it processes each request synchronously.  There was
one report of someone successfully using such a driver 8 years ago.  But
otherwise this style of hardware offload is basically obsolete and has
been superseded by hardware-accelerated crypto instructions directly on
the CPU as well as inline storage encryption (UFS/eMMC).  Since then,
all I've gotten are issue reports where someone accidentally used a
buggy offload driver and it caused a problem for them, for example:

- https://lore.kernel.org/r/PH0PR02MB731916ECDB6C613665863B6CFFAA2@PH0PR02MB7319.namprd02.prod.outlook.com
- https://github.com/google/fscryptctl/issues/32

To protect users from these buggy and seemingly unhelpful drivers that I
have no way of testing, let's make fscrypt not use them.  Unfortunately
there is no direct support for doing so in the Crypto API, but we can
achieve something very close to it by disallowing algorithms that have
ASYNC, ALLOCATES_MEMORY, or KERN_DRIVER_ONLY set.

Disallowing ASYNC has the bonus that the code that waits for
asynchronous requests to complete is no longer necessary.

Note that for years dm-crypt has already had most of these drivers
disabled, as it disallows algorithms with ALLOCATES_MEMORY.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/crypto.c          |  7 +++----
 fs/crypto/fname.c           | 18 ++++++++----------
 fs/crypto/fscrypt_private.h | 14 ++++++++++++++
 fs/crypto/hkdf.c            |  2 +-
 fs/crypto/keysetup.c        |  3 ++-
 fs/crypto/keysetup_v1.c     | 12 ++++++------
 6 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index b74b5937e695c..0acb440ae9723 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -111,11 +111,10 @@ int fscrypt_crypt_data_unit(const struct fscrypt_inode_info *ci,
 			    unsigned int len, unsigned int offs,
 			    gfp_t gfp_flags)
 {
 	union fscrypt_iv iv;
 	struct skcipher_request *req = NULL;
-	DECLARE_CRYPTO_WAIT(wait);
 	struct scatterlist dst, src;
 	struct crypto_skcipher *tfm = ci->ci_enc_key.tfm;
 	int res = 0;
 
 	if (WARN_ON_ONCE(len <= 0))
@@ -129,21 +128,21 @@ int fscrypt_crypt_data_unit(const struct fscrypt_inode_info *ci,
 	if (!req)
 		return -ENOMEM;
 
 	skcipher_request_set_callback(
 		req, CRYPTO_TFM_REQ_MAY_BACKLOG | CRYPTO_TFM_REQ_MAY_SLEEP,
-		crypto_req_done, &wait);
+		NULL, NULL);
 
 	sg_init_table(&dst, 1);
 	sg_set_page(&dst, dest_page, len, offs);
 	sg_init_table(&src, 1);
 	sg_set_page(&src, src_page, len, offs);
 	skcipher_request_set_crypt(req, &src, &dst, len, &iv);
 	if (rw == FS_DECRYPT)
-		res = crypto_wait_req(crypto_skcipher_decrypt(req), &wait);
+		res = crypto_skcipher_decrypt(req);
 	else
-		res = crypto_wait_req(crypto_skcipher_encrypt(req), &wait);
+		res = crypto_skcipher_encrypt(req);
 	skcipher_request_free(req);
 	if (res) {
 		fscrypt_err(ci->ci_inode,
 			    "%scryption failed for data unit %llu: %d",
 			    (rw == FS_DECRYPT ? "De" : "En"), index, res);
diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index 010f9c0a4c2f1..6365070211c02 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -91,11 +91,10 @@ static inline bool fscrypt_is_dot_dotdot(const struct qstr *str)
  */
 int fscrypt_fname_encrypt(const struct inode *inode, const struct qstr *iname,
 			  u8 *out, unsigned int olen)
 {
 	struct skcipher_request *req = NULL;
-	DECLARE_CRYPTO_WAIT(wait);
 	const struct fscrypt_inode_info *ci = inode->i_crypt_info;
 	struct crypto_skcipher *tfm = ci->ci_enc_key.tfm;
 	union fscrypt_iv iv;
 	struct scatterlist sg;
 	int res;
@@ -114,18 +113,18 @@ int fscrypt_fname_encrypt(const struct inode *inode, const struct qstr *iname,
 
 	/* Set up the encryption request */
 	req = skcipher_request_alloc(tfm, GFP_NOFS);
 	if (!req)
 		return -ENOMEM;
-	skcipher_request_set_callback(req,
-			CRYPTO_TFM_REQ_MAY_BACKLOG | CRYPTO_TFM_REQ_MAY_SLEEP,
-			crypto_req_done, &wait);
+	skcipher_request_set_callback(
+		req, CRYPTO_TFM_REQ_MAY_BACKLOG | CRYPTO_TFM_REQ_MAY_SLEEP,
+		NULL, NULL);
 	sg_init_one(&sg, out, olen);
 	skcipher_request_set_crypt(req, &sg, &sg, olen, &iv);
 
 	/* Do the encryption */
-	res = crypto_wait_req(crypto_skcipher_encrypt(req), &wait);
+	res = crypto_skcipher_encrypt(req);
 	skcipher_request_free(req);
 	if (res < 0) {
 		fscrypt_err(inode, "Filename encryption failed: %d", res);
 		return res;
 	}
@@ -147,33 +146,32 @@ EXPORT_SYMBOL_GPL(fscrypt_fname_encrypt);
 static int fname_decrypt(const struct inode *inode,
 			 const struct fscrypt_str *iname,
 			 struct fscrypt_str *oname)
 {
 	struct skcipher_request *req = NULL;
-	DECLARE_CRYPTO_WAIT(wait);
 	struct scatterlist src_sg, dst_sg;
 	const struct fscrypt_inode_info *ci = inode->i_crypt_info;
 	struct crypto_skcipher *tfm = ci->ci_enc_key.tfm;
 	union fscrypt_iv iv;
 	int res;
 
 	/* Allocate request */
 	req = skcipher_request_alloc(tfm, GFP_NOFS);
 	if (!req)
 		return -ENOMEM;
-	skcipher_request_set_callback(req,
-		CRYPTO_TFM_REQ_MAY_BACKLOG | CRYPTO_TFM_REQ_MAY_SLEEP,
-		crypto_req_done, &wait);
+	skcipher_request_set_callback(
+		req, CRYPTO_TFM_REQ_MAY_BACKLOG | CRYPTO_TFM_REQ_MAY_SLEEP,
+		NULL, NULL);
 
 	/* Initialize IV */
 	fscrypt_generate_iv(&iv, 0, ci);
 
 	/* Create decryption request */
 	sg_init_one(&src_sg, iname->name, iname->len);
 	sg_init_one(&dst_sg, oname->name, oname->len);
 	skcipher_request_set_crypt(req, &src_sg, &dst_sg, iname->len, &iv);
-	res = crypto_wait_req(crypto_skcipher_decrypt(req), &wait);
+	res = crypto_skcipher_decrypt(req);
 	skcipher_request_free(req);
 	if (res < 0) {
 		fscrypt_err(inode, "Filename decryption failed: %d", res);
 		return res;
 	}
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index c1d92074b65c5..e9acf96f76739 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -43,10 +43,24 @@
  * hardware-wrapped keys has made it misleading as it's only for raw keys.
  * Don't use it in kernel code; use one of the above constants instead.
  */
 #undef FSCRYPT_MAX_KEY_SIZE
 
+/*
+ * This mask is passed as the third argument to crypto_alloc_*() functions to
+ * disallow CryptoAPI algorithm implementations that have any of these flags
+ * set.  This ensures that fscrypt uses only either well-tested "software"
+ * crypto (which these days is usually hardware-accelerated by specialized CPU
+ * instructions) or an inline encryption engine, not obsolete dedicated crypto
+ * accelerators.  Dedicated crypto accelerators often have buggy drivers and/or
+ * are slower than the "software" crypto, and fscrypt has never really been able
+ * to properly take advantage of them, as it en/decrypts data synchronously.
+ */
+#define FSCRYPT_CRYPTOAPI_MASK                            \
+	(CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY | \
+	 CRYPTO_ALG_KERN_DRIVER_ONLY)
+
 #define FSCRYPT_CONTEXT_V1	1
 #define FSCRYPT_CONTEXT_V2	2
 
 /* Keep this in sync with include/uapi/linux/fscrypt.h */
 #define FSCRYPT_MODE_MAX	FSCRYPT_MODE_AES_256_HCTR2
diff --git a/fs/crypto/hkdf.c b/fs/crypto/hkdf.c
index 0f3028adc9c72..5b9c21cfe2b45 100644
--- a/fs/crypto/hkdf.c
+++ b/fs/crypto/hkdf.c
@@ -56,11 +56,11 @@ int fscrypt_init_hkdf(struct fscrypt_hkdf *hkdf, const u8 *master_key,
 	struct crypto_shash *hmac_tfm;
 	static const u8 default_salt[HKDF_HASHLEN];
 	u8 prk[HKDF_HASHLEN];
 	int err;
 
-	hmac_tfm = crypto_alloc_shash(HKDF_HMAC_ALG, 0, 0);
+	hmac_tfm = crypto_alloc_shash(HKDF_HMAC_ALG, 0, FSCRYPT_CRYPTOAPI_MASK);
 	if (IS_ERR(hmac_tfm)) {
 		fscrypt_err(NULL, "Error allocating " HKDF_HMAC_ALG ": %ld",
 			    PTR_ERR(hmac_tfm));
 		return PTR_ERR(hmac_tfm);
 	}
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index 0d71843af9469..d8113a7196979 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -101,11 +101,12 @@ fscrypt_allocate_skcipher(struct fscrypt_mode *mode, const u8 *raw_key,
 			  const struct inode *inode)
 {
 	struct crypto_skcipher *tfm;
 	int err;
 
-	tfm = crypto_alloc_skcipher(mode->cipher_str, 0, 0);
+	tfm = crypto_alloc_skcipher(mode->cipher_str, 0,
+				    FSCRYPT_CRYPTOAPI_MASK);
 	if (IS_ERR(tfm)) {
 		if (PTR_ERR(tfm) == -ENOENT) {
 			fscrypt_warn(inode,
 				     "Missing crypto API support for %s (API name: \"%s\")",
 				     mode->friendly_name, mode->cipher_str);
diff --git a/fs/crypto/keysetup_v1.c b/fs/crypto/keysetup_v1.c
index b70521c55132b..3fdf174384f3d 100644
--- a/fs/crypto/keysetup_v1.c
+++ b/fs/crypto/keysetup_v1.c
@@ -48,13 +48,13 @@ static int derive_key_aes(const u8 *master_key,
 			  const u8 nonce[FSCRYPT_FILE_NONCE_SIZE],
 			  u8 *derived_key, unsigned int derived_keysize)
 {
 	int res = 0;
 	struct skcipher_request *req = NULL;
-	DECLARE_CRYPTO_WAIT(wait);
 	struct scatterlist src_sg, dst_sg;
-	struct crypto_skcipher *tfm = crypto_alloc_skcipher("ecb(aes)", 0, 0);
+	struct crypto_skcipher *tfm =
+		crypto_alloc_skcipher("ecb(aes)", 0, FSCRYPT_CRYPTOAPI_MASK);
 
 	if (IS_ERR(tfm)) {
 		res = PTR_ERR(tfm);
 		tfm = NULL;
 		goto out;
@@ -63,22 +63,22 @@ static int derive_key_aes(const u8 *master_key,
 	req = skcipher_request_alloc(tfm, GFP_KERNEL);
 	if (!req) {
 		res = -ENOMEM;
 		goto out;
 	}
-	skcipher_request_set_callback(req,
-			CRYPTO_TFM_REQ_MAY_BACKLOG | CRYPTO_TFM_REQ_MAY_SLEEP,
-			crypto_req_done, &wait);
+	skcipher_request_set_callback(
+		req, CRYPTO_TFM_REQ_MAY_BACKLOG | CRYPTO_TFM_REQ_MAY_SLEEP,
+		NULL, NULL);
 	res = crypto_skcipher_setkey(tfm, nonce, FSCRYPT_FILE_NONCE_SIZE);
 	if (res < 0)
 		goto out;
 
 	sg_init_one(&src_sg, master_key, derived_keysize);
 	sg_init_one(&dst_sg, derived_key, derived_keysize);
 	skcipher_request_set_crypt(req, &src_sg, &dst_sg, derived_keysize,
 				   NULL);
-	res = crypto_wait_req(crypto_skcipher_encrypt(req), &wait);
+	res = crypto_skcipher_encrypt(req);
 out:
 	skcipher_request_free(req);
 	crypto_free_skcipher(tfm);
 	return res;
 }

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
