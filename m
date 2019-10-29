Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A658E8303
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2019 09:12:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1vRNtBgrY6AOGenEySjJLkHOpQNS9jg/AKN1BrimY8s=; b=FABgUujMuDZuzAJxW4jAI4VFuH
	PqK0xoel0n5gxTxBT0a7mOXwRTJW2PjYSb4HesQ1AemA/V1C3Ap8EemLOJZ5Q1UiMfexWy9T0cW2S
	d/ikjahZyULWgJ7AyLzHvtJ3subIAPTJCazYL3Zmkp+8ZbCgg6MkVY8J9305t8nUcksY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iPMcQ-0006Wu-Pw; Tue, 29 Oct 2019 08:12:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <3mO63XQgKAEk2zmtys35rzzrwp.nzx@flex--robinhsu.bounces.google.com>)
 id 1iPMcP-0006Wk-AW
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Oct 2019 08:12:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=te3ydNPIn3gpqeEynYVfKMFBy5fG2M4vm4RpgzYYoOE=; b=HPCNCNQ6TRNBJCSRxdwI40Mpvd
 /8ByTFM5NSw44TbkH6t9Dl2RuqMBOUSkHrEwUBAzQq7fUK5VbGqhuIzfI1BqD+ywODbiu39g1depD
 hMLLYsINx0UJiCxruPcn/FEaU8rZG4wjhSvIfqWgkdnTgtq2HSHsjOKVbC+uVHAZIjqo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=te3ydNPIn3gpqeEynYVfKMFBy5fG2M4vm4RpgzYYoOE=; b=A
 OVgrgiVW69yhLyerA4rS2wz/Mcy9+Qx74Z+3QG2+uhU9Ylww9xdebxDOfw8nM8uH21RQGh8m+/xR1
 p+fk6aPVZU+XZeibzoQc9mbGfniEbYZoNBbD60sTMoWw4WZRzPWe9YuvRXG5aWdaMP0Vyn/7TEodX
 IgpY1YFl35y9v4q8=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iPMcN-005X7j-AA
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Oct 2019 08:12:45 +0000
Received: by mail-yb1-f202.google.com with SMTP id y17so4511305ybq.17
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 29 Oct 2019 01:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=te3ydNPIn3gpqeEynYVfKMFBy5fG2M4vm4RpgzYYoOE=;
 b=qQ8S4s9GHbjDxh9bFClKW2j19PNIrwNu6qDsNAEDiVScGSGL2Ql0lIE+YGxu/Xq7q2
 f82pDRHfq/Q0+MQjZPuse53YR/jlf10Jza3NK5YZWGdbpoatnHwM2ep6k1uFl8Eox8Ay
 4wE0+3eepIdt+xU5dCPLmj28NqKu2fGXPEZbhd0i2qSYob7Gdojdp5MMReY+S69e4xvp
 zvCPNhorzL24qb6LBHLwqKeEFFxNDiAFKc3WryhKKYH9DPYv9aTfyNFmLrEFWL5MDbNK
 bMV0DA7Ak/Uq0y/pnWZcWxM0xfRSxmmDnPtKVYjUH6nl4sH226NjX6+FG0AUSFrF6em/
 Osew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=te3ydNPIn3gpqeEynYVfKMFBy5fG2M4vm4RpgzYYoOE=;
 b=fQnEyM84K7sIBALDi9k0ItTwyMb4xFZzVNoKPbNkYBIhIrpKrIcpkLWK9aOK7ZKLyL
 6KcyamZ4ubLDH7lbVBCSxMceG/430zt/pJ9cTBeNNwiMUjMlRX12PvM6BMyjSnROoccg
 lQlXeBnM5sUPcAxZU3lUl9efIDGpkh44WxpTJ8lIlr1QrCfiL4KRSOc9wNEy4jEJPn7i
 RAWw90I518gHkj051Kjqq5vCzBrifZrCUq+M/d0CPoqWS6OI/8YT/hcxepVUWIHiDkXq
 anaQxip1z/8OmpFPrxxQn6Y48kLjJGxyN+ow7aroTlWABie3/XBqD6E01GqeN1IPB1sl
 OmWA==
X-Gm-Message-State: APjAAAW+Ot8bQQCmv19ibFzWIVFVSmpY3LJ9bINkJPQHYIMi7p3VrS7z
 s12C0Om1EG4wWib8XX9H9aF2waXXwKAcdg==
X-Google-Smtp-Source: APXvYqz//FJnOPc5ir+3KNgo2VmyqKUAkmCK/bwzU2HFq2SCF/LQe/yB7tCCy8bZM4eY9KE5vvZn7PHbnOlkjQ==
X-Received: by 2002:a25:9d92:: with SMTP id v18mr16766238ybp.176.1572335256680; 
 Tue, 29 Oct 2019 00:47:36 -0700 (PDT)
Date: Tue, 29 Oct 2019 15:47:28 +0800
Message-Id: <20191029074728.171082-1-robinhsu@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
To: jaegeuk@kernel.org, yuchao0@huawei.com, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iPMcN-005X7j-AA
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
From: Robin Hsu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Robin Hsu <robinhsu@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Implemented cache options in F2FS configuration 'c':
	* use c.cache_config.num_cache_entry to set the number of
	  cache entries (in block), minimum 1024, or 0 to disable cache.
	* use c.cache_config.max_hash_collision to set maximum hash
	  collision (max 16).
	* use c.cache_config.dbg_en to enable printing of debug messages.

Signed-off-by: Robin Hsu <robinhsu@google.com>
---
 include/f2fs_fs.h |  20 +++
 lib/libf2fs_io.c  | 317 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 337 insertions(+)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 84f3f3e..a386e61 100644
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
@@ -329,6 +331,18 @@ struct device_info {
 	size_t zone_blocks;
 };
 
+typedef off_t	off64_t;
+
+typedef struct {
+	/* Value 0 means no cache, minimum 1024 */
+	off64_t num_cache_entry;
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
@@ -419,6 +433,9 @@ struct f2fs_configuration {
 
 	/* precomputed fs UUID checksum for seeding other checksums */
 	u_int32_t chksum_seed;
+
+	/* cache parameters */
+	dev_cache_config_t cache_config;
 };
 
 #ifdef CONFIG_64BIT
@@ -1185,6 +1202,9 @@ extern int f2fs_init_sparse_file(void);
 extern int f2fs_finalize_device(void);
 extern int f2fs_fsync_device(void);
 
+extern void dcache_init(void);
+extern void dcache_release(void);
+
 extern int dev_read(void *, __u64, size_t);
 #ifdef POSIX_FADV_WILLNEED
 extern int dev_readahead(__u64, size_t);
diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index 4d0ea0d..4888b6e 100644
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
@@ -64,6 +66,309 @@ static inline off64_t lseek64(int fd, __u64 offset, int set)
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
+static int64_t dcache_raccess;
+static int64_t dcache_rhit;
+static int64_t dcache_rmiss;
+static int64_t dcache_rreplace;
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
+#define MIN_NUM_CACHE_ENTRY  ((off64_t)1024)
+#define MAX_MAX_HASH_COLLISION  16
+
+static int dcache_relocate_offset0[] = {
+	20, -20, 40, -40, 80, -80, 160, -160,
+	320, -320, 640, -640, 1280, -1280, 2560, -2560,
+};
+static int dcache_relocate_offset[16];
+
+static void dcache_print_statistics(void)
+{
+	off64_t i;
+	off64_t useCnt;
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
+	printf ("%lu %lu %ld %ld %ld %ld\n",
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
+static int dcache_alloc_all(int n)
+{
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
+		if (abs(dcache_relocate_offset0[i])
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
+	off64_t n;
+
+	if (c.cache_config.num_cache_entry == 0)
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
+}
+
+static inline char *dcache_addr(off64_t entry)
+{
+	return dcache_buf + F2FS_BLKSIZE * entry;
+}
+
+/* relocate on (n+1)-th collision */
+static inline off64_t dcache_relocate(off64_t entry, int n)
+{
+	return (entry + dcache_relocate_offset[n]) %
+			dcache_config.num_cache_entry;
+}
+
+static off64_t dcache_find(off64_t blk)
+{
+	register off64_t n = dcache_config.num_cache_entry;
+	register unsigned m = dcache_config.max_hash_collision;
+	off64_t entry, least_used, target;
+	unsigned try;
+
+	target = least_used = entry = blk % n;
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
+static int dcache_io_read(int fd, off64_t entry, off64_t offset, off64_t blk)
+{
+	if (lseek64(fd, (off64_t)offset, SEEK_SET) < 0) {
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
+ *          the relevant cache entries
+ *  - Return values:
+ *       0: success
+ *       1: cache not available (uninitialized)
+ *      -1: error
+ */
+static int dcache_update_rw(int fd, void *buf, off64_t offset,
+		size_t byte_count, bool is_write)
+{
+	off64_t blk;
+	int32_t addr_in_blk;
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
+		int32_t cur_size = min(byte_count,
+				(size_t)(F2FS_BLKSIZE - addr_in_blk));
+		off64_t entry = dcache_find(blk);
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
@@ -185,6 +490,7 @@ static int sparse_write_zeroed_blk(__u64 block, int count) { return 0; }
 int dev_read(void *buf, __u64 offset, size_t len)
 {
 	int fd;
+	int err;
 
 	if (c.sparse_mode)
 		return sparse_read_blk(offset / F2FS_BLKSIZE,
@@ -194,6 +500,11 @@ int dev_read(void *buf, __u64 offset, size_t len)
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
@@ -233,6 +544,12 @@ int dev_write(void *buf, __u64 offset, size_t len)
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
2.24.0.rc0.303.g954a862665-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
