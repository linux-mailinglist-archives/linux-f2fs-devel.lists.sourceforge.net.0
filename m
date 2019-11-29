Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E40BC10D6E4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Nov 2019 15:21:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iah94-00028c-OB; Fri, 29 Nov 2019 14:21:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <agruenba@redhat.com>) id 1iah92-00027o-7c
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Nov 2019 14:21:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VP6e4fS82ZVWbpnJBKYprOYp5qn0BT0NQcR/ZfMdaJk=; b=E8EDgxrvLgoSJ1iz9gczgZ8igs
 4Gnblaho4tlKtRMgrdHRY35AGpcrZLjbP8e6yRaVCgl+qwXLSyv8ZmjSqnUZ6GqAMWeCKvxTBY85u
 oiSoc7mSfsV32G7numV/p1UsPAFORAOOsXv1LH/9mUTwGKptgTBSdiTso9ZN2zC1Yv68=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VP6e4fS82ZVWbpnJBKYprOYp5qn0BT0NQcR/ZfMdaJk=; b=n
 JZc0cya9NowA0cvwcarc9ZkqtymNOjjFLrhruz9EgbHd69L2v92kiqQPqFoPHBuSzXF7sWjPoBC4Z
 IHQzgdaMkD7bKDksFsQ8QprRq0BWuO5eV5F9BXb/NS3lv9ZSEgXQ6WGnTCk9GHL0FGBY9fhQdLNLI
 CUhjRXxCc7CYPxbY=;
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1iah8x-00HLep-RF
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Nov 2019 14:21:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575037261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VP6e4fS82ZVWbpnJBKYprOYp5qn0BT0NQcR/ZfMdaJk=;
 b=cuMz57nipn5hctiIwFXgt+6Ih4qLKpXBpXNvIRwuErHjfyuVqwREkVzPQ0sl9cctHhNt7v
 21jdeHoSBPrIoYjekV4WikcPxmIJ0/3IAtL1rxpgIJ+EFh4tdU72zwfmfBOBaGqiRpWD92
 20MDfvdcms4ZlL9biXBZALKunlpup1k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-LJWOf1WKPIOJgC45aX2Gvw-1; Fri, 29 Nov 2019 09:21:00 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D44C8017CC;
 Fri, 29 Nov 2019 14:20:56 +0000 (UTC)
Received: from max.com (ovpn-204-19.brq.redhat.com [10.40.204.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2885110013A1;
 Fri, 29 Nov 2019 14:20:47 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>
Date: Fri, 29 Nov 2019 15:20:45 +0100
Message-Id: <20191129142045.7215-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: LJWOf1WKPIOJgC45aX2Gvw-1
X-Mimecast-Spam-Score: 0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iah8x-00HLep-RF
Subject: [f2fs-dev] [PATCH v2] fs: Fix page_mkwrite off-by-one errors
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
Cc: Adrian Hunter <adrian.hunter@intel.com>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Andreas Gruenbacher <agruenba@redhat.com>, Sage Weil <sage@redhat.com>,
 Richard Weinberger <richard@nod.at>, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Artem Bityutskiy <dedekind1@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The check in block_page_mkwrite meant to determine whether an offset is
within the inode size is off by one.  This bug has spread to
iomap_page_mkwrite and to several filesystems (ubifs, ext4, f2fs, ceph).
To fix that, introduce a new page_mkwrite_check_truncate helper that
checks for truncate and computes the bytes in the page up to EOF, and
use that helper in the above mentioned filesystems and in btrfs.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>

---

This patch has a trivial conflict with commit "iomap: Fix overflow in
iomap_page_mkwrite" in Darrick's iomap pull request for 5.5:

  https://lore.kernel.org/lkml/20191125190907.GN6219@magnolia/
---
 fs/btrfs/inode.c        | 15 ++++-----------
 fs/buffer.c             | 16 +++-------------
 fs/ceph/addr.c          |  2 +-
 fs/ext4/inode.c         | 14 ++++----------
 fs/f2fs/file.c          | 19 +++++++------------
 fs/iomap/buffered-io.c  | 17 ++++-------------
 fs/ubifs/file.c         |  3 +--
 include/linux/pagemap.h | 24 ++++++++++++++++++++++++
 8 files changed, 48 insertions(+), 62 deletions(-)

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 015910079e73..019948101bc2 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -8990,13 +8990,11 @@ vm_fault_t btrfs_page_mkwrite(struct vm_fault *vmf)
 	ret = VM_FAULT_NOPAGE; /* make the VM retry the fault */
 again:
 	lock_page(page);
-	size = i_size_read(inode);
 
-	if ((page->mapping != inode->i_mapping) ||
-	    (page_start >= size)) {
-		/* page got truncated out from underneath us */
+	ret2 = page_mkwrite_check_truncate(page, inode);
+	if (ret2 < 0)
 		goto out_unlock;
-	}
+	zero_start = ret2;
 	wait_on_page_writeback(page);
 
 	lock_extent_bits(io_tree, page_start, page_end, &cached_state);
@@ -9017,6 +9015,7 @@ vm_fault_t btrfs_page_mkwrite(struct vm_fault *vmf)
 		goto again;
 	}
 
+	size = i_size_read(inode);
 	if (page->index == ((size - 1) >> PAGE_SHIFT)) {
 		reserved_space = round_up(size - page_start,
 					  fs_info->sectorsize);
@@ -9049,12 +9048,6 @@ vm_fault_t btrfs_page_mkwrite(struct vm_fault *vmf)
 	}
 	ret2 = 0;
 
-	/* page is wholly or partially inside EOF */
-	if (page_start + PAGE_SIZE > size)
-		zero_start = offset_in_page(size);
-	else
-		zero_start = PAGE_SIZE;
-
 	if (zero_start != PAGE_SIZE) {
 		kaddr = kmap(page);
 		memset(kaddr + zero_start, 0, PAGE_SIZE - zero_start);
diff --git a/fs/buffer.c b/fs/buffer.c
index 86a38b979323..b162ec65910e 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -2459,23 +2459,13 @@ int block_page_mkwrite(struct vm_area_struct *vma, struct vm_fault *vmf,
 	struct page *page = vmf->page;
 	struct inode *inode = file_inode(vma->vm_file);
 	unsigned long end;
-	loff_t size;
 	int ret;
 
 	lock_page(page);
-	size = i_size_read(inode);
-	if ((page->mapping != inode->i_mapping) ||
-	    (page_offset(page) > size)) {
-		/* We overload EFAULT to mean page got truncated */
-		ret = -EFAULT;
+	ret = page_mkwrite_check_truncate(page, inode);
+	if (ret < 0)
 		goto out_unlock;
-	}
-
-	/* page is wholly or partially inside EOF */
-	if (((page->index + 1) << PAGE_SHIFT) > size)
-		end = size & ~PAGE_MASK;
-	else
-		end = PAGE_SIZE;
+	end = ret;
 
 	ret = __block_write_begin(page, 0, end, get_block);
 	if (!ret)
diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 7ab616601141..ef958aa4adb4 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -1575,7 +1575,7 @@ static vm_fault_t ceph_page_mkwrite(struct vm_fault *vmf)
 	do {
 		lock_page(page);
 
-		if ((off > size) || (page->mapping != inode->i_mapping)) {
+		if (page_mkwrite_check_truncate(page, inode) < 0) {
 			unlock_page(page);
 			ret = VM_FAULT_NOPAGE;
 			break;
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 516faa280ced..23bf095e0b29 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -6186,7 +6186,6 @@ vm_fault_t ext4_page_mkwrite(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct page *page = vmf->page;
-	loff_t size;
 	unsigned long len;
 	int err;
 	vm_fault_t ret;
@@ -6222,18 +6221,13 @@ vm_fault_t ext4_page_mkwrite(struct vm_fault *vmf)
 	}
 
 	lock_page(page);
-	size = i_size_read(inode);
-	/* Page got truncated from under us? */
-	if (page->mapping != mapping || page_offset(page) > size) {
+	err = page_mkwrite_check_truncate(page, inode);
+	if (err < 0) {
 		unlock_page(page);
-		ret = VM_FAULT_NOPAGE;
-		goto out;
+		goto out_ret;
 	}
+	len = err;
 
-	if (page->index == size >> PAGE_SHIFT)
-		len = size & ~PAGE_MASK;
-	else
-		len = PAGE_SIZE;
 	/*
 	 * Return if we have all the buffers mapped. This avoids the need to do
 	 * journal_start/journal_stop which can block and take a long time
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 29bc0a542759..973f731e7af4 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -51,7 +51,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	struct inode *inode = file_inode(vmf->vma->vm_file);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct dnode_of_data dn = { .node_changed = false };
-	int err;
+	int offset, err;
 
 	if (unlikely(f2fs_cp_error(sbi))) {
 		err = -EIO;
@@ -70,13 +70,14 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	file_update_time(vmf->vma->vm_file);
 	down_read(&F2FS_I(inode)->i_mmap_sem);
 	lock_page(page);
-	if (unlikely(page->mapping != inode->i_mapping ||
-			page_offset(page) > i_size_read(inode) ||
-			!PageUptodate(page))) {
+	err = -EFAULT;
+	if (likely(PageUptodate(page)))
+		err = page_mkwrite_check_truncate(page, inode);
+	if (unlikely(err < 0)) {
 		unlock_page(page);
-		err = -EFAULT;
 		goto out_sem;
 	}
+	offset = err;
 
 	/* block allocation */
 	__do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, true);
@@ -101,14 +102,8 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	if (PageMappedToDisk(page))
 		goto out_sem;
 
-	/* page is wholly or partially inside EOF */
-	if (((loff_t)(page->index + 1) << PAGE_SHIFT) >
-						i_size_read(inode)) {
-		loff_t offset;
-
-		offset = i_size_read(inode) & ~PAGE_MASK;
+	if (offset != PAGE_SIZE)
 		zero_user_segment(page, offset, PAGE_SIZE);
-	}
 	set_page_dirty(page);
 	if (!PageUptodate(page))
 		SetPageUptodate(page);
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index e25901ae3ff4..663b5071b154 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -1035,23 +1035,14 @@ vm_fault_t iomap_page_mkwrite(struct vm_fault *vmf, const struct iomap_ops *ops)
 	struct page *page = vmf->page;
 	struct inode *inode = file_inode(vmf->vma->vm_file);
 	unsigned long length;
-	loff_t offset, size;
+	loff_t offset;
 	ssize_t ret;
 
 	lock_page(page);
-	size = i_size_read(inode);
-	if ((page->mapping != inode->i_mapping) ||
-	    (page_offset(page) > size)) {
-		/* We overload EFAULT to mean page got truncated */
-		ret = -EFAULT;
+	ret = page_mkwrite_check_truncate(page, inode);
+	if (ret < 0)
 		goto out_unlock;
-	}
-
-	/* page is wholly or partially inside EOF */
-	if (((page->index + 1) << PAGE_SHIFT) > size)
-		length = offset_in_page(size);
-	else
-		length = PAGE_SIZE;
+	length = ret;
 
 	offset = page_offset(page);
 	while (length > 0) {
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index cd52585c8f4f..91f7a1f2db0d 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1563,8 +1563,7 @@ static vm_fault_t ubifs_vm_page_mkwrite(struct vm_fault *vmf)
 	}
 
 	lock_page(page);
-	if (unlikely(page->mapping != inode->i_mapping ||
-		     page_offset(page) > i_size_read(inode))) {
+	if (unlikely(page_mkwrite_check_truncate(page, inode) < 0)) {
 		/* Page got truncated out from underneath us */
 		goto sigbus;
 	}
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 37a4d9e32cd3..5a3f860470ad 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -636,4 +636,28 @@ static inline unsigned long dir_pages(struct inode *inode)
 			       PAGE_SHIFT;
 }
 
+/**
+ * page_mkwrite_check_truncate - check if page was truncated
+ * @page: the page to check
+ * @inode: the inode to check the page against
+ *
+ * Returns the number of bytes in the page up to EOF,
+ * or -EFAULT if the page was truncated.
+ */
+static inline int page_mkwrite_check_truncate(struct page *page,
+					      struct inode *inode)
+{
+	loff_t size = i_size_read(inode);
+	pgoff_t end_index = (size + PAGE_SIZE - 1) >> PAGE_SHIFT;
+
+	if (page->mapping != inode->i_mapping ||
+	    page->index >= end_index)
+		return -EFAULT;
+	if (page->index != size >> PAGE_SHIFT) {
+		/* page is wholly inside EOF */
+		return PAGE_SIZE;
+	}
+	return offset_in_page(size);
+}
+
 #endif /* _LINUX_PAGEMAP_H */
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
