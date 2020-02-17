Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B0A161A08
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Feb 2020 19:46:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j3lPi-00039P-UL; Mon, 17 Feb 2020 18:46:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j3lPc-00036B-SN
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Feb 2020 18:46:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JHQZUif7GrXF5c6dt1x94JQ/eERbsKsl9szla620yGg=; b=Ck8vJJUR4btUWZ9Phw4lSsfyDa
 k0sjHqROPqbbZhms9ghZ2b964KlAPdwDBzn+xSF3fG2m4wQik8ZDUkmY7K+Bs7NkXJ1KE7Vo6Og0T
 aUj94L7HkNjMIEVJpuA7cABkLOmU7smkUMqY5oiaddJI3Dp0SKy9adePig+UgjY1z/bo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JHQZUif7GrXF5c6dt1x94JQ/eERbsKsl9szla620yGg=; b=CCrbElLQuKwPECkdAmHD59JIVr
 uPay8H3DiCEcn7AZR+88L82eCwSjIy9zaBVIhgcLeSQQWV1IK5lgcdpFiq5EuWCW175yseTU8U25G
 ibCGTqfOl+FKBOc+7TemxRY+M+4WjmD4zHTqMCqdt8jhccAU0q+uP7gxUFUJ56WQ5KR0=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j3lPb-006iXq-PQ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Feb 2020 18:46:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=JHQZUif7GrXF5c6dt1x94JQ/eERbsKsl9szla620yGg=; b=MwopgXm2jrH3SI/KCNCU9kTcM/
 dbE6z4ghybS40X+Y522lD+E/Px6QZSdy/WskVldqgb8kNys8BTLFOs9Ix5lX1cQCMVQqBNY0OrA6M
 SCv5aSifERzuMP8/yzWjikX6Z3wB4tFF1SHtcHtmSpq9fT6oDSWicm0Vbtr37+iu0KFIc29PidL38
 kVlwFzmJW+ra21Pw8v6Lc39a5gLT7BcDAW6QvyFTpsZr4vCDl95IvI+nDZChH0dxeoi3k7rD0QpXl
 m3s4AqkENlFwUpKkFceab08z7tasn1FQzTNd2VM/s+dD0OfE8rlbWrz9U3nQSTby9xGZSfXDdTYgJ
 8qXWRWEg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j3lPL-00059e-Lj; Mon, 17 Feb 2020 18:46:15 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Feb 2020 10:45:52 -0800
Message-Id: <20200217184613.19668-12-willy@infradead.org>
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
X-Headers-End: 1j3lPb-006iXq-PQ
Subject: [f2fs-dev] [PATCH v6 07/19] mm: Put readahead pages in cache earlier
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

At allocation time, put the pages in the cache unless we're using
->readpages.  Add the readahead_for_each() iterator for the benefit of
the ->readpage fallback.  This iterator supports huge pages, even though
none of the filesystems to be converted do yet.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/pagemap.h | 24 ++++++++++++++++++++++++
 mm/readahead.c          | 34 +++++++++++++++++-----------------
 2 files changed, 41 insertions(+), 17 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 982ecda2d4a2..3613154e79e4 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -639,8 +639,32 @@ struct readahead_control {
 /* private: use the readahead_* accessors instead */
 	pgoff_t _start;
 	unsigned int _nr_pages;
+	unsigned int _batch_count;
 };
 
+static inline struct page *readahead_page(struct readahead_control *rac)
+{
+	struct page *page;
+
+	if (!rac->_nr_pages)
+		return NULL;
+
+	page = xa_load(&rac->mapping->i_pages, rac->_start);
+	VM_BUG_ON_PAGE(!PageLocked(page), page);
+	rac->_batch_count = hpage_nr_pages(page);
+
+	return page;
+}
+
+static inline void readahead_next(struct readahead_control *rac)
+{
+	rac->_nr_pages -= rac->_batch_count;
+	rac->_start += rac->_batch_count;
+}
+
+#define readahead_for_each(rac, page)					\
+	for (; (page = readahead_page(rac)); readahead_next(rac))
+
 /* The number of pages in this readahead block */
 static inline unsigned int readahead_count(struct readahead_control *rac)
 {
diff --git a/mm/readahead.c b/mm/readahead.c
index bdc5759000d3..9e430daae42f 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -113,12 +113,11 @@ int read_cache_pages(struct address_space *mapping, struct list_head *pages,
 
 EXPORT_SYMBOL(read_cache_pages);
 
-static void read_pages(struct readahead_control *rac, struct list_head *pages,
-		gfp_t gfp)
+static void read_pages(struct readahead_control *rac, struct list_head *pages)
 {
 	const struct address_space_operations *aops = rac->mapping->a_ops;
+	struct page *page;
 	struct blk_plug plug;
-	unsigned page_idx;
 
 	blk_start_plug(&plug);
 
@@ -127,19 +126,13 @@ static void read_pages(struct readahead_control *rac, struct list_head *pages,
 				readahead_count(rac));
 		/* Clean up the remaining pages */
 		put_pages_list(pages);
-		goto out;
-	}
-
-	for (page_idx = 0; page_idx < readahead_count(rac); page_idx++) {
-		struct page *page = lru_to_page(pages);
-		list_del(&page->lru);
-		if (!add_to_page_cache_lru(page, rac->mapping, page->index,
-				gfp))
+	} else {
+		readahead_for_each(rac, page) {
 			aops->readpage(rac->file, page);
-		put_page(page);
+			put_page(page);
+		}
 	}
 
-out:
 	blk_finish_plug(&plug);
 }
 
@@ -159,6 +152,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
 	unsigned long i;
 	loff_t isize = i_size_read(inode);
 	gfp_t gfp_mask = readahead_gfp_mask(mapping);
+	bool use_list = mapping->a_ops->readpages;
 	struct readahead_control rac = {
 		.mapping = mapping,
 		.file = filp,
@@ -196,8 +190,14 @@ void __do_page_cache_readahead(struct address_space *mapping,
 		page = __page_cache_alloc(gfp_mask);
 		if (!page)
 			break;
-		page->index = offset;
-		list_add(&page->lru, &page_pool);
+		if (use_list) {
+			page->index = offset;
+			list_add(&page->lru, &page_pool);
+		} else if (add_to_page_cache_lru(page, mapping, offset,
+					gfp_mask) < 0) {
+			put_page(page);
+			goto read;
+		}
 		if (i == nr_to_read - lookahead_size)
 			SetPageReadahead(page);
 		rac._nr_pages++;
@@ -205,7 +205,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
 		continue;
 read:
 		if (readahead_count(&rac))
-			read_pages(&rac, &page_pool, gfp_mask);
+			read_pages(&rac, &page_pool);
 		rac._nr_pages = 0;
 		rac._start = ++offset;
 	}
@@ -216,7 +216,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
 	 * will then handle the error.
 	 */
 	if (readahead_count(&rac))
-		read_pages(&rac, &page_pool, gfp_mask);
+		read_pages(&rac, &page_pool);
 	BUG_ON(!list_empty(&page_pool));
 }
 
-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
