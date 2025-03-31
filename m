Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BB3A76E5D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVq-00017D-N1;
	Mon, 31 Mar 2025 20:13:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVf-000102-DL
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cGYRZBXTPHu3cRTtfBjxJzbWAZ8rfR+BCJj/s6DpjU8=; b=UoKDONiQ6LdqOQ/IdQakP004Pl
 hzkg7xIZnUtAbtHkgkeXcacdiiKSOGBK1WhJpOXb4P7bFGDoToDWAkP4WTCYp0v6BDBE/vDKBqcvK
 Wf7jGm+nv9qfZl0GUdC8Kidomv7iEbmnJO3BxoloG4gjvm0nAlSNkNFNMvkK8x7EEkcw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cGYRZBXTPHu3cRTtfBjxJzbWAZ8rfR+BCJj/s6DpjU8=; b=cK/lxpluvZI3F4lWyVOi5BGsfS
 Gpxu+uyQXVmX4k8Hbf7JAmDgx6IkTBBlNYQjQCIBdByUdu2uczDUrfnLIaIUl9abjROprVsHOy9EM
 4sByz+TKFHZYNiJxFzd0ZgIKOb8f5buEwDpb/WH47+Ro2yIVYQZNsxVjQCsXS4Euk7aQ=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVf-0003dX-BS for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=cGYRZBXTPHu3cRTtfBjxJzbWAZ8rfR+BCJj/s6DpjU8=; b=NzNGQLKMVR79mQVZgg/vvGK9dr
 NxiZagnvmn0y2AD+sjpLNsKW30ZIdkZvU7cIY5V6wLH66y9lAOtoWu5DLMxm3wel9XuXGvAB7vo+x
 nbOJLXs90wwDuvbgSKzqRuvJathxan/BAwtomk1quL960gqHsk68Iw7bMNTDrg1/io4ZOMLPU8SXe
 OZnx49pj5x9lt7oUkCgo0dLF58waokIhOAWBfAOuu/PbsHDa9rTy9K0kvfmr4h5HY3yNv/MAv0AnY
 1KyGeLT8K6Stbfs/NWVsI2/qtqB44yuuUR8Tw0CtmCgDG1QIFoih6+/lFzVdqZkzqnEF6w+CCRaED
 Rw7qiulw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVT-00000004S2I-2xAa;
 Mon, 31 Mar 2025 20:13:16 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:48 +0100
Message-ID: <20250331201256.1057782-89-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Pass the folio into make_empty_dir() and then into
 f2fs_get_new_data_folio().
 Removes a call to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org> --- fs/f2fs/data.c | 18 +++++++++--------- fs/f2fs/dir.c
 | 8 ++++---- fs/f2fs/f2fs.h | 2 +- 3 files changed, 14 insertions(+), 14
 deletions [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVf-0003dX-BS
Subject: [f2fs-dev] [PATCH 088/153] f2fs: Pass a folio to make_empty_dir()
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

Pass the folio into make_empty_dir() and then into
f2fs_get_new_data_folio().  Removes a call to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c | 18 +++++++++---------
 fs/f2fs/dir.c  |  8 ++++----
 fs/f2fs/f2fs.h |  2 +-
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 733802a53444..3776c1f2ad42 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1339,11 +1339,11 @@ struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
  *
  * Also, caller should grab and release a rwsem by calling f2fs_lock_op() and
  * f2fs_unlock_op().
- * Note that, ipage is set only by make_empty_dir, and if any error occur,
- * ipage should be released by this function.
+ * Note that, ifolio is set only by make_empty_dir, and if any error occur,
+ * ifolio should be released by this function.
  */
 struct folio *f2fs_get_new_data_folio(struct inode *inode,
-		struct page *ipage, pgoff_t index, bool new_i_size)
+		struct folio *ifolio, pgoff_t index, bool new_i_size)
 {
 	struct address_space *mapping = inode->i_mapping;
 	struct folio *folio;
@@ -1353,20 +1353,20 @@ struct folio *f2fs_get_new_data_folio(struct inode *inode,
 	folio = f2fs_grab_cache_folio(mapping, index, true);
 	if (IS_ERR(folio)) {
 		/*
-		 * before exiting, we should make sure ipage will be released
+		 * before exiting, we should make sure ifolio will be released
 		 * if any error occur.
 		 */
-		f2fs_put_page(ipage, 1);
+		f2fs_folio_put(ifolio, true);
 		return ERR_PTR(-ENOMEM);
 	}
 
-	set_new_dnode(&dn, inode, ipage, NULL, 0);
+	set_new_dnode(&dn, inode, &ifolio->page, NULL, 0);
 	err = f2fs_reserve_block(&dn, index);
 	if (err) {
 		f2fs_folio_put(folio, true);
 		return ERR_PTR(err);
 	}
-	if (!ipage)
+	if (!ifolio)
 		f2fs_put_dnode(&dn);
 
 	if (folio_test_uptodate(folio))
@@ -1379,8 +1379,8 @@ struct folio *f2fs_get_new_data_folio(struct inode *inode,
 	} else {
 		f2fs_folio_put(folio, true);
 
-		/* if ipage exists, blkaddr should be NEW_ADDR */
-		f2fs_bug_on(F2FS_I_SB(inode), ipage);
+		/* if ifolio exists, blkaddr should be NEW_ADDR */
+		f2fs_bug_on(F2FS_I_SB(inode), ifolio);
 		folio = f2fs_get_lock_data_folio(inode, index, true);
 		if (IS_ERR(folio))
 			return folio;
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index aa8aafb6e332..25969d0ae76e 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -491,16 +491,16 @@ void f2fs_do_make_empty_dir(struct inode *inode, struct inode *parent,
 }
 
 static int make_empty_dir(struct inode *inode,
-		struct inode *parent, struct page *page)
+		struct inode *parent, struct folio *folio)
 {
 	struct folio *dentry_folio;
 	struct f2fs_dentry_block *dentry_blk;
 	struct f2fs_dentry_ptr d;
 
 	if (f2fs_has_inline_dentry(inode))
-		return f2fs_make_empty_inline_dir(inode, parent, page);
+		return f2fs_make_empty_inline_dir(inode, parent, &folio->page);
 
-	dentry_folio = f2fs_get_new_data_folio(inode, page, 0, true);
+	dentry_folio = f2fs_get_new_data_folio(inode, folio, 0, true);
 	if (IS_ERR(dentry_folio))
 		return PTR_ERR(dentry_folio);
 
@@ -528,7 +528,7 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
 		if (S_ISDIR(inode->i_mode)) {
 			/* in order to handle error case */
 			folio_get(folio);
-			err = make_empty_dir(inode, dir, &folio->page);
+			err = make_empty_dir(inode, dir, folio);
 			if (err) {
 				folio_lock(folio);
 				goto put_error;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 192e49208a56..75194caaf317 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3955,7 +3955,7 @@ struct folio *f2fs_find_data_folio(struct inode *inode, pgoff_t index,
 struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
 			bool for_write);
 struct folio *f2fs_get_new_data_folio(struct inode *inode,
-			struct page *ipage, pgoff_t index, bool new_i_size);
+			struct folio *ifolio, pgoff_t index, bool new_i_size);
 int f2fs_do_write_data_page(struct f2fs_io_info *fio);
 int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag);
 int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
