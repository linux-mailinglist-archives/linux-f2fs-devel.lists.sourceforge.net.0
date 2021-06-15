Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DEB3A7A4F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Jun 2021 11:18:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lt5De-0007jp-1V; Tue, 15 Jun 2021 09:18:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jack@suse.cz>) id 1lt5DT-0007hz-UK
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Jun 2021 09:18:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y0cR5u9TaTNf3kT8s6I4jpd1jCjKCNBR8ag5a0EBpIA=; b=VqzXzMQZZzldnmu0mqkaF4UyV9
 0F6tG5qbiKaYcumv1jgUwbVT3vRPQOca8pH6x1zgLHtfLuEaRvn9WJr/1HvilEOEZPU1laRiohvE/
 KuWP7zfE6rB6b5uq+hf2wGixirrvFXo9SGX3PFJsv8RTSzONJUiJKRyb62Gy072rPm5g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y0cR5u9TaTNf3kT8s6I4jpd1jCjKCNBR8ag5a0EBpIA=; b=aXYEtyw4AGbeUwaAGZBt/DlVcw
 3QmS7Ple1SrlEyHkTXRE5vH0nceeiuCkXoh6HuCDdQ2W25Ro6CqjuvxJO3QXNCChzLnBEsTxKIp4X
 T/2LOkuUqxL/CZXT97MzBtgcTQtCGHYrsHdqqhYjN+a2d6fIVrtj5Cl8GY/xzcFC15xc=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lt5DO-00AQkT-Az
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Jun 2021 09:18:41 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 37A85219CF;
 Tue, 15 Jun 2021 09:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623748695; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y0cR5u9TaTNf3kT8s6I4jpd1jCjKCNBR8ag5a0EBpIA=;
 b=OHh3bUEVv71ozbI3AsVJcPaPYQvtz+MmKz2t9cI+GLwxa4FKwNzD4LN8qBRn1IKV/5Ff77
 i425BEwnsdwKQz7TE9yW8eSmL358aa2peVIkyWa/7tvhvY6Q4pC/OCt6SQ1an2ZtVSTqvI
 d8dVpAX8puPhpEc0WKPBU5k1eCbZB9k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623748695;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y0cR5u9TaTNf3kT8s6I4jpd1jCjKCNBR8ag5a0EBpIA=;
 b=eE4Zb6uIWIkVZRSm2ER/qlKBXgr6U65MFkHvQfqOjVAEEtCzClcZljk7KlkS/Gs8J4yfrn
 lXuJlgHd633fGEAA==
Received: from quack2.suse.cz (unknown [10.100.200.198])
 by relay2.suse.de (Postfix) with ESMTP id 19308A3B8A;
 Tue, 15 Jun 2021 09:18:15 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 397031F2CBF; Tue, 15 Jun 2021 11:18:14 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: <linux-fsdevel@vger.kernel.org>
Date: Tue, 15 Jun 2021 11:17:56 +0200
Message-Id: <20210615091814.28626-6-jack@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210615090844.6045-1-jack@suse.cz>
References: <20210615090844.6045-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4682; h=from:subject;
 bh=CDcZWsyH32vJE3DSXVHXUVYPxLcy1S8W7KZFP94NQWc=;
 b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBgyHBFthhqcWN94OroqMs+dt8ZjvTEGenhtDvbVKo4
 rIyqNfCJATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCYMhwRQAKCRCcnaoHP2RA2e2rB/
 0YxI0noK+qUMXHsXn9I15hLi050WyNsbymEWE96v2SdzIiDhndWdo9d/0zgch3VwnbnZvGppRiy6BL
 L8cvvJmWnfdcJfo8usccb/Xnz4qYwyYwSK6HtKW8kDBKzpWQO2MYO6fOnj+C1gpc2vmQaY6IXWjnPC
 TME/XgagdHt0YwbhhYPTCFnQq2R6fxof7T56QfQm4Z0C3rf61b1R96engPQ3Kd8xb5Qa5Vh9vFU3Oh
 eqMaRcXRZaH2c320aNfwDH7c9AXiJGuof6mCll1rle8zriJYvh9kWivvZtKLCKtYLA/KPfeAcF3jU/
 fLXzQCORShNTz/SEHiM5cbvSjLD+s0
X-Developer-Key: i=jack@suse.cz; a=openpgp;
 fpr=93C6099A142276A28BBE35D815BC833443038D8C
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lt5DO-00AQkT-Az
Subject: [f2fs-dev] [PATCH 06/14] ext2: Convert to using invalidate_lock
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
index f98466acc672..eb97aa3d700e 100644
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
+	filemap_invalidate_lock_shared(inode->i_mapping);
 
 	ret = dax_iomap_fault(vmf, PE_SIZE_PTE, NULL, NULL, &ext2_iomap_ops);
 
-	up_read(&ei->dax_sem);
+	filemap_invalidate_unlock_shared(inode->i_mapping);
 	if (write)
 		sb_end_pagefault(inode->i_sb);
 	return ret;
diff --git a/fs/ext2/inode.c b/fs/ext2/inode.c
index 68178b2234bd..2c76b9ffea26 100644
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
+	filemap_invalidate_lock(inode->i_mapping);
 	__ext2_truncate_blocks(inode, offset);
-	dax_sem_up_write(EXT2_I(inode));
+	filemap_invalidate_unlock(inode->i_mapping);
 }
 
 static int ext2_setsize(struct inode *inode, loff_t newsize)
@@ -1306,10 +1306,10 @@ static int ext2_setsize(struct inode *inode, loff_t newsize)
 	if (error)
 		return error;
 
-	dax_sem_down_write(EXT2_I(inode));
+	filemap_invalidate_lock(inode->i_mapping);
 	truncate_setsize(inode, newsize);
 	__ext2_truncate_blocks(inode, newsize);
-	dax_sem_up_write(EXT2_I(inode));
+	filemap_invalidate_unlock(inode->i_mapping);
 
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
