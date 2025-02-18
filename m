Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8F5A39310
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2025 06:52:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tkGWm-0000If-NY;
	Tue, 18 Feb 2025 05:52:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tkGWk-0000IC-Hv
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yAaVeiHD23nVKO8KVwkuhk4japhxoOiPMc+XdWBH8f4=; b=mbzSWIFPj3SGQqN7sr4C2HaF1P
 ajphwObiw2FDbrKUrUA9g4eO1cJmL4c+Q1wEG2QWaK0U1E+lvHwNruAvE3xkH0b01v1IXPS/Igqg9
 UX7wsCDqMuFPZ6IN2wvQPyrxSyRvbznao3YOrWJ+3QmIN+HxejVkOr/3O6LR4Q6FBZ6s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yAaVeiHD23nVKO8KVwkuhk4japhxoOiPMc+XdWBH8f4=; b=Ayv5yZbccplqjE1ckOt60tNu2g
 9j123ehmznQyME9KvJGZc2dAMb51uxF9GxzHVjJfc1dG4orjIs8bXGiIcGLGOcpR8/La1Tzy1STUt
 hpUBjg3IGZ5RfY4UIsCROG/DkfwzIrFCsDvkLorjT3ip80pKuyElIXbPv9E+B2GqnMg0=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tkGWj-0007bS-BM for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=yAaVeiHD23nVKO8KVwkuhk4japhxoOiPMc+XdWBH8f4=; b=To9K0osl8GD6peEwzGARMm7NwL
 RQDVStinFl03xfpMo3zcxroTMGrn1TXAIrzp3LtdCxFHJ97IREsqHH9oKB63hMWmn8nkfZQnsOB7v
 OU4PBgXxbbQLOJLVVNeSSn9VPgC8YkWcyz14LYlcsyOyJevD99SVQv/GpI4Vmlpp0OEtJbXfCeRE9
 i1zPN90l8Pqn49hxDAs3V3b9IwlGrbdq0CaQjeRYXksNroWfYuyxLGvz0WAq2QApouNGZ8H5X73Ji
 4aVVKBalNoAx/1yT3nC9/SEQNrMhls4gQavMBZTQqxr1bwmAa1vB1NL5oXjrZ6hOFXeb7u4Mx400q
 s3PykuYA==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tkGWc-00000002Trr-20eq; Tue, 18 Feb 2025 05:52:06 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 18 Feb 2025 05:51:43 +0000
Message-ID: <20250218055203.591403-10-willy@infradead.org>
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
 Content preview:  Convert last_page to last_folio in f2fs_fsync_node_pages()
 and use folio APIs where they exist. Saves a few hidden calls to
 compound_head().
 Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 fs/f2fs/node.c
 | 34 +++++++++++++++++ 1 file changed, 17 insertions(+), 17 deletions(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
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
X-Headers-End: 1tkGWj-0007bS-BM
Subject: [f2fs-dev] [PATCH 09/27] f2fs: Return a folio from
 last_fsync_dnode()
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

Convert last_page to last_folio in f2fs_fsync_node_pages() and
use folio APIs where they exist.  Saves a few hidden calls to
compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 66260fae3cc8..1bd151d71b6b 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1561,7 +1561,7 @@ static void flush_inline_data(struct f2fs_sb_info *sbi, nid_t ino)
 	iput(inode);
 }
 
-static struct page *last_fsync_dnode(struct f2fs_sb_info *sbi, nid_t ino)
+static struct folio *last_fsync_dnode(struct f2fs_sb_info *sbi, nid_t ino)
 {
 	pgoff_t index;
 	struct folio_batch fbatch;
@@ -1615,7 +1615,7 @@ static struct page *last_fsync_dnode(struct f2fs_sb_info *sbi, nid_t ino)
 		folio_batch_release(&fbatch);
 		cond_resched();
 	}
-	return &last_folio->page;
+	return last_folio;
 }
 
 static int __write_node_page(struct page *page, bool atomic, bool *submitted,
@@ -1783,16 +1783,16 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 	pgoff_t index;
 	struct folio_batch fbatch;
 	int ret = 0;
-	struct page *last_page = NULL;
+	struct folio *last_folio = NULL;
 	bool marked = false;
 	nid_t ino = inode->i_ino;
 	int nr_folios;
 	int nwritten = 0;
 
 	if (atomic) {
-		last_page = last_fsync_dnode(sbi, ino);
-		if (IS_ERR_OR_NULL(last_page))
-			return PTR_ERR_OR_ZERO(last_page);
+		last_folio = last_fsync_dnode(sbi, ino);
+		if (IS_ERR_OR_NULL(last_folio))
+			return PTR_ERR_OR_ZERO(last_folio);
 	}
 retry:
 	folio_batch_init(&fbatch);
@@ -1808,7 +1808,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 			bool submitted = false;
 
 			if (unlikely(f2fs_cp_error(sbi))) {
-				f2fs_put_page(last_page, 0);
+				f2fs_folio_put(last_folio, false);
 				folio_batch_release(&fbatch);
 				ret = -EIO;
 				goto out;
@@ -1829,7 +1829,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 			if (ino_of_node(&folio->page) != ino)
 				goto continue_unlock;
 
-			if (!folio_test_dirty(folio) && &folio->page != last_page) {
+			if (!folio_test_dirty(folio) && folio != last_folio) {
 				/* someone wrote it for us */
 				goto continue_unlock;
 			}
@@ -1839,7 +1839,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 			set_fsync_mark(&folio->page, 0);
 			set_dentry_mark(&folio->page, 0);
 
-			if (!atomic || &folio->page == last_page) {
+			if (!atomic || folio == last_folio) {
 				set_fsync_mark(&folio->page, 1);
 				percpu_counter_inc(&sbi->rf_node_block_count);
 				if (IS_INODE(&folio->page)) {
@@ -1858,18 +1858,18 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 				goto continue_unlock;
 
 			ret = __write_node_page(&folio->page, atomic &&
-						&folio->page == last_page,
+						folio == last_folio,
 						&submitted, wbc, true,
 						FS_NODE_IO, seq_id);
 			if (ret) {
 				folio_unlock(folio);
-				f2fs_put_page(last_page, 0);
+				f2fs_folio_put(last_folio, false);
 				break;
 			} else if (submitted) {
 				nwritten++;
 			}
 
-			if (&folio->page == last_page) {
+			if (folio == last_folio) {
 				f2fs_folio_put(folio, false);
 				marked = true;
 				break;
@@ -1883,11 +1883,11 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 	}
 	if (!ret && atomic && !marked) {
 		f2fs_debug(sbi, "Retry to write fsync mark: ino=%u, idx=%lx",
-			   ino, page_folio(last_page)->index);
-		lock_page(last_page);
-		f2fs_wait_on_page_writeback(last_page, NODE, true, true);
-		set_page_dirty(last_page);
-		unlock_page(last_page);
+			   ino, last_folio->index);
+		folio_lock(last_folio);
+		f2fs_folio_wait_writeback(last_folio, NODE, true, true);
+		folio_mark_dirty(last_folio);
+		folio_unlock(last_folio);
 		goto retry;
 	}
 out:
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
