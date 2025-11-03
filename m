Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC8DC29CFD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 03 Nov 2025 02:49:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:In-Reply-To:Date:From:To:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ZmyZbtai5iBaR12aWaf/cEp2E2MN2G1aFGZH3wlFolE=; b=OiYA+wZhS/Fft09dNZa/OhW/EK
	0Ih9h+5sqv69pdH5rKShxJtIC+oqBNXSyy2TYjjP+Jt8Pz206elumb+ef9U13JXBARtNWs6yguMbH
	EHMlaCTQibahIBCERXtwQntbhtWTpcIURBLLSL8waylH1TZzfenXWfRU8tNIaQeDOC6o=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vFjh9-0004Bc-EQ;
	Mon, 03 Nov 2025 01:49:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1vFjh8-0004BL-3f
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 01:49:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:In-Reply-To:Date:From:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yoNGa3BIGUupq3nqv1c1Texjxp2LF49BQVW1KnxuAHE=; b=lbtDMxHGSdjVxAtK0d9tZX3WjZ
 vBWbIhvba+AR6ALLmzPT3XlQqFZ06kzGXFP6EprVgPFX+6ySRBhHoSnk4BzNYA8FUbbHMpa27H++O
 OV7BvFgUtIXXM2HuxVuPpiNBxAPloak55ikzqsRctbBF1+SDTcxI90jwC+QH2wZSED6U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:From:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yoNGa3BIGUupq3nqv1c1Texjxp2LF49BQVW1KnxuAHE=; b=IE1QF4pfu1FNKJZU8YjTXpCftC
 M9wnGlWs/3rUGMQbdVv3jbw4worIqA1O7NwdvmmdVptCedeg11EYRlVD7VsmDEZcCKhIdjLS1pAOC
 Zzt7YNVH9VLlbIDKaNBvxfOfyKCEs6X5wjCRDA7XzKpW5dQk/bZJjR8qWDlfB1AB5xr0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vFjh8-0007MB-1S for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 01:49:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6E77360288;
 Mon,  3 Nov 2025 01:49:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8866C116B1;
 Mon,  3 Nov 2025 01:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1762134547;
 bh=oD5MGG3WGGsNK9lAnNSf8zWYE8mFT+Bpvl/9vNMGYqg=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=FP05s2qm1BM57b7XuRGGEFR69Np5D5EpyCbVrxW18WQRNZkMbIWHMz8hiO0ypbTD+
 y8tgk1OSUdezYg0Ehcyl+1X5XAhT2oqwW9MZZsC1/RMgtWl+3OaHXYZLiPGSXaOM6B
 KRBTsMztFj/Fa9xOr/++l6+/UXkuLVwERBZjnMX8=
To: adilger.kernel@dilger.ca, agruenba@redhat.com, akpm@linux-foundation.org,
 anna@kernel.org, axboe@kernel.dk, brauner@kernel.org, chao@kernel.org,
 djwong@kernel.org, dlemoal@kernel.org, gregkh@linuxfoundation.org,
 hare@suse.de, hch@infradead.org, hch@lst.de, idryomov@gmail.com,
 jaegeuk@kernel.org, jlayton@kernel.org, johannes.thumshirn@wdc.com,
 konishi.ryusuke@gmail.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-mm@kvack.org, mcgrof@kernel.org, miklos@szeredi.hu, mngyadam@amazon.de,
 mszeredi@redhat.com, nagy@khwaternagy.com, trond.myklebust@hammerspace.com,
 tytso@mit.edu, viro@zeniv.linux.org.uk, willy@infradead.org, xiubli@redhat.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 03 Nov 2025 10:46:57 +0900
In-Reply-To: <20251021070353.96705-4-mngyadam@amazon.de>
Message-ID: <2025110357-cornbread-cold-7221@gregkh>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is a note to let you know that I've just added the patch
 titled filemap: add a kiocb_invalidate_post_direct_write helper to the
 6.1-stable tree which can be found at:
 http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;
 a=summary Content analysis details:   (0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1vFjh8-0007MB-1S
Subject: [f2fs-dev] Patch "filemap: add a kiocb_invalidate_post_direct_write
 helper" has been added to the 6.1-stable tree
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


This is a note to let you know that I've just added the patch titled

    filemap: add a kiocb_invalidate_post_direct_write helper

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     filemap-add-a-kiocb_invalidate_post_direct_write-helper.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-188297-greg=kroah.com@vger.kernel.org Tue Oct 21 16:13:23 2025
From: Mahmoud Adam <mngyadam@amazon.de>
Date: Tue, 21 Oct 2025 09:03:37 +0200
Subject: filemap: add a kiocb_invalidate_post_direct_write helper
To: <stable@vger.kernel.org>
Cc: <gregkh@linuxfoundation.org>, <nagy@khwaternagy.com>, Christoph Hellwig <hch@lst.de>, Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>, "Darrick J. Wong" <djwong@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Andreas Gruenbacher <agruenba@redhat.com>, "Anna Schumaker" <anna@kernel.org>, Chao Yu <chao@kernel.org>, Christian Brauner <brauner@kernel.org>, Ilya Dryomov <idryomov@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Jens Axboe <axboe@kernel.dk>, Johannes Thumshirn <johannes.thumshirn@wdc.com>, Matthew Wilcox <willy@infradead.org>, "Miklos Szeredi" <miklos@szeredi.hu>, Miklos Szeredi <mszeredi@redhat.com>, "Theodore Ts'o" <tytso@mit.edu>, Trond Myklebust <trond.myklebust@hammerspace.com>, Xiubo Li <xiubli@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, "Jeff Layton" <jlayton@kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>, Christoph Hellwig <hch@infradead.org>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>,
  <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <ceph-devel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>, <linux-ext4@vger.kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>, <linux-xfs@vger.kernel.org>, <linux-nfs@vger.kernel.org>, <linux-nilfs@vger.kernel.org>, <linux-mm@kvack.org>
Message-ID: <20251021070353.96705-4-mngyadam@amazon.de>

From: Christoph Hellwig <hch@lst.de>

commit c402a9a9430b670926decbb284b756ee6f47c1ec upstream.

Add a helper to invalidate page cache after a dio write.

Link: https://lkml.kernel.org/r/20230601145904.1385409-7-hch@lst.de
Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Acked-by: Darrick J. Wong <djwong@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: Anna Schumaker <anna@kernel.org>
Cc: Chao Yu <chao@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Ilya Dryomov <idryomov@gmail.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Miklos Szeredi <miklos@szeredi.hu>
Cc: Miklos Szeredi <mszeredi@redhat.com>
Cc: Theodore Ts'o <tytso@mit.edu>
Cc: Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: Xiubo Li <xiubli@redhat.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Mahmoud Adam <mngyadam@amazon.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/direct-io.c          |   10 ++--------
 fs/iomap/direct-io.c    |   12 ++----------
 include/linux/fs.h      |    5 -----
 include/linux/pagemap.h |    1 +
 mm/filemap.c            |   37 ++++++++++++++++++++-----------------
 5 files changed, 25 insertions(+), 40 deletions(-)

--- a/fs/direct-io.c
+++ b/fs/direct-io.c
@@ -286,14 +286,8 @@ static ssize_t dio_complete(struct dio *
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
 
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -81,7 +81,6 @@ ssize_t iomap_dio_complete(struct iomap_
 {
 	const struct iomap_dio_ops *dops = dio->dops;
 	struct kiocb *iocb = dio->iocb;
-	struct inode *inode = file_inode(iocb->ki_filp);
 	loff_t offset = iocb->ki_pos;
 	ssize_t ret = dio->error;
 
@@ -108,15 +107,8 @@ ssize_t iomap_dio_complete(struct iomap_
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
 	if (ret > 0) {
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3371,11 +3371,6 @@ static inline void inode_dio_end(struct
 		wake_up_bit(&inode->i_state, __I_DIO_WAKEUP);
 }
 
-/*
- * Warn about a page cache invalidation failure diring a direct I/O write.
- */
-void dio_warn_stale_pagecache(struct file *filp);
-
 extern void inode_set_flags(struct inode *inode, unsigned int flags,
 			    unsigned int mask);
 
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -31,6 +31,7 @@ int invalidate_inode_pages2(struct addre
 int invalidate_inode_pages2_range(struct address_space *mapping,
 		pgoff_t start, pgoff_t end);
 int kiocb_invalidate_pages(struct kiocb *iocb, size_t count);
+void kiocb_invalidate_post_direct_write(struct kiocb *iocb, size_t count);
 int write_inode_now(struct inode *, int sync);
 int filemap_fdatawrite(struct address_space *);
 int filemap_flush(struct address_space *);
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3733,7 +3733,7 @@ EXPORT_SYMBOL(read_cache_page_gfp);
 /*
  * Warn about a page cache invalidation failure during a direct I/O write.
  */
-void dio_warn_stale_pagecache(struct file *filp)
+static void dio_warn_stale_pagecache(struct file *filp)
 {
 	static DEFINE_RATELIMIT_STATE(_rs, 86400 * HZ, DEFAULT_RATELIMIT_BURST);
 	char pathname[128];
@@ -3750,19 +3750,23 @@ void dio_warn_stale_pagecache(struct fil
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
@@ -3772,7 +3776,7 @@ generic_file_direct_write(struct kiocb *
 	if (written) {
 		if (written == -EBUSY)
 			return 0;
-		goto out;
+		return written;
 	}
 
 	written = mapping->a_ops->direct_IO(iocb, from);
@@ -3794,11 +3798,11 @@ generic_file_direct_write(struct kiocb *
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
@@ -3809,7 +3813,6 @@ generic_file_direct_write(struct kiocb *
 	}
 	if (written != -EIOCBQUEUED)
 		iov_iter_revert(from, write_len - iov_iter_count(from));
-out:
 	return written;
 }
 EXPORT_SYMBOL(generic_file_direct_write);


Patches currently in stable-queue which might be from mngyadam@amazon.de are

queue-6.1/block-fix-race-between-set_blocksize-and-read-paths.patch
queue-6.1/filemap-add-a-kiocb_invalidate_pages-helper.patch
queue-6.1/fs-factor-out-a-direct_write_fallback-helper.patch
queue-6.1/direct_write_fallback-on-error-revert-the-ki_pos-update-from-buffered-write.patch
queue-6.1/filemap-update-ki_pos-in-generic_perform_write.patch
queue-6.1/filemap-add-a-kiocb_invalidate_post_direct_write-helper.patch
queue-6.1/nilfs2-fix-deadlock-warnings-caused-by-lock-dependency-in-init_nilfs.patch
queue-6.1/block-open-code-__generic_file_write_iter-for-blkdev-writes.patch


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
