Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D63B0DEDA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Jul 2025 16:36:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yrk9ulOnnfUWsu3mAWg7v2SY8YvVe9oR/3jg1yv1Q8k=; b=KVkBG5TGdK/Q7CjPN0s9EZjzt7
	iCOo1m+H3txw4CTh/gaO7dqFXAbtIDFyg6lOXxYqNro7QNMZQEciiQXSplRXQJSA18X2llvhbjAwe
	8uAUe2ns/NGarY43W3x9dgfkVPTDfntf87E1ArlMPWXnnFculBUTCrc6Rv3jjgDvcAB0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ueE6k-0003VH-Sf;
	Tue, 22 Jul 2025 14:36:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1ueE6i-0003V8-QH
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 14:36:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9mMZv3fRPcTWhmon7ZbWPzuWZxJN9vWK45/lrMBtpSg=; b=JS3mByV67g58ImjSlMgdDTzms4
 dNroNHzqkqUFyjgjZYYkeGaa3k5T9owgk1+9hbj9LqdDrEGK/rhCRFnhoaesFXoR1TlIY4leOYN3t
 QpPtNM5W8CSU/ioyJ3FbhT551we1n0AaAxyWxtotTJitHETntBSDpuknQkkkbVMnEX7c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9mMZv3fRPcTWhmon7ZbWPzuWZxJN9vWK45/lrMBtpSg=; b=K
 QJRZSEdEnYr/LYa7sG2rMkM5iDfGP2x5nOGx73Eadf45aqftjfJA6hUp6kDh5DcOLEyHDlMivDeJ4
 DWsH88YiL53hXBf5aa/KDq8CvluUGIdSXJribmySzS6Ys2m1mAUZvPO51Ef4c2HOXhD+wYl7e/ov3
 gaRpN5rFgb07yBFQ=;
Received: from mta22.hihonor.com ([81.70.192.198])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ueE6h-0007xm-Jo for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 14:36:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=honor.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=To:From;
 bh=9mMZv3fRPcTWhmon7ZbWPzuWZxJN9vWK45/lrMBtpSg=;
 b=Mg6C/twqRDRZr7USz8b8PaDHWA+2mKe1Lda6S+s3cROZ7Fy2Fy9OmGOkxSgufmGMexeTIAE7M
 mQAScEUKq2Zi7edM5dlEA8enZtBMapphWCtgCr++nd7vjwDgZn6glWngLDCuj6m4XEfpb48dMxv
 hCogN2PJVyEzJge0YeWmXpo=
Received: from w002.hihonor.com (unknown [10.68.28.120])
 by mta22.hihonor.com (SkyGuard) with ESMTPS id 4bmfsg1bqfzYldV3;
 Tue, 22 Jul 2025 22:34:15 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 22 Jul
 2025 22:36:30 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 22 Jul
 2025 22:36:30 +0800
From: wangzijie <wangzijie1@honor.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Tue, 22 Jul 2025 22:36:27 +0800
Message-ID: <20250722143628.430776-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w001.hihonor.com (10.68.25.235) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: __lookup_nat_cache follows LRU manner to move clean nat entry,
 when nat entries are going to be dirty, no need to move them to tail of lru
 list. Introduce a parameter 'for_dirty' to avoid it. Signed-off-by: wangzijie
 <wangzijie1@honor.com> --- v2: - followed by Jaegeuk's suggestion to add
 a parameter in __lookup_nat_cache --- fs/f2fs/node.c | 24 ++++++++++++ 1 file
 changed, 12 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [81.70.192.198 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ueE6h-0007xm-Jo
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: avoid redundant clean nat entry
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
v2:
- followed by Jaegeuk's suggestion to add a parameter in __lookup_nat_cache
---
 fs/f2fs/node.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 76aba1961..a23db6238 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -204,14 +204,14 @@ static struct nat_entry *__init_nat_entry(struct f2fs_nm_info *nm_i,
 	return ne;
 }
 
-static struct nat_entry *__lookup_nat_cache(struct f2fs_nm_info *nm_i, nid_t n)
+static struct nat_entry *__lookup_nat_cache(struct f2fs_nm_info *nm_i, nid_t n, bool for_dirty)
 {
 	struct nat_entry *ne;
 
 	ne = radix_tree_lookup(&nm_i->nat_root, n);
 
-	/* for recent accessed nat entry, move it to tail of lru list */
-	if (ne && !get_nat_flag(ne, IS_DIRTY)) {
+	/* for recent accessed(not used to set dirty) nat entry, move it to tail of lru list */
+	if (ne && !get_nat_flag(ne, IS_DIRTY) && !for_dirty) {
 		spin_lock(&nm_i->nat_list_lock);
 		if (!list_empty(&ne->list))
 			list_move_tail(&ne->list, &nm_i->nat_entries);
@@ -383,7 +383,7 @@ int f2fs_need_dentry_mark(struct f2fs_sb_info *sbi, nid_t nid)
 	bool need = false;
 
 	f2fs_down_read(&nm_i->nat_tree_lock);
-	e = __lookup_nat_cache(nm_i, nid);
+	e = __lookup_nat_cache(nm_i, nid, false);
 	if (e) {
 		if (!get_nat_flag(e, IS_CHECKPOINTED) &&
 				!get_nat_flag(e, HAS_FSYNCED_INODE))
@@ -400,7 +400,7 @@ bool f2fs_is_checkpointed_node(struct f2fs_sb_info *sbi, nid_t nid)
 	bool is_cp = true;
 
 	f2fs_down_read(&nm_i->nat_tree_lock);
-	e = __lookup_nat_cache(nm_i, nid);
+	e = __lookup_nat_cache(nm_i, nid, false);
 	if (e && !get_nat_flag(e, IS_CHECKPOINTED))
 		is_cp = false;
 	f2fs_up_read(&nm_i->nat_tree_lock);
@@ -414,7 +414,7 @@ bool f2fs_need_inode_block_update(struct f2fs_sb_info *sbi, nid_t ino)
 	bool need_update = true;
 
 	f2fs_down_read(&nm_i->nat_tree_lock);
-	e = __lookup_nat_cache(nm_i, ino);
+	e = __lookup_nat_cache(nm_i, ino, false);
 	if (e && get_nat_flag(e, HAS_LAST_FSYNC) &&
 			(get_nat_flag(e, IS_CHECKPOINTED) ||
 			 get_nat_flag(e, HAS_FSYNCED_INODE)))
@@ -439,7 +439,7 @@ static void cache_nat_entry(struct f2fs_sb_info *sbi, nid_t nid,
 		return;
 
 	f2fs_down_write(&nm_i->nat_tree_lock);
-	e = __lookup_nat_cache(nm_i, nid);
+	e = __lookup_nat_cache(nm_i, nid, false);
 	if (!e)
 		e = __init_nat_entry(nm_i, new, ne, false);
 	else
@@ -460,7 +460,7 @@ static void set_node_addr(struct f2fs_sb_info *sbi, struct node_info *ni,
 	struct nat_entry *new = __alloc_nat_entry(sbi, ni->nid, true);
 
 	f2fs_down_write(&nm_i->nat_tree_lock);
-	e = __lookup_nat_cache(nm_i, ni->nid);
+	e = __lookup_nat_cache(nm_i, ni->nid, true);
 	if (!e) {
 		e = __init_nat_entry(nm_i, new, NULL, true);
 		copy_node_info(&e->ni, ni);
@@ -502,7 +502,7 @@ static void set_node_addr(struct f2fs_sb_info *sbi, struct node_info *ni,
 
 	/* update fsync_mark if its inode nat entry is still alive */
 	if (ni->nid != ni->ino)
-		e = __lookup_nat_cache(nm_i, ni->ino);
+		e = __lookup_nat_cache(nm_i, ni->ino, false);
 	if (e) {
 		if (fsync_done && ni->nid == ni->ino)
 			set_nat_flag(e, HAS_FSYNCED_INODE, true);
@@ -562,7 +562,7 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 retry:
 	/* Check nat cache */
 	f2fs_down_read(&nm_i->nat_tree_lock);
-	e = __lookup_nat_cache(nm_i, nid);
+	e = __lookup_nat_cache(nm_i, nid, false);
 	if (e) {
 		ni->ino = nat_get_ino(e);
 		ni->blk_addr = nat_get_blkaddr(e);
@@ -2371,7 +2371,7 @@ static bool add_free_nid(struct f2fs_sb_info *sbi,
 		 *   - __remove_nid_from_list(PREALLOC_NID)
 		 *                         - __insert_nid_to_list(FREE_NID)
 		 */
-		ne = __lookup_nat_cache(nm_i, nid);
+		ne = __lookup_nat_cache(nm_i, nid, false);
 		if (ne && (!get_nat_flag(ne, IS_CHECKPOINTED) ||
 				nat_get_blkaddr(ne) != NULL_ADDR))
 			goto err_out;
@@ -2936,7 +2936,7 @@ static void remove_nats_in_journal(struct f2fs_sb_info *sbi)
 
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
