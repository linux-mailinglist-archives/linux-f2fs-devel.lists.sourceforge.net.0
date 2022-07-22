Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B6557DAB4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Jul 2022 09:14:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oEmrf-0003fS-4y; Fri, 22 Jul 2022 07:14:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1oEmrW-0003eT-GP
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jul 2022 07:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=00wqM5QvpP1nzcAL+SjPFUCgTQMXzoR96dhNFTYqjTI=; b=hLLCPfKN8TMtOH9DwZRzMs55Oq
 cW40U7jqYujGaVoupyx4x/Hdp5s0hNyDZlEUsb1UcchE4bhgnbfkVq3uR17EEVtS+iBNMDA+UWJfX
 y7/uQdrc3oYgDpeHWguSUvIRCmEbqFrzuaz+W/Nv0PvPPayOt/CYyyCQ43i1QaSDD/do=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=00wqM5QvpP1nzcAL+SjPFUCgTQMXzoR96dhNFTYqjTI=; b=BLKHk4PppxMf4CHTTItvQWbqkB
 nQe4o/d9v9ZHb4zPG4Lf/U84qV7r1OHKmftGawdVTKI9rowm+dvJ8uoLgK817YEIqAmrhW8HvhGD/
 11DFbfnPfrV1OsPPMPZ8/qOX6iSzDcMofxVSciK3Hw6LqgqRKcWkavbwKlOwdmN1l1uY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oEmrV-0000qb-Cm
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jul 2022 07:14:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5B4666219D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 22 Jul 2022 07:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D34C385A5;
 Fri, 22 Jul 2022 07:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658474043;
 bh=rxppfGAWTvoazShXWqiRQAPwYvWCuKApheXmuFc/BQY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d8Cr8JecsbZeIRQ5t/ggsqjOh0c2t2g7QqlNyJmjUUDIPAUtozy6cOgFB7SV0zcUp
 /T8YLw5znD4KGJcOsBBB+flZcvly70mwKQ41iSnh0z92m9Jmud61wnc1bDwKWuQUJI
 Rn5yqXLjsVmKwG22H580yBSImGur4cgc3K419yEFlPziedpRBGdmkr5eyqREj/S52z
 HgTwDj6ixSn33wQw+fOeGINjGF+jSadcLM31+806a4u9E9MpsBAFiqA1lE3se9pjyi
 gBJMlDD6R3sahaq1iDLwrQyRu2+9b4G5peXYUU8azaH0T6Bj3JrUFlo8CPrg6ZitMi
 utD1hbXc1INFg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Fri, 22 Jul 2022 00:12:21 -0700
Message-Id: <20220722071228.146690-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220722071228.146690-1-ebiggers@kernel.org>
References: <20220722071228.146690-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Add support for
 STATX_DIOALIGN
 to block devices, so that direct I/O alignment restrictions are exposed to
 userspace in a generic way. Note that this breaks the tradition of stat
 operating
 only on the block device node, not the block device itself. However, it was
 felt that doing this is preferable, in order to make the interface use [...]
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oEmrV-0000qb-Cm
Subject: [f2fs-dev] [PATCH v4 2/9] vfs: support STATX_DIOALIGN on block
 devices
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Add support for STATX_DIOALIGN to block devices, so that direct I/O
alignment restrictions are exposed to userspace in a generic way.

Note that this breaks the tradition of stat operating only on the block
device node, not the block device itself.  However, it was felt that
doing this is preferable, in order to make the interface useful and
avoid needing separate interfaces for regular files and block devices.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 block/bdev.c           | 25 +++++++++++++++++++++++++
 fs/stat.c              | 12 ++++++++++++
 include/linux/blkdev.h |  4 ++++
 3 files changed, 41 insertions(+)

diff --git a/block/bdev.c b/block/bdev.c
index 5fe06c1f2def41..cee0951e27a82a 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -26,6 +26,7 @@
 #include <linux/namei.h>
 #include <linux/part_stat.h>
 #include <linux/uaccess.h>
+#include <linux/stat.h>
 #include "../fs/internal.h"
 #include "blk.h"
 
@@ -1071,3 +1072,27 @@ void sync_bdevs(bool wait)
 	spin_unlock(&blockdev_superblock->s_inode_list_lock);
 	iput(old_inode);
 }
+
+/*
+ * Handle STATX_DIOALIGN for block devices.
+ *
+ * Note that the inode passed to this is the inode of a block device node file,
+ * not the block device's internal inode.  Therefore it is *not* valid to use
+ * I_BDEV() here; the block device has to be looked up by i_rdev instead.
+ */
+void bdev_statx_dioalign(struct inode *inode, struct kstat *stat)
+{
+	struct block_device *bdev;
+	unsigned int lbs;
+
+	bdev = blkdev_get_no_open(inode->i_rdev);
+	if (!bdev)
+		return;
+
+	lbs = bdev_logical_block_size(bdev);
+	stat->dio_mem_align = lbs;
+	stat->dio_offset_align = lbs;
+	stat->result_mask |= STATX_DIOALIGN;
+
+	blkdev_put_no_open(bdev);
+}
diff --git a/fs/stat.c b/fs/stat.c
index a7930d74448304..ef50573c72a269 100644
--- a/fs/stat.c
+++ b/fs/stat.c
@@ -5,6 +5,7 @@
  *  Copyright (C) 1991, 1992  Linus Torvalds
  */
 
+#include <linux/blkdev.h>
 #include <linux/export.h>
 #include <linux/mm.h>
 #include <linux/errno.h>
@@ -230,11 +231,22 @@ static int vfs_statx(int dfd, struct filename *filename, int flags,
 		goto out;
 
 	error = vfs_getattr(&path, stat, request_mask, flags);
+
 	stat->mnt_id = real_mount(path.mnt)->mnt_id;
 	stat->result_mask |= STATX_MNT_ID;
+
 	if (path.mnt->mnt_root == path.dentry)
 		stat->attributes |= STATX_ATTR_MOUNT_ROOT;
 	stat->attributes_mask |= STATX_ATTR_MOUNT_ROOT;
+
+	/* Handle STATX_DIOALIGN for block devices. */
+	if (request_mask & STATX_DIOALIGN) {
+		struct inode *inode = d_backing_inode(path.dentry);
+
+		if (S_ISBLK(inode->i_mode))
+			bdev_statx_dioalign(inode, stat);
+	}
+
 	path_put(&path);
 	if (retry_estale(error, lookup_flags)) {
 		lookup_flags |= LOOKUP_REVAL;
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 2f7b43444c5f8d..d75151bd43b541 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1538,6 +1538,7 @@ int sync_blockdev(struct block_device *bdev);
 int sync_blockdev_range(struct block_device *bdev, loff_t lstart, loff_t lend);
 int sync_blockdev_nowait(struct block_device *bdev);
 void sync_bdevs(bool wait);
+void bdev_statx_dioalign(struct inode *inode, struct kstat *stat);
 void printk_all_partitions(void);
 #else
 static inline void invalidate_bdev(struct block_device *bdev)
@@ -1554,6 +1555,9 @@ static inline int sync_blockdev_nowait(struct block_device *bdev)
 static inline void sync_bdevs(bool wait)
 {
 }
+static inline void bdev_statx_dioalign(struct inode *inode, struct kstat *stat)
+{
+}
 static inline void printk_all_partitions(void)
 {
 }
-- 
2.37.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
