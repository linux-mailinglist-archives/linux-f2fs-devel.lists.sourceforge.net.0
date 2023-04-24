Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 000336EC513
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Apr 2023 07:49:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pqp5J-0004IG-SE;
	Mon, 24 Apr 2023 05:49:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+e16e2fc4419b117693a1+7183+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pqp5H-0004I9-HO for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 05:49:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V5nklQoA9f4p457fAmSLCbWYVHcQ95Tr9Yi93vZ1hXQ=; b=nCjuVtkVVc1fPqw4NetZPxZ3n7
 OHJa+Bt2N0O6Dk1bwwek+9IWlun+WZ2+tLk991c24566npRBu6q5gkVEQsbKhVSqhx7aDHc7zOqTR
 B18WS5bqhNZll/xMHTHVSfiaAV4MnOVJNZZDfb3ow1URpWyMigSJKZPmTkyugVqXfdj4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V5nklQoA9f4p457fAmSLCbWYVHcQ95Tr9Yi93vZ1hXQ=; b=f5NLsfM1OpZeLrQfmizEER0QeA
 HieqnxcGalEoWW11bu6lkB4p8q0qGr7A4IL1TuJGrPXbCgMdkENK++x8FeoiyWsrLkZOOCmrtBwA4
 x58zPgZuMecKaPXVlWPUgKpkOT5jb+iMkYxrfBVXpEDxHert9JTG8YulSe090C3msmm4=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pqp5E-0003Tp-MK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 05:49:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=V5nklQoA9f4p457fAmSLCbWYVHcQ95Tr9Yi93vZ1hXQ=; b=BVLdIyeC9XyB883rbVnHnnshYb
 v9MBAr9Kui06l3iqsHsxD6wr7hDLJughW5sYL6bLE4MMi2NT4MojE/Kqi+QP5twRZ+EZc4+pHQm3S
 kcN/fEcPtZ2XKOf2kEcveCPw4THCw9R3Vp3FTaYaHC5Q6XyN/KDa1LZrslZMBHL8ouAUMCh+sbtnt
 jGhkPdK1bf1+RRVNAAo7uctMzy3iud0d3e4hNElvjoV0xaEA7vu/iU7cwGxhgjr4qByRCVU5CGTNI
 M7ydlMTMwaIbWoe21seFAlCC/o0TZc5ZPNp4ELlK9gRxqfYBpHM10qTh06+1CPkGzgFFFvJGUiBet
 OQvgwjkg==;
Received: from [2001:4bb8:189:a74f:e8a5:5f73:6d2:23b8] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pqp4y-00FOuS-1q; Mon, 24 Apr 2023 05:49:37 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 24 Apr 2023 07:49:11 +0200
Message-Id: <20230424054926.26927-3-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424054926.26927-1-hch@lst.de>
References: <20230424054926.26927-1-hch@lst.de>
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
 Content preview:  def_blk_fops always returns -ENODEV, which dosn't match the
 return value of a non-existing block device with CONFIG_BLOCK, which is -ENXIO.
 Just remove the extra implementation and fall back to the de [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pqp5E-0003Tp-MK
Subject: [f2fs-dev] [PATCH 02/17] fs: remove the special !CONFIG_BLOCK
 def_blk_fops
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

def_blk_fops always returns -ENODEV, which dosn't match the return value
of a non-existing block device with CONFIG_BLOCK, which is -ENXIO.
Just remove the extra implementation and fall back to the default
no_open_fops that always returns -ENXIO.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/Makefile   | 10 ++--------
 fs/inode.c    |  3 ++-
 fs/no-block.c | 19 -------------------
 3 files changed, 4 insertions(+), 28 deletions(-)
 delete mode 100644 fs/no-block.c

diff --git a/fs/Makefile b/fs/Makefile
index 05f89b5c962f88..da21e7d0a1cf37 100644
--- a/fs/Makefile
+++ b/fs/Makefile
@@ -18,14 +18,8 @@ obj-y :=	open.o read_write.o file_table.o super.o \
 		fs_types.o fs_context.o fs_parser.o fsopen.o init.o \
 		kernel_read_file.o mnt_idmapping.o remap_range.o
 
-ifeq ($(CONFIG_BLOCK),y)
-obj-y +=	buffer.o mpage.o
-else
-obj-y +=	no-block.o
-endif
-
-obj-$(CONFIG_PROC_FS) += proc_namespace.o
-
+obj-$(CONFIG_BLOCK)		+= buffer.o mpage.o
+obj-$(CONFIG_PROC_FS)		+= proc_namespace.o
 obj-$(CONFIG_LEGACY_DIRECT_IO)	+= direct-io.o
 obj-y				+= notify/
 obj-$(CONFIG_EPOLL)		+= eventpoll.o
diff --git a/fs/inode.c b/fs/inode.c
index 4558dc2f135573..d43f07f146eb73 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2265,7 +2265,8 @@ void init_special_inode(struct inode *inode, umode_t mode, dev_t rdev)
 		inode->i_fop = &def_chr_fops;
 		inode->i_rdev = rdev;
 	} else if (S_ISBLK(mode)) {
-		inode->i_fop = &def_blk_fops;
+		if (IS_ENABLED(CONFIG_BLOCK))
+			inode->i_fop = &def_blk_fops;
 		inode->i_rdev = rdev;
 	} else if (S_ISFIFO(mode))
 		inode->i_fop = &pipefifo_fops;
diff --git a/fs/no-block.c b/fs/no-block.c
deleted file mode 100644
index 481c0f0ab4bd2c..00000000000000
--- a/fs/no-block.c
+++ /dev/null
@@ -1,19 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/* no-block.c: implementation of routines required for non-BLOCK configuration
- *
- * Copyright (C) 2006 Red Hat, Inc. All Rights Reserved.
- * Written by David Howells (dhowells@redhat.com)
- */
-
-#include <linux/kernel.h>
-#include <linux/fs.h>
-
-static int no_blkdev_open(struct inode * inode, struct file * filp)
-{
-	return -ENODEV;
-}
-
-const struct file_operations def_blk_fops = {
-	.open		= no_blkdev_open,
-	.llseek		= noop_llseek,
-};
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
