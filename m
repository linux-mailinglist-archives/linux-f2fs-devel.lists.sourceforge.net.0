Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFF853DDEF
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  5 Jun 2022 21:39:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nxw5w-0006PK-ND; Sun, 05 Jun 2022 19:39:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>) id 1nxw5l-0006Op-Sg
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jun 2022 19:39:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eM6uKV+5ElE/ut/Cuc850ZV6AcTLZYIP033Wzko7MpA=; b=RSkCn5yde23pa5DJT2gEBYUI+V
 TnxJ3daZzoaVj4ZWc8WJoRJR5jjNemmtZ/gqpV3mb4YOIk8YyKPqDSLc+jzxSanKPWGCJNnA3nGtN
 c6cFsk2VpAOMTtIvxItYfLHxVcS5UNOL2MrAWylJYutQxJGH+KskCveq24NIzY7Mfi4o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eM6uKV+5ElE/ut/Cuc850ZV6AcTLZYIP033Wzko7MpA=; b=C6eXUJrIesDL0KpaVVGile/OoP
 RM26FSeG8IO/O2qY32C+bbfW14uZcpRu0gDkc4bFvkJ93yRO1M5lXgUd+iF09wK3Z4qEqoMHjDLn/
 7SWVJ+jtqByMt89rv8KdkTW7dm0eEl6kNCfvnfcuwKz0mbv5OMywK5gXPwrCwR56nBNE=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nxw5i-000551-Of
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jun 2022 19:39:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=eM6uKV+5ElE/ut/Cuc850ZV6AcTLZYIP033Wzko7MpA=; b=jw54R9vR5RZy9/he5CXHQlyFzw
 WYLQMbziLOy2S6/zd4nVgc2UPNgndelLoDnOz9B0h2hq2awUcQeux+YLGTLUOy6yY88ojJb4VqImT
 BdJhOFHQIHogBZx79rFympvKsdcS00RpUDNLrO41Q1KgQnJ3iFBBK9/ycC49M6c9x0ilXYsgzTFjq
 4M2AynY09RE7pLDC7wNMqh6uUkgDO0cK8SU9nOwxTGqhdbe51uxm7r4dsSqEZYp+pFoAmUhNlFnfR
 XUA+CO9svYVg4sD4a0sRDrWreBBx8ExZjOsvyFZpDcKYT7mvMK0NVRy7GTxV1W17OgLNV7TCmPpzI
 BHlN4vrQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nxw5R-009wsb-2q; Sun, 05 Jun 2022 19:38:57 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Sun,  5 Jun 2022 20:38:51 +0100
Message-Id: <20220605193854.2371230-8-willy@infradead.org>
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
 Content preview: Use folios throughout. Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org> --- fs/nilfs2/page.c | 60 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+), 30 deletions(-) 
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
X-Headers-End: 1nxw5i-000551-Of
Subject: [f2fs-dev] [PATCH 07/10] nilfs2: Convert nilfs_copy_back_pages() to
 use filemap_get_folios()
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

Use folios throughout.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/nilfs2/page.c | 60 ++++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/fs/nilfs2/page.c b/fs/nilfs2/page.c
index a8e88cc38e16..3267e96c256c 100644
--- a/fs/nilfs2/page.c
+++ b/fs/nilfs2/page.c
@@ -294,57 +294,57 @@ int nilfs_copy_dirty_pages(struct address_space *dmap,
 void nilfs_copy_back_pages(struct address_space *dmap,
 			   struct address_space *smap)
 {
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	unsigned int i, n;
-	pgoff_t index = 0;
+	pgoff_t start = 0;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 repeat:
-	n = pagevec_lookup(&pvec, smap, &index);
+	n = filemap_get_folios(smap, &start, ~0UL, &fbatch);
 	if (!n)
 		return;
 
-	for (i = 0; i < pagevec_count(&pvec); i++) {
-		struct page *page = pvec.pages[i], *dpage;
-		pgoff_t offset = page->index;
-
-		lock_page(page);
-		dpage = find_lock_page(dmap, offset);
-		if (dpage) {
-			/* overwrite existing page in the destination cache */
-			WARN_ON(PageDirty(dpage));
-			nilfs_copy_page(dpage, page, 0);
-			unlock_page(dpage);
-			put_page(dpage);
-			/* Do we not need to remove page from smap here? */
+	for (i = 0; i < folio_batch_count(&fbatch); i++) {
+		struct folio *folio = fbatch.folios[i], *dfolio;
+		pgoff_t index = folio->index;
+
+		folio_lock(folio);
+		dfolio = filemap_lock_folio(dmap, index);
+		if (dfolio) {
+			/* overwrite existing folio in the destination cache */
+			WARN_ON(folio_test_dirty(dfolio));
+			nilfs_copy_page(&dfolio->page, &folio->page, 0);
+			folio_unlock(dfolio);
+			folio_put(dfolio);
+			/* Do we not need to remove folio from smap here? */
 		} else {
-			struct page *p;
+			struct folio *f;
 
-			/* move the page to the destination cache */
+			/* move the folio to the destination cache */
 			xa_lock_irq(&smap->i_pages);
-			p = __xa_erase(&smap->i_pages, offset);
-			WARN_ON(page != p);
+			f = __xa_erase(&smap->i_pages, index);
+			WARN_ON(folio != f);
 			smap->nrpages--;
 			xa_unlock_irq(&smap->i_pages);
 
 			xa_lock_irq(&dmap->i_pages);
-			p = __xa_store(&dmap->i_pages, offset, page, GFP_NOFS);
-			if (unlikely(p)) {
+			f = __xa_store(&dmap->i_pages, index, folio, GFP_NOFS);
+			if (unlikely(f)) {
 				/* Probably -ENOMEM */
-				page->mapping = NULL;
-				put_page(page);
+				folio->mapping = NULL;
+				folio_put(folio);
 			} else {
-				page->mapping = dmap;
+				folio->mapping = dmap;
 				dmap->nrpages++;
-				if (PageDirty(page))
-					__xa_set_mark(&dmap->i_pages, offset,
+				if (folio_test_dirty(folio))
+					__xa_set_mark(&dmap->i_pages, index,
 							PAGECACHE_TAG_DIRTY);
 			}
 			xa_unlock_irq(&dmap->i_pages);
 		}
-		unlock_page(page);
+		folio_unlock(folio);
 	}
-	pagevec_release(&pvec);
+	folio_batch_release(&fbatch);
 	cond_resched();
 
 	goto repeat;
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
