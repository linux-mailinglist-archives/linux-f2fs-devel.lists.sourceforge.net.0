Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B57814F83B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Feb 2020 16:13:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ixuSB-00028p-Dw; Sat, 01 Feb 2020 15:12:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1ixuS9-00028G-Bo
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Feb 2020 15:12:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ml5Puu4JmLRdzMhiiCOiBo4ACbPsQdjTb+QSPxS+DKY=; b=CnO9WleuCjBBTwcYPNAWbbtOcL
 pEfAjFz7LTHDQn2JHgdl7pWk5iaw0FYV5aKXA01p/LRdMSV/3IL4lapt9nfgVx8RPC7ZGtDAJcsnp
 XvsFE6S5Xa8Bj51P+M3LoTzU49G+1UrbzeyPyVbKj2pWNOvLz9MO/K5tYymYlUYZzjKU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ml5Puu4JmLRdzMhiiCOiBo4ACbPsQdjTb+QSPxS+DKY=; b=aeF1PWxgGNOdGzrX+cO0AaF6IL
 ep02PnCo5CL+6AZAP7IUOeG9jR7SdLH1X5gG2AlNdNTRYuxRlDt2gFMi0ueQTovJqXIfMeWC79GcV
 4lcwBTrCyExYCkoh5IYDQSAwNrNv7BGmePzuM9OafTu6D9AeqjTMjjEtXbWuL7zJ7OZU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ixuS7-007EgC-5v
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Feb 2020 15:12:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ml5Puu4JmLRdzMhiiCOiBo4ACbPsQdjTb+QSPxS+DKY=; b=bY3NBrXng43eEHaP4qFkNBHkjA
 /0ai0QxQPvj+vzTnehD7kfdwvHZ8vzjptHG3nMCtmSDzhJPLlrrRvHwMG04vHV9fd/CCJRTd7hZ9S
 kCY6iKxXzzldIpqfDcbhn1eEv9lpm3OwGdFjku0KJeD/QhITkP89Q8r/3MLB+25BxQPdL5yjJPCI/
 zaoC9Cl+tOymw4aTP+dhrGrhEN9KAUrBXzsBIHlqEM/UfvzLlZxLPkERj8Ov2t+ljIWtVaj85jqMP
 h352PTKYgXTRiVZYfWwYCWlL9sM65Px7gR4w2uvH7jwuclAa5kmfsGcMYSDK+NcJWFvdA8OCVg7ot
 FV+G0YLQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ixuRu-0006HT-5R; Sat, 01 Feb 2020 15:12:42 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Sat,  1 Feb 2020 07:12:32 -0800
Message-Id: <20200201151240.24082-5-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200201151240.24082-1-willy@infradead.org>
References: <20200201151240.24082-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 2.5 URIBL_DBL_ABUSE_MALW   Contains an abused malware URL listed in the
 Spamhaus DBL blocklist [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ixuS7-007EgC-5v
Subject: [f2fs-dev] [PATCH v4 04/12] mm: Add readahead address space
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

This replaces ->readpages with a saner interface:
 - Return the number of pages not read instead of an ignored error code.
 - Pages are already in the page cache when ->readahead is called.
 - Implementation looks up the pages in the page cache instead of
   having them passed in a linked list.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: linux-btrfs@vger.kernel.org
Cc: linux-erofs@lists.ozlabs.org
Cc: linux-ext4@vger.kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net
Cc: linux-xfs@vger.kernel.org
Cc: cluster-devel@redhat.com
Cc: ocfs2-devel@oss.oracle.com
---
 Documentation/filesystems/locking.rst |  7 ++++++-
 Documentation/filesystems/vfs.rst     | 14 ++++++++++++++
 include/linux/fs.h                    |  2 ++
 include/linux/pagemap.h               | 12 ++++++++++++
 mm/readahead.c                        | 13 ++++++++++++-
 5 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
index 5057e4d9dcd1..3d10729caf44 100644
--- a/Documentation/filesystems/locking.rst
+++ b/Documentation/filesystems/locking.rst
@@ -239,6 +239,8 @@ prototypes::
 	int (*readpage)(struct file *, struct page *);
 	int (*writepages)(struct address_space *, struct writeback_control *);
 	int (*set_page_dirty)(struct page *page);
+	unsigned (*readahead)(struct file *, struct address_space *,
+				 pgoff_t start, unsigned nr_pages);
 	int (*readpages)(struct file *filp, struct address_space *mapping,
 			struct list_head *pages, unsigned nr_pages);
 	int (*write_begin)(struct file *, struct address_space *mapping,
@@ -271,7 +273,8 @@ writepage:		yes, unlocks (see below)
 readpage:		yes, unlocks
 writepages:
 set_page_dirty		no
-readpages:
+readahead:		yes, unlocks
+readpages:		no
 write_begin:		locks the page		 exclusive
 write_end:		yes, unlocks		 exclusive
 bmap:
@@ -295,6 +298,8 @@ the request handler (/dev/loop).
 ->readpage() unlocks the page, either synchronously or via I/O
 completion.
 
+->readahead() unlocks the pages like ->readpage().
+
 ->readpages() populates the pagecache with the passed pages and starts
 I/O against them.  They come unlocked upon I/O completion.
 
diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
index 7d4d09dd5e6d..c2bc345f2169 100644
--- a/Documentation/filesystems/vfs.rst
+++ b/Documentation/filesystems/vfs.rst
@@ -706,6 +706,8 @@ cache in your filesystem.  The following members are defined:
 		int (*readpage)(struct file *, struct page *);
 		int (*writepages)(struct address_space *, struct writeback_control *);
 		int (*set_page_dirty)(struct page *page);
+		unsigned (*readahead)(struct file *filp, struct address_space *mapping,
+				 pgoff_t start, unsigned nr_pages);
 		int (*readpages)(struct file *filp, struct address_space *mapping,
 				 struct list_head *pages, unsigned nr_pages);
 		int (*write_begin)(struct file *, struct address_space *mapping,
@@ -781,6 +783,18 @@ cache in your filesystem.  The following members are defined:
 	If defined, it should set the PageDirty flag, and the
 	PAGECACHE_TAG_DIRTY tag in the radix tree.
 
+``readahead``
+	Called by the VM to read pages associated with the address_space
+	object.  The pages are consecutive in the page cache and
+	are locked.  The implementation should decrement the page
+	refcount after attempting I/O on each page.  Usually the
+	page will be unlocked by the I/O completion handler.  If the
+	function does not attempt I/O on some pages, return the number
+	of pages which were not read so the caller can unlock the pages
+	for you.  Set PageUptodate if the I/O completes successfully.
+	Setting PageError on any page will be ignored; simply unlock
+	the page if an I/O error occurs.
+
 ``readpages``
 	called by the VM to read pages associated with the address_space
 	object.  This is essentially just a vector version of readpage.
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 41584f50af0d..3bfc142e7d10 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -375,6 +375,8 @@ struct address_space_operations {
 	 */
 	int (*readpages)(struct file *filp, struct address_space *mapping,
 			struct list_head *pages, unsigned nr_pages);
+	unsigned (*readahead)(struct file *, struct address_space *,
+			pgoff_t start, unsigned nr_pages);
 
 	int (*write_begin)(struct file *, struct address_space *mapping,
 				loff_t pos, unsigned len, unsigned flags,
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index ccb14b6a16b5..a2cf007826f2 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -630,6 +630,18 @@ static inline int add_to_page_cache(struct page *page,
 	return error;
 }
 
+/*
+ * Only call this from a ->readahead implementation.
+ */
+static inline
+struct page *readahead_page(struct address_space *mapping, pgoff_t index)
+{
+	struct page *page = xa_load(&mapping->i_pages, index);
+	VM_BUG_ON_PAGE(!PageLocked(page), page);
+
+	return page;
+}
+
 static inline unsigned long dir_pages(struct inode *inode)
 {
 	return (unsigned long)(inode->i_size + PAGE_SIZE - 1) >>
diff --git a/mm/readahead.c b/mm/readahead.c
index 7daef0038b14..b2ed0baf3a5d 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -121,7 +121,18 @@ static void read_pages(struct address_space *mapping, struct file *filp,
 
 	blk_start_plug(&plug);
 
-	if (mapping->a_ops->readpages) {
+	if (mapping->a_ops->readahead) {
+		unsigned left = mapping->a_ops->readahead(filp, mapping,
+				start, nr_pages);
+
+		while (left) {
+			struct page *page = readahead_page(mapping,
+					start + nr_pages - left);
+			unlock_page(page);
+			put_page(page);
+			left--;
+		}
+	} else if (mapping->a_ops->readpages) {
 		mapping->a_ops->readpages(filp, mapping, pages, nr_pages);
 		/* Clean up the remaining pages */
 		put_pages_list(pages);
-- 
2.24.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
