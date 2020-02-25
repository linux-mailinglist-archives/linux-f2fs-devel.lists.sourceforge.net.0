Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3744B16F17A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Feb 2020 22:49:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6i4c-0005rv-0w; Tue, 25 Feb 2020 21:49:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j6i4U-0005q6-Pv
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Feb 2020 21:48:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PUKrIRd3Ve0Id+Di+t5ZQHR+Lkt5XgaaLxXGGrJVDyM=; b=lAdKYaVxiSHLHH0pdcdL8BlS/U
 1lSiVzfpkwc60RmHD2B7HbSov4EBO+ESpw5y3aCSxf5vgGM1ZR5PP7MezfGTeLySTm13aJVICYdoF
 J0JN0Pejm5CZBJw1hmhkiI0hYmacQYroAMoMhxHpTXiXLSYgV+XdDPlIWwfBtd52kqdQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PUKrIRd3Ve0Id+Di+t5ZQHR+Lkt5XgaaLxXGGrJVDyM=; b=X0a/zBE4LQszaoPOAOJBTLLqjH
 vFpUVTssUHbl6Yml//ckblqAzrA2heGDIehhkqBA/Xh4WMqf2SXaUHk9Gb2gzctJ8JfqCOfW8n0pf
 bpaNszC56LztcL0bX7DFPBc3RMWYIF1M8BaajwhNGQ78FqowPpZes1X2oLLM+xxtlwmE=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6i4R-006Hzz-G6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Feb 2020 21:48:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=PUKrIRd3Ve0Id+Di+t5ZQHR+Lkt5XgaaLxXGGrJVDyM=; b=H2P25tKRd6DOh+v9jBKxvQraZA
 Z45sTSCSVYGiH/sXqv7Rei8a1qD26fep5gG02v/sU0YI66JAXsRFAgvH7KDq3AppZuWIGDwadiNNh
 NF9+m1W21fjPH00gVIaHQJV6iQvYyRdGJs8SHeHSJkCyxL9s000WXuTy3nrvrtcZRyq9Lr4rBlC2r
 ukS8kkblNjNhc5+dlP7yhzwP04xd6vf//CYeYWSzTDE04xpgA7rMo/n0zifPqncStzIuBrN8hdJSd
 SKiVrnyfP0gZUFc5QEjNAU1lrQZ/AH89c80EuB/Jttzzo+Cz9TCaD8KrSHY3HZ3YBhcyhRajZM0Tj
 WK7IOFag==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j6i4H-0007qN-Gf; Tue, 25 Feb 2020 21:48:41 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Tue, 25 Feb 2020 13:48:30 -0800
Message-Id: <20200225214838.30017-18-willy@infradead.org>
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
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j6i4R-006Hzz-G6
Subject: [f2fs-dev] [PATCH v8 17/25] btrfs: Convert from readpages to
 readahead
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

Implement the new readahead method in btrfs.  Add a readahead_page_batch()
to optimise fetching a batch of pages at once.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/btrfs/extent_io.c | 46 ++++++++++++++------------------------------
 fs/btrfs/extent_io.h |  3 +--
 fs/btrfs/inode.c     | 16 +++++++--------
 3 files changed, 22 insertions(+), 43 deletions(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index c0f202741e09..e70f14c1de60 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -4278,52 +4278,34 @@ int extent_writepages(struct address_space *mapping,
 	return ret;
 }
 
-int extent_readpages(struct address_space *mapping, struct list_head *pages,
-		     unsigned nr_pages)
+void extent_readahead(struct readahead_control *rac)
 {
 	struct bio *bio = NULL;
 	unsigned long bio_flags = 0;
 	struct page *pagepool[16];
 	struct extent_map *em_cached = NULL;
-	struct extent_io_tree *tree = &BTRFS_I(mapping->host)->io_tree;
-	int nr = 0;
+	struct extent_io_tree *tree = &BTRFS_I(rac->mapping->host)->io_tree;
 	u64 prev_em_start = (u64)-1;
+	int nr;
 
-	while (!list_empty(pages)) {
-		u64 contig_end = 0;
-
-		for (nr = 0; nr < ARRAY_SIZE(pagepool) && !list_empty(pages);) {
-			struct page *page = lru_to_page(pages);
-
-			prefetchw(&page->flags);
-			list_del(&page->lru);
-			if (add_to_page_cache_lru(page, mapping, page->index,
-						readahead_gfp_mask(mapping))) {
-				put_page(page);
-				break;
-			}
-
-			pagepool[nr++] = page;
-			contig_end = page_offset(page) + PAGE_SIZE - 1;
-		}
+	while ((nr = readahead_page_batch(rac, pagepool))) {
+		u64 contig_start = page_offset(pagepool[0]);
+		u64 contig_end = page_offset(pagepool[nr - 1]) + PAGE_SIZE - 1;
 
-		if (nr) {
-			u64 contig_start = page_offset(pagepool[0]);
+		ASSERT(contig_start + nr * PAGE_SIZE - 1 == contig_end);
 
-			ASSERT(contig_start + nr * PAGE_SIZE - 1 == contig_end);
-
-			contiguous_readpages(tree, pagepool, nr, contig_start,
-				     contig_end, &em_cached, &bio, &bio_flags,
-				     &prev_em_start);
-		}
+		contiguous_readpages(tree, pagepool, nr, contig_start,
+				contig_end, &em_cached, &bio, &bio_flags,
+				&prev_em_start);
 	}
 
 	if (em_cached)
 		free_extent_map(em_cached);
 
-	if (bio)
-		return submit_one_bio(bio, 0, bio_flags);
-	return 0;
+	if (bio) {
+		if (submit_one_bio(bio, 0, bio_flags))
+			return;
+	}
 }
 
 /*
diff --git a/fs/btrfs/extent_io.h b/fs/btrfs/extent_io.h
index 5d205bbaafdc..bddac32948c7 100644
--- a/fs/btrfs/extent_io.h
+++ b/fs/btrfs/extent_io.h
@@ -198,8 +198,7 @@ int extent_writepages(struct address_space *mapping,
 		      struct writeback_control *wbc);
 int btree_write_cache_pages(struct address_space *mapping,
 			    struct writeback_control *wbc);
-int extent_readpages(struct address_space *mapping, struct list_head *pages,
-		     unsigned nr_pages);
+void extent_readahead(struct readahead_control *rac);
 int extent_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 		__u64 start, __u64 len);
 void set_page_extent_mapped(struct page *page);
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 7d26b4bfb2c6..61d5137ce4e9 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -4802,8 +4802,8 @@ static void evict_inode_truncate_pages(struct inode *inode)
 
 	/*
 	 * Keep looping until we have no more ranges in the io tree.
-	 * We can have ongoing bios started by readpages (called from readahead)
-	 * that have their endio callback (extent_io.c:end_bio_extent_readpage)
+	 * We can have ongoing bios started by readahead that have
+	 * their endio callback (extent_io.c:end_bio_extent_readpage)
 	 * still in progress (unlocked the pages in the bio but did not yet
 	 * unlocked the ranges in the io tree). Therefore this means some
 	 * ranges can still be locked and eviction started because before
@@ -7004,11 +7004,11 @@ static int lock_extent_direct(struct inode *inode, u64 lockstart, u64 lockend,
 			 * for it to complete) and then invalidate the pages for
 			 * this range (through invalidate_inode_pages2_range()),
 			 * but that can lead us to a deadlock with a concurrent
-			 * call to readpages() (a buffered read or a defrag call
+			 * call to readahead (a buffered read or a defrag call
 			 * triggered a readahead) on a page lock due to an
 			 * ordered dio extent we created before but did not have
 			 * yet a corresponding bio submitted (whence it can not
-			 * complete), which makes readpages() wait for that
+			 * complete), which makes readahead wait for that
 			 * ordered extent to complete while holding a lock on
 			 * that page.
 			 */
@@ -8247,11 +8247,9 @@ static int btrfs_writepages(struct address_space *mapping,
 	return extent_writepages(mapping, wbc);
 }
 
-static int
-btrfs_readpages(struct file *file, struct address_space *mapping,
-		struct list_head *pages, unsigned nr_pages)
+static void btrfs_readahead(struct readahead_control *rac)
 {
-	return extent_readpages(mapping, pages, nr_pages);
+	extent_readahead(rac);
 }
 
 static int __btrfs_releasepage(struct page *page, gfp_t gfp_flags)
@@ -10456,7 +10454,7 @@ static const struct address_space_operations btrfs_aops = {
 	.readpage	= btrfs_readpage,
 	.writepage	= btrfs_writepage,
 	.writepages	= btrfs_writepages,
-	.readpages	= btrfs_readpages,
+	.readahead	= btrfs_readahead,
 	.direct_IO	= btrfs_direct_IO,
 	.invalidatepage = btrfs_invalidatepage,
 	.releasepage	= btrfs_releasepage,
-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
