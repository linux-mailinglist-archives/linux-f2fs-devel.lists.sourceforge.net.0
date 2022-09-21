Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F99B5BF856
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Sep 2022 09:54:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oauYq-0008EY-TK;
	Wed, 21 Sep 2022 07:54:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1oauYk-0008EM-IO
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Sep 2022 07:54:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wa8mIlDc5KvHQLd/1Pz6uixwYn5wxwhqvseHGZRyzCI=; b=U+3FevsqIqrSsHzfpMT4LwuG2u
 OZG3HUGQrEGxKBp6skTY0tavDueePNelZOaWLzlkGM3L52GysWHIAWSlmHmm1QPwNPMrT9ncGx3n0
 2VqqVBrSDdHvzFuDfyH0t3O7wgMgCKcmktgSu3tYIIv7lBp4ntXp3soGUdNNzBcREpAw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wa8mIlDc5KvHQLd/1Pz6uixwYn5wxwhqvseHGZRyzCI=; b=DF1K9TgwkySWLZcnt/NU1ZGIKe
 Imhfvq0X1YGmu6W+8KmaxDyp4pUbA82Khd8EAu0aFyIBV1KXePJh60HLetCS7VmzWIAF82V4diqRn
 pR3dc/5040feQEuElld5QDkFyUeMCpwrCWdeCshxrrzu53gkapyB8b1kgXL91YgCZA+Q=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oauYh-00FFB3-P3 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Sep 2022 07:54:18 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MXVwQ4NkZzpSww;
 Wed, 21 Sep 2022 15:51:18 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 15:54:07 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 21 Sep
 2022 15:54:06 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 21 Sep 2022 15:57:34 +0800
Message-ID: <20220921075737.36708-2-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
In-Reply-To: <20220921075737.36708-1-zhangqilong3@huawei.com>
References: <20220921075737.36708-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The motivation of rebuilding comes from: a) If we don't
 enable the compress config,
 it will build some unnecessary code into target in f2fs_get_dnode_of_data
 b) The f2fs_cluster_blocks_are_contiguous [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.187 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1oauYh-00FFB3-P3
Subject: [f2fs-dev] [PATCH -next 1/4] f2fs: rebuild compressed extent cache
 update code for readonly-fs
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
From: Zhang Qilong via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zhang Qilong <zhangqilong3@huawei.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The motivation of rebuilding comes from:
 a) If we don't enable the compress config, it will build some
    unnecessary code into target in f2fs_get_dnode_of_data
 b) The f2fs_cluster_blocks_are_contiguous is called only when
    updating compressed extent cache and being called once in
    extent_cache.c
So, we rebuild it by adding f2fs_readonly_update_extent_cache()
to update compressed extent cache in readonly-fs and moving
f2fs_update_extent_tree_range_compressed and f2fs_cluster_blocks_are_contiguous
into extent_cache.c. Both function can be implemented internally
in extent_cache.c.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 fs/f2fs/compress.c     | 24 ----------------------
 fs/f2fs/extent_cache.c | 46 +++++++++++++++++++++++++++++++++++++++++-
 fs/f2fs/f2fs.h         | 11 +++-------
 fs/f2fs/node.c         | 17 ++--------------
 4 files changed, 50 insertions(+), 48 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index c16bab5bd600..400e01fbefb3 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1789,30 +1789,6 @@ void f2fs_put_page_dic(struct page *page, bool in_task)
 	f2fs_put_dic(dic, in_task);
 }
 
-/*
- * check whether cluster blocks are contiguous, and add extent cache entry
- * only if cluster blocks are logically and physically contiguous.
- */
-unsigned int f2fs_cluster_blocks_are_contiguous(struct dnode_of_data *dn)
-{
-	bool compressed = f2fs_data_blkaddr(dn) == COMPRESS_ADDR;
-	int i = compressed ? 1 : 0;
-	block_t first_blkaddr = data_blkaddr(dn->inode, dn->node_page,
-						dn->ofs_in_node + i);
-
-	for (i += 1; i < F2FS_I(dn->inode)->i_cluster_size; i++) {
-		block_t blkaddr = data_blkaddr(dn->inode, dn->node_page,
-						dn->ofs_in_node + i);
-
-		if (!__is_valid_data_blkaddr(blkaddr))
-			break;
-		if (first_blkaddr + i - (compressed ? 1 : 0) != blkaddr)
-			return 0;
-	}
-
-	return compressed ? i - 1 : i;
-}
-
 const struct address_space_operations f2fs_compress_aops = {
 	.release_folio = f2fs_release_folio,
 	.invalidate_folio = f2fs_invalidate_folio,
diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 746abfda3b66..387d53a61270 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -663,7 +663,7 @@ static void f2fs_update_extent_tree_range(struct inode *inode,
 }
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-void f2fs_update_extent_tree_range_compressed(struct inode *inode,
+static void f2fs_update_extent_tree_range_compressed(struct inode *inode,
 				pgoff_t fofs, block_t blkaddr, unsigned int llen,
 				unsigned int c_len)
 {
@@ -701,6 +701,50 @@ void f2fs_update_extent_tree_range_compressed(struct inode *inode,
 unlock_out:
 	write_unlock(&et->lock);
 }
+
+/*
+ * check whether cluster blocks are contiguous, and add extent cache entry
+ * only if cluster blocks are logically and physically contiguous.
+ */
+static unsigned int f2fs_cluster_blocks_are_contiguous(struct dnode_of_data *dn)
+{
+	bool compressed = f2fs_data_blkaddr(dn) == COMPRESS_ADDR;
+	int i = compressed ? 1 : 0;
+	block_t first_blkaddr = data_blkaddr(dn->inode, dn->node_page,
+						dn->ofs_in_node + i);
+
+	for (i += 1; i < F2FS_I(dn->inode)->i_cluster_size; i++) {
+		block_t blkaddr = data_blkaddr(dn->inode, dn->node_page,
+				dn->ofs_in_node + i);
+
+		if (!__is_valid_data_blkaddr(blkaddr))
+			break;
+		if (first_blkaddr + i - (compressed ? 1 : 0) != blkaddr)
+				return 0;
+	}
+
+	return compressed ? i - 1 : i;
+}
+
+void f2fs_readonly_update_extent_cache(struct dnode_of_data *dn,
+					pgoff_t index)
+{
+	unsigned int c_len = f2fs_cluster_blocks_are_contiguous(dn);
+	block_t blkaddr;
+
+	if (!c_len)
+		return;
+
+	blkaddr = f2fs_data_blkaddr(dn);
+	if (blkaddr == COMPRESS_ADDR)
+		blkaddr = data_blkaddr(dn->inode, dn->node_page,
+					dn->ofs_in_node + 1);
+
+	f2fs_update_extent_tree_range_compressed(dn->inode,
+				index, blkaddr,
+				F2FS_I(dn->inode)->i_cluster_size,
+				c_len);
+}
 #endif
 
 unsigned int f2fs_shrink_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 3cdfe56df5e2..f597dc6251e8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4221,9 +4221,7 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
 						struct writeback_control *wbc,
 						enum iostat_type io_type);
 int f2fs_is_compressed_cluster(struct inode *inode, pgoff_t index);
-void f2fs_update_extent_tree_range_compressed(struct inode *inode,
-				pgoff_t fofs, block_t blkaddr, unsigned int llen,
-				unsigned int c_len);
+void f2fs_readonly_update_extent_cache(struct dnode_of_data *dn, pgoff_t index);
 int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 				unsigned nr_pages, sector_t *last_block_in_bio,
 				bool is_readahead, bool for_write);
@@ -4231,7 +4229,6 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc);
 void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed,
 				bool in_task);
 void f2fs_put_page_dic(struct page *page, bool in_task);
-unsigned int f2fs_cluster_blocks_are_contiguous(struct dnode_of_data *dn);
 int f2fs_init_compress_ctx(struct compress_ctx *cc);
 void f2fs_destroy_compress_ctx(struct compress_ctx *cc, bool reuse);
 void f2fs_init_compress_info(struct f2fs_sb_info *sbi);
@@ -4287,7 +4284,6 @@ static inline void f2fs_put_page_dic(struct page *page, bool in_task)
 {
 	WARN_ON_ONCE(1);
 }
-static inline unsigned int f2fs_cluster_blocks_are_contiguous(struct dnode_of_data *dn) { return 0; }
 static inline bool f2fs_sanity_check_cluster(struct dnode_of_data *dn) { return false; }
 static inline int f2fs_init_compress_inode(struct f2fs_sb_info *sbi) { return 0; }
 static inline void f2fs_destroy_compress_inode(struct f2fs_sb_info *sbi) { }
@@ -4304,9 +4300,8 @@ static inline bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi,
 static inline void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi,
 							nid_t ino) { }
 #define inc_compr_inode_stat(inode)		do { } while (0)
-static inline void f2fs_update_extent_tree_range_compressed(struct inode *inode,
-				pgoff_t fofs, block_t blkaddr, unsigned int llen,
-				unsigned int c_len) { }
+static inline void f2fs_readonly_update_extent_cache(struct dnode_of_data *dn,
+							pgoff_t index) { }
 #endif
 
 static inline int set_compress_context(struct inode *inode)
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 23291f1575d3..4f500c2ecee8 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -847,23 +847,10 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 
 	if (is_inode_flag_set(dn->inode, FI_COMPRESSED_FILE) &&
 					f2fs_sb_has_readonly(sbi)) {
-		unsigned int c_len = f2fs_cluster_blocks_are_contiguous(dn);
-		block_t blkaddr;
 
-		if (!c_len)
-			goto out;
-
-		blkaddr = f2fs_data_blkaddr(dn);
-		if (blkaddr == COMPRESS_ADDR)
-			blkaddr = data_blkaddr(dn->inode, dn->node_page,
-						dn->ofs_in_node + 1);
-
-		f2fs_update_extent_tree_range_compressed(dn->inode,
-					index, blkaddr,
-					F2FS_I(dn->inode)->i_cluster_size,
-					c_len);
+		f2fs_readonly_update_extent_cache(dn, index);
 	}
-out:
+
 	return 0;
 
 release_pages:
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
