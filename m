Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00256304160
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Jan 2021 16:04:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4PtU-0001mU-KE; Tue, 26 Jan 2021 15:04:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+b7a2078c382f6036dc0e+6365+infradead.org+hch@casper.srs.infradead.org>)
 id 1l4PtT-0001mM-Hw
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 15:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CdCfnYFFIv1ltUJZffW4u/NyTHX/9CqXY+v2ih8xgNs=; b=A/n5lhZqXGHSb7XEwXQ7dpxSus
 kWpyD2dKrlIm0IEaSr2TsO+FMke41FziRimx9w1DvpeqRz0B2a0UaIM9krrDAy2Qfoyfkhggat3kE
 MJKGsgYGTeGcYfP/mYANYhLXsltQjNfDHXCT2c7dC+8BfLBgMHRNuKHm6coEOuDDIbno=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CdCfnYFFIv1ltUJZffW4u/NyTHX/9CqXY+v2ih8xgNs=; b=RPZPQqYfHxcdrfChzx5Ttww84A
 ChB1rk3Syo5dD2dE+eVkB5CL1VIqe0Zjtp7jXZqMgWkU8ic1R2gchui6mgm45t2DBCg7sW/sKJIEg
 sDXR6XYvnZ1dWmuWEWoCxaNmtXLTuT3vEIUojigqcK5jaUIhPZl842r9RKtyzfZP1zgY=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l4PtR-00ALR7-7c
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 15:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=CdCfnYFFIv1ltUJZffW4u/NyTHX/9CqXY+v2ih8xgNs=; b=O462VxC4MBXhmWGuB9OUKroqs4
 typGBFqFMCyilTu7ML8uHujgoR9JF8SWDaddj4Ym9aoIznm4P/RmkkcdZipgiCdy4CU/UlVqyCg8+
 sE1wXXgjIMYGNs0msjRYv9xvtlapQFy8jZVsy5C7CzVYfcpVdPRdw8u2BYpaD1xI3nvrIeQFywGSR
 2MZh8zfGdDv+YvYVyz/uLytE6ZQd0SGX085MxoE2Rj5ABlvPXKnyYXnzTHwuLv5OUu9s0Yozu3Zcx
 cZljekJxqWStXaapkXgUZwyHP/gFeSzGvDBtSzy7qERfQsEUKoYCN1UZvCATMBsZSJ+VV/2zxe2jp
 kChbAVww==;
Received: from [2001:4bb8:191:e347:5918:ac86:61cb:8801] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l4PoW-005mZ0-Km; Tue, 26 Jan 2021 14:59:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Song Liu <song@kernel.org>
Date: Tue, 26 Jan 2021 15:52:34 +0100
Message-Id: <20210126145247.1964410-5-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210126145247.1964410-1-hch@lst.de>
References: <20210126145247.1964410-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l4PtR-00ALR7-7c
Subject: [f2fs-dev] [PATCH 04/17] block: split bio_kmalloc from
 bio_alloc_bioset
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
Cc: Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org, dm-devel@redhat.com,
 drbd-dev@lists.linbit.com, Naohiro Aota <naohiro.aota@wdc.com>,
 linux-nilfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 linux-nfs@vger.kernel.org, Coly Li <colyli@suse.de>,
 linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-block@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Lars Ellenberg <lars.ellenberg@linbit.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

bio_kmalloc shares almost no logic with the bio_set based fast path
in bio_alloc_bioset.  Split it into an entirely separate implementation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bio.c         | 167 ++++++++++++++++++++++----------------------
 include/linux/bio.h |   6 +-
 2 files changed, 86 insertions(+), 87 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index dfd7740a32300a..d4375619348c52 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -396,123 +396,101 @@ static void punt_bios_to_rescuer(struct bio_set *bs)
  * @nr_iovecs:	number of iovecs to pre-allocate
  * @bs:		the bio_set to allocate from.
  *
- * Description:
- *   If @bs is NULL, uses kmalloc() to allocate the bio; else the allocation is
- *   backed by the @bs's mempool.
+ * Allocate a bio from the mempools in @bs.
  *
- *   When @bs is not NULL, if %__GFP_DIRECT_RECLAIM is set then bio_alloc will
- *   always be able to allocate a bio. This is due to the mempool guarantees.
- *   To make this work, callers must never allocate more than 1 bio at a time
- *   from this pool. Callers that need to allocate more than 1 bio must always
- *   submit the previously allocated bio for IO before attempting to allocate
- *   a new one. Failure to do so can cause deadlocks under memory pressure.
+ * If %__GFP_DIRECT_RECLAIM is set then bio_alloc will always be able to
+ * allocate a bio.  This is due to the mempool guarantees.  To make this work,
+ * callers must never allocate more than 1 bio at a time from the general pool.
+ * Callers that need to allocate more than 1 bio must always submit the
+ * previously allocated bio for IO before attempting to allocate a new one.
+ * Failure to do so can cause deadlocks under memory pressure.
  *
- *   Note that when running under submit_bio_noacct() (i.e. any block
- *   driver), bios are not submitted until after you return - see the code in
- *   submit_bio_noacct() that converts recursion into iteration, to prevent
- *   stack overflows.
+ * Note that when running under submit_bio_noacct() (i.e. any block driver),
+ * bios are not submitted until after you return - see the code in
+ * submit_bio_noacct() that converts recursion into iteration, to prevent
+ * stack overflows.
  *
- *   This would normally mean allocating multiple bios under
- *   submit_bio_noacct() would be susceptible to deadlocks, but we have
- *   deadlock avoidance code that resubmits any blocked bios from a rescuer
- *   thread.
+ * This would normally mean allocating multiple bios under submit_bio_noacct()
+ * would be susceptible to deadlocks, but we have
+ * deadlock avoidance code that resubmits any blocked bios from a rescuer
+ * thread.
  *
- *   However, we do not guarantee forward progress for allocations from other
- *   mempools. Doing multiple allocations from the same mempool under
- *   submit_bio_noacct() should be avoided - instead, use bio_set's front_pad
- *   for per bio allocations.
+ * However, we do not guarantee forward progress for allocations from other
+ * mempools. Doing multiple allocations from the same mempool under
+ * submit_bio_noacct() should be avoided - instead, use bio_set's front_pad
+ * for per bio allocations.
  *
- *   RETURNS:
- *   Pointer to new bio on success, NULL on failure.
+ * Returns: Pointer to new bio on success, NULL on failure.
  */
 struct bio *bio_alloc_bioset(gfp_t gfp_mask, unsigned int nr_iovecs,
 			     struct bio_set *bs)
 {
 	gfp_t saved_gfp = gfp_mask;
-	unsigned front_pad;
-	unsigned inline_vecs;
-	struct bio_vec *bvl = NULL;
 	struct bio *bio;
 	void *p;
 
-	if (!bs) {
-		if (nr_iovecs > UIO_MAXIOV)
-			return NULL;
-
-		p = kmalloc(struct_size(bio, bi_inline_vecs, nr_iovecs), gfp_mask);
-		front_pad = 0;
-		inline_vecs = nr_iovecs;
-	} else {
-		/* should not use nobvec bioset for nr_iovecs > 0 */
-		if (WARN_ON_ONCE(!mempool_initialized(&bs->bvec_pool) &&
-				 nr_iovecs > 0))
-			return NULL;
-		/*
-		 * submit_bio_noacct() converts recursion to iteration; this
-		 * means if we're running beneath it, any bios we allocate and
-		 * submit will not be submitted (and thus freed) until after we
-		 * return.
-		 *
-		 * This exposes us to a potential deadlock if we allocate
-		 * multiple bios from the same bio_set() while running
-		 * underneath submit_bio_noacct(). If we were to allocate
-		 * multiple bios (say a stacking block driver that was splitting
-		 * bios), we would deadlock if we exhausted the mempool's
-		 * reserve.
-		 *
-		 * We solve this, and guarantee forward progress, with a rescuer
-		 * workqueue per bio_set. If we go to allocate and there are
-		 * bios on current->bio_list, we first try the allocation
-		 * without __GFP_DIRECT_RECLAIM; if that fails, we punt those
-		 * bios we would be blocking to the rescuer workqueue before
-		 * we retry with the original gfp_flags.
-		 */
-
-		if (current->bio_list &&
-		    (!bio_list_empty(&current->bio_list[0]) ||
-		     !bio_list_empty(&current->bio_list[1])) &&
-		    bs->rescue_workqueue)
-			gfp_mask &= ~__GFP_DIRECT_RECLAIM;
+	/* should not use nobvec bioset for nr_iovecs > 0 */
+	if (WARN_ON_ONCE(!mempool_initialized(&bs->bvec_pool) && nr_iovecs > 0))
+		return NULL;
 
+	/*
+	 * submit_bio_noacct() converts recursion to iteration; this means if
+	 * we're running beneath it, any bios we allocate and submit will not be
+	 * submitted (and thus freed) until after we return.
+	 *
+	 * This exposes us to a potential deadlock if we allocate multiple bios
+	 * from the same bio_set() while running underneath submit_bio_noacct().
+	 * If we were to allocate multiple bios (say a stacking block driver
+	 * that was splitting bios), we would deadlock if we exhausted the
+	 * mempool's reserve.
+	 *
+	 * We solve this, and guarantee forward progress, with a rescuer
+	 * workqueue per bio_set. If we go to allocate and there are bios on
+	 * current->bio_list, we first try the allocation without
+	 * __GFP_DIRECT_RECLAIM; if that fails, we punt those bios we would be
+	 * blocking to the rescuer workqueue before we retry with the original
+	 * gfp_flags.
+	 */
+	if (current->bio_list &&
+	    (!bio_list_empty(&current->bio_list[0]) ||
+	     !bio_list_empty(&current->bio_list[1])) &&
+	    bs->rescue_workqueue)
+		gfp_mask &= ~__GFP_DIRECT_RECLAIM;
+
+	p = mempool_alloc(&bs->bio_pool, gfp_mask);
+	if (!p && gfp_mask != saved_gfp) {
+		punt_bios_to_rescuer(bs);
+		gfp_mask = saved_gfp;
 		p = mempool_alloc(&bs->bio_pool, gfp_mask);
-		if (!p && gfp_mask != saved_gfp) {
-			punt_bios_to_rescuer(bs);
-			gfp_mask = saved_gfp;
-			p = mempool_alloc(&bs->bio_pool, gfp_mask);
-		}
-
-		front_pad = bs->front_pad;
-		inline_vecs = BIO_INLINE_VECS;
 	}
-
 	if (unlikely(!p))
 		return NULL;
 
-	bio = p + front_pad;
-	bio_init(bio, NULL, 0);
-
-	if (nr_iovecs > inline_vecs) {
+	bio = p + bs->front_pad;
+	if (nr_iovecs > BIO_INLINE_VECS) {
 		unsigned long idx = 0;
+		struct bio_vec *bvl = NULL;
 
 		bvl = bvec_alloc(gfp_mask, nr_iovecs, &idx, &bs->bvec_pool);
 		if (!bvl && gfp_mask != saved_gfp) {
 			punt_bios_to_rescuer(bs);
 			gfp_mask = saved_gfp;
-			bvl = bvec_alloc(gfp_mask, nr_iovecs, &idx, &bs->bvec_pool);
+			bvl = bvec_alloc(gfp_mask, nr_iovecs, &idx,
+					 &bs->bvec_pool);
 		}
 
 		if (unlikely(!bvl))
 			goto err_free;
 
 		bio->bi_flags |= idx << BVEC_POOL_OFFSET;
-		bio->bi_max_vecs = bvec_nr_vecs(idx);
+		bio_init(bio, bvl, bvec_nr_vecs(idx));
 	} else if (nr_iovecs) {
-		bvl = bio->bi_inline_vecs;
-		bio->bi_max_vecs = inline_vecs;
+		bio_init(bio, bio->bi_inline_vecs, BIO_INLINE_VECS);
+	} else {
+		bio_init(bio, NULL, 0);
 	}
 
 	bio->bi_pool = bs;
-	bio->bi_io_vec = bvl;
 	return bio;
 
 err_free:
@@ -521,6 +499,31 @@ struct bio *bio_alloc_bioset(gfp_t gfp_mask, unsigned int nr_iovecs,
 }
 EXPORT_SYMBOL(bio_alloc_bioset);
 
+/**
+ * bio_kmalloc - kmalloc a bio for I/O
+ * @gfp_mask:   the GFP_* mask given to the slab allocator
+ * @nr_iovecs:	number of iovecs to pre-allocate
+ *
+ * Use kmalloc to allocate and initialize a bio.
+ *
+ * Returns: Pointer to new bio on success, NULL on failure.
+ */
+struct bio *bio_kmalloc(gfp_t gfp_mask, unsigned int nr_iovecs)
+{
+	struct bio *bio;
+
+	if (nr_iovecs > UIO_MAXIOV)
+		return NULL;
+
+	bio = kmalloc(struct_size(bio, bi_inline_vecs, nr_iovecs), gfp_mask);
+	if (unlikely(!bio))
+		return NULL;
+	bio_init(bio, nr_iovecs ? bio->bi_inline_vecs : NULL, nr_iovecs);
+	bio->bi_pool = NULL;
+	return bio;
+}
+EXPORT_SYMBOL(bio_kmalloc);
+
 void zero_fill_bio_iter(struct bio *bio, struct bvec_iter start)
 {
 	unsigned long flags;
diff --git a/include/linux/bio.h b/include/linux/bio.h
index 676870b2c88d80..c74857cf12528c 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -408,6 +408,7 @@ extern int biovec_init_pool(mempool_t *pool, int pool_entries);
 extern int bioset_init_from_src(struct bio_set *bs, struct bio_set *src);
 
 extern struct bio *bio_alloc_bioset(gfp_t, unsigned int, struct bio_set *);
+struct bio *bio_kmalloc(gfp_t gfp_mask, unsigned int nr_iovecs);
 extern void bio_put(struct bio *);
 
 extern void __bio_clone_fast(struct bio *, struct bio *);
@@ -420,11 +421,6 @@ static inline struct bio *bio_alloc(gfp_t gfp_mask, unsigned int nr_iovecs)
 	return bio_alloc_bioset(gfp_mask, nr_iovecs, &fs_bio_set);
 }
 
-static inline struct bio *bio_kmalloc(gfp_t gfp_mask, unsigned int nr_iovecs)
-{
-	return bio_alloc_bioset(gfp_mask, nr_iovecs, NULL);
-}
-
 extern blk_qc_t submit_bio(struct bio *);
 
 extern void bio_endio(struct bio *);
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
