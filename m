Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A41422687F1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Sep 2020 11:06:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kHkQw-0003HN-Ow; Mon, 14 Sep 2020 09:05:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kHkQv-0003H9-Ak
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 14 Sep 2020 09:05:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G3t9lmnjec8eWAdODSXDpTLsv/UkxLLH9D5BvsawWps=; b=jKfzlwaC8mSP5Ua4NrFoBYQjHM
 Siu8gUiwks1N01+xfF3i9BWOljVWdNrMCL0c+hgUJx/HCZMQ+AuMcgjiJoNMc5H8FJ1yGMNxQk0Vi
 6emmg0lZjteRl/lmORe8Dhb+QyvldKcwQ6+ow5++ud8+0jxwunOYXcvQn6PHLV4EcjuM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=G3t9lmnjec8eWAdODSXDpTLsv/UkxLLH9D5BvsawWps=; b=j
 op7CaPtmOxkEtLJ356IJ3JtzXOH40IQPgh+X7JlymV+qs3F/soU/0qqWSGXiQeCHv81EUxGCm57kH
 /V1rYYRTdUvkHR8RNVj0SyDk0+Ibwuz7nVCqyuXO7GHxPVRRuKcbZKBW4pfSD0ETDgxM4Ai6l6AyT
 OBKl18R3QmeSF8ds=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kHkQs-008vHu-PP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 14 Sep 2020 09:05:57 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 4D69119A9722000125C8;
 Mon, 14 Sep 2020 17:05:41 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Mon, 14 Sep 2020 17:05:32 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 14 Sep 2020 17:05:13 +0800
Message-ID: <20200914090514.50102-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
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
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kHkQs-008vHu-PP
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: compress: introduce page array slab
 cache
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

Add a per-sbi slab cache "f2fs_page_array_entry-%u:%u" for memory
allocation of page pointer array in compress context.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- add missing CONFIG_F2FS_FS_COMPRESSION
 fs/f2fs/compress.c | 86 +++++++++++++++++++++++++++++++++-------------
 fs/f2fs/f2fs.h     |  9 +++++
 fs/f2fs/super.c    |  8 ++++-
 3 files changed, 79 insertions(+), 24 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 7895186cc765..c6fcd68df71a 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -17,6 +17,32 @@
 #include "node.h"
 #include <trace/events/f2fs.h>
 
+static void *page_array_alloc(struct inode *inode)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	unsigned int size = sizeof(struct page *) <<
+				F2FS_I(inode)->i_log_cluster_size;
+
+	if (likely(size == sbi->page_array_slab_size))
+		return kmem_cache_zalloc(sbi->page_array_slab, GFP_NOFS);
+	return f2fs_kzalloc(sbi, size, GFP_NOFS);
+}
+
+static void page_array_free(struct inode *inode, void *pages)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	unsigned int size = sizeof(struct page *) <<
+				F2FS_I(inode)->i_log_cluster_size;
+
+	if (!pages)
+		return;
+
+	if (likely(size == sbi->page_array_slab_size))
+		kmem_cache_free(sbi->page_array_slab, pages);
+	else
+		kfree(pages);
+}
+
 struct f2fs_compress_ops {
 	int (*init_compress_ctx)(struct compress_ctx *cc);
 	void (*destroy_compress_ctx)(struct compress_ctx *cc);
@@ -130,19 +156,16 @@ struct page *f2fs_compress_control_page(struct page *page)
 
 int f2fs_init_compress_ctx(struct compress_ctx *cc)
 {
-	struct f2fs_sb_info *sbi = F2FS_I_SB(cc->inode);
-
 	if (cc->nr_rpages)
 		return 0;
 
-	cc->rpages = f2fs_kzalloc(sbi, sizeof(struct page *) <<
-					cc->log_cluster_size, GFP_NOFS);
+	cc->rpages = page_array_alloc(cc->inode);
 	return cc->rpages ? 0 : -ENOMEM;
 }
 
 void f2fs_destroy_compress_ctx(struct compress_ctx *cc)
 {
-	kfree(cc->rpages);
+	page_array_free(cc->inode, cc->rpages);
 	cc->rpages = NULL;
 	cc->nr_rpages = 0;
 	cc->nr_cpages = 0;
@@ -573,7 +596,6 @@ static void *f2fs_vmap(struct page **pages, unsigned int count)
 
 static int f2fs_compress_pages(struct compress_ctx *cc)
 {
-	struct f2fs_sb_info *sbi = F2FS_I_SB(cc->inode);
 	struct f2fs_inode_info *fi = F2FS_I(cc->inode);
 	const struct f2fs_compress_ops *cops =
 				f2fs_cops[fi->i_compress_algorithm];
@@ -592,8 +614,7 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 	max_len = COMPRESS_HEADER_SIZE + cc->clen;
 	cc->nr_cpages = DIV_ROUND_UP(max_len, PAGE_SIZE);
 
-	cc->cpages = f2fs_kzalloc(sbi, sizeof(struct page *) *
-					cc->nr_cpages, GFP_NOFS);
+	cc->cpages = page_array_alloc(cc->inode);
 	if (!cc->cpages) {
 		ret = -ENOMEM;
 		goto destroy_compress_ctx;
@@ -667,7 +688,7 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 		if (cc->cpages[i])
 			f2fs_compress_free_page(cc->cpages[i]);
 	}
-	kfree(cc->cpages);
+	page_array_free(cc->inode, cc->cpages);
 	cc->cpages = NULL;
 destroy_compress_ctx:
 	if (cops->destroy_compress_ctx)
@@ -706,8 +727,7 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
 		goto out_free_dic;
 	}
 
-	dic->tpages = f2fs_kzalloc(sbi, sizeof(struct page *) *
-					dic->cluster_size, GFP_NOFS);
+	dic->tpages = page_array_alloc(dic->inode);
 	if (!dic->tpages) {
 		ret = -ENOMEM;
 		goto out_free_dic;
@@ -1046,6 +1066,7 @@ bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
 
 {
 	struct compress_ctx cc = {
+		.inode = inode,
 		.log_cluster_size = F2FS_I(inode)->i_log_cluster_size,
 		.cluster_size = F2FS_I(inode)->i_cluster_size,
 		.rpages = fsdata,
@@ -1179,8 +1200,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	cic->magic = F2FS_COMPRESSED_PAGE_MAGIC;
 	cic->inode = inode;
 	atomic_set(&cic->pending_pages, cc->nr_cpages);
-	cic->rpages = f2fs_kzalloc(sbi, sizeof(struct page *) <<
-			cc->log_cluster_size, GFP_NOFS);
+	cic->rpages = page_array_alloc(cc->inode);
 	if (!cic->rpages)
 		goto out_put_cic;
 
@@ -1278,7 +1298,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	return 0;
 
 out_destroy_crypt:
-	kfree(cic->rpages);
+	page_array_free(cc->inode, cic->rpages);
 
 	for (--i; i >= 0; i--)
 		fscrypt_finalize_bounce_page(&cc->cpages[i]);
@@ -1322,7 +1342,7 @@ void f2fs_compress_write_end_io(struct bio *bio, struct page *page)
 		end_page_writeback(cic->rpages[i]);
 	}
 
-	kfree(cic->rpages);
+	page_array_free(cic->inode, cic->rpages);
 	kfree(cic);
 }
 
@@ -1419,7 +1439,7 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
 
 		err = f2fs_write_compressed_pages(cc, submitted,
 							wbc, io_type);
-		kfree(cc->cpages);
+		page_array_free(cc->inode, cc->cpages);
 		cc->cpages = NULL;
 		if (!err)
 			return 0;
@@ -1446,8 +1466,7 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 	if (!dic)
 		return ERR_PTR(-ENOMEM);
 
-	dic->rpages = f2fs_kzalloc(sbi, sizeof(struct page *) <<
-			cc->log_cluster_size, GFP_NOFS);
+	dic->rpages = page_array_alloc(cc->inode);
 	if (!dic->rpages) {
 		kfree(dic);
 		return ERR_PTR(-ENOMEM);
@@ -1466,8 +1485,7 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 		dic->rpages[i] = cc->rpages[i];
 	dic->nr_rpages = cc->cluster_size;
 
-	dic->cpages = f2fs_kzalloc(sbi, sizeof(struct page *) *
-					dic->nr_cpages, GFP_NOFS);
+	dic->cpages = page_array_alloc(dic->inode);
 	if (!dic->cpages)
 		goto out_free;
 
@@ -1502,7 +1520,7 @@ void f2fs_free_dic(struct decompress_io_ctx *dic)
 				continue;
 			f2fs_compress_free_page(dic->tpages[i]);
 		}
-		kfree(dic->tpages);
+		page_array_free(dic->inode, dic->tpages);
 	}
 
 	if (dic->cpages) {
@@ -1511,10 +1529,10 @@ void f2fs_free_dic(struct decompress_io_ctx *dic)
 				continue;
 			f2fs_compress_free_page(dic->cpages[i]);
 		}
-		kfree(dic->cpages);
+		page_array_free(dic->inode, dic->cpages);
 	}
 
-	kfree(dic->rpages);
+	page_array_free(dic->inode, dic->rpages);
 	kfree(dic);
 }
 
@@ -1543,3 +1561,25 @@ void f2fs_decompress_end_io(struct page **rpages,
 		unlock_page(rpage);
 	}
 }
+
+int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi)
+{
+	dev_t dev = sbi->sb->s_bdev->bd_dev;
+	char slab_name[32];
+
+	sprintf(slab_name, "f2fs_page_array_entry-%u:%u", MAJOR(dev), MINOR(dev));
+
+	sbi->page_array_slab_size = sizeof(struct page *) <<
+					F2FS_OPTION(sbi).compress_log_size;
+
+	sbi->page_array_slab = f2fs_kmem_cache_create(slab_name,
+					sbi->page_array_slab_size);
+	if (!sbi->page_array_slab)
+		return -ENOMEM;
+	return 0;
+}
+
+void f2fs_destroy_page_array_cache(struct f2fs_sb_info *sbi)
+{
+	kmem_cache_destroy(sbi->page_array_slab);
+}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 8efa19baf33d..50953b442220 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1626,6 +1626,11 @@ struct f2fs_sb_info {
 
 	struct kmem_cache *inline_xattr_slab;	/* inline xattr entry */
 	unsigned int inline_xattr_slab_size;	/* default inline xattr slab size */
+
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+	struct kmem_cache *page_array_slab;	/* page array entry */
+	unsigned int page_array_slab_size;	/* default page array slab size */
+#endif
 };
 
 struct f2fs_private_dio {
@@ -3933,6 +3938,8 @@ void f2fs_decompress_end_io(struct page **rpages,
 int f2fs_init_compress_ctx(struct compress_ctx *cc);
 void f2fs_destroy_compress_ctx(struct compress_ctx *cc);
 void f2fs_init_compress_info(struct f2fs_sb_info *sbi);
+int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi);
+void f2fs_destroy_page_array_cache(struct f2fs_sb_info *sbi);
 #else
 static inline bool f2fs_is_compressed_page(struct page *page) { return false; }
 static inline bool f2fs_is_compress_backend_ready(struct inode *inode)
@@ -3949,6 +3956,8 @@ static inline struct page *f2fs_compress_control_page(struct page *page)
 }
 static inline int f2fs_init_compress_mempool(void) { return 0; }
 static inline void f2fs_destroy_compress_mempool(void) { }
+static inline int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi) { return 0; }
+static inline void f2fs_destroy_page_array_cache(struct f2fs_sb_info *sbi) { }
 #endif
 
 static inline void set_compress_context(struct inode *inode)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 844ea837ebd7..d7336914d2b3 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1277,6 +1277,7 @@ static void f2fs_put_super(struct super_block *sb)
 	kfree(sbi->raw_super);
 
 	destroy_device_list(sbi);
+	f2fs_destroy_page_array_cache(sbi);
 	f2fs_destroy_xattr_caches(sbi);
 	mempool_destroy(sbi->write_io_dummy);
 #ifdef CONFIG_QUOTA
@@ -3613,13 +3614,16 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	err = f2fs_init_xattr_caches(sbi);
 	if (err)
 		goto free_io_dummy;
+	err = f2fs_init_page_array_cache(sbi);
+	if (err)
+		goto free_xattr_cache;
 
 	/* get an inode for meta space */
 	sbi->meta_inode = f2fs_iget(sb, F2FS_META_INO(sbi));
 	if (IS_ERR(sbi->meta_inode)) {
 		f2fs_err(sbi, "Failed to read F2FS meta data inode");
 		err = PTR_ERR(sbi->meta_inode);
-		goto free_xattr_cache;
+		goto free_page_array_cache;
 	}
 
 	err = f2fs_get_valid_checkpoint(sbi);
@@ -3895,6 +3899,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	make_bad_inode(sbi->meta_inode);
 	iput(sbi->meta_inode);
 	sbi->meta_inode = NULL;
+free_page_array_cache:
+	f2fs_destroy_page_array_cache(sbi);
 free_xattr_cache:
 	f2fs_destroy_xattr_caches(sbi);
 free_io_dummy:
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
