Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF3B1FEB86
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2020 08:37:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jloAc-0008Ng-7n; Thu, 18 Jun 2020 06:37:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jloAa-0008ND-V0
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 06:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0BpEIeEppX2mX6BSYGDwPXneg5/sq8ycgRsTdl4JeyY=; b=JRVqxB6vPyLCAqNN7uYFOt5Gyg
 +txawUWkxxZs9n9g35k1/cdypSHlYMp1+AYAotRruA847Tgc7q49z4BZGZjK6DL4hsqkvbhyIi1Ua
 p1jo9n5GYBPOJUCW8MyLQyyZrAoDlQI5zk/1g+bnjufiSNPmt7UNRB9JnE/dym8K9ZSU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0BpEIeEppX2mX6BSYGDwPXneg5/sq8ycgRsTdl4JeyY=; b=ZSv/JW+pvVg8o6K+q4QP4T5KEM
 IMRDzeogxbj2DkM/oMQ9Ok13+YB7B0m5u6+32FvVH4vkz+bgA541vXcLYjGdGTeIIo+jBqTkpGMGc
 bXuOriVdoLrVhs73PBFVGP01jfVfLG977nZPgjVQPPpKecMEmzkZfTMsnPh3kCLcOInw=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jloAZ-007xlb-J4
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 06:37:04 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 7405A757C8AE3F8E0EF6;
 Thu, 18 Jun 2020 14:36:40 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Thu, 18 Jun 2020 14:36:31 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 18 Jun 2020 14:36:22 +0800
Message-ID: <20200618063625.110273-2-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20200618063625.110273-1-yuchao0@huawei.com>
References: <20200618063625.110273-1-yuchao0@huawei.com>
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
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jloAZ-007xlb-J4
Subject: [f2fs-dev] [PATCH 2/5] f2fs: add prefix for exported symbols
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

to avoid polluting global symbol namespace.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c |  4 ++--
 fs/f2fs/data.c     | 14 +++++++-------
 fs/f2fs/f2fs.h     |  4 ++--
 fs/f2fs/file.c     |  4 ++--
 fs/f2fs/gc.c       |  2 +-
 fs/f2fs/segment.c  |  2 +-
 6 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 1e02a8c106b0..36b51795b0c3 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -949,7 +949,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 	}
 
 	if (prealloc) {
-		__do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, true);
+		f2fs_do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, true);
 
 		set_new_dnode(&dn, cc->inode, NULL, NULL, 0);
 
@@ -964,7 +964,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 				break;
 		}
 
-		__do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, false);
+		f2fs_do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, false);
 	}
 
 	if (likely(!ret)) {
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 326c63879ddc..c78ce08f6400 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1426,7 +1426,7 @@ int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from)
 	return err;
 }
 
-void __do_map_lock(struct f2fs_sb_info *sbi, int flag, bool lock)
+void f2fs_do_map_lock(struct f2fs_sb_info *sbi, int flag, bool lock)
 {
 	if (flag == F2FS_GET_BLOCK_PRE_AIO) {
 		if (lock)
@@ -1491,7 +1491,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 
 next_dnode:
 	if (map->m_may_create)
-		__do_map_lock(sbi, flag, true);
+		f2fs_do_map_lock(sbi, flag, true);
 
 	/* When reading holes, we need its node page */
 	set_new_dnode(&dn, inode, NULL, NULL, 0);
@@ -1640,7 +1640,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 	f2fs_put_dnode(&dn);
 
 	if (map->m_may_create) {
-		__do_map_lock(sbi, flag, false);
+		f2fs_do_map_lock(sbi, flag, false);
 		f2fs_balance_fs(sbi, dn.node_changed);
 	}
 	goto next_dnode;
@@ -1666,7 +1666,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 	f2fs_put_dnode(&dn);
 unlock_out:
 	if (map->m_may_create) {
-		__do_map_lock(sbi, flag, false);
+		f2fs_do_map_lock(sbi, flag, false);
 		f2fs_balance_fs(sbi, dn.node_changed);
 	}
 out:
@@ -3217,7 +3217,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 
 	if (f2fs_has_inline_data(inode) ||
 			(pos & PAGE_MASK) >= i_size_read(inode)) {
-		__do_map_lock(sbi, flag, true);
+		f2fs_do_map_lock(sbi, flag, true);
 		locked = true;
 	}
 
@@ -3254,7 +3254,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 			err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
 			if (err || dn.data_blkaddr == NULL_ADDR) {
 				f2fs_put_dnode(&dn);
-				__do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO,
+				f2fs_do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO,
 								true);
 				WARN_ON(flag != F2FS_GET_BLOCK_PRE_AIO);
 				locked = true;
@@ -3270,7 +3270,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 	f2fs_put_dnode(&dn);
 unlock_out:
 	if (locked)
-		__do_map_lock(sbi, flag, false);
+		f2fs_do_map_lock(sbi, flag, false);
 	return err;
 }
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 326c12fa0da5..b74f0f5fcf3a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3325,7 +3325,7 @@ block_t f2fs_get_unusable_blocks(struct f2fs_sb_info *sbi);
 int f2fs_disable_cp_again(struct f2fs_sb_info *sbi, block_t unusable);
 void f2fs_release_discard_addrs(struct f2fs_sb_info *sbi);
 int f2fs_npages_for_summary_flush(struct f2fs_sb_info *sbi, bool for_ra);
-void allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
+void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
 					unsigned int start, unsigned int end);
 void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi, int type);
 int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range);
@@ -3448,7 +3448,7 @@ struct page *f2fs_get_lock_data_page(struct inode *inode, pgoff_t index,
 struct page *f2fs_get_new_data_page(struct inode *inode,
 			struct page *ipage, pgoff_t index, bool new_i_size);
 int f2fs_do_write_data_page(struct f2fs_io_info *fio);
-void __do_map_lock(struct f2fs_sb_info *sbi, int flag, bool lock);
+void f2fs_do_map_lock(struct f2fs_sb_info *sbi, int flag, bool lock);
 int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 			int create, int flag);
 int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 1862073b96d2..9d95e3bd4dfe 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -105,11 +105,11 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 
 	if (need_alloc) {
 		/* block allocation */
-		__do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, true);
+		f2fs_do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, true);
 		set_new_dnode(&dn, inode, NULL, NULL, 0);
 		err = f2fs_get_block(&dn, page->index);
 		f2fs_put_dnode(&dn);
-		__do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, false);
+		f2fs_do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, false);
 	}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 5b95d5a146eb..3d27b939627e 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1434,7 +1434,7 @@ static int free_segment_range(struct f2fs_sb_info *sbi,
 
 	/* Move out cursegs from the target range */
 	for (type = CURSEG_HOT_DATA; type < NR_CURSEG_TYPE; type++)
-		allocate_segment_for_resize(sbi, type, start, end);
+		f2fs_allocate_segment_for_resize(sbi, type, start, end);
 
 	/* do GC to move out valid blocks in the range */
 	for (segno = start; segno <= end; segno += sbi->segs_per_sec) {
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 196f31503511..5b2a6f865a6d 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2674,7 +2674,7 @@ static void allocate_segment_by_default(struct f2fs_sb_info *sbi,
 	stat_inc_seg_type(sbi, curseg);
 }
 
-void allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
+void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
 					unsigned int start, unsigned int end)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
