Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF51AFD465
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:05:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IljKG6ZT4MLH/9/+W6gqAZXubW2H+BxOiyA9PeA0Qmc=; b=TXOhhnR9OqUnAO8kV7FAs5pEoS
	qGSduYy76wM7HLT0QglLXAd1YMsargXXeyCnQMbF3FR+Y8ZN2NQFzVaeLYXoJZR5sjtN2SZAv2FA5
	4MxPJzqpgIpYiTvCQNZyfUeiJO+fwbxLvXFFWzYcqNMihM59EsFB1MZnozKwr4pOodRA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBky-0005kq-17;
	Tue, 08 Jul 2025 17:05:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjv-0005Wb-AV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hSMQb+SWYpViwvTg9ZX1b9lsNUU470zp4x+LGbACxs8=; b=MQ51akBFMt4VLahZXGOSOLxwTs
 xygZDbKiIWZJaTayhNACf/00DPaoOq8GSMjqEh3Ii4Qlkp4WKl9KEUNrySrKwoTQD+5qG7qYl8JVg
 21ThQoWL0/IfLVAJLZqtBm8Sj9ddaSHsk30zK9Z5EkQXArPwkW1bT0zyfzCtoi6+gNgE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hSMQb+SWYpViwvTg9ZX1b9lsNUU470zp4x+LGbACxs8=; b=dgjV/a3+YJWiGp5y2fnTYzduzW
 vJCSvaktMLoGYFRJcJs+UasYhPFbqHVImLZbk8yrjm0zlC6WjKHMUBsuSYhY/6imHbXqUF97KyZaT
 nTuyBuHPBbkR04cgMj4r++A9xILHC+8PFNki0hQ/QaAWTRAknIKX2LEl1U75xDlOBxSc=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBju-0006Fh-EQ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=hSMQb+SWYpViwvTg9ZX1b9lsNUU470zp4x+LGbACxs8=; b=jIa0N0E0nsprc5mh7HQ26qHV3T
 13Nc6ps+tyE1GGRlYfBXc7IK8PInXCHld7XGWvMujx7aoYicnCHG91Tplgy7b0IQh7xh7lh8fU2gd
 ovsoCTUATw1Vui813qP+Uf0DaXiJ8tptG1DAuAhD0lo/gavtTU0VEDC/bjf1tKBIdqZQe4LUa9MGc
 oSpUGTpP78MurYBY6CjInfc6hJY5MlFKddp4LV/Lz0nHz01CRafNzn6HfxzN8fro32cX7RcN0Y62h
 QODY5a2U9URYO5mNHDBwcr3Z1yq7Yr3AAQb/hA4SKDkmfx3CtjxIfuS9lb6own17y1jMXKNUQKbSb
 wVBwtGcg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBji-00000000T72-3bjG;
 Tue, 08 Jul 2025 17:04:06 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:34 +0100
Message-ID: <20250708170359.111653-38-willy@infradead.org>
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
 Content preview: All callers now have a folio so pass it in. Also make it
 const
 to help the compiler. Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/f2fs.h | 6 +++--- fs/f2fs/file.c | 2 +- fs/f2fs/gc.c | 2 +-
 fs/f2fs/inline.c
 | 2 +- fs/f2fs/inode.c | 2 +- fs/f2fs/node.c | 14 [...] 
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
X-Headers-End: 1uZBju-0006Fh-EQ
Subject: [f2fs-dev] [PATCH 37/60] f2fs: Pass a folio to IS_INODE()
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

All callers now have a folio so pass it in.  Also make it const to help
the compiler.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h          |  6 +++---
 fs/f2fs/file.c          |  2 +-
 fs/f2fs/gc.c            |  2 +-
 fs/f2fs/inline.c        |  2 +-
 fs/f2fs/inode.c         |  2 +-
 fs/f2fs/node.c          | 14 ++++++--------
 fs/f2fs/recovery.c      |  8 ++++----
 include/linux/f2fs_fs.h |  2 +-
 8 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 3463fa414b55..f6f566cf065f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3019,9 +3019,9 @@ static inline void f2fs_radix_tree_insert(struct radix_tree_root *root,
 
 #define RAW_IS_INODE(p)	((p)->footer.nid == (p)->footer.ino)
 
-static inline bool IS_INODE(struct page *page)
+static inline bool IS_INODE(const struct folio *folio)
 {
-	struct f2fs_node *p = F2FS_NODE(page);
+	struct f2fs_node *p = F2FS_NODE(&folio->page);
 
 	return RAW_IS_INODE(p);
 }
@@ -3041,7 +3041,7 @@ static inline int f2fs_has_extra_attr(struct inode *inode);
 static inline unsigned int get_dnode_base(struct inode *inode,
 					struct folio *node_folio)
 {
-	if (!IS_INODE(&node_folio->page))
+	if (!IS_INODE(node_folio))
 		return 0;
 
 	return inode ? get_extra_isize(inode) :
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index c444f2e43df1..8995b128c29c 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -820,7 +820,7 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 	count -= dn.ofs_in_node;
 	f2fs_bug_on(sbi, count < 0);
 
-	if (dn.ofs_in_node || IS_INODE(&dn.node_folio->page)) {
+	if (dn.ofs_in_node || IS_INODE(dn.node_folio)) {
 		f2fs_truncate_data_blocks_range(&dn, count);
 		free_from += count;
 	}
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index b681d0f23c57..58977f05f3b3 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1162,7 +1162,7 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 		return false;
 	}
 
-	if (IS_INODE(&node_folio->page)) {
+	if (IS_INODE(node_folio)) {
 		base = offset_in_addr(F2FS_INODE(node_folio));
 		max_addrs = DEF_ADDRS_PER_INODE;
 	} else {
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 9851310cdb87..51adc43d5a5c 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -305,7 +305,7 @@ int f2fs_recover_inline_data(struct inode *inode, struct folio *nfolio)
 	 *    x       o  -> remove data blocks, and then recover inline_data
 	 *    x       x  -> recover data blocks
 	 */
-	if (IS_INODE(&nfolio->page))
+	if (IS_INODE(nfolio))
 		ri = F2FS_INODE(nfolio);
 
 	if (f2fs_has_inline_data(inode) &&
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 68510c2d90a9..9d532ae131d7 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -124,7 +124,7 @@ bool f2fs_enable_inode_chksum(struct f2fs_sb_info *sbi, struct folio *folio)
 	if (!f2fs_sb_has_inode_chksum(sbi))
 		return false;
 
-	if (!IS_INODE(&folio->page) || !(ri->i_inline & F2FS_EXTRA_ATTR))
+	if (!IS_INODE(folio) || !(ri->i_inline & F2FS_EXTRA_ATTR))
 		return false;
 
 	if (!F2FS_FITS_IN_INODE(ri, le16_to_cpu(ri->i_extra_isize),
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index db81c54ef7f6..edc9c57daebd 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -973,7 +973,7 @@ static int truncate_dnode(struct dnode_of_data *dn)
 	else if (IS_ERR(folio))
 		return PTR_ERR(folio);
 
-	if (IS_INODE(&folio->page) || ino_of_node(folio) != dn->inode->i_ino) {
+	if (IS_INODE(folio) || ino_of_node(folio) != dn->inode->i_ino) {
 		f2fs_err(sbi, "incorrect node reference, ino: %lu, nid: %u, ino_of_node: %u",
 				dn->inode->i_ino, dn->nid, ino_of_node(folio));
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
@@ -1474,10 +1474,8 @@ static int sanity_check_node_footer(struct f2fs_sb_info *sbi,
 					struct folio *folio, pgoff_t nid,
 					enum node_type ntype)
 {
-	struct page *page = &folio->page;
-
 	if (unlikely(nid != nid_of_node(folio) ||
-		(ntype == NODE_TYPE_INODE && !IS_INODE(page)) ||
+		(ntype == NODE_TYPE_INODE && !IS_INODE(folio)) ||
 		(ntype == NODE_TYPE_XATTR &&
 		!f2fs_has_xattr_block(ofs_of_node(folio))) ||
 		time_to_inject(sbi, FAULT_INCONSISTENT_FOOTER))) {
@@ -1867,7 +1865,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 			if (!atomic || folio == last_folio) {
 				set_fsync_mark(folio, 1);
 				percpu_counter_inc(&sbi->rf_node_block_count);
-				if (IS_INODE(&folio->page)) {
+				if (IS_INODE(folio)) {
 					if (is_inode_flag_set(inode,
 								FI_DIRTY_INODE))
 						f2fs_update_inode(inode, folio);
@@ -1976,7 +1974,7 @@ void f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
 		for (i = 0; i < nr_folios; i++) {
 			struct folio *folio = fbatch.folios[i];
 
-			if (!IS_INODE(&folio->page))
+			if (!IS_INODE(folio))
 				continue;
 
 			folio_lock(folio);
@@ -2077,7 +2075,7 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 			}
 
 			/* flush dirty inode */
-			if (IS_INODE(&folio->page) && flush_dirty_inode(folio))
+			if (IS_INODE(folio) && flush_dirty_inode(folio))
 				goto lock_node;
 write_node:
 			f2fs_folio_wait_writeback(folio, NODE, true, true);
@@ -2213,7 +2211,7 @@ static bool f2fs_dirty_node_folio(struct address_space *mapping,
 	if (!folio_test_uptodate(folio))
 		folio_mark_uptodate(folio);
 #ifdef CONFIG_F2FS_CHECK_FS
-	if (IS_INODE(&folio->page))
+	if (IS_INODE(folio))
 		f2fs_inode_chksum_set(F2FS_M_SB(mapping), folio);
 #endif
 	if (filemap_dirty_folio(mapping, folio)) {
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 11e8387419b0..83d39fbd2293 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -437,7 +437,7 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 			bool quota_inode = false;
 
 			if (!check_only &&
-					IS_INODE(&folio->page) &&
+					IS_INODE(folio) &&
 					is_dent_dnode(folio)) {
 				err = f2fs_recover_inode_page(sbi, folio);
 				if (err) {
@@ -463,7 +463,7 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 		}
 		entry->blkaddr = blkaddr;
 
-		if (IS_INODE(&folio->page) && is_dent_dnode(folio))
+		if (IS_INODE(folio) && is_dent_dnode(folio))
 			entry->last_dentry = blkaddr;
 next:
 		/* check next segment */
@@ -628,7 +628,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 	int err = 0, recovered = 0;
 
 	/* step 1: recover xattr */
-	if (IS_INODE(&folio->page)) {
+	if (IS_INODE(folio)) {
 		err = f2fs_recover_inline_xattr(inode, folio);
 		if (err)
 			goto out;
@@ -809,7 +809,7 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 		 * In this case, we can lose the latest inode(x).
 		 * So, call recover_inode for the inode update.
 		 */
-		if (IS_INODE(&folio->page)) {
+		if (IS_INODE(folio)) {
 			err = recover_inode(entry->inode, folio);
 			if (err) {
 				f2fs_folio_put(folio, true);
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 25857877eaec..2f8b8bfc0e73 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -268,7 +268,7 @@ struct node_footer {
 /* Node IDs in an Indirect Block */
 #define NIDS_PER_BLOCK		((F2FS_BLKSIZE - sizeof(struct node_footer)) / sizeof(__le32))
 
-#define ADDRS_PER_PAGE(folio, inode)	(addrs_per_page(inode, IS_INODE(&folio->page)))
+#define ADDRS_PER_PAGE(folio, inode)	(addrs_per_page(inode, IS_INODE(folio)))
 
 #define	NODE_DIR1_BLOCK		(DEF_ADDRS_PER_INODE + 1)
 #define	NODE_DIR2_BLOCK		(DEF_ADDRS_PER_INODE + 2)
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
