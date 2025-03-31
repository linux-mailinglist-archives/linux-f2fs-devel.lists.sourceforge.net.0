Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAC6A76E35
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVe-0000zM-P6;
	Mon, 31 Mar 2025 20:13:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVc-0000w7-1l
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vQuti0SaeWaOVQc/vdG7gHGYzIy+/EOSeli3KgBSe80=; b=krqK8yKxM3WzbINCgXfGw/Wqtc
 u9r8qqKtCkIQckakekswsal4y3S+QF6Gpm2/eYlKcUx3AhEr/zZUmikH//6cvAgMpi0kMXkzYrYb6
 MyDfQnHSI0G4mpmQxMM6mpZl3jqjsiWWAKDzUbtYb6Ze5Oeol/uwrVPEZ6UvHWM1SZG4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vQuti0SaeWaOVQc/vdG7gHGYzIy+/EOSeli3KgBSe80=; b=J9VetMtL03UH4ji7zRYedB++VJ
 7Ry+2X5CS6Hfss6BGtkktIeWGDAqDoQXHixWsUdjTAuC2G53uZWMrXaCdZuiuLIuNU2TwVK7fARCL
 inSJt1+OqSWIbPp87KThxo1TAFU9xDoRuilqu/fbfONH3VRMDAjkUWnzfAkJIrsw2zRc=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVc-0003cA-1J for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=vQuti0SaeWaOVQc/vdG7gHGYzIy+/EOSeli3KgBSe80=; b=PfwfGKrRjWG9HKs5C9o0NhjtlZ
 KekDAec3chuEZiLCkDtfNtNgtmrdp7b/1nx2Zl8SFqKCggIj+GO+YbkN0QF+zBsC+gKNFJkt1TW12
 tg7osXGRCHqyIwAr2zo8fEk2mGKDWMCbMEYSzINH+r243BdY2MweTD27tr3AzXzPVvSou2zL0dnP8
 6gaXcVsrZACXsVMW6FKTSYV63ltnJCeGcrTTOOOkcWqxTi08+YzDq71k3ue3icGsb/AACiqCSVCao
 uqSHMBoI1s9Z6Nkka61sXZRm/YjQCHsHu/c7G2tvyGWLvWDlTtURkN+ldIC7yTmYKw3EAnxiJEFDI
 T6UCZM5A==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVQ-00000004RwB-2w5S;
 Mon, 31 Mar 2025 20:13:12 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:35 +0100
Message-ID: <20250331201256.1057782-76-willy@infradead.org>
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
 Content preview:  Remove two calls to compound_head() Signed-off-by: Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/node.c | 20 ++++++++++
 1 file changed, 10 insertions(+), 10 deletions(-) diff --git a/fs/f2fs/node.c
 b/fs/f2fs/node.c index 1c6eeed110c9..8a94bae2ab78 100644 --- a/fs/f2fs/node.c
 +++ b/fs/f2fs/node.c @@ -948,35 +948,35 @@ static int truncate_node(struct
 dnode_of_data *dn) [...] 
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
X-Headers-End: 1tzLVc-0003cA-1J
Subject: [f2fs-dev] [PATCH 075/153] f2fs: Use a folio in truncate_node()
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

Remove two calls to compound_head()

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 1c6eeed110c9..8a94bae2ab78 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -948,35 +948,35 @@ static int truncate_node(struct dnode_of_data *dn)
 static int truncate_dnode(struct dnode_of_data *dn)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
-	struct page *page;
+	struct folio *folio;
 	int err;
 
 	if (dn->nid == 0)
 		return 1;
 
 	/* get direct node */
-	page = f2fs_get_node_page(sbi, dn->nid);
-	if (PTR_ERR(page) == -ENOENT)
+	folio = f2fs_get_node_folio(sbi, dn->nid);
+	if (PTR_ERR(folio) == -ENOENT)
 		return 1;
-	else if (IS_ERR(page))
-		return PTR_ERR(page);
+	else if (IS_ERR(folio))
+		return PTR_ERR(folio);
 
-	if (IS_INODE(page) || ino_of_node(page) != dn->inode->i_ino) {
+	if (IS_INODE(&folio->page) || ino_of_node(&folio->page) != dn->inode->i_ino) {
 		f2fs_err(sbi, "incorrect node reference, ino: %lu, nid: %u, ino_of_node: %u",
-				dn->inode->i_ino, dn->nid, ino_of_node(page));
+				dn->inode->i_ino, dn->nid, ino_of_node(&folio->page));
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_handle_error(sbi, ERROR_INVALID_NODE_REFERENCE);
-		f2fs_put_page(page, 1);
+		f2fs_folio_put(folio, true);
 		return -EFSCORRUPTED;
 	}
 
 	/* Make dnode_of_data for parameter */
-	dn->node_page = page;
+	dn->node_page = &folio->page;
 	dn->ofs_in_node = 0;
 	f2fs_truncate_data_blocks_range(dn, ADDRS_PER_BLOCK(dn->inode));
 	err = truncate_node(dn);
 	if (err) {
-		f2fs_put_page(page, 1);
+		f2fs_folio_put(folio, true);
 		return err;
 	}
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
