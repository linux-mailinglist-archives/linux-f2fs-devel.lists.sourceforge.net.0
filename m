Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 999261A80C6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Apr 2020 17:03:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jON5a-0001Yx-DV; Tue, 14 Apr 2020 15:03:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jON5S-0001Vu-SY
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Apr 2020 15:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vVZzy/wo5GT119Pk8wsTZ72fWKLWcOEqAlTxnpE9eWc=; b=VIidpyW6s5uY2yohO+5jLu9w5w
 uII2r/jzl2q700tnSegu6YcFQNeTjJ4axzsF4mpU8WqqcyTs/n587GXrwMBDqOHcrjZwHsEeVY72A
 hUw+DJV47+MFk3azCWbbGyeNZPMdxhxa/3S2G4DTg2+0BEEQPRTTc+W6bHTtDjakAeEM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vVZzy/wo5GT119Pk8wsTZ72fWKLWcOEqAlTxnpE9eWc=; b=az9BHAeyyvo2kfs1JavJXryNyn
 P7u+ZcfRjI4mkXBq4OBfdTgB/tF/6CPPA6CUYbhnCXj70YR3/rCM3fLp/1XjZ7hrry0APPmdQrj9U
 mlyFCvhXCPC4aWnvXs543klio9fsQ1iVXlH17XOz5WMp6Wtqe9heKjtjTyUZIWIfz0TQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jON5Q-00EmGZ-6D
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Apr 2020 15:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=vVZzy/wo5GT119Pk8wsTZ72fWKLWcOEqAlTxnpE9eWc=; b=O1GTXnG4tewdn3Zh9gA6VrsxNz
 HwDx/AO8L9v+LjoGZSHL79ov8Vt634A42qvZorLmlG9OpkgqBT8F7Wp7Cmx/gTg5wydmJurkXkGBs
 XeMGxj9a30kwN7b4/vtULNq5MxDpL0h/edUGZBahgcd4nhNVozYXNEDC1nxwRMc7NLX46Nw4lU2Sn
 M+VqsGWYeq03qtrZRYNL8gLsYV69OtXKlhBWbx+XbPB7KS/aSSrOvGp9RZ8YdI2WNvHmcujOx8AWd
 9zPSP/lnxPn8FT9IuKnj9k5UxbYgYnmnP0zvizdGWAJj75I9icH6U3vWA/E6ZPug3P7CpCRz3Spph
 KbjOkFMA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jON5A-0006PO-EO; Tue, 14 Apr 2020 15:02:36 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 14 Apr 2020 08:02:28 -0700
Message-Id: <20200414150233.24495-21-willy@infradead.org>
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
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jON5Q-00EmGZ-6D
Subject: [f2fs-dev] [PATCH v11 20/25] ext4: Convert from readpages to
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
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
 Eric Biggers <ebiggers@google.com>, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Use the new readahead operation in ext4

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
Reviewed-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/ext4.h     |  3 +--
 fs/ext4/inode.c    | 21 +++++++++------------
 fs/ext4/readpage.c | 22 ++++++++--------------
 3 files changed, 18 insertions(+), 28 deletions(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 91eb4381cae5..9f2d3cd1df81 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -3317,8 +3317,7 @@ static inline void ext4_set_de_type(struct super_block *sb,
 
 /* readpages.c */
 extern int ext4_mpage_readpages(struct address_space *mapping,
-				struct list_head *pages, struct page *page,
-				unsigned nr_pages, bool is_readahead);
+		struct readahead_control *rac, struct page *page);
 extern int __init ext4_init_post_read_processing(void);
 extern void ext4_exit_post_read_processing(void);
 
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index e416096fc081..fafd2862d7cd 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3224,23 +3224,20 @@ static int ext4_readpage(struct file *file, struct page *page)
 		ret = ext4_readpage_inline(inode, page);
 
 	if (ret == -EAGAIN)
-		return ext4_mpage_readpages(page->mapping, NULL, page, 1,
-						false);
+		return ext4_mpage_readpages(page->mapping, NULL, page);
 
 	return ret;
 }
 
-static int
-ext4_readpages(struct file *file, struct address_space *mapping,
-		struct list_head *pages, unsigned nr_pages)
+static void ext4_readahead(struct readahead_control *rac)
 {
-	struct inode *inode = mapping->host;
+	struct inode *inode = rac->mapping->host;
 
-	/* If the file has inline data, no need to do readpages. */
+	/* If the file has inline data, no need to do readahead. */
 	if (ext4_has_inline_data(inode))
-		return 0;
+		return;
 
-	return ext4_mpage_readpages(mapping, pages, NULL, nr_pages, true);
+	ext4_mpage_readpages(rac->mapping, rac, NULL);
 }
 
 static void ext4_invalidatepage(struct page *page, unsigned int offset,
@@ -3605,7 +3602,7 @@ static int ext4_set_page_dirty(struct page *page)
 
 static const struct address_space_operations ext4_aops = {
 	.readpage		= ext4_readpage,
-	.readpages		= ext4_readpages,
+	.readahead		= ext4_readahead,
 	.writepage		= ext4_writepage,
 	.writepages		= ext4_writepages,
 	.write_begin		= ext4_write_begin,
@@ -3622,7 +3619,7 @@ static const struct address_space_operations ext4_aops = {
 
 static const struct address_space_operations ext4_journalled_aops = {
 	.readpage		= ext4_readpage,
-	.readpages		= ext4_readpages,
+	.readahead		= ext4_readahead,
 	.writepage		= ext4_writepage,
 	.writepages		= ext4_writepages,
 	.write_begin		= ext4_write_begin,
@@ -3638,7 +3635,7 @@ static const struct address_space_operations ext4_journalled_aops = {
 
 static const struct address_space_operations ext4_da_aops = {
 	.readpage		= ext4_readpage,
-	.readpages		= ext4_readpages,
+	.readahead		= ext4_readahead,
 	.writepage		= ext4_writepage,
 	.writepages		= ext4_writepages,
 	.write_begin		= ext4_da_write_begin,
diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index c1769afbf799..66275f25235d 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -7,8 +7,8 @@
  *
  * This was originally taken from fs/mpage.c
  *
- * The intent is the ext4_mpage_readpages() function here is intended
- * to replace mpage_readpages() in the general case, not just for
+ * The ext4_mpage_readpages() function here is intended to
+ * replace mpage_readahead() in the general case, not just for
  * encrypted files.  It has some limitations (see below), where it
  * will fall back to read_block_full_page(), but these limitations
  * should only be hit when page_size != block_size.
@@ -222,8 +222,7 @@ static inline loff_t ext4_readpage_limit(struct inode *inode)
 }
 
 int ext4_mpage_readpages(struct address_space *mapping,
-			 struct list_head *pages, struct page *page,
-			 unsigned nr_pages, bool is_readahead)
+		struct readahead_control *rac, struct page *page)
 {
 	struct bio *bio = NULL;
 	sector_t last_block_in_bio = 0;
@@ -241,6 +240,7 @@ int ext4_mpage_readpages(struct address_space *mapping,
 	int length;
 	unsigned relative_block = 0;
 	struct ext4_map_blocks map;
+	unsigned int nr_pages = rac ? readahead_count(rac) : 1;
 
 	map.m_pblk = 0;
 	map.m_lblk = 0;
@@ -251,14 +251,9 @@ int ext4_mpage_readpages(struct address_space *mapping,
 		int fully_mapped = 1;
 		unsigned first_hole = blocks_per_page;
 
-		if (pages) {
-			page = lru_to_page(pages);
-
+		if (rac) {
+			page = readahead_page(rac);
 			prefetchw(&page->flags);
-			list_del(&page->lru);
-			if (add_to_page_cache_lru(page, mapping, page->index,
-				  readahead_gfp_mask(mapping)))
-				goto next_page;
 		}
 
 		if (page_has_buffers(page))
@@ -381,7 +376,7 @@ int ext4_mpage_readpages(struct address_space *mapping,
 			bio->bi_iter.bi_sector = blocks[0] << (blkbits - 9);
 			bio->bi_end_io = mpage_end_io;
 			bio_set_op_attrs(bio, REQ_OP_READ,
-						is_readahead ? REQ_RAHEAD : 0);
+						rac ? REQ_RAHEAD : 0);
 		}
 
 		length = first_hole << blkbits;
@@ -406,10 +401,9 @@ int ext4_mpage_readpages(struct address_space *mapping,
 		else
 			unlock_page(page);
 	next_page:
-		if (pages)
+		if (rac)
 			put_page(page);
 	}
-	BUG_ON(pages && !list_empty(pages));
 	if (bio)
 		submit_bio(bio);
 	return 0;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
