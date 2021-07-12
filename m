Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 998423C60FE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jul 2021 18:56:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m2zEY-0000IG-Ck; Mon, 12 Jul 2021 16:56:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1m2zEV-0000HF-Kq
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Jul 2021 16:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MAwH8p8fifiQg27/Bml9bQG8rBDFikpquMFbXnFLpF0=; b=L5M2Dwq1szicnsHIPfzFEXlkim
 BJ0dC95oufEKL1CuIBIU1xEncMcL18VDQWTsk/03J8umf3ouoM0n7MGsXxhgofmfpyB8MkC9YiVAV
 E3/iMnMtQfrcC9WTxS8kZl3bap2tbE7Yocr+P0rR+QR0o4Vf54Z7vVOv4EAsUPURA8RE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MAwH8p8fifiQg27/Bml9bQG8rBDFikpquMFbXnFLpF0=; b=XiUtpgsWNIYyTUp1hepNv2T6RB
 mxo6rHnn9OeDBeukSZpYeYScfvXta0k+1D8iBS1zx3OumTTFM8ZEdvBpSUno4Dgqstr7tl2X5b1G3
 OOSnllnIa+63+btxIUDP8S4u8b2J8HdzPg/7k6SjJa3sKAtMiuAkeOvFpEIGE0IHYUbs=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m2zEI-005zKg-AU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Jul 2021 16:56:39 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 76F6422132;
 Mon, 12 Jul 2021 16:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626108970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MAwH8p8fifiQg27/Bml9bQG8rBDFikpquMFbXnFLpF0=;
 b=L/QMoNGBpYdqEpBvsdY56xoCYHT30hbEA3843gNUJpE9gn/NgcEOSaZTp3cIOHVy+9oWgH
 c7VwAt1EW45hisH4TYG3wJiDS+brS94D3ZxkV+qB/YEo+8mme4KzcIusI6t0M9pgp5Q/Yf
 ZlrnAmkOSl8hC0FiiN0G3DVhXm0+wYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626108970;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MAwH8p8fifiQg27/Bml9bQG8rBDFikpquMFbXnFLpF0=;
 b=vrg5KVVtlTXSBiGPenyWxwsfKb7GQI4/kOV7J6mrpQmQ2pLBweAPny3pCTknKH0n0vpT7n
 vlMmsVDL0+CBzZDw==
Received: from quack2.suse.cz (unknown [10.100.224.230])
 by relay2.suse.de (Postfix) with ESMTP id 23EEEA3B89;
 Mon, 12 Jul 2021 16:56:10 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id DE1A81F2CDF; Mon, 12 Jul 2021 18:56:09 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: <linux-fsdevel@vger.kernel.org>
Date: Mon, 12 Jul 2021 18:56:02 +0200
Message-Id: <20210712165609.13215-11-jack@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210712163901.29514-1-jack@suse.cz>
References: <20210712163901.29514-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12344; h=from:subject;
 bh=ugTzdnQ5fwj65SlrJvAh5LPvP/ZLlo/IqJfGP2n6gZ0=;
 b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBg7HQiIPcXwZZYwK4J88o6DMh61busWv3ks1R0FhPw
 fmLfaECJATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCYOx0IgAKCRCcnaoHP2RA2WpKB/
 49XQyCwcs1oeWmIMv6Kr4+0fDZ51OKk/B6aL+kE1d4K5wXBJAppUP0InMssyFr1NxzVCLii1O5fvlZ
 7s6JJgl31XQHmowVKC12kuhPMUuPOTFT/UKmAHB9KaydTlbxMhZzYGTvnDy3Hqe0DKz1oQ7535Wbqf
 9UCuMXFiqQLpE9mFf4NpU0L1CbwmoC5f9Lou9zhquCJcUgSyWCv4SEMacDLlfDk+pqmLHth5lVLW6G
 l1pvIsdEyzDzC9LgYMfV5iJ4g6u/yFPEBqIoLrmnUVOeNVQnpbGkkWmDmNiYbmnDy6BhkjaSiWznCo
 R3zBEtgM1zV1k3T+AvJled9OekLdwu
X-Developer-Key: i=jack@suse.cz; a=openpgp;
 fpr=93C6099A142276A28BBE35D815BC833443038D8C
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m2zEI-005zKg-AU
Subject: [f2fs-dev] [PATCH 11/14] f2fs: Convert to using invalidate_lock
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
 Chao Yu <yuchao0@huawei.com>, Dave Chinner <david@fromorbit.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Jan Kara <jack@suse.cz>,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use invalidate_lock instead of f2fs' private i_mmap_sem. The intended
purpose is exactly the same. By this conversion we fix a long standing
race between hole punching and read(2) / readahead(2) paths that can
lead to stale page cache contents.

CC: Jaegeuk Kim <jaegeuk@kernel.org>
CC: Chao Yu <yuchao0@huawei.com>
CC: linux-f2fs-devel@lists.sourceforge.net
Acked-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/f2fs/data.c  |  8 +++----
 fs/f2fs/f2fs.h  |  1 -
 fs/f2fs/file.c  | 62 ++++++++++++++++++++++++-------------------------
 fs/f2fs/super.c |  1 -
 4 files changed, 34 insertions(+), 38 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d2cf48c5a2e4..eb222b35edef 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3187,12 +3187,12 @@ static void f2fs_write_failed(struct address_space *mapping, loff_t to)
 	/* In the fs-verity case, f2fs_end_enable_verity() does the truncate */
 	if (to > i_size && !f2fs_verity_in_progress(inode)) {
 		down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-		down_write(&F2FS_I(inode)->i_mmap_sem);
+		filemap_invalidate_lock(mapping);
 
 		truncate_pagecache(inode, i_size);
 		f2fs_truncate_blocks(inode, i_size, true);
 
-		up_write(&F2FS_I(inode)->i_mmap_sem);
+		filemap_invalidate_unlock(mapping);
 		up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	}
 }
@@ -3852,7 +3852,7 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
 	int ret = 0;
 
 	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-	down_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_lock(inode->i_mapping);
 
 	set_inode_flag(inode, FI_ALIGNED_WRITE);
 
@@ -3894,7 +3894,7 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
 	clear_inode_flag(inode, FI_DO_DEFRAG);
 	clear_inode_flag(inode, FI_ALIGNED_WRITE);
 
-	up_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_unlock(inode->i_mapping);
 	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 
 	return ret;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ee8eb33e2c25..906b2c4b50e7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -754,7 +754,6 @@ struct f2fs_inode_info {
 
 	/* avoid racing between foreground op and gc */
 	struct rw_semaphore i_gc_rwsem[2];
-	struct rw_semaphore i_mmap_sem;
 	struct rw_semaphore i_xattr_sem; /* avoid racing between reading and changing EAs */
 
 	int i_extra_isize;		/* size of extra space located in i_addr */
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6afd4562335f..1ff333755721 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -38,10 +38,7 @@ static vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
 	struct inode *inode = file_inode(vmf->vma->vm_file);
 	vm_fault_t ret;
 
-	down_read(&F2FS_I(inode)->i_mmap_sem);
 	ret = filemap_fault(vmf);
-	up_read(&F2FS_I(inode)->i_mmap_sem);
-
 	if (!ret)
 		f2fs_update_iostat(F2FS_I_SB(inode), APP_MAPPED_READ_IO,
 							F2FS_BLKSIZE);
@@ -101,7 +98,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
 
 	file_update_time(vmf->vma->vm_file);
-	down_read(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_lock_shared(inode->i_mapping);
 	lock_page(page);
 	if (unlikely(page->mapping != inode->i_mapping ||
 			page_offset(page) > i_size_read(inode) ||
@@ -159,7 +156,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 
 	trace_f2fs_vm_page_mkwrite(page, DATA);
 out_sem:
-	up_read(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_unlock_shared(inode->i_mapping);
 
 	sb_end_pagefault(inode->i_sb);
 err:
@@ -940,7 +937,7 @@ int f2fs_setattr(struct user_namespace *mnt_userns, struct dentry *dentry,
 		}
 
 		down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-		down_write(&F2FS_I(inode)->i_mmap_sem);
+		filemap_invalidate_lock(inode->i_mapping);
 
 		truncate_setsize(inode, attr->ia_size);
 
@@ -950,7 +947,7 @@ int f2fs_setattr(struct user_namespace *mnt_userns, struct dentry *dentry,
 		 * do not trim all blocks after i_size if target size is
 		 * larger than i_size.
 		 */
-		up_write(&F2FS_I(inode)->i_mmap_sem);
+		filemap_invalidate_unlock(inode->i_mapping);
 		up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 		if (err)
 			return err;
@@ -1095,7 +1092,7 @@ static int punch_hole(struct inode *inode, loff_t offset, loff_t len)
 			blk_end = (loff_t)pg_end << PAGE_SHIFT;
 
 			down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-			down_write(&F2FS_I(inode)->i_mmap_sem);
+			filemap_invalidate_lock(mapping);
 
 			truncate_inode_pages_range(mapping, blk_start,
 					blk_end - 1);
@@ -1104,7 +1101,7 @@ static int punch_hole(struct inode *inode, loff_t offset, loff_t len)
 			ret = f2fs_truncate_hole(inode, pg_start, pg_end);
 			f2fs_unlock_op(sbi);
 
-			up_write(&F2FS_I(inode)->i_mmap_sem);
+			filemap_invalidate_unlock(mapping);
 			up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 		}
 	}
@@ -1339,7 +1336,7 @@ static int f2fs_do_collapse(struct inode *inode, loff_t offset, loff_t len)
 
 	/* avoid gc operation during block exchange */
 	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-	down_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_lock(inode->i_mapping);
 
 	f2fs_lock_op(sbi);
 	f2fs_drop_extent_tree(inode);
@@ -1347,7 +1344,7 @@ static int f2fs_do_collapse(struct inode *inode, loff_t offset, loff_t len)
 	ret = __exchange_data_block(inode, inode, end, start, nrpages - end, true);
 	f2fs_unlock_op(sbi);
 
-	up_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_unlock(inode->i_mapping);
 	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	return ret;
 }
@@ -1378,13 +1375,13 @@ static int f2fs_collapse_range(struct inode *inode, loff_t offset, loff_t len)
 		return ret;
 
 	/* write out all moved pages, if possible */
-	down_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_lock(inode->i_mapping);
 	filemap_write_and_wait_range(inode->i_mapping, offset, LLONG_MAX);
 	truncate_pagecache(inode, offset);
 
 	new_size = i_size_read(inode) - len;
 	ret = f2fs_truncate_blocks(inode, new_size, true);
-	up_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_unlock(inode->i_mapping);
 	if (!ret)
 		f2fs_i_size_write(inode, new_size);
 	return ret;
@@ -1484,7 +1481,7 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
 			pgoff_t end;
 
 			down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-			down_write(&F2FS_I(inode)->i_mmap_sem);
+			filemap_invalidate_lock(mapping);
 
 			truncate_pagecache_range(inode,
 				(loff_t)index << PAGE_SHIFT,
@@ -1496,7 +1493,7 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
 			ret = f2fs_get_dnode_of_data(&dn, index, ALLOC_NODE);
 			if (ret) {
 				f2fs_unlock_op(sbi);
-				up_write(&F2FS_I(inode)->i_mmap_sem);
+				filemap_invalidate_unlock(mapping);
 				up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 				goto out;
 			}
@@ -1508,7 +1505,7 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
 			f2fs_put_dnode(&dn);
 
 			f2fs_unlock_op(sbi);
-			up_write(&F2FS_I(inode)->i_mmap_sem);
+			filemap_invalidate_unlock(mapping);
 			up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 
 			f2fs_balance_fs(sbi, dn.node_changed);
@@ -1543,6 +1540,7 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
 static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct address_space *mapping = inode->i_mapping;
 	pgoff_t nr, pg_start, pg_end, delta, idx;
 	loff_t new_size;
 	int ret = 0;
@@ -1565,14 +1563,14 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
 
 	f2fs_balance_fs(sbi, true);
 
-	down_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_lock(mapping);
 	ret = f2fs_truncate_blocks(inode, i_size_read(inode), true);
-	up_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_unlock(mapping);
 	if (ret)
 		return ret;
 
 	/* write out all dirty pages from offset */
-	ret = filemap_write_and_wait_range(inode->i_mapping, offset, LLONG_MAX);
+	ret = filemap_write_and_wait_range(mapping, offset, LLONG_MAX);
 	if (ret)
 		return ret;
 
@@ -1583,7 +1581,7 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
 
 	/* avoid gc operation during block exchange */
 	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-	down_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_lock(mapping);
 	truncate_pagecache(inode, offset);
 
 	while (!ret && idx > pg_start) {
@@ -1599,14 +1597,14 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
 					idx + delta, nr, false);
 		f2fs_unlock_op(sbi);
 	}
-	up_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_unlock(mapping);
 	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 
 	/* write out all moved pages, if possible */
-	down_write(&F2FS_I(inode)->i_mmap_sem);
-	filemap_write_and_wait_range(inode->i_mapping, offset, LLONG_MAX);
+	filemap_invalidate_lock(mapping);
+	filemap_write_and_wait_range(mapping, offset, LLONG_MAX);
 	truncate_pagecache(inode, offset);
-	up_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_unlock(mapping);
 
 	if (!ret)
 		f2fs_i_size_write(inode, new_size);
@@ -3440,7 +3438,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 		goto out;
 
 	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-	down_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_lock(inode->i_mapping);
 
 	last_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
 
@@ -3476,7 +3474,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 	}
 
 	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-	up_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_unlock(inode->i_mapping);
 out:
 	inode_unlock(inode);
 
@@ -3593,7 +3591,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	}
 
 	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-	down_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_lock(inode->i_mapping);
 
 	last_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
 
@@ -3629,7 +3627,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	}
 
 	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-	up_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_unlock(inode->i_mapping);
 
 	if (ret >= 0) {
 		clear_inode_flag(inode, FI_COMPRESS_RELEASED);
@@ -3748,7 +3746,7 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 		goto err;
 
 	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-	down_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_lock(mapping);
 
 	ret = filemap_write_and_wait_range(mapping, range.start,
 			to_end ? LLONG_MAX : end_addr - 1);
@@ -3835,7 +3833,7 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 		ret = f2fs_secure_erase(prev_bdev, inode, prev_index,
 				prev_block, len, range.flags);
 out:
-	up_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_unlock(mapping);
 	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 err:
 	inode_unlock(inode);
@@ -4313,9 +4311,9 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		/* if we couldn't write data, we should deallocate blocks. */
 		if (preallocated && i_size_read(inode) < target_size) {
 			down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-			down_write(&F2FS_I(inode)->i_mmap_sem);
+			filemap_invalidate_lock(inode->i_mapping);
 			f2fs_truncate(inode);
-			up_write(&F2FS_I(inode)->i_mmap_sem);
+			filemap_invalidate_unlock(inode->i_mapping);
 			up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 		}
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 8fecd3050ccd..ce2ab1b85c11 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1289,7 +1289,6 @@ static struct inode *f2fs_alloc_inode(struct super_block *sb)
 	mutex_init(&fi->inmem_lock);
 	init_rwsem(&fi->i_gc_rwsem[READ]);
 	init_rwsem(&fi->i_gc_rwsem[WRITE]);
-	init_rwsem(&fi->i_mmap_sem);
 	init_rwsem(&fi->i_xattr_sem);
 
 	/* Will be used by directory only */
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
