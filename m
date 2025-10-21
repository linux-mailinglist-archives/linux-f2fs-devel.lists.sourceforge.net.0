Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E50BF4F47
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Oct 2025 09:27:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyIPEfz+lgtaPgJUsEvPWstydGOpjW85Ov8bjKNyS44=; b=iB0eHh/kGFznONzjELemuDPnxQ
	xHfOQ6fpGEImOjMWtwrJNkVoFLEgxpj2S2nJTHp8KRdEj+SpyXFqGTFVD8tEbXjiLby81NGlzzIFt
	W6SJtS976V8dLGyIkxlyuz2Mam6ZTetwn/E7Dse+g2nX6aajzyuGdeY59xfe+6uMs3Dw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vB6m3-0008At-Te;
	Tue, 21 Oct 2025 07:27:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=382e81130=mngyadam@amazon.de>)
 id 1vB6m2-0008Ak-HL for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 07:27:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EWT2gm3mr1yTWppm7hvARyuErTtEe+bWsoFO42B5tnI=; b=PvhWc5QyB6efgJdKFY9Ubj/ehn
 N9geMCYRwWSs48izalyK5NYqMTDK9h9ELCuphcI7i10ER2PzlW7/HYk07peJ2v6Na1xbEDbgINitE
 0HIAhudv+aSDPpwyGQiuqSNW26P0FFwbyOJnlzam19d5iPIN6Xy2GNNvMycxFm+HVrwQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EWT2gm3mr1yTWppm7hvARyuErTtEe+bWsoFO42B5tnI=; b=nCs5vYkYgchInEGPLGfnG1TuU4
 kwMksfgGC0CJhaO1hswj8cVWlZmnXl3rbEAqMNZFDW9DrU/MYPRbWDRuw+m+iqrMR7Ac4WsQKQp/j
 cks94fFqJDIynjxtAHnU0dpLpRt3PzN1tWkhZmoHkzM+lQ/V3qDvGPec+bqXuB9RJd8A=;
Received: from fra-out-001.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 ([18.156.205.64]) by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vB6m1-0007aa-DU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 07:27:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
 t=1761031633; x=1792567633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EWT2gm3mr1yTWppm7hvARyuErTtEe+bWsoFO42B5tnI=;
 b=mcxZYhR32AS4NuLuE/knKVd086Pwmvras3CMorXpvagLMzdavC/Oigj7
 Ls8xlriGP7oBLQilWv9Vzf+IQwcAsRVmz4YTbQR2tYtjTpDRMO6LD6ueh
 0ctBY5XVgHvrj0n0kzyELT3+fl1zQ3DcZWO0i5Iu4aqvZ+qbW3kB1kC4F
 wpAAHrF3xOvp0aEd7HQEvqaV1Rkk7UEjzV8jQu+fT1qeZ454mjdj7OTlY
 4xQFteIPx/OhN2xVfzx10QdNlpps3/LVL/90hm5JBAPy965LBV/kyA8Gp
 Vvxp5F8jdcNjiTpHHi+pWp4p/oJxKYYWnlV92RDbG62d3oWhw5mZCj1BG g==;
X-CSE-ConnectionGUID: DKfSEOkqQQKB8ERoq7WY2A==
X-CSE-MsgGUID: DEt+B/AnQgG5Vzyn9KIMpA==
X-IronPort-AV: E=Sophos;i="6.19,244,1754956800"; 
   d="scan'208";a="3933276"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO
 smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
 by internal-fra-out-001.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 07:10:59 +0000
Received: from EX19MTAEUC002.ant.amazon.com [54.240.197.228:11521]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.29.7:2525]
 with esmtp (Farcaster)
 id 72943488-d8d8-46a1-a014-aaf1f5c61ddd; Tue, 21 Oct 2025 07:10:59 +0000 (UTC)
X-Farcaster-Flow-ID: 72943488-d8d8-46a1-a014-aaf1f5c61ddd
Received: from EX19D013EUB004.ant.amazon.com (10.252.51.92) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Tue, 21 Oct 2025 07:10:59 +0000
Received: from dev-dsk-mngyadam-1c-cb3f7548.eu-west-1.amazon.com
 (10.253.107.175) by EX19D013EUB004.ant.amazon.com (10.252.51.92) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Tue, 21 Oct 2025
 07:10:48 +0000
To: <stable@vger.kernel.org>
Date: Tue, 21 Oct 2025 09:03:39 +0200
Message-ID: <20251021070353.96705-6-mngyadam@amazon.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251021070353.96705-2-mngyadam@amazon.de>
References: <20251021070353.96705-2-mngyadam@amazon.de>
MIME-Version: 1.0
X-Originating-IP: [10.253.107.175]
X-ClientProxiedBy: EX19D038UWB002.ant.amazon.com (10.13.139.185) To
 EX19D013EUB004.ant.amazon.com (10.252.51.92)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Christoph Hellwig <hch@lst.de> commit
 44fff0fa08ec5a6d9d5fb05443a36d854d0ece4d
 upstream. Add a helper dealing with handling the syncing of a buffered write
 fallback for direct I/O. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vB6m1-0007aa-DU
Subject: [f2fs-dev] [PATCH 6.1 4/8] fs: factor out a direct_write_fallback
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
From: Mahmoud Adam via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Mahmoud Adam <mngyadam@amazon.de>
Cc: "Darrick J. Wong" <djwong@kernel.org>, nagy@khwaternagy.com,
 linux-mm@kvack.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Christoph Hellwig <hch@lst.de>, linux-nilfs@vger.kernel.org,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Matthew
 Wilcox <willy@infradead.org>, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, Miklos Szeredi <mszeredi@redhat.com>,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
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
 Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Christoph Hellwig <hch@lst.de>

commit 44fff0fa08ec5a6d9d5fb05443a36d854d0ece4d upstream.

Add a helper dealing with handling the syncing of a buffered write
fallback for direct I/O.

Link: https://lkml.kernel.org/r/20230601145904.1385409-10-hch@lst.de
Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Miklos Szeredi <mszeredi@redhat.com>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: Anna Schumaker <anna@kernel.org>
Cc: Chao Yu <chao@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Hannes Reinecke <hare@suse.de>
Cc: Ilya Dryomov <idryomov@gmail.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Miklos Szeredi <miklos@szeredi.hu>
Cc: Theodore Ts'o <tytso@mit.edu>
Cc: Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: Xiubo Li <xiubli@redhat.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
[backing_dev_info still being used here. do small changes to the patch
to keep the out label. Which means replacing all returns to goto out.]
Signed-off-by: Mahmoud Adam <mngyadam@amazon.de>
---
 fs/libfs.c         | 41 +++++++++++++++++++++++++++++++
 include/linux/fs.h |  2 ++
 mm/filemap.c       | 61 +++++++++++-----------------------------------
 3 files changed, 57 insertions(+), 47 deletions(-)

diff --git a/fs/libfs.c b/fs/libfs.c
index cbd42d76fbd018..a5bbe8e31d6616 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1582,3 +1582,44 @@ bool inode_maybe_inc_iversion(struct inode *inode, bool force)
 	return true;
 }
 EXPORT_SYMBOL(inode_maybe_inc_iversion);
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
index 4e8a3e4f894c0f..02c83cd07d4f20 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3278,6 +3278,8 @@ extern ssize_t __generic_file_write_iter(struct kiocb *, struct iov_iter *);
 extern ssize_t generic_file_write_iter(struct kiocb *, struct iov_iter *);
 extern ssize_t generic_file_direct_write(struct kiocb *, struct iov_iter *);
 ssize_t generic_perform_write(struct kiocb *, struct iov_iter *);
+ssize_t direct_write_fallback(struct kiocb *iocb, struct iov_iter *iter,
+		ssize_t direct_written, ssize_t buffered_written);
 
 ssize_t vfs_iter_read(struct file *file, struct iov_iter *iter, loff_t *ppos,
 		rwf_t flags);
diff --git a/mm/filemap.c b/mm/filemap.c
index e2045266d2f2c9..b77f534dfad35a 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3923,25 +3923,21 @@ ssize_t __generic_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 {
 	struct file *file = iocb->ki_filp;
 	struct address_space *mapping = file->f_mapping;
-	struct inode 	*inode = mapping->host;
-	ssize_t		written = 0;
-	ssize_t		err;
-	ssize_t		status;
+	struct inode *inode = mapping->host;
+	ssize_t ret;
 
 	/* We can write back this queue in page reclaim */
 	current->backing_dev_info = inode_to_bdi(inode);
-	err = file_remove_privs(file);
-	if (err)
+	ret = file_remove_privs(file);
+	if (ret)
 		goto out;
 
-	err = file_update_time(file);
-	if (err)
+	ret = file_update_time(file);
+	if (ret)
 		goto out;
 
 	if (iocb->ki_flags & IOCB_DIRECT) {
-		loff_t pos, endbyte;
-
-		written = generic_file_direct_write(iocb, from);
+		ret = generic_file_direct_write(iocb, from);
 		/*
 		 * If the write stopped short of completing, fall back to
 		 * buffered writes.  Some filesystems do this for writes to
@@ -3949,46 +3945,17 @@ ssize_t __generic_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		 * not succeed (even if it did, DAX does not handle dirty
 		 * page-cache pages correctly).
 		 */
-		if (written < 0 || !iov_iter_count(from) || IS_DAX(inode))
+		if (ret < 0 || !iov_iter_count(from) || IS_DAX(inode))
 			goto out;
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
+		ret = direct_write_fallback(iocb, from, ret,
+				generic_perform_write(iocb, from));
+		goto out;
 	}
+
+	ret = generic_perform_write(iocb, from);
 out:
 	current->backing_dev_info = NULL;
-	return written ? written : err;
+	return ret;
 }
 EXPORT_SYMBOL(__generic_file_write_iter);
 
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
