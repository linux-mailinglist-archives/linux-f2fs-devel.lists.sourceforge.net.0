Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1EE53DDEC
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  5 Jun 2022 21:39:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nxw5w-00061m-BO; Sun, 05 Jun 2022 19:39:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>) id 1nxw5n-00061S-2p
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jun 2022 19:39:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kW7acvpugaZzYgKpNVxP3YXlqqo8ej9HniApAt9C7Wk=; b=Mbewo+rA+MK2iYia/aYw+LgUYz
 GCXmOE2nvkYcdEepR6G8/P903wEVwL+9B9ImgCG2GXJFUO59NCw2SlHAB1s6MnoMLYdOFYkGe0cwM
 sGDKHjRuffHYrtPWSFwTOYWKRCo7lMgOeoYxPg/dzMl/l4SVxRH3KQyKiKOZZCPlSLuE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kW7acvpugaZzYgKpNVxP3YXlqqo8ej9HniApAt9C7Wk=; b=RroO6EIqL6Lu+C1OmYnE3DkGQ+
 IdkfxkQm3xXhSl0XZZY0tBdlI9dwyiF2svjNucgeNCQwrZmUXvsqpfAwS3EBkQt+JwMD056aKQDAZ
 YElZryAZhLyYFiuPJ2giEIbqgP9s9XlzUPuLKig+tkIGsjlfEHnvZ7GKs5bdJKcQTLAY=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nxw5i-000555-Of
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jun 2022 19:39:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=kW7acvpugaZzYgKpNVxP3YXlqqo8ej9HniApAt9C7Wk=; b=GayB5dkNyETT1aj143hZpJ9xJr
 2W3PmmqCmdsuLmQY9SEJ2F5XCz/p7+bPpCYBl4Z5FqoKlX63+mesk72QIxc8GbTFN6Vj7N693OPSz
 EAzmfYVOvCExzpQVT6Eo/3ppcpw0dDWOCBIJT0J9+VT3SAskMmWebD7iZwtwga09wxGXdZq+DsWH5
 zr7rRtR8Ot38QThbkmEFP5sH8mKV2McSI3M5hohoBkIJ5y1yhfwz8O//gZN4YDvKQv5lqJ1I98SFm
 mt+aJZdCZBveBW7dWweDqSqXxJAfQ3m2/dVOOj384TYkN3SRcXmxaAndo0qADxxP6/AoDc9ozluPC
 6SRvx5Ow==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nxw5R-009wsh-Ac; Sun, 05 Jun 2022 19:38:57 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Sun,  5 Jun 2022 20:38:54 +0100
Message-Id: <20220605193854.2371230-11-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220605193854.2371230-1-willy@infradead.org>
References: <20220605193854.2371230-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  All callers of find_get_pages_range(), pagevec_lookup_range()
 and pagevec_lookup() have now been removed. Signed-off-by: Matthew Wilcox
 (Oracle) <willy@infradead.org> --- include/linux/pagemap.h | 3 --
 include/linux/pagevec.h
 | 10 ------ mm/filemap.c | 67 mm/swap. [...] 
 Content analysis details:   (2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nxw5i-000555-Of
Subject: [f2fs-dev] [PATCH 10/10] filemap: Remove find_get_pages_range() and
 associated functions
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
Cc: linux-nilfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

All callers of find_get_pages_range(), pagevec_lookup_range() and
pagevec_lookup() have now been removed.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/pagemap.h |  3 --
 include/linux/pagevec.h | 10 ------
 mm/filemap.c            | 67 -----------------------------------------
 mm/swap.c               | 29 ------------------
 4 files changed, 109 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 50e57b2d845f..1caccb9f99aa 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -720,9 +720,6 @@ static inline struct page *find_subpage(struct page *head, pgoff_t index)
 
 unsigned filemap_get_folios(struct address_space *mapping, pgoff_t *start,
 		pgoff_t end, struct folio_batch *fbatch);
-unsigned find_get_pages_range(struct address_space *mapping, pgoff_t *start,
-			pgoff_t end, unsigned int nr_pages,
-			struct page **pages);
 unsigned find_get_pages_contig(struct address_space *mapping, pgoff_t start,
 			       unsigned int nr_pages, struct page **pages);
 unsigned find_get_pages_range_tag(struct address_space *mapping, pgoff_t *index,
diff --git a/include/linux/pagevec.h b/include/linux/pagevec.h
index 67b1246f136b..6649154a2115 100644
--- a/include/linux/pagevec.h
+++ b/include/linux/pagevec.h
@@ -27,16 +27,6 @@ struct pagevec {
 
 void __pagevec_release(struct pagevec *pvec);
 void __pagevec_lru_add(struct pagevec *pvec);
-unsigned pagevec_lookup_range(struct pagevec *pvec,
-			      struct address_space *mapping,
-			      pgoff_t *start, pgoff_t end);
-static inline unsigned pagevec_lookup(struct pagevec *pvec,
-				      struct address_space *mapping,
-				      pgoff_t *start)
-{
-	return pagevec_lookup_range(pvec, mapping, start, (pgoff_t)-1);
-}
-
 unsigned pagevec_lookup_range_tag(struct pagevec *pvec,
 		struct address_space *mapping, pgoff_t *index, pgoff_t end,
 		xa_mark_t tag);
diff --git a/mm/filemap.c b/mm/filemap.c
index ea4145b7a84c..340ccb37f6b6 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2192,73 +2192,6 @@ bool folio_more_pages(struct folio *folio, pgoff_t index, pgoff_t max)
 	return index < folio->index + folio_nr_pages(folio) - 1;
 }
 
-/**
- * find_get_pages_range - gang pagecache lookup
- * @mapping:	The address_space to search
- * @start:	The starting page index
- * @end:	The final page index (inclusive)
- * @nr_pages:	The maximum number of pages
- * @pages:	Where the resulting pages are placed
- *
- * find_get_pages_range() will search for and return a group of up to @nr_pages
- * pages in the mapping starting at index @start and up to index @end
- * (inclusive).  The pages are placed at @pages.  find_get_pages_range() takes
- * a reference against the returned pages.
- *
- * The search returns a group of mapping-contiguous pages with ascending
- * indexes.  There may be holes in the indices due to not-present pages.
- * We also update @start to index the next page for the traversal.
- *
- * Return: the number of pages which were found. If this number is
- * smaller than @nr_pages, the end of specified range has been
- * reached.
- */
-unsigned find_get_pages_range(struct address_space *mapping, pgoff_t *start,
-			      pgoff_t end, unsigned int nr_pages,
-			      struct page **pages)
-{
-	XA_STATE(xas, &mapping->i_pages, *start);
-	struct folio *folio;
-	unsigned ret = 0;
-
-	if (unlikely(!nr_pages))
-		return 0;
-
-	rcu_read_lock();
-	while ((folio = find_get_entry(&xas, end, XA_PRESENT))) {
-		/* Skip over shadow, swap and DAX entries */
-		if (xa_is_value(folio))
-			continue;
-
-again:
-		pages[ret] = folio_file_page(folio, xas.xa_index);
-		if (++ret == nr_pages) {
-			*start = xas.xa_index + 1;
-			goto out;
-		}
-		if (folio_more_pages(folio, xas.xa_index, end)) {
-			xas.xa_index++;
-			folio_ref_inc(folio);
-			goto again;
-		}
-	}
-
-	/*
-	 * We come here when there is no page beyond @end. We take care to not
-	 * overflow the index @start as it confuses some of the callers. This
-	 * breaks the iteration when there is a page at index -1 but that is
-	 * already broken anyway.
-	 */
-	if (end == (pgoff_t)-1)
-		*start = (pgoff_t)-1;
-	else
-		*start = end + 1;
-out:
-	rcu_read_unlock();
-
-	return ret;
-}
-
 /**
  * find_get_pages_contig - gang contiguous pagecache lookup
  * @mapping:	The address_space to search
diff --git a/mm/swap.c b/mm/swap.c
index f3922a96b2e9..f65e284247b2 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -1086,35 +1086,6 @@ void folio_batch_remove_exceptionals(struct folio_batch *fbatch)
 	fbatch->nr = j;
 }
 
-/**
- * pagevec_lookup_range - gang pagecache lookup
- * @pvec:	Where the resulting pages are placed
- * @mapping:	The address_space to search
- * @start:	The starting page index
- * @end:	The final page index
- *
- * pagevec_lookup_range() will search for & return a group of up to PAGEVEC_SIZE
- * pages in the mapping starting from index @start and upto index @end
- * (inclusive).  The pages are placed in @pvec.  pagevec_lookup() takes a
- * reference against the pages in @pvec.
- *
- * The search returns a group of mapping-contiguous pages with ascending
- * indexes.  There may be holes in the indices due to not-present pages. We
- * also update @start to index the next page for the traversal.
- *
- * pagevec_lookup_range() returns the number of pages which were found. If this
- * number is smaller than PAGEVEC_SIZE, the end of specified range has been
- * reached.
- */
-unsigned pagevec_lookup_range(struct pagevec *pvec,
-		struct address_space *mapping, pgoff_t *start, pgoff_t end)
-{
-	pvec->nr = find_get_pages_range(mapping, start, end, PAGEVEC_SIZE,
-					pvec->pages);
-	return pagevec_count(pvec);
-}
-EXPORT_SYMBOL(pagevec_lookup_range);
-
 unsigned pagevec_lookup_range_tag(struct pagevec *pvec,
 		struct address_space *mapping, pgoff_t *index, pgoff_t end,
 		xa_mark_t tag)
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
