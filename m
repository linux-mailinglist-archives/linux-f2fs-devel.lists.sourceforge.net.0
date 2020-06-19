Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E086120056B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jun 2020 11:40:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jmDVI-0002SK-My; Fri, 19 Jun 2020 09:40:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <agruenba@redhat.com>) id 1jmDVF-0002Rg-AU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jun 2020 09:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lrk5imypRvlh6Xm/35IKdaRrF7e1DPYFegz850ZqocU=; b=AVR8CE7tAgogBiGTfaRY0PQLVU
 zGVVwnnX1zz04uijrCFoonlzwuhgb6mFWU2BYPZgRhn32UrNj9kHpYcV62Ll9PyTfQ15T3disXVnr
 +gjcwEeM0UVjxeCquIwj/KJx0XGq3iROZ/J5FBsjZkzIm6uWXZra6Ofg87xeVyiW1+Dw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lrk5imypRvlh6Xm/35IKdaRrF7e1DPYFegz850ZqocU=; b=FRKyZTVJrqEXRXlqU0DL0y+a3O
 1RvJuedE4DzBMRIxZqRCX1n9Wbyy9Q/ivu1Du/CidOn+/abFOYJsJWi5doGX+jbB0Dh18Sj/CJ6Sl
 lCTdP5WR8T/HoNNoZxtCLpb6iOKaEfmMsSx0KnNvKOMA3cfxhQHpdbxLIfc8cPVJq8jU=;
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1jmDVE-008poK-40
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jun 2020 09:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592559591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lrk5imypRvlh6Xm/35IKdaRrF7e1DPYFegz850ZqocU=;
 b=ACXl/EXimV880uagOGDfgfnV+bR/R0bgZSnf68W+1s1Gp95XNUh7TJASGiVqzLgvesVc1B
 Gfoss/TCaaeOSdMBb8lAiIlrW3XByw+GUDHvGlPDSXukAwTnmCQaxEvbuccMr+hide+j1i
 xaqnRDC9T3x3u+eib+7kBMbHx9FjA5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-jYi5da2QMoKUefxLZ_07RQ-1; Fri, 19 Jun 2020 05:39:43 -0400
X-MC-Unique: jYi5da2QMoKUefxLZ_07RQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7066107B274;
 Fri, 19 Jun 2020 09:39:40 +0000 (UTC)
Received: from max.home.com (unknown [10.40.195.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 494C05D9CA;
 Fri, 19 Jun 2020 09:39:35 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Matthew Wilcox <willy@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 19 Jun 2020 11:39:16 +0200
Message-Id: <20200619093916.1081129-3-agruenba@redhat.com>
In-Reply-To: <20200619093916.1081129-1-agruenba@redhat.com>
References: <20200619093916.1081129-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.139.110.120 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [205.139.110.120 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jmDVE-008poK-40
Subject: [f2fs-dev] [PATCH 2/2] gfs2: Rework read and page fault locking
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
Cc: cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
 Andreas Gruenbacher <agruenba@redhat.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, John Hubbard <jhubbard@nvidia.com>,
 linux-kernel@vger.kernel.org, Junxiao Bi <junxiao.bi@oracle.com>,
 linux-xfs <linux-xfs@vger.kernel.org>,
 William Kucharski <william.kucharski@oracle.com>,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-erofs@lists.ozlabs.org,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The cache consistency model of filesystems like gfs2 is such that if
data is found in the page cache, the data is up to date and can be used
without taking any filesystem locks.  If a page is not cached,
filesystem locks must be taken before populating the page cache.

Thus far,  gfs2 has taken the filesystem locks inside the ->readpage and
->readpages address space operations.  This was already causing lock
ordering problems, but commit d4388340ae0b ("fs: convert mpage_readpages
to mpage_readahead") made things worse: the ->readahead operation is
called with the pages to readahead locked, so grabbing the inode's glock
can now deadlock with processes which are holding the inode glock while
trying to lock the same pages.

Fix this by taking the inode glock in the ->read_iter file and ->fault
vm operations.  To avoid taking the inode glock when the data is already
cached, the ->read_iter file operation first tries to read the data with
the IOCB_CACHED flag set.  If that fails, the inode glock is locked and
the operation is repeated without the IOCB_CACHED flag.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/aops.c | 27 ++--------------------
 fs/gfs2/file.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 61 insertions(+), 27 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 72c9560f4467..73c2fe768a3f 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -513,26 +513,10 @@ static int __gfs2_readpage(void *file, struct page *page)
 
 static int gfs2_readpage(struct file *file, struct page *page)
 {
-	struct address_space *mapping = page->mapping;
-	struct gfs2_inode *ip = GFS2_I(mapping->host);
-	struct gfs2_holder gh;
 	int error;
 
-	unlock_page(page);
-	gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
-	error = gfs2_glock_nq(&gh);
-	if (unlikely(error))
-		goto out;
-	error = AOP_TRUNCATED_PAGE;
-	lock_page(page);
-	if (page->mapping == mapping && !PageUptodate(page))
-		error = __gfs2_readpage(file, page);
-	else
-		unlock_page(page);
-	gfs2_glock_dq(&gh);
-out:
-	gfs2_holder_uninit(&gh);
-	if (error && error != AOP_TRUNCATED_PAGE)
+	error = __gfs2_readpage(file, page);
+	if (error)
 		lock_page(page);
 	return error;
 }
@@ -598,16 +582,9 @@ static void gfs2_readahead(struct readahead_control *rac)
 {
 	struct inode *inode = rac->mapping->host;
 	struct gfs2_inode *ip = GFS2_I(inode);
-	struct gfs2_holder gh;
 
-	gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
-	if (gfs2_glock_nq(&gh))
-		goto out_uninit;
 	if (!gfs2_is_stuffed(ip))
 		mpage_readahead(rac, gfs2_block_map);
-	gfs2_glock_dq(&gh);
-out_uninit:
-	gfs2_holder_uninit(&gh);
 }
 
 /**
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index fe305e4bfd37..f729b0ff2a3c 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -558,8 +558,29 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
 	return block_page_mkwrite_return(ret);
 }
 
+static vm_fault_t gfs2_fault(struct vm_fault *vmf)
+{
+	struct inode *inode = file_inode(vmf->vma->vm_file);
+	struct gfs2_inode *ip = GFS2_I(inode);
+	struct gfs2_holder gh;
+	vm_fault_t ret;
+	int err;
+
+	gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
+	err = gfs2_glock_nq(&gh);
+	if (err) {
+		ret = block_page_mkwrite_return(err);
+		goto out_uninit;
+	}
+	ret = filemap_fault(vmf);
+	gfs2_glock_dq(&gh);
+out_uninit:
+	gfs2_holder_uninit(&gh);
+	return ret;
+}
+
 static const struct vm_operations_struct gfs2_vm_ops = {
-	.fault = filemap_fault,
+	.fault = gfs2_fault,
 	.map_pages = filemap_map_pages,
 	.page_mkwrite = gfs2_page_mkwrite,
 };
@@ -824,15 +845,51 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
 
 static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 {
+	struct gfs2_inode *ip;
+	struct gfs2_holder gh;
+	size_t written = 0;
 	ssize_t ret;
 
+	gfs2_holder_mark_uninitialized(&gh);
 	if (iocb->ki_flags & IOCB_DIRECT) {
 		ret = gfs2_file_direct_read(iocb, to);
 		if (likely(ret != -ENOTBLK))
 			return ret;
 		iocb->ki_flags &= ~IOCB_DIRECT;
 	}
-	return generic_file_read_iter(iocb, to);
+	iocb->ki_flags |= IOCB_CACHED;
+	ret = generic_file_read_iter(iocb, to);
+	iocb->ki_flags &= ~IOCB_CACHED;
+	if (ret >= 0) {
+		if (!iov_iter_count(to))
+			return ret;
+		written = ret;
+	} else {
+		switch(ret) {
+		case -EAGAIN:
+			if (iocb->ki_flags & IOCB_NOWAIT)
+				return ret;
+			break;
+		case -ECANCELED:
+			break;
+		default:
+			return ret;
+		}
+	}
+	ip = GFS2_I(iocb->ki_filp->f_mapping->host);
+	gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
+	ret = gfs2_glock_nq(&gh);
+	if (ret)
+		goto out_uninit;
+	ret = generic_file_read_iter(iocb, to);
+	if (ret > 0)
+		written += ret;
+	if (gfs2_holder_initialized(&gh))
+		gfs2_glock_dq(&gh);
+out_uninit:
+	if (gfs2_holder_initialized(&gh))
+		gfs2_holder_uninit(&gh);
+	return written ? written : ret;
 }
 
 /**
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
