Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5EE16F171
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Feb 2020 22:49:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6i4U-00058g-Bd; Tue, 25 Feb 2020 21:48:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j6i4S-000581-Q7
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Feb 2020 21:48:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vmBYSWiADbzhrnAmLI0opbogq5zBVEJUJhOq4kDcPa8=; b=j6E34gftCSF1eUKXzuLPO7B89b
 yclg4j1UTDDshrTSywV16/Mn6gXpFr9DbGUoW5TN9lxBORKXkAXePJu68YVWhzCag3kVHsukKutTn
 HAksREB5tZ/JbMZEuVY+mJ1X6nrbu6GMJgiwNr6RBbtVvUI4Uv9Lcv08IeNUVxa7L5Qc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vmBYSWiADbzhrnAmLI0opbogq5zBVEJUJhOq4kDcPa8=; b=bTN341XCt/B6Qj5ORC/y7C4qws
 pm+imMqfzLXSC8e5unuSt9yPalA1jFn0T7TDQDdXrmn6G9sY014kNXmrT9QYneBVB4X0HT52p3JG9
 XMGHonpXzrumLYNqJvr/XJBbIU7WEbDJ6SiCWGqLfD4I/yVers15Elwm6nHrCUTU9Lk8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6i4R-00GS0o-M7
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Feb 2020 21:48:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=vmBYSWiADbzhrnAmLI0opbogq5zBVEJUJhOq4kDcPa8=; b=eLGdqJe3Wpv+/w36Kw9lMzkWe2
 muOjRb9XmOLI+XfU/D0HqCwq0c0A+rgT2XvDOzoLikexaFECuBqdqM3q0X0VVsFZXDGrh46bXFwLr
 zpc4n1pMWEgpllNb9lQqDYVqpf7+5SsDWBWrGB6Mi+jiOZkq3xN5zavbTvq3VwzPlJplhDBLUeq+h
 i5HgW/WJOIrP2NeuzEa+Gh10M9FogPkyWnPpVSxVKYKyhuiYn5hIS8hAl/fwUpKzqXrCMZOknqc/8
 J8PtWOG2c3IMyUpm25L8fUXFo6wyvoJ22FS1R2oFj3WQcTsdnEOWCRK8OWSzK5zjNuSRq3b07ozah
 PPV2wMtA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j6i4H-0007qu-Jc; Tue, 25 Feb 2020 21:48:41 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Tue, 25 Feb 2020 13:48:32 -0800
Message-Id: <20200225214838.30017-20-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200225214838.30017-1-willy@infradead.org>
References: <20200225214838.30017-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j6i4R-00GS0o-M7
Subject: [f2fs-dev] [PATCH v8 19/25] erofs: Convert compressed files from
 readpages to readahead
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
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
 Dave Chinner <dchinner@redhat.com>, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Use the new readahead operation in erofs.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Acked-by: Gao Xiang <gaoxiang25@huawei.com>
Reviewed-by: Dave Chinner <dchinner@redhat.com>
---
 fs/erofs/zdata.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index 17f45fcb8c5c..e64d8ab0900d 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -1303,28 +1303,23 @@ static bool should_decompress_synchronously(struct erofs_sb_info *sbi,
 	return nr <= sbi->max_sync_decompress_pages;
 }
 
-static int z_erofs_readpages(struct file *filp, struct address_space *mapping,
-			     struct list_head *pages, unsigned int nr_pages)
+static void z_erofs_readahead(struct readahead_control *rac)
 {
-	struct inode *const inode = mapping->host;
+	struct inode *const inode = rac->mapping->host;
 	struct erofs_sb_info *const sbi = EROFS_I_SB(inode);
 
-	bool sync = should_decompress_synchronously(sbi, nr_pages);
+	bool sync = should_decompress_synchronously(sbi, readahead_count(rac));
 	struct z_erofs_decompress_frontend f = DECOMPRESS_FRONTEND_INIT(inode);
-	gfp_t gfp = mapping_gfp_constraint(mapping, GFP_KERNEL);
-	struct page *head = NULL;
+	struct page *page, *head = NULL;
 	LIST_HEAD(pagepool);
 
-	trace_erofs_readpages(mapping->host, lru_to_page(pages)->index,
-			      nr_pages, false);
+	trace_erofs_readpages(inode, readahead_index(rac),
+			readahead_count(rac), false);
 
-	f.headoffset = (erofs_off_t)lru_to_page(pages)->index << PAGE_SHIFT;
-
-	for (; nr_pages; --nr_pages) {
-		struct page *page = lru_to_page(pages);
+	f.headoffset = readahead_pos(rac);
 
+	while ((page = readahead_page(rac))) {
 		prefetchw(&page->flags);
-		list_del(&page->lru);
 
 		/*
 		 * A pure asynchronous readahead is indicated if
@@ -1333,11 +1328,6 @@ static int z_erofs_readpages(struct file *filp, struct address_space *mapping,
 		 */
 		sync &= !(PageReadahead(page) && !head);
 
-		if (add_to_page_cache_lru(page, mapping, page->index, gfp)) {
-			list_add(&page->lru, &pagepool);
-			continue;
-		}
-
 		set_page_private(page, (unsigned long)head);
 		head = page;
 	}
@@ -1366,11 +1356,10 @@ static int z_erofs_readpages(struct file *filp, struct address_space *mapping,
 
 	/* clean up the remaining free pages */
 	put_pages_list(&pagepool);
-	return 0;
 }
 
 const struct address_space_operations z_erofs_aops = {
 	.readpage = z_erofs_readpage,
-	.readpages = z_erofs_readpages,
+	.readahead = z_erofs_readahead,
 };
 
-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
