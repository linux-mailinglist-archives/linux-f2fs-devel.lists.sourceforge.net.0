Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA8CB133E4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Jul 2025 07:03:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=18Q+BhuGR09pAIf0vBokxb+jOSeflg/dP9p/6gLvYOM=; b=DowJyaeD8cujcjBbU/4zMgNIGJ
	OHkb30yWSIp/HHhQDkWoRrH1pPD1KkMQKqUqUeFNyf2dr3dmwTnhSEWat6EvsP0mYPeXFdyKwlaap
	FXA73SFCHzbwmLip87K5dP9nZofk7ClvDz6CnT8Fot69l2yuemRmgoe1tFUOa8elShZI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ugG0i-000276-NO;
	Mon, 28 Jul 2025 05:02:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1ugG0h-00026z-Tm
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 05:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8BUUkNekTuxbLSKEx43RmUOxbhud7mrvevMmorcTt+g=; b=ajS1+OcO/K5yFRKcRx7Sv6ip/b
 p2mNuajWpISYcKlTzcUjOapt063UNhUqa87uEhj/jAqsLzm/I271XazSFiGxReMN1W86uGVuKT5Pa
 5dNA30SxTmZe4ckDbeMjeVMxKGCkFsH2sBesGKFqzE6KuKu/0HfaaZjNhdl5YgYStw4k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8BUUkNekTuxbLSKEx43RmUOxbhud7mrvevMmorcTt+g=; b=F
 dEoq8VLASxZbWL6o2JUoOs+UZkZAxIY0kJnz2/dC7BxOoC8UQQGt6TYKehc3YIi4KjlZyF6lEIzzO
 Pa0gQmczDwlIZpw+ziBUdgY5wULVtPUsQ/inyiirpc9llJ8CTFdNUOu14IOoeeX+WoDrOsWW6sfN+
 npNO/Nk4AHa3vExk=;
Received: from mta20.honor.com ([81.70.206.69] helo=mta20.hihonor.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ugG0g-0002xo-Qg for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 05:02:51 +0000
Received: from w013.hihonor.com (unknown [10.68.26.19])
 by mta20.hihonor.com (SkyGuard) with ESMTPS id 4br5qz0j8TzYl6X4;
 Mon, 28 Jul 2025 12:59:43 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w013.hihonor.com
 (10.68.26.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 28 Jul
 2025 13:02:38 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 28 Jul
 2025 13:02:37 +0800
From: wangzijie <wangzijie1@honor.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Mon, 28 Jul 2025 13:02:35 +0800
Message-ID: <20250728050237.1563560-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w012.hihonor.com (10.68.27.189) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: __lookup_nat_cache follows LRU manner to move clean nat entry,
 when nat entries are going to be dirty, no need to move them to tail of lru
 list. Introduce a parameter 'for_dirty' to avoid it. Signed-off-by: wangzijie
 <wangzijie1@honor.com> --- v3: - followed by Chao's suggestion to update
 comments v2: - followed by Jaegeuk's suggestion to add a parameter in
 __lookup_nat_cache --- fs/f2fs/n [...] 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [81.70.206.69 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1ugG0g-0002xo-Qg
Subject: [f2fs-dev] [PATCH v3 1/2] f2fs: avoid redundant clean nat entry
 move in lru list
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
Cc: wangzijie <wangzijie1@honor.com>, linux-kernel@vger.kernel.org,
 feng.han@honor.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

__lookup_nat_cache follows LRU manner to move clean nat entry, when nat
entries are going to be dirty, no need to move them to tail of lru list.
Introduce a parameter 'for_dirty' to avoid it.

Signed-off-by: wangzijie <wangzijie1@honor.com>
---
v3:
- followed by Chao's suggestion to update comments
v2:
- followed by Jaegeuk's suggestion to add a parameter in __lookup_nat_cache
---
 fs/f2fs/node.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 76aba1961..940b52d38 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -204,14 +204,17 @@ static struct nat_entry *__init_nat_entry(struct f2fs_nm_info *nm_i,
 	return ne;
 }
 
-static struct nat_entry *__lookup_nat_cache(struct f2fs_nm_info *nm_i, nid_t n)
+static struct nat_entry *__lookup_nat_cache(struct f2fs_nm_info *nm_i, nid_t n, bool for_dirty)
 {
 	struct nat_entry *ne;
 
 	ne = radix_tree_lookup(&nm_i->nat_root, n);
 
-	/* for recent accessed nat entry, move it to tail of lru list */
-	if (ne && !get_nat_flag(ne, IS_DIRTY)) {
+	/*
+	 * for recent accessed nat entry which will not be dirtied soon
+	 * later, move it to tail of lru list.
+	 */
+	if (ne && !get_nat_flag(ne, IS_DIRTY) && !for_dirty) {
 		spin_lock(&nm_i->nat_list_lock);
 		if (!list_empty(&ne->list))
 			list_move_tail(&ne->list, &nm_i->nat_entries);
@@ -383,7 +386,7 @@ int f2fs_need_dentry_mark(struct f2fs_sb_info *sbi, nid_t nid)
 	bool need = false;
 
 	f2fs_down_read(&nm_i->nat_tree_lock);
-	e = __lookup_nat_cache(nm_i, nid);
+	e = __lookup_nat_cache(nm_i, nid, false);
 	if (e) {
 		if (!get_nat_flag(e, IS_CHECKPOINTED) &&
 				!get_nat_flag(e, HAS_FSYNCED_INODE))
@@ -400,7 +403,7 @@ bool f2fs_is_checkpointed_node(struct f2fs_sb_info *sbi, nid_t nid)
 	bool is_cp = true;
 
 	f2fs_down_read(&nm_i->nat_tree_lock);
-	e = __lookup_nat_cache(nm_i, nid);
+	e = __lookup_nat_cache(nm_i, nid, false);
 	if (e && !get_nat_flag(e, IS_CHECKPOINTED))
 		is_cp = false;
 	f2fs_up_read(&nm_i->nat_tree_lock);
@@ -414,7 +417,7 @@ bool f2fs_need_inode_block_update(struct f2fs_sb_info *sbi, nid_t ino)
 	bool need_update = true;
 
 	f2fs_down_read(&nm_i->nat_tree_lock);
-	e = __lookup_nat_cache(nm_i, ino);
+	e = __lookup_nat_cache(nm_i, ino, false);
 	if (e && get_nat_flag(e, HAS_LAST_FSYNC) &&
 			(get_nat_flag(e, IS_CHECKPOINTED) ||
 			 get_nat_flag(e, HAS_FSYNCED_INODE)))
@@ -439,7 +442,7 @@ static void cache_nat_entry(struct f2fs_sb_info *sbi, nid_t nid,
 		return;
 
 	f2fs_down_write(&nm_i->nat_tree_lock);
-	e = __lookup_nat_cache(nm_i, nid);
+	e = __lookup_nat_cache(nm_i, nid, false);
 	if (!e)
 		e = __init_nat_entry(nm_i, new, ne, false);
 	else
@@ -460,7 +463,7 @@ static void set_node_addr(struct f2fs_sb_info *sbi, struct node_info *ni,
 	struct nat_entry *new = __alloc_nat_entry(sbi, ni->nid, true);
 
 	f2fs_down_write(&nm_i->nat_tree_lock);
-	e = __lookup_nat_cache(nm_i, ni->nid);
+	e = __lookup_nat_cache(nm_i, ni->nid, true);
 	if (!e) {
 		e = __init_nat_entry(nm_i, new, NULL, true);
 		copy_node_info(&e->ni, ni);
@@ -502,7 +505,7 @@ static void set_node_addr(struct f2fs_sb_info *sbi, struct node_info *ni,
 
 	/* update fsync_mark if its inode nat entry is still alive */
 	if (ni->nid != ni->ino)
-		e = __lookup_nat_cache(nm_i, ni->ino);
+		e = __lookup_nat_cache(nm_i, ni->ino, false);
 	if (e) {
 		if (fsync_done && ni->nid == ni->ino)
 			set_nat_flag(e, HAS_FSYNCED_INODE, true);
@@ -562,7 +565,7 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 retry:
 	/* Check nat cache */
 	f2fs_down_read(&nm_i->nat_tree_lock);
-	e = __lookup_nat_cache(nm_i, nid);
+	e = __lookup_nat_cache(nm_i, nid, false);
 	if (e) {
 		ni->ino = nat_get_ino(e);
 		ni->blk_addr = nat_get_blkaddr(e);
@@ -2371,7 +2374,7 @@ static bool add_free_nid(struct f2fs_sb_info *sbi,
 		 *   - __remove_nid_from_list(PREALLOC_NID)
 		 *                         - __insert_nid_to_list(FREE_NID)
 		 */
-		ne = __lookup_nat_cache(nm_i, nid);
+		ne = __lookup_nat_cache(nm_i, nid, false);
 		if (ne && (!get_nat_flag(ne, IS_CHECKPOINTED) ||
 				nat_get_blkaddr(ne) != NULL_ADDR))
 			goto err_out;
@@ -2936,7 +2939,7 @@ static void remove_nats_in_journal(struct f2fs_sb_info *sbi)
 
 		raw_ne = nat_in_journal(journal, i);
 
-		ne = __lookup_nat_cache(nm_i, nid);
+		ne = __lookup_nat_cache(nm_i, nid, true);
 		if (!ne) {
 			ne = __alloc_nat_entry(sbi, nid, true);
 			__init_nat_entry(nm_i, ne, &raw_ne, true);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
