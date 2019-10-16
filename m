Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE464D8C4D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Oct 2019 11:15:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iKfOe-0000Uo-5q; Wed, 16 Oct 2019 09:15:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <koulihong@huawei.com>) id 1iKfOd-0000Ue-Dt
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Oct 2019 09:15:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vrPzaoBtCdNTIMsmfCNtFjl62TwOI+9YaHz/JbWOVxA=; b=k/uVLx8XcTk9o/mUJwQ2+U/EP9
 7lveBpDtBu+iw8nOHgQNT0mkdwEMs3p0fzxOTVqgSDrVX12JDK+JFCNQvBWelNHhn3mkCoulg865C
 Iy8vaachpVpn7A1ly8aTq3LT1Gp9YjLBHGqRYT/wDDofMxB0XqXMvDLCDM4kmiydSiRY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vrPzaoBtCdNTIMsmfCNtFjl62TwOI+9YaHz/JbWOVxA=; b=GJSHAYACxhS3xA2y1HoQbhZiQ3
 JnGb5TIVq2UAkBq/mRywktItodALFKHTMBF9ZC2mLeN8Xhue+EmqKAXzgbajmDxZjS5NLMCJAgKbX
 LpnkhBfYgTO9aCgTnoVBuTNwWPFjdx0g2V3ohCLwbl7qwdnPvcMiyKhsb7E2X2O8PxSY=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iKfOb-00BGI6-FX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Oct 2019 09:15:07 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 64924D6C7418638A4023;
 Wed, 16 Oct 2019 17:14:58 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Wed, 16 Oct 2019
 17:14:51 +0800
From: Lihong Kou <koulihong@huawei.com>
To: <yuchao0@huawei.com>, <jaegeuk@kernel.org>
Date: Wed, 16 Oct 2019 17:22:01 +0800
Message-ID: <1571217722-88090-2-git-send-email-koulihong@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571217722-88090-1-git-send-email-koulihong@huawei.com>
References: <1571217722-88090-1-git-send-email-koulihong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iKfOb-00BGI6-FX
Subject: [f2fs-dev] [PATCH 1/2] Revert "f2fs: add bio cache for IPU"
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
Cc: zengguangyue@hisilicon.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This reverts commit 8648de2c581eeda7e412d6e38bf19e25bbb795ba.
---
 fs/f2fs/data.c    | 88 ++++++-------------------------------------------------
 fs/f2fs/f2fs.h    |  3 --
 fs/f2fs/segment.c |  5 +---
 3 files changed, 10 insertions(+), 86 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0ca530a..5af9810 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -348,20 +348,20 @@ static void __submit_merged_bio(struct f2fs_bio_info *io)
 	io->bio = NULL;
 }
 
-static bool __has_merged_page(struct bio *bio, struct inode *inode,
+static bool __has_merged_page(struct f2fs_bio_info *io, struct inode *inode,
 						struct page *page, nid_t ino)
 {
 	struct bio_vec *bvec;
 	struct page *target;
 	struct bvec_iter_all iter_all;
 
-	if (!bio)
+	if (!io->bio)
 		return false;
 
 	if (!inode && !page && !ino)
 		return true;
 
-	bio_for_each_segment_all(bvec, bio, iter_all) {
+	bio_for_each_segment_all(bvec, io->bio, iter_all) {
 
 		target = bvec->bv_page;
 		if (fscrypt_is_bounce_page(target))
@@ -411,7 +411,7 @@ static void __submit_merged_write_cond(struct f2fs_sb_info *sbi,
 			struct f2fs_bio_info *io = sbi->write_io[btype] + temp;
 
 			down_read(&io->io_rwsem);
-			ret = __has_merged_page(io->bio, inode, page, ino);
+			ret = __has_merged_page(io, inode, page, ino);
 			up_read(&io->io_rwsem);
 		}
 		if (ret)
@@ -481,61 +481,6 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 	return 0;
 }
 
-int f2fs_merge_page_bio(struct f2fs_io_info *fio)
-{
-	struct bio *bio = *fio->bio;
-	struct page *page = fio->encrypted_page ?
-			fio->encrypted_page : fio->page;
-
-	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
-			__is_meta_io(fio) ? META_GENERIC : DATA_GENERIC))
-		return -EFSCORRUPTED;
-
-	trace_f2fs_submit_page_bio(page, fio);
-	f2fs_trace_ios(fio, 0);
-
-	if (bio && (*fio->last_block + 1 != fio->new_blkaddr ||
-			!__same_bdev(fio->sbi, fio->new_blkaddr, bio))) {
-		__submit_bio(fio->sbi, bio, fio->type);
-		bio = NULL;
-	}
-alloc_new:
-	if (!bio) {
-		bio = __bio_alloc(fio->sbi, fio->new_blkaddr, fio->io_wbc,
-				BIO_MAX_PAGES, false, fio->type, fio->temp);
-		bio_set_op_attrs(bio, fio->op, fio->op_flags);
-	}
-
-	if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE) {
-		__submit_bio(fio->sbi, bio, fio->type);
-		bio = NULL;
-		goto alloc_new;
-	}
-
-	if (fio->io_wbc)
-		wbc_account_io(fio->io_wbc, page, PAGE_SIZE);
-
-	inc_page_count(fio->sbi, WB_DATA_TYPE(page));
-
-	*fio->last_block = fio->new_blkaddr;
-	*fio->bio = bio;
-
-	return 0;
-}
-
-static void f2fs_submit_ipu_bio(struct f2fs_sb_info *sbi, struct bio **bio,
-							struct page *page)
-{
-	if (!bio)
-		return;
-
-	if (!__has_merged_page(*bio, NULL, page, 0))
-		return;
-
-	__submit_bio(sbi, *bio, DATA);
-	*bio = NULL;
-}
-
 void f2fs_submit_page_write(struct f2fs_io_info *fio)
 {
 	struct f2fs_sb_info *sbi = fio->sbi;
@@ -2004,8 +1949,6 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 }
 
 static int __write_data_page(struct page *page, bool *submitted,
-				struct bio **bio,
-				sector_t *last_block,
 				struct writeback_control *wbc,
 				enum iostat_type io_type)
 {
@@ -2031,8 +1974,6 @@ static int __write_data_page(struct page *page, bool *submitted,
 		.need_lock = LOCK_RETRY,
 		.io_type = io_type,
 		.io_wbc = wbc,
-		.bio = bio,
-		.last_block = last_block,
 	};
 
 	trace_f2fs_writepage(page, DATA);
@@ -2131,13 +2072,10 @@ static int __write_data_page(struct page *page, bool *submitted,
 
 	unlock_page(page);
 	if (!S_ISDIR(inode->i_mode) && !IS_NOQUOTA(inode) &&
-					!F2FS_I(inode)->cp_task) {
-		f2fs_submit_ipu_bio(sbi, bio, page);
+					!F2FS_I(inode)->cp_task)
 		f2fs_balance_fs(sbi, need_balance_fs);
-	}
 
 	if (unlikely(f2fs_cp_error(sbi))) {
-		f2fs_submit_ipu_bio(sbi, bio, page);
 		f2fs_submit_merged_write(sbi, DATA);
 		submitted = NULL;
 	}
@@ -2164,7 +2102,7 @@ static int __write_data_page(struct page *page, bool *submitted,
 static int f2fs_write_data_page(struct page *page,
 					struct writeback_control *wbc)
 {
-	return __write_data_page(page, NULL, NULL, NULL, wbc, FS_DATA_IO);
+	return __write_data_page(page, NULL, wbc, FS_DATA_IO);
 }
 
 /*
@@ -2180,8 +2118,6 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	int done = 0;
 	struct pagevec pvec;
 	struct f2fs_sb_info *sbi = F2FS_M_SB(mapping);
-	struct bio *bio = NULL;
-	sector_t last_block;
 	int nr_pages;
 	pgoff_t uninitialized_var(writeback_index);
 	pgoff_t index;
@@ -2258,20 +2194,17 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 			}
 
 			if (PageWriteback(page)) {
-				if (wbc->sync_mode != WB_SYNC_NONE) {
+				if (wbc->sync_mode != WB_SYNC_NONE)
 					f2fs_wait_on_page_writeback(page,
 							DATA, true, true);
-					f2fs_submit_ipu_bio(sbi, &bio, page);
-				} else {
+				else
 					goto continue_unlock;
-				}
 			}
 
 			if (!clear_page_dirty_for_io(page))
 				goto continue_unlock;
 
-			ret = __write_data_page(page, &submitted, &bio,
-					&last_block, wbc, io_type);
+			ret = __write_data_page(page, &submitted, wbc, io_type);
 			if (unlikely(ret)) {
 				/*
 				 * keep nr_to_write, since vfs uses this to
@@ -2320,9 +2253,6 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	if (nwritten)
 		f2fs_submit_merged_write_cond(F2FS_M_SB(mapping), mapping->host,
 								NULL, 0, DATA);
-	/* submit cached bio of IPU write */
-	if (bio)
-		__submit_bio(sbi, bio, DATA);
 
 	return ret;
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 17382da..f1cf2843 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1056,8 +1056,6 @@ struct f2fs_io_info {
 	bool retry;		/* need to reallocate block address */
 	enum iostat_type io_type;	/* io type */
 	struct writeback_control *io_wbc; /* writeback control */
-	struct bio **bio;		/* bio for ipu */
-	sector_t *last_block;		/* last block number in bio */
 	unsigned char version;		/* version of the node */
 };
 
@@ -3164,7 +3162,6 @@ void f2fs_submit_merged_write_cond(struct f2fs_sb_info *sbi,
 				nid_t ino, enum page_type type);
 void f2fs_flush_merged_writes(struct f2fs_sb_info *sbi);
 int f2fs_submit_page_bio(struct f2fs_io_info *fio);
-int f2fs_merge_page_bio(struct f2fs_io_info *fio);
 void f2fs_submit_page_write(struct f2fs_io_info *fio);
 struct block_device *f2fs_target_device(struct f2fs_sb_info *sbi,
 			block_t blk_addr, struct bio *bio);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a661ac3..380e0ab 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3253,10 +3253,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 
 	stat_inc_inplace_blocks(fio->sbi);
 
-	if (fio->bio)
-		err = f2fs_merge_page_bio(fio);
-	else
-		err = f2fs_submit_page_bio(fio);
+	err = f2fs_submit_page_bio(fio);
 	if (!err) {
 		update_device_state(fio);
 		f2fs_update_iostat(fio->sbi, fio->io_type, F2FS_BLKSIZE);
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
