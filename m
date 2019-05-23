Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB16A282DD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 May 2019 18:20:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hTqSb-0000cj-CI; Thu, 23 May 2019 16:20:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hTqSa-0000c9-Bn
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 16:20:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U1EAkVXiPBuvokxPJCEVl2NpYZT9PoQ4wQ8FZxPwkKQ=; b=NMUgoLddRnsapKM72jo+EBtoH/
 obPbgfgY60tVxtzDsJpamCZWtyv2JuoNOGH7kLJ8PkRIvGlTr3fFO51D+KDx/+j0K/QleE+jOl4Hc
 OTxXNq3CbtJO5LcsYeP5m4Tv4hLY7aib0elI3bh18ULhhFxlukf7dffpgNpJ22sUl8mk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U1EAkVXiPBuvokxPJCEVl2NpYZT9PoQ4wQ8FZxPwkKQ=; b=a9+rSkUqTxX4tKdKnvJGxwQmGu
 du8dZbQAbp/HuddjhCMZtBPnXlKwqmUlQFaSzNUI6uU9NtFhjsoy0OSkoFTet83zpiNRlcV4XxmTp
 bD2ZWT0KHmAYGtFCFEzFW3H3IcLlvbwTKzPNg3KOJTo8IWzUjBMba11+qWUnivaKs8As=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hTqSY-009b4L-Vw
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 16:20:52 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4BDAF2187F;
 Thu, 23 May 2019 16:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558628440;
 bh=Ki1psB87yKRHhq81l5k/G75y/4UuQIxJVCz2vUr0dx8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wh7nw1tR49gasjJK66tsSrPuZ4jijbWiLmyfmvvSK9seoD4R4AEt21UzZiK6GBc4m
 kJl2GAfG30oaNm9Pmlyg4q9OMR0rKddhFcmC/dPKvLjIAwLQZAbGr2qvcoxnB6+RuJ
 i4QQv0fxn5uG6ZriLbzuV6o3tm8PPWINMH2E7BN0=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Thu, 23 May 2019 09:18:10 -0700
Message-Id: <20190523161811.6259-15-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190523161811.6259-1-ebiggers@kernel.org>
References: <20190523161811.6259-1-ebiggers@kernel.org>
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
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hTqSY-009b4L-Vw
Subject: [f2fs-dev] [PATCH v3 14/15] ext4: add fs-verity read support
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-integrity@vger.kernel.org,
 linux-ext4@vger.kernel.org, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Make ext4_mpage_readpages() verify data as it is read from fs-verity
files, using the helper functions from fs/verity/.

To support both encryption and verity simultaneously, this required
refactoring the decryption workflow into a generic "post-read
processing" workflow which can do decryption, verification, or both.

The case where the ext4 block size is not equal to the PAGE_SIZE is not
supported yet, since in that case ext4_mpage_readpages() sometimes falls
back to block_read_full_page(), which does not support fs-verity yet.

Co-developed-by: Theodore Ts'o <tytso@mit.edu>
Signed-off-by: Theodore Ts'o <tytso@mit.edu>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/ext4.h     |   2 +
 fs/ext4/readpage.c | 209 ++++++++++++++++++++++++++++++++++++++-------
 fs/ext4/super.c    |   9 +-
 3 files changed, 189 insertions(+), 31 deletions(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 20719259d3d73..e8481834232ec 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -3158,6 +3158,8 @@ static inline void ext4_set_de_type(struct super_block *sb,
 extern int ext4_mpage_readpages(struct address_space *mapping,
 				struct list_head *pages, struct page *page,
 				unsigned nr_pages, bool is_readahead);
+extern int __init ext4_init_post_read_processing(void);
+extern void ext4_exit_post_read_processing(void);
 
 /* symlink.c */
 extern const struct inode_operations ext4_encrypted_symlink_inode_operations;
diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index c916017db3344..67e86a1948634 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -47,6 +47,11 @@
 
 #include "ext4.h"
 
+#define NUM_PREALLOC_POST_READ_CTXS	128
+
+static struct kmem_cache *bio_post_read_ctx_cache;
+static mempool_t *bio_post_read_ctx_pool;
+
 static inline bool ext4_bio_encrypted(struct bio *bio)
 {
 #ifdef CONFIG_FS_ENCRYPTION
@@ -56,6 +61,130 @@ static inline bool ext4_bio_encrypted(struct bio *bio)
 #endif
 }
 
+/* postprocessing steps for read bios */
+enum bio_post_read_step {
+	STEP_INITIAL = 0,
+	STEP_DECRYPT,
+	STEP_VERITY,
+};
+
+struct bio_post_read_ctx {
+	struct bio *bio;
+	struct work_struct work;
+	unsigned int cur_step;
+	unsigned int enabled_steps;
+};
+
+static void __read_end_io(struct bio *bio)
+{
+	struct page *page;
+	struct bio_vec *bv;
+	struct bvec_iter_all iter_all;
+
+	bio_for_each_segment_all(bv, bio, iter_all) {
+		page = bv->bv_page;
+
+		/* PG_error was set if any post_read step failed */
+		if (bio->bi_status || PageError(page)) {
+			ClearPageUptodate(page);
+			/* will re-read again later */
+			ClearPageError(page);
+		} else {
+			SetPageUptodate(page);
+		}
+		unlock_page(page);
+	}
+	if (bio->bi_private)
+		mempool_free(bio->bi_private, bio_post_read_ctx_pool);
+	bio_put(bio);
+}
+
+static void bio_post_read_processing(struct bio_post_read_ctx *ctx);
+
+static void decrypt_work(struct work_struct *work)
+{
+	struct bio_post_read_ctx *ctx =
+		container_of(work, struct bio_post_read_ctx, work);
+
+	fscrypt_decrypt_bio(ctx->bio);
+
+	bio_post_read_processing(ctx);
+}
+
+static void verity_work(struct work_struct *work)
+{
+	struct bio_post_read_ctx *ctx =
+		container_of(work, struct bio_post_read_ctx, work);
+
+	fsverity_verify_bio(ctx->bio);
+
+	bio_post_read_processing(ctx);
+}
+
+static void bio_post_read_processing(struct bio_post_read_ctx *ctx)
+{
+	/*
+	 * We use different work queues for decryption and for verity because
+	 * verity may require reading metadata pages that need decryption, and
+	 * we shouldn't recurse to the same workqueue.
+	 */
+	switch (++ctx->cur_step) {
+	case STEP_DECRYPT:
+		if (ctx->enabled_steps & (1 << STEP_DECRYPT)) {
+			INIT_WORK(&ctx->work, decrypt_work);
+			fscrypt_enqueue_decrypt_work(&ctx->work);
+			return;
+		}
+		ctx->cur_step++;
+		/* fall-through */
+	case STEP_VERITY:
+		if (ctx->enabled_steps & (1 << STEP_VERITY)) {
+			INIT_WORK(&ctx->work, verity_work);
+			fsverity_enqueue_verify_work(&ctx->work);
+			return;
+		}
+		ctx->cur_step++;
+		/* fall-through */
+	default:
+		__read_end_io(ctx->bio);
+	}
+}
+
+static inline bool ext4_need_verity(const struct inode *inode, pgoff_t idx)
+{
+	return IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode) &&
+	       idx < (inode->i_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
+}
+
+static struct bio_post_read_ctx *get_bio_post_read_ctx(struct inode *inode,
+						       struct bio *bio,
+						       pgoff_t first_idx)
+{
+	unsigned int post_read_steps = 0;
+	struct bio_post_read_ctx *ctx = NULL;
+
+	if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode))
+		post_read_steps |= 1 << STEP_DECRYPT;
+
+	if (ext4_need_verity(inode, first_idx))
+		post_read_steps |= 1 << STEP_VERITY;
+
+	if (post_read_steps) {
+		ctx = mempool_alloc(bio_post_read_ctx_pool, GFP_NOFS);
+		if (!ctx)
+			return ERR_PTR(-ENOMEM);
+		ctx->bio = bio;
+		ctx->enabled_steps = post_read_steps;
+		bio->bi_private = ctx;
+	}
+	return ctx;
+}
+
+static bool bio_post_read_required(struct bio *bio)
+{
+	return bio->bi_private && !bio->bi_status;
+}
+
 /*
  * I/O completion handler for multipage BIOs.
  *
@@ -70,30 +199,23 @@ static inline bool ext4_bio_encrypted(struct bio *bio)
  */
 static void mpage_end_io(struct bio *bio)
 {
-	struct bio_vec *bv;
-	struct bvec_iter_all iter_all;
+	if (bio_post_read_required(bio)) {
+		struct bio_post_read_ctx *ctx = bio->bi_private;
 
-	if (ext4_bio_encrypted(bio)) {
-		if (bio->bi_status) {
-			fscrypt_release_ctx(bio->bi_private);
-		} else {
-			fscrypt_enqueue_decrypt_bio(bio->bi_private, bio);
-			return;
-		}
+		ctx->cur_step = STEP_INITIAL;
+		bio_post_read_processing(ctx);
+		return;
 	}
-	bio_for_each_segment_all(bv, bio, iter_all) {
-		struct page *page = bv->bv_page;
+	__read_end_io(bio);
+}
 
-		if (!bio->bi_status) {
-			SetPageUptodate(page);
-		} else {
-			ClearPageUptodate(page);
-			SetPageError(page);
-		}
-		unlock_page(page);
-	}
+static inline loff_t ext4_readpage_limit(struct inode *inode)
+{
+	if (IS_ENABLED(CONFIG_FS_VERITY) &&
+	    (IS_VERITY(inode) || ext4_verity_in_progress(inode)))
+		return inode->i_sb->s_maxbytes;
 
-	bio_put(bio);
+	return i_size_read(inode);
 }
 
 int ext4_mpage_readpages(struct address_space *mapping,
@@ -141,7 +263,8 @@ int ext4_mpage_readpages(struct address_space *mapping,
 
 		block_in_file = (sector_t)page->index << (PAGE_SHIFT - blkbits);
 		last_block = block_in_file + nr_pages * blocks_per_page;
-		last_block_in_file = (i_size_read(inode) + blocksize - 1) >> blkbits;
+		last_block_in_file = (ext4_readpage_limit(inode) +
+				      blocksize - 1) >> blkbits;
 		if (last_block > last_block_in_file)
 			last_block = last_block_in_file;
 		page_block = 0;
@@ -218,6 +341,9 @@ int ext4_mpage_readpages(struct address_space *mapping,
 			zero_user_segment(page, first_hole << blkbits,
 					  PAGE_SIZE);
 			if (first_hole == 0) {
+				if (ext4_need_verity(inode, page->index) &&
+				    !fsverity_verify_page(page))
+					goto set_error_page;
 				SetPageUptodate(page);
 				unlock_page(page);
 				goto next_page;
@@ -241,18 +367,15 @@ int ext4_mpage_readpages(struct address_space *mapping,
 			bio = NULL;
 		}
 		if (bio == NULL) {
-			struct fscrypt_ctx *ctx = NULL;
+			struct bio_post_read_ctx *ctx;
 
-			if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode)) {
-				ctx = fscrypt_get_ctx(GFP_NOFS);
-				if (IS_ERR(ctx))
-					goto set_error_page;
-			}
 			bio = bio_alloc(GFP_KERNEL,
 				min_t(int, nr_pages, BIO_MAX_PAGES));
-			if (!bio) {
-				if (ctx)
-					fscrypt_release_ctx(ctx);
+			if (!bio)
+				goto set_error_page;
+			ctx = get_bio_post_read_ctx(inode, bio, page->index);
+			if (IS_ERR(ctx)) {
+				bio_put(bio);
 				goto set_error_page;
 			}
 			bio_set_dev(bio, bdev);
@@ -293,3 +416,29 @@ int ext4_mpage_readpages(struct address_space *mapping,
 		submit_bio(bio);
 	return 0;
 }
+
+int __init ext4_init_post_read_processing(void)
+{
+	bio_post_read_ctx_cache =
+		kmem_cache_create("ext4_bio_post_read_ctx",
+				  sizeof(struct bio_post_read_ctx), 0, 0, NULL);
+	if (!bio_post_read_ctx_cache)
+		goto fail;
+	bio_post_read_ctx_pool =
+		mempool_create_slab_pool(NUM_PREALLOC_POST_READ_CTXS,
+					 bio_post_read_ctx_cache);
+	if (!bio_post_read_ctx_pool)
+		goto fail_free_cache;
+	return 0;
+
+fail_free_cache:
+	kmem_cache_destroy(bio_post_read_ctx_cache);
+fail:
+	return -ENOMEM;
+}
+
+void ext4_exit_post_read_processing(void)
+{
+	mempool_destroy(bio_post_read_ctx_pool);
+	kmem_cache_destroy(bio_post_read_ctx_cache);
+}
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 05a9874687c36..23e7acd43e4ee 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -6103,6 +6103,10 @@ static int __init ext4_init_fs(void)
 		return err;
 
 	err = ext4_init_pending();
+	if (err)
+		goto out7;
+
+	err = ext4_init_post_read_processing();
 	if (err)
 		goto out6;
 
@@ -6144,8 +6148,10 @@ static int __init ext4_init_fs(void)
 out4:
 	ext4_exit_pageio();
 out5:
-	ext4_exit_pending();
+	ext4_exit_post_read_processing();
 out6:
+	ext4_exit_pending();
+out7:
 	ext4_exit_es();
 
 	return err;
@@ -6162,6 +6168,7 @@ static void __exit ext4_exit_fs(void)
 	ext4_exit_sysfs();
 	ext4_exit_system_zone();
 	ext4_exit_pageio();
+	ext4_exit_post_read_processing();
 	ext4_exit_es();
 	ext4_exit_pending();
 }
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
