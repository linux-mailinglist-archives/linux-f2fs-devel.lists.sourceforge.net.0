Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C008A76E7C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVx-000447-PB;
	Mon, 31 Mar 2025 20:13:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVl-0003uW-DZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W0jpVTsAnm1XCA7cHj5/zGUtF9TaRtY0/y2MMXp6lO8=; b=AxcbCkDMNbedcNQVTRuqkM1gkI
 BFZIAYUqRQQ5YJlRRN2lMEEInC7EKf6fGfFvixD+WzjR81Ag8GqFZbMwgIrCexlZz33P6KGpo2H3x
 95v5NQKaporL1vNh8xaDUuZRr2JCYUemMlfjE2Yrr6uSgrhBz1cf+CGgtunNPhCbCo9Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W0jpVTsAnm1XCA7cHj5/zGUtF9TaRtY0/y2MMXp6lO8=; b=JmGwR7+0pOwqWkNzwB4k7B3EDM
 FB9++Wo0CHN8Pqn14uFlxDZJsAnxnB7OnNbS8IcJ0HV03eoXp3FwVic3OCyFkviuHflaedMN3aKm4
 8pW7S7LBNrBGj1a5Z4R6fd2NmKirCB6Fimc381G2RzYiGE04KESwTzyDMyg/SgheGNOE=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVk-0003g8-Mw for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=W0jpVTsAnm1XCA7cHj5/zGUtF9TaRtY0/y2MMXp6lO8=; b=vD3mR4wBl4K0jS27OQ6NmstXHn
 E9a5jWnArbvHDWXelRogX8AH0vStUV9ohzGYIkMgJ/i/vDMf8sWNvIoVdXidRiCIStQOFwqKZl+nP
 ee0/V2Y6Viw1FQUGyTBtrY/PWDJV3EkZNWRC13BuhNz6vlaMKNb434UEn9m+HW0cf+hTl9lgbQK98
 /19TL7cYk7HYyAS44Fc/o0iI5wpiekLtpaUOqmrqUiwtsPsQmgR5Q5qCCiWbfUa2m6jsjNcTHy8tg
 X8wtTldsm+BjKLAjBGn3PCYZpmHQJ4XaJosjDVv/G++Bq7Rll3dr1E8BI9UI/GlHFIcXRaWQiOls8
 qr4JGM6w==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVZ-00000004SRd-1Go7;
 Mon, 31 Mar 2025 20:13:21 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:18 +0100
Message-ID: <20250331201256.1057782-119-willy@infradead.org>
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
 Content preview:  The caller has a folio, so pass it in. Signed-off-by: Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/f2fs.h | 2 +- fs/f2fs/node.c
 | 6 +++--- fs/f2fs/recovery.c | 2 +- 3 files changed, 5 insertions(+), 5
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
X-Headers-End: 1tzLVk-0003g8-Mw
Subject: [f2fs-dev] [PATCH 118/153] f2fs: Pass a folio to
 f2fs_recover_inline_xattr()
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

The caller has a folio, so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h     | 2 +-
 fs/f2fs/node.c     | 6 +++---
 fs/f2fs/recovery.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 0fe764c30eac..8e700621ee9d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3745,7 +3745,7 @@ bool f2fs_alloc_nid(struct f2fs_sb_info *sbi, nid_t *nid);
 void f2fs_alloc_nid_done(struct f2fs_sb_info *sbi, nid_t nid);
 void f2fs_alloc_nid_failed(struct f2fs_sb_info *sbi, nid_t nid);
 int f2fs_try_to_free_nids(struct f2fs_sb_info *sbi, int nr_shrink);
-int f2fs_recover_inline_xattr(struct inode *inode, struct page *page);
+int f2fs_recover_inline_xattr(struct inode *inode, struct folio *folio);
 int f2fs_recover_xattr_data(struct inode *inode, struct page *page);
 int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct page *page);
 int f2fs_restore_node_summary(struct f2fs_sb_info *sbi,
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 5ee60b6ad93b..8a4466d99589 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2713,7 +2713,7 @@ int f2fs_try_to_free_nids(struct f2fs_sb_info *sbi, int nr_shrink)
 	return nr - nr_shrink;
 }
 
-int f2fs_recover_inline_xattr(struct inode *inode, struct page *page)
+int f2fs_recover_inline_xattr(struct inode *inode, struct folio *folio)
 {
 	void *src_addr, *dst_addr;
 	size_t inline_size;
@@ -2724,7 +2724,7 @@ int f2fs_recover_inline_xattr(struct inode *inode, struct page *page)
 	if (IS_ERR(ifolio))
 		return PTR_ERR(ifolio);
 
-	ri = F2FS_INODE(page);
+	ri = F2FS_INODE(&folio->page);
 	if (ri->i_inline & F2FS_INLINE_XATTR) {
 		if (!f2fs_has_inline_xattr(inode)) {
 			set_inode_flag(inode, FI_INLINE_XATTR);
@@ -2739,7 +2739,7 @@ int f2fs_recover_inline_xattr(struct inode *inode, struct page *page)
 	}
 
 	dst_addr = inline_xattr_addr(inode, &ifolio->page);
-	src_addr = inline_xattr_addr(inode, page);
+	src_addr = inline_xattr_addr(inode, &folio->page);
 	inline_size = inline_xattr_size(inode);
 
 	f2fs_folio_wait_writeback(ifolio, NODE, true, true);
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 8f8a6b2331a6..ac8f2d0763a4 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -629,7 +629,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 
 	/* step 1: recover xattr */
 	if (IS_INODE(&folio->page)) {
-		err = f2fs_recover_inline_xattr(inode, &folio->page);
+		err = f2fs_recover_inline_xattr(inode, folio);
 		if (err)
 			goto out;
 	} else if (f2fs_has_xattr_block(ofs_of_node(&folio->page))) {
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
