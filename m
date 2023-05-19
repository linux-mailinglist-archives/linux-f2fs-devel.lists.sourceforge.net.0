Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB3070935B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 May 2023 11:36:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pzwWr-0004ym-5E;
	Fri, 19 May 2023 09:36:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+aecf67361b95543ec79f+7208+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pzwWo-0004yD-Gw for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 May 2023 09:36:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DWCBIuCWrEPUSgFUMsFJ6qSq1T5QDjJd5vFpRCChJ1w=; b=OzxsBbhEQYPfcADgIUu012mwmq
 hI7g1NXWEzit9Sjdlgg4gaNYEDR3QduK1+SnepgntD3X+xpgqdJW4S+TUbeKMT5i/yDIXHGH7KrFj
 SzB/JRI2Ywb465w3FeVuC4IceZvGJ41PZj/62fO6CsVTg0hrCBdVS6qwKx9YNhxnt8NA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DWCBIuCWrEPUSgFUMsFJ6qSq1T5QDjJd5vFpRCChJ1w=; b=WX7mJf24jwAdnBiFSjySFFwMyE
 EQr7lziMHONhTvSfKo0xJzkguZxA2oiByzB4Kr5OMclGh0KlUXi9gudBFIHFf4OjUEPbGUKX+HQCO
 UX8r0E17GrRK9bcmb70gvB0xVS5McEdBxAc9i8fg0uY9zd+2u3Ri/7uSbRgZB8/RmlXU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pzwWo-0007Rp-9O for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 May 2023 09:36:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=DWCBIuCWrEPUSgFUMsFJ6qSq1T5QDjJd5vFpRCChJ1w=; b=GayNG3kzJFJ5dJ+3pyHdgpJaHg
 Vg+D3WJSisJRAfKh4FdM+kMULiHBkVK2JlSjPpe6AWhhM9TnhNcnVYwVNicVKsW2D6CwQtiNr4GbI
 ifi8oL59NNJcPyuNM4H5lL3BQg0kUH1IUPhrqcRX4x0gkGHePahAMpgU+OMoye7IWbL1i4P4N0K7d
 hPveIYGdIaP1exiwrksrwwox3ggk+6PoAmRpABmAJW0vLpX170W8n4+WiyOMWiWdUV0KUHViDPR2V
 y4iTj0Am5OrXwsAxT9LSL8UdxWNyTm0g69FXTbp/zKBR4iorevNKqz7EDBD0kG/pHeghxQmsCy7c1
 7dhC9L+g==;
Received: from [2001:4bb8:188:3dd5:e8d0:68bb:e5be:210a] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pzwWZ-00FjgM-1F; Fri, 19 May 2023 09:35:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Date: Fri, 19 May 2023 11:35:16 +0200
Message-Id: <20230519093521.133226-9-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519093521.133226-1-hch@lst.de>
References: <20230519093521.133226-1-hch@lst.de>
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
 callers into iomap_file_buffered_write to reduce boiler plate code and reduce
 the scope to just around the page dirtying loop. Note that zonefs was missing
 this assignment before. 
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
X-Headers-End: 1pzwWo-0007Rp-9O
Subject: [f2fs-dev] [PATCH 08/13] iomap: assign current->backing_dev_info in
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
 Theodore Ts'o <tytso@mit.edu>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Move the assignment to current->backing_dev_info from the callers into
iomap_file_buffered_write to reduce boiler plate code and reduce the
scope to just around the page dirtying loop.

Note that zonefs was missing this assignment before.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/gfs2/file.c         | 3 ---
 fs/iomap/buffered-io.c | 3 +++
 fs/xfs/xfs_file.c      | 5 -----
 3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 499ef174dec138..261897fcfbc495 100644
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
 	if (ret > 0)
 		written += ret;
 
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 550525a525c45c..b2779bd1f10611 100644
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
@@ -869,8 +870,10 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
 	if (iocb->ki_flags & IOCB_NOWAIT)
 		iter.flags |= IOMAP_NOWAIT;
 
+	current->backing_dev_info = inode_to_bdi(iter.inode);
 	while ((ret = iomap_iter(&iter, ops)) > 0)
 		iter.processed = iomap_write_iter(&iter, i);
+	current->backing_dev_info = NULL;
 
 	if (unlikely(ret < 0))
 		return ret;
diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index bfba10e0b0f3c2..98d763cc3b114c 100644
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
@@ -751,7 +747,6 @@ xfs_file_buffered_write(
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
