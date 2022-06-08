Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A284A5435F1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jun 2022 17:03:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nyxDg-0004MG-P6; Wed, 08 Jun 2022 15:03:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>)
 id 1nyxDa-0004JY-Cc; Wed, 08 Jun 2022 15:03:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5npsXdc68IkdHS9QQplhoGS3mgY+20vmpxeIh5k5guo=; b=mSMrfFEKKlGTYHtF9g8KjuMpaO
 q1vfCbHfzjcjV9MHKoolynxSmMdwQ5X2mY5yYmlp1jduipxl91zIhbzFTtD6sw4XXnSrn7Ml3pYWE
 Wyu4GqO0+lShJFmhCtwMpsInEeGgGWPYj9vazyHXVTEalEYaxFVuYFvayPW2w8EUYr0E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5npsXdc68IkdHS9QQplhoGS3mgY+20vmpxeIh5k5guo=; b=BqBMwRwA9rWZ84b+VifVPLiNKA
 NikeO61m7jCHHllfrVD3jo31+Rqncaz5+FM5f1KR26PYNhlqnorMDrvXlNpPiW49RB03KBgz7ffQP
 ZCmnpzSX4zZiFnxx2WyhTbK4zUZKZnfzrIad6IA+aWaif/3obM4TaXsVaQ/nquQUqoaM=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nyxDZ-009y0R-Gj; Wed, 08 Jun 2022 15:03:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=5npsXdc68IkdHS9QQplhoGS3mgY+20vmpxeIh5k5guo=; b=rXc5AtDvvG/hpa8vIqf6R/xPw6
 UrL+UsKwmXkyxMDVbzTujwyYLJghxfRH0Y7eFEuTzXeh86YeTZSNKnJAoOk2pT9ySfX0BDNY0qoWf
 c4S41cnxl9Vs1Uv12emgfIP+2QwFm7qe5ajKnz2gRn0OZ8/pvGgtsH2hFBxivh+TWayhD2uWm91po
 r5gpL3IQVa82F0QOi8df2oIU4B0IbUcBa/7kE5VbK1SmP360/uLbJZMvBxXy81emTvrRMM8EsTr5I
 AIcJ+wWTSDwunW6H2g3K8ov7+QfKhotHG6sv9TDj0IMbxfaYaI+1wzgwFqX5SjiNRGBVEYir/fv6U
 eTdszuHg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyxCv-00CjFq-E2; Wed, 08 Jun 2022 15:02:53 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  8 Jun 2022 16:02:49 +0100
Message-Id: <20220608150249.3033815-20-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220608150249.3033815-1-willy@infradead.org>
References: <20220608150249.3033815-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  migrate_page_move_mapping(),
 migrate_page_copy() and migrate_page_states()
 are all now unused after converting all the filesystems from
 aops->migratepage()
 to aops->migrate_folio(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 Reviewed-by: Christoph Hellwig <hch@lst.de> --- include/linux/migrate.h |
 11 mm/folio-compat.c | 22 mm/k [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1nyxDZ-009y0R-Gj
Subject: [f2fs-dev] [PATCH v2 19/19] mm/folio-compat: Remove migration
 compatibility functions
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ntfs-dev@lists.sourceforge.net, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 linux-ext4@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

migrate_page_move_mapping(), migrate_page_copy() and migrate_page_states()
are all now unused after converting all the filesystems from
aops->migratepage() to aops->migrate_folio().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/migrate.h | 11 -----------
 mm/folio-compat.c       | 22 ----------------------
 mm/ksm.c                |  2 +-
 3 files changed, 1 insertion(+), 34 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 59d64a1e6b4b..3e18c7048506 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -40,12 +40,8 @@ extern int migrate_pages(struct list_head *l, new_page_t new, free_page_t free,
 extern struct page *alloc_migration_target(struct page *page, unsigned long private);
 extern int isolate_movable_page(struct page *page, isolate_mode_t mode);
 
-extern void migrate_page_states(struct page *newpage, struct page *page);
-extern void migrate_page_copy(struct page *newpage, struct page *page);
 int migrate_huge_page_move_mapping(struct address_space *mapping,
 		struct folio *dst, struct folio *src);
-extern int migrate_page_move_mapping(struct address_space *mapping,
-		struct page *newpage, struct page *page, int extra_count);
 void migration_entry_wait_on_locked(swp_entry_t entry, pte_t *ptep,
 				spinlock_t *ptl);
 void folio_migrate_flags(struct folio *newfolio, struct folio *folio);
@@ -66,13 +62,6 @@ static inline struct page *alloc_migration_target(struct page *page,
 static inline int isolate_movable_page(struct page *page, isolate_mode_t mode)
 	{ return -EBUSY; }
 
-static inline void migrate_page_states(struct page *newpage, struct page *page)
-{
-}
-
-static inline void migrate_page_copy(struct page *newpage,
-				     struct page *page) {}
-
 static inline int migrate_huge_page_move_mapping(struct address_space *mapping,
 				  struct folio *dst, struct folio *src)
 {
diff --git a/mm/folio-compat.c b/mm/folio-compat.c
index 20bc15b57d93..458618c7302c 100644
--- a/mm/folio-compat.c
+++ b/mm/folio-compat.c
@@ -51,28 +51,6 @@ void mark_page_accessed(struct page *page)
 }
 EXPORT_SYMBOL(mark_page_accessed);
 
-#ifdef CONFIG_MIGRATION
-int migrate_page_move_mapping(struct address_space *mapping,
-		struct page *newpage, struct page *page, int extra_count)
-{
-	return folio_migrate_mapping(mapping, page_folio(newpage),
-					page_folio(page), extra_count);
-}
-EXPORT_SYMBOL(migrate_page_move_mapping);
-
-void migrate_page_states(struct page *newpage, struct page *page)
-{
-	folio_migrate_flags(page_folio(newpage), page_folio(page));
-}
-EXPORT_SYMBOL(migrate_page_states);
-
-void migrate_page_copy(struct page *newpage, struct page *page)
-{
-	folio_migrate_copy(page_folio(newpage), page_folio(page));
-}
-EXPORT_SYMBOL(migrate_page_copy);
-#endif
-
 bool set_page_writeback(struct page *page)
 {
 	return folio_start_writeback(page_folio(page));
diff --git a/mm/ksm.c b/mm/ksm.c
index 54f78c9eecae..e8f8c1a2bb39 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -712,7 +712,7 @@ static struct page *get_ksm_page(struct stable_node *stable_node,
 	 * however, it might mean that the page is under page_ref_freeze().
 	 * The __remove_mapping() case is easy, again the node is now stale;
 	 * the same is in reuse_ksm_page() case; but if page is swapcache
-	 * in migrate_page_move_mapping(), it might still be our page,
+	 * in folio_migrate_mapping(), it might still be our page,
 	 * in which case it's essential to keep the node.
 	 */
 	while (!get_page_unless_zero(page)) {
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
