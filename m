Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4243316F172
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Feb 2020 22:49:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6i4U-00058L-5C; Tue, 25 Feb 2020 21:48:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j6i4S-00057p-BO
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Feb 2020 21:48:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N8mal8tXyb7/UVVGOgH2vlx/8gSb72v7qjBMVpUgq/g=; b=g6YsgEgdT/poquZMliqOp7WO/f
 Jv112i/NmojITD0AhE5/uQIyNTGHtK3/WEuwEBr1aCJZbO5r4ftQVrtS7eUoy0FRabCdt2ppwMwdm
 kdMYcDN3MdR6K5bHJYGUDPmTyK+SWhfqKg2Em5+7FwVTTgAUOujG11FoA+ww7SYdmz2g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N8mal8tXyb7/UVVGOgH2vlx/8gSb72v7qjBMVpUgq/g=; b=KzMXlJbg3ABm4X+SyBkMhzvG5l
 5wljcS0AyYD3HpEmKTfdxa5RMku91KJ1Ir7B1GHO0bKqfclZkAwmpc9zW+hlHWbe63g4mUPBxVjIs
 B0afDgm9GrY7TLKN1Ar12YPB4DhhXKOpOwLFRK+wmTX8Xu6NzxadCdTdzUWgK9rt2+JU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6i4R-006Hzy-5Y
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Feb 2020 21:48:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=N8mal8tXyb7/UVVGOgH2vlx/8gSb72v7qjBMVpUgq/g=; b=WIHF9+LXXUhBHO6Ig0ZD8IR2jd
 DKyEgp/ZmocZrQ4xg49+iDc0bEdZqNKqTLHbWta+WISWhKxtDN2yA4DS7vs4jyrXwS4PT/LxFuft4
 9O65OHE6/6Dj7dc/GnRhsi0E6TJ1a6ekL4vCiPB0rwVbuYzfdlaLOpBc+8S0EWjaxNO4EgGILERNI
 m/FOcP+s8XKauQHimJw4re2md8zoZqjRB013jw4QuQ1QAgjQmd6zwO0fIwC2QYKChlPopnzFhgIg0
 dp+tVvJ2zroIrDOTevah6wSF2erZk+xFY1MT23ZPUjkVcvxdutqNV9Jekw8ifSA8Z20+1gEqpaArN
 1vXbHlEA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j6i4H-0007qe-IO; Tue, 25 Feb 2020 21:48:41 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Tue, 25 Feb 2020 13:48:31 -0800
Message-Id: <20200225214838.30017-19-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200225214838.30017-1-willy@infradead.org>
References: <20200225214838.30017-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j6i4R-006Hzy-5Y
Subject: [f2fs-dev] [PATCH v8 18/25] erofs: Convert uncompressed files from
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
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Use the new readahead operation in erofs

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Acked-by: Gao Xiang <gaoxiang25@huawei.com>
---
 fs/erofs/data.c              | 39 +++++++++++++-----------------------
 fs/erofs/zdata.c             |  2 +-
 include/trace/events/erofs.h |  6 +++---
 3 files changed, 18 insertions(+), 29 deletions(-)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index fc3a8d8064f8..d0542151e8c4 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -280,47 +280,36 @@ static int erofs_raw_access_readpage(struct file *file, struct page *page)
 	return 0;
 }
 
-static int erofs_raw_access_readpages(struct file *filp,
-				      struct address_space *mapping,
-				      struct list_head *pages,
-				      unsigned int nr_pages)
+static void erofs_raw_access_readahead(struct readahead_control *rac)
 {
 	erofs_off_t last_block;
 	struct bio *bio = NULL;
-	gfp_t gfp = readahead_gfp_mask(mapping);
-	struct page *page = list_last_entry(pages, struct page, lru);
-
-	trace_erofs_readpages(mapping->host, page, nr_pages, true);
+	struct page *page;
 
-	for (; nr_pages; --nr_pages) {
-		page = list_entry(pages->prev, struct page, lru);
+	trace_erofs_readpages(rac->mapping->host, readahead_index(rac),
+			readahead_count(rac), true);
 
+	while ((page = readahead_page(rac))) {
 		prefetchw(&page->flags);
-		list_del(&page->lru);
 
-		if (!add_to_page_cache_lru(page, mapping, page->index, gfp)) {
-			bio = erofs_read_raw_page(bio, mapping, page,
-						  &last_block, nr_pages, true);
+		bio = erofs_read_raw_page(bio, rac->mapping, page, &last_block,
+				readahead_count(rac), true);
 
-			/* all the page errors are ignored when readahead */
-			if (IS_ERR(bio)) {
-				pr_err("%s, readahead error at page %lu of nid %llu\n",
-				       __func__, page->index,
-				       EROFS_I(mapping->host)->nid);
+		/* all the page errors are ignored when readahead */
+		if (IS_ERR(bio)) {
+			pr_err("%s, readahead error at page %lu of nid %llu\n",
+			       __func__, page->index,
+			       EROFS_I(rac->mapping->host)->nid);
 
-				bio = NULL;
-			}
+			bio = NULL;
 		}
 
-		/* pages could still be locked */
 		put_page(page);
 	}
-	DBG_BUGON(!list_empty(pages));
 
 	/* the rare case (end in gaps) */
 	if (bio)
 		submit_bio(bio);
-	return 0;
 }
 
 static int erofs_get_block(struct inode *inode, sector_t iblock,
@@ -358,7 +347,7 @@ static sector_t erofs_bmap(struct address_space *mapping, sector_t block)
 /* for uncompressed (aligned) files and raw access for other files */
 const struct address_space_operations erofs_raw_access_aops = {
 	.readpage = erofs_raw_access_readpage,
-	.readpages = erofs_raw_access_readpages,
+	.readahead = erofs_raw_access_readahead,
 	.bmap = erofs_bmap,
 };
 
diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index 80e47f07d946..17f45fcb8c5c 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -1315,7 +1315,7 @@ static int z_erofs_readpages(struct file *filp, struct address_space *mapping,
 	struct page *head = NULL;
 	LIST_HEAD(pagepool);
 
-	trace_erofs_readpages(mapping->host, lru_to_page(pages),
+	trace_erofs_readpages(mapping->host, lru_to_page(pages)->index,
 			      nr_pages, false);
 
 	f.headoffset = (erofs_off_t)lru_to_page(pages)->index << PAGE_SHIFT;
diff --git a/include/trace/events/erofs.h b/include/trace/events/erofs.h
index 27f5caa6299a..bf9806fd1306 100644
--- a/include/trace/events/erofs.h
+++ b/include/trace/events/erofs.h
@@ -113,10 +113,10 @@ TRACE_EVENT(erofs_readpage,
 
 TRACE_EVENT(erofs_readpages,
 
-	TP_PROTO(struct inode *inode, struct page *page, unsigned int nrpage,
+	TP_PROTO(struct inode *inode, pgoff_t start, unsigned int nrpage,
 		bool raw),
 
-	TP_ARGS(inode, page, nrpage, raw),
+	TP_ARGS(inode, start, nrpage, raw),
 
 	TP_STRUCT__entry(
 		__field(dev_t,		dev	)
@@ -129,7 +129,7 @@ TRACE_EVENT(erofs_readpages,
 	TP_fast_assign(
 		__entry->dev	= inode->i_sb->s_dev;
 		__entry->nid	= EROFS_I(inode)->nid;
-		__entry->start	= page->index;
+		__entry->start	= start;
 		__entry->nrpage	= nrpage;
 		__entry->raw	= raw;
 	),
-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
