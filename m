Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C8B165081
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 22:01:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4WTE-0001oq-RH; Wed, 19 Feb 2020 21:01:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j4WTA-0001mT-ED
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 21:01:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tX+5WQe9f5JhyohNVBUrcZ2FyU86/nr+sSLIHxFHQE4=; b=I2WG2iIhXeUkNZWVxaPtKkCieA
 +S5s2ROwnq0XHGleK6HBvyjcPR9smVF+xA8YKK+SyWzw1Twz7i7+G2xMZfUCVjX8QD6jCZTCtbYEd
 wnSNRNlrlevnXrEx9Us79ZZ29v47zbbPwgyyyp1/KbccTvmUTM7CS6zFP+DjP3ghQCjE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tX+5WQe9f5JhyohNVBUrcZ2FyU86/nr+sSLIHxFHQE4=; b=SpFui+PZoLoSg0ZxWXz9WtzIMw
 0bvwzv7O7cWVpzDFRafKu2OaUV7JnmYXbjZL3tyhoIQ23ywenPt+CtPLlzPvbuE+qPG545vysr1DV
 wLRuuRjn8PvzwRQPF3tD6KwlCCm2jxykk2feiETsVFq3qTDbobi7UtyyIJT8o8kwEqLk=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4WT9-008SV1-4q
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 21:01:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=tX+5WQe9f5JhyohNVBUrcZ2FyU86/nr+sSLIHxFHQE4=; b=JgFDDSvMDibohp/zB+/gcP4Gpe
 /n7lZX8aS9ufLyUPZWJ+DvbGuZetSlZcqFCfgkhBarSHJ5/uibkzA9yk/MG2yWAN0XK1Wu0dwp66o
 CZEZuDu4/vvdJl0Od4gYOZN6hZMNkgUkv2l2JfsOcFkDJQ3u59yC0//87pCx0LukBh2xOyirON1dT
 NEthkT6MZUe9+ixegP++Fjoma/asBlazn5rpcrtXXgQrpn0525YfskpGt4ikJA0PD4Jm1X7bhXmbk
 1cRNO1uB0y6vKWR6JXWkBr/Hmn2GML1rl8GIB6miwGs65RJ6Trxdmz1kbVmMYvozHqTNd0oNKAs93
 ATwdnAvw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4WSv-0008VP-I6; Wed, 19 Feb 2020 21:01:05 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 19 Feb 2020 13:01:01 -0800
Message-Id: <20200219210103.32400-23-willy@infradead.org>
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
X-Headers-End: 1j4WT9-008SV1-4q
Subject: [f2fs-dev] [PATCH v7 22/24] iomap: Convert from readpages to
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

Use the new readahead operation in iomap.  Convert XFS and ZoneFS to
use it.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/iomap/buffered-io.c | 90 +++++++++++++++---------------------------
 fs/iomap/trace.h       |  2 +-
 fs/xfs/xfs_aops.c      | 13 +++---
 fs/zonefs/super.c      |  7 ++--
 include/linux/iomap.h  |  3 +-
 5 files changed, 41 insertions(+), 74 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 31899e6cb0f8..66cf453f4bb7 100644
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
@@ -307,11 +306,11 @@ iomap_readpage_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
 		if (ctx->bio)
 			submit_bio(ctx->bio);
 
-		if (ctx->is_readahead) /* same as readahead_gfp_mask */
+		if (ctx->rac) /* same as readahead_gfp_mask */
 			gfp |= __GFP_NORETRY | __GFP_NOWARN;
 		ctx->bio = bio_alloc(gfp, min(BIO_MAX_PAGES, nr_vecs));
 		ctx->bio->bi_opf = REQ_OP_READ;
-		if (ctx->is_readahead)
+		if (ctx->rac)
 			ctx->bio->bi_opf |= REQ_RAHEAD;
 		ctx->bio->bi_iter.bi_sector = sector;
 		bio_set_dev(ctx->bio, iomap->bdev);
@@ -367,36 +366,8 @@ iomap_readpage(struct page *page, const struct iomap_ops *ops)
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
@@ -404,10 +375,7 @@ iomap_readpages_actor(struct inode *inode, loff_t pos, loff_t length,
 
 	while (done < length) {
 		if (!ctx->cur_page) {
-			ctx->cur_page = iomap_next_page(inode, ctx->pages,
-					pos, length, &done);
-			if (!ctx->cur_page)
-				break;
+			ctx->cur_page = readahead_page(ctx->rac);
 			ctx->cur_page_in_bio = false;
 		}
 		ret = iomap_readpage_actor(inode, pos + done, length - done,
@@ -431,44 +399,48 @@ iomap_readpages_actor(struct inode *inode, loff_t pos, loff_t length,
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
+ * Context: The file is pinned by the caller, and the pages to be read are
+ * all locked and have an elevated refcount.  This function will unlock
+ * the pages (once I/O has completed on them, or I/O has been determined to
+ * not be necessary).  It will also decrease the refcount once the pages
+ * have been submitted for I/O.  After this point, the page may be removed
+ * from the page cache, and should not be referenced.
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
 	BUG_ON(ctx.cur_page);
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
index 6dc227b8c47e..d6ba705f938a 100644
--- a/fs/iomap/trace.h
+++ b/fs/iomap/trace.h
@@ -39,7 +39,7 @@ DEFINE_EVENT(iomap_readpage_class, name,	\
 	TP_PROTO(struct inode *inode, int nr_pages), \
 	TP_ARGS(inode, nr_pages))
 DEFINE_READPAGE_EVENT(iomap_readpage);
-DEFINE_READPAGE_EVENT(iomap_readpages);
+DEFINE_READPAGE_EVENT(iomap_readahead);
 
 DECLARE_EVENT_CLASS(iomap_page_class,
 	TP_PROTO(struct inode *inode, struct page *page, unsigned long off,
diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
index 58e937be24ce..6e68eeb50b07 100644
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
index 8bc6ef82d693..8327a01d3bac 100644
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
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
