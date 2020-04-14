Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F9D1A80AC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Apr 2020 17:02:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jON5U-0006Zo-85; Tue, 14 Apr 2020 15:02:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jON5Q-0006Yh-D8
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Apr 2020 15:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tVTCrH8cQ/F5ivWRNhrAQ0ihqzkrHbjiqbn9CKzaols=; b=G+dxlQdfkeemiikbYRUYeC9FGG
 B4phht3NnakjLFVH2HnQGc3NahDYoslFiWqJ3vvl3SfZtT5ideHtu+lQlaxG2i7OxGcvQciqnyCm3
 q5NWyHsdXzx1DdrhoTzZ8psHe8Gq65rXk/Ekn9j83iRCtNwhsxCeBrt2ljtLAORjgwUU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tVTCrH8cQ/F5ivWRNhrAQ0ihqzkrHbjiqbn9CKzaols=; b=Mp1HPVT823oMjMDif7lvUQi8mK
 IMVBSoFBkzRXKdausQ0RSxlVDE5MP7KLZyp27FMAKfW6SzI8cbO/NLaSEBRVnQB00JEEUOT+ZTVGV
 A6+hiaP9Zd9oQfnMzVl+HlJZ+JOj1PPeMGtII0JTbeEvkLhlWfD+sme2BzM7BWqPKjNw=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jON5O-000rVt-1i
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Apr 2020 15:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=tVTCrH8cQ/F5ivWRNhrAQ0ihqzkrHbjiqbn9CKzaols=; b=J0E8nLItUb9kYXKT1HRLtnKT9N
 upKZsmAfMdj07xoQs/ZUa8CgrmjtoinI+lgOEhXyY9qzISCKAi8VfIb3qXmku8XwARO1506u4IWNE
 wsIG2Pe1ha0q5QJKhkgFd7hH1I8b8DFZdO+iwVDR7q4Vu4nWP3xccnKN0OXvBWcc67AvUYuG6TY2Z
 bm1louea0JXeyRCxkJuAE72xuGmXjhKXDM0Tq42GgR4ksJEvB+xyfaXZgJzk1DSCejwMCDSQr05Tf
 Suhg8VbYjKzIu2N6/2TNPPECURCFMSUDC1QTZcQgCPZPIlwGSj57IbduezGCoZpC+WHElRjwOgOol
 8chooJhg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jON59-0006O8-R9; Tue, 14 Apr 2020 15:02:35 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 14 Apr 2020 08:02:12 -0700
Message-Id: <20200414150233.24495-5-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200414150233.24495-1-willy@infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jON5O-000rVt-1i
Subject: [f2fs-dev] [PATCH v11 04/25] mm: Move readahead nr_pages check into
 read_pages
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
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, Zi Yan <ziy@nvidia.com>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Simplify the callers by moving the check for nr_pages and the BUG_ON
into read_pages().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
---
 mm/readahead.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index 61b15b6b9e72..9fcd4e32b62d 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -119,6 +119,9 @@ static void read_pages(struct address_space *mapping, struct file *filp,
 	struct blk_plug plug;
 	unsigned page_idx;
 
+	if (!nr_pages)
+		return;
+
 	blk_start_plug(&plug);
 
 	if (mapping->a_ops->readpages) {
@@ -138,6 +141,8 @@ static void read_pages(struct address_space *mapping, struct file *filp,
 
 out:
 	blk_finish_plug(&plug);
+
+	BUG_ON(!list_empty(pages));
 }
 
 /*
@@ -180,8 +185,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
 			 * contiguous pages before continuing with the next
 			 * batch.
 			 */
-			if (nr_pages)
-				read_pages(mapping, filp, &page_pool, nr_pages,
+			read_pages(mapping, filp, &page_pool, nr_pages,
 						gfp_mask);
 			nr_pages = 0;
 			continue;
@@ -202,9 +206,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
 	 * uptodate then the caller will launch readpage again, and
 	 * will then handle the error.
 	 */
-	if (nr_pages)
-		read_pages(mapping, filp, &page_pool, nr_pages, gfp_mask);
-	BUG_ON(!list_empty(&page_pool));
+	read_pages(mapping, filp, &page_pool, nr_pages, gfp_mask);
 }
 
 /*
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
