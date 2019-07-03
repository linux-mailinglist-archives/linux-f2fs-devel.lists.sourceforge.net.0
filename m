Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E19C5E833
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Jul 2019 17:53:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hihZL-0006PS-UG; Wed, 03 Jul 2019 15:53:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hihZL-0006PM-8J
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Jul 2019 15:53:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pqhScwpu9leOC+V7dRlQ4/cTr4YKYOB7DS9+iy2k+84=; b=TbiBC519w3saZPi1mVLrLRQ3qv
 p85Wqe3USNsIckyk03TujekD+H7/Gyu0WrK+MxbRZBAFiq+Dz5g3Jx4mclL6zbPpjWPM1yv0FxLeI
 KuOdMKJfeUHYInZh6d/7LpbNBeMDE0LH7D8Eyf18qzFab7XGAWjCGXmrKUMhaLTeNERU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pqhScwpu9leOC+V7dRlQ4/cTr4YKYOB7DS9+iy2k+84=; b=l
 xH5OVpvtF6ZRMFEcXp3YxNF5xmswQIS6dec6Cgk72R8WMjMwAOBmTCRmIAxLQRj4e+Xzx8z3HdND8
 YYEdCaBDnvfC+b84YywCKnI27BocO1lL1z4lc2BeRG2/UArMn2YkcT7mcYip0BEgSaoHADeUs3C7b
 JAAyM73fx/dxOhvQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hihZT-006TQX-2o
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Jul 2019 15:53:25 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4D8BF2189E;
 Wed,  3 Jul 2019 15:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562169197;
 bh=NILayKOHyuxE5KV15gyzhly6Z3NNMb2elNkejzwzRA4=;
 h=From:To:Cc:Subject:Date:From;
 b=eGT3mAuEiCW1P+c10jEZLTJGEENPblV3rcMzwTaCC8pUy4bmDVyhcknrP+1axazNW
 emGtgd76YCBFVy+rI9/EAKX3vM+84UuuYTNK7k1xE8pA1FeTX/KYcIyE0RTrejod8o
 KwuesTSujQvWDfVFkex6TaY93ednPnvhtpQA78zY=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed,  3 Jul 2019 08:53:15 -0700
Message-Id: <20190703155315.69335-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
MIME-Version: 1.0
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hihZT-006TQX-2o
Subject: [f2fs-dev] [PATCH] f2fs: support swap file w/ DIO
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c              | 142 ++++++++++++++++++++++++++++++++++--
 fs/f2fs/f2fs.h              |   5 +-
 include/trace/events/f2fs.h |  11 +--
 3 files changed, 143 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 1e2d924e2ea7..6a8db4abdf5f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -14,6 +14,7 @@
 #include <linux/pagevec.h>
 #include <linux/blkdev.h>
 #include <linux/bio.h>
+#include <linux/swap.h>
 #include <linux/prefetch.h>
 #include <linux/uio.h>
 #include <linux/cleancache.h>
@@ -54,7 +55,7 @@ static bool __is_cp_guaranteed(struct page *page)
 
 static enum count_type __read_io_type(struct page *page)
 {
-	struct address_space *mapping = page->mapping;
+	struct address_space *mapping = page_file_mapping(page);
 
 	if (mapping) {
 		struct inode *inode = mapping->host;
@@ -1585,7 +1586,7 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 	sector_t block_nr;
 	int ret = 0;
 
-	block_in_file = (sector_t)page->index;
+	block_in_file = (sector_t)page_index(page);
 	last_block = block_in_file + nr_pages;
 	last_block_in_file = (i_size_read(inode) + blocksize - 1) >>
 							blkbits;
@@ -1618,7 +1619,8 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 		block_nr = map->m_pblk + block_in_file - map->m_lblk;
 		SetPageMappedToDisk(page);
 
-		if (!PageUptodate(page) && !cleancache_get_page(page)) {
+		if (!PageUptodate(page) && (!PageSwapCache(page) &&
+					!cleancache_get_page(page))) {
 			SetPageUptodate(page);
 			goto confused;
 		}
@@ -1716,7 +1718,7 @@ static int f2fs_mpage_readpages(struct address_space *mapping,
 			prefetchw(&page->flags);
 			list_del(&page->lru);
 			if (add_to_page_cache_lru(page, mapping,
-						  page->index,
+						  page_index(page),
 						  readahead_gfp_mask(mapping)))
 				goto next_page;
 		}
@@ -1740,7 +1742,7 @@ static int f2fs_mpage_readpages(struct address_space *mapping,
 
 static int f2fs_read_data_page(struct file *file, struct page *page)
 {
-	struct inode *inode = page->mapping->host;
+	struct inode *inode = page_file_mapping(page)->host;
 	int ret = -EAGAIN;
 
 	trace_f2fs_readpage(page, DATA);
@@ -1749,7 +1751,8 @@ static int f2fs_read_data_page(struct file *file, struct page *page)
 	if (f2fs_has_inline_data(inode))
 		ret = f2fs_read_inline_data(inode, page);
 	if (ret == -EAGAIN)
-		ret = f2fs_mpage_readpages(page->mapping, NULL, page, 1, false);
+		ret = f2fs_mpage_readpages(page_file_mapping(page),
+						NULL, page, 1, false);
 	return ret;
 }
 
@@ -2851,13 +2854,14 @@ int f2fs_release_page(struct page *page, gfp_t wait)
 
 static int f2fs_set_data_page_dirty(struct page *page)
 {
-	struct address_space *mapping = page->mapping;
-	struct inode *inode = mapping->host;
+	struct inode *inode = page_file_mapping(page)->host;
 
 	trace_f2fs_set_page_dirty(page, DATA);
 
 	if (!PageUptodate(page))
 		SetPageUptodate(page);
+	if (PageSwapCache(page))
+		return __set_page_dirty_nobuffers(page);
 
 	if (f2fs_is_atomic_file(inode) && !f2fs_is_commit_atomic_write(inode)) {
 		if (!IS_ATOMIC_WRITTEN_PAGE(page)) {
@@ -2949,6 +2953,126 @@ int f2fs_migrate_page(struct address_space *mapping,
 }
 #endif
 
+#ifdef CONFIG_SWAP
+/* Copied from generic_swapfile_activate() to check any holes */
+static int check_swap_activate(struct file *swap_file, unsigned int max)
+{
+	struct address_space *mapping = swap_file->f_mapping;
+	struct inode *inode = mapping->host;
+	unsigned blocks_per_page;
+	unsigned long page_no;
+	unsigned blkbits;
+	sector_t probe_block;
+	sector_t last_block;
+	sector_t lowest_block = -1;
+	sector_t highest_block = 0;
+
+	blkbits = inode->i_blkbits;
+	blocks_per_page = PAGE_SIZE >> blkbits;
+
+	/*
+	 * Map all the blocks into the extent list.  This code doesn't try
+	 * to be very smart.
+	 */
+	probe_block = 0;
+	page_no = 0;
+	last_block = i_size_read(inode) >> blkbits;
+	while ((probe_block + blocks_per_page) <= last_block && page_no < max) {
+		unsigned block_in_page;
+		sector_t first_block;
+
+		cond_resched();
+
+		first_block = bmap(inode, probe_block);
+		if (first_block == 0)
+			goto bad_bmap;
+
+		/*
+		 * It must be PAGE_SIZE aligned on-disk
+		 */
+		if (first_block & (blocks_per_page - 1)) {
+			probe_block++;
+			goto reprobe;
+		}
+
+		for (block_in_page = 1; block_in_page < blocks_per_page;
+					block_in_page++) {
+			sector_t block;
+
+			block = bmap(inode, probe_block + block_in_page);
+			if (block == 0)
+				goto bad_bmap;
+			if (block != first_block + block_in_page) {
+				/* Discontiguity */
+				probe_block++;
+				goto reprobe;
+			}
+		}
+
+		first_block >>= (PAGE_SHIFT - blkbits);
+		if (page_no) {	/* exclude the header page */
+			if (first_block < lowest_block)
+				lowest_block = first_block;
+			if (first_block > highest_block)
+				highest_block = first_block;
+		}
+
+		page_no++;
+		probe_block += blocks_per_page;
+reprobe:
+		continue;
+	}
+	return 0;
+
+bad_bmap:
+	pr_err("swapon: swapfile has holes\n");
+	return -EINVAL;
+}
+
+static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
+				sector_t *span)
+{
+	struct inode *inode = file_inode(file);
+	int ret;
+
+	if (!S_ISREG(inode->i_mode))
+		return -EINVAL;
+
+	if (f2fs_readonly(F2FS_I_SB(inode)->sb))
+		return -EROFS;
+
+	ret = f2fs_convert_inline_inode(inode);
+	if (ret)
+		return ret;
+
+	ret = check_swap_activate(file, sis->max);
+	if (ret)
+		return ret;
+
+	set_inode_flag(inode, FI_PIN_FILE);
+	f2fs_precache_extents(inode);
+	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
+	return 0;
+}
+
+static void f2fs_swap_deactivate(struct file *file)
+{
+	struct inode *inode = file_inode(file);
+
+	clear_inode_flag(inode, FI_PIN_FILE);
+}
+#else
+static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
+				sector_t *span)
+{
+	return -EOPNOTSUPP;
+}
+
+static void f2fs_swap_deactivate(struct file *file)
+{
+}
+#endif
+
 const struct address_space_operations f2fs_dblock_aops = {
 	.readpage	= f2fs_read_data_page,
 	.readpages	= f2fs_read_data_pages,
@@ -2961,6 +3085,8 @@ const struct address_space_operations f2fs_dblock_aops = {
 	.releasepage	= f2fs_release_page,
 	.direct_IO	= f2fs_direct_IO,
 	.bmap		= f2fs_bmap,
+	.swap_activate  = f2fs_swap_activate,
+	.swap_deactivate = f2fs_swap_deactivate,
 #ifdef CONFIG_MIGRATION
 	.migratepage    = f2fs_migrate_page,
 #endif
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 761c5a59ef77..17382da7f0bd 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1498,7 +1498,7 @@ static inline struct f2fs_sb_info *F2FS_M_SB(struct address_space *mapping)
 
 static inline struct f2fs_sb_info *F2FS_P_SB(struct page *page)
 {
-	return F2FS_M_SB(page->mapping);
+	return F2FS_M_SB(page_file_mapping(page));
 }
 
 static inline struct f2fs_super_block *F2FS_RAW_SUPER(struct f2fs_sb_info *sbi)
@@ -3683,7 +3683,8 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
 	if (test_opt(sbi, LFS) && (rw == WRITE) &&
 				block_unaligned_IO(inode, iocb, iter))
 		return true;
-	if (is_sbi_flag_set(F2FS_I_SB(inode), SBI_CP_DISABLED))
+	if (is_sbi_flag_set(F2FS_I_SB(inode), SBI_CP_DISABLED) &&
+					!(inode->i_flags & S_SWAPFILE))
 		return true;
 
 	return false;
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 53b96f12300c..af79e0c72926 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1028,8 +1028,8 @@ DECLARE_EVENT_CLASS(f2fs__submit_page_bio,
 	),
 
 	TP_fast_assign(
-		__entry->dev		= page->mapping->host->i_sb->s_dev;
-		__entry->ino		= page->mapping->host->i_ino;
+		__entry->dev		= page_file_mapping(page)->host->i_sb->s_dev;
+		__entry->ino		= page_file_mapping(page)->host->i_ino;
 		__entry->index		= page->index;
 		__entry->old_blkaddr	= fio->old_blkaddr;
 		__entry->new_blkaddr	= fio->new_blkaddr;
@@ -1216,10 +1216,11 @@ DECLARE_EVENT_CLASS(f2fs__page,
 	),
 
 	TP_fast_assign(
-		__entry->dev	= page->mapping->host->i_sb->s_dev;
-		__entry->ino	= page->mapping->host->i_ino;
+		__entry->dev	= page_file_mapping(page)->host->i_sb->s_dev;
+		__entry->ino	= page_file_mapping(page)->host->i_ino;
 		__entry->type	= type;
-		__entry->dir	= S_ISDIR(page->mapping->host->i_mode);
+		__entry->dir	=
+			S_ISDIR(page_file_mapping(page)->host->i_mode);
 		__entry->index	= page->index;
 		__entry->dirty	= PageDirty(page);
 		__entry->uptodate = PageUptodate(page);
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
