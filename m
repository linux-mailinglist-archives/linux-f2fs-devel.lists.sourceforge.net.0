Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 619CAA76E59
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVp-000165-HY;
	Mon, 31 Mar 2025 20:13:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVd-0000xg-Dr
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WKjNjzb1cl1t9c1o0ZxKTs9ZHTtAAkmCSqjr6tb5Emw=; b=J3HQZy8N8/6O30z35C2a2GGFW8
 lffvXo0FDEieHGq2XzQsb0rDJ/wlJCwdk4x+WZ4A0RcFf15Y+HRp/RHOWoCd1fYmwIzxZW8ViqtEG
 qHkX2tuXXc7AkDtazRHTCv9q/t0KqsEFwL4NKbgLfGE56wke1Z5yNGTc+6BMDqveUzW8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WKjNjzb1cl1t9c1o0ZxKTs9ZHTtAAkmCSqjr6tb5Emw=; b=KmQP9UU63UhNLxkU3VQF4Y8vGr
 HdlXKSH1NwnrURc6c87M5QCiaCU16SIoCG9O7lf7E5hpKf95Zd+bqDjGAVm/7FqwaEiP122x5U868
 x2piBS2Omb+2PMhqAa7tNaLbcFHdA4eFB2lQj/+b+WpKp3jzVs54f3KQiMvASn4zsh8I=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVS-0003Z4-Ng for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=WKjNjzb1cl1t9c1o0ZxKTs9ZHTtAAkmCSqjr6tb5Emw=; b=sPcmBBtQvj7eHjc7V3l76dWCd0
 YCzg9SM70txktCWuF1BIxv2l1VsZraVNCaYL82fwNz34x1D9AxsyF3PT3TcQGNeWn8kRjZWG0eLkN
 L3sXURzscAYnXebDPXskrJDkczh+5YHS1SKw8IAmleslW4XBKiI5qI+VxvOxxNz+FqDCZPPDk+8N1
 eh6TsTRMNQ4ClwuniAw/LzUL7JZEMqJy8jpsO8jyf+6gB7edUZlGR9B74nReyGgT+vaxvtT0GPKUj
 hsGxR8c6DghDRgj2EhBbB0o/F/FnlyPcKednJTimI2X+CmVrpiWn0lujeMuM6lgc+YHJVc4Vrw+fC
 dmvfn91A==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVH-00000004RXU-1hDe;
 Mon, 31 Mar 2025 20:13:03 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:36 +0100
Message-ID: <20250331201256.1057782-17-willy@infradead.org>
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
 Content preview:  Convert all the callers to receive a folio. Removes a lot
 of hidden calls to compound_head() in f2fs_put_page(). Signed-off-by: Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/checkpoint.c | 4 +--
 fs/f2fs/f2fs.h
 | 2 +- fs/f2fs/node.c | 10 +++--- fs/f2fs/recovery.c | 86
 ++++++++++++++++++++++ [...] 
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
X-Headers-End: 1tzLVS-0003Z4-Ng
Subject: [f2fs-dev] [PATCH 016/153] f2fs: Convert f2fs_get_tmp_page() to
 f2fs_get_tmp_folio()
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

Convert all the callers to receive a folio.  Removes a lot of
hidden calls to compound_head() in f2fs_put_page().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/checkpoint.c |  4 +--
 fs/f2fs/f2fs.h       |  2 +-
 fs/f2fs/node.c       | 10 +++---
 fs/f2fs/recovery.c   | 86 ++++++++++++++++++++++----------------------
 4 files changed, 52 insertions(+), 50 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 1274b66ab5fc..75aad6ccd9d0 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -129,9 +129,9 @@ struct page *f2fs_get_meta_page_retry(struct f2fs_sb_info *sbi, pgoff_t index)
 }
 
 /* for POR only */
-struct page *f2fs_get_tmp_page(struct f2fs_sb_info *sbi, pgoff_t index)
+struct folio *f2fs_get_tmp_folio(struct f2fs_sb_info *sbi, pgoff_t index)
 {
-	return &__get_meta_folio(sbi, index, false)->page;
+	return __get_meta_folio(sbi, index, false);
 }
 
 static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4a30ded147e2..3d2be01f9363 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3882,7 +3882,7 @@ void f2fs_flush_ckpt_thread(struct f2fs_sb_info *sbi);
 struct folio *f2fs_grab_meta_folio(struct f2fs_sb_info *sbi, pgoff_t index);
 struct page *f2fs_get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index);
 struct page *f2fs_get_meta_page_retry(struct f2fs_sb_info *sbi, pgoff_t index);
-struct page *f2fs_get_tmp_page(struct f2fs_sb_info *sbi, pgoff_t index);
+struct folio *f2fs_get_tmp_folio(struct f2fs_sb_info *sbi, pgoff_t index);
 bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 					block_t blkaddr, int type);
 bool f2fs_is_valid_blkaddr_raw(struct f2fs_sb_info *sbi,
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 5f15c224bf78..cda6448651fa 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2902,17 +2902,17 @@ int f2fs_restore_node_summary(struct f2fs_sb_info *sbi,
 		f2fs_ra_meta_pages(sbi, addr, nrpages, META_POR, true);
 
 		for (idx = addr; idx < addr + nrpages; idx++) {
-			struct page *page = f2fs_get_tmp_page(sbi, idx);
+			struct folio *folio = f2fs_get_tmp_folio(sbi, idx);
 
-			if (IS_ERR(page))
-				return PTR_ERR(page);
+			if (IS_ERR(folio))
+				return PTR_ERR(folio);
 
-			rn = F2FS_NODE(page);
+			rn = F2FS_NODE(&folio->page);
 			sum_entry->nid = rn->footer.nid;
 			sum_entry->version = 0;
 			sum_entry->ofs_in_node = 0;
 			sum_entry++;
-			f2fs_put_page(page, 1);
+			f2fs_folio_put(folio, true);
 		}
 
 		invalidate_mapping_pages(META_MAPPING(sbi), addr,
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 69a2027e3ebc..9848f0516a7e 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -358,33 +358,34 @@ static int sanity_check_node_chain(struct f2fs_sb_info *sbi, block_t blkaddr,
 		block_t *blkaddr_fast, bool *is_detecting)
 {
 	unsigned int ra_blocks = RECOVERY_MAX_RA_BLOCKS;
-	struct page *page = NULL;
 	int i;
 
 	if (!*is_detecting)
 		return 0;
 
 	for (i = 0; i < 2; i++) {
+		struct folio *folio;
+
 		if (!f2fs_is_valid_blkaddr(sbi, *blkaddr_fast, META_POR)) {
 			*is_detecting = false;
 			return 0;
 		}
 
-		page = f2fs_get_tmp_page(sbi, *blkaddr_fast);
-		if (IS_ERR(page))
-			return PTR_ERR(page);
+		folio = f2fs_get_tmp_folio(sbi, *blkaddr_fast);
+		if (IS_ERR(folio))
+			return PTR_ERR(folio);
 
-		if (!is_recoverable_dnode(page)) {
-			f2fs_put_page(page, 1);
+		if (!is_recoverable_dnode(&folio->page)) {
+			f2fs_folio_put(folio, true);
 			*is_detecting = false;
 			return 0;
 		}
 
 		ra_blocks = adjust_por_ra_blocks(sbi, ra_blocks, *blkaddr_fast,
-						next_blkaddr_of_node(page));
+					next_blkaddr_of_node(&folio->page));
 
-		*blkaddr_fast = next_blkaddr_of_node(page);
-		f2fs_put_page(page, 1);
+		*blkaddr_fast = next_blkaddr_of_node(&folio->page);
+		f2fs_folio_put(folio, true);
 
 		f2fs_ra_meta_pages_cond(sbi, *blkaddr_fast, ra_blocks);
 	}
@@ -401,7 +402,6 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 				bool check_only)
 {
 	struct curseg_info *curseg;
-	struct page *page = NULL;
 	block_t blkaddr, blkaddr_fast;
 	bool is_detecting = true;
 	int err = 0;
@@ -413,33 +413,35 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 
 	while (1) {
 		struct fsync_inode_entry *entry;
+		struct folio *folio;
 
 		if (!f2fs_is_valid_blkaddr(sbi, blkaddr, META_POR))
 			return 0;
 
-		page = f2fs_get_tmp_page(sbi, blkaddr);
-		if (IS_ERR(page)) {
-			err = PTR_ERR(page);
+		folio = f2fs_get_tmp_folio(sbi, blkaddr);
+		if (IS_ERR(folio)) {
+			err = PTR_ERR(folio);
 			break;
 		}
 
-		if (!is_recoverable_dnode(page)) {
-			f2fs_put_page(page, 1);
+		if (!is_recoverable_dnode(&folio->page)) {
+			f2fs_folio_put(folio, true);
 			break;
 		}
 
-		if (!is_fsync_dnode(page))
+		if (!is_fsync_dnode(&folio->page))
 			goto next;
 
-		entry = get_fsync_inode(head, ino_of_node(page));
+		entry = get_fsync_inode(head, ino_of_node(&folio->page));
 		if (!entry) {
 			bool quota_inode = false;
 
 			if (!check_only &&
-					IS_INODE(page) && is_dent_dnode(page)) {
-				err = f2fs_recover_inode_page(sbi, page);
+					IS_INODE(&folio->page) &&
+					is_dent_dnode(&folio->page)) {
+				err = f2fs_recover_inode_page(sbi, &folio->page);
 				if (err) {
-					f2fs_put_page(page, 1);
+					f2fs_folio_put(folio, true);
 					break;
 				}
 				quota_inode = true;
@@ -449,24 +451,24 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 			 * CP | dnode(F) | inode(DF)
 			 * For this case, we should not give up now.
 			 */
-			entry = add_fsync_inode(sbi, head, ino_of_node(page),
+			entry = add_fsync_inode(sbi, head, ino_of_node(&folio->page),
 								quota_inode);
 			if (IS_ERR(entry)) {
 				err = PTR_ERR(entry);
 				if (err == -ENOENT)
 					goto next;
-				f2fs_put_page(page, 1);
+				f2fs_folio_put(folio, true);
 				break;
 			}
 		}
 		entry->blkaddr = blkaddr;
 
-		if (IS_INODE(page) && is_dent_dnode(page))
+		if (IS_INODE(&folio->page) && is_dent_dnode(&folio->page))
 			entry->last_dentry = blkaddr;
 next:
 		/* check next segment */
-		blkaddr = next_blkaddr_of_node(page);
-		f2fs_put_page(page, 1);
+		blkaddr = next_blkaddr_of_node(&folio->page);
+		f2fs_folio_put(folio, true);
 
 		err = sanity_check_node_chain(sbi, blkaddr, &blkaddr_fast,
 				&is_detecting);
@@ -773,7 +775,6 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 		struct list_head *tmp_inode_list, struct list_head *dir_list)
 {
 	struct curseg_info *curseg;
-	struct page *page = NULL;
 	int err = 0;
 	block_t blkaddr;
 	unsigned int ra_blocks = RECOVERY_MAX_RA_BLOCKS;
@@ -784,22 +785,23 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 
 	while (1) {
 		struct fsync_inode_entry *entry;
+		struct folio *folio;
 
 		if (!f2fs_is_valid_blkaddr(sbi, blkaddr, META_POR))
 			break;
 
-		page = f2fs_get_tmp_page(sbi, blkaddr);
-		if (IS_ERR(page)) {
-			err = PTR_ERR(page);
+		folio = f2fs_get_tmp_folio(sbi, blkaddr);
+		if (IS_ERR(folio)) {
+			err = PTR_ERR(folio);
 			break;
 		}
 
-		if (!is_recoverable_dnode(page)) {
-			f2fs_put_page(page, 1);
+		if (!is_recoverable_dnode(&folio->page)) {
+			f2fs_folio_put(folio, true);
 			break;
 		}
 
-		entry = get_fsync_inode(inode_list, ino_of_node(page));
+		entry = get_fsync_inode(inode_list, ino_of_node(&folio->page));
 		if (!entry)
 			goto next;
 		/*
@@ -807,23 +809,23 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 		 * In this case, we can lose the latest inode(x).
 		 * So, call recover_inode for the inode update.
 		 */
-		if (IS_INODE(page)) {
-			err = recover_inode(entry->inode, page);
+		if (IS_INODE(&folio->page)) {
+			err = recover_inode(entry->inode, &folio->page);
 			if (err) {
-				f2fs_put_page(page, 1);
+				f2fs_folio_put(folio, true);
 				break;
 			}
 		}
 		if (entry->last_dentry == blkaddr) {
-			err = recover_dentry(entry->inode, page, dir_list);
+			err = recover_dentry(entry->inode, &folio->page, dir_list);
 			if (err) {
-				f2fs_put_page(page, 1);
+				f2fs_folio_put(folio, true);
 				break;
 			}
 		}
-		err = do_recover_data(sbi, entry->inode, page);
+		err = do_recover_data(sbi, entry->inode, &folio->page);
 		if (err) {
-			f2fs_put_page(page, 1);
+			f2fs_folio_put(folio, true);
 			break;
 		}
 
@@ -831,11 +833,11 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 			list_move_tail(&entry->list, tmp_inode_list);
 next:
 		ra_blocks = adjust_por_ra_blocks(sbi, ra_blocks, blkaddr,
-						next_blkaddr_of_node(page));
+					next_blkaddr_of_node(&folio->page));
 
 		/* check next segment */
-		blkaddr = next_blkaddr_of_node(page);
-		f2fs_put_page(page, 1);
+		blkaddr = next_blkaddr_of_node(&folio->page);
+		f2fs_folio_put(folio, true);
 
 		f2fs_ra_meta_pages_cond(sbi, blkaddr, ra_blocks);
 	}
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
