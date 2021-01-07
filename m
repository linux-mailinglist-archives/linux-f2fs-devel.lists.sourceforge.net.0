Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2712F2ECCE0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Jan 2021 10:33:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kxRfS-0007O2-Td; Thu, 07 Jan 2021 09:33:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kxRfR-0007Nv-U7
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Jan 2021 09:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AKO5UWBo1TcOkRp4E2YawgE4JPjF6pM+EZ0ppbLjuzI=; b=dBPFLb2q+ZD0vkzCfMWR2z2keD
 mG+AwFJkvMabug2XKL6YQTs4IRv2hnGwOIDi6IvBdnv0m9pSUvfOZZ296o42fx8i1atWBb1xjoyNe
 xJZ6yDu3blS3yOj9dpTQ6biqGOKyQt62G1oj6iUNlCTwES4pK7JVzLpfQR67m+o5R5FM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=AKO5UWBo1TcOkRp4E2YawgE4JPjF6pM+EZ0ppbLjuzI=; b=d
 q//52/TKHggN3nvNPa0aejf9/Yqioxib9SevBbNMvtA9oFvWxpTUeeKjAOwzLAW7zBTR+oGSuEb+5
 WL8sf3aTUUnOI13Ikta0ZnNdE9c6NmQ2rJoG44lIDEpcuJqZWa2YIdoDb/k6GH6ls3K2RPxE9mwYL
 PX//7lZk1B1Jvvac=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kxRfD-009psy-8g
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Jan 2021 09:33:17 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DBLbY2NRRz15q3p;
 Thu,  7 Jan 2021 17:31:53 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Thu, 7 Jan 2021 17:32:41 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 7 Jan 2021 17:32:37 +0800
Message-ID: <20210107093237.117526-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kxRfD-009psy-8g
Subject: [f2fs-dev] [PATCH] f2fs: compress: fix potential deadlock
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

generic/269 reports a hangtask issue, the root cause is ABBA deadlock
described as below:

Thread A			Thread B
- down_write(&sbi->gc_lock) -- A
				- f2fs_write_data_pages
				 - lock all pages in cluster -- B
				 - f2fs_write_multi_pages
				  - f2fs_write_raw_pages
				   - f2fs_write_single_data_page
				    - f2fs_balance_fs
				     - down_write(&sbi->gc_lock) -- A
- f2fs_gc
 - do_garbage_collect
  - ra_data_block
   - pagecache_get_page -- B

To fix this, it needs to avoid calling f2fs_balance_fs() if there is
still cluster pages been locked in context of cluster writeback, so
instead, let's call f2fs_balance_fs() in the end of
f2fs_write_raw_pages() when all cluster pages were unlocked.

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c |  4 +++-
 fs/f2fs/data.c     | 10 ++++++----
 fs/f2fs/f2fs.h     |  2 +-
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index cb16b0437bd4..fc3d67055ce5 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1461,7 +1461,7 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 
 		ret = f2fs_write_single_data_page(cc->rpages[i], &_submitted,
 						NULL, NULL, wbc, io_type,
-						compr_blocks);
+						compr_blocks, false);
 		if (ret) {
 			if (ret == AOP_WRITEPAGE_ACTIVATE) {
 				unlock_page(cc->rpages[i]);
@@ -1495,6 +1495,8 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 		}
 
 		*submitted += _submitted;
+
+		f2fs_balance_fs(F2FS_M_SB(mapping), true);
 	}
 	return 0;
 out_err:
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 427a527eb17e..f8578fad7cd1 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2684,7 +2684,8 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 				sector_t *last_block,
 				struct writeback_control *wbc,
 				enum iostat_type io_type,
-				int compr_blocks)
+				int compr_blocks,
+				bool allow_balance)
 {
 	struct inode *inode = page->mapping->host;
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
@@ -2822,7 +2823,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 	}
 	unlock_page(page);
 	if (!S_ISDIR(inode->i_mode) && !IS_NOQUOTA(inode) &&
-					!F2FS_I(inode)->cp_task)
+			!F2FS_I(inode)->cp_task && allow_balance)
 		f2fs_balance_fs(sbi, need_balance_fs);
 
 	if (unlikely(f2fs_cp_error(sbi))) {
@@ -2869,7 +2870,7 @@ static int f2fs_write_data_page(struct page *page,
 #endif
 
 	return f2fs_write_single_data_page(page, NULL, NULL, NULL,
-						wbc, FS_DATA_IO, 0);
+						wbc, FS_DATA_IO, 0, true);
 }
 
 /*
@@ -3037,7 +3038,8 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 			}
 #endif
 			ret = f2fs_write_single_data_page(page, &submitted,
-					&bio, &last_block, wbc, io_type, 0);
+					&bio, &last_block, wbc, io_type,
+					0, true);
 			if (ret == AOP_WRITEPAGE_ACTIVATE)
 				unlock_page(page);
 #ifdef CONFIG_F2FS_FS_COMPRESSION
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 67086c6072ad..5cc1486f0b9f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3511,7 +3511,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 				struct bio **bio, sector_t *last_block,
 				struct writeback_control *wbc,
 				enum iostat_type io_type,
-				int compr_blocks);
+				int compr_blocks, bool allow_balance);
 void f2fs_invalidate_page(struct page *page, unsigned int offset,
 			unsigned int length);
 int f2fs_release_page(struct page *page, gfp_t wait);
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
