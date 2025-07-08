Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D48AAAFD44E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9zxhDP4AsCaHj/Ov0kJATvZa9lu/5oLrPOkF0lQ1zj0=; b=RVexfyTOoLiVq6btJTSDXVRkJ/
	2nFdAERXr+gYGuOj/JiBakcHZBR3SKaWLkLMXzegmqkr1qJ5VvXNIjtpuNih82y1tV3zqR+AGA9/u
	zQRc3qdaaDUOpfuaH/ZM0avbYwY2r5hLvJgW1to6H2QnIFe4byjH8EvCUxh/8tzru7qc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBk1-0005LB-Lo;
	Tue, 08 Jul 2025 17:04:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjy-0005IN-CU
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vTr7cdrXV18OLa+YIvt1+btozEE41sCQ/noPdcvTfNo=; b=KNhKlOOtvGtYmiH8lDSyegr5Re
 NqD9jTdIV/HiIlNXo7/zptzyfs7PJktmPaHLvt5dSiz9w/tmaexW5CKXsjlR89JEUnBtcsYKk5ioM
 MgzuUqbZqaEVihKAUUvtSMWps0fNLB595t02xDEHR9ahMtfId3Tg/x9mYTEFYhZkt/6c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vTr7cdrXV18OLa+YIvt1+btozEE41sCQ/noPdcvTfNo=; b=kDZ73QhQn9CjA6Cdu0CEJlGfyi
 dD0yFw/cAC5KX3v4pAlME3kz7uuALklzGEWf0c7ip/tTZHEKFBFCLuAf8MzG7Xx01L9h7+a5JoqGL
 4i5I619gAnx54ubC+KNXLkKj3CTpFjJQH44rg1ClGWZjoSHE4LpmDqUq03JiCBnoNIFc=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBju-0006FZ-2M for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=vTr7cdrXV18OLa+YIvt1+btozEE41sCQ/noPdcvTfNo=; b=lgSXfnBBIDSmOrpFGFKW6PUv7n
 cSEtAiaUvnva9UAXoVHQ1y+xHVzTANsNYbP66ZSgxChRhyc0vvZqZ7RW1/J76VDyfaYF5uQ5Gs7Oy
 LtyTvWyv7k4Lu5TkY+blvta+kNc/5kp2xjp5O4rw/EuiuCNkFr188VFhghCeFIM2rZSf1BzmCkS+f
 qtc1axD63VCnbPUwppyfK13hTCuxO9WLfhhArj4kyGEwnGtRzJQIfjp5kjmc5HXPp6hI1bTofZiJ1
 E2KgIfgAdQciRs+Agqt2X3dcbGljVoHdkcOjivSEQdpWbtf5G9pkZbQAET0ZrEWcz0ky5bVchI3io
 WSHbtzXQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBji-00000000T6e-1NK7;
 Tue, 08 Jul 2025 17:04:06 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:31 +0100
Message-ID: <20250708170359.111653-35-willy@infradead.org>
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
 Content preview:  All callers now have a folio so pass it in. Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/extent_cache.c
 | 2 +- fs/f2fs/file.c | 2 +- fs/f2fs/gc.c | 2 +- fs/f2fs/node.c | 4 ++--
 fs/f2fs/node.h | 6 +++--- fs/f2fs/recov [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uZBju-0006FZ-2M
Subject: [f2fs-dev] [PATCH 34/60] f2fs: Pass a folio to ofs_of_node()
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

All callers now have a folio so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/extent_cache.c |  2 +-
 fs/f2fs/file.c         |  2 +-
 fs/f2fs/gc.c           |  2 +-
 fs/f2fs/node.c         |  4 ++--
 fs/f2fs/node.h         |  6 +++---
 fs/f2fs/recovery.c     | 14 +++++++-------
 6 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index a5d5bc8c0da5..941e85fe091e 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -934,7 +934,7 @@ static void __update_extent_cache(struct dnode_of_data *dn, enum extent_type typ
 	if (!__may_extent_tree(dn->inode, type))
 		return;
 
-	ei.fofs = f2fs_start_bidx_of_node(ofs_of_node(&dn->node_folio->page), dn->inode) +
+	ei.fofs = f2fs_start_bidx_of_node(ofs_of_node(dn->node_folio), dn->inode) +
 								dn->ofs_in_node;
 	ei.len = 1;
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ded2f48df351..b37a1aae2708 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -708,7 +708,7 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 		 * once we invalidate valid blkaddr in range [ofs, ofs + count],
 		 * we will invalidate all blkaddr in the whole range.
 		 */
-		fofs = f2fs_start_bidx_of_node(ofs_of_node(&dn->node_folio->page),
+		fofs = f2fs_start_bidx_of_node(ofs_of_node(dn->node_folio),
 							dn->inode) + ofs;
 		f2fs_update_read_extent_cache_range(dn, fofs, 0, len);
 		f2fs_update_age_extent_cache_range(dn, fofs, len);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index b2645a18a596..b681d0f23c57 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1177,7 +1177,7 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 		return false;
 	}
 
-	*nofs = ofs_of_node(&node_folio->page);
+	*nofs = ofs_of_node(node_folio);
 	source_blkaddr = data_blkaddr(NULL, node_folio, ofs_in_node);
 	f2fs_folio_put(node_folio, true);
 
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index a2258883ca77..db81c54ef7f6 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1479,12 +1479,12 @@ static int sanity_check_node_footer(struct f2fs_sb_info *sbi,
 	if (unlikely(nid != nid_of_node(folio) ||
 		(ntype == NODE_TYPE_INODE && !IS_INODE(page)) ||
 		(ntype == NODE_TYPE_XATTR &&
-		!f2fs_has_xattr_block(ofs_of_node(page))) ||
+		!f2fs_has_xattr_block(ofs_of_node(folio))) ||
 		time_to_inject(sbi, FAULT_INCONSISTENT_FOOTER))) {
 		f2fs_warn(sbi, "inconsistent node block, node_type:%d, nid:%lu, "
 			  "node_footer[nid:%u,ino:%u,ofs:%u,cpver:%llu,blkaddr:%u]",
 			  ntype, nid, nid_of_node(folio), ino_of_node(folio),
-			  ofs_of_node(page), cpver_of_node(folio),
+			  ofs_of_node(folio), cpver_of_node(folio),
 			  next_blkaddr_of_node(folio));
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index d366e2e25498..fecbd0c4aea5 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -255,9 +255,9 @@ static inline nid_t nid_of_node(const struct folio *node_folio)
 	return le32_to_cpu(rn->footer.nid);
 }
 
-static inline unsigned int ofs_of_node(const struct page *node_page)
+static inline unsigned int ofs_of_node(const struct folio *node_folio)
 {
-	struct f2fs_node *rn = F2FS_NODE(node_page);
+	struct f2fs_node *rn = F2FS_NODE(&node_folio->page);
 	unsigned flag = le32_to_cpu(rn->footer.flag);
 	return flag >> OFFSET_BIT_SHIFT;
 }
@@ -352,7 +352,7 @@ static inline bool is_recoverable_dnode(const struct folio *folio)
  */
 static inline bool IS_DNODE(const struct folio *node_folio)
 {
-	unsigned int ofs = ofs_of_node(&node_folio->page);
+	unsigned int ofs = ofs_of_node(node_folio);
 
 	if (f2fs_has_xattr_block(ofs))
 		return true;
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 3bfcf5c297a5..7f5d7499bd68 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -552,7 +552,7 @@ static int check_index_in_prev_nodes(struct f2fs_sb_info *sbi,
 	if (IS_ERR(node_folio))
 		return PTR_ERR(node_folio);
 
-	offset = ofs_of_node(&node_folio->page);
+	offset = ofs_of_node(node_folio);
 	ino = ino_of_node(node_folio);
 	f2fs_folio_put(node_folio, true);
 
@@ -632,7 +632,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 		err = f2fs_recover_inline_xattr(inode, folio);
 		if (err)
 			goto out;
-	} else if (f2fs_has_xattr_block(ofs_of_node(&folio->page))) {
+	} else if (f2fs_has_xattr_block(ofs_of_node(folio))) {
 		err = f2fs_recover_xattr_data(inode, folio);
 		if (!err)
 			recovered++;
@@ -648,7 +648,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 	}
 
 	/* step 3: recover data indices */
-	start = f2fs_start_bidx_of_node(ofs_of_node(&folio->page), inode);
+	start = f2fs_start_bidx_of_node(ofs_of_node(folio), inode);
 	end = start + ADDRS_PER_PAGE(&folio->page, inode);
 
 	set_new_dnode(&dn, inode, NULL, NULL, 0);
@@ -670,10 +670,10 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 
 	f2fs_bug_on(sbi, ni.ino != ino_of_node(folio));
 
-	if (ofs_of_node(&dn.node_folio->page) != ofs_of_node(&folio->page)) {
+	if (ofs_of_node(dn.node_folio) != ofs_of_node(folio)) {
 		f2fs_warn(sbi, "Inconsistent ofs_of_node, ino:%lu, ofs:%u, %u",
-			  inode->i_ino, ofs_of_node(&dn.node_folio->page),
-			  ofs_of_node(&folio->page));
+			  inode->i_ino, ofs_of_node(dn.node_folio),
+			  ofs_of_node(folio));
 		err = -EFSCORRUPTED;
 		f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
 		goto err;
@@ -760,7 +760,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 
 	copy_node_footer(dn.node_folio, folio);
 	fill_node_footer(dn.node_folio, dn.nid, ni.ino,
-					ofs_of_node(&folio->page), false);
+					ofs_of_node(folio), false);
 	folio_mark_dirty(dn.node_folio);
 err:
 	f2fs_put_dnode(&dn);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
