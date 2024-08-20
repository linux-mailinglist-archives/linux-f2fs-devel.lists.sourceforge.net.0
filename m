Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED09C958A40
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Aug 2024 16:55:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sgQGl-0005xv-RX;
	Tue, 20 Aug 2024 14:55:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sgQGj-0005xZ-Id
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Aug 2024 14:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LFapiNLe71g7gEDsBaMNeA3Pk73IxQqyhfkwQpIOrck=; b=jzumHfc6sN3dAJI3VYG/QJ+Q5H
 5Hlk+F5t2oUVmN4EQC0ihz64fsNLFf2Jgl0CgB5Rsd5Wx/pG73eaKNkNNrFvCj+m/ywi2IdA+jAXD
 wibxY5cwWuq6WWfmTZUSjhuJDboMdVY4ZmuZpYQtQyYrdmvWuz36ZqGA0HwuCgbQeYO4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LFapiNLe71g7gEDsBaMNeA3Pk73IxQqyhfkwQpIOrck=; b=jfcDLoSJY8LNWSCGuhNQ/2chuy
 d8XNcrq98rML3O6UiDJhV/ihA7GE0JSMyKcjHpMcCRjT+GS1hKn5WjsBvjsB4T0IT4gHdZixUXys2
 gDFihH8xsqIFMidmoIrI6nGFv0d0Gtp1lN2hm8/F9LfCPDlGqaKqmefVX0HPPFqFxCFY=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sgQGh-0003Is-Hc for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Aug 2024 14:55:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C0D3BCE0AD8;
 Tue, 20 Aug 2024 14:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EFF3C4AF0C;
 Tue, 20 Aug 2024 14:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724165718;
 bh=VlRa3dASMk0XLSDSXKxhyg9F3irf3WbuRcPNs+d0WV4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gv3U4ICsJ9ojJsJjIMMqA42o2RwdEvWeEt+moKbYa/xfwxcldndxbg7AXqCXOa/wE
 Rry2Mva/o5WqeK/PJnSAJmNLPYO1p2LwyiRzPMsqYXS2viR7BDP8F5bkOPljJhOowu
 jBVF5PSFTbxN3V2pfaG/Dvs/qL2Sj6DW2qzNM2Qu700UTukaXbaSIqTlmmFhXyJDYA
 6tZPtrxZebuXAY5U8EMXbSoDwEby8t82evmk/AI/ABeg+c4oM6QeYdUmBySeVpUWKw
 EIP1vuUcXSXHPdi2EHv3laUv4zK9thDxP5NItiXf5l+HZkdXakDQR6Ztsa3QO42azd
 B3hxFS5eVHj+g==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 20 Aug 2024 22:55:00 +0800
Message-Id: <20240820145507.1372905-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240820145507.1372905-1-chao@kernel.org>
References: <20240820145507.1372905-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert to use folio, so that we can get rid of 'page->index'
 to prepare for removal of 'index' field in structure page [1]. [1]
 https://lore.kernel.org/all/Zp8fgUSIBGQ1TN0D@casper.infradead.org/
 Cc: Matthew Wilcox <willy@infradead.org> Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/data.c | 44 +++++++++++++++++++++++ 1 file changed,
 23 insertions(+), 21 deletions(-) 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sgQGh-0003Is-Hc
Subject: [f2fs-dev] [PATCH v3 2/9] f2fs: convert f2fs_write_begin() to use
 folio
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
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert to use folio, so that we can get rid of 'page->index' to
prepare for removal of 'index' field in structure page [1].

[1] https://lore.kernel.org/all/Zp8fgUSIBGQ1TN0D@casper.infradead.org/

Cc: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 44 +++++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0655fddfc4ba..85ac05c3655a 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3378,11 +3378,11 @@ void f2fs_write_failed(struct inode *inode, loff_t to)
 }
 
 static int prepare_write_begin(struct f2fs_sb_info *sbi,
-			struct page *page, loff_t pos, unsigned len,
+			struct folio *folio, loff_t pos, unsigned int len,
 			block_t *blk_addr, bool *node_changed)
 {
-	struct inode *inode = page->mapping->host;
-	pgoff_t index = page->index;
+	struct inode *inode = folio->mapping->host;
+	pgoff_t index = folio->index;
 	struct dnode_of_data dn;
 	struct page *ipage;
 	bool locked = false;
@@ -3419,13 +3419,13 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 
 	if (f2fs_has_inline_data(inode)) {
 		if (pos + len <= MAX_INLINE_DATA(inode)) {
-			f2fs_do_read_inline_data(page_folio(page), ipage);
+			f2fs_do_read_inline_data(folio, ipage);
 			set_inode_flag(inode, FI_DATA_EXIST);
 			if (inode->i_nlink)
 				set_page_private_inline(ipage);
 			goto out;
 		}
-		err = f2fs_convert_inline_page(&dn, page);
+		err = f2fs_convert_inline_page(&dn, folio_page(folio, 0));
 		if (err || dn.data_blkaddr != NULL_ADDR)
 			goto out;
 	}
@@ -3518,12 +3518,12 @@ static int __reserve_data_block(struct inode *inode, pgoff_t index,
 }
 
 static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
-			struct page *page, loff_t pos, unsigned int len,
+			struct folio *folio, loff_t pos, unsigned int len,
 			block_t *blk_addr, bool *node_changed, bool *use_cow)
 {
-	struct inode *inode = page->mapping->host;
+	struct inode *inode = folio->mapping->host;
 	struct inode *cow_inode = F2FS_I(inode)->cow_inode;
-	pgoff_t index = page->index;
+	pgoff_t index = folio->index;
 	int err = 0;
 	block_t ori_blk_addr = NULL_ADDR;
 
@@ -3566,6 +3566,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 	struct inode *inode = mapping->host;
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct page *page = NULL;
+	struct folio *folio;
 	pgoff_t index = ((unsigned long long) pos) >> PAGE_SHIFT;
 	bool need_balance = false;
 	bool use_cow = false;
@@ -3625,22 +3626,23 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 	/* TODO: cluster can be compressed due to race with .writepage */
 
 	*pagep = page;
+	folio = page_folio(page);
 
 	if (f2fs_is_atomic_file(inode))
-		err = prepare_atomic_write_begin(sbi, page, pos, len,
+		err = prepare_atomic_write_begin(sbi, folio, pos, len,
 					&blkaddr, &need_balance, &use_cow);
 	else
-		err = prepare_write_begin(sbi, page, pos, len,
+		err = prepare_write_begin(sbi, folio, pos, len,
 					&blkaddr, &need_balance);
 	if (err)
 		goto fail;
 
 	if (need_balance && !IS_NOQUOTA(inode) &&
 			has_not_enough_free_secs(sbi, 0, 0)) {
-		unlock_page(page);
+		folio_unlock(folio);
 		f2fs_balance_fs(sbi, true);
-		lock_page(page);
-		if (page->mapping != mapping) {
+		folio_lock(folio);
+		if (folio->mapping != mapping) {
 			/* The page got truncated from under us */
 			f2fs_put_page(page, 1);
 			goto repeat;
@@ -3649,18 +3651,18 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 
 	f2fs_wait_on_page_writeback(page, DATA, false, true);
 
-	if (len == PAGE_SIZE || PageUptodate(page))
+	if (len == PAGE_SIZE || folio_test_uptodate(folio))
 		return 0;
 
 	if (!(pos & (PAGE_SIZE - 1)) && (pos + len) >= i_size_read(inode) &&
 	    !f2fs_verity_in_progress(inode)) {
-		zero_user_segment(page, len, PAGE_SIZE);
+		folio_zero_segment(folio, len, folio_size(folio));
 		return 0;
 	}
 
 	if (blkaddr == NEW_ADDR) {
-		zero_user_segment(page, 0, PAGE_SIZE);
-		SetPageUptodate(page);
+		folio_zero_segment(folio, 0, folio_size(folio));
+		folio_mark_uptodate(folio);
 	} else {
 		if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
 				DATA_GENERIC_ENHANCE_READ)) {
@@ -3669,16 +3671,16 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 		}
 		err = f2fs_submit_page_read(use_cow ?
 				F2FS_I(inode)->cow_inode : inode,
-				page_folio(page), blkaddr, 0, true);
+				folio, blkaddr, 0, true);
 		if (err)
 			goto fail;
 
-		lock_page(page);
-		if (unlikely(page->mapping != mapping)) {
+		folio_lock(folio);
+		if (unlikely(folio->mapping != mapping)) {
 			f2fs_put_page(page, 1);
 			goto repeat;
 		}
-		if (unlikely(!PageUptodate(page))) {
+		if (unlikely(!folio_test_uptodate(folio))) {
 			err = -EIO;
 			goto fail;
 		}
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
