Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BE07178D5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 May 2023 09:51:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4Gc3-0006Gf-4L;
	Wed, 31 May 2023 07:51:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+b81a8c9a6d22e8bb2302+7220+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1q4Gby-0006G6-CK for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 07:51:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aL4JtBxyhKSUIoIs8zshulNYsaa+7wvzZcQ7A9usZGk=; b=QVaXr6fPl6KljS56cvObQ+Ws0F
 a2VgSyfmiuryYCY69dd4z9/bNWl09pLnSvENll+FIn33xoCEaUtPIc9uChY8aSvN2BV8cqvxnSgiD
 4F2RgS+zbyTFBrJvhTX19IojoG3NweiMmSDj8+9WqcD0tvhTn5EF5WIeKP05kFBeHWOM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aL4JtBxyhKSUIoIs8zshulNYsaa+7wvzZcQ7A9usZGk=; b=UUih/UEUmyhwjKVrv8Qn9KNY4d
 7op7byWrOiwWSNKWAGXHx/IU5xm2DBRY9bb4kVMtMtNIzrH1gT3km/EuBMTl0sgk9joJpisR5TXxs
 WMh1GErsY6W8QLTaD2WIVx6UW1MTPa6D2yBITCS69rKngrQRWaLALTYutCqio+A28h6k=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4Gbx-007EkP-PO for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 07:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=aL4JtBxyhKSUIoIs8zshulNYsaa+7wvzZcQ7A9usZGk=; b=aD7gWyr8b1clmJUz0ng4wh8iN1
 2pIdPjbYXIRRh1Kmmhvr9XUZfJmEzYUSG9MpfRaqOXtpIf81N0C4KW91kRTVNx/1xjofKh6ID5fEZ
 y0kgxzCPuOAOcRvxjkI+DhSzh8PYwGOXVEdzJScdskD02HMegMKHsJzKs791UpMHizTDm3fmN//tX
 6rl5sT9sqqCp86Mfokmpj/WL2CP1OSYP66n1f8RX2gICxutiEFyhwPyN+TIwbF9/1JsQcegS+vv7u
 4nIF9K3m4qzWLhU31xzEOyoJGgpwCjxO0CBkTrYH/d1JRTGC4jWZ7AwjftTuF3pr+nYL1/XFGg0kY
 tKlqRbMg==;
Received: from [2001:4bb8:182:6d06:f5c3:53d7:b5aa:b6a7] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q4Gbi-00GW03-0R; Wed, 31 May 2023 07:50:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Date: Wed, 31 May 2023 09:50:25 +0200
Message-Id: <20230531075026.480237-12-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531075026.480237-1-hch@lst.de>
References: <20230531075026.480237-1-hch@lst.de>
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
 Content preview:  pos is always equal to iocb->ki_pos, and mapping is always
 equal to iocb->ki_filp->f_mapping. Signed-off-by: Christoph Hellwig
 <hch@lst.de>
 Reviewed-by: Damien Le Moal <dlemoal@kernel.org> Reviewed-by: Hannes Reinecke
 <hare@suse.de> Acked-by: Miklos Szeredi <mszeredi@redhat.com> --- fs/fuse/fi
 [...] Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q4Gbx-007EkP-PO
Subject: [f2fs-dev] [PATCH 11/12] fuse: drop redundant arguments to
 fuse_perform_write
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
 linux-ext4@vger.kernel.org, Miklos Szeredi <mszeredi@redhat.com>,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

pos is always equal to iocb->ki_pos, and mapping is always equal to
iocb->ki_filp->f_mapping.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Acked-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/file.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index e60e48bf392d49..025973ad813e05 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1280,13 +1280,13 @@ static inline unsigned int fuse_wr_pages(loff_t pos, size_t len,
 		     max_pages);
 }
 
-static ssize_t fuse_perform_write(struct kiocb *iocb,
-				  struct address_space *mapping,
-				  struct iov_iter *ii, loff_t pos)
+static ssize_t fuse_perform_write(struct kiocb *iocb, struct iov_iter *ii)
 {
+	struct address_space *mapping = iocb->ki_filp->f_mapping;
 	struct inode *inode = mapping->host;
 	struct fuse_conn *fc = get_fuse_conn(inode);
 	struct fuse_inode *fi = get_fuse_inode(inode);
+	loff_t pos = iocb->ki_pos;
 	int err = 0;
 	ssize_t res = 0;
 
@@ -1383,8 +1383,7 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		if (written < 0 || !iov_iter_count(from))
 			goto out;
 
-		written_buffered = fuse_perform_write(iocb, mapping, from,
-						      iocb->ki_pos);
+		written_buffered = fuse_perform_write(iocb, from);
 		if (written_buffered < 0) {
 			err = written_buffered;
 			goto out;
@@ -1403,7 +1402,7 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
 
 		written += written_buffered;
 	} else {
-		written = fuse_perform_write(iocb, mapping, from, iocb->ki_pos);
+		written = fuse_perform_write(iocb, from);
 	}
 out:
 	inode_unlock(inode);
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
