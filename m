Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCF56C82B5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Mar 2023 17:57:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pfkjc-0003VB-AI;
	Fri, 24 Mar 2023 16:57:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pfkjR-0003V0-CA
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Mar 2023 16:57:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/zZ+UrwwrNdobETs7O0/QTvVq6LiUERm3hXLPNangMM=; b=F6yRa0dbyDbusLxGVFfnmpCIqb
 vXC9SqbhO4LXIGpI7afRR1Ap+1LZv9gSboUvLJm0zTYaUSR+oNTjEZGQ4qyz4uBFjRtA6r5hYCelr
 iI/IuZeMU+9c0ojmdN2hzjSd0cjnS25gCT6HCoMIv/DmDyVlWq4lfREXexHm9BFicQRE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/zZ+UrwwrNdobETs7O0/QTvVq6LiUERm3hXLPNangMM=; b=kn+irXbmf6EVnQ9Vq5UDZSy/tH
 igANDQi8794OkYRrP4bkZQkIoNyGfbrMkYAW3cWb6J1izyXMonHoyeGtrXWR1nsI6LL6hAT8nrE7V
 MC08NyLvCq1LOjE8FbxSpyu/uE82bL2ldv9Rmb7lGqLQdZAKeu9Hpczrkt2Vt2CNXhnw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pfkjP-001p2x-EV for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Mar 2023 16:57:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 00FCE62BE6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 24 Mar 2023 16:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 491E2C433EF;
 Fri, 24 Mar 2023 16:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679677045;
 bh=sFIGZU4VJW08aosnxLVw+aE841K6hH9DxBFVc7gj26Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rn2ETUs0MU0EbD4cunOmBdH3q1/hrGUTwnpcwNYlQH7pzTlwItWYYa2eUDsLQNGv/
 eH+vbUM3ZP5LZQdWtJtr1q5lQtsI9QypHJQanecTjnDDOWFEPu5ie6Kar6VjrP48d+
 RwoctxqnIKO4Vq8YUxcOPqKosDUjVnr/dMAEolExqlzx2cyykS1s7kYSaFJV/ZH/B4
 ruAT1Zx8SOSaJUbSI9SxRkvxqAM/OND2xZz9EGHapIEwxQ/P8wN5+z1Qn7sCJfuvVg
 s7pgFifwT/dnaKlQ/qc1dk09ui4P7LhCs8at9O2Lyk+SwvQiBwFq0st7j+lwN2kzYI
 v/yTSIMHHnpPg==
Date: Fri, 24 Mar 2023 09:57:23 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <ZB3Wc6jdbvLiZNl5@google.com>
References: <20230313201216.924234-1-jaegeuk@kernel.org>
 <20230313201216.924234-3-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230313201216.924234-3-jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is a second part to remove the mixed use of rb_tree in
 discard_cmd from extent_cache. This should also fix arm32 memory alignment
 issue caused by shared rb_entry. [struct discard_cmd] [struct rb_entry] [0]
 struct rb_node rb_node; [0] struct rb_node rb_node; union { union { struct
 { struct { [16] block_t lstart; [12] unsigned int ofs; block_t len; unsigned
 int l [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pfkjP-001p2x-EV
Subject: Re: [f2fs-dev] [PATCH 2/3 v2] f2fs: factor out discard_cmd usage
 from general rb_tree use
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
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is a second part to remove the mixed use of rb_tree in discard_cmd from
extent_cache.

This should also fix arm32 memory alignment issue caused by shared rb_entry.

[struct discard_cmd]               [struct rb_entry]
[0] struct rb_node rb_node;        [0] struct rb_node rb_node;
  union {                              union {
    struct {                             struct {
[16]  block_t lstart;              [12]    unsigned int ofs;
      block_t len;                         unsigned int len;
                                         };
                                         unsigned long long key;
                                       } __packed;

Cc: <stable@vger.kernel.org>
Fixes: 004b68621897 ("f2fs: use rb-tree to track pending discard commands")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 Change log from v1:
  - fix a bug when spliting/merging discard commands

 fs/f2fs/extent_cache.c |  36 +-----
 fs/f2fs/f2fs.h         |  23 +---
 fs/f2fs/segment.c      | 249 +++++++++++++++++++++++++++--------------
 3 files changed, 169 insertions(+), 139 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index d1aa4609ca6b..5c206f941aac 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -192,7 +192,7 @@ static struct rb_entry *__lookup_rb_tree_slow(struct rb_root_cached *root,
 	return NULL;
 }
 
-struct rb_entry *f2fs_lookup_rb_tree(struct rb_root_cached *root,
+static struct rb_entry *f2fs_lookup_rb_tree(struct rb_root_cached *root,
 				struct rb_entry *cached_re, unsigned int ofs)
 {
 	struct rb_entry *re;
@@ -204,7 +204,7 @@ struct rb_entry *f2fs_lookup_rb_tree(struct rb_root_cached *root,
 	return re;
 }
 
-struct rb_node **f2fs_lookup_rb_tree_for_insert(struct f2fs_sb_info *sbi,
+static struct rb_node **f2fs_lookup_rb_tree_for_insert(struct f2fs_sb_info *sbi,
 				struct rb_root_cached *root,
 				struct rb_node **parent,
 				unsigned int ofs, bool *leftmost)
@@ -238,7 +238,7 @@ struct rb_node **f2fs_lookup_rb_tree_for_insert(struct f2fs_sb_info *sbi,
  * in order to simplify the insertion after.
  * tree must stay unchanged between lookup and insertion.
  */
-struct rb_entry *f2fs_lookup_rb_tree_ret(struct rb_root_cached *root,
+static struct rb_entry *f2fs_lookup_rb_tree_ret(struct rb_root_cached *root,
 				struct rb_entry *cached_re,
 				unsigned int ofs,
 				struct rb_entry **prev_entry,
@@ -311,36 +311,6 @@ struct rb_entry *f2fs_lookup_rb_tree_ret(struct rb_root_cached *root,
 	return re;
 }
 
-bool f2fs_check_rb_tree_consistence(struct f2fs_sb_info *sbi,
-				struct rb_root_cached *root)
-{
-#ifdef CONFIG_F2FS_CHECK_FS
-	struct rb_node *cur = rb_first_cached(root), *next;
-	struct rb_entry *cur_re, *next_re;
-
-	if (!cur)
-		return true;
-
-	while (cur) {
-		next = rb_next(cur);
-		if (!next)
-			return true;
-
-		cur_re = rb_entry(cur, struct rb_entry, rb_node);
-		next_re = rb_entry(next, struct rb_entry, rb_node);
-
-		if (cur_re->ofs + cur_re->len > next_re->ofs) {
-			f2fs_info(sbi, "inconsistent rbtree, cur(%u, %u) next(%u, %u)",
-				  cur_re->ofs, cur_re->len,
-				  next_re->ofs, next_re->len);
-			return false;
-		}
-		cur = next;
-	}
-#endif
-	return true;
-}
-
 static struct kmem_cache *extent_tree_slab;
 static struct kmem_cache *extent_node_slab;
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9396549e112d..6e04fea9c34f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -353,15 +353,7 @@ struct discard_info {
 
 struct discard_cmd {
 	struct rb_node rb_node;		/* rb node located in rb-tree */
-	union {
-		struct {
-			block_t lstart;	/* logical start address */
-			block_t len;	/* length */
-			block_t start;	/* actual start address in dev */
-		};
-		struct discard_info di;	/* discard info */
-
-	};
+	struct discard_info di;		/* discard info */
 	struct list_head list;		/* command list */
 	struct completion wait;		/* compleation */
 	struct block_device *bdev;	/* bdev */
@@ -4132,19 +4124,6 @@ void f2fs_leave_shrinker(struct f2fs_sb_info *sbi);
  * extent_cache.c
  */
 bool sanity_check_extent_cache(struct inode *inode);
-struct rb_entry *f2fs_lookup_rb_tree(struct rb_root_cached *root,
-				struct rb_entry *cached_re, unsigned int ofs);
-struct rb_node **f2fs_lookup_rb_tree_for_insert(struct f2fs_sb_info *sbi,
-				struct rb_root_cached *root,
-				struct rb_node **parent,
-				unsigned int ofs, bool *leftmost);
-struct rb_entry *f2fs_lookup_rb_tree_ret(struct rb_root_cached *root,
-		struct rb_entry *cached_re, unsigned int ofs,
-		struct rb_entry **prev_entry, struct rb_entry **next_entry,
-		struct rb_node ***insert_p, struct rb_node **insert_parent,
-		bool force, bool *leftmost);
-bool f2fs_check_rb_tree_consistence(struct f2fs_sb_info *sbi,
-				struct rb_root_cached *root);
 void f2fs_init_extent_tree(struct inode *inode);
 void f2fs_drop_extent_tree(struct inode *inode);
 void f2fs_destroy_extent_node(struct inode *inode);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index e98a12e8dca1..d135046108ef 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -933,9 +933,9 @@ static struct discard_cmd *__create_discard_cmd(struct f2fs_sb_info *sbi,
 	dc = f2fs_kmem_cache_alloc(discard_cmd_slab, GFP_NOFS, true, NULL);
 	INIT_LIST_HEAD(&dc->list);
 	dc->bdev = bdev;
-	dc->lstart = lstart;
-	dc->start = start;
-	dc->len = len;
+	dc->di.lstart = lstart;
+	dc->di.start = start;
+	dc->di.len = len;
 	dc->ref = 0;
 	dc->state = D_PREP;
 	dc->queued = 0;
@@ -950,20 +950,108 @@ static struct discard_cmd *__create_discard_cmd(struct f2fs_sb_info *sbi,
 	return dc;
 }
 
-static struct discard_cmd *__attach_discard_cmd(struct f2fs_sb_info *sbi,
-				struct block_device *bdev, block_t lstart,
-				block_t start, block_t len,
-				struct rb_node *parent, struct rb_node **p,
-				bool leftmost)
+static bool f2fs_check_discard_tree(struct f2fs_sb_info *sbi)
+{
+#ifdef CONFIG_F2FS_CHECK_FS
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	struct rb_node *cur = rb_first_cached(&dcc->root), *next;
+	struct discard_cmd *cur_dc, *next_dc;
+
+	while (cur) {
+		next = rb_next(cur);
+		if (!next)
+			return true;
+
+		cur_dc = rb_entry(cur, struct discard_cmd, rb_node);
+		next_dc = rb_entry(next, struct discard_cmd, rb_node);
+
+		if (cur_dc->di.lstart + cur_dc->di.len > next_dc->di.lstart) {
+			f2fs_info(sbi, "broken discard_rbtree, "
+				"cur(%u, %u) next(%u, %u)",
+				cur_dc->di.lstart, cur_dc->di.len,
+				next_dc->di.lstart, next_dc->di.len);
+			return false;
+		}
+		cur = next;
+	}
+#endif
+	return true;
+}
+
+static struct discard_cmd *__lookup_discard_cmd(struct f2fs_sb_info *sbi,
+						block_t blkaddr)
 {
 	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	struct rb_node *node = dcc->root.rb_root.rb_node;
 	struct discard_cmd *dc;
 
-	dc = __create_discard_cmd(sbi, bdev, lstart, start, len);
+	while (node) {
+		dc = rb_entry(node, struct discard_cmd, rb_node);
 
-	rb_link_node(&dc->rb_node, parent, p);
-	rb_insert_color_cached(&dc->rb_node, &dcc->root, leftmost);
+		if (blkaddr < dc->di.lstart)
+			node = node->rb_left;
+		else if (blkaddr >= dc->di.lstart + dc->di.len)
+			node = node->rb_right;
+		else
+			return dc;
+	}
+	return NULL;
+}
+
+static struct discard_cmd *__lookup_discard_cmd_ret(struct rb_root_cached *root,
+				block_t blkaddr,
+				struct discard_cmd **prev_entry,
+				struct discard_cmd **next_entry,
+				struct rb_node ***insert_p,
+				struct rb_node **insert_parent)
+{
+	struct rb_node **pnode = &root->rb_root.rb_node;
+	struct rb_node *parent = NULL, *tmp_node;
+	struct discard_cmd *dc;
+
+	*insert_p = NULL;
+	*insert_parent = NULL;
+	*prev_entry = NULL;
+	*next_entry = NULL;
+
+	if (RB_EMPTY_ROOT(&root->rb_root))
+		return NULL;
+
+	while (*pnode) {
+		parent = *pnode;
+		dc = rb_entry(*pnode, struct discard_cmd, rb_node);
+
+		if (blkaddr < dc->di.lstart)
+			pnode = &(*pnode)->rb_left;
+		else if (blkaddr >= dc->di.lstart + dc->di.len)
+			pnode = &(*pnode)->rb_right;
+		else
+			goto lookup_neighbors;
+	}
+
+	*insert_p = pnode;
+	*insert_parent = parent;
+
+	dc = rb_entry(parent, struct discard_cmd, rb_node);
+	tmp_node = parent;
+	if (parent && blkaddr > dc->di.lstart)
+		tmp_node = rb_next(parent);
+	*next_entry = rb_entry_safe(tmp_node, struct discard_cmd, rb_node);
+
+	tmp_node = parent;
+	if (parent && blkaddr < dc->di.lstart)
+		tmp_node = rb_prev(parent);
+	*prev_entry = rb_entry_safe(tmp_node, struct discard_cmd, rb_node);
+	return NULL;
+
+lookup_neighbors:
+	/* lookup prev node for merging backward later */
+	tmp_node = rb_prev(&dc->rb_node);
+	*prev_entry = rb_entry_safe(tmp_node, struct discard_cmd, rb_node);
 
+	/* lookup next node for merging frontward later */
+	tmp_node = rb_next(&dc->rb_node);
+	*next_entry = rb_entry_safe(tmp_node, struct discard_cmd, rb_node);
 	return dc;
 }
 
@@ -975,7 +1063,7 @@ static void __detach_discard_cmd(struct discard_cmd_control *dcc,
 
 	list_del(&dc->list);
 	rb_erase_cached(&dc->rb_node, &dcc->root);
-	dcc->undiscard_blks -= dc->len;
+	dcc->undiscard_blks -= dc->di.len;
 
 	kmem_cache_free(discard_cmd_slab, dc);
 
@@ -988,7 +1076,7 @@ static void __remove_discard_cmd(struct f2fs_sb_info *sbi,
 	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
 	unsigned long flags;
 
-	trace_f2fs_remove_discard(dc->bdev, dc->start, dc->len);
+	trace_f2fs_remove_discard(dc->bdev, dc->di.start, dc->di.len);
 
 	spin_lock_irqsave(&dc->lock, flags);
 	if (dc->bio_ref) {
@@ -1006,7 +1094,7 @@ static void __remove_discard_cmd(struct f2fs_sb_info *sbi,
 		printk_ratelimited(
 			"%sF2FS-fs (%s): Issue discard(%u, %u, %u) failed, ret: %d",
 			KERN_INFO, sbi->sb->s_id,
-			dc->lstart, dc->start, dc->len, dc->error);
+			dc->di.lstart, dc->di.start, dc->di.len, dc->error);
 	__detach_discard_cmd(dcc, dc);
 }
 
@@ -1122,14 +1210,14 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK))
 		return 0;
 
-	trace_f2fs_issue_discard(bdev, dc->start, dc->len);
+	trace_f2fs_issue_discard(bdev, dc->di.start, dc->di.len);
 
-	lstart = dc->lstart;
-	start = dc->start;
-	len = dc->len;
+	lstart = dc->di.lstart;
+	start = dc->di.start;
+	len = dc->di.len;
 	total_len = len;
 
-	dc->len = 0;
+	dc->di.len = 0;
 
 	while (total_len && *issued < dpolicy->max_requests && !err) {
 		struct bio *bio = NULL;
@@ -1145,7 +1233,7 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 		if (*issued == dpolicy->max_requests)
 			last = true;
 
-		dc->len += len;
+		dc->di.len += len;
 
 		if (time_to_inject(sbi, FAULT_DISCARD)) {
 			err = -EIO;
@@ -1207,34 +1295,41 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 	return err;
 }
 
-static void __insert_discard_tree(struct f2fs_sb_info *sbi,
+static void __insert_discard_cmd(struct f2fs_sb_info *sbi,
 				struct block_device *bdev, block_t lstart,
-				block_t start, block_t len,
-				struct rb_node **insert_p,
-				struct rb_node *insert_parent)
+				block_t start, block_t len)
 {
 	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
-	struct rb_node **p;
+	struct rb_node **p = &dcc->root.rb_root.rb_node;
 	struct rb_node *parent = NULL;
+	struct discard_cmd *dc;
 	bool leftmost = true;
 
-	if (insert_p && insert_parent) {
-		parent = insert_parent;
-		p = insert_p;
-		goto do_insert;
+	/* look up rb tree to find parent node */
+	while (*p) {
+		parent = *p;
+		dc = rb_entry(parent, struct discard_cmd, rb_node);
+
+		if (lstart < dc->di.lstart) {
+			p = &(*p)->rb_left;
+		} else if (lstart >= dc->di.lstart + dc->di.len) {
+			p = &(*p)->rb_right;
+			leftmost = false;
+		} else {
+			f2fs_bug_on(sbi, 1);
+		}
 	}
 
-	p = f2fs_lookup_rb_tree_for_insert(sbi, &dcc->root, &parent,
-							lstart, &leftmost);
-do_insert:
-	__attach_discard_cmd(sbi, bdev, lstart, start, len, parent,
-								p, leftmost);
+	dc = __create_discard_cmd(sbi, bdev, lstart, start, len);
+
+	rb_link_node(&dc->rb_node, parent, p);
+	rb_insert_color_cached(&dc->rb_node, &dcc->root, leftmost);
 }
 
 static void __relocate_discard_cmd(struct discard_cmd_control *dcc,
 						struct discard_cmd *dc)
 {
-	list_move_tail(&dc->list, &dcc->pend_list[plist_idx(dc->len)]);
+	list_move_tail(&dc->list, &dcc->pend_list[plist_idx(dc->di.len)]);
 }
 
 static void __punch_discard_cmd(struct f2fs_sb_info *sbi,
@@ -1244,7 +1339,7 @@ static void __punch_discard_cmd(struct f2fs_sb_info *sbi,
 	struct discard_info di = dc->di;
 	bool modified = false;
 
-	if (dc->state == D_DONE || dc->len == 1) {
+	if (dc->state == D_DONE || dc->di.len == 1) {
 		__remove_discard_cmd(sbi, dc);
 		return;
 	}
@@ -1252,23 +1347,22 @@ static void __punch_discard_cmd(struct f2fs_sb_info *sbi,
 	dcc->undiscard_blks -= di.len;
 
 	if (blkaddr > di.lstart) {
-		dc->len = blkaddr - dc->lstart;
-		dcc->undiscard_blks += dc->len;
+		dc->di.len = blkaddr - dc->di.lstart;
+		dcc->undiscard_blks += dc->di.len;
 		__relocate_discard_cmd(dcc, dc);
 		modified = true;
 	}
 
 	if (blkaddr < di.lstart + di.len - 1) {
 		if (modified) {
-			__insert_discard_tree(sbi, dc->bdev, blkaddr + 1,
+			__insert_discard_cmd(sbi, dc->bdev, blkaddr + 1,
 					di.start + blkaddr + 1 - di.lstart,
-					di.lstart + di.len - 1 - blkaddr,
-					NULL, NULL);
+					di.lstart + di.len - 1 - blkaddr);
 		} else {
-			dc->lstart++;
-			dc->len--;
-			dc->start++;
-			dcc->undiscard_blks += dc->len;
+			dc->di.lstart++;
+			dc->di.len--;
+			dc->di.start++;
+			dcc->undiscard_blks += dc->di.len;
 			__relocate_discard_cmd(dcc, dc);
 		}
 	}
@@ -1287,17 +1381,14 @@ static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
 			SECTOR_TO_BLOCK(bdev_max_discard_sectors(bdev));
 	block_t end = lstart + len;
 
-	dc = (struct discard_cmd *)f2fs_lookup_rb_tree_ret(&dcc->root,
-					NULL, lstart,
-					(struct rb_entry **)&prev_dc,
-					(struct rb_entry **)&next_dc,
-					&insert_p, &insert_parent, true, NULL);
+	dc = __lookup_discard_cmd_ret(&dcc->root, lstart,
+				&prev_dc, &next_dc, &insert_p, &insert_parent);
 	if (dc)
 		prev_dc = dc;
 
 	if (!prev_dc) {
 		di.lstart = lstart;
-		di.len = next_dc ? next_dc->lstart - lstart : len;
+		di.len = next_dc ? next_dc->di.lstart - lstart : len;
 		di.len = min(di.len, len);
 		di.start = start;
 	}
@@ -1308,16 +1399,16 @@ static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
 		struct discard_cmd *tdc = NULL;
 
 		if (prev_dc) {
-			di.lstart = prev_dc->lstart + prev_dc->len;
+			di.lstart = prev_dc->di.lstart + prev_dc->di.len;
 			if (di.lstart < lstart)
 				di.lstart = lstart;
 			if (di.lstart >= end)
 				break;
 
-			if (!next_dc || next_dc->lstart > end)
+			if (!next_dc || next_dc->di.lstart > end)
 				di.len = end - di.lstart;
 			else
-				di.len = next_dc->lstart - di.lstart;
+				di.len = next_dc->di.lstart - di.lstart;
 			di.start = start + di.lstart - lstart;
 		}
 
@@ -1350,10 +1441,9 @@ static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
 			merged = true;
 		}
 
-		if (!merged) {
-			__insert_discard_tree(sbi, bdev, di.lstart, di.start,
-							di.len, NULL, NULL);
-		}
+		if (!merged)
+			__insert_discard_cmd(sbi, bdev,
+						di.lstart, di.start, di.len);
  next:
 		prev_dc = next_dc;
 		if (!prev_dc)
@@ -1392,15 +1482,11 @@ static void __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
 	struct rb_node **insert_p = NULL, *insert_parent = NULL;
 	struct discard_cmd *dc;
 	struct blk_plug plug;
-	unsigned int pos = dcc->next_pos;
 	bool io_interrupted = false;
 
 	mutex_lock(&dcc->cmd_lock);
-	dc = (struct discard_cmd *)f2fs_lookup_rb_tree_ret(&dcc->root,
-					NULL, pos,
-					(struct rb_entry **)&prev_dc,
-					(struct rb_entry **)&next_dc,
-					&insert_p, &insert_parent, true, NULL);
+	dc = __lookup_discard_cmd_ret(&dcc->root, dcc->next_pos,
+				&prev_dc, &next_dc, &insert_p, &insert_parent);
 	if (!dc)
 		dc = next_dc;
 
@@ -1418,7 +1504,7 @@ static void __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
 			break;
 		}
 
-		dcc->next_pos = dc->lstart + dc->len;
+		dcc->next_pos = dc->di.lstart + dc->di.len;
 		err = __submit_discard_cmd(sbi, dpolicy, dc, issued);
 
 		if (*issued >= dpolicy->max_requests)
@@ -1477,8 +1563,7 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
 		if (list_empty(pend_list))
 			goto next;
 		if (unlikely(dcc->rbtree_check))
-			f2fs_bug_on(sbi, !f2fs_check_rb_tree_consistence(sbi,
-							&dcc->root));
+			f2fs_bug_on(sbi, !f2fs_check_discard_tree(sbi));
 		blk_start_plug(&plug);
 		list_for_each_entry_safe(dc, tmp, pend_list, list) {
 			f2fs_bug_on(sbi, dc->state != D_PREP);
@@ -1556,7 +1641,7 @@ static unsigned int __wait_one_discard_bio(struct f2fs_sb_info *sbi,
 	dc->ref--;
 	if (!dc->ref) {
 		if (!dc->error)
-			len = dc->len;
+			len = dc->di.len;
 		__remove_discard_cmd(sbi, dc);
 	}
 	mutex_unlock(&dcc->cmd_lock);
@@ -1579,14 +1664,15 @@ static unsigned int __wait_discard_cmd_range(struct f2fs_sb_info *sbi,
 
 	mutex_lock(&dcc->cmd_lock);
 	list_for_each_entry_safe(iter, tmp, wait_list, list) {
-		if (iter->lstart + iter->len <= start || end <= iter->lstart)
+		if (iter->di.lstart + iter->di.len <= start ||
+					end <= iter->di.lstart)
 			continue;
-		if (iter->len < dpolicy->granularity)
+		if (iter->di.len < dpolicy->granularity)
 			continue;
 		if (iter->state == D_DONE && !iter->ref) {
 			wait_for_completion_io(&iter->wait);
 			if (!iter->error)
-				trimmed += iter->len;
+				trimmed += iter->di.len;
 			__remove_discard_cmd(sbi, iter);
 		} else {
 			iter->ref++;
@@ -1630,8 +1716,7 @@ static void f2fs_wait_discard_bio(struct f2fs_sb_info *sbi, block_t blkaddr)
 	bool need_wait = false;
 
 	mutex_lock(&dcc->cmd_lock);
-	dc = (struct discard_cmd *)f2fs_lookup_rb_tree(&dcc->root,
-							NULL, blkaddr);
+	dc = __lookup_discard_cmd(sbi, blkaddr);
 	if (dc) {
 		if (dc->state == D_PREP) {
 			__punch_discard_cmd(sbi, dc, blkaddr);
@@ -2964,24 +3049,20 @@ static unsigned int __issue_discard_cmd_range(struct f2fs_sb_info *sbi,
 
 	mutex_lock(&dcc->cmd_lock);
 	if (unlikely(dcc->rbtree_check))
-		f2fs_bug_on(sbi, !f2fs_check_rb_tree_consistence(sbi,
-							&dcc->root));
-
-	dc = (struct discard_cmd *)f2fs_lookup_rb_tree_ret(&dcc->root,
-					NULL, start,
-					(struct rb_entry **)&prev_dc,
-					(struct rb_entry **)&next_dc,
-					&insert_p, &insert_parent, true, NULL);
+		f2fs_bug_on(sbi, !f2fs_check_discard_tree(sbi));
+
+	dc = __lookup_discard_cmd_ret(&dcc->root, start,
+				&prev_dc, &next_dc, &insert_p, &insert_parent);
 	if (!dc)
 		dc = next_dc;
 
 	blk_start_plug(&plug);
 
-	while (dc && dc->lstart <= end) {
+	while (dc && dc->di.lstart <= end) {
 		struct rb_node *node;
 		int err = 0;
 
-		if (dc->len < dpolicy->granularity)
+		if (dc->di.len < dpolicy->granularity)
 			goto skip;
 
 		if (dc->state != D_PREP) {
@@ -2992,7 +3073,7 @@ static unsigned int __issue_discard_cmd_range(struct f2fs_sb_info *sbi,
 		err = __submit_discard_cmd(sbi, dpolicy, dc, &issued);
 
 		if (issued >= dpolicy->max_requests) {
-			start = dc->lstart + dc->len;
+			start = dc->di.lstart + dc->di.len;
 
 			if (err)
 				__remove_discard_cmd(sbi, dc);
-- 
2.40.0.348.gf938b09366-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
