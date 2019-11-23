Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB13107C1E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 23 Nov 2019 01:45:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iYJXk-00076C-H9; Sat, 23 Nov 2019 00:44:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iYJXi-00075v-RG
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 23 Nov 2019 00:44:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C0J01NUuekYpoSExCex+S/f5e9tpLt5IY7E2BmdjpEo=; b=QlNFMh+fNnMDHrARhPpBYAjFHJ
 yQaCxgGTMAhtV67lhaIWaCaoH1dyHI7rO1hbGybl8ZonvSZ/QAXsfH/aLthPXqa/fcfDpTrsxL0RT
 W0oeEe93C+kPMGlHHsP5wUor6jtr67Nox4ZauFBlNO4ZrGSYrCdMksvlAENeEq5o+s/w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=C0J01NUuekYpoSExCex+S/f5e9tpLt5IY7E2BmdjpEo=; b=Z
 G1udOsQWpHBQUu/8BWEvXJsWa5xGUlxdJIPEWGD4W1kLuYIyOdUjL6QDDG0+weNmhSLgaOjZG5Pqd
 7NaBRiw3mhplaGWmg5yxODewut0obNSl8GGo3I6PM2THhqDNZsNwGUphCXDBuhH5O5/uNfgZvnjDl
 Tks1UaCLVCuNfjwo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iYJXg-00Atk6-O7
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 23 Nov 2019 00:44:54 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 17A7C2070E;
 Sat, 23 Nov 2019 00:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574469887;
 bh=Y9ylcDbKwaPPgKZe8xrbHxMAqtXA3C5keHTmyJojoS4=;
 h=From:To:Cc:Subject:Date:From;
 b=w+THamV01whKIHO9KsmybR7RwTGP2+6dlntDVRpH7F6gIzLVm6x6VyeAg3sVS2B8j
 X5WDaRNlgA77qgusVY81rKp26E/h1UR3vthYFCO4vkHJ0bmtI4CH832HTFjbde5tWZ
 VRxqMt837J6w9IcPBYC3+ijdBZoxVTw3O07o4qB8=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 22 Nov 2019 16:44:43 -0800
Message-Id: <20191123004444.99166-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iYJXg-00Atk6-O7
Subject: [f2fs-dev] [PATCH 1/2] libf2fs_io: Add user-space cache
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

From: Robin Hsu <robinhsu@google.com>

Implemented cache options in F2FS configuration 'c' (i.e. user
options):
    * use c.cache_config.num_cache_entry to set the number of
      cache entries (in block), minimum 1024, or 0 to disable cache.
    * use c.cache_config.max_hash_collision to set maximum hash
      collision (max 16).
    * use c.cavhe_config.dbg_en to enable printing of debug messages.

Cache properties:
    * Per block save based (block size = f2fs block size = 4K Bytes)
    * Device block indices are used to hash (simple modular hash
      function) to cache indices.
    * A hash collision (when a block is hashed to an already occupied
      cache block) will trigger offset-based relocation to max 16
      other places, at first empty slot found policy.
    * A hash collision with all 17 possible relocating places occupied
      will evict the oldest used one (replaced by the new read block).
      A global 'use' tick is kept ticking-up per block read for this
      purpose.
    * On write cache hit, it will update the corresponding cached
      block.
    * On write cache miss, the data won't be cached.
    * Write-through policy only: never delayed write.
    * On read cache hit, it returns the cached block.
    * On read cache miss, it issues an I/O read to the kernel, and
      then caches and returns the block.
    * Currently read ahead is not implemented.  Yet, the read ahead
      logic is kept as before, i.e. using kernel's read ahead
      mechanism.

Signed-off-by: Robin Hsu <robinhsu@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 include/f2fs_fs.h |  18 +++
 lib/libf2fs_io.c  | 331 +++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 348 insertions(+), 1 deletion(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 84f3f3e..cb67c7e 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -3,6 +3,8 @@
  *
  * Copyright (c) 2012 Samsung Electronics Co., Ltd.
  *             http://www.samsung.com/
+ * Copyright (c) 2019 Google Inc.
+ *             http://www.google.com/
  *
  * Dual licensed under the GPL or LGPL version 2 licenses.
  *
@@ -329,6 +331,16 @@ struct device_info {
 	size_t zone_blocks;
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
 struct f2fs_configuration {
 	u_int32_t reserved_segments;
 	u_int32_t new_reserved_segments;
@@ -419,6 +431,9 @@ struct f2fs_configuration {
 
 	/* precomputed fs UUID checksum for seeding other checksums */
 	u_int32_t chksum_seed;
+
+	/* cache parameters */
+	dev_cache_config_t cache_config;
 };
 
 #ifdef CONFIG_64BIT
@@ -1185,6 +1200,9 @@ extern int f2fs_init_sparse_file(void);
 extern int f2fs_finalize_device(void);
 extern int f2fs_fsync_device(void);
 
+extern void dcache_init(void);
+extern void dcache_release(void);
+
 extern int dev_read(void *, __u64, size_t);
 #ifdef POSIX_FADV_WILLNEED
 extern int dev_readahead(__u64, size_t);
diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index 4d0ea0d..971ae37 100644
--- a/lib/libf2fs_io.c
+++ b/lib/libf2fs_io.c
@@ -3,6 +3,8 @@
  *
  * Copyright (c) 2013 Samsung Electronics Co., Ltd.
  *             http://www.samsung.com/
+ * Copyright (c) 2019 Google Inc.
+ *             http://www.google.com/
  *
  * Dual licensed under the GPL or LGPL version 2 licenses.
  */
@@ -27,7 +29,10 @@
 #include <linux/hdreg.h>
 #endif
 
-#include <f2fs_fs.h>
+#include <stdbool.h>
+#include <assert.h>
+#include <inttypes.h>
+#include "f2fs_fs.h"
 
 struct f2fs_configuration c;
 
@@ -64,6 +69,318 @@ static inline off64_t lseek64(int fd, __u64 offset, int set)
 }
 #endif
 
+/* ---------- dev_cache, Least Used First (LUF) policy  ------------------- */
+/*
+ * Least used block will be the first victim to be replaced when max hash
+ * collision exceeds
+ */
+static bool *dcache_valid; /* is the cached block valid? */
+static off64_t  *dcache_blk; /* which block it cached */
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
+	if ((dcache_blk = (off64_t *) malloc(sizeof(off64_t) * n)) == NULL
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
+static long dcache_find(off64_t blk)
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
+static int dcache_io_read(int fd, long entry, off64_t offset, off64_t blk)
+{
+	if (lseek64(fd, offset, SEEK_SET) < 0) {
+		MSG(0, "\n lseek64 fail.\n");
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
+static int dcache_update_rw(int fd, void *buf, off64_t offset,
+		size_t byte_count, bool is_write)
+{
+	off64_t blk;
+	int addr_in_blk;
+	off64_t start;
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
+		offset += F2FS_BLKSIZE;
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
+inline int dcache_update_cache(int fd, void *buf, off64_t offset, size_t count)
+{
+	return dcache_update_rw(fd, buf, offset, count, true);
+}
+
+/* handles read into cache + read into buffer  */
+inline int dcache_read(int fd, void *buf, off64_t offset, size_t count)
+{
+	return dcache_update_rw(fd, buf, offset, count, false);
+}
+
 /*
  * IO interfaces
  */
@@ -185,6 +502,7 @@ static int sparse_write_zeroed_blk(__u64 block, int count) { return 0; }
 int dev_read(void *buf, __u64 offset, size_t len)
 {
 	int fd;
+	int err;
 
 	if (c.sparse_mode)
 		return sparse_read_blk(offset / F2FS_BLKSIZE,
@@ -194,6 +512,11 @@ int dev_read(void *buf, __u64 offset, size_t len)
 	if (fd < 0)
 		return fd;
 
+	/* err = 1: cache not available, fall back to non-cache R/W */
+	/* err = 0: success, err=-1: I/O error */
+	err = dcache_read(fd, buf, (off64_t)offset, len);
+	if (err <= 0)
+		return err;
 	if (lseek64(fd, (off64_t)offset, SEEK_SET) < 0)
 		return -1;
 	if (read(fd, buf, len) < 0)
@@ -233,6 +556,12 @@ int dev_write(void *buf, __u64 offset, size_t len)
 	if (fd < 0)
 		return fd;
 
+	/*
+	 * dcache_update_cache() just update cache, won't do I/O.
+	 * Thus even no error, we need normal non-cache I/O for actual write
+	 */
+	if (dcache_update_cache(fd, buf, (off64_t)offset, len) < 0)
+		return -1;
 	if (lseek64(fd, (off64_t)offset, SEEK_SET) < 0)
 		return -1;
 	if (write(fd, buf, len) < 0)
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
