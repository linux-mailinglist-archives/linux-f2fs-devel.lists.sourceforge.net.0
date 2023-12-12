Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F0380E3C6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Dec 2023 06:24:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rCvG3-0003Be-Vq;
	Tue, 12 Dec 2023 05:24:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1rCvG1-0003BY-Pl
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Dec 2023 05:24:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5/ghVedLboj/eeKF473mjSt/kA82EFV6hipOf12Q59Y=; b=QCrP6gh0W93Wpoj1mGITyQj5K+
 FsHFqnPTin/kxHIoE3u0BvxhKdsQextjyIyh1774Cikq5ZBaNbBbUuOnLNvYN+fTkHZH8hULDLwBn
 gEEld/q65qy8kDdp2QOXbuZRRLguGWTbp75VWqgQ7IiBJuiU7cMzinLhT69W3O6PxrPw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5/ghVedLboj/eeKF473mjSt/kA82EFV6hipOf12Q59Y=; b=A
 FfMEEG4L2seJ5bXMw27FDHfWf+Cy8ZCCRUB31ufgmijA+WbUMKQ0z3tvUNY6xJT6rMuAXp/kCmkHG
 LbjDdwAogKThoDROWHB6CAj6bSOQRjcn0C55ZHsNmQ8GYJonOXCkNw4i4IClwuqnXYPJbonAHDtJ/
 vk5Xq665uc19qV5g=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rCvFz-0006BD-PV for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Dec 2023 05:24:38 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 3BC5NkoS074678;
 Tue, 12 Dec 2023 13:23:46 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4Sq6Ly26n2z2PMBZm;
 Tue, 12 Dec 2023 13:17:46 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Tue, 12 Dec 2023 13:23:43 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Tue, 12 Dec 2023 13:23:23 +0800
Message-ID: <1702358603-26270-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 3BC5NkoS074678
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: unify the error handling of ERROR_INVALID_BLKADDR in
 f2fs_is_valid_blkaddr
 and remove some redundant codes in f2fs_cache_compressed_page. Signed-off-by:
 Zhiguo Niu <zhiguo.niu@unisoc.com> --- changes of v2: improve patch according
 Chao's suggestions. --- --- fs/f2fs/checkpoint.c | 43 +++++++++++++++++++++++
 fs/f2fs/c [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rCvFz-0006BD-PV
Subject: [f2fs-dev] [PATCH V2] f2fs: unify the error handling of
 f2fs_is_valid_blkaddr
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
Cc: ke.wang@unisoc.com, zhiguo.niu@unisoc.com, niuzhiguo84@gmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

unify the error handling of ERROR_INVALID_BLKADDR in f2fs_is_valid_blkaddr
and remove some redundant codes in f2fs_cache_compressed_page.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
changes of v2: improve patch according Chao's suggestions.
---
---
 fs/f2fs/checkpoint.c   | 43 +++++++++++++++++++++++--------------------
 fs/f2fs/compress.c     |  4 ----
 fs/f2fs/data.c         | 24 ++++--------------------
 fs/f2fs/extent_cache.c |  7 ++-----
 fs/f2fs/f2fs.h         |  5 ++---
 fs/f2fs/file.c         | 17 +++++------------
 fs/f2fs/gc.c           |  2 --
 fs/f2fs/inode.c        |  5 ++---
 fs/f2fs/node.c         |  2 +-
 fs/f2fs/recovery.c     | 13 ++++++-------
 fs/f2fs/segment.c      |  2 --
 11 files changed, 45 insertions(+), 79 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index b0597a5..d8ff056 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -154,19 +154,17 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
 	if (unlikely(f2fs_cp_error(sbi)))
 		return exist;
 
-	if (exist && type == DATA_GENERIC_ENHANCE_UPDATE) {
-		f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
-			 blkaddr, exist);
-		set_sbi_flag(sbi, SBI_NEED_FSCK);
-		return exist;
-	}
+	if ((exist && type == DATA_GENERIC_ENHANCE_UPDATE) ||
+			(!exist && type == DATA_GENERIC_ENHANCE))
+		goto err;
 
-	if (!exist && type == DATA_GENERIC_ENHANCE) {
-		f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
-			 blkaddr, exist);
-		set_sbi_flag(sbi, SBI_NEED_FSCK);
-		dump_stack();
-	}
+	return exist;
+err:
+	f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
+		blkaddr, exist);
+	set_sbi_flag(sbi, SBI_NEED_FSCK);
+	dump_stack();
+	f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 	return exist;
 }
 
@@ -174,29 +172,29 @@ bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 					block_t blkaddr, int type)
 {
 	if (time_to_inject(sbi, FAULT_BLKADDR))
-		return false;
+		goto err;
 
 	switch (type) {
 	case META_NAT:
 		break;
 	case META_SIT:
 		if (unlikely(blkaddr >= SIT_BLK_CNT(sbi)))
-			return false;
+			goto err;
 		break;
 	case META_SSA:
 		if (unlikely(blkaddr >= MAIN_BLKADDR(sbi) ||
 			blkaddr < SM_I(sbi)->ssa_blkaddr))
-			return false;
+			goto err;
 		break;
 	case META_CP:
 		if (unlikely(blkaddr >= SIT_I(sbi)->sit_base_addr ||
 			blkaddr < __start_cp_addr(sbi)))
-			return false;
+			goto err;
 		break;
 	case META_POR:
 		if (unlikely(blkaddr >= MAX_BLKADDR(sbi) ||
 			blkaddr < MAIN_BLKADDR(sbi)))
-			return false;
+			goto err;
 		break;
 	case DATA_GENERIC:
 	case DATA_GENERIC_ENHANCE:
@@ -213,7 +211,7 @@ bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 				  blkaddr);
 			set_sbi_flag(sbi, SBI_NEED_FSCK);
 			dump_stack();
-			return false;
+			goto err;
 		} else {
 			return __is_bitmap_valid(sbi, blkaddr, type);
 		}
@@ -221,13 +219,16 @@ bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 	case META_GENERIC:
 		if (unlikely(blkaddr < SEG0_BLKADDR(sbi) ||
 			blkaddr >= MAIN_BLKADDR(sbi)))
-			return false;
+			goto err;
 		break;
 	default:
 		BUG();
 	}
 
 	return true;
+err:
+	f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
+	return false;
 }
 
 /*
@@ -256,8 +257,10 @@ int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, block_t start, int nrpages,
 	blk_start_plug(&plug);
 	for (; nrpages-- > 0; blkno++) {
 
-		if (!f2fs_is_valid_blkaddr(sbi, blkno, type))
+		if (!f2fs_is_valid_blkaddr(sbi, blkno, type)) {
+			err = -EFSCORRUPTED;
 			goto out;
+		}
 
 		switch (type) {
 		case META_NAT:
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 36e5dab..bd5acb5 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1878,12 +1878,8 @@ void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
 
 	set_page_private_data(cpage, ino);
 
-	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE_READ))
-		goto out;
-
 	memcpy(page_address(cpage), page_address(page), PAGE_SIZE);
 	SetPageUptodate(cpage);
-out:
 	f2fs_put_page(cpage, 1);
 }
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 4e42b5f..14b6ea2 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -740,10 +740,8 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 
 	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
 			fio->is_por ? META_POR : (__is_meta_io(fio) ?
-			META_GENERIC : DATA_GENERIC_ENHANCE))) {
-		f2fs_handle_error(fio->sbi, ERROR_INVALID_BLKADDR);
+			META_GENERIC : DATA_GENERIC_ENHANCE)))
 		return -EFSCORRUPTED;
-	}
 
 	trace_f2fs_submit_page_bio(page, fio);
 
@@ -948,10 +946,8 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 			fio->encrypted_page : fio->page;
 
 	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
-			__is_meta_io(fio) ? META_GENERIC : DATA_GENERIC)) {
-		f2fs_handle_error(fio->sbi, ERROR_INVALID_BLKADDR);
+			__is_meta_io(fio) ? META_GENERIC : DATA_GENERIC))
 		return -EFSCORRUPTED;
-	}
 
 	trace_f2fs_submit_page_bio(page, fio);
 
@@ -1293,8 +1289,6 @@ struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
 		if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), dn.data_blkaddr,
 						DATA_GENERIC_ENHANCE_READ)) {
 			err = -EFSCORRUPTED;
-			f2fs_handle_error(F2FS_I_SB(inode),
-						ERROR_INVALID_BLKADDR);
 			goto put_err;
 		}
 		goto got_it;
@@ -1320,8 +1314,6 @@ struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
 						dn.data_blkaddr,
 						DATA_GENERIC_ENHANCE)) {
 		err = -EFSCORRUPTED;
-		f2fs_handle_error(F2FS_I_SB(inode),
-					ERROR_INVALID_BLKADDR);
 		goto put_err;
 	}
 got_it:
@@ -1651,7 +1643,6 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 	if (!is_hole &&
 	    !f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE)) {
 		err = -EFSCORRUPTED;
-		f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 		goto sync_out;
 	}
 
@@ -2175,8 +2166,6 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 		if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), block_nr,
 						DATA_GENERIC_ENHANCE_READ)) {
 			ret = -EFSCORRUPTED;
-			f2fs_handle_error(F2FS_I_SB(inode),
-						ERROR_INVALID_BLKADDR);
 			goto out;
 		}
 	} else {
@@ -2309,7 +2298,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 			break;
 
 		if (!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC)) {
-			ret = -EFAULT;
+			ret = -EFSCORRUPTED;
 			goto out_put_dnode;
 		}
 		cc->nr_cpages++;
@@ -2719,11 +2708,8 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	    f2fs_lookup_read_extent_cache_block(inode, page->index,
 						&fio->old_blkaddr)) {
 		if (!f2fs_is_valid_blkaddr(fio->sbi, fio->old_blkaddr,
-						DATA_GENERIC_ENHANCE)) {
-			f2fs_handle_error(fio->sbi,
-						ERROR_INVALID_BLKADDR);
+						DATA_GENERIC_ENHANCE))
 			return -EFSCORRUPTED;
-		}
 
 		ipu_force = true;
 		fio->need_lock = LOCK_DONE;
@@ -2751,7 +2737,6 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		!f2fs_is_valid_blkaddr(fio->sbi, fio->old_blkaddr,
 						DATA_GENERIC_ENHANCE)) {
 		err = -EFSCORRUPTED;
-		f2fs_handle_error(fio->sbi, ERROR_INVALID_BLKADDR);
 		goto out_writepage;
 	}
 
@@ -3718,7 +3703,6 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 		if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
 				DATA_GENERIC_ENHANCE_READ)) {
 			err = -EFSCORRUPTED;
-			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 			goto fail;
 		}
 		err = f2fs_submit_page_read(use_cow ?
diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index ad8dfac7..99d0442 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -43,7 +43,6 @@ bool sanity_check_extent_cache(struct inode *inode)
 	if (!f2fs_is_valid_blkaddr(sbi, ei->blk, DATA_GENERIC_ENHANCE) ||
 	    !f2fs_is_valid_blkaddr(sbi, ei->blk + ei->len - 1,
 					DATA_GENERIC_ENHANCE)) {
-		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "%s: inode (ino=%lx) extent info [%u, %u, %u] is incorrect, run fsck to fix",
 			  __func__, inode->i_ino,
 			  ei->blk, ei->fofs, ei->len);
@@ -856,10 +855,8 @@ static int __get_new_block_age(struct inode *inode, struct extent_info *ei,
 		goto out;
 
 	if (__is_valid_data_blkaddr(blkaddr) &&
-	    !f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE)) {
-		f2fs_bug_on(sbi, 1);
-		return -EINVAL;
-	}
+	    !f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE))
+		return -EFSCORRUPTED;
 out:
 	/*
 	 * init block age with zero, this can happen when the block age extent
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9043ced..e36630c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3454,14 +3454,13 @@ static inline int get_inline_xattr_addrs(struct inode *inode)
 
 bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 					block_t blkaddr, int type);
+
 static inline void verify_blkaddr(struct f2fs_sb_info *sbi,
 					block_t blkaddr, int type)
 {
-	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, type)) {
+	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, type))
 		f2fs_err(sbi, "invalid blkaddr: %u, type: %d, run fsck to fix.",
 			 blkaddr, type);
-		f2fs_bug_on(sbi, 1);
-	}
 }
 
 static inline bool __is_valid_data_blkaddr(block_t blkaddr)
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e503635..3d193a3 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -416,7 +416,7 @@ static loff_t f2fs_seek_block(struct file *file, loff_t offset, int whence)
 	pgoff_t pgofs, end_offset;
 	loff_t data_ofs = offset;
 	loff_t isize;
-	int err = 0;
+	int err = -ENXIO;
 
 	inode_lock(inode);
 
@@ -466,6 +466,7 @@ static loff_t f2fs_seek_block(struct file *file, loff_t offset, int whence)
 				!f2fs_is_valid_blkaddr(F2FS_I_SB(inode),
 					blkaddr, DATA_GENERIC_ENHANCE)) {
 				f2fs_put_dnode(&dn);
+				err = -EFSCORRUPTED;
 				goto fail;
 			}
 
@@ -487,7 +488,7 @@ static loff_t f2fs_seek_block(struct file *file, loff_t offset, int whence)
 	return vfs_setpos(file, data_ofs, maxbytes);
 fail:
 	inode_unlock(inode);
-	return -ENXIO;
+	return err;
 }
 
 static loff_t f2fs_llseek(struct file *file, loff_t offset, int whence)
@@ -1197,7 +1198,6 @@ static int __read_out_blkaddrs(struct inode *inode, block_t *blkaddr,
 			!f2fs_is_valid_blkaddr(sbi, *blkaddr,
 					DATA_GENERIC_ENHANCE)) {
 			f2fs_put_dnode(&dn);
-			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 			return -EFSCORRUPTED;
 		}
 
@@ -1482,7 +1482,6 @@ static int f2fs_do_zero_range(struct dnode_of_data *dn, pgoff_t start,
 		if (!f2fs_is_valid_blkaddr(sbi, dn->data_blkaddr,
 					DATA_GENERIC_ENHANCE)) {
 			ret = -EFSCORRUPTED;
-			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 			break;
 		}
 
@@ -3438,10 +3437,8 @@ static int release_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
 		if (!__is_valid_data_blkaddr(blkaddr))
 			continue;
 		if (unlikely(!f2fs_is_valid_blkaddr(sbi, blkaddr,
-					DATA_GENERIC_ENHANCE))) {
-			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
+					DATA_GENERIC_ENHANCE)))
 			return -EFSCORRUPTED;
-		}
 	}
 
 	while (count) {
@@ -3604,10 +3601,8 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
 		if (!__is_valid_data_blkaddr(blkaddr))
 			continue;
 		if (unlikely(!f2fs_is_valid_blkaddr(sbi, blkaddr,
-					DATA_GENERIC_ENHANCE))) {
-			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
+					DATA_GENERIC_ENHANCE)))
 			return -EFSCORRUPTED;
-		}
 	}
 
 	while (count) {
@@ -3879,8 +3874,6 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 						DATA_GENERIC_ENHANCE)) {
 				ret = -EFSCORRUPTED;
 				f2fs_put_dnode(&dn);
-				f2fs_handle_error(sbi,
-						ERROR_INVALID_BLKADDR);
 				goto out;
 			}
 
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index f550cde..2f16f7a 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1197,7 +1197,6 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 		if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
 						DATA_GENERIC_ENHANCE_READ))) {
 			err = -EFSCORRUPTED;
-			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 			goto put_page;
 		}
 		goto got_it;
@@ -1216,7 +1215,6 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 	if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
 						DATA_GENERIC_ENHANCE))) {
 		err = -EFSCORRUPTED;
-		f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 		goto put_page;
 	}
 got_it:
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 560bfca..05bfb36 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -83,10 +83,9 @@ static int __written_first_block(struct f2fs_sb_info *sbi,
 
 	if (!__is_valid_data_blkaddr(addr))
 		return 1;
-	if (!f2fs_is_valid_blkaddr(sbi, addr, DATA_GENERIC_ENHANCE)) {
-		f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
+	if (!f2fs_is_valid_blkaddr(sbi, addr, DATA_GENERIC_ENHANCE))
 		return -EFSCORRUPTED;
-	}
+
 	return 0;
 }
 
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 6c7f6a6..f6c9cef 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -612,7 +612,7 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 	blkaddr = le32_to_cpu(ne.block_addr);
 	if (__is_valid_data_blkaddr(blkaddr) &&
 		!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE))
-		return -EFAULT;
+		return -EFSCORRUPTED;
 
 	/* cache nat entry */
 	cache_nat_entry(sbi, nid, &ne);
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index b56d0f1..1a322bb 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -374,7 +374,7 @@ static int sanity_check_node_chain(struct f2fs_sb_info *sbi, block_t blkaddr,
 	for (i = 0; i < 2; i++) {
 		if (!f2fs_is_valid_blkaddr(sbi, *blkaddr_fast, META_POR)) {
 			*is_detecting = false;
-			return 0;
+			return -EFSCORRUPTED;
 		}
 
 		page = f2fs_get_tmp_page(sbi, *blkaddr_fast);
@@ -399,6 +399,7 @@ static int sanity_check_node_chain(struct f2fs_sb_info *sbi, block_t blkaddr,
 	if (*blkaddr_fast == blkaddr) {
 		f2fs_notice(sbi, "%s: Detect looped node chain on blkaddr:%u."
 				" Run fsck to fix it.", __func__, blkaddr);
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		return -EINVAL;
 	}
 	return 0;
@@ -422,7 +423,7 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 		struct fsync_inode_entry *entry;
 
 		if (!f2fs_is_valid_blkaddr(sbi, blkaddr, META_POR))
-			return 0;
+			return -EFSCORRUPTED;
 
 		page = f2fs_get_tmp_page(sbi, blkaddr);
 		if (IS_ERR(page)) {
@@ -680,14 +681,12 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 		if (__is_valid_data_blkaddr(src) &&
 			!f2fs_is_valid_blkaddr(sbi, src, META_POR)) {
 			err = -EFSCORRUPTED;
-			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 			goto err;
 		}
 
 		if (__is_valid_data_blkaddr(dest) &&
 			!f2fs_is_valid_blkaddr(sbi, dest, META_POR)) {
 			err = -EFSCORRUPTED;
-			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 			goto err;
 		}
 
@@ -745,8 +744,6 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 				f2fs_err(sbi, "Inconsistent dest blkaddr:%u, ino:%lu, ofs:%u",
 					dest, inode->i_ino, dn.ofs_in_node);
 				err = -EFSCORRUPTED;
-				f2fs_handle_error(sbi,
-						ERROR_INVALID_BLKADDR);
 				goto err;
 			}
 
@@ -786,8 +783,10 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 	while (1) {
 		struct fsync_inode_entry *entry;
 
-		if (!f2fs_is_valid_blkaddr(sbi, blkaddr, META_POR))
+		if (!f2fs_is_valid_blkaddr(sbi, blkaddr, META_POR)) {
+			err = -EFSCORRUPTED;
 			break;
+		}
 
 		page = f2fs_get_tmp_page(sbi, blkaddr);
 		if (IS_ERR(page)) {
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 727d016..e427c3c 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -334,8 +334,6 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
 					DATA_GENERIC_ENHANCE)) {
 				f2fs_put_dnode(&dn);
 				ret = -EFSCORRUPTED;
-				f2fs_handle_error(sbi,
-						ERROR_INVALID_BLKADDR);
 				goto out;
 			}
 
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
