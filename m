Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4642A37BEC0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 May 2021 15:47:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgpCV-0003SG-6U; Wed, 12 May 2021 13:46:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jack@suse.cz>) id 1lgpCN-0003RN-Br
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 13:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1Zm3GVDAk5aDXe2oCWbogZ1CdxctGqDI9RHacxZ37OA=; b=nDW5i5Hg6sg3ltAgUPpBauE34t
 xKMpKYGL03Z+UWcnSnQCwUaLoXvldgo+FpmUWT4gBdhe7SP17HiAFEnLG88pAVAk4PCKGXyNGTNKk
 DEpGV16Vgy8MAfjooFTEMaCmPSZRv+jH9RSVzIBYvC6ik+SITmWO+VIik2Rgxj8R7NYw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1Zm3GVDAk5aDXe2oCWbogZ1CdxctGqDI9RHacxZ37OA=; b=Yp+Xh5NjsBu+LKNOsJrQQo8lw9
 Vlzfe+OgtpeWgnlYSlDNrrc+Xxv6hShGoM4BYlVb2xpDvhSM9QqtQVkpr0xopkBsXIh7xLZw27zxN
 qPxIKz+FKBBXvQOUMrSbpdQlHDQh2LKikGZ/qUyKGc+uW52tztQtc55hHbjHhZ9hKqOo=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lgpCJ-00020Y-I0
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 13:46:51 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B8BF2B03A;
 Wed, 12 May 2021 13:46:32 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id EBC0A1E6161; Wed, 12 May 2021 15:46:31 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: <linux-fsdevel@vger.kernel.org>
Date: Wed, 12 May 2021 15:46:14 +0200
Message-Id: <20210512134631.4053-6-jack@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210512101639.22278-1-jack@suse.cz>
References: <20210512101639.22278-1-jack@suse.cz>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lgpCJ-00020Y-I0
Subject: [f2fs-dev] [PATCH 06/11] xfs: Convert to use invalidate_lock
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
Cc: linux-cifs@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-ext4@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Steve French <sfrench@samba.org>, Dave Chinner <david@fromorbit.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Miklos Szeredi <miklos@szeredi.hu>, Jan Kara <jack@suse.cz>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Johannes Thumshirn <jth@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use invalidate_lock instead of XFS internal i_mmap_lock. The intended
purpose of invalidate_lock is exactly the same. Note that the locking in
__xfs_filemap_fault() slightly changes as filemap_fault() already takes
invalidate_lock.

Reviewed-by: Christoph Hellwig <hch@lst.de>
CC: <linux-xfs@vger.kernel.org>
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/xfs/xfs_file.c  | 12 ++++++-----
 fs/xfs/xfs_inode.c | 52 ++++++++++++++++++++++++++--------------------
 fs/xfs/xfs_inode.h |  1 -
 fs/xfs/xfs_super.c |  2 --
 4 files changed, 36 insertions(+), 31 deletions(-)

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 396ef36dcd0a..dc9cb5c20549 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -1282,7 +1282,7 @@ xfs_file_llseek(
  *
  * mmap_lock (MM)
  *   sb_start_pagefault(vfs, freeze)
- *     i_mmaplock (XFS - truncate serialisation)
+ *     invalidate_lock (vfs/XFS_MMAPLOCK - truncate serialisation)
  *       page_lock (MM)
  *         i_lock (XFS - extent map serialisation)
  */
@@ -1303,24 +1303,26 @@ __xfs_filemap_fault(
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
+		} else
 			ret = filemap_fault(vmf);
 	}
-	xfs_iunlock(XFS_I(inode), XFS_MMAPLOCK_SHARED);
 
 	if (write_fault)
 		sb_end_pagefault(inode->i_sb);
diff --git a/fs/xfs/xfs_inode.c b/fs/xfs/xfs_inode.c
index 0369eb22c1bb..53bb5fc33621 100644
--- a/fs/xfs/xfs_inode.c
+++ b/fs/xfs/xfs_inode.c
@@ -131,7 +131,7 @@ xfs_ilock_attr_map_shared(
 
 /*
  * In addition to i_rwsem in the VFS inode, the xfs inode contains 2
- * multi-reader locks: i_mmap_lock and the i_lock.  This routine allows
+ * multi-reader locks: invalidate_lock and the i_lock.  This routine allows
  * various combinations of the locks to be obtained.
  *
  * The 3 locks should always be ordered so that the IO lock is obtained first,
@@ -139,23 +139,23 @@ xfs_ilock_attr_map_shared(
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
@@ -187,10 +187,13 @@ xfs_ilock(
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
@@ -239,10 +242,10 @@ xfs_ilock_nowait(
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
 
@@ -257,9 +260,9 @@ xfs_ilock_nowait(
 
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
@@ -306,9 +309,9 @@ xfs_iunlock(
 		up_read(&VFS_I(ip)->i_rwsem);
 
 	if (lock_flags & XFS_MMAPLOCK_EXCL)
-		mrunlock_excl(&ip->i_mmaplock);
+		up_write(&VFS_I(ip)->i_mapping->invalidate_lock);
 	else if (lock_flags & XFS_MMAPLOCK_SHARED)
-		mrunlock_shared(&ip->i_mmaplock);
+		up_read(&VFS_I(ip)->i_mapping->invalidate_lock);
 
 	if (lock_flags & XFS_ILOCK_EXCL)
 		mrunlock_excl(&ip->i_lock);
@@ -334,7 +337,7 @@ xfs_ilock_demote(
 	if (lock_flags & XFS_ILOCK_EXCL)
 		mrdemote(&ip->i_lock);
 	if (lock_flags & XFS_MMAPLOCK_EXCL)
-		mrdemote(&ip->i_mmaplock);
+		downgrade_write(&VFS_I(ip)->i_mapping->invalidate_lock);
 	if (lock_flags & XFS_IOLOCK_EXCL)
 		downgrade_write(&VFS_I(ip)->i_rwsem);
 
@@ -355,8 +358,11 @@ xfs_isilocked(
 
 	if (lock_flags & (XFS_MMAPLOCK_EXCL|XFS_MMAPLOCK_SHARED)) {
 		if (!(lock_flags & XFS_MMAPLOCK_SHARED))
-			return !!ip->i_mmaplock.mr_writer;
-		return rwsem_is_locked(&ip->i_mmaplock.mr_lock);
+			return !debug_locks ||
+				lockdep_is_held_type(
+					&VFS_I(ip)->i_mapping->invalidate_lock,
+					0);
+		return rwsem_is_locked(&VFS_I(ip)->i_mapping->invalidate_lock);
 	}
 
 	if (lock_flags & (XFS_IOLOCK_EXCL|XFS_IOLOCK_SHARED)) {
diff --git a/fs/xfs/xfs_inode.h b/fs/xfs/xfs_inode.h
index ca826cfba91c..a0e4153efbbe 100644
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
index a2dab05332ac..eeaf44910b5f 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -715,8 +715,6 @@ xfs_fs_inode_init_once(
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
