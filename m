Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 411FF3C9FFB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jul 2021 15:46:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m41h4-0006v5-1d; Thu, 15 Jul 2021 13:46:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1m41bt-0005po-UC
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 15 Jul 2021 13:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LsI+catW5RS76O1qdmcY4XnE8ZCUk7oq5voDHQ5HYLE=; b=N3fGHUDeUKtT5gk+kf6F+f76nD
 JclqFGW8ZicakSNzA0HJn5XSwytOA6feThe4VEIXzTKrvhHdN0q+b9cgWNaeglkEUV4kILuN3H61+
 gMI/PB6fjHiNTLQv1kIQOh+do/DrPW2tjRotlZPRj/+THN4sOtl5ZNh/aSkmM7rgqEk4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LsI+catW5RS76O1qdmcY4XnE8ZCUk7oq5voDHQ5HYLE=; b=mwlBS2dTMfkKy1bozzX71RA9fe
 XRh/4q+N6RO3W9SUqPJD7oOU2QxS8UdZCYa5vhNaZ+9Kk4QE8BSDe0lcyXAWC5uR633Lbsg+6xirf
 zyz68pibyyBNSwmlDsO4QnZOD1zFGek32WK3D3db9B6k1I8KmGoZpsUPFIzWbdtSWB0I=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m41bn-00076W-Aj
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 15 Jul 2021 13:41:05 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 8437422A7D;
 Thu, 15 Jul 2021 13:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626356433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LsI+catW5RS76O1qdmcY4XnE8ZCUk7oq5voDHQ5HYLE=;
 b=IiPsrU68bsCNYIZFsI0IPy92N02/349Fg2nPIGYqwLU8+utzhwtQpr/wxz0PiFN17gRtec
 j8y8pqDsndj6Bw6TtTKQfM2P8vkY6hUBy9CGW4OEEKGl34hepIZtJ14G3TqvZ0iL/5BAlM
 vAYUeP4u3Szgm5WLbgu9GXzjVff01Bs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626356433;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LsI+catW5RS76O1qdmcY4XnE8ZCUk7oq5voDHQ5HYLE=;
 b=5w8o+0+hfvSJMcqG+YnxIJBl4hwF8gy2m/jJqCN5z+30xzjge7rBQqh4NLZGvObozauAw0
 L5d/YmCnOIwSPxDw==
Received: from quack2.suse.cz (unknown [10.100.200.198])
 by relay2.suse.de (Postfix) with ESMTP id 6FD7CA3BA4;
 Thu, 15 Jul 2021 13:40:33 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 1EE1B1E0CA7; Thu, 15 Jul 2021 15:40:33 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: <linux-fsdevel@vger.kernel.org>
Date: Thu, 15 Jul 2021 15:40:18 +0200
Message-Id: <20210715134032.24868-8-jack@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210715133202.5975-1-jack@suse.cz>
References: <20210715133202.5975-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7925; h=from:subject;
 bh=mWejkTIDaMc9IxG2WeDXqMcapYxJ9TVU66wpmUCJK/w=;
 b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBg8DrC59+SdGq1uy3gFs6NYDzc+OoN+hNXqB+X3E14
 ZExEH3GJATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCYPA6wgAKCRCcnaoHP2RA2bVfB/
 9km7hkkB9Q9JhDwD8wU+FUAkBa81LsU7jBZj2pl3UyvHrRc5lqRfLSG/H58JnBmX5Ly03I+ktg2y5d
 0c1OgOtH+LzTitmdP8yuYeMCTsqtvdZmaOZ71uXZ6lMrmAMwjObQ+fGbJVER2/fTNv1wFzLBBkWLch
 Hnt2KL75K79N2NtRJQLwQchkaXeHy/TqMpLU1g4CdmlzlElDkCRg1o7siwHavQxDN5nUR6pqNdKffH
 3Ry6izKs87djqcZZzXACKjPAaumd0eKHcWJSGZCi65Pjqai9Iy2AVs8+SFC3thJ4BVfDjrGy/YOHWG
 EYp72C2zTHclo8Otc0sHxrCUMUlgxp
X-Developer-Key: i=jack@suse.cz; a=openpgp;
 fpr=93C6099A142276A28BBE35D815BC833443038D8C
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m41bn-00076W-Aj
Subject: [f2fs-dev] [PATCH 08/14] xfs: Convert to use invalidate_lock
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
Cc: linux-xfs@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 linux-cifs@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Jan Kara <jack@suse.cz>, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use invalidate_lock instead of XFS internal i_mmap_lock. The intended
purpose of invalidate_lock is exactly the same. Note that the locking in
__xfs_filemap_fault() slightly changes as filemap_fault() already takes
invalidate_lock.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
CC: <linux-xfs@vger.kernel.org>
CC: "Darrick J. Wong" <djwong@kernel.org>
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/xfs/xfs_file.c  | 13 +++++++-----
 fs/xfs/xfs_inode.c | 50 ++++++++++++++++++++++++----------------------
 fs/xfs/xfs_inode.h |  1 -
 fs/xfs/xfs_super.c |  2 --
 4 files changed, 34 insertions(+), 32 deletions(-)

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index cc3cfb12df53..3dfbdcdb0d1c 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -1302,7 +1302,7 @@ xfs_file_llseek(
  *
  * mmap_lock (MM)
  *   sb_start_pagefault(vfs, freeze)
- *     i_mmaplock (XFS - truncate serialisation)
+ *     invalidate_lock (vfs/XFS_MMAPLOCK - truncate serialisation)
  *       page_lock (MM)
  *         i_lock (XFS - extent map serialisation)
  */
@@ -1323,24 +1323,27 @@ __xfs_filemap_fault(
 		file_update_time(vmf->vma->vm_file);
 	}
 
-	xfs_ilock(XFS_I(inode), XFS_MMAPLOCK_SHARED);
 	if (IS_DAX(inode)) {
 		pfn_t pfn;
 
+		xfs_ilock(XFS_I(inode), XFS_MMAPLOCK_SHARED);
 		ret = dax_iomap_fault(vmf, pe_size, &pfn, NULL,
 				(write_fault && !vmf->cow_page) ?
 				 &xfs_direct_write_iomap_ops :
 				 &xfs_read_iomap_ops);
 		if (ret & VM_FAULT_NEEDDSYNC)
 			ret = dax_finish_sync_fault(vmf, pe_size, pfn);
+		xfs_iunlock(XFS_I(inode), XFS_MMAPLOCK_SHARED);
 	} else {
-		if (write_fault)
+		if (write_fault) {
+			xfs_ilock(XFS_I(inode), XFS_MMAPLOCK_SHARED);
 			ret = iomap_page_mkwrite(vmf,
 					&xfs_buffered_write_iomap_ops);
-		else
+			xfs_iunlock(XFS_I(inode), XFS_MMAPLOCK_SHARED);
+		} else {
 			ret = filemap_fault(vmf);
+		}
 	}
-	xfs_iunlock(XFS_I(inode), XFS_MMAPLOCK_SHARED);
 
 	if (write_fault)
 		sb_end_pagefault(inode->i_sb);
diff --git a/fs/xfs/xfs_inode.c b/fs/xfs/xfs_inode.c
index 359e2cd44ad7..d6a8ac76b45d 100644
--- a/fs/xfs/xfs_inode.c
+++ b/fs/xfs/xfs_inode.c
@@ -132,7 +132,7 @@ xfs_ilock_attr_map_shared(
 
 /*
  * In addition to i_rwsem in the VFS inode, the xfs inode contains 2
- * multi-reader locks: i_mmap_lock and the i_lock.  This routine allows
+ * multi-reader locks: invalidate_lock and the i_lock.  This routine allows
  * various combinations of the locks to be obtained.
  *
  * The 3 locks should always be ordered so that the IO lock is obtained first,
@@ -140,23 +140,23 @@ xfs_ilock_attr_map_shared(
  *
  * Basic locking order:
  *
- * i_rwsem -> i_mmap_lock -> page_lock -> i_ilock
+ * i_rwsem -> invalidate_lock -> page_lock -> i_ilock
  *
  * mmap_lock locking order:
  *
  * i_rwsem -> page lock -> mmap_lock
- * mmap_lock -> i_mmap_lock -> page_lock
+ * mmap_lock -> invalidate_lock -> page_lock
  *
  * The difference in mmap_lock locking order mean that we cannot hold the
- * i_mmap_lock over syscall based read(2)/write(2) based IO. These IO paths can
- * fault in pages during copy in/out (for buffered IO) or require the mmap_lock
- * in get_user_pages() to map the user pages into the kernel address space for
- * direct IO. Similarly the i_rwsem cannot be taken inside a page fault because
- * page faults already hold the mmap_lock.
+ * invalidate_lock over syscall based read(2)/write(2) based IO. These IO paths
+ * can fault in pages during copy in/out (for buffered IO) or require the
+ * mmap_lock in get_user_pages() to map the user pages into the kernel address
+ * space for direct IO. Similarly the i_rwsem cannot be taken inside a page
+ * fault because page faults already hold the mmap_lock.
  *
  * Hence to serialise fully against both syscall and mmap based IO, we need to
- * take both the i_rwsem and the i_mmap_lock. These locks should *only* be both
- * taken in places where we need to invalidate the page cache in a race
+ * take both the i_rwsem and the invalidate_lock. These locks should *only* be
+ * both taken in places where we need to invalidate the page cache in a race
  * free manner (e.g. truncate, hole punch and other extent manipulation
  * functions).
  */
@@ -188,10 +188,13 @@ xfs_ilock(
 				 XFS_IOLOCK_DEP(lock_flags));
 	}
 
-	if (lock_flags & XFS_MMAPLOCK_EXCL)
-		mrupdate_nested(&ip->i_mmaplock, XFS_MMAPLOCK_DEP(lock_flags));
-	else if (lock_flags & XFS_MMAPLOCK_SHARED)
-		mraccess_nested(&ip->i_mmaplock, XFS_MMAPLOCK_DEP(lock_flags));
+	if (lock_flags & XFS_MMAPLOCK_EXCL) {
+		down_write_nested(&VFS_I(ip)->i_mapping->invalidate_lock,
+				  XFS_MMAPLOCK_DEP(lock_flags));
+	} else if (lock_flags & XFS_MMAPLOCK_SHARED) {
+		down_read_nested(&VFS_I(ip)->i_mapping->invalidate_lock,
+				 XFS_MMAPLOCK_DEP(lock_flags));
+	}
 
 	if (lock_flags & XFS_ILOCK_EXCL)
 		mrupdate_nested(&ip->i_lock, XFS_ILOCK_DEP(lock_flags));
@@ -240,10 +243,10 @@ xfs_ilock_nowait(
 	}
 
 	if (lock_flags & XFS_MMAPLOCK_EXCL) {
-		if (!mrtryupdate(&ip->i_mmaplock))
+		if (!down_write_trylock(&VFS_I(ip)->i_mapping->invalidate_lock))
 			goto out_undo_iolock;
 	} else if (lock_flags & XFS_MMAPLOCK_SHARED) {
-		if (!mrtryaccess(&ip->i_mmaplock))
+		if (!down_read_trylock(&VFS_I(ip)->i_mapping->invalidate_lock))
 			goto out_undo_iolock;
 	}
 
@@ -258,9 +261,9 @@ xfs_ilock_nowait(
 
 out_undo_mmaplock:
 	if (lock_flags & XFS_MMAPLOCK_EXCL)
-		mrunlock_excl(&ip->i_mmaplock);
+		up_write(&VFS_I(ip)->i_mapping->invalidate_lock);
 	else if (lock_flags & XFS_MMAPLOCK_SHARED)
-		mrunlock_shared(&ip->i_mmaplock);
+		up_read(&VFS_I(ip)->i_mapping->invalidate_lock);
 out_undo_iolock:
 	if (lock_flags & XFS_IOLOCK_EXCL)
 		up_write(&VFS_I(ip)->i_rwsem);
@@ -307,9 +310,9 @@ xfs_iunlock(
 		up_read(&VFS_I(ip)->i_rwsem);
 
 	if (lock_flags & XFS_MMAPLOCK_EXCL)
-		mrunlock_excl(&ip->i_mmaplock);
+		up_write(&VFS_I(ip)->i_mapping->invalidate_lock);
 	else if (lock_flags & XFS_MMAPLOCK_SHARED)
-		mrunlock_shared(&ip->i_mmaplock);
+		up_read(&VFS_I(ip)->i_mapping->invalidate_lock);
 
 	if (lock_flags & XFS_ILOCK_EXCL)
 		mrunlock_excl(&ip->i_lock);
@@ -335,7 +338,7 @@ xfs_ilock_demote(
 	if (lock_flags & XFS_ILOCK_EXCL)
 		mrdemote(&ip->i_lock);
 	if (lock_flags & XFS_MMAPLOCK_EXCL)
-		mrdemote(&ip->i_mmaplock);
+		downgrade_write(&VFS_I(ip)->i_mapping->invalidate_lock);
 	if (lock_flags & XFS_IOLOCK_EXCL)
 		downgrade_write(&VFS_I(ip)->i_rwsem);
 
@@ -375,9 +378,8 @@ xfs_isilocked(
 	}
 
 	if (lock_flags & (XFS_MMAPLOCK_EXCL|XFS_MMAPLOCK_SHARED)) {
-		if (!(lock_flags & XFS_MMAPLOCK_SHARED))
-			return !!ip->i_mmaplock.mr_writer;
-		return rwsem_is_locked(&ip->i_mmaplock.mr_lock);
+		return __xfs_rwsem_islocked(&VFS_I(ip)->i_rwsem,
+				(lock_flags & XFS_IOLOCK_SHARED));
 	}
 
 	if (lock_flags & (XFS_IOLOCK_EXCL | XFS_IOLOCK_SHARED)) {
diff --git a/fs/xfs/xfs_inode.h b/fs/xfs/xfs_inode.h
index 4b5202ae8ebb..e0ae905554e2 100644
--- a/fs/xfs/xfs_inode.h
+++ b/fs/xfs/xfs_inode.h
@@ -40,7 +40,6 @@ typedef struct xfs_inode {
 	/* Transaction and locking information. */
 	struct xfs_inode_log_item *i_itemp;	/* logging information */
 	mrlock_t		i_lock;		/* inode lock */
-	mrlock_t		i_mmaplock;	/* inode mmap IO lock */
 	atomic_t		i_pincount;	/* inode pin count */
 
 	/*
diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index 2c9e26a44546..102cbd606633 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -709,8 +709,6 @@ xfs_fs_inode_init_once(
 	atomic_set(&ip->i_pincount, 0);
 	spin_lock_init(&ip->i_flags_lock);
 
-	mrlock_init(&ip->i_mmaplock, MRLOCK_ALLOW_EQUAL_PRI|MRLOCK_BARRIER,
-		     "xfsino", ip->i_ino);
 	mrlock_init(&ip->i_lock, MRLOCK_ALLOW_EQUAL_PRI|MRLOCK_BARRIER,
 		     "xfsino", ip->i_ino);
 }
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
