Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBFAA76E5E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVr-0000tH-Bw;
	Mon, 31 Mar 2025 20:13:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVc-0000kj-2y
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l/wWgWluPDWvSUv/VsEM3JDYep2sA/lWMDoaxC9v6ks=; b=IkFT8ahR6yH5bCszmNI4DlwGto
 3eNspcc5bCDgUgYJhGs8DCRsYqWRxNkrs/XMhD37dhpj/D4igaaTYh/0XkCZmK2SA/WkE7UgKQFoT
 2p9RdjkIwyxb1shgGzFYBDJHP3pP2RX+knfuzo3UEGQxgIO2EHSfNgoq+19wzUN0qEMw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l/wWgWluPDWvSUv/VsEM3JDYep2sA/lWMDoaxC9v6ks=; b=k1cEa1otm8Rd4pA3QtO9550DsR
 D2d064PO/olWiMrt4yoGW0ES1dTA11WffalJ3OBkXmaQNEkxf+IdO9a3pEeoPlSKKCLi5C53svn8q
 whK7Z4e1ts364VpR81qVFkTjMMBt/SpmpetDYca2pco8Wn0mQU+jmmEQhZqz+VX+uAzU=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVb-0003bz-L9 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=l/wWgWluPDWvSUv/VsEM3JDYep2sA/lWMDoaxC9v6ks=; b=h9+WXb2QeJ7Bbc/mhYeyXhSiWS
 FXZn20EFKMKS6tRCX0ucEomNFrHgffitc15v6B0jtZAfI0lj0xdyZOxEblNaldIKZcdkt8c4uWvwq
 kBAstkRHpuLzpjHwu3x+pWjXpr0R/YriFCPIouFMAigueIzodYf715aNKmFUkBsT23Z/jqK7o/Ns0
 cz4HJSd0E746MIqlRbQcNR7YbtAzH2MdPycKtrv0gyTi6TZDKguyNydMTbZRNiJlK+7YTys7ratKH
 SwqKTM8zK1wc0Fj4R6UxeCGN2dR/YQN19xH0UkEIxVOtbELW6mtR7tRaARYPSXsQFW/7MK+QuGuHk
 qKubSMAA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVQ-00000004RuT-172k;
 Mon, 31 Mar 2025 20:13:12 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:32 +0100
Message-ID: <20250331201256.1057782-73-willy@infradead.org>
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
 Content preview: Remove two calls to compound_head(). Signed-off-by: Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/node.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-) diff --git a/fs/f2fs/node.c
 b/fs/f2fs/node.c index 3b73562c77f6..ac3fa0147e1e 100644 --- a/fs/f2fs/node.c
 +++ b/fs/f2fs/node.c @@ -2776, 7 +2776, 7 @@ int f2fs_recover_xattr_data(struct
 inode *inode, st [...] 
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
X-Headers-End: 1tzLVb-0003bz-L9
Subject: [f2fs-dev] [PATCH 072/153] f2fs: Use a folio in
 f2fs_recover_xattr_data()
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

Remove two calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 3b73562c77f6..ac3fa0147e1e 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2776,7 +2776,7 @@ int f2fs_recover_xattr_data(struct inode *inode, struct page *page)
 	nid_t new_xnid;
 	struct dnode_of_data dn;
 	struct node_info ni;
-	struct page *xpage;
+	struct folio *xfolio;
 	int err;
 
 	if (!prev_xnid)
@@ -2797,10 +2797,10 @@ int f2fs_recover_xattr_data(struct inode *inode, struct page *page)
 		return -ENOSPC;
 
 	set_new_dnode(&dn, inode, NULL, NULL, new_xnid);
-	xpage = f2fs_new_node_page(&dn, XATTR_NODE_OFFSET);
-	if (IS_ERR(xpage)) {
+	xfolio = f2fs_new_node_folio(&dn, XATTR_NODE_OFFSET);
+	if (IS_ERR(xfolio)) {
 		f2fs_alloc_nid_failed(sbi, new_xnid);
-		return PTR_ERR(xpage);
+		return PTR_ERR(xfolio);
 	}
 
 	f2fs_alloc_nid_done(sbi, new_xnid);
@@ -2808,11 +2808,11 @@ int f2fs_recover_xattr_data(struct inode *inode, struct page *page)
 
 	/* 3: update and set xattr node page dirty */
 	if (page) {
-		memcpy(F2FS_NODE(xpage), F2FS_NODE(page),
+		memcpy(F2FS_NODE(&xfolio->page), F2FS_NODE(page),
 				VALID_XATTR_BLOCK_SIZE);
-		set_page_dirty(xpage);
+		folio_mark_dirty(xfolio);
 	}
-	f2fs_put_page(xpage, 1);
+	f2fs_folio_put(xfolio, true);
 
 	return 0;
 }
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
