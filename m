Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B806E6430D6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Dec 2022 19:55:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p2GcW-0007vp-J2;
	Mon, 05 Dec 2022 18:55:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1p2GcG-0007vK-Mj
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Dec 2022 18:55:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/8AVgPuoiFr7DGuF6De9UqdgxBUB0NG1s3Q6rLKu4Pk=; b=EOr8oW+BeiiSWEpCXCcsKVAgRf
 U2+zgxQ34BMM3zPMP0eTZtCdVW06BMVRwv8zPEQyz/p7ZEGG1fQbXg52zZ1oKAL5QZGECeZB3AUZn
 vAl9ibIhui38l64qZpmROPhhTQQWH2W6W9Np02XjOWTyCoWBX+GZsEMIQUXQdw2g8xkc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/8AVgPuoiFr7DGuF6De9UqdgxBUB0NG1s3Q6rLKu4Pk=; b=Y4X9itqTIRQag8vCU7j86ZJGhr
 rBLkTJ8rFE0F6CSg0NgfIZI/PxDYuvCJw2xuU3ZuV7kMmY2ZGiWfD0HQ0R2WNUQ4zN/rDNsJqMgb4
 C5uFVtP8Q53XNGWlmB1SJgFOvwDF5aZQkL/DFbaMTdzmjDeEH0jc8QaX7n7eoEikDKBw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p2GcF-0071p0-V1 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Dec 2022 18:55:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BE83B61303
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  5 Dec 2022 18:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 264F6C433D7;
 Mon,  5 Dec 2022 18:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670266493;
 bh=E+D8xdk5gqXIgVYmLrJvIyPn/PYJmfpR6rUrWPbhCjI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QFvBYziK8cRaHdll5daziqREyoc6Qd+2lCufAes2gM0ZsAMnAIsId2e59+3b9ro7d
 P8Ea0sTJlPte9+ytyq1TxkQ3iTkinlMIHDKVs4j/TxVt2UXm1/7AfLNjX9DW8p2pec
 Uz6w7Tb/FiWAvTQCj41L7CnFOLhMFJjcWgUWo0xIRhvZ5sAKbC3RfCLRf/NTQi/yQv
 fN+EXdNTegX+i030gfXk09nkMo3FIRnqiyC1VAiXAoeizFaV7TElE/7ulw3rZUSCoH
 jol6ogK4qRY5mCtomqNjJhQS02goPcMx0F9QLtzOq6pAs/HKNkWmVMnlU1aynoIUto
 wiTfzx3GHek2Q==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  5 Dec 2022 10:54:32 -0800
Message-Id: <20221205185433.3479699-5-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.39.0.rc0.267.gcb52ba06e7-goog
In-Reply-To: <20221205185433.3479699-1-jaegeuk@kernel.org>
References: <20221205185433.3479699-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's allocate it to remove the runtime complexity.
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/extent_cache.c | 38
 +++++++++++++++++++
 fs/f2fs/f2fs.h | 3 ++- fs/f2fs/inode.c | 6 ++++-- fs/f2fs/namei.c | 4 ++--
 4 file [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p2GcF-0071p0-V1
Subject: [f2fs-dev] [PATCH 5/6] f2fs: allocate the extent_cache by default
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

Let's allocate it to remove the runtime complexity.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/extent_cache.c | 38 +++++++++++++++++++-------------------
 fs/f2fs/f2fs.h         |  3 ++-
 fs/f2fs/inode.c        |  6 ++++--
 fs/f2fs/namei.c        |  4 ++--
 4 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 654a14ab8977..305f969e3ad1 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -47,20 +47,23 @@ static bool __may_read_extent_tree(struct inode *inode)
 	return S_ISREG(inode->i_mode);
 }
 
-static bool __may_extent_tree(struct inode *inode, enum extent_type type)
+static bool __init_may_extent_tree(struct inode *inode, enum extent_type type)
 {
-	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	if (type == EX_READ)
+		return __may_read_extent_tree(inode);
+	return false;
+}
 
+static bool __may_extent_tree(struct inode *inode, enum extent_type type)
+{
 	/*
 	 * for recovered files during mount do not create extents
 	 * if shrinker is not registered.
 	 */
-	if (list_empty(&sbi->s_list))
+	if (list_empty(&F2FS_I_SB(inode)->s_list))
 		return false;
 
-	if (type == EX_READ)
-		return __may_read_extent_tree(inode);
-	return false;
+	return __init_may_extent_tree(inode, type);
 }
 
 static void __try_update_largest_extent(struct extent_tree *et,
@@ -439,20 +442,18 @@ static void __drop_largest_extent(struct extent_tree *et,
 	}
 }
 
-/* return true, if inode page is changed */
-static void __f2fs_init_extent_tree(struct inode *inode, struct page *ipage,
-							enum extent_type type)
+void f2fs_init_read_extent_tree(struct inode *inode, struct page *ipage)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct extent_tree_info *eti = &sbi->extent_tree[type];
-	struct f2fs_extent *i_ext = ipage ? &F2FS_INODE(ipage)->i_ext : NULL;
+	struct extent_tree_info *eti = &sbi->extent_tree[EX_READ];
+	struct f2fs_extent *i_ext = &F2FS_INODE(ipage)->i_ext;
 	struct extent_tree *et;
 	struct extent_node *en;
 	struct extent_info ei;
 
-	if (!__may_extent_tree(inode, type)) {
+	if (!__may_extent_tree(inode, EX_READ)) {
 		/* drop largest read extent */
-		if (type == EX_READ && i_ext && i_ext->len) {
+		if (i_ext && i_ext->len) {
 			f2fs_wait_on_page_writeback(ipage, NODE, true, true);
 			i_ext->len = 0;
 			set_page_dirty(ipage);
@@ -460,13 +461,11 @@ static void __f2fs_init_extent_tree(struct inode *inode, struct page *ipage,
 		goto out;
 	}
 
-	et = __grab_extent_tree(inode, type);
+	et = __grab_extent_tree(inode, EX_READ);
 
 	if (!i_ext || !i_ext->len)
 		goto out;
 
-	BUG_ON(type != EX_READ);
-
 	get_read_extent_info(&ei, i_ext);
 
 	write_lock(&et->lock);
@@ -486,14 +485,15 @@ static void __f2fs_init_extent_tree(struct inode *inode, struct page *ipage,
 unlock_out:
 	write_unlock(&et->lock);
 out:
-	if (type == EX_READ && !F2FS_I(inode)->extent_tree[EX_READ])
+	if (!F2FS_I(inode)->extent_tree[EX_READ])
 		set_inode_flag(inode, FI_NO_EXTENT);
 }
 
-void f2fs_init_extent_tree(struct inode *inode, struct page *ipage)
+void f2fs_init_extent_tree(struct inode *inode)
 {
 	/* initialize read cache */
-	__f2fs_init_extent_tree(inode, ipage, EX_READ);
+	if (__init_may_extent_tree(inode, EX_READ))
+		__grab_extent_tree(inode, EX_READ);
 }
 
 static bool __lookup_extent_tree(struct inode *inode, pgoff_t pgofs,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 003b04b10109..ff940cba4600 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4150,7 +4150,7 @@ struct rb_entry *f2fs_lookup_rb_tree_ret(struct rb_root_cached *root,
 		bool force, bool *leftmost);
 bool f2fs_check_rb_tree_consistence(struct f2fs_sb_info *sbi,
 				struct rb_root_cached *root, bool check_key);
-void f2fs_init_extent_tree(struct inode *inode, struct page *ipage);
+void f2fs_init_extent_tree(struct inode *inode);
 void f2fs_drop_extent_tree(struct inode *inode);
 void f2fs_destroy_extent_node(struct inode *inode);
 void f2fs_destroy_extent_tree(struct inode *inode);
@@ -4159,6 +4159,7 @@ int __init f2fs_create_extent_cache(void);
 void f2fs_destroy_extent_cache(void);
 
 /* read extent cache ops */
+void f2fs_init_read_extent_tree(struct inode *inode, struct page *ipage);
 bool f2fs_lookup_read_extent_cache(struct inode *inode, pgoff_t pgofs,
 			struct extent_info *ei);
 void f2fs_update_read_extent_cache(struct dnode_of_data *dn);
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 086f201f15a0..c845c16f97d0 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -392,8 +392,6 @@ static int do_read_inode(struct inode *inode)
 	fi->i_pino = le32_to_cpu(ri->i_pino);
 	fi->i_dir_level = ri->i_dir_level;
 
-	f2fs_init_extent_tree(inode, node_page);
-
 	get_inline_info(inode, ri);
 
 	fi->i_extra_isize = f2fs_has_extra_attr(inode) ?
@@ -479,6 +477,10 @@ static int do_read_inode(struct inode *inode)
 	}
 
 	init_idisk_time(inode);
+
+	/* Need all the flag bits */
+	f2fs_init_read_extent_tree(inode, node_page);
+
 	f2fs_put_page(node_page, 1);
 
 	stat_inc_inline_xattr(inode);
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 58a91ce8fe08..46de782c2baa 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -284,8 +284,6 @@ static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
 	}
 	F2FS_I(inode)->i_inline_xattr_size = xattr_size;
 
-	f2fs_init_extent_tree(inode, NULL);
-
 	F2FS_I(inode)->i_flags =
 		f2fs_mask_flags(mode, F2FS_I(dir)->i_flags & F2FS_FL_INHERITED);
 
@@ -311,6 +309,8 @@ static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
 
 	f2fs_set_inode_flags(inode);
 
+	f2fs_init_extent_tree(inode);
+
 	trace_f2fs_new_inode(inode, 0);
 	return inode;
 
-- 
2.39.0.rc0.267.gcb52ba06e7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
