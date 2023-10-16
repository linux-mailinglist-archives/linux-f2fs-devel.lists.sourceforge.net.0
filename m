Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 746A67CB5D8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Oct 2023 23:59:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qsVc7-0007nG-Qn;
	Mon, 16 Oct 2023 21:59:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qsVc6-0007mn-6O
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Oct 2023 21:59:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3shEVfTpFKfhk9SC6p1WiugDwE9GAMKBWUL+kHN+uEo=; b=ej7WldpfyniWC2E+2bfxsby85g
 c0iyWJmVzo7dhM5GXB2BYWCYdEfXSkj5Rr2OW9Dtq9xoX8KYVLjZr68zTiAZo7uB+VhFKhB5ybznP
 FeE6/KbUzi4bo5aZfUT7g7qEbNoHT1jB+XUfhU6NVTrmP5EGEKEt9qXgYxuB6RWUKZ/g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3shEVfTpFKfhk9SC6p1WiugDwE9GAMKBWUL+kHN+uEo=; b=R
 m2wPKQnK4SHiDu9eIiKUjgQkQoHDjdAyHDdkigMTWOeSqnCmmvi5s57gqxAW413Gu7n+m1X8O4ZGu
 n1ZpimXpl/LPMJQTYy2vn9wF877FrZ5NjvBrFXJOhqlP/gD1tsrMi7xUzTd6FfMyQ0kz5aw7jn7RH
 pkrKbPdnk/RW/vUI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qsVc2-00HA6c-Pl for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Oct 2023 21:59:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 5F462B81366
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 16 Oct 2023 21:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8565C433C8;
 Mon, 16 Oct 2023 21:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697493531;
 bh=wmeCeJkle4L/W6GIsXWnW3NlJhzYLV51x/HZl/Ro+08=;
 h=From:To:Cc:Subject:Date:From;
 b=b7Df8BSDdkIQEnBhIOPE/LZpdQGkvsqArCSdEVXNmPa8q5zzKJHVIfz3uRDorfoCL
 lY9mJRujLMP6z6aW3hhg4RREjHo0D7PF5Vxt4qskccg2YQhDsz8fVpPJDcEXhnNuY5
 3x3hyfDNGO/v6PquY2gKNbE7nJt0ykxQtMDrMq9agL9iMroijuonv+ZVHwo0auSP8B
 PdbODn5UY50XqT91fquuATb/jDzg3O2Ody425NE9FFKCt6s4D5Q2sXBOoREkhkmRXl
 lIMD47XOtM+T6JG0z6NXqh1vz8bnLHDCagvXJ1DuNIlkVLPf3ul830xhXio3kRIfKK
 HPrpq8w+fpkOw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 16 Oct 2023 14:58:48 -0700
Message-ID: <20231016215849.639313-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This reverts commit 2835107ae3908576b41ff5f6a4e63ba7ec9a6246.
 There's a report that the impact was true. Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 --- fsck/main.c | 18 ++- include/f2fs_fs.h | 18 +++ lib/libf2fs_io.c | 329
 ++++++++++++++++++++++++++++++++++++++++++++++ 3 files changed, 363 insertion
 [...] Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qsVc2-00HA6c-Pl
Subject: [f2fs-dev] [PATCH 1/2] Revert "f2fs-tools: do not support
 user-space cache"
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This reverts commit 2835107ae3908576b41ff5f6a4e63ba7ec9a6246.

There's a report that the impact was true.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/main.c       |  18 ++-
 include/f2fs_fs.h |  18 +++
 lib/libf2fs_io.c  | 329 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 363 insertions(+), 2 deletions(-)

diff --git a/fsck/main.c b/fsck/main.c
index 2100394b144c..6d48d404d83c 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -10,6 +10,9 @@
  *   Liu Shuoran <liushuoran@huawei.com>
  *   Jaegeuk Kim <jaegeuk@kernel.org>
  *  : add sload.f2fs
+ * Copyright (c) 2019 Google Inc.
+ *   Robin Hsu <robinhsu@google.com>
+ *  : add cache layer
  * Copyright (c) 2020 Google Inc.
  *   Robin Hsu <robinhsu@google.com>
  *  : add sload compression support
@@ -23,6 +26,7 @@
 #include <ctype.h>
 #include <time.h>
 #include <getopt.h>
+#include <stdbool.h>
 #include "quotaio.h"
 #include "compress.h"
 
@@ -55,6 +59,10 @@ void fsck_usage()
 	MSG(0, "\nUsage: fsck.f2fs [options] device\n");
 	MSG(0, "[options]:\n");
 	MSG(0, "  -a check/fix potential corruption, reported by f2fs\n");
+	MSG(0, "  -c <num-cache-entry>  set number of cache entries"
+			" (default 0)\n");
+	MSG(0, "  -m <max-hash-collision>  set max cache hash collision"
+			" (default 16)\n");
 	MSG(0, "  -C encoding[:flag1,flag2] Set options for enabling"
 			" casefolding\n");
 	MSG(0, "  -d debug level [default:0]\n");
@@ -72,6 +80,7 @@ void fsck_usage()
 	MSG(0, "  --dry-run do not really fix corruptions\n");
 	MSG(0, "  --no-kernel-check skips detecting kernel change\n");
 	MSG(0, "  --kernel-check checks kernel change\n");
+	MSG(0, "  --debug-cache to debug cache when -c is used\n");
 	exit(1);
 }
 
@@ -232,6 +241,8 @@ void f2fs_parse_options(int argc, char *argv[])
 		};
 
 		c.func = FSCK;
+		c.cache_config.max_hash_collision = 16;
+		c.cache_config.dbg_en = false;
 		while ((option = getopt_long(argc, argv, option_string,
 						long_opt, &opt)) != EOF) {
 			switch (option) {
@@ -248,15 +259,18 @@ void f2fs_parse_options(int argc, char *argv[])
 				MSG(0, "Info: Do Kernel Check\n");
 				break;
 			case 4:
-				MSG(0, "Info: Deprecated option \"debug-cache\"\n");
+				c.cache_config.dbg_en = true;
 				break;
 			case 'a':
 				c.auto_fix = 1;
 				MSG(0, "Info: Automatic fix mode enabled.\n");
 				break;
 			case 'c':
+				c.cache_config.num_cache_entry = atoi(optarg);
+				break;
 			case 'm':
-				MSG(0, "Info: Deprecated option \'%c\'\n", option);
+				c.cache_config.max_hash_collision =
+						atoi(optarg);
 				break;
 			case 'g':
 				if (!strcmp(optarg, "android")) {
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 3c7451c833a2..772a6a59d47e 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -3,6 +3,8 @@
  *
  * Copyright (c) 2012 Samsung Electronics Co., Ltd.
  *             http://www.samsung.com/
+ * Copyright (c) 2019 Google Inc.
+ *             http://www.google.com/
  * Copyright (c) 2020 Google Inc.
  *   Robin Hsu <robinhsu@google.com>
  *  : add sload compression support
@@ -450,6 +452,16 @@ struct device_info {
 	size_t *zone_cap_blocks;
 };
 
+typedef struct {
+	/* Value 0 means no cache, minimum 1024 */
+	long num_cache_entry;
+
+	/* Value 0 means always overwrite (no collision allowed). maximum 16 */
+	unsigned max_hash_collision;
+
+	bool dbg_en;
+} dev_cache_config_t;
+
 /* f2fs_configration for compression used for sload.f2fs */
 typedef struct  {
 	void (*init)(struct compress_ctx *cc);
@@ -1533,6 +1545,9 @@ struct f2fs_configuration {
 	/* precomputed fs UUID checksum for seeding other checksums */
 	uint32_t chksum_seed;
 
+	/* cache parameters */
+	dev_cache_config_t cache_config;
+
 	/* compression support for sload.f2fs */
 	compress_config_t compress;
 
@@ -1584,6 +1599,9 @@ extern void f2fs_release_sparse_resource(void);
 extern int f2fs_finalize_device(void);
 extern int f2fs_fsync_device(void);
 
+extern void dcache_init(void);
+extern void dcache_release(void);
+
 extern int dev_read(void *, __u64, size_t);
 #ifdef POSIX_FADV_WILLNEED
 extern int dev_readahead(__u64, size_t);
diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index e912c30efaf5..74e5f3ac49ba 100644
--- a/lib/libf2fs_io.c
+++ b/lib/libf2fs_io.c
@@ -3,6 +3,8 @@
  *
  * Copyright (c) 2013 Samsung Electronics Co., Ltd.
  *             http://www.samsung.com/
+ * Copyright (c) 2019 Google Inc.
+ *             http://www.google.com/
  * Copyright (c) 2020 Google Inc.
  *   Robin Hsu <robinhsu@google.com>
  *  : add quick-buffer for sload compression support
@@ -32,6 +34,9 @@
 #include <linux/hdreg.h>
 #endif
 
+#include <stdbool.h>
+#include <assert.h>
+#include <inttypes.h>
 #include "f2fs_fs.h"
 
 struct f2fs_configuration c;
@@ -60,6 +65,318 @@ static int __get_device_fd(__u64 *offset)
 	return -1;
 }
 
+/* ---------- dev_cache, Least Used First (LUF) policy  ------------------- */
+/*
+ * Least used block will be the first victim to be replaced when max hash
+ * collision exceeds
+ */
+static bool *dcache_valid; /* is the cached block valid? */
+static off_t  *dcache_blk; /* which block it cached */
+static uint64_t *dcache_lastused; /* last used ticks for cache entries */
+static char *dcache_buf; /* cached block data */
+static uint64_t dcache_usetick; /* current use tick */
+
+static uint64_t dcache_raccess;
+static uint64_t dcache_rhit;
+static uint64_t dcache_rmiss;
+static uint64_t dcache_rreplace;
+
+static bool dcache_exit_registered = false;
+
+/*
+ *  Shadow config:
+ *
+ *  Active set of the configurations.
+ *  Global configuration 'dcache_config' will be transferred here when
+ *  when dcache_init() is called
+ */
+static dev_cache_config_t dcache_config = {0, 16, 1};
+static bool dcache_initialized = false;
+
+#define MIN_NUM_CACHE_ENTRY  1024L
+#define MAX_MAX_HASH_COLLISION  16
+
+static long dcache_relocate_offset0[] = {
+	20, -20, 40, -40, 80, -80, 160, -160,
+	320, -320, 640, -640, 1280, -1280, 2560, -2560,
+};
+static int dcache_relocate_offset[16];
+
+static void dcache_print_statistics(void)
+{
+	long i;
+	long useCnt;
+
+	/* Number of used cache entries */
+	useCnt = 0;
+	for (i = 0; i < dcache_config.num_cache_entry; i++)
+		if (dcache_valid[i])
+			++useCnt;
+
+	/*
+	 *  c: number of cache entries
+	 *  u: used entries
+	 *  RA: number of read access blocks
+	 *  CH: cache hit
+	 *  CM: cache miss
+	 *  Repl: read cache replaced
+	 */
+	printf ("\nc, u, RA, CH, CM, Repl=\n");
+	printf ("%ld %ld %" PRIu64 " %" PRIu64 " %" PRIu64 " %" PRIu64 "\n",
+			dcache_config.num_cache_entry,
+			useCnt,
+			dcache_raccess,
+			dcache_rhit,
+			dcache_rmiss,
+			dcache_rreplace);
+}
+
+void dcache_release(void)
+{
+	if (!dcache_initialized)
+		return;
+
+	dcache_initialized = false;
+
+	if (c.cache_config.dbg_en)
+		dcache_print_statistics();
+
+	if (dcache_blk != NULL)
+		free(dcache_blk);
+	if (dcache_lastused != NULL)
+		free(dcache_lastused);
+	if (dcache_buf != NULL)
+		free(dcache_buf);
+	if (dcache_valid != NULL)
+		free(dcache_valid);
+	dcache_config.num_cache_entry = 0;
+	dcache_blk = NULL;
+	dcache_lastused = NULL;
+	dcache_buf = NULL;
+	dcache_valid = NULL;
+}
+
+// return 0 for success, error code for failure.
+static int dcache_alloc_all(long n)
+{
+	if (n <= 0)
+		return -1;
+	if ((dcache_blk = (off_t *) malloc(sizeof(off_t) * n)) == NULL
+		|| (dcache_lastused = (uint64_t *)
+				malloc(sizeof(uint64_t) * n)) == NULL
+		|| (dcache_buf = (char *) malloc (F2FS_BLKSIZE * n)) == NULL
+		|| (dcache_valid = (bool *) malloc(sizeof(bool) * n)) == NULL)
+	{
+		dcache_release();
+		return -1;
+	}
+	dcache_config.num_cache_entry = n;
+	return 0;
+}
+
+static void dcache_relocate_init(void)
+{
+	int i;
+	int n0 = (sizeof(dcache_relocate_offset0)
+			/ sizeof(dcache_relocate_offset0[0]));
+	int n = (sizeof(dcache_relocate_offset)
+			/ sizeof(dcache_relocate_offset[0]));
+
+	ASSERT(n == n0);
+	for (i = 0; i < n && i < dcache_config.max_hash_collision; i++) {
+		if (labs(dcache_relocate_offset0[i])
+				> dcache_config.num_cache_entry / 2) {
+			dcache_config.max_hash_collision = i;
+			break;
+		}
+		dcache_relocate_offset[i] =
+				dcache_config.num_cache_entry
+				+ dcache_relocate_offset0[i];
+	}
+}
+
+void dcache_init(void)
+{
+	long n;
+
+	if (c.cache_config.num_cache_entry <= 0)
+		return;
+
+	/* release previous cache init, if any */
+	dcache_release();
+
+	dcache_blk = NULL;
+	dcache_lastused = NULL;
+	dcache_buf = NULL;
+	dcache_valid = NULL;
+
+	dcache_config = c.cache_config;
+
+	n = max(MIN_NUM_CACHE_ENTRY, dcache_config.num_cache_entry);
+
+	/* halve alloc size until alloc succeed, or min cache reached */
+	while (dcache_alloc_all(n) != 0 && n !=  MIN_NUM_CACHE_ENTRY)
+		n = max(MIN_NUM_CACHE_ENTRY, n/2);
+
+	/* must be the last: data dependent on num_cache_entry */
+	dcache_relocate_init();
+	dcache_initialized = true;
+
+	if (!dcache_exit_registered) {
+		dcache_exit_registered = true;
+		atexit(dcache_release); /* auto release */
+	}
+
+	dcache_raccess = 0;
+	dcache_rhit = 0;
+	dcache_rmiss = 0;
+	dcache_rreplace = 0;
+}
+
+static inline char *dcache_addr(long entry)
+{
+	return dcache_buf + F2FS_BLKSIZE * entry;
+}
+
+/* relocate on (n+1)-th collision */
+static inline long dcache_relocate(long entry, int n)
+{
+	assert(dcache_config.num_cache_entry != 0);
+	return (entry + dcache_relocate_offset[n]) %
+			dcache_config.num_cache_entry;
+}
+
+static long dcache_find(off_t blk)
+{
+	register long n = dcache_config.num_cache_entry;
+	register unsigned m = dcache_config.max_hash_collision;
+	long entry, least_used, target;
+	unsigned try;
+
+	assert(n > 0);
+	target = least_used = entry = blk % n; /* simple modulo hash */
+
+	for (try = 0; try < m; try++) {
+		if (!dcache_valid[target] || dcache_blk[target] == blk)
+			return target;  /* found target or empty cache slot */
+		if (dcache_lastused[target] < dcache_lastused[least_used])
+			least_used = target;
+		target = dcache_relocate(entry, try); /* next target */
+	}
+	return least_used;  /* max search reached, return least used slot */
+}
+
+/* Physical read into cache */
+static int dcache_io_read(int fd, long entry, off_t offset, off_t blk)
+{
+	if (lseek(fd, offset, SEEK_SET) < 0) {
+		MSG(0, "\n lseek fail.\n");
+		return -1;
+	}
+	if (read(fd, dcache_buf + entry * F2FS_BLKSIZE, F2FS_BLKSIZE) < 0) {
+		MSG(0, "\n read() fail.\n");
+		return -1;
+	}
+	dcache_lastused[entry] = ++dcache_usetick;
+	dcache_valid[entry] = true;
+	dcache_blk[entry] = blk;
+	return 0;
+}
+
+/*
+ *  - Note: Read/Write are not symmetric:
+ *       For read, we need to do it block by block, due to the cache nature:
+ *           some blocks may be cached, and others don't.
+ *       For write, since we always do a write-thru, we can join all writes into one,
+ *       and write it once at the caller.  This function updates the cache for write, but
+ *       not the do a physical write.  The caller is responsible for the physical write.
+ *  - Note: We concentrate read/write together, due to the fact of similar structure to find
+ *          the relavant cache entries
+ *  - Return values:
+ *       0: success
+ *       1: cache not available (uninitialized)
+ *      -1: error
+ */
+static int dcache_update_rw(int fd, void *buf, off_t offset,
+		size_t byte_count, bool is_write)
+{
+	off_t blk;
+	int addr_in_blk;
+	off_t start;
+
+	if (!dcache_initialized)
+		dcache_init(); /* auto initialize */
+
+	if (!dcache_initialized)
+		return 1; /* not available */
+
+	blk = offset / F2FS_BLKSIZE;
+	addr_in_blk = offset % F2FS_BLKSIZE;
+	start = blk * F2FS_BLKSIZE;
+
+	while (byte_count != 0) {
+		size_t cur_size = min(byte_count,
+				(size_t)(F2FS_BLKSIZE - addr_in_blk));
+		long entry = dcache_find(blk);
+
+		if (!is_write)
+			++dcache_raccess;
+
+		if (dcache_valid[entry] && dcache_blk[entry] == blk) {
+			/* cache hit */
+			if (is_write)  /* write: update cache */
+				memcpy(dcache_addr(entry) + addr_in_blk,
+					buf, cur_size);
+			else
+				++dcache_rhit;
+		} else {
+			/* cache miss */
+			if (!is_write) {
+				int err;
+				++dcache_rmiss;
+				if (dcache_valid[entry])
+					++dcache_rreplace;
+				/* read: physical I/O read into cache */
+				err = dcache_io_read(fd, entry, start, blk);
+				if (err)
+					return err;
+			}
+		}
+
+		/* read: copy data from cache */
+		/* write: nothing to do, since we don't do physical write. */
+		if (!is_write)
+			memcpy(buf, dcache_addr(entry) + addr_in_blk,
+				cur_size);
+
+		/* next block */
+		++blk;
+		buf += cur_size;
+		start += F2FS_BLKSIZE;
+		byte_count -= cur_size;
+		addr_in_blk = 0;
+	}
+	return 0;
+}
+
+/*
+ * dcache_update_cache() just update cache, won't do physical I/O.
+ * Thus even no error, we need normal non-cache I/O for actual write
+ *
+ * return value: 1: cache not available
+ *               0: success, -1: I/O error
+ */
+int dcache_update_cache(int fd, void *buf, off_t offset, size_t count)
+{
+	return dcache_update_rw(fd, buf, offset, count, true);
+}
+
+/* handles read into cache + read into buffer  */
+int dcache_read(int fd, void *buf, off_t offset, size_t count)
+{
+	return dcache_update_rw(fd, buf, offset, count, false);
+}
+
 /*
  * IO interfaces
  */
@@ -194,6 +511,7 @@ static int sparse_write_zeroed_blk(__u64 UNUSED(block), int UNUSED(count))
 int dev_read(void *buf, __u64 offset, size_t len)
 {
 	int fd;
+	int err;
 
 	if (c.sparse_mode)
 		return sparse_read_blk(offset / F2FS_BLKSIZE,
@@ -203,6 +521,11 @@ int dev_read(void *buf, __u64 offset, size_t len)
 	if (fd < 0)
 		return fd;
 
+	/* err = 1: cache not available, fall back to non-cache R/W */
+	/* err = 0: success, err=-1: I/O error */
+	err = dcache_read(fd, buf, (off_t)offset, len);
+	if (err <= 0)
+		return err;
 	if (lseek(fd, (off_t)offset, SEEK_SET) < 0)
 		return -1;
 	if (read(fd, buf, len) < 0)
@@ -242,6 +565,12 @@ int dev_write(void *buf, __u64 offset, size_t len)
 	if (fd < 0)
 		return fd;
 
+	/*
+	 * dcache_update_cache() just update cache, won't do I/O.
+	 * Thus even no error, we need normal non-cache I/O for actual write
+	 */
+	if (dcache_update_cache(fd, buf, (off_t)offset, len) < 0)
+		return -1;
 	if (lseek(fd, (off_t)offset, SEEK_SET) < 0)
 		return -1;
 	if (write(fd, buf, len) < 0)
-- 
2.42.0.655.g421f12c284-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
