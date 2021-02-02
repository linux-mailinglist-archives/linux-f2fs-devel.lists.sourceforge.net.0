Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9288230B918
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Feb 2021 09:02:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l6qdU-0003x1-Gp; Tue, 02 Feb 2021 08:02:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1l6qdR-0003wp-JW
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Feb 2021 08:02:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NHyESPsY3T/lW1fpY3lopSwzswNXr5oHkr/d8AIid+Y=; b=WySb07vFchMk2FmWXB96kOXZq4
 2cstHc0vXCQWrc2zIm5QHVJ5hBaf3SKM4/Hg+eMqv6Da0PGjsYNDwP8InR47zdWOFNtsV3N+v4I0H
 nvlG1sdjJria2bXI8zYEBXywmRPSJ2Zc6qnN7c/ESEthbCAQCw6QXU4COMeOLeJQkff8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NHyESPsY3T/lW1fpY3lopSwzswNXr5oHkr/d8AIid+Y=; b=m
 F9Sh+JLdPHTuXqS5XMo5uVmYDdnYQJwsj3SDMLOGfGC19M6OD/doB33nz3DNf180EsY4m3s8Z5pQo
 njn8ixF41OzXcCkLeIQenJgGl+zoC8oJGcIoRn9zyfq+srNc8JcR55cv50pCAqcUCs+6jKpRX3UFo
 mXVoGJcXSZ4G0Upc=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1l6qdK-0002A9-8i
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Feb 2021 08:02:05 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DVHL53mpNzjHnL;
 Tue,  2 Feb 2021 16:00:29 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Tue, 2 Feb 2021 16:01:40 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 2 Feb 2021 16:00:56 +0800
Message-ID: <20210202080056.51658-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1l6qdK-0002A9-8i
Subject: [f2fs-dev] [PATCH v4] f2fs: compress: add compress_inode to cache
 compressed blockst
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Support to use address space of inner inode to cache compressed block,
in order to improve cache hit ratio of random read.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v4:
- detect truncation during f2fs_cache_compressed_page()
- don't set PageUptodate for temporary page in f2fs_load_compressed_page()
- avoid changing compress_cache option from remount
- call f2fs_invalidate_compress_pages() from releasepage()/invalidatepage()
- fix use-after-free on @dic->nr_cpages
- fix to call f2fs_wait_on_block_writeback() before f2fs_load_compressed_page()
 Documentation/filesystems/f2fs.rst |   3 +
 fs/f2fs/compress.c                 | 177 ++++++++++++++++++++++++++++-
 fs/f2fs/data.c                     |  32 +++++-
 fs/f2fs/debug.c                    |  13 +++
 fs/f2fs/f2fs.h                     |  39 ++++++-
 fs/f2fs/gc.c                       |   1 +
 fs/f2fs/inode.c                    |  21 +++-
 fs/f2fs/segment.c                  |   6 +-
 fs/f2fs/super.c                    |  26 ++++-
 include/linux/f2fs_fs.h            |   1 +
 10 files changed, 305 insertions(+), 14 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 475994ed8b15..61b4c2999170 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -283,6 +283,9 @@ compress_mode=%s	 Control file compression mode. This supports "fs" and "user"
 			 choosing the target file and the timing. The user can do manual
 			 compression/decompression on the compression enabled files using
 			 ioctls.
+compress_cache		 Support to use address space of a filesystem managed inode to
+			 cache compressed block, in order to improve cache hit ratio of
+			 random read.
 inlinecrypt		 When possible, encrypt/decrypt the contents of encrypted
 			 files using the blk-crypto framework rather than
 			 filesystem-layer encryption. This allows the use of
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 77fa342de38f..ad38c05e3f14 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -12,9 +12,11 @@
 #include <linux/lzo.h>
 #include <linux/lz4.h>
 #include <linux/zstd.h>
+#include <linux/pagevec.h>
 
 #include "f2fs.h"
 #include "node.h"
+#include "segment.h"
 #include <trace/events/f2fs.h>
 
 static struct kmem_cache *cic_entry_slab;
@@ -756,7 +758,7 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 	return ret;
 }
 
-static void f2fs_decompress_cluster(struct decompress_io_ctx *dic)
+void f2fs_decompress_cluster(struct decompress_io_ctx *dic)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dic->inode);
 	struct f2fs_inode_info *fi = F2FS_I(dic->inode);
@@ -855,7 +857,8 @@ static void f2fs_decompress_cluster(struct decompress_io_ctx *dic)
  * page being waited on in the cluster, and if so, it decompresses the cluster
  * (or in the case of a failure, cleans up without actually decompressing).
  */
-void f2fs_end_read_compressed_page(struct page *page, bool failed)
+void f2fs_end_read_compressed_page(struct page *page, bool failed,
+						block_t blkaddr)
 {
 	struct decompress_io_ctx *dic =
 			(struct decompress_io_ctx *)page_private(page);
@@ -865,6 +868,9 @@ void f2fs_end_read_compressed_page(struct page *page, bool failed)
 
 	if (failed)
 		WRITE_ONCE(dic->failed, true);
+	else if (blkaddr)
+		f2fs_cache_compressed_page(sbi, page,
+					dic->inode->i_ino, blkaddr);
 
 	if (atomic_dec_and_test(&dic->remaining_pages))
 		f2fs_decompress_cluster(dic);
@@ -1705,6 +1711,173 @@ void f2fs_put_page_dic(struct page *page)
 	f2fs_put_dic(dic);
 }
 
+const struct address_space_operations f2fs_compress_aops = {
+	.releasepage = f2fs_release_page,
+	.invalidatepage = f2fs_invalidate_page,
+};
+
+struct address_space *COMPRESS_MAPPING(struct f2fs_sb_info *sbi)
+{
+	return sbi->compress_inode->i_mapping;
+}
+
+void f2fs_invalidate_compress_page(struct f2fs_sb_info *sbi, block_t blkaddr)
+{
+	if (!sbi->compress_inode)
+		return;
+	invalidate_mapping_pages(COMPRESS_MAPPING(sbi), blkaddr, blkaddr);
+}
+
+void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
+						nid_t ino, block_t blkaddr)
+{
+	struct page *cpage;
+	int ret;
+	struct sysinfo si;
+	unsigned long free_ram, avail_ram;
+
+	if (!test_opt(sbi, COMPRESS_CACHE))
+		return;
+
+	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE_READ))
+		return;
+
+	si_meminfo(&si);
+	free_ram = si.freeram;
+	avail_ram = si.totalram - si.totalhigh;
+
+	/* free memory is lower than watermark, deny caching compress page */
+	if (free_ram <= sbi->compress_watermark / 100 * avail_ram)
+		return;
+
+	/* cached page count exceed threshold, deny caching compress page */
+	if (COMPRESS_MAPPING(sbi)->nrpages >=
+			free_ram / 100 * sbi->compress_percent)
+		return;
+
+	cpage = find_get_page(COMPRESS_MAPPING(sbi), blkaddr);
+	if (cpage) {
+		f2fs_put_page(cpage, 0);
+		return;
+	}
+
+	cpage = alloc_page(__GFP_IO);
+	if (!cpage)
+		return;
+
+	ret = add_to_page_cache_lru(cpage, COMPRESS_MAPPING(sbi),
+						blkaddr, GFP_NOFS);
+	if (ret) {
+		f2fs_put_page(cpage, 0);
+		return;
+	}
+
+	f2fs_set_page_private(cpage, ino);
+
+	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE_READ))
+		goto out;
+
+	memcpy(page_address(cpage), page_address(page), PAGE_SIZE);
+	SetPageUptodate(cpage);
+out:
+	f2fs_put_page(cpage, 1);
+}
+
+bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
+								block_t blkaddr)
+{
+	struct page *cpage;
+	bool hitted = false;
+
+	if (!test_opt(sbi, COMPRESS_CACHE))
+		return false;
+
+	cpage = f2fs_pagecache_get_page(COMPRESS_MAPPING(sbi),
+				blkaddr, FGP_LOCK | FGP_NOWAIT, GFP_NOFS);
+	if (cpage) {
+		if (PageUptodate(cpage)) {
+			atomic_inc(&sbi->compress_page_hit);
+			memcpy(page_address(page),
+				page_address(cpage), PAGE_SIZE);
+			hitted = true;
+		}
+		f2fs_put_page(cpage, 1);
+	}
+
+	return hitted;
+}
+
+void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino)
+{
+	struct address_space *mapping = sbi->compress_inode->i_mapping;
+	struct pagevec pvec;
+	pgoff_t index = 0;
+	pgoff_t end = MAX_BLKADDR(sbi);
+
+	pagevec_init(&pvec);
+
+	do {
+		unsigned int nr_pages;
+		int i;
+
+		nr_pages = pagevec_lookup_range(&pvec, mapping,
+						&index, end - 1);
+		if (!nr_pages)
+			break;
+
+		for (i = 0; i < nr_pages; i++) {
+			struct page *page = pvec.pages[i];
+
+			if (page->index > end)
+				break;
+
+			lock_page(page);
+			if (page->mapping != mapping) {
+				unlock_page(page);
+				continue;
+			}
+
+			if (ino != page_private(page)) {
+				unlock_page(page);
+				continue;
+			}
+
+			generic_error_remove_page(mapping, page);
+			unlock_page(page);
+		}
+		pagevec_release(&pvec);
+		cond_resched();
+	} while (index < end);
+}
+
+int f2fs_init_compress_inode(struct f2fs_sb_info *sbi)
+{
+	struct inode *inode;
+
+	if (!test_opt(sbi, COMPRESS_CACHE))
+		return 0;
+
+	inode = f2fs_iget(sbi->sb, F2FS_COMPRESS_INO(sbi));
+	if (IS_ERR(inode))
+		return PTR_ERR(inode);
+	sbi->compress_inode = inode;
+
+	sbi->compress_percent = COMPRESS_PERCENT;
+	sbi->compress_watermark = COMPRESS_WATERMARK;
+
+	atomic_set(&sbi->compress_page_hit, 0);
+
+	return 0;
+}
+
+void f2fs_destroy_compress_inode(struct f2fs_sb_info *sbi)
+{
+	if (!sbi->compress_inode)
+		return;
+	iput(sbi->compress_inode);
+	sbi->compress_inode = NULL;
+}
+
 int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi)
 {
 	dev_t dev = sbi->sb->s_bdev->bd_dev;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 38476d0d3916..5a58a16fe679 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -152,7 +152,7 @@ static void f2fs_finish_read_bio(struct bio *bio)
 
 		if (f2fs_is_compressed_page(page)) {
 			if (bio->bi_status)
-				f2fs_end_read_compressed_page(page, true);
+				f2fs_end_read_compressed_page(page, true, 0);
 			f2fs_put_page_dic(page);
 			continue;
 		}
@@ -248,15 +248,19 @@ static void f2fs_handle_step_decompress(struct bio_post_read_ctx *ctx)
 	struct bio_vec *bv;
 	struct bvec_iter_all iter_all;
 	bool all_compressed = true;
+	block_t blkaddr = SECTOR_TO_BLOCK(ctx->bio->bi_iter.bi_sector);
 
 	bio_for_each_segment_all(bv, ctx->bio, iter_all) {
 		struct page *page = bv->bv_page;
 
 		/* PG_error was set if decryption failed. */
 		if (f2fs_is_compressed_page(page))
-			f2fs_end_read_compressed_page(page, PageError(page));
+			f2fs_end_read_compressed_page(page, PageError(page),
+						blkaddr);
 		else
 			all_compressed = false;
+
+		blkaddr++;
 	}
 
 	/*
@@ -1381,9 +1385,11 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
 	old_blkaddr = dn->data_blkaddr;
 	f2fs_allocate_data_block(sbi, NULL, old_blkaddr, &dn->data_blkaddr,
 				&sum, seg_type, NULL);
-	if (GET_SEGNO(sbi, old_blkaddr) != NULL_SEGNO)
+	if (GET_SEGNO(sbi, old_blkaddr) != NULL_SEGNO) {
 		invalidate_mapping_pages(META_MAPPING(sbi),
 					old_blkaddr, old_blkaddr);
+		f2fs_invalidate_compress_page(sbi, old_blkaddr);
+	}
 	f2fs_update_data_blkaddr(dn, dn->data_blkaddr);
 
 	/*
@@ -2193,7 +2199,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		goto out_put_dnode;
 	}
 
-	for (i = 0; i < dic->nr_cpages; i++) {
+	for (i = 0; i < cc->nr_cpages; i++) {
 		struct page *page = dic->cpages[i];
 		block_t blkaddr;
 		struct bio_post_read_ctx *ctx;
@@ -2201,6 +2207,14 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		blkaddr = data_blkaddr(dn.inode, dn.node_page,
 						dn.ofs_in_node + i + 1);
 
+		f2fs_wait_on_block_writeback(inode, blkaddr);
+
+		if (f2fs_load_compressed_page(sbi, page, blkaddr)) {
+			if (atomic_dec_and_test(&dic->remaining_pages))
+				f2fs_decompress_cluster(dic);
+			continue;
+		}
+
 		if (bio && (!page_is_mergeable(sbi, bio,
 					*last_block_in_bio, blkaddr) ||
 		    !f2fs_crypt_mergeable_bio(bio, inode, page->index, NULL))) {
@@ -2222,8 +2236,6 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 			}
 		}
 
-		f2fs_wait_on_block_writeback(inode, blkaddr);
-
 		if (bio_add_page(bio, page, blocksize, 0) < blocksize)
 			goto submit_and_realloc;
 
@@ -3637,6 +3649,9 @@ void f2fs_invalidate_page(struct page *page, unsigned int offset,
 
 	clear_cold_data(page);
 
+	if (test_opt(sbi, COMPRESS_CACHE) && f2fs_compressed_file(inode))
+		f2fs_invalidate_compress_pages(sbi, inode->i_ino);
+
 	if (IS_ATOMIC_WRITTEN_PAGE(page))
 		return f2fs_drop_inmem_page(inode, page);
 
@@ -3653,6 +3668,11 @@ int f2fs_release_page(struct page *page, gfp_t wait)
 	if (IS_ATOMIC_WRITTEN_PAGE(page))
 		return 0;
 
+	if (test_opt(F2FS_P_SB(page), COMPRESS_CACHE) &&
+			f2fs_compressed_file(page->mapping->host))
+		f2fs_invalidate_compress_pages(F2FS_P_SB(page),
+					page->mapping->host->i_ino);
+
 	clear_cold_data(page);
 	f2fs_clear_page_private(page);
 	return 1;
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 91855d5721cd..3560ce89464a 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -152,6 +152,12 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 		si->node_pages = NODE_MAPPING(sbi)->nrpages;
 	if (sbi->meta_inode)
 		si->meta_pages = META_MAPPING(sbi)->nrpages;
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+	if (sbi->compress_inode) {
+		si->compress_pages = COMPRESS_MAPPING(sbi)->nrpages;
+		si->compress_page_hit = atomic_read(&sbi->compress_page_hit);
+	}
+#endif
 	si->nats = NM_I(sbi)->nat_cnt[TOTAL_NAT];
 	si->dirty_nats = NM_I(sbi)->nat_cnt[DIRTY_NAT];
 	si->sits = MAIN_SEGS(sbi);
@@ -306,6 +312,12 @@ static void update_mem_info(struct f2fs_sb_info *sbi)
 		unsigned npages = META_MAPPING(sbi)->nrpages;
 		si->page_mem += (unsigned long long)npages << PAGE_SHIFT;
 	}
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+	if (sbi->compress_inode) {
+		unsigned npages = COMPRESS_MAPPING(sbi)->nrpages;
+		si->page_mem += (unsigned long long)npages << PAGE_SHIFT;
+	}
+#endif
 }
 
 static int stat_show(struct seq_file *s, void *v)
@@ -473,6 +485,7 @@ static int stat_show(struct seq_file *s, void *v)
 			"volatile IO: %4d (Max. %4d)\n",
 			   si->inmem_pages, si->aw_cnt, si->max_aw_cnt,
 			   si->vw_cnt, si->max_vw_cnt);
+		seq_printf(s, "  - compress: %4d, hit:%8d\n", si->compress_pages, si->compress_page_hit);
 		seq_printf(s, "  - nodes: %4d in %4d\n",
 			   si->ndirty_node, si->node_pages);
 		seq_printf(s, "  - dents: %4d in dirs:%4d (%4d)\n",
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 2860003a09ed..57f62761c6fa 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -98,6 +98,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
 #define F2FS_MOUNT_NORECOVERY		0x04000000
 #define F2FS_MOUNT_ATGC			0x08000000
 #define F2FS_MOUNT_MERGE_CHECKPOINT	0x10000000
+#define F2FS_MOUNT_COMPRESS_CACHE	0x20000000
 
 #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
 #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
@@ -1320,6 +1321,9 @@ enum compress_flag {
 	COMPRESS_MAX_FLAG,
 };
 
+#define	COMPRESS_WATERMARK			20
+#define	COMPRESS_PERCENT			20
+
 #define COMPRESS_DATA_RESERVED_SIZE		4
 struct compress_data {
 	__le32 clen;			/* compressed data size */
@@ -1624,6 +1628,11 @@ struct f2fs_sb_info {
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	struct kmem_cache *page_array_slab;	/* page array entry */
 	unsigned int page_array_slab_size;	/* default page array slab size */
+
+	struct inode *compress_inode;		/* cache compressed blocks */
+	unsigned int compress_percent;		/* cache page percentage */
+	unsigned int compress_watermark;	/* cache page watermark */
+	atomic_t compress_page_hit;		/* cache hit count */
 #endif
 };
 
@@ -3598,7 +3607,8 @@ struct f2fs_stat_info {
 	unsigned int bimodal, avg_vblocks;
 	int util_free, util_valid, util_invalid;
 	int rsvd_segs, overp_segs;
-	int dirty_count, node_pages, meta_pages;
+	int dirty_count, node_pages, meta_pages, compress_pages;
+	int compress_page_hit;
 	int prefree_count, call_count, cp_count, bg_cp_count;
 	int tot_segs, node_segs, data_segs, free_segs, free_secs;
 	int bg_node_segs, bg_data_segs;
@@ -3934,7 +3944,9 @@ void f2fs_compress_write_end_io(struct bio *bio, struct page *page);
 bool f2fs_is_compress_backend_ready(struct inode *inode);
 int f2fs_init_compress_mempool(void);
 void f2fs_destroy_compress_mempool(void);
-void f2fs_end_read_compressed_page(struct page *page, bool failed);
+void f2fs_decompress_cluster(struct decompress_io_ctx *dic);
+void f2fs_end_read_compressed_page(struct page *page, bool failed,
+							block_t blkaddr);
 bool f2fs_cluster_is_empty(struct compress_ctx *cc);
 bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index);
 void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page);
@@ -3952,10 +3964,19 @@ void f2fs_put_page_dic(struct page *page);
 int f2fs_init_compress_ctx(struct compress_ctx *cc);
 void f2fs_destroy_compress_ctx(struct compress_ctx *cc);
 void f2fs_init_compress_info(struct f2fs_sb_info *sbi);
+int f2fs_init_compress_inode(struct f2fs_sb_info *sbi);
+void f2fs_destroy_compress_inode(struct f2fs_sb_info *sbi);
 int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi);
 void f2fs_destroy_page_array_cache(struct f2fs_sb_info *sbi);
 int __init f2fs_init_compress_cache(void);
 void f2fs_destroy_compress_cache(void);
+struct address_space *COMPRESS_MAPPING(struct f2fs_sb_info *sbi);
+void f2fs_invalidate_compress_page(struct f2fs_sb_info *sbi, block_t blkaddr);
+void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
+						nid_t ino, block_t blkaddr);
+bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
+								block_t blkaddr);
+void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino);
 #else
 static inline bool f2fs_is_compressed_page(struct page *page) { return false; }
 static inline bool f2fs_is_compress_backend_ready(struct inode *inode)
@@ -3972,7 +3993,9 @@ static inline struct page *f2fs_compress_control_page(struct page *page)
 }
 static inline int f2fs_init_compress_mempool(void) { return 0; }
 static inline void f2fs_destroy_compress_mempool(void) { }
-static inline void f2fs_end_read_compressed_page(struct page *page, bool failed)
+static inline void f2fs_decompress_cluster(struct decompress_io_ctx *dic) { }
+static inline void f2fs_end_read_compressed_page(struct page *page,
+						bool failed, block_t blkaddr)
 {
 	WARN_ON_ONCE(1);
 }
@@ -3980,10 +4003,20 @@ static inline void f2fs_put_page_dic(struct page *page)
 {
 	WARN_ON_ONCE(1);
 }
+static inline int f2fs_init_compress_inode(struct f2fs_sb_info *sbi) { return 0; }
+static inline void f2fs_destroy_compress_inode(struct f2fs_sb_info *sbi) { }
 static inline int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi) { return 0; }
 static inline void f2fs_destroy_page_array_cache(struct f2fs_sb_info *sbi) { }
 static inline int __init f2fs_init_compress_cache(void) { return 0; }
 static inline void f2fs_destroy_compress_cache(void) { }
+static inline void f2fs_invalidate_compress_page(struct f2fs_sb_info *sbi,
+				block_t blkaddr) { }
+static inline void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi,
+				struct page *page, nid_t ino, block_t blkaddr) { }
+static inline bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi,
+				struct page *page, block_t blkaddr) { return false; }
+static inline void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi,
+							nid_t ino) { }
 #endif
 
 static inline void set_compress_context(struct inode *inode)
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 39330ad3c44e..4561c44dfa8f 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1226,6 +1226,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 	f2fs_put_page(mpage, 1);
 	invalidate_mapping_pages(META_MAPPING(fio.sbi),
 				fio.old_blkaddr, fio.old_blkaddr);
+	f2fs_invalidate_compress_page(fio.sbi, fio.old_blkaddr);
 
 	set_page_dirty(fio.encrypted_page);
 	if (clear_page_dirty_for_io(fio.encrypted_page))
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 349d9cb933ee..f030b9b79202 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -18,6 +18,10 @@
 
 #include <trace/events/f2fs.h>
 
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+extern const struct address_space_operations f2fs_compress_aops;
+#endif
+
 void f2fs_mark_inode_dirty_sync(struct inode *inode, bool sync)
 {
 	if (is_inode_flag_set(inode, FI_NEW_INODE))
@@ -494,6 +498,11 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
 	if (ino == F2FS_NODE_INO(sbi) || ino == F2FS_META_INO(sbi))
 		goto make_now;
 
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+	if (ino == F2FS_COMPRESS_INO(sbi))
+		goto make_now;
+#endif
+
 	ret = do_read_inode(inode);
 	if (ret)
 		goto bad_inode;
@@ -504,6 +513,12 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
 	} else if (ino == F2FS_META_INO(sbi)) {
 		inode->i_mapping->a_ops = &f2fs_meta_aops;
 		mapping_set_gfp_mask(inode->i_mapping, GFP_NOFS);
+	} else if (ino == F2FS_COMPRESS_INO(sbi)) {
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+		inode->i_mapping->a_ops = &f2fs_compress_aops;
+#endif
+		mapping_set_gfp_mask(inode->i_mapping,
+			GFP_NOFS | __GFP_HIGHMEM | __GFP_MOVABLE);
 	} else if (S_ISREG(inode->i_mode)) {
 		inode->i_op = &f2fs_file_inode_operations;
 		inode->i_fop = &f2fs_file_operations;
@@ -722,8 +737,12 @@ void f2fs_evict_inode(struct inode *inode)
 	trace_f2fs_evict_inode(inode);
 	truncate_inode_pages_final(&inode->i_data);
 
+	if (test_opt(sbi, COMPRESS_CACHE) && f2fs_compressed_file(inode))
+		f2fs_invalidate_compress_pages(sbi, inode->i_ino);
+
 	if (inode->i_ino == F2FS_NODE_INO(sbi) ||
-			inode->i_ino == F2FS_META_INO(sbi))
+			inode->i_ino == F2FS_META_INO(sbi) ||
+			inode->i_ino == F2FS_COMPRESS_INO(sbi))
 		goto out_clear;
 
 	f2fs_bug_on(sbi, get_dirty_pages(inode));
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 7d34f1cacdee..2ee9b7ba46bd 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2302,6 +2302,7 @@ void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr)
 		return;
 
 	invalidate_mapping_pages(META_MAPPING(sbi), addr, addr);
+	f2fs_invalidate_compress_page(sbi, addr);
 
 	/* add it into sit main buffer */
 	down_write(&sit_i->sentry_lock);
@@ -3429,9 +3430,11 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 reallocate:
 	f2fs_allocate_data_block(fio->sbi, fio->page, fio->old_blkaddr,
 			&fio->new_blkaddr, sum, type, fio);
-	if (GET_SEGNO(fio->sbi, fio->old_blkaddr) != NULL_SEGNO)
+	if (GET_SEGNO(fio->sbi, fio->old_blkaddr) != NULL_SEGNO) {
 		invalidate_mapping_pages(META_MAPPING(fio->sbi),
 					fio->old_blkaddr, fio->old_blkaddr);
+		f2fs_invalidate_compress_page(fio->sbi, fio->old_blkaddr);
+	}
 
 	/* writeout dirty page into bdev */
 	f2fs_submit_page_write(fio);
@@ -3604,6 +3607,7 @@ void f2fs_do_replace_block(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	if (GET_SEGNO(sbi, old_blkaddr) != NULL_SEGNO) {
 		invalidate_mapping_pages(META_MAPPING(sbi),
 					old_blkaddr, old_blkaddr);
+		f2fs_invalidate_compress_page(sbi, old_blkaddr);
 		if (!from_gc)
 			update_segment_mtime(sbi, old_blkaddr, 0);
 		update_sit_entry(sbi, old_blkaddr, -1);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index d8603e6c4916..d7beb8d511a5 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -151,6 +151,7 @@ enum {
 	Opt_compress_extension,
 	Opt_compress_chksum,
 	Opt_compress_mode,
+	Opt_compress_cache,
 	Opt_atgc,
 	Opt_err,
 };
@@ -223,6 +224,7 @@ static match_table_t f2fs_tokens = {
 	{Opt_compress_extension, "compress_extension=%s"},
 	{Opt_compress_chksum, "compress_chksum"},
 	{Opt_compress_mode, "compress_mode=%s"},
+	{Opt_compress_cache, "compress_cache"},
 	{Opt_atgc, "atgc"},
 	{Opt_err, NULL},
 };
@@ -1062,12 +1064,16 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			}
 			kfree(name);
 			break;
+		case Opt_compress_cache:
+			set_opt(sbi, COMPRESS_CACHE);
+			break;
 #else
 		case Opt_compress_algorithm:
 		case Opt_compress_log_size:
 		case Opt_compress_extension:
 		case Opt_compress_chksum:
 		case Opt_compress_mode:
+		case Opt_compress_cache:
 			f2fs_info(sbi, "compression options not supported");
 			break;
 #endif
@@ -1396,6 +1402,8 @@ static void f2fs_put_super(struct super_block *sb)
 
 	f2fs_bug_on(sbi, sbi->fsync_node_num);
 
+	f2fs_destroy_compress_inode(sbi);
+
 	iput(sbi->node_inode);
 	sbi->node_inode = NULL;
 
@@ -1660,6 +1668,9 @@ static inline void f2fs_show_compress_options(struct seq_file *seq,
 		seq_printf(seq, ",compress_mode=%s", "fs");
 	else if (F2FS_OPTION(sbi).compress_mode == COMPR_MODE_USER)
 		seq_printf(seq, ",compress_mode=%s", "user");
+
+	if (test_opt(sbi, COMPRESS_CACHE))
+		seq_puts(seq, ",compress_cache");
 }
 
 static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
@@ -1930,6 +1941,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	bool disable_checkpoint = test_opt(sbi, DISABLE_CHECKPOINT);
 	bool no_io_align = !F2FS_IO_ALIGNED(sbi);
 	bool no_atgc = !test_opt(sbi, ATGC);
+	bool no_compress_cache = !test_opt(sbi, COMPRESS_CACHE);
 	bool checkpoint_changed;
 #ifdef CONFIG_QUOTA
 	int i, j;
@@ -2022,6 +2034,12 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		goto restore_opts;
 	}
 
+	if (no_compress_cache == !!test_opt(sbi, COMPRESS_CACHE)) {
+		err = -EINVAL;
+		f2fs_warn(sbi, "switch compress_cache option is not allowed");
+		goto restore_opts;
+	}
+
 	if ((*flags & SB_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
 		err = -EINVAL;
 		f2fs_warn(sbi, "disabling checkpoint not compatible with read-only");
@@ -3900,10 +3918,14 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		goto free_node_inode;
 	}
 
-	err = f2fs_register_sysfs(sbi);
+	err = f2fs_init_compress_inode(sbi);
 	if (err)
 		goto free_root_inode;
 
+	err = f2fs_register_sysfs(sbi);
+	if (err)
+		goto free_compress_inode;
+
 #ifdef CONFIG_QUOTA
 	/* Enable quota usage during mount */
 	if (f2fs_sb_has_quota_ino(sbi) && !f2fs_readonly(sb)) {
@@ -4037,6 +4059,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	/* evict some inodes being cached by GC */
 	evict_inodes(sb);
 	f2fs_unregister_sysfs(sbi);
+free_compress_inode:
+	f2fs_destroy_compress_inode(sbi);
 free_root_inode:
 	dput(sb->s_root);
 	sb->s_root = NULL;
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index c6cc0a566ef5..2dcc63fe8494 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -34,6 +34,7 @@
 #define F2FS_ROOT_INO(sbi)	((sbi)->root_ino_num)
 #define F2FS_NODE_INO(sbi)	((sbi)->node_ino_num)
 #define F2FS_META_INO(sbi)	((sbi)->meta_ino_num)
+#define F2FS_COMPRESS_INO(sbi)	(NM_I(sbi)->max_nid)
 
 #define F2FS_MAX_QUOTAS		3
 
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
