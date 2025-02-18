Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9D6A3931E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2025 06:52:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tkGWt-0004uc-5o;
	Tue, 18 Feb 2025 05:52:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tkGWq-0004tR-3x
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s3c7AWPy08doWb2YiUJsZUuX3HKazlJ1Pyn3H6oNhmo=; b=DFKyCFt+t6S5d5NGxkxzkiWF9W
 YgE6Br5gX9b+a0RBuN8dcqFy+8ugURlSS50j+yXP3YLvaoTngnKN45/J35t3i+m7+aMG6OZzGijrH
 SHetMPxBoWWXCDf1dZ8e+A8fV6gD43796PG2eF8fApFAO/riPPdTz9r8kiUyS93P7aYM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s3c7AWPy08doWb2YiUJsZUuX3HKazlJ1Pyn3H6oNhmo=; b=gbH9Z6ESKw7BumdF5E79EvVLXq
 TlvU5iB9NP8lEbvZZuZnxtGUOIhbdAX8dZToNKurc3NAe2ncDclRMRc1Ayrwg+zlq7MSDDMtFpOBb
 3yaKFP4hS2tcPjly06eywRA0m8nmhsKOSTgcV2YGviS9jmgCOsIYqJTNbStNS5Ls3LTg=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tkGWp-0007cO-Qw for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=s3c7AWPy08doWb2YiUJsZUuX3HKazlJ1Pyn3H6oNhmo=; b=aL190dfJeede3TxaHZlFtG85bQ
 ymLD1EIYtytc7E5a/Wb1RSSvx2QXoQdKym07WGr2yfOxTM71bz/Zz1R9UV/1ClNuWHUORu3UXR4bN
 wAOSiWfW0u6ZVIHtiegFvLcriGJc25I+OuzVcdvRTb4CQ+CzlVoT46ys/iFcdDeRyCbKSJkfFPZL5
 jz+U9phrbfU0QvBcr2LhEmlDfGmx+/3qq9vfzg/y8STZl0yElIRebH1raDw9Hfd44ehtJHQsIaHTg
 klw24VEp/Uuxb2Ub2m9CXtl1CJNXGAqYHufq7s0tpB2l+PXv2FnsuNufQiuMzTxpYRBkc573KqS1u
 X53JZBIQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tkGWe-00000002TtF-1GeZ; Tue, 18 Feb 2025 05:52:08 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 18 Feb 2025 05:51:55 +0000
Message-ID: <20250218055203.591403-22-willy@infradead.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218055203.591403-1-willy@infradead.org>
References: <20250218055203.591403-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Convert f2fs_get_read_data_page() into
 f2fs_get_read_data_folio()
 and add a compatibility wrapper. Saves seven hidden calls to compound_head().
 Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 fs/f2fs/data.c
 | 35 +++++++++++++++++ fs/f2fs/f2fs.h | 14 ++++++++++++-- 2 files changed,
 29 insertions(+), 20 deleti [...] 
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
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tkGWp-0007cO-Qw
Subject: [f2fs-dev] [PATCH 21/27] f2fs: Add f2fs_get_read_data_folio()
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
Cc: linux-fsdevel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert f2fs_get_read_data_page() into f2fs_get_read_data_folio() and
add a compatibility wrapper.  Saves seven hidden calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c | 35 +++++++++++++++++------------------
 fs/f2fs/f2fs.h | 14 ++++++++++++--
 2 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index fe7fa08b20c7..f0747c7f669d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1203,18 +1203,17 @@ int f2fs_reserve_block(struct dnode_of_data *dn, pgoff_t index)
 	return err;
 }
 
-struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
-				     blk_opf_t op_flags, bool for_write,
-				     pgoff_t *next_pgofs)
+struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
+		blk_opf_t op_flags, bool for_write, pgoff_t *next_pgofs)
 {
 	struct address_space *mapping = inode->i_mapping;
 	struct dnode_of_data dn;
-	struct page *page;
+	struct folio *folio;
 	int err;
 
-	page = f2fs_grab_cache_page(mapping, index, for_write);
-	if (!page)
-		return ERR_PTR(-ENOMEM);
+	folio = f2fs_grab_cache_folio(mapping, index, for_write);
+	if (IS_ERR(folio))
+		return folio;
 
 	if (f2fs_lookup_read_extent_cache_block(inode, index,
 						&dn.data_blkaddr)) {
@@ -1249,9 +1248,9 @@ struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
 		goto put_err;
 	}
 got_it:
-	if (PageUptodate(page)) {
-		unlock_page(page);
-		return page;
+	if (folio_test_uptodate(folio)) {
+		folio_unlock(folio);
+		return folio;
 	}
 
 	/*
@@ -1262,21 +1261,21 @@ struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
 	 * f2fs_init_inode_metadata.
 	 */
 	if (dn.data_blkaddr == NEW_ADDR) {
-		zero_user_segment(page, 0, PAGE_SIZE);
-		if (!PageUptodate(page))
-			SetPageUptodate(page);
-		unlock_page(page);
-		return page;
+		folio_zero_segment(folio, 0, folio_size(folio));
+		if (!folio_test_uptodate(folio))
+			folio_mark_uptodate(folio);
+		folio_unlock(folio);
+		return folio;
 	}
 
-	err = f2fs_submit_page_read(inode, page_folio(page), dn.data_blkaddr,
+	err = f2fs_submit_page_read(inode, folio, dn.data_blkaddr,
 						op_flags, for_write);
 	if (err)
 		goto put_err;
-	return page;
+	return folio;
 
 put_err:
-	f2fs_put_page(page, 1);
+	f2fs_folio_put(folio, true);
 	return ERR_PTR(err);
 }
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 8f23bb082c6f..3e02df63499e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3895,8 +3895,8 @@ int f2fs_reserve_new_blocks(struct dnode_of_data *dn, blkcnt_t count);
 int f2fs_reserve_new_block(struct dnode_of_data *dn);
 int f2fs_get_block_locked(struct dnode_of_data *dn, pgoff_t index);
 int f2fs_reserve_block(struct dnode_of_data *dn, pgoff_t index);
-struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
-			blk_opf_t op_flags, bool for_write, pgoff_t *next_pgofs);
+struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
+		blk_opf_t op_flags, bool for_write, pgoff_t *next_pgofs);
 struct page *f2fs_find_data_page(struct inode *inode, pgoff_t index,
 							pgoff_t *next_pgofs);
 struct page *f2fs_get_lock_data_page(struct inode *inode, pgoff_t index,
@@ -3926,6 +3926,16 @@ int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi);
 void f2fs_destroy_post_read_wq(struct f2fs_sb_info *sbi);
 extern const struct iomap_ops f2fs_iomap_ops;
 
+static inline struct page *f2fs_get_read_data_page(struct inode *inode,
+		pgoff_t index, blk_opf_t op_flags, bool for_write,
+		pgoff_t *next_pgofs)
+{
+	struct folio *folio = f2fs_get_read_data_folio(inode, index, op_flags,
+			for_write, next_pgofs);
+
+	return &folio->page;
+}
+
 /*
  * gc.c
  */
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
