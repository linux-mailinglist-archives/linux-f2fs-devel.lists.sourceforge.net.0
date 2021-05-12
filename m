Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB00F37BEB1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 May 2021 15:46:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgpCQ-0003zQ-0X; Wed, 12 May 2021 13:46:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1lgpCM-0003yj-SD
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 13:46:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ccVZ0TCyDi0yHTsdc4LvvNuO73/onSluWow6FM1T3HE=; b=Ps9UEPccEDcQs419V7c4ifUKU9
 ipMmy0Z+TDx7N9+6mvWSzf6y4HvAARWhh1kAmsZKczlLyTHHFZtKqX8iaOXMjFZTBK4rvvRIgFcvi
 eoBaKYH+l0n/HiIaa9WU4ouy5cmb45d7yXScJS1k79aI7K7qUFS78DWiEOOqS5a6ZXFo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ccVZ0TCyDi0yHTsdc4LvvNuO73/onSluWow6FM1T3HE=; b=izv5KHQeZOz/wzGO0MH6auX5Tj
 Ml9K2bvxwxiR2q/XZsXhLKOgmlgDLd9drE6pEGeYlEFDiK5yQ/OKuVXmwHmhbPF9BxKzYm6xxd5MT
 Yin1hLyAkA60ReFM0gpVdFCV6Qzj6/IEjR3TvK2/83qbsOOxtah0MxR2COAB+tROwLbs=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lgpCK-005UJH-9S
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 13:46:51 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C8D15B1A7;
 Wed, 12 May 2021 13:46:32 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id E7A901E1136; Wed, 12 May 2021 15:46:31 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: <linux-fsdevel@vger.kernel.org>
Date: Wed, 12 May 2021 15:46:13 +0200
Message-Id: <20210512134631.4053-5-jack@suse.cz>
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
X-Headers-End: 1lgpCK-005UJH-9S
Subject: [f2fs-dev] [PATCH 05/11] ext2: Convert to using invalidate_lock
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
 Johannes Thumshirn <jth@kernel.org>, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ext2 has its private dax_sem used for synchronizing page faults and
truncation. Use mapping->invalidate_lock instead as it is meant for this
purpose.

CC: <linux-ext4@vger.kernel.org>
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/ext2/ext2.h  | 11 -----------
 fs/ext2/file.c  |  7 +++----
 fs/ext2/inode.c | 12 ++++++------
 fs/ext2/super.c |  3 ---
 4 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/fs/ext2/ext2.h b/fs/ext2/ext2.h
index b0a694820cb7..81907a041570 100644
--- a/fs/ext2/ext2.h
+++ b/fs/ext2/ext2.h
@@ -667,9 +667,6 @@ struct ext2_inode_info {
 	struct rw_semaphore xattr_sem;
 #endif
 	rwlock_t i_meta_lock;
-#ifdef CONFIG_FS_DAX
-	struct rw_semaphore dax_sem;
-#endif
 
 	/*
 	 * truncate_mutex is for serialising ext2_truncate() against
@@ -685,14 +682,6 @@ struct ext2_inode_info {
 #endif
 };
 
-#ifdef CONFIG_FS_DAX
-#define dax_sem_down_write(ext2_inode)	down_write(&(ext2_inode)->dax_sem)
-#define dax_sem_up_write(ext2_inode)	up_write(&(ext2_inode)->dax_sem)
-#else
-#define dax_sem_down_write(ext2_inode)
-#define dax_sem_up_write(ext2_inode)
-#endif
-
 /*
  * Inode dynamic state flags
  */
diff --git a/fs/ext2/file.c b/fs/ext2/file.c
index f98466acc672..cb54d77d7329 100644
--- a/fs/ext2/file.c
+++ b/fs/ext2/file.c
@@ -81,7 +81,7 @@ static ssize_t ext2_dax_write_iter(struct kiocb *iocb, struct iov_iter *from)
  *
  * mmap_lock (MM)
  *   sb_start_pagefault (vfs, freeze)
- *     ext2_inode_info->dax_sem
+ *     address_space->invalidate_lock
  *       address_space->i_mmap_rwsem or page_lock (mutually exclusive in DAX)
  *         ext2_inode_info->truncate_mutex
  *
@@ -91,7 +91,6 @@ static ssize_t ext2_dax_write_iter(struct kiocb *iocb, struct iov_iter *from)
 static vm_fault_t ext2_dax_fault(struct vm_fault *vmf)
 {
 	struct inode *inode = file_inode(vmf->vma->vm_file);
-	struct ext2_inode_info *ei = EXT2_I(inode);
 	vm_fault_t ret;
 	bool write = (vmf->flags & FAULT_FLAG_WRITE) &&
 		(vmf->vma->vm_flags & VM_SHARED);
@@ -100,11 +99,11 @@ static vm_fault_t ext2_dax_fault(struct vm_fault *vmf)
 		sb_start_pagefault(inode->i_sb);
 		file_update_time(vmf->vma->vm_file);
 	}
-	down_read(&ei->dax_sem);
+	down_read(&inode->i_mapping->invalidate_lock);
 
 	ret = dax_iomap_fault(vmf, PE_SIZE_PTE, NULL, NULL, &ext2_iomap_ops);
 
-	up_read(&ei->dax_sem);
+	up_read(&inode->i_mapping->invalidate_lock);
 	if (write)
 		sb_end_pagefault(inode->i_sb);
 	return ret;
diff --git a/fs/ext2/inode.c b/fs/ext2/inode.c
index 68178b2234bd..e843be0ae53c 100644
--- a/fs/ext2/inode.c
+++ b/fs/ext2/inode.c
@@ -1175,7 +1175,7 @@ static void ext2_free_branches(struct inode *inode, __le32 *p, __le32 *q, int de
 		ext2_free_data(inode, p, q);
 }
 
-/* dax_sem must be held when calling this function */
+/* mapping->invalidate_lock must be held when calling this function */
 static void __ext2_truncate_blocks(struct inode *inode, loff_t offset)
 {
 	__le32 *i_data = EXT2_I(inode)->i_data;
@@ -1192,7 +1192,7 @@ static void __ext2_truncate_blocks(struct inode *inode, loff_t offset)
 	iblock = (offset + blocksize-1) >> EXT2_BLOCK_SIZE_BITS(inode->i_sb);
 
 #ifdef CONFIG_FS_DAX
-	WARN_ON(!rwsem_is_locked(&ei->dax_sem));
+	WARN_ON(!rwsem_is_locked(&inode->i_mapping->invalidate_lock));
 #endif
 
 	n = ext2_block_to_path(inode, iblock, offsets, NULL);
@@ -1274,9 +1274,9 @@ static void ext2_truncate_blocks(struct inode *inode, loff_t offset)
 	if (ext2_inode_is_fast_symlink(inode))
 		return;
 
-	dax_sem_down_write(EXT2_I(inode));
+	down_write(&inode->i_mapping->invalidate_lock);
 	__ext2_truncate_blocks(inode, offset);
-	dax_sem_up_write(EXT2_I(inode));
+	up_write(&inode->i_mapping->invalidate_lock);
 }
 
 static int ext2_setsize(struct inode *inode, loff_t newsize)
@@ -1306,10 +1306,10 @@ static int ext2_setsize(struct inode *inode, loff_t newsize)
 	if (error)
 		return error;
 
-	dax_sem_down_write(EXT2_I(inode));
+	down_write(&inode->i_mapping->invalidate_lock);
 	truncate_setsize(inode, newsize);
 	__ext2_truncate_blocks(inode, newsize);
-	dax_sem_up_write(EXT2_I(inode));
+	up_write(&inode->i_mapping->invalidate_lock);
 
 	inode->i_mtime = inode->i_ctime = current_time(inode);
 	if (inode_needs_sync(inode)) {
diff --git a/fs/ext2/super.c b/fs/ext2/super.c
index 21e09fbaa46f..987bcf32ed46 100644
--- a/fs/ext2/super.c
+++ b/fs/ext2/super.c
@@ -206,9 +206,6 @@ static void init_once(void *foo)
 	init_rwsem(&ei->xattr_sem);
 #endif
 	mutex_init(&ei->truncate_mutex);
-#ifdef CONFIG_FS_DAX
-	init_rwsem(&ei->dax_sem);
-#endif
 	inode_init_once(&ei->vfs_inode);
 }
 
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
