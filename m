Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E26C6EC524
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Apr 2023 07:50:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pqp66-0004N0-2a;
	Mon, 24 Apr 2023 05:50:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+e16e2fc4419b117693a1+7183+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pqp5s-0004MJ-Oc for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 05:50:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DeEMnLNut18pjb9zsoS5o5eSPuPyLSQ1uVXA5zuWlvs=; b=NSvi+7t8cRJqKV8hF2cgOalxSn
 TadL/FjihzMsgN0uY6cq8KVT40elZMQ3Dur1lNkLWuXO59NCKG5YxMAc2vph/XKKI53ZmMig19u6/
 OqdnuGGVl+CotIVX+hpueSsyEdo2WqRfQ6iL+yZ1kdCTOvEgUS0WgqhwLO+ir3w8QexI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DeEMnLNut18pjb9zsoS5o5eSPuPyLSQ1uVXA5zuWlvs=; b=mPaUlFbSm2NR82ytZscTDKTBm4
 PBb8F+G8xj7Pr4Sy547l6gfe3k0JeStaJ3fLfEPdL6ynx3ZLmr/zLBDqzlvrCPnpQ+BcxIWKzvE7x
 MN64DZh6lHWacMbhJ/Uh8DfmKzLqFXHttO00MYS2sQF6kOLYwlZ8c/lgEVJt2i5Sd+KA=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pqp5r-00HHuM-AU for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 05:50:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=DeEMnLNut18pjb9zsoS5o5eSPuPyLSQ1uVXA5zuWlvs=; b=eaGzgbZaXKx1KyoFV6zGe9nYHJ
 ZwankVTk2pK/HLEjyW9HXQbEvrT6olrOT1KuAt81GdNbakAo0iy44P4Damhh264EH/+JUBMVsDYUM
 /kugXtMO6Gv9hObKPdcxPihekCau7Ms1S+MMRj+dlBau86GBhMGLzLMEMWBDJjhuLS9zMvKps3MPN
 MHHySMYe2QhwxmEt9zHbO8D812jGdIzNJbIexnk/RGuGbtYWA/Htqd9xtyVpBl2gYuBEHgvrzgeQe
 VeoXtT8G1+qTJKrcrVDwi79thfMJRDrNOMiZDFn8W6VhlJiNx0v1TuyWCgTI6FGUeXrqgZWtaCrV4
 p1Am25Kg==;
Received: from [2001:4bb8:189:a74f:e8a5:5f73:6d2:23b8] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pqp5e-00FPC9-1d; Mon, 24 Apr 2023 05:50:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 24 Apr 2023 07:49:25 +0200
Message-Id: <20230424054926.26927-17-hch@lst.de>
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
 Content preview: Use iomap in buffer_head compat mode to write to block
 devices.
 Signed-off-by: Christoph Hellwig <hch@lst.de> --- block/Kconfig | 1 +
 block/fops.c
 | 33 +++++++++++++++++++++++++++++---- 2 files changed, 30 insertions(+),
 4 deletions(-) 
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
X-Headers-End: 1pqp5r-00HHuM-AU
Subject: [f2fs-dev] [PATCH 16/17] block: use iomap for writes to block
 devices
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

Use iomap in buffer_head compat mode to write to block devices.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/Kconfig |  1 +
 block/fops.c  | 33 +++++++++++++++++++++++++++++----
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/block/Kconfig b/block/Kconfig
index 941b2dca70db73..672b08f0096ab4 100644
--- a/block/Kconfig
+++ b/block/Kconfig
@@ -5,6 +5,7 @@
 menuconfig BLOCK
        bool "Enable the block layer" if EXPERT
        default y
+       select IOMAP
        select SBITMAP
        help
 	 Provide block layer support for the kernel.
diff --git a/block/fops.c b/block/fops.c
index 318247832a7bcf..7910636f8df33b 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -15,6 +15,7 @@
 #include <linux/falloc.h>
 #include <linux/suspend.h>
 #include <linux/fs.h>
+#include <linux/iomap.h>
 #include <linux/module.h>
 #include "blk.h"
 
@@ -386,6 +387,27 @@ static ssize_t blkdev_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
 	return __blkdev_direct_IO(iocb, iter, bio_max_segs(nr_pages));
 }
 
+static int blkdev_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
+		unsigned int flags, struct iomap *iomap, struct iomap *srcmap)
+{
+	struct block_device *bdev = I_BDEV(inode);
+	loff_t isize = i_size_read(inode);
+
+	iomap->bdev = bdev;
+	iomap->offset = ALIGN_DOWN(offset, bdev_logical_block_size(bdev));
+	if (WARN_ON_ONCE(iomap->offset >= isize))
+		return -EIO;
+	iomap->type = IOMAP_MAPPED;
+	iomap->addr = iomap->offset;
+	iomap->length = isize - iomap->offset;
+	iomap->flags |= IOMAP_F_BUFFER_HEAD;
+	return 0;
+}
+
+static const struct iomap_ops blkdev_iomap_ops = {
+	.iomap_begin		= blkdev_iomap_begin,
+};
+
 static int blkdev_writepage(struct page *page, struct writeback_control *wbc)
 {
 	return block_write_full_page(page, blkdev_get_block, wbc);
@@ -530,6 +552,11 @@ blkdev_direct_write(struct kiocb *iocb, struct iov_iter *from)
 	return written;
 }
 
+static ssize_t blkdev_buffered_write(struct kiocb *iocb, struct iov_iter *from)
+{
+	return iomap_file_buffered_write(iocb, from, &blkdev_iomap_ops);
+}
+
 /*
  * Write data to the block device.  Only intended for the block device itself
  * and the raw driver which basically is a fake block device.
@@ -575,16 +602,14 @@ static ssize_t blkdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		iov_iter_truncate(from, size);
 	}
 
-	current->backing_dev_info = bdev->bd_disk->bdi;
 	if (iocb->ki_flags & IOCB_DIRECT) {
 		ret = blkdev_direct_write(iocb, from);
 		if (ret >= 0 && iov_iter_count(from))
 			ret = direct_write_fallback(iocb, from, ret,
-					generic_perform_write(iocb, from));
+					blkdev_buffered_write(iocb, from));
 	} else {
-		ret = generic_perform_write(iocb, from);
+		ret = blkdev_buffered_write(iocb, from);
 	}
-	current->backing_dev_info = NULL;
 
 	if (ret > 0)
 		ret = generic_write_sync(iocb, ret);
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
