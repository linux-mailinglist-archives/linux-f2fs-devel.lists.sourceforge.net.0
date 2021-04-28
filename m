Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED8A36D4AA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Apr 2021 11:21:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lbgNX-0007Xh-Hi; Wed, 28 Apr 2021 09:21:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lbgNV-0007XY-Ef
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Apr 2021 09:21:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S0mDRLDYhzAmH10MyUIdKq09rcrTbnzfRDXB6nWKZgo=; b=eMlih9b5ncm3UCwkEpwcjZjerL
 RATrvVIxhXQIcL0bNBzk8+0lYgDZz9AY0sUgeMrMzKOUNdwsd0KyG/9xV0XoYvqzaqSHlFrJHOltn
 fvssEk6U9hw1pcpJnBn3LMhoDqBJXru8trkTdNPu2WhG93mc9qVzrldUrWBoIX2DBliQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=S0mDRLDYhzAmH10MyUIdKq09rcrTbnzfRDXB6nWKZgo=; b=e
 MXHZ0jf1HLziwapGj7xS85x0j04Az9zdg87Nkfi6ingacSAi9RZfHE6sTWviEnrLBK+dIbpu42hmO
 Lo819RYRB1nZfNInDvR3E9lVxjp3tb8F2mgDO6yxELffdvpioxliZLbulWsHFnOxNkscm11hzXilU
 V5IuhID/mKL9By64=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lbgNP-003N5q-4f
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Apr 2021 09:21:06 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FVY2g0dlzz7xVw;
 Wed, 28 Apr 2021 17:18:19 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Wed, 28 Apr 2021 17:20:38 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 28 Apr 2021 17:20:31 +0800
Message-ID: <20210428092031.2126-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lbgNP-003N5q-4f
Subject: [f2fs-dev] [PATCH v2] f2fs: restructure f2fs page.private layout
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
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Restruct f2fs page private layout for below reasons:

There are some cases that f2fs wants to set a flag in a page to
indicate a specified status of page:
a) page is in transaction list for atomic write
b) page contains dummy data for aligned write
c) page is migrating for GC
d) page contains inline data for inline inode flush
e) page belongs to merkle tree, and is verified for fsverity
f) page is dirty and has filesystem/inode reference count for writeback
g) page is temporary and has decompress io context reference for compression

There are existed places in page structure we can use to store
f2fs private status/data:
- page.flags: PG_checked, PG_private
- page.private

However it was a mess when we using them, which may cause potential
confliction:
		page.private	PG_private	PG_checked	page._refcount (+1 at most)
a)		-1		set				+1
b)		-2		set
c), d), e)					set
f)		0		set				+1
g)		pointer		set

The other problem is page.flags has no free slot, if we can avoid set
zero to page.private and set PG_private flag, then we use non-zero value
to indicate PG_private status, so that we may have chance to reclaim
PG_private slot for other usage. [1]

The other concern is f2fs has bad scalability in aspect of indicating
more page status.

So in this patch, let's restructure f2fs' page.private as below to
solve above issues:

Layout A: lowest bit should be 1
| bit0 = 1 | bit1 | bit2 | ... | bit MAX | private data .... |
 bit 0	PAGE_PRIVATE_NOT_POINTER
 bit 1	PAGE_PRIVATE_ATOMIC_WRITE
 bit 2	PAGE_PRIVATE_DUMMY_WRITE
 bit 3	PAGE_PRIVATE_ONGOING_MIGRATION
 bit 4	PAGE_PRIVATE_INLINE_INODE
 bit 5	PAGE_PRIVATE_REF_RESOURCE
 bit 6-	f2fs private data

Layout B: lowest bit should be 0
 page.private is a wrapped pointer.

After the change:
		page.private	PG_private	PG_checked	page._refcount (+1 at most)
a)		11		set				+1
b)		101		set				+1
c)		1001		set				+1
d)		10001		set				+1
e)						set
f)		100001		set				+1
g)		pointer		set				+1

[1] https://lore.kernel.org/linux-f2fs-devel/20210422154705.GO3596236@casper.infradead.org/T/#u

Cc: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- fix wrong commit message about PG_private bit status of b) case
- clean up to avoid duplicated codes
- set PG_private and add refcount for all a), b), c), d), f), g) case
- update f) case description
 fs/f2fs/checkpoint.c |  4 +-
 fs/f2fs/compress.c   | 10 ++---
 fs/f2fs/data.c       | 65 ++++++++++++++++-------------
 fs/f2fs/dir.c        |  8 +++-
 fs/f2fs/f2fs.h       | 98 ++++++++++++++++++++++++++++++++++----------
 fs/f2fs/gc.c         |  6 +--
 fs/f2fs/inline.c     |  4 +-
 fs/f2fs/inode.c      |  2 +-
 fs/f2fs/node.c       | 10 ++---
 fs/f2fs/node.h       | 29 -------------
 fs/f2fs/segment.c    | 19 +++++----
 11 files changed, 146 insertions(+), 109 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 817d0bcb5c67..dbb6b21da2ef 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -444,7 +444,7 @@ static int f2fs_set_meta_page_dirty(struct page *page)
 	if (!PageDirty(page)) {
 		__set_page_dirty_nobuffers(page);
 		inc_page_count(F2FS_P_SB(page), F2FS_DIRTY_META);
-		f2fs_set_page_private(page, 0);
+		set_page_private_reference(page);
 		return 1;
 	}
 	return 0;
@@ -1018,7 +1018,7 @@ void f2fs_update_dirty_page(struct inode *inode, struct page *page)
 	inode_inc_dirty_pages(inode);
 	spin_unlock(&sbi->inode_lock[type]);
 
-	f2fs_set_page_private(page, 0);
+	set_page_private_reference(page);
 }
 
 void f2fs_remove_dirty_inode(struct inode *inode)
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 53f78befed8f..ce7f30ef374e 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -74,7 +74,7 @@ bool f2fs_is_compressed_page(struct page *page)
 		return false;
 	if (!page_private(page))
 		return false;
-	if (IS_ATOMIC_WRITTEN_PAGE(page) || IS_DUMMY_WRITTEN_PAGE(page))
+	if (page_private_nonpointer(page))
 		return false;
 
 	f2fs_bug_on(F2FS_M_SB(page->mapping),
@@ -85,8 +85,7 @@ bool f2fs_is_compressed_page(struct page *page)
 static void f2fs_set_compressed_page(struct page *page,
 		struct inode *inode, pgoff_t index, void *data)
 {
-	SetPagePrivate(page);
-	set_page_private(page, (unsigned long)data);
+	attach_page_private(page, (void *)data);
 
 	/* i_crypto_info and iv index */
 	page->index = index;
@@ -601,8 +600,7 @@ static void f2fs_compress_free_page(struct page *page)
 {
 	if (!page)
 		return;
-	set_page_private(page, (unsigned long)NULL);
-	ClearPagePrivate(page);
+	detach_page_private(page);
 	page->mapping = NULL;
 	unlock_page(page);
 	mempool_free(page, compress_page_pool);
@@ -1414,7 +1412,7 @@ void f2fs_compress_write_end_io(struct bio *bio, struct page *page)
 
 	for (i = 0; i < cic->nr_rpages; i++) {
 		WARN_ON(!cic->rpages[i]);
-		clear_cold_data(cic->rpages[i]);
+		clear_page_private_gcing(cic->rpages[i]);
 		end_page_writeback(cic->rpages[i]);
 	}
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index cf935474ffba..64cb6cc228a3 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -58,18 +58,19 @@ static bool __is_cp_guaranteed(struct page *page)
 	if (!mapping)
 		return false;
 
-	if (f2fs_is_compressed_page(page))
-		return false;
-
 	inode = mapping->host;
 	sbi = F2FS_I_SB(inode);
 
 	if (inode->i_ino == F2FS_META_INO(sbi) ||
 			inode->i_ino == F2FS_NODE_INO(sbi) ||
-			S_ISDIR(inode->i_mode) ||
-			(S_ISREG(inode->i_mode) &&
+			S_ISDIR(inode->i_mode))
+		return true;
+
+	if (f2fs_is_compressed_page(page))
+		return false;
+	if ((S_ISREG(inode->i_mode) &&
 			(f2fs_is_atomic_file(inode) || IS_NOQUOTA(inode))) ||
-			is_cold_data(page))
+			page_private_gcing(page))
 		return true;
 	return false;
 }
@@ -299,9 +300,8 @@ static void f2fs_write_end_io(struct bio *bio)
 		struct page *page = bvec->bv_page;
 		enum count_type type = WB_DATA_TYPE(page);
 
-		if (IS_DUMMY_WRITTEN_PAGE(page)) {
-			set_page_private(page, (unsigned long)NULL);
-			ClearPagePrivate(page);
+		if (page_private_dummy(page)) {
+			clear_page_private_dummy(page);
 			unlock_page(page);
 			mempool_free(page, sbi->write_io_dummy);
 
@@ -331,7 +331,7 @@ static void f2fs_write_end_io(struct bio *bio)
 		dec_page_count(sbi, type);
 		if (f2fs_in_warm_node_list(sbi, page))
 			f2fs_del_fsync_node_entry(sbi, page);
-		clear_cold_data(page);
+		clear_page_private_gcing(page);
 		end_page_writeback(page);
 	}
 	if (!get_pages(sbi, F2FS_WB_CP_DATA) &&
@@ -455,10 +455,11 @@ static inline void __submit_bio(struct f2fs_sb_info *sbi,
 					      GFP_NOIO | __GFP_NOFAIL);
 			f2fs_bug_on(sbi, !page);
 
-			zero_user_segment(page, 0, PAGE_SIZE);
-			SetPagePrivate(page);
-			set_page_private(page, DUMMY_WRITTEN_PAGE);
 			lock_page(page);
+
+			zero_user_segment(page, 0, PAGE_SIZE);
+			set_page_private_dummy(page);
+
 			if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE)
 				f2fs_bug_on(sbi, 1);
 		}
@@ -2482,9 +2483,9 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
 	if (f2fs_is_atomic_file(inode))
 		return true;
 	if (fio) {
-		if (is_cold_data(fio->page))
+		if (page_private_gcing(fio->page))
 			return true;
-		if (IS_ATOMIC_WRITTEN_PAGE(fio->page))
+		if (page_private_dummy(fio->page))
 			return true;
 		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
 			f2fs_is_checkpointed_data(sbi, fio->old_blkaddr)))
@@ -2540,7 +2541,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	/* This page is already truncated */
 	if (fio->old_blkaddr == NULL_ADDR) {
 		ClearPageUptodate(page);
-		clear_cold_data(page);
+		clear_page_private_gcing(page);
 		goto out_writepage;
 	}
 got_it:
@@ -2750,7 +2751,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 	inode_dec_dirty_pages(inode);
 	if (err) {
 		ClearPageUptodate(page);
-		clear_cold_data(page);
+		clear_page_private_gcing(page);
 	}
 
 	if (wbc->for_reclaim) {
@@ -3224,7 +3225,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 			f2fs_do_read_inline_data(page, ipage);
 			set_inode_flag(inode, FI_DATA_EXIST);
 			if (inode->i_nlink)
-				set_inline_node(ipage);
+				set_page_private_inline(ipage);
 		} else {
 			err = f2fs_convert_inline_page(&dn, page);
 			if (err)
@@ -3615,12 +3616,13 @@ void f2fs_invalidate_page(struct page *page, unsigned int offset,
 		}
 	}
 
-	clear_cold_data(page);
+	clear_page_private_gcing(page);
 
-	if (IS_ATOMIC_WRITTEN_PAGE(page))
+	if (page_private_atomic(page))
 		return f2fs_drop_inmem_page(inode, page);
 
-	f2fs_clear_page_private(page);
+	detach_page_private(page);
+	set_page_private(page, 0);
 }
 
 int f2fs_release_page(struct page *page, gfp_t wait)
@@ -3630,11 +3632,13 @@ int f2fs_release_page(struct page *page, gfp_t wait)
 		return 0;
 
 	/* This is atomic written page, keep Private */
-	if (IS_ATOMIC_WRITTEN_PAGE(page))
+	if (page_private_atomic(page))
 		return 0;
 
-	clear_cold_data(page);
-	f2fs_clear_page_private(page);
+	clear_page_private_gcing(page);
+
+	detach_page_private(page);
+	set_page_private(page, 0);
 	return 1;
 }
 
@@ -3650,7 +3654,7 @@ static int f2fs_set_data_page_dirty(struct page *page)
 		return __set_page_dirty_nobuffers(page);
 
 	if (f2fs_is_atomic_file(inode) && !f2fs_is_commit_atomic_write(inode)) {
-		if (!IS_ATOMIC_WRITTEN_PAGE(page)) {
+		if (!page_private_atomic(page)) {
 			f2fs_register_inmem_page(inode, page);
 			return 1;
 		}
@@ -3742,7 +3746,7 @@ int f2fs_migrate_page(struct address_space *mapping,
 {
 	int rc, extra_count;
 	struct f2fs_inode_info *fi = F2FS_I(mapping->host);
-	bool atomic_written = IS_ATOMIC_WRITTEN_PAGE(page);
+	bool atomic_written = page_private_atomic(page);
 
 	BUG_ON(PageWriteback(page));
 
@@ -3778,8 +3782,13 @@ int f2fs_migrate_page(struct address_space *mapping,
 	}
 
 	if (PagePrivate(page)) {
-		f2fs_set_page_private(newpage, page_private(page));
-		f2fs_clear_page_private(page);
+		set_page_private(newpage, page_private(page));
+		SetPagePrivate(newpage);
+		get_page(newpage);
+
+		set_page_private(page, 0);
+		ClearPagePrivate(page);
+		put_page(page);
 	}
 
 	if (mode != MIGRATE_SYNC_NO_COPY)
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index ebf65c5fac40..4cf07050fefe 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -931,11 +931,15 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, struct page *page,
 		!f2fs_truncate_hole(dir, page->index, page->index + 1)) {
 		f2fs_clear_page_cache_dirty_tag(page);
 		clear_page_dirty_for_io(page);
-		f2fs_clear_page_private(page);
 		ClearPageUptodate(page);
-		clear_cold_data(page);
+
+		clear_page_private_gcing(page);
+
 		inode_dec_dirty_pages(dir);
 		f2fs_remove_dirty_inode(dir);
+
+		detach_page_private(page);
+		set_page_private(page, 0);
 	}
 	f2fs_put_page(page, 1);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 0fe881309a20..6ddf9877022d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1293,17 +1293,85 @@ enum {
 				 */
 };
 
+static inline int f2fs_test_bit(unsigned int nr, char *addr);
+static inline void f2fs_set_bit(unsigned int nr, char *addr);
+static inline void f2fs_clear_bit(unsigned int nr, char *addr);
+
 /*
- * this value is set in page as a private data which indicate that
- * the page is atomically written, and it is in inmem_pages list.
+ * Layout of f2fs page.private:
+ *
+ * Layout A: lowest bit should be 1
+ * | bit0 = 1 | bit1 | bit2 | ... | bit MAX | private data .... |
+ * bit 0	PAGE_PRIVATE_NOT_POINTER
+ * bit 1	PAGE_PRIVATE_ATOMIC_WRITE
+ * bit 2	PAGE_PRIVATE_DUMMY_WRITE
+ * bit 3	PAGE_PRIVATE_ONGOING_MIGRATION
+ * bit 4	PAGE_PRIVATE_INLINE_INODE
+ * bit 5	PAGE_PRIVATE_REF_RESOURCE
+ * bit 6-	f2fs private data
+ *
+ * Layout B: lowest bit should be 0
+ * page.private is a wrapped pointer.
  */
-#define ATOMIC_WRITTEN_PAGE		((unsigned long)-1)
-#define DUMMY_WRITTEN_PAGE		((unsigned long)-2)
+enum {
+	PAGE_PRIVATE_NOT_POINTER,		/* private contains non-pointer data */
+	PAGE_PRIVATE_ATOMIC_WRITE,		/* data page from atomic write path */
+	PAGE_PRIVATE_DUMMY_WRITE,		/* data page for padding aligned IO */
+	PAGE_PRIVATE_ONGOING_MIGRATION,		/* data page which is on-going migrating */
+	PAGE_PRIVATE_INLINE_INODE,		/* inode page contains inline data */
+	PAGE_PRIVATE_REF_RESOURCE,		/* dirty page has referenced resources */
+	PAGE_PRIVATE_MAX
+};
+
+#define PAGE_PRIVATE_GET_FUNC(name, flagname) \
+static inline bool page_private_##name(struct page *page) \
+{ \
+	return test_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)) && \
+		test_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
+}
+
+#define PAGE_PRIVATE_SET_FUNC(name, flagname) \
+static inline void set_page_private_##name(struct page *page) \
+{ \
+	if (!PagePrivate(page)) { \
+		get_page(page); \
+		SetPagePrivate(page); \
+	} \
+	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)); \
+	set_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
+}
 
-#define IS_ATOMIC_WRITTEN_PAGE(page)			\
-		(page_private(page) == ATOMIC_WRITTEN_PAGE)
-#define IS_DUMMY_WRITTEN_PAGE(page)			\
-		(page_private(page) == DUMMY_WRITTEN_PAGE)
+#define PAGE_PRIVATE_CLEAR_FUNC(name, flagname) \
+static inline void clear_page_private_##name(struct page *page) \
+{ \
+	clear_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
+	if (page_private(page) == 1 << PAGE_PRIVATE_NOT_POINTER) { \
+		set_page_private(page, 0); \
+		if (PagePrivate(page)) { \
+			ClearPagePrivate(page); \
+			put_page(page); \
+		}\
+	} \
+}
+
+PAGE_PRIVATE_GET_FUNC(nonpointer, NOT_POINTER);
+PAGE_PRIVATE_GET_FUNC(reference, REF_RESOURCE);
+PAGE_PRIVATE_GET_FUNC(inline, INLINE_INODE);
+PAGE_PRIVATE_GET_FUNC(gcing, ONGOING_MIGRATION);
+PAGE_PRIVATE_GET_FUNC(atomic, ATOMIC_WRITE);
+PAGE_PRIVATE_GET_FUNC(dummy, DUMMY_WRITE);
+
+PAGE_PRIVATE_SET_FUNC(reference, REF_RESOURCE);
+PAGE_PRIVATE_SET_FUNC(inline, INLINE_INODE);
+PAGE_PRIVATE_SET_FUNC(gcing, ONGOING_MIGRATION);
+PAGE_PRIVATE_SET_FUNC(atomic, ATOMIC_WRITE);
+PAGE_PRIVATE_SET_FUNC(dummy, DUMMY_WRITE);
+
+PAGE_PRIVATE_CLEAR_FUNC(reference, REF_RESOURCE);
+PAGE_PRIVATE_CLEAR_FUNC(inline, INLINE_INODE);
+PAGE_PRIVATE_CLEAR_FUNC(gcing, ONGOING_MIGRATION);
+PAGE_PRIVATE_CLEAR_FUNC(atomic, ATOMIC_WRITE);
+PAGE_PRIVATE_CLEAR_FUNC(dummy, DUMMY_WRITE);
 
 /* For compression */
 enum compress_algorithm_type {
@@ -3171,20 +3239,6 @@ static inline bool __is_valid_data_blkaddr(block_t blkaddr)
 	return true;
 }
 
-static inline void f2fs_set_page_private(struct page *page,
-						unsigned long data)
-{
-	if (PagePrivate(page))
-		return;
-
-	attach_page_private(page, (void *)data);
-}
-
-static inline void f2fs_clear_page_private(struct page *page)
-{
-	detach_page_private(page);
-}
-
 /*
  * file.c
  */
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 8d1f17ab94d8..ff54db6eb1a1 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1336,7 +1336,7 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 			goto out;
 		}
 		set_page_dirty(page);
-		set_cold_data(page);
+		set_page_private_gcing(page);
 	} else {
 		struct f2fs_io_info fio = {
 			.sbi = F2FS_I_SB(inode),
@@ -1362,11 +1362,11 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 			f2fs_remove_dirty_inode(inode);
 		}
 
-		set_cold_data(page);
+		set_page_private_gcing(page);
 
 		err = f2fs_do_write_data_page(&fio);
 		if (err) {
-			clear_cold_data(page);
+			clear_page_private_gcing(page);
 			if (err == -ENOMEM) {
 				congestion_wait(BLK_RW_ASYNC,
 						DEFAULT_IO_TIMEOUT);
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 92652ca7a7c8..56a20d5c15da 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -173,7 +173,7 @@ int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page)
 
 	/* clear inline data and flag after data writeback */
 	f2fs_truncate_inline_inode(dn->inode, dn->inode_page, 0);
-	clear_inline_node(dn->inode_page);
+	clear_page_private_inline(dn->inode_page);
 clear_out:
 	stat_dec_inline_inode(dn->inode);
 	clear_inode_flag(dn->inode, FI_INLINE_DATA);
@@ -255,7 +255,7 @@ int f2fs_write_inline_data(struct inode *inode, struct page *page)
 	set_inode_flag(inode, FI_APPEND_WRITE);
 	set_inode_flag(inode, FI_DATA_EXIST);
 
-	clear_inline_node(dn.inode_page);
+	clear_page_private_inline(dn.inode_page);
 	f2fs_put_dnode(&dn);
 	return 0;
 }
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index b401f08569f7..cbda7ca3b3be 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -646,7 +646,7 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
 
 	/* deleted inode */
 	if (inode->i_nlink == 0)
-		clear_inline_node(node_page);
+		clear_page_private_inline(node_page);
 
 	F2FS_I(inode)->i_disk_time[0] = inode->i_atime;
 	F2FS_I(inode)->i_disk_time[1] = inode->i_ctime;
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index e67ce5f13b98..3a8f7afa5059 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1860,8 +1860,8 @@ void f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
 			}
 
 			/* flush inline_data, if it's async context. */
-			if (is_inline_node(page)) {
-				clear_inline_node(page);
+			if (page_private_inline(page)) {
+				clear_page_private_inline(page);
 				unlock_page(page);
 				flush_inline_data(sbi, ino_of_node(page));
 				continue;
@@ -1941,8 +1941,8 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 				goto write_node;
 
 			/* flush inline_data */
-			if (is_inline_node(page)) {
-				clear_inline_node(page);
+			if (page_private_inline(page)) {
+				clear_page_private_inline(page);
 				unlock_page(page);
 				flush_inline_data(sbi, ino_of_node(page));
 				goto lock_node;
@@ -2096,7 +2096,7 @@ static int f2fs_set_node_page_dirty(struct page *page)
 	if (!PageDirty(page)) {
 		__set_page_dirty_nobuffers(page);
 		inc_page_count(F2FS_P_SB(page), F2FS_DIRTY_NODES);
-		f2fs_set_page_private(page, 0);
+		set_page_private_reference(page);
 		return 1;
 	}
 	return 0;
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 7a45c0f10629..d85e8659cfda 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -389,20 +389,6 @@ static inline nid_t get_nid(struct page *p, int off, bool i)
  *  - Mark cold node blocks in their node footer
  *  - Mark cold data pages in page cache
  */
-static inline int is_cold_data(struct page *page)
-{
-	return PageChecked(page);
-}
-
-static inline void set_cold_data(struct page *page)
-{
-	SetPageChecked(page);
-}
-
-static inline void clear_cold_data(struct page *page)
-{
-	ClearPageChecked(page);
-}
 
 static inline int is_node(struct page *page, int type)
 {
@@ -414,21 +400,6 @@ static inline int is_node(struct page *page, int type)
 #define is_fsync_dnode(page)	is_node(page, FSYNC_BIT_SHIFT)
 #define is_dent_dnode(page)	is_node(page, DENT_BIT_SHIFT)
 
-static inline int is_inline_node(struct page *page)
-{
-	return PageChecked(page);
-}
-
-static inline void set_inline_node(struct page *page)
-{
-	SetPageChecked(page);
-}
-
-static inline void clear_inline_node(struct page *page)
-{
-	ClearPageChecked(page);
-}
-
 static inline void set_cold_node(struct page *page, bool is_dir)
 {
 	struct f2fs_node *rn = F2FS_NODE(page);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index dce0108690a9..9b9f3924ae13 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -186,10 +186,7 @@ void f2fs_register_inmem_page(struct inode *inode, struct page *page)
 {
 	struct inmem_pages *new;
 
-	if (PagePrivate(page))
-		set_page_private(page, (unsigned long)ATOMIC_WRITTEN_PAGE);
-	else
-		f2fs_set_page_private(page, ATOMIC_WRITTEN_PAGE);
+	set_page_private_atomic(page);
 
 	new = f2fs_kmem_cache_alloc(inmem_entry_slab, GFP_NOFS);
 
@@ -272,9 +269,10 @@ static int __revoke_inmem_pages(struct inode *inode,
 		/* we don't need to invalidate this in the sccessful status */
 		if (drop || recover) {
 			ClearPageUptodate(page);
-			clear_cold_data(page);
+			clear_page_private_gcing(page);
 		}
-		f2fs_clear_page_private(page);
+		detach_page_private(page);
+		set_page_private(page, 0);
 		f2fs_put_page(page, 1);
 
 		list_del(&cur->list);
@@ -360,7 +358,7 @@ void f2fs_drop_inmem_page(struct inode *inode, struct page *page)
 	struct list_head *head = &fi->inmem_pages;
 	struct inmem_pages *cur = NULL;
 
-	f2fs_bug_on(sbi, !IS_ATOMIC_WRITTEN_PAGE(page));
+	f2fs_bug_on(sbi, !page_private_atomic(page));
 
 	mutex_lock(&fi->inmem_lock);
 	list_for_each_entry(cur, head, list) {
@@ -376,9 +374,12 @@ void f2fs_drop_inmem_page(struct inode *inode, struct page *page)
 	kmem_cache_free(inmem_entry_slab, cur);
 
 	ClearPageUptodate(page);
-	f2fs_clear_page_private(page);
+	clear_page_private_atomic(page);
 	f2fs_put_page(page, 0);
 
+	detach_page_private(page);
+	set_page_private(page, 0);
+
 	trace_f2fs_commit_inmem_page(page, INMEM_INVALIDATE);
 }
 
@@ -3295,7 +3296,7 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
 	if (fio->type == DATA) {
 		struct inode *inode = fio->page->mapping->host;
 
-		if (is_cold_data(fio->page)) {
+		if (page_private_gcing(fio->page)) {
 			if (fio->sbi->am.atgc_enabled &&
 				(fio->io_type == FS_DATA_IO) &&
 				(fio->sbi->gc_mode != GC_URGENT_HIGH))
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
