Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C93709352
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 May 2023 11:35:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pzwWc-0004wv-Qg;
	Fri, 19 May 2023 09:35:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+aecf67361b95543ec79f+7208+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pzwWb-0004wj-He for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 May 2023 09:35:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6ol1bWODvCYTDT1JUgKKn9Fh7sNo8e9dyRg15aWfO9s=; b=E/53Q9Km3Gz5e/MZOL7sD7r8lD
 8Z3cS3r+P/KGr5PvIjrtAYamuqVqiy/7k9sr/pyJT2hj3Xf5QBQwBofvCqNznzzCaHljQo/lu9y7c
 SWDbFeVTQulZ/c48UUCAJkefI9cZ3LICZRc0PGu0FsCyMtMlIzJQr5RVbBiF3LmFy1dM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6ol1bWODvCYTDT1JUgKKn9Fh7sNo8e9dyRg15aWfO9s=; b=dpZKP13ITRCNvKKOU+mzca+Ur4
 KB4pfWn/CGjU7YjX6UJ421Ys8uCc2NMmWeqvmN1DdnZoWfhKMatzb9D6UzwKKvZRcHCbts5xwkOj/
 oloa5vB4TN3TvdAw02DjEO+g0IW4kr5YeH7AJLWOlB6MkdslfkFkaAiE1oHjJGpZVho8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pzwWb-00DDLW-3u for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 May 2023 09:35:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=6ol1bWODvCYTDT1JUgKKn9Fh7sNo8e9dyRg15aWfO9s=; b=M6KzmetzkAeuS/VLc0Lh9JjJju
 Ru7ZWS27kADd2VtwycBozYnipzuMCirIKKvprX9mPjk8FvigFdIjN4M/xtUGuo008+0WHzo3WfJO3
 EWdbDmUJHxpyHqFvevzzdoF8sY4ioA/FmCmhyHPkTSVBFbLUMUzg40a4nDIY0CgVciRjpOyZAAYL6
 xkhg/yyrk3LagyAARJhct/1trEUwML73oIOqKl2Q1BZS5BLz1DLbgF0IsqLaC9nklXzoY22/+vvE8
 6CgJvHjCSdFdTeTp+UnCpdHK3HMDcG/2uwD5g8SjDrtquin8RrPGVFwqC+Dwf8e+kLQB4xAFRANP0
 98GWXd4g==;
Received: from [2001:4bb8:188:3dd5:e8d0:68bb:e5be:210a] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pzwWL-00FjdO-2V; Fri, 19 May 2023 09:35:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Date: Fri, 19 May 2023 11:35:11 +0200
Message-Id: <20230519093521.133226-4-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519093521.133226-1-hch@lst.de>
References: <20230519093521.133226-1-hch@lst.de>
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
 Content preview:  Move the assignment to current->backing_dev_info from the
 callers into generic_perform_write to reduce boiler plate code and reduce
 the scope to just around the page dirtying loop. Signed-off-by: Christoph
 Hellwig <hch@lst.de> --- fs/ceph/file.c | 4 ---- fs/ext4/file.c | 3 ---
 fs/f2fs/file.c
 | 2 -- fs/nfs/file.c | 5 +---- mm/filemap.c | 2 ++ 5 files changed,
 3 insertions(+), 13 [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pzwWb-00DDLW-3u
Subject: [f2fs-dev] [PATCH 03/13] filemap: assign current->backing_dev_info
 in generic_perform_write
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
 Theodore Ts'o <tytso@mit.edu>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Move the assignment to current->backing_dev_info from the callers into
generic_perform_write to reduce boiler plate code and reduce the scope
to just around the page dirtying loop.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ceph/file.c | 4 ----
 fs/ext4/file.c | 3 ---
 fs/f2fs/file.c | 2 --
 fs/nfs/file.c  | 5 +----
 mm/filemap.c   | 2 ++
 5 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/fs/ceph/file.c b/fs/ceph/file.c
index feeb9882ef635a..767f4dfe7def64 100644
--- a/fs/ceph/file.c
+++ b/fs/ceph/file.c
@@ -1791,9 +1791,6 @@ static ssize_t ceph_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	else
 		ceph_start_io_write(inode);
 
-	/* We can write back this queue in page reclaim */
-	current->backing_dev_info = inode_to_bdi(inode);
-
 	if (iocb->ki_flags & IOCB_APPEND) {
 		err = ceph_do_getattr(inode, CEPH_STAT_CAP_SIZE, false);
 		if (err < 0)
@@ -1938,7 +1935,6 @@ static ssize_t ceph_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		ceph_end_io_write(inode);
 out_unlocked:
 	ceph_free_cap_flush(prealloc_cf);
-	current->backing_dev_info = NULL;
 	return written ? written : err;
 }
 
diff --git a/fs/ext4/file.c b/fs/ext4/file.c
index 50824831d31def..3cb83a3e2e4a2a 100644
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@ -29,7 +29,6 @@
 #include <linux/pagevec.h>
 #include <linux/uio.h>
 #include <linux/mman.h>
-#include <linux/backing-dev.h>
 #include "ext4.h"
 #include "ext4_jbd2.h"
 #include "xattr.h"
@@ -285,9 +284,7 @@ static ssize_t ext4_buffered_write_iter(struct kiocb *iocb,
 	if (ret <= 0)
 		goto out;
 
-	current->backing_dev_info = inode_to_bdi(inode);
 	ret = generic_perform_write(iocb, from);
-	current->backing_dev_info = NULL;
 
 out:
 	inode_unlock(inode);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 9e3855e43a7a63..7134fe8bd008cb 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4517,9 +4517,7 @@ static ssize_t f2fs_buffered_write_iter(struct kiocb *iocb,
 	if (iocb->ki_flags & IOCB_NOWAIT)
 		return -EOPNOTSUPP;
 
-	current->backing_dev_info = inode_to_bdi(inode);
 	ret = generic_perform_write(iocb, from);
-	current->backing_dev_info = NULL;
 
 	if (ret > 0) {
 		f2fs_update_iostat(F2FS_I_SB(inode), inode,
diff --git a/fs/nfs/file.c b/fs/nfs/file.c
index 3cc87ae8473356..e8bb4c48a3210a 100644
--- a/fs/nfs/file.c
+++ b/fs/nfs/file.c
@@ -648,11 +648,8 @@ ssize_t nfs_file_write(struct kiocb *iocb, struct iov_iter *from)
 	since = filemap_sample_wb_err(file->f_mapping);
 	nfs_start_io_write(inode);
 	result = generic_write_checks(iocb, from);
-	if (result > 0) {
-		current->backing_dev_info = inode_to_bdi(inode);
+	if (result > 0)
 		result = generic_perform_write(iocb, from);
-		current->backing_dev_info = NULL;
-	}
 	nfs_end_io_write(inode);
 	if (result <= 0)
 		goto out;
diff --git a/mm/filemap.c b/mm/filemap.c
index 4d0ec2fa1c7070..bf693ad1da1ece 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3892,6 +3892,7 @@ ssize_t generic_perform_write(struct kiocb *iocb, struct iov_iter *i)
 	long status = 0;
 	ssize_t written = 0;
 
+	current->backing_dev_info = inode_to_bdi(mapping->host);
 	do {
 		struct page *page;
 		unsigned long offset;	/* Offset into pagecache page */
@@ -3956,6 +3957,7 @@ ssize_t generic_perform_write(struct kiocb *iocb, struct iov_iter *i)
 
 		balance_dirty_pages_ratelimited(mapping);
 	} while (iov_iter_count(i));
+	current->backing_dev_info = NULL;
 
 	if (!written)
 		return status;
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
