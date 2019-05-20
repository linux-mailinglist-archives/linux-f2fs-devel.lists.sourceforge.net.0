Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 680B223D64
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 May 2019 18:30:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hSlBL-0004oV-3o; Mon, 20 May 2019 16:30:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hSlBJ-0004oA-PW
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 16:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rPQBgVODfoRnOlwlUOYa2dj346atbg8T3e3fnqdtuiQ=; b=eZ9QCNtEADSHPjs8yXPT9JHaCe
 aBmjp14/NzVoYgI81Jh+2r/5NaXdq14eZV7ydsRTi58kw9rJrqfyAhmBVmf9oNHw0CwTMq5JK0s9e
 kMkjBt/Im78UKA/JL3f1cgixeN1T+V+Vr1fxvJmYuuiXTdHuWtf1zgVr6eiTdDVdXZ+0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rPQBgVODfoRnOlwlUOYa2dj346atbg8T3e3fnqdtuiQ=; b=cV9siD4zXI++U1FHDvMJWvpUb/
 rz2dB6yXPHqdU7je3nvnlBM3is2A1zQXRBVUGIei19D/EUv7UrnG3YDWmKPajWDSjw5MVX8p0iIn3
 woeLD0ZTL6WrB4x7wDGNEDB/nE9DVLm2czhFvWJjhfarg0A8VM4nj6iuRaGxsNovkSgs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hSlBC-0005Hw-Un
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 16:30:32 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E89821479;
 Mon, 20 May 2019 16:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558369821;
 bh=vPp+Zs7yN+33HNpsKkMC72PspxyOFK4Pkx8euK8UIMU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c3GRVKCKj12MZpgIkI4ZGkM+bVCN8J93vN18xLutGrmYUIf5M/r/AgVIS3ngdXCrC
 aSicLlf5d2+4KuNdHMFvNmksuTBgTladrXFsmv0WIwtGI3JgsuRCSpbaGpGLVGDzCz
 jLbfSWyLfjOJJLPZ1OyUMdzqMGVWaMi2aV02e53Y=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 20 May 2019 09:29:39 -0700
Message-Id: <20190520162952.156212-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190520162952.156212-1-ebiggers@kernel.org>
References: <20190520162952.156212-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 2.4 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hSlBC-0005Hw-Un
Subject: [f2fs-dev] [PATCH v2 01/14] fscrypt: simplify bounce page handling
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
Cc: linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 Chandan Rajendra <chandan@linux.ibm.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Currently, bounce page handling for writes to encrypted files is
unnecessarily complicated.  A fscrypt_ctx is allocated along with each
bounce page, page_private(bounce_page) points to this fscrypt_ctx, and
fscrypt_ctx::w::control_page points to the original pagecache page.

However, because writes don't use the fscrypt_ctx for anything else,
there's no reason why page_private(bounce_page) can't just point to the
original pagecache page directly.

Therefore, this patch makes this change.  In the process, it also cleans
up the API exposed to filesystems that allows testing whether a page is
a bounce page, getting the pagecache page from a bounce page, and
freeing a bounce page.

Reviewed-by: Chandan Rajendra <chandan@linux.ibm.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/bio.c             |  38 ++-----------
 fs/crypto/crypto.c          | 104 ++++++++++++------------------------
 fs/crypto/fscrypt_private.h |   4 +-
 fs/ext4/page-io.c           |  36 +++++--------
 fs/f2fs/data.c              |  12 ++---
 include/linux/fscrypt.h     |  38 ++++++++-----
 6 files changed, 84 insertions(+), 148 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index b46021ebde856..c857b70b5328c 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -70,46 +70,18 @@ void fscrypt_enqueue_decrypt_bio(struct fscrypt_ctx *ctx, struct bio *bio)
 }
 EXPORT_SYMBOL(fscrypt_enqueue_decrypt_bio);
 
-void fscrypt_pullback_bio_page(struct page **page, bool restore)
-{
-	struct fscrypt_ctx *ctx;
-	struct page *bounce_page;
-
-	/* The bounce data pages are unmapped. */
-	if ((*page)->mapping)
-		return;
-
-	/* The bounce data page is unmapped. */
-	bounce_page = *page;
-	ctx = (struct fscrypt_ctx *)page_private(bounce_page);
-
-	/* restore control page */
-	*page = ctx->w.control_page;
-
-	if (restore)
-		fscrypt_restore_control_page(bounce_page);
-}
-EXPORT_SYMBOL(fscrypt_pullback_bio_page);
-
 int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 				sector_t pblk, unsigned int len)
 {
-	struct fscrypt_ctx *ctx;
-	struct page *ciphertext_page = NULL;
+	struct page *ciphertext_page;
 	struct bio *bio;
 	int ret, err = 0;
 
 	BUG_ON(inode->i_sb->s_blocksize != PAGE_SIZE);
 
-	ctx = fscrypt_get_ctx(GFP_NOFS);
-	if (IS_ERR(ctx))
-		return PTR_ERR(ctx);
-
-	ciphertext_page = fscrypt_alloc_bounce_page(ctx, GFP_NOWAIT);
-	if (IS_ERR(ciphertext_page)) {
-		err = PTR_ERR(ciphertext_page);
-		goto errout;
-	}
+	ciphertext_page = fscrypt_alloc_bounce_page(GFP_NOWAIT);
+	if (!ciphertext_page)
+		return -ENOMEM;
 
 	while (len--) {
 		err = fscrypt_do_page_crypto(inode, FS_ENCRYPT, lblk,
@@ -147,7 +119,7 @@ int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 	}
 	err = 0;
 errout:
-	fscrypt_release_ctx(ctx);
+	fscrypt_free_bounce_page(ciphertext_page);
 	return err;
 }
 EXPORT_SYMBOL(fscrypt_zeroout_range);
diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 68e2ca4c4af63..4b076f8daab75 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -63,18 +63,11 @@ EXPORT_SYMBOL(fscrypt_enqueue_decrypt_work);
  *
  * If the encryption context was allocated from the pre-allocated pool, returns
  * it to that pool. Else, frees it.
- *
- * If there's a bounce page in the context, this frees that.
  */
 void fscrypt_release_ctx(struct fscrypt_ctx *ctx)
 {
 	unsigned long flags;
 
-	if (ctx->flags & FS_CTX_HAS_BOUNCE_BUFFER_FL && ctx->w.bounce_page) {
-		mempool_free(ctx->w.bounce_page, fscrypt_bounce_page_pool);
-		ctx->w.bounce_page = NULL;
-	}
-	ctx->w.control_page = NULL;
 	if (ctx->flags & FS_CTX_REQUIRES_FREE_ENCRYPT_FL) {
 		kmem_cache_free(fscrypt_ctx_cachep, ctx);
 	} else {
@@ -99,14 +92,8 @@ struct fscrypt_ctx *fscrypt_get_ctx(gfp_t gfp_flags)
 	unsigned long flags;
 
 	/*
-	 * We first try getting the ctx from a free list because in
-	 * the common case the ctx will have an allocated and
-	 * initialized crypto tfm, so it's probably a worthwhile
-	 * optimization. For the bounce page, we first try getting it
-	 * from the kernel allocator because that's just about as fast
-	 * as getting it from a list and because a cache of free pages
-	 * should generally be a "last resort" option for a filesystem
-	 * to be able to do its job.
+	 * First try getting a ctx from the free list so that we don't have to
+	 * call into the slab allocator.
 	 */
 	spin_lock_irqsave(&fscrypt_ctx_lock, flags);
 	ctx = list_first_entry_or_null(&fscrypt_free_ctxs,
@@ -122,11 +109,31 @@ struct fscrypt_ctx *fscrypt_get_ctx(gfp_t gfp_flags)
 	} else {
 		ctx->flags &= ~FS_CTX_REQUIRES_FREE_ENCRYPT_FL;
 	}
-	ctx->flags &= ~FS_CTX_HAS_BOUNCE_BUFFER_FL;
 	return ctx;
 }
 EXPORT_SYMBOL(fscrypt_get_ctx);
 
+struct page *fscrypt_alloc_bounce_page(gfp_t gfp_flags)
+{
+	return mempool_alloc(fscrypt_bounce_page_pool, gfp_flags);
+}
+
+/**
+ * fscrypt_free_bounce_page() - free a ciphertext bounce page
+ *
+ * Free a bounce page that was allocated by fscrypt_encrypt_page(), or by
+ * fscrypt_alloc_bounce_page() directly.
+ */
+void fscrypt_free_bounce_page(struct page *bounce_page)
+{
+	if (!bounce_page)
+		return;
+	set_page_private(bounce_page, (unsigned long)NULL);
+	ClearPagePrivate(bounce_page);
+	mempool_free(bounce_page, fscrypt_bounce_page_pool);
+}
+EXPORT_SYMBOL(fscrypt_free_bounce_page);
+
 void fscrypt_generate_iv(union fscrypt_iv *iv, u64 lblk_num,
 			 const struct fscrypt_info *ci)
 {
@@ -185,16 +192,6 @@ int fscrypt_do_page_crypto(const struct inode *inode, fscrypt_direction_t rw,
 	return 0;
 }
 
-struct page *fscrypt_alloc_bounce_page(struct fscrypt_ctx *ctx,
-				       gfp_t gfp_flags)
-{
-	ctx->w.bounce_page = mempool_alloc(fscrypt_bounce_page_pool, gfp_flags);
-	if (ctx->w.bounce_page == NULL)
-		return ERR_PTR(-ENOMEM);
-	ctx->flags |= FS_CTX_HAS_BOUNCE_BUFFER_FL;
-	return ctx->w.bounce_page;
-}
-
 /**
  * fscypt_encrypt_page() - Encrypts a page
  * @inode:     The inode for which the encryption should take place
@@ -209,22 +206,12 @@ struct page *fscrypt_alloc_bounce_page(struct fscrypt_ctx *ctx,
  *             previously written data.
  * @gfp_flags: The gfp flag for memory allocation
  *
- * Encrypts @page using the ctx encryption context. Performs encryption
- * either in-place or into a newly allocated bounce page.
- * Called on the page write path.
- *
- * Bounce page allocation is the default.
- * In this case, the contents of @page are encrypted and stored in an
- * allocated bounce page. @page has to be locked and the caller must call
- * fscrypt_restore_control_page() on the returned ciphertext page to
- * release the bounce buffer and the encryption context.
- *
- * In-place encryption is used by setting the FS_CFLG_OWN_PAGES flag in
- * fscrypt_operations. Here, the input-page is returned with its content
- * encrypted.
+ * Encrypts @page.  If the filesystem set FS_CFLG_OWN_PAGES, then the data is
+ * encrypted in-place and @page is returned.  Else, a bounce page is allocated,
+ * the data is encrypted into the bounce page, and the bounce page is returned.
+ * The caller is responsible for calling fscrypt_free_bounce_page().
  *
- * Return: A page with the encrypted content on success. Else, an
- * error value or NULL.
+ * Return: A page containing the encrypted data on success, else an ERR_PTR()
  */
 struct page *fscrypt_encrypt_page(const struct inode *inode,
 				struct page *page,
@@ -233,7 +220,6 @@ struct page *fscrypt_encrypt_page(const struct inode *inode,
 				u64 lblk_num, gfp_t gfp_flags)
 
 {
-	struct fscrypt_ctx *ctx;
 	struct page *ciphertext_page = page;
 	int err;
 
@@ -252,30 +238,20 @@ struct page *fscrypt_encrypt_page(const struct inode *inode,
 
 	BUG_ON(!PageLocked(page));
 
-	ctx = fscrypt_get_ctx(gfp_flags);
-	if (IS_ERR(ctx))
-		return ERR_CAST(ctx);
-
 	/* The encryption operation will require a bounce page. */
-	ciphertext_page = fscrypt_alloc_bounce_page(ctx, gfp_flags);
-	if (IS_ERR(ciphertext_page))
-		goto errout;
+	ciphertext_page = fscrypt_alloc_bounce_page(gfp_flags);
+	if (!ciphertext_page)
+		return ERR_PTR(-ENOMEM);
 
-	ctx->w.control_page = page;
 	err = fscrypt_do_page_crypto(inode, FS_ENCRYPT, lblk_num,
 				     page, ciphertext_page, len, offs,
 				     gfp_flags);
 	if (err) {
-		ciphertext_page = ERR_PTR(err);
-		goto errout;
+		fscrypt_free_bounce_page(ciphertext_page);
+		return ERR_PTR(err);
 	}
 	SetPagePrivate(ciphertext_page);
-	set_page_private(ciphertext_page, (unsigned long)ctx);
-	lock_page(ciphertext_page);
-	return ciphertext_page;
-
-errout:
-	fscrypt_release_ctx(ctx);
+	set_page_private(ciphertext_page, (unsigned long)page);
 	return ciphertext_page;
 }
 EXPORT_SYMBOL(fscrypt_encrypt_page);
@@ -354,18 +330,6 @@ const struct dentry_operations fscrypt_d_ops = {
 	.d_revalidate = fscrypt_d_revalidate,
 };
 
-void fscrypt_restore_control_page(struct page *page)
-{
-	struct fscrypt_ctx *ctx;
-
-	ctx = (struct fscrypt_ctx *)page_private(page);
-	set_page_private(page, (unsigned long)NULL);
-	ClearPagePrivate(page);
-	unlock_page(page);
-	fscrypt_release_ctx(ctx);
-}
-EXPORT_SYMBOL(fscrypt_restore_control_page);
-
 static void fscrypt_destroy(void)
 {
 	struct fscrypt_ctx *pos, *n;
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 7da2761595933..4122ee1a0b7b1 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -94,7 +94,6 @@ typedef enum {
 } fscrypt_direction_t;
 
 #define FS_CTX_REQUIRES_FREE_ENCRYPT_FL		0x00000001
-#define FS_CTX_HAS_BOUNCE_BUFFER_FL		0x00000002
 
 static inline bool fscrypt_valid_enc_modes(u32 contents_mode,
 					   u32 filenames_mode)
@@ -123,8 +122,7 @@ extern int fscrypt_do_page_crypto(const struct inode *inode,
 				  struct page *dest_page,
 				  unsigned int len, unsigned int offs,
 				  gfp_t gfp_flags);
-extern struct page *fscrypt_alloc_bounce_page(struct fscrypt_ctx *ctx,
-					      gfp_t gfp_flags);
+extern struct page *fscrypt_alloc_bounce_page(gfp_t gfp_flags);
 extern const struct dentry_operations fscrypt_d_ops;
 
 extern void __printf(3, 4) __cold
diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
index 4690618a92e93..13d5ecc0af03f 100644
--- a/fs/ext4/page-io.c
+++ b/fs/ext4/page-io.c
@@ -66,9 +66,7 @@ static void ext4_finish_bio(struct bio *bio)
 
 	bio_for_each_segment_all(bvec, bio, iter_all) {
 		struct page *page = bvec->bv_page;
-#ifdef CONFIG_FS_ENCRYPTION
-		struct page *data_page = NULL;
-#endif
+		struct page *bounce_page = NULL;
 		struct buffer_head *bh, *head;
 		unsigned bio_start = bvec->bv_offset;
 		unsigned bio_end = bio_start + bvec->bv_len;
@@ -78,13 +76,10 @@ static void ext4_finish_bio(struct bio *bio)
 		if (!page)
 			continue;
 
-#ifdef CONFIG_FS_ENCRYPTION
-		if (!page->mapping) {
-			/* The bounce data pages are unmapped. */
-			data_page = page;
-			fscrypt_pullback_bio_page(&page, false);
+		if (fscrypt_is_bounce_page(page)) {
+			bounce_page = page;
+			page = fscrypt_pagecache_page(bounce_page);
 		}
-#endif
 
 		if (bio->bi_status) {
 			SetPageError(page);
@@ -111,10 +106,7 @@ static void ext4_finish_bio(struct bio *bio)
 		bit_spin_unlock(BH_Uptodate_Lock, &head->b_state);
 		local_irq_restore(flags);
 		if (!under_io) {
-#ifdef CONFIG_FS_ENCRYPTION
-			if (data_page)
-				fscrypt_restore_control_page(data_page);
-#endif
+			fscrypt_free_bounce_page(bounce_page);
 			end_page_writeback(page);
 		}
 	}
@@ -415,7 +407,7 @@ int ext4_bio_write_page(struct ext4_io_submit *io,
 			struct writeback_control *wbc,
 			bool keep_towrite)
 {
-	struct page *data_page = NULL;
+	struct page *bounce_page = NULL;
 	struct inode *inode = page->mapping->host;
 	unsigned block_start;
 	struct buffer_head *bh, *head;
@@ -479,10 +471,10 @@ int ext4_bio_write_page(struct ext4_io_submit *io,
 		gfp_t gfp_flags = GFP_NOFS;
 
 	retry_encrypt:
-		data_page = fscrypt_encrypt_page(inode, page, PAGE_SIZE, 0,
-						page->index, gfp_flags);
-		if (IS_ERR(data_page)) {
-			ret = PTR_ERR(data_page);
+		bounce_page = fscrypt_encrypt_page(inode, page, PAGE_SIZE, 0,
+						   page->index, gfp_flags);
+		if (IS_ERR(bounce_page)) {
+			ret = PTR_ERR(bounce_page);
 			if (ret == -ENOMEM && wbc->sync_mode == WB_SYNC_ALL) {
 				if (io->io_bio) {
 					ext4_io_submit(io);
@@ -491,7 +483,7 @@ int ext4_bio_write_page(struct ext4_io_submit *io,
 				gfp_flags |= __GFP_NOFAIL;
 				goto retry_encrypt;
 			}
-			data_page = NULL;
+			bounce_page = NULL;
 			goto out;
 		}
 	}
@@ -500,8 +492,7 @@ int ext4_bio_write_page(struct ext4_io_submit *io,
 	do {
 		if (!buffer_async_write(bh))
 			continue;
-		ret = io_submit_add_bh(io, inode,
-				       data_page ? data_page : page, bh);
+		ret = io_submit_add_bh(io, inode, bounce_page ?: page, bh);
 		if (ret) {
 			/*
 			 * We only get here on ENOMEM.  Not much else
@@ -517,8 +508,7 @@ int ext4_bio_write_page(struct ext4_io_submit *io,
 	/* Error stopped previous loop? Clean up buffers... */
 	if (ret) {
 	out:
-		if (data_page)
-			fscrypt_restore_control_page(data_page);
+		fscrypt_free_bounce_page(bounce_page);
 		printk_ratelimited(KERN_ERR "%s: ret = %d\n", __func__, ret);
 		redirty_page_for_writepage(wbc, page);
 		do {
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index eda4181d20926..968ebdbcb5834 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -185,7 +185,7 @@ static void f2fs_write_end_io(struct bio *bio)
 			continue;
 		}
 
-		fscrypt_pullback_bio_page(&page, true);
+		fscrypt_finalize_bounce_page(&page);
 
 		if (unlikely(bio->bi_status)) {
 			mapping_set_error(page->mapping, -EIO);
@@ -362,10 +362,9 @@ static bool __has_merged_page(struct f2fs_bio_info *io, struct inode *inode,
 
 	bio_for_each_segment_all(bvec, io->bio, iter_all) {
 
-		if (bvec->bv_page->mapping)
-			target = bvec->bv_page;
-		else
-			target = fscrypt_control_page(bvec->bv_page);
+		target = bvec->bv_page;
+		if (fscrypt_is_bounce_page(target))
+			target = fscrypt_pagecache_page(target);
 
 		if (inode && inode == target->mapping->host)
 			return true;
@@ -1900,8 +1899,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		err = f2fs_inplace_write_data(fio);
 		if (err) {
 			if (f2fs_encrypted_file(inode))
-				fscrypt_pullback_bio_page(&fio->encrypted_page,
-									true);
+				fscrypt_finalize_bounce_page(&fio->encrypted_page);
 			if (PageWriteback(page))
 				end_page_writeback(page);
 		} else {
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index f7680ef1abd2d..d016fa384d607 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -112,12 +112,17 @@ extern struct page *fscrypt_encrypt_page(const struct inode *, struct page *,
 extern int fscrypt_decrypt_page(const struct inode *, struct page *, unsigned int,
 				unsigned int, u64);
 
-static inline struct page *fscrypt_control_page(struct page *page)
+static inline bool fscrypt_is_bounce_page(struct page *page)
 {
-	return ((struct fscrypt_ctx *)page_private(page))->w.control_page;
+	return page->mapping == NULL;
 }
 
-extern void fscrypt_restore_control_page(struct page *);
+static inline struct page *fscrypt_pagecache_page(struct page *bounce_page)
+{
+	return (struct page *)page_private(bounce_page);
+}
+
+extern void fscrypt_free_bounce_page(struct page *bounce_page);
 
 /* policy.c */
 extern int fscrypt_ioctl_set_policy(struct file *, const void __user *);
@@ -223,7 +228,6 @@ static inline bool fscrypt_match_name(const struct fscrypt_name *fname,
 extern void fscrypt_decrypt_bio(struct bio *);
 extern void fscrypt_enqueue_decrypt_bio(struct fscrypt_ctx *ctx,
 					struct bio *bio);
-extern void fscrypt_pullback_bio_page(struct page **, bool);
 extern int fscrypt_zeroout_range(const struct inode *, pgoff_t, sector_t,
 				 unsigned int);
 
@@ -300,15 +304,19 @@ static inline int fscrypt_decrypt_page(const struct inode *inode,
 	return -EOPNOTSUPP;
 }
 
-static inline struct page *fscrypt_control_page(struct page *page)
+static inline bool fscrypt_is_bounce_page(struct page *page)
+{
+	return false;
+}
+
+static inline struct page *fscrypt_pagecache_page(struct page *bounce_page)
 {
 	WARN_ON_ONCE(1);
 	return ERR_PTR(-EINVAL);
 }
 
-static inline void fscrypt_restore_control_page(struct page *page)
+static inline void fscrypt_free_bounce_page(struct page *bounce_page)
 {
-	return;
 }
 
 /* policy.c */
@@ -410,11 +418,6 @@ static inline void fscrypt_enqueue_decrypt_bio(struct fscrypt_ctx *ctx,
 {
 }
 
-static inline void fscrypt_pullback_bio_page(struct page **page, bool restore)
-{
-	return;
-}
-
 static inline int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 					sector_t pblk, unsigned int len)
 {
@@ -692,4 +695,15 @@ static inline int fscrypt_encrypt_symlink(struct inode *inode,
 	return 0;
 }
 
+/* If *pagep is a bounce page, free it and set *pagep to the pagecache page */
+static inline void fscrypt_finalize_bounce_page(struct page **pagep)
+{
+	struct page *page = *pagep;
+
+	if (fscrypt_is_bounce_page(page)) {
+		*pagep = fscrypt_pagecache_page(page);
+		fscrypt_free_bounce_page(page);
+	}
+}
+
 #endif	/* _LINUX_FSCRYPT_H */
-- 
2.21.0.1020.gf2820cf01a-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
