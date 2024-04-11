Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFFC8A0B33
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Apr 2024 10:32:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rupr1-0004G1-8w;
	Thu, 11 Apr 2024 08:32:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rupqz-0004Fr-0x
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Apr 2024 08:32:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rAQV5uEH0amfUfwyOjdeNbK8Ol3/jLOkHz3X9090iXU=; b=iB3JyOv0Le30w7HirNjImiJWIV
 2G44jkvtndH/DmUb9/5A03Zj76Cft1bU+4RJr3gRyVau7OSIS4nx48TxOHXuzQECfW3HNyamvt8ls
 l2UMEgP5nDB1CinqiDmUyDqw4XzEoSGghh3KpoffNxfI3LJV9X/ZGRyRFtb2j7COlGbM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rAQV5uEH0amfUfwyOjdeNbK8Ol3/jLOkHz3X9090iXU=; b=M
 rli88Q5oMBzA5rlFsBChaJNaC3cXdviop53cVJHrbWkrZp5Q3Y3loAx8/r/vJ3t0Fo0+NaKUaJT3b
 hiqgSdr0hCOxC54uj2yj2H3kptMbrLQr/7hx6Z2fqhDC2ndEla6SS9BFxBU3SN/3sEIFfc3CrFdwY
 V9BRFEyT1vmYIj+4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rupqw-0004l7-Rg for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Apr 2024 08:32:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DAFA661FF9;
 Thu, 11 Apr 2024 08:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE24C43143;
 Thu, 11 Apr 2024 08:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712824323;
 bh=8CnZu/P7ezG953qbXc/j+1UaFAQnOhMj1kw+TDe9YQE=;
 h=From:To:Cc:Subject:Date:From;
 b=IrYYYF3QejJx79zYSiSnEGt1mXhc1uUa41zBcG5fRsy2OP+jOlvvHOHUmIBJy9vUH
 +Y6IRFaO3JL6Np5G2DqW1aa7E1GWMtW5s9v61WlZEbLs/0fRa/jP2Jpsco+7AcSj46
 FHLQK+yDrPs22ahjQhIBHrsp76rsu55BpjuvzaPs6fidm5gRlMQ/7mIJXuv3OCdpxI
 xglADuGeDy0x8Uj9guZqB8qXSzg8kOYGnN4SavD0UPJHb8e5l6kTB8UqUWb9RvK5Ui
 PdliYUac1y2eTqsCAChuQWrfl4P9ag9/7aFzHYv8btIpVkAH9rl4ZvT4xisRXm4F/J
 wWGET/4xEjtVw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 11 Apr 2024 16:31:53 +0800
Message-Id: <20240411083153.1697156-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  max open zone may be larger than log header number of f2fs, 
 for such case, it doesn't need to wait last IO in previous zone,
 let's introduce
 available_open_zone semaphore, and reduce it once we submit [...] 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rupqw-0004l7-Rg
Subject: [f2fs-dev] [PATCH v4] f2fs: zone: don't block IO if there is
 remained open zone
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

max open zone may be larger than log header number of f2fs, for
such case, it doesn't need to wait last IO in previous zone, let's
introduce available_open_zone semaphore, and reduce it once we
submit first write IO in a zone, and increase it after completion
of last IO in the zone.

Cc: Daeho Jeong <daeho43@gmail.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v4:
- avoid unneeded condition in f2fs_blkzoned_submit_merged_write().
 fs/f2fs/data.c    | 105 ++++++++++++++++++++++++++++++----------------
 fs/f2fs/f2fs.h    |  34 ++++++++++++---
 fs/f2fs/iostat.c  |   7 ++++
 fs/f2fs/iostat.h  |   2 +
 fs/f2fs/segment.c |  43 ++++++++++++++++---
 fs/f2fs/segment.h |  12 +++++-
 fs/f2fs/super.c   |   2 +
 7 files changed, 156 insertions(+), 49 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 60056b9a51be..71472ab6b7e7 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -373,11 +373,10 @@ static void f2fs_write_end_io(struct bio *bio)
 #ifdef CONFIG_BLK_DEV_ZONED
 static void f2fs_zone_write_end_io(struct bio *bio)
 {
-	struct f2fs_bio_info *io = (struct f2fs_bio_info *)bio->bi_private;
+	struct f2fs_sb_info *sbi = iostat_get_bio_private(bio);
 
-	bio->bi_private = io->bi_private;
-	complete(&io->zone_wait);
 	f2fs_write_end_io(bio);
+	up(&sbi->available_open_zones);
 }
 #endif
 
@@ -531,6 +530,24 @@ static void __submit_merged_bio(struct f2fs_bio_info *io)
 	if (!io->bio)
 		return;
 
+#ifdef CONFIG_BLK_DEV_ZONED
+	if (io->open_zone) {
+		/*
+		 * if there is no open zone, it will wait for last IO in
+		 * previous zone before submitting new IO.
+		 */
+		down(&fio->sbi->available_open_zones);
+		io->open_zone = false;
+		io->zone_openned = true;
+	}
+
+	if (io->close_zone) {
+		io->bio->bi_end_io = f2fs_zone_write_end_io;
+		io->zone_openned = false;
+		io->close_zone = false;
+	}
+#endif
+
 	if (is_read_io(fio->op)) {
 		trace_f2fs_prepare_read_bio(io->sbi->sb, fio->type, io->bio);
 		f2fs_submit_read_bio(io->sbi, io->bio, fio->type);
@@ -601,9 +618,9 @@ int f2fs_init_write_merge_io(struct f2fs_sb_info *sbi)
 			INIT_LIST_HEAD(&sbi->write_io[i][j].bio_list);
 			init_f2fs_rwsem(&sbi->write_io[i][j].bio_list_lock);
 #ifdef CONFIG_BLK_DEV_ZONED
-			init_completion(&sbi->write_io[i][j].zone_wait);
-			sbi->write_io[i][j].zone_pending_bio = NULL;
-			sbi->write_io[i][j].bi_private = NULL;
+			sbi->write_io[i][j].open_zone = false;
+			sbi->write_io[i][j].zone_openned = false;
+			sbi->write_io[i][j].close_zone = false;
 #endif
 		}
 	}
@@ -634,6 +651,31 @@ static void __f2fs_submit_merged_write(struct f2fs_sb_info *sbi,
 	f2fs_up_write(&io->io_rwsem);
 }
 
+void f2fs_blkzoned_submit_merged_write(struct f2fs_sb_info *sbi, int type)
+{
+#ifdef CONFIG_BLK_DEV_ZONED
+	struct f2fs_bio_info *io;
+
+	if (!f2fs_sb_has_blkzoned(sbi))
+		return;
+
+	io = sbi->write_io[PAGE_TYPE(type)] + type_to_temp(type);
+
+	f2fs_down_write(&io->io_rwsem);
+	if (io->zone_openned) {
+		if (io->bio) {
+			io->close_zone = true;
+			__submit_merged_bio(io);
+		} else {
+			up(&sbi->available_open_zones);
+			io->zone_openned = false;
+		}
+	}
+	f2fs_up_write(&io->io_rwsem);
+#endif
+
+}
+
 static void __submit_merged_write_cond(struct f2fs_sb_info *sbi,
 				struct inode *inode, struct page *page,
 				nid_t ino, enum page_type type, bool force)
@@ -918,22 +960,16 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 }
 
 #ifdef CONFIG_BLK_DEV_ZONED
-static bool is_end_zone_blkaddr(struct f2fs_sb_info *sbi, block_t blkaddr)
+static bool is_blkaddr_zone_boundary(struct f2fs_sb_info *sbi,
+					block_t blkaddr, bool start)
 {
-	int devi = 0;
+	if (!f2fs_blkaddr_in_seqzone(sbi, blkaddr))
+		return false;
+
+	if (start)
+		return (blkaddr % sbi->blocks_per_blkz) == 0;
+	return (blkaddr % sbi->blocks_per_blkz == sbi->blocks_per_blkz - 1);
 
-	if (f2fs_is_multi_device(sbi)) {
-		devi = f2fs_target_device_index(sbi, blkaddr);
-		if (blkaddr < FDEV(devi).start_blk ||
-		    blkaddr > FDEV(devi).end_blk) {
-			f2fs_err(sbi, "Invalid block %x", blkaddr);
-			return false;
-		}
-		blkaddr -= FDEV(devi).start_blk;
-	}
-	return bdev_is_zoned(FDEV(devi).bdev) &&
-		f2fs_blkz_is_seq(sbi, devi, blkaddr) &&
-		(blkaddr % sbi->blocks_per_blkz == sbi->blocks_per_blkz - 1);
 }
 #endif
 
@@ -944,20 +980,14 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	struct f2fs_bio_info *io = sbi->write_io[btype] + fio->temp;
 	struct page *bio_page;
 	enum count_type type;
+#ifdef CONFIG_BLK_DEV_ZONED
+	bool blkzoned = f2fs_sb_has_blkzoned(sbi) && btype < META;
+#endif
 
 	f2fs_bug_on(sbi, is_read_io(fio->op));
 
 	f2fs_down_write(&io->io_rwsem);
 next:
-#ifdef CONFIG_BLK_DEV_ZONED
-	if (f2fs_sb_has_blkzoned(sbi) && btype < META && io->zone_pending_bio) {
-		wait_for_completion_io(&io->zone_wait);
-		bio_put(io->zone_pending_bio);
-		io->zone_pending_bio = NULL;
-		io->bi_private = NULL;
-	}
-#endif
-
 	if (fio->in_list) {
 		spin_lock(&io->io_lock);
 		if (list_empty(&io->io_list)) {
@@ -985,6 +1015,11 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	type = WB_DATA_TYPE(bio_page, fio->compressed_page);
 	inc_page_count(sbi, type);
 
+#ifdef CONFIG_BLK_DEV_ZONED
+	if (blkzoned && is_blkaddr_zone_boundary(sbi, fio->new_blkaddr, true))
+		io->open_zone = true;
+#endif
+
 	if (io->bio &&
 	    (!io_is_mergeable(sbi, io->bio, io, fio, io->last_block_in_bio,
 			      fio->new_blkaddr) ||
@@ -1010,15 +1045,11 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	io->last_block_in_bio = fio->new_blkaddr;
 
 	trace_f2fs_submit_page_write(fio->page, fio);
+
 #ifdef CONFIG_BLK_DEV_ZONED
-	if (f2fs_sb_has_blkzoned(sbi) && btype < META &&
-			is_end_zone_blkaddr(sbi, fio->new_blkaddr)) {
-		bio_get(io->bio);
-		reinit_completion(&io->zone_wait);
-		io->bi_private = io->bio->bi_private;
-		io->bio->bi_private = io;
-		io->bio->bi_end_io = f2fs_zone_write_end_io;
-		io->zone_pending_bio = io->bio;
+	if (blkzoned &&
+		is_blkaddr_zone_boundary(sbi, fio->new_blkaddr, false)) {
+		io->close_zone = true;
 		__submit_merged_bio(io);
 	}
 #endif
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e9ef971f4dba..4cc20e49c18c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1232,16 +1232,16 @@ struct f2fs_bio_info {
 	struct bio *bio;		/* bios to merge */
 	sector_t last_block_in_bio;	/* last block number */
 	struct f2fs_io_info fio;	/* store buffered io info. */
-#ifdef CONFIG_BLK_DEV_ZONED
-	struct completion zone_wait;	/* condition value for the previous open zone to close */
-	struct bio *zone_pending_bio;	/* pending bio for the previous zone */
-	void *bi_private;		/* previous bi_private for pending bio */
-#endif
 	struct f2fs_rwsem io_rwsem;	/* blocking op for bio */
 	spinlock_t io_lock;		/* serialize DATA/NODE IOs */
 	struct list_head io_list;	/* track fios */
 	struct list_head bio_list;	/* bio entry list head */
 	struct f2fs_rwsem bio_list_lock;	/* lock to protect bio entry list */
+#ifdef CONFIG_BLK_DEV_ZONED
+	bool open_zone;			/* open a zone */
+	bool zone_openned;		/* zone has been openned */
+	bool close_zone;		/* close a zone */
+#endif
 };
 
 #define FDEV(i)				(sbi->devs[i])
@@ -1558,6 +1558,7 @@ struct f2fs_sb_info {
 #ifdef CONFIG_BLK_DEV_ZONED
 	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
 	unsigned int max_open_zones;		/* max open zone resources of the zoned device */
+	struct semaphore available_open_zones;	/* available open zones */
 #endif
 
 	/* for node-related operations */
@@ -3820,6 +3821,7 @@ void f2fs_destroy_bio_entry_cache(void);
 void f2fs_submit_read_bio(struct f2fs_sb_info *sbi, struct bio *bio,
 			  enum page_type type);
 int f2fs_init_write_merge_io(struct f2fs_sb_info *sbi);
+void f2fs_blkzoned_submit_merged_write(struct f2fs_sb_info *sbi, int type);
 void f2fs_submit_merged_write(struct f2fs_sb_info *sbi, enum page_type type);
 void f2fs_submit_merged_write_cond(struct f2fs_sb_info *sbi,
 				struct inode *inode, struct page *page,
@@ -4467,6 +4469,28 @@ static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
 
 	return test_bit(zno, FDEV(devi).blkz_seq);
 }
+
+static inline bool f2fs_blkaddr_in_seqzone(struct f2fs_sb_info *sbi,
+							block_t blkaddr)
+{
+	int devi = 0;
+
+	if (f2fs_is_multi_device(sbi)) {
+		devi = f2fs_target_device_index(sbi, blkaddr);
+		if (blkaddr < FDEV(devi).start_blk ||
+		    blkaddr > FDEV(devi).end_blk) {
+			f2fs_err(sbi, "Invalid block %x", blkaddr);
+			return false;
+		}
+		blkaddr -= FDEV(devi).start_blk;
+	}
+
+	if (!bdev_is_zoned(FDEV(devi).bdev) ||
+		!f2fs_blkz_is_seq(sbi, devi, blkaddr))
+		return false;
+
+	return true;
+}
 #endif
 
 static inline int f2fs_bdev_index(struct f2fs_sb_info *sbi,
diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
index f8703038e1d8..a8626e297876 100644
--- a/fs/f2fs/iostat.c
+++ b/fs/f2fs/iostat.c
@@ -237,6 +237,13 @@ static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx,
 	spin_unlock_irqrestore(&sbi->iostat_lat_lock, flags);
 }
 
+void *iostat_get_bio_private(struct bio *bio)
+{
+	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
+
+	return iostat_ctx->sbi;
+}
+
 void iostat_update_and_unbind_ctx(struct bio *bio)
 {
 	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
diff --git a/fs/f2fs/iostat.h b/fs/f2fs/iostat.h
index eb99d05cf272..9006c3d41590 100644
--- a/fs/f2fs/iostat.h
+++ b/fs/f2fs/iostat.h
@@ -58,6 +58,7 @@ static inline struct bio_post_read_ctx *get_post_read_ctx(struct bio *bio)
 	return iostat_ctx->post_read_ctx;
 }
 
+extern void *iostat_get_bio_private(struct bio *bio);
 extern void iostat_update_and_unbind_ctx(struct bio *bio);
 extern void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
 		struct bio *bio, struct bio_post_read_ctx *ctx);
@@ -68,6 +69,7 @@ extern void f2fs_destroy_iostat(struct f2fs_sb_info *sbi);
 #else
 static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
 		enum iostat_type type, unsigned long long io_bytes) {}
+static inline void *iostat_get_bio_private(struct bio *bio) { return bio->bi_private; }
 static inline void iostat_update_and_unbind_ctx(struct bio *bio) {}
 static inline void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
 		struct bio *bio, struct bio_post_read_ctx *ctx) {}
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 6474b7338e81..58cce79156bf 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3140,6 +3140,9 @@ static int __allocate_new_segment(struct f2fs_sb_info *sbi, int type,
 		return err;
 	stat_inc_seg_type(sbi, curseg);
 	locate_dirty_segment(sbi, old_segno);
+
+	f2fs_blkzoned_submit_merged_write(sbi, type);
+
 	return 0;
 }
 
@@ -3461,12 +3464,7 @@ static int __get_segment_type(struct f2fs_io_info *fio)
 		f2fs_bug_on(fio->sbi, true);
 	}
 
-	if (IS_HOT(type))
-		fio->temp = HOT;
-	else if (IS_WARM(type))
-		fio->temp = WARM;
-	else
-		fio->temp = COLD;
+	fio->temp = type_to_temp(type);
 	return type;
 }
 
@@ -4134,6 +4132,27 @@ static int restore_curseg_summaries(struct f2fs_sb_info *sbi)
 		return -EINVAL;
 	}
 
+#ifdef CONFIG_BLK_DEV_ZONED
+	if (f2fs_sb_has_blkzoned(sbi)) {
+		for (type = 0; type < NR_PERSISTENT_LOG; type++) {
+			struct curseg_info *curseg = CURSEG_I(sbi, type);
+			enum page_type ptype;
+			enum temp_type temp;
+
+			if (!(curseg->next_blkoff % sbi->blocks_per_blkz))
+				continue;
+
+			if (!f2fs_blkaddr_in_seqzone(sbi,
+					START_BLOCK(sbi, curseg->segno)))
+				continue;
+
+			ptype = PAGE_TYPE(type);
+			temp = type_to_temp(type);
+			down(&sbi->available_open_zones);
+			sbi->write_io[ptype][temp].zone_openned = true;
+		}
+	}
+#endif
 	return 0;
 }
 
@@ -5453,6 +5472,18 @@ static void destroy_curseg(struct f2fs_sb_info *sbi)
 	for (i = 0; i < NR_CURSEG_TYPE; i++) {
 		kfree(array[i].sum_blk);
 		kfree(array[i].journal);
+
+#ifdef CONFIG_BLK_DEV_ZONED
+		if (f2fs_sb_has_blkzoned(sbi)) {
+			enum page_type ptype = PAGE_TYPE(i);
+			enum temp_type temp = type_to_temp(i);
+
+			if (sbi->write_io[ptype][temp].zone_openned) {
+				up(&sbi->available_open_zones);
+				sbi->write_io[ptype][temp].zone_openned = false;
+			}
+		}
+#endif
 	}
 	kfree(array);
 }
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index e1c0f418aa11..855978ca869f 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -24,7 +24,8 @@
 
 #define IS_DATASEG(t)	((t) <= CURSEG_COLD_DATA)
 #define IS_NODESEG(t)	((t) >= CURSEG_HOT_NODE && (t) <= CURSEG_COLD_NODE)
-#define SE_PAGETYPE(se)	((IS_NODESEG((se)->type) ? NODE : DATA))
+#define PAGE_TYPE(t)	(IS_NODESEG(t) ? NODE : DATA)
+#define SE_PAGETYPE(se)	(PAGE_TYPE((se)->type))
 
 static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
 						unsigned short seg_type)
@@ -965,3 +966,12 @@ static inline unsigned int first_zoned_segno(struct f2fs_sb_info *sbi)
 			return GET_SEGNO(sbi, FDEV(devi).start_blk);
 	return 0;
 }
+
+static inline enum temp_type type_to_temp(int type)
+{
+	if (IS_HOT(type))
+		return HOT;
+	else if (IS_WARM(type))
+		return WARM;
+	return COLD;
+}
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index df32573d1f62..0a34c8746782 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3893,6 +3893,8 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
 				sbi->max_open_zones, F2FS_OPTION(sbi).active_logs);
 			return -EINVAL;
 		}
+
+		sema_init(&sbi->available_open_zones, sbi->max_open_zones);
 	}
 
 	zone_sectors = bdev_zone_sectors(bdev);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
