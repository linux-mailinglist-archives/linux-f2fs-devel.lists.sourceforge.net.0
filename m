Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B337A76E6E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVv-00040S-62;
	Mon, 31 Mar 2025 20:13:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVg-0003qD-E7
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dBtBb8c63osuTmS5ieFn/X9D+Sq8MOzw9P6W0dRhqu0=; b=Ys7k/Hab2I3j4xZs0OWKbKVP/P
 W1gm7hfF3CZ5N7KXj30qGXZjPXpSqYWlPIHCTbRM0rmoT00CpdsOQRPZat1t2PPdRn+D2jll7pRiS
 b+CUYEBxgSMFmCheCUAZGo4l1FnKxICUW6wVAkI79CHewZFXDJbom1yT8+ez//x90MTw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dBtBb8c63osuTmS5ieFn/X9D+Sq8MOzw9P6W0dRhqu0=; b=KroYM39m2B76rZm6Ef2K8LTd9f
 Ya/j9uxTT+GIs/9N3wZTxy9ruQtKObRMnHZ7ZfH3u9kCGQIWsxwWlakZo4BNdrIbNwnR0VYKKe7x+
 is3eaSadAWrykz6Fe5yOzRE6mWIckGaiB3SSF+1dhpJqVX6aAxtkArnJUQWcXFcpPk9U=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVV-0003Zo-MP for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=dBtBb8c63osuTmS5ieFn/X9D+Sq8MOzw9P6W0dRhqu0=; b=ePIrwKsKQcuq7+iOKlpTXpAUVJ
 jvsj9pG6gDyZeXHYvvvDMb5kg+MfzB9AjLc7xdziw1/W+71vDwQhsS4xrB4k58aPnDFFUBtJ5LOj7
 0ICYThpqAI6H3Q/uktZ7/MmVQvquARXtmMsfPglqkY4UXa89zDOhPnNATJuWTQmWxIu1EymSsXhgG
 xePZ/DxAtaL8taVvObC9rY8C8UkkfhEf5LFvddlPiofdobXIEwYJmJsq1UWHuVJra2iNvInitwhI+
 sMa5JZmtlA9caz/oafkSKOKX5wgxRlvGwN1Txqyi5oz9MRavB1Hj+znP6aDvOWeZLmUXxor8z3F66
 G7Zo4f3A==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVK-00000004RdC-0rlV;
 Mon, 31 Mar 2025 20:13:06 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:57 +0100
Message-ID: <20250331201256.1057782-38-willy@infradead.org>
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
 Content preview: Also convert get_current_nat_page() to
 get_current_nat_folio().
 Removes three hidden calls to compound_head(). Signed-off-by: Matthew Wilcox
 (Oracle) <willy@infradead.org> --- fs/f2fs/checkpoint.c | 4 ++--
 fs/f2fs/f2fs.h
 | 2 +- fs/f2fs/node.c | 28 ++++++++++++++ fs/f2fs/segment.c | 2 +- 4 files
 c [...] Content analysis details:   (-2.5 points, 6.0 required)
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
X-Headers-End: 1tzLVV-0003Zo-MP
Subject: [f2fs-dev] [PATCH 037/153] f2fs: Convert f2fs_get_meta_page_retry()
 to f2fs_get_meta_folio_retry()
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

Also convert get_current_nat_page() to get_current_nat_folio().
Removes three hidden calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/checkpoint.c |  4 ++--
 fs/f2fs/f2fs.h       |  2 +-
 fs/f2fs/node.c       | 28 ++++++++++++++--------------
 fs/f2fs/segment.c    |  2 +-
 4 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index c34add47ea8d..b9f19fb9b983 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -112,7 +112,7 @@ struct folio *f2fs_get_meta_folio(struct f2fs_sb_info *sbi, pgoff_t index)
 	return __get_meta_folio(sbi, index, true);
 }
 
-struct page *f2fs_get_meta_page_retry(struct f2fs_sb_info *sbi, pgoff_t index)
+struct folio *f2fs_get_meta_folio_retry(struct f2fs_sb_info *sbi, pgoff_t index)
 {
 	struct folio *folio;
 	int count = 0;
@@ -125,7 +125,7 @@ struct page *f2fs_get_meta_page_retry(struct f2fs_sb_info *sbi, pgoff_t index)
 			goto retry;
 		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_META_PAGE);
 	}
-	return &folio->page;
+	return folio;
 }
 
 /* for POR only */
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 3c632154bd6e..55fed88b79e1 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3881,7 +3881,7 @@ void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io,
 void f2fs_flush_ckpt_thread(struct f2fs_sb_info *sbi);
 struct folio *f2fs_grab_meta_folio(struct f2fs_sb_info *sbi, pgoff_t index);
 struct folio *f2fs_get_meta_folio(struct f2fs_sb_info *sbi, pgoff_t index);
-struct page *f2fs_get_meta_page_retry(struct f2fs_sb_info *sbi, pgoff_t index);
+struct folio *f2fs_get_meta_folio_retry(struct f2fs_sb_info *sbi, pgoff_t index);
 struct folio *f2fs_get_tmp_folio(struct f2fs_sb_info *sbi, pgoff_t index);
 bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 					block_t blkaddr, int type);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index e1fa3babb50f..ffe71868f459 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -130,14 +130,14 @@ static void clear_node_page_dirty(struct page *page)
 	ClearPageUptodate(page);
 }
 
-static struct page *get_current_nat_page(struct f2fs_sb_info *sbi, nid_t nid)
+static struct folio *get_current_nat_folio(struct f2fs_sb_info *sbi, nid_t nid)
 {
-	return f2fs_get_meta_page_retry(sbi, current_nat_addr(sbi, nid));
+	return f2fs_get_meta_folio_retry(sbi, current_nat_addr(sbi, nid));
 }
 
 static struct page *get_next_nat_page(struct f2fs_sb_info *sbi, nid_t nid)
 {
-	struct page *src_page;
+	struct folio *src_folio;
 	struct folio *dst_folio;
 	pgoff_t dst_off;
 	void *src_addr;
@@ -147,17 +147,17 @@ static struct page *get_next_nat_page(struct f2fs_sb_info *sbi, nid_t nid)
 	dst_off = next_nat_addr(sbi, current_nat_addr(sbi, nid));
 
 	/* get current nat block page with lock */
-	src_page = get_current_nat_page(sbi, nid);
-	if (IS_ERR(src_page))
-		return src_page;
+	src_folio = get_current_nat_folio(sbi, nid);
+	if (IS_ERR(src_folio))
+		return &src_folio->page;
 	dst_folio = f2fs_grab_meta_folio(sbi, dst_off);
-	f2fs_bug_on(sbi, PageDirty(src_page));
+	f2fs_bug_on(sbi, folio_test_dirty(src_folio));
 
-	src_addr = page_address(src_page);
+	src_addr = folio_address(src_folio);
 	dst_addr = folio_address(dst_folio);
 	memcpy(dst_addr, src_addr, PAGE_SIZE);
 	folio_mark_dirty(dst_folio);
-	f2fs_put_page(src_page, 1);
+	f2fs_folio_put(src_folio, true);
 
 	set_to_next_nat(nm_i, nid);
 
@@ -2546,13 +2546,13 @@ static int __f2fs_build_free_nids(struct f2fs_sb_info *sbi,
 	while (1) {
 		if (!test_bit_le(NAT_BLOCK_OFFSET(nid),
 						nm_i->nat_block_bitmap)) {
-			struct page *page = get_current_nat_page(sbi, nid);
+			struct folio *folio = get_current_nat_folio(sbi, nid);
 
-			if (IS_ERR(page)) {
-				ret = PTR_ERR(page);
+			if (IS_ERR(folio)) {
+				ret = PTR_ERR(folio);
 			} else {
-				ret = scan_nat_page(sbi, page, nid);
-				f2fs_put_page(page, 1);
+				ret = scan_nat_page(sbi, &folio->page, nid);
+				f2fs_folio_put(folio, true);
 			}
 
 			if (ret) {
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 66d5dc15b281..2f88f9294ba9 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2681,7 +2681,7 @@ struct page *f2fs_get_sum_page(struct f2fs_sb_info *sbi, unsigned int segno)
 {
 	if (unlikely(f2fs_cp_error(sbi)))
 		return ERR_PTR(-EIO);
-	return f2fs_get_meta_page_retry(sbi, GET_SUM_BLOCK(sbi, segno));
+	return &f2fs_get_meta_folio_retry(sbi, GET_SUM_BLOCK(sbi, segno))->page;
 }
 
 void f2fs_update_meta_page(struct f2fs_sb_info *sbi,
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
