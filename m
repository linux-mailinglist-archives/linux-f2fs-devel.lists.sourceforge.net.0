Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F27115873A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Feb 2020 02:04:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j1JyC-0005sR-Cq; Tue, 11 Feb 2020 01:04:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j1JyA-0005rl-0y
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Feb 2020 01:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X/JxTKwjJ9TnqVT/8JdgJyIFWM71sXK47ZA2JFZYOxI=; b=TTBdusGZPoY0cv9XF/oxfK6O1z
 HBbLAT194tBMRDf931YhUEb4gCXy+3aWRDjz+P5ZlGUJeELGDQYonUCvW02dixzIg8YtbyolQ5GXk
 /S6PxkfkxRXUnGA3BstccoYEEg/OTviWpS6M8yCzLdDaUvD6Fvy67UloVEp0Q12gFvD0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X/JxTKwjJ9TnqVT/8JdgJyIFWM71sXK47ZA2JFZYOxI=; b=U5KLrUZS9DyM96a390UsRhM5yY
 vXJboZGzZt61B/w7FK7zobGXWzsBsGpdFmsJ53Ixv9+LgwanfWlCb9p6JlfVQVaq36OskF7x8UAaL
 SaBYKADDNDsetI4s9al7Bx2x3as1fO6eKicMKx3gTvIrQHv1O9lJ9/NpBfmkqMToZx2E=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j1Jy7-000908-MZ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Feb 2020 01:04:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=X/JxTKwjJ9TnqVT/8JdgJyIFWM71sXK47ZA2JFZYOxI=; b=c5WDVT3QsX2lg/TH4aEtaxi/lC
 UHc15LNuf+UPnTqidfgz9p1TGfl1kmhHQwcx0Wu9Kt79Ahjk1UjbuZC+vhvW5dGLy+OjNdBvyDvNM
 5U7r3gloAH+ElNqbgFOBqIFzEbZmPFgGr9LpL4wCvERKRxUKsryqks8NFi8peMDIg9H30OXeO0DRD
 Ja3u7IflFAX79O6MMzgxFTYimYCr2aT3YacFEfny7qX73Z8ZADyWmNL08hSvgLKfZSV/7GMhZBfOs
 fvP2CW3mRH8Es2+wocON8KQrefoo8lvGcogLqOXU1RHhB0hB5K6V/ISf/Jt2f6jKMT1SDrl7ywXZ6
 WG4BclJQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j1Jxu-0001o5-H9; Tue, 11 Feb 2020 01:03:50 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 10 Feb 2020 17:03:42 -0800
Message-Id: <20200211010348.6872-8-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200211010348.6872-1-willy@infradead.org>
References: <20200211010348.6872-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j1Jy7-000908-MZ
Subject: [f2fs-dev] [PATCH v5 07/13] btrfs: Convert from readpages to
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
 fs/btrfs/extent_io.c    | 48 ++++++++++++++---------------------------
 fs/btrfs/extent_io.h    |  3 +--
 fs/btrfs/inode.c        | 16 ++++++--------
 include/linux/pagemap.h | 26 ++++++++++++++++++++++
 4 files changed, 50 insertions(+), 43 deletions(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index c0f202741e09..d9f66058e0a7 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -4278,52 +4278,36 @@ int extent_writepages(struct address_space *mapping,
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
-
-		if (nr) {
-			u64 contig_start = page_offset(pagepool[0]);
+	readahead_for_each_batch(rac, pagepool, ARRAY_SIZE(pagepool), nr) {
+		u64 contig_start = page_offset(pagepool[0]);
+		u64 contig_end = page_offset(pagepool[nr - 1]) + PAGE_SIZE - 1;
 
-			ASSERT(contig_start + nr * PAGE_SIZE - 1 == contig_end);
+		ASSERT(contig_start + nr * PAGE_SIZE - 1 == contig_end);
 
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
+		int ret = submit_one_bio(bio, 0, bio_flags);
+		if (ret < 0) {
+			/* XXX: unlock the pages here? */
+		}
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
index 5b3ec93ff911..d964b2a78ed8 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -4794,8 +4794,8 @@ static void evict_inode_truncate_pages(struct inode *inode)
 
 	/*
 	 * Keep looping until we have no more ranges in the io tree.
-	 * We can have ongoing bios started by readpages (called from readahead)
-	 * that have their endio callback (extent_io.c:end_bio_extent_readpage)
+	 * We can have ongoing bios started by readahead that have
+	 * their endio callback (extent_io.c:end_bio_extent_readpage)
 	 * still in progress (unlocked the pages in the bio but did not yet
 	 * unlocked the ranges in the io tree). Therefore this means some
 	 * ranges can still be locked and eviction started because before
@@ -6996,11 +6996,11 @@ static int lock_extent_direct(struct inode *inode, u64 lockstart, u64 lockend,
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
@@ -8239,11 +8239,9 @@ static int btrfs_writepages(struct address_space *mapping,
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
@@ -10448,7 +10446,7 @@ static const struct address_space_operations btrfs_aops = {
 	.readpage	= btrfs_readpage,
 	.writepage	= btrfs_writepage,
 	.writepages	= btrfs_writepages,
-	.readpages	= btrfs_readpages,
+	.readahead	= btrfs_readahead,
 	.direct_IO	= btrfs_direct_IO,
 	.invalidatepage = btrfs_invalidatepage,
 	.releasepage	= btrfs_releasepage,
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index ddb2d1b43212..75bdfec49710 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -664,6 +664,32 @@ static inline struct page *readahead_page(struct readahead_control *rac)
 #define readahead_for_each(rac, page)					\
 	for (; (page = readahead_page(rac)); rac->nr_pages -= rac->batch_count)
 
+static inline unsigned int readahead_page_batch(struct readahead_control *rac,
+		struct page **array, unsigned int size)
+{
+	unsigned int batch = 0;
+	XA_STATE(xas, &rac->mapping->i_pages, rac->start);
+	struct page *page;
+
+	rac->batch_count = 0;
+	xas_for_each(&xas, page, rac->start + rac->nr_pages - 1) {
+		array[batch++] = page;
+		rac->batch_count += hpage_nr_pages(page);
+		rac->start += hpage_nr_pages(page);
+		if (PageHead(page))
+			xas_set(&xas, rac->start);
+
+		if (batch == size)
+			break;
+	}
+
+	return batch;
+}
+
+#define readahead_for_each_batch(rac, array, size, nr)			\
+	for (; (nr = readahead_page_batch(rac, array, size));		\
+			rac->nr_pages -= rac->batch_count)
+
 /* The byte offset into the file of this readahead block */
 static inline loff_t readahead_offset(struct readahead_control *rac)
 {
-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
