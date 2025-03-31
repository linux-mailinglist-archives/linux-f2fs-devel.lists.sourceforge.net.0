Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBDDA76EC1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWV-0001bT-Ho;
	Mon, 31 Mar 2025 20:14:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVv-0001Am-SU
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZcbEl1vIOjN4NDzmU303tGf9XZii896f7VBWzOcp1kc=; b=k3CWLUTouH+OJR7AhSf8bN/lXI
 btwrr0ux8xYjgccJ+sjiOKB0w8kxCMWcPGgJPWjPtgAp047PZKH49TwyI2B5OTm0xd0gxosNjKxHh
 i+qz05P/B4UItf2X5Ec9OraFPdXYQFkO2aH5N6Uwu6G8k8WFN4iYCv9jk4LCDUzc/YHc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZcbEl1vIOjN4NDzmU303tGf9XZii896f7VBWzOcp1kc=; b=cH8tSAuyLsBQzSSqvrGVwETYGy
 FWzcXWTilAnj1DfW2B84yNcFKp2dk/QC1A7a7QBXW4oMUYNew5qxLaAhPNSZcLmV06WYUKylAD18S
 Ygr624JU2uI3cb7qAJ6ASTur3bkQEyyJBkluy9nb3/o8teuQwSuq/nz71Zu0j/yhzN94=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVl-0003gd-JM for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=ZcbEl1vIOjN4NDzmU303tGf9XZii896f7VBWzOcp1kc=; b=CNRd1qzqKiGuFXQGYvqZ9L4w5H
 aKCRtsbvud3Z/BsT7sxI0bUsitKNLGFgJhF6N9hHiG8GIUs2xhzH01q6HfRKLvM6BEUkhlkLIN+LU
 rEddhts/U/Um50ViYeyovK3X0hJ3b9vBKXB/IEsE4b8vIuduZiyB8+HGiwPTlc9mje+w8iZi63cu1
 Oltz76FZABt1mY/HZrikKhZNODC8RMaNad2s5v3ugw9nZdOuNvbjTzQfkW8Dsl8dWJgtJSQBRV99D
 G3ZFqOl+5n/sndHMtKjlfThi3l2ZZ1r+aOda/GALDpaEYaE+oxYGMcFSiYkzwD+nD9elvdAfAy2Q7
 jhLQ9aTg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVa-00000004SUM-0aYi;
 Mon, 31 Mar 2025 20:13:22 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:23 +0100
Message-ID: <20250331201256.1057782-124-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Also rename inode_page_locked to inode_folio_locked. Removes
 five calls to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/data.c | 2 +- fs/f2fs/f2fs.h | 12 ++++++------ fs/f2fs/inline.c
 | 6 +++--- fs/f2fs/node.c | 14 +++++++------- fs/f2fs/recovery. [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVl-0003gd-JM
Subject: [f2fs-dev] [PATCH 123/153] f2fs: Convert dnode_of_data->inode_page
 to inode_folio
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

Also rename inode_page_locked to inode_folio_locked.  Removes five
calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c     |  2 +-
 fs/f2fs/f2fs.h     | 12 ++++++------
 fs/f2fs/inline.c   |  6 +++---
 fs/f2fs/node.c     | 14 +++++++-------
 fs/f2fs/recovery.c | 18 +++++++++---------
 5 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a6c7dc56a0e1..e434f4f5439c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1190,7 +1190,7 @@ int f2fs_reserve_new_block(struct dnode_of_data *dn)
 
 int f2fs_reserve_block(struct dnode_of_data *dn, pgoff_t index)
 {
-	bool need_put = dn->inode_page ? false : true;
+	bool need_put = dn->inode_folio ? false : true;
 	int err;
 
 	err = f2fs_get_dnode_of_data(dn, index, ALLOC_NODE);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9f4a041b2d7e..ede550b9f60d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -994,11 +994,11 @@ struct f2fs_nm_info {
  */
 struct dnode_of_data {
 	struct inode *inode;		/* vfs inode pointer */
-	struct page *inode_page;	/* its inode page, NULL is possible */
+	struct folio *inode_folio;	/* its inode folio, NULL is possible */
 	struct page *node_page;		/* cached direct node page */
 	nid_t nid;			/* node id of the direct node block */
 	unsigned int ofs_in_node;	/* data offset in the node page */
-	bool inode_page_locked;		/* inode page is locked or not */
+	bool inode_folio_locked;	/* inode folio is locked or not */
 	bool node_changed;		/* is node block changed */
 	char cur_level;			/* level of hole node page */
 	char max_level;			/* level of current page located */
@@ -1010,7 +1010,7 @@ static inline void set_new_dnode(struct dnode_of_data *dn, struct inode *inode,
 {
 	memset(dn, 0, sizeof(*dn));
 	dn->inode = inode;
-	dn->inode_page = &ifolio->page;
+	dn->inode_folio = ifolio;
 	dn->node_page = &nfolio->page;
 	dn->nid = nid;
 }
@@ -2882,10 +2882,10 @@ static inline void f2fs_put_dnode(struct dnode_of_data *dn)
 {
 	if (dn->node_page)
 		f2fs_put_page(dn->node_page, 1);
-	if (dn->inode_page && dn->node_page != dn->inode_page)
-		f2fs_put_page(dn->inode_page, 0);
+	if (dn->inode_folio && dn->node_page != &dn->inode_folio->page)
+		f2fs_folio_put(dn->inode_folio, false);
 	dn->node_page = NULL;
-	dn->inode_page = NULL;
+	dn->inode_folio = NULL;
 }
 
 static inline struct kmem_cache *f2fs_kmem_cache_create(const char *name,
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 919d30034fe0..7a5481006ed3 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -184,7 +184,7 @@ int f2fs_convert_inline_folio(struct dnode_of_data *dn, struct folio *folio)
 
 	f2fs_bug_on(F2FS_F_SB(folio), folio_test_writeback(folio));
 
-	f2fs_do_read_inline_data(folio, dn->inode_page);
+	f2fs_do_read_inline_data(folio, &dn->inode_folio->page);
 	folio_mark_dirty(folio);
 
 	/* clear dirty state */
@@ -205,8 +205,8 @@ int f2fs_convert_inline_folio(struct dnode_of_data *dn, struct folio *folio)
 	set_inode_flag(dn->inode, FI_APPEND_WRITE);
 
 	/* clear inline data and flag after data writeback */
-	f2fs_truncate_inline_inode(dn->inode, dn->inode_page, 0);
-	clear_page_private_inline(dn->inode_page);
+	f2fs_truncate_inline_inode(dn->inode, &dn->inode_folio->page, 0);
+	clear_page_private_inline(&dn->inode_folio->page);
 clear_out:
 	stat_dec_inline_inode(dn->inode);
 	clear_inode_flag(dn->inode, FI_INLINE_DATA);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index e9e33241e762..bf583cd2a589 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -778,12 +778,12 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 
 	nids[0] = dn->inode->i_ino;
 
-	if (!dn->inode_page) {
+	if (!dn->inode_folio) {
 		nfolio[0] = f2fs_get_inode_folio(sbi, nids[0]);
 		if (IS_ERR(nfolio[0]))
 			return PTR_ERR(nfolio[0]);
 	} else {
-		nfolio[0] = page_folio(dn->inode_page);
+		nfolio[0] = dn->inode_folio;
 	}
 
 	/* if inline_data is set, should not report any block indices */
@@ -796,8 +796,8 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 	parent = nfolio[0];
 	if (level != 0)
 		nids[1] = get_nid(&parent->page, offset[0], true);
-	dn->inode_page = &nfolio[0]->page;
-	dn->inode_page_locked = true;
+	dn->inode_folio = nfolio[0];
+	dn->inode_folio_locked = true;
 
 	/* get indirect or direct nodes */
 	for (i = 1; i <= level; i++) {
@@ -830,7 +830,7 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 			done = true;
 		}
 		if (i == 1) {
-			dn->inode_page_locked = false;
+			dn->inode_folio_locked = false;
 			folio_unlock(parent);
 		} else {
 			f2fs_folio_put(parent, true);
@@ -888,7 +888,7 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 	if (i > 1)
 		f2fs_folio_put(nfolio[0], false);
 release_out:
-	dn->inode_page = NULL;
+	dn->inode_folio = NULL;
 	dn->node_page = NULL;
 	if (err == -ENOENT) {
 		dn->cur_level = i;
@@ -1070,7 +1070,7 @@ static int truncate_partial_nodes(struct dnode_of_data *dn,
 	int i;
 	int idx = depth - 2;
 
-	nid[0] = get_nid(dn->inode_page, offset[0], true);
+	nid[0] = get_nid(&dn->inode_folio->page, offset[0], true);
 	if (!nid[0])
 		return 0;
 
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index ac8f2d0763a4..69d8eaaf9013 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -537,9 +537,9 @@ static int check_index_in_prev_nodes(struct f2fs_sb_info *sbi,
 
 	if (dn->inode->i_ino == nid) {
 		tdn.nid = nid;
-		if (!dn->inode_page_locked)
-			lock_page(dn->inode_page);
-		tdn.node_page = dn->inode_page;
+		if (!dn->inode_folio_locked)
+			folio_lock(dn->inode_folio);
+		tdn.node_page = &dn->inode_folio->page;
 		tdn.ofs_in_node = ofs_in_node;
 		goto truncate_out;
 	} else if (dn->nid == nid) {
@@ -580,8 +580,8 @@ static int check_index_in_prev_nodes(struct f2fs_sb_info *sbi,
 	 * if inode page is locked, unlock temporarily, but its reference
 	 * count keeps alive.
 	 */
-	if (ino == dn->inode->i_ino && dn->inode_page_locked)
-		unlock_page(dn->inode_page);
+	if (ino == dn->inode->i_ino && dn->inode_folio_locked)
+		folio_unlock(dn->inode_folio);
 
 	set_new_dnode(&tdn, inode, NULL, NULL, 0);
 	if (f2fs_get_dnode_of_data(&tdn, bidx, LOOKUP_NODE))
@@ -594,15 +594,15 @@ static int check_index_in_prev_nodes(struct f2fs_sb_info *sbi,
 out:
 	if (ino != dn->inode->i_ino)
 		iput(inode);
-	else if (dn->inode_page_locked)
-		lock_page(dn->inode_page);
+	else if (dn->inode_folio_locked)
+		folio_lock(dn->inode_folio);
 	return 0;
 
 truncate_out:
 	if (f2fs_data_blkaddr(&tdn) == blkaddr)
 		f2fs_truncate_data_blocks_range(&tdn, 1);
-	if (dn->inode->i_ino == nid && !dn->inode_page_locked)
-		unlock_page(dn->inode_page);
+	if (dn->inode->i_ino == nid && !dn->inode_folio_locked)
+		folio_unlock(dn->inode_folio);
 	return 0;
 }
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
