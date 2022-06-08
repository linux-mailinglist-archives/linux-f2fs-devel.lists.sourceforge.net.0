Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3EE5435EF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jun 2022 17:03:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nyxDg-0003Ee-Bt; Wed, 08 Jun 2022 15:03:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>)
 id 1nyxDc-0003C4-8d; Wed, 08 Jun 2022 15:03:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LQ6sNBHr75tM+bJ1BpDjSqem3+pLGhgLRwy7i2aOU6Y=; b=N2Qlv60AwTiquX+dfIeyR2NmIP
 xcvE75f5O+cqj0B5TIicef0R7iNE5X2C4vEtTfUig806CkyhLnMFvISk2JBw9JSvuvR5dhc84XzFA
 R/MWXtAkXcdJjlqnYU7FzutKf8bfmb6EEDcuLiuye7t/KNv0usoQOHQCsA+G8gtgocX0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LQ6sNBHr75tM+bJ1BpDjSqem3+pLGhgLRwy7i2aOU6Y=; b=adsvS6jNgZu+GQYUSsz4I6MmUD
 x7QXArkjyLWpuSNft8ByS80rbz6jHJ4a/zVS2zCjuwnd9tchIFgHbEdWaMfdKMD6zZgC3SLWn2PMi
 YZ/INiPSpL+Ro6KTrGa4NlhLgfV9CmjuOvb1ZAwNQ9DsWL0xEkixYGVpeblVeic25XjQ=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nyxDZ-009y0S-HU; Wed, 08 Jun 2022 15:03:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=LQ6sNBHr75tM+bJ1BpDjSqem3+pLGhgLRwy7i2aOU6Y=; b=Tdl7Vy7/bS7YUA6mx6+jHtRUCX
 eRx+GVhSe9l35Jy6XQ4NY5cbVzQOoht+6EwkvzS+FYXJGjIed/shYXcsq39K1Ku6w2b59jc7rB4RL
 T6I2VMDHBOb1Jq/k7WDXHO1/Y3wcfRPY+OwsnbStciOqAnJtMjuVoCXp6jwXexKgNaEdpONswZdY3
 IfVqt3vm8g55BzHQkGY9kMEHS/RynrXo0lZoHsYG5H2c+x3KOeVyJvIQu4/NvOHj9PAOKh1C+gg2L
 AK6FXUvhjy0znRrM/z5+iY7ADDuXlH9PJw+4I3iFoHT0rOWevtAKgZ2XvCn01XmFdy19SlpiRmhBq
 31qn6SvA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyxCu-00CjFQ-At; Wed, 08 Jun 2022 15:02:52 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  8 Jun 2022 16:02:36 +0100
Message-Id: <20220608150249.3033815-7-willy@infradead.org>
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
 Content preview:  Use a folio throughout __buffer_migrate_folio(),
 add kernel-doc
 for buffer_migrate_folio() and buffer_migrate_folio_norefs(), move their
 declarations to buffer.h and switch all filesystems that have w [...] 
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
X-Headers-End: 1nyxDZ-009y0S-HU
Subject: [f2fs-dev] [PATCH v2 06/19] mm/migrate: Convert
 buffer_migrate_page() to buffer_migrate_folio()
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

Use a folio throughout __buffer_migrate_folio(), add kernel-doc for
buffer_migrate_folio() and buffer_migrate_folio_norefs(), move their
declarations to buffer.h and switch all filesystems that have wired
them up.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 block/fops.c                |  2 +-
 fs/ext2/inode.c             |  4 +-
 fs/ext4/inode.c             |  4 +-
 fs/ntfs/aops.c              |  6 +--
 fs/ocfs2/aops.c             |  2 +-
 include/linux/buffer_head.h | 10 +++++
 include/linux/fs.h          | 12 ------
 mm/migrate.c                | 76 ++++++++++++++++++++++---------------
 8 files changed, 65 insertions(+), 51 deletions(-)

diff --git a/block/fops.c b/block/fops.c
index d6b3276a6c68..743fc46d0aad 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -417,7 +417,7 @@ const struct address_space_operations def_blk_aops = {
 	.write_end	= blkdev_write_end,
 	.writepages	= blkdev_writepages,
 	.direct_IO	= blkdev_direct_IO,
-	.migratepage	= buffer_migrate_page_norefs,
+	.migrate_folio	= buffer_migrate_folio_norefs,
 	.is_dirty_writeback = buffer_check_dirty_writeback,
 };
 
diff --git a/fs/ext2/inode.c b/fs/ext2/inode.c
index 360ce3604a2d..84570c6265aa 100644
--- a/fs/ext2/inode.c
+++ b/fs/ext2/inode.c
@@ -973,7 +973,7 @@ const struct address_space_operations ext2_aops = {
 	.bmap			= ext2_bmap,
 	.direct_IO		= ext2_direct_IO,
 	.writepages		= ext2_writepages,
-	.migratepage		= buffer_migrate_page,
+	.migrate_folio		= buffer_migrate_folio,
 	.is_partially_uptodate	= block_is_partially_uptodate,
 	.error_remove_page	= generic_error_remove_page,
 };
@@ -989,7 +989,7 @@ const struct address_space_operations ext2_nobh_aops = {
 	.bmap			= ext2_bmap,
 	.direct_IO		= ext2_direct_IO,
 	.writepages		= ext2_writepages,
-	.migratepage		= buffer_migrate_page,
+	.migrate_folio		= buffer_migrate_folio,
 	.error_remove_page	= generic_error_remove_page,
 };
 
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 1aaea53e67b5..53877ffe3c41 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3633,7 +3633,7 @@ static const struct address_space_operations ext4_aops = {
 	.invalidate_folio	= ext4_invalidate_folio,
 	.release_folio		= ext4_release_folio,
 	.direct_IO		= noop_direct_IO,
-	.migratepage		= buffer_migrate_page,
+	.migrate_folio		= buffer_migrate_folio,
 	.is_partially_uptodate  = block_is_partially_uptodate,
 	.error_remove_page	= generic_error_remove_page,
 	.swap_activate		= ext4_iomap_swap_activate,
@@ -3668,7 +3668,7 @@ static const struct address_space_operations ext4_da_aops = {
 	.invalidate_folio	= ext4_invalidate_folio,
 	.release_folio		= ext4_release_folio,
 	.direct_IO		= noop_direct_IO,
-	.migratepage		= buffer_migrate_page,
+	.migrate_folio		= buffer_migrate_folio,
 	.is_partially_uptodate  = block_is_partially_uptodate,
 	.error_remove_page	= generic_error_remove_page,
 	.swap_activate		= ext4_iomap_swap_activate,
diff --git a/fs/ntfs/aops.c b/fs/ntfs/aops.c
index 9e3964ea2ea0..5f4fb6ca6f2e 100644
--- a/fs/ntfs/aops.c
+++ b/fs/ntfs/aops.c
@@ -1659,7 +1659,7 @@ const struct address_space_operations ntfs_normal_aops = {
 	.dirty_folio	= block_dirty_folio,
 #endif /* NTFS_RW */
 	.bmap		= ntfs_bmap,
-	.migratepage	= buffer_migrate_page,
+	.migrate_folio	= buffer_migrate_folio,
 	.is_partially_uptodate = block_is_partially_uptodate,
 	.error_remove_page = generic_error_remove_page,
 };
@@ -1673,7 +1673,7 @@ const struct address_space_operations ntfs_compressed_aops = {
 	.writepage	= ntfs_writepage,
 	.dirty_folio	= block_dirty_folio,
 #endif /* NTFS_RW */
-	.migratepage	= buffer_migrate_page,
+	.migrate_folio	= buffer_migrate_folio,
 	.is_partially_uptodate = block_is_partially_uptodate,
 	.error_remove_page = generic_error_remove_page,
 };
@@ -1688,7 +1688,7 @@ const struct address_space_operations ntfs_mst_aops = {
 	.writepage	= ntfs_writepage,	/* Write dirty page to disk. */
 	.dirty_folio	= filemap_dirty_folio,
 #endif /* NTFS_RW */
-	.migratepage	= buffer_migrate_page,
+	.migrate_folio	= buffer_migrate_folio,
 	.is_partially_uptodate	= block_is_partially_uptodate,
 	.error_remove_page = generic_error_remove_page,
 };
diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
index 767df51f8657..1d489003f99d 100644
--- a/fs/ocfs2/aops.c
+++ b/fs/ocfs2/aops.c
@@ -2462,7 +2462,7 @@ const struct address_space_operations ocfs2_aops = {
 	.direct_IO		= ocfs2_direct_IO,
 	.invalidate_folio	= block_invalidate_folio,
 	.release_folio		= ocfs2_release_folio,
-	.migratepage		= buffer_migrate_page,
+	.migrate_folio		= buffer_migrate_folio,
 	.is_partially_uptodate	= block_is_partially_uptodate,
 	.error_remove_page	= generic_error_remove_page,
 };
diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
index c9d1463bb20f..b0366c89d6a4 100644
--- a/include/linux/buffer_head.h
+++ b/include/linux/buffer_head.h
@@ -267,6 +267,16 @@ int nobh_truncate_page(struct address_space *, loff_t, get_block_t *);
 int nobh_writepage(struct page *page, get_block_t *get_block,
                         struct writeback_control *wbc);
 
+#ifdef CONFIG_MIGRATION
+extern int buffer_migrate_folio(struct address_space *,
+		struct folio *dst, struct folio *src, enum migrate_mode);
+extern int buffer_migrate_folio_norefs(struct address_space *,
+		struct folio *dst, struct folio *src, enum migrate_mode);
+#else
+#define buffer_migrate_folio NULL
+#define buffer_migrate_folio_norefs NULL
+#endif
+
 void buffer_init(void);
 
 /*
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 47431cf8fbb3..9e6b17da4e11 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3215,18 +3215,6 @@ extern int generic_check_addressable(unsigned, u64);
 
 extern void generic_set_encrypted_ci_d_ops(struct dentry *dentry);
 
-#ifdef CONFIG_MIGRATION
-extern int buffer_migrate_page(struct address_space *,
-				struct page *, struct page *,
-				enum migrate_mode);
-extern int buffer_migrate_page_norefs(struct address_space *,
-				struct page *, struct page *,
-				enum migrate_mode);
-#else
-#define buffer_migrate_page NULL
-#define buffer_migrate_page_norefs NULL
-#endif
-
 int may_setattr(struct user_namespace *mnt_userns, struct inode *inode,
 		unsigned int ia_valid);
 int setattr_prepare(struct user_namespace *, struct dentry *, struct iattr *);
diff --git a/mm/migrate.c b/mm/migrate.c
index 6b6fec26f4d0..2975f0c4d7cf 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -656,23 +656,23 @@ static bool buffer_migrate_lock_buffers(struct buffer_head *head,
 	return true;
 }
 
-static int __buffer_migrate_page(struct address_space *mapping,
-		struct page *newpage, struct page *page, enum migrate_mode mode,
+static int __buffer_migrate_folio(struct address_space *mapping,
+		struct folio *dst, struct folio *src, enum migrate_mode mode,
 		bool check_refs)
 {
 	struct buffer_head *bh, *head;
 	int rc;
 	int expected_count;
 
-	if (!page_has_buffers(page))
-		return migrate_page(mapping, newpage, page, mode);
+	head = folio_buffers(src);
+	if (!head)
+		return migrate_page(mapping, &dst->page, &src->page, mode);
 
 	/* Check whether page does not have extra refs before we do more work */
-	expected_count = expected_page_refs(mapping, page);
-	if (page_count(page) != expected_count)
+	expected_count = expected_page_refs(mapping, &src->page);
+	if (folio_ref_count(src) != expected_count)
 		return -EAGAIN;
 
-	head = page_buffers(page);
 	if (!buffer_migrate_lock_buffers(head, mode))
 		return -EAGAIN;
 
@@ -703,23 +703,22 @@ static int __buffer_migrate_page(struct address_space *mapping,
 		}
 	}
 
-	rc = migrate_page_move_mapping(mapping, newpage, page, 0);
+	rc = folio_migrate_mapping(mapping, dst, src, 0);
 	if (rc != MIGRATEPAGE_SUCCESS)
 		goto unlock_buffers;
 
-	attach_page_private(newpage, detach_page_private(page));
+	folio_attach_private(dst, folio_detach_private(src));
 
 	bh = head;
 	do {
-		set_bh_page(bh, newpage, bh_offset(bh));
+		set_bh_page(bh, &dst->page, bh_offset(bh));
 		bh = bh->b_this_page;
-
 	} while (bh != head);
 
 	if (mode != MIGRATE_SYNC_NO_COPY)
-		migrate_page_copy(newpage, page);
+		folio_migrate_copy(dst, src);
 	else
-		migrate_page_states(newpage, page);
+		folio_migrate_flags(dst, src);
 
 	rc = MIGRATEPAGE_SUCCESS;
 unlock_buffers:
@@ -729,34 +728,51 @@ static int __buffer_migrate_page(struct address_space *mapping,
 	do {
 		unlock_buffer(bh);
 		bh = bh->b_this_page;
-
 	} while (bh != head);
 
 	return rc;
 }
 
-/*
- * Migration function for pages with buffers. This function can only be used
- * if the underlying filesystem guarantees that no other references to "page"
- * exist. For example attached buffer heads are accessed only under page lock.
+/**
+ * buffer_migrate_folio() - Migration function for folios with buffers.
+ * @mapping: The address space containing @src.
+ * @dst: The folio to migrate to.
+ * @src: The folio to migrate from.
+ * @mode: How to migrate the folio.
+ *
+ * This function can only be used if the underlying filesystem guarantees
+ * that no other references to @src exist. For example attached buffer
+ * heads are accessed only under the folio lock.  If your filesystem cannot
+ * provide this guarantee, buffer_migrate_folio_norefs() may be more
+ * appropriate.
+ *
+ * Return: 0 on success or a negative errno on failure.
  */
-int buffer_migrate_page(struct address_space *mapping,
-		struct page *newpage, struct page *page, enum migrate_mode mode)
+int buffer_migrate_folio(struct address_space *mapping,
+		struct folio *dst, struct folio *src, enum migrate_mode mode)
 {
-	return __buffer_migrate_page(mapping, newpage, page, mode, false);
+	return __buffer_migrate_folio(mapping, dst, src, mode, false);
 }
-EXPORT_SYMBOL(buffer_migrate_page);
+EXPORT_SYMBOL(buffer_migrate_folio);
 
-/*
- * Same as above except that this variant is more careful and checks that there
- * are also no buffer head references. This function is the right one for
- * mappings where buffer heads are directly looked up and referenced (such as
- * block device mappings).
+/**
+ * buffer_migrate_folio_norefs() - Migration function for folios with buffers.
+ * @mapping: The address space containing @src.
+ * @dst: The folio to migrate to.
+ * @src: The folio to migrate from.
+ * @mode: How to migrate the folio.
+ *
+ * Like buffer_migrate_folio() except that this variant is more careful
+ * and checks that there are also no buffer head references. This function
+ * is the right one for mappings where buffer heads are directly looked
+ * up and referenced (such as block device mappings).
+ *
+ * Return: 0 on success or a negative errno on failure.
  */
-int buffer_migrate_page_norefs(struct address_space *mapping,
-		struct page *newpage, struct page *page, enum migrate_mode mode)
+int buffer_migrate_folio_norefs(struct address_space *mapping,
+		struct folio *dst, struct folio *src, enum migrate_mode mode)
 {
-	return __buffer_migrate_page(mapping, newpage, page, mode, true);
+	return __buffer_migrate_folio(mapping, dst, src, mode, true);
 }
 #endif
 
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
