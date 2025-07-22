Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B787AB0DED9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Jul 2025 16:36:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zw81lR52rZHh9M4aRg2T+8WPgWzvUlK4v6BUrXJNSnc=; b=RnCxNFuGXc7zGWENzn+Mbw3Odw
	DEJTE3fY89m2mvH3MGeXbcE16cxrV1TLIFrhy2WjTBXOGglzACuDmbXjEk4G2kXUuO01jKijf0M9f
	vsFAgBZjlx0R0OZ3HA8AMPLyhMl2WSlmOyk9qd6kO6M3LDzHWp5zBvA9LR7XWPKgfTU0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ueE6m-0003Wm-4v;
	Tue, 22 Jul 2025 14:36:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1ueE6k-0003Wb-63
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 14:36:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dGs2nIiErmsTVUNe0yiXLdx4W1bj/04H9pQISAX9/Nc=; b=DujYgVsDqh6Hv0vUeeZHYzYyPn
 6Ie5XZmPzXRgbdtL5/8/aiPUcizpBVFcrTCVxMjCFgWoA5qjjbPYTxx6Erw2ER5MDk7tyTGfN4rZk
 ornV4KTwYQjCZcGtZzqyAdP5Z88EVP7xY0akDF0bMAays1XpWB1iOoazDDXXPLaZxisE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dGs2nIiErmsTVUNe0yiXLdx4W1bj/04H9pQISAX9/Nc=; b=Z3M53f3OLEMV8Hz12TNfNbTE5u
 CTwkIlwbFzvZRY7KC5eblqF7w8QaWbRVlvbk6suaVvV2ceWaZ0ql2bLYyZNyBXlpC1qtmqrfdG+B5
 L7DGqhBYbR3u4S3kDC129Ns3zpiKYAWwiSritd1HJcpVd+GywWIzWuWyZhjxngs5bYBQ=;
Received: from mta21.honor.com ([81.70.160.142] helo=mta21.hihonor.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ueE6j-0007xo-CR for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 14:36:42 +0000
Received: from w001.hihonor.com (unknown [10.68.25.235])
 by mta21.hihonor.com (SkyGuard) with ESMTPS id 4bmfsH1P2GzYlDjP;
 Tue, 22 Jul 2025 22:33:55 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w001.hihonor.com
 (10.68.25.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 22 Jul
 2025 22:36:31 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 22 Jul
 2025 22:36:31 +0800
From: wangzijie <wangzijie1@honor.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Tue, 22 Jul 2025 22:36:28 +0800
Message-ID: <20250722143628.430776-2-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250722143628.430776-1-wangzijie1@honor.com>
References: <20250722143628.430776-1-wangzijie1@honor.com>
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w001.hihonor.com (10.68.25.235) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When we need to alloc nat entry and set it dirty,
 we can directly
 add it to dirty set list(or initialize its list_head for new_ne) instead
 of adding it to clean list and make a move. Introduce init_di [...] 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [81.70.160.142 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1ueE6j-0007xo-CR
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: directly add newly allocated
 pre-dirty nat entry to dirty set list
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

When we need to alloc nat entry and set it dirty, we can directly add it to
dirty set list(or initialize its list_head for new_ne) instead of adding it
to clean list and make a move. Introduce init_dirty flag to do it.

Signed-off-by: wangzijie <wangzijie1@honor.com>
---
 fs/f2fs/node.c | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index a23db6238..20bcf8559 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -185,7 +185,7 @@ static void __free_nat_entry(struct nat_entry *e)
 
 /* must be locked by nat_tree_lock */
 static struct nat_entry *__init_nat_entry(struct f2fs_nm_info *nm_i,
-	struct nat_entry *ne, struct f2fs_nat_entry *raw_ne, bool no_fail)
+	struct nat_entry *ne, struct f2fs_nat_entry *raw_ne, bool no_fail, bool init_dirty)
 {
 	if (no_fail)
 		f2fs_radix_tree_insert(&nm_i->nat_root, nat_get_nid(ne), ne);
@@ -195,6 +195,11 @@ static struct nat_entry *__init_nat_entry(struct f2fs_nm_info *nm_i,
 	if (raw_ne)
 		node_info_from_raw_nat(&ne->ni, raw_ne);
 
+	if (init_dirty) {
+		nm_i->nat_cnt[TOTAL_NAT]++;
+		return ne;
+	}
+
 	spin_lock(&nm_i->nat_list_lock);
 	list_add_tail(&ne->list, &nm_i->nat_entries);
 	spin_unlock(&nm_i->nat_list_lock);
@@ -256,7 +261,7 @@ static struct nat_entry_set *__grab_nat_entry_set(struct f2fs_nm_info *nm_i,
 }
 
 static void __set_nat_cache_dirty(struct f2fs_nm_info *nm_i,
-						struct nat_entry *ne)
+					struct nat_entry *ne, bool init_dirty)
 {
 	struct nat_entry_set *head;
 	bool new_ne = nat_get_blkaddr(ne) == NEW_ADDR;
@@ -275,6 +280,18 @@ static void __set_nat_cache_dirty(struct f2fs_nm_info *nm_i,
 
 	set_nat_flag(ne, IS_PREALLOC, new_ne);
 
+	if (init_dirty) {
+		nm_i->nat_cnt[DIRTY_NAT]++;
+		set_nat_flag(ne, IS_DIRTY, true);
+		spin_lock(&nm_i->nat_list_lock);
+		if (new_ne)
+			INIT_LIST_HEAD(&ne->list);
+		else
+			list_add_tail(&ne->list, &head->entry_list);
+		spin_unlock(&nm_i->nat_list_lock);
+		return;
+    }
+
 	if (get_nat_flag(ne, IS_DIRTY))
 		goto refresh_list;
 
@@ -441,7 +458,7 @@ static void cache_nat_entry(struct f2fs_sb_info *sbi, nid_t nid,
 	f2fs_down_write(&nm_i->nat_tree_lock);
 	e = __lookup_nat_cache(nm_i, nid, false);
 	if (!e)
-		e = __init_nat_entry(nm_i, new, ne, false);
+		e = __init_nat_entry(nm_i, new, ne, false, false);
 	else
 		f2fs_bug_on(sbi, nat_get_ino(e) != le32_to_cpu(ne->ino) ||
 				nat_get_blkaddr(e) !=
@@ -458,11 +475,13 @@ static void set_node_addr(struct f2fs_sb_info *sbi, struct node_info *ni,
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
 	struct nat_entry *e;
 	struct nat_entry *new = __alloc_nat_entry(sbi, ni->nid, true);
+	bool init_dirty = false;
 
 	f2fs_down_write(&nm_i->nat_tree_lock);
 	e = __lookup_nat_cache(nm_i, ni->nid, true);
 	if (!e) {
-		e = __init_nat_entry(nm_i, new, NULL, true);
+		init_dirty = true;
+		e = __init_nat_entry(nm_i, new, NULL, true, true);
 		copy_node_info(&e->ni, ni);
 		f2fs_bug_on(sbi, ni->blk_addr == NEW_ADDR);
 	} else if (new_blkaddr == NEW_ADDR) {
@@ -498,7 +517,7 @@ static void set_node_addr(struct f2fs_sb_info *sbi, struct node_info *ni,
 	nat_set_blkaddr(e, new_blkaddr);
 	if (!__is_valid_data_blkaddr(new_blkaddr))
 		set_nat_flag(e, IS_CHECKPOINTED, false);
-	__set_nat_cache_dirty(nm_i, e);
+	__set_nat_cache_dirty(nm_i, e, init_dirty);
 
 	/* update fsync_mark if its inode nat entry is still alive */
 	if (ni->nid != ni->ino)
@@ -2924,6 +2943,7 @@ static void remove_nats_in_journal(struct f2fs_sb_info *sbi)
 	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
 	struct f2fs_journal *journal = curseg->journal;
 	int i;
+	bool init_dirty;
 
 	down_write(&curseg->journal_rwsem);
 	for (i = 0; i < nats_in_cursum(journal); i++) {
@@ -2934,12 +2954,15 @@ static void remove_nats_in_journal(struct f2fs_sb_info *sbi)
 		if (f2fs_check_nid_range(sbi, nid))
 			continue;
 
+		init_dirty = false;
+
 		raw_ne = nat_in_journal(journal, i);
 
 		ne = __lookup_nat_cache(nm_i, nid, true);
 		if (!ne) {
+			init_dirty = true;
 			ne = __alloc_nat_entry(sbi, nid, true);
-			__init_nat_entry(nm_i, ne, &raw_ne, true);
+			__init_nat_entry(nm_i, ne, &raw_ne, true, true);
 		}
 
 		/*
@@ -2954,7 +2977,7 @@ static void remove_nats_in_journal(struct f2fs_sb_info *sbi)
 			spin_unlock(&nm_i->nid_list_lock);
 		}
 
-		__set_nat_cache_dirty(nm_i, ne);
+		__set_nat_cache_dirty(nm_i, ne, init_dirty);
 	}
 	update_nats_in_cursum(journal, -i);
 	up_write(&curseg->journal_rwsem);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
