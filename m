Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C2AB15467
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Jul 2025 22:47:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CckIzFwi7c0mjdrEpZXqzEhI+zBNoRxgYuUQDwXhwxI=; b=IKcmkHjsBfgK8DZWn/FbQ95fk4
	oGSuw5FgSUicxkEFmgKeTKqKiYoXGyIfK4mcUphGfrEnDOjPUo9YF6KnmEHrLw3jwDaxu9F9OBk+8
	MckEVKFa795i6qJvREAL4n2vMd68ynh9ItrIC79PhYWhNYVXefKaJnfsEWkkw9yzc8GM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ugrEV-0007sX-71;
	Tue, 29 Jul 2025 20:47:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ugrET-0007sI-75
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Jul 2025 20:47:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DvF9GbdGHWRzE+9IRjVgkQp2UI84fFskszGfqICZuKI=; b=QFdVWG/xgmttZYMLS9sA7t4kFa
 o5+/IH4Cq/3z7694/CXn/3FvmefyC9FDKWqd4c0p2L8A90v47qyiggDSN5xJc4EJbBj6PQViISm5m
 6OITPc4zvmlLMgrv0zXnfrFi0iYKCVljaNOuIjiBtid8d3oT7Pa1/hhwMeQe5J5A4IzE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DvF9GbdGHWRzE+9IRjVgkQp2UI84fFskszGfqICZuKI=; b=T
 0WeFrtRXZm4khIucyM7Pz2qLMDMFF8pKZ9RbG3nVK2t23sermfuF5Ha4zmbsWvBj1rqfSC5tqeBW6
 n3tLEhBHN3nvtSYkpDJMrCZ/aU7Dfm+kXLiHnZi6N5CMnCN1+XymggiHWorm14rUBBiU+23DTccZU
 dieXRtidlGRU56qE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ugrET-0003wT-8s for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Jul 2025 20:47:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2329F5C5B30
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 29 Jul 2025 20:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4036C4CEEF;
 Tue, 29 Jul 2025 20:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753822041;
 bh=b6s0yx8astzM5SvN+qTAi1m/KmlWhi4qvNDzaSolpqo=;
 h=From:To:Cc:Subject:Date:From;
 b=scX6cQJQFcWqxL6oOB3UngL0/BGc4F0O5OIu336p7EozRzFFLQfY2cLriXuCEAFBq
 7iPV/j3OB8LyjVrbqU/VJ7VZiPGVEtz7tqksm1OQ4T6FYvYi2QZqr+eqndZBUn+dtP
 9ZyoyWaDpl+c0BBqElZE9QSlnG1HWiKly48azdQ4x+29qrzHeyfjdP2MOppxXLR2ec
 gdojJ/QHs8lvu2iJV12GE3X28WDdrJEsp/EVBeatLa4PZRQEUW+B/ilbzTbBM9Gdaa
 qopYD97VfgYCXcPG6UsEkMCenVlXz6ytejkZQ5oULh1mtrjDLvJ0Rbsz9hA+UtxgjH
 CitKdO6x9+AGw==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 29 Jul 2025 20:47:19 +0000
Message-ID: <20250729204719.1253285-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Let's drop the inode from the donation list when there is
 no other open file. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 fs/f2fs/f2fs.h
 | 2 ++ fs/f2fs/file.c | 8 +++++++- fs/f2fs/inode.c | 2 +- fs/f2fs/super.c
 | 1 + 4 files changed, 11 insertions(+), 2 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ugrET-0003wT-8s
Subject: [f2fs-dev] [PATCH] f2fs: drop inode from the donation list when the
 last file is closed
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's drop the inode from the donation list when there is no other
open file.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/f2fs.h  | 2 ++
 fs/f2fs/file.c  | 8 +++++++-
 fs/f2fs/inode.c | 2 +-
 fs/f2fs/super.c | 1 +
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 97c1a2a3fbd7..7029aa8b430e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -876,6 +876,7 @@ struct f2fs_inode_info {
 	/* linked in global inode list for cache donation */
 	struct list_head gdonate_list;
 	pgoff_t donate_start, donate_end; /* inclusive */
+	atomic_t open_count;		/* # of open files */
 
 	struct task_struct *atomic_write_task;	/* store atomic write task */
 	struct extent_tree *extent_tree[NR_EXTENT_CACHES];
@@ -3652,6 +3653,7 @@ int f2fs_try_to_free_nats(struct f2fs_sb_info *sbi, int nr_shrink);
 void f2fs_update_inode(struct inode *inode, struct folio *node_folio);
 void f2fs_update_inode_page(struct inode *inode);
 int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc);
+void f2fs_remove_donate_inode(struct inode *inode);
 void f2fs_evict_inode(struct inode *inode);
 void f2fs_handle_failed_inode(struct inode *inode);
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 176889d778f9..9b8d24097b7a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -628,7 +628,10 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
 	if (err)
 		return err;
 
-	return finish_preallocate_blocks(inode);
+	err = finish_preallocate_blocks(inode);
+	if (!err)
+		atomic_inc(&F2FS_I(inode)->open_count);
+	return err;
 }
 
 void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
@@ -2037,6 +2040,9 @@ static long f2fs_fallocate(struct file *file, int mode,
 
 static int f2fs_release_file(struct inode *inode, struct file *filp)
 {
+	if (atomic_dec_and_test(&F2FS_I(inode)->open_count))
+		f2fs_remove_donate_inode(inode);
+
 	/*
 	 * f2fs_release_file is called at every close calls. So we should
 	 * not drop any inmemory pages by close called by other process.
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 154106aa350b..8c4eafe9ffac 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -821,7 +821,7 @@ int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc)
 	return 0;
 }
 
-static void f2fs_remove_donate_inode(struct inode *inode)
+void f2fs_remove_donate_inode(struct inode *inode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 30c038413040..e16c4e2830c2 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1701,6 +1701,7 @@ static struct inode *f2fs_alloc_inode(struct super_block *sb)
 	/* Initialize f2fs-specific inode info */
 	atomic_set(&fi->dirty_pages, 0);
 	atomic_set(&fi->i_compr_blocks, 0);
+	atomic_set(&fi->open_count, 0);
 	init_f2fs_rwsem(&fi->i_sem);
 	spin_lock_init(&fi->i_size_lock);
 	INIT_LIST_HEAD(&fi->dirty_list);
-- 
2.50.1.552.g942d659e1b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
