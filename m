Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB37AA76E5C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVs-0005kz-3y;
	Mon, 31 Mar 2025 20:13:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVd-0005bE-Q2
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tipmeaWYk2VjLUipkkpvJs/OiDNjc2p5g6OwTSu0UE0=; b=TDDg41w9oiNV1nOr4VOq4J0yXF
 HLw3Qet8G3KfhmhRXZozG7mqF9I95o60QGGYBgKAgLATnF5dFXiLhykaE0pkqL5Vcgx9vvgaRUPs+
 r8A8lQRqgUE+gzqE81fVgH5CkcgNNl+fD7ryFTAF4fx+hqdkeYjUXEiFqDqI3ilsXK9E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tipmeaWYk2VjLUipkkpvJs/OiDNjc2p5g6OwTSu0UE0=; b=GVEJrD+TJ2BEBIKsTEzSq6HLxm
 9vo8Yxul3X5z129xwTWKYJNAfjitX3hMNkcuPl/nz7PbgNjtkrX0CVuephWJmVQhiJs+n/CL+O1Gf
 /nXrL2qv/WMsnYFg3K4KRQ39XtJX/Ctv4YzUf4VDDpCzDNyaw9Me4nF2JRBWAViQuxE0=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVc-0003cE-Az for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=tipmeaWYk2VjLUipkkpvJs/OiDNjc2p5g6OwTSu0UE0=; b=EXRbtcw3dvBTDXNmspIb7aaL7c
 6Li2pWb8JQPmiDVzQoGpdtaIwryzklbrPg5AC1/eX5lt+KAE+H2KkbxgS6glkQ5/xxIvvHWGYz81s
 wr0Y2kOq/2ZFF1Se+3vAUKn4/zmbUtx0Hi3hnJyXYilM2aEb8tPZsalHDhLVHWIdkdfORmN+j9dNU
 pkuLWA05SrWsvsNszNdB6+sEKIsqU5PugXGH/bc4qgTR3ujqgSRWlyUbvYmrwu+P/0C7seLTb/dPj
 6w3fWqFDSklwXhOFcMQp7qO303H36HtAm0cWaGYEvxO0mgwlsb2oWw0FkJ6v3PFB8bV4XJT+bK/9R
 SL07pcYg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVQ-00000004RxJ-49Ed;
 Mon, 31 Mar 2025 20:13:13 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:37 +0100
Message-ID: <20250331201256.1057782-78-willy@infradead.org>
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
 Content preview: Removes two calls to compound_head(). Signed-off-by: Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/node.c | 22 +++++++++++
 1 file changed, 11 insertions(+), 11 deletions(-) diff --git a/fs/f2fs/node.c
 b/fs/f2fs/node.c index 241b374e8dc8..e29828c2f7b5 100644 --- a/fs/f2fs/node.c
 +++ b/fs/f2fs/node.c @@ -1063,7 +1063,7 @@ static int truncate_nodes(struct
 dnode_of_data *dn, [...] 
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
X-Headers-End: 1tzLVc-0003cE-Az
Subject: [f2fs-dev] [PATCH 077/153] f2fs: Use folios in
 truncate_partial_nodes()
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

Removes two calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 241b374e8dc8..e29828c2f7b5 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1063,7 +1063,7 @@ static int truncate_nodes(struct dnode_of_data *dn, unsigned int nofs,
 static int truncate_partial_nodes(struct dnode_of_data *dn,
 			struct f2fs_inode *ri, int *offset, int depth)
 {
-	struct page *pages[2];
+	struct folio *folios[2];
 	nid_t nid[3];
 	nid_t child_nid;
 	int err = 0;
@@ -1077,45 +1077,45 @@ static int truncate_partial_nodes(struct dnode_of_data *dn,
 	/* get indirect nodes in the path */
 	for (i = 0; i < idx + 1; i++) {
 		/* reference count'll be increased */
-		pages[i] = f2fs_get_node_page(F2FS_I_SB(dn->inode), nid[i]);
-		if (IS_ERR(pages[i])) {
-			err = PTR_ERR(pages[i]);
+		folios[i] = f2fs_get_node_folio(F2FS_I_SB(dn->inode), nid[i]);
+		if (IS_ERR(folios[i])) {
+			err = PTR_ERR(folios[i]);
 			idx = i - 1;
 			goto fail;
 		}
-		nid[i + 1] = get_nid(pages[i], offset[i + 1], false);
+		nid[i + 1] = get_nid(&folios[i]->page, offset[i + 1], false);
 	}
 
-	f2fs_ra_node_pages(pages[idx], offset[idx + 1], NIDS_PER_BLOCK);
+	f2fs_ra_node_pages(&folios[idx]->page, offset[idx + 1], NIDS_PER_BLOCK);
 
 	/* free direct nodes linked to a partial indirect node */
 	for (i = offset[idx + 1]; i < NIDS_PER_BLOCK; i++) {
-		child_nid = get_nid(pages[idx], i, false);
+		child_nid = get_nid(&folios[idx]->page, i, false);
 		if (!child_nid)
 			continue;
 		dn->nid = child_nid;
 		err = truncate_dnode(dn);
 		if (err < 0)
 			goto fail;
-		if (set_nid(pages[idx], i, 0, false))
+		if (set_nid(&folios[idx]->page, i, 0, false))
 			dn->node_changed = true;
 	}
 
 	if (offset[idx + 1] == 0) {
-		dn->node_page = pages[idx];
+		dn->node_page = &folios[idx]->page;
 		dn->nid = nid[idx];
 		err = truncate_node(dn);
 		if (err)
 			goto fail;
 	} else {
-		f2fs_put_page(pages[idx], 1);
+		f2fs_folio_put(folios[idx], true);
 	}
 	offset[idx]++;
 	offset[idx + 1] = 0;
 	idx--;
 fail:
 	for (i = idx; i >= 0; i--)
-		f2fs_put_page(pages[i], 1);
+		f2fs_folio_put(folios[i], true);
 
 	trace_f2fs_truncate_partial_nodes(dn->inode, nid, depth, err);
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
