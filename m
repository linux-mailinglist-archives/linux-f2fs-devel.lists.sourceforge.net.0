Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF04AFD450
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6+gy1TLrOwA//SbMzt/J5WuMjpykfuQ94kVU6mv3bA=; b=Go0CD2W/WVwvONWyaEfZ8wotFE
	AIpy5kyAOchyvU0A+7NU/i99PSA4Qd1octqnwhj6R3O9djE6ggPy04usRK13Rqjoc1CkJLwZwaehJ
	Q7QbvA+8P2uFyAR02ITwfgK1KUIqD9Vj3GJNvusHDuk2FSwIH1QNQBxRciJJvBT80CX0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBk2-0005ZD-9C;
	Tue, 08 Jul 2025 17:04:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjt-0005WF-Rb
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PXBismO1MsbeQ3KnJPnDPRg9GFGpu6j02RXt8LbUDOM=; b=lVtq7tAHRnHGvPI4XYhpJkxpKc
 xDCdn4wKefIonCF92FSEwL0R3jRX/SJJDlP1qp0MBsLxC12UlfzwS8XeRbnGSG4TPlBQ23bMTJaUD
 GMAaTXYhKtHj8WDM7aBIne0yTKYrHuKLu4qxWSGwX6wFhofs0U4+4+k82BgMHUeh3bZc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PXBismO1MsbeQ3KnJPnDPRg9GFGpu6j02RXt8LbUDOM=; b=OZMlYUzJuidusAzHdRWzx02zJZ
 OCA6yKxbNVaDUwBtbRrynemINh78O45QnOj335cJjz83nJW4WIdPeXBnERecw1QAXdPIDCFCCTHo2
 PExqdRVnS8499ddtNp98ZMkwUb8jY3Uo7fkAnH/XLlTs2rsHXdaxRSs7LMwOx4Ph+oPI=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjq-0006Eg-Ms for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=PXBismO1MsbeQ3KnJPnDPRg9GFGpu6j02RXt8LbUDOM=; b=Lcm4aFogtP0OK/pYCgBAU+9+/R
 bBCKRz9lsY+3u91g6Gwo0u2ZpmMequRYmr2KJ/SY3lzdsxETpOLb2eQQEi7fVaSYHrJgIqu8vBXja
 NAcYyKFQ925wb7eaDZp7DXKBv6zrJBtCMjiGeIcCI5O/S/IZouRZeVuwRCEjyEMGIKV5djtPT3qJG
 jt589rPW5g2Ds+4s/LfR/ESQnJK5b0zSi9i9Waw3kyn+ksSFf218PnUoeIpTmCeygge/IsRPg202J
 V/HZocTnqv+kQHpxmVfxNCYpNQ9StiGYaWlY3onF43byPRBJkGRmdoYnfaKz2OGyCyyJQIz+HR4tX
 a+R4SJUw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBji-00000000T78-4AuX;
 Tue, 08 Jul 2025 17:04:07 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:35 +0100
Message-ID: <20250708170359.111653-39-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Name these new functions folio_test_f2fs_*(),
 folio_set_f2fs_*()
 and folio_clear_f2fs_*(). Convert all callers which currently have a folio
 and cast back to a page. Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/checkpoint.c | 4 ++-- fs/f2fs/data.c | 12 ++++++------
 fs/f2fs/f2fs.h
 | 28 ++++++++++++++++++++++++++++ fs/f2fs/file.c | 6 +++- [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uZBjq-0006Eg-Ms
Subject: [f2fs-dev] [PATCH 38/60] f2fs: Add folio counterparts to
 page_private_flags functions
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

Name these new functions folio_test_f2fs_*(), folio_set_f2fs_*() and
folio_clear_f2fs_*().  Convert all callers which currently have a folio
and cast back to a page.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/checkpoint.c |  4 ++--
 fs/f2fs/data.c       | 12 ++++++------
 fs/f2fs/f2fs.h       | 28 ++++++++++++++++++++++++++++
 fs/f2fs/file.c       |  6 +++---
 fs/f2fs/gc.c         |  6 +++---
 fs/f2fs/inline.c     |  4 ++--
 fs/f2fs/inode.c      |  2 +-
 fs/f2fs/node.c       | 10 +++++-----
 8 files changed, 50 insertions(+), 22 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 07ca10c66649..db3831f7f2f5 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -485,7 +485,7 @@ static bool f2fs_dirty_meta_folio(struct address_space *mapping,
 		folio_mark_uptodate(folio);
 	if (filemap_dirty_folio(mapping, folio)) {
 		inc_page_count(F2FS_M_SB(mapping), F2FS_DIRTY_META);
-		set_page_private_reference(&folio->page);
+		folio_set_f2fs_reference(folio);
 		return true;
 	}
 	return false;
@@ -1045,7 +1045,7 @@ void f2fs_update_dirty_folio(struct inode *inode, struct folio *folio)
 	inode_inc_dirty_pages(inode);
 	spin_unlock(&sbi->inode_lock[type]);
 
-	set_page_private_reference(&folio->page);
+	folio_set_f2fs_reference(folio);
 }
 
 void f2fs_remove_dirty_inode(struct inode *inode)
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 8624a4eedd7f..da6e80d70e43 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -360,7 +360,7 @@ static void f2fs_write_end_io(struct bio *bio)
 		dec_page_count(sbi, type);
 		if (f2fs_in_warm_node_list(sbi, folio))
 			f2fs_del_fsync_node_entry(sbi, folio);
-		clear_page_private_gcing(&folio->page);
+		folio_clear_f2fs_gcing(folio);
 		folio_end_writeback(folio);
 	}
 	if (!get_pages(sbi, F2FS_WB_CP_DATA) &&
@@ -2651,7 +2651,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 
 	/* Use COW inode to make dnode_of_data for atomic write */
 	atomic_commit = f2fs_is_atomic_file(inode) &&
-				page_private_atomic(folio_page(folio, 0));
+				folio_test_f2fs_atomic(folio);
 	if (atomic_commit)
 		set_new_dnode(&dn, F2FS_I(inode)->cow_inode, NULL, NULL, 0);
 	else
@@ -2682,7 +2682,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	/* This page is already truncated */
 	if (fio->old_blkaddr == NULL_ADDR) {
 		folio_clear_uptodate(folio);
-		clear_page_private_gcing(folio_page(folio, 0));
+		folio_clear_f2fs_gcing(folio);
 		goto out_writepage;
 	}
 got_it:
@@ -2752,7 +2752,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	trace_f2fs_do_write_data_page(folio, OPU);
 	set_inode_flag(inode, FI_APPEND_WRITE);
 	if (atomic_commit)
-		clear_page_private_atomic(folio_page(folio, 0));
+		folio_clear_f2fs_atomic(folio);
 out_writepage:
 	f2fs_put_dnode(&dn);
 out:
@@ -3375,7 +3375,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 			f2fs_do_read_inline_data(folio, ifolio);
 			set_inode_flag(inode, FI_DATA_EXIST);
 			if (inode->i_nlink)
-				set_page_private_inline(&ifolio->page);
+				folio_set_f2fs_inline(ifolio);
 			goto out;
 		}
 		err = f2fs_convert_inline_folio(&dn, folio);
@@ -3695,7 +3695,7 @@ static int f2fs_write_end(struct file *file,
 	folio_mark_dirty(folio);
 
 	if (f2fs_is_atomic_file(inode))
-		set_page_private_atomic(folio_page(folio, 0));
+		folio_set_f2fs_atomic(folio);
 
 	if (pos + copied > i_size_read(inode) &&
 	    !f2fs_verity_in_progress(inode)) {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f6f566cf065f..02759cd93a3e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2461,6 +2461,13 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
 }
 
 #define PAGE_PRIVATE_GET_FUNC(name, flagname) \
+static inline bool folio_test_f2fs_##name(const struct folio *folio)	\
+{									\
+	unsigned long priv = (unsigned long)folio->private;		\
+	unsigned long v = (1UL << PAGE_PRIVATE_NOT_POINTER) |		\
+			     (1UL << PAGE_PRIVATE_##flagname);		\
+	return (priv & v) == v;						\
+}									\
 static inline bool page_private_##name(struct page *page) \
 { \
 	return PagePrivate(page) && \
@@ -2469,6 +2476,17 @@ static inline bool page_private_##name(struct page *page) \
 }
 
 #define PAGE_PRIVATE_SET_FUNC(name, flagname) \
+static inline void folio_set_f2fs_##name(struct folio *folio)		\
+{									\
+	unsigned long v = (1UL << PAGE_PRIVATE_NOT_POINTER) |		\
+			     (1UL << PAGE_PRIVATE_##flagname);		\
+	if (!folio->private)						\
+		folio_attach_private(folio, (void *)v);			\
+	else {								\
+		v |= (unsigned long)folio->private;			\
+		folio->private = (void *)v;				\
+	}								\
+}									\
 static inline void set_page_private_##name(struct page *page) \
 { \
 	if (!PagePrivate(page)) \
@@ -2478,6 +2496,16 @@ static inline void set_page_private_##name(struct page *page) \
 }
 
 #define PAGE_PRIVATE_CLEAR_FUNC(name, flagname) \
+static inline void folio_clear_f2fs_##name(struct folio *folio)		\
+{									\
+	unsigned long v = (unsigned long)folio->private;		\
+									\
+	v &= ~(1UL << PAGE_PRIVATE_##flagname);				\
+	if (v == (1UL << PAGE_PRIVATE_NOT_POINTER))			\
+		folio_detach_private(folio);				\
+	else								\
+		folio->private = (void *)v;				\
+}									\
 static inline void clear_page_private_##name(struct page *page) \
 { \
 	clear_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 8995b128c29c..5b8614db3faa 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1453,7 +1453,7 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 
 			memcpy_folio(fdst, 0, fsrc, 0, PAGE_SIZE);
 			folio_mark_dirty(fdst);
-			set_page_private_gcing(&fdst->page);
+			folio_set_f2fs_gcing(fdst);
 			f2fs_folio_put(fdst, true);
 			f2fs_folio_put(fsrc, true);
 
@@ -2977,7 +2977,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 			f2fs_folio_wait_writeback(folio, DATA, true, true);
 
 			folio_mark_dirty(folio);
-			set_page_private_gcing(&folio->page);
+			folio_set_f2fs_gcing(folio);
 			f2fs_folio_put(folio, true);
 
 			idx++;
@@ -4414,7 +4414,7 @@ static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
 		f2fs_folio_wait_writeback(folio, DATA, true, true);
 
 		folio_mark_dirty(folio);
-		set_page_private_gcing(&folio->page);
+		folio_set_f2fs_gcing(folio);
 		redirty_idx = folio_next_index(folio);
 		folio_unlock(folio);
 		folio_put_refs(folio, 2);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 58977f05f3b3..1ed43015ca50 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1473,7 +1473,7 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 			goto out;
 		}
 		folio_mark_dirty(folio);
-		set_page_private_gcing(&folio->page);
+		folio_set_f2fs_gcing(folio);
 	} else {
 		struct f2fs_io_info fio = {
 			.sbi = F2FS_I_SB(inode),
@@ -1499,11 +1499,11 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 			f2fs_remove_dirty_inode(inode);
 		}
 
-		set_page_private_gcing(&folio->page);
+		folio_set_f2fs_gcing(folio);
 
 		err = f2fs_do_write_data_page(&fio);
 		if (err) {
-			clear_page_private_gcing(&folio->page);
+			folio_clear_f2fs_gcing(folio);
 			if (err == -ENOMEM) {
 				memalloc_retry_wait(GFP_NOFS);
 				goto retry;
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 51adc43d5a5c..58ac831ef704 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -206,7 +206,7 @@ int f2fs_convert_inline_folio(struct dnode_of_data *dn, struct folio *folio)
 
 	/* clear inline data and flag after data writeback */
 	f2fs_truncate_inline_inode(dn->inode, dn->inode_folio, 0);
-	clear_page_private_inline(&dn->inode_folio->page);
+	folio_clear_f2fs_inline(dn->inode_folio);
 clear_out:
 	stat_dec_inline_inode(dn->inode);
 	clear_inode_flag(dn->inode, FI_INLINE_DATA);
@@ -286,7 +286,7 @@ int f2fs_write_inline_data(struct inode *inode, struct folio *folio)
 	set_inode_flag(inode, FI_APPEND_WRITE);
 	set_inode_flag(inode, FI_DATA_EXIST);
 
-	clear_page_private_inline(&ifolio->page);
+	folio_clear_f2fs_inline(ifolio);
 	f2fs_folio_put(ifolio, 1);
 	return 0;
 }
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 9d532ae131d7..c9afdce75a7f 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -749,7 +749,7 @@ void f2fs_update_inode(struct inode *inode, struct folio *node_folio)
 
 	/* deleted inode */
 	if (inode->i_nlink == 0)
-		clear_page_private_inline(&node_folio->page);
+		folio_clear_f2fs_inline(node_folio);
 
 	init_idisk_time(inode);
 #ifdef CONFIG_F2FS_CHECK_FS
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index edc9c57daebd..ab534557a80e 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1985,8 +1985,8 @@ void f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
 				goto unlock;
 
 			/* flush inline_data, if it's async context. */
-			if (page_private_inline(&folio->page)) {
-				clear_page_private_inline(&folio->page);
+			if (folio_test_f2fs_inline(folio)) {
+				folio_clear_f2fs_inline(folio);
 				folio_unlock(folio);
 				flush_inline_data(sbi, ino_of_node(folio));
 				continue;
@@ -2067,8 +2067,8 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 				goto write_node;
 
 			/* flush inline_data */
-			if (page_private_inline(&folio->page)) {
-				clear_page_private_inline(&folio->page);
+			if (folio_test_f2fs_inline(folio)) {
+				folio_clear_f2fs_inline(folio);
 				folio_unlock(folio);
 				flush_inline_data(sbi, ino_of_node(folio));
 				goto lock_node;
@@ -2216,7 +2216,7 @@ static bool f2fs_dirty_node_folio(struct address_space *mapping,
 #endif
 	if (filemap_dirty_folio(mapping, folio)) {
 		inc_page_count(F2FS_M_SB(mapping), F2FS_DIRTY_NODES);
-		set_page_private_reference(&folio->page);
+		folio_set_f2fs_reference(folio);
 		return true;
 	}
 	return false;
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
