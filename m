Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3690818FEC2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2020 21:23:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGTbX-0006dm-0O; Mon, 23 Mar 2020 20:23:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jGTbS-0006c3-EK
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 20:23:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lGGXOGXMyka6T3tpeyl3b0+hXD5oslkz5aNH49zanLk=; b=JC5MRrWs8jHwqXTkYXflOPwt6y
 kW3FLvfVT9XUTUeGVy+MrE0ZVK1zA3sKArm0NkkZBjexpBjIJLue5R4al/r0yf2CXv9F5fttwJ9Sj
 3QlDi53fI9ONiYkFKKmgbI8c7Fei/30zKiJ2NFNJNSRbeW5KV68wlCe8D7kvdeCf/424=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lGGXOGXMyka6T3tpeyl3b0+hXD5oslkz5aNH49zanLk=; b=hYahe1Z2U0FlrdwL/D/D9C8h9k
 mQ7fCGu4vDlH4JaGplhbQHyNThCgZfrm5wK5eNyCkAp7fr181sNR3pvMf/Kq5z0w/24slXmO8tUad
 WtX/wqXo34zNU9q+tdKXCGV968nqHyiJZPkJ/QrDCuxKPUZWcdFw0tUbmPpNHDXr3J0E=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGTbP-004zlz-6v
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 20:23:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=lGGXOGXMyka6T3tpeyl3b0+hXD5oslkz5aNH49zanLk=; b=Pf6fDCqou0uVyo4WFl4VqQ3jfh
 OwfV7aDdHELEF0ya3H8WmQOqtYZxtlGgvCXk/oso9rELjOQtdX0l/4lJHNtY5sSAjgPtKgU/vCH93
 vjbPDrAcO8jh7to++g2mgvBW3RG5Qy7bnTix0p51rEFRalw8VKlwQsU/35VG7BD9zh87kh0NoSgbw
 /cg6VVWGmOE9vaYsozLo1a+uRBWbWq0WnuuikJMpZV/foNlWenp4FrLUx3q+OV2oIAzsJ6SXZRxk5
 6Xj4ZjrMO0ldPPJYhktUcupt7gj/j4PfvjkcUjz6VsFmVxNAscUTJ0HgKGDQBvZail6GXVph4kclo
 ie87fhvQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jGTbB-0003V5-MW; Mon, 23 Mar 2020 20:23:01 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 23 Mar 2020 13:22:44 -0700
Message-Id: <20200323202259.13363-11-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200323202259.13363-1-willy@infradead.org>
References: <20200323202259.13363-1-willy@infradead.org>
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
X-Headers-End: 1jGTbP-004zlz-6v
Subject: [f2fs-dev] [PATCH v10 10/25] mm: Put readahead pages in cache
 earlier
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
 linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

When populating the page cache for readahead, mappings that use
->readpages must populate the page cache themselves as the pages are
passed on a linked list which would normally be used for the page cache's
LRU.  For mappings that use ->readpage or the upcoming ->readahead method,
we can put the pages into the page cache as soon as they're allocated,
which solves a race between readahead and direct IO.  It also lets us
remove the gfp argument from read_pages().

Use the new readahead_page() API to implement the repeated calls to
->readpage(), just like most filesystems will.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
---
 mm/readahead.c | 46 ++++++++++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index ddc63d3b07b8..e52b3a7b9da5 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -114,14 +114,14 @@ int read_cache_pages(struct address_space *mapping, struct list_head *pages,
 EXPORT_SYMBOL(read_cache_pages);
 
 static void read_pages(struct readahead_control *rac, struct list_head *pages,
-		gfp_t gfp)
+		bool skip_page)
 {
 	const struct address_space_operations *aops = rac->mapping->a_ops;
+	struct page *page;
 	struct blk_plug plug;
-	unsigned page_idx;
 
 	if (!readahead_count(rac))
-		return;
+		goto out;
 
 	blk_start_plug(&plug);
 
@@ -130,23 +130,23 @@ static void read_pages(struct readahead_control *rac, struct list_head *pages,
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
+		rac->_index += rac->_nr_pages;
+		rac->_nr_pages = 0;
+	} else {
+		while ((page = readahead_page(rac))) {
 			aops->readpage(rac->file, page);
-		put_page(page);
+			put_page(page);
+		}
 	}
 
-out:
 	blk_finish_plug(&plug);
 
 	BUG_ON(!list_empty(pages));
-	rac->_nr_pages = 0;
+	BUG_ON(readahead_count(rac));
+
+out:
+	if (skip_page)
+		rac->_index++;
 }
 
 /*
@@ -168,6 +168,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
 	struct readahead_control rac = {
 		.mapping = mapping,
 		.file = filp,
+		._index = index,
 	};
 	unsigned long i;
 
@@ -183,6 +184,8 @@ void __do_page_cache_readahead(struct address_space *mapping,
 		if (index + i > end_index)
 			break;
 
+		BUG_ON(index + i != rac._index + rac._nr_pages);
+
 		page = xa_load(&mapping->i_pages, index + i);
 		if (page && !xa_is_value(page)) {
 			/*
@@ -190,15 +193,22 @@ void __do_page_cache_readahead(struct address_space *mapping,
 			 * contiguous pages before continuing with the next
 			 * batch.
 			 */
-			read_pages(&rac, &page_pool, gfp_mask);
+			read_pages(&rac, &page_pool, true);
 			continue;
 		}
 
 		page = __page_cache_alloc(gfp_mask);
 		if (!page)
 			break;
-		page->index = index + i;
-		list_add(&page->lru, &page_pool);
+		if (mapping->a_ops->readpages) {
+			page->index = index + i;
+			list_add(&page->lru, &page_pool);
+		} else if (add_to_page_cache_lru(page, mapping, index + i,
+					gfp_mask) < 0) {
+			put_page(page);
+			read_pages(&rac, &page_pool, true);
+			continue;
+		}
 		if (i == nr_to_read - lookahead_size)
 			SetPageReadahead(page);
 		rac._nr_pages++;
@@ -209,7 +219,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
 	 * uptodate then the caller will launch readpage again, and
 	 * will then handle the error.
 	 */
-	read_pages(&rac, &page_pool, gfp_mask);
+	read_pages(&rac, &page_pool, false);
 }
 
 /*
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
