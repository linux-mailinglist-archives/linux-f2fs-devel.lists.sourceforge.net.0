Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B65A553F039
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jun 2022 22:41:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nyJXa-0004Qn-Dw; Mon, 06 Jun 2022 20:41:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>)
 id 1nyJXP-0004OC-CT; Mon, 06 Jun 2022 20:41:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kE0e2Kem5Koy9+vslnILU6wEa1eL+hykAc5m9l3vWOk=; b=QpneCfvcgGEG0oeFz7WwNhh10I
 4yLtaUDfQc9odyXGEYPEj8mra8sYluA9T2PWWHATL7TJIzkQJEGMKcdTZQebnVxEUd0JD31QoUwoy
 s4znISGq7IMYNRL7CRSTpKR6XNE7uUHGRxtUGGLI3UrpTUBdRf0kPGuYhVgn71IvWdVw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kE0e2Kem5Koy9+vslnILU6wEa1eL+hykAc5m9l3vWOk=; b=Zytd5+g3O+GE/6XgvHWYBQaUbB
 nHc3ujldt0qJMq2REQyAnTg67S3Xlu9sJmOA9eUaf854QJw75uEoxszRM1+TWtkl9gwEagXoG/8Yb
 QHi2X6uzlKcEEei+M2/lDb0z5U4K+gfknRtQIpIxqyp+3JrvFNakJrBDsR13RdWFi2wU=;
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nyJXL-007Q0p-QG; Mon, 06 Jun 2022 20:41:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=kE0e2Kem5Koy9+vslnILU6wEa1eL+hykAc5m9l3vWOk=; b=ZoXiXG9BhM3nKy91XF85EEhCmA
 x+0+yDgen/JSqUZUOVrwHT2sFkEanrz3b2SRuNhvzkelnmhYQHo3H5w/lxp1m923om6t4J7ZBUl8z
 pqKeMISVHEu+agUZTchcA5vX6IHgvtaY6xD0zwlwV/HMr83Qrrmrw9nOYpeT9HsqSYa9t3+G8ito5
 +M1oHyKTE0ou+70T4p6ln1KzUCbrPs+Utdwzu5MZlydpjTnq7ZPCSNY9IZnONucAQSNa3TpoQh/zU
 mT3rM0C0mKEd0upHPAairhB+80Ltbs64qeDsd1SFTpgmwfYyIdteGzVQaO27TBq0NroBwtsgwigi6
 jlonzS1Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyJWw-00B19J-Kl; Mon, 06 Jun 2022 20:40:54 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon,  6 Jun 2022 21:40:31 +0100
Message-Id: <20220606204050.2625949-2-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220606204050.2625949-1-willy@infradead.org>
References: <20220606204050.2625949-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Provide a folio-based replacement for aops->migratepage.
 Update
 the documentation to document migrate_folio instead of migratepage.
 Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 Documentation/filesystems/locking.rst
 | 5 ++-- Documentation/filesystems/vfs.rst | 13 ++++++-----
 Documentation/vm/page_migration.rst | [...] 
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nyJXL-007Q0p-QG
Subject: [f2fs-dev] [PATCH 01/20] fs: Add aops->migrate_folio
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

Provide a folio-based replacement for aops->migratepage.  Update the
documentation to document migrate_folio instead of migratepage.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 Documentation/filesystems/locking.rst |  5 ++--
 Documentation/filesystems/vfs.rst     | 13 ++++++-----
 Documentation/vm/page_migration.rst   | 33 ++++++++++++++-------------
 include/linux/fs.h                    |  4 +++-
 mm/compaction.c                       |  4 +++-
 mm/migrate.c                          | 19 ++++++++++-----
 6 files changed, 46 insertions(+), 32 deletions(-)

diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
index c0fe711f14d3..3d28b23676bd 100644
--- a/Documentation/filesystems/locking.rst
+++ b/Documentation/filesystems/locking.rst
@@ -253,7 +253,8 @@ prototypes::
 	void (*free_folio)(struct folio *);
 	int (*direct_IO)(struct kiocb *, struct iov_iter *iter);
 	bool (*isolate_page) (struct page *, isolate_mode_t);
-	int (*migratepage)(struct address_space *, struct page *, struct page *);
+	int (*migrate_folio)(struct address_space *, struct folio *dst,
+			struct folio *src, enum migrate_mode);
 	void (*putback_page) (struct page *);
 	int (*launder_folio)(struct folio *);
 	bool (*is_partially_uptodate)(struct folio *, size_t from, size_t count);
@@ -281,7 +282,7 @@ release_folio:		yes
 free_folio:		yes
 direct_IO:
 isolate_page:		yes
-migratepage:		yes (both)
+migrate_folio:		yes (both)
 putback_page:		yes
 launder_folio:		yes
 is_partially_uptodate:	yes
diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
index a08c652467d7..3ae1b039b03f 100644
--- a/Documentation/filesystems/vfs.rst
+++ b/Documentation/filesystems/vfs.rst
@@ -740,7 +740,8 @@ cache in your filesystem.  The following members are defined:
 		/* isolate a page for migration */
 		bool (*isolate_page) (struct page *, isolate_mode_t);
 		/* migrate the contents of a page to the specified target */
-		int (*migratepage) (struct page *, struct page *);
+		int (*migrate_folio)(struct mapping *, struct folio *dst,
+				struct folio *src, enum migrate_mode);
 		/* put migration-failed page back to right list */
 		void (*putback_page) (struct page *);
 		int (*launder_folio) (struct folio *);
@@ -935,12 +936,12 @@ cache in your filesystem.  The following members are defined:
 	is successfully isolated, VM marks the page as PG_isolated via
 	__SetPageIsolated.
 
-``migrate_page``
+``migrate_folio``
 	This is used to compact the physical memory usage.  If the VM
-	wants to relocate a page (maybe off a memory card that is
-	signalling imminent failure) it will pass a new page and an old
-	page to this function.  migrate_page should transfer any private
-	data across and update any references that it has to the page.
+	wants to relocate a folio (maybe from a memory device that is
+	signalling imminent failure) it will pass a new folio and an old
+	folio to this function.  migrate_folio should transfer any private
+	data across and update any references that it has to the folio.
 
 ``putback_page``
 	Called by the VM when isolated page's migration fails.
diff --git a/Documentation/vm/page_migration.rst b/Documentation/vm/page_migration.rst
index 8c5cb8147e55..e0f73ddfabb1 100644
--- a/Documentation/vm/page_migration.rst
+++ b/Documentation/vm/page_migration.rst
@@ -181,22 +181,23 @@ which are function pointers of struct address_space_operations.
    Once page is successfully isolated, VM uses page.lru fields so driver
    shouldn't expect to preserve values in those fields.
 
-2. ``int (*migratepage) (struct address_space *mapping,``
-|	``struct page *newpage, struct page *oldpage, enum migrate_mode);``
-
-   After isolation, VM calls migratepage() of driver with the isolated page.
-   The function of migratepage() is to move the contents of the old page to the
-   new page
-   and set up fields of struct page newpage. Keep in mind that you should
-   indicate to the VM the oldpage is no longer movable via __ClearPageMovable()
-   under page_lock if you migrated the oldpage successfully and returned
-   MIGRATEPAGE_SUCCESS. If driver cannot migrate the page at the moment, driver
-   can return -EAGAIN. On -EAGAIN, VM will retry page migration in a short time
-   because VM interprets -EAGAIN as "temporary migration failure". On returning
-   any error except -EAGAIN, VM will give up the page migration without
-   retrying.
-
-   Driver shouldn't touch the page.lru field while in the migratepage() function.
+2. ``int (*migrate_folio) (struct address_space *mapping,``
+|	``struct folio *dst, struct folio *src, enum migrate_mode);``
+
+   After isolation, VM calls the driver's migrate_folio() with the
+   isolated folio.  The purpose of migrate_folio() is to move the contents
+   of the source folio to the destination folio and set up the fields
+   of destination folio.  Keep in mind that you should indicate to the
+   VM the source folio is no longer movable via __ClearPageMovable()
+   under folio if you migrated the source successfully and returned
+   MIGRATEPAGE_SUCCESS.  If driver cannot migrate the folio at the
+   moment, driver can return -EAGAIN. On -EAGAIN, VM will retry folio
+   migration in a short time because VM interprets -EAGAIN as "temporary
+   migration failure".  On returning any error except -EAGAIN, VM will
+   give up the folio migration without retrying.
+
+   Driver shouldn't touch the folio.lru field while in the migrate_folio()
+   function.
 
 3. ``void (*putback_page)(struct page *);``
 
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 9ad5e3520fae..7b380fa66983 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -362,9 +362,11 @@ struct address_space_operations {
 	void (*free_folio)(struct folio *folio);
 	ssize_t (*direct_IO)(struct kiocb *, struct iov_iter *iter);
 	/*
-	 * migrate the contents of a page to the specified target. If
+	 * migrate the contents of a folio to the specified target. If
 	 * migrate_mode is MIGRATE_ASYNC, it must not block.
 	 */
+	int (*migrate_folio)(struct address_space *, struct folio *dst,
+			struct folio *src, enum migrate_mode);
 	int (*migratepage) (struct address_space *,
 			struct page *, struct page *, enum migrate_mode);
 	bool (*isolate_page)(struct page *, isolate_mode_t);
diff --git a/mm/compaction.c b/mm/compaction.c
index 1f89b969c12b..db34b459e5d9 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1045,7 +1045,9 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 				goto isolate_fail_put;
 
 			mapping = page_mapping(page);
-			migrate_dirty = !mapping || mapping->a_ops->migratepage;
+			migrate_dirty = !mapping ||
+					mapping->a_ops->migrate_folio ||
+					mapping->a_ops->migratepage;
 			unlock_page(page);
 			if (!migrate_dirty)
 				goto isolate_fail_put;
diff --git a/mm/migrate.c b/mm/migrate.c
index e51588e95f57..75cb6aa38988 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -858,14 +858,17 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
 	if (likely(is_lru)) {
 		if (!mapping)
 			rc = migrate_page(mapping, &dst->page, &src->page, mode);
-		else if (mapping->a_ops->migratepage)
+		else if (mapping->a_ops->migrate_folio)
 			/*
-			 * Most pages have a mapping and most filesystems
-			 * provide a migratepage callback. Anonymous pages
+			 * Most folios have a mapping and most filesystems
+			 * provide a migrate_folio callback. Anonymous folios
 			 * are part of swap space which also has its own
-			 * migratepage callback. This is the most common path
+			 * migrate_folio callback. This is the most common path
 			 * for page migration.
 			 */
+			rc = mapping->a_ops->migrate_folio(mapping, dst, src,
+								mode);
+		else if (mapping->a_ops->migratepage)
 			rc = mapping->a_ops->migratepage(mapping, &dst->page,
 							&src->page, mode);
 		else
@@ -883,8 +886,12 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
 			goto out;
 		}
 
-		rc = mapping->a_ops->migratepage(mapping, &dst->page,
-						&src->page, mode);
+		if (mapping->a_ops->migrate_folio)
+			rc = mapping->a_ops->migrate_folio(mapping, dst, src,
+								mode);
+		else
+			rc = mapping->a_ops->migratepage(mapping, &dst->page,
+							&src->page, mode);
 		WARN_ON_ONCE(rc == MIGRATEPAGE_SUCCESS &&
 				!folio_test_isolated(src));
 	}
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
