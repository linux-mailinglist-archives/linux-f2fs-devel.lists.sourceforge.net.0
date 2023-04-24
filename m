Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD696EC51C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Apr 2023 07:50:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pqp5g-0004bZ-26;
	Mon, 24 Apr 2023 05:50:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+e16e2fc4419b117693a1+7183+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pqp5b-0004at-5C for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 05:50:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pJqF9iLDXxalAZri1sgP4ykwSrvt3ymept2aEtNRU2M=; b=jkesofjs0p9KWpaqdOQt0ADhU/
 NCGiGLPC135M+FPSibV/sg/oSfD8/r9xeRk6VRp6NFsGoYDq0YXSPFsEcnOAJqYKM1As46vjdk1B2
 M+11byMYzHawSgPHMVMtFVhrK3QUCDEzgkLkQZCtn87b//rASiXGG9nwNr500xh6Ig5M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pJqF9iLDXxalAZri1sgP4ykwSrvt3ymept2aEtNRU2M=; b=T52DJQ6Ypl+f12SiUaWQTszBHl
 U+9zQz6bjXNdwyC5XhWKMti0hhwDFTgVD+vYN7h2GYp90/A+QpplV3Cy1nKkpPoaOAvwrokecoTcW
 L6nwpRFozCi0gMuVgAeMPS+X32KsofJYwt5dy8bIHDd8DCt2qPz9LJADERVMaCfrGQ/Q=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pqp5Z-0003VL-Kf for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 05:50:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=pJqF9iLDXxalAZri1sgP4ykwSrvt3ymept2aEtNRU2M=; b=3lxWVAk+3jZfmQD+hx2GXifc+u
 2uElWR6QJNM63DBT0CyBjHyTQty+aqsqVeci/2v+7iILU2eb3upv78/4g048VSlvmDvh2mJYlZYZ6
 XOxjp6O39E62ujMQm69yzR/DnVWTniYzJvEiutGiNhDq42IO09RTn0OMm/3Bvn2K6DU3f11ZHTGj3
 wO/B5SuQ7cosdpF7UlWJdzPfVB+e8gNIg9bicPczX/NjxixXpg3qMzmuu6NLAkDvHL5b74xtnSdgO
 ZKCt4iYFs6TuqhKmfkfCVG1sm381O08hFBNFhqmsvf5phswa19FEEeAjjvkIomMjBB57KJt2H9laH
 ncijNsbQ==;
Received: from [2001:4bb8:189:a74f:e8a5:5f73:6d2:23b8] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pqp5L-00FP1c-2M; Mon, 24 Apr 2023 05:50:00 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 24 Apr 2023 07:49:19 +0200
Message-Id: <20230424054926.26927-11-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424054926.26927-1-hch@lst.de>
References: <20230424054926.26927-1-hch@lst.de>
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
 Content preview: Use the common helpers for direct I/O page invalidation
 instead
 of open coding the logic. This leads to a slight reordering of checks in
 __iomap_dio_rw to keep the logic straight. Signed-off-by: Christoph Hellwig
 <hch@lst.de> --- fs/iomap/direct-io.c | 55 ++++++++++++++++ 1 file changed,
 20 insertions(+), 35 deletions(-) 
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
X-Headers-End: 1pqp5Z-0003VL-Kf
Subject: [f2fs-dev] [PATCH 10/17] iomap: use kiocb_write_and_wait and
 kiocb_invalidate_pages
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
Cc: linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
 cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use the common helpers for direct I/O page invalidation instead of
open coding the logic.  This leads to a slight reordering of checks
in __iomap_dio_rw to keep the logic straight.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/iomap/direct-io.c | 55 ++++++++++++++++----------------------------
 1 file changed, 20 insertions(+), 35 deletions(-)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index 2bf8d684675615..10a790f568afca 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -470,7 +470,6 @@ __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
 		const struct iomap_ops *ops, const struct iomap_dio_ops *dops,
 		unsigned int dio_flags, void *private, size_t done_before)
 {
-	struct address_space *mapping = iocb->ki_filp->f_mapping;
 	struct inode *inode = file_inode(iocb->ki_filp);
 	struct iomap_iter iomi = {
 		.inode		= inode,
@@ -479,11 +478,11 @@ __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
 		.flags		= IOMAP_DIRECT,
 		.private	= private,
 	};
-	loff_t end = iomi.pos + iomi.len - 1, ret = 0;
 	bool wait_for_completion =
 		is_sync_kiocb(iocb) || (dio_flags & IOMAP_DIO_FORCE_WAIT);
 	struct blk_plug plug;
 	struct iomap_dio *dio;
+	loff_t ret = 0;
 
 	if (!iomi.len)
 		return NULL;
@@ -505,31 +504,29 @@ __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
 	dio->submit.waiter = current;
 	dio->submit.poll_bio = NULL;
 
+	if (iocb->ki_flags & IOCB_NOWAIT)
+		iomi.flags |= IOMAP_NOWAIT;
+
 	if (iov_iter_rw(iter) == READ) {
 		if (iomi.pos >= dio->i_size)
 			goto out_free_dio;
 
-		if (iocb->ki_flags & IOCB_NOWAIT) {
-			if (filemap_range_needs_writeback(mapping, iomi.pos,
-					end)) {
-				ret = -EAGAIN;
-				goto out_free_dio;
-			}
-			iomi.flags |= IOMAP_NOWAIT;
-		}
-
 		if (user_backed_iter(iter))
 			dio->flags |= IOMAP_DIO_DIRTY;
+
+		ret = kiocb_write_and_wait(iocb, iomi.len);
+		if (ret)
+			goto out_free_dio;
 	} else {
 		iomi.flags |= IOMAP_WRITE;
 		dio->flags |= IOMAP_DIO_WRITE;
 
-		if (iocb->ki_flags & IOCB_NOWAIT) {
-			if (filemap_range_has_page(mapping, iomi.pos, end)) {
-				ret = -EAGAIN;
+		if (dio_flags & IOMAP_DIO_OVERWRITE_ONLY) {
+			ret = -EAGAIN;
+			if (iomi.pos >= dio->i_size ||
+			    iomi.pos + iomi.len > dio->i_size)
 				goto out_free_dio;
-			}
-			iomi.flags |= IOMAP_NOWAIT;
+			iomi.flags |= IOMAP_OVERWRITE_ONLY;
 		}
 
 		/* for data sync or sync, we need sync completion processing */
@@ -545,31 +542,19 @@ __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
 			if (!(iocb->ki_flags & IOCB_SYNC))
 				dio->flags |= IOMAP_DIO_WRITE_FUA;
 		}
-	}
-
-	if (dio_flags & IOMAP_DIO_OVERWRITE_ONLY) {
-		ret = -EAGAIN;
-		if (iomi.pos >= dio->i_size ||
-		    iomi.pos + iomi.len > dio->i_size)
-			goto out_free_dio;
-		iomi.flags |= IOMAP_OVERWRITE_ONLY;
-	}
 
-	ret = filemap_write_and_wait_range(mapping, iomi.pos, end);
-	if (ret)
-		goto out_free_dio;
-
-	if (iov_iter_rw(iter) == WRITE) {
 		/*
 		 * Try to invalidate cache pages for the range we are writing.
 		 * If this invalidation fails, let the caller fall back to
 		 * buffered I/O.
 		 */
-		if (invalidate_inode_pages2_range(mapping,
-				iomi.pos >> PAGE_SHIFT, end >> PAGE_SHIFT)) {
-			trace_iomap_dio_invalidate_fail(inode, iomi.pos,
-							iomi.len);
-			ret = -ENOTBLK;
+		ret = kiocb_invalidate_pages(iocb, iomi.len);
+		if (ret) {
+			if (ret != -EAGAIN) {
+				trace_iomap_dio_invalidate_fail(inode, iomi.pos,
+								iomi.len);
+				ret = -ENOTBLK;
+			}
 			goto out_free_dio;
 		}
 
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
