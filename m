Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B2A1A80C7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Apr 2020 17:03:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jON5a-0001ZI-IU; Tue, 14 Apr 2020 15:03:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jON5T-0001WA-Oz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Apr 2020 15:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JIWYplRscu505eUf6DjdTxinCKmvVQR8lfp+2Y6n8B0=; b=nKwn75vCmDJUThKE3pjOgE90Kw
 FJ4GrB/1R4NwkpAHoZNa5Q5iteGXFZg12zFluS9tN6ty1OYs3felx5RAOJXfWb9oI4DXCvM9NEacM
 tL5dP37mYpe5/7e3adO3iFb1Nbj5OxgIqea/kv8lu5WqkPCw402TjqZK6qwjWnzA6oXI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JIWYplRscu505eUf6DjdTxinCKmvVQR8lfp+2Y6n8B0=; b=GZ/KAlSUdU7Nfrdu+j6GSJTR2Q
 S0dd9RQn/C+b9HhA+DwdKiDsq2sjtdlcT0Iicd1AMRB8405vWozafkyuDjVgKRnHBylLFY96HJcYj
 FcQc+KfCMC3tQG2kjC0OoR3CA1Vtz+g1H/SzDBdKh+dLRydDg3ox5UDkLOHbzlh/eNsI=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jON5Q-00EmGe-5b
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Apr 2020 15:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=JIWYplRscu505eUf6DjdTxinCKmvVQR8lfp+2Y6n8B0=; b=LzhSacnHbc6KghuGVfNkcOCJHp
 5ZLNZLDSftcTn0v83NLZLVmZhen2i84VqUWP9JZ/3yOibp4JO2uYfDYUYIZU6BV1WBKmfpEqoLAs2
 HAhqmnVqrI41UPqUhKCVWPlx+iWH9Szo+AqXBvOqff7IscKM86SP+AymrzN+6zrt9b9hcVQX7TvUy
 49PgOLLfxNvIRheNkB/LcZtWVqO9VEzT6GBzHOL0Oai+jR1TJAUg0ay7huj5on5nt26FsCNWgKdGn
 XWTpBarRpq2zzZjMWm3mCd1788gic8f7z9e7Q3pjE5upMv4vhJ9PGwLWx0/mvzq5/u5yOAOP8+sao
 3RQpH5LA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jON5A-0006Pf-JL; Tue, 14 Apr 2020 15:02:36 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 14 Apr 2020 08:02:32 -0700
Message-Id: <20200414150233.24495-25-willy@infradead.org>
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
X-Headers-End: 1jON5Q-00EmGe-5b
Subject: [f2fs-dev] [PATCH v11 24/25] fuse: Convert from readpages to
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
 linux-kernel@vger.kernel.org,
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

Implement the new readahead operation in fuse by using __readahead_batch()
to fill the array of pages in fuse_args_pages directly.  This lets us
inline fuse_readpages_fill() into fuse_readahead().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Dave Chinner <dchinner@redhat.com>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
---
 fs/fuse/file.c | 99 ++++++++++++++------------------------------------
 1 file changed, 27 insertions(+), 72 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 9d67b830fb7a..db82fb29dd39 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -915,84 +915,39 @@ static void fuse_send_readpages(struct fuse_io_args *ia, struct file *file)
 	fuse_readpages_end(fc, &ap->args, err);
 }
 
-struct fuse_fill_data {
-	struct fuse_io_args *ia;
-	struct file *file;
-	struct inode *inode;
-	unsigned int nr_pages;
-	unsigned int max_pages;
-};
-
-static int fuse_readpages_fill(void *_data, struct page *page)
+static void fuse_readahead(struct readahead_control *rac)
 {
-	struct fuse_fill_data *data = _data;
-	struct fuse_io_args *ia = data->ia;
-	struct fuse_args_pages *ap = &ia->ap;
-	struct inode *inode = data->inode;
+	struct inode *inode = rac->mapping->host;
 	struct fuse_conn *fc = get_fuse_conn(inode);
+	unsigned int i, max_pages, nr_pages = 0;
 
-	fuse_wait_on_page_writeback(inode, page->index);
-
-	if (ap->num_pages &&
-	    (ap->num_pages == fc->max_pages ||
-	     (ap->num_pages + 1) * PAGE_SIZE > fc->max_read ||
-	     ap->pages[ap->num_pages - 1]->index + 1 != page->index)) {
-		data->max_pages = min_t(unsigned int, data->nr_pages,
-					fc->max_pages);
-		fuse_send_readpages(ia, data->file);
-		data->ia = ia = fuse_io_alloc(NULL, data->max_pages);
-		if (!ia) {
-			unlock_page(page);
-			return -ENOMEM;
-		}
-		ap = &ia->ap;
-	}
-
-	if (WARN_ON(ap->num_pages >= data->max_pages)) {
-		unlock_page(page);
-		fuse_io_free(ia);
-		return -EIO;
-	}
-
-	get_page(page);
-	ap->pages[ap->num_pages] = page;
-	ap->descs[ap->num_pages].length = PAGE_SIZE;
-	ap->num_pages++;
-	data->nr_pages--;
-	return 0;
-}
-
-static int fuse_readpages(struct file *file, struct address_space *mapping,
-			  struct list_head *pages, unsigned nr_pages)
-{
-	struct inode *inode = mapping->host;
-	struct fuse_conn *fc = get_fuse_conn(inode);
-	struct fuse_fill_data data;
-	int err;
-
-	err = -EIO;
 	if (is_bad_inode(inode))
-		goto out;
+		return;
 
-	data.file = file;
-	data.inode = inode;
-	data.nr_pages = nr_pages;
-	data.max_pages = min_t(unsigned int, nr_pages, fc->max_pages);
-;
-	data.ia = fuse_io_alloc(NULL, data.max_pages);
-	err = -ENOMEM;
-	if (!data.ia)
-		goto out;
+	max_pages = min(fc->max_pages, fc->max_read / PAGE_SIZE);
 
-	err = read_cache_pages(mapping, pages, fuse_readpages_fill, &data);
-	if (!err) {
-		if (data.ia->ap.num_pages)
-			fuse_send_readpages(data.ia, file);
-		else
-			fuse_io_free(data.ia);
+	for (;;) {
+		struct fuse_io_args *ia;
+		struct fuse_args_pages *ap;
+
+		nr_pages = readahead_count(rac) - nr_pages;
+		if (nr_pages > max_pages)
+			nr_pages = max_pages;
+		if (nr_pages == 0)
+			break;
+		ia = fuse_io_alloc(NULL, nr_pages);
+		if (!ia)
+			return;
+		ap = &ia->ap;
+		nr_pages = __readahead_batch(rac, ap->pages, nr_pages);
+		for (i = 0; i < nr_pages; i++) {
+			fuse_wait_on_page_writeback(inode,
+						    readahead_index(rac) + i);
+			ap->descs[i].length = PAGE_SIZE;
+		}
+		ap->num_pages = nr_pages;
+		fuse_send_readpages(ia, rac->file);
 	}
-out:
-	return err;
 }
 
 static ssize_t fuse_cache_read_iter(struct kiocb *iocb, struct iov_iter *to)
@@ -3373,10 +3328,10 @@ static const struct file_operations fuse_file_operations = {
 
 static const struct address_space_operations fuse_file_aops  = {
 	.readpage	= fuse_readpage,
+	.readahead	= fuse_readahead,
 	.writepage	= fuse_writepage,
 	.writepages	= fuse_writepages,
 	.launder_page	= fuse_launder_page,
-	.readpages	= fuse_readpages,
 	.set_page_dirty	= __set_page_dirty_nobuffers,
 	.bmap		= fuse_bmap,
 	.direct_IO	= fuse_direct_IO,
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
