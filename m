Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E698B12DAC7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Dec 2019 18:56:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1imLlF-0008Ne-LX; Tue, 31 Dec 2019 17:56:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1imLlD-0008NN-Ns
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Dec 2019 17:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aiQ5t+QUDr3Zz9UhA8NFwDnPanJhuRn7MGW6WIld1T4=; b=gsO9S514VIORNh1+RdV69IsgJg
 2DGTAKdWGgnlc0fZ9ehu+fzm9pKp1EKd5YgZ3Z+5WDK48PyIoyETI1ztOqFXhyZD1myY3RtKszIbz
 uhaVHLus/dQKe4PD3skAXDSIXME51zGtVaDN6etHieUIzI+1apurzGbrOOct4vlLRouU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=aiQ5t+QUDr3Zz9UhA8NFwDnPanJhuRn7MGW6WIld1T4=; b=K
 97I4h480zug4vWSmyWmgCmsDoIxgUGcSHHumuTwu9MfkcwXd3/enqOAPFB57DaVwUFF+L+Dp3g1hP
 cO0KwhIxhR8PhB90VEyM8VRIONTufF3BBB6OX8ZZT597/3Jb1daoM9d8TN0YS8nYiXPC+rTNQCmk6
 +7RtsboLfbYOIfK4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1imLl6-004Rzg-Ow
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Dec 2019 17:56:51 +0000
Received: from zzz.tds (h75-100-12-111.burkwi.broadband.dynamic.tds.net
 [75.100.12.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 936D2206D9;
 Tue, 31 Dec 2019 17:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577814999;
 bh=OVJeZ36jfGi7flvCtlHEeJZE7Fz8FPgiKD8xcqi9UBI=;
 h=From:To:Cc:Subject:Date:From;
 b=OFqBMmlBdrFcQyQf+ztZz81HYJ7eZaBIPVaXu8pyOBVEOXAAGRffmzgFyB0HTVOuP
 DCNedeUGPor2YQnWoOsA1c9ZTvlNA93BhJSeezuz+19m5BCWUzAUOYlOGW97w6dxbh
 3h5NRUJ2kvEFw9GtvIWAW+/9uaPDIr0HVT5cWo88=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Tue, 31 Dec 2019 11:55:45 -0600
Message-Id: <20191231175545.20709-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
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
X-Headers-End: 1imLl6-004Rzg-Ow
Subject: [f2fs-dev] [PATCH] fs-verity: use mempool for hash requests
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
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

When initializing an fs-verity hash algorithm, also initialize a mempool
that contains a single preallocated hash request object.  Then replace
the direct calls to ahash_request_alloc() and ahash_request_free() with
allocating and freeing from this mempool.

This eliminates the possibility of the allocation failing, which is
desirable for the I/O path.

This doesn't cause deadlocks because there's no case where multiple hash
requests are needed at a time to make forward progress.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/enable.c           |  8 +--
 fs/verity/fsverity_private.h | 16 ++++--
 fs/verity/hash_algs.c        | 98 +++++++++++++++++++++++++++---------
 fs/verity/open.c             |  4 +-
 fs/verity/verify.c           | 17 +++----
 5 files changed, 97 insertions(+), 46 deletions(-)

diff --git a/fs/verity/enable.c b/fs/verity/enable.c
index 1f3858d88cf3..1645d6326e32 100644
--- a/fs/verity/enable.c
+++ b/fs/verity/enable.c
@@ -165,9 +165,11 @@ static int build_merkle_tree(struct file *filp,
 		return 0;
 	}
 
+	/* This allocation never fails, since it's mempool-backed. */
+	req = fsverity_alloc_hash_request(params->hash_alg, GFP_KERNEL);
+
 	pending_hashes = kmalloc(params->block_size, GFP_KERNEL);
-	req = ahash_request_alloc(params->hash_alg->tfm, GFP_KERNEL);
-	if (!pending_hashes || !req)
+	if (!pending_hashes)
 		goto out;
 
 	/*
@@ -189,7 +191,7 @@ static int build_merkle_tree(struct file *filp,
 	err = 0;
 out:
 	kfree(pending_hashes);
-	ahash_request_free(req);
+	fsverity_free_hash_request(params->hash_alg, req);
 	return err;
 }
 
diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index ab9cfdd8f965..74768cf539da 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -16,6 +16,7 @@
 
 #include <crypto/sha.h>
 #include <linux/fsverity.h>
+#include <linux/mempool.h>
 
 struct ahash_request;
 
@@ -37,11 +38,12 @@ struct fsverity_hash_alg {
 	const char *name;	  /* crypto API name, e.g. sha256 */
 	unsigned int digest_size; /* digest size in bytes, e.g. 32 for SHA-256 */
 	unsigned int block_size;  /* block size in bytes, e.g. 64 for SHA-256 */
+	mempool_t req_pool;	  /* mempool with a preallocated hash request */
 };
 
 /* Merkle tree parameters: hash algorithm, initial hash state, and topology */
 struct merkle_tree_params {
-	const struct fsverity_hash_alg *hash_alg; /* the hash algorithm */
+	struct fsverity_hash_alg *hash_alg; /* the hash algorithm */
 	const u8 *hashstate;		/* initial hash state or NULL */
 	unsigned int digest_size;	/* same as hash_alg->digest_size */
 	unsigned int block_size;	/* size of data and tree blocks */
@@ -115,14 +117,18 @@ struct fsverity_signed_digest {
 
 extern struct fsverity_hash_alg fsverity_hash_algs[];
 
-const struct fsverity_hash_alg *fsverity_get_hash_alg(const struct inode *inode,
-						      unsigned int num);
-const u8 *fsverity_prepare_hash_state(const struct fsverity_hash_alg *alg,
+struct fsverity_hash_alg *fsverity_get_hash_alg(const struct inode *inode,
+						unsigned int num);
+struct ahash_request *fsverity_alloc_hash_request(struct fsverity_hash_alg *alg,
+						  gfp_t gfp_flags);
+void fsverity_free_hash_request(struct fsverity_hash_alg *alg,
+				struct ahash_request *req);
+const u8 *fsverity_prepare_hash_state(struct fsverity_hash_alg *alg,
 				      const u8 *salt, size_t salt_size);
 int fsverity_hash_page(const struct merkle_tree_params *params,
 		       const struct inode *inode,
 		       struct ahash_request *req, struct page *page, u8 *out);
-int fsverity_hash_buffer(const struct fsverity_hash_alg *alg,
+int fsverity_hash_buffer(struct fsverity_hash_alg *alg,
 			 const void *data, size_t size, u8 *out);
 void __init fsverity_check_hash_algs(void);
 
diff --git a/fs/verity/hash_algs.c b/fs/verity/hash_algs.c
index 31e6d7d2389a..c37e186ebeb6 100644
--- a/fs/verity/hash_algs.c
+++ b/fs/verity/hash_algs.c
@@ -24,6 +24,8 @@ struct fsverity_hash_alg fsverity_hash_algs[] = {
 	},
 };
 
+static DEFINE_MUTEX(fsverity_hash_alg_init_mutex);
+
 /**
  * fsverity_get_hash_alg() - validate and prepare a hash algorithm
  * @inode: optional inode for logging purposes
@@ -36,8 +38,8 @@ struct fsverity_hash_alg fsverity_hash_algs[] = {
  *
  * Return: pointer to the hash alg on success, else an ERR_PTR()
  */
-const struct fsverity_hash_alg *fsverity_get_hash_alg(const struct inode *inode,
-						      unsigned int num)
+struct fsverity_hash_alg *fsverity_get_hash_alg(const struct inode *inode,
+						unsigned int num)
 {
 	struct fsverity_hash_alg *alg;
 	struct crypto_ahash *tfm;
@@ -50,10 +52,15 @@ const struct fsverity_hash_alg *fsverity_get_hash_alg(const struct inode *inode,
 	}
 	alg = &fsverity_hash_algs[num];
 
-	/* pairs with cmpxchg() below */
-	tfm = READ_ONCE(alg->tfm);
-	if (likely(tfm != NULL))
+	/* pairs with smp_store_release() below */
+	if (likely(smp_load_acquire(&alg->tfm) != NULL))
 		return alg;
+
+	mutex_lock(&fsverity_hash_alg_init_mutex);
+
+	if (alg->tfm != NULL)
+		goto out_unlock;
+
 	/*
 	 * Using the shash API would make things a bit simpler, but the ahash
 	 * API is preferable as it allows the use of crypto accelerators.
@@ -64,12 +71,14 @@ const struct fsverity_hash_alg *fsverity_get_hash_alg(const struct inode *inode,
 			fsverity_warn(inode,
 				      "Missing crypto API support for hash algorithm \"%s\"",
 				      alg->name);
-			return ERR_PTR(-ENOPKG);
+			alg = ERR_PTR(-ENOPKG);
+			goto out_unlock;
 		}
 		fsverity_err(inode,
 			     "Error allocating hash algorithm \"%s\": %ld",
 			     alg->name, PTR_ERR(tfm));
-		return ERR_CAST(tfm);
+		alg = ERR_CAST(tfm);
+		goto out_unlock;
 	}
 
 	err = -EINVAL;
@@ -78,18 +87,61 @@ const struct fsverity_hash_alg *fsverity_get_hash_alg(const struct inode *inode,
 	if (WARN_ON(alg->block_size != crypto_ahash_blocksize(tfm)))
 		goto err_free_tfm;
 
+	err = mempool_init_kmalloc_pool(&alg->req_pool, 1,
+					sizeof(struct ahash_request) +
+					crypto_ahash_reqsize(tfm));
+	if (err)
+		goto err_free_tfm;
+
 	pr_info("%s using implementation \"%s\"\n",
 		alg->name, crypto_ahash_driver_name(tfm));
 
-	/* pairs with READ_ONCE() above */
-	if (cmpxchg(&alg->tfm, NULL, tfm) != NULL)
-		crypto_free_ahash(tfm);
-
-	return alg;
+	/* pairs with smp_load_acquire() above */
+	smp_store_release(&alg->tfm, tfm);
+	goto out_unlock;
 
 err_free_tfm:
 	crypto_free_ahash(tfm);
-	return ERR_PTR(err);
+	alg = ERR_PTR(err);
+out_unlock:
+	mutex_unlock(&fsverity_hash_alg_init_mutex);
+	return alg;
+}
+
+/**
+ * fsverity_alloc_hash_request() - allocate a hash request object
+ * @alg: the hash algorithm for which to allocate the request
+ * @gfp_flags: memory allocation flags
+ *
+ * This is mempool-backed, so this never fails if __GFP_DIRECT_RECLAIM is set in
+ * @gfp_flags.  However, in that case this might need to wait for all
+ * previously-allocated requests to be freed.  So to avoid deadlocks, callers
+ * must never need multiple requests at a time to make forward progress.
+ *
+ * Return: the request object on success; NULL on failure (but see above)
+ */
+struct ahash_request *fsverity_alloc_hash_request(struct fsverity_hash_alg *alg,
+						  gfp_t gfp_flags)
+{
+	struct ahash_request *req = mempool_alloc(&alg->req_pool, gfp_flags);
+
+	if (req)
+		ahash_request_set_tfm(req, alg->tfm);
+	return req;
+}
+
+/**
+ * fsverity_free_hash_request() - free a hash request object
+ * @alg: the hash algorithm
+ * @req: the hash request object to free
+ */
+void fsverity_free_hash_request(struct fsverity_hash_alg *alg,
+				struct ahash_request *req)
+{
+	if (req) {
+		ahash_request_zero(req);
+		mempool_free(req, &alg->req_pool);
+	}
 }
 
 /**
@@ -101,7 +153,7 @@ const struct fsverity_hash_alg *fsverity_get_hash_alg(const struct inode *inode,
  * Return: NULL if the salt is empty, otherwise the kmalloc()'ed precomputed
  *	   initial hash state on success or an ERR_PTR() on failure.
  */
-const u8 *fsverity_prepare_hash_state(const struct fsverity_hash_alg *alg,
+const u8 *fsverity_prepare_hash_state(struct fsverity_hash_alg *alg,
 				      const u8 *salt, size_t salt_size)
 {
 	u8 *hashstate = NULL;
@@ -119,11 +171,8 @@ const u8 *fsverity_prepare_hash_state(const struct fsverity_hash_alg *alg,
 	if (!hashstate)
 		return ERR_PTR(-ENOMEM);
 
-	req = ahash_request_alloc(alg->tfm, GFP_KERNEL);
-	if (!req) {
-		err = -ENOMEM;
-		goto err_free;
-	}
+	/* This allocation never fails, since it's mempool-backed. */
+	req = fsverity_alloc_hash_request(alg, GFP_KERNEL);
 
 	/*
 	 * Zero-pad the salt to the next multiple of the input size of the hash
@@ -158,7 +207,7 @@ const u8 *fsverity_prepare_hash_state(const struct fsverity_hash_alg *alg,
 	if (err)
 		goto err_free;
 out:
-	ahash_request_free(req);
+	fsverity_free_hash_request(alg, req);
 	kfree(padded_salt);
 	return hashstate;
 
@@ -229,7 +278,7 @@ int fsverity_hash_page(const struct merkle_tree_params *params,
  *
  * Return: 0 on success, -errno on failure
  */
-int fsverity_hash_buffer(const struct fsverity_hash_alg *alg,
+int fsverity_hash_buffer(struct fsverity_hash_alg *alg,
 			 const void *data, size_t size, u8 *out)
 {
 	struct ahash_request *req;
@@ -237,9 +286,8 @@ int fsverity_hash_buffer(const struct fsverity_hash_alg *alg,
 	DECLARE_CRYPTO_WAIT(wait);
 	int err;
 
-	req = ahash_request_alloc(alg->tfm, GFP_KERNEL);
-	if (!req)
-		return -ENOMEM;
+	/* This allocation never fails, since it's mempool-backed. */
+	req = fsverity_alloc_hash_request(alg, GFP_KERNEL);
 
 	sg_init_one(&sg, data, size);
 	ahash_request_set_callback(req, CRYPTO_TFM_REQ_MAY_SLEEP |
@@ -249,7 +297,7 @@ int fsverity_hash_buffer(const struct fsverity_hash_alg *alg,
 
 	err = crypto_wait_req(crypto_ahash_digest(req), &wait);
 
-	ahash_request_free(req);
+	fsverity_free_hash_request(alg, req);
 	return err;
 }
 
diff --git a/fs/verity/open.c b/fs/verity/open.c
index e9cdf7d00ed2..c5fe6948e262 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -31,7 +31,7 @@ int fsverity_init_merkle_tree_params(struct merkle_tree_params *params,
 				     unsigned int log_blocksize,
 				     const u8 *salt, size_t salt_size)
 {
-	const struct fsverity_hash_alg *hash_alg;
+	struct fsverity_hash_alg *hash_alg;
 	int err;
 	u64 blocks;
 	u64 offset;
@@ -127,7 +127,7 @@ int fsverity_init_merkle_tree_params(struct merkle_tree_params *params,
  * Compute the file measurement by hashing the fsverity_descriptor excluding the
  * signature and with the sig_size field set to 0.
  */
-static int compute_file_measurement(const struct fsverity_hash_alg *hash_alg,
+static int compute_file_measurement(struct fsverity_hash_alg *hash_alg,
 				    struct fsverity_descriptor *desc,
 				    u8 *measurement)
 {
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index 7fa561c343c2..e0cb62da3864 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -192,13 +192,12 @@ bool fsverity_verify_page(struct page *page)
 	struct ahash_request *req;
 	bool valid;
 
-	req = ahash_request_alloc(vi->tree_params.hash_alg->tfm, GFP_NOFS);
-	if (unlikely(!req))
-		return false;
+	/* This allocation never fails, since it's mempool-backed. */
+	req = fsverity_alloc_hash_request(vi->tree_params.hash_alg, GFP_NOFS);
 
 	valid = verify_page(inode, vi, req, page, 0);
 
-	ahash_request_free(req);
+	fsverity_free_hash_request(vi->tree_params.hash_alg, req);
 
 	return valid;
 }
@@ -229,12 +228,8 @@ void fsverity_verify_bio(struct bio *bio)
 	struct bvec_iter_all iter_all;
 	unsigned long max_ra_pages = 0;
 
-	req = ahash_request_alloc(params->hash_alg->tfm, GFP_NOFS);
-	if (unlikely(!req)) {
-		bio_for_each_segment_all(bv, bio, iter_all)
-			SetPageError(bv->bv_page);
-		return;
-	}
+	/* This allocation never fails, since it's mempool-backed. */
+	req = fsverity_alloc_hash_request(params->hash_alg, GFP_NOFS);
 
 	if (bio->bi_opf & REQ_RAHEAD) {
 		/*
@@ -262,7 +257,7 @@ void fsverity_verify_bio(struct bio *bio)
 			SetPageError(page);
 	}
 
-	ahash_request_free(req);
+	fsverity_free_hash_request(params->hash_alg, req);
 }
 EXPORT_SYMBOL_GPL(fsverity_verify_bio);
 #endif /* CONFIG_BLOCK */
-- 
2.24.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
