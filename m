Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9B515873B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Feb 2020 02:04:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j1JyC-0004fe-UX; Tue, 11 Feb 2020 01:04:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j1JyA-0004ev-0q
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Feb 2020 01:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pH5LFtlmOrFfMRG0qpJp1Yog2+5WC4QJAZDPBwZZUFQ=; b=Chob6IjUW+0NPrJpDZQiyddz1L
 5T6cwYU7Ty4oKFFiDpF8lj3K9z/EftxUvFCDOVVPxjrhXhbr3jn+kKLOaedljLo72cp4mtU73gvg6
 lVkD57gS71XM+eUhySEOetMb+Z2qGpI/galAOY8Ur1c7YFYc1S807zZcPnnyaFgTUJiw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pH5LFtlmOrFfMRG0qpJp1Yog2+5WC4QJAZDPBwZZUFQ=; b=ie3w+6VA94j+lfwbw/fgK0/b2L
 n37K528ir2kCbbsDtEWjwQTh5tkHMO3Fhlwj6VsOuiADd4JVzRGaiPEXEAuk5IKnw8KzICKIitrSO
 7XZXg7IkP9yZLfFSW/BmBBv38PqlWDMdU7lsBXskIQCnEsC+p/IMFMAIFzS5PYx1SCeY=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j1Jy8-0084PZ-5V
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Feb 2020 01:04:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=pH5LFtlmOrFfMRG0qpJp1Yog2+5WC4QJAZDPBwZZUFQ=; b=WYDhnMYb2Tl4xEYpfY2Ku86VXL
 FI/V0kmlpCs1KHRO35xmh+JKDrQMAEC2a25oQ9BygbUIHc0PYTN7FG/TumtQJ+kUp1O3OHsdm2haz
 hhEkhbx7SOE6j08H5VRVSHsnGE+ExUvbUQojTzl55uokP3eAI6x7olxu2lddAMOmqOny931og4gai
 VgiCC9cKCaXR15L83kZWcgQeZ0a5wsc3LFjHAjj0kTRlTOW+lLChKb6KWREqxkWZaagtfhYE9EiFR
 wECqSjkjhjQbWw5xKUEDD5X8x+mDovm6ZDsjY7BYvt+CQ33FjwZUVX3fAQDKwOducVwUJV4OnKGzp
 HTa7QHMQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j1Jxu-0001nh-AM; Tue, 11 Feb 2020 01:03:50 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 10 Feb 2020 17:03:36 -0800
Message-Id: <20200211010348.6872-2-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200211010348.6872-1-willy@infradead.org>
References: <20200211010348.6872-1-willy@infradead.org>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j1Jy8-0084PZ-5V
Subject: [f2fs-dev] [PATCH v5 01/13] mm: Fix the return type of
 __do_page_cache_readahead
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

ra_submit() which is a wrapper around __do_page_cache_readahead() already
returns an unsigned long, and the 'nr_to_read' parameter is an unsigned
long, so fix __do_page_cache_readahead() to return an unsigned long,
even though I'm pretty sure we're not going to readahead more than 2^32
pages ever.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/internal.h  | 2 +-
 mm/readahead.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 3cf20ab3ca01..41b93c4b3ab7 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -49,7 +49,7 @@ void unmap_page_range(struct mmu_gather *tlb,
 			     unsigned long addr, unsigned long end,
 			     struct zap_details *details);
 
-extern unsigned int __do_page_cache_readahead(struct address_space *mapping,
+extern unsigned long __do_page_cache_readahead(struct address_space *mapping,
 		struct file *filp, pgoff_t offset, unsigned long nr_to_read,
 		unsigned long lookahead_size);
 
diff --git a/mm/readahead.c b/mm/readahead.c
index 2fe72cd29b47..6bf73ef33b7e 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -152,7 +152,7 @@ static int read_pages(struct address_space *mapping, struct file *filp,
  *
  * Returns the number of pages requested, or the maximum amount of I/O allowed.
  */
-unsigned int __do_page_cache_readahead(struct address_space *mapping,
+unsigned long __do_page_cache_readahead(struct address_space *mapping,
 		struct file *filp, pgoff_t offset, unsigned long nr_to_read,
 		unsigned long lookahead_size)
 {
@@ -161,7 +161,7 @@ unsigned int __do_page_cache_readahead(struct address_space *mapping,
 	unsigned long end_index;	/* The last page we want to read */
 	LIST_HEAD(page_pool);
 	int page_idx;
-	unsigned int nr_pages = 0;
+	unsigned long nr_pages = 0;
 	loff_t isize = i_size_read(inode);
 	gfp_t gfp_mask = readahead_gfp_mask(mapping);
 
-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
