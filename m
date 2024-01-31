Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BBC843431
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jan 2024 03:48:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rV0ef-0001hk-Vp;
	Wed, 31 Jan 2024 02:48:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1rV0ee-0001hd-9r
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jan 2024 02:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x+O2FFKMbUcac6AEWLJpQonajAsX3KY456InJJ1hB6o=; b=WyLvMv1Np6TzyvBUEjIu33SFYT
 rljY5IzCvP6pc9WHoe5RcQQ9HrppR2DktMkurLQG14UZXCTG2IRlI9lYTz/EC8dPDAHT7E5U+4Eno
 JZGaQrPdvpOR6xrtOj8lpWmxU36fgl9MSvVGPt/Embz2KLgACQkZwEC79xNeCBoL8AqY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=x+O2FFKMbUcac6AEWLJpQonajAsX3KY456InJJ1hB6o=; b=V
 l4vJUKr/x3i7BzLeM8pTaaB8GTUfKeFFYNCANgkU8SJLMN2zMjtWt6rb12LasR9fVscf6bEn4o2CQ
 kasjGLi01bKoASds9bQCle/pR9T6f6cguDTXlmC+691tyc4S1M7bFP7r3H5ObT5M9rAENPIHB9vHx
 Y/9YGhDHfIOzp4kc=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rV0eZ-0008NO-7z for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jan 2024 02:48:48 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 40V2m49T092206;
 Wed, 31 Jan 2024 10:48:04 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4TPmVM4hYRz2S7v86;
 Wed, 31 Jan 2024 10:40:27 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Wed, 31 Jan 2024 10:48:02 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 31 Jan 2024 10:43:14 +0800
Message-ID: <1706668994-7384-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS01.spreadtrum.com (10.0.1.201) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 40V2m49T092206
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  There are some cases of f2fs_is_valid_blkaddr not handled
 as ERROR_INVALID_BLKADDR,
 so unify the error handling about all of f2fs_is_valid_blkaddr.
 Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com> --- changes of v2: improve
 patch according Chao's suggestions. changes of v3: -rebase patch to dev-test
 -correct return value for some f2fs_is_valid_b [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rV0eZ-0008NO-7z
Subject: [f2fs-dev] [PATCH v5] f2fs: unify the error handling of
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hongyu.jin@unisoc.com,
 zhiguo.niu@unisoc.com, niuzhiguo84@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There are some cases of f2fs_is_valid_blkaddr not handled as
ERROR_INVALID_BLKADDR,so unify the error handling about all of
f2fs_is_valid_blkaddr.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
changes of v2: improve patch according Chao's suggestions.
changes of v3:
  -rebase patch to dev-test
  -correct return value for some f2fs_is_valid_blkaddr error case
changes of v4: update according to the latest code
changes of v5: improve patch according Jaegeuk's suggestiongs
  -restore return value of some f2fs_is_valid_blkaddr error case to original
  -remove cp_err checking in __is_bitmap_valid becasue it has done in
   if case
  -return true directly for case (type=DATA_GENERIC_ENHANCE_READ) in
   __is_bitmap_valid to avoid meaningless flow
  -rename __is_bitmap_valid to __is_bitmap_check_valid for avoiding ambiguity
   and handling its return value in the caller uniformly, also cooperate
   switch checking true to false in do_recover_data for error case of
   f2fs_is_valid_blkaddr(type=DATA_GENERIC_ENHANCE_UPDATE) for more readable
---
---
 fs/f2fs/checkpoint.c   | 53 +++++++++++++++++++++++---------------------------
 fs/f2fs/data.c         | 22 +++------------------
 fs/f2fs/extent_cache.c |  5 +----
 fs/f2fs/file.c         | 16 +++------------
 fs/f2fs/gc.c           |  2 --
 fs/f2fs/recovery.c     |  6 +-----
 fs/f2fs/segment.c      |  2 --
 7 files changed, 32 insertions(+), 74 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index b85820e..e90fa46 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -134,14 +134,15 @@ struct page *f2fs_get_tmp_page(struct f2fs_sb_info *sbi, pgoff_t index)
 	return __get_meta_page(sbi, index, false);
 }
 
-static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
+static bool __is_bitmap_check_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
 							int type)
 {
 	struct seg_entry *se;
 	unsigned int segno, offset;
 	bool exist;
 
-	if (type == DATA_GENERIC)
+	if (type == DATA_GENERIC ||
+		type == DATA_GENERIC_ENHANCE_READ)
 		return true;
 
 	segno = GET_SEGNO(sbi, blkaddr);
@@ -149,25 +150,16 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
 	se = get_seg_entry(sbi, segno);
 
 	exist = f2fs_test_bit(offset, se->cur_valid_map);
+	if ((exist && type == DATA_GENERIC_ENHANCE_UPDATE) ||
+			(!exist && type == DATA_GENERIC_ENHANCE))
+		goto err;
 
-	/* skip data, if we already have an error in checkpoint. */
-	if (unlikely(f2fs_cp_error(sbi)))
-		return exist;
-
-	if (exist && type == DATA_GENERIC_ENHANCE_UPDATE) {
-		f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
-			 blkaddr, exist);
-		set_sbi_flag(sbi, SBI_NEED_FSCK);
-		return exist;
-	}
-
-	if (!exist && type == DATA_GENERIC_ENHANCE) {
-		f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
-			 blkaddr, exist);
-		set_sbi_flag(sbi, SBI_NEED_FSCK);
-		dump_stack();
-	}
-	return exist;
+	return true;
+err:
+	f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
+		blkaddr, exist);
+	set_sbi_flag(sbi, SBI_NEED_FSCK);
+	return false;
 }
 
 static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
@@ -178,22 +170,22 @@ static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
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
@@ -209,22 +201,25 @@ static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 			f2fs_warn(sbi, "access invalid blkaddr:%u",
 				  blkaddr);
 			set_sbi_flag(sbi, SBI_NEED_FSCK);
-			dump_stack();
-			return false;
-		} else {
-			return __is_bitmap_valid(sbi, blkaddr, type);
+			goto err;
+		} else if (!__is_bitmap_check_valid(sbi, blkaddr, type)) {
+			goto err;
 		}
 		break;
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
+	dump_stack();
+	f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
+	return false;
 }
 
 bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 05158f8..300f9ae 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -738,10 +738,8 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 
 	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
 			fio->is_por ? META_POR : (__is_meta_io(fio) ?
-			META_GENERIC : DATA_GENERIC_ENHANCE))) {
-		f2fs_handle_error(fio->sbi, ERROR_INVALID_BLKADDR);
+			META_GENERIC : DATA_GENERIC_ENHANCE)))
 		return -EFSCORRUPTED;
-	}
 
 	trace_f2fs_submit_page_bio(page, fio);
 
@@ -946,10 +944,8 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 			fio->encrypted_page : fio->page;
 
 	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
-			__is_meta_io(fio) ? META_GENERIC : DATA_GENERIC)) {
-		f2fs_handle_error(fio->sbi, ERROR_INVALID_BLKADDR);
+			__is_meta_io(fio) ? META_GENERIC : DATA_GENERIC))
 		return -EFSCORRUPTED;
-	}
 
 	trace_f2fs_submit_page_bio(page, fio);
 
@@ -1286,8 +1282,6 @@ struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
 		if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), dn.data_blkaddr,
 						DATA_GENERIC_ENHANCE_READ)) {
 			err = -EFSCORRUPTED;
-			f2fs_handle_error(F2FS_I_SB(inode),
-						ERROR_INVALID_BLKADDR);
 			goto put_err;
 		}
 		goto got_it;
@@ -1313,8 +1307,6 @@ struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
 						dn.data_blkaddr,
 						DATA_GENERIC_ENHANCE)) {
 		err = -EFSCORRUPTED;
-		f2fs_handle_error(F2FS_I_SB(inode),
-					ERROR_INVALID_BLKADDR);
 		goto put_err;
 	}
 got_it:
@@ -1642,7 +1634,6 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 	if (!is_hole &&
 	    !f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE)) {
 		err = -EFSCORRUPTED;
-		f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 		goto sync_out;
 	}
 
@@ -2166,8 +2157,6 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 		if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), block_nr,
 						DATA_GENERIC_ENHANCE_READ)) {
 			ret = -EFSCORRUPTED;
-			f2fs_handle_error(F2FS_I_SB(inode),
-						ERROR_INVALID_BLKADDR);
 			goto out;
 		}
 	} else {
@@ -2707,11 +2696,8 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
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
@@ -2739,7 +2725,6 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		!f2fs_is_valid_blkaddr(fio->sbi, fio->old_blkaddr,
 						DATA_GENERIC_ENHANCE)) {
 		err = -EFSCORRUPTED;
-		f2fs_handle_error(fio->sbi, ERROR_INVALID_BLKADDR);
 		goto out_writepage;
 	}
 
@@ -3706,7 +3691,6 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 		if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
 				DATA_GENERIC_ENHANCE_READ)) {
 			err = -EFSCORRUPTED;
-			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 			goto fail;
 		}
 		err = f2fs_submit_page_read(use_cow ?
diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index ad8dfac7..48048fa 100644
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
+	    !f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE))
 		return -EINVAL;
-	}
 out:
 	/*
 	 * init block age with zero, this can happen when the block age extent
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 25b119cf..23cd6a1 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -593,10 +593,8 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 			if (time_to_inject(sbi, FAULT_BLKADDR_CONSISTENCE))
 				continue;
 			if (!f2fs_is_valid_blkaddr_raw(sbi, blkaddr,
-						DATA_GENERIC_ENHANCE)) {
-				f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
+						DATA_GENERIC_ENHANCE))
 				continue;
-			}
 			if (compressed_cluster)
 				valid_blocks++;
 		}
@@ -1196,7 +1194,6 @@ static int __read_out_blkaddrs(struct inode *inode, block_t *blkaddr,
 			!f2fs_is_valid_blkaddr(sbi, *blkaddr,
 					DATA_GENERIC_ENHANCE)) {
 			f2fs_put_dnode(&dn);
-			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 			return -EFSCORRUPTED;
 		}
 
@@ -1482,7 +1479,6 @@ static int f2fs_do_zero_range(struct dnode_of_data *dn, pgoff_t start,
 		if (!f2fs_is_valid_blkaddr(sbi, dn->data_blkaddr,
 					DATA_GENERIC_ENHANCE)) {
 			ret = -EFSCORRUPTED;
-			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 			break;
 		}
 
@@ -3442,10 +3438,8 @@ static int release_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
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
@@ -3607,10 +3601,8 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
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
@@ -3894,8 +3886,6 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 						DATA_GENERIC_ENHANCE)) {
 				ret = -EFSCORRUPTED;
 				f2fs_put_dnode(&dn);
-				f2fs_handle_error(sbi,
-						ERROR_INVALID_BLKADDR);
 				goto out;
 			}
 
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index a079eeb..30e93d8 100644
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
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index aad1d1a..73d81e0 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -693,14 +693,12 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
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
 
@@ -750,13 +748,11 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 				goto err;
 			}
 
-			if (f2fs_is_valid_blkaddr(sbi, dest,
+			if (!f2fs_is_valid_blkaddr(sbi, dest,
 					DATA_GENERIC_ENHANCE_UPDATE)) {
 				f2fs_err(sbi, "Inconsistent dest blkaddr:%u, ino:%lu, ofs:%u",
 					dest, inode->i_ino, dn.ofs_in_node);
 				err = -EFSCORRUPTED;
-				f2fs_handle_error(sbi,
-						ERROR_INVALID_BLKADDR);
 				goto err;
 			}
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 7901ede..ad6511f 100644
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
