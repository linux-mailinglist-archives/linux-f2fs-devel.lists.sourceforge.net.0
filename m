Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DFFA76ECA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWY-0001L3-Gp;
	Mon, 31 Mar 2025 20:14:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVv-0000wK-RL
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HKqDIGBqA08jPBcQeWt8NcM81uHDjMPQJIjfRsdd/Y8=; b=C5+Hm71DXuCvK0AYDIBS/QM2ie
 qH4yenFjMvqZuUxjwPbQxdFD1d04aSbAi58PGOax0l0KbHmkbmO0fuKLXL0aKu4Ylgvx/o5mxFEXA
 B0u11DDFIXzRzclhU3+wL3yxjN6PVqAIZKHH1C1+BOgwzT3mwtaFuTtF8VmMMMchqagk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HKqDIGBqA08jPBcQeWt8NcM81uHDjMPQJIjfRsdd/Y8=; b=c8WBooU8OCHsgytogNw//SRZ5T
 j/KB2ka6V9gzW6VSkPoJaEq1dSaeH0Wx7vRqnzcTCSRE7vJ4xSJaDFqb4yHAOsmCuT6A7mHFHb5Ky
 ScYEvb3aSO25zBdKdhvXBkbmTt2w22Lcl2239qWfGpueTPnZOKIqld6QVi3hwfs5j0Tw=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVk-0003g5-Iv for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=HKqDIGBqA08jPBcQeWt8NcM81uHDjMPQJIjfRsdd/Y8=; b=fZimjWxe/m3/3t+NfGoxPXLZe+
 JG7gcUc7rUAFBCMQoqRTvXl0CHTEi+u0RIMesOeMHj9Au8AuBNpsg0Kn2KxyxGL0wIAGEzU/4qHXu
 dIekiV1/kWBh24ePdRKMOYcaPheZqxu1BHIgCjfrjnAd7rNxXov7lSvcuZx20DO/eoD2QPcyyK6iP
 f0sbXDPltAhuWdHizsqUvSUzhECSlz+swNLc0aSAzgxWk420Epmq1YDPKIprEAoxLCHZvgKeI5tLb
 mDfF9If3ft37dTVmV7Sev1Ya2LiG3GUOMX1e+9u6TVUNK4bVpXwzIyBizEPWO+1ENhS/PxhWZGfKN
 hNUSfOGw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVe-00000004SdQ-0yeU;
 Mon, 31 Mar 2025 20:13:26 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:48 +0100
Message-ID: <20250331201256.1057782-149-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  All assignments to this struct member are conversions from
 a folio so convert it to be a folio and convert all users. At the same time,
 convert data_blkaddr() to take a folio as all callers now have a [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVk-0003g5-Iv
Subject: [f2fs-dev] [PATCH 148/153] f2fs: Convert dnode_of_data->node_page
 to node_folio
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

All assignments to this struct member are conversions from a folio
so convert it to be a folio and convert all users.  At the same time,
convert data_blkaddr() to take a folio as all callers now have a folio.
Remove eight calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/compress.c     | 14 +++++++-------
 fs/f2fs/data.c         | 18 +++++++++---------
 fs/f2fs/extent_cache.c |  2 +-
 fs/f2fs/f2fs.h         | 18 +++++++++---------
 fs/f2fs/file.c         | 32 ++++++++++++++++----------------
 fs/f2fs/gc.c           |  2 +-
 fs/f2fs/node.c         | 22 +++++++++++-----------
 fs/f2fs/recovery.c     | 18 +++++++++---------
 fs/f2fs/segment.c      |  2 +-
 9 files changed, 64 insertions(+), 64 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 9da80914304f..e016b0f96313 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -914,7 +914,7 @@ bool f2fs_sanity_check_cluster(struct dnode_of_data *dn)
 	}
 
 	for (i = 1, count = 1; i < cluster_size; i++, count++) {
-		block_t blkaddr = data_blkaddr(dn->inode, dn->node_page,
+		block_t blkaddr = data_blkaddr(dn->inode, dn->node_folio,
 							dn->ofs_in_node + i);
 
 		/* [COMPR_ADDR, ..., COMPR_ADDR] */
@@ -955,7 +955,7 @@ static int __f2fs_get_cluster_blocks(struct inode *inode,
 	int count, i;
 
 	for (i = 0, count = 0; i < cluster_size; i++) {
-		block_t blkaddr = data_blkaddr(dn->inode, dn->node_page,
+		block_t blkaddr = data_blkaddr(dn->inode, dn->node_folio,
 							dn->ofs_in_node + i);
 
 		if (__is_valid_data_blkaddr(blkaddr))
@@ -1322,7 +1322,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		goto out_unlock_op;
 
 	for (i = 0; i < cc->cluster_size; i++) {
-		if (data_blkaddr(dn.inode, dn.node_page,
+		if (data_blkaddr(dn.inode, dn.node_folio,
 					dn.ofs_in_node + i) == NULL_ADDR)
 			goto out_put_dnode;
 	}
@@ -1354,7 +1354,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 				page_folio(cc->rpages[i + 1])->index, cic);
 		fio.compressed_page = cc->cpages[i];
 
-		fio.old_blkaddr = data_blkaddr(dn.inode, dn.node_page,
+		fio.old_blkaddr = data_blkaddr(dn.inode, dn.node_folio,
 						dn.ofs_in_node + i + 1);
 
 		/* wait for GCed page writeback via META_MAPPING */
@@ -1887,14 +1887,14 @@ void f2fs_put_folio_dic(struct folio *folio, bool in_task)
 unsigned int f2fs_cluster_blocks_are_contiguous(struct dnode_of_data *dn,
 						unsigned int ofs_in_node)
 {
-	bool compressed = data_blkaddr(dn->inode, dn->node_page,
+	bool compressed = data_blkaddr(dn->inode, dn->node_folio,
 					ofs_in_node) == COMPRESS_ADDR;
 	int i = compressed ? 1 : 0;
-	block_t first_blkaddr = data_blkaddr(dn->inode, dn->node_page,
+	block_t first_blkaddr = data_blkaddr(dn->inode, dn->node_folio,
 							ofs_in_node + i);
 
 	for (i += 1; i < F2FS_I(dn->inode)->i_cluster_size; i++) {
-		block_t blkaddr = data_blkaddr(dn->inode, dn->node_page,
+		block_t blkaddr = data_blkaddr(dn->inode, dn->node_folio,
 							ofs_in_node + i);
 
 		if (!__is_valid_data_blkaddr(blkaddr))
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d67731f042cf..f7f5f7bb8ed5 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1117,7 +1117,7 @@ static int f2fs_submit_page_read(struct inode *inode, struct folio *folio,
 
 static void __set_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr)
 {
-	__le32 *addr = get_dnode_addr(dn->inode, dn->node_page);
+	__le32 *addr = get_dnode_addr(dn->inode, &dn->node_folio->page);
 
 	dn->data_blkaddr = blkaddr;
 	addr[dn->ofs_in_node] = cpu_to_le32(dn->data_blkaddr);
@@ -1126,14 +1126,14 @@ static void __set_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr)
 /*
  * Lock ordering for the change of data block address:
  * ->data_page
- *  ->node_page
+ *  ->node_folio
  *    update block addresses in the node page
  */
 void f2fs_set_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr)
 {
-	f2fs_wait_on_page_writeback(dn->node_page, NODE, true, true);
+	f2fs_folio_wait_writeback(dn->node_folio, NODE, true, true);
 	__set_data_blkaddr(dn, blkaddr);
-	if (set_page_dirty(dn->node_page))
+	if (folio_mark_dirty(dn->node_folio))
 		dn->node_changed = true;
 }
 
@@ -1161,7 +1161,7 @@ int f2fs_reserve_new_blocks(struct dnode_of_data *dn, blkcnt_t count)
 	trace_f2fs_reserve_new_blocks(dn->inode, dn->nid,
 						dn->ofs_in_node, count);
 
-	f2fs_wait_on_page_writeback(dn->node_page, NODE, true, true);
+	f2fs_folio_wait_writeback(dn->node_folio, NODE, true, true);
 
 	for (; count > 0; dn->ofs_in_node++) {
 		block_t blkaddr = f2fs_data_blkaddr(dn);
@@ -1172,7 +1172,7 @@ int f2fs_reserve_new_blocks(struct dnode_of_data *dn, blkcnt_t count)
 		}
 	}
 
-	if (set_page_dirty(dn->node_page))
+	if (folio_mark_dirty(dn->node_folio))
 		dn->node_changed = true;
 	return 0;
 }
@@ -1590,7 +1590,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 	start_pgofs = pgofs;
 	prealloc = 0;
 	last_ofs_in_node = ofs_in_node = dn.ofs_in_node;
-	end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
+	end_offset = ADDRS_PER_PAGE(&dn.node_folio->page, inode);
 
 next_block:
 	blkaddr = f2fs_data_blkaddr(&dn);
@@ -2247,7 +2247,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 	for (i = 1; i < cc->cluster_size; i++) {
 		block_t blkaddr;
 
-		blkaddr = from_dnode ? data_blkaddr(dn.inode, dn.node_page,
+		blkaddr = from_dnode ? data_blkaddr(dn.inode, dn.node_folio,
 					dn.ofs_in_node + i) :
 					ei.blk + i - 1;
 
@@ -2281,7 +2281,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		block_t blkaddr;
 		struct bio_post_read_ctx *ctx;
 
-		blkaddr = from_dnode ? data_blkaddr(dn.inode, dn.node_page,
+		blkaddr = from_dnode ? data_blkaddr(dn.inode, dn.node_folio,
 					dn.ofs_in_node + i + 1) :
 					ei.blk + i;
 
diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index eabf49beebc1..cfe925a3d555 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -934,7 +934,7 @@ static void __update_extent_cache(struct dnode_of_data *dn, enum extent_type typ
 	if (!__may_extent_tree(dn->inode, type))
 		return;
 
-	ei.fofs = f2fs_start_bidx_of_node(ofs_of_node(dn->node_page), dn->inode) +
+	ei.fofs = f2fs_start_bidx_of_node(ofs_of_node(&dn->node_folio->page), dn->inode) +
 								dn->ofs_in_node;
 	ei.len = 1;
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a94e62c7d892..466462168429 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -995,7 +995,7 @@ struct f2fs_nm_info {
 struct dnode_of_data {
 	struct inode *inode;		/* vfs inode pointer */
 	struct folio *inode_folio;	/* its inode folio, NULL is possible */
-	struct page *node_page;		/* cached direct node page */
+	struct folio *node_folio;	/* cached direct node folio */
 	nid_t nid;			/* node id of the direct node block */
 	unsigned int ofs_in_node;	/* data offset in the node page */
 	bool inode_folio_locked;	/* inode folio is locked or not */
@@ -1011,7 +1011,7 @@ static inline void set_new_dnode(struct dnode_of_data *dn, struct inode *inode,
 	memset(dn, 0, sizeof(*dn));
 	dn->inode = inode;
 	dn->inode_folio = ifolio;
-	dn->node_page = &nfolio->page;
+	dn->node_folio = nfolio;
 	dn->nid = nid;
 }
 
@@ -2890,11 +2890,11 @@ static inline void f2fs_put_page(struct page *page, int unlock)
 
 static inline void f2fs_put_dnode(struct dnode_of_data *dn)
 {
-	if (dn->node_page)
-		f2fs_put_page(dn->node_page, 1);
-	if (dn->inode_folio && dn->node_page != &dn->inode_folio->page)
+	if (dn->node_folio)
+		f2fs_folio_put(dn->node_folio, true);
+	if (dn->inode_folio && dn->node_folio != dn->inode_folio)
 		f2fs_folio_put(dn->inode_folio, false);
-	dn->node_page = NULL;
+	dn->node_folio = NULL;
 	dn->inode_folio = NULL;
 }
 
@@ -3026,14 +3026,14 @@ static inline __le32 *get_dnode_addr(struct inode *inode,
 }
 
 static inline block_t data_blkaddr(struct inode *inode,
-			struct page *node_page, unsigned int offset)
+			struct folio *node_folio, unsigned int offset)
 {
-	return le32_to_cpu(*(get_dnode_addr(inode, node_page) + offset));
+	return le32_to_cpu(*(get_dnode_addr(inode, &node_folio->page) + offset));
 }
 
 static inline block_t f2fs_data_blkaddr(struct dnode_of_data *dn)
 {
-	return data_blkaddr(dn->inode, dn->node_page, dn->ofs_in_node);
+	return data_blkaddr(dn->inode, dn->node_folio, dn->ofs_in_node);
 }
 
 static inline int f2fs_test_bit(unsigned int nr, char *addr)
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 004dc7903c1c..e4548d508527 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -404,7 +404,7 @@ static bool __found_offset(struct address_space *mapping,
 	bool compressed_cluster = false;
 
 	if (f2fs_compressed_file(inode)) {
-		block_t first_blkaddr = data_blkaddr(dn->inode, dn->node_page,
+		block_t first_blkaddr = data_blkaddr(dn->inode, dn->node_folio,
 		    ALIGN_DOWN(dn->ofs_in_node, F2FS_I(inode)->i_cluster_size));
 
 		compressed_cluster = first_blkaddr == COMPRESS_ADDR;
@@ -474,7 +474,7 @@ static loff_t f2fs_seek_block(struct file *file, loff_t offset, int whence)
 			}
 		}
 
-		end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
+		end_offset = ADDRS_PER_PAGE(&dn.node_folio->page, inode);
 
 		/* find data/hole in dnode block */
 		for (; dn.ofs_in_node < end_offset;
@@ -625,7 +625,7 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 	block_t blkstart;
 	int blklen = 0;
 
-	addr = get_dnode_addr(dn->inode, dn->node_page) + ofs;
+	addr = get_dnode_addr(dn->inode, &dn->node_folio->page) + ofs;
 	blkstart = le32_to_cpu(*addr);
 
 	/* Assumption: truncation starts with cluster */
@@ -689,7 +689,7 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 		 * once we invalidate valid blkaddr in range [ofs, ofs + count],
 		 * we will invalidate all blkaddr in the whole range.
 		 */
-		fofs = f2fs_start_bidx_of_node(ofs_of_node(dn->node_page),
+		fofs = f2fs_start_bidx_of_node(ofs_of_node(&dn->node_folio->page),
 							dn->inode) + ofs;
 		f2fs_update_read_extent_cache_range(dn, fofs, 0, len);
 		f2fs_update_age_extent_cache_range(dn, fofs, len);
@@ -796,12 +796,12 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 		goto out;
 	}
 
-	count = ADDRS_PER_PAGE(dn.node_page, inode);
+	count = ADDRS_PER_PAGE(&dn.node_folio->page, inode);
 
 	count -= dn.ofs_in_node;
 	f2fs_bug_on(sbi, count < 0);
 
-	if (dn.ofs_in_node || IS_INODE(dn.node_page)) {
+	if (dn.ofs_in_node || IS_INODE(&dn.node_folio->page)) {
 		f2fs_truncate_data_blocks_range(&dn, count);
 		free_from += count;
 	}
@@ -1202,7 +1202,7 @@ int f2fs_truncate_hole(struct inode *inode, pgoff_t pg_start, pgoff_t pg_end)
 			return err;
 		}
 
-		end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
+		end_offset = ADDRS_PER_PAGE(&dn.node_folio->page, inode);
 		count = min(end_offset - dn.ofs_in_node, pg_end - pg_start);
 
 		f2fs_bug_on(F2FS_I_SB(inode), count == 0 || count > end_offset);
@@ -1297,7 +1297,7 @@ static int __read_out_blkaddrs(struct inode *inode, block_t *blkaddr,
 		goto next;
 	}
 
-	done = min((pgoff_t)ADDRS_PER_PAGE(dn.node_page, inode) -
+	done = min((pgoff_t)ADDRS_PER_PAGE(&dn.node_folio->page, inode) -
 							dn.ofs_in_node, len);
 	for (i = 0; i < done; i++, blkaddr++, do_replace++, dn.ofs_in_node++) {
 		*blkaddr = f2fs_data_blkaddr(&dn);
@@ -1386,7 +1386,7 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 			}
 
 			ilen = min((pgoff_t)
-				ADDRS_PER_PAGE(dn.node_page, dst_inode) -
+				ADDRS_PER_PAGE(&dn.node_folio->page, dst_inode) -
 						dn.ofs_in_node, len - i);
 			do {
 				dn.data_blkaddr = f2fs_data_blkaddr(&dn);
@@ -1676,7 +1676,7 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
 				goto out;
 			}
 
-			end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
+			end_offset = ADDRS_PER_PAGE(&dn.node_folio->page, inode);
 			end = min(pg_end, end_offset - dn.ofs_in_node + index);
 
 			ret = f2fs_do_zero_range(&dn, index, end);
@@ -3712,7 +3712,7 @@ static int release_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
 	int i;
 
 	for (i = 0; i < count; i++) {
-		blkaddr = data_blkaddr(dn->inode, dn->node_page,
+		blkaddr = data_blkaddr(dn->inode, dn->node_folio,
 						dn->ofs_in_node + i);
 
 		if (!__is_valid_data_blkaddr(blkaddr))
@@ -3830,7 +3830,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 			break;
 		}
 
-		end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
+		end_offset = ADDRS_PER_PAGE(&dn.node_folio->page, inode);
 		count = min(end_offset - dn.ofs_in_node, last_idx - page_idx);
 		count = round_up(count, fi->i_cluster_size);
 
@@ -3881,7 +3881,7 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count,
 	int i;
 
 	for (i = 0; i < count; i++) {
-		blkaddr = data_blkaddr(dn->inode, dn->node_page,
+		blkaddr = data_blkaddr(dn->inode, dn->node_folio,
 						dn->ofs_in_node + i);
 
 		if (!__is_valid_data_blkaddr(blkaddr))
@@ -3898,7 +3898,7 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count,
 		int ret;
 
 		for (i = 0; i < cluster_size; i++) {
-			blkaddr = data_blkaddr(dn->inode, dn->node_page,
+			blkaddr = data_blkaddr(dn->inode, dn->node_folio,
 						dn->ofs_in_node + i);
 
 			if (i == 0) {
@@ -4008,7 +4008,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 			break;
 		}
 
-		end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
+		end_offset = ADDRS_PER_PAGE(&dn.node_folio->page, inode);
 		count = min(end_offset - dn.ofs_in_node, last_idx - page_idx);
 		count = round_up(count, fi->i_cluster_size);
 
@@ -4172,7 +4172,7 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 			goto out;
 		}
 
-		end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
+		end_offset = ADDRS_PER_PAGE(&dn.node_folio->page, inode);
 		count = min(end_offset - dn.ofs_in_node, pg_end - index);
 		for (i = 0; i < count; i++, index++, dn.ofs_in_node++) {
 			struct block_device *cur_bdev;
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index b18fecd2c352..b82aecaf6f29 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1178,7 +1178,7 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	}
 
 	*nofs = ofs_of_node(&node_folio->page);
-	source_blkaddr = data_blkaddr(NULL, &node_folio->page, ofs_in_node);
+	source_blkaddr = data_blkaddr(NULL, node_folio, ofs_in_node);
 	f2fs_folio_put(node_folio, true);
 
 	if (source_blkaddr != blkaddr) {
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 266f9fb550ea..8f5231c9eea0 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -851,7 +851,7 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 	}
 	dn->nid = nids[level];
 	dn->ofs_in_node = offset[level];
-	dn->node_page = &nfolio[level]->page;
+	dn->node_folio = nfolio[level];
 	dn->data_blkaddr = f2fs_data_blkaddr(dn);
 
 	if (is_inode_flag_set(dn->inode, FI_COMPRESSED_FILE) &&
@@ -872,9 +872,9 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 		if (!c_len)
 			goto out;
 
-		blkaddr = data_blkaddr(dn->inode, dn->node_page, ofs_in_node);
+		blkaddr = data_blkaddr(dn->inode, dn->node_folio, ofs_in_node);
 		if (blkaddr == COMPRESS_ADDR)
-			blkaddr = data_blkaddr(dn->inode, dn->node_page,
+			blkaddr = data_blkaddr(dn->inode, dn->node_folio,
 						ofs_in_node + 1);
 
 		f2fs_update_read_extent_tree_range_compressed(dn->inode,
@@ -889,7 +889,7 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 		f2fs_folio_put(nfolio[0], false);
 release_out:
 	dn->inode_folio = NULL;
-	dn->node_page = NULL;
+	dn->node_folio = NULL;
 	if (err == -ENOENT) {
 		dn->cur_level = i;
 		dn->max_level = level;
@@ -930,16 +930,16 @@ static int truncate_node(struct dnode_of_data *dn)
 		f2fs_inode_synced(dn->inode);
 	}
 
-	clear_node_page_dirty(dn->node_page);
+	clear_node_page_dirty(&dn->node_folio->page);
 	set_sbi_flag(sbi, SBI_IS_DIRTY);
 
-	index = page_folio(dn->node_page)->index;
-	f2fs_put_page(dn->node_page, 1);
+	index = dn->node_folio->index;
+	f2fs_folio_put(dn->node_folio, true);
 
 	invalidate_mapping_pages(NODE_MAPPING(sbi),
 			index, index);
 
-	dn->node_page = NULL;
+	dn->node_folio = NULL;
 	trace_f2fs_truncate_node(dn->inode, dn->nid, ni.blk_addr);
 
 	return 0;
@@ -971,7 +971,7 @@ static int truncate_dnode(struct dnode_of_data *dn)
 	}
 
 	/* Make dnode_of_data for parameter */
-	dn->node_page = &folio->page;
+	dn->node_folio = folio;
 	dn->ofs_in_node = 0;
 	f2fs_truncate_data_blocks_range(dn, ADDRS_PER_BLOCK(dn->inode));
 	err = truncate_node(dn);
@@ -1043,7 +1043,7 @@ static int truncate_nodes(struct dnode_of_data *dn, unsigned int nofs,
 
 	if (!ofs) {
 		/* remove current indirect node */
-		dn->node_page = &folio->page;
+		dn->node_folio = folio;
 		ret = truncate_node(dn);
 		if (ret)
 			goto out_err;
@@ -1102,7 +1102,7 @@ static int truncate_partial_nodes(struct dnode_of_data *dn,
 	}
 
 	if (offset[idx + 1] == 0) {
-		dn->node_page = &folios[idx]->page;
+		dn->node_folio = folios[idx];
 		dn->nid = nid[idx];
 		err = truncate_node(dn);
 		if (err)
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index bc7041d82dc5..51ebed4e1521 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -527,7 +527,7 @@ static int check_index_in_prev_nodes(struct f2fs_sb_info *sbi,
 	nid = le32_to_cpu(sum.nid);
 	ofs_in_node = le16_to_cpu(sum.ofs_in_node);
 
-	max_addrs = ADDRS_PER_PAGE(dn->node_page, dn->inode);
+	max_addrs = ADDRS_PER_PAGE(&dn->node_folio->page, dn->inode);
 	if (ofs_in_node >= max_addrs) {
 		f2fs_err(sbi, "Inconsistent ofs_in_node:%u in summary, ino:%lu, nid:%u, max:%u",
 			ofs_in_node, dn->inode->i_ino, nid, max_addrs);
@@ -539,7 +539,7 @@ static int check_index_in_prev_nodes(struct f2fs_sb_info *sbi,
 		tdn.nid = nid;
 		if (!dn->inode_folio_locked)
 			folio_lock(dn->inode_folio);
-		tdn.node_page = &dn->inode_folio->page;
+		tdn.node_folio = dn->inode_folio;
 		tdn.ofs_in_node = ofs_in_node;
 		goto truncate_out;
 	} else if (dn->nid == nid) {
@@ -662,7 +662,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 		goto out;
 	}
 
-	f2fs_wait_on_page_writeback(dn.node_page, NODE, true, true);
+	f2fs_folio_wait_writeback(dn.node_folio, NODE, true, true);
 
 	err = f2fs_get_node_info(sbi, dn.nid, &ni, false);
 	if (err)
@@ -670,9 +670,9 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 
 	f2fs_bug_on(sbi, ni.ino != ino_of_node(&folio->page));
 
-	if (ofs_of_node(dn.node_page) != ofs_of_node(&folio->page)) {
+	if (ofs_of_node(&dn.node_folio->page) != ofs_of_node(&folio->page)) {
 		f2fs_warn(sbi, "Inconsistent ofs_of_node, ino:%lu, ofs:%u, %u",
-			  inode->i_ino, ofs_of_node(dn.node_page),
+			  inode->i_ino, ofs_of_node(&dn.node_folio->page),
 			  ofs_of_node(&folio->page));
 		err = -EFSCORRUPTED;
 		f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
@@ -683,7 +683,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 		block_t src, dest;
 
 		src = f2fs_data_blkaddr(&dn);
-		dest = data_blkaddr(dn.inode, &folio->page, dn.ofs_in_node);
+		dest = data_blkaddr(dn.inode, folio, dn.ofs_in_node);
 
 		if (__is_valid_data_blkaddr(src) &&
 			!f2fs_is_valid_blkaddr(sbi, src, META_POR)) {
@@ -758,10 +758,10 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 		}
 	}
 
-	copy_node_footer(dn.node_page, &folio->page);
-	fill_node_footer(dn.node_page, dn.nid, ni.ino,
+	copy_node_footer(&dn.node_folio->page, &folio->page);
+	fill_node_footer(&dn.node_folio->page, dn.nid, ni.ino,
 					ofs_of_node(&folio->page), false);
-	set_page_dirty(dn.node_page);
+	folio_mark_dirty(dn.node_folio);
 err:
 	f2fs_put_dnode(&dn);
 out:
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 49cb5d282c45..0c99c191f218 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -334,7 +334,7 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
 			goto next;
 		}
 
-		blen = min((pgoff_t)ADDRS_PER_PAGE(dn.node_page, cow_inode),
+		blen = min((pgoff_t)ADDRS_PER_PAGE(&dn.node_folio->page, cow_inode),
 				len);
 		index = off;
 		for (i = 0; i < blen; i++, dn.ofs_in_node++, index++) {
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
