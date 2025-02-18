Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ACBA3931C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2025 06:52:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tkGWr-0004tr-TX;
	Tue, 18 Feb 2025 05:52:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tkGWn-0004sg-Fw
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eOvERL0a/TZ8CcZnQVc8BdoCqM8a/JUQQunqaHJyubQ=; b=mEEKM48SE4gaQkmXZt/RAABklz
 8ZTu0Ymy6qyPWAHmRZB8kOf0RsaUnssz0UUWhUTkIS5dhskK8/kanW5xvIoky3DMEPt4/q7f7YUQU
 z2Dp9rG2tUzfgI5MEAnp4jowPbZwT2s6HpzrCHivkn/CSAmt+NtC+P4JXj596IrxSIh0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eOvERL0a/TZ8CcZnQVc8BdoCqM8a/JUQQunqaHJyubQ=; b=AfKbF5u3M12MZyMBsIM/RlteH0
 23vf3EgioQYtkNMreuf9lw4qJFvxykQeM8N71ZiB6bWRLWvZfPYo0S1p9Xo0Pmf1F2DbERNcLDrbo
 S4zNcZQKzsDdVgvRrFl2OGGHeCoeQrmnX9YENBz9YazdYpS09f+T+e72wF8wgRyx7y7Q=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tkGWn-0007c5-87 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=eOvERL0a/TZ8CcZnQVc8BdoCqM8a/JUQQunqaHJyubQ=; b=cikHE8bw2QIyuwZQljE4++WIZm
 MN+p0DkkhqGuXAmjqj3LZUV2e2U5D5X2HRsUKF7Vo4PjaniUzCx0c2bHPVhraXkdZrZHJTmsdhfL5
 qTkrX0sT2TBQLsSsgM1esklrTjI9KaaZl7QUHKWZQl4xN/bgMjVvAMKP3Cg9CCS1KmOTnQQZGPvR8
 +AJ/vEbyExAD5g8LGuFT7hQjwh/vT495hqjMICCKe6B+qcWReiKjRxRwYQHhw5j5mM3ji9CAXOH/5
 jYZ1CFy73lL9kDtZJg0Llo08hWki3kvZxIZb07U4jTlLQf7qt7uIWWhgO6H+zUhytuLxYAuiQPqz5
 TwzMAFAQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tkGWb-00000002TrP-3x4f; Tue, 18 Feb 2025 05:52:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 18 Feb 2025 05:51:39 +0000
Message-ID: <20250218055203.591403-6-willy@infradead.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218055203.591403-1-willy@infradead.org>
References: <20250218055203.591403-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Use the folio APIs where they exist. Saves several hidden
 calls to compound_head(). Also removes a reference to page->mapping.
 Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/node.c | 44
 ++++++++++++++++++++++
 1 file changed, 22 insertions(+), 22 deletions(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tkGWn-0007c5-87
Subject: [f2fs-dev] [PATCH 05/27] f2fs: Convert f2fs_sync_node_pages() to
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
 fs/f2fs/node.c | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 522bf84c0209..6022f9200f4c 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2000,7 +2000,7 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 		int i;
 
 		for (i = 0; i < nr_folios; i++) {
-			struct page *page = &fbatch.folios[i]->page;
+			struct folio *folio = fbatch.folios[i];
 			bool submitted = false;
 
 			/* give a priority to WB_SYNC threads */
@@ -2016,27 +2016,27 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 			 * 1. dentry dnodes
 			 * 2. file dnodes
 			 */
-			if (step == 0 && IS_DNODE(page))
+			if (step == 0 && IS_DNODE(&folio->page))
 				continue;
-			if (step == 1 && (!IS_DNODE(page) ||
-						is_cold_node(page)))
+			if (step == 1 && (!IS_DNODE(&folio->page) ||
+						is_cold_node(&folio->page)))
 				continue;
-			if (step == 2 && (!IS_DNODE(page) ||
-						!is_cold_node(page)))
+			if (step == 2 && (!IS_DNODE(&folio->page) ||
+						!is_cold_node(&folio->page)))
 				continue;
 lock_node:
 			if (wbc->sync_mode == WB_SYNC_ALL)
-				lock_page(page);
-			else if (!trylock_page(page))
+				folio_lock(folio);
+			else if (!folio_trylock(folio))
 				continue;
 
-			if (unlikely(page->mapping != NODE_MAPPING(sbi))) {
+			if (unlikely(folio->mapping != NODE_MAPPING(sbi))) {
 continue_unlock:
-				unlock_page(page);
+				folio_unlock(folio);
 				continue;
 			}
 
-			if (!PageDirty(page)) {
+			if (!folio_test_dirty(folio)) {
 				/* someone wrote it for us */
 				goto continue_unlock;
 			}
@@ -2046,29 +2046,29 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 				goto write_node;
 
 			/* flush inline_data */
-			if (page_private_inline(page)) {
-				clear_page_private_inline(page);
-				unlock_page(page);
-				flush_inline_data(sbi, ino_of_node(page));
+			if (page_private_inline(&folio->page)) {
+				clear_page_private_inline(&folio->page);
+				folio_unlock(folio);
+				flush_inline_data(sbi, ino_of_node(&folio->page));
 				goto lock_node;
 			}
 
 			/* flush dirty inode */
-			if (IS_INODE(page) && flush_dirty_inode(page))
+			if (IS_INODE(&folio->page) && flush_dirty_inode(&folio->page))
 				goto lock_node;
 write_node:
-			f2fs_wait_on_page_writeback(page, NODE, true, true);
+			f2fs_folio_wait_writeback(folio, NODE, true, true);
 
-			if (!clear_page_dirty_for_io(page))
+			if (!folio_clear_dirty_for_io(folio))
 				goto continue_unlock;
 
-			set_fsync_mark(page, 0);
-			set_dentry_mark(page, 0);
+			set_fsync_mark(&folio->page, 0);
+			set_dentry_mark(&folio->page, 0);
 
-			ret = __write_node_page(page, false, &submitted,
+			ret = __write_node_page(&folio->page, false, &submitted,
 						wbc, do_balance, io_type, NULL);
 			if (ret)
-				unlock_page(page);
+				folio_unlock(folio);
 			else if (submitted)
 				nwritten++;
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
