Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F9DB327AB
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 23 Aug 2025 10:37:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=deUvebcCVo6kJpu/29gRiTsk8g3GzTzKHSrn7Ehg6/Q=; b=JbT93m02BXCY/Ymti3ApSSF8tQ
	NdiUetE9XU9TKB/0dm6JYC1EM2Nye7Cn0h6tlSPuGzYIWBgNCFisLpHGgK7vfcys2RWJArsn2HFG/
	yl1IwIsFaXR1jqsV9OEa3WTTLcEihH0GYy2LGRzj4Be9yBEkBaBN95cc8N1IGLcBuszM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1upjkL-0005nk-Cn;
	Sat, 23 Aug 2025 08:37:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1upjkJ-0005nV-Qq
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 23 Aug 2025 08:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cRLE+83IYW2xhH/6y4p6XhRmKZRGNvvBkGPL/G7ZfSI=; b=hjeMwbe70sKzir0jQLauL+C5qC
 QHX71wFSURtsvflrfbNJT7TBluDWGlrAQ/bWT/Gy+pjW3J/yC8G9zcuC8qAA0PIsOHtHdw72tuh3N
 eheUdPmdhQJAE4ncswm3HUGLKyzZo6lHvTnIT4OIidotNh2igK1PMgrOA9cjB0HtEKrM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cRLE+83IYW2xhH/6y4p6XhRmKZRGNvvBkGPL/G7ZfSI=; b=K
 A9rDyR5qydfrC1yUsghs32Sk862E1cGXLc/bic8cqtfpsb1+6Mk6NZlz8/GuWEDlvCrr8Jl1LjFly
 pP11hWeaBorQE1P4OMY6o6eONRG68dELETmVfIE96qHEkOPO7d5LlWu+Gceoyl1FTATQPeTVPLRVo
 NbnsafUB6YGGUnz4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1upjkJ-0000FL-2I for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 23 Aug 2025 08:37:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 68DE460243;
 Sat, 23 Aug 2025 08:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B9BAC4CEE7;
 Sat, 23 Aug 2025 08:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755938216;
 bh=pEXIJRsKWMgfwe7mP0cGm5NGO0n6J1mDZ42J7yTw1Ws=;
 h=From:To:Cc:Subject:Date:From;
 b=npLmb3i0i0FmfVbQPF/fTAqDUSJLcEWU2RNp+rO3wBIQuZoNGehjPjlkqCXCS5NaV
 G+CXcAM0b98eriPXWSO+TZolMsJZLmt1W+1hDDAmGj8u5iPodoUI99voqLYspunXnl
 m6hBY0M1ajBVl5+3/a/FF6W5XFOku0xs8A7+kC8AD2P7u9lKn8K0LlL6HXNNrXUsA9
 yN7zsi6RhSz4NIS//tvj61uoJLXY8KKRg6pud3oZrKNfS9AHQ6j7f2tMVwA4bRclj0
 +ks0cW1U/3GbvtOf/DRV/DhL/XiO0lnqwqj+Y+ycCFhLWVXIUDkLzRjmKP9Am8h8WJ
 +SzY+tHMGyzOw==
To: jaegeuk@kernel.org
Date: Sat, 23 Aug 2025 13:45:34 +0800
Message-Id: <20250823054534.41037-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: As syzbot reported below: [ cut here ] kernel BUG at
 fs/f2fs/file.c:1243!
 Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI CPU: 0 UID: 0 PID: 5354 Comm:
 syz.0.0 Not tainted 6.17.0-rc1-syzkaller-00211-g90 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1upjkJ-0000FL-2I
Subject: [f2fs-dev] [PATCH] f2fs: fix to do sanity check on node footer for
 non inode dnode
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: syzbot+b9c7ffd609c3f09416ab@syzkaller.appspotmail.com, stable@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As syzbot reported below:

------------[ cut here ]------------
kernel BUG at fs/f2fs/file.c:1243!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5354 Comm: syz.0.0 Not tainted 6.17.0-rc1-syzkaller-00211-g90d970cade8e #0 PREEMPT(full)
RIP: 0010:f2fs_truncate_hole+0x69e/0x6c0 fs/f2fs/file.c:1243
Call Trace:
 <TASK>
 f2fs_punch_hole+0x2db/0x330 fs/f2fs/file.c:1306
 f2fs_fallocate+0x546/0x990 fs/f2fs/file.c:2018
 vfs_fallocate+0x666/0x7e0 fs/open.c:342
 ksys_fallocate fs/open.c:366 [inline]
 __do_sys_fallocate fs/open.c:371 [inline]
 __se_sys_fallocate fs/open.c:369 [inline]
 __x64_sys_fallocate+0xc0/0x110 fs/open.c:369
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1e65f8ebe9

w/ a fuzzed image, f2fs may encounter panic due to it detects inconsistent
truncation range in direct node in f2fs_truncate_hole().

The root cause is: a non-inode dnode may has the same footer.ino and
footer.nid, so the dnode will be parsed as an inode, then ADDRS_PER_PAGE()
may return wrong blkaddr count which may be 923 typically, by chance,
dn.ofs_in_node is equal to 923, then count can be calculated to 0 in below
statement, later it will trigger panic w/ f2fs_bug_on(, count == 0 || ...).

	count = min(end_offset - dn.ofs_in_node, pg_end - pg_start);

This patch introduces a new node_type NODE_TYPE_NON_INODE, then allowing
passing the new_type to sanity_check_node_footer in f2fs_get_node_folio()
to detect corruption that a non-inode dnode has the same footer.ino and
footer.nid.

Scripts to reproduce:
mkfs.f2fs -f /dev/vdb
mount /dev/vdb /mnt/f2fs
touch /mnt/f2fs/foo
touch /mnt/f2fs/bar
dd if=/dev/zero of=/mnt/f2fs/foo bs=1M count=8
umount /mnt/f2fs
inject.f2fs --node --mb i_nid --nid 4 --idx 0 --val 5 /dev/vdb
mount /dev/vdb /mnt/f2fs
xfs_io /mnt/f2fs/foo -c "fpunch 6984k 4k"

Cc: stable@kernel.org
Reported-by: syzbot+b9c7ffd609c3f09416ab@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/68a68e27.050a0220.1a3988.0002.GAE@google.com
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h     |  4 +++-
 fs/f2fs/gc.c       |  4 ++--
 fs/f2fs/node.c     | 58 +++++++++++++++++++++++++++++++---------------
 fs/f2fs/node.h     |  1 +
 fs/f2fs/recovery.c |  2 +-
 5 files changed, 46 insertions(+), 23 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 1e3d0f6d1d4c..bba9ff617ea6 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3817,6 +3817,7 @@ void f2fs_hash_filename(const struct inode *dir, struct f2fs_filename *fname);
  * node.c
  */
 struct node_info;
+enum node_type;
 
 int f2fs_check_nid_range(struct f2fs_sb_info *sbi, nid_t nid);
 bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type);
@@ -3839,7 +3840,8 @@ int f2fs_remove_inode_page(struct inode *inode);
 struct folio *f2fs_new_inode_folio(struct inode *inode);
 struct folio *f2fs_new_node_folio(struct dnode_of_data *dn, unsigned int ofs);
 void f2fs_ra_node_page(struct f2fs_sb_info *sbi, nid_t nid);
-struct folio *f2fs_get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid);
+struct folio *f2fs_get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
+						enum node_type node_type);
 struct folio *f2fs_get_inode_folio(struct f2fs_sb_info *sbi, pgoff_t ino);
 struct folio *f2fs_get_xnode_folio(struct f2fs_sb_info *sbi, pgoff_t xnid);
 int f2fs_move_node_folio(struct folio *node_folio, int gc_type);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index b57b8fd64747..ed3acbfc83ca 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1071,7 +1071,7 @@ static int gc_node_segment(struct f2fs_sb_info *sbi,
 		}
 
 		/* phase == 2 */
-		node_folio = f2fs_get_node_folio(sbi, nid);
+		node_folio = f2fs_get_node_folio(sbi, nid, NODE_TYPE_REGULAR);
 		if (IS_ERR(node_folio))
 			continue;
 
@@ -1145,7 +1145,7 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	nid = le32_to_cpu(sum->nid);
 	ofs_in_node = le16_to_cpu(sum->ofs_in_node);
 
-	node_folio = f2fs_get_node_folio(sbi, nid);
+	node_folio = f2fs_get_node_folio(sbi, nid, NODE_TYPE_REGULAR);
 	if (IS_ERR(node_folio))
 		return false;
 
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 109bc8898bc6..68d210f7798a 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -876,7 +876,8 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 		}
 
 		if (!done) {
-			nfolio[i] = f2fs_get_node_folio(sbi, nids[i]);
+			nfolio[i] = f2fs_get_node_folio(sbi, nids[i],
+						NODE_TYPE_NON_INODE);
 			if (IS_ERR(nfolio[i])) {
 				err = PTR_ERR(nfolio[i]);
 				f2fs_folio_put(nfolio[0], false);
@@ -994,7 +995,7 @@ static int truncate_dnode(struct dnode_of_data *dn)
 		return 1;
 
 	/* get direct node */
-	folio = f2fs_get_node_folio(sbi, dn->nid);
+	folio = f2fs_get_node_folio(sbi, dn->nid, NODE_TYPE_NON_INODE);
 	if (PTR_ERR(folio) == -ENOENT)
 		return 1;
 	else if (IS_ERR(folio))
@@ -1038,7 +1039,8 @@ static int truncate_nodes(struct dnode_of_data *dn, unsigned int nofs,
 
 	trace_f2fs_truncate_nodes_enter(dn->inode, dn->nid, dn->data_blkaddr);
 
-	folio = f2fs_get_node_folio(F2FS_I_SB(dn->inode), dn->nid);
+	folio = f2fs_get_node_folio(F2FS_I_SB(dn->inode), dn->nid,
+						NODE_TYPE_NON_INODE);
 	if (IS_ERR(folio)) {
 		trace_f2fs_truncate_nodes_exit(dn->inode, PTR_ERR(folio));
 		return PTR_ERR(folio);
@@ -1116,7 +1118,8 @@ static int truncate_partial_nodes(struct dnode_of_data *dn,
 	/* get indirect nodes in the path */
 	for (i = 0; i < idx + 1; i++) {
 		/* reference count'll be increased */
-		folios[i] = f2fs_get_node_folio(F2FS_I_SB(dn->inode), nid[i]);
+		folios[i] = f2fs_get_node_folio(F2FS_I_SB(dn->inode), nid[i],
+							NODE_TYPE_NON_INODE);
 		if (IS_ERR(folios[i])) {
 			err = PTR_ERR(folios[i]);
 			idx = i - 1;
@@ -1501,21 +1504,37 @@ static int sanity_check_node_footer(struct f2fs_sb_info *sbi,
 					struct folio *folio, pgoff_t nid,
 					enum node_type ntype)
 {
-	if (unlikely(nid != nid_of_node(folio) ||
-		(ntype == NODE_TYPE_INODE && !IS_INODE(folio)) ||
-		(ntype == NODE_TYPE_XATTR &&
-		!f2fs_has_xattr_block(ofs_of_node(folio))) ||
-		time_to_inject(sbi, FAULT_INCONSISTENT_FOOTER))) {
-		f2fs_warn(sbi, "inconsistent node block, node_type:%d, nid:%lu, "
-			  "node_footer[nid:%u,ino:%u,ofs:%u,cpver:%llu,blkaddr:%u]",
-			  ntype, nid, nid_of_node(folio), ino_of_node(folio),
-			  ofs_of_node(folio), cpver_of_node(folio),
-			  next_blkaddr_of_node(folio));
-		set_sbi_flag(sbi, SBI_NEED_FSCK);
-		f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
-		return -EFSCORRUPTED;
+	if (unlikely(nid != nid_of_node(folio)))
+		goto out_err;
+
+	switch (ntype) {
+	case NODE_TYPE_INODE:
+		if (!IS_INODE(folio))
+			goto out_err;
+		break;
+	case NODE_TYPE_XATTR:
+		if (!f2fs_has_xattr_block(ofs_of_node(folio)))
+			goto out_err;
+		break;
+	case NODE_TYPE_NON_INODE:
+		if (IS_INODE(folio))
+			goto out_err;
+		break;
+	default:
+		break;
 	}
+	if (time_to_inject(sbi, FAULT_INCONSISTENT_FOOTER))
+		goto out_err;
 	return 0;
+out_err:
+	f2fs_warn(sbi, "inconsistent node block, node_type:%d, nid:%lu, "
+		  "node_footer[nid:%u,ino:%u,ofs:%u,cpver:%llu,blkaddr:%u]",
+		  ntype, nid, nid_of_node(folio), ino_of_node(folio),
+		  ofs_of_node(folio), cpver_of_node(folio),
+		  next_blkaddr_of_node(folio));
+	set_sbi_flag(sbi, SBI_NEED_FSCK);
+	f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
+	return -EFSCORRUPTED;
 }
 
 static struct folio *__get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
@@ -1572,9 +1591,10 @@ static struct folio *__get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
 	return ERR_PTR(err);
 }
 
-struct folio *f2fs_get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid)
+struct folio *f2fs_get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
+						enum node_type node_type)
 {
-	return __get_node_folio(sbi, nid, NULL, 0, NODE_TYPE_REGULAR);
+	return __get_node_folio(sbi, nid, NULL, 0, node_type);
 }
 
 struct folio *f2fs_get_inode_folio(struct f2fs_sb_info *sbi, pgoff_t ino)
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 030390543b54..9cb8dcf8d417 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -57,6 +57,7 @@ enum node_type {
 	NODE_TYPE_REGULAR,
 	NODE_TYPE_INODE,
 	NODE_TYPE_XATTR,
+	NODE_TYPE_NON_INODE,
 };
 
 /*
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 842b2daffa85..870b68c2c032 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -548,7 +548,7 @@ static int check_index_in_prev_nodes(struct f2fs_sb_info *sbi,
 	}
 
 	/* Get the node page */
-	node_folio = f2fs_get_node_folio(sbi, nid);
+	node_folio = f2fs_get_node_folio(sbi, nid, NODE_TYPE_REGULAR);
 	if (IS_ERR(node_folio))
 		return PTR_ERR(node_folio);
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
