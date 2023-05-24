Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D844D70EE31
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 May 2023 08:39:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q1i9j-0001Xw-AG;
	Wed, 24 May 2023 06:39:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+8349dc162fb675e8d54f+7213+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1q1i9R-0001Wz-Lw for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 May 2023 06:39:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HdqYutACGg449lbpC5g+tM8dj77PJUcg5E3vRPFmYq0=; b=Y/G2Fz8kRiZV/+xs6r7XMuHff8
 lM2eL2qzQjdz+/OUM6oUvJmN7cxPXClCnumHxnWonsnxjY81FU6dsoznicE9EizZj08WYOaji5fGw
 LS7LUzw9KPfSiJRx85SbwG7APiRVCTuvKU85aP/AODvHSOQAH9le5OHh65jBJrdFUN6A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HdqYutACGg449lbpC5g+tM8dj77PJUcg5E3vRPFmYq0=; b=BHoShq2R32L9rBh0rEchlXI17O
 I92NFxXjfbbKqVpcxCU/33a2jhGwoH9weNLkHDRc335fOpcpClQqEyN4YK52w3vutNMRkjJyOZfqf
 h2uSO5Cqi++j16YqyOmakKNs0/GoVPaSLNcTzngDDscunxsDKXL2L/USaBZd8J24oSd8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q1i8z-0005gy-Ti for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 May 2023 06:39:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=HdqYutACGg449lbpC5g+tM8dj77PJUcg5E3vRPFmYq0=; b=aIT9RxPAfhHOwqFZulkLmucxGV
 rLmMDARC7Dok2azH//gTb4c6Pv6q2CYBKqB8tbL2AuYl8Tfm9vOJ5XyRfvYGxjYgaZYnnX2Hx6xah
 vrC1KPdTBTHrMFDf6/pdyS2fU62TnVe2a/zKaA4Er+WhodXEB55zZVt7ffWjrFYZ8qwq2O1XSL6jZ
 Jf55EKX6Pdh43s8/PobRAATn/qfOc8Kte4qHFp4RoHJZ42gh+MbsmJr0BE8l4SxPAs7j+iwO11vfy
 2Y+30GGr5oR4tTZ1yrEZRl9Jb/f+do7t9ATt+B+FC6zzk83WgR+wA/beHBKCN+AZh236kLMfXWU/D
 OHHhHfaQ==;
Received: from [2001:4bb8:188:23b2:cbb8:fcea:a637:5089] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q1i8l-00CVg9-0q; Wed, 24 May 2023 06:38:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Date: Wed, 24 May 2023 08:38:05 +0200
Message-Id: <20230524063810.1595778-7-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230524063810.1595778-1-hch@lst.de>
References: <20230524063810.1595778-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add a helper to invalidate page cache after a dio write.
 Signed-off-by:
 Christoph Hellwig <hch@lst.de> Reviewed-by: Damien Le Moal
 <dlemoal@kernel.org>
 Acked-by: Darrick J. Wong <djwong@kernel.org> --- fs/direct-io.c | 10
 ++-------- fs/iomap/direct-io.c | 1 [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q1i8z-0005gy-Ti
Subject: [f2fs-dev] [PATCH 06/11] filemap: add a
 kiocb_invalidate_post_direct_write helper
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 cluster-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add a helper to invalidate page cache after a dio write.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Acked-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/direct-io.c          | 10 ++--------
 fs/iomap/direct-io.c    | 12 ++----------
 include/linux/fs.h      |  5 -----
 include/linux/pagemap.h |  1 +
 mm/filemap.c            | 37 ++++++++++++++++++++-----------------
 5 files changed, 25 insertions(+), 40 deletions(-)

diff --git a/fs/direct-io.c b/fs/direct-io.c
index 0b380bb8a81e11..4f9069aee0fe19 100644
--- a/fs/direct-io.c
+++ b/fs/direct-io.c
@@ -285,14 +285,8 @@ static ssize_t dio_complete(struct dio *dio, ssize_t ret, unsigned int flags)
 	 * zeros from unwritten extents.
 	 */
 	if (flags & DIO_COMPLETE_INVALIDATE &&
-	    ret > 0 && dio_op == REQ_OP_WRITE &&
-	    dio->inode->i_mapping->nrpages) {
-		err = invalidate_inode_pages2_range(dio->inode->i_mapping,
-					offset >> PAGE_SHIFT,
-					(offset + ret - 1) >> PAGE_SHIFT);
-		if (err)
-			dio_warn_stale_pagecache(dio->iocb->ki_filp);
-	}
+	    ret > 0 && dio_op == REQ_OP_WRITE)
+		kiocb_invalidate_post_direct_write(dio->iocb, ret);
 
 	inode_dio_end(dio->inode);
 
diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index 6207a59d2162e1..0795c54a745bca 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -81,7 +81,6 @@ ssize_t iomap_dio_complete(struct iomap_dio *dio)
 {
 	const struct iomap_dio_ops *dops = dio->dops;
 	struct kiocb *iocb = dio->iocb;
-	struct inode *inode = file_inode(iocb->ki_filp);
 	loff_t offset = iocb->ki_pos;
 	ssize_t ret = dio->error;
 
@@ -108,15 +107,8 @@ ssize_t iomap_dio_complete(struct iomap_dio *dio)
 	 * ->end_io() when necessary, otherwise a racing buffer read would cache
 	 * zeros from unwritten extents.
 	 */
-	if (!dio->error && dio->size &&
-	    (dio->flags & IOMAP_DIO_WRITE) && inode->i_mapping->nrpages) {
-		int err;
-		err = invalidate_inode_pages2_range(inode->i_mapping,
-				offset >> PAGE_SHIFT,
-				(offset + dio->size - 1) >> PAGE_SHIFT);
-		if (err)
-			dio_warn_stale_pagecache(iocb->ki_filp);
-	}
+	if (!dio->error && dio->size && (dio->flags & IOMAP_DIO_WRITE))
+		kiocb_invalidate_post_direct_write(iocb, dio->size);
 
 	inode_dio_end(file_inode(iocb->ki_filp));
 
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 21a98168085641..e4efc1792a877a 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2837,11 +2837,6 @@ static inline void inode_dio_end(struct inode *inode)
 		wake_up_bit(&inode->i_state, __I_DIO_WAKEUP);
 }
 
-/*
- * Warn about a page cache invalidation failure diring a direct I/O write.
- */
-void dio_warn_stale_pagecache(struct file *filp);
-
 extern void inode_set_flags(struct inode *inode, unsigned int flags,
 			    unsigned int mask);
 
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 6e4c9ee40baa99..6ecc4aaf5e3d51 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -31,6 +31,7 @@ int invalidate_inode_pages2(struct address_space *mapping);
 int invalidate_inode_pages2_range(struct address_space *mapping,
 		pgoff_t start, pgoff_t end);
 int kiocb_invalidate_pages(struct kiocb *iocb, size_t count);
+void kiocb_invalidate_post_direct_write(struct kiocb *iocb, size_t count);
 
 int write_inode_now(struct inode *, int sync);
 int filemap_fdatawrite(struct address_space *);
diff --git a/mm/filemap.c b/mm/filemap.c
index a1cb01a4b8046a..ddb6f8aa86d6ca 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3816,7 +3816,7 @@ EXPORT_SYMBOL(read_cache_page_gfp);
 /*
  * Warn about a page cache invalidation failure during a direct I/O write.
  */
-void dio_warn_stale_pagecache(struct file *filp)
+static void dio_warn_stale_pagecache(struct file *filp)
 {
 	static DEFINE_RATELIMIT_STATE(_rs, 86400 * HZ, DEFAULT_RATELIMIT_BURST);
 	char pathname[128];
@@ -3833,19 +3833,23 @@ void dio_warn_stale_pagecache(struct file *filp)
 	}
 }
 
+void kiocb_invalidate_post_direct_write(struct kiocb *iocb, size_t count)
+{
+	struct address_space *mapping = iocb->ki_filp->f_mapping;
+
+	if (mapping->nrpages &&
+	    invalidate_inode_pages2_range(mapping,
+			iocb->ki_pos >> PAGE_SHIFT,
+			(iocb->ki_pos + count - 1) >> PAGE_SHIFT))
+		dio_warn_stale_pagecache(iocb->ki_filp);
+}
+
 ssize_t
 generic_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
 {
-	struct file	*file = iocb->ki_filp;
-	struct address_space *mapping = file->f_mapping;
-	struct inode	*inode = mapping->host;
-	loff_t		pos = iocb->ki_pos;
-	ssize_t		written;
-	size_t		write_len;
-	pgoff_t		end;
-
-	write_len = iov_iter_count(from);
-	end = (pos + write_len - 1) >> PAGE_SHIFT;
+	struct address_space *mapping = iocb->ki_filp->f_mapping;
+	size_t write_len = iov_iter_count(from);
+	ssize_t written;
 
 	/*
 	 * If a page can not be invalidated, return 0 to fall back
@@ -3855,7 +3859,7 @@ generic_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
 	if (written) {
 		if (written == -EBUSY)
 			return 0;
-		goto out;
+		return written;
 	}
 
 	written = mapping->a_ops->direct_IO(iocb, from);
@@ -3877,11 +3881,11 @@ generic_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
 	 *
 	 * Skip invalidation for async writes or if mapping has no pages.
 	 */
-	if (written > 0 && mapping->nrpages &&
-	    invalidate_inode_pages2_range(mapping, pos >> PAGE_SHIFT, end))
-		dio_warn_stale_pagecache(file);
-
 	if (written > 0) {
+		struct inode *inode = mapping->host;
+		loff_t pos = iocb->ki_pos;
+
+		kiocb_invalidate_post_direct_write(iocb, written);
 		pos += written;
 		write_len -= written;
 		if (pos > i_size_read(inode) && !S_ISBLK(inode->i_mode)) {
@@ -3892,7 +3896,6 @@ generic_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
 	}
 	if (written != -EIOCBQUEUED)
 		iov_iter_revert(from, write_len - iov_iter_count(from));
-out:
 	return written;
 }
 EXPORT_SYMBOL(generic_file_direct_write);
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
