Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1470F18FEBA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2020 21:23:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGTbV-0000rO-RM; Mon, 23 Mar 2020 20:23:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jGTbP-0000pK-2x
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 20:23:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a3v6yDLu6YVVgdwzNLLzwkeJ8vT0YawbuKhMcViKfm0=; b=XfaKOqWyD+CdtSTB0FZDbdX1Nz
 1vrdjCqaDzl/1ojiCIz1g8iM4nwJbfL000PNzU1cA1BS8TY4gAqy3/tSazfctLRTh9sjI0w7pa2jW
 z+EIxrzwPl0aU86cU05uWvCivsd3PM7DMJ6xEzObHXGyOZK8SWPNq8Mqf1jztkkZuEYA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a3v6yDLu6YVVgdwzNLLzwkeJ8vT0YawbuKhMcViKfm0=; b=do1W+EdFSaJuUm0DYeqIzJ3HPy
 NqfdFHkFa0wGYg2+25h9TNisIo4Z7zA+usu4TvYGfRaIp3xuNOIulw1Df8VMqlo9VQHigoVlrlMId
 i4o6Ftt50Wwi0fAC4+B27JixMsagiW4/Ru6azxp+/ZVtUD5mNIlrwAcsni3PTPqgS/Hc=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGTbO-001Hcs-0L
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 20:23:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=a3v6yDLu6YVVgdwzNLLzwkeJ8vT0YawbuKhMcViKfm0=; b=cful21T9r3bVU98Icr24dfrJyn
 kHFGsNuTm37ajb0PTC7EhOpjwRvV2C8UWCqRCj4X5NaN4lqUXZEJv2zsnY3tsXREFwBthl696zrh5
 w/n3es3aFrUXZcPXNIhDGIfeT7wMfXMu44CfU1sTA+yqYfNZ8FuwAM16U8W2tOJ+zQAyPbag4FZrI
 7AdhoSkTthn9CJYF+rTvr4JzL6GJ3IL/HECYDus+kk6x6XQtEFdifvYUjajTPg5GGPhG/SDspAcec
 64yEPuz4hF66+ytNKqmPHAhGNlfKKWbVSyYYhRLD/aFyEi0XwYBbPyqFEjUAraa7Pzr0/Bi+68CSF
 e9nRWANA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jGTbB-0003Ux-KV; Mon, 23 Mar 2020 20:23:01 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 23 Mar 2020 13:22:42 -0700
Message-Id: <20200323202259.13363-9-willy@infradead.org>
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
 for more information. [URIs: nvidia.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jGTbO-001Hcs-0L
Subject: [f2fs-dev] [PATCH v10 08/25] mm: rename readahead loop variable to
 'i'
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
 John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
 Dave Chinner <dchinner@redhat.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Change the type of page_idx to unsigned long, and rename it -- it's
just a loop counter, not a page index.

Suggested-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Dave Chinner <dchinner@redhat.com>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
---
 mm/readahead.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index 8a65d6bd97e0..7ce320854bad 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -163,13 +163,13 @@ void __do_page_cache_readahead(struct address_space *mapping,
 	struct page *page;
 	unsigned long end_index;	/* The last page we want to read */
 	LIST_HEAD(page_pool);
-	int page_idx;
 	loff_t isize = i_size_read(inode);
 	gfp_t gfp_mask = readahead_gfp_mask(mapping);
 	struct readahead_control rac = {
 		.mapping = mapping,
 		.file = filp,
 	};
+	unsigned long i;
 
 	if (isize == 0)
 		return;
@@ -179,8 +179,8 @@ void __do_page_cache_readahead(struct address_space *mapping,
 	/*
 	 * Preallocate as many pages as we will need.
 	 */
-	for (page_idx = 0; page_idx < nr_to_read; page_idx++) {
-		pgoff_t page_offset = index + page_idx;
+	for (i = 0; i < nr_to_read; i++) {
+		pgoff_t page_offset = index + i;
 
 		if (page_offset > end_index)
 			break;
@@ -201,7 +201,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
 			break;
 		page->index = page_offset;
 		list_add(&page->lru, &page_pool);
-		if (page_idx == nr_to_read - lookahead_size)
+		if (i == nr_to_read - lookahead_size)
 			SetPageReadahead(page);
 		rac._nr_pages++;
 	}
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
