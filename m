Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D26DE14F839
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Feb 2020 16:12:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ixuS8-0002Z6-L0; Sat, 01 Feb 2020 15:12:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1ixuS7-0002Yp-G3
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Feb 2020 15:12:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5KdHAUiS686jTpU0UKHCIX4BueXn8cIx7wjJa85X5I0=; b=FkVnieACOTf0A4lOUQVBkyq2Zr
 FdtIfFrtB+MuDt/xOOXOb7/m/tKR6/xUvhPeMHsdAxxOCg3Ri7juaur43X4ttCStd+1O37OlP6g59
 b5DVgk2bBIV8u+bJ+6HbQVnjVHtTTDEKboCBCwRPc7tsXqWZqayD0kcAuW+ao6dsA4NM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5KdHAUiS686jTpU0UKHCIX4BueXn8cIx7wjJa85X5I0=; b=mXMoEpvcUIqgEqIQj8fOeCkY1M
 yOeKeBDIWWJ9ULADdAQQcbAYlWtUe8+o9/Daohi/zWe1GlOqtSZkblMSi47UgYgjmPQrTAZ8wZDth
 TXioympYJ1BvkXIAvJ0lgXiLsBGRfRQgbuJ+Psxqaz9KvTT1MP++xbX/powdhcu3Vlxo=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ixuS6-007Efu-8B
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Feb 2020 15:12:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5KdHAUiS686jTpU0UKHCIX4BueXn8cIx7wjJa85X5I0=; b=FlVyy6qaG4IujDNRCtF80f9ySl
 u5mmlE5tsMA75R2R/eYDZpmR8IeeooX5NSL6xAXJCk/H+/5OJn0NPzsNOZ5WkFGxat2yok9CazbY8
 1pOlT/2Ai0gOBLMnUF2xrNhDj9Pe55GWzzCiOqRfpc0eJXqS4+AnHxwDAZRaVO0ztF1uHWigPOp+l
 HXRKlCW9qU5wh3naAfOyhIlT9u7dCFkFf25j9ym/UMn5RYq51PhUzSsXbXfJaruowz2NAeBqJPszW
 6VD6NliwDsjdULcKj4Y7T1NoMA+wy+jqvmmpBc5Ntaj6sZ2/RrVnZhTyZlszd0Okkg9ijvLICcDq7
 t5xACMnQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ixuRu-0006Hw-Cn; Sat, 01 Feb 2020 15:12:42 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Sat,  1 Feb 2020 07:12:38 -0800
Message-Id: <20200201151240.24082-11-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200201151240.24082-1-willy@infradead.org>
References: <20200201151240.24082-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: 1.7 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 2.5 URIBL_DBL_ABUSE_MALW   Contains an abused malware URL listed in the
 Spamhaus DBL blocklist [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ixuS6-007Efu-8B
Subject: [f2fs-dev] [PATCH v4 10/12] f2fs: Convert from readpages to
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
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Use the new readahead operation in f2fs

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
---
 fs/f2fs/data.c              | 35 ++++++++++++++---------------------
 fs/f2fs/f2fs.h              |  5 ++---
 fs/f2fs/verity.c            | 16 +++++++++++-----
 include/trace/events/f2fs.h |  6 +++---
 4 files changed, 30 insertions(+), 32 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 8bd9afa81c54..80803f8b1b40 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2159,9 +2159,8 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
  * use ->readpage() or do the necessary surgery to decouple ->readpages()
  * from read-ahead.
  */
-int f2fs_mpage_readpages(struct address_space *mapping,
-			struct list_head *pages, struct page *page,
-			unsigned nr_pages, bool is_readahead)
+int f2fs_mpage_readpages(struct address_space *mapping, pgoff_t start,
+		struct page *page, unsigned nr_pages, bool is_readahead)
 {
 	struct bio *bio = NULL;
 	sector_t last_block_in_bio = 0;
@@ -2192,15 +2191,10 @@ int f2fs_mpage_readpages(struct address_space *mapping,
 	map.m_may_create = false;
 
 	for (; nr_pages; nr_pages--) {
-		if (pages) {
-			page = list_last_entry(pages, struct page, lru);
+		if (is_readahead) {
+			page = readahead_page(mapping, start++);
 
 			prefetchw(&page->flags);
-			list_del(&page->lru);
-			if (add_to_page_cache_lru(page, mapping,
-						  page_index(page),
-						  readahead_gfp_mask(mapping)))
-				goto next_page;
 		}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
@@ -2243,7 +2237,7 @@ int f2fs_mpage_readpages(struct address_space *mapping,
 			unlock_page(page);
 		}
 next_page:
-		if (pages)
+		if (is_readahead)
 			put_page(page);
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
@@ -2259,10 +2253,9 @@ int f2fs_mpage_readpages(struct address_space *mapping,
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
@@ -2282,27 +2275,27 @@ static int f2fs_read_data_page(struct file *file, struct page *page)
 		ret = f2fs_read_inline_data(inode, page);
 	if (ret == -EAGAIN)
 		ret = f2fs_mpage_readpages(page_file_mapping(page),
-						NULL, page, 1, false);
+						0, page, 1, false);
 	return ret;
 }
 
-static int f2fs_read_data_pages(struct file *file,
+static unsigned f2fs_readahead(struct file *file,
 			struct address_space *mapping,
-			struct list_head *pages, unsigned nr_pages)
+			pgoff_t start, unsigned nr_pages)
 {
 	struct inode *inode = mapping->host;
-	struct page *page = list_last_entry(pages, struct page, lru);
 
-	trace_f2fs_readpages(inode, page, nr_pages);
+	trace_f2fs_readpages(inode, start, nr_pages);
 
 	if (!f2fs_is_compress_backend_ready(inode))
 		return 0;
 
 	/* If the file has inline data, skip readpages */
 	if (f2fs_has_inline_data(inode))
-		return 0;
+		return nr_pages;
 
-	return f2fs_mpage_readpages(mapping, pages, NULL, nr_pages, true);
+	f2fs_mpage_readpages(mapping, start, NULL, nr_pages, true);
+	return 0;
 }
 
 int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
@@ -3778,7 +3771,7 @@ static void f2fs_swap_deactivate(struct file *file)
 
 const struct address_space_operations f2fs_dblock_aops = {
 	.readpage	= f2fs_read_data_page,
-	.readpages	= f2fs_read_data_pages,
+	.readahead	= f2fs_readahead,
 	.writepage	= f2fs_write_data_page,
 	.writepages	= f2fs_write_data_pages,
 	.write_begin	= f2fs_write_begin,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5355be6b6755..db00907f90f1 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3344,9 +3344,8 @@ int f2fs_reserve_new_block(struct dnode_of_data *dn);
 int f2fs_get_block(struct dnode_of_data *dn, pgoff_t index);
 int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from);
 int f2fs_reserve_block(struct dnode_of_data *dn, pgoff_t index);
-int f2fs_mpage_readpages(struct address_space *mapping,
-			struct list_head *pages, struct page *page,
-			unsigned nr_pages, bool is_readahead);
+int f2fs_mpage_readpages(struct address_space *mapping, pgoff_t start,
+		struct page *page, unsigned nr_pages, bool is_readahead);
 struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
 			int op_flags, bool for_write);
 struct page *f2fs_find_data_page(struct inode *inode, pgoff_t index);
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index d7d430a6f130..71e92b9b3aa6 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -231,7 +231,6 @@ static int f2fs_get_verity_descriptor(struct inode *inode, void *buf,
 static void f2fs_merkle_tree_readahead(struct address_space *mapping,
 				       pgoff_t start_index, unsigned long count)
 {
-	LIST_HEAD(pages);
 	unsigned int nr_pages = 0;
 	struct page *page;
 	pgoff_t index;
@@ -240,16 +239,23 @@ static void f2fs_merkle_tree_readahead(struct address_space *mapping,
 	for (index = start_index; index < start_index + count; index++) {
 		page = xa_load(&mapping->i_pages, index);
 		if (!page || xa_is_value(page)) {
-			page = __page_cache_alloc(readahead_gfp_mask(mapping));
+			gfp_t gfp = readahead_gfp_mask(mapping);
+			page = __page_cache_alloc(gfp);
 			if (!page)
 				break;
-			page->index = index;
-			list_add(&page->lru, &pages);
+			if (add_to_page_cache_lru(page, mapping, index, gfp)) {
+				put_page(page);
+				break;
+			}
 			nr_pages++;
 		}
 	}
+
+	if (!nr_pages)
+		return;
+
 	blk_start_plug(&plug);
-	f2fs_mpage_readpages(mapping, &pages, NULL, nr_pages, true);
+	f2fs_mpage_readpages(mapping, start_index, NULL, nr_pages, true);
 	blk_finish_plug(&plug);
 }
 
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
2.24.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
