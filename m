Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 258FBA76E68
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVt-0003yw-UW;
	Mon, 31 Mar 2025 20:13:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVe-0003pC-IA
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H9QFDxXNoONHu+C1yqpuENySed0koPbANy1p1GoSf1Y=; b=fyXAMlGz3zJli8Sa2Ey9BFOnHx
 Cn6iWYy+rLlT8vokR0twmrbn0VbbT+mvK5EepMGGprLLZ9PS5dzi4vZ6H11lkRfaPf+KMyfOholNe
 8rlytla8s8hKQUOEJEffAj0QARin2fa7hgMr9A8r7xxF9guebs/AGUTG8W0q1/bplO5E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H9QFDxXNoONHu+C1yqpuENySed0koPbANy1p1GoSf1Y=; b=lgBsrSo5DiytxXSrP/M3N2gNwO
 gJXcS4Ddkpuzbs/oRACTrq30Vn1PjWZTzug0uEXx/kJsdtNd6Il83aLOOtfMy0fnCgy8GcnhV7C1a
 3yRB051H1lT1ZWMDTUAQDX/Ey9qNOnmDIq2zo8IZTck5tki+IVYM9j5PZStj+QCIh7kE=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVd-0003cq-RN for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=H9QFDxXNoONHu+C1yqpuENySed0koPbANy1p1GoSf1Y=; b=JNlKBvej6qxM0N1Sx3krefWqDR
 6724GSr0PoHSt51MxNMCZLx713buE2Z21o9S5F9zsw9Vrdgc+Q9bR7btpXhWNS162GD5gGlwUAcr4
 SVe1BAIjCqDytApgZ2q5lhItIc8XdsCHvIKgKHSQo6L1YeBaXCiq3dQLGF2WdeB+xkiYycH2h5Ba6
 V+s8rTuD4uo2ef7384UgwOM+qZWjjix2Nc6zzD826xnK9/bnZx/E8L7LJDwcEx+i113dAqae/TTAR
 cn/lhCFwsFE9AiuFUIF1kbIokDezGPoyinHoV2gILeKXIgTMkK+1x7YWcEBb/saQewHtCXX0vnjL8
 ESHPhABA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVX-00000004SJG-25Iy;
 Mon, 31 Mar 2025 20:13:19 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:07 +0100
Message-ID: <20250331201256.1057782-108-willy@infradead.org>
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
 Content preview: Remove five calls to compound_head(). Signed-off-by: Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/inode.c | 34
 +++++++++++++++++
 1 file changed, 17 insertions(+), 17 deletions(-) 
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
X-Headers-End: 1tzLVd-0003cq-RN
Subject: [f2fs-dev] [PATCH 107/153] f2fs: Use a folio in do_read_inode()
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

Remove five calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/inode.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index c122761eaa86..cbfd536efe20 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -400,7 +400,7 @@ static int do_read_inode(struct inode *inode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
-	struct page *node_page;
+	struct folio *node_folio;
 	struct f2fs_inode *ri;
 	projid_t i_projid;
 
@@ -408,11 +408,11 @@ static int do_read_inode(struct inode *inode)
 	if (f2fs_check_nid_range(sbi, inode->i_ino))
 		return -EINVAL;
 
-	node_page = f2fs_get_inode_page(sbi, inode->i_ino);
-	if (IS_ERR(node_page))
-		return PTR_ERR(node_page);
+	node_folio = f2fs_get_inode_folio(sbi, inode->i_ino);
+	if (IS_ERR(node_folio))
+		return PTR_ERR(node_folio);
 
-	ri = F2FS_INODE(node_page);
+	ri = F2FS_INODE(&node_folio->page);
 
 	inode->i_mode = le16_to_cpu(ri->i_mode);
 	i_uid_write(inode, le32_to_cpu(ri->i_uid));
@@ -462,8 +462,8 @@ static int do_read_inode(struct inode *inode)
 		fi->i_inline_xattr_size = 0;
 	}
 
-	if (!sanity_check_inode(inode, node_page)) {
-		f2fs_put_page(node_page, 1);
+	if (!sanity_check_inode(inode, &node_folio->page)) {
+		f2fs_folio_put(node_folio, true);
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_handle_error(sbi, ERROR_CORRUPTED_INODE);
 		return -EFSCORRUPTED;
@@ -471,17 +471,17 @@ static int do_read_inode(struct inode *inode)
 
 	/* check data exist */
 	if (f2fs_has_inline_data(inode) && !f2fs_exist_data(inode))
-		__recover_inline_status(inode, node_page);
+		__recover_inline_status(inode, &node_folio->page);
 
 	/* try to recover cold bit for non-dir inode */
-	if (!S_ISDIR(inode->i_mode) && !is_cold_node(node_page)) {
-		f2fs_wait_on_page_writeback(node_page, NODE, true, true);
-		set_cold_node(node_page, false);
-		set_page_dirty(node_page);
+	if (!S_ISDIR(inode->i_mode) && !is_cold_node(&node_folio->page)) {
+		f2fs_folio_wait_writeback(node_folio, NODE, true, true);
+		set_cold_node(&node_folio->page, false);
+		folio_mark_dirty(node_folio);
 	}
 
 	/* get rdev by using inline_info */
-	__get_inode_rdev(inode, node_page);
+	__get_inode_rdev(inode, &node_folio->page);
 
 	if (!f2fs_need_inode_block_update(sbi, inode->i_ino))
 		fi->last_disk_size = inode->i_size;
@@ -524,17 +524,17 @@ static int do_read_inode(struct inode *inode)
 
 	init_idisk_time(inode);
 
-	if (!sanity_check_extent_cache(inode, node_page)) {
-		f2fs_put_page(node_page, 1);
+	if (!sanity_check_extent_cache(inode, &node_folio->page)) {
+		f2fs_folio_put(node_folio, true);
 		f2fs_handle_error(sbi, ERROR_CORRUPTED_INODE);
 		return -EFSCORRUPTED;
 	}
 
 	/* Need all the flag bits */
-	f2fs_init_read_extent_tree(inode, node_page);
+	f2fs_init_read_extent_tree(inode, &node_folio->page);
 	f2fs_init_age_extent_tree(inode);
 
-	f2fs_put_page(node_page, 1);
+	f2fs_folio_put(node_folio, true);
 
 	stat_inc_inline_xattr(inode);
 	stat_inc_inline_inode(inode);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
