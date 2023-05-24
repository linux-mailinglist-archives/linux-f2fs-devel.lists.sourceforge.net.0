Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B796370EE2A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 May 2023 08:39:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q1i9Q-00039D-Ad;
	Wed, 24 May 2023 06:39:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+8349dc162fb675e8d54f+7213+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1q1i9J-000396-QO for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 May 2023 06:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5bzp/0by06gXMZwpvo50hn7+jgjD2rUy1lubnHgSTkM=; b=ikY69/lA83yaHvva/u6gKLFEZj
 N3kDsCZs06Awiu2TDLe1rN6d4AM8hD3PElddgpsXmK7KZBy4z+uffJyGmd20WSz58z71w2YQwczvJ
 kDwW7vdsEMo8s42TcglR/6dZECcosyg++SmsO0SVsBk4dm4SuyAN/To3YhRH9VkefFaw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5bzp/0by06gXMZwpvo50hn7+jgjD2rUy1lubnHgSTkM=; b=By4KdHfkXh+D04eq42z7WNiSzS
 g9H9KeNtO2ZOCpEZ0uS0a/b6ZizgBSvd2SLJ0/8rDk4gkOSdfRyyUKPM9ZSxXLXMh7POKEX1bOpOq
 42Xa7cSMjPaswzT5jP+GwhkXQfa8WLytxJdiyrJHpc1KAcMW80qTQgXf/nSR0W2UUYco=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q1i99-0017r0-KB for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 May 2023 06:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=5bzp/0by06gXMZwpvo50hn7+jgjD2rUy1lubnHgSTkM=; b=dZJR1oP4oAplc7LAjvEqiOhesB
 j7mrqWb9DWAuwPSwrRP2EQ4KmmmV/xPU693vKh+gRgrPd4FlnzipdL0Tf3RnH8pWT04fo2OrOt/MX
 N1AnYXpvNNNDzD80MVj5+yqF0hc7fZtkFgL7ZOqnTIPICju9QtDmjIBAK2jbAVsb+3FH+XPugCtsf
 x8MO+Ly2fr6FyFgNfot7iOnrIBg3YP7NDK2ldi9YCmXeaf0hzldjZA0PlqFpHHlViiNiMN3NJ3PDd
 FeEiw0uOKKPmsMpwvOBJX0eYgoM6ge9MKvyHE60E5CTNznh6tpfnhAAxqy0uCep+knDMbYOYuRMev
 QNE8HMIw==;
Received: from [2001:4bb8:188:23b2:cbb8:fcea:a637:5089] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q1i8n-00CVgm-2V; Wed, 24 May 2023 06:38:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Date: Wed, 24 May 2023 08:38:06 +0200
Message-Id: <20230524063810.1595778-8-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230524063810.1595778-1-hch@lst.de>
References: <20230524063810.1595778-1-hch@lst.de>
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
 Content preview: All callers of iomap_file_buffered_write need to updated
 ki_pos, 
 move it into common code. Signed-off-by: Christoph Hellwig <hch@lst.de>
 Acked-by:
 Damien Le Moal <dlemoal@kernel.org> Reviewed-by: Darrick J. Wong
 <djwong@kernel.org>
 --- fs/gfs2/file.c | 4 +--- fs/iomap/buffered-io.c | 9 ++++ [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q1i99-0017r0-KB
Subject: [f2fs-dev] [PATCH 07/11] iomap: update ki_pos in
 iomap_file_buffered_write
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

All callers of iomap_file_buffered_write need to updated ki_pos, move it
into common code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/gfs2/file.c         | 4 +---
 fs/iomap/buffered-io.c | 9 ++++++---
 fs/xfs/xfs_file.c      | 2 --
 fs/zonefs/file.c       | 4 +---
 4 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 904a0d6ac1a1a9..c6a7555d5ad8bb 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -1044,10 +1044,8 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
 	pagefault_disable();
 	ret = iomap_file_buffered_write(iocb, from, &gfs2_iomap_ops);
 	pagefault_enable();
-	if (ret > 0) {
-		iocb->ki_pos += ret;
+	if (ret > 0)
 		written += ret;
-	}
 
 	if (inode == sdp->sd_rindex)
 		gfs2_glock_dq_uninit(statfs_gh);
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 063133ec77f49e..550525a525c45c 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -864,16 +864,19 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
 		.len		= iov_iter_count(i),
 		.flags		= IOMAP_WRITE,
 	};
-	int ret;
+	ssize_t ret;
 
 	if (iocb->ki_flags & IOCB_NOWAIT)
 		iter.flags |= IOMAP_NOWAIT;
 
 	while ((ret = iomap_iter(&iter, ops)) > 0)
 		iter.processed = iomap_write_iter(&iter, i);
-	if (iter.pos == iocb->ki_pos)
+
+	if (unlikely(ret < 0))
 		return ret;
-	return iter.pos - iocb->ki_pos;
+	ret = iter.pos - iocb->ki_pos;
+	iocb->ki_pos += ret;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(iomap_file_buffered_write);
 
diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 431c3fd0e2b598..d57443db633637 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -720,8 +720,6 @@ xfs_file_buffered_write(
 	trace_xfs_file_buffered_write(iocb, from);
 	ret = iomap_file_buffered_write(iocb, from,
 			&xfs_buffered_write_iomap_ops);
-	if (likely(ret >= 0))
-		iocb->ki_pos += ret;
 
 	/*
 	 * If we hit a space limit, try to free up some lingering preallocated
diff --git a/fs/zonefs/file.c b/fs/zonefs/file.c
index 132f01d3461f14..e212d0636f848e 100644
--- a/fs/zonefs/file.c
+++ b/fs/zonefs/file.c
@@ -643,9 +643,7 @@ static ssize_t zonefs_file_buffered_write(struct kiocb *iocb,
 		goto inode_unlock;
 
 	ret = iomap_file_buffered_write(iocb, from, &zonefs_write_iomap_ops);
-	if (ret > 0)
-		iocb->ki_pos += ret;
-	else if (ret == -EIO)
+	if (ret == -EIO)
 		zonefs_io_error(inode, true);
 
 inode_unlock:
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
