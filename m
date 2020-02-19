Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D251650A8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 22:01:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4WTQ-0001uJ-AT; Wed, 19 Feb 2020 21:01:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j4WTE-0001nt-3f
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 21:01:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=06jcfLG0/iE/evDaE3tvymyPdKdw15gYEP4ASWImF8w=; b=baPRL2UCiadIIa4w084yh/LN7T
 4Gy+ScTxUITTDJGlXLm3jNjrU9SCC/BohT8lFoZ0dh+4itCl+4AEgY8MjA5BxBMCO9uIwzIMizy7+
 +3naXYkCnNO1EH5mKm1y1pkXgjeflH0epGEdEaNz6oAjv1O1uIPVyD3+UPdDt7hluNPU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=06jcfLG0/iE/evDaE3tvymyPdKdw15gYEP4ASWImF8w=; b=hVAl1Rf5qp4DIBcWeTT1MIUm6O
 E5+R1nd7B6mbC/q1AJCY+3aee7SOe5110P9qzlZ4Yodzi1qTW19ib/NJ96wIMnHS+pl6g2oh2CyUo
 BRdLNCFsckobQt9qiofVUKNLQNcP/F2/pI6AABEaIVcqWVSTBk0N3jwvmqzUkBl8PsCI=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4WT8-0084me-AK
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 21:01:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=06jcfLG0/iE/evDaE3tvymyPdKdw15gYEP4ASWImF8w=; b=he/0Uo5QFk3TDfC2xmcRAF2V2A
 Qw/zFmFkqkcqyzzCAzuktfzOwjvHwfg9elznJLhUa1HyyGX1DnwzqU/xKNDj07St7TMHEE52JN2/f
 YP4rpj5tB93+Ypui/2SEuHB7FebvVU6WF7z/eKuuXgXFlYAEd2pwbG43DUMP2/LBZj6gTYV6TS0X8
 i9REWZn7b7+wpAhUqqLihCv/X2OMerp1T5wLRrTdyhBySkCsFYF4oFdIdFKwusoN52Z5kX0+kSQvR
 2mcOdTy/JAliDyKN1HiYc4xPHobGbLSMx+Ep+I0rVUwzK203Jp+FQQHoCwjAGmPKQV7R4hJF4WEDz
 nb8Gdh/g==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4WSv-0008U6-7R; Wed, 19 Feb 2020 21:01:05 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 19 Feb 2020 13:00:53 -0800
Message-Id: <20200219210103.32400-15-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200219210103.32400-1-willy@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4WT8-0084me-AK
Subject: [f2fs-dev] [PATCH v7 14/24] btrfs: Convert from readpages to
 readahead
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
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Use the new readahead operation in btrfs.  Add a
readahead_for_each_batch() iterator to optimise the loop in the XArray.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/btrfs/extent_io.c    | 46 +++++++++++++----------------------------
 fs/btrfs/extent_io.h    |  3 +--
 fs/btrfs/inode.c        | 16 +++++++-------
 include/linux/pagemap.h | 37 +++++++++++++++++++++++++++++++++
 4 files changed, 59 insertions(+), 43 deletions(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index c0f202741e09..e70f14c1de60 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -4278,52 +4278,34 @@ int extent_writepages(struct address_space *mapping,
 	return ret;
 }
 
-int extent_readpages(struct address_space *mapping, struct list_head *pages,
-		     unsigned nr_pages)
+void extent_readahead(struct readahead_control *rac)
 {
 	struct bio *bio = NULL;
 	unsigned long bio_flags = 0;
 	struct page *pagepool[16];
 	struct extent_map *em_cached = NULL;
-	struct extent_io_tree *tree = &BTRFS_I(mapping->host)->io_tree;
-	int nr = 0;
+	struct extent_io_tree *tree = &BTRFS_I(rac->mapping->host)->io_tree;
 	u64 prev_em_start = (u64)-1;
+	int nr;
 
-	while (!list_empty(pages)) {
-		u64 contig_end = 0;
-
-		for (nr = 0; nr < ARRAY_SIZE(pagepool) && !list_empty(pages);) {
-			struct page *page = lru_to_page(pages);
-
-			prefetchw(&page->flags);
-			list_del(&page->lru);
-			if (add_to_page_cache_lru(page, mapping, page->index,
-						readahead_gfp_mask(mapping))) {
-				put_page(page);
-				break;
-			}
-
-			pagepool[nr++] = page;
-			contig_end = page_offset(page) + PAGE_SIZE - 1;
-		}
+	while ((nr = readahead_page_batch(rac, pagepool))) {
+		u64 contig_start = page_offset(pagepool[0]);
+		u64 contig_end = page_offset(pagepool[nr - 1]) + PAGE_SIZE - 1;
 
-		if (nr) {
-			u64 contig_start = page_offset(pagepool[0]);
+		ASSERT(contig_start + nr * PAGE_SIZE - 1 == contig_end);
 
-			ASSERT(contig_start + nr * PAGE_SIZE - 1 == contig_end);
-
-			contiguous_readpages(tree, pagepool, nr, contig_start,
-				     contig_end, &em_cached, &bio, &bio_flags,
-				     &prev_em_start);
-		}
+		contiguous_readpages(tree, pagepool, nr, contig_start,
+				contig_end, &em_cached, &bio, &bio_flags,
+				&prev_em_start);
 	}
 
 	if (em_cached)
 		free_extent_map(em_cached);
 
-	if (bio)
-		return submit_one_bio(bio, 0, bio_flags);
-	return 0;
+	if (bio) {
+		if (submit_one_bio(bio, 0, bio_flags))
+			return;
+	}
 }
 
 /*
diff --git a/fs/btrfs/extent_io.h b/fs/btrfs/extent_io.h
index 5d205bbaafdc..bddac32948c7 100644
--- a/fs/btrfs/extent_io.h
+++ b/fs/btrfs/extent_io.h
@@ -198,8 +198,7 @@ int extent_writepages(struct address_space *mapping,
 		      struct writeback_control *wbc);
 int btree_write_cache_pages(struct address_space *mapping,
 			    struct writeback_control *wbc);
-int extent_readpages(struct address_space *mapping, struct list_head *pages,
-		     unsigned nr_pages);
+void extent_readahead(struct readahead_control *rac);
 int extent_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 		__u64 start, __u64 len);
 void set_page_extent_mapped(struct page *page);
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 7d26b4bfb2c6..61d5137ce4e9 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -4802,8 +4802,8 @@ static void evict_inode_truncate_pages(struct inode *inode)
 
 	/*
 	 * Keep looping until we have no more ranges in the io tree.
-	 * We can have ongoing bios started by readpages (called from readahead)
-	 * that have their endio callback (extent_io.c:end_bio_extent_readpage)
+	 * We can have ongoing bios started by readahead that have
+	 * their endio callback (extent_io.c:end_bio_extent_readpage)
 	 * still in progress (unlocked the pages in the bio but did not yet
 	 * unlocked the ranges in the io tree). Therefore this means some
 	 * ranges can still be locked and eviction started because before
@@ -7004,11 +7004,11 @@ static int lock_extent_direct(struct inode *inode, u64 lockstart, u64 lockend,
 			 * for it to complete) and then invalidate the pages for
 			 * this range (through invalidate_inode_pages2_range()),
 			 * but that can lead us to a deadlock with a concurrent
-			 * call to readpages() (a buffered read or a defrag call
+			 * call to readahead (a buffered read or a defrag call
 			 * triggered a readahead) on a page lock due to an
 			 * ordered dio extent we created before but did not have
 			 * yet a corresponding bio submitted (whence it can not
-			 * complete), which makes readpages() wait for that
+			 * complete), which makes readahead wait for that
 			 * ordered extent to complete while holding a lock on
 			 * that page.
 			 */
@@ -8247,11 +8247,9 @@ static int btrfs_writepages(struct address_space *mapping,
 	return extent_writepages(mapping, wbc);
 }
 
-static int
-btrfs_readpages(struct file *file, struct address_space *mapping,
-		struct list_head *pages, unsigned nr_pages)
+static void btrfs_readahead(struct readahead_control *rac)
 {
-	return extent_readpages(mapping, pages, nr_pages);
+	extent_readahead(rac);
 }
 
 static int __btrfs_releasepage(struct page *page, gfp_t gfp_flags)
@@ -10456,7 +10454,7 @@ static const struct address_space_operations btrfs_aops = {
 	.readpage	= btrfs_readpage,
 	.writepage	= btrfs_writepage,
 	.writepages	= btrfs_writepages,
-	.readpages	= btrfs_readpages,
+	.readahead	= btrfs_readahead,
 	.direct_IO	= btrfs_direct_IO,
 	.invalidatepage = btrfs_invalidatepage,
 	.releasepage	= btrfs_releasepage,
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 60f9b8d4da6c..dadf6ed11e71 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -672,6 +672,43 @@ static inline struct page *readahead_page(struct readahead_control *rac)
 	return page;
 }
 
+static inline unsigned int __readahead_batch(struct readahead_control *rac,
+		struct page **array, unsigned int array_sz)
+{
+	unsigned int i = 0;
+	XA_STATE(xas, &rac->mapping->i_pages, rac->_index);
+	struct page *page;
+
+	BUG_ON(rac->_batch_count > rac->_nr_pages);
+	rac->_nr_pages -= rac->_batch_count;
+	rac->_index += rac->_batch_count;
+	rac->_batch_count = 0;
+
+	xas_for_each(&xas, page, rac->_index + rac->_nr_pages - 1) {
+		VM_BUG_ON_PAGE(!PageLocked(page), page);
+		VM_BUG_ON_PAGE(PageTail(page), page);
+		array[i++] = page;
+		rac->_batch_count += hpage_nr_pages(page);
+
+		/*
+		 * The page cache isn't using multi-index entries yet,
+		 * so the xas cursor needs to be manually moved to the
+		 * next index.  This can be removed once the page cache
+		 * is converted.
+		 */
+		if (PageHead(page))
+			xas_set(&xas, rac->_index + rac->_batch_count);
+
+		if (i == array_sz)
+			break;
+	}
+
+	return i;
+}
+
+#define readahead_page_batch(rac, array)				\
+	__readahead_batch(rac, array, ARRAY_SIZE(array))
+
 /* The byte offset into the file of this readahead block */
 static inline loff_t readahead_pos(struct readahead_control *rac)
 {
-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
