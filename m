Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCB171A15D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jun 2023 17:00:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4jmn-0000HJ-O6;
	Thu, 01 Jun 2023 15:00:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+afcc791b37732e68e234+7221+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1q4jmF-0000Fc-Ss for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 14:59:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jbawnL+VYgZ1jYvLS7+9Ak42xWEPxAzs6GdcaAHW+Oo=; b=TBxrTRmw/3anSZWEPUsm9MEsO3
 huVqmYegY+fTFzGdAulQKSrF3k4v5SR99csV1dRWvd0RKNUcvzne3Eogde5zXOihEX0sYZInArVLA
 qKOo7GPwhkzBF5m1rBUYf/efM7t63FoQOgttm8Wwof4ND+qApgbHD47IVoeVoxXgxMgI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jbawnL+VYgZ1jYvLS7+9Ak42xWEPxAzs6GdcaAHW+Oo=; b=bNo7lkxaxPWpJGX3tDHhQgR9Lo
 nUWbOTET4nzaJd9eTaw/gf5XEW9B3jB/VessckelBfw3EOMtDfyBXax4m+41DzREvQFqEKBnrr259
 WyCZe2FaxSuo1Q/0Zk+OUtPv6051ZNNC5dpqtfJ21jNgLVyEhi5AoJar3PjCXQ8s+DyA=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4jmF-008SbB-Le for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 14:59:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=jbawnL+VYgZ1jYvLS7+9Ak42xWEPxAzs6GdcaAHW+Oo=; b=0BZzDPQ3/KufSUYyqGTALVJA2V
 F7rv14JM9wX0qT8r5amOenHBslv0fjcETpIu5tvR40H/oYXVXidoSXDEbUvv9yTTG2qe0Lf+Igy7f
 HD+JtG3isRXHu4DvwfnZsrKWS8xkVNLclC+yJ43H3SkOeA/QJSxsakoIaCP6h6L6lmtCnfzAIfo7q
 MSO/ZPrtPMcjfZTPmxCzu/7I3PuOlM3n9LEE6FniefdTtSWX2ump09XcCxnRMybWJBzYt0/AYJ/2w
 m+Nlo/Ah6heNGpn8kfdDCl3F6mewWlkTXMkW5it58UvPobqa7rsTZLZUws0CgGANnwpnXbwtLISqT
 v8s7ZO7A==;
Received: from [2001:4bb8:182:6d06:eacb:c751:971:73eb] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q4jm0-003w9a-1C; Thu, 01 Jun 2023 14:59:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Date: Thu,  1 Jun 2023 16:59:02 +0200
Message-Id: <20230601145904.1385409-11-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230601145904.1385409-1-hch@lst.de>
References: <20230601145904.1385409-1-hch@lst.de>
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
 Content preview:  Both callers of fuse_perform_write need to updated ki_pos,
 move it into common code. Signed-off-by: Christoph Hellwig <hch@lst.de>
 Reviewed-by:
 Damien Le Moal <dlemoal@kernel.org> --- fs/fuse/file.c | 20 ++++++++++ 1
 file changed, 10 insertions(+), 10 deletions(-) 
 Content analysis details:   (-2.1 points, 6.0 required)
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
X-Headers-End: 1q4jmF-008SbB-Le
Subject: [f2fs-dev] [PATCH 10/12] fuse: update ki_pos in fuse_perform_write
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

Both callers of fuse_perform_write need to updated ki_pos, move it into
common code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 fs/fuse/file.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 97d435874b14aa..d5902506cdcc65 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1329,7 +1329,10 @@ static ssize_t fuse_perform_write(struct kiocb *iocb,
 	fuse_write_update_attr(inode, pos, res);
 	clear_bit(FUSE_I_SIZE_UNSTABLE, &fi->state);
 
-	return res > 0 ? res : err;
+	if (!res)
+		return err;
+	iocb->ki_pos += res;
+	return res;
 }
 
 static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
@@ -1341,7 +1344,6 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	struct inode *inode = mapping->host;
 	ssize_t err;
 	struct fuse_conn *fc = get_fuse_conn(inode);
-	loff_t endbyte = 0;
 
 	if (fc->writeback_cache) {
 		/* Update size (EOF optimization) and mode (SUID clearing) */
@@ -1375,19 +1377,20 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		goto out;
 
 	if (iocb->ki_flags & IOCB_DIRECT) {
-		loff_t pos = iocb->ki_pos;
+		loff_t pos, endbyte;
+
 		written = generic_file_direct_write(iocb, from);
 		if (written < 0 || !iov_iter_count(from))
 			goto out;
 
-		pos += written;
-
-		written_buffered = fuse_perform_write(iocb, mapping, from, pos);
+		written_buffered = fuse_perform_write(iocb, mapping, from,
+						      iocb->ki_pos);
 		if (written_buffered < 0) {
 			err = written_buffered;
 			goto out;
 		}
-		endbyte = pos + written_buffered - 1;
+		pos = iocb->ki_pos - written_buffered;
+		endbyte = iocb->ki_pos - 1;
 
 		err = filemap_write_and_wait_range(file->f_mapping, pos,
 						   endbyte);
@@ -1399,11 +1402,8 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
 					 endbyte >> PAGE_SHIFT);
 
 		written += written_buffered;
-		iocb->ki_pos = pos + written_buffered;
 	} else {
 		written = fuse_perform_write(iocb, mapping, from, iocb->ki_pos);
-		if (written >= 0)
-			iocb->ki_pos += written;
 	}
 out:
 	inode_unlock(inode);
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
