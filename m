Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E6B9E40DD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Dec 2024 18:13:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tIsvu-0006zV-QK;
	Wed, 04 Dec 2024 17:13:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1tIsvu-0006zL-2l
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Dec 2024 17:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jLwjAY2bEtME6vWzNqV1T/rNQvtNpmaOgplNqW2e3Y4=; b=W9dq8de02XWk/+FUFkLVjsUlWa
 LnDZlYDG/AqH9sfGnxyvnMAS4dKrt2V0i3CNBllXVqUdFKrPuONCW0wz9ZMA8tGFf/qb1qZ00bEjF
 +4Da6r5AysJ7SalY5gHzVjpz/UgSEaRgC8SPZJSpYUcAw1S9m02/snoP0qy78OPRTpFM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jLwjAY2bEtME6vWzNqV1T/rNQvtNpmaOgplNqW2e3Y4=; b=gs+Mn9J4Xf1sbh/Ep2gj2hFnKu
 AtG8VlTW5Yjg9y4if8cw7d+IuUjzBA94wEQk8zVdGfWn5CD6AbmWfhAqK9mQkRglXa4lwvfDz5SLX
 iG3XXv+HV32wY08tmYvEsajuEPoorB15M5e/+7TeaaLHBsLC+Q1NIfnJvAa3/M4pWBdc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tIsvt-0006Ha-4C for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Dec 2024 17:13:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E06D35C6F62;
 Wed,  4 Dec 2024 17:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95671C4CED1;
 Wed,  4 Dec 2024 17:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733332375;
 bh=uDF5ly0FsJEiGHXV0nkl+/APK79l2V5iLtxfKTkjEi4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YmTlDX5UvSZNfqW7x9BemyqV8TXieVOkgiJp6V9MqX0BAY4WesyX8HAZKWGar+Ica
 VpOilf/2QCU/+etuKKlZlbNx/1EceaOt/xLskX3qEhn1yVU4fVkxh+mR50BEUHQDa2
 ZYtobnhVaVIazK09evE7GNbLxz6o/mNhdM3huBTWtjruuULL1eMItQMocKgbzC/Rs1
 TMMA4pDJ4BDJUAZNRZcE47M8DUqnBSYxc+j2+BK+HMpOEZdd0Vpj6omzs3k36nQxVs
 Wm+QnEhcgrRRBpzN0ddkdnIHZcfPY1hpzB6xCDWmiZQxGYBB/LWPIdmhPLwMRLBvT0
 7Ucaa3orqiwaA==
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed,  4 Dec 2024 11:01:09 -0500
Message-ID: <20241204160115.2216718-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204160115.2216718-1-sashal@kernel.org>
References: <20241204160115.2216718-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.63
X-Spam-Score: -8.2 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao@kernel.org> [ Upstream commit
 3fc5d5a182f6a1f8bd4dc775feb54c369dd2c343
 ] We use rwlock to protect core structure data of extent tree during its
 shrink, however, if there is a huge number of extent nodes in extent tree,
 during shrink of extent tree, it may hold rwlock for a [...] 
 Content analysis details:   (-8.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tIsvt-0006Ha-4C
Subject: [f2fs-dev] [PATCH AUTOSEL 6.6 12/12] f2fs: fix to shrink read
 extent node in batches
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
From: Sasha Levin via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sasha Levin <sashal@kernel.org>
Cc: Xiuhong Wang <xiuhong.wang@unisoc.com>, Sasha Levin <sashal@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chao@kernel.org>

[ Upstream commit 3fc5d5a182f6a1f8bd4dc775feb54c369dd2c343 ]

We use rwlock to protect core structure data of extent tree during
its shrink, however, if there is a huge number of extent nodes in
extent tree, during shrink of extent tree, it may hold rwlock for
a very long time, which may trigger kernel hang issue.

This patch fixes to shrink read extent node in batches, so that,
critical region of the rwlock can be shrunk to avoid its extreme
long time hold.

Reported-by: Xiuhong Wang <xiuhong.wang@unisoc.com>
Closes: https://lore.kernel.org/linux-f2fs-devel/20241112110627.1314632-1-xiuhong.wang@unisoc.com/
Signed-off-by: Xiuhong Wang <xiuhong.wang@unisoc.com>
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/extent_cache.c | 69 +++++++++++++++++++++++++-----------------
 1 file changed, 41 insertions(+), 28 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index d6fb053b6dfbb..bfa2d89dc9ea3 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -347,21 +347,22 @@ static struct extent_tree *__grab_extent_tree(struct inode *inode,
 }
 
 static unsigned int __free_extent_tree(struct f2fs_sb_info *sbi,
-					struct extent_tree *et)
+				struct extent_tree *et, unsigned int nr_shrink)
 {
 	struct rb_node *node, *next;
 	struct extent_node *en;
-	unsigned int count = atomic_read(&et->node_cnt);
+	unsigned int count;
 
 	node = rb_first_cached(&et->root);
-	while (node) {
+
+	for (count = 0; node && count < nr_shrink; count++) {
 		next = rb_next(node);
 		en = rb_entry(node, struct extent_node, rb_node);
 		__release_extent_node(sbi, et, en);
 		node = next;
 	}
 
-	return count - atomic_read(&et->node_cnt);
+	return count;
 }
 
 static void __drop_largest_extent(struct extent_tree *et,
@@ -580,6 +581,30 @@ static struct extent_node *__insert_extent_tree(struct f2fs_sb_info *sbi,
 	return en;
 }
 
+static unsigned int __destroy_extent_node(struct inode *inode,
+					enum extent_type type)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct extent_tree *et = F2FS_I(inode)->extent_tree[type];
+	unsigned int nr_shrink = type == EX_READ ?
+				READ_EXTENT_CACHE_SHRINK_NUMBER :
+				AGE_EXTENT_CACHE_SHRINK_NUMBER;
+	unsigned int node_cnt = 0;
+
+	if (!et || !atomic_read(&et->node_cnt))
+		return 0;
+
+	while (atomic_read(&et->node_cnt)) {
+		write_lock(&et->lock);
+		node_cnt += __free_extent_tree(sbi, et, nr_shrink);
+		write_unlock(&et->lock);
+	}
+
+	f2fs_bug_on(sbi, atomic_read(&et->node_cnt));
+
+	return node_cnt;
+}
+
 static void __update_extent_tree_range(struct inode *inode,
 			struct extent_info *tei, enum extent_type type)
 {
@@ -718,9 +743,6 @@ static void __update_extent_tree_range(struct inode *inode,
 		}
 	}
 
-	if (is_inode_flag_set(inode, FI_NO_EXTENT))
-		__free_extent_tree(sbi, et);
-
 	if (et->largest_updated) {
 		et->largest_updated = false;
 		updated = true;
@@ -738,6 +760,9 @@ static void __update_extent_tree_range(struct inode *inode,
 out_read_extent_cache:
 	write_unlock(&et->lock);
 
+	if (is_inode_flag_set(inode, FI_NO_EXTENT))
+		__destroy_extent_node(inode, EX_READ);
+
 	if (updated)
 		f2fs_mark_inode_dirty_sync(inode, true);
 }
@@ -902,10 +927,14 @@ static unsigned int __shrink_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink
 	list_for_each_entry_safe(et, next, &eti->zombie_list, list) {
 		if (atomic_read(&et->node_cnt)) {
 			write_lock(&et->lock);
-			node_cnt += __free_extent_tree(sbi, et);
+			node_cnt += __free_extent_tree(sbi, et,
+					nr_shrink - node_cnt - tree_cnt);
 			write_unlock(&et->lock);
 		}
-		f2fs_bug_on(sbi, atomic_read(&et->node_cnt));
+
+		if (atomic_read(&et->node_cnt))
+			goto unlock_out;
+
 		list_del_init(&et->list);
 		radix_tree_delete(&eti->extent_tree_root, et->ino);
 		kmem_cache_free(extent_tree_slab, et);
@@ -1044,23 +1073,6 @@ unsigned int f2fs_shrink_age_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink
 	return __shrink_extent_tree(sbi, nr_shrink, EX_BLOCK_AGE);
 }
 
-static unsigned int __destroy_extent_node(struct inode *inode,
-					enum extent_type type)
-{
-	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct extent_tree *et = F2FS_I(inode)->extent_tree[type];
-	unsigned int node_cnt = 0;
-
-	if (!et || !atomic_read(&et->node_cnt))
-		return 0;
-
-	write_lock(&et->lock);
-	node_cnt = __free_extent_tree(sbi, et);
-	write_unlock(&et->lock);
-
-	return node_cnt;
-}
-
 void f2fs_destroy_extent_node(struct inode *inode)
 {
 	__destroy_extent_node(inode, EX_READ);
@@ -1069,7 +1081,6 @@ void f2fs_destroy_extent_node(struct inode *inode)
 
 static void __drop_extent_tree(struct inode *inode, enum extent_type type)
 {
-	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct extent_tree *et = F2FS_I(inode)->extent_tree[type];
 	bool updated = false;
 
@@ -1077,7 +1088,6 @@ static void __drop_extent_tree(struct inode *inode, enum extent_type type)
 		return;
 
 	write_lock(&et->lock);
-	__free_extent_tree(sbi, et);
 	if (type == EX_READ) {
 		set_inode_flag(inode, FI_NO_EXTENT);
 		if (et->largest.len) {
@@ -1086,6 +1096,9 @@ static void __drop_extent_tree(struct inode *inode, enum extent_type type)
 		}
 	}
 	write_unlock(&et->lock);
+
+	__destroy_extent_node(inode, type);
+
 	if (updated)
 		f2fs_mark_inode_dirty_sync(inode, true);
 }
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
