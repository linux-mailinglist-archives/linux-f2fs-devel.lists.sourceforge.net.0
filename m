Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E51C8AFD41F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzO4iUcyG++Qv/mmAM3hywypJRUqqB8K6KM/0kPXvuY=; b=fza/1UErRb1sx/n5BYAmfEG/DN
	sA3Ame+zPrFecnIReBe8xklTRcjlVCDL/eIeA4nQ25FYfRyLR0lzfvXD5nki+h8l+MNcYNMdZUEK5
	8l3eSk+ZkJbJ6l93J0kwRsm58qAOCaMwoNhA+d6Dr1/9Xp80ZKy742KSYuTNg7XMfuAA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjo-0007J5-Mw;
	Tue, 08 Jul 2025 17:04:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjn-0007Is-Ob
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MN/aUi86dzLud6mkQvJD9i0HNXhhp2d7vffUobX7/Wc=; b=VwlWqdZrSyclN9/0+HNQ3r4CF0
 xPXxrr3Ofku4PjQCmxQjnW/kzmEVIbTRpS9zeEEu9b9pXn1qOeZMFSCe8ZmpJk55uv8RjWclzSVa+
 Rkm8bwqmnP3gFBwyZrUfUj4KftlhVZquxx8R1bjchBLYPZmUA8jpQmanlWpxGj5+82qk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MN/aUi86dzLud6mkQvJD9i0HNXhhp2d7vffUobX7/Wc=; b=VoYgUrksSxPBidp0KfJTijWMNc
 tNJ/vSQdcDaEdR0eur7p7Bvwl4basxItJNBMCDaymQLFLM3RVVYLPtjV7plyX+Fvnt+kPUGBRK6P1
 M1fERDHAr1nhrxl2pmBR2CppahjKG+r/gxQaPUw41DKJ5K936upWfiiJ1Fj/vVYRlB20=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjl-0006Dy-87 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=MN/aUi86dzLud6mkQvJD9i0HNXhhp2d7vffUobX7/Wc=; b=fSqR89uobHARBcuVPOJHrQ1nEm
 VEuSbictvujcyHZgKuxx67a5lDEtoCCqjFkfzDBL6xBR04tFpyaMjewMm13rVjTUu/lsbE58qZj4L
 qpCv5hGWPW/Sl+MbpBW++Io507p13PZhxsvZ5s2iK5fUes/OWGLK8Nv70KKbrDWR9QGACBiXNafLz
 UeIvDdWWAE3ezDHKcJj7X0w/cPx0GK4hGJL1t9EXp6VywUkI2NYeQ5dTv2vUMlrCW3ELDu3DtNOD8
 i6guwu2qQpL069qS3/j7hanQ2eJzTCBJeYwhZyMbeZyjbiX0rrdkGDs3dkJhadWV3L+MchegIzzhz
 dcrlpr8Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBje-00000000T49-3mEE;
 Tue, 08 Jul 2025 17:04:02 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:07 +0100
Message-ID: <20250708170359.111653-11-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: All callers have a folio so pass it in. Also make the
 argument
 const as the function does not modify it. Signed-off-by: Matthew Wilcox
 (Oracle)
 <willy@infradead.org> --- fs/f2fs/data.c | 2 +- fs/f2fs/inode.c | 8 ++++----
 fs/f2fs/node.c | 24 ++++++++++++ fs/f2fs/node.h | 4 ++-- fs/f2fs/recover
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uZBjl-0006Dy-87
Subject: [f2fs-dev] [PATCH 10/60] f2fs: Pass a folio to ino_of_node()
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

All callers have a folio so pass it in.  Also make the argument const
as the function does not modify it.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c     |  2 +-
 fs/f2fs/inode.c    |  8 ++++----
 fs/f2fs/node.c     | 24 ++++++++++++------------
 fs/f2fs/node.h     |  4 ++--
 fs/f2fs/recovery.c | 14 +++++++-------
 5 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 31e892842625..b023d15b4555 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -574,7 +574,7 @@ static bool __has_merged_page(struct bio *bio, struct inode *inode,
 			return true;
 		if (page && page == &target->page)
 			return true;
-		if (ino && ino == ino_of_node(&target->page))
+		if (ino && ino == ino_of_node(target))
 			return true;
 	}
 
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index c6c62fbbab6e..eedc56a3561b 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -178,7 +178,7 @@ bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct folio *folio)
 
 	if (provided != calculated)
 		f2fs_warn(sbi, "checksum invalid, nid = %lu, ino_of_node = %x, %x vs. %x",
-			  folio->index, ino_of_node(&folio->page),
+			  folio->index, ino_of_node(folio),
 			  provided, calculated);
 
 	return provided == calculated;
@@ -280,14 +280,14 @@ static bool sanity_check_inode(struct inode *inode, struct folio *node_folio)
 		return false;
 	}
 
-	if (ino_of_node(&node_folio->page) != nid_of_node(&node_folio->page)) {
+	if (ino_of_node(node_folio) != nid_of_node(&node_folio->page)) {
 		f2fs_warn(sbi, "%s: corrupted inode footer i_ino=%lx, ino,nid: [%u, %u] run fsck to fix.",
 			  __func__, inode->i_ino,
-			  ino_of_node(&node_folio->page), nid_of_node(&node_folio->page));
+			  ino_of_node(node_folio), nid_of_node(&node_folio->page));
 		return false;
 	}
 
-	if (ino_of_node(&node_folio->page) == fi->i_xattr_nid) {
+	if (ino_of_node(node_folio) == fi->i_xattr_nid) {
 		f2fs_warn(sbi, "%s: corrupted inode i_ino=%lx, xnid=%x, run fsck to fix.",
 			  __func__, inode->i_ino, fi->i_xattr_nid);
 		return false;
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index e97b6e2ddbfb..fabcb3fa47cd 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -974,9 +974,9 @@ static int truncate_dnode(struct dnode_of_data *dn)
 	else if (IS_ERR(folio))
 		return PTR_ERR(folio);
 
-	if (IS_INODE(&folio->page) || ino_of_node(&folio->page) != dn->inode->i_ino) {
+	if (IS_INODE(&folio->page) || ino_of_node(folio) != dn->inode->i_ino) {
 		f2fs_err(sbi, "incorrect node reference, ino: %lu, nid: %u, ino_of_node: %u",
-				dn->inode->i_ino, dn->nid, ino_of_node(&folio->page));
+				dn->inode->i_ino, dn->nid, ino_of_node(folio));
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_handle_error(sbi, ERROR_INVALID_NODE_REFERENCE);
 		f2fs_folio_put(folio, true);
@@ -1484,7 +1484,7 @@ static int sanity_check_node_footer(struct f2fs_sb_info *sbi,
 		time_to_inject(sbi, FAULT_INCONSISTENT_FOOTER))) {
 		f2fs_warn(sbi, "inconsistent node block, node_type:%d, nid:%lu, "
 			  "node_footer[nid:%u,ino:%u,ofs:%u,cpver:%llu,blkaddr:%u]",
-			  ntype, nid, nid_of_node(page), ino_of_node(page),
+			  ntype, nid, nid_of_node(page), ino_of_node(folio),
 			  ofs_of_node(page), cpver_of_node(page),
 			  next_blkaddr_of_node(folio));
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
@@ -1633,7 +1633,7 @@ static struct folio *last_fsync_dnode(struct f2fs_sb_info *sbi, nid_t ino)
 
 			if (!IS_DNODE(&folio->page) || !is_cold_node(&folio->page))
 				continue;
-			if (ino_of_node(&folio->page) != ino)
+			if (ino_of_node(folio) != ino)
 				continue;
 
 			folio_lock(folio);
@@ -1643,7 +1643,7 @@ static struct folio *last_fsync_dnode(struct f2fs_sb_info *sbi, nid_t ino)
 				folio_unlock(folio);
 				continue;
 			}
-			if (ino_of_node(&folio->page) != ino)
+			if (ino_of_node(folio) != ino)
 				goto continue_unlock;
 
 			if (!folio_test_dirty(folio)) {
@@ -1673,7 +1673,7 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted
 	struct node_info ni;
 	struct f2fs_io_info fio = {
 		.sbi = sbi,
-		.ino = ino_of_node(&folio->page),
+		.ino = ino_of_node(folio),
 		.type = NODE,
 		.op = REQ_OP_WRITE,
 		.op_flags = wbc_to_write_flags(wbc),
@@ -1842,7 +1842,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 
 			if (!IS_DNODE(&folio->page) || !is_cold_node(&folio->page))
 				continue;
-			if (ino_of_node(&folio->page) != ino)
+			if (ino_of_node(folio) != ino)
 				continue;
 
 			folio_lock(folio);
@@ -1852,7 +1852,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 				folio_unlock(folio);
 				continue;
 			}
-			if (ino_of_node(&folio->page) != ino)
+			if (ino_of_node(folio) != ino)
 				goto continue_unlock;
 
 			if (!folio_test_dirty(folio) && folio != last_folio) {
@@ -1948,7 +1948,7 @@ static bool flush_dirty_inode(struct folio *folio)
 {
 	struct f2fs_sb_info *sbi = F2FS_F_SB(folio);
 	struct inode *inode;
-	nid_t ino = ino_of_node(&folio->page);
+	nid_t ino = ino_of_node(folio);
 
 	inode = find_inode_nowait(sbi->sb, ino, f2fs_match_ino, NULL);
 	if (!inode)
@@ -1991,7 +1991,7 @@ void f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
 			if (page_private_inline(&folio->page)) {
 				clear_page_private_inline(&folio->page);
 				folio_unlock(folio);
-				flush_inline_data(sbi, ino_of_node(&folio->page));
+				flush_inline_data(sbi, ino_of_node(folio));
 				continue;
 			}
 unlock:
@@ -2073,7 +2073,7 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 			if (page_private_inline(&folio->page)) {
 				clear_page_private_inline(&folio->page);
 				folio_unlock(folio);
-				flush_inline_data(sbi, ino_of_node(&folio->page));
+				flush_inline_data(sbi, ino_of_node(folio));
 				goto lock_node;
 			}
 
@@ -2804,7 +2804,7 @@ int f2fs_recover_xattr_data(struct inode *inode, struct page *page)
 int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct folio *folio)
 {
 	struct f2fs_inode *src, *dst;
-	nid_t ino = ino_of_node(&folio->page);
+	nid_t ino = ino_of_node(folio);
 	struct node_info old_ni, new_ni;
 	struct folio *ifolio;
 	int err;
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 1446c433b3ec..6c4fc3449a68 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -243,9 +243,9 @@ static inline void set_to_next_nat(struct f2fs_nm_info *nm_i, nid_t start_nid)
 #endif
 }
 
-static inline nid_t ino_of_node(struct page *node_page)
+static inline nid_t ino_of_node(const struct folio *node_folio)
 {
-	struct f2fs_node *rn = F2FS_NODE(node_page);
+	struct f2fs_node *rn = F2FS_NODE(&node_folio->page);
 	return le32_to_cpu(rn->footer.ino);
 }
 
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 7e408016b1bc..224754186096 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -233,7 +233,7 @@ static int recover_dentry(struct inode *inode, struct folio *ifolio,
 	else
 		name = raw_inode->i_name;
 	f2fs_notice(F2FS_I_SB(inode), "%s: ino = %x, name = %s, dir = %lx, err = %d",
-		    __func__, ino_of_node(&ifolio->page), name,
+		    __func__, ino_of_node(ifolio), name,
 		    IS_ERR(dir) ? 0 : dir->i_ino, err);
 	return err;
 }
@@ -336,7 +336,7 @@ static int recover_inode(struct inode *inode, struct folio *folio)
 		name = F2FS_INODE(folio)->i_name;
 
 	f2fs_notice(F2FS_I_SB(inode), "recover_inode: ino = %x, name = %s, inline = %x",
-		    ino_of_node(&folio->page), name, raw->i_inline);
+		    ino_of_node(folio), name, raw->i_inline);
 	return 0;
 }
 
@@ -432,7 +432,7 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 		if (!is_fsync_dnode(&folio->page))
 			goto next;
 
-		entry = get_fsync_inode(head, ino_of_node(&folio->page));
+		entry = get_fsync_inode(head, ino_of_node(folio));
 		if (!entry) {
 			bool quota_inode = false;
 
@@ -451,7 +451,7 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 			 * CP | dnode(F) | inode(DF)
 			 * For this case, we should not give up now.
 			 */
-			entry = add_fsync_inode(sbi, head, ino_of_node(&folio->page),
+			entry = add_fsync_inode(sbi, head, ino_of_node(folio),
 								quota_inode);
 			if (IS_ERR(entry)) {
 				err = PTR_ERR(entry);
@@ -553,7 +553,7 @@ static int check_index_in_prev_nodes(struct f2fs_sb_info *sbi,
 		return PTR_ERR(node_folio);
 
 	offset = ofs_of_node(&node_folio->page);
-	ino = ino_of_node(&node_folio->page);
+	ino = ino_of_node(node_folio);
 	f2fs_folio_put(node_folio, true);
 
 	if (ino != dn->inode->i_ino) {
@@ -668,7 +668,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 	if (err)
 		goto err;
 
-	f2fs_bug_on(sbi, ni.ino != ino_of_node(&folio->page));
+	f2fs_bug_on(sbi, ni.ino != ino_of_node(folio));
 
 	if (ofs_of_node(&dn.node_folio->page) != ofs_of_node(&folio->page)) {
 		f2fs_warn(sbi, "Inconsistent ofs_of_node, ino:%lu, ofs:%u, %u",
@@ -801,7 +801,7 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 			break;
 		}
 
-		entry = get_fsync_inode(inode_list, ino_of_node(&folio->page));
+		entry = get_fsync_inode(inode_list, ino_of_node(folio));
 		if (!entry)
 			goto next;
 		/*
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
