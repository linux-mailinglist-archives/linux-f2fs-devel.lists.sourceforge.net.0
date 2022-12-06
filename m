Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0D4644C2E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Dec 2022 20:06:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p2dGX-0002fF-Bn;
	Tue, 06 Dec 2022 19:06:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1p2dGT-0002f0-KG
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Dec 2022 19:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T8J0jf0y9msO5Lt2o8GmAgobkv/RLGb9GPXUlt8CCpE=; b=ZyOw4Z3Vja8VacmQOYWnd6+7h1
 73gJoDAd2ITr4Io0AhQikxrPPJjWZofn3F+yncRA026d2lEHFnigE84WdtetbmDoezFOXg44B61gy
 pUHBG/pD35yBvzm3Q7cfRkKU9l2nd91+1ZR8k1C5qaZ9J+6jx2FjRZZTqKxhcF0osP8U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T8J0jf0y9msO5Lt2o8GmAgobkv/RLGb9GPXUlt8CCpE=; b=enY1qz816qeMm+nB6eae4VQuj/
 igcYiaZCI9OH4STK/F6dj8TGjRpQ414+6JOCw+pyI3IMSv8i1T4dGdALuC/nkSQA97RHEkMNU1SiA
 KZv2NBYtErLFc3baJRgkrCPjbK3A1dQIzi8qbyc0U1QXGJe5sKWWEJwQrN6dKgE8JK+s=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p2dGO-00008m-6F for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Dec 2022 19:06:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E1F23B81A10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 Dec 2022 19:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959E0C433C1;
 Tue,  6 Dec 2022 19:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670353548;
 bh=gGP0Q+JmPWb6jF5w/jRM2k/9YcKc+jgbamjaQNWI0GU=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=YGPQu0nNMxDoRYhk/Z8z8zYt+eqqiwaUqULP8l73HZm7l+P64aXrvKvsyAv9oVcZ6
 bcoZZ0QZ9mOjaj3s1lWWgO0Ke849/HKEJYB/rj2jlN21oUto5+JyfMznlByQn8KcA1
 5rq94q78pQALpG9zkQts2oURHnizSsSxr7hTS7VXPU8bAfAcC2i/U3ZmgrAuWJ4INo
 wUdQMny++vRoM6mt8w6LUuA1q9SHYu0DA+ab1OAlyWp1dY317ZHF3l95Ztw3YDdF3a
 xMxYVj0boB3WNrfYLQemATv0FUil3CNB4qLLu7ToYijmIuGYvmigxvkGUqnMw3kJUf
 xOJLyDgo/Z/PQ==
Date: Tue, 6 Dec 2022 11:05:46 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <Y4+SiufEJLNqrmSi@google.com>
References: <20221205185433.3479699-1-jaegeuk@kernel.org>
 <20221205185433.3479699-4-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221205185433.3479699-4-jaegeuk@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch prepares extent_cache to get more use-cases.
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- Change log from v1: - fix a bug 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p2dGO-00008m-6F
Subject: Re: [f2fs-dev] [PATCH 4/6 v2] f2fs: refactor extent_cache to
 support for read and more
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch prepares extent_cache to get more use-cases.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 Change log from v1:
  - fix a bug

 fs/f2fs/data.c         | 14 +++----
 fs/f2fs/debug.c        | 53 +++++++++++++++++---------
 fs/f2fs/extent_cache.c | 85 +++++++++++++++++++++++++++---------------
 3 files changed, 97 insertions(+), 55 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 35c19248b1e2..031fa27d194e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1195,7 +1195,7 @@ int f2fs_get_block(struct dnode_of_data *dn, pgoff_t index)
 	struct extent_info ei = {0, };
 	struct inode *inode = dn->inode;
 
-	if (f2fs_lookup_extent_cache(inode, index, &ei)) {
+	if (f2fs_lookup_extent_cache(inode, index, &ei, EX_READ)) {
 		dn->data_blkaddr = ei.blk + index - ei.fofs;
 		return 0;
 	}
@@ -1217,7 +1217,7 @@ struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
 	if (!page)
 		return ERR_PTR(-ENOMEM);
 
-	if (f2fs_lookup_extent_cache(inode, index, &ei)) {
+	if (f2fs_lookup_extent_cache(inode, index, &ei, EX_READ)) {
 		dn.data_blkaddr = ei.blk + index - ei.fofs;
 		if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), dn.data_blkaddr,
 						DATA_GENERIC_ENHANCE_READ)) {
@@ -1485,7 +1485,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 	pgofs =	(pgoff_t)map->m_lblk;
 	end = pgofs + maxblocks;
 
-	if (!create && f2fs_lookup_extent_cache(inode, pgofs, &ei)) {
+	if (!create && f2fs_lookup_extent_cache(inode, pgofs, &ei, EX_READ)) {
 		if (f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
 							map->m_may_create)
 			goto next_dnode;
@@ -2201,7 +2201,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 	if (f2fs_cluster_is_empty(cc))
 		goto out;
 
-	if (f2fs_lookup_extent_cache(inode, start_idx, &ei))
+	if (f2fs_lookup_extent_cache(inode, start_idx, &ei, EX_READ))
 		from_dnode = false;
 
 	if (!from_dnode)
@@ -2635,7 +2635,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		set_new_dnode(&dn, inode, NULL, NULL, 0);
 
 	if (need_inplace_update(fio) &&
-			f2fs_lookup_extent_cache(inode, page->index, &ei)) {
+	    f2fs_lookup_extent_cache(inode, page->index, &ei, EX_READ)) {
 		fio->old_blkaddr = ei.blk + page->index - ei.fofs;
 
 		if (!f2fs_is_valid_blkaddr(fio->sbi, fio->old_blkaddr,
@@ -3359,7 +3359,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 	} else if (locked) {
 		err = f2fs_get_block(&dn, index);
 	} else {
-		if (f2fs_lookup_extent_cache(inode, index, &ei)) {
+		if (f2fs_lookup_extent_cache(inode, index, &ei, EX_READ)) {
 			dn.data_blkaddr = ei.blk + index - ei.fofs;
 		} else {
 			/* hole case */
@@ -3400,7 +3400,7 @@ static int __find_data_block(struct inode *inode, pgoff_t index,
 
 	set_new_dnode(&dn, inode, ipage, ipage, 0);
 
-	if (f2fs_lookup_extent_cache(inode, index, &ei)) {
+	if (f2fs_lookup_extent_cache(inode, index, &ei, EX_READ)) {
 		dn.data_blkaddr = ei.blk + index - ei.fofs;
 	} else {
 		/* hole case */
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index a216dcdf6941..71eb4c50edf6 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -72,15 +72,23 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 	si->main_area_zones = si->main_area_sections /
 				le32_to_cpu(raw_super->secs_per_zone);
 
-	/* validation check of the segment numbers */
+	/* general extent cache stats */
+	for (i = 0; i < NR_EXTENT_CACHES; i++) {
+		struct extent_tree_info *eti = &sbi->extent_tree[i];
+
+		si->hit_cached[i] = atomic64_read(&sbi->read_hit_cached[i]);
+		si->hit_rbtree[i] = atomic64_read(&sbi->read_hit_rbtree[i]);
+		si->total_ext[i] = atomic64_read(&sbi->total_hit_ext[i]);
+		si->hit_total[i] = si->hit_cached[i] + si->hit_rbtree[i];
+		si->ext_tree[i] = atomic_read(&eti->total_ext_tree);
+		si->zombie_tree[i] = atomic_read(&eti->total_zombie_tree);
+		si->ext_node[i] = atomic_read(&eti->total_ext_node);
+	}
+	/* read extent_cache only */
 	si->hit_largest = atomic64_read(&sbi->read_hit_largest);
-	si->hit_cached = atomic64_read(&sbi->read_hit_cached);
-	si->hit_rbtree = atomic64_read(&sbi->read_hit_rbtree);
-	si->hit_total = si->hit_largest + si->hit_cached + si->hit_rbtree;
-	si->total_ext = atomic64_read(&sbi->total_hit_ext);
-	si->ext_tree = atomic_read(&sbi->total_ext_tree);
-	si->zombie_tree = atomic_read(&sbi->total_zombie_tree);
-	si->ext_node = atomic_read(&sbi->total_ext_node);
+	si->hit_total[EX_READ] += si->hit_largest;
+
+	/* validation check of the segment numbers */
 	si->ndirty_node = get_pages(sbi, F2FS_DIRTY_NODES);
 	si->ndirty_dent = get_pages(sbi, F2FS_DIRTY_DENTS);
 	si->ndirty_meta = get_pages(sbi, F2FS_DIRTY_META);
@@ -294,10 +302,16 @@ static void update_mem_info(struct f2fs_sb_info *sbi)
 				sizeof(struct nat_entry_set);
 	for (i = 0; i < MAX_INO_ENTRY; i++)
 		si->cache_mem += sbi->im[i].ino_num * sizeof(struct ino_entry);
-	si->cache_mem += atomic_read(&sbi->total_ext_tree) *
+
+	for (i = 0; i < NR_EXTENT_CACHES; i++) {
+		struct extent_tree_info *eti = &sbi->extent_tree[i];
+
+		si->ext_mem[i] += atomic_read(&eti->total_ext_tree) *
 						sizeof(struct extent_tree);
-	si->cache_mem += atomic_read(&sbi->total_ext_node) *
+		si->ext_mem[i] += atomic_read(&eti->total_ext_node) *
 						sizeof(struct extent_node);
+		si->cache_mem += si->ext_mem[i];
+	}
 
 	si->page_mem = 0;
 	if (sbi->node_inode) {
@@ -490,16 +504,19 @@ static int stat_show(struct seq_file *s, void *v)
 				si->bg_node_blks);
 		seq_printf(s, "BG skip : IO: %u, Other: %u\n",
 				si->io_skip_bggc, si->other_skip_bggc);
-		seq_puts(s, "\nExtent Cache:\n");
+		seq_puts(s, "\nExtent Cache (Read):\n");
 		seq_printf(s, "  - Hit Count: L1-1:%llu L1-2:%llu L2:%llu\n",
 				si->hit_largest, si->hit_cached,
-				si->hit_rbtree);
+				si->hit_largest, si->hit_cached[EX_READ],
+				si->hit_rbtree[EX_READ]);
 		seq_printf(s, "  - Hit Ratio: %llu%% (%llu / %llu)\n",
-				!si->total_ext ? 0 :
-				div64_u64(si->hit_total * 100, si->total_ext),
-				si->hit_total, si->total_ext);
+				!si->total_ext[EX_READ] ? 0 :
+				div64_u64(si->hit_total[EX_READ] * 100,
+				si->total_ext[EX_READ]),
+				si->hit_total[EX_READ], si->total_ext[EX_READ]);
 		seq_printf(s, "  - Inner Struct Count: tree: %d(%d), node: %d\n",
-				si->ext_tree, si->zombie_tree, si->ext_node);
+				si->ext_tree[EX_READ], si->zombie_tree[EX_READ],
+				si->ext_node[EX_READ]);
 		seq_puts(s, "\nBalancing F2FS Async:\n");
 		seq_printf(s, "  - DIO (R: %4d, W: %4d)\n",
 			   si->nr_dio_read, si->nr_dio_write);
@@ -566,8 +583,10 @@ static int stat_show(struct seq_file *s, void *v)
 			(si->base_mem + si->cache_mem + si->page_mem) >> 10);
 		seq_printf(s, "  - static: %llu KB\n",
 				si->base_mem >> 10);
-		seq_printf(s, "  - cached: %llu KB\n",
+		seq_printf(s, "  - cached all: %llu KB\n",
 				si->cache_mem >> 10);
+		seq_printf(s, "  - read extent cache: %llu KB\n",
+				si->ext_mem[EX_READ] >> 10);
 		seq_printf(s, "  - paged : %llu KB\n",
 				si->page_mem >> 10);
 	}
diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 22a51934cd45..46dbe3629245 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -15,7 +15,21 @@
 #include "node.h"
 #include <trace/events/f2fs.h>
 
-static bool f2fs_may_extent_tree(struct inode *inode)
+static bool f2fs_may_read_extent_tree(struct inode *inode)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+
+	if (!test_opt(sbi, READ_EXTENT_CACHE))
+		return false;
+	if (is_inode_flag_set(inode, FI_NO_EXTENT))
+		return false;
+	if (is_inode_flag_set(inode, FI_COMPRESSED_FILE) &&
+			 !f2fs_sb_has_readonly(sbi))
+		return false;
+	return S_ISREG(inode->i_mode);
+}
+
+static bool f2fs_may_extent_tree(struct inode *inode, enum extent_type type)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 
@@ -26,18 +40,16 @@ static bool f2fs_may_extent_tree(struct inode *inode)
 	if (list_empty(&sbi->s_list))
 		return false;
 
-	if (!test_opt(sbi, READ_EXTENT_CACHE) ||
-			is_inode_flag_set(inode, FI_NO_EXTENT) ||
-			(is_inode_flag_set(inode, FI_COMPRESSED_FILE) &&
-			 !f2fs_sb_has_readonly(sbi)))
-		return false;
-
-	return S_ISREG(inode->i_mode);
+	if (type == EX_READ)
+		return f2fs_may_read_extent_tree(inode);
+	return false;
 }
 
 static void __try_update_largest_extent(struct extent_tree *et,
 						struct extent_node *en)
 {
+	if (et->type != EX_READ)
+		return;
 	if (en->ei.len <= et->largest.len)
 		return;
 
@@ -46,28 +58,31 @@ static void __try_update_largest_extent(struct extent_tree *et,
 }
 
 static bool __is_extent_mergeable(struct extent_info *back,
-				struct extent_info *front)
+		struct extent_info *front, enum extent_type type)
 {
+	if (type == EX_READ) {
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-	if (back->c_len && back->len != back->c_len)
-		return false;
-	if (front->c_len && front->len != front->c_len)
-		return false;
+		if (back->c_len && back->len != back->c_len)
+			return false;
+		if (front->c_len && front->len != front->c_len)
+			return false;
 #endif
-	return (back->fofs + back->len == front->fofs &&
-			back->blk + back->len == front->blk);
+		return (back->fofs + back->len == front->fofs &&
+				back->blk + back->len == front->blk);
+	}
+	return false;
 }
 
 static bool __is_back_mergeable(struct extent_info *cur,
-				struct extent_info *back)
+		struct extent_info *back, enum extent_type type)
 {
-	return __is_extent_mergeable(back, cur);
+	return __is_extent_mergeable(back, cur, type);
 }
 
 static bool __is_front_mergeable(struct extent_info *cur,
-				struct extent_info *front)
+		struct extent_info *front, enum extent_type type)
 {
-	return __is_extent_mergeable(cur, front);
+	return __is_extent_mergeable(cur, front, type);
 }
 
 static struct rb_entry *__lookup_rb_tree_fast(struct rb_entry *cached_re,
@@ -292,6 +307,7 @@ static struct extent_node *__attach_extent_node(struct f2fs_sb_info *sbi,
 				struct rb_node *parent, struct rb_node **p,
 				bool leftmost)
 {
+	struct extent_tree_info *eti = &sbi->extent_tree[et->type];
 	struct extent_node *en;
 
 	en = f2fs_kmem_cache_alloc(extent_node_slab, GFP_ATOMIC, false, sbi);
@@ -305,16 +321,18 @@ static struct extent_node *__attach_extent_node(struct f2fs_sb_info *sbi,
 	rb_link_node(&en->rb_node, parent, p);
 	rb_insert_color_cached(&en->rb_node, &et->root, leftmost);
 	atomic_inc(&et->node_cnt);
-	atomic_inc(&sbi->total_ext_node);
+	atomic_inc(&eti->total_ext_node);
 	return en;
 }
 
 static void __detach_extent_node(struct f2fs_sb_info *sbi,
 				struct extent_tree *et, struct extent_node *en)
 {
+	struct extent_tree_info *eti = &sbi->extent_tree[et->type];
+
 	rb_erase_cached(&en->rb_node, &et->root);
 	atomic_dec(&et->node_cnt);
-	atomic_dec(&sbi->total_ext_node);
+	atomic_dec(&eti->total_ext_node);
 
 	if (et->cached_en == en)
 		et->cached_en = NULL;
@@ -330,42 +348,47 @@ static void __detach_extent_node(struct f2fs_sb_info *sbi,
 static void __release_extent_node(struct f2fs_sb_info *sbi,
 			struct extent_tree *et, struct extent_node *en)
 {
-	spin_lock(&sbi->extent_lock);
+	struct extent_tree_info *eti = &sbi->extent_tree[et->type];
+
+	spin_lock(&eti->extent_lock);
 	f2fs_bug_on(sbi, list_empty(&en->list));
 	list_del_init(&en->list);
-	spin_unlock(&sbi->extent_lock);
+	spin_unlock(&eti->extent_lock);
 
 	__detach_extent_node(sbi, et, en);
 }
 
-static struct extent_tree *__grab_extent_tree(struct inode *inode)
+static struct extent_tree *__grab_extent_tree(struct inode *inode,
+						enum extent_type type)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct extent_tree_info *eti = &sbi->extent_tree[type];
 	struct extent_tree *et;
 	nid_t ino = inode->i_ino;
 
-	mutex_lock(&sbi->extent_tree_lock);
-	et = radix_tree_lookup(&sbi->extent_tree_root, ino);
+	mutex_lock(&eti->extent_tree_lock);
+	et = radix_tree_lookup(&eti->extent_tree_root, ino);
 	if (!et) {
 		et = f2fs_kmem_cache_alloc(extent_tree_slab,
 					GFP_NOFS, true, NULL);
-		f2fs_radix_tree_insert(&sbi->extent_tree_root, ino, et);
+		f2fs_radix_tree_insert(&eti->extent_tree_root, ino, et);
 		memset(et, 0, sizeof(struct extent_tree));
 		et->ino = ino;
+		et->type = type;
 		et->root = RB_ROOT_CACHED;
 		et->cached_en = NULL;
 		rwlock_init(&et->lock);
 		INIT_LIST_HEAD(&et->list);
 		atomic_set(&et->node_cnt, 0);
-		atomic_inc(&sbi->total_ext_tree);
+		atomic_inc(&eti->total_ext_tree);
 	} else {
-		atomic_dec(&sbi->total_zombie_tree);
+		atomic_dec(&eti->total_zombie_tree);
 		list_del_init(&et->list);
 	}
-	mutex_unlock(&sbi->extent_tree_lock);
+	mutex_unlock(&eti->extent_tree_lock);
 
 	/* never died until evict_inode */
-	F2FS_I(inode)->extent_tree = et;
+	F2FS_I(inode)->extent_tree[type] = et;
 
 	return et;
 }
-- 
2.38.1.584.g0f3c55d4c2-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
