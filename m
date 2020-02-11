Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC68D158746
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Feb 2020 02:04:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j1JyJ-0005uB-LK; Tue, 11 Feb 2020 01:04:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j1JyC-0005sh-G0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Feb 2020 01:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=baDUjVOyCTvDFXzkplCy8sworsJFd3RpUmIL1eLvSj4=; b=HGEgFyV0IVhfsSsW85yYhdqqwT
 g2HEJ2KqH+IpeWplOl1qvARkWeD6Zw5cZE6Zg51SrWTeAQ+SLnCsrQbfR+xdOK+PNosP307D4r9bS
 7HmPbEeamhyLwjDXVoMm6nA4qAZH8VPIvzz3MKGt52x5nJv5zE1u10AArKhULc45Pw+I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=baDUjVOyCTvDFXzkplCy8sworsJFd3RpUmIL1eLvSj4=; b=Jn0W7WPDCpQCHh7QEJ4tsaqPwH
 KmH3eywAoBSfOlM9EPDxvbGOz5J1IoxbOZxrIFmEZvDvxvf4shRCQVNIt5ijaxWj+fw5L8b4YMVtM
 icAGXo4UkMOO3a6Y9Cbntl/8PD+cTuceZoljMhpuO0Kg+cOwdwRUaIdb0aLTJr2cAp68=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j1JyA-0084Pv-VI
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Feb 2020 01:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=baDUjVOyCTvDFXzkplCy8sworsJFd3RpUmIL1eLvSj4=; b=cXPJFAtgE5FhnsznCCJJUIeDAg
 ZnsEKj4WdqobU/sj/rCuxdelkyRIA35K/LvbrL13wwidiAqEUJxEXDmOnZD7XgHEhYkg/iYkPua8F
 jRKYoZqKmrMpyqmw4GX+ZoQUmkqktL0X+I0DgxtaUeiW2+Y0DPz/cLuSWNHpKfMS4MyY3gKmKMMuQ
 DBW4YNe35scV1tcNUjCoruGM6iXzhXlpd+N8YViwdMEIuHtPzxgRi7yBeGedYII9n5/ZiFAjUux3Q
 iNoYMJBV1IfF2WwwMNkg24E5GhRgxlZNvngpcOxy/LT+Hu1Be2Nf4edHVys62te7QkY5vmVctYBpr
 6/3pAC9Q==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j1Jxu-0001nt-Da; Tue, 11 Feb 2020 01:03:50 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 10 Feb 2020 17:03:39 -0800
Message-Id: <20200211010348.6872-5-willy@infradead.org>
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
X-Headers-End: 1j1JyA-0084Pv-VI
Subject: [f2fs-dev] [PATCH v5 04/13] mm: Add readahead address space
 operation
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

This replaces ->readpages with a saner interface:
 - Return void instead of an ignored error code.
 - Pages are already in the page cache when ->readahead is called.
 - Implementation looks up the pages in the page cache instead of
   having them passed in a linked list.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 Documentation/filesystems/locking.rst |  6 ++-
 Documentation/filesystems/vfs.rst     | 13 +++++++
 include/linux/fs.h                    |  2 +
 include/linux/pagemap.h               | 54 +++++++++++++++++++++++++++
 mm/readahead.c                        | 48 ++++++++++++++----------
 5 files changed, 102 insertions(+), 21 deletions(-)

diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
index 5057e4d9dcd1..0ebc4491025a 100644
--- a/Documentation/filesystems/locking.rst
+++ b/Documentation/filesystems/locking.rst
@@ -239,6 +239,7 @@ prototypes::
 	int (*readpage)(struct file *, struct page *);
 	int (*writepages)(struct address_space *, struct writeback_control *);
 	int (*set_page_dirty)(struct page *page);
+	void (*readahead)(struct readahead_control *);
 	int (*readpages)(struct file *filp, struct address_space *mapping,
 			struct list_head *pages, unsigned nr_pages);
 	int (*write_begin)(struct file *, struct address_space *mapping,
@@ -271,7 +272,8 @@ writepage:		yes, unlocks (see below)
 readpage:		yes, unlocks
 writepages:
 set_page_dirty		no
-readpages:
+readahead:		yes, unlocks
+readpages:		no
 write_begin:		locks the page		 exclusive
 write_end:		yes, unlocks		 exclusive
 bmap:
@@ -295,6 +297,8 @@ the request handler (/dev/loop).
 ->readpage() unlocks the page, either synchronously or via I/O
 completion.
 
+->readahead() unlocks the pages like ->readpage().
+
 ->readpages() populates the pagecache with the passed pages and starts
 I/O against them.  They come unlocked upon I/O completion.
 
diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
index 7d4d09dd5e6d..cabee16b7406 100644
--- a/Documentation/filesystems/vfs.rst
+++ b/Documentation/filesystems/vfs.rst
@@ -706,6 +706,7 @@ cache in your filesystem.  The following members are defined:
 		int (*readpage)(struct file *, struct page *);
 		int (*writepages)(struct address_space *, struct writeback_control *);
 		int (*set_page_dirty)(struct page *page);
+		void (*readahead)(struct readahead_control *);
 		int (*readpages)(struct file *filp, struct address_space *mapping,
 				 struct list_head *pages, unsigned nr_pages);
 		int (*write_begin)(struct file *, struct address_space *mapping,
@@ -781,12 +782,24 @@ cache in your filesystem.  The following members are defined:
 	If defined, it should set the PageDirty flag, and the
 	PAGECACHE_TAG_DIRTY tag in the radix tree.
 
+``readahead``
+	Called by the VM to read pages associated with the address_space
+	object.  The pages are consecutive in the page cache and are
+	locked.  The implementation should decrement the page refcount
+	after starting I/O on each page.  Usually the page will be
+	unlocked by the I/O completion handler.  If the function does
+	not attempt I/O on some pages, the caller will decrement the page
+	refcount and unlock the pages for you.	Set PageUptodate if the
+	I/O completes successfully.  Setting PageError on any page will
+	be ignored; simply unlock the page if an I/O error occurs.
+
 ``readpages``
 	called by the VM to read pages associated with the address_space
 	object.  This is essentially just a vector version of readpage.
 	Instead of just one page, several pages are requested.
 	readpages is only used for read-ahead, so read errors are
 	ignored.  If anything goes wrong, feel free to give up.
+        This interface is deprecated; implement readahead instead.
 
 ``write_begin``
 	Called by the generic buffered write code to ask the filesystem
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 3cd4fe6b845e..d4e2d2964346 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -292,6 +292,7 @@ enum positive_aop_returns {
 struct page;
 struct address_space;
 struct writeback_control;
+struct readahead_control;
 
 /*
  * Write life time hint values.
@@ -375,6 +376,7 @@ struct address_space_operations {
 	 */
 	int (*readpages)(struct file *filp, struct address_space *mapping,
 			struct list_head *pages, unsigned nr_pages);
+	void (*readahead)(struct readahead_control *);
 
 	int (*write_begin)(struct file *, struct address_space *mapping,
 				loff_t pos, unsigned len, unsigned flags,
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index ccb14b6a16b5..13efafaf7e1f 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -630,6 +630,60 @@ static inline int add_to_page_cache(struct page *page,
 	return error;
 }
 
+/*
+ * Readahead is of a block of consecutive pages.
+ */
+struct readahead_control {
+	struct file *file;
+	struct address_space *mapping;
+/* private: use the readahead_* accessors instead */
+	pgoff_t start;
+	unsigned int nr_pages;
+	unsigned int batch_count;
+};
+
+static inline struct page *readahead_page(struct readahead_control *rac)
+{
+	struct page *page;
+
+	if (!rac->nr_pages)
+		return NULL;
+
+	page = xa_load(&rac->mapping->i_pages, rac->start);
+	VM_BUG_ON_PAGE(!PageLocked(page), page);
+	rac->batch_count = hpage_nr_pages(page);
+	rac->start += rac->batch_count;
+
+	return page;
+}
+
+#define readahead_for_each(rac, page)					\
+	for (; (page = readahead_page(rac)); rac->nr_pages -= rac->batch_count)
+
+/* The byte offset into the file of this readahead block */
+static inline loff_t readahead_offset(struct readahead_control *rac)
+{
+	return (loff_t)rac->start * PAGE_SIZE;
+}
+
+/* The number of bytes in this readahead block */
+static inline loff_t readahead_length(struct readahead_control *rac)
+{
+	return (loff_t)rac->nr_pages * PAGE_SIZE;
+}
+
+/* The index of the first page in this readahead block */
+static inline unsigned int readahead_index(struct readahead_control *rac)
+{
+	return rac->start;
+}
+
+/* The number of pages in this readahead block */
+static inline unsigned int readahead_count(struct readahead_control *rac)
+{
+	return rac->nr_pages;
+}
+
 static inline unsigned long dir_pages(struct inode *inode)
 {
 	return (unsigned long)(inode->i_size + PAGE_SIZE - 1) >>
diff --git a/mm/readahead.c b/mm/readahead.c
index 96c6ca68a174..933b32e0c90a 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -113,25 +113,30 @@ int read_cache_pages(struct address_space *mapping, struct list_head *pages,
 
 EXPORT_SYMBOL(read_cache_pages);
 
-static void read_pages(struct address_space *mapping, struct file *filp,
-		struct list_head *pages, pgoff_t start,
-		unsigned int nr_pages)
+static void read_pages(struct readahead_control *rac, struct list_head *pages)
 {
+	struct page *page;
 	struct blk_plug plug;
+	const struct address_space_operations *aops = rac->mapping->a_ops;
+
+	if (rac->nr_pages == 0)
+		return;
 
 	blk_start_plug(&plug);
 
-	if (mapping->a_ops->readpages) {
-		mapping->a_ops->readpages(filp, mapping, pages, nr_pages);
+	if (aops->readahead) {
+		aops->readahead(rac);
+		readahead_for_each(rac, page) {
+			unlock_page(page);
+			put_page(page);
+		}
+	} else if (aops->readpages) {
+		aops->readpages(rac->file, rac->mapping, pages, rac->nr_pages);
 		/* Clean up the remaining pages */
 		put_pages_list(pages);
 	} else {
-		struct page *page;
-		unsigned long index;
-
-		xa_for_each_range(&mapping->i_pages, index, page, start,
-				start + nr_pages - 1) {
-			mapping->a_ops->readpage(filp, page);
+		readahead_for_each(rac, page) {
+			aops->readpage(rac->file, page);
 			put_page(page);
 		}
 	}
@@ -156,10 +161,15 @@ unsigned long __do_page_cache_readahead(struct address_space *mapping,
 	LIST_HEAD(page_pool);
 	int page_idx;
 	pgoff_t page_offset = start;
-	unsigned long nr_pages = 0;
 	loff_t isize = i_size_read(inode);
 	gfp_t gfp_mask = readahead_gfp_mask(mapping);
 	bool use_list = mapping->a_ops->readpages;
+	struct readahead_control rac = {
+		.mapping = mapping,
+		.file = filp,
+		.start = start,
+		.nr_pages = 0,
+	};
 
 	if (isize == 0)
 		goto out;
@@ -206,15 +216,14 @@ unsigned long __do_page_cache_readahead(struct address_space *mapping,
 
 		if (page_idx == nr_to_read - lookahead_size)
 			SetPageReadahead(page);
-		nr_pages++;
+		rac.nr_pages++;
 		page_offset++;
 		continue;
 skip:
-		if (nr_pages)
-			read_pages(mapping, filp, &page_pool, start, nr_pages);
-		nr_pages = 0;
+		read_pages(&rac, &page_pool);
+		rac.nr_pages = 0;
 		page_offset++;
-		start = page_offset;
+		rac.start = page_offset;
 	}
 
 	/*
@@ -222,11 +231,10 @@ unsigned long __do_page_cache_readahead(struct address_space *mapping,
 	 * uptodate then the caller will launch readpage again, and
 	 * will then handle the error.
 	 */
-	if (nr_pages)
-		read_pages(mapping, filp, &page_pool, start, nr_pages);
+	read_pages(&rac, &page_pool);
 	BUG_ON(!list_empty(&page_pool));
 out:
-	return nr_pages;
+	return rac.nr_pages;
 }
 
 /*
-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
