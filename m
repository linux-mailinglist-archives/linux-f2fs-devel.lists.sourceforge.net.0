Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDAE2D2167
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Dec 2020 04:24:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmTby-00038s-HJ; Tue, 08 Dec 2020 03:24:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kmTbx-00038h-KO
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 03:24:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zmfw8FaVJwPYhZYTxiFu/8PdCSSzZqtYhcmENq5uFpo=; b=XlziPzWGZj7htudxbhDKekK6gc
 VtiXzqZ/ifi/KqTLITDoV0WjIO/1p/B6sj82BRxOX14KT2aXK4rguPq49NN2zG+aviv+dQCaasWNu
 xY3fqQ2s1Ja/o9HbUNlka7SD+r3xdCqWrO5oM6lqNfXDA7cWAjdSGJXdWE1xlHu/1E7w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zmfw8FaVJwPYhZYTxiFu/8PdCSSzZqtYhcmENq5uFpo=; b=L
 +PO/guvymObzdeiByRL7EWFTX1mZx6twGveN0jIq2nb5UH/qpwAZFl/WJVeTop/oArhdEB1FUsrRI
 7CYRZtRvnVIncYRxW4E3xEZFhMuSZQYubv8XNgJR+XgtSp/7Kc4Dd2aEUxEDl+IDrqzjkXcO90C6F
 eXJNFYaOnzTNSZoM=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmTbn-0066kG-LY
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 03:24:21 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cqlr32MVRzkkhV;
 Tue,  8 Dec 2020 11:23:15 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Tue, 8 Dec 2020 11:23:48 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 8 Dec 2020 11:23:36 +0800
Message-ID: <20201208032336.63733-1-yuchao0@huawei.com>
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
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kmTbn-0066kG-LY
Subject: [f2fs-dev] [PATCH v6] f2fs: compress: add compress_inode to cache
 compressed blocks
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
v6:
- improve document readability.
- add "f2fs_" prefix for global functions.
 Documentation/filesystems/f2fs.rst |   3 +
 fs/f2fs/compress.c                 | 198 +++++++++++++++++++++++++++--
 fs/f2fs/data.c                     |  29 ++++-
 fs/f2fs/debug.c                    |  13 ++
 fs/f2fs/f2fs.h                     |  34 ++++-
 fs/f2fs/gc.c                       |   1 +
 fs/f2fs/inode.c                    |  21 ++-
 fs/f2fs/segment.c                  |   6 +-
 fs/f2fs/super.c                    |  19 ++-
 include/linux/f2fs_fs.h            |   1 +
 10 files changed, 305 insertions(+), 20 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index dae15c96e659..5fa45fd8e4af 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -268,6 +268,9 @@ compress_mode=%s	 Control file compression mode. This supports "fs" and "user"
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
index 4bcbacfe3325..446dd41a7bad 100644
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
@@ -721,25 +723,14 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 	return ret;
 }
 
-void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
+void f2fs_do_decompress_pages(struct decompress_io_ctx *dic, bool verity)
 {
-	struct decompress_io_ctx *dic =
-			(struct decompress_io_ctx *)page_private(page);
-	struct f2fs_sb_info *sbi = F2FS_I_SB(dic->inode);
 	struct f2fs_inode_info *fi= F2FS_I(dic->inode);
 	const struct f2fs_compress_ops *cops =
 			f2fs_cops[fi->i_compress_algorithm];
 	int ret;
 	int i;
 
-	dec_page_count(sbi, F2FS_RD_DATA);
-
-	if (bio->bi_status || PageError(page))
-		dic->failed = true;
-
-	if (atomic_dec_return(&dic->pending_pages))
-		return;
-
 	trace_f2fs_decompress_pages_start(dic->inode, dic->cluster_idx,
 				dic->cluster_size, fi->i_compress_algorithm);
 
@@ -797,6 +788,7 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
 	ret = cops->decompress_pages(dic);
 
 	if (!ret && (fi->i_compress_flag & 1 << COMPRESS_CHKSUM)) {
+		struct f2fs_sb_info *sbi = F2FS_I_SB(dic->inode);
 		u32 provided = le32_to_cpu(dic->cbuf->chksum);
 		u32 calculated = f2fs_crc32(sbi, dic->cbuf->cdata, dic->clen);
 
@@ -830,6 +822,30 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
 		f2fs_free_dic(dic);
 }
 
+void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
+						nid_t ino, block_t blkaddr);
+void f2fs_decompress_pages(struct bio *bio, struct page *page,
+						bool verity, unsigned int ofs)
+{
+	struct decompress_io_ctx *dic =
+			(struct decompress_io_ctx *)page_private(page);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(dic->inode);
+	block_t blkaddr;
+
+	dec_page_count(sbi, F2FS_RD_DATA);
+
+	if (bio->bi_status || PageError(page))
+		dic->failed = true;
+
+	blkaddr = SECTOR_TO_BLOCK(bio->bi_iter.bi_sector) + ofs;
+	f2fs_cache_compressed_page(sbi, page, dic->inode->i_ino, blkaddr);
+
+	if (atomic_dec_return(&dic->pending_pages))
+		return;
+
+	f2fs_do_decompress_pages(dic, verity);
+}
+
 static bool is_page_in_cluster(struct compress_ctx *cc, pgoff_t index)
 {
 	if (cc->cluster_idx == NULL_CLUSTER)
@@ -1600,6 +1616,164 @@ void f2fs_decompress_end_io(struct page **rpages,
 	}
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
+	memcpy(page_address(cpage), page_address(page), PAGE_SIZE);
+	SetPageUptodate(cpage);
+
+	f2fs_set_page_private(cpage, ino);
+
+	f2fs_put_page(cpage, 1);
+}
+
+void f2fs_load_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
+								block_t blkaddr)
+{
+	struct page *cpage;
+
+	if (!test_opt(sbi, COMPRESS_CACHE))
+		return;
+
+	cpage = f2fs_pagecache_get_page(COMPRESS_MAPPING(sbi),
+				blkaddr, FGP_LOCK | FGP_NOWAIT, GFP_NOFS);
+	if (cpage) {
+		if (PageUptodate(cpage)) {
+			atomic_inc(&sbi->compress_page_hit);
+			memcpy(page_address(page),
+				page_address(cpage), PAGE_SIZE);
+			SetPageUptodate(page);
+		}
+		f2fs_put_page(cpage, 1);
+	}
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
index aa34d620bec9..6787a7a03e86 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -133,17 +133,21 @@ static void __read_end_io(struct bio *bio, bool compr, bool verity)
 	struct page *page;
 	struct bio_vec *bv;
 	struct bvec_iter_all iter_all;
+	unsigned int ofs = 0;
 
 	bio_for_each_segment_all(bv, bio, iter_all) {
 		page = bv->bv_page;
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 		if (compr && f2fs_is_compressed_page(page)) {
-			f2fs_decompress_pages(bio, page, verity);
+			f2fs_decompress_pages(bio, page, verity, ofs);
+			ofs++;
 			continue;
 		}
-		if (verity)
+		if (verity) {
+			ofs++;
 			continue;
+		}
 #endif
 
 		/* PG_error was set if any post_read step failed */
@@ -156,6 +160,7 @@ static void __read_end_io(struct bio *bio, bool compr, bool verity)
 		}
 		dec_page_count(F2FS_P_SB(page), __read_io_type(page));
 		unlock_page(page);
+		ofs++;
 	}
 }
 
@@ -1421,9 +1426,11 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
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
@@ -2261,6 +2268,22 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		blkaddr = data_blkaddr(dn.inode, dn.node_page,
 						dn.ofs_in_node + i + 1);
 
+		f2fs_load_compressed_page(sbi, page, blkaddr);
+		if (PageUptodate(page)) {
+			if (!atomic_dec_return(&dic->pending_pages)) {
+				bool verity =
+					f2fs_need_verity(inode, start_idx);
+
+				f2fs_do_decompress_pages(dic, verity);
+				if (verity) {
+					f2fs_verify_pages(dic->rpages,
+							dic->cluster_size);
+					f2fs_free_dic(dic);
+				}
+			}
+			continue;
+		}
+
 		if (bio && (!page_is_mergeable(sbi, bio,
 					*last_block_in_bio, blkaddr) ||
 		    !f2fs_crypt_mergeable_bio(bio, inode, page->index, NULL))) {
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 197c914119da..f1f8714066c5 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -145,6 +145,12 @@ static void update_general_status(struct f2fs_sb_info *sbi)
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
@@ -299,6 +305,12 @@ static void update_mem_info(struct f2fs_sb_info *sbi)
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
@@ -461,6 +473,7 @@ static int stat_show(struct seq_file *s, void *v)
 			"volatile IO: %4d (Max. %4d)\n",
 			   si->inmem_pages, si->aw_cnt, si->max_aw_cnt,
 			   si->vw_cnt, si->max_vw_cnt);
+		seq_printf(s, "  - compress: %4d, hit:%8d\n", si->compress_pages, si->compress_page_hit);
 		seq_printf(s, "  - nodes: %4d in %4d\n",
 			   si->ndirty_node, si->node_pages);
 		seq_printf(s, "  - dents: %4d in dirs:%4d (%4d)\n",
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 7599f5800ef7..cdd0ec137652 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -97,6 +97,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
 #define F2FS_MOUNT_DISABLE_CHECKPOINT	0x02000000
 #define F2FS_MOUNT_NORECOVERY		0x04000000
 #define F2FS_MOUNT_ATGC			0x08000000
+#define F2FS_MOUNT_COMPRESS_CACHE	0x10000000
 
 #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
 #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
@@ -1296,6 +1297,9 @@ enum compress_flag {
 	COMPRESS_MAX_FLAG,
 };
 
+#define	COMPRESS_WATERMARK			20
+#define	COMPRESS_PERCENT			20
+
 #define COMPRESS_DATA_RESERVED_SIZE		4
 struct compress_data {
 	__le32 clen;			/* compressed data size */
@@ -1569,6 +1573,11 @@ struct f2fs_sb_info {
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
 
@@ -3534,7 +3543,8 @@ struct f2fs_stat_info {
 	unsigned int bimodal, avg_vblocks;
 	int util_free, util_valid, util_invalid;
 	int rsvd_segs, overp_segs;
-	int dirty_count, node_pages, meta_pages;
+	int dirty_count, node_pages, meta_pages, compress_pages;
+	int compress_page_hit;
 	int prefree_count, call_count, cp_count, bg_cp_count;
 	int tot_segs, node_segs, data_segs, free_segs, free_secs;
 	int bg_node_segs, bg_data_segs;
@@ -3875,7 +3885,8 @@ void f2fs_compress_write_end_io(struct bio *bio, struct page *page);
 bool f2fs_is_compress_backend_ready(struct inode *inode);
 int f2fs_init_compress_mempool(void);
 void f2fs_destroy_compress_mempool(void);
-void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity);
+void f2fs_do_decompress_pages(struct decompress_io_ctx *dic, bool verity);
+void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity, unsigned int ofs);
 bool f2fs_cluster_is_empty(struct compress_ctx *cc);
 bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index);
 void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page);
@@ -3894,10 +3905,19 @@ void f2fs_decompress_end_io(struct page **rpages,
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
+void f2fs_load_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
+								block_t blkaddr);
+void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino);
 #else
 static inline bool f2fs_is_compressed_page(struct page *page) { return false; }
 static inline bool f2fs_is_compress_backend_ready(struct inode *inode)
@@ -3914,10 +3934,20 @@ static inline struct page *f2fs_compress_control_page(struct page *page)
 }
 static inline int f2fs_init_compress_mempool(void) { return 0; }
 static inline void f2fs_destroy_compress_mempool(void) { }
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
+static inline void f2fs_load_compressed_page(struct f2fs_sb_info *sbi,
+				struct page *page, block_t blkaddr) { }
+static inline void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi,
+							nid_t ino) { }
 #endif
 
 static inline void set_compress_context(struct inode *inode)
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 3ef84e6ded41..43919a3ae6a6 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1225,6 +1225,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
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
index deca74cb17df..d8570b0359f5 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2305,6 +2305,7 @@ void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr)
 		return;
 
 	invalidate_mapping_pages(META_MAPPING(sbi), addr, addr);
+	f2fs_invalidate_compress_page(sbi, addr);
 
 	/* add it into sit main buffer */
 	down_write(&sit_i->sentry_lock);
@@ -3432,9 +3433,11 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
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
@@ -3607,6 +3610,7 @@ void f2fs_do_replace_block(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	if (GET_SEGNO(sbi, old_blkaddr) != NULL_SEGNO) {
 		invalidate_mapping_pages(META_MAPPING(sbi),
 					old_blkaddr, old_blkaddr);
+		f2fs_invalidate_compress_page(sbi, old_blkaddr);
 		if (!from_gc)
 			update_segment_mtime(sbi, old_blkaddr, 0);
 		update_sit_entry(sbi, old_blkaddr, -1);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index dc45a3d12d51..babd914a7102 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -148,6 +148,7 @@ enum {
 	Opt_compress_extension,
 	Opt_compress_chksum,
 	Opt_compress_mode,
+	Opt_compress_cache,
 	Opt_atgc,
 	Opt_err,
 };
@@ -218,6 +219,7 @@ static match_table_t f2fs_tokens = {
 	{Opt_compress_extension, "compress_extension=%s"},
 	{Opt_compress_chksum, "compress_chksum"},
 	{Opt_compress_mode, "compress_mode=%s"},
+	{Opt_compress_cache, "compress_cache"},
 	{Opt_atgc, "atgc"},
 	{Opt_err, NULL},
 };
@@ -955,12 +957,16 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
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
@@ -1285,6 +1291,8 @@ static void f2fs_put_super(struct super_block *sb)
 
 	f2fs_bug_on(sbi, sbi->fsync_node_num);
 
+	f2fs_destroy_compress_inode(sbi);
+
 	iput(sbi->node_inode);
 	sbi->node_inode = NULL;
 
@@ -1554,6 +1562,9 @@ static inline void f2fs_show_compress_options(struct seq_file *seq,
 		seq_printf(seq, ",compress_mode=%s", "fs");
 	else if (F2FS_OPTION(sbi).compress_mode == COMPR_MODE_USER)
 		seq_printf(seq, ",compress_mode=%s", "user");
+
+	if (test_opt(sbi, COMPRESS_CACHE))
+		seq_puts(seq, ",compress_cache");
 }
 
 static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
@@ -3766,10 +3777,14 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
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
@@ -3903,6 +3918,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	/* evict some inodes being cached by GC */
 	evict_inodes(sb);
 	f2fs_unregister_sysfs(sbi);
+free_compress_inode:
+	f2fs_destroy_compress_inode(sbi);
 free_root_inode:
 	dput(sb->s_root);
 	sb->s_root = NULL;
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 7dc2a06cf19a..55be7afeee90 100644
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
