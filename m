Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 483F1A76E34
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVe-0000yb-81;
	Mon, 31 Mar 2025 20:13:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVb-0000vv-RY
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=caUaXde8XgzL0UnGcci3qr8J6PuwFE6INRvF5iSaKwM=; b=W+orabHTgyTio5kHVq8h2d1rMl
 8KXaQU8nSn0bM3TzIlKgR5S+cySL6xmADReQzMP2CoSQmdHvBCaCy5PiRMmNvIYFLm+Zecx1KEvox
 NOtC2vR55BFMmX8m4cUiGXgyjYfzEhUkF8IFaZcxvby06swuUJ3JXERZnuyRaWJxXtFk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=caUaXde8XgzL0UnGcci3qr8J6PuwFE6INRvF5iSaKwM=; b=RJMAAt5zzEJDIBMbaGOO8DEWuk
 /di3puqBRaBV3gIg4pdxEQ21HvLpIbFSUfAfxc55dzS9E1rLmpDM+2NaQWzNAxAJmRqCiIh8cadrn
 tMy7OkCJ7dfzFKBUz+Lwk68HZNpPb87wrSzpi/UUDyTuCAbrEOSJaiPKbA1zzXFj7KS4=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVW-0003aE-SQ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=caUaXde8XgzL0UnGcci3qr8J6PuwFE6INRvF5iSaKwM=; b=awmgDzcTddepP23rox5bkdnaLX
 MUmPZO0oCPv1wVF5gq7YIi+FDiIqEflOlogafQFAdNHvV28WTe+7QpK5Yxh2l2j7TjH1BEVyLBmbd
 e5yKeAajMM+RGus1RP9314OlkSOrMkYpsMY1xweGxTixvX5jg9vpQz9zKp7lNtSN/xf3ymAcefrgl
 VHMvFsQDBxsRBSiX8xE/73xk9Sorv+ULP7iOFvJFR+l8LFuRq0M54oPjZm1WbCmZ6KPsBR55byoEu
 v87IBJv2u4Mn1wTdMzgFZgweqpouS7+jsdWLDLF7/zPGIpF++m6+lPBvMp5ouzA0ihIe90B1ugXSU
 9/SK9Mgw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVQ-00000004Rvd-2IVq;
 Mon, 31 Mar 2025 20:13:12 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:34 +0100
Message-ID: <20250331201256.1057782-75-willy@infradead.org>
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
 Content preview: Pass the folio into __get_node_folio() and
 f2fs_get_node_page_ra()
 which becomes f2fs_get_node_folio_ra(). That function has no callers outside
 node.c, so make it static. Removes seven calls to compou [...] 
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
X-Headers-End: 1tzLVW-0003aE-SQ
Subject: [f2fs-dev] [PATCH 074/153] f2fs: Use folios in
 f2fs_get_dnode_of_data()
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

Pass the folio into __get_node_folio() and f2fs_get_node_page_ra() which
becomes f2fs_get_node_folio_ra().  That function has no callers outside
node.c, so make it static.  Removes seven calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h |  1 -
 fs/f2fs/node.c | 76 +++++++++++++++++++++++++-------------------------
 2 files changed, 38 insertions(+), 39 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 62ae222824e9..0d32541993a0 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3735,7 +3735,6 @@ struct folio *f2fs_get_inode_folio(struct f2fs_sb_info *sbi, pgoff_t ino);
 struct page *f2fs_get_inode_page(struct f2fs_sb_info *sbi, pgoff_t ino);
 struct folio *f2fs_get_xnode_folio(struct f2fs_sb_info *sbi, pgoff_t xnid);
 struct page *f2fs_get_xnode_page(struct f2fs_sb_info *sbi, pgoff_t xnid);
-struct page *f2fs_get_node_page_ra(struct page *parent, int start);
 int f2fs_move_node_page(struct page *node_page, int gc_type);
 void f2fs_flush_inline_data(struct f2fs_sb_info *sbi);
 int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index ef433dce4b05..1c6eeed110c9 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -754,6 +754,8 @@ static int get_node_path(struct inode *inode, long block,
 	return level;
 }
 
+static struct folio *f2fs_get_node_folio_ra(struct folio *parent, int start);
+
 /*
  * Caller should call f2fs_put_dnode(dn).
  * Also, it should grab and release a rwsem by calling f2fs_lock_op() and
@@ -762,8 +764,8 @@ static int get_node_path(struct inode *inode, long block,
 int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
-	struct page *npage[4];
-	struct page *parent = NULL;
+	struct folio *nfolio[4];
+	struct folio *parent = NULL;
 	int offset[4];
 	unsigned int noffset[4];
 	nid_t nids[4];
@@ -775,25 +777,26 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 		return level;
 
 	nids[0] = dn->inode->i_ino;
-	npage[0] = dn->inode_page;
 
-	if (!npage[0]) {
-		npage[0] = f2fs_get_inode_page(sbi, nids[0]);
-		if (IS_ERR(npage[0]))
-			return PTR_ERR(npage[0]);
+	if (!dn->inode_page) {
+		nfolio[0] = f2fs_get_inode_folio(sbi, nids[0]);
+		if (IS_ERR(nfolio[0]))
+			return PTR_ERR(nfolio[0]);
+	} else {
+		nfolio[0] = page_folio(dn->inode_page);
 	}
 
 	/* if inline_data is set, should not report any block indices */
 	if (f2fs_has_inline_data(dn->inode) && index) {
 		err = -ENOENT;
-		f2fs_put_page(npage[0], 1);
+		f2fs_folio_put(nfolio[0], true);
 		goto release_out;
 	}
 
-	parent = npage[0];
+	parent = nfolio[0];
 	if (level != 0)
-		nids[1] = get_nid(parent, offset[0], true);
-	dn->inode_page = npage[0];
+		nids[1] = get_nid(&parent->page, offset[0], true);
+	dn->inode_page = &nfolio[0]->page;
 	dn->inode_page_locked = true;
 
 	/* get indirect or direct nodes */
@@ -808,47 +811,47 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 			}
 
 			dn->nid = nids[i];
-			npage[i] = f2fs_new_node_page(dn, noffset[i]);
-			if (IS_ERR(npage[i])) {
+			nfolio[i] = f2fs_new_node_folio(dn, noffset[i]);
+			if (IS_ERR(nfolio[i])) {
 				f2fs_alloc_nid_failed(sbi, nids[i]);
-				err = PTR_ERR(npage[i]);
+				err = PTR_ERR(nfolio[i]);
 				goto release_pages;
 			}
 
-			set_nid(parent, offset[i - 1], nids[i], i == 1);
+			set_nid(&parent->page, offset[i - 1], nids[i], i == 1);
 			f2fs_alloc_nid_done(sbi, nids[i]);
 			done = true;
 		} else if (mode == LOOKUP_NODE_RA && i == level && level > 1) {
-			npage[i] = f2fs_get_node_page_ra(parent, offset[i - 1]);
-			if (IS_ERR(npage[i])) {
-				err = PTR_ERR(npage[i]);
+			nfolio[i] = f2fs_get_node_folio_ra(parent, offset[i - 1]);
+			if (IS_ERR(nfolio[i])) {
+				err = PTR_ERR(nfolio[i]);
 				goto release_pages;
 			}
 			done = true;
 		}
 		if (i == 1) {
 			dn->inode_page_locked = false;
-			unlock_page(parent);
+			folio_unlock(parent);
 		} else {
-			f2fs_put_page(parent, 1);
+			f2fs_folio_put(parent, true);
 		}
 
 		if (!done) {
-			npage[i] = f2fs_get_node_page(sbi, nids[i]);
-			if (IS_ERR(npage[i])) {
-				err = PTR_ERR(npage[i]);
-				f2fs_put_page(npage[0], 0);
+			nfolio[i] = f2fs_get_node_folio(sbi, nids[i]);
+			if (IS_ERR(nfolio[i])) {
+				err = PTR_ERR(nfolio[i]);
+				f2fs_folio_put(nfolio[0], false);
 				goto release_out;
 			}
 		}
 		if (i < level) {
-			parent = npage[i];
-			nids[i + 1] = get_nid(parent, offset[i], false);
+			parent = nfolio[i];
+			nids[i + 1] = get_nid(&parent->page, offset[i], false);
 		}
 	}
 	dn->nid = nids[level];
 	dn->ofs_in_node = offset[level];
-	dn->node_page = npage[level];
+	dn->node_page = &nfolio[level]->page;
 	dn->data_blkaddr = f2fs_data_blkaddr(dn);
 
 	if (is_inode_flag_set(dn->inode, FI_COMPRESSED_FILE) &&
@@ -881,9 +884,9 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 	return 0;
 
 release_pages:
-	f2fs_put_page(parent, 1);
+	f2fs_folio_put(parent, true);
 	if (i > 1)
-		f2fs_put_page(npage[0], 0);
+		f2fs_folio_put(nfolio[0], false);
 release_out:
 	dn->inode_page = NULL;
 	dn->node_page = NULL;
@@ -1479,8 +1482,7 @@ static int sanity_check_node_footer(struct f2fs_sb_info *sbi,
 }
 
 static struct folio *__get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
-					struct page *parent, int start,
-					enum node_type ntype)
+		struct folio *parent, int start, enum node_type ntype)
 {
 	struct folio *folio;
 	int err;
@@ -1503,7 +1505,7 @@ static struct folio *__get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
 	}
 
 	if (parent)
-		f2fs_ra_node_pages(parent, start + 1, MAX_RA_NODE);
+		f2fs_ra_node_pages(&parent->page, start + 1, MAX_RA_NODE);
 
 	folio_lock(folio);
 
@@ -1573,14 +1575,12 @@ struct page *f2fs_get_xnode_page(struct f2fs_sb_info *sbi, pgoff_t xnid)
 	return &folio->page;
 }
 
-struct page *f2fs_get_node_page_ra(struct page *parent, int start)
+static struct folio *f2fs_get_node_folio_ra(struct folio *parent, int start)
 {
-	struct f2fs_sb_info *sbi = F2FS_P_SB(parent);
-	nid_t nid = get_nid(parent, start, false);
-	struct folio *folio = __get_node_folio(sbi, nid, parent, start,
-							NODE_TYPE_REGULAR);
+	struct f2fs_sb_info *sbi = F2FS_F_SB(parent);
+	nid_t nid = get_nid(&parent->page, start, false);
 
-	return &folio->page;
+	return __get_node_folio(sbi, nid, parent, start, NODE_TYPE_REGULAR);
 }
 
 static void flush_inline_data(struct f2fs_sb_info *sbi, nid_t ino)
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
