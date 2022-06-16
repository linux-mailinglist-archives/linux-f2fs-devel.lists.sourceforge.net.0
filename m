Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 099E254EAC4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Jun 2022 22:18:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o1vwq-0008T6-N5; Thu, 16 Jun 2022 20:18:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1o1vwp-0008Sl-9t
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jun 2022 20:18:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+Hb9OJF0P7cNVWizEtJgiPgEvlDIEUZvn7xsWsrJMok=; b=QgZZtAZ1S+X2m93aIDb+tWNC9s
 fCdxn7kIvf0+wcrkWB/U+HaRJuQok+C+EJOfNhYn9RS87jBXf16atM9xIQlw7Ot3ldRaCEx+GXyQd
 AD94s+S+LX2QayNlL2hW7osSnDUBVPhZhC+E7JYP7gNWFdze8R/KpFz92EpECZSbDOig=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+Hb9OJF0P7cNVWizEtJgiPgEvlDIEUZvn7xsWsrJMok=; b=hHek5VY698v7vEZcEwgdQGIQhx
 H/skiCc7QLFqxvvBUqhUexHzH7CdaEOvxj7MduYgtK5Fiko8+6xoFEzjv0wuuQqhIy7IAr+r/WZvW
 DF9KMD//AjPDDcE5kf4as6NdNYjn5BTEMZ5MiQ02zqthW4X2KUGj1Rp507MXsQmHDrLE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o1vwl-004Sqi-H6
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jun 2022 20:18:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3F35CB825FE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Jun 2022 20:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B2AC3411F;
 Thu, 16 Jun 2022 20:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655410696;
 bh=iOxOv0QdDiqnoNfajHWkadykNw8yw6SMHWPSQ+/Z1Cs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XCySuz3YzYlgIHp8UL9jy8oSMx9yC+Hk6wTrq88c+IqE3hXqu0MY+j4K/xAAKTOAB
 sAbep1qh9fUb8cPkmzPaQXFgxh+7nOMstYpxFHqIhVpafDfYexM9uSN3fhdwzTOemJ
 vVKthy2fIB4Jh7ii0yur32iWQbzJuBIUYh4gNt3v2cHdnfB4jmyxfEh79bOgfZG9iS
 MwwX6yNWttTI2eKEHpQxjcfMtWiL98SiARcc+j/jzMKfzRbnNY05boFEMDVUk5YG+S
 rtMLJEhH/UUTKqs7mFfPlqVdeaqbFX2S7jZCkEZDBN+SJH0Yk7KT3G3/QA0AbK9qR/
 ASb2CbGMlBDdA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Thu, 16 Jun 2022 13:15:00 -0700
Message-Id: <20220616201506.124209-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220616201506.124209-1-ebiggers@kernel.org>
References: <20220616201506.124209-1-ebiggers@kernel.org>
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
 high trust [145.40.68.75 listed in list.dnswl.org]
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
X-Headers-End: 1o1vwl-004Sqi-H6
Subject: [f2fs-dev] [PATCH v3 2/8] vfs: support STATX_DIOALIGN on block
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
 fs/stat.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/fs/stat.c b/fs/stat.c
index a7930d7444830..c1ce447c1a383 100644
--- a/fs/stat.c
+++ b/fs/stat.c
@@ -5,6 +5,7 @@
  *  Copyright (C) 1991, 1992  Linus Torvalds
  */
 
+#include <linux/blkdev.h>
 #include <linux/export.h>
 #include <linux/mm.h>
 #include <linux/errno.h>
@@ -198,6 +199,35 @@ int getname_statx_lookup_flags(int flags)
 	return lookup_flags;
 }
 
+/* Handle STATX_DIOALIGN for block devices. */
+static inline void handle_bdev_dioalign(struct path *path, u32 request_mask,
+					struct kstat *stat)
+{
+#ifdef CONFIG_BLOCK
+	struct inode *inode;
+	struct block_device *bdev;
+	unsigned int lbs;
+
+	if (likely(!(request_mask & STATX_DIOALIGN)))
+		return;
+
+	inode = d_backing_inode(path->dentry);
+	if (!S_ISBLK(inode->i_mode))
+		return;
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
+#endif /* CONFIG_BLOCK */
+}
+
 /**
  * vfs_statx - Get basic and extra attributes by filename
  * @dfd: A file descriptor representing the base dir for a relative filename
@@ -230,11 +260,16 @@ static int vfs_statx(int dfd, struct filename *filename, int flags,
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
+	handle_bdev_dioalign(&path, request_mask, stat);
+
 	path_put(&path);
 	if (retry_estale(error, lookup_flags)) {
 		lookup_flags |= LOOKUP_REVAL;
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
