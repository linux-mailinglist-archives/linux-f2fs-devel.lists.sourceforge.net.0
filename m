Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0862D2EA57A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Jan 2021 07:38:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kwfym-0002SU-Ud; Tue, 05 Jan 2021 06:38:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kwfyk-0002SM-Cy
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 06:38:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y+9ZPID25fBb3rJnWCHsJfRakoilw5IG6TJWDRDJTz0=; b=fKP9Czap37wFQIqnCZk8i0Qozr
 UIjOV5sTc68JEKmPeLAd50CAPpioFcWlrg1B6JWroa9YdcTmXo9CipA603IQ/Ys4ur4soUGlLaEB/
 pWSdYBhdzGz1YdVumPrTVlBCpBoh0UyzMGek9qkXdDoSMGtQp1rCVcZiANE+NXAMAjvw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=y+9ZPID25fBb3rJnWCHsJfRakoilw5IG6TJWDRDJTz0=; b=A
 bwYBdkvrePK8q7nUYhrt2M12HCrEumW+lwNxosB6to4Ljyx//us+Hee+F260H6vP2aGStgEGfFtD1
 LoVvyC9cWjYBWkPji4CAZmnF5SenzzlpCEti06w5HcF6iIdgsXqGb4j39lX+4BvVb7WrsZpG2Ovry
 7JYrO8yWmICPfHNw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kwfyg-00ExES-Bq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 06:38:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B906F22286;
 Tue,  5 Jan 2021 06:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609828667;
 bh=bD40dZtr2CFPbzk/HKLnnxzgRU9DKEszl/bDjPKNLOw=;
 h=From:To:Cc:Subject:Date:From;
 b=Fa5Imv1cgli0zXgqo9Jt7km6MS/7MzkkREEvuTWBoR1OV1VVX8ukI4EYx3qYlF40A
 hFH79d9ibUTeeWACRXz91RMQZm5XashKWPaOKD2YDASEXibIs8TufoxrFFgBTP6uvu
 T+UdaDZu2zg0UccsjxF70ipEYOVy7lY5b9C/C6gSJj8g7XyGL270TaTEH2bwh2hZKD
 sR4hfKzm5TSVJ1o13+ldtqdve6T93nrMNB7H7ykQ7jL2CEc+43XVaUQBYSiymPtrDv
 K8vuQyDu1dsLAUncjtRD/VGGUX3AqrwxGuOyaMksttGAeDQWDnLGd6oP/s+Ci7QWXh
 IJUCNoibzL3Lw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  4 Jan 2021 22:33:02 -0800
Message-Id: <20210105063302.59006-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kwfyg-00ExES-Bq
Subject: [f2fs-dev] [PATCH v3] f2fs: clean up post-read processing
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
Cc: linux-fscrypt@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Rework the post-read processing logic to be much easier to understand.

At least one bug is fixed by this: if an I/O error occurred when reading
from disk, decryption and verity would be performed on the uninitialized
data, causing misleading messages in the kernel log.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---

Changed v2 => v3:
  - Moved STEP_DECOMPRESS handling into its own function.
  - Renamed f2fs_put_page_decompress_io_ctx() to f2fs_put_page_dic().
  - Kept old tracepoint name.
  - Improved some comments.

Changed v1 => v2:
  - Rebased onto v5.11-rc1.

 fs/f2fs/compress.c | 149 +++++++++++++------
 fs/f2fs/data.c     | 357 ++++++++++++++++++---------------------------
 fs/f2fs/f2fs.h     |  55 ++++++-
 3 files changed, 297 insertions(+), 264 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 4bcbacfe33259..68dc8b59d16a9 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -721,38 +721,27 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 	return ret;
 }
 
-void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
+static void f2fs_decompress_cluster(struct decompress_io_ctx *dic)
 {
-	struct decompress_io_ctx *dic =
-			(struct decompress_io_ctx *)page_private(page);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dic->inode);
-	struct f2fs_inode_info *fi= F2FS_I(dic->inode);
+	struct f2fs_inode_info *fi = F2FS_I(dic->inode);
 	const struct f2fs_compress_ops *cops =
 			f2fs_cops[fi->i_compress_algorithm];
 	int ret;
 	int i;
 
-	dec_page_count(sbi, F2FS_RD_DATA);
-
-	if (bio->bi_status || PageError(page))
-		dic->failed = true;
-
-	if (atomic_dec_return(&dic->pending_pages))
-		return;
-
 	trace_f2fs_decompress_pages_start(dic->inode, dic->cluster_idx,
 				dic->cluster_size, fi->i_compress_algorithm);
 
-	/* submit partial compressed pages */
 	if (dic->failed) {
 		ret = -EIO;
-		goto out_free_dic;
+		goto out_end_io;
 	}
 
 	dic->tpages = page_array_alloc(dic->inode, dic->cluster_size);
 	if (!dic->tpages) {
 		ret = -ENOMEM;
-		goto out_free_dic;
+		goto out_end_io;
 	}
 
 	for (i = 0; i < dic->cluster_size; i++) {
@@ -764,20 +753,20 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
 		dic->tpages[i] = f2fs_compress_alloc_page();
 		if (!dic->tpages[i]) {
 			ret = -ENOMEM;
-			goto out_free_dic;
+			goto out_end_io;
 		}
 	}
 
 	if (cops->init_decompress_ctx) {
 		ret = cops->init_decompress_ctx(dic);
 		if (ret)
-			goto out_free_dic;
+			goto out_end_io;
 	}
 
 	dic->rbuf = f2fs_vmap(dic->tpages, dic->cluster_size);
 	if (!dic->rbuf) {
 		ret = -ENOMEM;
-		goto destroy_decompress_ctx;
+		goto out_destroy_decompress_ctx;
 	}
 
 	dic->cbuf = f2fs_vmap(dic->cpages, dic->nr_cpages);
@@ -816,18 +805,34 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
 	vm_unmap_ram(dic->cbuf, dic->nr_cpages);
 out_vunmap_rbuf:
 	vm_unmap_ram(dic->rbuf, dic->cluster_size);
-destroy_decompress_ctx:
+out_destroy_decompress_ctx:
 	if (cops->destroy_decompress_ctx)
 		cops->destroy_decompress_ctx(dic);
-out_free_dic:
-	if (!verity)
-		f2fs_decompress_end_io(dic->rpages, dic->cluster_size,
-								ret, false);
-
+out_end_io:
 	trace_f2fs_decompress_pages_end(dic->inode, dic->cluster_idx,
 							dic->clen, ret);
-	if (!verity)
-		f2fs_free_dic(dic);
+	f2fs_decompress_end_io(dic, ret);
+}
+
+/*
+ * This is called when a page of a compressed cluster has been read from disk
+ * (or failed to be read from disk).  It checks whether this page was the last
+ * page being waited on in the cluster, and if so, it decompresses the cluster
+ * (or in the case of a failure, cleans up without actually decompressing).
+ */
+void f2fs_end_read_compressed_page(struct page *page, bool failed)
+{
+	struct decompress_io_ctx *dic =
+			(struct decompress_io_ctx *)page_private(page);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(dic->inode);
+
+	dec_page_count(sbi, F2FS_RD_DATA);
+
+	if (failed)
+		WRITE_ONCE(dic->failed, true);
+
+	if (atomic_dec_and_test(&dic->remaining_pages))
+		f2fs_decompress_cluster(dic);
 }
 
 static bool is_page_in_cluster(struct compress_ctx *cc, pgoff_t index)
@@ -1494,6 +1499,8 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
 	return err;
 }
 
+static void f2fs_free_dic(struct decompress_io_ctx *dic);
+
 struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 {
 	struct decompress_io_ctx *dic;
@@ -1512,12 +1519,14 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 
 	dic->magic = F2FS_COMPRESSED_PAGE_MAGIC;
 	dic->inode = cc->inode;
-	atomic_set(&dic->pending_pages, cc->nr_cpages);
+	atomic_set(&dic->remaining_pages, cc->nr_cpages);
 	dic->cluster_idx = cc->cluster_idx;
 	dic->cluster_size = cc->cluster_size;
 	dic->log_cluster_size = cc->log_cluster_size;
 	dic->nr_cpages = cc->nr_cpages;
+	refcount_set(&dic->refcnt, 1);
 	dic->failed = false;
+	dic->need_verity = f2fs_need_verity(cc->inode, start_idx);
 
 	for (i = 0; i < dic->cluster_size; i++)
 		dic->rpages[i] = cc->rpages[i];
@@ -1546,7 +1555,7 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 	return ERR_PTR(-ENOMEM);
 }
 
-void f2fs_free_dic(struct decompress_io_ctx *dic)
+static void f2fs_free_dic(struct decompress_io_ctx *dic)
 {
 	int i;
 
@@ -1574,30 +1583,88 @@ void f2fs_free_dic(struct decompress_io_ctx *dic)
 	kmem_cache_free(dic_entry_slab, dic);
 }
 
-void f2fs_decompress_end_io(struct page **rpages,
-			unsigned int cluster_size, bool err, bool verity)
+static void f2fs_put_dic(struct decompress_io_ctx *dic)
+{
+	if (refcount_dec_and_test(&dic->refcnt))
+		f2fs_free_dic(dic);
+}
+
+/*
+ * Update and unlock the cluster's pagecache pages, and release the reference to
+ * the decompress_io_ctx that was being held for I/O completion.
+ */
+static void __f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed)
 {
 	int i;
 
-	for (i = 0; i < cluster_size; i++) {
-		struct page *rpage = rpages[i];
+	for (i = 0; i < dic->cluster_size; i++) {
+		struct page *rpage = dic->rpages[i];
 
 		if (!rpage)
 			continue;
 
-		if (err || PageError(rpage))
-			goto clear_uptodate;
-
-		if (!verity || fsverity_verify_page(rpage)) {
+		/* PG_error was set if verity failed. */
+		if (failed || PageError(rpage)) {
+			ClearPageUptodate(rpage);
+			/* will re-read again later */
+			ClearPageError(rpage);
+		} else {
 			SetPageUptodate(rpage);
-			goto unlock;
 		}
-clear_uptodate:
-		ClearPageUptodate(rpage);
-		ClearPageError(rpage);
-unlock:
 		unlock_page(rpage);
 	}
+
+	f2fs_put_dic(dic);
+}
+
+static void f2fs_verify_cluster(struct work_struct *work)
+{
+	struct decompress_io_ctx *dic =
+		container_of(work, struct decompress_io_ctx, verity_work);
+	int i;
+
+	/* Verify the cluster's decompressed pages with fs-verity. */
+	for (i = 0; i < dic->cluster_size; i++) {
+		struct page *rpage = dic->rpages[i];
+
+		if (rpage && !fsverity_verify_page(rpage))
+			SetPageError(rpage);
+	}
+
+	__f2fs_decompress_end_io(dic, false);
+}
+
+/*
+ * This is called when a compressed cluster has been decompressed
+ * (or failed to be read and/or decompressed).
+ */
+void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed)
+{
+	if (!failed && dic->need_verity) {
+		/*
+		 * Note that to avoid deadlocks, the verity work can't be done
+		 * on the decompression workqueue.  This is because verifying
+		 * the data pages can involve reading metadata pages from the
+		 * file, and these metadata pages may be compressed.
+		 */
+		INIT_WORK(&dic->verity_work, f2fs_verify_cluster);
+		fsverity_enqueue_verify_work(&dic->verity_work);
+	} else {
+		__f2fs_decompress_end_io(dic, failed);
+	}
+}
+
+/*
+ * Put a reference to a compressed page's decompress_io_ctx.
+ *
+ * This is called when the page is no longer needed and can be freed.
+ */
+void f2fs_put_page_dic(struct page *page)
+{
+	struct decompress_io_ctx *dic =
+			(struct decompress_io_ctx *)page_private(page);
+
+	f2fs_put_dic(dic);
 }
 
 int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi)
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index aa34d620bec98..720632fb72008 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -115,10 +115,21 @@ static enum count_type __read_io_type(struct page *page)
 
 /* postprocessing steps for read bios */
 enum bio_post_read_step {
-	STEP_DECRYPT,
-	STEP_DECOMPRESS_NOWQ,		/* handle normal cluster data inplace */
-	STEP_DECOMPRESS,		/* handle compressed cluster data in workqueue */
-	STEP_VERITY,
+#ifdef CONFIG_FS_ENCRYPTION
+	STEP_DECRYPT	= 1 << 0,
+#else
+	STEP_DECRYPT	= 0,	/* compile out the decryption-related code */
+#endif
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+	STEP_DECOMPRESS	= 1 << 1,
+#else
+	STEP_DECOMPRESS	= 0,	/* compile out the decompression-related code */
+#endif
+#ifdef CONFIG_FS_VERITY
+	STEP_VERITY	= 1 << 2,
+#else
+	STEP_VERITY	= 0,	/* compile out the verity-related code */
+#endif
 };
 
 struct bio_post_read_ctx {
@@ -128,25 +139,26 @@ struct bio_post_read_ctx {
 	unsigned int enabled_steps;
 };
 
-static void __read_end_io(struct bio *bio, bool compr, bool verity)
+static void f2fs_finish_read_bio(struct bio *bio)
 {
-	struct page *page;
 	struct bio_vec *bv;
 	struct bvec_iter_all iter_all;
 
+	/*
+	 * Update and unlock the bio's pagecache pages, and put the
+	 * decompression context for any compressed pages.
+	 */
 	bio_for_each_segment_all(bv, bio, iter_all) {
-		page = bv->bv_page;
+		struct page *page = bv->bv_page;
 
-#ifdef CONFIG_F2FS_FS_COMPRESSION
-		if (compr && f2fs_is_compressed_page(page)) {
-			f2fs_decompress_pages(bio, page, verity);
+		if (f2fs_is_compressed_page(page)) {
+			if (bio->bi_status)
+				f2fs_end_read_compressed_page(page, true);
+			f2fs_put_page_dic(page);
 			continue;
 		}
-		if (verity)
-			continue;
-#endif
 
-		/* PG_error was set if any post_read step failed */
+		/* PG_error was set if decryption or verity failed. */
 		if (bio->bi_status || PageError(page)) {
 			ClearPageUptodate(page);
 			/* will re-read again later */
@@ -157,181 +169,141 @@ static void __read_end_io(struct bio *bio, bool compr, bool verity)
 		dec_page_count(F2FS_P_SB(page), __read_io_type(page));
 		unlock_page(page);
 	}
-}
-
-static void f2fs_release_read_bio(struct bio *bio);
-static void __f2fs_read_end_io(struct bio *bio, bool compr, bool verity)
-{
-	if (!compr)
-		__read_end_io(bio, false, verity);
-	f2fs_release_read_bio(bio);
-}
-
-static void f2fs_decompress_bio(struct bio *bio, bool verity)
-{
-	__read_end_io(bio, true, verity);
-}
-
-static void bio_post_read_processing(struct bio_post_read_ctx *ctx);
-
-static void f2fs_decrypt_work(struct bio_post_read_ctx *ctx)
-{
-	fscrypt_decrypt_bio(ctx->bio);
-}
-
-static void f2fs_decompress_work(struct bio_post_read_ctx *ctx)
-{
-	f2fs_decompress_bio(ctx->bio, ctx->enabled_steps & (1 << STEP_VERITY));
-}
-
-#ifdef CONFIG_F2FS_FS_COMPRESSION
-static void f2fs_verify_pages(struct page **rpages, unsigned int cluster_size)
-{
-	f2fs_decompress_end_io(rpages, cluster_size, false, true);
-}
-
-static void f2fs_verify_bio(struct bio *bio)
-{
-	struct bio_vec *bv;
-	struct bvec_iter_all iter_all;
-
-	bio_for_each_segment_all(bv, bio, iter_all) {
-		struct page *page = bv->bv_page;
-		struct decompress_io_ctx *dic;
-
-		dic = (struct decompress_io_ctx *)page_private(page);
-
-		if (dic) {
-			if (atomic_dec_return(&dic->verity_pages))
-				continue;
-			f2fs_verify_pages(dic->rpages,
-						dic->cluster_size);
-			f2fs_free_dic(dic);
-			continue;
-		}
-
-		if (bio->bi_status || PageError(page))
-			goto clear_uptodate;
 
-		if (fsverity_verify_page(page)) {
-			SetPageUptodate(page);
-			goto unlock;
-		}
-clear_uptodate:
-		ClearPageUptodate(page);
-		ClearPageError(page);
-unlock:
-		dec_page_count(F2FS_P_SB(page), __read_io_type(page));
-		unlock_page(page);
-	}
+	if (bio->bi_private)
+		mempool_free(bio->bi_private, bio_post_read_ctx_pool);
+	bio_put(bio);
 }
-#endif
 
-static void f2fs_verity_work(struct work_struct *work)
+static void f2fs_verify_bio(struct work_struct *work)
 {
 	struct bio_post_read_ctx *ctx =
 		container_of(work, struct bio_post_read_ctx, work);
 	struct bio *bio = ctx->bio;
-#ifdef CONFIG_F2FS_FS_COMPRESSION
-	unsigned int enabled_steps = ctx->enabled_steps;
-#endif
+	bool may_have_compressed_pages = (ctx->enabled_steps & STEP_DECOMPRESS);
 
 	/*
 	 * fsverity_verify_bio() may call readpages() again, and while verity
-	 * will be disabled for this, decryption may still be needed, resulting
-	 * in another bio_post_read_ctx being allocated.  So to prevent
-	 * deadlocks we need to release the current ctx to the mempool first.
-	 * This assumes that verity is the last post-read step.
+	 * will be disabled for this, decryption and/or decompression may still
+	 * be needed, resulting in another bio_post_read_ctx being allocated.
+	 * So to prevent deadlocks we need to release the current ctx to the
+	 * mempool first.  This assumes that verity is the last post-read step.
 	 */
 	mempool_free(ctx, bio_post_read_ctx_pool);
 	bio->bi_private = NULL;
 
-#ifdef CONFIG_F2FS_FS_COMPRESSION
-	/* previous step is decompression */
-	if (enabled_steps & (1 << STEP_DECOMPRESS)) {
-		f2fs_verify_bio(bio);
-		f2fs_release_read_bio(bio);
-		return;
+	/*
+	 * Verify the bio's pages with fs-verity.  Exclude compressed pages,
+	 * as those were handled separately by f2fs_end_read_compressed_page().
+	 */
+	if (may_have_compressed_pages) {
+		struct bio_vec *bv;
+		struct bvec_iter_all iter_all;
+
+		bio_for_each_segment_all(bv, bio, iter_all) {
+			struct page *page = bv->bv_page;
+
+			if (!f2fs_is_compressed_page(page) &&
+			    !PageError(page) && !fsverity_verify_page(page))
+				SetPageError(page);
+		}
+	} else {
+		fsverity_verify_bio(bio);
 	}
-#endif
 
-	fsverity_verify_bio(bio);
-	__f2fs_read_end_io(bio, false, false);
+	f2fs_finish_read_bio(bio);
 }
 
-static void f2fs_post_read_work(struct work_struct *work)
+/*
+ * If the bio's data needs to be verified with fs-verity, then enqueue the
+ * verity work for the bio.  Otherwise finish the bio now.
+ *
+ * Note that to avoid deadlocks, the verity work can't be done on the
+ * decryption/decompression workqueue.  This is because verifying the data pages
+ * can involve reading verity metadata pages from the file, and these verity
+ * metadata pages may be encrypted and/or compressed.
+ */
+static void f2fs_verify_and_finish_bio(struct bio *bio)
 {
-	struct bio_post_read_ctx *ctx =
-		container_of(work, struct bio_post_read_ctx, work);
-
-	if (ctx->enabled_steps & (1 << STEP_DECRYPT))
-		f2fs_decrypt_work(ctx);
+	struct bio_post_read_ctx *ctx = bio->bi_private;
 
-	if (ctx->enabled_steps & (1 << STEP_DECOMPRESS))
-		f2fs_decompress_work(ctx);
-
-	if (ctx->enabled_steps & (1 << STEP_VERITY)) {
-		INIT_WORK(&ctx->work, f2fs_verity_work);
+	if (ctx && (ctx->enabled_steps & STEP_VERITY)) {
+		INIT_WORK(&ctx->work, f2fs_verify_bio);
 		fsverity_enqueue_verify_work(&ctx->work);
-		return;
+	} else {
+		f2fs_finish_read_bio(bio);
 	}
-
-	__f2fs_read_end_io(ctx->bio,
-		ctx->enabled_steps & (1 << STEP_DECOMPRESS), false);
 }
 
-static void f2fs_enqueue_post_read_work(struct f2fs_sb_info *sbi,
-						struct work_struct *work)
-{
-	queue_work(sbi->post_read_wq, work);
-}
-
-static void bio_post_read_processing(struct bio_post_read_ctx *ctx)
+/*
+ * Handle STEP_DECOMPRESS by decompressing any compressed clusters whose last
+ * remaining page was read by @ctx->bio.
+ *
+ * Note that a bio may span clusters (even a mix of compressed and uncompressed
+ * clusters) or be for just part of a cluster.  STEP_DECOMPRESS just indicates
+ * that the bio includes at least one compressed page.  The actual decompression
+ * is done on a per-cluster basis, not a per-bio basis.
+ */
+static void f2fs_handle_step_decompress(struct bio_post_read_ctx *ctx)
 {
-	/*
-	 * We use different work queues for decryption and for verity because
-	 * verity may require reading metadata pages that need decryption, and
-	 * we shouldn't recurse to the same workqueue.
-	 */
+	struct bio_vec *bv;
+	struct bvec_iter_all iter_all;
+	bool all_compressed = true;
 
-	if (ctx->enabled_steps & (1 << STEP_DECRYPT) ||
-		ctx->enabled_steps & (1 << STEP_DECOMPRESS)) {
-		INIT_WORK(&ctx->work, f2fs_post_read_work);
-		f2fs_enqueue_post_read_work(ctx->sbi, &ctx->work);
-		return;
-	}
+	bio_for_each_segment_all(bv, ctx->bio, iter_all) {
+		struct page *page = bv->bv_page;
 
-	if (ctx->enabled_steps & (1 << STEP_VERITY)) {
-		INIT_WORK(&ctx->work, f2fs_verity_work);
-		fsverity_enqueue_verify_work(&ctx->work);
-		return;
+		/* PG_error was set if decryption failed. */
+		if (f2fs_is_compressed_page(page))
+			f2fs_end_read_compressed_page(page, PageError(page));
+		else
+			all_compressed = false;
 	}
 
-	__f2fs_read_end_io(ctx->bio, false, false);
+	/*
+	 * Optimization: if all the bio's pages are compressed, then scheduling
+	 * the per-bio verity work is unnecessary, as verity will be fully
+	 * handled at the compression cluster level.
+	 */
+	if (all_compressed)
+		ctx->enabled_steps &= ~STEP_VERITY;
 }
 
-static bool f2fs_bio_post_read_required(struct bio *bio)
+static void f2fs_post_read_work(struct work_struct *work)
 {
-	return bio->bi_private;
+	struct bio_post_read_ctx *ctx =
+		container_of(work, struct bio_post_read_ctx, work);
+
+	if (ctx->enabled_steps & STEP_DECRYPT)
+		fscrypt_decrypt_bio(ctx->bio);
+
+	if (ctx->enabled_steps & STEP_DECOMPRESS)
+		f2fs_handle_step_decompress(ctx);
+
+	f2fs_verify_and_finish_bio(ctx->bio);
 }
 
 static void f2fs_read_end_io(struct bio *bio)
 {
 	struct f2fs_sb_info *sbi = F2FS_P_SB(bio_first_page_all(bio));
+	struct bio_post_read_ctx *ctx = bio->bi_private;
 
 	if (time_to_inject(sbi, FAULT_READ_IO)) {
 		f2fs_show_injection_info(sbi, FAULT_READ_IO);
 		bio->bi_status = BLK_STS_IOERR;
 	}
 
-	if (f2fs_bio_post_read_required(bio)) {
-		struct bio_post_read_ctx *ctx = bio->bi_private;
-
-		bio_post_read_processing(ctx);
+	if (bio->bi_status) {
+		f2fs_finish_read_bio(bio);
 		return;
 	}
 
-	__f2fs_read_end_io(bio, false, false);
+	if (ctx && (ctx->enabled_steps & (STEP_DECRYPT | STEP_DECOMPRESS))) {
+		INIT_WORK(&ctx->work, f2fs_post_read_work);
+		queue_work(ctx->sbi->post_read_wq, &ctx->work);
+	} else {
+		f2fs_verify_and_finish_bio(bio);
+	}
 }
 
 static void f2fs_write_end_io(struct bio *bio)
@@ -1022,16 +994,9 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	up_write(&io->io_rwsem);
 }
 
-static inline bool f2fs_need_verity(const struct inode *inode, pgoff_t idx)
-{
-	return fsverity_active(inode) &&
-	       idx < DIV_ROUND_UP(inode->i_size, PAGE_SIZE);
-}
-
 static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 				      unsigned nr_pages, unsigned op_flag,
-				      pgoff_t first_idx, bool for_write,
-				      bool for_verity)
+				      pgoff_t first_idx, bool for_write)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct bio *bio;
@@ -1050,13 +1015,19 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 	bio_set_op_attrs(bio, REQ_OP_READ, op_flag);
 
 	if (fscrypt_inode_uses_fs_layer_crypto(inode))
-		post_read_steps |= 1 << STEP_DECRYPT;
-	if (f2fs_compressed_file(inode))
-		post_read_steps |= 1 << STEP_DECOMPRESS_NOWQ;
-	if (for_verity && f2fs_need_verity(inode, first_idx))
-		post_read_steps |= 1 << STEP_VERITY;
+		post_read_steps |= STEP_DECRYPT;
+
+	if (f2fs_need_verity(inode, first_idx))
+		post_read_steps |= STEP_VERITY;
+
+	/*
+	 * STEP_DECOMPRESS is handled specially, since a compressed file might
+	 * contain both compressed and uncompressed clusters.  We'll allocate a
+	 * bio_post_read_ctx if the file is compressed, but the caller is
+	 * responsible for enabling STEP_DECOMPRESS if it's actually needed.
+	 */
 
-	if (post_read_steps) {
+	if (post_read_steps || f2fs_compressed_file(inode)) {
 		/* Due to the mempool, this never fails. */
 		ctx = mempool_alloc(bio_post_read_ctx_pool, GFP_NOFS);
 		ctx->bio = bio;
@@ -1068,13 +1039,6 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 	return bio;
 }
 
-static void f2fs_release_read_bio(struct bio *bio)
-{
-	if (bio->bi_private)
-		mempool_free(bio->bi_private, bio_post_read_ctx_pool);
-	bio_put(bio);
-}
-
 /* This can handle encryption stuffs */
 static int f2fs_submit_page_read(struct inode *inode, struct page *page,
 				 block_t blkaddr, int op_flags, bool for_write)
@@ -1083,7 +1047,7 @@ static int f2fs_submit_page_read(struct inode *inode, struct page *page,
 	struct bio *bio;
 
 	bio = f2fs_grab_read_bio(inode, blkaddr, 1, op_flags,
-					page->index, for_write, true);
+					page->index, for_write);
 	if (IS_ERR(bio))
 		return PTR_ERR(bio);
 
@@ -2121,7 +2085,7 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 	if (bio == NULL) {
 		bio = f2fs_grab_read_bio(inode, block_nr, nr_pages,
 				is_readahead ? REQ_RAHEAD : 0, page->index,
-				false, true);
+				false);
 		if (IS_ERR(bio)) {
 			ret = PTR_ERR(bio);
 			bio = NULL;
@@ -2167,8 +2131,6 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 	sector_t last_block_in_file;
 	const unsigned blocksize = blks_to_bytes(inode, 1);
 	struct decompress_io_ctx *dic = NULL;
-	struct bio_post_read_ctx *ctx;
-	bool for_verity = false;
 	int i;
 	int ret = 0;
 
@@ -2234,29 +2196,10 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		goto out_put_dnode;
 	}
 
-	/*
-	 * It's possible to enable fsverity on the fly when handling a cluster,
-	 * which requires complicated error handling. Instead of adding more
-	 * complexity, let's give a rule where end_io post-processes fsverity
-	 * per cluster. In order to do that, we need to submit bio, if previous
-	 * bio sets a different post-process policy.
-	 */
-	if (fsverity_active(cc->inode)) {
-		atomic_set(&dic->verity_pages, cc->nr_cpages);
-		for_verity = true;
-
-		if (bio) {
-			ctx = bio->bi_private;
-			if (!(ctx->enabled_steps & (1 << STEP_VERITY))) {
-				__submit_bio(sbi, bio, DATA);
-				bio = NULL;
-			}
-		}
-	}
-
 	for (i = 0; i < dic->nr_cpages; i++) {
 		struct page *page = dic->cpages[i];
 		block_t blkaddr;
+		struct bio_post_read_ctx *ctx;
 
 		blkaddr = data_blkaddr(dn.inode, dn.node_page,
 						dn.ofs_in_node + i + 1);
@@ -2272,31 +2215,10 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		if (!bio) {
 			bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages,
 					is_readahead ? REQ_RAHEAD : 0,
-					page->index, for_write, for_verity);
+					page->index, for_write);
 			if (IS_ERR(bio)) {
-				unsigned int remained = dic->nr_cpages - i;
-				bool release = false;
-
 				ret = PTR_ERR(bio);
-				dic->failed = true;
-
-				if (for_verity) {
-					if (!atomic_sub_return(remained,
-						&dic->verity_pages))
-						release = true;
-				} else {
-					if (!atomic_sub_return(remained,
-						&dic->pending_pages))
-						release = true;
-				}
-
-				if (release) {
-					f2fs_decompress_end_io(dic->rpages,
-						cc->cluster_size, true,
-						false);
-					f2fs_free_dic(dic);
-				}
-
+				f2fs_decompress_end_io(dic, ret);
 				f2fs_put_dnode(&dn);
 				*bio_ret = NULL;
 				return ret;
@@ -2308,10 +2230,9 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		if (bio_add_page(bio, page, blocksize, 0) < blocksize)
 			goto submit_and_realloc;
 
-		/* tag STEP_DECOMPRESS to handle IO in wq */
 		ctx = bio->bi_private;
-		if (!(ctx->enabled_steps & (1 << STEP_DECOMPRESS)))
-			ctx->enabled_steps |= 1 << STEP_DECOMPRESS;
+		ctx->enabled_steps |= STEP_DECOMPRESS;
+		refcount_inc(&dic->refcnt);
 
 		inc_page_count(sbi, F2FS_RD_DATA);
 		f2fs_update_iostat(sbi, FS_DATA_READ_IO, F2FS_BLKSIZE);
@@ -2328,7 +2249,13 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 out_put_dnode:
 	f2fs_put_dnode(&dn);
 out:
-	f2fs_decompress_end_io(cc->rpages, cc->cluster_size, true, false);
+	for (i = 0; i < cc->cluster_size; i++) {
+		if (cc->rpages[i]) {
+			ClearPageUptodate(cc->rpages[i]);
+			ClearPageError(cc->rpages[i]);
+			unlock_page(cc->rpages[i]);
+		}
+	}
 	*bio_ret = bio;
 	return ret;
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index bb11759191dcc..aebb139f9fa44 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1337,7 +1337,7 @@ struct compress_io_ctx {
 	atomic_t pending_pages;		/* in-flight compressed page count */
 };
 
-/* decompress io context for read IO path */
+/* Context for decompressing one cluster on the read IO path */
 struct decompress_io_ctx {
 	u32 magic;			/* magic number to indicate page is compressed */
 	struct inode *inode;		/* inode the context belong to */
@@ -1353,11 +1353,37 @@ struct decompress_io_ctx {
 	struct compress_data *cbuf;	/* virtual mapped address on cpages */
 	size_t rlen;			/* valid data length in rbuf */
 	size_t clen;			/* valid data length in cbuf */
-	atomic_t pending_pages;		/* in-flight compressed page count */
-	atomic_t verity_pages;		/* in-flight page count for verity */
-	bool failed;			/* indicate IO error during decompression */
+
+	/*
+	 * The number of compressed pages remaining to be read in this cluster.
+	 * This is initially nr_cpages.  It is decremented by 1 each time a page
+	 * has been read (or failed to be read).  When it reaches 0, the cluster
+	 * is decompressed (or an error is reported).
+	 *
+	 * If an error occurs before all the pages have been submitted for I/O,
+	 * then this will never reach 0.  In this case the I/O submitter is
+	 * responsible for calling f2fs_decompress_end_io() instead.
+	 */
+	atomic_t remaining_pages;
+
+	/*
+	 * Number of references to this decompress_io_ctx.
+	 *
+	 * One reference is held for I/O completion.  This reference is dropped
+	 * after the pagecache pages are updated and unlocked -- either after
+	 * decompression (and verity if enabled), or after an error.
+	 *
+	 * In addition, each compressed page holds a reference while it is in a
+	 * bio.  These references are necessary prevent compressed pages from
+	 * being freed while they are still in a bio.
+	 */
+	refcount_t refcnt;
+
+	bool failed;			/* IO error occurred before decompression? */
+	bool need_verity;		/* need fs-verity verification after decompression? */
 	void *private;			/* payload buffer for specified decompression algorithm */
 	void *private2;			/* extra payload buffer */
+	struct work_struct verity_work;	/* work to verify the decompressed pages */
 };
 
 #define NULL_CLUSTER			((unsigned int)(~0))
@@ -3876,7 +3902,7 @@ void f2fs_compress_write_end_io(struct bio *bio, struct page *page);
 bool f2fs_is_compress_backend_ready(struct inode *inode);
 int f2fs_init_compress_mempool(void);
 void f2fs_destroy_compress_mempool(void);
-void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity);
+void f2fs_end_read_compressed_page(struct page *page, bool failed);
 bool f2fs_cluster_is_empty(struct compress_ctx *cc);
 bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index);
 void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page);
@@ -3889,9 +3915,8 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 				unsigned nr_pages, sector_t *last_block_in_bio,
 				bool is_readahead, bool for_write);
 struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc);
-void f2fs_free_dic(struct decompress_io_ctx *dic);
-void f2fs_decompress_end_io(struct page **rpages,
-			unsigned int cluster_size, bool err, bool verity);
+void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed);
+void f2fs_put_page_dic(struct page *page);
 int f2fs_init_compress_ctx(struct compress_ctx *cc);
 void f2fs_destroy_compress_ctx(struct compress_ctx *cc);
 void f2fs_init_compress_info(struct f2fs_sb_info *sbi);
@@ -3915,6 +3940,14 @@ static inline struct page *f2fs_compress_control_page(struct page *page)
 }
 static inline int f2fs_init_compress_mempool(void) { return 0; }
 static inline void f2fs_destroy_compress_mempool(void) { }
+static inline void f2fs_end_read_compressed_page(struct page *page, bool failed)
+{
+	WARN_ON_ONCE(1);
+}
+static inline void f2fs_put_page_dic(struct page *page)
+{
+	WARN_ON_ONCE(1);
+}
 static inline int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi) { return 0; }
 static inline void f2fs_destroy_page_array_cache(struct f2fs_sb_info *sbi) { }
 static inline int __init f2fs_init_compress_cache(void) { return 0; }
@@ -4114,6 +4147,12 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
 	return false;
 }
 
+static inline bool f2fs_need_verity(const struct inode *inode, pgoff_t idx)
+{
+	return fsverity_active(inode) &&
+	       idx < DIV_ROUND_UP(inode->i_size, PAGE_SIZE);
+}
+
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 extern void f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned int rate,
 							unsigned int type);

base-commit: e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
