Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A9953DDF2
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  5 Jun 2022 21:39:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nxw5x-0006Pp-8b; Sun, 05 Jun 2022 19:39:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>) id 1nxw5v-0006PE-Ta
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jun 2022 19:39:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OKfTT3lHI1ZyVlt5mIkzU0UCspOZGM/nu3wRRwSA884=; b=M2ve8HKoyYP0X3zc1XeoQ9jakV
 MHt89F9Dctn3V7CKYsWdq1exD2TecXdD13fxOQ6CqF7ILxHIT3hgfONeebXmAVySvmkqI6O/+ClXF
 M6TfsIAfG7rYFCIAsxowbCDrB9pmGaJEqTuCEVe9X7B/O+2PwbNmE6h+0Nn0F4Q6aDug=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OKfTT3lHI1ZyVlt5mIkzU0UCspOZGM/nu3wRRwSA884=; b=CfIlYMHuFSFOIf8RvwUFPxoQDY
 pD3aH0XhwEC/SNlGrXuxe9zEwx7UcECKQaQ+seuqNP1zHnOi9V778eBbB79HTsTbxmP/0aZ0mze5y
 Rre5QRjCjs+zz8roAsdkZxn0XTDjvs2A3x/QCuTw/rkWYSOvDpY1jpv6dtgSaJ/CnaCs=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nxw5u-00055u-LB
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jun 2022 19:39:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=OKfTT3lHI1ZyVlt5mIkzU0UCspOZGM/nu3wRRwSA884=; b=oCy+OeGRtDxhYjiC1O/zCFlM1E
 +GLKQJ/W+sccDPBLjY3er2VqLfMCEOwVG2399jOMHXumUU9OHGAIixEoQOi/SpN3be9JrXvF16w/v
 Exl+YnA2i8gI7xqdnzTxw1MPX9mIztUvT6d28MoZlCWW9XP6JT+0/LaRG5ZBAyAOHPy4t3LVhruNY
 x/DFbMg1kb2C6BevSb31Bs4yqYOuNyGLM6eCChRa6QwSRaO+Gdj3Xk/rAclmb0Oonj5FrYQ2yaWx0
 x0PkYd/DRK5vRnOuPNzfMMOJ4i8jB1fSoAiI39Kk4myb97CWXL7S1aAlZ72vXZPLnBJ7fQi0obEck
 +vvpE4IQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nxw5R-009wsd-5Z; Sun, 05 Jun 2022 19:38:57 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Sun,  5 Jun 2022 20:38:52 +0100
Message-Id: <20220605193854.2371230-9-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220605193854.2371230-1-willy@infradead.org>
References: <20220605193854.2371230-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Change the guts of check_move_unevictable_pages() over to
 use folios and add check_move_unevictable_pages() as a wrapper. Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- include/linux/swap.h |
 3 ++- mm/vmscan.c | 55 ++++++++++++++++++++++++++ 2 files changed,
 35 insertions(+), 23 deleti [...] 
 Content analysis details:   (2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1nxw5u-00055u-LB
Subject: [f2fs-dev] [PATCH 08/10] vmscan: Add check_move_unevictable_folios()
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
Cc: linux-nilfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Change the guts of check_move_unevictable_pages() over to use folios
and add check_move_unevictable_pages() as a wrapper.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/swap.h |  3 ++-
 mm/vmscan.c          | 55 ++++++++++++++++++++++++++------------------
 2 files changed, 35 insertions(+), 23 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 0c0fed1b348f..8672a7123ccd 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -438,7 +438,8 @@ static inline bool node_reclaim_enabled(void)
 	return node_reclaim_mode & (RECLAIM_ZONE|RECLAIM_WRITE|RECLAIM_UNMAP);
 }
 
-extern void check_move_unevictable_pages(struct pagevec *pvec);
+void check_move_unevictable_folios(struct folio_batch *fbatch);
+void check_move_unevictable_pages(struct pagevec *pvec);
 
 extern void kswapd_run(int nid);
 extern void kswapd_stop(int nid);
diff --git a/mm/vmscan.c b/mm/vmscan.c
index f7d9a683e3a7..5222c5ad600a 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4790,45 +4790,56 @@ int node_reclaim(struct pglist_data *pgdat, gfp_t gfp_mask, unsigned int order)
 }
 #endif
 
+void check_move_unevictable_pages(struct pagevec *pvec)
+{
+	struct folio_batch fbatch;
+	unsigned i;
+
+	for (i = 0; i < pvec->nr; i++) {
+		struct page *page = pvec->pages[i];
+
+		if (PageTransTail(page))
+			continue;
+		folio_batch_add(&fbatch, page_folio(page));
+	}
+	check_move_unevictable_folios(&fbatch);
+}
+EXPORT_SYMBOL_GPL(check_move_unevictable_pages);
+
 /**
- * check_move_unevictable_pages - check pages for evictability and move to
- * appropriate zone lru list
- * @pvec: pagevec with lru pages to check
+ * check_move_unevictable_folios - Move evictable folios to appropriate zone
+ * lru list
+ * @fbatch: Batch of lru folios to check.
  *
- * Checks pages for evictability, if an evictable page is in the unevictable
+ * Checks folios for evictability, if an evictable folio is in the unevictable
  * lru list, moves it to the appropriate evictable lru list. This function
- * should be only used for lru pages.
+ * should be only used for lru folios.
  */
-void check_move_unevictable_pages(struct pagevec *pvec)
+void check_move_unevictable_folios(struct folio_batch *fbatch)
 {
 	struct lruvec *lruvec = NULL;
 	int pgscanned = 0;
 	int pgrescued = 0;
 	int i;
 
-	for (i = 0; i < pvec->nr; i++) {
-		struct page *page = pvec->pages[i];
-		struct folio *folio = page_folio(page);
-		int nr_pages;
-
-		if (PageTransTail(page))
-			continue;
+	for (i = 0; i < fbatch->nr; i++) {
+		struct folio *folio = fbatch->folios[i];
+		int nr_pages = folio_nr_pages(folio);
 
-		nr_pages = thp_nr_pages(page);
 		pgscanned += nr_pages;
 
-		/* block memcg migration during page moving between lru */
-		if (!TestClearPageLRU(page))
+		/* block memcg migration while the folio moves between lrus */
+		if (!folio_test_clear_lru(folio))
 			continue;
 
 		lruvec = folio_lruvec_relock_irq(folio, lruvec);
-		if (page_evictable(page) && PageUnevictable(page)) {
-			del_page_from_lru_list(page, lruvec);
-			ClearPageUnevictable(page);
-			add_page_to_lru_list(page, lruvec);
+		if (folio_evictable(folio) && folio_test_unevictable(folio)) {
+			lruvec_del_folio(lruvec, folio);
+			folio_clear_unevictable(folio);
+			lruvec_add_folio(lruvec, folio);
 			pgrescued += nr_pages;
 		}
-		SetPageLRU(page);
+		folio_set_lru(folio);
 	}
 
 	if (lruvec) {
@@ -4839,4 +4850,4 @@ void check_move_unevictable_pages(struct pagevec *pvec)
 		count_vm_events(UNEVICTABLE_PGSCANNED, pgscanned);
 	}
 }
-EXPORT_SYMBOL_GPL(check_move_unevictable_pages);
+EXPORT_SYMBOL_GPL(check_move_unevictable_folios);
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
