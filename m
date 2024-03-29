Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD7C8911E6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Mar 2024 04:20:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rq2n9-0006Kr-0O;
	Fri, 29 Mar 2024 03:20:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rq2n7-0006Kj-CL
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Mar 2024 03:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RCmgSrycx9JWFYnMHks1kjr51er2wqMIrCVHMw/5XWA=; b=YlpIC1oTtSMFMPRpW8s529UXAx
 9zn/KnLc6QNpuyPWM4eFjUf57ogo/tXiCyqoVxs0cTaIZitpM9/qL0luaiyUoEutsJ1TPFXPxY26G
 4dhqAokJ/ct51uyq+K5WD+nuJiQlN1RnxjujPBTY2ieixqWBdRByr7gBWyXLLPuzCAuc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RCmgSrycx9JWFYnMHks1kjr51er2wqMIrCVHMw/5XWA=; b=O
 tqDjQ4ZzyX6hkOOZtOHBktByplNqkfKk2WNEpgdXPFqSTAIcgaNi7urxRRezxwmpHEPs2LuvQpE0S
 nKSAh6WTK4Y8VKB1f8liiAqeEIBPjnDc9vQU3GAafFWnV4zku08MVbeb+rVgJQ9p++PjhS0Q6jhju
 jq7memMMTjFT2WaA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rq2n5-0002dh-3M for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Mar 2024 03:20:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 87EA9CE2CCE;
 Fri, 29 Mar 2024 03:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 275F0C433C7;
 Fri, 29 Mar 2024 03:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711682414;
 bh=rY2JQii55Kvgisqee1kcdn54MRq+qAvAnPy7NBSOrQ0=;
 h=From:To:Cc:Subject:Date:From;
 b=IHX9vfJ+a4XDPJ5P+S2Cm+s4mC9woGcRx8mrJEs3m+p8V+l0rLzStBw3FPfA6fFTx
 LQq0mjfHFBfdy/j6tvQBL68tSo/B0qqdg6kHCXFAHgAGQnDiaqO5R90S5rKIei5HKH
 HGTG7sBq7IrNTr+ZDWaejFDQd7erueIq1svivIbAQP0OqmJRdg+HzUXiNq6tlQM+jP
 OPPj2rfA/Yam9/hXg8es5+NqWeZ622qJsYORVKHCMpkmhkE0pBbgA7YytfXwi3wNas
 ON3dF3UihMCkJ6AwUtSm86E1w7/nlDBIDLiwmanKsWgIc2Sx6k96Nts82y0bIiqF0Q
 HJznpwKIX6kMA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 29 Mar 2024 11:20:09 +0800
Message-Id: <20240329032009.3395384-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -2.6 (--)
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
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rq2n5-0002dh-3M
Subject: [f2fs-dev] [PATCH v2] f2fs: zone: don't block IO if there is
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
v2:
- remove unneeded declaration.
 fs/f2fs/data.c    | 80 +++++++++++++++++++++++++----------------------
 fs/f2fs/f2fs.h    | 33 ++++++++++++++++---
 fs/f2fs/iostat.c  |  7 +++++
 fs/f2fs/iostat.h  |  2 ++
 fs/f2fs/segment.c | 58 ++++++++++++++++++++++++++++++----
 fs/f2fs/segment.h | 12 ++++++-
 fs/f2fs/super.c   |  2 ++
 7 files changed, 145 insertions(+), 49 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0d88649c60a5..132a3ede60b1 100644
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
@@ -918,22 +935,16 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
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
 
@@ -944,20 +955,14 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
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
@@ -985,6 +990,11 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
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
@@ -1010,15 +1020,11 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
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
index 694f8a52cb84..41a07bedf0a1 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1234,16 +1234,16 @@ struct f2fs_bio_info {
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
@@ -1560,6 +1560,7 @@ struct f2fs_sb_info {
 #ifdef CONFIG_BLK_DEV_ZONED
 	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
 	unsigned int max_open_zones;		/* max open zone resources of the zoned device */
+	struct semaphore available_open_zones;	/* available open zones */
 #endif
 
 	/* for node-related operations */
@@ -4469,6 +4470,28 @@ static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
 
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
index 4fd76e867e0a..9b11cd7888b9 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3140,6 +3140,23 @@ static int __allocate_new_segment(struct f2fs_sb_info *sbi, int type,
 		return err;
 	stat_inc_seg_type(sbi, curseg);
 	locate_dirty_segment(sbi, old_segno);
+
+
+#ifdef CONFIG_BLK_DEV_ZONED
+	if (f2fs_sb_has_blkzoned(sbi)) {
+		struct f2fs_bio_info *io;
+
+		io = sbi->write_io[PAGE_TYPE(type)] + type_to_temp(type);
+
+		f2fs_down_write(&io->io_rwsem);
+		if (io->zone_openned) {
+			up(&sbi->available_open_zones);
+			io->zone_openned = false;
+		}
+		f2fs_up_write(&io->io_rwsem);
+	}
+#endif
+
 	return 0;
 }
 
@@ -3461,12 +3478,7 @@ static int __get_segment_type(struct f2fs_io_info *fio)
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
 
@@ -4132,6 +4144,27 @@ static int restore_curseg_summaries(struct f2fs_sb_info *sbi)
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
 
@@ -5451,6 +5484,19 @@ static void destroy_curseg(struct f2fs_sb_info *sbi)
 	for (i = 0; i < NR_CURSEG_TYPE; i++) {
 		kfree(array[i].sum_blk);
 		kfree(array[i].journal);
+
+#ifdef CONFIG_BLK_DEV_ZONED
+	if (f2fs_sb_has_blkzoned(sbi)) {
+		enum page_type ptype = PAGE_TYPE(i);
+		enum temp_type temp = type_to_temp(i);
+
+		if (sbi->write_io[ptype][temp].zone_openned) {
+			up(&sbi->available_open_zones);
+			sbi->write_io[ptype][temp].zone_openned = false;
+		}
+	}
+#endif
+
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
index 642540782471..e398800a192d 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3895,6 +3895,8 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
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
