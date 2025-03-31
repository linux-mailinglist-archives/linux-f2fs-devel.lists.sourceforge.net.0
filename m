Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F92A76E32
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVd-0000xJ-6S;
	Mon, 31 Mar 2025 20:13:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVa-0000ui-3Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JkdG1J1VUXlo7ElHPbu0WDZVCT0RVF4/Ns9mYQCqbpU=; b=CYBItcgWYX8Gl/RhhErHo/iYhu
 ibeS3QHYW+TpY9U+jk6cxF4SpHivTR1XyV4JJbGuWPrg7yMFt8FS0vmdfi3/0p+AsbISV8CnGq4Lv
 +h8MjnmjdXWUAQMRkkVDUkn8AFMApPust8sB9WSLUwEkBmdzTe23OPf0z2qCfXSSp6Z4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JkdG1J1VUXlo7ElHPbu0WDZVCT0RVF4/Ns9mYQCqbpU=; b=ltArHV09Z/M1KEfUb4TLLWQYAh
 ZAUTOGNNJGyqfcsn8hxA5PXU0zayV3zQHUVZDEkThHmW3LtiSoiXevM01avK1bVRem0plldVMQQUX
 dPFDlYY9z8lhLU5yNmEm/65jpP/2F7K2zOR5Z/qV5oGzisNLjQBoRUZE9AlZ69Rnjz2A=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVa-0003bT-7g for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=JkdG1J1VUXlo7ElHPbu0WDZVCT0RVF4/Ns9mYQCqbpU=; b=bA6o5yLzHG1IfKkqTJ41tBp4HY
 TMBcmHCk32P9oWrK30LTt1nzrM7z3EKvNJX5rc9hRQV/f3LcnHsFdzv9LkhkpbOrNo7ippy1n3yiY
 JVjGwIYsnokZb1pe8GpdS1No8R9mwIehwAyxI7R08dd0RQnHRIjaW4MiVlu2mIyh8nEomJLdwChN+
 2XYEBXHul45YCYoU3nf62s6aGOdpy6y0lgtAGcxdjwZicHRU4HviTXcDmiQkI7Dd6s4yJDctz0mHm
 zk72qlZAoyL7EslW3pn1u0W/R48qylqFdtF7nsvhkRxq1/ecEkNlvomnTUPYDwX+8gFaGhNbgBaZn
 oYkIbWLw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVO-00000004Rr7-3a7I;
 Mon, 31 Mar 2025 20:13:10 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:24 +0100
Message-ID: <20250331201256.1057782-65-willy@infradead.org>
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
 Content preview:  Convert f2fs_new_node_page() to f2fs_new_node_folio() and
 add a compatibility wrapper. Removes five hidden calls to compound_head().
 Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 fs/f2fs/f2fs.h
 | 8 +++++++- fs/f2fs/node.c | 28 ++++++++++++++ 2 files changed,
 21 insertions(+), 15 deletions(-) 
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
X-Headers-End: 1tzLVa-0003bT-7g
Subject: [f2fs-dev] [PATCH 064/153] f2fs: Add f2fs_new_node_folio()
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

Convert f2fs_new_node_page() to f2fs_new_node_folio() and add
a compatibility wrapper.  Removes five hidden calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h |  8 +++++++-
 fs/f2fs/node.c | 28 ++++++++++++++--------------
 2 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5ad799c12ce6..11e63c5f524a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3737,7 +3737,7 @@ int f2fs_wait_on_node_pages_writeback(struct f2fs_sb_info *sbi,
 					unsigned int seq_id);
 int f2fs_remove_inode_page(struct inode *inode);
 struct page *f2fs_new_inode_page(struct inode *inode);
-struct page *f2fs_new_node_page(struct dnode_of_data *dn, unsigned int ofs);
+struct folio *f2fs_new_node_folio(struct dnode_of_data *dn, unsigned int ofs);
 void f2fs_ra_node_page(struct f2fs_sb_info *sbi, nid_t nid);
 struct page *f2fs_get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid);
 struct folio *f2fs_get_inode_folio(struct f2fs_sb_info *sbi, pgoff_t ino);
@@ -3768,6 +3768,12 @@ void f2fs_destroy_node_manager(struct f2fs_sb_info *sbi);
 int __init f2fs_create_node_manager_caches(void);
 void f2fs_destroy_node_manager_caches(void);
 
+static inline
+struct page *f2fs_new_node_page(struct dnode_of_data *dn, unsigned int ofs)
+{
+	return &f2fs_new_node_folio(dn, ofs)->page;
+}
+
 /*
  * segment.c
  */
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 34dc61a131bf..5fe8f48b2ac5 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1320,19 +1320,19 @@ struct page *f2fs_new_inode_page(struct inode *inode)
 	return f2fs_new_node_page(&dn, 0);
 }
 
-struct page *f2fs_new_node_page(struct dnode_of_data *dn, unsigned int ofs)
+struct folio *f2fs_new_node_folio(struct dnode_of_data *dn, unsigned int ofs)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
 	struct node_info new_ni;
-	struct page *page;
+	struct folio *folio;
 	int err;
 
 	if (unlikely(is_inode_flag_set(dn->inode, FI_NO_ALLOC)))
 		return ERR_PTR(-EPERM);
 
-	page = f2fs_grab_cache_page(NODE_MAPPING(sbi), dn->nid, false);
-	if (!page)
-		return ERR_PTR(-ENOMEM);
+	folio = f2fs_grab_cache_folio(NODE_MAPPING(sbi), dn->nid, false);
+	if (IS_ERR(folio))
+		return folio;
 
 	if (unlikely((err = inc_valid_node_count(sbi, dn->inode, !ofs))))
 		goto fail;
@@ -1363,12 +1363,12 @@ struct page *f2fs_new_node_page(struct dnode_of_data *dn, unsigned int ofs)
 	new_ni.version = 0;
 	set_node_addr(sbi, &new_ni, NEW_ADDR, false);
 
-	f2fs_wait_on_page_writeback(page, NODE, true, true);
-	fill_node_footer(page, dn->nid, dn->inode->i_ino, ofs, true);
-	set_cold_node(page, S_ISDIR(dn->inode->i_mode));
-	if (!PageUptodate(page))
-		SetPageUptodate(page);
-	if (set_page_dirty(page))
+	f2fs_folio_wait_writeback(folio, NODE, true, true);
+	fill_node_footer(&folio->page, dn->nid, dn->inode->i_ino, ofs, true);
+	set_cold_node(&folio->page, S_ISDIR(dn->inode->i_mode));
+	if (!folio_test_uptodate(folio))
+		folio_mark_uptodate(folio);
+	if (folio_mark_dirty(folio))
 		dn->node_changed = true;
 
 	if (f2fs_has_xattr_block(ofs))
@@ -1376,10 +1376,10 @@ struct page *f2fs_new_node_page(struct dnode_of_data *dn, unsigned int ofs)
 
 	if (ofs == 0)
 		inc_valid_inode_count(sbi);
-	return page;
+	return folio;
 fail:
-	clear_node_page_dirty(page);
-	f2fs_put_page(page, 1);
+	clear_node_page_dirty(&folio->page);
+	f2fs_folio_put(folio, true);
 	return ERR_PTR(err);
 }
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
