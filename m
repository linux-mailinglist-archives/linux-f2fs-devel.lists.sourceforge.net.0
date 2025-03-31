Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 405DBA76EB9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWT-0001DI-GT;
	Mon, 31 Mar 2025 20:14:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVm-0000pF-Q1
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NGkSfAIp6p7ioqqf2j7Qf1ZAAWAZ6ycXO+ljH02cQxE=; b=KE9NXCsBY+QgOlKTIUDHsb6S6T
 m5xvJu0VGL90dAKwuS1VguvjtMi5HwZ6ODdFfPCsvei/oo6nZp66SWuZSiybER1Rpzt5e8xTRNN2m
 nnVoACv/tz1b+rSbFUX8UhYH5DIZkpBhFGEmOuOx2xkHpVlu21CuDQYArDcw4yqSuTZ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NGkSfAIp6p7ioqqf2j7Qf1ZAAWAZ6ycXO+ljH02cQxE=; b=J02IWLaBBe0Rw9fQPy6bOWsDtI
 e4j42ePnzN+0m5w1pR1LBDq8GNGBX6hzaUwO1yj3zZTONDNpaqjbTRFsIDCG2CsrUO1DFI4o+qADT
 iAqINviqkIxHfU6dFNvvMAEDnpT8Z22ziXpTb4pxiJSoh4l8QD3g+thk+0qr5HPeWivY=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVh-0003eS-FE for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=NGkSfAIp6p7ioqqf2j7Qf1ZAAWAZ6ycXO+ljH02cQxE=; b=gTWeuL0MVNLk0LHJc61GvH4AEM
 w07L7XAC+s+OmzgHVQpENW4fz7t+RIeHUNVaaAcdE14SDKnH1ss0NuWP/rmlM3vbE5JEQS6Qp9vpR
 o+9RVflQMYOiRsZzCnnKLzdOCGsVnlfs99ksiNUTdRGlW6Ju7tgNkNDwRSY/PerqZqM1wqvgcs5Ca
 5yTam1DQ/HW6ge4I1p2dfz2kBGegVXL3mnNwipgNwxMVVM1myAdWCX0tjdzToi0J0v2xYqkzVGDCc
 4asHGEntLWwT9S/FpOhx7MAH7iu3vhjSLJo0tfoaHM6tWLYjBJ/Yv0J1kCl7MauBxT/tBeTUIBKc6
 moQ6PX7g==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVb-00000004SXB-0IJl;
 Mon, 31 Mar 2025 20:13:23 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:29 +0100
Message-ID: <20250331201256.1057782-130-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  All callers now have a folio so pass it in. Removes eight
 calls to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/dir.c | 26 +++++++++++++ fs/f2fs/f2fs.h | 2 +- fs/f2fs/namei.c
 | 4 ++-- fs/f2fs/recovery.c | 2 +- 4 files changed, [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVh-0003eS-FE
Subject: [f2fs-dev] [PATCH 129/153] f2fs: Pass a folio to f2fs_delete_entry()
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

All callers now have a folio so pass it in.  Removes eight calls to
compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/dir.c      | 26 +++++++++++++-------------
 fs/f2fs/f2fs.h     |  2 +-
 fs/f2fs/namei.c    |  4 ++--
 fs/f2fs/recovery.c |  2 +-
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 987b3a00d29d..610091345ac3 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -860,13 +860,13 @@ void f2fs_drop_nlink(struct inode *dir, struct inode *inode)
  * It only removes the dentry from the dentry page, corresponding name
  * entry in name page does not need to be touched during deletion.
  */
-void f2fs_delete_entry(struct f2fs_dir_entry *dentry, struct page *page,
+void f2fs_delete_entry(struct f2fs_dir_entry *dentry, struct folio *folio,
 					struct inode *dir, struct inode *inode)
 {
-	struct	f2fs_dentry_block *dentry_blk;
+	struct f2fs_dentry_block *dentry_blk;
 	unsigned int bit_pos;
 	int slots = GET_DENTRY_SLOTS(le16_to_cpu(dentry->name_len));
-	pgoff_t index = page_folio(page)->index;
+	pgoff_t index = folio->index;
 	int i;
 
 	f2fs_update_time(F2FS_I_SB(dir), REQ_TIME);
@@ -875,12 +875,12 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, struct page *page,
 		f2fs_add_ino_entry(F2FS_I_SB(dir), dir->i_ino, TRANS_DIR_INO);
 
 	if (f2fs_has_inline_dentry(dir))
-		return f2fs_delete_inline_entry(dentry, page, dir, inode);
+		return f2fs_delete_inline_entry(dentry, &folio->page, dir, inode);
 
-	lock_page(page);
-	f2fs_wait_on_page_writeback(page, DATA, true, true);
+	folio_lock(folio);
+	f2fs_folio_wait_writeback(folio, DATA, true, true);
 
-	dentry_blk = page_address(page);
+	dentry_blk = folio_address(folio);
 	bit_pos = dentry - dentry_blk->dentry;
 	for (i = 0; i < slots; i++)
 		__clear_bit_le(bit_pos + i, &dentry_blk->dentry_bitmap);
@@ -889,19 +889,19 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, struct page *page,
 	bit_pos = find_next_bit_le(&dentry_blk->dentry_bitmap,
 			NR_DENTRY_IN_BLOCK,
 			0);
-	set_page_dirty(page);
+	folio_mark_dirty(folio);
 
 	if (bit_pos == NR_DENTRY_IN_BLOCK &&
 		!f2fs_truncate_hole(dir, index, index + 1)) {
-		f2fs_clear_page_cache_dirty_tag(page_folio(page));
-		clear_page_dirty_for_io(page);
-		ClearPageUptodate(page);
-		clear_page_private_all(page);
+		f2fs_clear_page_cache_dirty_tag(folio);
+		folio_clear_dirty_for_io(folio);
+		folio_clear_uptodate(folio);
+		clear_page_private_all(&folio->page);
 
 		inode_dec_dirty_pages(dir);
 		f2fs_remove_dirty_inode(dir);
 	}
-	f2fs_put_page(page, 1);
+	f2fs_folio_put(folio, true);
 
 	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
 	f2fs_mark_inode_dirty_sync(dir, false);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 66b363dd40ba..6b0f572e1602 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3664,7 +3664,7 @@ int f2fs_add_dentry(struct inode *dir, const struct f2fs_filename *fname,
 			struct inode *inode, nid_t ino, umode_t mode);
 int f2fs_do_add_link(struct inode *dir, const struct qstr *name,
 			struct inode *inode, nid_t ino, umode_t mode);
-void f2fs_delete_entry(struct f2fs_dir_entry *dentry, struct page *page,
+void f2fs_delete_entry(struct f2fs_dir_entry *dentry, struct folio *folio,
 			struct inode *dir, struct inode *inode);
 int f2fs_do_tmpfile(struct inode *inode, struct inode *dir,
 					struct f2fs_filename *fname);
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 689fd9419afd..d8175140e626 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -578,7 +578,7 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 		f2fs_folio_put(folio, false);
 		goto fail;
 	}
-	f2fs_delete_entry(de, &folio->page, dir, inode);
+	f2fs_delete_entry(de, folio, dir, inode);
 	f2fs_unlock_op(sbi);
 
 	/* VFS negative dentries are incompatible with Encoding and
@@ -1038,7 +1038,7 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 	inode_set_ctime_current(old_inode);
 	f2fs_mark_inode_dirty_sync(old_inode, false);
 
-	f2fs_delete_entry(old_entry, &old_folio->page, old_dir, NULL);
+	f2fs_delete_entry(old_entry, old_folio, old_dir, NULL);
 	old_folio = NULL;
 
 	if (whiteout) {
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 849d014023d4..0dfc60ac0f37 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -212,7 +212,7 @@ static int recover_dentry(struct inode *inode, struct page *ipage,
 			iput(einode);
 			goto out_put;
 		}
-		f2fs_delete_entry(de, &folio->page, dir, einode);
+		f2fs_delete_entry(de, folio, dir, einode);
 		iput(einode);
 		goto retry;
 	} else if (IS_ERR(folio)) {
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
