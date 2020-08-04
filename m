Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C2823BAEF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Aug 2020 15:15:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k2wnD-00024s-3O; Tue, 04 Aug 2020 13:15:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1k2wn9-00024j-N0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Aug 2020 13:15:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WK4q5LkOF1BRaosY60+MK+0YjnXeGxHlBXbdPgu3XWM=; b=Qw7frlr2O4o6c87dZ8GunNrxdZ
 +yE1Qy0thownVb5Tn4xqL3eITQV23VQ2h7xMeluahxHIUdRN8LFxTpW5RyDIzsXrDEK7ZplPbGSwX
 WysIM/vTVxdm3Z+ikN2URh1us6QuaG9vww309ANj83NPx2GgDnUkxad9P3+PWcYG8nyc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WK4q5LkOF1BRaosY60+MK+0YjnXeGxHlBXbdPgu3XWM=; b=Q20vQ5HFpv3PBh3hDJysSstqZB
 7bl45bVgSYynkDnItsX+jpAKKrUFePikKbV6/1k9QMtZbQYeCAGOmOa61TnW7agOfm6GIcX+WxPYF
 LenwT9l9Z+HMcXZqurS8+oE94WFPYYOyWfzQIf6kF7DD3TWAD9o0w3AqwiaiIgunhvDg=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k2wn4-00302j-Sc
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Aug 2020 13:15:43 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5F7BC79A6AA685987555;
 Tue,  4 Aug 2020 21:15:28 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Tue, 4 Aug 2020 21:15:17 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 4 Aug 2020 21:14:47 +0800
Message-ID: <20200804131449.50517-4-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200804131449.50517-1-yuchao0@huawei.com>
References: <20200804131449.50517-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.8 (/)
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
 -0.8 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k2wn4-00302j-Sc
Subject: [f2fs-dev] [PATCH v2 3/5] f2fs: inherit mtime of original block
 during GC
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

Don't let f2fs inner GC ruins original aging degree of segment.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c    |  2 +-
 fs/f2fs/f2fs.h    |  5 +++--
 fs/f2fs/gc.c      |  4 ++--
 fs/f2fs/segment.c | 56 +++++++++++++++++++++++++++++++++++++----------
 4 files changed, 50 insertions(+), 17 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c1b676be67b9..2b2bfda756a8 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1368,7 +1368,7 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
 	set_summary(&sum, dn->nid, dn->ofs_in_node, ni.version);
 	old_blkaddr = dn->data_blkaddr;
 	f2fs_allocate_data_block(sbi, NULL, old_blkaddr, &dn->data_blkaddr,
-					&sum, seg_type, NULL);
+				&sum, seg_type, NULL, false);
 	if (GET_SEGNO(sbi, old_blkaddr) != NULL_SEGNO)
 		invalidate_mapping_pages(META_MAPPING(sbi),
 					old_blkaddr, old_blkaddr);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 784de42a9f9c..20da627249c0 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3356,7 +3356,8 @@ void f2fs_outplace_write_data(struct dnode_of_data *dn,
 int f2fs_inplace_write_data(struct f2fs_io_info *fio);
 void f2fs_do_replace_block(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 			block_t old_blkaddr, block_t new_blkaddr,
-			bool recover_curseg, bool recover_newaddr);
+			bool recover_curseg, bool recover_newaddr,
+			bool from_gc);
 void f2fs_replace_block(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
 			block_t old_addr, block_t new_addr,
 			unsigned char version, bool recover_curseg,
@@ -3364,7 +3365,7 @@ void f2fs_replace_block(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
 void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 			block_t old_blkaddr, block_t *new_blkaddr,
 			struct f2fs_summary *sum, int type,
-			struct f2fs_io_info *fio);
+			struct f2fs_io_info *fio, bool from_gc);
 void f2fs_wait_on_page_writeback(struct page *page,
 			enum page_type type, bool ordered, bool locked);
 void f2fs_wait_on_block_writeback(struct inode *inode, block_t blkaddr);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 755641047978..da187aec988f 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -877,7 +877,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 	}
 
 	f2fs_allocate_data_block(fio.sbi, NULL, fio.old_blkaddr, &newaddr,
-					&sum, CURSEG_COLD_DATA, NULL);
+				&sum, CURSEG_COLD_DATA, NULL, true);
 
 	fio.encrypted_page = f2fs_pagecache_get_page(META_MAPPING(fio.sbi),
 				newaddr, FGP_LOCK | FGP_CREAT, GFP_NOFS);
@@ -927,7 +927,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 recover_block:
 	if (err)
 		f2fs_do_replace_block(fio.sbi, &sum, newaddr, fio.old_blkaddr,
-								true, true);
+							true, true, true);
 up_out:
 	if (lfs_mode)
 		up_write(&fio.sbi->io_order_lock);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 3b9479cba1ef..503d7799ea88 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2150,11 +2150,28 @@ static void __set_sit_entry_type(struct f2fs_sb_info *sbi, int type,
 		__mark_sit_entry_dirty(sbi, segno);
 }
 
-static void update_segment_mtime(struct f2fs_sb_info *sbi, block_t blkaddr)
+static inline unsigned long long get_segment_mtime(struct f2fs_sb_info *sbi,
+								block_t blkaddr)
 {
 	unsigned int segno = GET_SEGNO(sbi, blkaddr);
-	struct seg_entry *se = get_seg_entry(sbi, segno);
-	unsigned long long mtime = get_mtime(sbi, false);
+
+	if (segno == NULL_SEGNO)
+		return 0;
+	return get_seg_entry(sbi, segno)->mtime;
+}
+
+static void update_segment_mtime(struct f2fs_sb_info *sbi, block_t blkaddr,
+						unsigned long long old_mtime)
+{
+	struct seg_entry *se;
+	unsigned int segno = GET_SEGNO(sbi, blkaddr);
+	unsigned long long ctime = get_mtime(sbi, false);
+	unsigned long long mtime = old_mtime ? old_mtime : ctime;
+
+	if (segno == NULL_SEGNO)
+		return;
+
+	se = get_seg_entry(sbi, segno);
 
 	if (!se->mtime)
 		se->mtime = mtime;
@@ -2162,8 +2179,8 @@ static void update_segment_mtime(struct f2fs_sb_info *sbi, block_t blkaddr)
 		se->mtime = div_u64(se->mtime * se->valid_blocks + mtime,
 						se->valid_blocks + 1);
 
-	if (mtime > SIT_I(sbi)->max_mtime)
-		SIT_I(sbi)->max_mtime = mtime;
+	if (ctime > SIT_I(sbi)->max_mtime)
+		SIT_I(sbi)->max_mtime = ctime;
 }
 
 static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
@@ -2185,8 +2202,6 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 	f2fs_bug_on(sbi, (new_vblocks < 0 ||
 				(new_vblocks > sbi->blocks_per_seg)));
 
-	update_segment_mtime(sbi, blkaddr);
-
 	se->valid_blocks = new_vblocks;
 
 	/* Update valid block bitmap */
@@ -2280,6 +2295,7 @@ void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr)
 	/* add it into sit main buffer */
 	down_write(&sit_i->sentry_lock);
 
+	update_segment_mtime(sbi, addr, 0);
 	update_sit_entry(sbi, addr, -1);
 
 	/* add it into dirty seglist */
@@ -3188,10 +3204,11 @@ static int __get_segment_type(struct f2fs_io_info *fio)
 void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 		block_t old_blkaddr, block_t *new_blkaddr,
 		struct f2fs_summary *sum, int type,
-		struct f2fs_io_info *fio)
+		struct f2fs_io_info *fio, bool from_gc)
 {
 	struct sit_info *sit_i = SIT_I(sbi);
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
+	unsigned long long old_mtime;
 
 	down_read(&SM_I(sbi)->curseg_lock);
 
@@ -3213,6 +3230,14 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 
 	stat_inc_block_count(sbi, curseg);
 
+	if (from_gc) {
+		old_mtime = get_segment_mtime(sbi, old_blkaddr);
+	} else {
+		update_segment_mtime(sbi, old_blkaddr, 0);
+		old_mtime = 0;
+	}
+	update_segment_mtime(sbi, *new_blkaddr, old_mtime);
+
 	/*
 	 * SIT information should be updated before segment allocation,
 	 * since SSR needs latest valid block information.
@@ -3289,7 +3314,8 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 		down_read(&fio->sbi->io_order_lock);
 reallocate:
 	f2fs_allocate_data_block(fio->sbi, fio->page, fio->old_blkaddr,
-			&fio->new_blkaddr, sum, type, fio);
+			&fio->new_blkaddr, sum, type, fio,
+			is_cold_data(fio->page));
 	if (GET_SEGNO(fio->sbi, fio->old_blkaddr) != NULL_SEGNO)
 		invalidate_mapping_pages(META_MAPPING(fio->sbi),
 					fio->old_blkaddr, fio->old_blkaddr);
@@ -3405,7 +3431,8 @@ static inline int __f2fs_get_curseg(struct f2fs_sb_info *sbi,
 
 void f2fs_do_replace_block(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 				block_t old_blkaddr, block_t new_blkaddr,
-				bool recover_curseg, bool recover_newaddr)
+				bool recover_curseg, bool recover_newaddr,
+				bool from_gc)
 {
 	struct sit_info *sit_i = SIT_I(sbi);
 	struct curseg_info *curseg;
@@ -3456,11 +3483,16 @@ void f2fs_do_replace_block(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	curseg->next_blkoff = GET_BLKOFF_FROM_SEG0(sbi, new_blkaddr);
 	__add_sum_entry(sbi, type, sum);
 
-	if (!recover_curseg || recover_newaddr)
+	if (!recover_curseg || recover_newaddr) {
+		if (!from_gc)
+			update_segment_mtime(sbi, new_blkaddr, 0);
 		update_sit_entry(sbi, new_blkaddr, 1);
+	}
 	if (GET_SEGNO(sbi, old_blkaddr) != NULL_SEGNO) {
 		invalidate_mapping_pages(META_MAPPING(sbi),
 					old_blkaddr, old_blkaddr);
+		if (!from_gc)
+			update_segment_mtime(sbi, old_blkaddr, 0);
 		update_sit_entry(sbi, old_blkaddr, -1);
 	}
 
@@ -3492,7 +3524,7 @@ void f2fs_replace_block(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
 	set_summary(&sum, dn->nid, dn->ofs_in_node, version);
 
 	f2fs_do_replace_block(sbi, &sum, old_addr, new_addr,
-					recover_curseg, recover_newaddr);
+					recover_curseg, recover_newaddr, false);
 
 	f2fs_update_data_blkaddr(dn, new_addr);
 }
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
