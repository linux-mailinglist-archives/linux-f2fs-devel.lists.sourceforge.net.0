Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE77D3DE277
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Aug 2021 00:28:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mAgPs-0007jz-2x; Mon, 02 Aug 2021 22:28:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1mAgPq-0007jt-GY
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Aug 2021 22:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XFvBm3fpR1C+rpHhHcg7iQhNIlZnotUJmAdXZjiJEYo=; b=SbE6jD6xAflnntASIakJ3zPVIC
 ynVRUUWGStr/7/F7StxibWpAyJq3COKAx0Gif2xrN0EYAK0+ynHSBRO0Bd2YlaljiZbyu8hba1lkA
 AaQseD47GtwJJJ0bEovnLlY6rwSggPVn0lZ6o49qCD26RsDfvbJwFpUY3oi2J79w9RPQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XFvBm3fpR1C+rpHhHcg7iQhNIlZnotUJmAdXZjiJEYo=; b=l
 TQssq28nGZd/Ls9znWeqTh0A0UKR8o6g53W5CrBgHNIYvRxFUaHbBHnqeuLzNvMl5Rf8sii0bnzig
 kG6y+gS/STR0Gsc84Q09wSoDuputQ0qwWiECOxp/rj5/tlH06qWh6CeKdYy5boHmrldF2fUm0oCdA
 Gkn0ZMgeO/GpmV+E=;
Received: from mail-pj1-f49.google.com ([209.85.216.49])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mAgPb-00AbVB-RO
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Aug 2021 22:28:10 +0000
Received: by mail-pj1-f49.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so1073512pja.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 02 Aug 2021 15:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XFvBm3fpR1C+rpHhHcg7iQhNIlZnotUJmAdXZjiJEYo=;
 b=ic5OXn6+B6PUANHESbmxrfBdR4hsZcP52n2PWSavSmdtDyrouk/Dz3rx3UjYROkPHD
 GGxXmqeUwnoGXN4rHTNJi1XnR9TQERKSqa3MgnRoVIg5W5xsSRQmucL6a3Jjsh2VyxHU
 QFC+5QMLXIGOWIqbsQKwmyQLrOKMr5ai/dF+bqH82NSk7QsxeQ63or/1D9EYFSjkqQVA
 fw94siPBTTPPcrLbyFluSYQvbe8ZcrOoVYJPHBMockgaN1FyFCKP5Vi7bFkBqrZMNfyJ
 5lrNiuSy3OrjF33ouO/U65KbVN6xuF2AXoxUxGxvg2VObY2PbOCmOcoP7LRRVJZ+HSiS
 kcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XFvBm3fpR1C+rpHhHcg7iQhNIlZnotUJmAdXZjiJEYo=;
 b=SI3H/FXz4ifa8r07oPR2QrhYJPQbu+ND54zE5S8q5B9hXrs2J645MWN4pi+YWOpKRQ
 uBjnhcTytYwy50lEU8wuAyvVAG/AvHHFk08dAx0EMi64YxklDe0QNqF0oVbp728U5ghs
 zMB5o/UXSv2lMA2mO2i6ZM3XYw3b0wKG0fPtNF0fWB/tfJzzajswEl2pqekmSB3MeQUC
 MTWBjeEfEeKhA9I6M+PnOjubg5ToVH2BOqFKHAHf1M+oTjh+vNM903xLAv1h1AUP904w
 jWJOVYVaoQTyoeA1D4XdwaOWBYMPAA/Z4/N7r2QZBuk8qm8b6lVmUsfgAgFjFZ9y816j
 pumQ==
X-Gm-Message-State: AOAM533YYDxrmx3W3mQQ9bVC5QbsprxNogQnB5GUd7k5kJRyL125Wt69
 w/D2/ubdk8Ddca+vyaWH9jk=
X-Google-Smtp-Source: ABdhPJyziU2rhanoBuH0rzHI+LU6pdL0Qa1P9/7L+wOx/L24ovGPX5mz7TTeRn6YJxJCpZHU4Sx3hg==
X-Received: by 2002:a17:90a:aa05:: with SMTP id
 k5mr18862670pjq.47.1627943269924; 
 Mon, 02 Aug 2021 15:27:49 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:415b:68b1:20fb:3589])
 by smtp.gmail.com with ESMTPSA id gz12sm425428pjb.8.2021.08.02.15.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 15:27:49 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon,  2 Aug 2021 15:27:45 -0700
Message-Id: <20210802222745.2232812-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.49 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.49 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1mAgPb-00AbVB-RO
Subject: [f2fs-dev] [PATCH] f2fs: introduce periodic iostat io latency traces
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Whenever we notice some sluggish issues on our machines, we are always
curious about how well all types of I/O in the f2fs filesystem are
handled. But, it's hard to get this kind of real data. First of all,
we need to reproduce the issue while turning on the profiling tool like
blktrace, but the issue doesn't happen again easily. Second, with the
intervention of any tools, the overall timing of the issue will be
slightly changed and it sometimes makes us hard to figure it out.

So, I added F2FS_IOSTAT_IO_LATENCY config option to support printing out
IO latency statistics tracepoint events which are minimal things to
understand filesystem's I/O related behaviors. With "iostat_enable" sysfs
node on, we can get this statistics info in a periodic way and it
would cause the least overhead.

[samples]
 f2fs_ckpt-254:1-507     [003] ....  2842.439683: f2fs_iostat_latency:
dev = (254,11), iotype [peak lat.(ms)/avg lat.(ms)/count],
rd_data [136/1/801], rd_node [136/1/1704], rd_meta [4/2/4],
wr_sync_data [164/16/3331], wr_sync_node [152/3/648],
wr_sync_meta [160/2/4243], wr_async_data [24/13/15],
wr_async_node [0/0/0], wr_async_meta [0/0/0]

 f2fs_ckpt-254:1-507     [002] ....  2845.450514: f2fs_iostat_latency:
dev = (254,11), iotype [peak lat.(ms)/avg lat.(ms)/count],
rd_data [60/3/456], rd_node [60/3/1258], rd_meta [0/0/1],
wr_sync_data [120/12/2285], wr_sync_node [88/5/428],
wr_sync_meta [52/6/2990], wr_async_data [4/1/3],
wr_async_node [0/0/0], wr_async_meta [0/0/0]

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/Kconfig             |  9 ++++
 fs/f2fs/data.c              | 98 ++++++++++++++++++++++++++++++++++++-
 fs/f2fs/f2fs.h              | 87 ++++++++++++++++++++++++++++++++
 fs/f2fs/super.c             | 11 ++++-
 fs/f2fs/sysfs.c             | 49 +++++++++++++++++++
 include/trace/events/f2fs.h | 89 +++++++++++++++++++++++++++++++++
 6 files changed, 340 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index 7669de7b49ce..28dc5463bc87 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -135,3 +135,12 @@ config F2FS_FS_LZORLE
 	default y
 	help
 	  Support LZO-RLE compress algorithm, if unsure, say Y.
+
+config F2FS_IOSTAT_IO_LATENCY
+	bool "F2FS IO statistics IO latency information"
+	depends on F2FS_FS
+	default n
+	help
+	  Support printing out periodic IO latency statistics tracepoint
+	  events. With this, you have to turn on "iostat_enable" sysfs
+	  node to print this out.
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 948083c88d17..d855ba564ebd 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -34,6 +34,12 @@ static struct kmem_cache *bio_entry_slab;
 static mempool_t *bio_post_read_ctx_pool;
 static struct bio_set f2fs_bioset;
 
+#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
+#define NUM_PREALLOC_IOSTAT_CTXS	128
+static struct kmem_cache *bio_iostat_ctx_cache;
+static mempool_t *bio_iostat_ctx_pool;
+#endif
+
 #define	F2FS_BIO_POOL_SIZE	NR_CURSEG_TYPE
 
 int __init f2fs_init_bioset(void)
@@ -270,7 +276,18 @@ static void f2fs_post_read_work(struct work_struct *work)
 static void f2fs_read_end_io(struct bio *bio)
 {
 	struct f2fs_sb_info *sbi = F2FS_P_SB(bio_first_page_all(bio));
+#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
+	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
+	struct bio_post_read_ctx *ctx = iostat_ctx->post_read_ctx;
+#else
 	struct bio_post_read_ctx *ctx = bio->bi_private;
+#endif
+
+#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
+	__update_iostat_latency(sbi, bio, 0, iostat_ctx);
+	mempool_free(iostat_ctx, bio_iostat_ctx_pool);
+	bio->bi_private = ctx;
+#endif
 
 	if (time_to_inject(sbi, FAULT_READ_IO)) {
 		f2fs_show_injection_info(sbi, FAULT_READ_IO);
@@ -292,10 +309,21 @@ static void f2fs_read_end_io(struct bio *bio)
 
 static void f2fs_write_end_io(struct bio *bio)
 {
+#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
+	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
+	struct f2fs_sb_info *sbi = iostat_ctx->sbi;
+#else
 	struct f2fs_sb_info *sbi = bio->bi_private;
+#endif
 	struct bio_vec *bvec;
 	struct bvec_iter_all iter_all;
 
+#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
+	__update_iostat_latency(sbi, bio, 1, iostat_ctx);
+	mempool_free(iostat_ctx, bio_iostat_ctx_pool);
+	bio->bi_private = sbi;
+#endif
+
 	if (time_to_inject(sbi, FAULT_WRITE_IO)) {
 		f2fs_show_injection_info(sbi, FAULT_WRITE_IO);
 		bio->bi_status = BLK_STS_IOERR;
@@ -382,6 +410,21 @@ int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr)
 	return 0;
 }
 
+#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
+static inline void __alloc_iostat_ctx(struct f2fs_sb_info *sbi,
+		struct bio *bio, struct bio_post_read_ctx *ctx)
+{
+	struct bio_iostat_ctx *iostat_ctx;
+	/* Due to the mempool, this never fails. */
+	iostat_ctx = mempool_alloc(bio_iostat_ctx_pool, GFP_NOFS);
+	iostat_ctx->sbi = sbi;
+	iostat_ctx->submit_ts = 0;
+	iostat_ctx->type = 0;
+	iostat_ctx->post_read_ctx = ctx;
+	bio->bi_private = iostat_ctx;
+}
+#endif
+
 static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
 {
 	struct f2fs_sb_info *sbi = fio->sbi;
@@ -399,6 +442,9 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
 		bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi,
 						fio->type, fio->temp);
 	}
+#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
+	__alloc_iostat_ctx(sbi, bio, NULL);
+#endif
 	if (fio->io_wbc)
 		wbc_init_bio(fio->io_wbc, bio);
 
@@ -435,6 +481,10 @@ static bool f2fs_crypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 static inline void __submit_bio(struct f2fs_sb_info *sbi,
 				struct bio *bio, enum page_type type)
 {
+#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
+	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
+#endif
+
 	if (!is_read_io(bio_op(bio))) {
 		unsigned int start;
 
@@ -480,6 +530,12 @@ static inline void __submit_bio(struct f2fs_sb_info *sbi,
 		trace_f2fs_submit_read_bio(sbi->sb, type, bio);
 	else
 		trace_f2fs_submit_write_bio(sbi->sb, type, bio);
+
+#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
+	iostat_ctx->submit_ts = jiffies;
+	iostat_ctx->type = type;
+#endif
+
 	submit_bio(bio);
 }
 
@@ -971,7 +1027,7 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct bio *bio;
-	struct bio_post_read_ctx *ctx;
+	struct bio_post_read_ctx *ctx = NULL;
 	unsigned int post_read_steps = 0;
 
 	bio = bio_alloc_bioset(for_write ? GFP_NOIO : GFP_KERNEL,
@@ -1007,6 +1063,9 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 		ctx->fs_blkaddr = blkaddr;
 		bio->bi_private = ctx;
 	}
+#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
+	__alloc_iostat_ctx(sbi, bio, ctx);
+#endif
 
 	return bio;
 }
@@ -2195,7 +2254,9 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		struct page *page = dic->cpages[i];
 		block_t blkaddr;
 		struct bio_post_read_ctx *ctx;
-
+#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
+		struct bio_iostat_ctx *iostat_ctx;
+#endif
 		blkaddr = data_blkaddr(dn.inode, dn.node_page,
 						dn.ofs_in_node + i + 1);
 
@@ -2231,7 +2292,12 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		if (bio_add_page(bio, page, blocksize, 0) < blocksize)
 			goto submit_and_realloc;
 
+#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
+		iostat_ctx = bio->bi_private;
+		ctx = iostat_ctx->post_read_ctx;
+#else
 		ctx = bio->bi_private;
+#endif
 		ctx->enabled_steps |= STEP_DECOMPRESS;
 		refcount_inc(&dic->refcnt);
 
@@ -4132,6 +4198,34 @@ void f2fs_destroy_post_read_processing(void)
 	kmem_cache_destroy(bio_post_read_ctx_cache);
 }
 
+#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
+int __init f2fs_init_iostat_processing(void)
+{
+	bio_iostat_ctx_cache =
+		kmem_cache_create("f2fs_bio_iostat_ctx",
+				  sizeof(struct bio_iostat_ctx), 0, 0, NULL);
+	if (!bio_iostat_ctx_cache)
+		goto fail;
+	bio_iostat_ctx_pool =
+		mempool_create_slab_pool(NUM_PREALLOC_IOSTAT_CTXS,
+					 bio_iostat_ctx_cache);
+	if (!bio_iostat_ctx_pool)
+		goto fail_free_cache;
+	return 0;
+
+fail_free_cache:
+	kmem_cache_destroy(bio_iostat_ctx_cache);
+fail:
+	return -ENOMEM;
+}
+
+void f2fs_destroy_iostat_processing(void)
+{
+	mempool_destroy(bio_iostat_ctx_pool);
+	kmem_cache_destroy(bio_iostat_ctx_cache);
+}
+#endif
+
 int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi)
 {
 	if (!f2fs_sb_has_encrypt(sbi) &&
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5d16486feb8f..fbf2b36b9578 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1755,6 +1755,17 @@ struct f2fs_sb_info {
 	unsigned int compress_watermark;	/* cache page watermark */
 	atomic_t compress_page_hit;		/* cache hit count */
 #endif
+
+#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
+	/* for io latency related statistics info in one iostat period */
+	spinlock_t iostat_lat_lock;
+	u64 rd_sum_lat[NR_PAGE_TYPE];		/* sum of read io latencies */
+	u64 rd_peak_lat[NR_PAGE_TYPE];		/* peak read io latency */
+	u64 rd_bio_cnt[NR_PAGE_TYPE];		/* read bio count */
+	u64 wr_sum_lat[2][NR_PAGE_TYPE];	/* sum of write io latencies (sync/async) */
+	u64 wr_peak_lat[2][NR_PAGE_TYPE];	/* peak write io latency (sync/async) */
+	u64 wr_bio_cnt[2][NR_PAGE_TYPE];	/* write bio count (sync/async) */
+#endif
 };
 
 struct f2fs_private_dio {
@@ -3233,6 +3244,26 @@ static inline void f2fs_reset_iostat(struct f2fs_sb_info *sbi)
 		sbi->prev_rw_iostat[i] = 0;
 	}
 	spin_unlock(&sbi->iostat_lock);
+
+#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
+	spin_lock_irq(&sbi->iostat_lat_lock);
+	for (i = 0; i < NR_PAGE_TYPE; i++) {
+		sbi->rd_sum_lat[i] = 0;
+		sbi->rd_peak_lat[i] = 0;
+		sbi->rd_bio_cnt[i] = 0;
+	}
+
+	for (i = 0; i < 2; i++) {
+		int iotype;
+
+		for (iotype = 0; iotype < NR_PAGE_TYPE; iotype++) {
+			sbi->wr_sum_lat[i][iotype] = 0;
+			sbi->wr_peak_lat[i][iotype] = 0;
+			sbi->wr_bio_cnt[i][iotype] = 0;
+		}
+	}
+	spin_unlock_irq(&sbi->iostat_lat_lock);
+#endif
 }
 
 extern void f2fs_record_iostat(struct f2fs_sb_info *sbi);
@@ -3259,6 +3290,55 @@ static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi,
 	f2fs_record_iostat(sbi);
 }
 
+#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
+
+struct bio_post_read_ctx;
+
+struct bio_iostat_ctx {
+	struct f2fs_sb_info *sbi;
+	u64 submit_ts;
+	enum page_type type;
+	struct bio_post_read_ctx *post_read_ctx;
+};
+
+struct f2fs_iostat_latency {
+	unsigned long long peak_lat;
+	unsigned long long avg_lat;
+	unsigned long long cnt;
+};
+
+static inline void __update_iostat_latency(struct f2fs_sb_info *sbi,
+		struct bio *bio, int rw, struct bio_iostat_ctx *iostat_ctx)
+{
+	u64 ts_diff;
+	unsigned int iotype = iostat_ctx->type;
+	unsigned long flags;
+
+	if (!sbi->iostat_enable)
+		return;
+
+	ts_diff = jiffies - iostat_ctx->submit_ts;
+	if (iotype >= META_FLUSH)
+		iotype = META;
+
+	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
+	if (rw == 0) {
+		sbi->rd_sum_lat[iotype] += ts_diff;
+		sbi->rd_bio_cnt[iotype]++;
+		if (ts_diff > sbi->rd_peak_lat[iotype])
+			sbi->rd_peak_lat[iotype] = ts_diff;
+	} else {
+		int sync = bio->bi_opf & REQ_SYNC ? 0 : 1;
+
+		sbi->wr_sum_lat[sync][iotype] += ts_diff;
+		sbi->wr_bio_cnt[sync][iotype]++;
+		if (ts_diff > sbi->wr_peak_lat[sync][iotype])
+			sbi->wr_peak_lat[sync][iotype] = ts_diff;
+	}
+	spin_unlock_irqrestore(&sbi->iostat_lat_lock, flags);
+}
+#endif
+
 #define __is_large_section(sbi)		((sbi)->segs_per_sec > 1)
 
 #define __is_meta_io(fio) (PAGE_TYPE_OF_BIO((fio)->type) == META)
@@ -3645,6 +3725,13 @@ bool f2fs_overwrite_io(struct inode *inode, loff_t pos, size_t len);
 void f2fs_clear_page_cache_dirty_tag(struct page *page);
 int f2fs_init_post_read_processing(void);
 void f2fs_destroy_post_read_processing(void);
+#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
+int f2fs_init_iostat_processing(void);
+void f2fs_destroy_iostat_processing(void);
+#else
+static inline int f2fs_init_iostat_processing(void) { return 0; }
+static inline void f2fs_destroy_iostat_processing(void) {}
+#endif
 int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi);
 void f2fs_destroy_post_read_wq(struct f2fs_sb_info *sbi);
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 41765e90caa2..a7b770d6f006 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3905,6 +3905,9 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 
 	/* init iostat info */
 	spin_lock_init(&sbi->iostat_lock);
+#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
+	spin_lock_init(&sbi->iostat_lat_lock);
+#endif
 	sbi->iostat_enable = false;
 	sbi->iostat_period_ms = DEFAULT_IOSTAT_PERIOD_MS;
 
@@ -4415,9 +4418,12 @@ static int __init init_f2fs_fs(void)
 	err = f2fs_init_post_read_processing();
 	if (err)
 		goto free_root_stats;
-	err = f2fs_init_bio_entry_cache();
+	err = f2fs_init_iostat_processing();
 	if (err)
 		goto free_post_read;
+	err = f2fs_init_bio_entry_cache();
+	if (err)
+		goto free_iostat;
 	err = f2fs_init_bioset();
 	if (err)
 		goto free_bio_enrty_cache;
@@ -4439,6 +4445,8 @@ static int __init init_f2fs_fs(void)
 	f2fs_destroy_bioset();
 free_bio_enrty_cache:
 	f2fs_destroy_bio_entry_cache();
+free_iostat:
+	f2fs_destroy_iostat_processing();
 free_post_read:
 	f2fs_destroy_post_read_processing();
 free_root_stats:
@@ -4473,6 +4481,7 @@ static void __exit exit_f2fs_fs(void)
 	f2fs_destroy_compress_mempool();
 	f2fs_destroy_bioset();
 	f2fs_destroy_bio_entry_cache();
+	f2fs_destroy_iostat_processing();
 	f2fs_destroy_post_read_processing();
 	f2fs_destroy_root_stats();
 	unregister_filesystem(&f2fs_fs_type);
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 44b086e5b607..51553946a055 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1077,10 +1077,51 @@ static int __maybe_unused segment_bits_seq_show(struct seq_file *seq,
 	return 0;
 }
 
+#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
+static inline void __record_iostat_latency(struct f2fs_sb_info *sbi,
+			struct f2fs_iostat_latency (*iostat_lat)[NR_PAGE_TYPE])
+{
+	int io, sync, idx = 0;
+	unsigned long long cnt;
+
+	spin_lock_irq(&sbi->iostat_lat_lock);
+	for (io = 0; io < NR_PAGE_TYPE; io++) {
+		cnt = sbi->rd_bio_cnt[io];
+		iostat_lat[idx][io].peak_lat =
+			jiffies_to_msecs(sbi->rd_peak_lat[io]);
+		iostat_lat[idx][io].cnt = cnt;
+		iostat_lat[idx][io].avg_lat = cnt ?
+			jiffies_to_msecs(sbi->rd_sum_lat[io]) / cnt : 0;
+		sbi->rd_sum_lat[io] = 0;
+		sbi->rd_peak_lat[io] = 0;
+		sbi->rd_bio_cnt[io] = 0;
+	}
+
+	for (sync = 0; sync < 2; sync++) {
+		idx++;
+		for (io = 0; io < NR_PAGE_TYPE; io++) {
+			cnt = sbi->wr_bio_cnt[sync][io];
+			iostat_lat[idx][io].peak_lat =
+			  jiffies_to_msecs(sbi->wr_peak_lat[sync][io]);
+			iostat_lat[idx][io].cnt = cnt;
+			iostat_lat[idx][io].avg_lat = cnt ?
+			  jiffies_to_msecs(sbi->wr_sum_lat[sync][io]) / cnt : 0;
+			sbi->wr_sum_lat[sync][io] = 0;
+			sbi->wr_peak_lat[sync][io] = 0;
+			sbi->wr_bio_cnt[sync][io] = 0;
+		}
+	}
+	spin_unlock_irq(&sbi->iostat_lat_lock);
+}
+#endif
+
 void f2fs_record_iostat(struct f2fs_sb_info *sbi)
 {
 	unsigned long long iostat_diff[NR_IO_TYPE];
 	int i;
+#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
+	struct f2fs_iostat_latency iostat_lat[3][NR_PAGE_TYPE];
+#endif
 
 	if (time_is_after_jiffies(sbi->iostat_next_period))
 		return;
@@ -1101,7 +1142,15 @@ void f2fs_record_iostat(struct f2fs_sb_info *sbi)
 	}
 	spin_unlock(&sbi->iostat_lock);
 
+#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
+	__record_iostat_latency(sbi, iostat_lat);
+#endif
+
 	trace_f2fs_iostat(sbi, iostat_diff);
+
+#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
+	trace_f2fs_iostat_latency(sbi, iostat_lat);
+#endif
 }
 
 static int __maybe_unused iostat_info_seq_show(struct seq_file *seq,
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 56b113e3cd6a..df6b57e10c9d 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1894,6 +1894,95 @@ TRACE_EVENT(f2fs_iostat,
 		__entry->fs_cdrio, __entry->fs_nrio, __entry->fs_mrio)
 );
 
+#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
+TRACE_EVENT(f2fs_iostat_latency,
+
+	TP_PROTO(struct f2fs_sb_info *sbi, struct f2fs_iostat_latency (*iostat_lat)[NR_PAGE_TYPE]),
+
+	TP_ARGS(sbi, iostat_lat),
+
+	TP_STRUCT__entry(
+		__field(dev_t,	dev)
+		__field(unsigned long long,	d_rd_peak)
+		__field(unsigned long long,	d_rd_avg)
+		__field(unsigned long long,	d_rd_cnt)
+		__field(unsigned long long,	n_rd_peak)
+		__field(unsigned long long,	n_rd_avg)
+		__field(unsigned long long,	n_rd_cnt)
+		__field(unsigned long long,	m_rd_peak)
+		__field(unsigned long long,	m_rd_avg)
+		__field(unsigned long long,	m_rd_cnt)
+		__field(unsigned long long,	d_wr_s_peak)
+		__field(unsigned long long,	d_wr_s_avg)
+		__field(unsigned long long,	d_wr_s_cnt)
+		__field(unsigned long long,	n_wr_s_peak)
+		__field(unsigned long long,	n_wr_s_avg)
+		__field(unsigned long long,	n_wr_s_cnt)
+		__field(unsigned long long,	m_wr_s_peak)
+		__field(unsigned long long,	m_wr_s_avg)
+		__field(unsigned long long,	m_wr_s_cnt)
+		__field(unsigned long long,	d_wr_as_peak)
+		__field(unsigned long long,	d_wr_as_avg)
+		__field(unsigned long long,	d_wr_as_cnt)
+		__field(unsigned long long,	n_wr_as_peak)
+		__field(unsigned long long,	n_wr_as_avg)
+		__field(unsigned long long,	n_wr_as_cnt)
+		__field(unsigned long long,	m_wr_as_peak)
+		__field(unsigned long long,	m_wr_as_avg)
+		__field(unsigned long long,	m_wr_as_cnt)
+	),
+
+	TP_fast_assign(
+		__entry->dev		= sbi->sb->s_dev;
+		__entry->d_rd_peak	= iostat_lat[0][DATA].peak_lat;
+		__entry->d_rd_avg	= iostat_lat[0][DATA].avg_lat;
+		__entry->d_rd_cnt	= iostat_lat[0][DATA].cnt;
+		__entry->n_rd_peak	= iostat_lat[0][NODE].peak_lat;
+		__entry->n_rd_avg	= iostat_lat[0][NODE].avg_lat;
+		__entry->n_rd_cnt	= iostat_lat[0][NODE].cnt;
+		__entry->m_rd_peak	= iostat_lat[0][META].peak_lat;
+		__entry->m_rd_avg	= iostat_lat[0][META].avg_lat;
+		__entry->m_rd_cnt	= iostat_lat[0][META].cnt;
+		__entry->d_wr_s_peak	= iostat_lat[1][DATA].peak_lat;
+		__entry->d_wr_s_avg	= iostat_lat[1][DATA].avg_lat;
+		__entry->d_wr_s_cnt	= iostat_lat[1][DATA].cnt;
+		__entry->n_wr_s_peak	= iostat_lat[1][NODE].peak_lat;
+		__entry->n_wr_s_avg	= iostat_lat[1][NODE].avg_lat;
+		__entry->n_wr_s_cnt	= iostat_lat[1][NODE].cnt;
+		__entry->m_wr_s_peak	= iostat_lat[1][META].peak_lat;
+		__entry->m_wr_s_avg	= iostat_lat[1][META].avg_lat;
+		__entry->m_wr_s_cnt	= iostat_lat[1][META].cnt;
+		__entry->d_wr_as_peak	= iostat_lat[2][DATA].peak_lat;
+		__entry->d_wr_as_avg	= iostat_lat[2][DATA].avg_lat;
+		__entry->d_wr_as_cnt	= iostat_lat[2][DATA].cnt;
+		__entry->n_wr_as_peak	= iostat_lat[2][NODE].peak_lat;
+		__entry->n_wr_as_avg	= iostat_lat[2][NODE].avg_lat;
+		__entry->n_wr_as_cnt	= iostat_lat[2][NODE].cnt;
+		__entry->m_wr_as_peak	= iostat_lat[2][META].peak_lat;
+		__entry->m_wr_as_avg	= iostat_lat[2][META].avg_lat;
+		__entry->m_wr_as_cnt	= iostat_lat[2][META].cnt;
+	),
+
+	TP_printk("dev = (%d,%d), "
+		"iotype [peak lat.(ms)/avg lat.(ms)/count], "
+		"rd_data [%llu/%llu/%llu], rd_node [%llu/%llu/%llu], "
+		"rd_meta [%llu/%llu/%llu], wr_sync_data [%llu/%llu/%llu], "
+		"wr_sync_node [%llu/%llu/%llu], wr_sync_meta [%llu/%llu/%llu], "
+		"wr_async_data [%llu/%llu/%llu], wr_async_node [%llu/%llu/%llu], "
+		"wr_async_meta [%llu/%llu/%llu]",
+		show_dev(__entry->dev),
+		__entry->d_rd_peak, __entry->d_rd_avg, __entry->d_rd_cnt,
+		__entry->n_rd_peak, __entry->n_rd_avg, __entry->n_rd_cnt,
+		__entry->m_rd_peak, __entry->m_rd_avg, __entry->m_rd_cnt,
+		__entry->d_wr_s_peak, __entry->d_wr_s_avg, __entry->d_wr_s_cnt,
+		__entry->n_wr_s_peak, __entry->n_wr_s_avg, __entry->n_wr_s_cnt,
+		__entry->m_wr_s_peak, __entry->m_wr_s_avg, __entry->m_wr_s_cnt,
+		__entry->d_wr_as_peak, __entry->d_wr_as_avg, __entry->d_wr_as_cnt,
+		__entry->n_wr_as_peak, __entry->n_wr_as_avg, __entry->n_wr_as_cnt,
+		__entry->m_wr_as_peak, __entry->m_wr_as_avg, __entry->m_wr_as_cnt)
+);
+#endif
+
 TRACE_EVENT(f2fs_bmap,
 
 	TP_PROTO(struct inode *inode, sector_t lblock, sector_t pblock),
-- 
2.32.0.554.ge1b32706d8-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
