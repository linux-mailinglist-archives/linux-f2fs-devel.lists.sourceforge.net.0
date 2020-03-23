Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E3D18FEC1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2020 21:23:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGTbV-0000r8-Mk; Mon, 23 Mar 2020 20:23:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jGTbO-0000p8-0Z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 20:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JFRF4LsFsvvc8HAYc+8jlXVGxAuiY2/t/XzP76877Pg=; b=eMvqrQ33Pwl1Smn6ELgWzEwHZi
 RLZ6T/diuNxSfNlt3IT42LDyvONAITPixQSYDbBXqhobJUKvj/kHPb/E5lvLMk/lebKqQL9T4uu/S
 QG75lohI7vEiop3U/E++nA94z+1flVqsmB9BLmypVPBbEpQTamC1MVzPEaJGYBru/VzA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JFRF4LsFsvvc8HAYc+8jlXVGxAuiY2/t/XzP76877Pg=; b=OvpAugqNOhrhBptNTpDDrhH1Wa
 GiHrz45vvIlg7dgh5VU+0blW138SW4t8RHR3yuuRRku+taADfeJWO4Rq0vDb4U1k/heLPvdozvAst
 icdbWnm4vOaROOMZBa9cj26xP8YvwDM9VYp4HomKt7Y9QBIkwqJO5w+94rU9+jUyAxdc=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGTbM-004zlo-7U
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 20:23:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=JFRF4LsFsvvc8HAYc+8jlXVGxAuiY2/t/XzP76877Pg=; b=Bl0IT1hasawOgERx/BDTEE9lBO
 LKthTOKWHeI0VlEFHI9yHNOdKb+OFuea8WTlZrivlQC893dhUg2goDmA2oeKzTxQp7N2LHWcElDzD
 BE5fzIjocSKiCgavNNGGBDYXB+485hLPgqukzvhc4m7PyAKwwwabcq9LX0KyMSkFE/ys47hK5C8z9
 CHYIYq7iv+fN94tDgDHWn5Al1WIN+iZ9LyuEsicXyAq72dpqdxmhqKcHU9r3XAW/39/920sHttbro
 bjqWSj+R35xX53mGrBEirz1aaAlxLhacT7g8NKAUAtBtndYyjqWjLqTx19lDo72wyOp//wXoNHVS2
 iZ533bVg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jGTbB-0003Ul-HO; Mon, 23 Mar 2020 20:23:01 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 23 Mar 2020 13:22:39 -0700
Message-Id: <20200323202259.13363-6-willy@infradead.org>
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
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jGTbM-004zlo-7U
Subject: [f2fs-dev] [PATCH v10 05/25] mm: Add new readahead_control API
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
 linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Filesystems which implement the upcoming ->readahead method will get
their pages by calling readahead_page() or readahead_page_batch().
These functions support large pages, even though none of the filesystems
to be converted do yet.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
---
 include/linux/pagemap.h | 140 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 7d43a464b2a4..89fd6a62bfa5 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -636,6 +636,146 @@ static inline int add_to_page_cache(struct page *page,
 	return error;
 }
 
+/**
+ * struct readahead_control - Describes a readahead request.
+ *
+ * A readahead request is for consecutive pages.  Filesystems which
+ * implement the ->readahead method should call readahead_page() or
+ * readahead_page_batch() in a loop and attempt to start I/O against
+ * each page in the request.
+ *
+ * Most of the fields in this struct are private and should be accessed
+ * by the functions below.
+ *
+ * @file: The file, used primarily by network filesystems for authentication.
+ *	  May be NULL if invoked internally by the filesystem.
+ * @mapping: Readahead this filesystem object.
+ */
+struct readahead_control {
+	struct file *file;
+	struct address_space *mapping;
+/* private: use the readahead_* accessors instead */
+	pgoff_t _index;
+	unsigned int _nr_pages;
+	unsigned int _batch_count;
+};
+
+/**
+ * readahead_page - Get the next page to read.
+ * @rac: The current readahead request.
+ *
+ * Context: The page is locked and has an elevated refcount.  The caller
+ * should decreases the refcount once the page has been submitted for I/O
+ * and unlock the page once all I/O to that page has completed.
+ * Return: A pointer to the next page, or %NULL if we are done.
+ */
+static inline struct page *readahead_page(struct readahead_control *rac)
+{
+	struct page *page;
+
+	BUG_ON(rac->_batch_count > rac->_nr_pages);
+	rac->_nr_pages -= rac->_batch_count;
+	rac->_index += rac->_batch_count;
+
+	if (!rac->_nr_pages) {
+		rac->_batch_count = 0;
+		return NULL;
+	}
+
+	page = xa_load(&rac->mapping->i_pages, rac->_index);
+	VM_BUG_ON_PAGE(!PageLocked(page), page);
+	rac->_batch_count = hpage_nr_pages(page);
+
+	return page;
+}
+
+static inline unsigned int __readahead_batch(struct readahead_control *rac,
+		struct page **array, unsigned int array_sz)
+{
+	unsigned int i = 0;
+	XA_STATE(xas, &rac->mapping->i_pages, 0);
+	struct page *page;
+
+	BUG_ON(rac->_batch_count > rac->_nr_pages);
+	rac->_nr_pages -= rac->_batch_count;
+	rac->_index += rac->_batch_count;
+	rac->_batch_count = 0;
+
+	xas_set(&xas, rac->_index);
+	rcu_read_lock();
+	xas_for_each(&xas, page, rac->_index + rac->_nr_pages - 1) {
+		VM_BUG_ON_PAGE(!PageLocked(page), page);
+		VM_BUG_ON_PAGE(PageTail(page), page);
+		array[i++] = page;
+		rac->_batch_count += hpage_nr_pages(page);
+
+		/*
+		 * The page cache isn't using multi-index entries yet,
+		 * so the xas cursor needs to be manually moved to the
+		 * next index.  This can be removed once the page cache
+		 * is converted.
+		 */
+		if (PageHead(page))
+			xas_set(&xas, rac->_index + rac->_batch_count);
+
+		if (i == array_sz)
+			break;
+	}
+	rcu_read_unlock();
+
+	return i;
+}
+
+/**
+ * readahead_page_batch - Get a batch of pages to read.
+ * @rac: The current readahead request.
+ * @array: An array of pointers to struct page.
+ *
+ * Context: The pages are locked and have an elevated refcount.  The caller
+ * should decreases the refcount once the page has been submitted for I/O
+ * and unlock the page once all I/O to that page has completed.
+ * Return: The number of pages placed in the array.  0 indicates the request
+ * is complete.
+ */
+#define readahead_page_batch(rac, array)				\
+	__readahead_batch(rac, array, ARRAY_SIZE(array))
+
+/**
+ * readahead_pos - The byte offset into the file of this readahead request.
+ * @rac: The readahead request.
+ */
+static inline loff_t readahead_pos(struct readahead_control *rac)
+{
+	return (loff_t)rac->_index * PAGE_SIZE;
+}
+
+/**
+ * readahead_length - The number of bytes in this readahead request.
+ * @rac: The readahead request.
+ */
+static inline loff_t readahead_length(struct readahead_control *rac)
+{
+	return (loff_t)rac->_nr_pages * PAGE_SIZE;
+}
+
+/**
+ * readahead_index - The index of the first page in this readahead request.
+ * @rac: The readahead request.
+ */
+static inline pgoff_t readahead_index(struct readahead_control *rac)
+{
+	return rac->_index;
+}
+
+/**
+ * readahead_count - The number of pages in this readahead request.
+ * @rac: The readahead request.
+ */
+static inline unsigned int readahead_count(struct readahead_control *rac)
+{
+	return rac->_nr_pages;
+}
+
 static inline unsigned long dir_pages(struct inode *inode)
 {
 	return (unsigned long)(inode->i_size + PAGE_SIZE - 1) >>
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
