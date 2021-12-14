Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A08474AC2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Dec 2021 19:24:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mxCTr-0004SM-2M; Tue, 14 Dec 2021 18:24:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1mxCTp-0004Qx-Ei
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Dec 2021 18:24:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CfNswB5OP+PKGVs18YqeaEoYc6s6bC4jygQqxD3nt48=; b=PbINM58aA019iDV296VUXsmwGU
 XmbaCFF762fBHYO7TQkmjA31Fw4b1jC3zIh15rEbDp9zn+5akvUlbpy2Pj7xay1fmbUOekMXzJ3iD
 lfeXQLrpUgN0YGi/OYbJvLgKpGmuY2BoAsKUyUZbAFC6/uQwDp/+Q+qHps8VDq7wPJvM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CfNswB5OP+PKGVs18YqeaEoYc6s6bC4jygQqxD3nt48=; b=OFYZtFwkIaMDalQ17+u5mLfte/
 dAvA8Kllh3Hm8lJeO1FOyGvhzyjcryvMNSjyKV3yjS3A9GBgqEqXnqoi0oj8WDw9mz1SJhF9sux8b
 q5HsQRMz/dMwdeKmRCklx5xtEdVeTcKgM20XWhtiM2FOGv4R92HmPMb1bWjMjhSjr7wo=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mxCTp-00FPku-Cb
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Dec 2021 18:24:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 67821B81C54
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Dec 2021 18:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10471C34604;
 Tue, 14 Dec 2021 18:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639506280;
 bh=KGpzRAZYX4JGq/Ihfde8r/esiBiCBH+uxdJ+VLvvm4A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fXNBz7b2XKwCYEO0BKOACovuaWq2wnnqA5XayWNcSIx/7FcFo5a/K5O8/zs1dZMoE
 RzaTLf0ZySxZAy4fuSGux61m7NbqMRqel05rC1fU3kicn4/DBP40HMbZORdrnEGqX6
 YGl/Rnd/jyl54QXR4pjFQ+z+YdRnB3Ykvc6MbfzjPaYd08WoGclrfgzsDKHnAjdCo+
 I8ii+Lxztrso25LVhoFegj8y5+kgVUL1HlSTo7EI+9ItB0AjyDcOedDtz7U8WuwpUw
 bbjQS58m059Kn7puBV51JtofxSnSZiJ8nHiLiIWzl1H4MhLdfz1f444wC7M34BxXVJ
 gzKkCRtSTQfDw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 14 Dec 2021 10:24:35 -0800
Message-Id: <20211214182435.2595176-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
In-Reply-To: <20211214182435.2595176-1-jaegeuk@kernel.org>
References: <20211214182435.2595176-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch tries to mitigate lock contention between
 f2fs_write_checkpoint
 and f2fs_get_node_info along with nat_tree_lock. The idea is, if checkpoint
 is currently running, other threads that try to grab nat_tree_lock would
 be better to wait for checkpoint. 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mxCTp-00FPku-Cb
Subject: [f2fs-dev] [PATCH 2/2] f2fs: do not bother checkpoint by
 f2fs_get_node_info
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

This patch tries to mitigate lock contention between f2fs_write_checkpoint and
f2fs_get_node_info along with nat_tree_lock.

The idea is, if checkpoint is currently running, other threads that try to grab
nat_tree_lock would be better to wait for checkpoint.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/checkpoint.c |  2 +-
 fs/f2fs/compress.c   |  2 +-
 fs/f2fs/data.c       |  8 ++++----
 fs/f2fs/f2fs.h       |  2 +-
 fs/f2fs/file.c       |  2 +-
 fs/f2fs/gc.c         |  6 +++---
 fs/f2fs/inline.c     |  4 ++--
 fs/f2fs/inode.c      |  2 +-
 fs/f2fs/node.c       | 19 ++++++++++---------
 fs/f2fs/recovery.c   |  2 +-
 fs/f2fs/segment.c    |  2 +-
 11 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index f1693d45bb78..55e3c54d99c1 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -664,7 +664,7 @@ static int recover_orphan_inode(struct f2fs_sb_info *sbi, nid_t ino)
 	/* truncate all the data during iput */
 	iput(inode);
 
-	err = f2fs_get_node_info(sbi, ino, &ni);
+	err = f2fs_get_node_info(sbi, ino, &ni, false);
 	if (err)
 		goto err_out;
 
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 4b49038d150d..d0c3aeba5945 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1286,7 +1286,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 
 	psize = (loff_t)(cc->rpages[last_index]->index + 1) << PAGE_SHIFT;
 
-	err = f2fs_get_node_info(fio.sbi, dn.nid, &ni);
+	err = f2fs_get_node_info(fio.sbi, dn.nid, &ni, false);
 	if (err)
 		goto out_put_dnode;
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 40c0d1426a11..2737fcc0dbcf 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1355,7 +1355,7 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
 	if (unlikely(is_inode_flag_set(dn->inode, FI_NO_ALLOC)))
 		return -EPERM;
 
-	err = f2fs_get_node_info(sbi, dn->nid, &ni);
+	err = f2fs_get_node_info(sbi, dn->nid, &ni, false);
 	if (err)
 		return err;
 
@@ -1757,7 +1757,7 @@ static int f2fs_xattr_fiemap(struct inode *inode,
 		if (!page)
 			return -ENOMEM;
 
-		err = f2fs_get_node_info(sbi, inode->i_ino, &ni);
+		err = f2fs_get_node_info(sbi, inode->i_ino, &ni, false);
 		if (err) {
 			f2fs_put_page(page, 1);
 			return err;
@@ -1789,7 +1789,7 @@ static int f2fs_xattr_fiemap(struct inode *inode,
 		if (!page)
 			return -ENOMEM;
 
-		err = f2fs_get_node_info(sbi, xnid, &ni);
+		err = f2fs_get_node_info(sbi, xnid, &ni, false);
 		if (err) {
 			f2fs_put_page(page, 1);
 			return err;
@@ -2649,7 +2649,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		fio->need_lock = LOCK_REQ;
 	}
 
-	err = f2fs_get_node_info(fio->sbi, dn.nid, &ni);
+	err = f2fs_get_node_info(fio->sbi, dn.nid, &ni, false);
 	if (err)
 		goto out_writepage;
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5da592286721..a9ed2fd3fffb 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3412,7 +3412,7 @@ int f2fs_need_dentry_mark(struct f2fs_sb_info *sbi, nid_t nid);
 bool f2fs_is_checkpointed_node(struct f2fs_sb_info *sbi, nid_t nid);
 bool f2fs_need_inode_block_update(struct f2fs_sb_info *sbi, nid_t ino);
 int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
-						struct node_info *ni);
+				struct node_info *ni, bool checkpoint_context);
 pgoff_t f2fs_get_next_page_offset(struct dnode_of_data *dn, pgoff_t pgofs);
 int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode);
 int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5ec6bef3937f..f540c1cbddca 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1233,7 +1233,7 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 			if (ret)
 				return ret;
 
-			ret = f2fs_get_node_info(sbi, dn.nid, &ni);
+			ret = f2fs_get_node_info(sbi, dn.nid, &ni, false);
 			if (ret) {
 				f2fs_put_dnode(&dn);
 				return ret;
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 7fbe46477a5a..a6accec60d04 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -959,7 +959,7 @@ static int gc_node_segment(struct f2fs_sb_info *sbi,
 			continue;
 		}
 
-		if (f2fs_get_node_info(sbi, nid, &ni)) {
+		if (f2fs_get_node_info(sbi, nid, &ni, false)) {
 			f2fs_put_page(node_page, 1);
 			continue;
 		}
@@ -1027,7 +1027,7 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	if (IS_ERR(node_page))
 		return false;
 
-	if (f2fs_get_node_info(sbi, nid, dni)) {
+	if (f2fs_get_node_info(sbi, nid, dni, false)) {
 		f2fs_put_page(node_page, 1);
 		return false;
 	}
@@ -1221,7 +1221,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 
 	f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
 
-	err = f2fs_get_node_info(fio.sbi, dn.nid, &ni);
+	err = f2fs_get_node_info(fio.sbi, dn.nid, &ni, false);
 	if (err)
 		goto put_out;
 
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index ea08f0dfa1bd..4b5cefa3f90c 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -131,7 +131,7 @@ int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page)
 	if (err)
 		return err;
 
-	err = f2fs_get_node_info(fio.sbi, dn->nid, &ni);
+	err = f2fs_get_node_info(fio.sbi, dn->nid, &ni, false);
 	if (err) {
 		f2fs_truncate_data_blocks_range(dn, 1);
 		f2fs_put_dnode(dn);
@@ -786,7 +786,7 @@ int f2fs_inline_data_fiemap(struct inode *inode,
 		ilen = start + len;
 	ilen -= start;
 
-	err = f2fs_get_node_info(F2FS_I_SB(inode), inode->i_ino, &ni);
+	err = f2fs_get_node_info(F2FS_I_SB(inode), inode->i_ino, &ni, false);
 	if (err)
 		goto out;
 
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 935016e56010..2ab3b424735a 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -881,7 +881,7 @@ void f2fs_handle_failed_inode(struct inode *inode)
 	 * so we can prevent losing this orphan when encoutering checkpoint
 	 * and following suddenly power-off.
 	 */
-	err = f2fs_get_node_info(sbi, inode->i_ino, &ni);
+	err = f2fs_get_node_info(sbi, inode->i_ino, &ni, false);
 	if (err) {
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "May loss orphan inode, run fsck to fix.");
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index b1bc7d76da3b..e0b5eb28d383 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -543,7 +543,7 @@ int f2fs_try_to_free_nats(struct f2fs_sb_info *sbi, int nr_shrink)
 }
 
 int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
-						struct node_info *ni)
+				struct node_info *ni, bool checkpoint_context)
 {
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
 	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
@@ -576,9 +576,10 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 	 * nat_tree_lock. Therefore, we should retry, if we failed to grab here
 	 * while not bothering checkpoint.
 	 */
-	if (!rwsem_is_locked(&sbi->cp_global_sem)) {
+	if (!rwsem_is_locked(&sbi->cp_global_sem) || checkpoint_context) {
 		down_read(&curseg->journal_rwsem);
-	} else if (!down_read_trylock(&curseg->journal_rwsem)) {
+	} else if (rwsem_is_contended(&nm_i->nat_tree_lock) ||
+				!down_read_trylock(&curseg->journal_rwsem)) {
 		up_read(&nm_i->nat_tree_lock);
 		goto retry;
 	}
@@ -891,7 +892,7 @@ static int truncate_node(struct dnode_of_data *dn)
 	int err;
 	pgoff_t index;
 
-	err = f2fs_get_node_info(sbi, dn->nid, &ni);
+	err = f2fs_get_node_info(sbi, dn->nid, &ni, false);
 	if (err)
 		return err;
 
@@ -1290,7 +1291,7 @@ struct page *f2fs_new_node_page(struct dnode_of_data *dn, unsigned int ofs)
 		goto fail;
 
 #ifdef CONFIG_F2FS_CHECK_FS
-	err = f2fs_get_node_info(sbi, dn->nid, &new_ni);
+	err = f2fs_get_node_info(sbi, dn->nid, &new_ni, false);
 	if (err) {
 		dec_valid_node_count(sbi, dn->inode, !ofs);
 		goto fail;
@@ -1352,7 +1353,7 @@ static int read_node_page(struct page *page, int op_flags)
 		return LOCKED_PAGE;
 	}
 
-	err = f2fs_get_node_info(sbi, page->index, &ni);
+	err = f2fs_get_node_info(sbi, page->index, &ni, false);
 	if (err)
 		return err;
 
@@ -1604,7 +1605,7 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
 	nid = nid_of_node(page);
 	f2fs_bug_on(sbi, page->index != nid);
 
-	if (f2fs_get_node_info(sbi, nid, &ni))
+	if (f2fs_get_node_info(sbi, nid, &ni, !do_balance))
 		goto redirty_out;
 
 	if (wbc->for_reclaim) {
@@ -2705,7 +2706,7 @@ int f2fs_recover_xattr_data(struct inode *inode, struct page *page)
 		goto recover_xnid;
 
 	/* 1: invalidate the previous xattr nid */
-	err = f2fs_get_node_info(sbi, prev_xnid, &ni);
+	err = f2fs_get_node_info(sbi, prev_xnid, &ni, false);
 	if (err)
 		return err;
 
@@ -2745,7 +2746,7 @@ int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct page *page)
 	struct page *ipage;
 	int err;
 
-	err = f2fs_get_node_info(sbi, ino, &old_ni);
+	err = f2fs_get_node_info(sbi, ino, &old_ni, false);
 	if (err)
 		return err;
 
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 6a1b4668d933..e65c73c4411d 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -595,7 +595,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 
 	f2fs_wait_on_page_writeback(dn.node_page, NODE, true, true);
 
-	err = f2fs_get_node_info(sbi, dn.nid, &ni);
+	err = f2fs_get_node_info(sbi, dn.nid, &ni, false);
 	if (err)
 		goto err;
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index df9ed75f0b7a..b4a2f8c36149 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -254,7 +254,7 @@ static int __revoke_inmem_pages(struct inode *inode,
 				goto next;
 			}
 
-			err = f2fs_get_node_info(sbi, dn.nid, &ni);
+			err = f2fs_get_node_info(sbi, dn.nid, &ni, false);
 			if (err) {
 				f2fs_put_dnode(&dn);
 				return err;
-- 
2.34.1.173.g76aa8bc2d0-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
