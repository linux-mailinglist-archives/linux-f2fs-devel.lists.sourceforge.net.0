Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B93823F366E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Aug 2021 00:29:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mHD0S-0006zr-Jo; Fri, 20 Aug 2021 22:28:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1mHD0I-0006yv-Tk
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 22:28:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6dFlH7kbm1IF+kuIeh/4GV9ZtC/78mojb0p+BSUZe6Y=; b=Wv5NUhZjEQHT07cdQPanVXQjsI
 3Ssu8aQ5noA21Bu/gSNFy5/NXCugJHi27lYsfwALfY/36LaBDbfCePTX+OIuiBU0Cji85F3PvR9t9
 EH3X+ooSzM8w46sjiKU4QKu8Rv0I3YK9djfZvB6h86iw60qPgXRChbXgnsWP+cBinZas=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6dFlH7kbm1IF+kuIeh/4GV9ZtC/78mojb0p+BSUZe6Y=; b=B
 M5SB3dbl/r02Zv6apqEElaRd3gvi9xk1guEyWrDjWPLbDMRA27DAceW8iC4ITWq0DZW/DGrIOkkkg
 f1egXBzp4pX+g97FGlHvt58tXoGCQ5fC5swT8wa8+JoQ+t5T7mJLEPHuqYkUaObMA/pWd12gXXG7b
 /yoXbDeEROmn80/o=;
Received: from mail-pg1-f169.google.com ([209.85.215.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mHD0G-0001rx-Sp
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 22:28:46 +0000
Received: by mail-pg1-f169.google.com with SMTP id c17so10596468pgc.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 20 Aug 2021 15:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6dFlH7kbm1IF+kuIeh/4GV9ZtC/78mojb0p+BSUZe6Y=;
 b=jPybJDziyZmpI8YE2wb3nWcM/nIF7ImLK/ORK1vUvEKuKOhdNPimVm8isNng6HjjOf
 /PFv7xnnUDBVu3i6v4Hrwp4SBvVEbYsJbp4W7TwjBe6SomDXuTPq+denUdi3ZeGq57vd
 NAdU/8+W56zcALCA6hR9x8ihx84TPxx7Q3xhKfWj4qWRsd9jbnJuh8V2jLeLcAb7qr8j
 6U6zSODCS07Fi06S9yEGJrKMGoJryUhdCjjX3qiNptQtCPt3a5EJH6lK4Hg3IiupUmcW
 WQXi8BL5L8LppWYVeq6bXFCf3gHbU9rsOL8aq80E93SGUA8rG7BhBGCbfK0bLqM18iTa
 TAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6dFlH7kbm1IF+kuIeh/4GV9ZtC/78mojb0p+BSUZe6Y=;
 b=buR9HnwA0mHrRDWO2tVj9C5rqK65i6AD4ahcyC/o7DQmZMjRrFcmSq46u/4hqRvUtL
 aSXlXtKShuyoeb9x5/daz+DLpYTzPrqlzXl61cx6XDhHW3BIdzBm4A58Iai0CIMb+c3h
 cKrVnwkTGlipdvmFC8ZfWArq3iS9GmzMbU4jV9WyAz1HdqfJ9pm8ZXqnr74kprVtUM1L
 ZQ9WNh/UaoTSmUXaE257RQAYko2sSxg2BpGrnaSyKnAi4pgvtrw7yT6XpK4HuOMo6kgW
 LkxUV17PAYkDRSK80kxS4LuPSiM81dH5AmPWE2XdbCRm2sS6kR0Fp8lu5clVsfdPBrrV
 Ibnw==
X-Gm-Message-State: AOAM532QxfDtoUgJt84UUrzE6m93potGfaub0iXvwjpD0xQjcStm5lY5
 MwjkkGjXCW/j6sYn8LiJzPVWK/2n5Qg=
X-Google-Smtp-Source: ABdhPJy3S7aQHr8X+3lq4RevkeT69OlUrY8kAe7EP9nrdhhbA6E40KFe1y4WmqLHhGVqz9jGlUYDuw==
X-Received: by 2002:a05:6a00:228a:b0:3e1:a0b2:535b with SMTP id
 f10-20020a056a00228a00b003e1a0b2535bmr21863720pfe.5.1629498519052; 
 Fri, 20 Aug 2021 15:28:39 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:2c15:e1a9:d4c3:ff83])
 by smtp.gmail.com with ESMTPSA id b17sm8834758pgl.61.2021.08.20.15.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 15:28:38 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 20 Aug 2021 15:28:34 -0700
Message-Id: <20210820222834.342035-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.169 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.169 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
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
X-Headers-End: 1mHD0G-0001rx-Sp
Subject: [f2fs-dev] [PATCH v5] f2fs: introduce periodic iostat io latency
 traces
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

So, I added the feature printing out IO latency statistics tracepoint
events, which are minimal things to understand filesystem's I/O related
behaviors, into F2FS_IOSTAT kernel config. With "iostat_enable" sysfs
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

---
v5: cleaned up codes handling variables
v4: separate the previous patch into two patches
v3: moved other I/O statistics related features into a separate file
    with the same kernel config option for better maintenance.
v2: clean up with wrappers and fix a build breakage reported by
    kernel test robot <lkp@intel.com>

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/data.c              |  19 ++++--
 fs/f2fs/f2fs.h              |   4 ++
 fs/f2fs/iostat.c            | 133 ++++++++++++++++++++++++++++++++++++
 fs/f2fs/iostat.h            |  57 ++++++++++++++++
 fs/f2fs/super.c             |  13 +++-
 include/trace/events/f2fs.h |  95 ++++++++++++++++++++++++++
 6 files changed, 315 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index fd16c4fc4507..5e4120b92f59 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -271,7 +271,10 @@ static void f2fs_post_read_work(struct work_struct *work)
 static void f2fs_read_end_io(struct bio *bio)
 {
 	struct f2fs_sb_info *sbi = F2FS_P_SB(bio_first_page_all(bio));
-	struct bio_post_read_ctx *ctx = bio->bi_private;
+	struct bio_post_read_ctx *ctx;
+
+	iostat_update_and_unbind_ctx(bio, 0);
+	ctx = bio->bi_private;
 
 	if (time_to_inject(sbi, FAULT_READ_IO)) {
 		f2fs_show_injection_info(sbi, FAULT_READ_IO);
@@ -293,10 +296,13 @@ static void f2fs_read_end_io(struct bio *bio)
 
 static void f2fs_write_end_io(struct bio *bio)
 {
-	struct f2fs_sb_info *sbi = bio->bi_private;
+	struct f2fs_sb_info *sbi;
 	struct bio_vec *bvec;
 	struct bvec_iter_all iter_all;
 
+	iostat_update_and_unbind_ctx(bio, 1);
+	sbi = bio->bi_private;
+
 	if (time_to_inject(sbi, FAULT_WRITE_IO)) {
 		f2fs_show_injection_info(sbi, FAULT_WRITE_IO);
 		bio->bi_status = BLK_STS_IOERR;
@@ -400,6 +406,8 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
 		bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi,
 						fio->type, fio->temp);
 	}
+	iostat_alloc_and_bind_ctx(sbi, bio, NULL);
+
 	if (fio->io_wbc)
 		wbc_init_bio(fio->io_wbc, bio);
 
@@ -481,6 +489,8 @@ static inline void __submit_bio(struct f2fs_sb_info *sbi,
 		trace_f2fs_submit_read_bio(sbi->sb, type, bio);
 	else
 		trace_f2fs_submit_write_bio(sbi->sb, type, bio);
+
+	iostat_update_submit_ctx(bio, type);
 	submit_bio(bio);
 }
 
@@ -972,7 +982,7 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct bio *bio;
-	struct bio_post_read_ctx *ctx;
+	struct bio_post_read_ctx *ctx = NULL;
 	unsigned int post_read_steps = 0;
 
 	bio = bio_alloc_bioset(for_write ? GFP_NOIO : GFP_KERNEL,
@@ -1008,6 +1018,7 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 		ctx->fs_blkaddr = blkaddr;
 		bio->bi_private = ctx;
 	}
+	iostat_alloc_and_bind_ctx(sbi, bio, ctx);
 
 	return bio;
 }
@@ -2253,7 +2264,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		if (bio_add_page(bio, page, blocksize, 0) < blocksize)
 			goto submit_and_realloc;
 
-		ctx = bio->bi_private;
+		ctx = get_post_read_ctx(bio);
 		ctx->enabled_steps |= STEP_DECOMPRESS;
 		refcount_inc(&dic->refcnt);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 12ecf6ee9cb5..26d084a1fea8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1781,6 +1781,10 @@ struct f2fs_sb_info {
 	bool iostat_enable;
 	unsigned long iostat_next_period;
 	unsigned int iostat_period_ms;
+
+	/* For io latency related statistics info in one iostat period */
+	spinlock_t iostat_lat_lock;
+	struct iostat_lat_info *iostat_io_lat;
 #endif
 };
 
diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
index 21c29e121a86..cdcf54ae0db8 100644
--- a/fs/f2fs/iostat.c
+++ b/fs/f2fs/iostat.c
@@ -14,6 +14,10 @@
 #include "iostat.h"
 #include <trace/events/f2fs.h>
 
+#define NUM_PREALLOC_IOSTAT_CTXS	128
+static struct kmem_cache *bio_iostat_ctx_cache;
+static mempool_t *bio_iostat_ctx_pool;
+
 int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
 {
 	struct super_block *sb = seq->private;
@@ -81,6 +85,32 @@ int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
 	return 0;
 }
 
+static inline void __record_iostat_latency(struct f2fs_sb_info *sbi)
+{
+	int io, idx = 0;
+	unsigned int cnt;
+	struct f2fs_iostat_latency iostat_lat[MAX_IO_TYPE][NR_PAGE_TYPE];
+	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
+
+	spin_lock_irq(&sbi->iostat_lat_lock);
+	for (idx = 0; idx < MAX_IO_TYPE; idx++) {
+		for (io = 0; io < NR_PAGE_TYPE; io++) {
+			cnt = io_lat->bio_cnt[idx][io];
+			iostat_lat[idx][io].peak_lat =
+			   jiffies_to_msecs(io_lat->peak_lat[idx][io]);
+			iostat_lat[idx][io].cnt = cnt;
+			iostat_lat[idx][io].avg_lat = cnt ?
+			   jiffies_to_msecs(io_lat->sum_lat[idx][io]) / cnt : 0;
+			io_lat->sum_lat[idx][io] = 0;
+			io_lat->peak_lat[idx][io] = 0;
+			io_lat->bio_cnt[idx][io] = 0;
+		}
+	}
+	spin_unlock_irq(&sbi->iostat_lat_lock);
+
+	trace_f2fs_iostat_latency(sbi, iostat_lat);
+}
+
 static inline void f2fs_record_iostat(struct f2fs_sb_info *sbi)
 {
 	unsigned long long iostat_diff[NR_IO_TYPE];
@@ -106,10 +136,13 @@ static inline void f2fs_record_iostat(struct f2fs_sb_info *sbi)
 	spin_unlock(&sbi->iostat_lock);
 
 	trace_f2fs_iostat(sbi, iostat_diff);
+
+	__record_iostat_latency(sbi);
 }
 
 void f2fs_reset_iostat(struct f2fs_sb_info *sbi)
 {
+	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
 	int i;
 
 	spin_lock(&sbi->iostat_lock);
@@ -118,6 +151,10 @@ void f2fs_reset_iostat(struct f2fs_sb_info *sbi)
 		sbi->prev_rw_iostat[i] = 0;
 	}
 	spin_unlock(&sbi->iostat_lock);
+
+	spin_lock_irq(&sbi->iostat_lat_lock);
+	memset(io_lat, 0, sizeof(struct iostat_lat_info));
+	spin_unlock_irq(&sbi->iostat_lat_lock);
 }
 
 void f2fs_update_iostat(struct f2fs_sb_info *sbi,
@@ -143,12 +180,108 @@ void f2fs_update_iostat(struct f2fs_sb_info *sbi,
 	f2fs_record_iostat(sbi);
 }
 
+static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx,
+				int rw, bool is_sync)
+{
+	unsigned long ts_diff;
+	unsigned int iotype = iostat_ctx->type;
+	unsigned long flags;
+	struct f2fs_sb_info *sbi = iostat_ctx->sbi;
+	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
+	int idx;
+
+	if (!sbi->iostat_enable)
+		return;
+
+	ts_diff = jiffies - iostat_ctx->submit_ts;
+	if (iotype >= META_FLUSH)
+		iotype = META;
+
+	if (rw == 0) {
+		idx = READ_IO;
+	} else {
+		if (is_sync)
+			idx = WRITE_SYNC_IO;
+		else
+			idx = WRITE_ASYNC_IO;
+	}
+
+	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
+	io_lat->sum_lat[idx][iotype] += ts_diff;
+	io_lat->bio_cnt[idx][iotype]++;
+	if (ts_diff > io_lat->peak_lat[idx][iotype])
+		io_lat->peak_lat[idx][iotype] = ts_diff;
+	spin_unlock_irqrestore(&sbi->iostat_lat_lock, flags);
+}
+
+void iostat_update_and_unbind_ctx(struct bio *bio, int rw)
+{
+	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
+	bool is_sync = bio->bi_opf & REQ_SYNC;
+
+	if (rw == 0)
+		bio->bi_private = iostat_ctx->post_read_ctx;
+	else
+		bio->bi_private = iostat_ctx->sbi;
+	__update_iostat_latency(iostat_ctx, rw, is_sync);
+	mempool_free(iostat_ctx, bio_iostat_ctx_pool);
+}
+
+void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
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
+
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
+
 int f2fs_init_iostat(struct f2fs_sb_info *sbi)
 {
 	/* init iostat info */
 	spin_lock_init(&sbi->iostat_lock);
+	spin_lock_init(&sbi->iostat_lat_lock);
 	sbi->iostat_enable = false;
 	sbi->iostat_period_ms = DEFAULT_IOSTAT_PERIOD_MS;
+	sbi->iostat_io_lat = f2fs_kzalloc(sbi, sizeof(struct iostat_lat_info),
+					GFP_KERNEL);
+	if (!sbi->iostat_io_lat)
+		return -ENOMEM;
 
 	return 0;
 }
+
+void f2fs_destroy_iostat(struct f2fs_sb_info *sbi)
+{
+	kfree(sbi->iostat_io_lat);
+}
diff --git a/fs/f2fs/iostat.h b/fs/f2fs/iostat.h
index 46e4a36fc8e9..22a2d01f57ef 100644
--- a/fs/f2fs/iostat.h
+++ b/fs/f2fs/iostat.h
@@ -6,6 +6,8 @@
 #ifndef __F2FS_IOSTAT_H__
 #define __F2FS_IOSTAT_H__
 
+struct bio_post_read_ctx;
+
 #ifdef CONFIG_F2FS_IOSTAT
 
 #define DEFAULT_IOSTAT_PERIOD_MS	3000
@@ -13,15 +15,70 @@
 /* maximum period of iostat tracing is 1 day */
 #define MAX_IOSTAT_PERIOD_MS		8640000
 
+enum {
+	READ_IO,
+	WRITE_SYNC_IO,
+	WRITE_ASYNC_IO,
+	MAX_IO_TYPE,
+};
+
+struct iostat_lat_info {
+	unsigned long sum_lat[MAX_IO_TYPE][NR_PAGE_TYPE];	/* sum of io latencies */
+	unsigned long peak_lat[MAX_IO_TYPE][NR_PAGE_TYPE];	/* peak io latency */
+	unsigned int bio_cnt[MAX_IO_TYPE][NR_PAGE_TYPE];	/* bio count */
+};
+
 extern int __maybe_unused iostat_info_seq_show(struct seq_file *seq,
 			void *offset);
 extern void f2fs_reset_iostat(struct f2fs_sb_info *sbi);
 extern void f2fs_update_iostat(struct f2fs_sb_info *sbi,
 			enum iostat_type type, unsigned long long io_bytes);
+
+struct bio_iostat_ctx {
+	struct f2fs_sb_info *sbi;
+	unsigned long submit_ts;
+	enum page_type type;
+	struct bio_post_read_ctx *post_read_ctx;
+};
+
+static inline void iostat_update_submit_ctx(struct bio *bio,
+			enum page_type type)
+{
+	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
+
+	iostat_ctx->submit_ts = jiffies;
+	iostat_ctx->type = type;
+}
+
+static inline struct bio_post_read_ctx *get_post_read_ctx(struct bio *bio)
+{
+	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
+
+	return iostat_ctx->post_read_ctx;
+}
+
+extern void iostat_update_and_unbind_ctx(struct bio *bio, int rw);
+extern void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
+		struct bio *bio, struct bio_post_read_ctx *ctx);
+extern int f2fs_init_iostat_processing(void);
+extern void f2fs_destroy_iostat_processing(void);
 extern int f2fs_init_iostat(struct f2fs_sb_info *sbi);
+extern void f2fs_destroy_iostat(struct f2fs_sb_info *sbi);
 #else
 static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi,
 		enum iostat_type type, unsigned long long io_bytes) {}
+static inline void iostat_update_and_unbind_ctx(struct bio *bio, int rw) {}
+static inline void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
+		struct bio *bio, struct bio_post_read_ctx *ctx) {}
+static inline void iostat_update_submit_ctx(struct bio *bio,
+		enum page_type type) {}
+static inline struct bio_post_read_ctx *get_post_read_ctx(struct bio *bio)
+{
+	return bio->bi_private;
+}
+static inline int f2fs_init_iostat_processing(void) { return 0; }
+static inline void f2fs_destroy_iostat_processing(void) {}
 static inline int f2fs_init_iostat(struct f2fs_sb_info *sbi) { return 0; }
+static inline void f2fs_destroy_iostat(struct f2fs_sb_info *sbi) {}
 #endif
 #endif /* __F2FS_IOSTAT_H__ */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a23926d1a77b..f5148f2fd884 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1574,6 +1574,7 @@ static void f2fs_put_super(struct super_block *sb)
 #endif
 	fscrypt_free_dummy_policy(&F2FS_OPTION(sbi).dummy_enc_policy);
 	destroy_percpu_info(sbi);
+	f2fs_destroy_iostat(sbi);
 	for (i = 0; i < NR_PAGE_TYPE; i++)
 		kvfree(sbi->write_io[i]);
 #ifdef CONFIG_UNICODE
@@ -4001,7 +4002,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 
 	err = init_percpu_info(sbi);
 	if (err)
-		goto free_bio_info;
+		goto free_iostat;
 
 	if (F2FS_IO_ALIGNED(sbi)) {
 		sbi->write_io_dummy =
@@ -4334,6 +4335,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	mempool_destroy(sbi->write_io_dummy);
 free_percpu:
 	destroy_percpu_info(sbi);
+free_iostat:
+	f2fs_destroy_iostat(sbi);
 free_bio_info:
 	for (i = 0; i < NR_PAGE_TYPE; i++)
 		kvfree(sbi->write_io[i]);
@@ -4476,9 +4479,12 @@ static int __init init_f2fs_fs(void)
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
@@ -4500,6 +4506,8 @@ static int __init init_f2fs_fs(void)
 	f2fs_destroy_bioset();
 free_bio_enrty_cache:
 	f2fs_destroy_bio_entry_cache();
+free_iostat:
+	f2fs_destroy_iostat_processing();
 free_post_read:
 	f2fs_destroy_post_read_processing();
 free_root_stats:
@@ -4534,6 +4542,7 @@ static void __exit exit_f2fs_fs(void)
 	f2fs_destroy_compress_mempool();
 	f2fs_destroy_bioset();
 	f2fs_destroy_bio_entry_cache();
+	f2fs_destroy_iostat_processing();
 	f2fs_destroy_post_read_processing();
 	f2fs_destroy_root_stats();
 	unregister_filesystem(&f2fs_fs_type);
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 3eaf19aa89af..4e881d91c874 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1894,6 +1894,101 @@ TRACE_EVENT(f2fs_iostat,
 		__entry->app_mrio, __entry->fs_drio, __entry->fs_gdrio,
 		__entry->fs_cdrio, __entry->fs_nrio, __entry->fs_mrio)
 );
+
+#ifndef __F2FS_IOSTAT_LATENCY_TYPE
+#define __F2FS_IOSTAT_LATENCY_TYPE
+struct f2fs_iostat_latency {
+	unsigned int peak_lat;
+	unsigned int avg_lat;
+	unsigned int cnt;
+};
+#endif /* __F2FS_IOSTAT_LATENCY_TYPE */
+
+TRACE_EVENT(f2fs_iostat_latency,
+
+	TP_PROTO(struct f2fs_sb_info *sbi, struct f2fs_iostat_latency (*iostat_lat)[NR_PAGE_TYPE]),
+
+	TP_ARGS(sbi, iostat_lat),
+
+	TP_STRUCT__entry(
+		__field(dev_t,	dev)
+		__field(unsigned int,	d_rd_peak)
+		__field(unsigned int,	d_rd_avg)
+		__field(unsigned int,	d_rd_cnt)
+		__field(unsigned int,	n_rd_peak)
+		__field(unsigned int,	n_rd_avg)
+		__field(unsigned int,	n_rd_cnt)
+		__field(unsigned int,	m_rd_peak)
+		__field(unsigned int,	m_rd_avg)
+		__field(unsigned int,	m_rd_cnt)
+		__field(unsigned int,	d_wr_s_peak)
+		__field(unsigned int,	d_wr_s_avg)
+		__field(unsigned int,	d_wr_s_cnt)
+		__field(unsigned int,	n_wr_s_peak)
+		__field(unsigned int,	n_wr_s_avg)
+		__field(unsigned int,	n_wr_s_cnt)
+		__field(unsigned int,	m_wr_s_peak)
+		__field(unsigned int,	m_wr_s_avg)
+		__field(unsigned int,	m_wr_s_cnt)
+		__field(unsigned int,	d_wr_as_peak)
+		__field(unsigned int,	d_wr_as_avg)
+		__field(unsigned int,	d_wr_as_cnt)
+		__field(unsigned int,	n_wr_as_peak)
+		__field(unsigned int,	n_wr_as_avg)
+		__field(unsigned int,	n_wr_as_cnt)
+		__field(unsigned int,	m_wr_as_peak)
+		__field(unsigned int,	m_wr_as_avg)
+		__field(unsigned int,	m_wr_as_cnt)
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
+		"rd_data [%u/%u/%u], rd_node [%u/%u/%u], rd_meta [%u/%u/%u], "
+		"wr_sync_data [%u/%u/%u], wr_sync_node [%u/%u/%u], "
+		"wr_sync_meta [%u/%u/%u], wr_async_data [%u/%u/%u], "
+		"wr_async_node [%u/%u/%u], wr_async_meta [%u/%u/%u]",
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
 #endif
 
 TRACE_EVENT(f2fs_bmap,
-- 
2.33.0.rc2.250.ged5fa647cd-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
