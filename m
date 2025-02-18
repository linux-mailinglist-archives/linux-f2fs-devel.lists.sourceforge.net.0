Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2B4A39314
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2025 06:52:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tkGWr-00025C-GX;
	Tue, 18 Feb 2025 05:52:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tkGWo-000246-PF
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b2LjOng3A6H4X2K1CNXMkHeMrgOtLbNaX8tityBDoz0=; b=HNmsIh7LUzagKnBUabP/F4TWTY
 pd4e5qmByKHw115LPBC6XcOLZcG+MkZ3XtIa16S5Z+tGCRkzLky28snEixOuNESEANV0WLIdCenYA
 rm+y9stDWMhOp1Pgv7a2Jno0hzCGcoTrlNE8sgIZEJlj/hyvoEyBYkZ0CMoDzc/s0oB0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b2LjOng3A6H4X2K1CNXMkHeMrgOtLbNaX8tityBDoz0=; b=K84QPwcXkeahnbpAUMjkXT0fIA
 hiweNi4KHxrOw7l3UadriILCP46U7nNv6sgo2yra53Cpa1wm35R/KLO2/Kt7XRELEHCiqyYCtQdZo
 7uEncYslXv5f1oZUpbto0iqcUKQ0kP8uhW0xUqk7Cb1WiT7UhEz41wXG6EiPc8XN50Ok=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tkGWn-0007c6-HC for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=b2LjOng3A6H4X2K1CNXMkHeMrgOtLbNaX8tityBDoz0=; b=buDlQGGg/zzqcIJk9d/joN107h
 Msj51PPo4TLUCZ4Zf1uQrHUYY3CG1w0diHC0G0vSI2d7rryjSgorXR3t6EGiVV/sA3PEAg822Jb1T
 LBFLcRsvdfzbo6jr8TCzME1tAJGN0nEPsgTYCOVKfBnlbzeJ8LPVSZyResKQDoO51qMSJoOgo/4cw
 pp1dRuSaGyaDS1zh7r8cp3fVRAwMlbthUOBq21bj6aeaEJhTI+OqVQZwCpyot+wlucR2aFI3mXM8R
 V6vQK8S+tZdc2Lt91Jy6dS68ylO9+kgtySQ2wkxjTR3RBE3AvRghbsMYIT0+HnXXJa/aww1lDvDXG
 4xTu/K9Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tkGWc-00000002Trd-0tDF; Tue, 18 Feb 2025 05:52:06 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 18 Feb 2025 05:51:41 +0000
Message-ID: <20250218055203.591403-8-willy@infradead.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218055203.591403-1-willy@infradead.org>
References: <20250218055203.591403-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Use the folio APIs where they exist. Saves several hidden
 calls to compound_head(). Also removes a reference to page->mapping.
 Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/node.c | 48
 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+), 24 deletions(-) 
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
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tkGWn-0007c6-HC
Subject: [f2fs-dev] [PATCH 07/27] f2fs: Convert f2fs_fsync_node_pages() to
 use a folio
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
Cc: linux-fsdevel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use the folio APIs where they exist.  Saves several hidden calls to
compound_head().  Also removes a reference to page->mapping.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 48 ++++++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 1ff6f5888950..415bda9acd0e 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1804,7 +1804,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 		int i;
 
 		for (i = 0; i < nr_folios; i++) {
-			struct page *page = &fbatch.folios[i]->page;
+			struct folio *folio = fbatch.folios[i];
 			bool submitted = false;
 
 			if (unlikely(f2fs_cp_error(sbi))) {
@@ -1814,63 +1814,63 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 				goto out;
 			}
 
-			if (!IS_DNODE(page) || !is_cold_node(page))
+			if (!IS_DNODE(&folio->page) || !is_cold_node(&folio->page))
 				continue;
-			if (ino_of_node(page) != ino)
+			if (ino_of_node(&folio->page) != ino)
 				continue;
 
-			lock_page(page);
+			folio_lock(folio);
 
-			if (unlikely(page->mapping != NODE_MAPPING(sbi))) {
+			if (unlikely(folio->mapping != NODE_MAPPING(sbi))) {
 continue_unlock:
-				unlock_page(page);
+				folio_unlock(folio);
 				continue;
 			}
-			if (ino_of_node(page) != ino)
+			if (ino_of_node(&folio->page) != ino)
 				goto continue_unlock;
 
-			if (!PageDirty(page) && page != last_page) {
+			if (!folio_test_dirty(folio) && &folio->page != last_page) {
 				/* someone wrote it for us */
 				goto continue_unlock;
 			}
 
-			f2fs_wait_on_page_writeback(page, NODE, true, true);
+			f2fs_folio_wait_writeback(folio, NODE, true, true);
 
-			set_fsync_mark(page, 0);
-			set_dentry_mark(page, 0);
+			set_fsync_mark(&folio->page, 0);
+			set_dentry_mark(&folio->page, 0);
 
-			if (!atomic || page == last_page) {
-				set_fsync_mark(page, 1);
+			if (!atomic || &folio->page == last_page) {
+				set_fsync_mark(&folio->page, 1);
 				percpu_counter_inc(&sbi->rf_node_block_count);
-				if (IS_INODE(page)) {
+				if (IS_INODE(&folio->page)) {
 					if (is_inode_flag_set(inode,
 								FI_DIRTY_INODE))
-						f2fs_update_inode(inode, page);
-					set_dentry_mark(page,
+						f2fs_update_inode(inode, &folio->page);
+					set_dentry_mark(&folio->page,
 						f2fs_need_dentry_mark(sbi, ino));
 				}
 				/* may be written by other thread */
-				if (!PageDirty(page))
-					set_page_dirty(page);
+				if (!folio_test_dirty(folio))
+					folio_mark_dirty(folio);
 			}
 
-			if (!clear_page_dirty_for_io(page))
+			if (!folio_clear_dirty_for_io(folio))
 				goto continue_unlock;
 
-			ret = __write_node_page(page, atomic &&
-						page == last_page,
+			ret = __write_node_page(&folio->page, atomic &&
+						&folio->page == last_page,
 						&submitted, wbc, true,
 						FS_NODE_IO, seq_id);
 			if (ret) {
-				unlock_page(page);
+				folio_unlock(folio);
 				f2fs_put_page(last_page, 0);
 				break;
 			} else if (submitted) {
 				nwritten++;
 			}
 
-			if (page == last_page) {
-				f2fs_put_page(page, 0);
+			if (&folio->page == last_page) {
+				f2fs_folio_put(folio, false);
 				marked = true;
 				break;
 			}
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
