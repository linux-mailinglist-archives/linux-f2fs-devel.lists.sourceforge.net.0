Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD1F3E3D50
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Aug 2021 02:25:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mCt6M-0003hr-Hr; Mon, 09 Aug 2021 00:25:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mCt6K-0003hj-VV
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Aug 2021 00:25:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A0tWruxncXV/yhlIuWP06BodFrQdb8WQ36mnvC7vbB4=; b=UA03SejuniK5c1tm6yYUmAfitr
 rbFX5JPolQv6f0WUWXuBYoUgjHuXW0T8qBS9vaDUZiIxS6vmpenjk/706gkzvOtYvTkon+9Nf98sA
 HS+p06uEekf0ZsJlc6rpr5ckTJSoz1o67fgr5SPHo794rPgkxAyJ8AEi2tVz1kUABJyE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=A0tWruxncXV/yhlIuWP06BodFrQdb8WQ36mnvC7vbB4=; b=h
 rCeTSV8+w95DpR9M7GfF+eovPJxHzu5uiwWCr2h8Y7KQxiXFjni1IXR6sdeE77SZ4xhsYWpghdMhC
 hI7BvJbafzuwI6iSNZnFjK88R6GfRqxVjEVg96WfdgFSLfdiFxtIaGrhwJuwXvNAIRcgueAXoLVMG
 2Llr2VPUxcbNVB9U=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mCt6E-000275-72
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Aug 2021 00:25:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79B1C60E97;
 Mon,  9 Aug 2021 00:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628468696;
 bh=sJROrAeljodBxlw3SoFcb0zZ337cmyvYLEMOpoWhCfU=;
 h=From:To:Cc:Subject:Date:From;
 b=OnI9F8gHaI27AMD89Ys3LOkGqEfD0/QnKYMQnONcKYSymJebvCQ7LWTMaXkWD5bB1
 fV3Nucwtp1kdaZLZtEs6UpTrQAefG47M7drnIhQ+MrEwz9RAy8EANaGa70s1UgC+3D
 of6NZj6v1e6l3Ssi3CQDpP04pQtMKSfhE6tePlFcBQE7lxrDVwo+rlCEZcqZV0SGw5
 eZi//NM1WtU6yKiUcsHqO1GrdvInQ7LdI9q4CE268ZwodP8n3BM4R2XxgPCOrkIMAa
 xIV58VCsBlTxjS+9t6hQSepq/UyL0opAlEiCEtSzUwVFmp4Zh75z6lFiv4taXaOlC9
 o0nH/y4rqgwlw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon,  9 Aug 2021 08:24:48 +0800
Message-Id: <20210809002448.41774-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mCt6E-000275-72
Subject: [f2fs-dev] [PATCH v3 2/2] f2fs: support fault injection for
 f2fs_kmem_cache_alloc()
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
Cc: Chao Yu <chao.yu@linux.dev>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch supports to inject fault into f2fs_kmem_cache_alloc().

Usage:
a) echo 32768 > /sys/fs/f2fs/<dev>/inject_type or
b) mount -o fault_type=32768 <dev> <mountpoint>

Signed-off-by: Chao Yu <chao@kernel.org>
---
v3:
- rebase to last g-dev-test branch
 Documentation/filesystems/f2fs.rst |  1 +
 fs/f2fs/checkpoint.c               |  3 ++-
 fs/f2fs/compress.c                 |  8 +++++---
 fs/f2fs/data.c                     |  2 +-
 fs/f2fs/dir.c                      |  4 ++--
 fs/f2fs/extent_cache.c             |  5 +++--
 fs/f2fs/f2fs.h                     | 17 ++++++++++++++++-
 fs/f2fs/gc.c                       |  6 ++++--
 fs/f2fs/node.c                     | 23 ++++++++++++-----------
 fs/f2fs/recovery.c                 |  3 ++-
 fs/f2fs/segment.c                  | 10 ++++++----
 fs/f2fs/super.c                    |  4 +++-
 fs/f2fs/xattr.c                    |  3 ++-
 13 files changed, 59 insertions(+), 30 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 8fe1450670bb..99f8a7c76e5f 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -196,6 +196,7 @@ fault_type=%d		 Support configuring fault injection type, should be
 			 FAULT_CHECKPOINT	  0x000001000
 			 FAULT_DISCARD		  0x000002000
 			 FAULT_WRITE_IO		  0x000004000
+			 FAULT_SLAB_ALLOC	  0x000008000
 			 ===================	  ===========
 mode=%s			 Control block allocation mode which supports "adaptive"
 			 and "lfs". In "lfs" mode, there should be no random
diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 5b6ddeae1107..41960c55c343 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -475,7 +475,8 @@ static void __add_ino_entry(struct f2fs_sb_info *sbi, nid_t ino,
 
 retry:
 	if (!e)
-		new = f2fs_kmem_cache_alloc(ino_entry_slab, GFP_NOFS);
+		new = f2fs_kmem_cache_alloc(ino_entry_slab,
+						GFP_NOFS, true, NULL);
 
 	radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
 
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index f25b32a6893a..ec70a0a32327 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -28,7 +28,8 @@ static void *page_array_alloc(struct inode *inode, int nr)
 	unsigned int size = sizeof(struct page *) * nr;
 
 	if (likely(size <= sbi->page_array_slab_size))
-		return kmem_cache_zalloc(sbi->page_array_slab, GFP_NOFS);
+		return f2fs_kmem_cache_alloc(sbi->page_array_slab,
+					GFP_F2FS_ZERO, false, F2FS_I_SB(inode));
 	return f2fs_kzalloc(sbi, size, GFP_NOFS);
 }
 
@@ -1281,7 +1282,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 
 	fio.version = ni.version;
 
-	cic = kmem_cache_zalloc(cic_entry_slab, GFP_NOFS);
+	cic = f2fs_kmem_cache_alloc(cic_entry_slab, GFP_F2FS_ZERO, false, sbi);
 	if (!cic)
 		goto out_put_dnode;
 
@@ -1559,7 +1560,8 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 	pgoff_t start_idx = start_idx_of_cluster(cc);
 	int i;
 
-	dic = kmem_cache_zalloc(dic_entry_slab, GFP_NOFS);
+	dic = f2fs_kmem_cache_alloc(dic_entry_slab, GFP_F2FS_ZERO,
+					false, F2FS_I_SB(cc->inode));
 	if (!dic)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d4c9aeba0842..e6f5bca1575b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -724,7 +724,7 @@ static void add_bio_entry(struct f2fs_sb_info *sbi, struct bio *bio,
 	struct f2fs_bio_info *io = sbi->write_io[DATA] + temp;
 	struct bio_entry *be;
 
-	be = f2fs_kmem_cache_alloc(bio_entry_slab, GFP_NOFS);
+	be = f2fs_kmem_cache_alloc(bio_entry_slab, GFP_NOFS, true, NULL);
 	be->bio = bio;
 	bio_get(bio);
 
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index c250bf46ef5e..1820e9c106f7 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -83,8 +83,8 @@ int f2fs_init_casefolded_name(const struct inode *dir,
 	struct super_block *sb = dir->i_sb;
 
 	if (IS_CASEFOLDED(dir)) {
-		fname->cf_name.name = kmem_cache_alloc(f2fs_cf_name_slab,
-								GFP_NOFS);
+		fname->cf_name.name = f2fs_kmem_cache_alloc(f2fs_cf_name_slab,
+					GFP_NOFS, false, F2FS_SB(sb));
 		if (!fname->cf_name.name)
 			return -ENOMEM;
 		fname->cf_name.len = utf8_casefold(sb->s_encoding,
diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index b120589d8517..866e72b29bd5 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -239,7 +239,7 @@ static struct extent_node *__attach_extent_node(struct f2fs_sb_info *sbi,
 {
 	struct extent_node *en;
 
-	en = kmem_cache_alloc(extent_node_slab, GFP_ATOMIC);
+	en = f2fs_kmem_cache_alloc(extent_node_slab, GFP_ATOMIC, false, sbi);
 	if (!en)
 		return NULL;
 
@@ -292,7 +292,8 @@ static struct extent_tree *__grab_extent_tree(struct inode *inode)
 	mutex_lock(&sbi->extent_tree_lock);
 	et = radix_tree_lookup(&sbi->extent_tree_root, ino);
 	if (!et) {
-		et = f2fs_kmem_cache_alloc(extent_tree_slab, GFP_NOFS);
+		et = f2fs_kmem_cache_alloc(extent_tree_slab,
+					GFP_NOFS, true, NULL);
 		f2fs_radix_tree_insert(&sbi->extent_tree_root, ino, et);
 		memset(et, 0, sizeof(struct extent_tree));
 		et->ino = ino;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index fc3539361db5..55806c2ec7fe 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -54,6 +54,7 @@ enum {
 	FAULT_CHECKPOINT,
 	FAULT_DISCARD,
 	FAULT_WRITE_IO,
+	FAULT_SLAB_ALLOC,
 	FAULT_MAX,
 };
 
@@ -2619,7 +2620,7 @@ static inline struct kmem_cache *f2fs_kmem_cache_create(const char *name,
 	return kmem_cache_create(name, size, 0, SLAB_RECLAIM_ACCOUNT, NULL);
 }
 
-static inline void *f2fs_kmem_cache_alloc(struct kmem_cache *cachep,
+static inline void *f2fs_kmem_cache_alloc_nofail(struct kmem_cache *cachep,
 						gfp_t flags)
 {
 	void *entry;
@@ -2630,6 +2631,20 @@ static inline void *f2fs_kmem_cache_alloc(struct kmem_cache *cachep,
 	return entry;
 }
 
+static inline void *f2fs_kmem_cache_alloc(struct kmem_cache *cachep,
+			gfp_t flags, bool nofail, struct f2fs_sb_info *sbi)
+{
+	if (nofail)
+		return f2fs_kmem_cache_alloc_nofail(cachep, flags);
+
+	if (time_to_inject(sbi, FAULT_SLAB_ALLOC)) {
+		f2fs_show_injection_info(sbi, FAULT_SLAB_ALLOC);
+		return NULL;
+	}
+
+	return kmem_cache_alloc(cachep, flags);
+}
+
 static inline bool is_inflight_io(struct f2fs_sb_info *sbi, int type)
 {
 	if (get_pages(sbi, F2FS_RD_DATA) || get_pages(sbi, F2FS_RD_NODE) ||
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 9dce44619069..3bc0f0162e31 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -371,7 +371,8 @@ static struct victim_entry *attach_victim_entry(struct f2fs_sb_info *sbi,
 	struct atgc_management *am = &sbi->am;
 	struct victim_entry *ve;
 
-	ve =  f2fs_kmem_cache_alloc(victim_entry_slab, GFP_NOFS);
+	ve =  f2fs_kmem_cache_alloc(victim_entry_slab,
+				GFP_NOFS, true, NULL);
 
 	ve->mtime = mtime;
 	ve->segno = segno;
@@ -849,7 +850,8 @@ static void add_gc_inode(struct gc_inode_list *gc_list, struct inode *inode)
 		iput(inode);
 		return;
 	}
-	new_ie = f2fs_kmem_cache_alloc(f2fs_inode_entry_slab, GFP_NOFS);
+	new_ie = f2fs_kmem_cache_alloc(f2fs_inode_entry_slab,
+					GFP_NOFS, true, NULL);
 	new_ie->inode = inode;
 
 	f2fs_radix_tree_insert(&gc_list->iroot, inode->i_ino, new_ie);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 9d838a7929fb..161173de5a2d 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -162,14 +162,13 @@ static struct page *get_next_nat_page(struct f2fs_sb_info *sbi, nid_t nid)
 	return dst_page;
 }
 
-static struct nat_entry *__alloc_nat_entry(nid_t nid, bool no_fail)
+static struct nat_entry *__alloc_nat_entry(struct f2fs_sb_info *sbi,
+						nid_t nid, bool no_fail)
 {
 	struct nat_entry *new;
 
-	if (no_fail)
-		new = f2fs_kmem_cache_alloc(nat_entry_slab, GFP_F2FS_ZERO);
-	else
-		new = kmem_cache_alloc(nat_entry_slab, GFP_F2FS_ZERO);
+	new = f2fs_kmem_cache_alloc(nat_entry_slab,
+					GFP_F2FS_ZERO, no_fail, sbi);
 	if (new) {
 		nat_set_nid(new, nid);
 		nat_reset_flag(new);
@@ -242,7 +241,8 @@ static struct nat_entry_set *__grab_nat_entry_set(struct f2fs_nm_info *nm_i,
 
 	head = radix_tree_lookup(&nm_i->nat_set_root, set);
 	if (!head) {
-		head = f2fs_kmem_cache_alloc(nat_entry_set_slab, GFP_NOFS);
+		head = f2fs_kmem_cache_alloc(nat_entry_set_slab,
+						GFP_NOFS, true, NULL);
 
 		INIT_LIST_HEAD(&head->entry_list);
 		INIT_LIST_HEAD(&head->set_list);
@@ -329,7 +329,8 @@ static unsigned int f2fs_add_fsync_node_entry(struct f2fs_sb_info *sbi,
 	unsigned long flags;
 	unsigned int seq_id;
 
-	fn = f2fs_kmem_cache_alloc(fsync_node_entry_slab, GFP_NOFS);
+	fn = f2fs_kmem_cache_alloc(fsync_node_entry_slab,
+					GFP_NOFS, true, NULL);
 
 	get_page(page);
 	fn->page = page;
@@ -428,7 +429,7 @@ static void cache_nat_entry(struct f2fs_sb_info *sbi, nid_t nid,
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
 	struct nat_entry *new, *e;
 
-	new = __alloc_nat_entry(nid, false);
+	new = __alloc_nat_entry(sbi, nid, false);
 	if (!new)
 		return;
 
@@ -451,7 +452,7 @@ static void set_node_addr(struct f2fs_sb_info *sbi, struct node_info *ni,
 {
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
 	struct nat_entry *e;
-	struct nat_entry *new = __alloc_nat_entry(ni->nid, true);
+	struct nat_entry *new = __alloc_nat_entry(sbi, ni->nid, true);
 
 	down_write(&nm_i->nat_tree_lock);
 	e = __lookup_nat_cache(nm_i, ni->nid);
@@ -2252,7 +2253,7 @@ static bool add_free_nid(struct f2fs_sb_info *sbi,
 	if (unlikely(f2fs_check_nid_range(sbi, nid)))
 		return false;
 
-	i = f2fs_kmem_cache_alloc(free_nid_slab, GFP_NOFS);
+	i = f2fs_kmem_cache_alloc(free_nid_slab, GFP_NOFS, true, NULL);
 	i->nid = nid;
 	i->state = FREE_NID;
 
@@ -2842,7 +2843,7 @@ static void remove_nats_in_journal(struct f2fs_sb_info *sbi)
 
 		ne = __lookup_nat_cache(nm_i, nid);
 		if (!ne) {
-			ne = __alloc_nat_entry(nid, true);
+			ne = __alloc_nat_entry(sbi, nid, true);
 			__init_nat_entry(nm_i, ne, &raw_ne, true);
 		}
 
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 695eacfe776c..04655511d7f5 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -91,7 +91,8 @@ static struct fsync_inode_entry *add_fsync_inode(struct f2fs_sb_info *sbi,
 			goto err_out;
 	}
 
-	entry = f2fs_kmem_cache_alloc(fsync_entry_slab, GFP_F2FS_ZERO);
+	entry = f2fs_kmem_cache_alloc(fsync_entry_slab,
+					GFP_F2FS_ZERO, true, NULL);
 	entry->inode = inode;
 	list_add_tail(&entry->list, head);
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index ca9876a6d396..b4dd22134a73 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -188,7 +188,8 @@ void f2fs_register_inmem_page(struct inode *inode, struct page *page)
 
 	set_page_private_atomic(page);
 
-	new = f2fs_kmem_cache_alloc(inmem_entry_slab, GFP_NOFS);
+	new = f2fs_kmem_cache_alloc(inmem_entry_slab,
+					GFP_NOFS, true, NULL);
 
 	/* add atomic page indices to the list */
 	new->page = page;
@@ -1001,7 +1002,7 @@ static struct discard_cmd *__create_discard_cmd(struct f2fs_sb_info *sbi,
 
 	pend_list = &dcc->pend_list[plist_idx(len)];
 
-	dc = f2fs_kmem_cache_alloc(discard_cmd_slab, GFP_NOFS);
+	dc = f2fs_kmem_cache_alloc(discard_cmd_slab, GFP_NOFS, true, NULL);
 	INIT_LIST_HEAD(&dc->list);
 	dc->bdev = bdev;
 	dc->lstart = lstart;
@@ -1962,7 +1963,7 @@ static bool add_discard_addrs(struct f2fs_sb_info *sbi, struct cp_control *cpc,
 
 		if (!de) {
 			de = f2fs_kmem_cache_alloc(discard_entry_slab,
-								GFP_F2FS_ZERO);
+						GFP_F2FS_ZERO, true, NULL);
 			de->start_blkaddr = START_BLOCK(sbi, cpc->trim_start);
 			list_add_tail(&de->list, head);
 		}
@@ -4099,7 +4100,8 @@ static struct page *get_next_sit_page(struct f2fs_sb_info *sbi,
 static struct sit_entry_set *grab_sit_entry_set(void)
 {
 	struct sit_entry_set *ses =
-			f2fs_kmem_cache_alloc(sit_entry_set_slab, GFP_NOFS);
+			f2fs_kmem_cache_alloc(sit_entry_set_slab,
+						GFP_NOFS, true, NULL);
 
 	ses->entry_cnt = 0;
 	INIT_LIST_HEAD(&ses->set_list);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9e0e3c998142..b556ca38f0fb 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -56,6 +56,7 @@ const char *f2fs_fault_name[FAULT_MAX] = {
 	[FAULT_CHECKPOINT]	= "checkpoint error",
 	[FAULT_DISCARD]		= "discard error",
 	[FAULT_WRITE_IO]	= "write IO error",
+	[FAULT_SLAB_ALLOC]	= "slab alloc",
 };
 
 void f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned int rate,
@@ -1300,7 +1301,8 @@ static struct inode *f2fs_alloc_inode(struct super_block *sb)
 {
 	struct f2fs_inode_info *fi;
 
-	fi = kmem_cache_alloc(f2fs_inode_cachep, GFP_F2FS_ZERO);
+	fi = f2fs_kmem_cache_alloc(f2fs_inode_cachep,
+				GFP_F2FS_ZERO, false, F2FS_SB(sb));
 	if (!fi)
 		return NULL;
 
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index c8f34decbf8e..1d2d29dcd41c 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -27,7 +27,8 @@ static void *xattr_alloc(struct f2fs_sb_info *sbi, int size, bool *is_inline)
 {
 	if (likely(size == sbi->inline_xattr_slab_size)) {
 		*is_inline = true;
-		return kmem_cache_zalloc(sbi->inline_xattr_slab, GFP_NOFS);
+		return f2fs_kmem_cache_alloc(sbi->inline_xattr_slab,
+					GFP_F2FS_ZERO, false, sbi);
 	}
 	*is_inline = false;
 	return f2fs_kzalloc(sbi, size, GFP_NOFS);
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
