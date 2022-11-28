Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC49463A48E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 10:16:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozaFJ-0005TA-N3;
	Mon, 28 Nov 2022 09:16:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+7f5f7765a4bd65a1d96c+7036+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1ozaFE-0005QJ-EF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CO7AaSzEVKoh5+r58FnBL0WGmPJNRyKwSSxykAs0gfc=; b=YCNbJLbjOI94HQyTBsuBmjgc2y
 3EuNZw1OXUKJ5GdLNMj3TcYOboALCirTKPJt51micbKpaJi7ZMkq2Slld+roiBpfcm5dV2DaeJlHz
 6fmbIF+BcjlNR9IcajBG9tf0tmYeDe8tuUyRkQxrGW0GOBHVuGmoXljS9KN7efsZRx2Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CO7AaSzEVKoh5+r58FnBL0WGmPJNRyKwSSxykAs0gfc=; b=mk2kW8nwD/z0AL6dNnSufob2b+
 DbDo6KAjqEZOmWwnmkQl+Ka7N9DtXs4njUSZcUdmEEqtR3uUZ+lo9SvduoffFhIYyA23ZONiE4JWv
 LEkwNcJsaW09jz+lvmSz2RBy7itrUmGRk2LJ90M1X7D64Txzh1R69A0+rBoUucZ5w+Vs=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozaEv-00057B-UT for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:15:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=CO7AaSzEVKoh5+r58FnBL0WGmPJNRyKwSSxykAs0gfc=; b=VHPofyh8wx5WfxmE8zomTdhj44
 SeFcdmotcFqVi3jhX5cHZA65K0BgJD4jVcmyrFY0cpSJZxEgUeCgvtpeVAhcPcpDA8vewuWj3go3y
 HuwTF9/c/dyeJbPOWT5RKhcSCKKZjml+dgdRt49BGJYqXYDRI+LkynFpWE2F8onf43FkBoCtuh/Wc
 9TM+j9nrjY+HeuiAsOF+x0qHBhRzbc9oSsORj3CAMsPoO9rX1hkx5O1Px2SyoLjNwggiBXceW3ZwR
 t30wF+UFGPn9dFZxIch4I8lgNNmjdQLGtA+5iGXiQB+R57f6y+Fa3Gcs2m1q/ySACANtkj05Y/K/G
 MJA3E0OA==;
Received: from [2001:4bb8:192:26e7:4739:fc09:43a5:2665] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ozaEq-000Ys8-1o; Mon, 28 Nov 2022 09:15:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Nov 2022 10:15:14 +0100
Message-Id: <20221128091523.1242584-7-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221128091523.1242584-1-hch@lst.de>
References: <20221128091523.1242584-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: All but three callers of f2fs_lookup_extent_cache just want
 the block address. Add a small helper to simplify them. Signed-off-by:
 Christoph
 Hellwig <hch@lst.de> --- fs/f2fs/data.c | 29 +++++++ fs/f2fs/extent_cache.c
 | 11 +++++++++++ fs/f2fs/f2fs.h | 2 ++ fs/f2fs/gc.c | 4 +--- 4 files changed, 
 [...] Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ozaEv-00057B-UT
Subject: [f2fs-dev] [PATCH 06/15] f2fs: add a f2fs_lookup_extent_cache_block
 helper
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

All but three callers of f2fs_lookup_extent_cache just want the block
address.  Add a small helper to simplify them.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/data.c         | 29 +++++++----------------------
 fs/f2fs/extent_cache.c | 11 +++++++++++
 fs/f2fs/f2fs.h         |  2 ++
 fs/f2fs/gc.c           |  4 +---
 4 files changed, 21 insertions(+), 25 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 404e1637e31072..a294a589ba1a91 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1199,14 +1199,8 @@ int f2fs_reserve_block(struct dnode_of_data *dn, pgoff_t index)
 
 int f2fs_get_block(struct dnode_of_data *dn, pgoff_t index)
 {
-	struct extent_info ei = {0, };
-	struct inode *inode = dn->inode;
-
-	if (f2fs_lookup_extent_cache(inode, index, &ei)) {
-		dn->data_blkaddr = ei.blk + index - ei.fofs;
+	if (f2fs_lookup_extent_cache_block(dn->inode, index, &dn->data_blkaddr))
 		return 0;
-	}
-
 	return f2fs_reserve_block(dn, index);
 }
 
@@ -1216,15 +1210,13 @@ struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
 	struct address_space *mapping = inode->i_mapping;
 	struct dnode_of_data dn;
 	struct page *page;
-	struct extent_info ei = {0, };
 	int err;
 
 	page = f2fs_grab_cache_page(mapping, index, for_write);
 	if (!page)
 		return ERR_PTR(-ENOMEM);
 
-	if (f2fs_lookup_extent_cache(inode, index, &ei)) {
-		dn.data_blkaddr = ei.blk + index - ei.fofs;
+	if (f2fs_lookup_extent_cache_block(inode, index, &dn.data_blkaddr)) {
 		if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), dn.data_blkaddr,
 						DATA_GENERIC_ENHANCE_READ)) {
 			err = -EFSCORRUPTED;
@@ -2623,7 +2615,6 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	struct page *page = fio->page;
 	struct inode *inode = page->mapping->host;
 	struct dnode_of_data dn;
-	struct extent_info ei = {0, };
 	struct node_info ni;
 	bool ipu_force = false;
 	int err = 0;
@@ -2635,9 +2626,8 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		set_new_dnode(&dn, inode, NULL, NULL, 0);
 
 	if (need_inplace_update(fio) &&
-			f2fs_lookup_extent_cache(inode, page->index, &ei)) {
-		fio->old_blkaddr = ei.blk + page->index - ei.fofs;
-
+	    f2fs_lookup_extent_cache_block(inode, page->index,
+					   &fio->old_blkaddr)) {
 		if (!f2fs_is_valid_blkaddr(fio->sbi, fio->old_blkaddr,
 						DATA_GENERIC_ENHANCE)) {
 			f2fs_handle_error(fio->sbi,
@@ -3310,7 +3300,6 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 	struct dnode_of_data dn;
 	struct page *ipage;
 	bool locked = false;
-	struct extent_info ei = {0, };
 	int err = 0;
 	int flag;
 
@@ -3359,9 +3348,8 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 	} else if (locked) {
 		err = f2fs_get_block(&dn, index);
 	} else {
-		if (f2fs_lookup_extent_cache(inode, index, &ei)) {
-			dn.data_blkaddr = ei.blk + index - ei.fofs;
-		} else {
+		if (!f2fs_lookup_extent_cache_block(inode, index,
+				&dn.data_blkaddr)) {
 			/* hole case */
 			err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
 			if (err || dn.data_blkaddr == NULL_ADDR) {
@@ -3391,7 +3379,6 @@ static int __find_data_block(struct inode *inode, pgoff_t index,
 {
 	struct dnode_of_data dn;
 	struct page *ipage;
-	struct extent_info ei = {0, };
 	int err = 0;
 
 	ipage = f2fs_get_node_page(F2FS_I_SB(inode), inode->i_ino);
@@ -3400,9 +3387,7 @@ static int __find_data_block(struct inode *inode, pgoff_t index,
 
 	set_new_dnode(&dn, inode, ipage, ipage, 0);
 
-	if (f2fs_lookup_extent_cache(inode, index, &ei)) {
-		dn.data_blkaddr = ei.blk + index - ei.fofs;
-	} else {
+	if (!f2fs_lookup_extent_cache_block(inode, index, &dn.data_blkaddr)) {
 		/* hole case */
 		err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
 		if (err) {
diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 538e4b79f83c9b..992a3d6bd6e7c7 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -853,6 +853,17 @@ void f2fs_destroy_extent_tree(struct inode *inode)
 	trace_f2fs_destroy_extent_tree(inode, node_cnt);
 }
 
+bool f2fs_lookup_extent_cache_block(struct inode *inode, pgoff_t index,
+		block_t *blkaddr)
+{
+	struct extent_info ei = {};
+
+	if (!f2fs_lookup_extent_cache(inode, index, &ei))
+		return false;
+	*blkaddr = ei.blk + index - ei.fofs;
+	return true;
+}
+
 void f2fs_update_extent_cache(struct dnode_of_data *dn)
 {
 	pgoff_t fofs;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9825b4fb2aa27d..c0a1a987889167 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4157,6 +4157,8 @@ unsigned int f2fs_destroy_extent_node(struct inode *inode);
 void f2fs_destroy_extent_tree(struct inode *inode);
 bool f2fs_lookup_extent_cache(struct inode *inode, pgoff_t pgofs,
 			struct extent_info *ei);
+bool f2fs_lookup_extent_cache_block(struct inode *inode, pgoff_t index,
+			block_t *blkaddr);
 void f2fs_update_extent_cache(struct dnode_of_data *dn);
 void f2fs_update_extent_cache_range(struct dnode_of_data *dn,
 			pgoff_t fofs, block_t blkaddr, unsigned int len);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 4546e01b2ee082..3a82d763e074f6 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1141,7 +1141,6 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 	struct address_space *mapping = inode->i_mapping;
 	struct dnode_of_data dn;
 	struct page *page;
-	struct extent_info ei = {0, 0, 0};
 	struct f2fs_io_info fio = {
 		.sbi = sbi,
 		.ino = inode->i_ino,
@@ -1159,8 +1158,7 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 	if (!page)
 		return -ENOMEM;
 
-	if (f2fs_lookup_extent_cache(inode, index, &ei)) {
-		dn.data_blkaddr = ei.blk + index - ei.fofs;
+	if (f2fs_lookup_extent_cache_block(inode, index, &dn.data_blkaddr)) {
 		if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
 						DATA_GENERIC_ENHANCE_READ))) {
 			err = -EFSCORRUPTED;
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
