Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6517178CA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 May 2023 09:51:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4Gbs-0006FI-4Q;
	Wed, 31 May 2023 07:51:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+b81a8c9a6d22e8bb2302+7220+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1q4Gbn-0006Ea-DU for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 07:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+TlwHQVmCcfSC9sL9si103D1qv7dfudCnmtDuQc976U=; b=Il34R5mBW3NAdAXj4SKHDHxdkU
 /4IDCJZQjMHHNEXFO3a0VUMrJR7aJ1e/Ne4kdk6ob9glWkE2x/+gSuwf8Knydt0MuZOkF92JDQ/9D
 FbnMuXG7JeIieMQ++zGISsfW5hTKNdj99jWiLhUIlD2NrkH6wjfWzpWRsZK3LlHzltC8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+TlwHQVmCcfSC9sL9si103D1qv7dfudCnmtDuQc976U=; b=Qno4qkUgkkiKWf+OBx7NRnjMmC
 2X14fFCdJDPAMBsJjs4/kAO4bt+kCj/Kxqznq/OlJplJk3Gv34vLIvbxlOFZDJcI31SfNYFW8ciDM
 QSpOTNf7bYhTdJEFYC9atyr4xCJPQ8sehdDupQpe7U33BEWIn+kkiB2FFQt4kIQoaGAs=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4Gbm-007Ejl-RT for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 07:51:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=+TlwHQVmCcfSC9sL9si103D1qv7dfudCnmtDuQc976U=; b=DjkGSNhfxlyHdHmZ+aBPLm0AmK
 3nSTrCN5Pwh8HDmmbRXnhMRvz+JIT6h6F6yA35TYrD1FIj5qGsM8GHWl+ZAvE08Pvcxni0zcnTB7E
 9jeKuRIiiVPJSBVoabk1ohE4Idh4SVB4aeVHVnQFVpZfMWvueT+wTI8vn65XazJ8ocFrbD5Hky125
 TK6Bcl1zzEUcXiyd6sCm1IdkM43w3fN8zhNYZ117MvX5gdTQcqIBpA+WBivtnVlskMyMktya6Icr6
 /4xWKrsWFA3/X27UuR2AvcifM2q4neWhR4fdC9tT555gl4NlHZ9UXxvTDSisBM+I0AyMC17ZdOsGI
 Cs7By28Q==;
Received: from [2001:4bb8:182:6d06:f5c3:53d7:b5aa:b6a7] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q4Gba-00GVsM-19; Wed, 31 May 2023 07:50:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Date: Wed, 31 May 2023 09:50:22 +0200
Message-Id: <20230531075026.480237-9-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531075026.480237-1-hch@lst.de>
References: <20230531075026.480237-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use the common helpers for direct I/O page invalidation
 instead
 of open coding the logic. This leads to a slight reordering of checks in
 __iomap_dio_rw to keep the logic straight. Signed-off-by: Christoph Hellwig
 <hch@lst.de> Reviewed-by: Damien Le Moal <dlemoal@kernel.org> Reviewed-by:
 Hannes Reinecke <hare@suse.de> Reviewed-by: Darrick J. Wong
 <djwong@kernel.org> --- fs/iomap [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q4Gbm-007Ejl-RT
Subject: [f2fs-dev] [PATCH 08/12] iomap: use kiocb_write_and_wait and
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
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use the common helpers for direct I/O page invalidation instead of
open coding the logic.  This leads to a slight reordering of checks
in __iomap_dio_rw to keep the logic straight.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/iomap/direct-io.c | 55 ++++++++++++++++----------------------------
 1 file changed, 20 insertions(+), 35 deletions(-)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index 0795c54a745bca..6bd14691f96e07 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -472,7 +472,6 @@ __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
 		const struct iomap_ops *ops, const struct iomap_dio_ops *dops,
 		unsigned int dio_flags, void *private, size_t done_before)
 {
-	struct address_space *mapping = iocb->ki_filp->f_mapping;
 	struct inode *inode = file_inode(iocb->ki_filp);
 	struct iomap_iter iomi = {
 		.inode		= inode,
@@ -481,11 +480,11 @@ __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
 		.flags		= IOMAP_DIRECT,
 		.private	= private,
 	};
-	loff_t end = iomi.pos + iomi.len - 1, ret = 0;
 	bool wait_for_completion =
 		is_sync_kiocb(iocb) || (dio_flags & IOMAP_DIO_FORCE_WAIT);
 	struct blk_plug plug;
 	struct iomap_dio *dio;
+	loff_t ret = 0;
 
 	trace_iomap_dio_rw_begin(iocb, iter, dio_flags, done_before);
 
@@ -509,31 +508,29 @@ __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
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
@@ -549,31 +546,19 @@ __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
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
