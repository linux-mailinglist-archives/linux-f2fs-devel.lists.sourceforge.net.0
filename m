Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C456430D5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Dec 2022 19:55:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p2GcX-0007vx-09;
	Mon, 05 Dec 2022 18:55:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1p2GcL-0007ve-UI
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Dec 2022 18:55:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vsECCbnhn87vzLsLsWcv1uY0rRCrVKkaLCHMB/LGYyI=; b=Z/V7b53Eor2KD+F0m/Wxc+vFww
 huxNZhm9h/TXFUCZG1jz5+Njmrte3Deh2OSAmbQN8rWI3VJ6jR8TJiPzL/EgypK+lZsu6YWhGc26g
 qYDRw1a313K4w7euJMy0EIVuDOcfKnjZSMVm36NDaGWtPAoS6MkJSnT5G0V7Ahx8fGYc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vsECCbnhn87vzLsLsWcv1uY0rRCrVKkaLCHMB/LGYyI=; b=Fhzrh6RES2Z0e7XK0SSUyTvQXd
 73ufcjHxNXacmklAz0RslHwX6dbfqLUaKPKwRxeIndUqhcLUT9I369eWwv//HFdGJ5dsIXTyxEEM/
 SNHJ7+sPuW9uEoJaQdotFHGStyNDhBWrL98Qo5q7gubSK3OQOn3OVDYukJA/rSAk5DgI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p2GcD-00076n-U4 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Dec 2022 18:55:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6C2E061302
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  5 Dec 2022 18:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2239BC433D6;
 Mon,  5 Dec 2022 18:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670266492;
 bh=xMfNaPvyQm0kzkN05b6PaDM7dncQqJMEXnJWgjBVz1c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pNYrxjf1FztqKm9J9IG+w+uAY23H3Tt0RrMzSytafr/PF+dOXUL+XKANkgba18MBo
 v089Kq0WaL5cIE9Yk8R3DYfySk4azIUniJfWerC6ulnay4KAZRhduixamVGLhYt/M7
 HILLLqE3q+vXhQSdnN0i0TDlyNLHVn93sp8oKdGxk2bc5ICTk/i43xSwmofxOc6CRY
 i3SI2sLnth2x2JZD9IqtN4Vs291b+UtaC5n9rHQT/Z+86X54Kx9XmgA65FZbyIQeY4
 CcV2e/ryo4tkpTF3IHmDD+x2GxJmJ2rY88coBmQqyKssUwQAtf7DUnJQKmZrozH/HH
 S99Kv171ZhZEA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  5 Dec 2022 10:54:31 -0800
Message-Id: <20221205185433.3479699-4-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.39.0.rc0.267.gcb52ba06e7-goog
In-Reply-To: <20221205185433.3479699-1-jaegeuk@kernel.org>
References: <20221205185433.3479699-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch prepares extent_cache to be ready for addition.
 Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/data.c | 20 +-
 fs/f2fs/debug.c | 65 +++-- fs/f2fs/extent_cache.c | 463 +++++++++++++++++++++
 fs/f2fs/f2fs.h | 108 ++++++--- f [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p2GcD-00076n-U4
Subject: [f2fs-dev] [PATCH 4/6] f2fs: refactor extent_cache to support for
 read and more
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch prepares extent_cache to be ready for addition.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c              |  20 +-
 fs/f2fs/debug.c             |  65 +++--
 fs/f2fs/extent_cache.c      | 463 +++++++++++++++++++++---------------
 fs/f2fs/f2fs.h              | 108 ++++++---
 fs/f2fs/file.c              |   8 +-
 fs/f2fs/gc.c                |   4 +-
 fs/f2fs/inode.c             |   6 +-
 fs/f2fs/node.c              |   8 +-
 fs/f2fs/segment.c           |   3 +-
 fs/f2fs/shrinker.c          |  19 +-
 include/trace/events/f2fs.h |  62 +++--
 11 files changed, 464 insertions(+), 302 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 35c19248b1e2..75abd450730b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1126,7 +1126,7 @@ void f2fs_update_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr)
 {
 	dn->data_blkaddr = blkaddr;
 	f2fs_set_data_blkaddr(dn);
-	f2fs_update_extent_cache(dn);
+	f2fs_update_read_extent_cache(dn);
 }
 
 /* dn->ofs_in_node will be returned with up-to-date last block pointer */
@@ -1195,7 +1195,7 @@ int f2fs_get_block(struct dnode_of_data *dn, pgoff_t index)
 	struct extent_info ei = {0, };
 	struct inode *inode = dn->inode;
 
-	if (f2fs_lookup_extent_cache(inode, index, &ei)) {
+	if (f2fs_lookup_read_extent_cache(inode, index, &ei)) {
 		dn->data_blkaddr = ei.blk + index - ei.fofs;
 		return 0;
 	}
@@ -1217,7 +1217,7 @@ struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
 	if (!page)
 		return ERR_PTR(-ENOMEM);
 
-	if (f2fs_lookup_extent_cache(inode, index, &ei)) {
+	if (f2fs_lookup_read_extent_cache(inode, index, &ei)) {
 		dn.data_blkaddr = ei.blk + index - ei.fofs;
 		if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), dn.data_blkaddr,
 						DATA_GENERIC_ENHANCE_READ)) {
@@ -1485,7 +1485,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 	pgofs =	(pgoff_t)map->m_lblk;
 	end = pgofs + maxblocks;
 
-	if (!create && f2fs_lookup_extent_cache(inode, pgofs, &ei)) {
+	if (!create && f2fs_lookup_read_extent_cache(inode, pgofs, &ei)) {
 		if (f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
 							map->m_may_create)
 			goto next_dnode;
@@ -1695,7 +1695,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 		if (map->m_flags & F2FS_MAP_MAPPED) {
 			unsigned int ofs = start_pgofs - map->m_lblk;
 
-			f2fs_update_extent_cache_range(&dn,
+			f2fs_update_read_extent_cache_range(&dn,
 				start_pgofs, map->m_pblk + ofs,
 				map->m_len - ofs);
 		}
@@ -1740,7 +1740,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 		if (map->m_flags & F2FS_MAP_MAPPED) {
 			unsigned int ofs = start_pgofs - map->m_lblk;
 
-			f2fs_update_extent_cache_range(&dn,
+			f2fs_update_read_extent_cache_range(&dn,
 				start_pgofs, map->m_pblk + ofs,
 				map->m_len - ofs);
 		}
@@ -2201,7 +2201,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 	if (f2fs_cluster_is_empty(cc))
 		goto out;
 
-	if (f2fs_lookup_extent_cache(inode, start_idx, &ei))
+	if (f2fs_lookup_read_extent_cache(inode, start_idx, &ei))
 		from_dnode = false;
 
 	if (!from_dnode)
@@ -2635,7 +2635,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		set_new_dnode(&dn, inode, NULL, NULL, 0);
 
 	if (need_inplace_update(fio) &&
-			f2fs_lookup_extent_cache(inode, page->index, &ei)) {
+	    f2fs_lookup_read_extent_cache(inode, page->index, &ei)) {
 		fio->old_blkaddr = ei.blk + page->index - ei.fofs;
 
 		if (!f2fs_is_valid_blkaddr(fio->sbi, fio->old_blkaddr,
@@ -3359,7 +3359,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 	} else if (locked) {
 		err = f2fs_get_block(&dn, index);
 	} else {
-		if (f2fs_lookup_extent_cache(inode, index, &ei)) {
+		if (f2fs_lookup_read_extent_cache(inode, index, &ei)) {
 			dn.data_blkaddr = ei.blk + index - ei.fofs;
 		} else {
 			/* hole case */
@@ -3400,7 +3400,7 @@ static int __find_data_block(struct inode *inode, pgoff_t index,
 
 	set_new_dnode(&dn, inode, ipage, ipage, 0);
 
-	if (f2fs_lookup_extent_cache(inode, index, &ei)) {
+	if (f2fs_lookup_read_extent_cache(inode, index, &ei)) {
 		dn.data_blkaddr = ei.blk + index - ei.fofs;
 	} else {
 		/* hole case */
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index a216dcdf6941..a9baa121d829 100644
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
+		si->ext_mem[i] = atomic_read(&eti->total_ext_tree) *
 						sizeof(struct extent_tree);
-	si->cache_mem += atomic_read(&sbi->total_ext_node) *
+		si->ext_mem[i] += atomic_read(&eti->total_ext_node) *
 						sizeof(struct extent_node);
+		si->cache_mem += si->ext_mem[i];
+	}
 
 	si->page_mem = 0;
 	if (sbi->node_inode) {
@@ -490,16 +504,18 @@ static int stat_show(struct seq_file *s, void *v)
 				si->bg_node_blks);
 		seq_printf(s, "BG skip : IO: %u, Other: %u\n",
 				si->io_skip_bggc, si->other_skip_bggc);
-		seq_puts(s, "\nExtent Cache:\n");
+		seq_puts(s, "\nExtent Cache (Read):\n");
 		seq_printf(s, "  - Hit Count: L1-1:%llu L1-2:%llu L2:%llu\n",
-				si->hit_largest, si->hit_cached,
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
@@ -566,8 +582,10 @@ static int stat_show(struct seq_file *s, void *v)
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
@@ -600,10 +618,15 @@ int f2fs_build_stats(struct f2fs_sb_info *sbi)
 	si->sbi = sbi;
 	sbi->stat_info = si;
 
-	atomic64_set(&sbi->total_hit_ext, 0);
-	atomic64_set(&sbi->read_hit_rbtree, 0);
+	/* general extent cache stats */
+	for (i = 0; i < NR_EXTENT_CACHES; i++) {
+		atomic64_set(&sbi->total_hit_ext[i], 0);
+		atomic64_set(&sbi->read_hit_rbtree[i], 0);
+		atomic64_set(&sbi->read_hit_cached[i], 0);
+	}
+
+	/* read extent_cache only */
 	atomic64_set(&sbi->read_hit_largest, 0);
-	atomic64_set(&sbi->read_hit_cached, 0);
 
 	atomic_set(&sbi->inline_xattr, 0);
 	atomic_set(&sbi->inline_inode, 0);
diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index c6810347e205..654a14ab8977 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -17,21 +17,37 @@
 
 static void __set_extent_info(struct extent_info *ei,
 				unsigned int fofs, unsigned int len,
-				block_t blk, bool keep_clen)
+				block_t blk, bool keep_clen,
+				enum extent_type type)
 {
 	ei->fofs = fofs;
-	ei->blk = blk;
 	ei->len = len;
 
-	if (keep_clen)
-		return;
-
+	if (type == EX_READ) {
+		ei->blk = blk;
+		if (keep_clen)
+			return;
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-	ei->c_len = 0;
+		ei->c_len = 0;
 #endif
+	}
+}
+
+static bool __may_read_extent_tree(struct inode *inode)
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
 }
 
-static bool f2fs_may_extent_tree(struct inode *inode)
+static bool __may_extent_tree(struct inode *inode, enum extent_type type)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 
@@ -42,18 +58,16 @@ static bool f2fs_may_extent_tree(struct inode *inode)
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
+		return __may_read_extent_tree(inode);
+	return false;
 }
 
 static void __try_update_largest_extent(struct extent_tree *et,
 						struct extent_node *en)
 {
+	if (et->type != EX_READ)
+		return;
 	if (en->ei.len <= et->largest.len)
 		return;
 
@@ -62,28 +76,31 @@ static void __try_update_largest_extent(struct extent_tree *et,
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
@@ -308,6 +325,7 @@ static struct extent_node *__attach_extent_node(struct f2fs_sb_info *sbi,
 				struct rb_node *parent, struct rb_node **p,
 				bool leftmost)
 {
+	struct extent_tree_info *eti = &sbi->extent_tree[et->type];
 	struct extent_node *en;
 
 	en = f2fs_kmem_cache_alloc(extent_node_slab, GFP_ATOMIC, false, sbi);
@@ -321,16 +339,18 @@ static struct extent_node *__attach_extent_node(struct f2fs_sb_info *sbi,
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
@@ -346,42 +366,47 @@ static void __detach_extent_node(struct f2fs_sb_info *sbi,
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
@@ -415,35 +440,38 @@ static void __drop_largest_extent(struct extent_tree *et,
 }
 
 /* return true, if inode page is changed */
-static void __f2fs_init_extent_tree(struct inode *inode, struct page *ipage)
+static void __f2fs_init_extent_tree(struct inode *inode, struct page *ipage,
+							enum extent_type type)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct extent_tree_info *eti = &sbi->extent_tree[type];
 	struct f2fs_extent *i_ext = ipage ? &F2FS_INODE(ipage)->i_ext : NULL;
 	struct extent_tree *et;
 	struct extent_node *en;
 	struct extent_info ei;
 
-	if (!f2fs_may_extent_tree(inode)) {
-		/* drop largest extent */
-		if (i_ext && i_ext->len) {
+	if (!__may_extent_tree(inode, type)) {
+		/* drop largest read extent */
+		if (type == EX_READ && i_ext && i_ext->len) {
 			f2fs_wait_on_page_writeback(ipage, NODE, true, true);
 			i_ext->len = 0;
 			set_page_dirty(ipage);
-			return;
 		}
-		return;
+		goto out;
 	}
 
-	et = __grab_extent_tree(inode);
+	et = __grab_extent_tree(inode, type);
 
 	if (!i_ext || !i_ext->len)
-		return;
+		goto out;
+
+	BUG_ON(type != EX_READ);
 
 	get_read_extent_info(&ei, i_ext);
 
 	write_lock(&et->lock);
 	if (atomic_read(&et->node_cnt))
-		goto out;
+		goto unlock_out;
 
 	en = __attach_extent_node(sbi, et, &ei, NULL,
 				&et->root.rb_root.rb_node, true);
@@ -451,37 +479,40 @@ static void __f2fs_init_extent_tree(struct inode *inode, struct page *ipage)
 		et->largest = en->ei;
 		et->cached_en = en;
 
-		spin_lock(&sbi->extent_lock);
-		list_add_tail(&en->list, &sbi->extent_list);
-		spin_unlock(&sbi->extent_lock);
+		spin_lock(&eti->extent_lock);
+		list_add_tail(&en->list, &eti->extent_list);
+		spin_unlock(&eti->extent_lock);
 	}
-out:
+unlock_out:
 	write_unlock(&et->lock);
+out:
+	if (type == EX_READ && !F2FS_I(inode)->extent_tree[EX_READ])
+		set_inode_flag(inode, FI_NO_EXTENT);
 }
 
 void f2fs_init_extent_tree(struct inode *inode, struct page *ipage)
 {
-	__f2fs_init_extent_tree(inode, ipage);
-
-	if (!F2FS_I(inode)->extent_tree)
-		set_inode_flag(inode, FI_NO_EXTENT);
+	/* initialize read cache */
+	__f2fs_init_extent_tree(inode, ipage, EX_READ);
 }
 
-static bool f2fs_lookup_extent_tree(struct inode *inode, pgoff_t pgofs,
-							struct extent_info *ei)
+static bool __lookup_extent_tree(struct inode *inode, pgoff_t pgofs,
+			struct extent_info *ei, enum extent_type type)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct extent_tree *et = F2FS_I(inode)->extent_tree;
+	struct extent_tree_info *eti = &sbi->extent_tree[type];
+	struct extent_tree *et = F2FS_I(inode)->extent_tree[type];
 	struct extent_node *en;
 	bool ret = false;
 
 	f2fs_bug_on(sbi, !et);
 
-	trace_f2fs_lookup_extent_tree_start(inode, pgofs);
+	trace_f2fs_lookup_extent_tree_start(inode, pgofs, type);
 
 	read_lock(&et->lock);
 
-	if (et->largest.fofs <= pgofs &&
+	if (type == EX_READ &&
+			et->largest.fofs <= pgofs &&
 			et->largest.fofs + et->largest.len > pgofs) {
 		*ei = et->largest;
 		ret = true;
@@ -495,23 +526,24 @@ static bool f2fs_lookup_extent_tree(struct inode *inode, pgoff_t pgofs,
 		goto out;
 
 	if (en == et->cached_en)
-		stat_inc_cached_node_hit(sbi);
+		stat_inc_cached_node_hit(sbi, type);
 	else
-		stat_inc_rbtree_node_hit(sbi);
+		stat_inc_rbtree_node_hit(sbi, type);
 
 	*ei = en->ei;
-	spin_lock(&sbi->extent_lock);
+	spin_lock(&eti->extent_lock);
 	if (!list_empty(&en->list)) {
-		list_move_tail(&en->list, &sbi->extent_list);
+		list_move_tail(&en->list, &eti->extent_list);
 		et->cached_en = en;
 	}
-	spin_unlock(&sbi->extent_lock);
+	spin_unlock(&eti->extent_lock);
 	ret = true;
 out:
-	stat_inc_total_hit(sbi);
+	stat_inc_total_hit(sbi, type);
 	read_unlock(&et->lock);
 
-	trace_f2fs_lookup_extent_tree_end(inode, pgofs, ei);
+	if (type == EX_READ)
+		trace_f2fs_lookup_read_extent_tree_end(inode, pgofs, ei);
 	return ret;
 }
 
@@ -520,18 +552,20 @@ static struct extent_node *__try_merge_extent_node(struct f2fs_sb_info *sbi,
 				struct extent_node *prev_ex,
 				struct extent_node *next_ex)
 {
+	struct extent_tree_info *eti = &sbi->extent_tree[et->type];
 	struct extent_node *en = NULL;
 
-	if (prev_ex && __is_back_mergeable(ei, &prev_ex->ei)) {
+	if (prev_ex && __is_back_mergeable(ei, &prev_ex->ei, et->type)) {
 		prev_ex->ei.len += ei->len;
 		ei = &prev_ex->ei;
 		en = prev_ex;
 	}
 
-	if (next_ex && __is_front_mergeable(ei, &next_ex->ei)) {
+	if (next_ex && __is_front_mergeable(ei, &next_ex->ei, et->type)) {
 		next_ex->ei.fofs = ei->fofs;
-		next_ex->ei.blk = ei->blk;
 		next_ex->ei.len += ei->len;
+		if (et->type == EX_READ)
+			next_ex->ei.blk = ei->blk;
 		if (en)
 			__release_extent_node(sbi, et, prev_ex);
 
@@ -543,12 +577,12 @@ static struct extent_node *__try_merge_extent_node(struct f2fs_sb_info *sbi,
 
 	__try_update_largest_extent(et, en);
 
-	spin_lock(&sbi->extent_lock);
+	spin_lock(&eti->extent_lock);
 	if (!list_empty(&en->list)) {
-		list_move_tail(&en->list, &sbi->extent_list);
+		list_move_tail(&en->list, &eti->extent_list);
 		et->cached_en = en;
 	}
-	spin_unlock(&sbi->extent_lock);
+	spin_unlock(&eti->extent_lock);
 	return en;
 }
 
@@ -558,6 +592,7 @@ static struct extent_node *__insert_extent_tree(struct f2fs_sb_info *sbi,
 				struct rb_node *insert_parent,
 				bool leftmost)
 {
+	struct extent_tree_info *eti = &sbi->extent_tree[et->type];
 	struct rb_node **p;
 	struct rb_node *parent = NULL;
 	struct extent_node *en = NULL;
@@ -580,47 +615,50 @@ static struct extent_node *__insert_extent_tree(struct f2fs_sb_info *sbi,
 	__try_update_largest_extent(et, en);
 
 	/* update in global extent list */
-	spin_lock(&sbi->extent_lock);
-	list_add_tail(&en->list, &sbi->extent_list);
+	spin_lock(&eti->extent_lock);
+	list_add_tail(&en->list, &eti->extent_list);
 	et->cached_en = en;
-	spin_unlock(&sbi->extent_lock);
+	spin_unlock(&eti->extent_lock);
 	return en;
 }
 
-static void f2fs_update_extent_tree_range(struct inode *inode,
-				pgoff_t fofs, block_t blkaddr, unsigned int len)
+static void __update_extent_tree_range(struct inode *inode,
+			struct extent_info *tei, enum extent_type type)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct extent_tree *et = F2FS_I(inode)->extent_tree;
+	struct extent_tree *et = F2FS_I(inode)->extent_tree[type];
 	struct extent_node *en = NULL, *en1 = NULL;
 	struct extent_node *prev_en = NULL, *next_en = NULL;
 	struct extent_info ei, dei, prev;
 	struct rb_node **insert_p = NULL, *insert_parent = NULL;
+	unsigned int fofs = tei->fofs, len = tei->len;
 	unsigned int end = fofs + len;
-	unsigned int pos = (unsigned int)fofs;
 	bool updated = false;
 	bool leftmost = false;
 
 	if (!et)
 		return;
 
-	trace_f2fs_update_extent_tree_range(inode, fofs, blkaddr, len, 0);
-
+	if (type == EX_READ)
+		trace_f2fs_update_read_extent_tree_range(inode, fofs, len,
+						tei->blk, 0);
 	write_lock(&et->lock);
 
-	if (is_inode_flag_set(inode, FI_NO_EXTENT)) {
-		write_unlock(&et->lock);
-		return;
-	}
+	if (type == EX_READ) {
+		if (is_inode_flag_set(inode, FI_NO_EXTENT)) {
+			write_unlock(&et->lock);
+			return;
+		}
 
-	prev = et->largest;
-	dei.len = 0;
+		prev = et->largest;
+		dei.len = 0;
 
-	/*
-	 * drop largest extent before lookup, in case it's already
-	 * been shrunk from extent tree
-	 */
-	__drop_largest_extent(et, fofs, len);
+		/*
+		 * drop largest extent before lookup, in case it's already
+		 * been shrunk from extent tree
+		 */
+		__drop_largest_extent(et, fofs, len);
+	}
 
 	/* 1. lookup first extent node in range [fofs, fofs + len - 1] */
 	en = (struct extent_node *)f2fs_lookup_rb_tree_ret(&et->root,
@@ -641,26 +679,30 @@ static void f2fs_update_extent_tree_range(struct inode *inode,
 
 		dei = en->ei;
 		org_end = dei.fofs + dei.len;
-		f2fs_bug_on(sbi, pos >= org_end);
+		f2fs_bug_on(sbi, fofs >= org_end);
 
-		if (pos > dei.fofs && pos - dei.fofs >= F2FS_MIN_EXTENT_LEN) {
-			en->ei.len = pos - en->ei.fofs;
+		if (fofs > dei.fofs && (type != EX_READ ||
+				fofs - dei.fofs >= F2FS_MIN_EXTENT_LEN)) {
+			en->ei.len = fofs - en->ei.fofs;
 			prev_en = en;
 			parts = 1;
 		}
 
-		if (end < org_end && org_end - end >= F2FS_MIN_EXTENT_LEN) {
+		if (end < org_end && (type != EX_READ ||
+				org_end - end >= F2FS_MIN_EXTENT_LEN)) {
 			if (parts) {
 				__set_extent_info(&ei,
 					end, org_end - end,
-					end - dei.fofs + dei.blk, false);
+					end - dei.fofs + dei.blk, false,
+					type);
 				en1 = __insert_extent_tree(sbi, et, &ei,
 							NULL, NULL, true);
 				next_en = en1;
 			} else {
 				__set_extent_info(&en->ei,
 					end, en->ei.len - (end - dei.fofs),
-					en->ei.blk + (end - dei.fofs), true);
+					en->ei.blk + (end - dei.fofs), true,
+					type);
 				next_en = en;
 			}
 			parts++;
@@ -690,9 +732,11 @@ static void f2fs_update_extent_tree_range(struct inode *inode,
 		en = next_en;
 	}
 
-	/* 3. update extent in extent cache */
-	if (blkaddr) {
-		__set_extent_info(&ei, fofs, len, blkaddr, false);
+	/* 3. update extent in read extent cache */
+	BUG_ON(type != EX_READ);
+
+	if (tei->blk) {
+		__set_extent_info(&ei, fofs, len, tei->blk, false, EX_READ);
 		if (!__try_merge_extent_node(sbi, et, &ei, prev_en, next_en))
 			__insert_extent_tree(sbi, et, &ei,
 					insert_p, insert_parent, leftmost);
@@ -722,19 +766,20 @@ static void f2fs_update_extent_tree_range(struct inode *inode,
 }
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-void f2fs_update_extent_tree_range_compressed(struct inode *inode,
+void f2fs_update_read_extent_tree_range_compressed(struct inode *inode,
 				pgoff_t fofs, block_t blkaddr, unsigned int llen,
 				unsigned int c_len)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct extent_tree *et = F2FS_I(inode)->extent_tree;
+	struct extent_tree *et = F2FS_I(inode)->extent_tree[EX_READ];
 	struct extent_node *en = NULL;
 	struct extent_node *prev_en = NULL, *next_en = NULL;
 	struct extent_info ei;
 	struct rb_node **insert_p = NULL, *insert_parent = NULL;
 	bool leftmost = false;
 
-	trace_f2fs_update_extent_tree_range(inode, fofs, blkaddr, llen, c_len);
+	trace_f2fs_update_read_extent_tree_range(inode, fofs, llen,
+						blkaddr, c_len);
 
 	/* it is safe here to check FI_NO_EXTENT w/o et->lock in ro image */
 	if (is_inode_flag_set(inode, FI_NO_EXTENT))
@@ -751,7 +796,7 @@ void f2fs_update_extent_tree_range_compressed(struct inode *inode,
 	if (en)
 		goto unlock_out;
 
-	__set_extent_info(&ei, fofs, llen, blkaddr, true);
+	__set_extent_info(&ei, fofs, llen, blkaddr, true, EX_READ);
 	ei.c_len = c_len;
 
 	if (!__try_merge_extent_node(sbi, et, &ei, prev_en, next_en))
@@ -762,24 +807,43 @@ void f2fs_update_extent_tree_range_compressed(struct inode *inode,
 }
 #endif
 
-unsigned int f2fs_shrink_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink)
+static void __update_extent_cache(struct dnode_of_data *dn, enum extent_type type)
 {
+	struct extent_info ei;
+
+	if (!__may_extent_tree(dn->inode, type))
+		return;
+
+	ei.fofs = f2fs_start_bidx_of_node(ofs_of_node(dn->node_page), dn->inode) +
+								dn->ofs_in_node;
+	ei.len = 1;
+
+	if (type == EX_READ) {
+		if (dn->data_blkaddr == NEW_ADDR)
+			ei.blk = NULL_ADDR;
+		else
+			ei.blk = dn->data_blkaddr;
+	}
+	__update_extent_tree_range(dn->inode, &ei, type);
+}
+
+static unsigned int __shrink_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink,
+					enum extent_type type)
+{
+	struct extent_tree_info *eti = &sbi->extent_tree[type];
 	struct extent_tree *et, *next;
 	struct extent_node *en;
 	unsigned int node_cnt = 0, tree_cnt = 0;
 	int remained;
 
-	if (!test_opt(sbi, READ_EXTENT_CACHE))
-		return 0;
-
-	if (!atomic_read(&sbi->total_zombie_tree))
+	if (!atomic_read(&eti->total_zombie_tree))
 		goto free_node;
 
-	if (!mutex_trylock(&sbi->extent_tree_lock))
+	if (!mutex_trylock(&eti->extent_tree_lock))
 		goto out;
 
 	/* 1. remove unreferenced extent tree */
-	list_for_each_entry_safe(et, next, &sbi->zombie_list, list) {
+	list_for_each_entry_safe(et, next, &eti->zombie_list, list) {
 		if (atomic_read(&et->node_cnt)) {
 			write_lock(&et->lock);
 			node_cnt += __free_extent_tree(sbi, et);
@@ -787,61 +851,100 @@ unsigned int f2fs_shrink_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink)
 		}
 		f2fs_bug_on(sbi, atomic_read(&et->node_cnt));
 		list_del_init(&et->list);
-		radix_tree_delete(&sbi->extent_tree_root, et->ino);
+		radix_tree_delete(&eti->extent_tree_root, et->ino);
 		kmem_cache_free(extent_tree_slab, et);
-		atomic_dec(&sbi->total_ext_tree);
-		atomic_dec(&sbi->total_zombie_tree);
+		atomic_dec(&eti->total_ext_tree);
+		atomic_dec(&eti->total_zombie_tree);
 		tree_cnt++;
 
 		if (node_cnt + tree_cnt >= nr_shrink)
 			goto unlock_out;
 		cond_resched();
 	}
-	mutex_unlock(&sbi->extent_tree_lock);
+	mutex_unlock(&eti->extent_tree_lock);
 
 free_node:
 	/* 2. remove LRU extent entries */
-	if (!mutex_trylock(&sbi->extent_tree_lock))
+	if (!mutex_trylock(&eti->extent_tree_lock))
 		goto out;
 
 	remained = nr_shrink - (node_cnt + tree_cnt);
 
-	spin_lock(&sbi->extent_lock);
+	spin_lock(&eti->extent_lock);
 	for (; remained > 0; remained--) {
-		if (list_empty(&sbi->extent_list))
+		if (list_empty(&eti->extent_list))
 			break;
-		en = list_first_entry(&sbi->extent_list,
+		en = list_first_entry(&eti->extent_list,
 					struct extent_node, list);
 		et = en->et;
 		if (!write_trylock(&et->lock)) {
 			/* refresh this extent node's position in extent list */
-			list_move_tail(&en->list, &sbi->extent_list);
+			list_move_tail(&en->list, &eti->extent_list);
 			continue;
 		}
 
 		list_del_init(&en->list);
-		spin_unlock(&sbi->extent_lock);
+		spin_unlock(&eti->extent_lock);
 
 		__detach_extent_node(sbi, et, en);
 
 		write_unlock(&et->lock);
 		node_cnt++;
-		spin_lock(&sbi->extent_lock);
+		spin_lock(&eti->extent_lock);
 	}
-	spin_unlock(&sbi->extent_lock);
+	spin_unlock(&eti->extent_lock);
 
 unlock_out:
-	mutex_unlock(&sbi->extent_tree_lock);
+	mutex_unlock(&eti->extent_tree_lock);
 out:
-	trace_f2fs_shrink_extent_tree(sbi, node_cnt, tree_cnt);
+	trace_f2fs_shrink_extent_tree(sbi, node_cnt, tree_cnt, type);
 
 	return node_cnt + tree_cnt;
 }
 
-unsigned int f2fs_destroy_extent_node(struct inode *inode)
+/* read extent cache operations */
+bool f2fs_lookup_read_extent_cache(struct inode *inode, pgoff_t pgofs,
+				struct extent_info *ei)
+{
+	if (!__may_extent_tree(inode, EX_READ))
+		return false;
+
+	return __lookup_extent_tree(inode, pgofs, ei, EX_READ);
+}
+
+void f2fs_update_read_extent_cache(struct dnode_of_data *dn)
+{
+	return __update_extent_cache(dn, EX_READ);
+}
+
+void f2fs_update_read_extent_cache_range(struct dnode_of_data *dn,
+				pgoff_t fofs, block_t blkaddr, unsigned int len)
+{
+	struct extent_info ei = {
+		.fofs = fofs,
+		.len = len,
+		.blk = blkaddr,
+	};
+
+	if (!__may_extent_tree(dn->inode, EX_READ))
+		return;
+
+	__update_extent_tree_range(dn->inode, &ei, EX_READ);
+}
+
+unsigned int f2fs_shrink_read_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink)
+{
+	if (!test_opt(sbi, READ_EXTENT_CACHE))
+		return 0;
+
+	return __shrink_extent_tree(sbi, nr_shrink, EX_READ);
+}
+
+static unsigned int __destroy_extent_node(struct inode *inode,
+					enum extent_type type)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct extent_tree *et = F2FS_I(inode)->extent_tree;
+	struct extent_tree *et = F2FS_I(inode)->extent_tree[type];
 	unsigned int node_cnt = 0;
 
 	if (!et || !atomic_read(&et->node_cnt))
@@ -854,31 +957,44 @@ unsigned int f2fs_destroy_extent_node(struct inode *inode)
 	return node_cnt;
 }
 
-void f2fs_drop_extent_tree(struct inode *inode)
+void f2fs_destroy_extent_node(struct inode *inode)
+{
+	__destroy_extent_node(inode, EX_READ);
+}
+
+static void __drop_extent_tree(struct inode *inode, enum extent_type type)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct extent_tree *et = F2FS_I(inode)->extent_tree;
+	struct extent_tree *et = F2FS_I(inode)->extent_tree[type];
 	bool updated = false;
 
-	if (!f2fs_may_extent_tree(inode))
+	if (!__may_extent_tree(inode, type))
 		return;
 
 	write_lock(&et->lock);
-	set_inode_flag(inode, FI_NO_EXTENT);
 	__free_extent_tree(sbi, et);
-	if (et->largest.len) {
-		et->largest.len = 0;
-		updated = true;
+	if (type == EX_READ) {
+		set_inode_flag(inode, FI_NO_EXTENT);
+		if (et->largest.len) {
+			et->largest.len = 0;
+			updated = true;
+		}
 	}
 	write_unlock(&et->lock);
 	if (updated)
 		f2fs_mark_inode_dirty_sync(inode, true);
 }
 
-void f2fs_destroy_extent_tree(struct inode *inode)
+void f2fs_drop_extent_tree(struct inode *inode)
+{
+	__drop_extent_tree(inode, EX_READ);
+}
+
+static void __destroy_extent_tree(struct inode *inode, enum extent_type type)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct extent_tree *et = F2FS_I(inode)->extent_tree;
+	struct extent_tree_info *eti = &sbi->extent_tree[type];
+	struct extent_tree *et = F2FS_I(inode)->extent_tree[type];
 	unsigned int node_cnt = 0;
 
 	if (!et)
@@ -886,76 +1002,49 @@ void f2fs_destroy_extent_tree(struct inode *inode)
 
 	if (inode->i_nlink && !is_bad_inode(inode) &&
 					atomic_read(&et->node_cnt)) {
-		mutex_lock(&sbi->extent_tree_lock);
-		list_add_tail(&et->list, &sbi->zombie_list);
-		atomic_inc(&sbi->total_zombie_tree);
-		mutex_unlock(&sbi->extent_tree_lock);
+		mutex_lock(&eti->extent_tree_lock);
+		list_add_tail(&et->list, &eti->zombie_list);
+		atomic_inc(&eti->total_zombie_tree);
+		mutex_unlock(&eti->extent_tree_lock);
 		return;
 	}
 
 	/* free all extent info belong to this extent tree */
-	node_cnt = f2fs_destroy_extent_node(inode);
+	node_cnt = __destroy_extent_node(inode, type);
 
 	/* delete extent tree entry in radix tree */
-	mutex_lock(&sbi->extent_tree_lock);
+	mutex_lock(&eti->extent_tree_lock);
 	f2fs_bug_on(sbi, atomic_read(&et->node_cnt));
-	radix_tree_delete(&sbi->extent_tree_root, inode->i_ino);
+	radix_tree_delete(&eti->extent_tree_root, inode->i_ino);
 	kmem_cache_free(extent_tree_slab, et);
-	atomic_dec(&sbi->total_ext_tree);
-	mutex_unlock(&sbi->extent_tree_lock);
+	atomic_dec(&eti->total_ext_tree);
+	mutex_unlock(&eti->extent_tree_lock);
 
-	F2FS_I(inode)->extent_tree = NULL;
+	F2FS_I(inode)->extent_tree[type] = NULL;
 
-	trace_f2fs_destroy_extent_tree(inode, node_cnt);
+	trace_f2fs_destroy_extent_tree(inode, node_cnt, type);
 }
 
-bool f2fs_lookup_extent_cache(struct inode *inode, pgoff_t pgofs,
-					struct extent_info *ei)
-{
-	if (!f2fs_may_extent_tree(inode))
-		return false;
-
-	return f2fs_lookup_extent_tree(inode, pgofs, ei);
-}
-
-void f2fs_update_extent_cache(struct dnode_of_data *dn)
+void f2fs_destroy_extent_tree(struct inode *inode)
 {
-	pgoff_t fofs;
-	block_t blkaddr;
-
-	if (!f2fs_may_extent_tree(dn->inode))
-		return;
-
-	if (dn->data_blkaddr == NEW_ADDR)
-		blkaddr = NULL_ADDR;
-	else
-		blkaddr = dn->data_blkaddr;
-
-	fofs = f2fs_start_bidx_of_node(ofs_of_node(dn->node_page), dn->inode) +
-								dn->ofs_in_node;
-	f2fs_update_extent_tree_range(dn->inode, fofs, blkaddr, 1);
+	__destroy_extent_tree(inode, EX_READ);
 }
 
-void f2fs_update_extent_cache_range(struct dnode_of_data *dn,
-				pgoff_t fofs, block_t blkaddr, unsigned int len)
-
+static void __init_extent_tree_info(struct extent_tree_info *eti)
 {
-	if (!f2fs_may_extent_tree(dn->inode))
-		return;
-
-	f2fs_update_extent_tree_range(dn->inode, fofs, blkaddr, len);
+	INIT_RADIX_TREE(&eti->extent_tree_root, GFP_NOIO);
+	mutex_init(&eti->extent_tree_lock);
+	INIT_LIST_HEAD(&eti->extent_list);
+	spin_lock_init(&eti->extent_lock);
+	atomic_set(&eti->total_ext_tree, 0);
+	INIT_LIST_HEAD(&eti->zombie_list);
+	atomic_set(&eti->total_zombie_tree, 0);
+	atomic_set(&eti->total_ext_node, 0);
 }
 
 void f2fs_init_extent_cache_info(struct f2fs_sb_info *sbi)
 {
-	INIT_RADIX_TREE(&sbi->extent_tree_root, GFP_NOIO);
-	mutex_init(&sbi->extent_tree_lock);
-	INIT_LIST_HEAD(&sbi->extent_list);
-	spin_lock_init(&sbi->extent_lock);
-	atomic_set(&sbi->total_ext_tree, 0);
-	INIT_LIST_HEAD(&sbi->zombie_list);
-	atomic_set(&sbi->total_zombie_tree, 0);
-	atomic_set(&sbi->total_ext_node, 0);
+	__init_extent_tree_info(&sbi->extent_tree[EX_READ]);
 }
 
 int __init f2fs_create_extent_cache(void)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 04fdf010bb77..003b04b10109 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -596,16 +596,22 @@ enum {
 /* dirty segments threshold for triggering CP */
 #define DEFAULT_DIRTY_THRESHOLD		4
 
+#define RECOVERY_MAX_RA_BLOCKS		BIO_MAX_VECS
+#define RECOVERY_MIN_RA_BLOCKS		1
+
+#define F2FS_ONSTACK_PAGES	16	/* nr of onstack pages */
+
 /* for in-memory extent cache entry */
 #define F2FS_MIN_EXTENT_LEN	64	/* minimum extent length */
 
 /* number of extent info in extent cache we try to shrink */
 #define READ_EXTENT_CACHE_SHRINK_NUMBER	128
 
-#define RECOVERY_MAX_RA_BLOCKS		BIO_MAX_VECS
-#define RECOVERY_MIN_RA_BLOCKS		1
-
-#define F2FS_ONSTACK_PAGES	16	/* nr of onstack pages */
+/* extent cache type */
+enum extent_type {
+	EX_READ,
+	NR_EXTENT_CACHES,
+};
 
 struct rb_entry {
 	struct rb_node rb_node;		/* rb node located in rb-tree */
@@ -621,10 +627,17 @@ struct rb_entry {
 struct extent_info {
 	unsigned int fofs;		/* start offset in a file */
 	unsigned int len;		/* length of the extent */
-	block_t blk;			/* start block address of the extent */
+	union {
+		/* read extent_cache */
+		struct {
+			/* start block address of the extent */
+			block_t blk;
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-	unsigned int c_len;		/* physical extent length of compressed blocks */
+			/* physical extent length of compressed blocks */
+			unsigned int c_len;
 #endif
+		};
+	};
 };
 
 struct extent_node {
@@ -636,13 +649,25 @@ struct extent_node {
 
 struct extent_tree {
 	nid_t ino;			/* inode number */
+	enum extent_type type;		/* keep the extent tree type */
 	struct rb_root_cached root;	/* root of extent info rb-tree */
 	struct extent_node *cached_en;	/* recently accessed extent node */
-	struct extent_info largest;	/* largested extent info */
 	struct list_head list;		/* to be used by sbi->zombie_list */
 	rwlock_t lock;			/* protect extent info rb-tree */
 	atomic_t node_cnt;		/* # of extent node in rb-tree*/
 	bool largest_updated;		/* largest extent updated */
+	struct extent_info largest;	/* largest cached extent for EX_READ */
+};
+
+struct extent_tree_info {
+	struct radix_tree_root extent_tree_root;/* cache extent cache entries */
+	struct mutex extent_tree_lock;	/* locking extent radix tree */
+	struct list_head extent_list;		/* lru list for shrinker */
+	spinlock_t extent_lock;			/* locking extent lru list */
+	atomic_t total_ext_tree;		/* extent tree count */
+	struct list_head zombie_list;		/* extent zombie tree list */
+	atomic_t total_zombie_tree;		/* extent zombie tree count */
+	atomic_t total_ext_node;		/* extent info count */
 };
 
 /*
@@ -805,7 +830,8 @@ struct f2fs_inode_info {
 	struct list_head dirty_list;	/* dirty list for dirs and files */
 	struct list_head gdirty_list;	/* linked in global dirty list */
 	struct task_struct *atomic_write_task;	/* store atomic write task */
-	struct extent_tree *extent_tree;	/* cached extent_tree entry */
+	struct extent_tree *extent_tree[NR_EXTENT_CACHES];
+					/* cached extent_tree entry */
 	struct inode *cow_inode;	/* copy-on-write inode for atomic write */
 
 	/* avoid racing between foreground op and gc */
@@ -1626,14 +1652,7 @@ struct f2fs_sb_info {
 	struct mutex flush_lock;		/* for flush exclusion */
 
 	/* for extent tree cache */
-	struct radix_tree_root extent_tree_root;/* cache extent cache entries */
-	struct mutex extent_tree_lock;	/* locking extent radix tree */
-	struct list_head extent_list;		/* lru list for shrinker */
-	spinlock_t extent_lock;			/* locking extent lru list */
-	atomic_t total_ext_tree;		/* extent tree count */
-	struct list_head zombie_list;		/* extent zombie tree list */
-	atomic_t total_zombie_tree;		/* extent zombie tree count */
-	atomic_t total_ext_node;		/* extent info count */
+	struct extent_tree_info extent_tree[NR_EXTENT_CACHES];
 
 	/* basic filesystem units */
 	unsigned int log_sectors_per_block;	/* log2 sectors per block */
@@ -1718,10 +1737,14 @@ struct f2fs_sb_info {
 	unsigned int segment_count[2];		/* # of allocated segments */
 	unsigned int block_count[2];		/* # of allocated blocks */
 	atomic_t inplace_count;		/* # of inplace update */
-	atomic64_t total_hit_ext;		/* # of lookup extent cache */
-	atomic64_t read_hit_rbtree;		/* # of hit rbtree extent node */
-	atomic64_t read_hit_largest;		/* # of hit largest extent node */
-	atomic64_t read_hit_cached;		/* # of hit cached extent node */
+	/* # of lookup extent cache */
+	atomic64_t total_hit_ext[NR_EXTENT_CACHES];
+	/* # of hit rbtree extent node */
+	atomic64_t read_hit_rbtree[NR_EXTENT_CACHES];
+	/* # of hit cached extent node */
+	atomic64_t read_hit_cached[NR_EXTENT_CACHES];
+	/* # of hit largest extent node in read extent cache */
+	atomic64_t read_hit_largest;
 	atomic_t inline_xattr;			/* # of inline_xattr inodes */
 	atomic_t inline_inode;			/* # of inline_data inodes */
 	atomic_t inline_dir;			/* # of inline_dentry inodes */
@@ -3823,9 +3846,17 @@ struct f2fs_stat_info {
 	struct f2fs_sb_info *sbi;
 	int all_area_segs, sit_area_segs, nat_area_segs, ssa_area_segs;
 	int main_area_segs, main_area_sections, main_area_zones;
-	unsigned long long hit_largest, hit_cached, hit_rbtree;
-	unsigned long long hit_total, total_ext;
-	int ext_tree, zombie_tree, ext_node;
+	unsigned long long hit_cached[NR_EXTENT_CACHES];
+	unsigned long long hit_rbtree[NR_EXTENT_CACHES];
+	unsigned long long total_ext[NR_EXTENT_CACHES];
+	unsigned long long hit_total[NR_EXTENT_CACHES];
+	int ext_tree[NR_EXTENT_CACHES];
+	int zombie_tree[NR_EXTENT_CACHES];
+	int ext_node[NR_EXTENT_CACHES];
+	/* to count memory footprint */
+	unsigned long long ext_mem[NR_EXTENT_CACHES];
+	/* for read extent cache */
+	unsigned long long hit_largest;
 	int ndirty_node, ndirty_dent, ndirty_meta, ndirty_imeta;
 	int ndirty_data, ndirty_qdata;
 	unsigned int ndirty_dirs, ndirty_files, nquota_files, ndirty_all;
@@ -3884,10 +3915,10 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
 #define stat_other_skip_bggc_count(sbi)	((sbi)->other_skip_bggc++)
 #define stat_inc_dirty_inode(sbi, type)	((sbi)->ndirty_inode[type]++)
 #define stat_dec_dirty_inode(sbi, type)	((sbi)->ndirty_inode[type]--)
-#define stat_inc_total_hit(sbi)		(atomic64_inc(&(sbi)->total_hit_ext))
-#define stat_inc_rbtree_node_hit(sbi)	(atomic64_inc(&(sbi)->read_hit_rbtree))
+#define stat_inc_total_hit(sbi, type)		(atomic64_inc(&(sbi)->total_hit_ext[type]))
+#define stat_inc_rbtree_node_hit(sbi, type)	(atomic64_inc(&(sbi)->read_hit_rbtree[type]))
 #define stat_inc_largest_node_hit(sbi)	(atomic64_inc(&(sbi)->read_hit_largest))
-#define stat_inc_cached_node_hit(sbi)	(atomic64_inc(&(sbi)->read_hit_cached))
+#define stat_inc_cached_node_hit(sbi, type)	(atomic64_inc(&(sbi)->read_hit_cached[type]))
 #define stat_inc_inline_xattr(inode)					\
 	do {								\
 		if (f2fs_has_inline_xattr(inode))			\
@@ -4010,10 +4041,10 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
 #define stat_other_skip_bggc_count(sbi)			do { } while (0)
 #define stat_inc_dirty_inode(sbi, type)			do { } while (0)
 #define stat_dec_dirty_inode(sbi, type)			do { } while (0)
-#define stat_inc_total_hit(sbi)				do { } while (0)
-#define stat_inc_rbtree_node_hit(sbi)			do { } while (0)
+#define stat_inc_total_hit(sbi, type)			do { } while (0)
+#define stat_inc_rbtree_node_hit(sbi, type)		do { } while (0)
 #define stat_inc_largest_node_hit(sbi)			do { } while (0)
-#define stat_inc_cached_node_hit(sbi)			do { } while (0)
+#define stat_inc_cached_node_hit(sbi, type)		do { } while (0)
 #define stat_inc_inline_xattr(inode)			do { } while (0)
 #define stat_dec_inline_xattr(inode)			do { } while (0)
 #define stat_inc_inline_inode(inode)			do { } while (0)
@@ -4119,20 +4150,23 @@ struct rb_entry *f2fs_lookup_rb_tree_ret(struct rb_root_cached *root,
 		bool force, bool *leftmost);
 bool f2fs_check_rb_tree_consistence(struct f2fs_sb_info *sbi,
 				struct rb_root_cached *root, bool check_key);
-unsigned int f2fs_shrink_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink);
 void f2fs_init_extent_tree(struct inode *inode, struct page *ipage);
 void f2fs_drop_extent_tree(struct inode *inode);
-unsigned int f2fs_destroy_extent_node(struct inode *inode);
+void f2fs_destroy_extent_node(struct inode *inode);
 void f2fs_destroy_extent_tree(struct inode *inode);
-bool f2fs_lookup_extent_cache(struct inode *inode, pgoff_t pgofs,
-			struct extent_info *ei);
-void f2fs_update_extent_cache(struct dnode_of_data *dn);
-void f2fs_update_extent_cache_range(struct dnode_of_data *dn,
-			pgoff_t fofs, block_t blkaddr, unsigned int len);
 void f2fs_init_extent_cache_info(struct f2fs_sb_info *sbi);
 int __init f2fs_create_extent_cache(void);
 void f2fs_destroy_extent_cache(void);
 
+/* read extent cache ops */
+bool f2fs_lookup_read_extent_cache(struct inode *inode, pgoff_t pgofs,
+			struct extent_info *ei);
+void f2fs_update_read_extent_cache(struct dnode_of_data *dn);
+void f2fs_update_read_extent_cache_range(struct dnode_of_data *dn,
+			pgoff_t fofs, block_t blkaddr, unsigned int len);
+unsigned int f2fs_shrink_read_extent_tree(struct f2fs_sb_info *sbi,
+			int nr_shrink);
+
 /*
  * sysfs.c
  */
@@ -4202,7 +4236,7 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
 						struct writeback_control *wbc,
 						enum iostat_type io_type);
 int f2fs_is_compressed_cluster(struct inode *inode, pgoff_t index);
-void f2fs_update_extent_tree_range_compressed(struct inode *inode,
+void f2fs_update_read_extent_tree_range_compressed(struct inode *inode,
 				pgoff_t fofs, block_t blkaddr, unsigned int llen,
 				unsigned int c_len);
 int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ab0a0d3730f6..cbe7c24065c7 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -618,7 +618,7 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 		 */
 		fofs = f2fs_start_bidx_of_node(ofs_of_node(dn->node_page),
 							dn->inode) + ofs;
-		f2fs_update_extent_cache_range(dn, fofs, 0, len);
+		f2fs_update_read_extent_cache_range(dn, fofs, 0, len);
 		dec_valid_block_count(sbi, dn->inode, nr_free);
 	}
 	dn->ofs_in_node = ofs;
@@ -1496,7 +1496,7 @@ static int f2fs_do_zero_range(struct dnode_of_data *dn, pgoff_t start,
 		f2fs_set_data_blkaddr(dn);
 	}
 
-	f2fs_update_extent_cache_range(dn, start, 0, index - start);
+	f2fs_update_read_extent_cache_range(dn, start, 0, index - start);
 
 	return ret;
 }
@@ -2558,7 +2558,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 	struct f2fs_map_blocks map = { .m_next_extent = NULL,
 					.m_seg_type = NO_CHECK_TYPE,
 					.m_may_create = false };
-	struct extent_info ei = {0, 0, 0};
+	struct extent_info ei = {0, };
 	pgoff_t pg_start, pg_end, next_pgofs;
 	unsigned int blk_per_seg = sbi->blocks_per_seg;
 	unsigned int total = 0, sec_num;
@@ -2590,7 +2590,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 	 * lookup mapping info in extent cache, skip defragmenting if physical
 	 * block addresses are continuous.
 	 */
-	if (f2fs_lookup_extent_cache(inode, pg_start, &ei)) {
+	if (f2fs_lookup_read_extent_cache(inode, pg_start, &ei)) {
 		if (ei.fofs + ei.len >= pg_end)
 			goto out;
 	}
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index d19e26b2e875..f0c6506d8975 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1146,7 +1146,7 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 	struct address_space *mapping = inode->i_mapping;
 	struct dnode_of_data dn;
 	struct page *page;
-	struct extent_info ei = {0, 0, 0};
+	struct extent_info ei = {0, };
 	struct f2fs_io_info fio = {
 		.sbi = sbi,
 		.ino = inode->i_ino,
@@ -1164,7 +1164,7 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 	if (!page)
 		return -ENOMEM;
 
-	if (f2fs_lookup_extent_cache(inode, index, &ei)) {
+	if (f2fs_lookup_read_extent_cache(inode, index, &ei)) {
 		dn.data_blkaddr = ei.blk + index - ei.fofs;
 		if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
 						DATA_GENERIC_ENHANCE_READ))) {
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 2c705c60019b..086f201f15a0 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -262,8 +262,8 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		return false;
 	}
 
-	if (fi->extent_tree) {
-		struct extent_info *ei = &fi->extent_tree->largest;
+	if (fi->extent_tree[EX_READ]) {
+		struct extent_info *ei = &fi->extent_tree[EX_READ]->largest;
 
 		if (ei->len &&
 			(!f2fs_is_valid_blkaddr(sbi, ei->blk,
@@ -607,7 +607,7 @@ struct inode *f2fs_iget_retry(struct super_block *sb, unsigned long ino)
 void f2fs_update_inode(struct inode *inode, struct page *node_page)
 {
 	struct f2fs_inode *ri;
-	struct extent_tree *et = F2FS_I(inode)->extent_tree;
+	struct extent_tree *et = F2FS_I(inode)->extent_tree[EX_READ];
 
 	f2fs_wait_on_page_writeback(node_page, NODE, true, true);
 	set_page_dirty(node_page);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 84b147966080..07419c3e42a5 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -86,9 +86,11 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
 		mem_size >>= PAGE_SHIFT;
 		res = mem_size < ((avail_ram * nm_i->ram_thresh / 100) >> 1);
 	} else if (type == READ_EXTENT_CACHE) {
-		mem_size = (atomic_read(&sbi->total_ext_tree) *
+		struct extent_tree_info *eti = &sbi->extent_tree[EX_READ];
+
+		mem_size = (atomic_read(&eti->total_ext_tree) *
 				sizeof(struct extent_tree) +
-				atomic_read(&sbi->total_ext_node) *
+				atomic_read(&eti->total_ext_node) *
 				sizeof(struct extent_node)) >> PAGE_SHIFT;
 		res = mem_size < ((avail_ram * nm_i->ram_thresh / 100) >> 1);
 	} else if (type == DISCARD_CACHE) {
@@ -859,7 +861,7 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 			blkaddr = data_blkaddr(dn->inode, dn->node_page,
 						dn->ofs_in_node + 1);
 
-		f2fs_update_extent_tree_range_compressed(dn->inode,
+		f2fs_update_read_extent_tree_range_compressed(dn->inode,
 					index, blkaddr,
 					F2FS_I(dn->inode)->i_cluster_size,
 					c_len);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 51de358bc452..8722d1a13c17 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -450,7 +450,8 @@ void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi, bool from_bg)
 
 	/* try to shrink extent cache when there is no enough memory */
 	if (!f2fs_available_free_memory(sbi, READ_EXTENT_CACHE))
-		f2fs_shrink_extent_tree(sbi, READ_EXTENT_CACHE_SHRINK_NUMBER);
+		f2fs_shrink_read_extent_tree(sbi,
+				READ_EXTENT_CACHE_SHRINK_NUMBER);
 
 	/* check the # of cached NAT entries */
 	if (!f2fs_available_free_memory(sbi, NAT_ENTRIES))
diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
index dd3c3c7a90ec..33c490e69ae3 100644
--- a/fs/f2fs/shrinker.c
+++ b/fs/f2fs/shrinker.c
@@ -28,10 +28,13 @@ static unsigned long __count_free_nids(struct f2fs_sb_info *sbi)
 	return count > 0 ? count : 0;
 }
 
-static unsigned long __count_extent_cache(struct f2fs_sb_info *sbi)
+static unsigned long __count_extent_cache(struct f2fs_sb_info *sbi,
+					enum extent_type type)
 {
-	return atomic_read(&sbi->total_zombie_tree) +
-				atomic_read(&sbi->total_ext_node);
+	struct extent_tree_info *eti = &sbi->extent_tree[type];
+
+	return atomic_read(&eti->total_zombie_tree) +
+				atomic_read(&eti->total_ext_node);
 }
 
 unsigned long f2fs_shrink_count(struct shrinker *shrink,
@@ -53,8 +56,8 @@ unsigned long f2fs_shrink_count(struct shrinker *shrink,
 		}
 		spin_unlock(&f2fs_list_lock);
 
-		/* count extent cache entries */
-		count += __count_extent_cache(sbi);
+		/* count read extent cache entries */
+		count += __count_extent_cache(sbi, EX_READ);
 
 		/* count clean nat cache entries */
 		count += __count_nat_entries(sbi);
@@ -99,8 +102,8 @@ unsigned long f2fs_shrink_scan(struct shrinker *shrink,
 
 		sbi->shrinker_run_no = run_no;
 
-		/* shrink extent cache entries */
-		freed += f2fs_shrink_extent_tree(sbi, nr >> 1);
+		/* shrink read extent cache entries */
+		freed += f2fs_shrink_read_extent_tree(sbi, nr >> 1);
 
 		/* shrink clean nat cache entries */
 		if (freed < nr)
@@ -130,7 +133,7 @@ void f2fs_join_shrinker(struct f2fs_sb_info *sbi)
 
 void f2fs_leave_shrinker(struct f2fs_sb_info *sbi)
 {
-	f2fs_shrink_extent_tree(sbi, __count_extent_cache(sbi));
+	f2fs_shrink_read_extent_tree(sbi, __count_extent_cache(sbi, EX_READ));
 
 	spin_lock(&f2fs_list_lock);
 	list_del_init(&sbi->s_list);
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 7fbfce498472..2bb37892d2ba 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -48,6 +48,7 @@ TRACE_DEFINE_ENUM(CP_DISCARD);
 TRACE_DEFINE_ENUM(CP_TRIMMED);
 TRACE_DEFINE_ENUM(CP_PAUSE);
 TRACE_DEFINE_ENUM(CP_RESIZE);
+TRACE_DEFINE_ENUM(EX_READ);
 
 #define show_block_type(type)						\
 	__print_symbolic(type,						\
@@ -1522,28 +1523,31 @@ TRACE_EVENT(f2fs_issue_flush,
 
 TRACE_EVENT(f2fs_lookup_extent_tree_start,
 
-	TP_PROTO(struct inode *inode, unsigned int pgofs),
+	TP_PROTO(struct inode *inode, unsigned int pgofs, enum extent_type type),
 
-	TP_ARGS(inode, pgofs),
+	TP_ARGS(inode, pgofs, type),
 
 	TP_STRUCT__entry(
 		__field(dev_t,	dev)
 		__field(ino_t,	ino)
 		__field(unsigned int, pgofs)
+		__field(enum extent_type, type)
 	),
 
 	TP_fast_assign(
 		__entry->dev = inode->i_sb->s_dev;
 		__entry->ino = inode->i_ino;
 		__entry->pgofs = pgofs;
+		__entry->type = type;
 	),
 
-	TP_printk("dev = (%d,%d), ino = %lu, pgofs = %u",
+	TP_printk("dev = (%d,%d), ino = %lu, pgofs = %u, type = %s",
 		show_dev_ino(__entry),
-		__entry->pgofs)
+		__entry->pgofs,
+		__entry->type == EX_READ ? "Read" : "N/A")
 );
 
-TRACE_EVENT_CONDITION(f2fs_lookup_extent_tree_end,
+TRACE_EVENT_CONDITION(f2fs_lookup_read_extent_tree_end,
 
 	TP_PROTO(struct inode *inode, unsigned int pgofs,
 						struct extent_info *ei),
@@ -1557,8 +1561,8 @@ TRACE_EVENT_CONDITION(f2fs_lookup_extent_tree_end,
 		__field(ino_t,	ino)
 		__field(unsigned int, pgofs)
 		__field(unsigned int, fofs)
-		__field(u32, blk)
 		__field(unsigned int, len)
+		__field(u32, blk)
 	),
 
 	TP_fast_assign(
@@ -1566,26 +1570,26 @@ TRACE_EVENT_CONDITION(f2fs_lookup_extent_tree_end,
 		__entry->ino = inode->i_ino;
 		__entry->pgofs = pgofs;
 		__entry->fofs = ei->fofs;
-		__entry->blk = ei->blk;
 		__entry->len = ei->len;
+		__entry->blk = ei->blk;
 	),
 
 	TP_printk("dev = (%d,%d), ino = %lu, pgofs = %u, "
-		"ext_info(fofs: %u, blk: %u, len: %u)",
+		"read_ext_info(fofs: %u, len: %u, blk: %u)",
 		show_dev_ino(__entry),
 		__entry->pgofs,
 		__entry->fofs,
-		__entry->blk,
-		__entry->len)
+		__entry->len,
+		__entry->blk)
 );
 
-TRACE_EVENT(f2fs_update_extent_tree_range,
+TRACE_EVENT(f2fs_update_read_extent_tree_range,
 
-	TP_PROTO(struct inode *inode, unsigned int pgofs, block_t blkaddr,
-						unsigned int len,
+	TP_PROTO(struct inode *inode, unsigned int pgofs, unsigned int len,
+						block_t blkaddr,
 						unsigned int c_len),
 
-	TP_ARGS(inode, pgofs, blkaddr, len, c_len),
+	TP_ARGS(inode, pgofs, len, blkaddr, c_len),
 
 	TP_STRUCT__entry(
 		__field(dev_t,	dev)
@@ -1600,67 +1604,73 @@ TRACE_EVENT(f2fs_update_extent_tree_range,
 		__entry->dev = inode->i_sb->s_dev;
 		__entry->ino = inode->i_ino;
 		__entry->pgofs = pgofs;
-		__entry->blk = blkaddr;
 		__entry->len = len;
+		__entry->blk = blkaddr;
 		__entry->c_len = c_len;
 	),
 
 	TP_printk("dev = (%d,%d), ino = %lu, pgofs = %u, "
-					"blkaddr = %u, len = %u, "
-					"c_len = %u",
+				"len = %u, blkaddr = %u, c_len = %u",
 		show_dev_ino(__entry),
 		__entry->pgofs,
-		__entry->blk,
 		__entry->len,
+		__entry->blk,
 		__entry->c_len)
 );
 
 TRACE_EVENT(f2fs_shrink_extent_tree,
 
 	TP_PROTO(struct f2fs_sb_info *sbi, unsigned int node_cnt,
-						unsigned int tree_cnt),
+			unsigned int tree_cnt, enum extent_type type),
 
-	TP_ARGS(sbi, node_cnt, tree_cnt),
+	TP_ARGS(sbi, node_cnt, tree_cnt, type),
 
 	TP_STRUCT__entry(
 		__field(dev_t,	dev)
 		__field(unsigned int, node_cnt)
 		__field(unsigned int, tree_cnt)
+		__field(enum extent_type, type)
 	),
 
 	TP_fast_assign(
 		__entry->dev = sbi->sb->s_dev;
 		__entry->node_cnt = node_cnt;
 		__entry->tree_cnt = tree_cnt;
+		__entry->type = type;
 	),
 
-	TP_printk("dev = (%d,%d), shrunk: node_cnt = %u, tree_cnt = %u",
+	TP_printk("dev = (%d,%d), shrunk: node_cnt = %u, tree_cnt = %u, type = %s",
 		show_dev(__entry->dev),
 		__entry->node_cnt,
-		__entry->tree_cnt)
+		__entry->tree_cnt,
+		__entry->type == EX_READ ? "Read" : "N/A")
 );
 
 TRACE_EVENT(f2fs_destroy_extent_tree,
 
-	TP_PROTO(struct inode *inode, unsigned int node_cnt),
+	TP_PROTO(struct inode *inode, unsigned int node_cnt,
+				enum extent_type type),
 
-	TP_ARGS(inode, node_cnt),
+	TP_ARGS(inode, node_cnt, type),
 
 	TP_STRUCT__entry(
 		__field(dev_t,	dev)
 		__field(ino_t,	ino)
 		__field(unsigned int, node_cnt)
+		__field(enum extent_type, type)
 	),
 
 	TP_fast_assign(
 		__entry->dev = inode->i_sb->s_dev;
 		__entry->ino = inode->i_ino;
 		__entry->node_cnt = node_cnt;
+		__entry->type = type;
 	),
 
-	TP_printk("dev = (%d,%d), ino = %lu, destroyed: node_cnt = %u",
+	TP_printk("dev = (%d,%d), ino = %lu, destroyed: node_cnt = %u, type = %s",
 		show_dev_ino(__entry),
-		__entry->node_cnt)
+		__entry->node_cnt,
+		__entry->type == EX_READ ? "Read" : "N/A")
 );
 
 DECLARE_EVENT_CLASS(f2fs_sync_dirty_inodes,
-- 
2.39.0.rc0.267.gcb52ba06e7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
