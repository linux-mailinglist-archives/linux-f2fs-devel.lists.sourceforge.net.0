Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFF5BF4F1A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Oct 2025 09:26:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnbsFAvK2KwWs+Rw/u5EbTfw81FuXyJiWkzkkk3zsGg=; b=EV9BpsHBa5IizRbSd5KBKdbYcd
	t6NxpDww+kTqym1xLqZZN0DCgIej5ZWuBpYY0tlTtFwhdfivXKV82M11Cqt8TTabGr1HxfRaa4HlY
	o1BZPZwqTPpKOX/JS/FKlC1Mmem75ebr2sGD0jFsSVqsOoshhVtrYyLl8co0nY7ekWSs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vB6kq-00087a-Fi;
	Tue, 21 Oct 2025 07:26:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=382e81130=mngyadam@amazon.de>)
 id 1vB6kp-00087T-2F for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 07:25:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c9ehURESYE/FlGbnKhMBWJDg3bnRGJGCmyBZSmWKczc=; b=TfmaM7ZrBIMDeMfk5NGirRsdQy
 ssEuJWvtfYtoiSGTFEYp5kiqQ447cn6GNTRTVICwH6Py4VlehKLhnGzqrpBNGEI5myXtKW2vzVFgb
 H1s2WZau31tDo+F9F12KJuVxY8+2iYh/YnxDnQeyHbFwJm8ReVjEE/nqWqWrL25ryA00=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c9ehURESYE/FlGbnKhMBWJDg3bnRGJGCmyBZSmWKczc=; b=AU2NTXkvBe85mVxB1ifR+vg87R
 TrTMPswQ8lMkDtA/++DcECA3/sRlO6w4xjt8yL+hmEDSuP2ImJVO8f3mDs0sfXD9XfDYNqVMV7thr
 7a0yLJeDOAc4V/wvRLAiXzNx+YvTMQBQeOjGFczUPbYH+KQVdQTxvbH9wyG9Us0d3hSA=;
Received: from fra-out-003.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 ([3.72.182.33]) by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vB6ko-0007WS-2o for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 07:25:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
 t=1761031558; x=1792567558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c9ehURESYE/FlGbnKhMBWJDg3bnRGJGCmyBZSmWKczc=;
 b=BpkMjQ1cF4LqHkt0XVTjs3ldbSEeRlwlcoab2wDa5IRjnUNtA+ByW84+
 95dNJiPy98084+yPyfHyVQyAssR+tqnOAOaQ4C9zwtflKU3sOMiPt2ome
 3ATBNSwSswvHaECMPurqKhOCeTzuXyVkG5fmCqbA9W0FKl40XrI/QW0i+
 VEZYsFC2a6M5dusLYI6LsE4zdlF3KH5DjbXkaWrCN/qK14KhqFVpVtHfN
 /oJ00b7JfUNyCv0PAcSdqbc6J5Q/p+rCQ95hLka8uTjKv0bXRGMtJc3/W
 KOmEiXGGGSA9CTJ+pt1sSRI12UfZ8XqN6+LRgPofpXN4axy1UyAbNTOGJ g==;
X-CSE-ConnectionGUID: bVruJ4WDRMK5ZgB6aLYZ9g==
X-CSE-MsgGUID: ey+Ss73iRgm2E0Ht00LPgQ==
X-IronPort-AV: E=Sophos;i="6.19,244,1754956800"; 
   d="scan'208";a="3939069"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO
 smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
 by internal-fra-out-003.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 07:09:59 +0000
Received: from EX19MTAEUC002.ant.amazon.com [54.240.197.228:28056]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.11.58:2525]
 with esmtp (Farcaster)
 id 533d5b60-49a1-492a-8ab5-004364c4dd08; Tue, 21 Oct 2025 07:09:59 +0000 (UTC)
X-Farcaster-Flow-ID: 533d5b60-49a1-492a-8ab5-004364c4dd08
Received: from EX19D013EUB004.ant.amazon.com (10.252.51.92) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Tue, 21 Oct 2025 07:09:59 +0000
Received: from dev-dsk-mngyadam-1c-cb3f7548.eu-west-1.amazon.com
 (10.253.107.175) by EX19D013EUB004.ant.amazon.com (10.252.51.92) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Tue, 21 Oct 2025
 07:09:48 +0000
To: <stable@vger.kernel.org>
Date: Tue, 21 Oct 2025 09:03:37 +0200
Message-ID: <20251021070353.96705-4-mngyadam@amazon.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251021070353.96705-2-mngyadam@amazon.de>
References: <20251021070353.96705-2-mngyadam@amazon.de>
MIME-Version: 1.0
X-Originating-IP: [10.253.107.175]
X-ClientProxiedBy: EX19D033UWA002.ant.amazon.com (10.13.139.10) To
 EX19D013EUB004.ant.amazon.com (10.252.51.92)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Christoph Hellwig <hch@lst.de> commit
 c402a9a9430b670926decbb284b756ee6f47c1ec
 upstream. Add a helper to invalidate page cache after a dio write. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vB6ko-0007WS-2o
Subject: [f2fs-dev] [PATCH 6.1 2/8] filemap: add a
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
From: Mahmoud Adam via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Mahmoud Adam <mngyadam@amazon.de>
Cc: "Darrick J. Wong" <djwong@kernel.org>, nagy@khwaternagy.com,
 linux-mm@kvack.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Christoph Hellwig <hch@lst.de>, linux-nilfs@vger.kernel.org,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos
 Szeredi <miklos@szeredi.hu>, Matthew Wilcox <willy@infradead.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, Miklos Szeredi <mszeredi@redhat.com>,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>, Theodore
 Ts'o <tytso@mit.edu>, gregkh@linuxfoundation.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, Anna
 Schumaker <anna@kernel.org>, Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

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
---
 fs/direct-io.c          | 10 ++--------
 fs/iomap/direct-io.c    | 12 ++----------
 include/linux/fs.h      |  5 -----
 include/linux/pagemap.h |  1 +
 mm/filemap.c            | 37 ++++++++++++++++++++-----------------
 5 files changed, 25 insertions(+), 40 deletions(-)

diff --git a/fs/direct-io.c b/fs/direct-io.c
index 03d381377ae10a..514042f12aea76 100644
--- a/fs/direct-io.c
+++ b/fs/direct-io.c
@@ -286,14 +286,8 @@ static ssize_t dio_complete(struct dio *dio, ssize_t ret, unsigned int flags)
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
index 105c4a1d20a20b..9acfc9e847cdcb 100644
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
 	if (ret > 0) {
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 48758ab2910087..4e8a3e4f894c0f 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3371,11 +3371,6 @@ static inline void inode_dio_end(struct inode *inode)
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
index bb462e5a91e28d..dfaa0990186716 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -31,6 +31,7 @@ int invalidate_inode_pages2(struct address_space *mapping);
 int invalidate_inode_pages2_range(struct address_space *mapping,
 		pgoff_t start, pgoff_t end);
 int kiocb_invalidate_pages(struct kiocb *iocb, size_t count);
+void kiocb_invalidate_post_direct_write(struct kiocb *iocb, size_t count);
 int write_inode_now(struct inode *, int sync);
 int filemap_fdatawrite(struct address_space *);
 int filemap_flush(struct address_space *);
diff --git a/mm/filemap.c b/mm/filemap.c
index 0923b8df285886..39484af4300e3c 100644
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
@@ -3750,19 +3750,23 @@ void dio_warn_stale_pagecache(struct file *filp)
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
@@ -3772,7 +3776,7 @@ generic_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
 	if (written) {
 		if (written == -EBUSY)
 			return 0;
-		goto out;
+		return written;
 	}
 
 	written = mapping->a_ops->direct_IO(iocb, from);
@@ -3794,11 +3798,11 @@ generic_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
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
@@ -3809,7 +3813,6 @@ generic_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
 	}
 	if (written != -EIOCBQUEUED)
 		iov_iter_revert(from, write_len - iov_iter_count(from));
-out:
 	return written;
 }
 EXPORT_SYMBOL(generic_file_direct_write);
-- 
2.47.3




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christian Schlaeger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
