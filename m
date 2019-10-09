Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD46AD1CF5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Oct 2019 01:42:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iILbG-0001XD-6A; Wed, 09 Oct 2019 23:42:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iILbE-0001X1-8s
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Oct 2019 23:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e+r1tkomRSrrYWP62pX40M6Y4v/a0anpen0tFO+T24s=; b=VWvNBzBnBOAWkBFOsf1Dsi7DTH
 jQ1ogrSB4Iy54C+O5UUXcnXPjbPUwvHphhRWEG2sGjQ/UIgD/0Nt2lUqsGktGk3CpRPY9bBwYz4Lu
 RPSuMZhX/BObSoTVAzCQ1xqqmpEmN7tEEte5BNxiJGslYwYTeJ89f9womy2NQrNoB/P0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=e+r1tkomRSrrYWP62pX40M6Y4v/a0anpen0tFO+T24s=; b=A
 ar5B5IdXnSEbimOfGP7vUVtbvqosFedluGDhDUsW9o6mIJeg54TtVojQ7puxcz00APSBUnqU8Kw5q
 tliFmmDa2dPXvU2AyR8cSj6DLHH2AsZBDNakh/EWmosSx7biuNokUJB2MuSEDY2fFKCxyztCEaTBV
 T3SvfmKqj6Aua0/Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iILbB-00C2HR-Dp
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Oct 2019 23:42:32 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB71420659;
 Wed,  9 Oct 2019 23:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570664538;
 bh=flJUjeWsBitYEJJv/geZb6UQNxzbDxZ6BcCxvKBO15M=;
 h=From:To:Cc:Subject:Date:From;
 b=TYJsb0NiidEvrAgMLvnesz/lyUWJZ9+LFGeHu3uSDEawPCWHL2ybwf1QR5P/CAviS
 J8mk/Jhz5/1Um6POHJQha57USijRrKmz/MKaYgvEEpiwoBeJa8jXioxyKMjXL3/O7u
 Thw3TtVD1sQgwT8nKKgUTFLBFMpEytiA8FOICJIY=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Wed,  9 Oct 2019 16:40:38 -0700
Message-Id: <20191009234038.224587-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
MIME-Version: 1.0
X-Spam-Score: 0.3 (/)
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
 0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iILbB-00C2HR-Dp
Subject: [f2fs-dev] [PATCH] fscrypt: remove struct fscrypt_ctx
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 "Theodore Y . Ts'o" <tytso@mit.edu>, Chandan Rajendra <chandan@linux.ibm.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Now that ext4 and f2fs implement their own post-read workflow that
supports both fscrypt and fsverity, the fscrypt-only workflow based
around struct fscrypt_ctx is no longer used.  So remove the unused code.

This is based on a patch from Chandan Rajendra's "Consolidate FS read
I/O callbacks code" patchset, but rebased onto the latest kernel, folded
__fscrypt_decrypt_bio() into fscrypt_decrypt_bio(), cleaned up
fscrypt_initialize(), and updated the commit message.

Originally-from: Chandan Rajendra <chandan@linux.ibm.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/bio.c             |  29 +---------
 fs/crypto/crypto.c          | 110 +++---------------------------------
 fs/crypto/fscrypt_private.h |   2 -
 include/linux/fscrypt.h     |  32 -----------
 4 files changed, 10 insertions(+), 163 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index 82da2510721f6..1f4b8a2770606 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -26,7 +26,7 @@
 #include <linux/namei.h>
 #include "fscrypt_private.h"
 
-static void __fscrypt_decrypt_bio(struct bio *bio, bool done)
+void fscrypt_decrypt_bio(struct bio *bio)
 {
 	struct bio_vec *bv;
 	struct bvec_iter_all iter_all;
@@ -37,37 +37,10 @@ static void __fscrypt_decrypt_bio(struct bio *bio, bool done)
 							   bv->bv_offset);
 		if (ret)
 			SetPageError(page);
-		else if (done)
-			SetPageUptodate(page);
-		if (done)
-			unlock_page(page);
 	}
 }
-
-void fscrypt_decrypt_bio(struct bio *bio)
-{
-	__fscrypt_decrypt_bio(bio, false);
-}
 EXPORT_SYMBOL(fscrypt_decrypt_bio);
 
-static void completion_pages(struct work_struct *work)
-{
-	struct fscrypt_ctx *ctx = container_of(work, struct fscrypt_ctx, work);
-	struct bio *bio = ctx->bio;
-
-	__fscrypt_decrypt_bio(bio, true);
-	fscrypt_release_ctx(ctx);
-	bio_put(bio);
-}
-
-void fscrypt_enqueue_decrypt_bio(struct fscrypt_ctx *ctx, struct bio *bio)
-{
-	INIT_WORK(&ctx->work, completion_pages);
-	ctx->bio = bio;
-	fscrypt_enqueue_decrypt_work(&ctx->work);
-}
-EXPORT_SYMBOL(fscrypt_enqueue_decrypt_bio);
-
 int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 				sector_t pblk, unsigned int len)
 {
diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 6bc3e4f1e657e..ced8ad9f2d019 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -31,24 +31,16 @@
 #include "fscrypt_private.h"
 
 static unsigned int num_prealloc_crypto_pages = 32;
-static unsigned int num_prealloc_crypto_ctxs = 128;
 
 module_param(num_prealloc_crypto_pages, uint, 0444);
 MODULE_PARM_DESC(num_prealloc_crypto_pages,
 		"Number of crypto pages to preallocate");
-module_param(num_prealloc_crypto_ctxs, uint, 0444);
-MODULE_PARM_DESC(num_prealloc_crypto_ctxs,
-		"Number of crypto contexts to preallocate");
 
 static mempool_t *fscrypt_bounce_page_pool = NULL;
 
-static LIST_HEAD(fscrypt_free_ctxs);
-static DEFINE_SPINLOCK(fscrypt_ctx_lock);
-
 static struct workqueue_struct *fscrypt_read_workqueue;
 static DEFINE_MUTEX(fscrypt_init_mutex);
 
-static struct kmem_cache *fscrypt_ctx_cachep;
 struct kmem_cache *fscrypt_info_cachep;
 
 void fscrypt_enqueue_decrypt_work(struct work_struct *work)
@@ -57,62 +49,6 @@ void fscrypt_enqueue_decrypt_work(struct work_struct *work)
 }
 EXPORT_SYMBOL(fscrypt_enqueue_decrypt_work);
 
-/**
- * fscrypt_release_ctx() - Release a decryption context
- * @ctx: The decryption context to release.
- *
- * If the decryption context was allocated from the pre-allocated pool, return
- * it to that pool.  Else, free it.
- */
-void fscrypt_release_ctx(struct fscrypt_ctx *ctx)
-{
-	unsigned long flags;
-
-	if (ctx->flags & FS_CTX_REQUIRES_FREE_ENCRYPT_FL) {
-		kmem_cache_free(fscrypt_ctx_cachep, ctx);
-	} else {
-		spin_lock_irqsave(&fscrypt_ctx_lock, flags);
-		list_add(&ctx->free_list, &fscrypt_free_ctxs);
-		spin_unlock_irqrestore(&fscrypt_ctx_lock, flags);
-	}
-}
-EXPORT_SYMBOL(fscrypt_release_ctx);
-
-/**
- * fscrypt_get_ctx() - Get a decryption context
- * @gfp_flags:   The gfp flag for memory allocation
- *
- * Allocate and initialize a decryption context.
- *
- * Return: A new decryption context on success; an ERR_PTR() otherwise.
- */
-struct fscrypt_ctx *fscrypt_get_ctx(gfp_t gfp_flags)
-{
-	struct fscrypt_ctx *ctx;
-	unsigned long flags;
-
-	/*
-	 * First try getting a ctx from the free list so that we don't have to
-	 * call into the slab allocator.
-	 */
-	spin_lock_irqsave(&fscrypt_ctx_lock, flags);
-	ctx = list_first_entry_or_null(&fscrypt_free_ctxs,
-					struct fscrypt_ctx, free_list);
-	if (ctx)
-		list_del(&ctx->free_list);
-	spin_unlock_irqrestore(&fscrypt_ctx_lock, flags);
-	if (!ctx) {
-		ctx = kmem_cache_zalloc(fscrypt_ctx_cachep, gfp_flags);
-		if (!ctx)
-			return ERR_PTR(-ENOMEM);
-		ctx->flags |= FS_CTX_REQUIRES_FREE_ENCRYPT_FL;
-	} else {
-		ctx->flags &= ~FS_CTX_REQUIRES_FREE_ENCRYPT_FL;
-	}
-	return ctx;
-}
-EXPORT_SYMBOL(fscrypt_get_ctx);
-
 struct page *fscrypt_alloc_bounce_page(gfp_t gfp_flags)
 {
 	return mempool_alloc(fscrypt_bounce_page_pool, gfp_flags);
@@ -392,17 +328,6 @@ const struct dentry_operations fscrypt_d_ops = {
 	.d_revalidate = fscrypt_d_revalidate,
 };
 
-static void fscrypt_destroy(void)
-{
-	struct fscrypt_ctx *pos, *n;
-
-	list_for_each_entry_safe(pos, n, &fscrypt_free_ctxs, free_list)
-		kmem_cache_free(fscrypt_ctx_cachep, pos);
-	INIT_LIST_HEAD(&fscrypt_free_ctxs);
-	mempool_destroy(fscrypt_bounce_page_pool);
-	fscrypt_bounce_page_pool = NULL;
-}
-
 /**
  * fscrypt_initialize() - allocate major buffers for fs encryption.
  * @cop_flags:  fscrypt operations flags
@@ -410,11 +335,11 @@ static void fscrypt_destroy(void)
  * We only call this when we start accessing encrypted files, since it
  * results in memory getting allocated that wouldn't otherwise be used.
  *
- * Return: Zero on success, non-zero otherwise.
+ * Return: 0 on success; -errno on failure
  */
 int fscrypt_initialize(unsigned int cop_flags)
 {
-	int i, res = -ENOMEM;
+	int err = 0;
 
 	/* No need to allocate a bounce page pool if this FS won't use it. */
 	if (cop_flags & FS_CFLG_OWN_PAGES)
@@ -422,29 +347,18 @@ int fscrypt_initialize(unsigned int cop_flags)
 
 	mutex_lock(&fscrypt_init_mutex);
 	if (fscrypt_bounce_page_pool)
-		goto already_initialized;
-
-	for (i = 0; i < num_prealloc_crypto_ctxs; i++) {
-		struct fscrypt_ctx *ctx;
-
-		ctx = kmem_cache_zalloc(fscrypt_ctx_cachep, GFP_NOFS);
-		if (!ctx)
-			goto fail;
-		list_add(&ctx->free_list, &fscrypt_free_ctxs);
-	}
+		goto out_unlock;
 
+	err = -ENOMEM;
 	fscrypt_bounce_page_pool =
 		mempool_create_page_pool(num_prealloc_crypto_pages, 0);
 	if (!fscrypt_bounce_page_pool)
-		goto fail;
+		goto out_unlock;
 
-already_initialized:
-	mutex_unlock(&fscrypt_init_mutex);
-	return 0;
-fail:
-	fscrypt_destroy();
+	err = 0;
+out_unlock:
 	mutex_unlock(&fscrypt_init_mutex);
-	return res;
+	return err;
 }
 
 void fscrypt_msg(const struct inode *inode, const char *level,
@@ -490,13 +404,9 @@ static int __init fscrypt_init(void)
 	if (!fscrypt_read_workqueue)
 		goto fail;
 
-	fscrypt_ctx_cachep = KMEM_CACHE(fscrypt_ctx, SLAB_RECLAIM_ACCOUNT);
-	if (!fscrypt_ctx_cachep)
-		goto fail_free_queue;
-
 	fscrypt_info_cachep = KMEM_CACHE(fscrypt_info, SLAB_RECLAIM_ACCOUNT);
 	if (!fscrypt_info_cachep)
-		goto fail_free_ctx;
+		goto fail_free_queue;
 
 	err = fscrypt_init_keyring();
 	if (err)
@@ -506,8 +416,6 @@ static int __init fscrypt_init(void)
 
 fail_free_info:
 	kmem_cache_destroy(fscrypt_info_cachep);
-fail_free_ctx:
-	kmem_cache_destroy(fscrypt_ctx_cachep);
 fail_free_queue:
 	destroy_workqueue(fscrypt_read_workqueue);
 fail:
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 76c64297ce187..dacf8fcbac3be 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -203,8 +203,6 @@ typedef enum {
 	FS_ENCRYPT,
 } fscrypt_direction_t;
 
-#define FS_CTX_REQUIRES_FREE_ENCRYPT_FL		0x00000001
-
 static inline bool fscrypt_valid_enc_modes(u32 contents_mode,
 					   u32 filenames_mode)
 {
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index f622f7460ed8c..04f5ed6284454 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -20,7 +20,6 @@
 
 #define FS_CRYPTO_BLOCK_SIZE		16
 
-struct fscrypt_ctx;
 struct fscrypt_info;
 
 struct fscrypt_str {
@@ -64,18 +63,6 @@ struct fscrypt_operations {
 	unsigned int max_namelen;
 };
 
-/* Decryption work */
-struct fscrypt_ctx {
-	union {
-		struct {
-			struct bio *bio;
-			struct work_struct work;
-		};
-		struct list_head free_list;	/* Free list */
-	};
-	u8 flags;				/* Flags */
-};
-
 static inline bool fscrypt_has_encryption_key(const struct inode *inode)
 {
 	/* pairs with cmpxchg_release() in fscrypt_get_encryption_info() */
@@ -102,8 +89,6 @@ static inline void fscrypt_handle_d_move(struct dentry *dentry)
 
 /* crypto.c */
 extern void fscrypt_enqueue_decrypt_work(struct work_struct *);
-extern struct fscrypt_ctx *fscrypt_get_ctx(gfp_t);
-extern void fscrypt_release_ctx(struct fscrypt_ctx *);
 
 extern struct page *fscrypt_encrypt_pagecache_blocks(struct page *page,
 						     unsigned int len,
@@ -244,8 +229,6 @@ static inline bool fscrypt_match_name(const struct fscrypt_name *fname,
 
 /* bio.c */
 extern void fscrypt_decrypt_bio(struct bio *);
-extern void fscrypt_enqueue_decrypt_bio(struct fscrypt_ctx *ctx,
-					struct bio *bio);
 extern int fscrypt_zeroout_range(const struct inode *, pgoff_t, sector_t,
 				 unsigned int);
 
@@ -295,16 +278,6 @@ static inline void fscrypt_enqueue_decrypt_work(struct work_struct *work)
 {
 }
 
-static inline struct fscrypt_ctx *fscrypt_get_ctx(gfp_t gfp_flags)
-{
-	return ERR_PTR(-EOPNOTSUPP);
-}
-
-static inline void fscrypt_release_ctx(struct fscrypt_ctx *ctx)
-{
-	return;
-}
-
 static inline struct page *fscrypt_encrypt_pagecache_blocks(struct page *page,
 							    unsigned int len,
 							    unsigned int offs,
@@ -484,11 +457,6 @@ static inline void fscrypt_decrypt_bio(struct bio *bio)
 {
 }
 
-static inline void fscrypt_enqueue_decrypt_bio(struct fscrypt_ctx *ctx,
-					       struct bio *bio)
-{
-}
-
 static inline int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 					sector_t pblk, unsigned int len)
 {
-- 
2.23.0.581.g78d2f28ef7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
