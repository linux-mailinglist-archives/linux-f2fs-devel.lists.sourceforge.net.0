Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 392031A80A8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Apr 2020 17:02:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jON5Q-0001UJ-BP; Tue, 14 Apr 2020 15:02:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jON5P-0001Tl-IA
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Apr 2020 15:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8CSxJs5NVt2AZBlzfOgaObiBYjfOa9z/9K9z930zZnw=; b=aa1Nu2/W2leiPdmYoCf65KZSD2
 qJ1UI2zM6jKB/Vt5X+me+g3PweCR9sXkZJNvm2ZzuiBBZRyRxs/u51IrdcRsdlifGiEYvf4Ubglz8
 wOcfLIy4qlFtZ1C2MlCcItokMaZJ/gUgJAXW7Zv04jrvWl+rNqVkUuo/oUNSqbVjU2Nc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8CSxJs5NVt2AZBlzfOgaObiBYjfOa9z/9K9z930zZnw=; b=e7A4xq4MQbmEoinSeo3E20Abmm
 0gR+KtgEDNVTI9lBQn9vy+K8c2+nGMZTpg8beYddjUFWqmXuDm9VJvtAVUlJEzsXvYAQslpnyepIp
 VLPxa3KqgjG8g0bxwkhjQDCiRXs9Uveqa0KW9UOXwSjuaDvBtm/QHQXX7xNEwhBsEGCA=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jON5N-000rVq-Bq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Apr 2020 15:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=8CSxJs5NVt2AZBlzfOgaObiBYjfOa9z/9K9z930zZnw=; b=HcByNLQ8OMucOiUPfiIKeCbPCz
 wFXixMkIo0dx4YFWT67+Szb0l7uSHJc6UcxWfGNebNCEjIpTGLvVartx3cWeEvZAhs+a22h3/jf8o
 qRkyk1Hf0V6pNkCgXvcJRG79/IBrsm0jsRA+CoN5X+ngQmivqWqSm3MB3FoQKKMr9+BpawWiZqXjc
 Bm5fhWv3mun6KdHChAnvhImXT6fmE9gSm+29n/WdIxSy0A4iQQzOgXqoEvIrrjiGOIBKixygQDG7R
 mO3doYAilju7Ky0tax5Sof4DfrzqQJBLDh9dXcrSJ1eucceKNohzHFaO7UfbZ45GbyctHC8oF3UCC
 ULVGmG/Q==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jON5A-0006Pj-Kb; Tue, 14 Apr 2020 15:02:36 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 14 Apr 2020 08:02:33 -0700
Message-Id: <20200414150233.24495-26-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200414150233.24495-1-willy@infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
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
X-Headers-End: 1jON5N-000rVq-Bq
Subject: [f2fs-dev] [PATCH v11 25/25] iomap: Convert from readpages to
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
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
 "Darrick J . Wong" <darrick.wong@oracle.com>, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Use the new readahead operation in iomap.  Convert XFS and ZoneFS to
use it.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
---
 fs/iomap/buffered-io.c | 90 +++++++++++++++---------------------------
 fs/iomap/trace.h       |  2 +-
 fs/xfs/xfs_aops.c      | 13 +++---
 fs/zonefs/super.c      |  7 ++--
 include/linux/iomap.h  |  3 +-
 5 files changed, 41 insertions(+), 74 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 075db1e71b14..890c8fcda4f3 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -214,9 +214,8 @@ iomap_read_end_io(struct bio *bio)
 struct iomap_readpage_ctx {
 	struct page		*cur_page;
 	bool			cur_page_in_bio;
-	bool			is_readahead;
 	struct bio		*bio;
-	struct list_head	*pages;
+	struct readahead_control *rac;
 };
 
 static void
@@ -308,7 +307,7 @@ iomap_readpage_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
 		if (ctx->bio)
 			submit_bio(ctx->bio);
 
-		if (ctx->is_readahead) /* same as readahead_gfp_mask */
+		if (ctx->rac) /* same as readahead_gfp_mask */
 			gfp |= __GFP_NORETRY | __GFP_NOWARN;
 		ctx->bio = bio_alloc(gfp, min(BIO_MAX_PAGES, nr_vecs));
 		/*
@@ -319,7 +318,7 @@ iomap_readpage_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
 		if (!ctx->bio)
 			ctx->bio = bio_alloc(orig_gfp, 1);
 		ctx->bio->bi_opf = REQ_OP_READ;
-		if (ctx->is_readahead)
+		if (ctx->rac)
 			ctx->bio->bi_opf |= REQ_RAHEAD;
 		ctx->bio->bi_iter.bi_sector = sector;
 		bio_set_dev(ctx->bio, iomap->bdev);
@@ -375,36 +374,8 @@ iomap_readpage(struct page *page, const struct iomap_ops *ops)
 }
 EXPORT_SYMBOL_GPL(iomap_readpage);
 
-static struct page *
-iomap_next_page(struct inode *inode, struct list_head *pages, loff_t pos,
-		loff_t length, loff_t *done)
-{
-	while (!list_empty(pages)) {
-		struct page *page = lru_to_page(pages);
-
-		if (page_offset(page) >= (u64)pos + length)
-			break;
-
-		list_del(&page->lru);
-		if (!add_to_page_cache_lru(page, inode->i_mapping, page->index,
-				GFP_NOFS))
-			return page;
-
-		/*
-		 * If we already have a page in the page cache at index we are
-		 * done.  Upper layers don't care if it is uptodate after the
-		 * readpages call itself as every page gets checked again once
-		 * actually needed.
-		 */
-		*done += PAGE_SIZE;
-		put_page(page);
-	}
-
-	return NULL;
-}
-
 static loff_t
-iomap_readpages_actor(struct inode *inode, loff_t pos, loff_t length,
+iomap_readahead_actor(struct inode *inode, loff_t pos, loff_t length,
 		void *data, struct iomap *iomap, struct iomap *srcmap)
 {
 	struct iomap_readpage_ctx *ctx = data;
@@ -418,10 +389,7 @@ iomap_readpages_actor(struct inode *inode, loff_t pos, loff_t length,
 			ctx->cur_page = NULL;
 		}
 		if (!ctx->cur_page) {
-			ctx->cur_page = iomap_next_page(inode, ctx->pages,
-					pos, length, &done);
-			if (!ctx->cur_page)
-				break;
+			ctx->cur_page = readahead_page(ctx->rac);
 			ctx->cur_page_in_bio = false;
 		}
 		ret = iomap_readpage_actor(inode, pos + done, length - done,
@@ -431,32 +399,43 @@ iomap_readpages_actor(struct inode *inode, loff_t pos, loff_t length,
 	return done;
 }
 
-int
-iomap_readpages(struct address_space *mapping, struct list_head *pages,
-		unsigned nr_pages, const struct iomap_ops *ops)
+/**
+ * iomap_readahead - Attempt to read pages from a file.
+ * @rac: Describes the pages to be read.
+ * @ops: The operations vector for the filesystem.
+ *
+ * This function is for filesystems to call to implement their readahead
+ * address_space operation.
+ *
+ * Context: The @ops callbacks may submit I/O (eg to read the addresses of
+ * blocks from disc), and may wait for it.  The caller may be trying to
+ * access a different page, and so sleeping excessively should be avoided.
+ * It may allocate memory, but should avoid costly allocations.  This
+ * function is called with memalloc_nofs set, so allocations will not cause
+ * the filesystem to be reentered.
+ */
+void iomap_readahead(struct readahead_control *rac, const struct iomap_ops *ops)
 {
+	struct inode *inode = rac->mapping->host;
+	loff_t pos = readahead_pos(rac);
+	loff_t length = readahead_length(rac);
 	struct iomap_readpage_ctx ctx = {
-		.pages		= pages,
-		.is_readahead	= true,
+		.rac	= rac,
 	};
-	loff_t pos = page_offset(list_entry(pages->prev, struct page, lru));
-	loff_t last = page_offset(list_entry(pages->next, struct page, lru));
-	loff_t length = last - pos + PAGE_SIZE, ret = 0;
 
-	trace_iomap_readpages(mapping->host, nr_pages);
+	trace_iomap_readahead(inode, readahead_count(rac));
 
 	while (length > 0) {
-		ret = iomap_apply(mapping->host, pos, length, 0, ops,
-				&ctx, iomap_readpages_actor);
+		loff_t ret = iomap_apply(inode, pos, length, 0, ops,
+				&ctx, iomap_readahead_actor);
 		if (ret <= 0) {
 			WARN_ON_ONCE(ret == 0);
-			goto done;
+			break;
 		}
 		pos += ret;
 		length -= ret;
 	}
-	ret = 0;
-done:
+
 	if (ctx.bio)
 		submit_bio(ctx.bio);
 	if (ctx.cur_page) {
@@ -464,15 +443,8 @@ iomap_readpages(struct address_space *mapping, struct list_head *pages,
 			unlock_page(ctx.cur_page);
 		put_page(ctx.cur_page);
 	}
-
-	/*
-	 * Check that we didn't lose a page due to the arcance calling
-	 * conventions..
-	 */
-	WARN_ON_ONCE(!ret && !list_empty(ctx.pages));
-	return ret;
 }
-EXPORT_SYMBOL_GPL(iomap_readpages);
+EXPORT_SYMBOL_GPL(iomap_readahead);
 
 /*
  * iomap_is_partially_uptodate checks whether blocks within a page are
diff --git a/fs/iomap/trace.h b/fs/iomap/trace.h
index 4df19c66f597..5693a39d52fb 100644
--- a/fs/iomap/trace.h
+++ b/fs/iomap/trace.h
@@ -39,7 +39,7 @@ DEFINE_EVENT(iomap_readpage_class, name,	\
 	TP_PROTO(struct inode *inode, int nr_pages), \
 	TP_ARGS(inode, nr_pages))
 DEFINE_READPAGE_EVENT(iomap_readpage);
-DEFINE_READPAGE_EVENT(iomap_readpages);
+DEFINE_READPAGE_EVENT(iomap_readahead);
 
 DECLARE_EVENT_CLASS(iomap_range_class,
 	TP_PROTO(struct inode *inode, unsigned long off, unsigned int len),
diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
index 9d9cebf18726..1fd4fb7a607c 100644
--- a/fs/xfs/xfs_aops.c
+++ b/fs/xfs/xfs_aops.c
@@ -621,14 +621,11 @@ xfs_vm_readpage(
 	return iomap_readpage(page, &xfs_read_iomap_ops);
 }
 
-STATIC int
-xfs_vm_readpages(
-	struct file		*unused,
-	struct address_space	*mapping,
-	struct list_head	*pages,
-	unsigned		nr_pages)
+STATIC void
+xfs_vm_readahead(
+	struct readahead_control	*rac)
 {
-	return iomap_readpages(mapping, pages, nr_pages, &xfs_read_iomap_ops);
+	iomap_readahead(rac, &xfs_read_iomap_ops);
 }
 
 static int
@@ -644,7 +641,7 @@ xfs_iomap_swapfile_activate(
 
 const struct address_space_operations xfs_address_space_operations = {
 	.readpage		= xfs_vm_readpage,
-	.readpages		= xfs_vm_readpages,
+	.readahead		= xfs_vm_readahead,
 	.writepage		= xfs_vm_writepage,
 	.writepages		= xfs_vm_writepages,
 	.set_page_dirty		= iomap_set_page_dirty,
diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
index 3ce9829a6936..dba874a61fc5 100644
--- a/fs/zonefs/super.c
+++ b/fs/zonefs/super.c
@@ -78,10 +78,9 @@ static int zonefs_readpage(struct file *unused, struct page *page)
 	return iomap_readpage(page, &zonefs_iomap_ops);
 }
 
-static int zonefs_readpages(struct file *unused, struct address_space *mapping,
-			    struct list_head *pages, unsigned int nr_pages)
+static void zonefs_readahead(struct readahead_control *rac)
 {
-	return iomap_readpages(mapping, pages, nr_pages, &zonefs_iomap_ops);
+	iomap_readahead(rac, &zonefs_iomap_ops);
 }
 
 /*
@@ -128,7 +127,7 @@ static int zonefs_writepages(struct address_space *mapping,
 
 static const struct address_space_operations zonefs_file_aops = {
 	.readpage		= zonefs_readpage,
-	.readpages		= zonefs_readpages,
+	.readahead		= zonefs_readahead,
 	.writepage		= zonefs_writepage,
 	.writepages		= zonefs_writepages,
 	.set_page_dirty		= iomap_set_page_dirty,
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 8b09463dae0d..bc20bd04c2a2 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -155,8 +155,7 @@ loff_t iomap_apply(struct inode *inode, loff_t pos, loff_t length,
 ssize_t iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *from,
 		const struct iomap_ops *ops);
 int iomap_readpage(struct page *page, const struct iomap_ops *ops);
-int iomap_readpages(struct address_space *mapping, struct list_head *pages,
-		unsigned nr_pages, const struct iomap_ops *ops);
+void iomap_readahead(struct readahead_control *, const struct iomap_ops *ops);
 int iomap_set_page_dirty(struct page *page);
 int iomap_is_partially_uptodate(struct page *page, unsigned long from,
 		unsigned long count);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
