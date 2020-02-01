Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DACB14F838
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Feb 2020 16:12:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ixuS7-0002Cv-45; Sat, 01 Feb 2020 15:12:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1ixuS6-0002Co-Eg
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Feb 2020 15:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6RY0UUjdaQhDdTRUN9wz8mjIn266EGtHTTMcbVMwTms=; b=Es2DW8yvzJVm6P4bo7qeBk2Kgt
 gZGRoY23fJtAj4b3xwzPyZ5d9YJatyPv+nZgKQhJVwSIePxB8CyFtPL2ngvoM09h5NJl9XRZSEHv0
 +QCLE1SKvpPZ9IewkepCCBHhCu0lCtYhP4q0QkQIsmvk6DGc4VBI853bPob1SUTDXrUc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6RY0UUjdaQhDdTRUN9wz8mjIn266EGtHTTMcbVMwTms=; b=KFmHltPSf7nPKV63DZR83UJaZH
 +DP5vWRrne2iqpXVuqLTnxioJyUV6SieqRHYvhwzxNG+BQulQlpRObuB2l8urUwfxAECN2Fwy2lal
 hgS2u34SK1kzCtJAdoOqMZ2HCIk+P5diM4M6ZVCV8V2zBAGgh1BdTGzmI7AzmA0heJuE=;
Received: from [198.137.202.133] (helo=bombadil.infradead.org)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ixuS4-00DHg4-Qh
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Feb 2020 15:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6RY0UUjdaQhDdTRUN9wz8mjIn266EGtHTTMcbVMwTms=; b=sg8vRCPjK4w0XFjy7NZSoRgAsd
 sBqqUd+isaXbSIeuUVYJtJcfV1jXRDPy/1U16VGmZmw7bTQ2rLIGBTuQKAD/evbIN/2CGbqf86yup
 XZ76ZxqM71IlldJbmwKxuiwssBnvs5ewBtmJYaNdUdUO6dOPG3sciLrooImEXaiNT1xW8H07J2elq
 MLCqW63FKLppkTHRkeZA8wHWWlexMlCPdis108H2QqcdbP7xU7qfs0u4ZevSD35ABj+qvZpfKPRbf
 WCKm37R+Iue4NcPjCNjV5Q89mRHaRwM5fowkUIPipwzn+iV7HDCMv8T9DB6eFWwAwMXNJ5OgUQWmH
 9h9aE2Jw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ixuRu-0006HP-4H; Sat, 01 Feb 2020 15:12:42 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Sat,  1 Feb 2020 07:12:31 -0800
Message-Id: <20200201151240.24082-4-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200201151240.24082-1-willy@infradead.org>
References: <20200201151240.24082-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: 2.1 (++)
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
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 -1.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ixuS4-00DHg4-Qh
Subject: [f2fs-dev] [PATCH v4 03/12] readahead: Put pages in cache earlier
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

At allocation time, put the pages in the cache unless we're using
->readpages.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: linux-btrfs@vger.kernel.org
Cc: linux-erofs@lists.ozlabs.org
Cc: linux-ext4@vger.kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net
Cc: linux-xfs@vger.kernel.org
Cc: cluster-devel@redhat.com
Cc: ocfs2-devel@oss.oracle.com
---
 mm/readahead.c | 64 ++++++++++++++++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 20 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index fc77d13af556..7daef0038b14 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -114,10 +114,10 @@ int read_cache_pages(struct address_space *mapping, struct list_head *pages,
 EXPORT_SYMBOL(read_cache_pages);
 
 static void read_pages(struct address_space *mapping, struct file *filp,
-		struct list_head *pages, unsigned int nr_pages, gfp_t gfp)
+		struct list_head *pages, pgoff_t start,
+		unsigned int nr_pages)
 {
 	struct blk_plug plug;
-	unsigned page_idx;
 
 	blk_start_plug(&plug);
 
@@ -125,18 +125,17 @@ static void read_pages(struct address_space *mapping, struct file *filp,
 		mapping->a_ops->readpages(filp, mapping, pages, nr_pages);
 		/* Clean up the remaining pages */
 		put_pages_list(pages);
-		goto out;
-	}
+	} else {
+		struct page *page;
+		unsigned long index;
 
-	for (page_idx = 0; page_idx < nr_pages; page_idx++) {
-		struct page *page = lru_to_page(pages);
-		list_del(&page->lru);
-		if (!add_to_page_cache_lru(page, mapping, page->index, gfp))
+		xa_for_each_range(&mapping->i_pages, index, page, start,
+				start + nr_pages - 1) {
 			mapping->a_ops->readpage(filp, page);
-		put_page(page);
+			put_page(page);
+		}
 	}
 
-out:
 	blk_finish_plug(&plug);
 }
 
@@ -153,13 +152,14 @@ unsigned long __do_page_cache_readahead(struct address_space *mapping,
 		unsigned long lookahead_size)
 {
 	struct inode *inode = mapping->host;
-	struct page *page;
 	unsigned long end_index;	/* The last page we want to read */
 	LIST_HEAD(page_pool);
 	int page_idx;
+	pgoff_t page_offset;
 	unsigned long nr_pages = 0;
 	loff_t isize = i_size_read(inode);
 	gfp_t gfp_mask = readahead_gfp_mask(mapping);
+	bool use_list = mapping->a_ops->readpages;
 
 	if (isize == 0)
 		goto out;
@@ -170,21 +170,32 @@ unsigned long __do_page_cache_readahead(struct address_space *mapping,
 	 * Preallocate as many pages as we will need.
 	 */
 	for (page_idx = 0; page_idx < nr_to_read; page_idx++) {
-		pgoff_t page_offset = offset + page_idx;
+		struct page *page;
 
+		page_offset = offset + page_idx;
 		if (page_offset > end_index)
 			break;
 
 		page = xa_load(&mapping->i_pages, page_offset);
 		if (page && !xa_is_value(page)) {
 			/*
-			 * Page already present?  Kick off the current batch of
-			 * contiguous pages before continuing with the next
-			 * batch.
+			 * Page already present?  Kick off the current batch
+			 * of contiguous pages before continuing with the
+			 * next batch.
 			 */
 			if (nr_pages)
-				read_pages(mapping, filp, &page_pool, nr_pages,
-						gfp_mask);
+				read_pages(mapping, filp, &page_pool,
+						page_offset - nr_pages,
+						nr_pages);
+			/*
+			 * It's possible this page is the page we should
+			 * be marking with PageReadahead.  However, we
+			 * don't have a stable ref to this page so it might
+			 * be reallocated to another user before we can set
+			 * the bit.  There's probably another page in the
+			 * cache marked with PageReadahead from the other
+			 * process which accessed this file.
+			 */
 			nr_pages = 0;
 			continue;
 		}
@@ -192,8 +203,20 @@ unsigned long __do_page_cache_readahead(struct address_space *mapping,
 		page = __page_cache_alloc(gfp_mask);
 		if (!page)
 			break;
-		page->index = page_offset;
-		list_add(&page->lru, &page_pool);
+		if (use_list) {
+			page->index = page_offset;
+			list_add(&page->lru, &page_pool);
+		} else if (add_to_page_cache_lru(page, mapping, page_offset,
+					gfp_mask) < 0) {
+			if (nr_pages)
+				read_pages(mapping, filp, &page_pool,
+						page_offset - nr_pages,
+						nr_pages);
+			put_page(page);
+			nr_pages = 0;
+			continue;
+		}
+
 		if (page_idx == nr_to_read - lookahead_size)
 			SetPageReadahead(page);
 		nr_pages++;
@@ -205,7 +228,8 @@ unsigned long __do_page_cache_readahead(struct address_space *mapping,
 	 * will then handle the error.
 	 */
 	if (nr_pages)
-		read_pages(mapping, filp, &page_pool, nr_pages, gfp_mask);
+		read_pages(mapping, filp, &page_pool, page_offset - nr_pages,
+				nr_pages);
 	BUG_ON(!list_empty(&page_pool));
 out:
 	return nr_pages;
-- 
2.24.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
