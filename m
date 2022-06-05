Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF26D53DDEA
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  5 Jun 2022 21:39:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nxw5u-0001b4-8H; Sun, 05 Jun 2022 19:39:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>) id 1nxw5s-0001ak-3B
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jun 2022 19:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6g09y1A9jVwuZlJR1irGeBqDpd31Ui3pSGWrlaz4nb0=; b=lKTJnc79odjifwMClYaMqg9dwq
 gu3G2FD3+6oggsEFcDb80dTbGQVgnk6dAmFd7R4UFvoIOOQifERpelMgjBESCXU1gRMJc42DoNc8y
 aNsaya4vVLVyHWjsjqEESFpYXZJlxdX1XsXpC3wX7NpRm3q6PyodfV8spNeIFBkFfw80=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6g09y1A9jVwuZlJR1irGeBqDpd31Ui3pSGWrlaz4nb0=; b=UAz1HwBefv0T4cgUNVR1EalXBy
 Yd1aDrMojVJUdQkThJN54fBx7MzsNlCB5QS3wC6ytXnSzUcM0SSXgsnrAEbIJQVnLkxEmMgQPP4b1
 ImoTdHAAgxPe0pbd5rfSF6BcMLr1LaLA8rN6vU72TgxbOINkQuM3U68GA9gBw6WZgDEo=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nxw5p-006MEm-Oe
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jun 2022 19:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=6g09y1A9jVwuZlJR1irGeBqDpd31Ui3pSGWrlaz4nb0=; b=pg4gnoTyTVQMZkuLsLjufELZOm
 zdlkyM6Epz9Y5ls6kjBxq58ihNIUrb2VqIKn1nUlONRVxbp4g7dlQzMHo9JPUvh1cyx4cdcigWDI1
 slwAgDoI7SkWyyzH+j97LCItJ0qSvavcuPnYPdS5zdoFT4aZpCiGwaGGj7aUofkedaHvtjKzyVrNI
 42u9ldindn05Wm1yrBmLckPHwYi8R4I2j0QnGjrpg23633uwpEOoaC3S55ItOiGyvCgkUjK/1UElz
 ks1lQWAPi22UiL9YIdwqGaBwOialRfaScxUmJwyto5dh3WMxU2Ag123Wygqx+r/Kt4P8V7BgYZyFl
 43sDr6cA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nxw5Q-009wsP-JZ; Sun, 05 Jun 2022 19:38:56 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Sun,  5 Jun 2022 20:38:45 +0100
Message-Id: <20220605193854.2371230-2-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220605193854.2371230-1-willy@infradead.org>
References: <20220605193854.2371230-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is the equivalent of find_get_pages() but fills a
 folio_batch
 instead of an array of pages. Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- include/linux/pagemap.h | 2 ++ mm/filemap.c | 55
 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+) 
 Content analysis details:   (2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1nxw5p-006MEm-Oe
Subject: [f2fs-dev] [PATCH 01/10] filemap: Add filemap_get_folios()
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

This is the equivalent of find_get_pages() but fills a folio_batch
instead of an array of pages.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/pagemap.h |  2 ++
 mm/filemap.c            | 55 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 5555689ea809..50e57b2d845f 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -718,6 +718,8 @@ static inline struct page *find_subpage(struct page *head, pgoff_t index)
 	return head + (index & (thp_nr_pages(head) - 1));
 }
 
+unsigned filemap_get_folios(struct address_space *mapping, pgoff_t *start,
+		pgoff_t end, struct folio_batch *fbatch);
 unsigned find_get_pages_range(struct address_space *mapping, pgoff_t *start,
 			pgoff_t end, unsigned int nr_pages,
 			struct page **pages);
diff --git a/mm/filemap.c b/mm/filemap.c
index 1e66eea98a7e..ea4145b7a84c 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2127,6 +2127,61 @@ unsigned find_lock_entries(struct address_space *mapping, pgoff_t start,
 	return folio_batch_count(fbatch);
 }
 
+/**
+ * filemap_get_folios - Get a batch of folios
+ * @mapping:	The address_space to search
+ * @start:	The starting page index
+ * @end:	The final page index (inclusive)
+ * @fbatch:	The batch to fill.
+ *
+ * Search for and return a batch of folios in the mapping starting at
+ * index @start and up to index @end (inclusive).  The folios are returned
+ * in @fbatch with an elevated reference count.
+ *
+ * The first folio may start before @start; if it does, it will contain
+ * @start.  The final folio may extend beyond @end; if it does, it will
+ * contain @end.  The folios have ascending indices.  There may be gaps
+ * between the folios if there are indices which have no folio in the
+ * page cache.  If folios are added to or removed from the page cache
+ * while this is running, they may or may not be found by this call.
+ *
+ * Return: The number of folios which were found.
+ * We also update @start to index the next folio for the traversal.
+ */
+unsigned filemap_get_folios(struct address_space *mapping, pgoff_t *start,
+		pgoff_t end, struct folio_batch *fbatch)
+{
+	XA_STATE(xas, &mapping->i_pages, *start);
+	struct folio *folio;
+
+	rcu_read_lock();
+	while ((folio = find_get_entry(&xas, end, XA_PRESENT)) != NULL) {
+		/* Skip over shadow, swap and DAX entries */
+		if (xa_is_value(folio))
+			continue;
+		if (!folio_batch_add(fbatch, folio)) {
+			*start = folio->index + folio_nr_pages(folio);
+			goto out;
+		}
+	}
+
+	/*
+	 * We come here when there is no page beyond @end. We take care to not
+	 * overflow the index @start as it confuses some of the callers. This
+	 * breaks the iteration when there is a page at index -1 but that is
+	 * already broken anyway.
+	 */
+	if (end == (pgoff_t)-1)
+		*start = (pgoff_t)-1;
+	else
+		*start = end + 1;
+out:
+	rcu_read_unlock();
+
+	return folio_batch_count(fbatch);
+}
+EXPORT_SYMBOL(filemap_get_folios);
+
 static inline
 bool folio_more_pages(struct folio *folio, pgoff_t index, pgoff_t max)
 {
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
