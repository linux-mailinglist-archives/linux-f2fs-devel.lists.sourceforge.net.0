Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7D35A3553
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Aug 2022 09:01:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oRppF-0005pU-C9;
	Sat, 27 Aug 2022 07:01:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oRppD-0005pE-IB
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Aug 2022 07:01:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7F77Hg8B5efBScv94qrKy04o4aZE+FGgcEhsq71bsZE=; b=Pq1gdhUMspSF1o5wrMpwMpZGCL
 D5BKVzULHZnABoD6kg78vweVSglEMumd9b5f8daTXje1gGZl9cikZykQZSbxkPI1egv/OmGtZstlc
 q/Rs/IKGQon8uIFvdyrrJ0N5k5tUll41AOiKgivD9MVtWJTAWdIv6pUXpF38woCg8Qb4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7F77Hg8B5efBScv94qrKy04o4aZE+FGgcEhsq71bsZE=; b=RMUfHMvfl79x1TDfa9HupYuPC5
 D9iRzU/yb+adJrcfT0G1PDW7atjnkJa75OGuq7uTvP7yg+rTcL9jM+Rt7RljZPmordcBAz6li3K7t
 rsEaQdhoMGFnu+2qub2BXNsHTxJLXrPllsPV1+nmr6GGM3B+eY/0CwIj4im3jjLXS3Hc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oRppB-0006oS-Qt for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Aug 2022 07:01:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 59B71B82741
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 27 Aug 2022 07:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFFBEC43470;
 Sat, 27 Aug 2022 07:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661583691;
 bh=/jfuS15hStMnpPV1JCJsBTOyuHhx2Au7mlZgnZnCDk4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tk8MR2jqxzcI6Z/DtHV20OwpdVkX7XRj2jaKlNofUBIxuGMJGzu97VGo9dwQ/tR7v
 0Jt/IXU//m55YomHShR07pVXCz9Z2GCkmNxcLtIu6leHOB0DJ284sbZxKhRtPLMOnX
 PAAhC164epKLu5NPPd/KXRYRqIISSuoO66I69VpEVVATEP9uOp3Tgnb1Q5vqqWcjkr
 7RcdLWHYGIP4OhaSoy4hyMalRdxYLkK5ZwVo+M80Liz0G/cAxYh/zwx/jSuTtGWiQ/
 EnqY4St20g4OlKR/z0WAd6AcnpumqrKgzs3MCjiz5RC0/3QI6S8cQi53PMQkX9T/uE
 NMG+YgymZmAzg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Fri, 26 Aug 2022 23:58:45 -0700
Message-Id: <20220827065851.135710-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220827065851.135710-1-ebiggers@kernel.org>
References: <20220827065851.135710-1-ebiggers@kernel.org>
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
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oRppB-0006oS-Qt
Subject: [f2fs-dev] [PATCH v5 2/8] vfs: support STATX_DIOALIGN on block
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
 block/bdev.c           | 23 +++++++++++++++++++++++
 fs/stat.c              | 12 ++++++++++++
 include/linux/blkdev.h |  4 ++++
 3 files changed, 39 insertions(+)

diff --git a/block/bdev.c b/block/bdev.c
index ce05175e71cea4..d699ecdb32604e 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -26,6 +26,7 @@
 #include <linux/namei.h>
 #include <linux/part_stat.h>
 #include <linux/uaccess.h>
+#include <linux/stat.h>
 #include "../fs/internal.h"
 #include "blk.h"
 
@@ -1069,3 +1070,25 @@ void sync_bdevs(bool wait)
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
+
+	bdev = blkdev_get_no_open(inode->i_rdev);
+	if (!bdev)
+		return;
+
+	stat->dio_mem_align = bdev_dma_alignment(bdev) + 1;
+	stat->dio_offset_align = bdev_logical_block_size(bdev);
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
index 84b13fdd34a716..8038c5fbde4099 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1498,6 +1498,7 @@ int sync_blockdev(struct block_device *bdev);
 int sync_blockdev_range(struct block_device *bdev, loff_t lstart, loff_t lend);
 int sync_blockdev_nowait(struct block_device *bdev);
 void sync_bdevs(bool wait);
+void bdev_statx_dioalign(struct inode *inode, struct kstat *stat);
 void printk_all_partitions(void);
 #else
 static inline void invalidate_bdev(struct block_device *bdev)
@@ -1514,6 +1515,9 @@ static inline int sync_blockdev_nowait(struct block_device *bdev)
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
2.37.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
