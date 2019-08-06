Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A225683B31
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Aug 2019 23:33:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hv75X-0004U5-0u; Tue, 06 Aug 2019 21:33:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1hv75V-0004Tp-Eb
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Aug 2019 21:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mBOcax6fp/YvdpxHC9TfXaal+XhYVyv1/8PZ/1Xlccg=; b=e7/Wg+zHeR3ipJviEPAQT011yp
 y8pm3aulF+lOQVUS0A5tvsNKCtqk8xvVNPxselvhhkYQkyV2ZwCOjML8sZFzORn0ksqOlRP2tAXKB
 mu71czAA1sdMfkc8VAO9vCqtAljAwzLzrOItbnVofmy67FqeLSTu5cBffDuAfCnqiXCA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mBOcax6fp/YvdpxHC9TfXaal+XhYVyv1/8PZ/1Xlccg=; b=LGB5DlrzeS74ZV/BIQiMW50Llr
 ZBWVjwOEHNLtemF3X/2md8XC6aakEzTzWG+kxW0VMCZi0robN8woHnLZYCa85zpgTDQPOMP3v6dwX
 BoRo/5ApbGzH/1SxBkO4cvTK/UhkPRiHWA/iAEEItDvcvhLz22qPRGhKW6K4tjZz7l88=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hv75T-00CenT-5K
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Aug 2019 21:33:45 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5D0B21881;
 Tue,  6 Aug 2019 21:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565127217;
 bh=gx8SFavgzOTEOESs7rzfvsJIXbtJJ880k7HdXMQfhM4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u6G51MKZHQ57aE2syMLXLyUoPCsf3qQorT7zMGnm6BXenRoej37TS8p+Ytss2MMnR
 iFnQzDrerYR+h3QKYZMKyLQtz3W91Nxisvl9vCd8oYvO4KjED+9CpAo0eclIYgw0Gf
 iCudtjEcXerCI0L9ncIT2Hnb9npcDG8WSzptXDVU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue,  6 Aug 2019 17:32:34 -0400
Message-Id: <20190806213319.19203-14-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806213319.19203-1-sashal@kernel.org>
References: <20190806213319.19203-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hv75T-00CenT-5K
Subject: [f2fs-dev] [PATCH AUTOSEL 5.2 14/59] f2fs: fix to read source block
 before invalidating it
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jaegeuk Kim <jaegeuk@kernel.org>

[ Upstream commit 543b8c468f55f27f3c0178a22a91a51aabbbc428 ]

f2fs_allocate_data_block() invalidates old block address and enable new block
address. Then, if we try to read old block by f2fs_submit_page_bio(), it will
give WARN due to reading invalid blocks.

Let's make the order sanely back.

Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/gc.c | 70 +++++++++++++++++++++++++---------------------------
 1 file changed, 34 insertions(+), 36 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 963fb4571fd98..bb6fd5a506d39 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -794,6 +794,29 @@ static int move_data_block(struct inode *inode, block_t bidx,
 	if (lfs_mode)
 		down_write(&fio.sbi->io_order_lock);
 
+	mpage = f2fs_grab_cache_page(META_MAPPING(fio.sbi),
+					fio.old_blkaddr, false);
+	if (!mpage)
+		goto up_out;
+
+	fio.encrypted_page = mpage;
+
+	/* read source block in mpage */
+	if (!PageUptodate(mpage)) {
+		err = f2fs_submit_page_bio(&fio);
+		if (err) {
+			f2fs_put_page(mpage, 1);
+			goto up_out;
+		}
+		lock_page(mpage);
+		if (unlikely(mpage->mapping != META_MAPPING(fio.sbi) ||
+						!PageUptodate(mpage))) {
+			err = -EIO;
+			f2fs_put_page(mpage, 1);
+			goto up_out;
+		}
+	}
+
 	f2fs_allocate_data_block(fio.sbi, NULL, fio.old_blkaddr, &newaddr,
 					&sum, CURSEG_COLD_DATA, NULL, false);
 
@@ -801,44 +824,18 @@ static int move_data_block(struct inode *inode, block_t bidx,
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
-	}
-
-	err = f2fs_submit_page_bio(&fio);
-	if (err)
-		goto put_page_out;
-
-	/* write page */
-	lock_page(fio.encrypted_page);
-
-	if (unlikely(fio.encrypted_page->mapping != META_MAPPING(fio.sbi))) {
-		err = -EIO;
-		goto put_page_out;
-	}
-	if (unlikely(!PageUptodate(fio.encrypted_page))) {
-		err = -EIO;
-		goto put_page_out;
+		goto recover_block;
 	}
 
-write_page:
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
@@ -869,11 +866,12 @@ static int move_data_block(struct inode *inode, block_t bidx,
 put_page_out:
 	f2fs_put_page(fio.encrypted_page, 1);
 recover_block:
-	if (lfs_mode)
-		up_write(&fio.sbi->io_order_lock);
 	if (err)
 		f2fs_do_replace_block(fio.sbi, &sum, newaddr, fio.old_blkaddr,
 								true, true);
+up_out:
+	if (lfs_mode)
+		up_write(&fio.sbi->io_order_lock);
 put_out:
 	f2fs_put_dnode(&dn);
 out:
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
