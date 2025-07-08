Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E25AFD441
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQUmn4PVPLwi5dLqcItjxVKuWhkwQhGwfN1EddMm9DA=; b=K8NEIVqcmrJtaY1fBoeZuopUsI
	sVpcphjmGO5xNhQb8bsRueCbB4+bc98FGA7MBZCJaRi9Lix69eoN8S1WtisLVNYBLPOcyibYcC4ru
	Grjeg/SFCOLi3/vclN+wVtRzZezra279jiitTZyl3eOIGdQ9EJBtyg/6o29ygYvNleZ8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjy-0005Ic-Mq;
	Tue, 08 Jul 2025 17:04:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBju-0005G3-Pl
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jynHJYbsOP4oJqEIRHJNHXvd7dK08/8l/n33udvisJk=; b=bWWO0QBnfKQp2KzNX66lEhUhIc
 zT9liPmh6cWPzTIVUl+l03qURLj62xG7FpIgpWK9ruvf8fsQlqhF/+m0fFRu/XEHka76ccTSF/nkB
 JJ4jS3QawpT/hhyzVIF9kbRThtUNERMBO6WQyZh2xPY0eGEPBf4814b39+1nCU/UmM/c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jynHJYbsOP4oJqEIRHJNHXvd7dK08/8l/n33udvisJk=; b=Z4ahDtE3Qc3tLsaHXwcACQNiIE
 Gn8YRp2NloOUP/SUjmnPidfwhTJFiA0+Djqn07ZwREUp4cOtIA+m6hYRB6mwPc6lAY8U6rujf+uk4
 8Niy2PeSKdbPavVIKYocG4RJ9feFfIEo4fJwLsXCD76wmy3Yc50QrrrQw7MG17i16w0I=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjr-0006Eo-Fa for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=jynHJYbsOP4oJqEIRHJNHXvd7dK08/8l/n33udvisJk=; b=VxpFgl24/ylOF9+4tzsPFAo3Zu
 v03+dl+LAyPkjdb87NSFYVNX5bjeyut2V0DvKjvM3g3EM/NUJhJCB8JNf/Oxqq2E9iNZ+GqaGwfqt
 sh0EBDEhrl6K2I5G4s91+7jxFAzED0sjxJMAnkWqa3Fmprz2p8eWP8HpJnIiSDU/L4QoV3xg9mrK2
 HPuTaMDRqLzk2qiADdIc6gNNufZkMdSLSrqTG6nFLJWBwwktlO2r8xBUA/pYVKEsDG7iWNcL1XyOK
 37lj2fMRt0+s0OyZdDqSNRWjjPbbMzQsPjNgul2+bb1EV0ICBO2v2S7rP84S6kHNi8bSL1EiZQV0a
 MDfM6eLg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjk-00000000T8d-3v4d;
 Tue, 08 Jul 2025 17:04:08 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:49 +0100
Message-ID: <20250708170359.111653-53-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  All callers now have a folio so pass it in Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/f2fs.h | 10
 +++++-----
 fs/f2fs/inode.c | 8 ++++---- fs/f2fs/node.c | 6 +++--- fs/f2fs/node.h | 30
 +++++++++++++++ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uZBjr-0006Eo-Fa
Subject: [f2fs-dev] [PATCH 52/60] f2fs: Pass a folio to F2FS_NODE()
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

All callers now have a folio so pass it in

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h  | 10 +++++-----
 fs/f2fs/inode.c |  8 ++++----
 fs/f2fs/node.c  |  6 +++---
 fs/f2fs/node.h  | 30 +++++++++++++++---------------
 4 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 48b15e44a41c..c5a0d70e0a89 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2051,9 +2051,9 @@ static inline struct f2fs_checkpoint *F2FS_CKPT(struct f2fs_sb_info *sbi)
 	return (struct f2fs_checkpoint *)(sbi->ckpt);
 }
 
-static inline struct f2fs_node *F2FS_NODE(const struct page *page)
+static inline struct f2fs_node *F2FS_NODE(const struct folio *folio)
 {
-	return (struct f2fs_node *)page_address(page);
+	return (struct f2fs_node *)folio_address(folio);
 }
 
 static inline struct f2fs_inode *F2FS_INODE(const struct folio *folio)
@@ -3051,7 +3051,7 @@ static inline void f2fs_radix_tree_insert(struct radix_tree_root *root,
 
 static inline bool IS_INODE(const struct folio *folio)
 {
-	struct f2fs_node *p = F2FS_NODE(&folio->page);
+	struct f2fs_node *p = F2FS_NODE(folio);
 
 	return RAW_IS_INODE(p);
 }
@@ -3075,13 +3075,13 @@ static inline unsigned int get_dnode_base(struct inode *inode,
 		return 0;
 
 	return inode ? get_extra_isize(inode) :
-			offset_in_addr(&F2FS_NODE(&node_folio->page)->i);
+			offset_in_addr(&F2FS_NODE(node_folio)->i);
 }
 
 static inline __le32 *get_dnode_addr(struct inode *inode,
 					struct folio *node_folio)
 {
-	return blkaddr_in_node(F2FS_NODE(&node_folio->page)) +
+	return blkaddr_in_node(F2FS_NODE(node_folio)) +
 			get_dnode_base(inode, node_folio);
 }
 
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index c9afdce75a7f..9ea4249bfbf1 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -119,7 +119,7 @@ static void __recover_inline_status(struct inode *inode, struct folio *ifolio)
 static
 bool f2fs_enable_inode_chksum(struct f2fs_sb_info *sbi, struct folio *folio)
 {
-	struct f2fs_inode *ri = &F2FS_NODE(&folio->page)->i;
+	struct f2fs_inode *ri = &F2FS_NODE(folio)->i;
 
 	if (!f2fs_sb_has_inode_chksum(sbi))
 		return false;
@@ -136,7 +136,7 @@ bool f2fs_enable_inode_chksum(struct f2fs_sb_info *sbi, struct folio *folio)
 
 static __u32 f2fs_inode_chksum(struct f2fs_sb_info *sbi, struct folio *folio)
 {
-	struct f2fs_node *node = F2FS_NODE(&folio->page);
+	struct f2fs_node *node = F2FS_NODE(folio);
 	struct f2fs_inode *ri = &node->i;
 	__le32 ino = node->footer.ino;
 	__le32 gen = ri->i_generation;
@@ -173,7 +173,7 @@ bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct folio *folio)
 #endif
 		return true;
 
-	ri = &F2FS_NODE(&folio->page)->i;
+	ri = &F2FS_NODE(folio)->i;
 	provided = le32_to_cpu(ri->i_inode_checksum);
 	calculated = f2fs_inode_chksum(sbi, folio);
 
@@ -187,7 +187,7 @@ bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct folio *folio)
 
 void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct folio *folio)
 {
-	struct f2fs_inode *ri = &F2FS_NODE(&folio->page)->i;
+	struct f2fs_inode *ri = &F2FS_NODE(folio)->i;
 
 	if (!f2fs_enable_inode_chksum(sbi, folio))
 		return;
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 17f74e440084..fefb1549ff55 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1019,7 +1019,7 @@ static int truncate_nodes(struct dnode_of_data *dn, unsigned int nofs,
 
 	f2fs_ra_node_pages(folio, ofs, NIDS_PER_BLOCK);
 
-	rn = F2FS_NODE(&folio->page);
+	rn = F2FS_NODE(folio);
 	if (depth < 3) {
 		for (i = ofs; i < NIDS_PER_BLOCK; i++, freed++) {
 			child_nid = le32_to_cpu(rn->in.nid[i]);
@@ -2789,7 +2789,7 @@ int f2fs_recover_xattr_data(struct inode *inode, struct folio *folio)
 
 	/* 3: update and set xattr node page dirty */
 	if (folio) {
-		memcpy(F2FS_NODE(&xfolio->page), F2FS_NODE(&folio->page),
+		memcpy(F2FS_NODE(xfolio), F2FS_NODE(folio),
 				VALID_XATTR_BLOCK_SIZE);
 		folio_mark_dirty(xfolio);
 	}
@@ -2894,7 +2894,7 @@ int f2fs_restore_node_summary(struct f2fs_sb_info *sbi,
 			if (IS_ERR(folio))
 				return PTR_ERR(folio);
 
-			rn = F2FS_NODE(&folio->page);
+			rn = F2FS_NODE(folio);
 			sum_entry->nid = rn->footer.nid;
 			sum_entry->version = 0;
 			sum_entry->ofs_in_node = 0;
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index fecbd0c4aea5..827ff00a452b 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -245,39 +245,39 @@ static inline void set_to_next_nat(struct f2fs_nm_info *nm_i, nid_t start_nid)
 
 static inline nid_t ino_of_node(const struct folio *node_folio)
 {
-	struct f2fs_node *rn = F2FS_NODE(&node_folio->page);
+	struct f2fs_node *rn = F2FS_NODE(node_folio);
 	return le32_to_cpu(rn->footer.ino);
 }
 
 static inline nid_t nid_of_node(const struct folio *node_folio)
 {
-	struct f2fs_node *rn = F2FS_NODE(&node_folio->page);
+	struct f2fs_node *rn = F2FS_NODE(node_folio);
 	return le32_to_cpu(rn->footer.nid);
 }
 
 static inline unsigned int ofs_of_node(const struct folio *node_folio)
 {
-	struct f2fs_node *rn = F2FS_NODE(&node_folio->page);
+	struct f2fs_node *rn = F2FS_NODE(node_folio);
 	unsigned flag = le32_to_cpu(rn->footer.flag);
 	return flag >> OFFSET_BIT_SHIFT;
 }
 
 static inline __u64 cpver_of_node(const struct folio *node_folio)
 {
-	struct f2fs_node *rn = F2FS_NODE(&node_folio->page);
+	struct f2fs_node *rn = F2FS_NODE(node_folio);
 	return le64_to_cpu(rn->footer.cp_ver);
 }
 
-static inline block_t next_blkaddr_of_node(struct folio *node_folio)
+static inline block_t next_blkaddr_of_node(const struct folio *node_folio)
 {
-	struct f2fs_node *rn = F2FS_NODE(&node_folio->page);
+	struct f2fs_node *rn = F2FS_NODE(node_folio);
 	return le32_to_cpu(rn->footer.next_blkaddr);
 }
 
 static inline void fill_node_footer(const struct folio *folio, nid_t nid,
 				nid_t ino, unsigned int ofs, bool reset)
 {
-	struct f2fs_node *rn = F2FS_NODE(&folio->page);
+	struct f2fs_node *rn = F2FS_NODE(folio);
 	unsigned int old_flag = 0;
 
 	if (reset)
@@ -296,15 +296,15 @@ static inline void fill_node_footer(const struct folio *folio, nid_t nid,
 static inline void copy_node_footer(const struct folio *dst,
 		const struct folio *src)
 {
-	struct f2fs_node *src_rn = F2FS_NODE(&src->page);
-	struct f2fs_node *dst_rn = F2FS_NODE(&dst->page);
+	struct f2fs_node *src_rn = F2FS_NODE(src);
+	struct f2fs_node *dst_rn = F2FS_NODE(dst);
 	memcpy(&dst_rn->footer, &src_rn->footer, sizeof(struct node_footer));
 }
 
 static inline void fill_node_footer_blkaddr(struct folio *folio, block_t blkaddr)
 {
 	struct f2fs_checkpoint *ckpt = F2FS_CKPT(F2FS_F_SB(folio));
-	struct f2fs_node *rn = F2FS_NODE(&folio->page);
+	struct f2fs_node *rn = F2FS_NODE(folio);
 	__u64 cp_ver = cur_cp_version(ckpt);
 
 	if (__is_set_ckpt_flags(ckpt, CP_CRC_RECOVERY_FLAG))
@@ -370,7 +370,7 @@ static inline bool IS_DNODE(const struct folio *node_folio)
 
 static inline int set_nid(struct folio *folio, int off, nid_t nid, bool i)
 {
-	struct f2fs_node *rn = F2FS_NODE(&folio->page);
+	struct f2fs_node *rn = F2FS_NODE(folio);
 
 	f2fs_folio_wait_writeback(folio, NODE, true, true);
 
@@ -383,7 +383,7 @@ static inline int set_nid(struct folio *folio, int off, nid_t nid, bool i)
 
 static inline nid_t get_nid(const struct folio *folio, int off, bool i)
 {
-	struct f2fs_node *rn = F2FS_NODE(&folio->page);
+	struct f2fs_node *rn = F2FS_NODE(folio);
 
 	if (i)
 		return le32_to_cpu(rn->i.i_nid[off - NODE_DIR1_BLOCK]);
@@ -399,7 +399,7 @@ static inline nid_t get_nid(const struct folio *folio, int off, bool i)
 
 static inline int is_node(const struct folio *folio, int type)
 {
-	struct f2fs_node *rn = F2FS_NODE(&folio->page);
+	struct f2fs_node *rn = F2FS_NODE(folio);
 	return le32_to_cpu(rn->footer.flag) & BIT(type);
 }
 
@@ -409,7 +409,7 @@ static inline int is_node(const struct folio *folio, int type)
 
 static inline void set_cold_node(const struct folio *folio, bool is_dir)
 {
-	struct f2fs_node *rn = F2FS_NODE(&folio->page);
+	struct f2fs_node *rn = F2FS_NODE(folio);
 	unsigned int flag = le32_to_cpu(rn->footer.flag);
 
 	if (is_dir)
@@ -421,7 +421,7 @@ static inline void set_cold_node(const struct folio *folio, bool is_dir)
 
 static inline void set_mark(struct folio *folio, int mark, int type)
 {
-	struct f2fs_node *rn = F2FS_NODE(&folio->page);
+	struct f2fs_node *rn = F2FS_NODE(folio);
 	unsigned int flag = le32_to_cpu(rn->footer.flag);
 	if (mark)
 		flag |= BIT(type);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
