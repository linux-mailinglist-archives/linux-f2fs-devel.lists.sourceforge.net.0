Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E40A76E45
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVi-0003s6-Uo;
	Mon, 31 Mar 2025 20:13:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVc-0003nP-D0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2SlM/E50a+MU1VvQIo3zZa44Mo2E8OQ5nktZdTWI6lI=; b=HyxgzYLgEQxavBgoJrbU53BaWD
 VCHlBAKJCGF475HzRoWGgqtbxXgAcWVcsT5Q3kRQuUO0EchEa2yGWpJJcUNBjhK8r5ibY6KRgdsIg
 RSNbYItl2jZ3Do6rgEriQjvJNxXBuGB/dmiG+0ikfvSQad/VspE7jzfNxNw3EZBU58UY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2SlM/E50a+MU1VvQIo3zZa44Mo2E8OQ5nktZdTWI6lI=; b=bYXl118KJ6tlK4aDS8MbHli7EP
 XZTYcuBj0c9M9L+yDOkSb8e2qrt/Wvpzu7Y4eT7XMAmQ5HfzbZOwKgG+wROfxreSO2zSSdHGCUEMK
 xjzrk8uJMYV+AJAhvjbViaqoPyfcFVYpSk6X8Wwo8QpzuxyvHFb+MfvI1H1rF4pIf/JE=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVR-0003Yl-J4 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=2SlM/E50a+MU1VvQIo3zZa44Mo2E8OQ5nktZdTWI6lI=; b=Q4PHdz6uWonjN0i6TzQfsSIZY0
 7t4ld9GQ9DTw7+EMXw7Yz91MybjDEPX5giVpKLbSeyipMD+cZPUqinm2mc3EHBkkBe69F2OcCEOnk
 ztez5PBlHJ2rXk0seRmrx3Pk+0pciLAMhly1YkE60QzOAhNZWTvbKbEhwwiqfoMAyrU0+bed1gb6C
 qfJjLsCwINdDBMIPKL+8jXUVKYRG3+cACMbbu6cTX6/zjmMdOW6uRfqVjqotafb+2fAKVu4pV0ilk
 1G5wV2zCiysvca6f8rN2OpVYd5pVJUNF9Ra5fqf+oqXDZE/Zj1bvjx80VKa7izJWaF4eT+bOUAOig
 ZI9pOfnQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVG-00000004RVG-0qut;
 Mon, 31 Mar 2025 20:13:02 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:28 +0100
Message-ID: <20250331201256.1057782-9-willy@infradead.org>
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
 Content preview: Fetch a folio from the pagecache instead of a page and
 operate
 on it throughout. Removes eight calls to compound_head() and an access to
 page->mapping. Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
 --- fs/f2fs/gc.c | 33 +++++++++++++++++ 1 file changed, 17 insertions(+),
 16 deletions(-) 
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
X-Headers-End: 1tzLVR-0003Yl-J4
Subject: [f2fs-dev] [PATCH 008/153] f2fs: Use a folio in move_data_block()
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

Fetch a folio from the pagecache instead of a page and operate on it
throughout.  Removes eight calls to compound_head() and an access to
page->mapping.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/gc.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 2b8f9239bede..fa51b871290d 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1307,7 +1307,8 @@ static int move_data_block(struct inode *inode, block_t bidx,
 	struct dnode_of_data dn;
 	struct f2fs_summary sum;
 	struct node_info ni;
-	struct page *page, *mpage;
+	struct page *page;
+	struct folio *mfolio;
 	block_t newaddr;
 	int err = 0;
 	bool lfs_mode = f2fs_lfs_mode(fio.sbi);
@@ -1359,20 +1360,20 @@ static int move_data_block(struct inode *inode, block_t bidx,
 	if (lfs_mode)
 		f2fs_down_write(&fio.sbi->io_order_lock);
 
-	mpage = f2fs_grab_cache_page(META_MAPPING(fio.sbi),
+	mfolio = f2fs_grab_cache_folio(META_MAPPING(fio.sbi),
 					fio.old_blkaddr, false);
-	if (!mpage) {
-		err = -ENOMEM;
+	if (IS_ERR(mfolio)) {
+		err = PTR_ERR(mfolio);
 		goto up_out;
 	}
 
-	fio.encrypted_page = mpage;
+	fio.encrypted_page = folio_file_page(mfolio, fio.old_blkaddr);
 
-	/* read source block in mpage */
-	if (!PageUptodate(mpage)) {
+	/* read source block in mfolio */
+	if (!folio_test_uptodate(mfolio)) {
 		err = f2fs_submit_page_bio(&fio);
 		if (err) {
-			f2fs_put_page(mpage, 1);
+			f2fs_folio_put(mfolio, true);
 			goto up_out;
 		}
 
@@ -1381,11 +1382,11 @@ static int move_data_block(struct inode *inode, block_t bidx,
 		f2fs_update_iostat(fio.sbi, NULL, FS_GDATA_READ_IO,
 							F2FS_BLKSIZE);
 
-		lock_page(mpage);
-		if (unlikely(mpage->mapping != META_MAPPING(fio.sbi) ||
-						!PageUptodate(mpage))) {
+		folio_lock(mfolio);
+		if (unlikely(mfolio->mapping != META_MAPPING(fio.sbi) ||
+			     !folio_test_uptodate(mfolio))) {
 			err = -EIO;
-			f2fs_put_page(mpage, 1);
+			f2fs_folio_put(mfolio, 1);
 			goto up_out;
 		}
 	}
@@ -1396,7 +1397,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 	err = f2fs_allocate_data_block(fio.sbi, NULL, fio.old_blkaddr, &newaddr,
 				&sum, type, NULL);
 	if (err) {
-		f2fs_put_page(mpage, 1);
+		f2fs_folio_put(mfolio, true);
 		/* filesystem should shutdown, no need to recovery block */
 		goto up_out;
 	}
@@ -1405,15 +1406,15 @@ static int move_data_block(struct inode *inode, block_t bidx,
 				newaddr, FGP_LOCK | FGP_CREAT, GFP_NOFS);
 	if (!fio.encrypted_page) {
 		err = -ENOMEM;
-		f2fs_put_page(mpage, 1);
+		f2fs_folio_put(mfolio, true);
 		goto recover_block;
 	}
 
 	/* write target block */
 	f2fs_wait_on_page_writeback(fio.encrypted_page, DATA, true, true);
 	memcpy(page_address(fio.encrypted_page),
-				page_address(mpage), PAGE_SIZE);
-	f2fs_put_page(mpage, 1);
+				folio_address(mfolio), PAGE_SIZE);
+	f2fs_folio_put(mfolio, true);
 
 	f2fs_invalidate_internal_cache(fio.sbi, fio.old_blkaddr, 1);
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
