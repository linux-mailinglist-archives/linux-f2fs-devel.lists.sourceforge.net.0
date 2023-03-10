Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8B46B5286
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Mar 2023 22:05:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pajvJ-00007W-3I;
	Fri, 10 Mar 2023 21:05:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pajvH-00007N-Tn
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Mar 2023 21:05:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=orcFZ4We/sLn3VolS68cg+8GHc9L20C0OWQsX4mIzfM=; b=Upd7Lycje8r2XQBtxW4pwFb47M
 hvSrcerYCgnsiDqwxFTE8jeL47nlLB63/l8GPhPfc/CUtvUJmHSWFQtw22hobAYAwNyV/JST5nkRP
 y+ZU9JRXTqQMwAiexqmAamM3HTJvLXw97M95vj01IVAjAsUfzfrTPfDg2Gm0gzyRHjA8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=orcFZ4We/sLn3VolS68cg+8GHc9L20C0OWQsX4mIzfM=; b=Q
 oY/h/jtBTFo0dLLVOAU6ODxfGiO4fTg73RcLuUsBMsHHzkKUDyxQColw7JrRxhGPDzYJVKv1b8coM
 9sB9LWT5LMmvCaCX9OJOh3F0yGynKDgLNRi/pRJblwM9EYrCSv2YpqjwVhdQWQR3pqpCsDJisBRR7
 xj9WV5VtsbAUafm0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pajvI-0008VV-1n for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Mar 2023 21:05:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AD09261CC7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 10 Mar 2023 21:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0D3C433EF;
 Fri, 10 Mar 2023 21:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678482301;
 bh=ufn00wP0sV8fXwjhldQV9NohBmeMthR1PV71MsYlCPw=;
 h=From:To:Cc:Subject:Date:From;
 b=DHsF0T45vo6fAiJa3vmt00EAuV4P1jQrgm3ZdvCaJGxAhzgwmDpBof9FvLQbqi2vx
 kSoKE/VuWDFMCElwt7mmVuchRCoYJhHsYHWQJBz/hby3O0jx6wtJtylH8cq/bd71hj
 dOE5wyZWANeRa5L6qzilF4mYumPlTXn5tRJTYKGloVXXmaAKtAx2FqpMylkrFrvIlX
 Zs4nfqqOvEIveiPy6MuxaaU28lGgchJXKkdTJtkol0HlbdtLFFPflqRCPzSYSX1G8O
 LS1wFGwlin1/H5iJDl6HxLp/0h6wNHBjwG98uTU6ZcKrrSLlgqCK4Z6+2M0wzTRMLF
 ZHVPY1S2Adgtg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 10 Mar 2023 13:04:52 -0800
Message-Id: <20230310210454.2350881-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's reduce the complexity of mixed use of rb_tree in
 victim_entry
 from extent_cache and discard_cmd. This should fix arm32 memory alignment
 issue caused by shared rb_entry. [struct victim_entry] [struct rb_entry]
 [0] struct rb_node rb_node; [0] struct rb_node rb_node;
 union { struct { unsigned
 int ofs; unsigned int len; }; [16] unsigned long long mtime; [12] unsigned
 lon [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pajvI-0008VV-1n
Subject: [f2fs-dev] [PATCH 1/3] f2fs: factor out victim_entry usage from
 general rb_tree use
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's reduce the complexity of mixed use of rb_tree in victim_entry from
extent_cache and discard_cmd.

This should fix arm32 memory alignment issue caused by shared rb_entry.

[struct victim_entry]              [struct rb_entry]
[0] struct rb_node rb_node;        [0] struct rb_node rb_node;
                                       union {
                                         struct {
                                           unsigned int ofs;
                                           unsigned int len;
                                         };
[16] unsigned long long mtime;     [12] unsigned long long key;
                                       } __packed;

Cc: <stable@vger.kernel.org>
Fixes: 093749e296e2 ("f2fs: support age threshold based garbage collection")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/extent_cache.c | 36 +-------------------
 fs/f2fs/f2fs.h         | 15 ++-------
 fs/f2fs/gc.c           | 74 ++++++++++++++++++++++++++++++++++--------
 fs/f2fs/gc.h           | 14 ++------
 fs/f2fs/segment.c      |  4 +--
 5 files changed, 68 insertions(+), 75 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 28b12553f2b3..d1aa4609ca6b 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -204,29 +204,6 @@ struct rb_entry *f2fs_lookup_rb_tree(struct rb_root_cached *root,
 	return re;
 }
 
-struct rb_node **f2fs_lookup_rb_tree_ext(struct f2fs_sb_info *sbi,
-					struct rb_root_cached *root,
-					struct rb_node **parent,
-					unsigned long long key, bool *leftmost)
-{
-	struct rb_node **p = &root->rb_root.rb_node;
-	struct rb_entry *re;
-
-	while (*p) {
-		*parent = *p;
-		re = rb_entry(*parent, struct rb_entry, rb_node);
-
-		if (key < re->key) {
-			p = &(*p)->rb_left;
-		} else {
-			p = &(*p)->rb_right;
-			*leftmost = false;
-		}
-	}
-
-	return p;
-}
-
 struct rb_node **f2fs_lookup_rb_tree_for_insert(struct f2fs_sb_info *sbi,
 				struct rb_root_cached *root,
 				struct rb_node **parent,
@@ -335,7 +312,7 @@ struct rb_entry *f2fs_lookup_rb_tree_ret(struct rb_root_cached *root,
 }
 
 bool f2fs_check_rb_tree_consistence(struct f2fs_sb_info *sbi,
-				struct rb_root_cached *root, bool check_key)
+				struct rb_root_cached *root)
 {
 #ifdef CONFIG_F2FS_CHECK_FS
 	struct rb_node *cur = rb_first_cached(root), *next;
@@ -352,23 +329,12 @@ bool f2fs_check_rb_tree_consistence(struct f2fs_sb_info *sbi,
 		cur_re = rb_entry(cur, struct rb_entry, rb_node);
 		next_re = rb_entry(next, struct rb_entry, rb_node);
 
-		if (check_key) {
-			if (cur_re->key > next_re->key) {
-				f2fs_info(sbi, "inconsistent rbtree, "
-					"cur(%llu) next(%llu)",
-					cur_re->key, next_re->key);
-				return false;
-			}
-			goto next;
-		}
-
 		if (cur_re->ofs + cur_re->len > next_re->ofs) {
 			f2fs_info(sbi, "inconsistent rbtree, cur(%u, %u) next(%u, %u)",
 				  cur_re->ofs, cur_re->len,
 				  next_re->ofs, next_re->len);
 			return false;
 		}
-next:
 		cur = next;
 	}
 #endif
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9c3ddebd28e3..9396549e112d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -630,13 +630,8 @@ enum extent_type {
 
 struct rb_entry {
 	struct rb_node rb_node;		/* rb node located in rb-tree */
-	union {
-		struct {
-			unsigned int ofs;	/* start offset of the entry */
-			unsigned int len;	/* length of the entry */
-		};
-		unsigned long long key;		/* 64-bits key */
-	} __packed;
+	unsigned int ofs;		/* start offset of the entry */
+	unsigned int len;		/* length of the entry */
 };
 
 struct extent_info {
@@ -4139,10 +4134,6 @@ void f2fs_leave_shrinker(struct f2fs_sb_info *sbi);
 bool sanity_check_extent_cache(struct inode *inode);
 struct rb_entry *f2fs_lookup_rb_tree(struct rb_root_cached *root,
 				struct rb_entry *cached_re, unsigned int ofs);
-struct rb_node **f2fs_lookup_rb_tree_ext(struct f2fs_sb_info *sbi,
-				struct rb_root_cached *root,
-				struct rb_node **parent,
-				unsigned long long key, bool *left_most);
 struct rb_node **f2fs_lookup_rb_tree_for_insert(struct f2fs_sb_info *sbi,
 				struct rb_root_cached *root,
 				struct rb_node **parent,
@@ -4153,7 +4144,7 @@ struct rb_entry *f2fs_lookup_rb_tree_ret(struct rb_root_cached *root,
 		struct rb_node ***insert_p, struct rb_node **insert_parent,
 		bool force, bool *leftmost);
 bool f2fs_check_rb_tree_consistence(struct f2fs_sb_info *sbi,
-				struct rb_root_cached *root, bool check_key);
+				struct rb_root_cached *root);
 void f2fs_init_extent_tree(struct inode *inode);
 void f2fs_drop_extent_tree(struct inode *inode);
 void f2fs_destroy_extent_node(struct inode *inode);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 292a17d62f56..19a6d0c54581 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -398,8 +398,7 @@ static struct victim_entry *attach_victim_entry(struct f2fs_sb_info *sbi,
 	struct atgc_management *am = &sbi->am;
 	struct victim_entry *ve;
 
-	ve =  f2fs_kmem_cache_alloc(victim_entry_slab,
-				GFP_NOFS, true, NULL);
+	ve =  f2fs_kmem_cache_alloc(victim_entry_slab, GFP_NOFS, true, NULL);
 
 	ve->mtime = mtime;
 	ve->segno = segno;
@@ -414,6 +413,29 @@ static struct victim_entry *attach_victim_entry(struct f2fs_sb_info *sbi,
 	return ve;
 }
 
+static struct rb_node **f2fs_lookup_rb_tree_ext(struct f2fs_sb_info *sbi,
+				struct rb_root_cached *root,
+				struct rb_node **parent,
+				unsigned long long mtime, bool *leftmost)
+{
+	struct rb_node **p = &root->rb_root.rb_node;
+	struct victim_entry *ve;
+
+	while (*p) {
+		*parent = *p;
+		ve = rb_entry(*parent, struct victim_entry, rb_node);
+
+		if (mtime < ve->mtime) {
+			p = &(*p)->rb_left;
+		} else {
+			p = &(*p)->rb_right;
+			*leftmost = false;
+		}
+	}
+
+	return p;
+}
+
 static void insert_victim_entry(struct f2fs_sb_info *sbi,
 				unsigned long long mtime, unsigned int segno)
 {
@@ -481,7 +503,6 @@ static void atgc_lookup_victim(struct f2fs_sb_info *sbi,
 	struct atgc_management *am = &sbi->am;
 	struct rb_root_cached *root = &am->root;
 	struct rb_node *node;
-	struct rb_entry *re;
 	struct victim_entry *ve;
 	unsigned long long total_time;
 	unsigned long long age, u, accu;
@@ -508,12 +529,10 @@ static void atgc_lookup_victim(struct f2fs_sb_info *sbi,
 
 	node = rb_first_cached(root);
 next:
-	re = rb_entry_safe(node, struct rb_entry, rb_node);
-	if (!re)
+	ve = rb_entry_safe(node, struct victim_entry, rb_node);
+	if (!ve)
 		return;
 
-	ve = (struct victim_entry *)re;
-
 	if (ve->mtime >= max_mtime || ve->mtime < min_mtime)
 		goto skip;
 
@@ -556,7 +575,6 @@ static void atssr_lookup_victim(struct f2fs_sb_info *sbi,
 	struct sit_info *sit_i = SIT_I(sbi);
 	struct atgc_management *am = &sbi->am;
 	struct rb_node *node;
-	struct rb_entry *re;
 	struct victim_entry *ve;
 	unsigned long long age;
 	unsigned long long max_mtime = sit_i->dirty_max_mtime;
@@ -576,15 +594,13 @@ static void atssr_lookup_victim(struct f2fs_sb_info *sbi,
 next_stage:
 	node = lookup_central_victim(sbi, p);
 next_node:
-	re = rb_entry_safe(node, struct rb_entry, rb_node);
-	if (!re) {
+	ve = rb_entry_safe(node, struct victim_entry, rb_node);
+	if (!ve) {
 		if (stage == 0)
 			goto skip_stage;
 		return;
 	}
 
-	ve = (struct victim_entry *)re;
-
 	if (ve->mtime >= max_mtime || ve->mtime < min_mtime)
 		goto skip_node;
 
@@ -623,11 +639,41 @@ static void atssr_lookup_victim(struct f2fs_sb_info *sbi,
 		goto next_stage;
 	}
 }
+
+static bool f2fs_check_victim_tree(struct f2fs_sb_info *sbi,
+				struct rb_root_cached *root)
+{
+#ifdef CONFIG_F2FS_CHECK_FS
+	struct rb_node *cur = rb_first_cached(root), *next;
+	struct victim_entry *cur_ve, *next_ve;
+
+	if (!cur)
+		return true;
+
+	while (cur) {
+		next = rb_next(cur);
+		if (!next)
+			return true;
+
+		cur_ve = rb_entry(cur, struct victim_entry, rb_node);
+		next_ve = rb_entry(next, struct victim_entry, rb_node);
+
+		if (cur_ve->mtime > next_ve->mtime) {
+			f2fs_info(sbi, "broken victim_rbtree, "
+				"cur_mtime(%llu) next_mtime(%llu)",
+				cur_ve->mtime, next_ve->mtime);
+			return false;
+		}
+		cur = next;
+	}
+#endif
+	return true;
+}
+
 static void lookup_victim_by_age(struct f2fs_sb_info *sbi,
 						struct victim_sel_policy *p)
 {
-	f2fs_bug_on(sbi, !f2fs_check_rb_tree_consistence(sbi,
-						&sbi->am.root, true));
+	f2fs_bug_on(sbi, !f2fs_check_victim_tree(sbi, &sbi->am.root));
 
 	if (p->gc_mode == GC_AT)
 		atgc_lookup_victim(sbi, p);
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 15bd1d680f67..5ad6ac63e13f 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -55,20 +55,10 @@ struct gc_inode_list {
 	struct radix_tree_root iroot;
 };
 
-struct victim_info {
-	unsigned long long mtime;	/* mtime of section */
-	unsigned int segno;		/* section No. */
-};
-
 struct victim_entry {
 	struct rb_node rb_node;		/* rb node located in rb-tree */
-	union {
-		struct {
-			unsigned long long mtime;	/* mtime of section */
-			unsigned int segno;		/* segment No. */
-		};
-		struct victim_info vi;	/* victim info */
-	};
+	unsigned long long mtime;	/* mtime of section */
+	unsigned int segno;		/* segment No. */
 	struct list_head list;
 };
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 227e25836173..e98a12e8dca1 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1478,7 +1478,7 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
 			goto next;
 		if (unlikely(dcc->rbtree_check))
 			f2fs_bug_on(sbi, !f2fs_check_rb_tree_consistence(sbi,
-							&dcc->root, false));
+							&dcc->root));
 		blk_start_plug(&plug);
 		list_for_each_entry_safe(dc, tmp, pend_list, list) {
 			f2fs_bug_on(sbi, dc->state != D_PREP);
@@ -2965,7 +2965,7 @@ static unsigned int __issue_discard_cmd_range(struct f2fs_sb_info *sbi,
 	mutex_lock(&dcc->cmd_lock);
 	if (unlikely(dcc->rbtree_check))
 		f2fs_bug_on(sbi, !f2fs_check_rb_tree_consistence(sbi,
-							&dcc->root, false));
+							&dcc->root));
 
 	dc = (struct discard_cmd *)f2fs_lookup_rb_tree_ret(&dcc->root,
 					NULL, start,
-- 
2.40.0.rc1.284.g88254d51c5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
