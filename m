Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 333E53C9FE0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jul 2021 15:41:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m41bu-0002Qn-V7; Thu, 15 Jul 2021 13:41:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jack@suse.cz>) id 1m41bt-0002QV-8W
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 15 Jul 2021 13:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5kdSAKsBJX05O6PW1p3o6TYA39W8qYt2DGkkk4S4/kQ=; b=LxtKMuOE3WAeJif9o7xunlU/Ea
 KXf0JsSRsKMtuwUVd3FLE+UoPhE5t8Dk+Y2cCh0JAw9Lq5RQUDLT5Z8EjZkPPq+94ui5g/7a4WgI/
 3SR4PgVRucY4QVlH7ZtGjSiCWP1EsEGfejBpCXcoHJ9DTYbBPqjfGfAHWO1BMOHJYJ30=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5kdSAKsBJX05O6PW1p3o6TYA39W8qYt2DGkkk4S4/kQ=; b=PiCZPsmqqvmUNeYpcfHTlFmgpe
 e8Uo7ET7xQGVAXJr8lZsbtUANfCClcLLNRLXSj5ef7D/aV6i/xGjDPTWBxOg2bOMH8uAvoAGJ5HHs
 PI1Cj/wJu8Oc0mswWKCgj6Uqd94FSLlfPtv8zB8/KtlroRLQUfhN5cowbJWMLZJsUX6E=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m41bm-009HVU-82
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 15 Jul 2021 13:41:05 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 8F65F20304;
 Thu, 15 Jul 2021 13:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626356433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5kdSAKsBJX05O6PW1p3o6TYA39W8qYt2DGkkk4S4/kQ=;
 b=3XUFXco26UlIAFoIhyrMAGYKqoaGAtjr5M22ru99fAExwICGu2Aycr1RDo6ZBueuEBmDiK
 4GySCwEagLTBrS7fwEsO+Yos+/PcaB78d4dJJ7WypEQhIRLReC8MprcO2Dj/NDc3+xlrDI
 /VGCiOu0xGMHvs/LNB5KN6mwjNATGvQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626356433;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5kdSAKsBJX05O6PW1p3o6TYA39W8qYt2DGkkk4S4/kQ=;
 b=EiTy/ROu2RpSBfAzRKNeIf644SvYpj2g4+7nWUUHkT1bVNogaP4+wRtij4q+bKVc2llvcI
 JDEJnPgRVVKSG8Bg==
Received: from quack2.suse.cz (unknown [10.100.200.198])
 by relay2.suse.de (Postfix) with ESMTP id 70EAEA3BA5;
 Thu, 15 Jul 2021 13:40:33 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 2EF8F1E10D0; Thu, 15 Jul 2021 15:40:33 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: <linux-fsdevel@vger.kernel.org>
Date: Thu, 15 Jul 2021 15:40:22 +0200
Message-Id: <20210715134032.24868-12-jack@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210715133202.5975-1-jack@suse.cz>
References: <20210715133202.5975-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11364; h=from:subject;
 bh=qKqrDpSCySAmtBk8soUR3MiHRWNda/DcWPoF/c1NqFg=;
 b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBg8DrF+GKb68GT3PotXniFusnpGhisHoCXVE8B8x+T
 nFB1o5SJATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCYPA6xQAKCRCcnaoHP2RA2V7cCA
 CIUmBd6bFD+g9WyXetY5vRLgdICbd2NSjHZ6kvKO354+gGOGwgvlcYf7gFA+PvTSEC8C/d9AFjpc/9
 rARsSCI2Vdt7hQRSsnVXqtBD/IO4b1R5pUEVITzXRTqKAi/2lIvtY1Pu/tUCNlpktHkdxqcNGLxMaf
 jUCqZRfqPCd1BBKdKX5wXLRQ8fD49P6JOyAbwm/nrkY8obhZwTdUZlRiP7thbiIMWyE+Cuk9WtZHke
 v5bwOv6i6zLPDw1APa2Q48J1ICrW4vvu1qPp8BJik6FL+TPRqdNF+QfuO0TPvCaLuSVAAFcpVk0PVj
 0j8Lzdiz71rLUfQPPr389a8bCmTlgj
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
X-Headers-End: 1m41bm-009HVU-82
Subject: [f2fs-dev] [PATCH 12/14] fuse: Convert to using invalidate_lock
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
 Miklos Szeredi <mszeredi@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Jan Kara <jack@suse.cz>, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use invalidate_lock instead of fuse's private i_mmap_sem. The intended
purpose is exactly the same. By this conversion we fix a long standing
race between hole punching and read(2) / readahead(2) paths that can
lead to stale page cache contents.

CC: Miklos Szeredi <miklos@szeredi.hu>
Reviewed-by: Miklos Szeredi <mszeredi@redhat.com>
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/fuse/dax.c    | 50 +++++++++++++++++++++++-------------------------
 fs/fuse/dir.c    | 11 ++++++-----
 fs/fuse/file.c   | 10 +++++-----
 fs/fuse/fuse_i.h |  7 -------
 fs/fuse/inode.c  |  1 -
 5 files changed, 35 insertions(+), 44 deletions(-)

diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
index e55723744f58..fc05ce59579d 100644
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@ -444,12 +444,12 @@ static int fuse_setup_new_dax_mapping(struct inode *inode, loff_t pos,
 	/*
 	 * Can't do inline reclaim in fault path. We call
 	 * dax_layout_busy_page() before we free a range. And
-	 * fuse_wait_dax_page() drops fi->i_mmap_sem lock and requires it.
-	 * In fault path we enter with fi->i_mmap_sem held and can't drop
-	 * it. Also in fault path we hold fi->i_mmap_sem shared and not
-	 * exclusive, so that creates further issues with fuse_wait_dax_page().
-	 * Hence return -EAGAIN and fuse_dax_fault() will wait for a memory
-	 * range to become free and retry.
+	 * fuse_wait_dax_page() drops mapping->invalidate_lock and requires it.
+	 * In fault path we enter with mapping->invalidate_lock held and can't
+	 * drop it. Also in fault path we hold mapping->invalidate_lock shared
+	 * and not exclusive, so that creates further issues with
+	 * fuse_wait_dax_page().  Hence return -EAGAIN and fuse_dax_fault()
+	 * will wait for a memory range to become free and retry.
 	 */
 	if (flags & IOMAP_FAULT) {
 		alloc_dmap = alloc_dax_mapping(fcd);
@@ -513,7 +513,7 @@ static int fuse_upgrade_dax_mapping(struct inode *inode, loff_t pos,
 	down_write(&fi->dax->sem);
 	node = interval_tree_iter_first(&fi->dax->tree, idx, idx);
 
-	/* We are holding either inode lock or i_mmap_sem, and that should
+	/* We are holding either inode lock or invalidate_lock, and that should
 	 * ensure that dmap can't be truncated. We are holding a reference
 	 * on dmap and that should make sure it can't be reclaimed. So dmap
 	 * should still be there in tree despite the fact we dropped and
@@ -660,14 +660,12 @@ static const struct iomap_ops fuse_iomap_ops = {
 
 static void fuse_wait_dax_page(struct inode *inode)
 {
-	struct fuse_inode *fi = get_fuse_inode(inode);
-
-	up_write(&fi->i_mmap_sem);
+	filemap_invalidate_unlock(inode->i_mapping);
 	schedule();
-	down_write(&fi->i_mmap_sem);
+	filemap_invalidate_lock(inode->i_mapping);
 }
 
-/* Should be called with fi->i_mmap_sem lock held exclusively */
+/* Should be called with mapping->invalidate_lock held exclusively */
 static int __fuse_dax_break_layouts(struct inode *inode, bool *retry,
 				    loff_t start, loff_t end)
 {
@@ -813,18 +811,18 @@ static vm_fault_t __fuse_dax_fault(struct vm_fault *vmf,
 	 * we do not want any read/write/mmap to make progress and try
 	 * to populate page cache or access memory we are trying to free.
 	 */
-	down_read(&get_fuse_inode(inode)->i_mmap_sem);
+	filemap_invalidate_lock_shared(inode->i_mapping);
 	ret = dax_iomap_fault(vmf, pe_size, &pfn, &error, &fuse_iomap_ops);
 	if ((ret & VM_FAULT_ERROR) && error == -EAGAIN) {
 		error = 0;
 		retry = true;
-		up_read(&get_fuse_inode(inode)->i_mmap_sem);
+		filemap_invalidate_unlock_shared(inode->i_mapping);
 		goto retry;
 	}
 
 	if (ret & VM_FAULT_NEEDDSYNC)
 		ret = dax_finish_sync_fault(vmf, pe_size, pfn);
-	up_read(&get_fuse_inode(inode)->i_mmap_sem);
+	filemap_invalidate_unlock_shared(inode->i_mapping);
 
 	if (write)
 		sb_end_pagefault(sb);
@@ -960,7 +958,7 @@ inode_inline_reclaim_one_dmap(struct fuse_conn_dax *fcd, struct inode *inode,
 	int ret;
 	struct interval_tree_node *node;
 
-	down_write(&fi->i_mmap_sem);
+	filemap_invalidate_lock(inode->i_mapping);
 
 	/* Lookup a dmap and corresponding file offset to reclaim. */
 	down_read(&fi->dax->sem);
@@ -1021,7 +1019,7 @@ inode_inline_reclaim_one_dmap(struct fuse_conn_dax *fcd, struct inode *inode,
 out_write_dmap_sem:
 	up_write(&fi->dax->sem);
 out_mmap_sem:
-	up_write(&fi->i_mmap_sem);
+	filemap_invalidate_unlock(inode->i_mapping);
 	return dmap;
 }
 
@@ -1050,10 +1048,10 @@ alloc_dax_mapping_reclaim(struct fuse_conn_dax *fcd, struct inode *inode)
 		 * had a reference or some other temporary failure,
 		 * Try again. We want to give up inline reclaim only
 		 * if there is no range assigned to this node. Otherwise
-		 * if a deadlock is possible if we sleep with fi->i_mmap_sem
-		 * held and worker to free memory can't make progress due
-		 * to unavailability of fi->i_mmap_sem lock. So sleep
-		 * only if fi->dax->nr=0
+		 * if a deadlock is possible if we sleep with
+		 * mapping->invalidate_lock held and worker to free memory
+		 * can't make progress due to unavailability of
+		 * mapping->invalidate_lock.  So sleep only if fi->dax->nr=0
 		 */
 		if (retry)
 			continue;
@@ -1061,8 +1059,8 @@ alloc_dax_mapping_reclaim(struct fuse_conn_dax *fcd, struct inode *inode)
 		 * There are no mappings which can be reclaimed. Wait for one.
 		 * We are not holding fi->dax->sem. So it is possible
 		 * that range gets added now. But as we are not holding
-		 * fi->i_mmap_sem, worker should still be able to free up
-		 * a range and wake us up.
+		 * mapping->invalidate_lock, worker should still be able to
+		 * free up a range and wake us up.
 		 */
 		if (!fi->dax->nr && !(fcd->nr_free_ranges > 0)) {
 			if (wait_event_killable_exclusive(fcd->range_waitq,
@@ -1108,7 +1106,7 @@ static int lookup_and_reclaim_dmap_locked(struct fuse_conn_dax *fcd,
 /*
  * Free a range of memory.
  * Locking:
- * 1. Take fi->i_mmap_sem to block dax faults.
+ * 1. Take mapping->invalidate_lock to block dax faults.
  * 2. Take fi->dax->sem to protect interval tree and also to make sure
  *    read/write can not reuse a dmap which we might be freeing.
  */
@@ -1122,7 +1120,7 @@ static int lookup_and_reclaim_dmap(struct fuse_conn_dax *fcd,
 	loff_t dmap_start = start_idx << FUSE_DAX_SHIFT;
 	loff_t dmap_end = (dmap_start + FUSE_DAX_SZ) - 1;
 
-	down_write(&fi->i_mmap_sem);
+	filemap_invalidate_lock(inode->i_mapping);
 	ret = fuse_dax_break_layouts(inode, dmap_start, dmap_end);
 	if (ret) {
 		pr_debug("virtio_fs: fuse_dax_break_layouts() failed. err=%d\n",
@@ -1134,7 +1132,7 @@ static int lookup_and_reclaim_dmap(struct fuse_conn_dax *fcd,
 	ret = lookup_and_reclaim_dmap_locked(fcd, inode, start_idx);
 	up_write(&fi->dax->sem);
 out_mmap_sem:
-	up_write(&fi->i_mmap_sem);
+	filemap_invalidate_unlock(inode->i_mapping);
 	return ret;
 }
 
diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index eade6f965b2e..d9b977c0f38d 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -1556,6 +1556,7 @@ int fuse_do_setattr(struct dentry *dentry, struct iattr *attr,
 	struct fuse_mount *fm = get_fuse_mount(inode);
 	struct fuse_conn *fc = fm->fc;
 	struct fuse_inode *fi = get_fuse_inode(inode);
+	struct address_space *mapping = inode->i_mapping;
 	FUSE_ARGS(args);
 	struct fuse_setattr_in inarg;
 	struct fuse_attr_out outarg;
@@ -1580,11 +1581,11 @@ int fuse_do_setattr(struct dentry *dentry, struct iattr *attr,
 	}
 
 	if (FUSE_IS_DAX(inode) && is_truncate) {
-		down_write(&fi->i_mmap_sem);
+		filemap_invalidate_lock(mapping);
 		fault_blocked = true;
 		err = fuse_dax_break_layouts(inode, 0, 0);
 		if (err) {
-			up_write(&fi->i_mmap_sem);
+			filemap_invalidate_unlock(mapping);
 			return err;
 		}
 	}
@@ -1694,13 +1695,13 @@ int fuse_do_setattr(struct dentry *dentry, struct iattr *attr,
 	if ((is_truncate || !is_wb) &&
 	    S_ISREG(inode->i_mode) && oldsize != outarg.attr.size) {
 		truncate_pagecache(inode, outarg.attr.size);
-		invalidate_inode_pages2(inode->i_mapping);
+		invalidate_inode_pages2(mapping);
 	}
 
 	clear_bit(FUSE_I_SIZE_UNSTABLE, &fi->state);
 out:
 	if (fault_blocked)
-		up_write(&fi->i_mmap_sem);
+		filemap_invalidate_unlock(mapping);
 
 	return 0;
 
@@ -1711,7 +1712,7 @@ int fuse_do_setattr(struct dentry *dentry, struct iattr *attr,
 	clear_bit(FUSE_I_SIZE_UNSTABLE, &fi->state);
 
 	if (fault_blocked)
-		up_write(&fi->i_mmap_sem);
+		filemap_invalidate_unlock(mapping);
 	return err;
 }
 
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 97f860cfc195..621a662c19fb 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -243,7 +243,7 @@ int fuse_open_common(struct inode *inode, struct file *file, bool isdir)
 	}
 
 	if (dax_truncate) {
-		down_write(&get_fuse_inode(inode)->i_mmap_sem);
+		filemap_invalidate_lock(inode->i_mapping);
 		err = fuse_dax_break_layouts(inode, 0, 0);
 		if (err)
 			goto out;
@@ -255,7 +255,7 @@ int fuse_open_common(struct inode *inode, struct file *file, bool isdir)
 
 out:
 	if (dax_truncate)
-		up_write(&get_fuse_inode(inode)->i_mmap_sem);
+		filemap_invalidate_unlock(inode->i_mapping);
 
 	if (is_wb_truncate | dax_truncate) {
 		fuse_release_nowrite(inode);
@@ -2920,7 +2920,7 @@ static long fuse_file_fallocate(struct file *file, int mode, loff_t offset,
 	if (lock_inode) {
 		inode_lock(inode);
 		if (block_faults) {
-			down_write(&fi->i_mmap_sem);
+			filemap_invalidate_lock(inode->i_mapping);
 			err = fuse_dax_break_layouts(inode, 0, 0);
 			if (err)
 				goto out;
@@ -2976,7 +2976,7 @@ static long fuse_file_fallocate(struct file *file, int mode, loff_t offset,
 		clear_bit(FUSE_I_SIZE_UNSTABLE, &fi->state);
 
 	if (block_faults)
-		up_write(&fi->i_mmap_sem);
+		filemap_invalidate_unlock(inode->i_mapping);
 
 	if (lock_inode)
 		inode_unlock(inode);
@@ -3045,7 +3045,7 @@ static ssize_t __fuse_copy_file_range(struct file *file_in, loff_t pos_in,
 	 * modifications.  Yet this does give less guarantees than if the
 	 * copying was performed with write(2).
 	 *
-	 * To fix this a i_mmap_sem style lock could be used to prevent new
+	 * To fix this a mapping->invalidate_lock could be used to prevent new
 	 * faults while the copy is ongoing.
 	 */
 	err = fuse_writeback_range(inode_out, pos_out, pos_out + len - 1);
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 07829ce78695..6fb639b97ea8 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -149,13 +149,6 @@ struct fuse_inode {
 	/** Lock to protect write related fields */
 	spinlock_t lock;
 
-	/**
-	 * Can't take inode lock in fault path (leads to circular dependency).
-	 * Introduce another semaphore which can be taken in fault path and
-	 * then other filesystem paths can take this to block faults.
-	 */
-	struct rw_semaphore i_mmap_sem;
-
 #ifdef CONFIG_FUSE_DAX
 	/*
 	 * Dax specific inode data
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index b9beb39a4a18..e07e429f32e1 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -85,7 +85,6 @@ static struct inode *fuse_alloc_inode(struct super_block *sb)
 	fi->orig_ino = 0;
 	fi->state = 0;
 	mutex_init(&fi->mutex);
-	init_rwsem(&fi->i_mmap_sem);
 	spin_lock_init(&fi->lock);
 	fi->forget = fuse_alloc_forget();
 	if (!fi->forget)
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
