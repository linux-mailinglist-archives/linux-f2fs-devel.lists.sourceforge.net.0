Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 929603D2472
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jul 2021 15:16:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6YZD-0003yA-8K; Thu, 22 Jul 2021 13:16:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1m6YZB-0003xu-Lk
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 13:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pvE2NQZPLhnKJ7y8VMUqQnmyeu4NthW1rqSGSUwrYhw=; b=YpxOU+Z5o+sMg/PXTN3VqUwSbt
 KOlYTNMiWPj2VPcAyitTWRpPmB8R8M5jL10DU3kVVYC0f+okQ24eVSqsBd7uw7TL93aQKDaUiMrx9
 iDK48Oz3xEszsPjG6vyayqb9YmnN1gZBwHwIAbHM4mZLU4k3lcKhW4AFb1+hnH2Cfp1E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pvE2NQZPLhnKJ7y8VMUqQnmyeu4NthW1rqSGSUwrYhw=; b=P
 ms3b8b+80yKYBnhLf7mmjdb3cn4pLaAwHmdindq/2YiPn80bZhPh9bLz9g+VOj8gYqGKPaH8w3nOv
 cuUsHov0kultR8byBbjc5eq1N6ZI2rEvmDYccuplEy4aY/w0t9nADGDz9nUJh6CzcdyhMACgCN3hh
 llzX3Xbs1j6XO5hA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6YZ4-00Gr3P-Kt
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 13:16:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E297161289;
 Thu, 22 Jul 2021 13:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626959788;
 bh=8v2TU4zGIPpkNzgv94WFIVeH8QKeMuPy0uxpPbtAId4=;
 h=From:To:Cc:Subject:Date:From;
 b=LvdUZVJhXBmqU4oJov/slrGChQyB4sOss/qCXj/lVJFA+LtiDEWoyuzT5ETHcaCVm
 c8EhjRdd7d3zSHgIKKPXjQbVeFANF/JwkUSX68li+0naglFTusEiJrIcDsY8vfc8r5
 veZiMsnFWXDZ8UjlXUMWxX0ZlO8T44gqNAZotdHfPwjCgXD12FGcWq2oq+XMfAfVog
 rkuNikA/ClPIczBu127yOMJnEfsCDp0nL8sNt2871jlsy5YP93EtjH+/vGFQtcTIbS
 OQuHIkJp1ZdDrL7NXWTyCV+88hRAiXW+XkEfvPUVSSJBoALbHHyvbALKVRMJ3Tn1uO
 U2P4eDc9QASMA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 22 Jul 2021 21:16:17 +0800
Message-Id: <20210722131617.749204-1-chao@kernel.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6YZ4-00Gr3P-Kt
Subject: [f2fs-dev] [PATCH] f2fs: simplify accounting inflight directIO
 request
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
Cc: Chao Yu <chao.yu@linux.dev>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Previously, in order to be aware of inflight direct IOs, we use
sbi->nr_pages[] to account direct IO request, however .nr_pages[]
was used based on page granularity, actually, we just care about
whether there is inflight direct IO, so it will be better to use
separate counters for such purpose.

In addition, this patch simplifies flow of f2fs_dio_submit_bio() and
f2fs_dio_end_io(), and unnecessary memory allocation is avoided.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c  | 47 +++++++++++++----------------------------------
 fs/f2fs/debug.c |  8 ++++----
 fs/f2fs/f2fs.h  | 31 +++++++++++++++++++------------
 fs/f2fs/super.c |  3 +++
 4 files changed, 39 insertions(+), 50 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index ba120d55e9b1..d0a1ca6ae38e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1720,6 +1720,9 @@ static int __get_data_block(struct inode *inode, sector_t iblock,
 		map_bh(bh, inode->i_sb, map.m_pblk);
 		bh->b_state = (bh->b_state & ~F2FS_MAP_FLAGS) | map.m_flags;
 		bh->b_size = blks_to_bytes(inode, map.m_len);
+
+		if (flag == F2FS_GET_BLOCK_DIO)
+			bh->b_private = (void *)may_write;
 	}
 	return err;
 }
@@ -3489,48 +3492,23 @@ static int check_direct_IO(struct inode *inode, struct iov_iter *iter,
 	return 0;
 }
 
-static void f2fs_dio_end_io(struct bio *bio)
+static int f2fs_dio_end_io(struct kiocb *iocb, loff_t offset,
+					ssize_t bytes, void *private)
 {
-	struct f2fs_private_dio *dio = bio->bi_private;
-
-	dec_page_count(F2FS_I_SB(dio->inode),
-			dio->write ? F2FS_DIO_WRITE : F2FS_DIO_READ);
-
-	bio->bi_private = dio->orig_private;
-	bio->bi_end_io = dio->orig_end_io;
-
-	kfree(dio);
+	struct inode *inode = file_inode(iocb->ki_filp);
+	bool may_write = private;
 
-	bio_endio(bio);
+	dec_dio_req_count(F2FS_I_SB(inode), may_write ? WRITE : READ);
+	return 0;
 }
 
 static void f2fs_dio_submit_bio(struct bio *bio, struct inode *inode,
 							loff_t file_offset)
 {
-	struct f2fs_private_dio *dio;
-	bool write = (bio_op(bio) == REQ_OP_WRITE);
-
-	dio = f2fs_kzalloc(F2FS_I_SB(inode),
-			sizeof(struct f2fs_private_dio), GFP_NOFS);
-	if (!dio)
-		goto out;
-
-	dio->inode = inode;
-	dio->orig_end_io = bio->bi_end_io;
-	dio->orig_private = bio->bi_private;
-	dio->write = write;
-
-	bio->bi_end_io = f2fs_dio_end_io;
-	bio->bi_private = dio;
-
-	inc_page_count(F2FS_I_SB(inode),
-			write ? F2FS_DIO_WRITE : F2FS_DIO_READ);
+	inc_dio_req_count(F2FS_I_SB(inode),
+			op_is_write(bio_op(bio)) ? WRITE : READ);
 
 	submit_bio(bio);
-	return;
-out:
-	bio->bi_status = BLK_STS_IOERR;
-	bio_endio(bio);
 }
 
 static ssize_t f2fs_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
@@ -3581,7 +3559,8 @@ static ssize_t f2fs_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
 
 	err = __blockdev_direct_IO(iocb, inode, inode->i_sb->s_bdev,
 			iter, rw == WRITE ? get_data_block_dio_write :
-			get_data_block_dio, NULL, f2fs_dio_submit_bio,
+			get_data_block_dio,
+			f2fs_dio_end_io, f2fs_dio_submit_bio,
 			rw == WRITE ? DIO_LOCKING | DIO_SKIP_HOLES :
 			DIO_SKIP_HOLES);
 
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 53ed1e9191f0..977625b40b20 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -96,8 +96,8 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 	si->vw_cnt = atomic_read(&sbi->vw_cnt);
 	si->max_aw_cnt = atomic_read(&sbi->max_aw_cnt);
 	si->max_vw_cnt = atomic_read(&sbi->max_vw_cnt);
-	si->nr_dio_read = get_pages(sbi, F2FS_DIO_READ);
-	si->nr_dio_write = get_pages(sbi, F2FS_DIO_WRITE);
+	si->nr_dio_req[READ] = atomic_read(&sbi->nr_dio_req[READ]);
+	si->nr_dio_req[WRITE] = atomic_read(&sbi->nr_dio_req[WRITE]);
 	si->nr_wb_cp_data = get_pages(sbi, F2FS_WB_CP_DATA);
 	si->nr_wb_data = get_pages(sbi, F2FS_WB_DATA);
 	si->nr_rd_data = get_pages(sbi, F2FS_RD_DATA);
@@ -482,8 +482,8 @@ static int stat_show(struct seq_file *s, void *v)
 		seq_printf(s, "  - Inner Struct Count: tree: %d(%d), node: %d\n",
 				si->ext_tree, si->zombie_tree, si->ext_node);
 		seq_puts(s, "\nBalancing F2FS Async:\n");
-		seq_printf(s, "  - DIO (R: %4d, W: %4d)\n",
-			   si->nr_dio_read, si->nr_dio_write);
+		seq_printf(s, "  - DIO_REQ (R: %4d, W: %4d)\n",
+			   si->nr_dio_req[READ], si->nr_dio_req[WRITE]);
 		seq_printf(s, "  - IO_R (Data: %4d, Node: %4d, Meta: %4d\n",
 			   si->nr_rd_data, si->nr_rd_node, si->nr_rd_meta);
 		seq_printf(s, "  - IO_W (CP: %4d, Data: %4d, Flush: (%4d %4d %4d), "
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 867f2c5d9559..6781f6d52e0d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1041,8 +1041,6 @@ enum count_type {
 	F2FS_RD_DATA,
 	F2FS_RD_NODE,
 	F2FS_RD_META,
-	F2FS_DIO_WRITE,
-	F2FS_DIO_READ,
 	NR_COUNT_TYPE,
 };
 
@@ -1624,6 +1622,10 @@ struct f2fs_sb_info {
 
 	/* # of pages, see count_type */
 	atomic_t nr_pages[NR_COUNT_TYPE];
+
+	/* # of inflight direct IO request */
+	atomic_t nr_dio_req[2];
+
 	/* # of allocated blocks */
 	struct percpu_counter alloc_valid_block_count;
 
@@ -1755,13 +1757,6 @@ struct f2fs_sb_info {
 #endif
 };
 
-struct f2fs_private_dio {
-	struct inode *inode;
-	void *orig_private;
-	bio_end_io_t *orig_end_io;
-	bool write;
-};
-
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 #define f2fs_show_injection_info(sbi, type)					\
 	printk_ratelimited("%sF2FS-fs (%s) : inject %s in %s of %pS\n",	\
@@ -2281,6 +2276,18 @@ static inline void dec_page_count(struct f2fs_sb_info *sbi, int count_type)
 	atomic_dec(&sbi->nr_pages[count_type]);
 }
 
+static inline void inc_dio_req_count(struct f2fs_sb_info *sbi,
+							unsigned int rw)
+{
+	atomic_inc(&sbi->nr_dio_req[rw]);
+}
+
+static inline void dec_dio_req_count(struct f2fs_sb_info *sbi,
+							unsigned int rw)
+{
+	atomic_dec(&sbi->nr_dio_req[rw]);
+}
+
 static inline void inode_dec_dirty_pages(struct inode *inode)
 {
 	if (!S_ISDIR(inode->i_mode) && !S_ISREG(inode->i_mode) &&
@@ -2609,8 +2616,8 @@ static inline bool is_inflight_io(struct f2fs_sb_info *sbi, int type)
 	if (get_pages(sbi, F2FS_RD_DATA) || get_pages(sbi, F2FS_RD_NODE) ||
 		get_pages(sbi, F2FS_RD_META) || get_pages(sbi, F2FS_WB_DATA) ||
 		get_pages(sbi, F2FS_WB_CP_DATA) ||
-		get_pages(sbi, F2FS_DIO_READ) ||
-		get_pages(sbi, F2FS_DIO_WRITE))
+		atomic_read(&sbi->nr_dio_req[READ]) ||
+		atomic_read(&sbi->nr_dio_req[WRITE]))
 		return true;
 
 	if (type != DISCARD_TIME && SM_I(sbi) && SM_I(sbi)->dcc_info &&
@@ -3688,7 +3695,7 @@ struct f2fs_stat_info {
 	int total_count, utilization;
 	int bg_gc, nr_wb_cp_data, nr_wb_data;
 	int nr_rd_data, nr_rd_node, nr_rd_meta;
-	int nr_dio_read, nr_dio_write;
+	int nr_dio_req[2];
 	unsigned int io_skip_bggc, other_skip_bggc;
 	int nr_flushing, nr_flushed, flush_list_empty;
 	int nr_discarding, nr_discarded;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 72eb9d70969f..9fd7b58ef0a6 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3436,6 +3436,9 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	for (i = 0; i < NR_COUNT_TYPE; i++)
 		atomic_set(&sbi->nr_pages[i], 0);
 
+	atomic_set(&sbi->nr_dio_req[READ], 0);
+	atomic_set(&sbi->nr_dio_req[WRITE], 0);
+
 	for (i = 0; i < META; i++)
 		atomic_set(&sbi->wb_sync_req[i], 0);
 
-- 
2.22.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
