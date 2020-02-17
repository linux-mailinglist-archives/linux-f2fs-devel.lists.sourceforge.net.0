Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B551161A1F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Feb 2020 19:46:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j3lPn-0000NT-90; Mon, 17 Feb 2020 18:46:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j3lPk-0000LD-Bp
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Feb 2020 18:46:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cu/jfqkew46d05JGO+29Z0vrqq1/fRZdHvgOzZKjCA0=; b=Pq0jPFxakI5J71sz/IBi66iKER
 CNDfW8TKJoPZiygzj2Wax8MVnsyvstX4LVtTcIRX5IUBAHweAQTsAZbesM9sTSQBjg7I1Wly2erN+
 wI9jnl1gJytvJxmVzmUmiX3u89bjA5HIMOAs4JaEGN5obeajIWOMN/+N3jx02+gxll6Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Cu/jfqkew46d05JGO+29Z0vrqq1/fRZdHvgOzZKjCA0=; b=Wzl7lKMHSy2k6mnMrUvWPXeFBz
 QhJDVU+z2wvMY9wSM15fF7weNbEySFo7vJ84cCmHoQD8Cdbbq7fKrMqlQXrVuDSudMmaQf2zvkGJn
 1xbTOs8fhuxLY6pqOClAAvPifGJc0RxAvHjsY2H3mh+CJfl5dm3R+z8KBYMpGhAoKeOU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j3lPh-006PPW-6t
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Feb 2020 18:46:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Cu/jfqkew46d05JGO+29Z0vrqq1/fRZdHvgOzZKjCA0=; b=be4JfOkbzD49JYAiknAZutrluY
 1EIxYedMyKfRjL1xpPpovxulsPRclg28TGXxNhUXnZgjyvm4Yce97DFjlTIeAmz2dLq5jS5SxRUCk
 meKx6aKtc/KwAtGXPmxkyzlg45fYlTyFklcJ0UHZxbUQkwZocpMlNk+17OJgYvBj+o/I0SJBCcWXn
 6WxzfaP2WjRpIBuuzjlhAMYKL6DvUzCJ/oApt+X5UYzfU23iFTybfUfCtds3Erh8nOiESSmKXwEdk
 Usd/Fsr60a28TlRuOSq4LvkgskpigpIds3IE+czKwr9t2uXzKqtoKSY3LBbNy1Oop+Ldh0fbYhpy0
 WLn7+G8g==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j3lPM-0005Bp-5V; Mon, 17 Feb 2020 18:46:16 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Feb 2020 10:46:04 -0800
Message-Id: <20200217184613.19668-24-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200217184613.19668-1-willy@infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j3lPh-006PPW-6t
Subject: [f2fs-dev] [PATCH v6 13/16] f2fs: Convert from readpages to
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

Use the new readahead operation in f2fs

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c              | 50 +++++++++++++++----------------------
 fs/f2fs/f2fs.h              |  5 ++--
 include/trace/events/f2fs.h |  6 ++---
 3 files changed, 25 insertions(+), 36 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b27b72107911..87964e4cb6b8 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2159,13 +2159,11 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
  * use ->readpage() or do the necessary surgery to decouple ->readpages()
  * from read-ahead.
  */
-int f2fs_mpage_readpages(struct address_space *mapping,
-			struct list_head *pages, struct page *page,
-			unsigned nr_pages, bool is_readahead)
+int f2fs_mpage_readpages(struct inode *inode, struct readahead_control *rac,
+		struct page *page)
 {
 	struct bio *bio = NULL;
 	sector_t last_block_in_bio = 0;
-	struct inode *inode = mapping->host;
 	struct f2fs_map_blocks map;
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	struct compress_ctx cc = {
@@ -2179,6 +2177,7 @@ int f2fs_mpage_readpages(struct address_space *mapping,
 		.nr_cpages = 0,
 	};
 #endif
+	unsigned nr_pages = rac ? readahead_count(rac) : 1;
 	unsigned max_nr_pages = nr_pages;
 	int ret = 0;
 
@@ -2192,15 +2191,9 @@ int f2fs_mpage_readpages(struct address_space *mapping,
 	map.m_may_create = false;
 
 	for (; nr_pages; nr_pages--) {
-		if (pages) {
-			page = list_last_entry(pages, struct page, lru);
-
+		if (rac) {
+			page = readahead_page(rac);
 			prefetchw(&page->flags);
-			list_del(&page->lru);
-			if (add_to_page_cache_lru(page, mapping,
-						  page_index(page),
-						  readahead_gfp_mask(mapping)))
-				goto next_page;
 		}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
@@ -2210,7 +2203,7 @@ int f2fs_mpage_readpages(struct address_space *mapping,
 				ret = f2fs_read_multi_pages(&cc, &bio,
 							max_nr_pages,
 							&last_block_in_bio,
-							is_readahead);
+							rac);
 				f2fs_destroy_compress_ctx(&cc);
 				if (ret)
 					goto set_error_page;
@@ -2233,7 +2226,7 @@ int f2fs_mpage_readpages(struct address_space *mapping,
 #endif
 
 		ret = f2fs_read_single_page(inode, page, max_nr_pages, &map,
-					&bio, &last_block_in_bio, is_readahead);
+					&bio, &last_block_in_bio, rac);
 		if (ret) {
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 set_error_page:
@@ -2242,8 +2235,10 @@ int f2fs_mpage_readpages(struct address_space *mapping,
 			zero_user_segment(page, 0, PAGE_SIZE);
 			unlock_page(page);
 		}
+#ifdef CONFIG_F2FS_FS_COMPRESSION
 next_page:
-		if (pages)
+#endif
+		if (rac)
 			put_page(page);
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
@@ -2253,16 +2248,15 @@ int f2fs_mpage_readpages(struct address_space *mapping,
 				ret = f2fs_read_multi_pages(&cc, &bio,
 							max_nr_pages,
 							&last_block_in_bio,
-							is_readahead);
+							rac);
 				f2fs_destroy_compress_ctx(&cc);
 			}
 		}
 #endif
 	}
-	BUG_ON(pages && !list_empty(pages));
 	if (bio)
 		__submit_bio(F2FS_I_SB(inode), bio, DATA);
-	return pages ? 0 : ret;
+	return ret;
 }
 
 static int f2fs_read_data_page(struct file *file, struct page *page)
@@ -2281,28 +2275,24 @@ static int f2fs_read_data_page(struct file *file, struct page *page)
 	if (f2fs_has_inline_data(inode))
 		ret = f2fs_read_inline_data(inode, page);
 	if (ret == -EAGAIN)
-		ret = f2fs_mpage_readpages(page_file_mapping(page),
-						NULL, page, 1, false);
+		ret = f2fs_mpage_readpages(inode, NULL, page);
 	return ret;
 }
 
-static int f2fs_read_data_pages(struct file *file,
-			struct address_space *mapping,
-			struct list_head *pages, unsigned nr_pages)
+static void f2fs_readahead(struct readahead_control *rac)
 {
-	struct inode *inode = mapping->host;
-	struct page *page = list_last_entry(pages, struct page, lru);
+	struct inode *inode = rac->mapping->host;
 
-	trace_f2fs_readpages(inode, page, nr_pages);
+	trace_f2fs_readpages(inode, readahead_index(rac), readahead_count(rac));
 
 	if (!f2fs_is_compress_backend_ready(inode))
-		return 0;
+		return;
 
 	/* If the file has inline data, skip readpages */
 	if (f2fs_has_inline_data(inode))
-		return 0;
+		return;
 
-	return f2fs_mpage_readpages(mapping, pages, NULL, nr_pages, true);
+	f2fs_mpage_readpages(inode, rac, NULL);
 }
 
 int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
@@ -3784,7 +3774,7 @@ static void f2fs_swap_deactivate(struct file *file)
 
 const struct address_space_operations f2fs_dblock_aops = {
 	.readpage	= f2fs_read_data_page,
-	.readpages	= f2fs_read_data_pages,
+	.readahead	= f2fs_readahead,
 	.writepage	= f2fs_write_data_page,
 	.writepages	= f2fs_write_data_pages,
 	.write_begin	= f2fs_write_begin,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5355be6b6755..b5e72dee8826 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3344,9 +3344,8 @@ int f2fs_reserve_new_block(struct dnode_of_data *dn);
 int f2fs_get_block(struct dnode_of_data *dn, pgoff_t index);
 int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from);
 int f2fs_reserve_block(struct dnode_of_data *dn, pgoff_t index);
-int f2fs_mpage_readpages(struct address_space *mapping,
-			struct list_head *pages, struct page *page,
-			unsigned nr_pages, bool is_readahead);
+int f2fs_mpage_readpages(struct inode *inode, struct readahead_control *rac,
+		struct page *page);
 struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
 			int op_flags, bool for_write);
 struct page *f2fs_find_data_page(struct inode *inode, pgoff_t index);
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 67a97838c2a0..d72da4a33883 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1375,9 +1375,9 @@ TRACE_EVENT(f2fs_writepages,
 
 TRACE_EVENT(f2fs_readpages,
 
-	TP_PROTO(struct inode *inode, struct page *page, unsigned int nrpage),
+	TP_PROTO(struct inode *inode, pgoff_t start, unsigned int nrpage),
 
-	TP_ARGS(inode, page, nrpage),
+	TP_ARGS(inode, start, nrpage),
 
 	TP_STRUCT__entry(
 		__field(dev_t,	dev)
@@ -1389,7 +1389,7 @@ TRACE_EVENT(f2fs_readpages,
 	TP_fast_assign(
 		__entry->dev	= inode->i_sb->s_dev;
 		__entry->ino	= inode->i_ino;
-		__entry->start	= page->index;
+		__entry->start	= start;
 		__entry->nrpage	= nrpage;
 	),
 
-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
