Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 584CA15873C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Feb 2020 02:04:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j1JyD-0004fu-3C; Tue, 11 Feb 2020 01:04:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j1JyB-0004fI-Iw
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Feb 2020 01:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aRGXOYJKfqUnemNd2/EE+PIGxC7h8UcYZ50qWybxHys=; b=XYID7zGTK4mHO5Tcic/7o86CLn
 CX0JVB+9ZIIy7WnSzQCGUhfndT6JJAEwvm4csquMW3Z0RSR81FVg6w39W7yHGteSEhqv9hYrqa5kw
 VWk3g6UWj9+Z6l9hNZy6RTMT7MoPJvFo+/Q9BJrWtwW002SliMiE2yfxP1MF4lnhAJdU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aRGXOYJKfqUnemNd2/EE+PIGxC7h8UcYZ50qWybxHys=; b=hLQsLTM/+HV4/OC+kpbjv1kLy8
 b/6N9otUab4kLLDr43qUjceArCnsQwTWdMn5GZAXuOE7e1Z9/+UZsGdK9FWX5u1AutN0f4PxUjOWQ
 +hiSCPGFNY1LN2/356uIiVLkuEe2DoC0qDV45QI5Enl6PF21mzMEQYLUn1wKcgWJWiz0=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j1Jy8-0084Pc-6R
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Feb 2020 01:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=aRGXOYJKfqUnemNd2/EE+PIGxC7h8UcYZ50qWybxHys=; b=DHdtZGeV6dx9AasdzgsZ7AwumB
 y4YbUuEU4MMCmhdea8evj8EzmKtUcN1PIlxQwwzj3aN8cw0vNA33rnii1eZUADbN9wbPoa0k0y5eD
 UtUIQde61wWRHMGxe6LHa22mOd1OMmHBNEwy2cK/WhwliMvriibB32zqqR5775ETs4XMG+4GqJY1L
 CCVooOXShnHfaHkr5nHvPkpQ28zCC1M7X89h0rrpVpUFWB54NJVDYmcRI1OFzHeVNneSRwb3bzD3d
 KvzWnYWxHLM0F8RdiLUeD317FsBldabHSRJyWR/tjOYG3FadyGe6Edfh32NmJ4HswNBMc2eEdICCS
 m4N+go8g==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j1Jxu-0001nx-Eg; Tue, 11 Feb 2020 01:03:50 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 10 Feb 2020 17:03:40 -0800
Message-Id: <20200211010348.6872-6-willy@infradead.org>
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
X-Headers-End: 1j1Jy8-0084Pc-6R
Subject: [f2fs-dev] [PATCH v5 05/13] mm: Add page_cache_readahead_limit
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

ext4 and f2fs have duplicated the guts of the readahead code so
they can read past i_size.  Instead, separate out the guts of the
readahead code so they can call it directly.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/ext4/verity.c        | 35 ++--------------------------
 fs/f2fs/verity.c        | 35 ++--------------------------
 include/linux/pagemap.h |  4 ++++
 mm/readahead.c          | 51 ++++++++++++++++++++++++-----------------
 4 files changed, 38 insertions(+), 87 deletions(-)

diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
index dc5ec724d889..f6e0bf05933e 100644
--- a/fs/ext4/verity.c
+++ b/fs/ext4/verity.c
@@ -342,37 +342,6 @@ static int ext4_get_verity_descriptor(struct inode *inode, void *buf,
 	return desc_size;
 }
 
-/*
- * Prefetch some pages from the file's Merkle tree.
- *
- * This is basically a stripped-down version of __do_page_cache_readahead()
- * which works on pages past i_size.
- */
-static void ext4_merkle_tree_readahead(struct address_space *mapping,
-				       pgoff_t start_index, unsigned long count)
-{
-	LIST_HEAD(pages);
-	unsigned int nr_pages = 0;
-	struct page *page;
-	pgoff_t index;
-	struct blk_plug plug;
-
-	for (index = start_index; index < start_index + count; index++) {
-		page = xa_load(&mapping->i_pages, index);
-		if (!page || xa_is_value(page)) {
-			page = __page_cache_alloc(readahead_gfp_mask(mapping));
-			if (!page)
-				break;
-			page->index = index;
-			list_add(&page->lru, &pages);
-			nr_pages++;
-		}
-	}
-	blk_start_plug(&plug);
-	ext4_mpage_readpages(mapping, &pages, NULL, nr_pages, true);
-	blk_finish_plug(&plug);
-}
-
 static struct page *ext4_read_merkle_tree_page(struct inode *inode,
 					       pgoff_t index,
 					       unsigned long num_ra_pages)
@@ -386,8 +355,8 @@ static struct page *ext4_read_merkle_tree_page(struct inode *inode,
 		if (page)
 			put_page(page);
 		else if (num_ra_pages > 1)
-			ext4_merkle_tree_readahead(inode->i_mapping, index,
-						   num_ra_pages);
+			page_cache_readahead_limit(inode->i_mapping, NULL,
+					index, LONG_MAX, num_ra_pages, 0);
 		page = read_mapping_page(inode->i_mapping, index, NULL);
 	}
 	return page;
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index d7d430a6f130..71a3e36721fa 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -222,37 +222,6 @@ static int f2fs_get_verity_descriptor(struct inode *inode, void *buf,
 	return size;
 }
 
-/*
- * Prefetch some pages from the file's Merkle tree.
- *
- * This is basically a stripped-down version of __do_page_cache_readahead()
- * which works on pages past i_size.
- */
-static void f2fs_merkle_tree_readahead(struct address_space *mapping,
-				       pgoff_t start_index, unsigned long count)
-{
-	LIST_HEAD(pages);
-	unsigned int nr_pages = 0;
-	struct page *page;
-	pgoff_t index;
-	struct blk_plug plug;
-
-	for (index = start_index; index < start_index + count; index++) {
-		page = xa_load(&mapping->i_pages, index);
-		if (!page || xa_is_value(page)) {
-			page = __page_cache_alloc(readahead_gfp_mask(mapping));
-			if (!page)
-				break;
-			page->index = index;
-			list_add(&page->lru, &pages);
-			nr_pages++;
-		}
-	}
-	blk_start_plug(&plug);
-	f2fs_mpage_readpages(mapping, &pages, NULL, nr_pages, true);
-	blk_finish_plug(&plug);
-}
-
 static struct page *f2fs_read_merkle_tree_page(struct inode *inode,
 					       pgoff_t index,
 					       unsigned long num_ra_pages)
@@ -266,8 +235,8 @@ static struct page *f2fs_read_merkle_tree_page(struct inode *inode,
 		if (page)
 			put_page(page);
 		else if (num_ra_pages > 1)
-			f2fs_merkle_tree_readahead(inode->i_mapping, index,
-						   num_ra_pages);
+			page_cache_readahead_limit(inode->i_mapping, NULL,
+					index, LONG_MAX, num_ra_pages, 0);
 		page = read_mapping_page(inode->i_mapping, index, NULL);
 	}
 	return page;
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 13efafaf7e1f..ddb2d1b43212 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -389,6 +389,10 @@ extern struct page * read_cache_page_gfp(struct address_space *mapping,
 				pgoff_t index, gfp_t gfp_mask);
 extern int read_cache_pages(struct address_space *mapping,
 		struct list_head *pages, filler_t *filler, void *data);
+unsigned long page_cache_readahead_limit(struct address_space *mapping,
+		struct file *file, pgoff_t start, pgoff_t end_index,
+		unsigned long nr_to_read, unsigned long lookahead_size);
+
 
 static inline struct page *read_mapping_page(struct address_space *mapping,
 				pgoff_t index, void *data)
diff --git a/mm/readahead.c b/mm/readahead.c
index 933b32e0c90a..29ca25c8f01e 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -144,38 +144,22 @@ static void read_pages(struct readahead_control *rac, struct list_head *pages)
 	blk_finish_plug(&plug);
 }
 
-/*
- * __do_page_cache_readahead() actually reads a chunk of disk.  It allocates
- * the pages first, then submits them for I/O. This avoids the very bad
- * behaviour which would occur if page allocations are causing VM writeback.
- * We really don't want to intermingle reads and writes like that.
- *
- * Returns the number of pages requested, or the maximum amount of I/O allowed.
- */
-unsigned long __do_page_cache_readahead(struct address_space *mapping,
-		struct file *filp, pgoff_t start, unsigned long nr_to_read,
-		unsigned long lookahead_size)
+unsigned long page_cache_readahead_limit(struct address_space *mapping,
+		struct file *file, pgoff_t start, pgoff_t end_index,
+		unsigned long nr_to_read, unsigned long lookahead_size)
 {
-	struct inode *inode = mapping->host;
-	unsigned long end_index;	/* The last page we want to read */
 	LIST_HEAD(page_pool);
 	int page_idx;
 	pgoff_t page_offset = start;
-	loff_t isize = i_size_read(inode);
 	gfp_t gfp_mask = readahead_gfp_mask(mapping);
 	bool use_list = mapping->a_ops->readpages;
 	struct readahead_control rac = {
 		.mapping = mapping,
-		.file = filp,
+		.file = file,
 		.start = start,
 		.nr_pages = 0,
 	};
 
-	if (isize == 0)
-		goto out;
-
-	end_index = ((isize - 1) >> PAGE_SHIFT);
-
 	/*
 	 * Preallocate as many pages as we will need.
 	 */
@@ -233,9 +217,34 @@ unsigned long __do_page_cache_readahead(struct address_space *mapping,
 	 */
 	read_pages(&rac, &page_pool);
 	BUG_ON(!list_empty(&page_pool));
-out:
 	return rac.nr_pages;
 }
+EXPORT_SYMBOL_GPL(page_cache_readahead_limit);
+
+/*
+ * __do_page_cache_readahead() actually reads a chunk of disk.  It allocates
+ * the pages first, then submits them for I/O. This avoids the very bad
+ * behaviour which would occur if page allocations are causing VM writeback.
+ * We really don't want to intermingle reads and writes like that.
+ *
+ * Returns the number of pages requested, or the maximum amount of I/O allowed.
+ */
+unsigned long __do_page_cache_readahead(struct address_space *mapping,
+		struct file *file, pgoff_t start, unsigned long nr_to_read,
+		unsigned long lookahead_size)
+{
+	struct inode *inode = mapping->host;
+	unsigned long end_index;	/* The last page we want to read */
+	loff_t isize = i_size_read(inode);
+
+	if (isize == 0)
+		return 0;
+
+	end_index = ((isize - 1) >> PAGE_SHIFT);
+
+	return page_cache_readahead_limit(mapping, file, start, end_index,
+			nr_to_read, lookahead_size);
+}
 
 /*
  * Chunk the readahead into 2 megabyte units, so that we don't pin too much
-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
