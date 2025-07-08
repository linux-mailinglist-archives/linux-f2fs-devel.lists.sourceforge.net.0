Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DF6AFD420
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cyLd5OHP3gf332ux4KfRDiHdTPVbFPKGFEZriL9h3E=; b=mLYhJIIWVrbw+6pFcwyqykPEmZ
	hkWzBgmr4F59Ah5h/Cmtd3fZHyQlpBOSlGEBtRhJZ2Sg1v3eNTPUZtbha5hHhtJInYTZiW9sDzPoe
	BvPLouWvQKh6UDZFzrmS1syv5azcDtj+yi5meXVw9JM0DyeZ7fK/kn/WKeo1hsIGtzpQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjp-0002lV-Pv;
	Tue, 08 Jul 2025 17:04:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjn-0002l9-FO
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V81F9YoFUnmMz6xMkXFjgFkJMTPbjphh5UE99Q7DOi4=; b=gE8Pg0BCv+Ig6l1yqFG48Ce/O4
 lQ1A1jZXK0m87eRjfkSDBI99WYOT5XEztP/59tLqSukPmJ0g+Fwi2RgdhLWe3wFC52wylJC8gqiJ/
 VE9fZChq2kp58dQ+qbXU0cB5TaeaJtJs1+aOkSQ7b956rEP7dbsOf3xUQqmTfKZuhwX0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V81F9YoFUnmMz6xMkXFjgFkJMTPbjphh5UE99Q7DOi4=; b=XIOePRyTGepR1NHfYZAx8oABB6
 dTfwG0KqNNM9fFjPFaKPTQ5L0uuHyrLYEH4ubiP578kordeS4dn89I8MoMfLABstRoyEViwq1Xos6
 Ca/vasdcEgkNEZjO5+m+TydHtxpKUbHZzDopowkLWPCUJeTw0QGfjYPNrepVfMvXKJB4=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjm-0006E7-VM for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=V81F9YoFUnmMz6xMkXFjgFkJMTPbjphh5UE99Q7DOi4=; b=SFCNcd2+IYUnqS8u05/R3LoYa7
 VktbSkmldKtNjXNDu0kRvPq99OBNzhdYU0NdV7cf2AJcsxe0YX2CmTd0ZWIh++Z95R5o4rmv7uVu+
 iVcqZsCxd+pPeaO8JtJZ/Ys7mx7VcZREtPtmM/zR7yl0H52DHXhRgg24k0mUXoaXUPOnPpAkAFRRS
 Ggs4FgRxpxYlzJWzssf3eaCACdrTXjd4NOG0XJY7Kq5+//R6MRBFNN3mSVxjGral09kwdULWW4oMc
 FV7stRQjoYzPctLMgfYYNtM34kpEX9uyaVhPpsaC9LW9WPLn5BIFpPrHywy9y31op+FIXp+1f5wgn
 lt9FwzcQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjg-00000000T5I-2QpW;
 Tue, 08 Jul 2025 17:04:04 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:18 +0100
Message-ID: <20250708170359.111653-22-willy@infradead.org>
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
 Content preview: All callers have a folio so pass it in. Also mark it as const
 to help the compiler. Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/node.c | 18 +++++++++--------- fs/f2fs/node.h | 4 ++-- 2 files
 changed, 11 insertions(+), 11 deletions(-) 
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
X-Headers-End: 1uZBjm-0006E7-VM
Subject: [f2fs-dev] [PATCH 21/60] f2fs: Pass a folio to get_nid()
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

All callers have a folio so pass it in.  Also mark it as const to help
the compiler.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 18 +++++++++---------
 fs/f2fs/node.h |  4 ++--
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 50c08e89f063..c733cf6daa2f 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -649,7 +649,7 @@ static void f2fs_ra_node_pages(struct folio *parent, int start, int n)
 	end = start + n;
 	end = min(end, (int)NIDS_PER_BLOCK);
 	for (i = start; i < end; i++) {
-		nid = get_nid(&parent->page, i, false);
+		nid = get_nid(parent, i, false);
 		f2fs_ra_node_page(sbi, nid);
 	}
 
@@ -808,7 +808,7 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 
 	parent = nfolio[0];
 	if (level != 0)
-		nids[1] = get_nid(&parent->page, offset[0], true);
+		nids[1] = get_nid(parent, offset[0], true);
 	dn->inode_folio = nfolio[0];
 	dn->inode_folio_locked = true;
 
@@ -859,7 +859,7 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 		}
 		if (i < level) {
 			parent = nfolio[i];
-			nids[i + 1] = get_nid(&parent->page, offset[i], false);
+			nids[i + 1] = get_nid(parent, offset[i], false);
 		}
 	}
 	dn->nid = nids[level];
@@ -1083,7 +1083,7 @@ static int truncate_partial_nodes(struct dnode_of_data *dn,
 	int i;
 	int idx = depth - 2;
 
-	nid[0] = get_nid(&dn->inode_folio->page, offset[0], true);
+	nid[0] = get_nid(dn->inode_folio, offset[0], true);
 	if (!nid[0])
 		return 0;
 
@@ -1096,14 +1096,14 @@ static int truncate_partial_nodes(struct dnode_of_data *dn,
 			idx = i - 1;
 			goto fail;
 		}
-		nid[i + 1] = get_nid(&folios[i]->page, offset[i + 1], false);
+		nid[i + 1] = get_nid(folios[i], offset[i + 1], false);
 	}
 
 	f2fs_ra_node_pages(folios[idx], offset[idx + 1], NIDS_PER_BLOCK);
 
 	/* free direct nodes linked to a partial indirect node */
 	for (i = offset[idx + 1]; i < NIDS_PER_BLOCK; i++) {
-		child_nid = get_nid(&folios[idx]->page, i, false);
+		child_nid = get_nid(folios[idx], i, false);
 		if (!child_nid)
 			continue;
 		dn->nid = child_nid;
@@ -1201,7 +1201,7 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 
 skip_partial:
 	while (cont) {
-		dn.nid = get_nid(&folio->page, offset[0], true);
+		dn.nid = get_nid(folio, offset[0], true);
 		switch (offset[0]) {
 		case NODE_DIR1_BLOCK:
 		case NODE_DIR2_BLOCK:
@@ -1233,7 +1233,7 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 		}
 		if (err < 0)
 			goto fail;
-		if (offset[1] == 0 && get_nid(&folio->page, offset[0], true)) {
+		if (offset[1] == 0 && get_nid(folio, offset[0], true)) {
 			folio_lock(folio);
 			BUG_ON(!is_node_folio(folio));
 			set_nid(folio, offset[0], 0, true);
@@ -1566,7 +1566,7 @@ struct folio *f2fs_get_xnode_folio(struct f2fs_sb_info *sbi, pgoff_t xnid)
 static struct folio *f2fs_get_node_folio_ra(struct folio *parent, int start)
 {
 	struct f2fs_sb_info *sbi = F2FS_F_SB(parent);
-	nid_t nid = get_nid(&parent->page, start, false);
+	nid_t nid = get_nid(parent, start, false);
 
 	return __get_node_folio(sbi, nid, parent, start, NODE_TYPE_REGULAR);
 }
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 5cbe038bfaab..bf6d6fab0c78 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -380,9 +380,9 @@ static inline int set_nid(struct folio *folio, int off, nid_t nid, bool i)
 	return folio_mark_dirty(folio);
 }
 
-static inline nid_t get_nid(struct page *p, int off, bool i)
+static inline nid_t get_nid(const struct folio *folio, int off, bool i)
 {
-	struct f2fs_node *rn = F2FS_NODE(p);
+	struct f2fs_node *rn = F2FS_NODE(&folio->page);
 
 	if (i)
 		return le32_to_cpu(rn->i.i_nid[off - NODE_DIR1_BLOCK]);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
