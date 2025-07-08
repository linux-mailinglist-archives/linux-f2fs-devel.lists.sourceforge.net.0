Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6C4AFD437
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Us4y4yXHYD7ScGTjJLto3jBhdM/31l2JoS8qbBAGdE=; b=K5pnZINK2425HOmIZ+/VQLBMEP
	pgOpQ8Dxwg+U46Q8r/pXNjdP8lFh6yJjit4zi21/oyn/0u3TdHQMcY0zIP8uYa4TpFlh5XQlbyzpn
	9YV680k1YhBFMNW33nJrgMB1on0XDXEzvHAFZ+8gAk5gnDjvsEqlLtKENvFoD7IzdzWw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjw-0007Lz-Bq;
	Tue, 08 Jul 2025 17:04:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjr-0007KD-BB
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0MDhlAj/ovD5rHcUk8HEg1zzH2NPJ2GBrvFyKeFLZTM=; b=hA1r4GbSMMLdiBHp9rmSjHSOit
 ZYI5O7lbdN0zTVJWveuv89kHcAGgUvy+4TfKMpPe2/A82HG5y1+njFnj4J/jxvBzw+EP2lhr5nasg
 OgOo/eEXfQx++btMB4G3Xn760q3FEt/TowpFMycHkykdP8IhX8t7w4LrBC+9gg7cbbSI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0MDhlAj/ovD5rHcUk8HEg1zzH2NPJ2GBrvFyKeFLZTM=; b=R86TvQMnmoJHX8C8o6prmgE/a7
 DWovdv7ZHBJhj539OyhoCfLv4KgpsLFrCtU+upxoCCe4bG9nAgoQm7IWJuXXT+NnbDPgAxbBs4KG4
 j1dotT5kRCIuGwJeMu45BlZL3nk4/o7vJx3ALtYOnc3VvCKSujDcoXeiNu5774oFuve8=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjq-0006EV-57 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=0MDhlAj/ovD5rHcUk8HEg1zzH2NPJ2GBrvFyKeFLZTM=; b=oxsi/nTlgA/IL2z1TOGJKPmUlq
 omtSVylQlrr0zuas7rqMc43JOukpXU92ePe6h4+uEObpVsds26auWE8I0MT+OQsH0tVJ6I81orYB7
 gf4aTcnC7ZCwxDij0G6k/RguX6MLa9gGX5z5H9Ve8wbfWcxEFVJuuMQjHwSLWOr00E7dXm3ZNx4En
 /YKOSPMMgZ6cT1RFk6F1/FRP9lCWQWEtZ2MNfliXF1ZdKhiisovmK9yPp3AF60Cw/KG3vW5mGFxpy
 1ec8cyZzo4k5noaZAt/syyg9LVuUgCOD7+1jphwzn7QpHMlG+ai5QXyr+KrU2iVL+XuYfjEWq5umr
 xqmHcEFg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBje-00000000T43-3DL2;
 Tue, 08 Jul 2025 17:04:02 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:06 +0100
Message-ID: <20250708170359.111653-10-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  All callers now have a folio, so pass it in. Also make it
 const as F2FS_INODE() does not modify the struct folio passed in (the data
 it describes is mutable, but it does not change the contents of the [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uZBjq-0006EV-57
Subject: [f2fs-dev] [PATCH 09/60] f2fs: Pass a folio to F2FS_INODE()
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

All callers now have a folio, so pass it in.  Also make it const as
F2FS_INODE() does not modify the struct folio passed in (the data it
describes is mutable, but it does not change the contents of the struct).
This may improve code generation.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/dir.c          |  2 +-
 fs/f2fs/extent_cache.c |  4 ++--
 fs/f2fs/f2fs.h         |  9 +++++----
 fs/f2fs/gc.c           |  2 +-
 fs/f2fs/inline.c       |  6 +++---
 fs/f2fs/inode.c        | 10 +++++-----
 fs/f2fs/node.c         |  8 ++++----
 fs/f2fs/recovery.c     |  8 ++++----
 8 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index c36b3b22bfff..888dca7e82ac 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -454,7 +454,7 @@ static void init_dent_inode(struct inode *dir, struct inode *inode,
 	f2fs_folio_wait_writeback(ifolio, NODE, true, true);
 
 	/* copy name info. to this inode folio */
-	ri = F2FS_INODE(&ifolio->page);
+	ri = F2FS_INODE(ifolio);
 	ri->i_namelen = cpu_to_le32(fname->disk_name.len);
 	memcpy(ri->i_name, fname->disk_name.name, fname->disk_name.len);
 	if (IS_ENCRYPTED(dir)) {
diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 41b08814242c..a5d5bc8c0da5 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -22,7 +22,7 @@
 bool sanity_check_extent_cache(struct inode *inode, struct folio *ifolio)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct f2fs_extent *i_ext = &F2FS_INODE(&ifolio->page)->i_ext;
+	struct f2fs_extent *i_ext = &F2FS_INODE(ifolio)->i_ext;
 	struct extent_info ei;
 	int devi;
 
@@ -411,7 +411,7 @@ void f2fs_init_read_extent_tree(struct inode *inode, struct folio *ifolio)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct extent_tree_info *eti = &sbi->extent_tree[EX_READ];
-	struct f2fs_extent *i_ext = &F2FS_INODE(&ifolio->page)->i_ext;
+	struct f2fs_extent *i_ext = &F2FS_INODE(ifolio)->i_ext;
 	struct extent_tree *et;
 	struct extent_node *en;
 	struct extent_info ei;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 0e33c971aff7..5e443b2ce8db 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2053,9 +2053,9 @@ static inline struct f2fs_node *F2FS_NODE(const struct page *page)
 	return (struct f2fs_node *)page_address(page);
 }
 
-static inline struct f2fs_inode *F2FS_INODE(struct page *page)
+static inline struct f2fs_inode *F2FS_INODE(const struct folio *folio)
 {
-	return &((struct f2fs_node *)page_address(page))->i;
+	return &((struct f2fs_node *)folio_address(folio))->i;
 }
 
 static inline struct f2fs_nm_info *NM_I(struct f2fs_sb_info *sbi)
@@ -3371,9 +3371,10 @@ static inline unsigned int addrs_per_page(struct inode *inode,
 	return addrs;
 }
 
-static inline void *inline_xattr_addr(struct inode *inode, struct folio *folio)
+static inline
+void *inline_xattr_addr(struct inode *inode, const struct folio *folio)
 {
-	struct f2fs_inode *ri = F2FS_INODE(&folio->page);
+	struct f2fs_inode *ri = F2FS_INODE(folio);
 
 	return (void *)&(ri->i_addr[DEF_ADDRS_PER_INODE -
 					get_inline_xattr_addrs(inode)]);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 30b95ebb4499..fc262d6dff3d 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1163,7 +1163,7 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	}
 
 	if (IS_INODE(&node_folio->page)) {
-		base = offset_in_addr(F2FS_INODE(&node_folio->page));
+		base = offset_in_addr(F2FS_INODE(node_folio));
 		max_addrs = DEF_ADDRS_PER_INODE;
 	} else {
 		base = 0;
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index fa072e4a5616..4c636a8043f8 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -35,7 +35,7 @@ bool f2fs_may_inline_data(struct inode *inode)
 
 static bool inode_has_blocks(struct inode *inode, struct folio *ifolio)
 {
-	struct f2fs_inode *ri = F2FS_INODE(&ifolio->page);
+	struct f2fs_inode *ri = F2FS_INODE(ifolio);
 	int i;
 
 	if (F2FS_HAS_BLOCKS(inode))
@@ -306,7 +306,7 @@ int f2fs_recover_inline_data(struct inode *inode, struct folio *nfolio)
 	 *    x       x  -> recover data blocks
 	 */
 	if (IS_INODE(&nfolio->page))
-		ri = F2FS_INODE(&nfolio->page);
+		ri = F2FS_INODE(nfolio);
 
 	if (f2fs_has_inline_data(inode) &&
 			ri && (ri->i_inline & F2FS_INLINE_DATA)) {
@@ -825,7 +825,7 @@ int f2fs_inline_data_fiemap(struct inode *inode,
 
 	byteaddr = (__u64)ni.blk_addr << inode->i_sb->s_blocksize_bits;
 	byteaddr += (char *)inline_data_addr(inode, ifolio) -
-					(char *)F2FS_INODE(&ifolio->page);
+					(char *)F2FS_INODE(ifolio);
 	err = fiemap_fill_next_extent(fieinfo, start, byteaddr, ilen, flags);
 	trace_f2fs_fiemap(inode, start, byteaddr, ilen, flags, err);
 out:
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index b7324c583683..c6c62fbbab6e 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -108,7 +108,7 @@ static void __recover_inline_status(struct inode *inode, struct folio *ifolio)
 			f2fs_folio_wait_writeback(ifolio, NODE, true, true);
 
 			set_inode_flag(inode, FI_DATA_EXIST);
-			set_raw_inline(inode, F2FS_INODE(&ifolio->page));
+			set_raw_inline(inode, F2FS_INODE(ifolio));
 			folio_mark_dirty(ifolio);
 			return;
 		}
@@ -270,10 +270,10 @@ static bool sanity_check_inode(struct inode *inode, struct folio *node_folio)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
-	struct f2fs_inode *ri = F2FS_INODE(&node_folio->page);
+	struct f2fs_inode *ri = F2FS_INODE(node_folio);
 	unsigned long long iblocks;
 
-	iblocks = le64_to_cpu(F2FS_INODE(&node_folio->page)->i_blocks);
+	iblocks = le64_to_cpu(F2FS_INODE(node_folio)->i_blocks);
 	if (!iblocks) {
 		f2fs_warn(sbi, "%s: corrupted inode i_blocks i_ino=%lx iblocks=%llu, run fsck to fix.",
 			  __func__, inode->i_ino, iblocks);
@@ -419,7 +419,7 @@ static int do_read_inode(struct inode *inode)
 	if (IS_ERR(node_folio))
 		return PTR_ERR(node_folio);
 
-	ri = F2FS_INODE(&node_folio->page);
+	ri = F2FS_INODE(node_folio);
 
 	inode->i_mode = le16_to_cpu(ri->i_mode);
 	i_uid_write(inode, le32_to_cpu(ri->i_uid));
@@ -669,7 +669,7 @@ void f2fs_update_inode(struct inode *inode, struct folio *node_folio)
 
 	f2fs_inode_synced(inode);
 
-	ri = F2FS_INODE(&node_folio->page);
+	ri = F2FS_INODE(node_folio);
 
 	ri->i_mode = cpu_to_le16(inode->i_mode);
 	ri->i_advise = fi->i_advise;
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 742f9f750390..e97b6e2ddbfb 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1172,7 +1172,7 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 	set_new_dnode(&dn, inode, folio, NULL, 0);
 	folio_unlock(folio);
 
-	ri = F2FS_INODE(&folio->page);
+	ri = F2FS_INODE(folio);
 	switch (level) {
 	case 0:
 	case 1:
@@ -2727,7 +2727,7 @@ int f2fs_recover_inline_xattr(struct inode *inode, struct folio *folio)
 	if (IS_ERR(ifolio))
 		return PTR_ERR(ifolio);
 
-	ri = F2FS_INODE(&folio->page);
+	ri = F2FS_INODE(folio);
 	if (ri->i_inline & F2FS_INLINE_XATTR) {
 		if (!f2fs_has_inline_xattr(inode)) {
 			set_inode_flag(inode, FI_INLINE_XATTR);
@@ -2830,8 +2830,8 @@ int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct folio *folio)
 	fill_node_footer(&ifolio->page, ino, ino, 0, true);
 	set_cold_node(&ifolio->page, false);
 
-	src = F2FS_INODE(&folio->page);
-	dst = F2FS_INODE(&ifolio->page);
+	src = F2FS_INODE(folio);
+	dst = F2FS_INODE(ifolio);
 
 	memcpy(dst, src, offsetof(struct f2fs_inode, i_ext));
 	dst->i_size = 0;
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 7768e10fc183..7e408016b1bc 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -160,7 +160,7 @@ static int init_recovered_filename(const struct inode *dir,
 static int recover_dentry(struct inode *inode, struct folio *ifolio,
 						struct list_head *dir_list)
 {
-	struct f2fs_inode *raw_inode = F2FS_INODE(&ifolio->page);
+	struct f2fs_inode *raw_inode = F2FS_INODE(ifolio);
 	nid_t pino = le32_to_cpu(raw_inode->i_pino);
 	struct f2fs_dir_entry *de;
 	struct f2fs_filename fname;
@@ -240,7 +240,7 @@ static int recover_dentry(struct inode *inode, struct folio *ifolio,
 
 static int recover_quota_data(struct inode *inode, struct folio *folio)
 {
-	struct f2fs_inode *raw = F2FS_INODE(&folio->page);
+	struct f2fs_inode *raw = F2FS_INODE(folio);
 	struct iattr attr;
 	uid_t i_uid = le32_to_cpu(raw->i_uid);
 	gid_t i_gid = le32_to_cpu(raw->i_gid);
@@ -279,7 +279,7 @@ static void recover_inline_flags(struct inode *inode, struct f2fs_inode *ri)
 
 static int recover_inode(struct inode *inode, struct folio *folio)
 {
-	struct f2fs_inode *raw = F2FS_INODE(&folio->page);
+	struct f2fs_inode *raw = F2FS_INODE(folio);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 	char *name;
 	int err;
@@ -333,7 +333,7 @@ static int recover_inode(struct inode *inode, struct folio *folio)
 	if (file_enc_name(inode))
 		name = "<encrypted>";
 	else
-		name = F2FS_INODE(&folio->page)->i_name;
+		name = F2FS_INODE(folio)->i_name;
 
 	f2fs_notice(F2FS_I_SB(inode), "recover_inode: ino = %x, name = %s, inline = %x",
 		    ino_of_node(&folio->page), name, raw->i_inline);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
