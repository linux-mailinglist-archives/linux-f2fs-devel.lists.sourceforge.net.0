Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1CCA76EC4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWW-0001HZ-9y;
	Mon, 31 Mar 2025 20:14:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVq-0000sl-C7
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kZkDutGSmZPTEyerLjQUplMBp5KoAwPGLC7YLsIwVW8=; b=CSZqpRgQS5+p8IE9tORAFCyJIt
 WneeOE8rFTVHwU2aMW9Y6Mt8GvugX7LGFwNigeZh9aOsp9yeuF+HVfDvO4n+3sqgYrPy2DG45TfIc
 U+6fE/yf3xicrAgw0/Aaq82ADDUGIaBLrmOzvJAZPKrCXrNzgCcOackR5Zowe/ViA7XE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kZkDutGSmZPTEyerLjQUplMBp5KoAwPGLC7YLsIwVW8=; b=Pe9FqjYzedKITBHHM/cfhwCkp0
 xa62+Mus78QXjWKXpYTF6CaG3N+11h51MJ3xPwnTjax0kC1ZG2Epjba59QTty3O8AH6wHKahx2C2A
 X4O9Vu19fiQCeD9BOQNZRc2hCaRqxAGPmNzzxjFmTesxhtqWF7tuM06IMPRpo+v8dQSw=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVl-0003gT-71 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=kZkDutGSmZPTEyerLjQUplMBp5KoAwPGLC7YLsIwVW8=; b=SgAU/16u3lNN20YulYuMmPDsK8
 5B7mESLHeBGI7+m8K7FmQUE9vX/PIgXyDLbuaqS90+9KNud6NhGdpf64qZyUwG5oK16BUaf8JNu+A
 gZjT1MpHXAvKD9JQG3DCsynNZFFod+9lJm6k7AF7yZRtFaGfoGjZt3R4cjethlY39xwR/BJqLN7F8
 f1Hhilxz+jK7889HuZzNndH71uTYDnxk/IJ4c0T0tPBX+3W1ZoBZRhv4eToY8nXd64BXjPzs7FFaZ
 vUBAJz4zGkyM1rsjCay4o0TOsbfZ37Ah5pcwng92/TrquP6FC1dyp2d6oXyecG7NO3bSA11cTgjc0
 WCdAho1g==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVe-00000004Seb-3a37;
 Mon, 31 Mar 2025 20:13:26 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:52 +0100
Message-ID: <20250331201256.1057782-153-willy@infradead.org>
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
 Content preview: Get a folio from the page cache and use it throughout.
 Removes
 six calls to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/node.c | 26 +++++++++++++ 1 file changed, 13 insertions(+), 13
 deletions(-) 
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
X-Headers-End: 1tzLVl-0003gT-71
Subject: [f2fs-dev] [PATCH 152/153] f2fs: Use a folio in flush_inline_data()
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

Get a folio from the page cache and use it throughout.  Removes
six calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 53ad48075eb5..753ecca6d511 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1563,7 +1563,7 @@ static struct folio *f2fs_get_node_folio_ra(struct folio *parent, int start)
 static void flush_inline_data(struct f2fs_sb_info *sbi, nid_t ino)
 {
 	struct inode *inode;
-	struct page *page;
+	struct folio *folio;
 	int ret;
 
 	/* should flush inline_data before evict_inode */
@@ -1571,27 +1571,27 @@ static void flush_inline_data(struct f2fs_sb_info *sbi, nid_t ino)
 	if (!inode)
 		return;
 
-	page = f2fs_pagecache_get_page(inode->i_mapping, 0,
+	folio = f2fs_filemap_get_folio(inode->i_mapping, 0,
 					FGP_LOCK|FGP_NOWAIT, 0);
-	if (!page)
+	if (IS_ERR(folio))
 		goto iput_out;
 
-	if (!PageUptodate(page))
-		goto page_out;
+	if (!folio_test_uptodate(folio))
+		goto folio_out;
 
-	if (!PageDirty(page))
-		goto page_out;
+	if (!folio_test_dirty(folio))
+		goto folio_out;
 
-	if (!clear_page_dirty_for_io(page))
-		goto page_out;
+	if (!folio_clear_dirty_for_io(folio))
+		goto folio_out;
 
-	ret = f2fs_write_inline_data(inode, page_folio(page));
+	ret = f2fs_write_inline_data(inode, folio);
 	inode_dec_dirty_pages(inode);
 	f2fs_remove_dirty_inode(inode);
 	if (ret)
-		set_page_dirty(page);
-page_out:
-	f2fs_put_page(page, 1);
+		folio_mark_dirty(folio);
+folio_out:
+	f2fs_folio_put(folio, true);
 iput_out:
 	iput(inode);
 }
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
