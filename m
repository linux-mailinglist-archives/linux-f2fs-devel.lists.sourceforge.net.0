Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0ADA4F9A7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Mar 2025 10:14:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tpkq0-0002kb-5L;
	Wed, 05 Mar 2025 09:14:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tpkpy-0002kP-NU
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Mar 2025 09:14:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gVi9mzX3dJa55lZJy/RyXViYpVDmbsXRxUnmo3L4Iyk=; b=PlrNMoyE1y8QWxtbbRAheuMSF7
 oZFVpI/gi2ovcF8etCf+QiV8ouA1870h/w9aK4e2NNgUPh5Yu49/py9hPMyKdsGrTcNc7OjsPObJK
 RKJkofuZ5oLP8T9PbD68c8dPxxnacOKrs3VJ+qkP4SjyKRJCL0sh/22VUN6d2oTNsRbc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gVi9mzX3dJa55lZJy/RyXViYpVDmbsXRxUnmo3L4Iyk=; b=L
 qX5mGBAT3Dy7Jdb2HK5U+ugImlhn+xnIqvEj+ei6Pa0b+/hB6HB7qvdbjq0z5CReDENNcrFofX2c3
 Ai0C1fPw2RCK/6fYIUOQ8ESC8wX7MyJ5aSvtOndrxfutr5hB1FlVxMPdvMbZrqVK8mH8M/JnxuEi0
 UZ3BLVNIMC5ekHfM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tpkpy-0000Sr-3Z for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Mar 2025 09:14:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CFAF75C66DD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  5 Mar 2025 09:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 209FAC4CEE2;
 Wed,  5 Mar 2025 09:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741166080;
 bh=rx9IEVk17Y2LESYGZSTRRYKsUCzSUfZHEpuGJnJIP6Q=;
 h=From:To:Cc:Subject:Date:From;
 b=bUDlG0TskOoGsK7lSfxjcPIPTA594fSxWQila6N68Ul8QuKbcJZnZhV3Zr8oX87HK
 nucTREd1itEj7UnTk4kvt7UrONfGJZeBUcVYtfgCf5hLIXvuXRLfWcknbNO9EqC+de
 FLhrb0CRHZxyQoC6GwdpEEShRbtqCOob12YOLVsUPFrWv8ogzqwNgd9UzaRHk0j5Iy
 ZVN5nbPWxO8vU/EIGQY3oLuiWGCvvICG022bwheowECiYHNFGCWchAdcRGkrsEi2LO
 8N43+Lbh0k5N0Y4igjtryDlSu1yQ/yh6cGKLg+0BlsDt+Xy+Vvop2ynE33Dd79vb+g
 0a+qqRj8xkOFg==
To: jaegeuk@kernel.org
Date: Wed,  5 Mar 2025 17:11:46 +0800
Message-ID: <20250305091148.2086015-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch introduces a new wrapper f2fs_get_inode_page(),
 then, caller can use it to load inode block to page cache, meanwhile it will
 do sanity check on inode footer. Signed-off-by: Chao Yu <chao@kernel.org>
 --- v2: - fix node_type in f2fs_get_inode_folio() fs/f2fs/data.c | 6 ++---
 fs/f2fs/dir.c | 2 +- fs/f2fs/f2fs.h | 3 ++- fs/f2fs/file.c | 2 +-
 fs/f2fs/inline.c | [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tpkpy-0000Sr-3Z
Subject: [f2fs-dev] [PATCH v2 1/3] f2fs: do sanity check on inode footer in
 f2fs_get_inode_page()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch introduces a new wrapper f2fs_get_inode_page(), then, caller
can use it to load inode block to page cache, meanwhile it will do sanity
check on inode footer.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- fix node_type in f2fs_get_inode_folio()
 fs/f2fs/data.c   |  6 ++---
 fs/f2fs/dir.c    |  2 +-
 fs/f2fs/f2fs.h   |  3 ++-
 fs/f2fs/file.c   |  2 +-
 fs/f2fs/inline.c | 22 +++++++++----------
 fs/f2fs/inode.c  |  4 ++--
 fs/f2fs/node.c   | 57 +++++++++++++++++++++++++++++++++---------------
 fs/f2fs/node.h   |  6 +++++
 fs/f2fs/xattr.c  |  4 ++--
 9 files changed, 67 insertions(+), 39 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 09437dbd1b42..bb701fa977bf 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3404,7 +3404,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 
 restart:
 	/* check inline_data */
-	ipage = f2fs_get_node_page(sbi, inode->i_ino);
+	ipage = f2fs_get_inode_page(sbi, inode->i_ino);
 	if (IS_ERR(ipage)) {
 		err = PTR_ERR(ipage);
 		goto unlock_out;
@@ -3467,7 +3467,7 @@ static int __find_data_block(struct inode *inode, pgoff_t index,
 	struct page *ipage;
 	int err = 0;
 
-	ipage = f2fs_get_node_page(F2FS_I_SB(inode), inode->i_ino);
+	ipage = f2fs_get_inode_page(F2FS_I_SB(inode), inode->i_ino);
 	if (IS_ERR(ipage))
 		return PTR_ERR(ipage);
 
@@ -3497,7 +3497,7 @@ static int __reserve_data_block(struct inode *inode, pgoff_t index,
 
 	f2fs_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO);
 
-	ipage = f2fs_get_node_page(sbi, inode->i_ino);
+	ipage = f2fs_get_inode_page(sbi, inode->i_ino);
 	if (IS_ERR(ipage)) {
 		err = PTR_ERR(ipage);
 		goto unlock_out;
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 54dd52de7269..5a63ff0df03b 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -551,7 +551,7 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
 				goto put_error;
 		}
 	} else {
-		page = f2fs_get_node_page(F2FS_I_SB(dir), inode->i_ino);
+		page = f2fs_get_inode_page(F2FS_I_SB(dir), inode->i_ino);
 		if (IS_ERR(page))
 			return page;
 	}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c6cc2694f9ac..9df20576c22b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3700,7 +3700,8 @@ struct page *f2fs_new_inode_page(struct inode *inode);
 struct page *f2fs_new_node_page(struct dnode_of_data *dn, unsigned int ofs);
 void f2fs_ra_node_page(struct f2fs_sb_info *sbi, nid_t nid);
 struct page *f2fs_get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid);
-struct folio *f2fs_get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid);
+struct folio *f2fs_get_inode_folio(struct f2fs_sb_info *sbi, pgoff_t ino);
+struct page *f2fs_get_inode_page(struct f2fs_sb_info *sbi, pgoff_t ino);
 struct page *f2fs_get_node_page_ra(struct page *parent, int start);
 int f2fs_move_node_page(struct page *node_page, int gc_type);
 void f2fs_flush_inline_data(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 82b21baf5628..2ddb93d1a10c 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -761,7 +761,7 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 	if (lock)
 		f2fs_lock_op(sbi);
 
-	ipage = f2fs_get_node_page(sbi, inode->i_ino);
+	ipage = f2fs_get_inode_page(sbi, inode->i_ino);
 	if (IS_ERR(ipage)) {
 		err = PTR_ERR(ipage);
 		goto out;
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 3e3c35d4c98b..ad92e9008781 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -119,7 +119,7 @@ int f2fs_read_inline_data(struct inode *inode, struct folio *folio)
 {
 	struct page *ipage;
 
-	ipage = f2fs_get_node_page(F2FS_I_SB(inode), inode->i_ino);
+	ipage = f2fs_get_inode_page(F2FS_I_SB(inode), inode->i_ino);
 	if (IS_ERR(ipage)) {
 		folio_unlock(folio);
 		return PTR_ERR(ipage);
@@ -237,7 +237,7 @@ int f2fs_convert_inline_inode(struct inode *inode)
 
 	f2fs_lock_op(sbi);
 
-	ipage = f2fs_get_node_page(sbi, inode->i_ino);
+	ipage = f2fs_get_inode_page(sbi, inode->i_ino);
 	if (IS_ERR(ipage)) {
 		err = PTR_ERR(ipage);
 		goto out;
@@ -265,7 +265,7 @@ int f2fs_write_inline_data(struct inode *inode, struct folio *folio)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct page *ipage;
 
-	ipage = f2fs_get_node_page(sbi, inode->i_ino);
+	ipage = f2fs_get_inode_page(sbi, inode->i_ino);
 	if (IS_ERR(ipage))
 		return PTR_ERR(ipage);
 
@@ -312,7 +312,7 @@ int f2fs_recover_inline_data(struct inode *inode, struct page *npage)
 	if (f2fs_has_inline_data(inode) &&
 			ri && (ri->i_inline & F2FS_INLINE_DATA)) {
 process_inline:
-		ipage = f2fs_get_node_page(sbi, inode->i_ino);
+		ipage = f2fs_get_inode_page(sbi, inode->i_ino);
 		if (IS_ERR(ipage))
 			return PTR_ERR(ipage);
 
@@ -331,7 +331,7 @@ int f2fs_recover_inline_data(struct inode *inode, struct page *npage)
 	}
 
 	if (f2fs_has_inline_data(inode)) {
-		ipage = f2fs_get_node_page(sbi, inode->i_ino);
+		ipage = f2fs_get_inode_page(sbi, inode->i_ino);
 		if (IS_ERR(ipage))
 			return PTR_ERR(ipage);
 		f2fs_truncate_inline_inode(inode, ipage, 0);
@@ -361,7 +361,7 @@ struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
 	struct page *ipage;
 	void *inline_dentry;
 
-	ipage = f2fs_get_node_page(sbi, dir->i_ino);
+	ipage = f2fs_get_inode_page(sbi, dir->i_ino);
 	if (IS_ERR(ipage)) {
 		*res_page = ipage;
 		return NULL;
@@ -609,7 +609,7 @@ int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry)
 	if (err)
 		goto out;
 
-	ipage = f2fs_get_node_page(sbi, dir->i_ino);
+	ipage = f2fs_get_inode_page(sbi, dir->i_ino);
 	if (IS_ERR(ipage)) {
 		err = PTR_ERR(ipage);
 		goto out_fname;
@@ -644,7 +644,7 @@ int f2fs_add_inline_entry(struct inode *dir, const struct f2fs_filename *fname,
 	struct page *page = NULL;
 	int err = 0;
 
-	ipage = f2fs_get_node_page(sbi, dir->i_ino);
+	ipage = f2fs_get_inode_page(sbi, dir->i_ino);
 	if (IS_ERR(ipage))
 		return PTR_ERR(ipage);
 
@@ -734,7 +734,7 @@ bool f2fs_empty_inline_dir(struct inode *dir)
 	void *inline_dentry;
 	struct f2fs_dentry_ptr d;
 
-	ipage = f2fs_get_node_page(sbi, dir->i_ino);
+	ipage = f2fs_get_inode_page(sbi, dir->i_ino);
 	if (IS_ERR(ipage))
 		return false;
 
@@ -765,7 +765,7 @@ int f2fs_read_inline_dir(struct file *file, struct dir_context *ctx,
 	if (ctx->pos == d.max)
 		return 0;
 
-	ipage = f2fs_get_node_page(F2FS_I_SB(inode), inode->i_ino);
+	ipage = f2fs_get_inode_page(F2FS_I_SB(inode), inode->i_ino);
 	if (IS_ERR(ipage))
 		return PTR_ERR(ipage);
 
@@ -797,7 +797,7 @@ int f2fs_inline_data_fiemap(struct inode *inode,
 	struct page *ipage;
 	int err = 0;
 
-	ipage = f2fs_get_node_page(F2FS_I_SB(inode), inode->i_ino);
+	ipage = f2fs_get_inode_page(F2FS_I_SB(inode), inode->i_ino);
 	if (IS_ERR(ipage))
 		return PTR_ERR(ipage);
 
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index d6ad7810df69..30259e73145b 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -410,7 +410,7 @@ static int do_read_inode(struct inode *inode)
 	if (f2fs_check_nid_range(sbi, inode->i_ino))
 		return -EINVAL;
 
-	node_page = f2fs_get_node_page(sbi, inode->i_ino);
+	node_page = f2fs_get_inode_page(sbi, inode->i_ino);
 	if (IS_ERR(node_page))
 		return PTR_ERR(node_page);
 
@@ -757,7 +757,7 @@ void f2fs_update_inode_page(struct inode *inode)
 	struct page *node_page;
 	int count = 0;
 retry:
-	node_page = f2fs_get_node_page(sbi, inode->i_ino);
+	node_page = f2fs_get_inode_page(sbi, inode->i_ino);
 	if (IS_ERR(node_page)) {
 		int err = PTR_ERR(node_page);
 
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 36614a1c2590..789457af059c 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -778,7 +778,7 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 	npage[0] = dn->inode_page;
 
 	if (!npage[0]) {
-		npage[0] = f2fs_get_node_page(sbi, nids[0]);
+		npage[0] = f2fs_get_inode_page(sbi, nids[0]);
 		if (IS_ERR(npage[0]))
 			return PTR_ERR(npage[0]);
 	}
@@ -1147,7 +1147,7 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 		return level;
 	}
 
-	folio = f2fs_get_node_folio(sbi, inode->i_ino);
+	folio = f2fs_get_inode_folio(sbi, inode->i_ino);
 	if (IS_ERR(folio)) {
 		trace_f2fs_truncate_inode_blocks_exit(inode, PTR_ERR(folio));
 		return PTR_ERR(folio);
@@ -1456,8 +1456,27 @@ void f2fs_ra_node_page(struct f2fs_sb_info *sbi, nid_t nid)
 	f2fs_put_page(apage, err ? 1 : 0);
 }
 
+static int sanity_check_node_footer(struct f2fs_sb_info *sbi,
+					struct page *page, pgoff_t nid,
+					enum node_type ntype)
+{
+	if (unlikely(nid != nid_of_node(page) ||
+		(ntype == NODE_TYPE_INODE && !IS_INODE(page)))) {
+		f2fs_warn(sbi, "inconsistent node block, node_type:%d, nid:%lu, "
+			  "node_footer[nid:%u,ino:%u,ofs:%u,cpver:%llu,blkaddr:%u]",
+			  ntype, nid, nid_of_node(page), ino_of_node(page),
+			  ofs_of_node(page), cpver_of_node(page),
+			  next_blkaddr_of_node(page));
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
+		return -EFSCORRUPTED;
+	}
+	return 0;
+}
+
 static struct folio *__get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
-					struct page *parent, int start)
+					struct page *parent, int start,
+					enum node_type ntype)
 {
 	struct folio *folio;
 	int err;
@@ -1499,16 +1518,9 @@ static struct folio *__get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
 		goto out_err;
 	}
 page_hit:
-	if (likely(nid == nid_of_node(&folio->page)))
+	err = sanity_check_node_footer(sbi, &folio->page, nid, ntype);
+	if (!err)
 		return folio;
-
-	f2fs_warn(sbi, "inconsistent node block, nid:%lu, node_footer[nid:%u,ino:%u,ofs:%u,cpver:%llu,blkaddr:%u]",
-			  nid, nid_of_node(&folio->page), ino_of_node(&folio->page),
-			  ofs_of_node(&folio->page), cpver_of_node(&folio->page),
-			  next_blkaddr_of_node(&folio->page));
-	set_sbi_flag(sbi, SBI_NEED_FSCK);
-	f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
-	err = -EFSCORRUPTED;
 out_err:
 	folio_clear_uptodate(folio);
 out_put_err:
@@ -1519,14 +1531,22 @@ static struct folio *__get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
 	return ERR_PTR(err);
 }
 
-struct folio *f2fs_get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid)
+struct page *f2fs_get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid)
+{
+	struct folio *folio = __get_node_folio(sbi, nid, NULL, 0,
+						NODE_TYPE_REGULAR);
+
+	return &folio->page;
+}
+
+struct folio *f2fs_get_inode_folio(struct f2fs_sb_info *sbi, pgoff_t ino)
 {
-	return __get_node_folio(sbi, nid, NULL, 0);
+	return __get_node_folio(sbi, ino, NULL, 0, NODE_TYPE_INODE);
 }
 
-struct page *f2fs_get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid)
+struct page *f2fs_get_inode_page(struct f2fs_sb_info *sbi, pgoff_t ino)
 {
-	struct folio *folio = __get_node_folio(sbi, nid, NULL, 0);
+	struct folio *folio = f2fs_get_inode_folio(sbi, ino);
 
 	return &folio->page;
 }
@@ -1535,7 +1555,8 @@ struct page *f2fs_get_node_page_ra(struct page *parent, int start)
 {
 	struct f2fs_sb_info *sbi = F2FS_P_SB(parent);
 	nid_t nid = get_nid(parent, start, false);
-	struct folio *folio = __get_node_folio(sbi, nid, parent, start);
+	struct folio *folio = __get_node_folio(sbi, nid, parent, start,
+							NODE_TYPE_REGULAR);
 
 	return &folio->page;
 }
@@ -2727,7 +2748,7 @@ int f2fs_recover_inline_xattr(struct inode *inode, struct page *page)
 	struct page *ipage;
 	struct f2fs_inode *ri;
 
-	ipage = f2fs_get_node_page(F2FS_I_SB(inode), inode->i_ino);
+	ipage = f2fs_get_inode_page(F2FS_I_SB(inode), inode->i_ino);
 	if (IS_ERR(ipage))
 		return PTR_ERR(ipage);
 
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 281d53c95c9a..5079c6a2298d 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -52,6 +52,12 @@ enum {
 	IS_PREALLOC,		/* nat entry is preallocated */
 };
 
+/* For node type in __get_node_folio() */
+enum node_type {
+	NODE_TYPE_REGULAR,
+	NODE_TYPE_INODE,
+};
+
 /*
  * For node information
  */
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 3f3874943679..d5b42e1005d8 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -282,7 +282,7 @@ static int read_inline_xattr(struct inode *inode, struct page *ipage,
 	if (ipage) {
 		inline_addr = inline_xattr_addr(inode, ipage);
 	} else {
-		page = f2fs_get_node_page(sbi, inode->i_ino);
+		page = f2fs_get_inode_page(sbi, inode->i_ino);
 		if (IS_ERR(page))
 			return PTR_ERR(page);
 
@@ -449,7 +449,7 @@ static inline int write_all_xattrs(struct inode *inode, __u32 hsize,
 		if (ipage) {
 			inline_addr = inline_xattr_addr(inode, ipage);
 		} else {
-			in_page = f2fs_get_node_page(sbi, inode->i_ino);
+			in_page = f2fs_get_inode_page(sbi, inode->i_ino);
 			if (IS_ERR(in_page)) {
 				f2fs_alloc_nid_failed(sbi, new_nid);
 				return PTR_ERR(in_page);
-- 
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
