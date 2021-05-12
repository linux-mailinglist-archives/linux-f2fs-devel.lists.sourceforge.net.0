Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FA237BE90
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 May 2021 15:46:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgpCE-0003wv-Rt; Wed, 12 May 2021 13:46:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1lgpCD-0003wi-NJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 13:46:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UQtA2GPqdxa7tjLRTH2XKlG+C1dfmZpeew9KrodUClA=; b=mcC6S5nq3UbSrRqG6pvgVn2vra
 Fb7R0yZ9Te3NP0zFEPqRIToZOc/hLlSjk4qW/Rqkq9HwM8EO6teB3v9IoHK93f8CTJGQIDhxiJN5E
 QtK/ysw0A4iCxGjTjuPA2FjabYZETQKjHQ8xwi5i6AS9oxyq94853s1DhLaNaWpgsV2I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UQtA2GPqdxa7tjLRTH2XKlG+C1dfmZpeew9KrodUClA=; b=fFnArVNcr57DJX5ynegjjUz3X/
 uANqVUtiurniS2/MD4y/o28fKuDR/gBkBDhsNfds9y26a/mCyIn28VIBY2kB/rQNnvKtcuvwig/x6
 zr4kUbOgFaPL8epHzua8j74MqLp2c96lItAnOJQZ4hNUxZQM+5j7ogz4BuUKy0ybLOV8=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lgpCB-005UIc-Qr
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 13:46:42 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5DA2AB1B5;
 Wed, 12 May 2021 13:46:32 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id E3FB41E0FC4; Wed, 12 May 2021 15:46:31 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: <linux-fsdevel@vger.kernel.org>
Date: Wed, 12 May 2021 15:46:12 +0200
Message-Id: <20210512134631.4053-4-jack@suse.cz>
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
X-Headers-End: 1lgpCB-005UIc-Qr
Subject: [f2fs-dev] [PATCH 04/11] ext4: Convert to use
 mapping->invalidate_lock
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

Convert ext4 to use mapping->invalidate_lock instead of its private
EXT4_I(inode)->i_mmap_sem. This is mostly search-and-replace. By this
conversion we fix a long standing race between hole punching and read(2)
/ readahead(2) paths that can lead to stale page cache contents.

CC: <linux-ext4@vger.kernel.org>
CC: Ted Tso <tytso@mit.edu>
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/ext4/ext4.h     | 10 ----------
 fs/ext4/extents.c  | 25 +++++++++++++-----------
 fs/ext4/file.c     | 13 +++++++------
 fs/ext4/inode.c    | 47 +++++++++++++++++-----------------------------
 fs/ext4/ioctl.c    |  4 ++--
 fs/ext4/super.c    | 13 +++++--------
 fs/ext4/truncate.h |  8 +++++---
 7 files changed, 50 insertions(+), 70 deletions(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 37002663d521..ed64b4b217a1 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -1077,15 +1077,6 @@ struct ext4_inode_info {
 	 * by other means, so we have i_data_sem.
 	 */
 	struct rw_semaphore i_data_sem;
-	/*
-	 * i_mmap_sem is for serializing page faults with truncate / punch hole
-	 * operations. We have to make sure that new page cannot be faulted in
-	 * a section of the inode that is being punched. We cannot easily use
-	 * i_data_sem for this since we need protection for the whole punch
-	 * operation and i_data_sem ranks below transaction start so we have
-	 * to occasionally drop it.
-	 */
-	struct rw_semaphore i_mmap_sem;
 	struct inode vfs_inode;
 	struct jbd2_inode *jinode;
 
@@ -2962,7 +2953,6 @@ extern int ext4_chunk_trans_blocks(struct inode *, int nrblocks);
 extern int ext4_zero_partial_blocks(handle_t *handle, struct inode *inode,
 			     loff_t lstart, loff_t lend);
 extern vm_fault_t ext4_page_mkwrite(struct vm_fault *vmf);
-extern vm_fault_t ext4_filemap_fault(struct vm_fault *vmf);
 extern qsize_t *ext4_get_reserved_space(struct inode *inode);
 extern int ext4_get_projid(struct inode *inode, kprojid_t *projid);
 extern void ext4_da_release_space(struct inode *inode, int to_free);
diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
index 77c84d6f1af6..8bb6b84c8a84 100644
--- a/fs/ext4/extents.c
+++ b/fs/ext4/extents.c
@@ -4467,6 +4467,7 @@ static long ext4_zero_range(struct file *file, loff_t offset,
 			    loff_t len, int mode)
 {
 	struct inode *inode = file_inode(file);
+	struct address_space *mapping = file->f_mapping;
 	handle_t *handle = NULL;
 	unsigned int max_blocks;
 	loff_t new_size = 0;
@@ -4553,17 +4554,17 @@ static long ext4_zero_range(struct file *file, loff_t offset,
 		 * Prevent page faults from reinstantiating pages we have
 		 * released from page cache.
 		 */
-		down_write(&EXT4_I(inode)->i_mmap_sem);
+		down_write(&mapping->invalidate_lock);
 
 		ret = ext4_break_layouts(inode);
 		if (ret) {
-			up_write(&EXT4_I(inode)->i_mmap_sem);
+			up_write(&mapping->invalidate_lock);
 			goto out_mutex;
 		}
 
 		ret = ext4_update_disksize_before_punch(inode, offset, len);
 		if (ret) {
-			up_write(&EXT4_I(inode)->i_mmap_sem);
+			up_write(&mapping->invalidate_lock);
 			goto out_mutex;
 		}
 		/* Now release the pages and zero block aligned part of pages */
@@ -4572,7 +4573,7 @@ static long ext4_zero_range(struct file *file, loff_t offset,
 
 		ret = ext4_alloc_file_blocks(file, lblk, max_blocks, new_size,
 					     flags);
-		up_write(&EXT4_I(inode)->i_mmap_sem);
+		up_write(&mapping->invalidate_lock);
 		if (ret)
 			goto out_mutex;
 	}
@@ -5214,6 +5215,7 @@ ext4_ext_shift_extents(struct inode *inode, handle_t *handle,
 static int ext4_collapse_range(struct inode *inode, loff_t offset, loff_t len)
 {
 	struct super_block *sb = inode->i_sb;
+	struct address_space *mapping = inode->i_mapping;
 	ext4_lblk_t punch_start, punch_stop;
 	handle_t *handle;
 	unsigned int credits;
@@ -5267,7 +5269,7 @@ static int ext4_collapse_range(struct inode *inode, loff_t offset, loff_t len)
 	 * Prevent page faults from reinstantiating pages we have released from
 	 * page cache.
 	 */
-	down_write(&EXT4_I(inode)->i_mmap_sem);
+	down_write(&mapping->invalidate_lock);
 
 	ret = ext4_break_layouts(inode);
 	if (ret)
@@ -5282,15 +5284,15 @@ static int ext4_collapse_range(struct inode *inode, loff_t offset, loff_t len)
 	 * Write tail of the last page before removed range since it will get
 	 * removed from the page cache below.
 	 */
-	ret = filemap_write_and_wait_range(inode->i_mapping, ioffset, offset);
+	ret = filemap_write_and_wait_range(mapping, ioffset, offset);
 	if (ret)
 		goto out_mmap;
 	/*
 	 * Write data that will be shifted to preserve them when discarding
 	 * page cache below. We are also protected from pages becoming dirty
-	 * by i_mmap_sem.
+	 * by i_rwsem and invalidate_lock.
 	 */
-	ret = filemap_write_and_wait_range(inode->i_mapping, offset + len,
+	ret = filemap_write_and_wait_range(mapping, offset + len,
 					   LLONG_MAX);
 	if (ret)
 		goto out_mmap;
@@ -5343,7 +5345,7 @@ static int ext4_collapse_range(struct inode *inode, loff_t offset, loff_t len)
 	ext4_journal_stop(handle);
 	ext4_fc_stop_ineligible(sb);
 out_mmap:
-	up_write(&EXT4_I(inode)->i_mmap_sem);
+	up_write(&mapping->invalidate_lock);
 out_mutex:
 	inode_unlock(inode);
 	return ret;
@@ -5360,6 +5362,7 @@ static int ext4_collapse_range(struct inode *inode, loff_t offset, loff_t len)
 static int ext4_insert_range(struct inode *inode, loff_t offset, loff_t len)
 {
 	struct super_block *sb = inode->i_sb;
+	struct address_space *mapping = inode->i_mapping;
 	handle_t *handle;
 	struct ext4_ext_path *path;
 	struct ext4_extent *extent;
@@ -5418,7 +5421,7 @@ static int ext4_insert_range(struct inode *inode, loff_t offset, loff_t len)
 	 * Prevent page faults from reinstantiating pages we have released from
 	 * page cache.
 	 */
-	down_write(&EXT4_I(inode)->i_mmap_sem);
+	down_write(&mapping->invalidate_lock);
 
 	ret = ext4_break_layouts(inode);
 	if (ret)
@@ -5519,7 +5522,7 @@ static int ext4_insert_range(struct inode *inode, loff_t offset, loff_t len)
 	ext4_journal_stop(handle);
 	ext4_fc_stop_ineligible(sb);
 out_mmap:
-	up_write(&EXT4_I(inode)->i_mmap_sem);
+	up_write(&mapping->invalidate_lock);
 out_mutex:
 	inode_unlock(inode);
 	return ret;
diff --git a/fs/ext4/file.c b/fs/ext4/file.c
index 816dedcbd541..f5993d3bd7b2 100644
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@ -704,22 +704,23 @@ static vm_fault_t ext4_dax_huge_fault(struct vm_fault *vmf,
 	 */
 	bool write = (vmf->flags & FAULT_FLAG_WRITE) &&
 		(vmf->vma->vm_flags & VM_SHARED);
+	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
 	pfn_t pfn;
 
 	if (write) {
 		sb_start_pagefault(sb);
 		file_update_time(vmf->vma->vm_file);
-		down_read(&EXT4_I(inode)->i_mmap_sem);
+		down_read(&mapping->invalidate_lock);
 retry:
 		handle = ext4_journal_start_sb(sb, EXT4_HT_WRITE_PAGE,
 					       EXT4_DATA_TRANS_BLOCKS(sb));
 		if (IS_ERR(handle)) {
-			up_read(&EXT4_I(inode)->i_mmap_sem);
+			up_read(&mapping->invalidate_lock);
 			sb_end_pagefault(sb);
 			return VM_FAULT_SIGBUS;
 		}
 	} else {
-		down_read(&EXT4_I(inode)->i_mmap_sem);
+		down_read(&mapping->invalidate_lock);
 	}
 	result = dax_iomap_fault(vmf, pe_size, &pfn, &error, &ext4_iomap_ops);
 	if (write) {
@@ -731,10 +732,10 @@ static vm_fault_t ext4_dax_huge_fault(struct vm_fault *vmf,
 		/* Handling synchronous page fault? */
 		if (result & VM_FAULT_NEEDDSYNC)
 			result = dax_finish_sync_fault(vmf, pe_size, pfn);
-		up_read(&EXT4_I(inode)->i_mmap_sem);
+		up_read(&mapping->invalidate_lock);
 		sb_end_pagefault(sb);
 	} else {
-		up_read(&EXT4_I(inode)->i_mmap_sem);
+		up_read(&mapping->invalidate_lock);
 	}
 
 	return result;
@@ -756,7 +757,7 @@ static const struct vm_operations_struct ext4_dax_vm_ops = {
 #endif
 
 static const struct vm_operations_struct ext4_file_vm_ops = {
-	.fault		= ext4_filemap_fault,
+	.fault		= filemap_fault,
 	.map_pages	= filemap_map_pages,
 	.page_mkwrite   = ext4_page_mkwrite,
 };
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index fe6045a46599..9db1bba28271 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3950,20 +3950,19 @@ int ext4_update_disksize_before_punch(struct inode *inode, loff_t offset,
 	return ret;
 }
 
-static void ext4_wait_dax_page(struct ext4_inode_info *ei)
+static void ext4_wait_dax_page(struct inode *inode)
 {
-	up_write(&ei->i_mmap_sem);
+	up_write(&inode->i_mapping->invalidate_lock);
 	schedule();
-	down_write(&ei->i_mmap_sem);
+	down_write(&inode->i_mapping->invalidate_lock);
 }
 
 int ext4_break_layouts(struct inode *inode)
 {
-	struct ext4_inode_info *ei = EXT4_I(inode);
 	struct page *page;
 	int error;
 
-	if (WARN_ON_ONCE(!rwsem_is_locked(&ei->i_mmap_sem)))
+	if (WARN_ON_ONCE(!rwsem_is_locked(&inode->i_mapping->invalidate_lock)))
 		return -EINVAL;
 
 	do {
@@ -3974,7 +3973,7 @@ int ext4_break_layouts(struct inode *inode)
 		error = ___wait_var_event(&page->_refcount,
 				atomic_read(&page->_refcount) == 1,
 				TASK_INTERRUPTIBLE, 0, 0,
-				ext4_wait_dax_page(ei));
+				ext4_wait_dax_page(inode));
 	} while (error == 0);
 
 	return error;
@@ -4005,9 +4004,9 @@ int ext4_punch_hole(struct inode *inode, loff_t offset, loff_t length)
 
 	ext4_clear_inode_state(inode, EXT4_STATE_MAY_INLINE_DATA);
 	if (ext4_has_inline_data(inode)) {
-		down_write(&EXT4_I(inode)->i_mmap_sem);
+		down_write(&mapping->invalidate_lock);
 		ret = ext4_convert_inline_data(inode);
-		up_write(&EXT4_I(inode)->i_mmap_sem);
+		up_write(&mapping->invalidate_lock);
 		if (ret)
 			return ret;
 	}
@@ -4058,7 +4057,7 @@ int ext4_punch_hole(struct inode *inode, loff_t offset, loff_t length)
 	 * Prevent page faults from reinstantiating pages we have released from
 	 * page cache.
 	 */
-	down_write(&EXT4_I(inode)->i_mmap_sem);
+	down_write(&mapping->invalidate_lock);
 
 	ret = ext4_break_layouts(inode);
 	if (ret)
@@ -4131,7 +4130,7 @@ int ext4_punch_hole(struct inode *inode, loff_t offset, loff_t length)
 out_stop:
 	ext4_journal_stop(handle);
 out_dio:
-	up_write(&EXT4_I(inode)->i_mmap_sem);
+	up_write(&mapping->invalidate_lock);
 out_mutex:
 	inode_unlock(inode);
 	return ret;
@@ -5426,11 +5425,11 @@ int ext4_setattr(struct user_namespace *mnt_userns, struct dentry *dentry,
 			inode_dio_wait(inode);
 		}
 
-		down_write(&EXT4_I(inode)->i_mmap_sem);
+		down_write(&inode->i_mapping->invalidate_lock);
 
 		rc = ext4_break_layouts(inode);
 		if (rc) {
-			up_write(&EXT4_I(inode)->i_mmap_sem);
+			up_write(&inode->i_mapping->invalidate_lock);
 			goto err_out;
 		}
 
@@ -5506,7 +5505,7 @@ int ext4_setattr(struct user_namespace *mnt_userns, struct dentry *dentry,
 				error = rc;
 		}
 out_mmap_sem:
-		up_write(&EXT4_I(inode)->i_mmap_sem);
+		up_write(&inode->i_mapping->invalidate_lock);
 	}
 
 	if (!error) {
@@ -5983,10 +5982,10 @@ int ext4_change_inode_journal_flag(struct inode *inode, int val)
 	 * data (and journalled aops don't know how to handle these cases).
 	 */
 	if (val) {
-		down_write(&EXT4_I(inode)->i_mmap_sem);
+		down_write(&inode->i_mapping->invalidate_lock);
 		err = filemap_write_and_wait(inode->i_mapping);
 		if (err < 0) {
-			up_write(&EXT4_I(inode)->i_mmap_sem);
+			up_write(&inode->i_mapping->invalidate_lock);
 			return err;
 		}
 	}
@@ -6019,7 +6018,7 @@ int ext4_change_inode_journal_flag(struct inode *inode, int val)
 	percpu_up_write(&sbi->s_writepages_rwsem);
 
 	if (val)
-		up_write(&EXT4_I(inode)->i_mmap_sem);
+		up_write(&inode->i_mapping->invalidate_lock);
 
 	/* Finally we can mark the inode as dirty. */
 
@@ -6063,7 +6062,7 @@ vm_fault_t ext4_page_mkwrite(struct vm_fault *vmf)
 	sb_start_pagefault(inode->i_sb);
 	file_update_time(vma->vm_file);
 
-	down_read(&EXT4_I(inode)->i_mmap_sem);
+	down_read(&mapping->invalidate_lock);
 
 	err = ext4_convert_inline_data(inode);
 	if (err)
@@ -6176,7 +6175,7 @@ vm_fault_t ext4_page_mkwrite(struct vm_fault *vmf)
 out_ret:
 	ret = block_page_mkwrite_return(err);
 out:
-	up_read(&EXT4_I(inode)->i_mmap_sem);
+	up_read(&mapping->invalidate_lock);
 	sb_end_pagefault(inode->i_sb);
 	return ret;
 out_error:
@@ -6184,15 +6183,3 @@ vm_fault_t ext4_page_mkwrite(struct vm_fault *vmf)
 	ext4_journal_stop(handle);
 	goto out;
 }
-
-vm_fault_t ext4_filemap_fault(struct vm_fault *vmf)
-{
-	struct inode *inode = file_inode(vmf->vma->vm_file);
-	vm_fault_t ret;
-
-	down_read(&EXT4_I(inode)->i_mmap_sem);
-	ret = filemap_fault(vmf);
-	up_read(&EXT4_I(inode)->i_mmap_sem);
-
-	return ret;
-}
diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
index 31627f7dc5cd..cedc604726c2 100644
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -148,7 +148,7 @@ static long swap_inode_boot_loader(struct super_block *sb,
 		goto journal_err_out;
 	}
 
-	down_write(&EXT4_I(inode)->i_mmap_sem);
+	down_write(&inode->i_mapping->invalidate_lock);
 	err = filemap_write_and_wait(inode->i_mapping);
 	if (err)
 		goto err_out;
@@ -256,7 +256,7 @@ static long swap_inode_boot_loader(struct super_block *sb,
 	ext4_double_up_write_data_sem(inode, inode_bl);
 
 err_out:
-	up_write(&EXT4_I(inode)->i_mmap_sem);
+	up_write(&inode->i_mapping->invalidate_lock);
 journal_err_out:
 	unlock_two_nondirectories(inode, inode_bl);
 	iput(inode_bl);
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 7dc94f3e18e6..966fd5ca48e0 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -90,12 +90,9 @@ static struct inode *ext4_get_journal_inode(struct super_block *sb,
 /*
  * Lock ordering
  *
- * Note the difference between i_mmap_sem (EXT4_I(inode)->i_mmap_sem) and
- * i_mmap_rwsem (inode->i_mmap_rwsem)!
- *
  * page fault path:
- * mmap_lock -> sb_start_pagefault -> i_mmap_sem (r) -> transaction start ->
- *   page lock -> i_data_sem (rw)
+ * mmap_lock -> sb_start_pagefault -> invalidate_lock (r) -> transaction start
+ *   -> page lock -> i_data_sem (rw)
  *
  * buffered write path:
  * sb_start_write -> i_mutex -> mmap_lock
@@ -103,8 +100,9 @@ static struct inode *ext4_get_journal_inode(struct super_block *sb,
  *   i_data_sem (rw)
  *
  * truncate:
- * sb_start_write -> i_mutex -> i_mmap_sem (w) -> i_mmap_rwsem (w) -> page lock
- * sb_start_write -> i_mutex -> i_mmap_sem (w) -> transaction start ->
+ * sb_start_write -> i_mutex -> invalidate_lock (w) -> i_mmap_rwsem (w) ->
+ *   page lock
+ * sb_start_write -> i_mutex -> invalidate_lock (w) -> transaction start ->
  *   i_data_sem (rw)
  *
  * direct IO:
@@ -1350,7 +1348,6 @@ static void init_once(void *foo)
 	INIT_LIST_HEAD(&ei->i_orphan);
 	init_rwsem(&ei->xattr_sem);
 	init_rwsem(&ei->i_data_sem);
-	init_rwsem(&ei->i_mmap_sem);
 	inode_init_once(&ei->vfs_inode);
 	ext4_fc_init_inode(&ei->vfs_inode);
 }
diff --git a/fs/ext4/truncate.h b/fs/ext4/truncate.h
index bcbe3668c1d4..b7242e08c9dd 100644
--- a/fs/ext4/truncate.h
+++ b/fs/ext4/truncate.h
@@ -11,14 +11,16 @@
  */
 static inline void ext4_truncate_failed_write(struct inode *inode)
 {
+	struct address_space *mapping = inode->i_mapping;
+
 	/*
 	 * We don't need to call ext4_break_layouts() because the blocks we
 	 * are truncating were never visible to userspace.
 	 */
-	down_write(&EXT4_I(inode)->i_mmap_sem);
-	truncate_inode_pages(inode->i_mapping, inode->i_size);
+	down_write(&mapping->invalidate_lock);
+	truncate_inode_pages(mapping, inode->i_size);
 	ext4_truncate(inode);
-	up_write(&EXT4_I(inode)->i_mmap_sem);
+	up_write(&mapping->invalidate_lock);
 }
 
 /*
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
