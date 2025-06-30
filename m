Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 451E0AEE5AA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Jun 2025 19:24:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPaAablWXLcH7m7FA+l+/Ai0Mn4NIxJMHMIqJR684kc=; b=PlisRdCRrimNyG6jVVzecuKdKE
	v9XcQiEzLcRkZYrPQqP2V5XYGj8WGdtXF1JJs9edy1lhNt7QcXeftU8k/URJottfEelvDlrasVqAX
	/T6HgfDRpU35YGOIIw2BjX1gengDoZdL6vcDFwUmha0MocsWFPhD15tpCOfE8x5HDun8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWIEr-0000YR-SJ;
	Mon, 30 Jun 2025 17:24:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1uWIEq-0000YH-GW
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 17:24:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jiaqt3Kq22e++2+EmW1YC0ondEWA/kgvZUvSxJ2zk84=; b=jUFsFUnz/4Es876rJSrc9OA8vh
 2iZ0MTjyXxV/VsSjxCmju1kU4jAvG852VwWFvwkPkhClSZ96wFOrFVfmmskC9mhW+mnanu/zu8tR5
 nWHiCU3ONl5KF8mbJz4Y27Xgtit6t0IY5P6OC0ZGS7f5QzGFH1wDPJjyLp9coJVcx1+U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jiaqt3Kq22e++2+EmW1YC0ondEWA/kgvZUvSxJ2zk84=; b=aJ3kncrw1Qi20MWU6AXkaVz64/
 XwwyWBVoyk5Sm3kuJK9lVHnx+SB1UqLRjR3EW/aLbBz91rCfIKIMGB37CMpGS8APYGBOAKit8Qlql
 vVYa1B50XzKfqWjpG+GGYP52qDxGnZBBRFq1gzSHozO4aVv5GSMEHt7aprpK8cXeddf8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uWIEp-0005nV-4Y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 17:24:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AEA255C58F5;
 Mon, 30 Jun 2025 17:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 364FFC4CEF2;
 Mon, 30 Jun 2025 17:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751304249;
 bh=yp3Er/6VfXzjS/b8G0ZBuHpoMbKRiCHKh33gb8emuDs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IhiAAvZ8/KjMWPMOUgBqbAkqUwqCG6gWYYrdIFia4Va2L7C1B4aTrhrk4LbGz3AzN
 id7AydefDEUbdOqs1TkYNEsmfk1gnuUD0uSH/Y0gnQqVXyPQqkdkm8etmjhfxfcW1Y
 dGiu9w0Neg1ng/oxnLx8zhwiFmGpibWvlCXYPmMFl6SS7sjnjlKNgcECzkKSdZBESf
 RuLUSao3FRztHFngSHv3OaLWkKsQksRHThPLVUtyXCXAFDmhCgtkKu88fEwgVhpAE0
 wfwWi4t5MSQwTTuB7YZ+CdGIPnwERs84swWC1E5OV2T47PBXOdF2KWxV0AADqE1Nly
 Fld/vgL76xxLQ==
To: fsverity@lists.linux.dev
Date: Mon, 30 Jun 2025 10:22:24 -0700
Message-ID: <20250630172224.46909-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630172224.46909-1-ebiggers@kernel.org>
References: <20250630172224.46909-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: fsverity supports two hash algorithms: SHA-256 and SHA-512.
 Since both of these have a library API now, just use the library API instead
 of crypto_shash. Even with multiple algorithms, the library-bas [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uWIEp-0005nV-4Y
Subject: [f2fs-dev] [PATCH 2/2] fsverity: Switch from crypto_shash to SHA-2
 library
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
 linux-ext4@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

fsverity supports two hash algorithms: SHA-256 and SHA-512.  Since both
of these have a library API now, just use the library API instead of
crypto_shash.  Even with multiple algorithms, the library-based code
still ends up being quite a bit simpler, due to how clumsy the
old-school crypto API is.  The library-based code is also more
efficient, since it avoids overheads such as indirect calls.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 Documentation/filesystems/fsverity.rst |   3 +-
 fs/verity/Kconfig                      |   6 +-
 fs/verity/enable.c                     |   8 +-
 fs/verity/fsverity_private.h           |  24 +--
 fs/verity/hash_algs.c                  | 194 +++++++++----------------
 fs/verity/open.c                       |  36 ++---
 fs/verity/verify.c                     |   7 +-
 7 files changed, 102 insertions(+), 176 deletions(-)

diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
index dacdbc1149e67..412cf11e32985 100644
--- a/Documentation/filesystems/fsverity.rst
+++ b/Documentation/filesystems/fsverity.rst
@@ -183,12 +183,11 @@ FS_IOC_ENABLE_VERITY can fail with the following errors:
 - ``EKEYREJECTED``: the builtin signature doesn't match the file
 - ``EMSGSIZE``: the salt or builtin signature is too long
 - ``ENOKEY``: the ".fs-verity" keyring doesn't contain the certificate
   needed to verify the builtin signature
 - ``ENOPKG``: fs-verity recognizes the hash algorithm, but it's not
-  available in the kernel's crypto API as currently configured (e.g.
-  for SHA-512, missing CONFIG_CRYPTO_SHA512).
+  available in the kernel as currently configured
 - ``ENOTTY``: this type of filesystem does not implement fs-verity
 - ``EOPNOTSUPP``: the kernel was not configured with fs-verity
   support; or the filesystem superblock has not had the 'verity'
   feature enabled on it; or the filesystem does not support fs-verity
   on this file.  (See `Filesystem support`_.)
diff --git a/fs/verity/Kconfig b/fs/verity/Kconfig
index 40569d3527a71..76d1c5971b826 100644
--- a/fs/verity/Kconfig
+++ b/fs/verity/Kconfig
@@ -1,14 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 
 config FS_VERITY
 	bool "FS Verity (read-only file-based authenticity protection)"
-	select CRYPTO
 	select CRYPTO_HASH_INFO
-	# SHA-256 is selected as it's intended to be the default hash algorithm.
-	# To avoid bloat, other wanted algorithms must be selected explicitly.
-	select CRYPTO_SHA256
+	select CRYPTO_LIB_SHA256
+	select CRYPTO_LIB_SHA512
 	help
 	  This option enables fs-verity.  fs-verity is the dm-verity
 	  mechanism implemented at the file level.  On supported
 	  filesystems (currently ext4, f2fs, and btrfs), userspace can
 	  use an ioctl to enable verity for a file, which causes the
diff --git a/fs/verity/enable.c b/fs/verity/enable.c
index c284f46d1b535..0816ec295c380 100644
--- a/fs/verity/enable.c
+++ b/fs/verity/enable.c
@@ -5,11 +5,10 @@
  * Copyright 2019 Google LLC
  */
 
 #include "fsverity_private.h"
 
-#include <crypto/hash.h>
 #include <linux/mount.h>
 #include <linux/sched/signal.h>
 #include <linux/uaccess.h>
 
 struct block_buffer {
@@ -22,11 +21,10 @@ struct block_buffer {
 static int hash_one_block(struct inode *inode,
 			  const struct merkle_tree_params *params,
 			  struct block_buffer *cur)
 {
 	struct block_buffer *next = cur + 1;
-	int err;
 
 	/*
 	 * Safety check to prevent a buffer overflow in case of a filesystem bug
 	 * that allows the file size to change despite deny_write_access(), or a
 	 * bug in the Merkle tree logic itself
@@ -35,14 +33,12 @@ static int hash_one_block(struct inode *inode,
 		return -EINVAL;
 
 	/* Zero-pad the block if it's shorter than the block size. */
 	memset(&cur->data[cur->filled], 0, params->block_size - cur->filled);
 
-	err = fsverity_hash_block(params, inode, cur->data,
-				  &next->data[next->filled]);
-	if (err)
-		return err;
+	fsverity_hash_block(params, inode, cur->data,
+			    &next->data[next->filled]);
 	next->filled += params->digest_size;
 	cur->filled = 0;
 	return 0;
 }
 
diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index b3506f56e180b..5fe854a5b9ad3 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -18,25 +18,30 @@
  */
 #define FS_VERITY_MAX_LEVELS		8
 
 /* A hash algorithm supported by fs-verity */
 struct fsverity_hash_alg {
-	struct crypto_shash *tfm; /* hash tfm, allocated on demand */
 	const char *name;	  /* crypto API name, e.g. sha256 */
 	unsigned int digest_size; /* digest size in bytes, e.g. 32 for SHA-256 */
 	unsigned int block_size;  /* block size in bytes, e.g. 64 for SHA-256 */
 	/*
 	 * The HASH_ALGO_* constant for this algorithm.  This is different from
 	 * FS_VERITY_HASH_ALG_*, which uses a different numbering scheme.
 	 */
 	enum hash_algo algo_id;
 };
 
+union fsverity_hash_ctx {
+	struct sha256_ctx sha256;
+	struct sha512_ctx sha512;
+};
+
 /* Merkle tree parameters: hash algorithm, initial hash state, and topology */
 struct merkle_tree_params {
 	const struct fsverity_hash_alg *hash_alg; /* the hash algorithm */
-	const u8 *hashstate;		/* initial hash state or NULL */
+	/* initial hash state if salted, NULL if unsalted */
+	const union fsverity_hash_ctx *hashstate;
 	unsigned int digest_size;	/* same as hash_alg->digest_size */
 	unsigned int block_size;	/* size of data and tree blocks */
 	unsigned int hashes_per_block;	/* number of hashes per tree block */
 	unsigned int blocks_per_page;	/* PAGE_SIZE / block_size */
 	u8 log_digestsize;		/* log2(digest_size) */
@@ -74,20 +79,21 @@ struct fsverity_info {
 #define FS_VERITY_MAX_SIGNATURE_SIZE	(FS_VERITY_MAX_DESCRIPTOR_SIZE - \
 					 sizeof(struct fsverity_descriptor))
 
 /* hash_algs.c */
 
-extern struct fsverity_hash_alg fsverity_hash_algs[];
+extern const struct fsverity_hash_alg fsverity_hash_algs[];
 
 const struct fsverity_hash_alg *fsverity_get_hash_alg(const struct inode *inode,
 						      unsigned int num);
-const u8 *fsverity_prepare_hash_state(const struct fsverity_hash_alg *alg,
-				      const u8 *salt, size_t salt_size);
-int fsverity_hash_block(const struct merkle_tree_params *params,
-			const struct inode *inode, const void *data, u8 *out);
-int fsverity_hash_buffer(const struct fsverity_hash_alg *alg,
-			 const void *data, size_t size, u8 *out);
+union fsverity_hash_ctx *
+fsverity_prepare_hash_state(const struct fsverity_hash_alg *alg,
+			    const u8 *salt, size_t salt_size);
+void fsverity_hash_block(const struct merkle_tree_params *params,
+			 const struct inode *inode, const void *data, u8 *out);
+void fsverity_hash_buffer(const struct fsverity_hash_alg *alg,
+			  const void *data, size_t size, u8 *out);
 void __init fsverity_check_hash_algs(void);
 
 /* init.c */
 
 void __printf(3, 4) __cold
diff --git a/fs/verity/hash_algs.c b/fs/verity/hash_algs.c
index 6b08b1d9a7d7c..9bb3c6344907e 100644
--- a/fs/verity/hash_algs.c
+++ b/fs/verity/hash_algs.c
@@ -5,14 +5,12 @@
  * Copyright 2019 Google LLC
  */
 
 #include "fsverity_private.h"
 
-#include <crypto/hash.h>
-
 /* The hash algorithms supported by fs-verity */
-struct fsverity_hash_alg fsverity_hash_algs[] = {
+const struct fsverity_hash_alg fsverity_hash_algs[] = {
 	[FS_VERITY_HASH_ALG_SHA256] = {
 		.name = "sha256",
 		.digest_size = SHA256_DIGEST_SIZE,
 		.block_size = SHA256_BLOCK_SIZE,
 		.algo_id = HASH_ALGO_SHA256,
@@ -23,144 +21,76 @@ struct fsverity_hash_alg fsverity_hash_algs[] = {
 		.block_size = SHA512_BLOCK_SIZE,
 		.algo_id = HASH_ALGO_SHA512,
 	},
 };
 
-static DEFINE_MUTEX(fsverity_hash_alg_init_mutex);
-
 /**
- * fsverity_get_hash_alg() - validate and prepare a hash algorithm
+ * fsverity_get_hash_alg() - get a hash algorithm by number
  * @inode: optional inode for logging purposes
  * @num: the hash algorithm number
  *
- * Get the struct fsverity_hash_alg for the given hash algorithm number, and
- * ensure it has a hash transform ready to go.  The hash transforms are
- * allocated on-demand so that we don't waste resources unnecessarily, and
- * because the crypto modules may be initialized later than fs/verity/.
+ * Get the struct fsverity_hash_alg for the given hash algorithm number.
  *
- * Return: pointer to the hash alg on success, else an ERR_PTR()
+ * Return: pointer to the hash alg if it's known, otherwise NULL.
  */
 const struct fsverity_hash_alg *fsverity_get_hash_alg(const struct inode *inode,
 						      unsigned int num)
 {
-	struct fsverity_hash_alg *alg;
-	struct crypto_shash *tfm;
-	int err;
-
 	if (num >= ARRAY_SIZE(fsverity_hash_algs) ||
 	    !fsverity_hash_algs[num].name) {
 		fsverity_warn(inode, "Unknown hash algorithm number: %u", num);
-		return ERR_PTR(-EINVAL);
-	}
-	alg = &fsverity_hash_algs[num];
-
-	/* pairs with smp_store_release() below */
-	if (likely(smp_load_acquire(&alg->tfm) != NULL))
-		return alg;
-
-	mutex_lock(&fsverity_hash_alg_init_mutex);
-
-	if (alg->tfm != NULL)
-		goto out_unlock;
-
-	tfm = crypto_alloc_shash(alg->name, 0, 0);
-	if (IS_ERR(tfm)) {
-		if (PTR_ERR(tfm) == -ENOENT) {
-			fsverity_warn(inode,
-				      "Missing crypto API support for hash algorithm \"%s\"",
-				      alg->name);
-			alg = ERR_PTR(-ENOPKG);
-			goto out_unlock;
-		}
-		fsverity_err(inode,
-			     "Error allocating hash algorithm \"%s\": %ld",
-			     alg->name, PTR_ERR(tfm));
-		alg = ERR_CAST(tfm);
-		goto out_unlock;
+		return NULL;
 	}
-
-	err = -EINVAL;
-	if (WARN_ON_ONCE(alg->digest_size != crypto_shash_digestsize(tfm)))
-		goto err_free_tfm;
-	if (WARN_ON_ONCE(alg->block_size != crypto_shash_blocksize(tfm)))
-		goto err_free_tfm;
-
-	pr_info("%s using implementation \"%s\"\n",
-		alg->name, crypto_shash_driver_name(tfm));
-
-	/* pairs with smp_load_acquire() above */
-	smp_store_release(&alg->tfm, tfm);
-	goto out_unlock;
-
-err_free_tfm:
-	crypto_free_shash(tfm);
-	alg = ERR_PTR(err);
-out_unlock:
-	mutex_unlock(&fsverity_hash_alg_init_mutex);
-	return alg;
+	return &fsverity_hash_algs[num];
 }
 
 /**
  * fsverity_prepare_hash_state() - precompute the initial hash state
  * @alg: hash algorithm
  * @salt: a salt which is to be prepended to all data to be hashed
- * @salt_size: salt size in bytes, possibly 0
+ * @salt_size: salt size in bytes
  *
- * Return: NULL if the salt is empty, otherwise the kmalloc()'ed precomputed
- *	   initial hash state on success or an ERR_PTR() on failure.
+ * Return: the kmalloc()'ed initial hash state, or NULL if out of memory.
  */
-const u8 *fsverity_prepare_hash_state(const struct fsverity_hash_alg *alg,
-				      const u8 *salt, size_t salt_size)
+union fsverity_hash_ctx *
+fsverity_prepare_hash_state(const struct fsverity_hash_alg *alg,
+			    const u8 *salt, size_t salt_size)
 {
-	u8 *hashstate = NULL;
-	SHASH_DESC_ON_STACK(desc, alg->tfm);
 	u8 *padded_salt = NULL;
 	size_t padded_salt_size;
-	int err;
-
-	desc->tfm = alg->tfm;
-
-	if (salt_size == 0)
-		return NULL;
-
-	hashstate = kmalloc(crypto_shash_statesize(alg->tfm), GFP_KERNEL);
-	if (!hashstate)
-		return ERR_PTR(-ENOMEM);
+	union fsverity_hash_ctx ctx;
+	void *res = NULL;
 
 	/*
 	 * Zero-pad the salt to the next multiple of the input size of the hash
 	 * algorithm's compression function, e.g. 64 bytes for SHA-256 or 128
 	 * bytes for SHA-512.  This ensures that the hash algorithm won't have
 	 * any bytes buffered internally after processing the salt, thus making
 	 * salted hashing just as fast as unsalted hashing.
 	 */
 	padded_salt_size = round_up(salt_size, alg->block_size);
 	padded_salt = kzalloc(padded_salt_size, GFP_KERNEL);
-	if (!padded_salt) {
-		err = -ENOMEM;
-		goto err_free;
-	}
+	if (!padded_salt)
+		return NULL;
 	memcpy(padded_salt, salt, salt_size);
-	err = crypto_shash_init(desc);
-	if (err)
-		goto err_free;
-
-	err = crypto_shash_update(desc, padded_salt, padded_salt_size);
-	if (err)
-		goto err_free;
-
-	err = crypto_shash_export(desc, hashstate);
-	if (err)
-		goto err_free;
-out:
-	kfree(padded_salt);
-	return hashstate;
 
-err_free:
-	kfree(hashstate);
-	hashstate = ERR_PTR(err);
-	goto out;
+	switch (alg->algo_id) {
+	case HASH_ALGO_SHA256:
+		sha256_init(&ctx.sha256);
+		sha256_update(&ctx.sha256, padded_salt, padded_salt_size);
+		res = kmemdup(&ctx.sha256, sizeof(ctx.sha256), GFP_KERNEL);
+		break;
+	case HASH_ALGO_SHA512:
+		sha512_init(&ctx.sha512);
+		sha512_update(&ctx.sha512, padded_salt, padded_salt_size);
+		res = kmemdup(&ctx.sha512, sizeof(ctx.sha512), GFP_KERNEL);
+		break;
+	default:
+		WARN_ON_ONCE(1);
+	}
+	kfree(padded_salt);
+	return res;
 }
 
 /**
  * fsverity_hash_block() - hash a single data or hash block
  * @params: the Merkle tree's parameters
@@ -168,50 +98,58 @@ const u8 *fsverity_prepare_hash_state(const struct fsverity_hash_alg *alg,
  * @data: virtual address of a buffer containing the block to hash
  * @out: output digest, size 'params->digest_size' bytes
  *
  * Hash a single data or hash block.  The hash is salted if a salt is specified
  * in the Merkle tree parameters.
- *
- * Return: 0 on success, -errno on failure
  */
-int fsverity_hash_block(const struct merkle_tree_params *params,
-			const struct inode *inode, const void *data, u8 *out)
+void fsverity_hash_block(const struct merkle_tree_params *params,
+			 const struct inode *inode, const void *data, u8 *out)
 {
-	SHASH_DESC_ON_STACK(desc, params->hash_alg->tfm);
-	int err;
-
-	desc->tfm = params->hash_alg->tfm;
-
-	if (params->hashstate) {
-		err = crypto_shash_import(desc, params->hashstate);
-		if (err) {
-			fsverity_err(inode,
-				     "Error %d importing hash state", err);
-			return err;
-		}
-		err = crypto_shash_finup(desc, data, params->block_size, out);
-	} else {
-		err = crypto_shash_digest(desc, data, params->block_size, out);
+	union fsverity_hash_ctx ctx;
+
+	if (!params->hashstate) {
+		fsverity_hash_buffer(params->hash_alg, data, params->block_size,
+				     out);
+		return;
+	}
+
+	switch (params->hash_alg->algo_id) {
+	case HASH_ALGO_SHA256:
+		ctx.sha256 = params->hashstate->sha256;
+		sha256_update(&ctx.sha256, data, params->block_size);
+		sha256_final(&ctx.sha256, out);
+		return;
+	case HASH_ALGO_SHA512:
+		ctx.sha512 = params->hashstate->sha512;
+		sha512_update(&ctx.sha512, data, params->block_size);
+		sha512_final(&ctx.sha512, out);
+		return;
+	default:
+		BUG();
 	}
-	if (err)
-		fsverity_err(inode, "Error %d computing block hash", err);
-	return err;
 }
 
 /**
  * fsverity_hash_buffer() - hash some data
  * @alg: the hash algorithm to use
  * @data: the data to hash
  * @size: size of data to hash, in bytes
  * @out: output digest, size 'alg->digest_size' bytes
- *
- * Return: 0 on success, -errno on failure
  */
-int fsverity_hash_buffer(const struct fsverity_hash_alg *alg,
-			 const void *data, size_t size, u8 *out)
+void fsverity_hash_buffer(const struct fsverity_hash_alg *alg,
+			  const void *data, size_t size, u8 *out)
 {
-	return crypto_shash_tfm_digest(alg->tfm, data, size, out);
+	switch (alg->algo_id) {
+	case HASH_ALGO_SHA256:
+		sha256(data, size, out);
+		return;
+	case HASH_ALGO_SHA512:
+		sha512(data, size, out);
+		return;
+	default:
+		BUG();
+	}
 }
 
 void __init fsverity_check_hash_algs(void)
 {
 	size_t i;
diff --git a/fs/verity/open.c b/fs/verity/open.c
index fdeb95eca3af3..0604cebe194cd 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -40,22 +40,22 @@ int fsverity_init_merkle_tree_params(struct merkle_tree_params *params,
 	int level;
 
 	memset(params, 0, sizeof(*params));
 
 	hash_alg = fsverity_get_hash_alg(inode, hash_algorithm);
-	if (IS_ERR(hash_alg))
-		return PTR_ERR(hash_alg);
+	if (!hash_alg)
+		return -EINVAL;
 	params->hash_alg = hash_alg;
 	params->digest_size = hash_alg->digest_size;
 
-	params->hashstate = fsverity_prepare_hash_state(hash_alg, salt,
-							salt_size);
-	if (IS_ERR(params->hashstate)) {
-		err = PTR_ERR(params->hashstate);
-		params->hashstate = NULL;
-		fsverity_err(inode, "Error %d preparing hash state", err);
-		goto out_err;
+	if (salt_size) {
+		params->hashstate =
+			fsverity_prepare_hash_state(hash_alg, salt, salt_size);
+		if (!params->hashstate) {
+			err = -ENOMEM;
+			goto out_err;
+		}
 	}
 
 	/*
 	 * fs/verity/ directly assumes that the Merkle tree block size is a
 	 * power of 2 less than or equal to PAGE_SIZE.  Another restriction
@@ -156,22 +156,19 @@ int fsverity_init_merkle_tree_params(struct merkle_tree_params *params,
 
 /*
  * Compute the file digest by hashing the fsverity_descriptor excluding the
  * builtin signature and with the sig_size field set to 0.
  */
-static int compute_file_digest(const struct fsverity_hash_alg *hash_alg,
-			       struct fsverity_descriptor *desc,
-			       u8 *file_digest)
+static void compute_file_digest(const struct fsverity_hash_alg *hash_alg,
+				struct fsverity_descriptor *desc,
+				u8 *file_digest)
 {
 	__le32 sig_size = desc->sig_size;
-	int err;
 
 	desc->sig_size = 0;
-	err = fsverity_hash_buffer(hash_alg, desc, sizeof(*desc), file_digest);
+	fsverity_hash_buffer(hash_alg, desc, sizeof(*desc), file_digest);
 	desc->sig_size = sig_size;
-
-	return err;
 }
 
 /*
  * Create a new fsverity_info from the given fsverity_descriptor (with optional
  * appended builtin signature), and check the signature if present.  The
@@ -199,16 +196,11 @@ struct fsverity_info *fsverity_create_info(const struct inode *inode,
 		goto fail;
 	}
 
 	memcpy(vi->root_hash, desc->root_hash, vi->tree_params.digest_size);
 
-	err = compute_file_digest(vi->tree_params.hash_alg, desc,
-				  vi->file_digest);
-	if (err) {
-		fsverity_err(inode, "Error %d computing file digest", err);
-		goto fail;
-	}
+	compute_file_digest(vi->tree_params.hash_alg, desc, vi->file_digest);
 
 	err = fsverity_verify_signature(vi, desc->signature,
 					le32_to_cpu(desc->sig_size));
 	if (err)
 		goto fail;
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index 4fcad0825a120..481a381128cb9 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -5,11 +5,10 @@
  * Copyright 2019 Google LLC
  */
 
 #include "fsverity_private.h"
 
-#include <crypto/hash.h>
 #include <linux/bio.h>
 
 static struct workqueue_struct *fsverity_read_workqueue;
 
 /*
@@ -200,12 +199,11 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 		struct page *hpage = hblocks[level - 1].page;
 		const void *haddr = hblocks[level - 1].addr;
 		unsigned long hblock_idx = hblocks[level - 1].index;
 		unsigned int hoffset = hblocks[level - 1].hoffset;
 
-		if (fsverity_hash_block(params, inode, haddr, real_hash) != 0)
-			goto error;
+		fsverity_hash_block(params, inode, haddr, real_hash);
 		if (memcmp(want_hash, real_hash, hsize) != 0)
 			goto corrupted;
 		/*
 		 * Mark the hash block as verified.  This must be atomic and
 		 * idempotent, as the same hash block might be verified by
@@ -220,12 +218,11 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 		kunmap_local(haddr);
 		put_page(hpage);
 	}
 
 	/* Finally, verify the data block. */
-	if (fsverity_hash_block(params, inode, data, real_hash) != 0)
-		goto error;
+	fsverity_hash_block(params, inode, data, real_hash);
 	if (memcmp(want_hash, real_hash, hsize) != 0)
 		goto corrupted;
 	return true;
 
 corrupted:
-- 
2.50.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
