Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E060A76EBE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWV-0001FT-3c;
	Mon, 31 Mar 2025 20:14:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVp-0000r6-04
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oIjfotnrkH44rEkQRjyUMkgVVOztJd6TY7cpZljTZEg=; b=UkVw1cV2b7koSSzEGq/uuX88jX
 3WlKhwmurpZQCxcwCvH+f/HLdsHbw9wvaXpEjotjt0xSVgFTxiVkbhd77dRDugyCZ8LGKvabWOomP
 3mZijyWpfC+o7qdLaTxJKKQeAEdLvXHilueH6WTogXrNrAykyvZPijb5Okw0/gkOh/DY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oIjfotnrkH44rEkQRjyUMkgVVOztJd6TY7cpZljTZEg=; b=b37knGpnaOmm3infZvbY5x7tkc
 8jAJk8uOTRGIEnz7G5cSCBEuqil44351fFlwBbW+cyYOFrqLrQ0DNaJ5JTuj5j/nY63U70Zbc1oEq
 MJ6C4ZZ1SuW4bVnjqJCj2NBCsAP4BV5o/zNNmJey1ZxLFkUx7+S65Huail/bsn3SrFPE=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVe-0003d9-BC for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=oIjfotnrkH44rEkQRjyUMkgVVOztJd6TY7cpZljTZEg=; b=XiUeHWt0VXllzFk58sl1r+gNXo
 6KS5439Exu4j0mAvv6K2AKfmns/GEv52pcpAL/3jkw+PhhGPG5wY4OdSEhOnt3pn2Q5NIYI6/X6Y6
 QGZvl1Iu3a5S/16fooYVhYsiflJ44dMQLP+YMlVUDUQfYRvXhiEkbKRaLLDAq0lrHtXLTfeBC0LWJ
 2HW1fp2XtCrXWwAc0JwU36VImZrRqEGkdFFUszl7UQXZjrx/6MQVc+yFA7yzF6Mc9y/cvwD0f7O4U
 MTnAaeIqyxtLH/L1Hc9sWSuX151Mz9Zz6Apprne/cax8Ywc18ytTYzetQPlt2DaMHlffFx0ghcRDv
 dbShpj6A==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVS-00000004S1B-44xN;
 Mon, 31 Mar 2025 20:13:14 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:43 +0100
Message-ID: <20250331201256.1057782-84-willy@infradead.org>
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
 Content preview: Remove a hidden call to compound_head(). Signed-off-by:
 Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/recovery.c | 15
 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-) diff --git a/fs/f2fs/recovery.c
 b/fs/f2fs/recovery.c index 4b2c09d63bbf..dd69ff5b7661 100644 ---
 a/fs/f2fs/recovery.c +++ b/fs/f2fs/recovery.c @@ -494, 8 +494,
 7 @@ static int check_index_in_prev_nodes( [...] 
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
X-Headers-End: 1tzLVe-0003d9-BC
Subject: [f2fs-dev] [PATCH 083/153] f2fs: Use a folio in
 check_index_in_prev_nodes()
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

Remove a hidden call to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/recovery.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 4b2c09d63bbf..dd69ff5b7661 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -494,8 +494,7 @@ static int check_index_in_prev_nodes(struct f2fs_sb_info *sbi,
 	unsigned short blkoff = GET_BLKOFF_FROM_SEG0(sbi, blkaddr);
 	struct f2fs_summary_block *sum_node;
 	struct f2fs_summary sum;
-	struct folio *sum_folio;
-	struct page *node_page;
+	struct folio *sum_folio, *node_folio;
 	struct dnode_of_data tdn = *dn;
 	nid_t ino, nid;
 	struct inode *inode;
@@ -549,13 +548,13 @@ static int check_index_in_prev_nodes(struct f2fs_sb_info *sbi,
 	}
 
 	/* Get the node page */
-	node_page = f2fs_get_node_page(sbi, nid);
-	if (IS_ERR(node_page))
-		return PTR_ERR(node_page);
+	node_folio = f2fs_get_node_folio(sbi, nid);
+	if (IS_ERR(node_folio))
+		return PTR_ERR(node_folio);
 
-	offset = ofs_of_node(node_page);
-	ino = ino_of_node(node_page);
-	f2fs_put_page(node_page, 1);
+	offset = ofs_of_node(&node_folio->page);
+	ino = ino_of_node(&node_folio->page);
+	f2fs_folio_put(node_folio, true);
 
 	if (ino != dn->inode->i_ino) {
 		int ret;
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
