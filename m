Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 555996EC51D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Apr 2023 07:50:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pqp5f-0007KF-RL;
	Mon, 24 Apr 2023 05:50:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+e16e2fc4419b117693a1+7183+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pqp5c-0007K0-Vs for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 05:50:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wb6cWzDzgbU80SKdNhmkiB4WmHIQIndA+4skiI8V8fU=; b=PfBnBiv00d6yf1cyV6R3NWVhu6
 s7u5zfbjr+4vwBy4ylrvpgBRsDPKmFlrHoDiNC9WPcdrE9XCbhnaJtQBEUOt5/+Q9Wl/jabtVkmGO
 28vnLbsIA04aBi9qM/ix4+nJLsoRtFADZStCMKuacw1fvLCD6CWnjQsnphdqvzhx1PBs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wb6cWzDzgbU80SKdNhmkiB4WmHIQIndA+4skiI8V8fU=; b=nC/nrx+a0ytQ2Zd9QPFSFXSitq
 eMpk/qXiKJOA5ocAfp55FQWvQUfuJrSivfFizZi1CrxP/cW7MaMe9F5zo5V1H7JEEKQIFjTdw31jJ
 6An7dfY0Qd3JxMLZnI0W7MRWI14x4cCemsYc6GLVCjfcXM08lIwz6L7awmoGiokxSmeU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pqp5c-00HHtp-Kf for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 05:50:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=wb6cWzDzgbU80SKdNhmkiB4WmHIQIndA+4skiI8V8fU=; b=mv0e7BU3F7SMyd8eLBhwb+Y0F7
 znPgpjqXZ4HeAV1eIpqytPq1qlE2Z6ERAC05IsZSk0Xp26INJjUI7B0wTCifLQvtz95fuUly47A60
 DWBGBgzkE0tv+pfytsoMZFOSHTsPvNLSWyjGi17l7Yb0x8t1sAlp/JB/Zj5Jyyvy+kUjDkJLePVzX
 O53Ty6SpZMoCvI5Ssudo/hWbvHKIdGyYrwRfQhwnxxHPP+bP9bKhPGJlFO0HKjlrXEq6I1qQJAGLY
 nLg834BQ/F7+Z8S4FjwMYtC8lma6QFFFF2rDDnUUh4ekMBmQJzlfQAYNUFafdB3JEbmYIuoTSWGtp
 WXUoQW8A==;
Received: from [2001:4bb8:189:a74f:e8a5:5f73:6d2:23b8] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pqp5O-00FP43-21; Mon, 24 Apr 2023 05:50:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 24 Apr 2023 07:49:20 +0200
Message-Id: <20230424054926.26927-12-hch@lst.de>
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
 Content preview:  Move the assignment to current->backing_dev_info from the
 callers into iomap_file_buffered_write. Note that zonefs was missing this
 assignment before. Signed-off-by: Christoph Hellwig <hch@lst.de> ---
 fs/gfs2/file.c
 | 3 --- fs/iomap/buffered-io.c | 4 ++++ fs/xfs/xfs_file.c | 5 ----- 3 files
 changed, 4 insertions(+), 8 deletions(-) 
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
X-Headers-End: 1pqp5c-00HHtp-Kf
Subject: [f2fs-dev] [PATCH 11/17] iomap: assign current->backing_dev_info in
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

Move the assignment to current->backing_dev_info from the callers into
iomap_file_buffered_write.  Note that zonefs was missing this assignment
before.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/gfs2/file.c         | 3 ---
 fs/iomap/buffered-io.c | 4 ++++
 fs/xfs/xfs_file.c      | 5 -----
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 8c4fad359ff538..4d88c6080b3e30 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -25,7 +25,6 @@
 #include <linux/dlm.h>
 #include <linux/dlm_plock.h>
 #include <linux/delay.h>
-#include <linux/backing-dev.h>
 #include <linux/fileattr.h>
 
 #include "gfs2.h"
@@ -1041,11 +1040,9 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
 			goto out_unlock;
 	}
 
-	current->backing_dev_info = inode_to_bdi(inode);
 	pagefault_disable();
 	ret = iomap_file_buffered_write(iocb, from, &gfs2_iomap_ops);
 	pagefault_enable();
-	current->backing_dev_info = NULL;
 	if (ret > 0) {
 		iocb->ki_pos += ret;
 		written += ret;
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 2986be63d2bea6..3d5042efda202a 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2010 Red Hat, Inc.
  * Copyright (C) 2016-2019 Christoph Hellwig.
  */
+#include <linux/backing-dev.h>
 #include <linux/module.h>
 #include <linux/compiler.h>
 #include <linux/fs.h>
@@ -876,8 +877,11 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
 	if (iocb->ki_flags & IOCB_NOWAIT)
 		iter.flags |= IOMAP_NOWAIT;
 
+	current->backing_dev_info = inode_to_bdi(iter.inode);
 	while ((ret = iomap_iter(&iter, ops)) > 0)
 		iter.processed = iomap_write_iter(&iter, i);
+	current->backing_dev_info = NULL;
+
 	if (iter.pos == iocb->ki_pos)
 		return ret;
 	return iter.pos - iocb->ki_pos;
diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 705250f9f90a1b..f5442e689baf15 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -27,7 +27,6 @@
 
 #include <linux/dax.h>
 #include <linux/falloc.h>
-#include <linux/backing-dev.h>
 #include <linux/mman.h>
 #include <linux/fadvise.h>
 #include <linux/mount.h>
@@ -717,9 +716,6 @@ xfs_file_buffered_write(
 	if (ret)
 		goto out;
 
-	/* We can write back this queue in page reclaim */
-	current->backing_dev_info = inode_to_bdi(inode);
-
 	trace_xfs_file_buffered_write(iocb, from);
 	ret = iomap_file_buffered_write(iocb, from,
 			&xfs_buffered_write_iomap_ops);
@@ -753,7 +749,6 @@ xfs_file_buffered_write(
 		goto write_retry;
 	}
 
-	current->backing_dev_info = NULL;
 out:
 	if (iolock)
 		xfs_iunlock(ip, iolock);
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
