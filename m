Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C36A76EB3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWR-0001Xj-4J;
	Mon, 31 Mar 2025 20:14:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVu-0001A2-DM
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oEDxK5Uv+eHC058DC2F81pM4sLiJTBLHKlaIEvhuQEc=; b=euGwm6+ypGELXykuxKehj7JbiR
 zmebnMOWDvQgZY9IPvh/davRAFv3BXvXb8xHXy6KwQKAlefij48oqiRuPdBh+LRRlEQDdSBxeOKsW
 AvkNhqizdbk4FTufyExVNdT3Q9DRBOg4MLsc9gP4c3vkGdPBAuyTDUORBntkjS4CIzEo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oEDxK5Uv+eHC058DC2F81pM4sLiJTBLHKlaIEvhuQEc=; b=QUYmcRclpvZy9Rj2fIUf4tNbzZ
 N9/7MKkWWoghCH/jyfdKTq8mBEqagjAUl4TZ+NsOnO+RLE8Zwudi0Av/Gy/uBpriCIqTeL2ieBT8X
 qedWB8wjHZbsGYIr1pOXYJQOet3AdCGTME6nD3DTKJRAhUX0zxb5ki99zswHBvZxCxO4=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVp-0003iE-HU for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=oEDxK5Uv+eHC058DC2F81pM4sLiJTBLHKlaIEvhuQEc=; b=wFu7ZaCdn+RgEJXh2heI8oG/8Q
 0uYW8ltDSPFF0Ae2PIofU+yZRhWFPYrftEpyrCqHzlBsK1fhFGu1cIuEXGTpMImaVup6RvGLJcFsY
 Mxv51KmCQRaVYrsRQkcYdpLjvaSqK7jCnWNFap61JFy6m4XsWL8dwbZeCEjyZUCWK2tytjU2ogDCV
 ha3ujQkXtQlbXfHel4YsrebozTQmNTrHs2G4g17IVSryXkt/vwl2DRwdNOcMZwQjQnyclYf7mjJpr
 fuXEof/D7ETGIL0E0KLPmIjgIAurN7JXG9dpKBQs3exsB9QIgmYVQObQ8Glz+LGe4oIO7A1Ku+00r
 xkGRcgKg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVe-00000004Sd9-0LeF;
 Mon, 31 Mar 2025 20:13:26 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:47 +0100
Message-ID: <20250331201256.1057782-148-willy@infradead.org>
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
 Content preview:  All callers have a folio, so pass it in. Removes two calls
 to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/node.c | 10 +++++----- fs/f2fs/node.h | 8 ++++---- 2 files changed,
 9 insertions(+), 9 deletions(-) 
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
X-Headers-End: 1tzLVp-0003iE-HU
Subject: [f2fs-dev] [PATCH 147/153] f2fs: Pass a folio to set_nid()
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

All callers have a folio, so pass it in.  Removes two calls to
compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 10 +++++-----
 fs/f2fs/node.h |  8 ++++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 152c664f94bf..266f9fb550ea 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -818,7 +818,7 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 				goto release_pages;
 			}
 
-			set_nid(&parent->page, offset[i - 1], nids[i], i == 1);
+			set_nid(parent, offset[i - 1], nids[i], i == 1);
 			f2fs_alloc_nid_done(sbi, nids[i]);
 			done = true;
 		} else if (mode == LOOKUP_NODE_RA && i == level && level > 1) {
@@ -1017,7 +1017,7 @@ static int truncate_nodes(struct dnode_of_data *dn, unsigned int nofs,
 			ret = truncate_dnode(&rdn);
 			if (ret < 0)
 				goto out_err;
-			if (set_nid(&folio->page, i, 0, false))
+			if (set_nid(folio, i, 0, false))
 				dn->node_changed = true;
 		}
 	} else {
@@ -1031,7 +1031,7 @@ static int truncate_nodes(struct dnode_of_data *dn, unsigned int nofs,
 			rdn.nid = child_nid;
 			ret = truncate_nodes(&rdn, child_nofs, 0, depth - 1);
 			if (ret == (NIDS_PER_BLOCK + 1)) {
-				if (set_nid(&folio->page, i, 0, false))
+				if (set_nid(folio, i, 0, false))
 					dn->node_changed = true;
 				child_nofs += ret;
 			} else if (ret < 0 && ret != -ENOENT) {
@@ -1097,7 +1097,7 @@ static int truncate_partial_nodes(struct dnode_of_data *dn,
 		err = truncate_dnode(dn);
 		if (err < 0)
 			goto fail;
-		if (set_nid(&folios[idx]->page, i, 0, false))
+		if (set_nid(folios[idx], i, 0, false))
 			dn->node_changed = true;
 	}
 
@@ -1223,7 +1223,7 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 		if (offset[1] == 0 && get_nid(&folio->page, offset[0], true)) {
 			folio_lock(folio);
 			BUG_ON(folio->mapping != NODE_MAPPING(sbi));
-			set_nid(&folio->page, offset[0], 0, true);
+			set_nid(folio, offset[0], 0, true);
 			folio_unlock(folio);
 		}
 		offset[1] = 0;
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index c58ff16f1227..1446c433b3ec 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -367,17 +367,17 @@ static inline bool IS_DNODE(const struct page *node_page)
 	return true;
 }
 
-static inline int set_nid(struct page *p, int off, nid_t nid, bool i)
+static inline int set_nid(struct folio *folio, int off, nid_t nid, bool i)
 {
-	struct f2fs_node *rn = F2FS_NODE(p);
+	struct f2fs_node *rn = F2FS_NODE(&folio->page);
 
-	f2fs_wait_on_page_writeback(p, NODE, true, true);
+	f2fs_folio_wait_writeback(folio, NODE, true, true);
 
 	if (i)
 		rn->i.i_nid[off - NODE_DIR1_BLOCK] = cpu_to_le32(nid);
 	else
 		rn->in.nid[off] = cpu_to_le32(nid);
-	return set_page_dirty(p);
+	return folio_mark_dirty(folio);
 }
 
 static inline nid_t get_nid(struct page *p, int off, bool i)
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
