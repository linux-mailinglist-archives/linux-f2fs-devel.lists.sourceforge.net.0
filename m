Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF72A4B708
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Mar 2025 04:54:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1towtC-00042K-JC;
	Mon, 03 Mar 2025 03:54:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1towtA-00042A-QX
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 03:54:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cEOdS91d6E5WSZG929V6EX2lv/dyLyyMwUwx+JNQxHo=; b=nUXOjKmv9IJrlQHuHhPRBSL2jJ
 GS4s+jZ7XAItqfNDFuNJR5mHpWJduXshh3a21t8zgINBvb5GelZAXjmGfu66cwYjcdQ3I1lV5RXcg
 jixHoPEKsalCGbTm4BgyqDrGQbYqmDw/YrZsdrDg0flPXqWtJMrpUXQRRGJleJNz1nzg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cEOdS91d6E5WSZG929V6EX2lv/dyLyyMwUwx+JNQxHo=; b=JBmJZki3iRQnxubzRVAa5LYiGn
 3sjHshtBVEZHVwsHoohVK+mBrpnNDfacwKTDm/jt0Pomm/zGKFIBfZvv1Xh+dkb2DMc1QiZCdEaLq
 xAow2R2shtNtzU0C7TAa48XpxSycNtQ6Slg5DeBLEB88KBSshlWng3cU2aD5ysDnLqag=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1towtA-0007Fe-1m for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 03:54:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D72CB5C54B7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  3 Mar 2025 03:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A0FC4CEE9;
 Mon,  3 Mar 2025 03:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740974073;
 bh=jmE2Vn4q8ujhXYsmfUAnML8kKHr25o0OmECPkFT6eL4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n6qHAb1ZT0mtXXD4buwieVnV3w+LvkJOlXvp47FHIEoPlVMWJdOM2p2fyOpPA3vPX
 V6ZLkiOiYi/HpWx4v8wLjBBAuCR6gPCAO28g2e9Hq1qY30qIFt0wEYIaRwc18eJY8V
 H5ayHwgUJqyXs6+1ExYQpfpDJnT29sir1UCF8Kj6MRTElZNT4LycpXY/Em0/75fQMI
 +fzXX30eFyAt0+dexiVTIowWKIXeBbJla3OjmbxVuqFufrnRCVzY0PUdfctqkKl4Ap
 EJkFTg0krU1ZwOUp/KlBRxlT7q819/O099DTkln/SPEEHD6XwBDJzfOlxOYLgM1qs4
 Ej3FbXkRs0lUg==
To: jaegeuk@kernel.org
Date: Mon,  3 Mar 2025 11:54:22 +0800
Message-ID: <20250303035423.1357211-2-chao@kernel.org>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
In-Reply-To: <20250303035423.1357211-1-chao@kernel.org>
References: <20250303035423.1357211-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch introduces a new wrapper f2fs_get_xnode_page(),
 then, caller can use it to load xattr block to page cache, meanwhile it will
 do sanity check on xattr node footer. Signed-off-by: Chao Yu <chao@kernel.org>
 --- fs/f2fs/f2fs.h | 1 + fs/f2fs/node.c | 14 ++++++++++++-- fs/f2fs/node.h
 | 1 + fs/f2fs/xattr.c | 4 ++-- 4 files changed, 16 insertions(+),
 4 deletions(-)
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1towtA-0007Fe-1m
Subject: [f2fs-dev] [PATCH 2/3] f2fs: do sanity check on xattr node footer
 in f2fs_get_xnode_page()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch introduces a new wrapper f2fs_get_xnode_page(), then, caller
can use it to load xattr block to page cache, meanwhile it will do sanity
check on xattr node footer.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h  |  1 +
 fs/f2fs/node.c  | 14 ++++++++++++--
 fs/f2fs/node.h  |  1 +
 fs/f2fs/xattr.c |  4 ++--
 4 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 74a80bb06f06..38016d24e59c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3704,6 +3704,7 @@ void f2fs_ra_node_page(struct f2fs_sb_info *sbi, nid_t nid);
 struct page *f2fs_get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid);
 struct folio *f2fs_get_inode_folio(struct f2fs_sb_info *sbi, pgoff_t ino);
 struct page *f2fs_get_inode_page(struct f2fs_sb_info *sbi, pgoff_t ino);
+struct page *f2fs_get_xnode_page(struct f2fs_sb_info *sbi, pgoff_t xnid);
 struct page *f2fs_get_node_page_ra(struct page *parent, int start);
 int f2fs_move_node_page(struct page *node_page, int gc_type);
 void f2fs_flush_inline_data(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index ee5daa6f7408..5be8badc6261 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1245,7 +1245,7 @@ int f2fs_truncate_xattr_node(struct inode *inode)
 	if (!nid)
 		return 0;
 
-	npage = f2fs_get_node_page(sbi, nid);
+	npage = f2fs_get_xnode_page(sbi, nid);
 	if (IS_ERR(npage))
 		return PTR_ERR(npage);
 
@@ -1461,7 +1461,9 @@ static int sanity_check_node_footer(struct f2fs_sb_info *sbi,
 					enum node_type ntype)
 {
 	if (unlikely(nid != nid_of_node(page) ||
-		(ntype == NODE_TYPE_INODE && !IS_INODE(page)))) {
+		(ntype == NODE_TYPE_INODE && !IS_INODE(page)) ||
+		(ntype == NODE_TYPE_XATTR &&
+		!f2fs_has_xattr_block(ofs_of_node(page))))) {
 		f2fs_warn(sbi, "inconsistent node block, node_type:%d, nid:%lu, "
 			  "node_footer[nid:%u,ino:%u,ofs:%u,cpver:%llu,blkaddr:%u]",
 			  ntype, nid, nid_of_node(page), ino_of_node(page),
@@ -1551,6 +1553,14 @@ struct page *f2fs_get_inode_page(struct f2fs_sb_info *sbi, pgoff_t ino)
 	return &folio->page;
 }
 
+struct page *f2fs_get_xnode_page(struct f2fs_sb_info *sbi, pgoff_t xnid)
+{
+	struct folio *folio = __get_node_folio(sbi, xnid, NULL, 0,
+						NODE_TYPE_XATTR);
+
+	return &folio->page;
+}
+
 struct page *f2fs_get_node_page_ra(struct page *parent, int start)
 {
 	struct f2fs_sb_info *sbi = F2FS_P_SB(parent);
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 5079c6a2298d..103a437e6425 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -56,6 +56,7 @@ enum {
 enum node_type {
 	NODE_TYPE_REGULAR,
 	NODE_TYPE_INODE,
+	NODE_TYPE_XATTR,
 };
 
 /*
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index d5b42e1005d8..c691b35618ad 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -303,7 +303,7 @@ static int read_xattr_block(struct inode *inode, void *txattr_addr)
 	void *xattr_addr;
 
 	/* The inode already has an extended attribute block. */
-	xpage = f2fs_get_node_page(sbi, xnid);
+	xpage = f2fs_get_xnode_page(sbi, xnid);
 	if (IS_ERR(xpage))
 		return PTR_ERR(xpage);
 
@@ -475,7 +475,7 @@ static inline int write_all_xattrs(struct inode *inode, __u32 hsize,
 
 	/* write to xattr node block */
 	if (F2FS_I(inode)->i_xattr_nid) {
-		xpage = f2fs_get_node_page(sbi, F2FS_I(inode)->i_xattr_nid);
+		xpage = f2fs_get_xnode_page(sbi, F2FS_I(inode)->i_xattr_nid);
 		if (IS_ERR(xpage)) {
 			err = PTR_ERR(xpage);
 			f2fs_alloc_nid_failed(sbi, new_nid);
-- 
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
