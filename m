Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6166A121484
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Dec 2019 19:12:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1igurE-0000nx-NA; Mon, 16 Dec 2019 18:12:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1igurD-0000nq-5B
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Dec 2019 18:12:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ae3P6HyM6Iq65oQNWlyO6WhDLGNhEHixWDe9bwzr+wE=; b=RoiBSmq8CF9EIlJ4KSMMbVRqf0
 PA5jJmVcFF7xHfhRwuXr87vZkRhO3JpXneUtvFQeGNFZZoqoYF7K3eC1vTELUfGsQyLsz1+HSfKYm
 0gPR4LtUuMPxLjfddTpySEDuRLmEqhXWT3YK2jBCnRCkrTmThHcg0kcKagjeqvHWpKuc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ae3P6HyM6Iq65oQNWlyO6WhDLGNhEHixWDe9bwzr+wE=; b=H
 pZp2sNbOei0byfQgoMr4qiiZDg8pWLKYInvBfzm5UVw3QMdhSTTv0xyYz5JYLb8pBBNFb84KGL9/t
 Zqd4igDT/VRAi3BfkFZbwdcdrxp6vKWqd+26p3/CTykSJihL20wn9jzjKpwwhpSdaNkLVMAFFaWxg
 UcEZj0sjMqIguAhU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1igur6-006rvt-KF
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Dec 2019 18:12:35 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C186C21582;
 Mon, 16 Dec 2019 18:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576519943;
 bh=RWanN9nXzp38ABE7cxEOcK+2yiF4g0VtZwedovJOGnc=;
 h=From:To:Cc:Subject:Date:From;
 b=d4R6eSrIYJmG7erBeK4+zyVQkRujf2YWD+DYSJMRJ3LqXaKyZx6gnLElyptGTS3Up
 CuvjmiaqvXe/fmFoLk5FE/EK+Zut4j90PfPkU3NaKxmXdnagwhl+UyA+/Q4kv2QvEA
 +8jqMLC4MG5N+siHejuSPElT7tGyZNklVmTuxm0Y=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 16 Dec 2019 10:11:12 -0800
Message-Id: <20191216181112.89304-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1igur6-006rvt-KF
Subject: [f2fs-dev] [PATCH] fs-verity: implement readahead of Merkle tree
 pages
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Victor Hsieh <victorhsieh@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

When fs-verity verifies data pages, currently it reads each Merkle tree
page synchronously using read_mapping_page().

Therefore, when the Merkle tree pages aren't already cached, fs-verity
causes an extra 4 KiB I/O request for every 512 KiB of data (assuming
that the Merkle tree uses SHA-256 and 4 KiB blocks).  This results in
more I/O requests and performance loss than is strictly necessary.

Therefore, implement readahead of the Merkle tree pages.

For simplicity, we take advantage of the fact that the kernel already
does readahead of the file's *data*, just like it does for any other
file.  Due to this, we don't really need a separate readahead state
(struct file_ra_state) just for the Merkle tree, but rather we just need
to piggy-back on the existing data readahead requests.

We also only really need to bother with the first level of the Merkle
tree, since the usual fan-out factor is 128, so normally over 99% of
Merkle tree I/O requests are for the first level.

Therefore, make fsverity_verify_bio() enable readahead of the first
Merkle tree level, for up to 1/4 the number of pages in the bio, when it
sees that the REQ_RAHEAD flag is set on the bio.  The readahead size is
then passed down to ->read_merkle_tree_page() for the filesystem to
(optionally) implement if it sees that the requested page is uncached.

While we're at it, also make build_merkle_tree_level() set the Merkle
tree readahead size, since it's easy to do there.

However, for now don't set the readahead size in fsverity_verify_page(),
since currently it's only used to verify holes on ext4 and f2fs, and it
would need parameters added to know how much to read ahead.

This patch significantly improves fs-verity sequential read performance.
Some quick benchmarks with 'cat'-ing a 250MB file after dropping caches:

    On ARM64 phone (using sha256-ce):
        Before: 217 MB/s
        After: 263 MB/s
        (compare to sha256sum of non-verity file: 357 MB/s)

    In an x86_64 VM (using sha256-avx2):
        Before: 173 MB/s
        After: 215 MB/s
        (compare to sha256sum of non-verity file: 223 MB/s)

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/verity.c             | 49 ++++++++++++++++++++++++++++++++++--
 fs/f2fs/data.c               |  6 ++---
 fs/f2fs/f2fs.h               |  3 +++
 fs/f2fs/verity.c             | 49 ++++++++++++++++++++++++++++++++++--
 fs/verity/enable.c           |  8 +++++-
 fs/verity/fsverity_private.h |  1 +
 fs/verity/open.c             |  1 +
 fs/verity/verify.c           | 34 ++++++++++++++++++++-----
 include/linux/fsverity.h     |  7 +++++-
 9 files changed, 143 insertions(+), 15 deletions(-)

diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
index d0d8a9795dd62..a885f60e2cbe1 100644
--- a/fs/ext4/verity.c
+++ b/fs/ext4/verity.c
@@ -342,12 +342,57 @@ static int ext4_get_verity_descriptor(struct inode *inode, void *buf,
 	return desc_size;
 }
 
+/*
+ * Prefetch some pages from the file's Merkle tree.
+ *
+ * This is basically a stripped-down version of __do_page_cache_readahead()
+ * which works on pages past i_size.
+ */
+static void ext4_merkle_tree_readahead(struct address_space *mapping,
+				       pgoff_t start_index, unsigned long count)
+{
+	LIST_HEAD(pages);
+	unsigned int nr_pages = 0;
+	struct page *page;
+	pgoff_t index;
+	struct blk_plug plug;
+
+	for (index = start_index; index < start_index + count; index++) {
+		page = xa_load(&mapping->i_pages, index);
+		if (!page || xa_is_value(page)) {
+			page = __page_cache_alloc(readahead_gfp_mask(mapping));
+			if (!page)
+				break;
+			page->index = index;
+			list_add(&page->lru, &pages);
+			nr_pages++;
+		}
+	}
+	blk_start_plug(&plug);
+	ext4_mpage_readpages(mapping, &pages, NULL, nr_pages, true);
+	blk_finish_plug(&plug);
+}
+
 static struct page *ext4_read_merkle_tree_page(struct inode *inode,
-					       pgoff_t index)
+					       pgoff_t index,
+					       unsigned long num_ra_pages)
 {
+	struct page *page;
+
 	index += ext4_verity_metadata_pos(inode) >> PAGE_SHIFT;
 
-	return read_mapping_page(inode->i_mapping, index, NULL);
+	page = find_get_page(inode->i_mapping, index);
+	if (!page || !PageUptodate(page)) {
+		if (page)
+			put_page(page);
+		else if (num_ra_pages > 1)
+			ext4_merkle_tree_readahead(inode->i_mapping, index,
+						   num_ra_pages);
+		page = read_mapping_page(inode->i_mapping, index, NULL);
+		if (IS_ERR(page))
+			return page;
+	}
+	return page;
 }
 
 static int ext4_write_merkle_tree_block(struct inode *inode, const void *buf,
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a034cd0ce0217..8a6b3266bd794 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1881,9 +1881,9 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
  * use ->readpage() or do the necessary surgery to decouple ->readpages()
  * from read-ahead.
  */
-static int f2fs_mpage_readpages(struct address_space *mapping,
-			struct list_head *pages, struct page *page,
-			unsigned nr_pages, bool is_readahead)
+int f2fs_mpage_readpages(struct address_space *mapping,
+			 struct list_head *pages, struct page *page,
+			 unsigned int nr_pages, bool is_readahead)
 {
 	struct bio *bio = NULL;
 	sector_t last_block_in_bio = 0;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5a888a063c7f1..11bf3bbf78c3b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3242,6 +3242,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 			int create, int flag);
 int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 			u64 start, u64 len);
+int f2fs_mpage_readpages(struct address_space *mapping,
+			 struct list_head *pages, struct page *page,
+			 unsigned int nr_pages, bool is_readahead);
 bool f2fs_should_update_inplace(struct inode *inode, struct f2fs_io_info *fio);
 bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio);
 void f2fs_invalidate_page(struct page *page, unsigned int offset,
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index a401ef72bc821..ed7769f19b026 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -222,12 +222,57 @@ static int f2fs_get_verity_descriptor(struct inode *inode, void *buf,
 	return size;
 }
 
+/*
+ * Prefetch some pages from the file's Merkle tree.
+ *
+ * This is basically a stripped-down version of __do_page_cache_readahead()
+ * which works on pages past i_size.
+ */
+static void f2fs_merkle_tree_readahead(struct address_space *mapping,
+				       pgoff_t start_index, unsigned long count)
+{
+	LIST_HEAD(pages);
+	unsigned int nr_pages = 0;
+	struct page *page;
+	pgoff_t index;
+	struct blk_plug plug;
+
+	for (index = start_index; index < start_index + count; index++) {
+		page = xa_load(&mapping->i_pages, index);
+		if (!page || xa_is_value(page)) {
+			page = __page_cache_alloc(readahead_gfp_mask(mapping));
+			if (!page)
+				break;
+			page->index = index;
+			list_add(&page->lru, &pages);
+			nr_pages++;
+		}
+	}
+	blk_start_plug(&plug);
+	f2fs_mpage_readpages(mapping, &pages, NULL, nr_pages, true);
+	blk_finish_plug(&plug);
+}
+
 static struct page *f2fs_read_merkle_tree_page(struct inode *inode,
-					       pgoff_t index)
+					       pgoff_t index,
+					       unsigned long num_ra_pages)
 {
+	struct page *page;
+
 	index += f2fs_verity_metadata_pos(inode) >> PAGE_SHIFT;
 
-	return read_mapping_page(inode->i_mapping, index, NULL);
+	page = find_get_page(inode->i_mapping, index);
+	if (!page || !PageUptodate(page)) {
+		if (page)
+			put_page(page);
+		else if (num_ra_pages > 1)
+			f2fs_merkle_tree_readahead(inode->i_mapping, index,
+						   num_ra_pages);
+		page = read_mapping_page(inode->i_mapping, index, NULL);
+		if (IS_ERR(page))
+			return page;
+	}
+	return page;
 }
 
 static int f2fs_write_merkle_tree_block(struct inode *inode, const void *buf,
diff --git a/fs/verity/enable.c b/fs/verity/enable.c
index c576992b9db33..1f3858d88cf3c 100644
--- a/fs/verity/enable.c
+++ b/fs/verity/enable.c
@@ -8,6 +8,7 @@
 #include "fsverity_private.h"
 
 #include <crypto/hash.h>
+#include <linux/backing-dev.h>
 #include <linux/mount.h>
 #include <linux/pagemap.h>
 #include <linux/sched/signal.h>
@@ -86,9 +87,14 @@ static int build_merkle_tree_level(struct file *filp, unsigned int level,
 				return err;
 			}
 		} else {
+			unsigned long num_ra_pages =
+				min_t(unsigned long, num_blocks_to_hash - i,
+				      inode->i_sb->s_bdi->io_pages);
+
 			/* Non-leaf: hashing hash block from level below */
 			src_page = vops->read_merkle_tree_page(inode,
-					params->level_start[level - 1] + i);
+					params->level_start[level - 1] + i,
+					num_ra_pages);
 			if (IS_ERR(src_page)) {
 				err = PTR_ERR(src_page);
 				fsverity_err(inode,
diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index e74c79b64d889..ab9cfdd8f965a 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -50,6 +50,7 @@ struct merkle_tree_params {
 	unsigned int log_arity;		/* log2(hashes_per_block) */
 	unsigned int num_levels;	/* number of levels in Merkle tree */
 	u64 tree_size;			/* Merkle tree size in bytes */
+	unsigned long level0_blocks;	/* number of blocks in tree level 0 */
 
 	/*
 	 * Starting block index for each tree level, ordered from leaf level (0)
diff --git a/fs/verity/open.c b/fs/verity/open.c
index 63d1004b688cb..e9cdf7d00ed26 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -102,6 +102,7 @@ int fsverity_init_merkle_tree_params(struct merkle_tree_params *params,
 		/* temporarily using level_start[] to store blocks in level */
 		params->level_start[params->num_levels++] = blocks;
 	}
+	params->level0_blocks = params->level_start[0];
 
 	/* Compute the starting block of each level */
 	offset = 0;
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index 3e8f2de44667f..7fa561c343c2a 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -84,7 +84,8 @@ static inline int cmp_hashes(const struct fsverity_info *vi,
  * Return: true if the page is valid, else false.
  */
 static bool verify_page(struct inode *inode, const struct fsverity_info *vi,
-			struct ahash_request *req, struct page *data_page)
+			struct ahash_request *req, struct page *data_page,
+			unsigned long level0_ra_pages)
 {
 	const struct merkle_tree_params *params = &vi->tree_params;
 	const unsigned int hsize = params->digest_size;
@@ -117,8 +118,8 @@ static bool verify_page(struct inode *inode, const struct fsverity_info *vi,
 		pr_debug_ratelimited("Level %d: hindex=%lu, hoffset=%u\n",
 				     level, hindex, hoffset);
 
-		hpage = inode->i_sb->s_vop->read_merkle_tree_page(inode,
-								  hindex);
+		hpage = inode->i_sb->s_vop->read_merkle_tree_page(inode, hindex,
+				level == 0 ? level0_ra_pages : 0);
 		if (IS_ERR(hpage)) {
 			err = PTR_ERR(hpage);
 			fsverity_err(inode,
@@ -195,7 +196,7 @@ bool fsverity_verify_page(struct page *page)
 	if (unlikely(!req))
 		return false;
 
-	valid = verify_page(inode, vi, req, page);
+	valid = verify_page(inode, vi, req, page, 0);
 
 	ahash_request_free(req);
 
@@ -222,21 +223,42 @@ void fsverity_verify_bio(struct bio *bio)
 {
 	struct inode *inode = bio_first_page_all(bio)->mapping->host;
 	const struct fsverity_info *vi = inode->i_verity_info;
+	const struct merkle_tree_params *params = &vi->tree_params;
 	struct ahash_request *req;
 	struct bio_vec *bv;
 	struct bvec_iter_all iter_all;
+	unsigned long max_ra_pages = 0;
 
-	req = ahash_request_alloc(vi->tree_params.hash_alg->tfm, GFP_NOFS);
+	req = ahash_request_alloc(params->hash_alg->tfm, GFP_NOFS);
 	if (unlikely(!req)) {
 		bio_for_each_segment_all(bv, bio, iter_all)
 			SetPageError(bv->bv_page);
 		return;
 	}
 
+	if (bio->bi_opf & REQ_RAHEAD) {
+		/*
+		 * If this bio is for data readahead, then we also do readahead
+		 * of the first (largest) level of the Merkle tree.  Namely,
+		 * when a Merkle tree page is read, we also try to piggy-back on
+		 * some additional pages -- up to 1/4 the number of data pages.
+		 *
+		 * This improves sequential read performance, as it greatly
+		 * reduces the number of I/O requests made to the Merkle tree.
+		 */
+		bio_for_each_segment_all(bv, bio, iter_all)
+			max_ra_pages++;
+		max_ra_pages /= 4;
+	}
+
 	bio_for_each_segment_all(bv, bio, iter_all) {
 		struct page *page = bv->bv_page;
+		unsigned long level0_index = page->index >> params->log_arity;
+		unsigned long level0_ra_pages =
+			min(max_ra_pages, params->level0_blocks - level0_index);
 
-		if (!PageError(page) && !verify_page(inode, vi, req, page))
+		if (!PageError(page) &&
+		    !verify_page(inode, vi, req, page, level0_ra_pages))
 			SetPageError(page);
 	}
 
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 3b6b8ccebe7d2..ecc604e61d61b 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -77,6 +77,10 @@ struct fsverity_operations {
 	 *
 	 * @inode: the inode
 	 * @index: 0-based index of the page within the Merkle tree
+	 * @num_ra_pages: The number of Merkle tree pages that should be
+	 *		  prefetched starting at @index if the page at @index
+	 *		  isn't already cached.  Implementations may ignore this
+	 *		  argument; it's only a performance optimization.
 	 *
 	 * This can be called at any time on an open verity file, as well as
 	 * between ->begin_enable_verity() and ->end_enable_verity().  It may be
@@ -87,7 +91,8 @@ struct fsverity_operations {
 	 * Return: the page on success, ERR_PTR() on failure
 	 */
 	struct page *(*read_merkle_tree_page)(struct inode *inode,
-					      pgoff_t index);
+					      pgoff_t index,
+					      unsigned long num_ra_pages);
 
 	/**
 	 * Write a Merkle tree block to the given inode.
-- 
2.24.1.735.g03f4e72817-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
