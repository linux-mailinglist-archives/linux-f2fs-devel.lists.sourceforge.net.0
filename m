Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 693541650A7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 22:01:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4WTQ-0001u2-7g; Wed, 19 Feb 2020 21:01:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j4WTD-0001nY-Cu
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 21:01:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TC+iDjjJNO5NGm7wEewjDmH7JQd9SRV5n6oXnN+6v1w=; b=DpyqdW+J6SEN9G5xL4cQEnRK80
 t8EVtNrPPILRx64/8B31k7x9Smk1Rtm3Mc9JmRsp/DkarfgCuKngqcx0ewhoJNn8Nw9BaXUfPEskc
 jfk2rtwoj4qnhawf25coPhhCgM2WV3t34vx+E0ejPhocR0CzHzOkggv9TjzxTQhFD9zo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TC+iDjjJNO5NGm7wEewjDmH7JQd9SRV5n6oXnN+6v1w=; b=LD9ptbhhaWW+5Oj9bul9O7w8sD
 sCmquftiAZdmY2MKN81ccll/y3yZ0T00F3Lu/+PHIpGURAGEcmQPKSqhSnbYLYEMdr2mZSTOgw+6V
 tVA9P3k3lJv3B7/RrPdcQFH5jcspGMslK/wFlRvcCVPAJl9QyzFnt8+V3tyxEmv3hXGw=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4WT9-0084mp-6j
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 21:01:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=TC+iDjjJNO5NGm7wEewjDmH7JQd9SRV5n6oXnN+6v1w=; b=lhfsuXTkieskCpsv61dvIQWojz
 Zn2VtZ2+SeozWtVdMftMMJjqnpmd6xeyXr5LPtqJONSdWX+zybk10mVe8F2WcraRKkm+mxywm9e/J
 L88RMaLBdKnCHzgnc3ro/4sctl4ok3Z5Mm9YnNpaAweFH2wt60SlSYUneeGB9qwgf0FIBEWLr3+Oc
 kt8np8WlKJ3UIUaVAhWxcsITdvJ4tyZSbUENIPX74SjmM9ENZvqPZKVV6IrJ3XpDG8w2HRJrYRYsp
 QVNjESGMmJ/9RYKdmyax+9Ct4swRXcEWIPXL8z8708sCCnlibNsAEupCv+OtbbkXSmY5JYsdjYjih
 aUDAXg+A==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4WSv-0008Ty-4z; Wed, 19 Feb 2020 21:01:05 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 19 Feb 2020 13:00:51 -0800
Message-Id: <20200219210103.32400-13-willy@infradead.org>
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
X-Headers-End: 1j4WT9-0084mp-6j
Subject: [f2fs-dev] [PATCH v7 12/24] mm: Add page_cache_readahead_unbounded
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
 fs/ext4/verity.c        | 35 ++-------------------
 fs/f2fs/verity.c        | 35 ++-------------------
 include/linux/pagemap.h |  3 ++
 mm/readahead.c          | 70 ++++++++++++++++++++++++++++-------------
 4 files changed, 55 insertions(+), 88 deletions(-)

diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
index dc5ec724d889..dec1244dd062 100644
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
+			page_cache_readahead_unbounded(inode->i_mapping, NULL,
+					index, num_ra_pages, 0);
 		page = read_mapping_page(inode->i_mapping, index, NULL);
 	}
 	return page;
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index d7d430a6f130..865c9fb774fb 100644
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
+			page_cache_readahead_unbounded(inode->i_mapping, NULL,
+					index, num_ra_pages, 0);
 		page = read_mapping_page(inode->i_mapping, index, NULL);
 	}
 	return page;
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index b3008605fd1b..60f9b8d4da6c 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -621,6 +621,9 @@ void page_cache_sync_readahead(struct address_space *, struct file_ra_state *,
 void page_cache_async_readahead(struct address_space *, struct file_ra_state *,
 		struct file *, struct page *, pgoff_t index,
 		unsigned long req_count);
+void page_cache_readahead_unbounded(struct address_space *, struct file *,
+		pgoff_t index, unsigned long nr_to_read,
+		unsigned long lookahead_count);
 
 /*
  * Like add_to_page_cache_locked, but used to add newly allocated pages:
diff --git a/mm/readahead.c b/mm/readahead.c
index ace611f4bf05..453ef146de83 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -155,40 +155,36 @@ static void read_pages(struct readahead_control *rac, struct list_head *pages)
 	rac->_index++;
 }
 
-/*
- * __do_page_cache_readahead() actually reads a chunk of disk.  It allocates
- * the pages first, then submits them for I/O. This avoids the very bad
- * behaviour which would occur if page allocations are causing VM writeback.
- * We really don't want to intermingle reads and writes like that.
+/**
+ * page_cache_readahead_unbounded - Start unchecked readahead.
+ * @mapping: File address space.
+ * @file: This instance of the open file; used for authentication.
+ * @index: First page index to read.
+ * @nr_to_read: The number of pages to read.
+ * @lookahead_size: Where to start the next readahead.
+ *
+ * This function is for filesystems to call when they want to start
+ * readahead beyond a file's stated i_size.  This is almost certainly
+ * not the function you want to call.  Use page_cache_async_readahead()
+ * or page_cache_sync_readahead() instead.
+ *
+ * Context: File is referenced by caller.  Mutexes may be held by caller.
+ * May sleep, but will not reenter filesystem to reclaim memory.
  */
-void __do_page_cache_readahead(struct address_space *mapping,
-		struct file *filp, pgoff_t index, unsigned long nr_to_read,
+void page_cache_readahead_unbounded(struct address_space *mapping,
+		struct file *file, pgoff_t index, unsigned long nr_to_read,
 		unsigned long lookahead_size)
 {
-	struct inode *inode = mapping->host;
 	LIST_HEAD(page_pool);
-	loff_t isize = i_size_read(inode);
 	gfp_t gfp_mask = readahead_gfp_mask(mapping);
 	bool use_list = mapping->a_ops->readpages;
 	struct readahead_control rac = {
 		.mapping = mapping,
-		.file = filp,
+		.file = file,
 		._index = index,
 		._nr_pages = 0,
 	};
 	unsigned long i;
-	pgoff_t end_index;	/* The last page we want to read */
-
-	if (isize == 0)
-		return;
-
-	end_index = (isize - 1) >> PAGE_SHIFT;
-	if (index > end_index)
-		return;
-	if (index + nr_to_read < index)
-		nr_to_read = ULONG_MAX - index + 1;
-	if (index + nr_to_read >= end_index)
-		nr_to_read = end_index - index + 1;
 
 	/*
 	 * Preallocate as many pages as we will need.
@@ -232,6 +228,36 @@ void __do_page_cache_readahead(struct address_space *mapping,
 	 */
 	read_pages(&rac, &page_pool);
 }
+EXPORT_SYMBOL_GPL(page_cache_readahead_unbounded);
+
+/*
+ * __do_page_cache_readahead() actually reads a chunk of disk.  It allocates
+ * the pages first, then submits them for I/O. This avoids the very bad
+ * behaviour which would occur if page allocations are causing VM writeback.
+ * We really don't want to intermingle reads and writes like that.
+ */
+void __do_page_cache_readahead(struct address_space *mapping,
+		struct file *file, pgoff_t index, unsigned long nr_to_read,
+		unsigned long lookahead_size)
+{
+	struct inode *inode = mapping->host;
+	loff_t isize = i_size_read(inode);
+	pgoff_t end_index;	/* The last page we want to read */
+
+	if (isize == 0)
+		return;
+
+	end_index = (isize - 1) >> PAGE_SHIFT;
+	if (index > end_index)
+		return;
+	if (index + nr_to_read < index)
+		nr_to_read = ULONG_MAX - index + 1;
+	if (index + nr_to_read >= end_index)
+		nr_to_read = end_index - index + 1;
+
+	page_cache_readahead_unbounded(mapping, file, index, nr_to_read,
+			lookahead_size);
+}
 
 /*
  * Chunk the readahead into 2 megabyte units, so that we don't pin too much
-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
