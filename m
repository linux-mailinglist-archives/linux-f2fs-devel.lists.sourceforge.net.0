Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFED161A06
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Feb 2020 19:46:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j3lPh-0000Jp-Qt; Mon, 17 Feb 2020 18:46:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j3lPf-0000HW-MT
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Feb 2020 18:46:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GsjiaZugI72vbGelDXh1gHsSqzMvkN1OtgDj3kywYLo=; b=Qm/KBkIsnhGLHZkyk5yMG/ggY/
 ow6Xf+AtsY5zTXH2txrCTpqRnZJhOzsO2GpYBFGnZEtlO3kjNAmTiS1TAbGKen/pF0EyOut03AFKj
 xWcWSDWU6HNOu4/oKpnJLTNCDRHvnyoA7ky+OLWSkRiDOU3epU7o263pd/FE2LWo+t6Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GsjiaZugI72vbGelDXh1gHsSqzMvkN1OtgDj3kywYLo=; b=QbqkYwwVGw5CbxTr0G+xmOd5Yk
 alpOSvT3ddMbkURGgF8jsvfS2pn42G8Jf94nsOlY08h9/ZMz4/2X6Pok6+J6r6vzTl4G0Lsjbxf91
 Ao4/tbBJ3MPq1iMZ2141fR7kEdcOz9C/MfgxtOYULsAK2sisvF+MXE7BBErVEnwA/JQI=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j3lPe-006PPG-MS
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Feb 2020 18:46:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=GsjiaZugI72vbGelDXh1gHsSqzMvkN1OtgDj3kywYLo=; b=mG3ezOVTlUwDZANXsCHvcKdwJB
 z3OlpT7AjCBCJphbep/jJMnYwWkqQCv4wTdvjax0x0CW6Nvu8+8tccy4vlbefujrJjJEj82Cnsx1d
 0Z0dVex246tKQbAITwLWjKWZ5u/u/QkHJfmmheFgDcrAuXqy1jKQgdOFfs9OG8e4Jv179uA6lHT0C
 rj7l1UtOFC7pBjOM+uPFkUB4PEe+Mm5ggHB2nPVgYYpq1iZJM1/7wiOXsE7PHbRws4qZi4knTfp9M
 Abo7HX1ADfB8vHy4nwtU2Q4tJcbww1fj8NQ9P/NHWgtRpkc995sdbYd50dglXP3xbP8Qt8cWX4AgS
 6OQh+pkw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j3lPL-00058r-DR; Mon, 17 Feb 2020 18:46:15 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Feb 2020 10:45:45 -0800
Message-Id: <20200217184613.19668-5-willy@infradead.org>
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
X-Headers-End: 1j3lPe-006PPG-MS
Subject: [f2fs-dev] [PATCH v6 04/19] mm: Rearrange readahead loop
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

Move the declaration of 'page' to inside the loop and move the 'kick
off a fresh batch' code to the end of the function for easier use in
subsequent patches.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/readahead.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index 15329309231f..3eca59c43a45 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -154,7 +154,6 @@ void __do_page_cache_readahead(struct address_space *mapping,
 		unsigned long lookahead_size)
 {
 	struct inode *inode = mapping->host;
-	struct page *page;
 	unsigned long end_index;	/* The last page we want to read */
 	LIST_HEAD(page_pool);
 	int page_idx;
@@ -175,6 +174,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
 	 * Preallocate as many pages as we will need.
 	 */
 	for (page_idx = 0; page_idx < nr_to_read; page_idx++) {
+		struct page *page;
 		pgoff_t page_offset = offset + page_idx;
 
 		if (page_offset > end_index)
@@ -183,14 +183,14 @@ void __do_page_cache_readahead(struct address_space *mapping,
 		page = xa_load(&mapping->i_pages, page_offset);
 		if (page && !xa_is_value(page)) {
 			/*
-			 * Page already present?  Kick off the current batch of
-			 * contiguous pages before continuing with the next
-			 * batch.
+			 * Page already present?  Kick off the current batch
+			 * of contiguous pages before continuing with the
+			 * next batch.  This page may be the one we would
+			 * have intended to mark as Readahead, but we don't
+			 * have a stable reference to this page, and it's
+			 * not worth getting one just for that.
 			 */
-			if (readahead_count(&rac))
-				read_pages(&rac, &page_pool, gfp_mask);
-			rac._nr_pages = 0;
-			continue;
+			goto read;
 		}
 
 		page = __page_cache_alloc(gfp_mask);
@@ -201,6 +201,11 @@ void __do_page_cache_readahead(struct address_space *mapping,
 		if (page_idx == nr_to_read - lookahead_size)
 			SetPageReadahead(page);
 		rac._nr_pages++;
+		continue;
+read:
+		if (readahead_count(&rac))
+			read_pages(&rac, &page_pool, gfp_mask);
+		rac._nr_pages = 0;
 	}
 
 	/*
-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
