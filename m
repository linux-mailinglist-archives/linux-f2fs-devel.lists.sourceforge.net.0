Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB23161A2E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Feb 2020 19:46:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j3lPq-0003Ec-M1; Mon, 17 Feb 2020 18:46:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j3lPp-0003ED-VR
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Feb 2020 18:46:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7Dxhm80Fw42pmsWKiiJ2urXHPFwIoqKidnXP7wm+j3k=; b=NEKg/3+AxCrYviJKc6n4w579ym
 6JdLJhfGlNgwe7CF6h01p07MRRo2ApioZ2qRtHSlDphIN5Zk+1wc4x6/RL4QmDaXP3phTEFbdbVfL
 LJ7qkd67MRe0aHBNGqa4M8AEGVtWdB7EvCix4iX8/ixsaJwqghcUUKdFHOW64mcJxrXI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7Dxhm80Fw42pmsWKiiJ2urXHPFwIoqKidnXP7wm+j3k=; b=IkbExlOMnR5CwLtVb/s8C9i7L9
 e242/snmHz6tCHAeO5dKDKCYPzLkz9Dy3nIo1cSb/XmtKeAmaAo65LhfkfYcKeK80faafoHT9x7s+
 /gS8Fy9ge8kv4EIbT0dBjYi6i3ooQHEySQOmZQx3oCFT1ZfWFA0nniLkWl4ruYST/QhA=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j3lPn-006PQX-75
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Feb 2020 18:46:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=7Dxhm80Fw42pmsWKiiJ2urXHPFwIoqKidnXP7wm+j3k=; b=h1IUDmbbrv0kbZmyB9xlf7gQNw
 iMrB/vhHv9BYzVoWzQPC+jK351aSsx/1tI7T9Gce4M/7CUHI/UIaRAFhGEbR3lwEirF55IcM+Vs+X
 Bm8uZ1XrLsfUdE2x3+ELxQ/rJ7ALniYcN2AVIpnvKZ3DyOHEGM8UXpMA4l0nuYVZZdFdJYUQfQLZn
 yfVyAvLe2FHaf+DmWFGGpf/QV3h664luosyXmbBh4lpibf+0zKbBPgIXClJKPrdEKmbfHgiDetLqU
 uVT0S1+epzjtcroqUq8aqdLWz0AR/IYP8HGUERcKOHeuIPPG7sSFsjIrEq8VQPInemww00PmubEW/
 78Ml4R8Q==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j3lPL-000593-GV; Mon, 17 Feb 2020 18:46:15 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Feb 2020 10:45:48 -0800
Message-Id: <20200217184613.19668-8-willy@infradead.org>
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
X-Headers-End: 1j3lPn-006PQX-75
Subject: [f2fs-dev] [PATCH v6 05/19] mm: Remove 'page_offset' from readahead
 loop
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

Eliminate the page_offset variable which was confusing with the
'offset' parameter and record the start of each consecutive run of
pages in the readahead_control.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/readahead.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index 3eca59c43a45..74791b96013f 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -162,6 +162,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
 	struct readahead_control rac = {
 		.mapping = mapping,
 		.file = filp,
+		._start = offset,
 		._nr_pages = 0,
 	};
 
@@ -175,12 +176,11 @@ void __do_page_cache_readahead(struct address_space *mapping,
 	 */
 	for (page_idx = 0; page_idx < nr_to_read; page_idx++) {
 		struct page *page;
-		pgoff_t page_offset = offset + page_idx;
 
-		if (page_offset > end_index)
+		if (offset > end_index)
 			break;
 
-		page = xa_load(&mapping->i_pages, page_offset);
+		page = xa_load(&mapping->i_pages, offset);
 		if (page && !xa_is_value(page)) {
 			/*
 			 * Page already present?  Kick off the current batch
@@ -196,16 +196,18 @@ void __do_page_cache_readahead(struct address_space *mapping,
 		page = __page_cache_alloc(gfp_mask);
 		if (!page)
 			break;
-		page->index = page_offset;
+		page->index = offset;
 		list_add(&page->lru, &page_pool);
 		if (page_idx == nr_to_read - lookahead_size)
 			SetPageReadahead(page);
 		rac._nr_pages++;
+		offset++;
 		continue;
 read:
 		if (readahead_count(&rac))
 			read_pages(&rac, &page_pool, gfp_mask);
 		rac._nr_pages = 0;
+		rac._start = ++offset;
 	}
 
 	/*
-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
