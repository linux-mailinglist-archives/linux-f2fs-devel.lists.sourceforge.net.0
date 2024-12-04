Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D139E40D1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Dec 2024 18:12:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tIsvT-0006vM-6V;
	Wed, 04 Dec 2024 17:12:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1tIsvR-0006v5-2n
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Dec 2024 17:12:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bmESxmNg12tkBkaMfzJOEZ6YL8d21ZcJf5nuxJLYNuU=; b=k0erEOJFTLYMxULavd6r1dgXIX
 i8DyxHNOz/Iqs2QhnGnGsRBkVSFLHGHzxr3fMH3ULRLDaXoIIRbliLM1HaKeBhJO/4yhEYb+djy7W
 bcZRYe56r8wCeBIUW/PEb4pyo8Fh77/Mqk89vDWE3sx2Iid32PjqEefv1800/JwRU0cQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bmESxmNg12tkBkaMfzJOEZ6YL8d21ZcJf5nuxJLYNuU=; b=eOOH9uFcPRx6Ibm9OGh7N/7lbC
 Oq+38OQSQq9SVQQ6csavPa5+qQDDpFOnSEzj1e1aEd+86c/B15K1WeCkFL3S4xrbugYiBmWXR4nx+
 CrsY9vRi6Ce1em13Rtn/zv9Huu3zb7Ayb3bQB2AjoYp97ns/wdYuHMIliITnH5WJTU9s=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tIsvQ-0006F2-9V for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Dec 2024 17:12:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 13FE05C02C6;
 Wed,  4 Dec 2024 17:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D81C4CED1;
 Wed,  4 Dec 2024 17:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733332346;
 bh=RT25nEuL3pPhxMt3tsbeuG3Jf0YoszoV6K+VlJp8YQU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gtjy3/PABDzHAkUkpaYkHbYfQA9wMoqs2db3ypMV0OpyMttebmWhDlaAlhb+zHO17
 IGBe0zfI3QmDykimwYsYsXbVJL2VxOSxSekaP6eJHYL09nNHamle1/mSgjhvvWuN6g
 epuakFr62aoaCGAY6cxcCvg0TulElgi1dMCclTTk8pEXQGB4mX8R4xWtZFrKkoqrbP
 z4iSkO4xoCACoOf+1urCJqN/PUA5TLsGjaZlpFXDmlopnHryuhifu6B/HXyRdARR9a
 S3wjdqbghkn980jUbq76uBCgM3WN6/uvadEaov7UMFPeWPmDzjx3TfKhlqR60mqxx+
 LFRmpYaZ0Sc0Q==
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed,  4 Dec 2024 11:00:38 -0500
Message-ID: <20241204160044.2216380-13-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204160044.2216380-1-sashal@kernel.org>
References: <20241204160044.2216380-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
X-Spam-Score: -8.2 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tIsvQ-0006F2-9V
Subject: [f2fs-dev] [PATCH AUTOSEL 6.11 13/13] f2fs: fix to shrink read
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
index 62ac440d94168..368d9cbdea743 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -346,21 +346,22 @@ static struct extent_tree *__grab_extent_tree(struct inode *inode,
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
@@ -579,6 +580,30 @@ static struct extent_node *__insert_extent_tree(struct f2fs_sb_info *sbi,
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
@@ -717,9 +742,6 @@ static void __update_extent_tree_range(struct inode *inode,
 		}
 	}
 
-	if (is_inode_flag_set(inode, FI_NO_EXTENT))
-		__free_extent_tree(sbi, et);
-
 	if (et->largest_updated) {
 		et->largest_updated = false;
 		updated = true;
@@ -737,6 +759,9 @@ static void __update_extent_tree_range(struct inode *inode,
 out_read_extent_cache:
 	write_unlock(&et->lock);
 
+	if (is_inode_flag_set(inode, FI_NO_EXTENT))
+		__destroy_extent_node(inode, EX_READ);
+
 	if (updated)
 		f2fs_mark_inode_dirty_sync(inode, true);
 }
@@ -899,10 +924,14 @@ static unsigned int __shrink_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink
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
@@ -1041,23 +1070,6 @@ unsigned int f2fs_shrink_age_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink
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
@@ -1066,7 +1078,6 @@ void f2fs_destroy_extent_node(struct inode *inode)
 
 static void __drop_extent_tree(struct inode *inode, enum extent_type type)
 {
-	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct extent_tree *et = F2FS_I(inode)->extent_tree[type];
 	bool updated = false;
 
@@ -1074,7 +1085,6 @@ static void __drop_extent_tree(struct inode *inode, enum extent_type type)
 		return;
 
 	write_lock(&et->lock);
-	__free_extent_tree(sbi, et);
 	if (type == EX_READ) {
 		set_inode_flag(inode, FI_NO_EXTENT);
 		if (et->largest.len) {
@@ -1083,6 +1093,9 @@ static void __drop_extent_tree(struct inode *inode, enum extent_type type)
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
