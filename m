Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2576A76EC7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWY-0006Eq-2Q;
	Mon, 31 Mar 2025 20:14:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVw-0005pT-AT
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kQy/JfCJHCFpmaRw3GdJB3XlmxI6DVWhIjBeixfoI5Q=; b=cVb2kmTxFtaEeShL15oCKbKBoF
 PIv6FiCIAIKv1JNepbHWFQ0oBm7gquLAc5ZLKdhM6ZPnRKD0cIa0bGx6DCf26kaYCkgeWG8u9RWNx
 +5cRpeZmuZ5WZeHUoZ5LT01z9FfJ9bK1ZVMRNQcQIGLtOCG4+hsmOvUwgIzMOV59FAhU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kQy/JfCJHCFpmaRw3GdJB3XlmxI6DVWhIjBeixfoI5Q=; b=ObXMmxJHYNk4DklSl8XzfDI+cn
 tgupGt58+czbdMTP6pdcYlnyIXVmRCmY8tMyJWL08myiIsYsgtHjmR5oFkVtPWwEEGYm0IWHmKMuw
 gPose5R684tQ1SZ9LLfxhh0Zs2KFAOsselQpZsxfyotzFTyQ9UnhT9pAl6LLVIPQvSuM=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVp-0003iP-V6 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=kQy/JfCJHCFpmaRw3GdJB3XlmxI6DVWhIjBeixfoI5Q=; b=vZ1r2PqGZCXcxpbem4Ori1Uo+I
 SQRdz4hnqrilgZKFi+w7JHJnMjsPhD7MN5p0kuVlZ/hKjWkGVTpO/PuOO5gBiCSS4KG1ZCREASWCh
 3EDFs/KozhLkHRycxkmqAsgGRPiECQ1DgDnH4o62Sl1aTR2/eCf45yEiX+JuSBdlfaUsO0qXcX4Q7
 3XfRtXEJBaOMGhbgOTF0occIGSveMgyfKVe9ANfWS1Iy7Cp/h+xmrxqjiGYodPmyjLUkOI39igyHe
 dAt1GjEMWgjtHuU8mrRegYtOvif4C47T3GQdsXUo2nDj28yZ+z6hTPoIGZOd4QdZi0R83RlATkGYB
 AZ9Of3uw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVe-00000004Sdq-25Hq;
 Mon, 31 Mar 2025 20:13:26 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:50 +0100
Message-ID: <20250331201256.1057782-151-willy@infradead.org>
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
 Content preview:  Convert all callers to set/get a folio instead of a page.
 Removes five calls to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org> --- fs/f2fs/data.c | 2 +- fs/f2fs/f2fs.h | 4 ++--
 fs/f2fs/node.c
 | 25 +++++++++++++ fs/f2fs/segment.c | 2 +- 4 files changed, 1 [...] 
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
X-Headers-End: 1tzLVp-0003iP-V6
Subject: [f2fs-dev] [PATCH 150/153] f2fs: Convert fsync_node_entry->page to
 folio
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

Convert all callers to set/get a folio instead of a page.  Removes
five calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c    |  2 +-
 fs/f2fs/f2fs.h    |  4 ++--
 fs/f2fs/node.c    | 25 +++++++++++++------------
 fs/f2fs/segment.c |  2 +-
 4 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 96afaf962fd0..e112c8356e21 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -359,7 +359,7 @@ static void f2fs_write_end_io(struct bio *bio)
 
 		dec_page_count(sbi, type);
 		if (f2fs_in_warm_node_list(sbi, folio))
-			f2fs_del_fsync_node_entry(sbi, &folio->page);
+			f2fs_del_fsync_node_entry(sbi, folio);
 		clear_page_private_gcing(&folio->page);
 		folio_end_writeback(folio);
 	}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 2ab1ff3dd4cb..768f5fd9b45d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -317,7 +317,7 @@ struct inode_entry {
 
 struct fsync_node_entry {
 	struct list_head list;	/* list head */
-	struct page *page;	/* warm node page pointer */
+	struct folio *folio;	/* warm node folio pointer */
 	unsigned int seq_id;	/* sequence id */
 };
 
@@ -3721,7 +3721,7 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type);
 bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi,
 		const struct folio *folio);
 void f2fs_init_fsync_node_info(struct f2fs_sb_info *sbi);
-void f2fs_del_fsync_node_entry(struct f2fs_sb_info *sbi, struct page *page);
+void f2fs_del_fsync_node_entry(struct f2fs_sb_info *sbi, struct folio *folio);
 void f2fs_reset_fsync_node_info(struct f2fs_sb_info *sbi);
 int f2fs_need_dentry_mark(struct f2fs_sb_info *sbi, nid_t nid);
 bool f2fs_is_checkpointed_node(struct f2fs_sb_info *sbi, nid_t nid);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 8f5231c9eea0..f95a922c4936 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -325,7 +325,7 @@ void f2fs_init_fsync_node_info(struct f2fs_sb_info *sbi)
 }
 
 static unsigned int f2fs_add_fsync_node_entry(struct f2fs_sb_info *sbi,
-							struct page *page)
+		struct folio *folio)
 {
 	struct fsync_node_entry *fn;
 	unsigned long flags;
@@ -334,8 +334,8 @@ static unsigned int f2fs_add_fsync_node_entry(struct f2fs_sb_info *sbi,
 	fn = f2fs_kmem_cache_alloc(fsync_node_entry_slab,
 					GFP_NOFS, true, NULL);
 
-	get_page(page);
-	fn->page = page;
+	folio_get(folio);
+	fn->folio = folio;
 	INIT_LIST_HEAD(&fn->list);
 
 	spin_lock_irqsave(&sbi->fsync_node_lock, flags);
@@ -348,19 +348,19 @@ static unsigned int f2fs_add_fsync_node_entry(struct f2fs_sb_info *sbi,
 	return seq_id;
 }
 
-void f2fs_del_fsync_node_entry(struct f2fs_sb_info *sbi, struct page *page)
+void f2fs_del_fsync_node_entry(struct f2fs_sb_info *sbi, struct folio *folio)
 {
 	struct fsync_node_entry *fn;
 	unsigned long flags;
 
 	spin_lock_irqsave(&sbi->fsync_node_lock, flags);
 	list_for_each_entry(fn, &sbi->fsync_node_list, list) {
-		if (fn->page == page) {
+		if (fn->folio == folio) {
 			list_del(&fn->list);
 			sbi->fsync_node_num--;
 			spin_unlock_irqrestore(&sbi->fsync_node_lock, flags);
 			kmem_cache_free(fsync_node_entry_slab, fn);
-			put_page(page);
+			folio_put(folio);
 			return;
 		}
 	}
@@ -1729,7 +1729,7 @@ static int __write_node_folio(struct folio *folio, bool atomic, bool *submitted,
 
 	/* should add to global list before clearing PAGECACHE status */
 	if (f2fs_in_warm_node_list(sbi, folio)) {
-		seq = f2fs_add_fsync_node_entry(sbi, &folio->page);
+		seq = f2fs_add_fsync_node_entry(sbi, folio);
 		if (seq_id)
 			*seq_id = seq;
 	}
@@ -2131,12 +2131,13 @@ int f2fs_wait_on_node_pages_writeback(struct f2fs_sb_info *sbi,
 						unsigned int seq_id)
 {
 	struct fsync_node_entry *fn;
-	struct page *page;
 	struct list_head *head = &sbi->fsync_node_list;
 	unsigned long flags;
 	unsigned int cur_seq_id = 0;
 
 	while (seq_id && cur_seq_id < seq_id) {
+		struct folio *folio;
+
 		spin_lock_irqsave(&sbi->fsync_node_lock, flags);
 		if (list_empty(head)) {
 			spin_unlock_irqrestore(&sbi->fsync_node_lock, flags);
@@ -2148,13 +2149,13 @@ int f2fs_wait_on_node_pages_writeback(struct f2fs_sb_info *sbi,
 			break;
 		}
 		cur_seq_id = fn->seq_id;
-		page = fn->page;
-		get_page(page);
+		folio = fn->folio;
+		folio_get(folio);
 		spin_unlock_irqrestore(&sbi->fsync_node_lock, flags);
 
-		f2fs_wait_on_page_writeback(page, NODE, true, false);
+		f2fs_folio_wait_writeback(folio, NODE, true, false);
 
-		put_page(page);
+		folio_put(folio);
 	}
 
 	return filemap_check_errors(NODE_MAPPING(sbi));
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 0c99c191f218..f3d8501e8cbd 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3918,7 +3918,7 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 			fscrypt_finalize_bounce_page(&fio->encrypted_page);
 		folio_end_writeback(folio);
 		if (f2fs_in_warm_node_list(fio->sbi, folio))
-			f2fs_del_fsync_node_entry(fio->sbi, fio->page);
+			f2fs_del_fsync_node_entry(fio->sbi, folio);
 		goto out;
 	}
 	if (GET_SEGNO(fio->sbi, fio->old_blkaddr) != NULL_SEGNO)
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
