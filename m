Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FFD53F038
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jun 2022 22:41:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nyJXW-000055-J5; Mon, 06 Jun 2022 20:41:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>)
 id 1nyJXN-0008Uv-TV; Mon, 06 Jun 2022 20:41:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UOfFr2kCuNNQQN1tCbzkVZPiRcxwNuFu8WhD+k3kEbk=; b=Tjz1MYt8kOChMSz40XSxy36/r3
 y5rcGEY7Y5FWu3U094RhBKMxQ2bKBT4A8inEAeeru3ROVuLMftiPGZI3Azj7LpzDoYI0NyZCfNOEW
 940PFu/ZEbhg4/ow1RlJjwHXp/70CX3Duji7GdqQ1ZASbEcwdwd1ZYoo6KUS7EktAoow=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UOfFr2kCuNNQQN1tCbzkVZPiRcxwNuFu8WhD+k3kEbk=; b=NnV7JeIuNq4Rfn/hVEDbRA2I0F
 vPYUW1jQ79AOaZt0tYplQ2Cs2xdVFVZiNivnzj24r5Ub/+Jpz5fNrF/pUtMyr6LIGz5GVDQrW8SwE
 8eWfKPGrV6af6sgFP3zTYouQ+a+Zonmp1WjwTwzDyOE5JpYZFhfWZ1D/EchHTaj8TB30=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nyJXM-0004II-DE; Mon, 06 Jun 2022 20:41:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=UOfFr2kCuNNQQN1tCbzkVZPiRcxwNuFu8WhD+k3kEbk=; b=flnOFKhza3ughv7JVhOQB3UNwt
 unJkK+04gLu6Kap8iSsI5n17Petv8ajZ5SNf2z85X1sGiGV+/O4at1NY6yYUUh9otQThec0pBNhjV
 LQ3DHGqLZ9wgkV10cm5ylDRcJkF7gW/EYNYxjb7tw+PQI0TNbmMp3G6/DdD6j0PLwN6ftaBG2q963
 iSWRXJtFiCQCMPYSwFs/2b4lt4PVrMv5PTRj/Y/MrNjJP6VatH2fdUtSsL6pkkS9nfDYj1sL4QV6Q
 OU3G9rQbdmhP7nl+qK3wD97RWO0r4M2EPPu0kLi/mPzqSB9/WTtKyiKeYoaJfIGkogFD5ZUkn3fsh
 T5XYWXLg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyJWx-00B19Y-4o; Mon, 06 Jun 2022 20:40:55 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon,  6 Jun 2022 21:40:38 +0100
Message-Id: <20220606204050.2625949-9-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220606204050.2625949-1-willy@infradead.org>
References: <20220606204050.2625949-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Convert all callers to pass a folio. Most have the folio
 already
 available. Switch all users from aops->migratepage to aops->migrate_folio.
 Also turn the documentation into kerneldoc. Signed-off-by: Matthew Wilcox
 (Oracle) <willy@infradead.org> --- drivers/gpu/drm/i915/gem/i915_gem_userptr.c
 | 4 +-- fs/btrfs/disk-io.c | 2 +- fs/nfs/write.c | 2 +-
 include/linux/migrate.h | 5 ++- mm/ [...] 
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
X-Headers-End: 1nyJXM-0004II-DE
Subject: [f2fs-dev] [PATCH 08/20] mm/migrate: Convert migrate_page() to
 migrate_folio()
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
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 linux-ext4@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert all callers to pass a folio.  Most have the folio
already available.  Switch all users from aops->migratepage to
aops->migrate_folio.  Also turn the documentation into kerneldoc.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c |  4 +--
 fs/btrfs/disk-io.c                          |  2 +-
 fs/nfs/write.c                              |  2 +-
 include/linux/migrate.h                     |  5 ++-
 mm/migrate.c                                | 37 +++++++++++----------
 mm/migrate_device.c                         |  3 +-
 mm/shmem.c                                  |  2 +-
 mm/swap_state.c                             |  2 +-
 8 files changed, 30 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 094f06b4ce33..8423df021b71 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -216,8 +216,8 @@ i915_gem_userptr_put_pages(struct drm_i915_gem_object *obj,
 			 * However...!
 			 *
 			 * The mmu-notifier can be invalidated for a
-			 * migrate_page, that is alreadying holding the lock
-			 * on the page. Such a try_to_unmap() will result
+			 * migrate_folio, that is alreadying holding the lock
+			 * on the folio. Such a try_to_unmap() will result
 			 * in us calling put_pages() and so recursively try
 			 * to lock the page. We avoid that deadlock with
 			 * a trylock_page() and in exchange we risk missing
diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index 9ceb73f683af..8e5f1fa1e972 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -968,7 +968,7 @@ static int btree_migrate_folio(struct address_space *mapping,
 	if (folio_get_private(src) &&
 	    !filemap_release_folio(src, GFP_KERNEL))
 		return -EAGAIN;
-	return migrate_page(mapping, &dst->page, &src->page, mode);
+	return migrate_folio(mapping, dst, src, mode);
 }
 #else
 #define btree_migrate_folio NULL
diff --git a/fs/nfs/write.c b/fs/nfs/write.c
index 649b9e633459..69569696dde0 100644
--- a/fs/nfs/write.c
+++ b/fs/nfs/write.c
@@ -2139,7 +2139,7 @@ int nfs_migrate_folio(struct address_space *mapping, struct folio *dst,
 		folio_wait_fscache(src);
 	}
 
-	return migrate_page(mapping, &dst->page, &src->page, mode);
+	return migrate_folio(mapping, dst, src, mode);
 }
 #endif
 
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 069a89e847f3..4ef22806cd8e 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -25,9 +25,8 @@ extern const char *migrate_reason_names[MR_TYPES];
 #ifdef CONFIG_MIGRATION
 
 extern void putback_movable_pages(struct list_head *l);
-extern int migrate_page(struct address_space *mapping,
-			struct page *newpage, struct page *page,
-			enum migrate_mode mode);
+int migrate_folio(struct address_space *mapping, struct folio *dst,
+		struct folio *src, enum migrate_mode mode);
 extern int migrate_pages(struct list_head *l, new_page_t new, free_page_t free,
 		unsigned long private, enum migrate_mode mode, int reason,
 		unsigned int *ret_succeeded);
diff --git a/mm/migrate.c b/mm/migrate.c
index e0a593e5b5f9..6232c291fdb9 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -594,34 +594,37 @@ EXPORT_SYMBOL(folio_migrate_copy);
  *                    Migration functions
  ***********************************************************/
 
-/*
- * Common logic to directly migrate a single LRU page suitable for
- * pages that do not use PagePrivate/PagePrivate2.
+/**
+ * migrate_folio() - Simple folio migration.
+ * @mapping: The address_space containing the folio.
+ * @dst: The folio to migrate the data to.
+ * @src: The folio containing the current data.
+ * @mode: How to migrate the page.
  *
- * Pages are locked upon entry and exit.
+ * Common logic to directly migrate a single LRU folio suitable for
+ * folios that do not use PagePrivate/PagePrivate2.
+ *
+ * Folios are locked upon entry and exit.
  */
-int migrate_page(struct address_space *mapping,
-		struct page *newpage, struct page *page,
-		enum migrate_mode mode)
+int migrate_folio(struct address_space *mapping, struct folio *dst,
+		struct folio *src, enum migrate_mode mode)
 {
-	struct folio *newfolio = page_folio(newpage);
-	struct folio *folio = page_folio(page);
 	int rc;
 
-	BUG_ON(folio_test_writeback(folio));	/* Writeback must be complete */
+	BUG_ON(folio_test_writeback(src));	/* Writeback must be complete */
 
-	rc = folio_migrate_mapping(mapping, newfolio, folio, 0);
+	rc = folio_migrate_mapping(mapping, dst, src, 0);
 
 	if (rc != MIGRATEPAGE_SUCCESS)
 		return rc;
 
 	if (mode != MIGRATE_SYNC_NO_COPY)
-		folio_migrate_copy(newfolio, folio);
+		folio_migrate_copy(dst, src);
 	else
-		folio_migrate_flags(newfolio, folio);
+		folio_migrate_flags(dst, src);
 	return MIGRATEPAGE_SUCCESS;
 }
-EXPORT_SYMBOL(migrate_page);
+EXPORT_SYMBOL(migrate_folio);
 
 #ifdef CONFIG_BLOCK
 /* Returns true if all buffers are successfully locked */
@@ -672,7 +675,7 @@ static int __buffer_migrate_folio(struct address_space *mapping,
 
 	head = folio_buffers(src);
 	if (!head)
-		return migrate_page(mapping, &dst->page, &src->page, mode);
+		return migrate_folio(mapping, dst, src, mode);
 
 	/* Check whether page does not have extra refs before we do more work */
 	expected_count = folio_expected_refs(mapping, src);
@@ -849,7 +852,7 @@ static int fallback_migrate_folio(struct address_space *mapping,
 	    !filemap_release_folio(src, GFP_KERNEL))
 		return mode == MIGRATE_SYNC ? -EAGAIN : -EBUSY;
 
-	return migrate_page(mapping, &dst->page, &src->page, mode);
+	return migrate_folio(mapping, dst, src, mode);
 }
 
 /*
@@ -877,7 +880,7 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
 
 	if (likely(is_lru)) {
 		if (!mapping)
-			rc = migrate_page(mapping, &dst->page, &src->page, mode);
+			rc = migrate_folio(mapping, dst, src, mode);
 		else if (mapping->a_ops->migrate_folio)
 			/*
 			 * Most folios have a mapping and most filesystems
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 5052093d0262..5dd97c39ca6a 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -718,7 +718,8 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 			continue;
 		}
 
-		r = migrate_page(mapping, newpage, page, MIGRATE_SYNC_NO_COPY);
+		r = migrate_folio(mapping, page_folio(newpage),
+				page_folio(page), MIGRATE_SYNC_NO_COPY);
 		if (r != MIGRATEPAGE_SUCCESS)
 			migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
 	}
diff --git a/mm/shmem.c b/mm/shmem.c
index 313ae7df59d8..e37ff6a1a6d0 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -3801,7 +3801,7 @@ const struct address_space_operations shmem_aops = {
 	.write_end	= shmem_write_end,
 #endif
 #ifdef CONFIG_MIGRATION
-	.migratepage	= migrate_page,
+	.migrate_folio	= migrate_folio,
 #endif
 	.error_remove_page = shmem_error_remove_page,
 };
diff --git a/mm/swap_state.c b/mm/swap_state.c
index f5b6f5638908..0a2021fc55ad 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -33,7 +33,7 @@ static const struct address_space_operations swap_aops = {
 	.writepage	= swap_writepage,
 	.dirty_folio	= noop_dirty_folio,
 #ifdef CONFIG_MIGRATION
-	.migratepage	= migrate_page,
+	.migrate_folio	= migrate_folio,
 #endif
 };
 
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
