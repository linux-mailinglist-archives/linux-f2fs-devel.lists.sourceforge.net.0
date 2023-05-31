Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B226E7178CC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 May 2023 09:51:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4Gbu-0003yo-6m;
	Wed, 31 May 2023 07:51:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+b81a8c9a6d22e8bb2302+7220+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1q4Gbp-0003yB-K2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 07:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=11fdSgTG4jIa+lyPH9HFZjOssjJQOFkzGuhPffE88Ak=; b=XS03/j2tcuAClyol1fYI/9KYJ+
 /Gl7tyl7KAngFgnRKEi5d5EKA1zI+ybQwnnMdZhfNsgVNs+O/Her0pqhyQIpfIgXLw/LudWWFXagL
 pVmb1jtPS8SqaKGETwyVwVS+KbAx8lHZ3bse0DHvILChfaAq5BudqkuwKItALg/TI0Aw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=11fdSgTG4jIa+lyPH9HFZjOssjJQOFkzGuhPffE88Ak=; b=XCrfAMSIw87ecIm0YPkz0FlXDu
 SbPNwOwOQttJuGKuJwrRGCSg/nc2gAK4ONa+Gx5XvTcgUjgkfqacloDhxIldvoGBjZHu8ohJHO56S
 CMFakbB0Wnv4WZFaPINaxzlVoJTBetYYdjtwaNEN3QXNEfmwH+o0eBW9oZTnDcyOYt4o=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4Gbp-007Ejs-B4 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 07:51:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=11fdSgTG4jIa+lyPH9HFZjOssjJQOFkzGuhPffE88Ak=; b=N1IkSc/F+8A4KQZ69jwKm+YdVJ
 ttzm96cZrwRIglbmBQ7IM5r/NkpF04kG82W7HAoa2XeT3JqbLH9NHTWBanjy9ttbehUxPmZv1ziAa
 ZPjwzx263cmBsH2k08HRlZqhWrrJEQTRDLSj81pBtTdaeRZiQwJuIF1V7Pjb70zz1bLEwjIef8fS0
 ejj0atwMoeXbA3dxf6snc8QgefUF7DakmT61oqvfsJn+DYJ3h5KFnE4H7KYgfmLDNYjp6DkzRQY0J
 4VgxKppjSfcbo3TDcefjJe52TouvoD56hyuShTmjKbP30TJToxprGqjLVwDlsUJmVLEsYAiJvNStV
 1fwL7WUA==;
Received: from [2001:4bb8:182:6d06:f5c3:53d7:b5aa:b6a7] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q4Gbc-00GVv5-2z; Wed, 31 May 2023 07:50:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Date: Wed, 31 May 2023 09:50:23 +0200
Message-Id: <20230531075026.480237-10-hch@lst.de>
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
 Content preview: Add a helper dealing with handling the syncing of a buffered
 write fallback for direct I/O. Signed-off-by: Christoph Hellwig <hch@lst.de>
 --- fs/libfs.c | 41 ++++++++++++++++++++++++++++ include/linux/fs.h | 2 ++
 mm/filemap.c | 66 +++++++++++ 3 files change [...] 
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
X-Headers-End: 1q4Gbp-007Ejs-B4
Subject: [f2fs-dev] [PATCH 09/12] fs: factor out a direct_write_fallback
 helper
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

Add a helper dealing with handling the syncing of a buffered write fallback
for direct I/O.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/libfs.c         | 41 ++++++++++++++++++++++++++++
 include/linux/fs.h |  2 ++
 mm/filemap.c       | 66 +++++++++++-----------------------------------
 3 files changed, 58 insertions(+), 51 deletions(-)

diff --git a/fs/libfs.c b/fs/libfs.c
index 89cf614a327158..5b851315eeed03 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1613,3 +1613,44 @@ u64 inode_query_iversion(struct inode *inode)
 	return cur >> I_VERSION_QUERIED_SHIFT;
 }
 EXPORT_SYMBOL(inode_query_iversion);
+
+ssize_t direct_write_fallback(struct kiocb *iocb, struct iov_iter *iter,
+		ssize_t direct_written, ssize_t buffered_written)
+{
+	struct address_space *mapping = iocb->ki_filp->f_mapping;
+	loff_t pos = iocb->ki_pos - buffered_written;
+	loff_t end = iocb->ki_pos - 1;
+	int err;
+
+	/*
+	 * If the buffered write fallback returned an error, we want to return
+	 * the number of bytes which were written by direct I/O, or the error
+	 * code if that was zero.
+	 *
+	 * Note that this differs from normal direct-io semantics, which will
+	 * return -EFOO even if some bytes were written.
+	 */
+	if (unlikely(buffered_written < 0)) {
+		if (direct_written)
+			return direct_written;
+		return buffered_written;
+	}
+
+	/*
+	 * We need to ensure that the page cache pages are written to disk and
+	 * invalidated to preserve the expected O_DIRECT semantics.
+	 */
+	err = filemap_write_and_wait_range(mapping, pos, end);
+	if (err < 0) {
+		/*
+		 * We don't know how much we wrote, so just return the number of
+		 * bytes which were direct-written
+		 */
+		if (direct_written)
+			return direct_written;
+		return err;
+	}
+	invalidate_mapping_pages(mapping, pos >> PAGE_SHIFT, end >> PAGE_SHIFT);
+	return direct_written + buffered_written;
+}
+EXPORT_SYMBOL_GPL(direct_write_fallback);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 91021b4e1f6f48..6af25137543824 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2738,6 +2738,8 @@ extern ssize_t __generic_file_write_iter(struct kiocb *, struct iov_iter *);
 extern ssize_t generic_file_write_iter(struct kiocb *, struct iov_iter *);
 extern ssize_t generic_file_direct_write(struct kiocb *, struct iov_iter *);
 ssize_t generic_perform_write(struct kiocb *, struct iov_iter *);
+ssize_t direct_write_fallback(struct kiocb *iocb, struct iov_iter *iter,
+		ssize_t direct_written, ssize_t buffered_written);
 
 ssize_t vfs_iter_read(struct file *file, struct iov_iter *iter, loff_t *ppos,
 		rwf_t flags);
diff --git a/mm/filemap.c b/mm/filemap.c
index ddb6f8aa86d6ca..137508da5525b6 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -4006,23 +4006,19 @@ ssize_t __generic_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 {
 	struct file *file = iocb->ki_filp;
 	struct address_space *mapping = file->f_mapping;
-	struct inode 	*inode = mapping->host;
-	ssize_t		written = 0;
-	ssize_t		err;
-	ssize_t		status;
+	struct inode *inode = mapping->host;
+	ssize_t ret;
 
-	err = file_remove_privs(file);
-	if (err)
-		goto out;
+	ret = file_remove_privs(file);
+	if (ret)
+		return ret;
 
-	err = file_update_time(file);
-	if (err)
-		goto out;
+	ret = file_update_time(file);
+	if (ret)
+		return ret;
 
 	if (iocb->ki_flags & IOCB_DIRECT) {
-		loff_t pos, endbyte;
-
-		written = generic_file_direct_write(iocb, from);
+		ret = generic_file_direct_write(iocb, from);
 		/*
 		 * If the write stopped short of completing, fall back to
 		 * buffered writes.  Some filesystems do this for writes to
@@ -4030,45 +4026,13 @@ ssize_t __generic_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		 * not succeed (even if it did, DAX does not handle dirty
 		 * page-cache pages correctly).
 		 */
-		if (written < 0 || !iov_iter_count(from) || IS_DAX(inode))
-			goto out;
-
-		pos = iocb->ki_pos;
-		status = generic_perform_write(iocb, from);
-		/*
-		 * If generic_perform_write() returned a synchronous error
-		 * then we want to return the number of bytes which were
-		 * direct-written, or the error code if that was zero.  Note
-		 * that this differs from normal direct-io semantics, which
-		 * will return -EFOO even if some bytes were written.
-		 */
-		if (unlikely(status < 0)) {
-			err = status;
-			goto out;
-		}
-		/*
-		 * We need to ensure that the page cache pages are written to
-		 * disk and invalidated to preserve the expected O_DIRECT
-		 * semantics.
-		 */
-		endbyte = pos + status - 1;
-		err = filemap_write_and_wait_range(mapping, pos, endbyte);
-		if (err == 0) {
-			written += status;
-			invalidate_mapping_pages(mapping,
-						 pos >> PAGE_SHIFT,
-						 endbyte >> PAGE_SHIFT);
-		} else {
-			/*
-			 * We don't know how much we wrote, so just return
-			 * the number of bytes which were direct-written
-			 */
-		}
-	} else {
-		written = generic_perform_write(iocb, from);
+		if (ret < 0 || !iov_iter_count(from) || IS_DAX(inode))
+			return ret;
+		return direct_write_fallback(iocb, from, ret,
+				generic_perform_write(iocb, from));
 	}
-out:
-	return written ? written : err;
+
+	return generic_perform_write(iocb, from);
 }
 EXPORT_SYMBOL(__generic_file_write_iter);
 
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
