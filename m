Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF683EF6CC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Aug 2021 02:16:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mG9Fq-00048n-4A; Wed, 18 Aug 2021 00:16:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1mG9Fp-00048c-6Y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 00:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x0TjXWx/W0RGjLI1x6hoyEzjKIrhcXZ/Fl6AcjHXVE4=; b=AMATANmWTBnvRi9wRHLOtcjNxx
 3d/55Ml9LwBkPeOZhBW/iN4R+wKL+zIGZ4NLJXVlfA/sFrxgw4it6hvw0zHp7DNvsg6SF0hdU+jEv
 xPmNeSg5Ws50nWgPWCwPvVBtu8lPrkDY6DeZ8Y9Eh+MO1k0FyVa09VF8Ej/iKNbNSEbg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=x0TjXWx/W0RGjLI1x6hoyEzjKIrhcXZ/Fl6AcjHXVE4=; b=f
 tfIKQNFPu3KR522G/0+cU/d0BAkc0u/FW+wlT5PRFRE7oFyjtYU3oV1LNfvoq6xJg5pk4+v4xZGr5
 W++3YnNDqAjyin7rloYOAacr+BoROVP5RN5LHDNM2FE0lSIt2bfirg0SGPJuvwEncHR/IpFIxeZRL
 rNa2W24yLghVAPzU=;
Received: from mail-pl1-f172.google.com ([209.85.214.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mG9Fn-009rPa-Fe
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 00:16:25 +0000
Received: by mail-pl1-f172.google.com with SMTP id c17so757988plz.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Aug 2021 17:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x0TjXWx/W0RGjLI1x6hoyEzjKIrhcXZ/Fl6AcjHXVE4=;
 b=j1my46y7GhtL4Sy0Cvq9ZP7gbvYL2pQSgvYaQ0EB01FNrh/xUuIzFwddmRc8pw1TWr
 /4ef/1CFPowKSBmcD2tZZ5TrnPyUmIuAVm1KcyOFlzzcVBepwyL2T0WL0W8OsVksWxf6
 FUNzQn/IQSh7I6Txl/2UgZlvVRboKyu0JzgdlAXq2PfjUoQ4RKCuE6xuivq8Um4WnFnR
 Zj3M3fjgB9c27H+lIKyHt/iAsUyUWD0pX1r9d625xxVGV0uMNvuAb/DukdvKfbEJY854
 +PIElPDZ88vaj2H7AK1JtV+xhBN8YvoHXW73woxdXX4XBSP/9KuOJ85P19ys7WOC4zbC
 AsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x0TjXWx/W0RGjLI1x6hoyEzjKIrhcXZ/Fl6AcjHXVE4=;
 b=hto01/cOIo9Gvax1JLnUwihQZ6Wmfaz1/byhZyJdjqMVhh7P+JMp1iAAIaAdY0Iz7i
 hOA7VpBhr7LiESYyy1OoC4AT95zKEtf+p8+P7qgJJ5d2P4AVqov9BVFn9kq+xXjIrFyE
 jR+fSmQmRHzBzCh21bgSViqQ8MJ9+m0qAowP0vM6n5Hav1bTwVHY53EsMHUZR/CeRZsq
 dRWmNHhWxde2tT04QrBT8yiDLZASIgCi2ygQEnxwIK2Bs7Zye7NCXQ9pfJkfpZCqVFRb
 udXjR/rT728TgVZahPYY+oP0pbESiT22l4FCMGgpjxm/0pB3nupEJ+bq2UKeUL0sSws+
 9D8g==
X-Gm-Message-State: AOAM530UXl5X5lcqxpmDWjZZXl/88p86o9g7ZGCTClE21/GCSGHsAQ0r
 6NFjG3rjN/KgSX5qgtCQzo7VGUEbgWA=
X-Google-Smtp-Source: ABdhPJzz3afthnHZjaGX+f/cRGYbjpjbsFpAXzkdl2vBpat24SQmQiHv322mdMzP01eA3nmwQ1O9fA==
X-Received: by 2002:a17:902:ec92:b029:12d:5b18:dd39 with SMTP id
 x18-20020a170902ec92b029012d5b18dd39mr4934360plg.73.1629245777596; 
 Tue, 17 Aug 2021 17:16:17 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:6594:52a8:a6c3:3d3e])
 by smtp.gmail.com with ESMTPSA id u9sm969764pgp.83.2021.08.17.17.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 17:16:16 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 17 Aug 2021 17:16:13 -0700
Message-Id: <20210818001613.1708637-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong Whenever we notice some sluggish issues
 on our machines, we are always curious about how well all types of I/O in
 the f2fs filesystem are handled. But, it's hard to get this kind of real data.
 First o [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.172 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.172 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mG9Fn-009rPa-Fe
Subject: [f2fs-dev] [PATCH v3] f2fs: introduce periodic iostat io latency
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

So, I added F2FS_IOSTAT config option to support printing out
IO latency statistics tracepoint events which are minimal things to
understand filesystem's I/O related behaviors. With "iostat_enable" sysfs
node on, we can get this statistics info in a periodic way and it
would cause the least overhead. Plus, I've moved other I/O statistics
related features into a separate file with the same kernel config option
for better maintenance.

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
v3: moved other I/O statistics related features into a separate file
    with the same kernel config option for better maintenance.
v2: clean up with wrappers and fix a build breakage reported by
    kernel test robot <lkp@intel.com>

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/Kconfig             |   9 ++
 fs/f2fs/Makefile            |   1 +
 fs/f2fs/checkpoint.c        |   1 +
 fs/f2fs/data.c              |  21 ++-
 fs/f2fs/f2fs.h              |  63 ++------
 fs/f2fs/file.c              |   1 +
 fs/f2fs/gc.c                |   1 +
 fs/f2fs/iostat.c            | 294 ++++++++++++++++++++++++++++++++++++
 fs/f2fs/iostat.h            |  84 +++++++++++
 fs/f2fs/node.c              |   1 +
 fs/f2fs/segment.c           |   1 +
 fs/f2fs/super.c             |  23 ++-
 fs/f2fs/sysfs.c             | 106 ++-----------
 include/trace/events/f2fs.h |  97 ++++++++++++
 14 files changed, 548 insertions(+), 155 deletions(-)
 create mode 100644 fs/f2fs/iostat.c
 create mode 100644 fs/f2fs/iostat.h

diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index 2ac026fc3564..63c28e9e153b 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -133,3 +133,12 @@ config F2FS_FS_ZSTD
 	default y
 	help
 	  Support ZSTD compress algorithm, if unsure, say Y.
+
+config F2FS_IOSTAT
+	bool "F2FS IO statistics information"
+	depends on F2FS_FS
+	default n
+	help
+	  Support printing out IO statistics through sysfs and periodic IO type
+	  and latency statistics tracepoint events. For periodic traces, you have
+	  to turn on "iostat_enable" sysfs node to print these traces out.
diff --git a/fs/f2fs/Makefile b/fs/f2fs/Makefile
index e5295746208b..8a7322d229e4 100644
--- a/fs/f2fs/Makefile
+++ b/fs/f2fs/Makefile
@@ -9,3 +9,4 @@ f2fs-$(CONFIG_F2FS_FS_XATTR) += xattr.o
 f2fs-$(CONFIG_F2FS_FS_POSIX_ACL) += acl.o
 f2fs-$(CONFIG_FS_VERITY) += verity.o
 f2fs-$(CONFIG_F2FS_FS_COMPRESSION) += compress.o
+f2fs-$(CONFIG_F2FS_IOSTAT) += iostat.o
diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 7f6745f4630e..cd4f6b34eef9 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -18,6 +18,7 @@
 #include "f2fs.h"
 #include "node.h"
 #include "segment.h"
+#include "iostat.h"
 #include <trace/events/f2fs.h>
 
 #define DEFAULT_CHECKPOINT_IOPRIO (IOPRIO_PRIO_VALUE(IOPRIO_CLASS_BE, 3))
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index df5e8d8c654e..57abcbd4a1cc 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -25,6 +25,7 @@
 #include "f2fs.h"
 #include "node.h"
 #include "segment.h"
+#include "iostat.h"
 #include <trace/events/f2fs.h>
 
 #define NUM_PREALLOC_POST_READ_CTXS	128
@@ -270,7 +271,10 @@ static void f2fs_post_read_work(struct work_struct *work)
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
@@ -292,10 +296,13 @@ static void f2fs_read_end_io(struct bio *bio)
 
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
@@ -399,6 +406,8 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
 		bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi,
 						fio->type, fio->temp);
 	}
+	iostat_alloc_and_bind_ctx(sbi, bio, NULL);
+
 	if (fio->io_wbc)
 		wbc_init_bio(fio->io_wbc, bio);
 
@@ -480,6 +489,9 @@ static inline void __submit_bio(struct f2fs_sb_info *sbi,
 		trace_f2fs_submit_read_bio(sbi->sb, type, bio);
 	else
 		trace_f2fs_submit_write_bio(sbi->sb, type, bio);
+
+	iostat_update_submit_ctx(bio, type);
+
 	submit_bio(bio);
 }
 
@@ -971,7 +983,7 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct bio *bio;
-	struct bio_post_read_ctx *ctx;
+	struct bio_post_read_ctx *ctx = NULL;
 	unsigned int post_read_steps = 0;
 
 	bio = bio_alloc_bioset(for_write ? GFP_NOIO : GFP_KERNEL,
@@ -1007,6 +1019,7 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 		ctx->fs_blkaddr = blkaddr;
 		bio->bi_private = ctx;
 	}
+	iostat_alloc_and_bind_ctx(sbi, bio, ctx);
 
 	return bio;
 }
@@ -2245,7 +2258,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		if (bio_add_page(bio, page, blocksize, 0) < blocksize)
 			goto submit_and_realloc;
 
-		ctx = bio->bi_private;
+		ctx = get_post_read_ctx(bio);
 		ctx->enabled_steps |= STEP_DECOMPRESS;
 		refcount_inc(&dic->refcnt);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e97b4d8c5efc..843450538aca 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1711,14 +1711,6 @@ struct f2fs_sb_info {
 #endif
 	spinlock_t stat_lock;			/* lock for stat operations */
 
-	/* For app/fs IO statistics */
-	spinlock_t iostat_lock;
-	unsigned long long rw_iostat[NR_IO_TYPE];
-	unsigned long long prev_rw_iostat[NR_IO_TYPE];
-	bool iostat_enable;
-	unsigned long iostat_next_period;
-	unsigned int iostat_period_ms;
-
 	/* to attach REQ_META|REQ_FUA flags */
 	unsigned int data_io_flag;
 	unsigned int node_io_flag;
@@ -1778,6 +1770,20 @@ struct f2fs_sb_info {
 	unsigned int compress_watermark;	/* cache page watermark */
 	atomic_t compress_page_hit;		/* cache hit count */
 #endif
+
+#ifdef CONFIG_F2FS_IOSTAT
+	/* For app/fs IO statistics */
+	spinlock_t iostat_lock;
+	unsigned long long rw_iostat[NR_IO_TYPE];
+	unsigned long long prev_rw_iostat[NR_IO_TYPE];
+	bool iostat_enable;
+	unsigned long iostat_next_period;
+	unsigned int iostat_period_ms;
+
+	/* For io latency related statistics info in one iostat period */
+	spinlock_t iostat_lat_lock;
+	struct iostat_lat_info *iostat_io_lat;
+#endif
 };
 
 struct f2fs_private_dio {
@@ -3241,47 +3247,6 @@ static inline int get_inline_xattr_addrs(struct inode *inode)
 		sizeof((f2fs_inode)->field))			\
 		<= (F2FS_OLD_ATTRIBUTE_SIZE + (extra_isize)))	\
 
-#define DEFAULT_IOSTAT_PERIOD_MS	3000
-#define MIN_IOSTAT_PERIOD_MS		100
-/* maximum period of iostat tracing is 1 day */
-#define MAX_IOSTAT_PERIOD_MS		8640000
-
-static inline void f2fs_reset_iostat(struct f2fs_sb_info *sbi)
-{
-	int i;
-
-	spin_lock(&sbi->iostat_lock);
-	for (i = 0; i < NR_IO_TYPE; i++) {
-		sbi->rw_iostat[i] = 0;
-		sbi->prev_rw_iostat[i] = 0;
-	}
-	spin_unlock(&sbi->iostat_lock);
-}
-
-extern void f2fs_record_iostat(struct f2fs_sb_info *sbi);
-
-static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi,
-			enum iostat_type type, unsigned long long io_bytes)
-{
-	if (!sbi->iostat_enable)
-		return;
-	spin_lock(&sbi->iostat_lock);
-	sbi->rw_iostat[type] += io_bytes;
-
-	if (type == APP_WRITE_IO || type == APP_DIRECT_IO)
-		sbi->rw_iostat[APP_BUFFERED_IO] =
-			sbi->rw_iostat[APP_WRITE_IO] -
-			sbi->rw_iostat[APP_DIRECT_IO];
-
-	if (type == APP_READ_IO || type == APP_DIRECT_READ_IO)
-		sbi->rw_iostat[APP_BUFFERED_READ_IO] =
-			sbi->rw_iostat[APP_READ_IO] -
-			sbi->rw_iostat[APP_DIRECT_READ_IO];
-	spin_unlock(&sbi->iostat_lock);
-
-	f2fs_record_iostat(sbi);
-}
-
 #define __is_large_section(sbi)		((sbi)->segs_per_sec > 1)
 
 #define __is_meta_io(fio) (PAGE_TYPE_OF_BIO((fio)->type) == META)
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 7d8ee60f6c1f..ba06ee94afa9 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -31,6 +31,7 @@
 #include "xattr.h"
 #include "acl.h"
 #include "gc.h"
+#include "iostat.h"
 #include <trace/events/f2fs.h>
 #include <uapi/linux/f2fs.h>
 
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 9dce44619069..c88267929c8c 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -19,6 +19,7 @@
 #include "node.h"
 #include "segment.h"
 #include "gc.h"
+#include "iostat.h"
 #include <trace/events/f2fs.h>
 
 static struct kmem_cache *victim_entry_slab;
diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
new file mode 100644
index 000000000000..1b647f027729
--- /dev/null
+++ b/fs/f2fs/iostat.c
@@ -0,0 +1,294 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * f2fs io latency iostat support
+ *
+ * Copyright 2021 Google LLC
+ * Author: Daeho Jeong <daehojeong@google.com>
+ */
+
+#include <linux/fs.h>
+#include <linux/f2fs_fs.h>
+#include <linux/seq_file.h>
+
+#include "f2fs.h"
+#include "iostat.h"
+#include <trace/events/f2fs.h>
+
+#define NUM_PREALLOC_IOSTAT_CTXS	128
+static struct kmem_cache *bio_iostat_ctx_cache;
+static mempool_t *bio_iostat_ctx_pool;
+
+int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
+{
+	struct super_block *sb = seq->private;
+	struct f2fs_sb_info *sbi = F2FS_SB(sb);
+	time64_t now = ktime_get_real_seconds();
+
+	if (!sbi->iostat_enable)
+		return 0;
+
+	seq_printf(seq, "time:		%-16llu\n", now);
+
+	/* print app write IOs */
+	seq_puts(seq, "[WRITE]\n");
+	seq_printf(seq, "app buffered:	%-16llu\n",
+				sbi->rw_iostat[APP_BUFFERED_IO]);
+	seq_printf(seq, "app direct:	%-16llu\n",
+				sbi->rw_iostat[APP_DIRECT_IO]);
+	seq_printf(seq, "app mapped:	%-16llu\n",
+				sbi->rw_iostat[APP_MAPPED_IO]);
+
+	/* print fs write IOs */
+	seq_printf(seq, "fs data:	%-16llu\n",
+				sbi->rw_iostat[FS_DATA_IO]);
+	seq_printf(seq, "fs node:	%-16llu\n",
+				sbi->rw_iostat[FS_NODE_IO]);
+	seq_printf(seq, "fs meta:	%-16llu\n",
+				sbi->rw_iostat[FS_META_IO]);
+	seq_printf(seq, "fs gc data:	%-16llu\n",
+				sbi->rw_iostat[FS_GC_DATA_IO]);
+	seq_printf(seq, "fs gc node:	%-16llu\n",
+				sbi->rw_iostat[FS_GC_NODE_IO]);
+	seq_printf(seq, "fs cp data:	%-16llu\n",
+				sbi->rw_iostat[FS_CP_DATA_IO]);
+	seq_printf(seq, "fs cp node:	%-16llu\n",
+				sbi->rw_iostat[FS_CP_NODE_IO]);
+	seq_printf(seq, "fs cp meta:	%-16llu\n",
+				sbi->rw_iostat[FS_CP_META_IO]);
+
+	/* print app read IOs */
+	seq_puts(seq, "[READ]\n");
+	seq_printf(seq, "app buffered:	%-16llu\n",
+				sbi->rw_iostat[APP_BUFFERED_READ_IO]);
+	seq_printf(seq, "app direct:	%-16llu\n",
+				sbi->rw_iostat[APP_DIRECT_READ_IO]);
+	seq_printf(seq, "app mapped:	%-16llu\n",
+				sbi->rw_iostat[APP_MAPPED_READ_IO]);
+
+	/* print fs read IOs */
+	seq_printf(seq, "fs data:	%-16llu\n",
+				sbi->rw_iostat[FS_DATA_READ_IO]);
+	seq_printf(seq, "fs gc data:	%-16llu\n",
+				sbi->rw_iostat[FS_GDATA_READ_IO]);
+	seq_printf(seq, "fs compr_data:	%-16llu\n",
+				sbi->rw_iostat[FS_CDATA_READ_IO]);
+	seq_printf(seq, "fs node:	%-16llu\n",
+				sbi->rw_iostat[FS_NODE_READ_IO]);
+	seq_printf(seq, "fs meta:	%-16llu\n",
+				sbi->rw_iostat[FS_META_READ_IO]);
+
+	/* print other IOs */
+	seq_puts(seq, "[OTHER]\n");
+	seq_printf(seq, "fs discard:	%-16llu\n",
+				sbi->rw_iostat[FS_DISCARD]);
+
+	return 0;
+}
+
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
+static inline void f2fs_record_iostat(struct f2fs_sb_info *sbi)
+{
+	unsigned long long iostat_diff[NR_IO_TYPE];
+	int i;
+
+	if (time_is_after_jiffies(sbi->iostat_next_period))
+		return;
+
+	/* Need double check under the lock */
+	spin_lock(&sbi->iostat_lock);
+	if (time_is_after_jiffies(sbi->iostat_next_period)) {
+		spin_unlock(&sbi->iostat_lock);
+		return;
+	}
+	sbi->iostat_next_period = jiffies +
+				msecs_to_jiffies(sbi->iostat_period_ms);
+
+	for (i = 0; i < NR_IO_TYPE; i++) {
+		iostat_diff[i] = sbi->rw_iostat[i] -
+				sbi->prev_rw_iostat[i];
+		sbi->prev_rw_iostat[i] = sbi->rw_iostat[i];
+	}
+	spin_unlock(&sbi->iostat_lock);
+
+	trace_f2fs_iostat(sbi, iostat_diff);
+
+	__record_iostat_latency(sbi);
+}
+
+void f2fs_reset_iostat(struct f2fs_sb_info *sbi)
+{
+	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
+	int i;
+
+	spin_lock(&sbi->iostat_lock);
+	for (i = 0; i < NR_IO_TYPE; i++) {
+		sbi->rw_iostat[i] = 0;
+		sbi->prev_rw_iostat[i] = 0;
+	}
+	spin_unlock(&sbi->iostat_lock);
+
+	spin_lock_irq(&sbi->iostat_lat_lock);
+	for (i = 0; i < MAX_IO_TYPE; i++) {
+		int iotype;
+
+		for (iotype = 0; iotype < NR_PAGE_TYPE; iotype++) {
+			io_lat->sum_lat[i][iotype] = 0;
+			io_lat->peak_lat[i][iotype] = 0;
+			io_lat->bio_cnt[i][iotype] = 0;
+		}
+	}
+	spin_unlock_irq(&sbi->iostat_lat_lock);
+}
+
+void f2fs_update_iostat(struct f2fs_sb_info *sbi,
+			enum iostat_type type, unsigned long long io_bytes)
+{
+	if (!sbi->iostat_enable)
+		return;
+	spin_lock(&sbi->iostat_lock);
+	sbi->rw_iostat[type] += io_bytes;
+
+	if (type == APP_WRITE_IO || type == APP_DIRECT_IO)
+		sbi->rw_iostat[APP_BUFFERED_IO] =
+			sbi->rw_iostat[APP_WRITE_IO] -
+			sbi->rw_iostat[APP_DIRECT_IO];
+
+	if (type == APP_READ_IO || type == APP_DIRECT_READ_IO)
+		sbi->rw_iostat[APP_BUFFERED_READ_IO] =
+			sbi->rw_iostat[APP_READ_IO] -
+			sbi->rw_iostat[APP_DIRECT_READ_IO];
+	spin_unlock(&sbi->iostat_lock);
+
+	f2fs_record_iostat(sbi);
+}
+
+static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx,
+				int rw, int sync_type)
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
+		if (sync_type == 0)
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
+	int sync_type = bio->bi_opf & REQ_SYNC ? 0 : 1;
+
+	if (rw == 0)
+		bio->bi_private = iostat_ctx->post_read_ctx;
+	else
+		bio->bi_private = iostat_ctx->sbi;
+	__update_iostat_latency(iostat_ctx, rw, sync_type);
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
+int f2fs_init_iostat(struct f2fs_sb_info *sbi)
+{
+	/* init iostat info */
+	spin_lock_init(&sbi->iostat_lock);
+	spin_lock_init(&sbi->iostat_lat_lock);
+	sbi->iostat_enable = false;
+	sbi->iostat_period_ms = DEFAULT_IOSTAT_PERIOD_MS;
+	sbi->iostat_io_lat = f2fs_kzalloc(sbi, sizeof(struct iostat_lat_info),
+					GFP_KERNEL);
+	if (!sbi->iostat_io_lat)
+		return -ENOMEM;
+
+	return 0;
+}
+
+void f2fs_destroy_iostat(struct f2fs_sb_info *sbi)
+{
+	kfree(sbi->iostat_io_lat);
+}
diff --git a/fs/f2fs/iostat.h b/fs/f2fs/iostat.h
new file mode 100644
index 000000000000..22a2d01f57ef
--- /dev/null
+++ b/fs/f2fs/iostat.h
@@ -0,0 +1,84 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2021 Google LLC
+ * Author: Daeho Jeong <daehojeong@google.com>
+ */
+#ifndef __F2FS_IOSTAT_H__
+#define __F2FS_IOSTAT_H__
+
+struct bio_post_read_ctx;
+
+#ifdef CONFIG_F2FS_IOSTAT
+
+#define DEFAULT_IOSTAT_PERIOD_MS	3000
+#define MIN_IOSTAT_PERIOD_MS		100
+/* maximum period of iostat tracing is 1 day */
+#define MAX_IOSTAT_PERIOD_MS		8640000
+
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
+extern int __maybe_unused iostat_info_seq_show(struct seq_file *seq,
+			void *offset);
+extern void f2fs_reset_iostat(struct f2fs_sb_info *sbi);
+extern void f2fs_update_iostat(struct f2fs_sb_info *sbi,
+			enum iostat_type type, unsigned long long io_bytes);
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
+extern int f2fs_init_iostat(struct f2fs_sb_info *sbi);
+extern void f2fs_destroy_iostat(struct f2fs_sb_info *sbi);
+#else
+static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi,
+		enum iostat_type type, unsigned long long io_bytes) {}
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
+static inline int f2fs_init_iostat(struct f2fs_sb_info *sbi) { return 0; }
+static inline void f2fs_destroy_iostat(struct f2fs_sb_info *sbi) {}
+#endif
+#endif /* __F2FS_IOSTAT_H__ */
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 9d838a7929fb..a5731838f41a 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -17,6 +17,7 @@
 #include "node.h"
 #include "segment.h"
 #include "xattr.h"
+#include "iostat.h"
 #include <trace/events/f2fs.h>
 
 #define on_f2fs_build_free_nids(nmi) mutex_is_locked(&(nm_i)->build_lock)
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index ca9876a6d396..e03d1c1d9644 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -20,6 +20,7 @@
 #include "segment.h"
 #include "node.h"
 #include "gc.h"
+#include "iostat.h"
 #include <trace/events/f2fs.h>
 
 #define __reverse_ffz(x) __reverse_ffs(~(x))
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 84cd085020cd..8cb187bf877e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -33,6 +33,7 @@
 #include "segment.h"
 #include "xattr.h"
 #include "gc.h"
+#include "iostat.h"
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/f2fs.h>
@@ -1571,6 +1572,7 @@ static void f2fs_put_super(struct super_block *sb)
 #endif
 	fscrypt_free_dummy_policy(&F2FS_OPTION(sbi).dummy_enc_policy);
 	destroy_percpu_info(sbi);
+	f2fs_destroy_iostat(sbi);
 	for (i = 0; i < NR_PAGE_TYPE; i++)
 		kvfree(sbi->write_io[i]);
 #ifdef CONFIG_UNICODE
@@ -3948,11 +3950,6 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	set_sbi_flag(sbi, SBI_POR_DOING);
 	spin_lock_init(&sbi->stat_lock);
 
-	/* init iostat info */
-	spin_lock_init(&sbi->iostat_lock);
-	sbi->iostat_enable = false;
-	sbi->iostat_period_ms = DEFAULT_IOSTAT_PERIOD_MS;
-
 	for (i = 0; i < NR_PAGE_TYPE; i++) {
 		int n = (i == META) ? 1 : NR_TEMP_TYPE;
 		int j;
@@ -3983,10 +3980,14 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	init_waitqueue_head(&sbi->cp_wait);
 	init_sb_info(sbi);
 
-	err = init_percpu_info(sbi);
+	err = f2fs_init_iostat(sbi);
 	if (err)
 		goto free_bio_info;
 
+	err = init_percpu_info(sbi);
+	if (err)
+		goto free_iostat;
+
 	if (F2FS_IO_ALIGNED(sbi)) {
 		sbi->write_io_dummy =
 			mempool_create_page_pool(2 * (F2FS_IO_SIZE(sbi) - 1), 0);
@@ -4318,6 +4319,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	mempool_destroy(sbi->write_io_dummy);
 free_percpu:
 	destroy_percpu_info(sbi);
+free_iostat:
+	f2fs_destroy_iostat(sbi);
 free_bio_info:
 	for (i = 0; i < NR_PAGE_TYPE; i++)
 		kvfree(sbi->write_io[i]);
@@ -4460,9 +4463,12 @@ static int __init init_f2fs_fs(void)
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
@@ -4484,6 +4490,8 @@ static int __init init_f2fs_fs(void)
 	f2fs_destroy_bioset();
 free_bio_enrty_cache:
 	f2fs_destroy_bio_entry_cache();
+free_iostat:
+	f2fs_destroy_iostat_processing();
 free_post_read:
 	f2fs_destroy_post_read_processing();
 free_root_stats:
@@ -4518,6 +4526,7 @@ static void __exit exit_f2fs_fs(void)
 	f2fs_destroy_compress_mempool();
 	f2fs_destroy_bioset();
 	f2fs_destroy_bio_entry_cache();
+	f2fs_destroy_iostat_processing();
 	f2fs_destroy_post_read_processing();
 	f2fs_destroy_root_stats();
 	unregister_filesystem(&f2fs_fs_type);
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 0954761341d7..90abe9443300 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -17,6 +17,7 @@
 #include "f2fs.h"
 #include "segment.h"
 #include "gc.h"
+#include "iostat.h"
 #include <trace/events/f2fs.h>
 
 static struct proc_dir_entry *f2fs_proc_root;
@@ -477,6 +478,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+#ifdef CONFIG_F2FS_IOSTAT
 	if (!strcmp(a->attr.name, "iostat_enable")) {
 		sbi->iostat_enable = !!t;
 		if (!sbi->iostat_enable)
@@ -492,6 +494,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		spin_unlock(&sbi->iostat_lock);
 		return count;
 	}
+#endif
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	if (!strcmp(a->attr.name, "compr_written_block") ||
@@ -700,8 +703,10 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, discard_idle_interval,
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_idle_interval, interval_time[GC_TIME]);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info,
 		umount_discard_timeout, interval_time[UMOUNT_DISCARD_TIMEOUT]);
+#ifdef CONFIG_F2FS_IOSTAT
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, iostat_enable, iostat_enable);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, iostat_period_ms, iostat_period_ms);
+#endif
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, readdir_ra, readdir_ra);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_io_bytes, max_io_bytes);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_pin_file_thresh, gc_pin_file_threshold);
@@ -807,8 +812,10 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(discard_idle_interval),
 	ATTR_LIST(gc_idle_interval),
 	ATTR_LIST(umount_discard_timeout),
+#ifdef CONFIG_F2FS_IOSTAT
 	ATTR_LIST(iostat_enable),
 	ATTR_LIST(iostat_period_ms),
+#endif
 	ATTR_LIST(readdir_ra),
 	ATTR_LIST(max_io_bytes),
 	ATTR_LIST(gc_pin_file_thresh),
@@ -1076,101 +1083,6 @@ static int __maybe_unused segment_bits_seq_show(struct seq_file *seq,
 	return 0;
 }
 
-void f2fs_record_iostat(struct f2fs_sb_info *sbi)
-{
-	unsigned long long iostat_diff[NR_IO_TYPE];
-	int i;
-
-	if (time_is_after_jiffies(sbi->iostat_next_period))
-		return;
-
-	/* Need double check under the lock */
-	spin_lock(&sbi->iostat_lock);
-	if (time_is_after_jiffies(sbi->iostat_next_period)) {
-		spin_unlock(&sbi->iostat_lock);
-		return;
-	}
-	sbi->iostat_next_period = jiffies +
-				msecs_to_jiffies(sbi->iostat_period_ms);
-
-	for (i = 0; i < NR_IO_TYPE; i++) {
-		iostat_diff[i] = sbi->rw_iostat[i] -
-				sbi->prev_rw_iostat[i];
-		sbi->prev_rw_iostat[i] = sbi->rw_iostat[i];
-	}
-	spin_unlock(&sbi->iostat_lock);
-
-	trace_f2fs_iostat(sbi, iostat_diff);
-}
-
-static int __maybe_unused iostat_info_seq_show(struct seq_file *seq,
-					       void *offset)
-{
-	struct super_block *sb = seq->private;
-	struct f2fs_sb_info *sbi = F2FS_SB(sb);
-	time64_t now = ktime_get_real_seconds();
-
-	if (!sbi->iostat_enable)
-		return 0;
-
-	seq_printf(seq, "time:		%-16llu\n", now);
-
-	/* print app write IOs */
-	seq_puts(seq, "[WRITE]\n");
-	seq_printf(seq, "app buffered:	%-16llu\n",
-				sbi->rw_iostat[APP_BUFFERED_IO]);
-	seq_printf(seq, "app direct:	%-16llu\n",
-				sbi->rw_iostat[APP_DIRECT_IO]);
-	seq_printf(seq, "app mapped:	%-16llu\n",
-				sbi->rw_iostat[APP_MAPPED_IO]);
-
-	/* print fs write IOs */
-	seq_printf(seq, "fs data:	%-16llu\n",
-				sbi->rw_iostat[FS_DATA_IO]);
-	seq_printf(seq, "fs node:	%-16llu\n",
-				sbi->rw_iostat[FS_NODE_IO]);
-	seq_printf(seq, "fs meta:	%-16llu\n",
-				sbi->rw_iostat[FS_META_IO]);
-	seq_printf(seq, "fs gc data:	%-16llu\n",
-				sbi->rw_iostat[FS_GC_DATA_IO]);
-	seq_printf(seq, "fs gc node:	%-16llu\n",
-				sbi->rw_iostat[FS_GC_NODE_IO]);
-	seq_printf(seq, "fs cp data:	%-16llu\n",
-				sbi->rw_iostat[FS_CP_DATA_IO]);
-	seq_printf(seq, "fs cp node:	%-16llu\n",
-				sbi->rw_iostat[FS_CP_NODE_IO]);
-	seq_printf(seq, "fs cp meta:	%-16llu\n",
-				sbi->rw_iostat[FS_CP_META_IO]);
-
-	/* print app read IOs */
-	seq_puts(seq, "[READ]\n");
-	seq_printf(seq, "app buffered:	%-16llu\n",
-				sbi->rw_iostat[APP_BUFFERED_READ_IO]);
-	seq_printf(seq, "app direct:	%-16llu\n",
-				sbi->rw_iostat[APP_DIRECT_READ_IO]);
-	seq_printf(seq, "app mapped:	%-16llu\n",
-				sbi->rw_iostat[APP_MAPPED_READ_IO]);
-
-	/* print fs read IOs */
-	seq_printf(seq, "fs data:	%-16llu\n",
-				sbi->rw_iostat[FS_DATA_READ_IO]);
-	seq_printf(seq, "fs gc data:	%-16llu\n",
-				sbi->rw_iostat[FS_GDATA_READ_IO]);
-	seq_printf(seq, "fs compr_data:	%-16llu\n",
-				sbi->rw_iostat[FS_CDATA_READ_IO]);
-	seq_printf(seq, "fs node:	%-16llu\n",
-				sbi->rw_iostat[FS_NODE_READ_IO]);
-	seq_printf(seq, "fs meta:	%-16llu\n",
-				sbi->rw_iostat[FS_META_READ_IO]);
-
-	/* print other IOs */
-	seq_puts(seq, "[OTHER]\n");
-	seq_printf(seq, "fs discard:	%-16llu\n",
-				sbi->rw_iostat[FS_DISCARD]);
-
-	return 0;
-}
-
 static int __maybe_unused victim_bits_seq_show(struct seq_file *seq,
 						void *offset)
 {
@@ -1257,8 +1169,10 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
 				segment_info_seq_show, sb);
 		proc_create_single_data("segment_bits", S_IRUGO, sbi->s_proc,
 				segment_bits_seq_show, sb);
+#ifdef CONFIG_F2FS_IOSTAT
 		proc_create_single_data("iostat_info", S_IRUGO, sbi->s_proc,
 				iostat_info_seq_show, sb);
+#endif
 		proc_create_single_data("victim_bits", S_IRUGO, sbi->s_proc,
 				victim_bits_seq_show, sb);
 	}
@@ -1278,7 +1192,9 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
 void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
 {
 	if (sbi->s_proc) {
+#ifdef CONFIG_F2FS_IOSTAT
 		remove_proc_entry("iostat_info", sbi->s_proc);
+#endif
 		remove_proc_entry("segment_info", sbi->s_proc);
 		remove_proc_entry("segment_bits", sbi->s_proc);
 		remove_proc_entry("victim_bits", sbi->s_proc);
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 56b113e3cd6a..4e881d91c874 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1818,6 +1818,7 @@ DEFINE_EVENT(f2fs_zip_end, f2fs_decompress_pages_end,
 	TP_ARGS(inode, cluster_idx, compressed_size, ret)
 );
 
+#ifdef CONFIG_F2FS_IOSTAT
 TRACE_EVENT(f2fs_iostat,
 
 	TP_PROTO(struct f2fs_sb_info *sbi, unsigned long long *iostat),
@@ -1894,6 +1895,102 @@ TRACE_EVENT(f2fs_iostat,
 		__entry->fs_cdrio, __entry->fs_nrio, __entry->fs_mrio)
 );
 
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
+#endif
+
 TRACE_EVENT(f2fs_bmap,
 
 	TP_PROTO(struct inode *inode, sector_t lblock, sector_t pblock),
-- 
2.33.0.rc1.237.g0d66db33f3-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
