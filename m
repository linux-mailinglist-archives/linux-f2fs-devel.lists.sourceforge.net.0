Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 487136C447
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jul 2019 03:37:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hnvMR-0004mX-OV; Thu, 18 Jul 2019 01:37:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hnvMQ-0004mO-Gt
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jul 2019 01:37:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AxzsAGe6o4GhacMwyKJrrdlYFUY6pHKTz92QEegR7dY=; b=Wfph9E4gbcIC5+WlFG8LieCPG5
 wLdeKM8jfgGs2ILVooHqCLlWvBWHROFyWxgX1qOdL0NiSUB4nZPYpRlca6aQ3rILD0/gbpbauOTgh
 PwNrkcEjsi28AS0FQOg7bG1lTThfpnh8B4bdYXI0R2nZ3Pv1DR6MYujKLnW+7kptrhc4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=AxzsAGe6o4GhacMwyKJrrdlYFUY6pHKTz92QEegR7dY=; b=I
 P+nMcm+a11C29oPR48GZJ9afTvMiZSICciL2EqlpIffWzN8pfmaZZUqBYd02OoyOk9I+M0I9OcPHy
 ydGeR9qe1MN4ry8+Z5m/Y/oXqxID8Z5C8DSMroVCDXWV8x/pVuYF0SSBJV2GNAPpNiUCaeYNjib7/
 MOA9RaeSzLE/EtAQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hnvMM-004tQT-5F
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jul 2019 01:37:30 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8888621848;
 Thu, 18 Jul 2019 01:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563413840;
 bh=QyYFsZxXZWnmVJMpuh5ZwNXY/+BLv5Jmy5x+kjaFSGo=;
 h=From:To:Cc:Subject:Date:From;
 b=1kJ4AeOEG8INgoFgmiFNxAdXLAmPzGWb+Fnl5r3ZDZZBcWBr7d+wZ8B5U5PQLGUlK
 4DnoGGyGjK39IR+N5FjmvudA8lQ0brlPg8h7xUZmXIdpvBdcrUAfEtPP07aOOP3/Qn
 cv+yodGTe+6HFutlx2jjaau7o6Q2rnXY2S3xb12Q=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 17 Jul 2019 18:37:18 -0700
Message-Id: <20190718013718.70335-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hnvMM-004tQT-5F
Subject: [f2fs-dev] [PATCH] f2fs: fix to read source block before
 invalidating it
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

f2fs_allocate_data_block() invalidates old block address and enable new block
address. Then, if we try to read old block by f2fs_submit_page_bio(), it will
give WARN due to reading invalid blocks.

Let's make the order sanely back.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/gc.c | 57 ++++++++++++++++++++++++++++------------------------
 1 file changed, 31 insertions(+), 26 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 6691f526fa40..35c5453ab874 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -740,6 +740,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 	block_t newaddr;
 	int err = 0;
 	bool lfs_mode = test_opt(fio.sbi, LFS);
+	bool submitted = false;
 
 	/* do not read out */
 	page = f2fs_grab_cache_page(inode->i_mapping, bidx, false);
@@ -796,6 +797,20 @@ static int move_data_block(struct inode *inode, block_t bidx,
 	if (lfs_mode)
 		down_write(&fio.sbi->io_order_lock);
 
+	mpage = f2fs_grab_cache_page(META_MAPPING(fio.sbi),
+			fio.old_blkaddr, false);
+	if (!mpage)
+		goto put_out;
+
+	if (!PageUptodate(mpage)) {
+		err = f2fs_submit_page_bio(&fio);
+		if (err) {
+			f2fs_put_page(mpage, 1);
+			goto put_out;
+		}
+		submitted = true;
+	}
+
 	f2fs_allocate_data_block(fio.sbi, NULL, fio.old_blkaddr, &newaddr,
 					&sum, CURSEG_COLD_DATA, NULL, false);
 
@@ -803,44 +818,34 @@ static int move_data_block(struct inode *inode, block_t bidx,
 				newaddr, FGP_LOCK | FGP_CREAT, GFP_NOFS);
 	if (!fio.encrypted_page) {
 		err = -ENOMEM;
-		goto recover_block;
-	}
-
-	mpage = f2fs_pagecache_get_page(META_MAPPING(fio.sbi),
-					fio.old_blkaddr, FGP_LOCK, GFP_NOFS);
-	if (mpage) {
-		bool updated = false;
-
-		if (PageUptodate(mpage)) {
-			memcpy(page_address(fio.encrypted_page),
-					page_address(mpage), PAGE_SIZE);
-			updated = true;
-		}
 		f2fs_put_page(mpage, 1);
-		invalidate_mapping_pages(META_MAPPING(fio.sbi),
-					fio.old_blkaddr, fio.old_blkaddr);
-		if (updated)
-			goto write_page;
+		goto recover_block;
 	}
 
-	err = f2fs_submit_page_bio(&fio);
-	if (err)
-		goto put_page_out;
-
-	/* write page */
-	lock_page(fio.encrypted_page);
+	if (!submitted)
+		goto write_page;
 
-	if (unlikely(fio.encrypted_page->mapping != META_MAPPING(fio.sbi))) {
+	/* read source block */
+	lock_page(mpage);
+	if (unlikely(mpage->mapping != META_MAPPING(fio.sbi))) {
 		err = -EIO;
+		f2fs_put_page(mpage, 1);
 		goto put_page_out;
 	}
-	if (unlikely(!PageUptodate(fio.encrypted_page))) {
+	if (unlikely(!PageUptodate(mpage))) {
 		err = -EIO;
+		f2fs_put_page(mpage, 1);
 		goto put_page_out;
 	}
-
 write_page:
+	/* write target block */
 	f2fs_wait_on_page_writeback(fio.encrypted_page, DATA, true, true);
+	memcpy(page_address(fio.encrypted_page),
+				page_address(mpage), PAGE_SIZE);
+	f2fs_put_page(mpage, 1);
+	invalidate_mapping_pages(META_MAPPING(fio.sbi),
+				fio.old_blkaddr, fio.old_blkaddr);
+
 	set_page_dirty(fio.encrypted_page);
 	if (clear_page_dirty_for_io(fio.encrypted_page))
 		dec_page_count(fio.sbi, F2FS_DIRTY_META);
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
