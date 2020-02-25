Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CE016F174
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Feb 2020 22:49:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6i4Z-0005BF-SM; Tue, 25 Feb 2020 21:48:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j6i4V-00059k-Ha
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Feb 2020 21:48:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XgY8GFf75p3YLN+Hw5vnX8X6TLIf5r8Gr1IURhlR+kg=; b=iJ14LnM6idpUITNsYE+86i3mL7
 j/A048dJMhgf1BfgJZ2bFaeVspYvu6hOqKpsv0IfRK5SuFoIPHQE5Vu0iN14Cq8XytLxcuYwDCuwz
 i8z7A92cmepDoXZi99zYEGsp1LkZ7qlFFMMVxojOvUVl/spr5ERrQBuIrJZHrR43MUKg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XgY8GFf75p3YLN+Hw5vnX8X6TLIf5r8Gr1IURhlR+kg=; b=Wt+Dca198Rx24nRpKsW2MpovfI
 cYpBfedk8QWNWon/T6X7+Ju4c44Yn1aj3ZK6pRhSHT72S5OGaj+DBORPdRChtJu/3ZDstBuGZPomO
 YPdbpK974Q1bds8LCLfaJK86o/QfG9YVmRRDNIUff9iZX8Tr87euyVJhfH6dNLW/76KY=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6i4T-009nWz-Ud
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Feb 2020 21:48:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=XgY8GFf75p3YLN+Hw5vnX8X6TLIf5r8Gr1IURhlR+kg=; b=jxBNUe63XqDPF4hZSb6aYOHSed
 16i4Js+FT3c7Mp1+vXJGpgfe0jkB+Bl34Nh6dq8JH5ulPUVWYIu7ZoBQDcFcybdje1IF0Tw1atGA5
 LzomVASeIkXFNe2sxw7OVMJi5BvKTRhmwLbP6fSaJR3oE6+MKhneYMmkZ5V9TAI4P9pUG6NQpKyeT
 +oSYz6/PFJrFRmIHzFOWangZhpsM5qZdVvhuIUK+HMUqGatGp170Js9grPCySfHC7vTcteHrFt8VZ
 6VDMwyuP7ndyFHCR3RaWo5BhnzUQY9/CznMqBPYiydyM2yg0311XxMcJH38iwFTgZ812lskql8rQ4
 HgZV1P1w==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j6i4H-0007pf-53; Tue, 25 Feb 2020 21:48:41 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Tue, 25 Feb 2020 13:48:20 -0800
Message-Id: <20200225214838.30017-8-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200225214838.30017-1-willy@infradead.org>
References: <20200225214838.30017-1-willy@infradead.org>
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
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j6i4T-009nWz-Ud
Subject: [f2fs-dev] [PATCH v8 07/25] mm: Rename various 'offset' parameters
 to 'index'
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

The word 'offset' is used ambiguously to mean 'byte offset within
a page', 'byte offset from the start of the file' and 'page offset
from the start of the file'.  Use 'index' to mean 'page offset
from the start of the file' throughout the readahead code.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/readahead.c | 86 ++++++++++++++++++++++++--------------------------
 1 file changed, 42 insertions(+), 44 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index 9d9aa4ffc7d4..8a65d6bd97e0 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -156,7 +156,7 @@ static void read_pages(struct readahead_control *rac, struct list_head *pages,
  * We really don't want to intermingle reads and writes like that.
  */
 void __do_page_cache_readahead(struct address_space *mapping,
-		struct file *filp, pgoff_t offset, unsigned long nr_to_read,
+		struct file *filp, pgoff_t index, unsigned long nr_to_read,
 		unsigned long lookahead_size)
 {
 	struct inode *inode = mapping->host;
@@ -180,7 +180,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
 	 * Preallocate as many pages as we will need.
 	 */
 	for (page_idx = 0; page_idx < nr_to_read; page_idx++) {
-		pgoff_t page_offset = offset + page_idx;
+		pgoff_t page_offset = index + page_idx;
 
 		if (page_offset > end_index)
 			break;
@@ -219,7 +219,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
  * memory at once.
  */
 void force_page_cache_readahead(struct address_space *mapping,
-		struct file *filp, pgoff_t offset, unsigned long nr_to_read)
+		struct file *filp, pgoff_t index, unsigned long nr_to_read)
 {
 	struct backing_dev_info *bdi = inode_to_bdi(mapping->host);
 	struct file_ra_state *ra = &filp->f_ra;
@@ -239,9 +239,9 @@ void force_page_cache_readahead(struct address_space *mapping,
 
 		if (this_chunk > nr_to_read)
 			this_chunk = nr_to_read;
-		__do_page_cache_readahead(mapping, filp, offset, this_chunk, 0);
+		__do_page_cache_readahead(mapping, filp, index, this_chunk, 0);
 
-		offset += this_chunk;
+		index += this_chunk;
 		nr_to_read -= this_chunk;
 	}
 }
@@ -322,21 +322,21 @@ static unsigned long get_next_ra_size(struct file_ra_state *ra,
  */
 
 /*
- * Count contiguously cached pages from @offset-1 to @offset-@max,
+ * Count contiguously cached pages from @index-1 to @index-@max,
  * this count is a conservative estimation of
  * 	- length of the sequential read sequence, or
  * 	- thrashing threshold in memory tight systems
  */
 static pgoff_t count_history_pages(struct address_space *mapping,
-				   pgoff_t offset, unsigned long max)
+				   pgoff_t index, unsigned long max)
 {
 	pgoff_t head;
 
 	rcu_read_lock();
-	head = page_cache_prev_miss(mapping, offset - 1, max);
+	head = page_cache_prev_miss(mapping, index - 1, max);
 	rcu_read_unlock();
 
-	return offset - 1 - head;
+	return index - 1 - head;
 }
 
 /*
@@ -344,13 +344,13 @@ static pgoff_t count_history_pages(struct address_space *mapping,
  */
 static int try_context_readahead(struct address_space *mapping,
 				 struct file_ra_state *ra,
-				 pgoff_t offset,
+				 pgoff_t index,
 				 unsigned long req_size,
 				 unsigned long max)
 {
 	pgoff_t size;
 
-	size = count_history_pages(mapping, offset, max);
+	size = count_history_pages(mapping, index, max);
 
 	/*
 	 * not enough history pages:
@@ -363,10 +363,10 @@ static int try_context_readahead(struct address_space *mapping,
 	 * starts from beginning of file:
 	 * it is a strong indication of long-run stream (or whole-file-read)
 	 */
-	if (size >= offset)
+	if (size >= index)
 		size *= 2;
 
-	ra->start = offset;
+	ra->start = index;
 	ra->size = min(size + req_size, max);
 	ra->async_size = 1;
 
@@ -378,13 +378,13 @@ static int try_context_readahead(struct address_space *mapping,
  */
 static void ondemand_readahead(struct address_space *mapping,
 		struct file_ra_state *ra, struct file *filp,
-		bool hit_readahead_marker, pgoff_t offset,
+		bool hit_readahead_marker, pgoff_t index,
 		unsigned long req_size)
 {
 	struct backing_dev_info *bdi = inode_to_bdi(mapping->host);
 	unsigned long max_pages = ra->ra_pages;
 	unsigned long add_pages;
-	pgoff_t prev_offset;
+	pgoff_t prev_index;
 
 	/*
 	 * If the request exceeds the readahead window, allow the read to
@@ -396,15 +396,15 @@ static void ondemand_readahead(struct address_space *mapping,
 	/*
 	 * start of file
 	 */
-	if (!offset)
+	if (!index)
 		goto initial_readahead;
 
 	/*
-	 * It's the expected callback offset, assume sequential access.
+	 * It's the expected callback index, assume sequential access.
 	 * Ramp up sizes, and push forward the readahead window.
 	 */
-	if ((offset == (ra->start + ra->size - ra->async_size) ||
-	     offset == (ra->start + ra->size))) {
+	if ((index == (ra->start + ra->size - ra->async_size) ||
+	     index == (ra->start + ra->size))) {
 		ra->start += ra->size;
 		ra->size = get_next_ra_size(ra, max_pages);
 		ra->async_size = ra->size;
@@ -421,14 +421,14 @@ static void ondemand_readahead(struct address_space *mapping,
 		pgoff_t start;
 
 		rcu_read_lock();
-		start = page_cache_next_miss(mapping, offset + 1, max_pages);
+		start = page_cache_next_miss(mapping, index + 1, max_pages);
 		rcu_read_unlock();
 
-		if (!start || start - offset > max_pages)
+		if (!start || start - index > max_pages)
 			return;
 
 		ra->start = start;
-		ra->size = start - offset;	/* old async_size */
+		ra->size = start - index;	/* old async_size */
 		ra->size += req_size;
 		ra->size = get_next_ra_size(ra, max_pages);
 		ra->async_size = ra->size;
@@ -443,29 +443,29 @@ static void ondemand_readahead(struct address_space *mapping,
 
 	/*
 	 * sequential cache miss
-	 * trivial case: (offset - prev_offset) == 1
-	 * unaligned reads: (offset - prev_offset) == 0
+	 * trivial case: (index - prev_index) == 1
+	 * unaligned reads: (index - prev_index) == 0
 	 */
-	prev_offset = (unsigned long long)ra->prev_pos >> PAGE_SHIFT;
-	if (offset - prev_offset <= 1UL)
+	prev_index = (unsigned long long)ra->prev_pos >> PAGE_SHIFT;
+	if (index - prev_index <= 1UL)
 		goto initial_readahead;
 
 	/*
 	 * Query the page cache and look for the traces(cached history pages)
 	 * that a sequential stream would leave behind.
 	 */
-	if (try_context_readahead(mapping, ra, offset, req_size, max_pages))
+	if (try_context_readahead(mapping, ra, index, req_size, max_pages))
 		goto readit;
 
 	/*
 	 * standalone, small random read
 	 * Read as is, and do not pollute the readahead state.
 	 */
-	__do_page_cache_readahead(mapping, filp, offset, req_size, 0);
+	__do_page_cache_readahead(mapping, filp, index, req_size, 0);
 	return;
 
 initial_readahead:
-	ra->start = offset;
+	ra->start = index;
 	ra->size = get_init_ra_size(req_size, max_pages);
 	ra->async_size = ra->size > req_size ? ra->size - req_size : ra->size;
 
@@ -476,7 +476,7 @@ static void ondemand_readahead(struct address_space *mapping,
 	 * the resulted next readahead window into the current one.
 	 * Take care of maximum IO pages as above.
 	 */
-	if (offset == ra->start && ra->size == ra->async_size) {
+	if (index == ra->start && ra->size == ra->async_size) {
 		add_pages = get_next_ra_size(ra, max_pages);
 		if (ra->size + add_pages <= max_pages) {
 			ra->async_size = add_pages;
@@ -495,9 +495,8 @@ static void ondemand_readahead(struct address_space *mapping,
  * @mapping: address_space which holds the pagecache and I/O vectors
  * @ra: file_ra_state which holds the readahead state
  * @filp: passed on to ->readpage() and ->readpages()
- * @offset: start offset into @mapping, in pagecache page-sized units
- * @req_size: hint: total size of the read which the caller is performing in
- *            pagecache pages
+ * @index: Index of first page to be read.
+ * @req_count: Total number of pages being read by the caller.
  *
  * page_cache_sync_readahead() should be called when a cache miss happened:
  * it will submit the read.  The readahead logic may decide to piggyback more
@@ -506,7 +505,7 @@ static void ondemand_readahead(struct address_space *mapping,
  */
 void page_cache_sync_readahead(struct address_space *mapping,
 			       struct file_ra_state *ra, struct file *filp,
-			       pgoff_t offset, unsigned long req_size)
+			       pgoff_t index, unsigned long req_count)
 {
 	/* no read-ahead */
 	if (!ra->ra_pages)
@@ -517,12 +516,12 @@ void page_cache_sync_readahead(struct address_space *mapping,
 
 	/* be dumb */
 	if (filp && (filp->f_mode & FMODE_RANDOM)) {
-		force_page_cache_readahead(mapping, filp, offset, req_size);
+		force_page_cache_readahead(mapping, filp, index, req_count);
 		return;
 	}
 
 	/* do read-ahead */
-	ondemand_readahead(mapping, ra, filp, false, offset, req_size);
+	ondemand_readahead(mapping, ra, filp, false, index, req_count);
 }
 EXPORT_SYMBOL_GPL(page_cache_sync_readahead);
 
@@ -531,21 +530,20 @@ EXPORT_SYMBOL_GPL(page_cache_sync_readahead);
  * @mapping: address_space which holds the pagecache and I/O vectors
  * @ra: file_ra_state which holds the readahead state
  * @filp: passed on to ->readpage() and ->readpages()
- * @page: the page at @offset which has the PG_readahead flag set
- * @offset: start offset into @mapping, in pagecache page-sized units
- * @req_size: hint: total size of the read which the caller is performing in
- *            pagecache pages
+ * @page: The page at @index which triggered the readahead call.
+ * @index: Index of first page to be read.
+ * @req_count: Total number of pages being read by the caller.
  *
  * page_cache_async_readahead() should be called when a page is used which
- * has the PG_readahead flag; this is a marker to suggest that the application
+ * is marked as PageReadahead; this is a marker to suggest that the application
  * has used up enough of the readahead window that we should start pulling in
  * more pages.
  */
 void
 page_cache_async_readahead(struct address_space *mapping,
 			   struct file_ra_state *ra, struct file *filp,
-			   struct page *page, pgoff_t offset,
-			   unsigned long req_size)
+			   struct page *page, pgoff_t index,
+			   unsigned long req_count)
 {
 	/* no read-ahead */
 	if (!ra->ra_pages)
@@ -569,7 +567,7 @@ page_cache_async_readahead(struct address_space *mapping,
 		return;
 
 	/* do read-ahead */
-	ondemand_readahead(mapping, ra, filp, true, offset, req_size);
+	ondemand_readahead(mapping, ra, filp, true, index, req_count);
 }
 EXPORT_SYMBOL_GPL(page_cache_async_readahead);
 
-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
