Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D023A7A3A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Jun 2021 11:18:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lt5DV-0007iB-4w; Tue, 15 Jun 2021 09:18:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jack@suse.cz>) id 1lt5DQ-0007hW-C7
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Jun 2021 09:18:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gxy4E4M6RlL/AvZpYrufblUBcih2aW4l6tpccnvD6oM=; b=MtiJAi8YmDmfd/2kqm4ijQWUbn
 FUPXNAXWGfLcbW57XumgBRmaiamvj/imdQ3Zcg8J/D/7w3UDEzSOU1xzNFVWVh6TbqW+vSVNghE0a
 QQ7iKe2bPKgt2oEZBJazBW2wceONXdSmMi38kiqASs+2mFIeTHV05x2zxqxUAv893Fbw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gxy4E4M6RlL/AvZpYrufblUBcih2aW4l6tpccnvD6oM=; b=Yjg/KFgv+lmXpXf0X+ROgNG7Hb
 28YWlUzV/6F4LRu2DZniBBOHt9v8NXD7gxIlHbWB05HmQA0p/HczPde1iCFCzd6192LO6tIh76AT9
 zFtsd4G743sadwrF8E+cCuF3feN88SPgllmRxYHOIvllmhca8noNOl33c3lc3iobrki8=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lt5DO-00AQkU-BA
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Jun 2021 09:18:38 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 3F1B9219D5;
 Tue, 15 Jun 2021 09:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623748695; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gxy4E4M6RlL/AvZpYrufblUBcih2aW4l6tpccnvD6oM=;
 b=TqZv4+btCO83UzmhuMydU56xE4Mr68bgBcP7HYBDRFh7AHNQDuC2PgNSQ8pusl0eYSUmsZ
 bqbo6JFJYR+wj4I6QViRwKD6UWCCj7FyJcr/3vDaKs+H2AW2IZlXpQVBWouReF8RIrJNxt
 a4VSpONkD6TQ2CsV6Chz+tpeNXF6pmI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623748695;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gxy4E4M6RlL/AvZpYrufblUBcih2aW4l6tpccnvD6oM=;
 b=GfbtEBj9QvdLLo+6b2NyELeXT8CPrjZVq3BIhTYGuWhSBbyBZJgWkaQm33q0rRZ2lUSHn/
 X91cDKdwSrCyPpBw==
Received: from quack2.suse.cz (unknown [10.100.200.198])
 by relay2.suse.de (Postfix) with ESMTP id 1D7CFA3B9B;
 Tue, 15 Jun 2021 09:18:15 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 4EC361F2CC4; Tue, 15 Jun 2021 11:18:14 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: <linux-fsdevel@vger.kernel.org>
Date: Tue, 15 Jun 2021 11:18:01 +0200
Message-Id: <20210615091814.28626-11-jack@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210615090844.6045-1-jack@suse.cz>
References: <20210615090844.6045-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11698; h=from:subject;
 bh=XQE+RQtvOgf7IDyNXJkSiTagf22oyLHsdZOO7629/zo=;
 b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBgyHBJCopAHYDFDFNQOcMX1zduyEZW6Te4cIIjZsdV
 Ls+/WV2JATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCYMhwSQAKCRCcnaoHP2RA2UM1CA
 Dqu7WyBHvYudHVCseebPIId5TCFasDWCNiTap22rf4z7pEWYmklhUU7ezj9VadLk4UGvFLgpPZ+syU
 8dbu1YMMWtdwkIAk0ybZjbE32A/iJ8t8bIUc4JAEcDWesF4ZKtnvXFfiO/f4bn6xnJkWuq+wMQQquQ
 t9Aj13cGE5OXQWBSREUD2g7a55Dfir8sNaPwAsFNp4P6XP30SUW1hV1b+Ceh2m6WKIDNgXPwYz8zaL
 GoTI6Huz8JSifUapj5gc8BJ9HRe3i+2iApyXaPIuzkwHEy988EuGjjcvbRXXLjhplt8vJtAio4d3Ns
 aR4nsaqeMMwH6s/fJ2qtCr47QXane6
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
X-Headers-End: 1lt5DO-00AQkU-BA
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
 fs/f2fs/data.c  |  4 ++--
 fs/f2fs/f2fs.h  |  1 -
 fs/f2fs/file.c  | 62 ++++++++++++++++++++++++-------------------------
 fs/f2fs/super.c |  1 -
 4 files changed, 32 insertions(+), 36 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 009a09fb9d88..4c2bad8edcf4 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3165,12 +3165,12 @@ static void f2fs_write_failed(struct address_space *mapping, loff_t to)
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
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c83d90125ebd..ef0eb8b43fff 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -748,7 +748,6 @@ struct f2fs_inode_info {
 
 	/* avoid racing between foreground op and gc */
 	struct rw_semaphore i_gc_rwsem[2];
-	struct rw_semaphore i_mmap_sem;
 	struct rw_semaphore i_xattr_sem; /* avoid racing between reading and changing EAs */
 
 	int i_extra_isize;		/* size of extra space located in i_addr */
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ceb575f99048..75e1fe908b7b 100644
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
@@ -102,7 +99,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
 
 	file_update_time(vmf->vma->vm_file);
-	down_read(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_lock_shared(inode->i_mapping);
 	lock_page(page);
 	if (unlikely(page->mapping != inode->i_mapping ||
 			page_offset(page) > i_size_read(inode) ||
@@ -161,7 +158,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 
 	trace_f2fs_vm_page_mkwrite(page, DATA);
 out_sem:
-	up_read(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_unlock_shared(inode->i_mapping);
 
 	sb_end_pagefault(inode->i_sb);
 err:
@@ -942,7 +939,7 @@ int f2fs_setattr(struct user_namespace *mnt_userns, struct dentry *dentry,
 		}
 
 		down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-		down_write(&F2FS_I(inode)->i_mmap_sem);
+		filemap_invalidate_lock(inode->i_mapping);
 
 		truncate_setsize(inode, attr->ia_size);
 
@@ -952,7 +949,7 @@ int f2fs_setattr(struct user_namespace *mnt_userns, struct dentry *dentry,
 		 * do not trim all blocks after i_size if target size is
 		 * larger than i_size.
 		 */
-		up_write(&F2FS_I(inode)->i_mmap_sem);
+		filemap_invalidate_unlock(inode->i_mapping);
 		up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 		if (err)
 			return err;
@@ -1097,7 +1094,7 @@ static int punch_hole(struct inode *inode, loff_t offset, loff_t len)
 			blk_end = (loff_t)pg_end << PAGE_SHIFT;
 
 			down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-			down_write(&F2FS_I(inode)->i_mmap_sem);
+			filemap_invalidate_lock(mapping);
 
 			truncate_inode_pages_range(mapping, blk_start,
 					blk_end - 1);
@@ -1106,7 +1103,7 @@ static int punch_hole(struct inode *inode, loff_t offset, loff_t len)
 			ret = f2fs_truncate_hole(inode, pg_start, pg_end);
 			f2fs_unlock_op(sbi);
 
-			up_write(&F2FS_I(inode)->i_mmap_sem);
+			filemap_invalidate_unlock(mapping);
 			up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 		}
 	}
@@ -1341,7 +1338,7 @@ static int f2fs_do_collapse(struct inode *inode, loff_t offset, loff_t len)
 
 	/* avoid gc operation during block exchange */
 	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-	down_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_lock(inode->i_mapping);
 
 	f2fs_lock_op(sbi);
 	f2fs_drop_extent_tree(inode);
@@ -1349,7 +1346,7 @@ static int f2fs_do_collapse(struct inode *inode, loff_t offset, loff_t len)
 	ret = __exchange_data_block(inode, inode, end, start, nrpages - end, true);
 	f2fs_unlock_op(sbi);
 
-	up_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_unlock(inode->i_mapping);
 	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	return ret;
 }
@@ -1380,13 +1377,13 @@ static int f2fs_collapse_range(struct inode *inode, loff_t offset, loff_t len)
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
@@ -1486,7 +1483,7 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
 			pgoff_t end;
 
 			down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-			down_write(&F2FS_I(inode)->i_mmap_sem);
+			filemap_invalidate_lock(mapping);
 
 			truncate_pagecache_range(inode,
 				(loff_t)index << PAGE_SHIFT,
@@ -1498,7 +1495,7 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
 			ret = f2fs_get_dnode_of_data(&dn, index, ALLOC_NODE);
 			if (ret) {
 				f2fs_unlock_op(sbi);
-				up_write(&F2FS_I(inode)->i_mmap_sem);
+				filemap_invalidate_unlock(mapping);
 				up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 				goto out;
 			}
@@ -1510,7 +1507,7 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
 			f2fs_put_dnode(&dn);
 
 			f2fs_unlock_op(sbi);
-			up_write(&F2FS_I(inode)->i_mmap_sem);
+			filemap_invalidate_unlock(mapping);
 			up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 
 			f2fs_balance_fs(sbi, dn.node_changed);
@@ -1545,6 +1542,7 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
 static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct address_space *mapping = inode->i_mapping;
 	pgoff_t nr, pg_start, pg_end, delta, idx;
 	loff_t new_size;
 	int ret = 0;
@@ -1567,14 +1565,14 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
 
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
 
@@ -1585,7 +1583,7 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
 
 	/* avoid gc operation during block exchange */
 	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-	down_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_lock(mapping);
 	truncate_pagecache(inode, offset);
 
 	while (!ret && idx > pg_start) {
@@ -1601,14 +1599,14 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
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
@@ -3443,7 +3441,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 		goto out;
 
 	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-	down_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_lock(inode->i_mapping);
 
 	last_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
 
@@ -3479,7 +3477,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 	}
 
 	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-	up_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_unlock(inode->i_mapping);
 out:
 	inode_unlock(inode);
 
@@ -3596,7 +3594,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	}
 
 	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-	down_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_lock(inode->i_mapping);
 
 	last_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
 
@@ -3632,7 +3630,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	}
 
 	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-	up_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_unlock(inode->i_mapping);
 
 	if (ret >= 0) {
 		F2FS_I(inode)->i_flags &= ~F2FS_IMMUTABLE_FL;
@@ -3752,7 +3750,7 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 		goto err;
 
 	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-	down_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_lock(mapping);
 
 	ret = filemap_write_and_wait_range(mapping, range.start,
 			to_end ? LLONG_MAX : end_addr - 1);
@@ -3839,7 +3837,7 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 		ret = f2fs_secure_erase(prev_bdev, inode, prev_index,
 				prev_block, len, range.flags);
 out:
-	up_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_unlock(mapping);
 	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 err:
 	inode_unlock(inode);
@@ -4314,9 +4312,9 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
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
index 7d325bfaf65a..22e942aac7ad 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1187,7 +1187,6 @@ static struct inode *f2fs_alloc_inode(struct super_block *sb)
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
