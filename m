Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9BC787AA2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Aug 2023 23:45:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZI99-0002CF-Kk;
	Thu, 24 Aug 2023 21:45:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qZI99-0002C9-5t
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Aug 2023 21:45:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xo3wxU1rXOljla24sOrpvpyY7d9sxlJL/bz9zkNhoCA=; b=lFbnZ1Ahiq1eZYGjx2LCIWFud7
 iS0Mj+cACU2CvVsIkzVlSs8Rq/2vS46OnabE7OhSJu6BcjpIU1m9hZVieeD+oCJ9WQyeNP23QDWz3
 HP5YpXhrq6osJTUJjDewjofdUwUcCIJ2LFO6iFRI+pQFQXTPrSdP/JfZhCyIjAUPZF+8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Xo3wxU1rXOljla24sOrpvpyY7d9sxlJL/bz9zkNhoCA=; b=l
 +vOXmIAwWY6bgMO1+7ve/snLewGEYbJlnXSaIW3+IJfNMPY2Ay12ccJkhxnlJzrgmkoJ6uaNLdcqf
 xbvFhWceOh5frjCgpsP3Sv1DJOyvfwnadncKA2MNDJKrs/MVQb14Ji9caN9NoMclHayPe/Tfw4GZ/
 3Fh6gYtfWVlUsJBM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qZI96-0008G4-8H for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Aug 2023 21:45:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 95820627F5;
 Thu, 24 Aug 2023 21:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E58DFC433C8;
 Thu, 24 Aug 2023 21:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692913534;
 bh=XGyG55Zd/kbMqJtfPwPqQQ3JjL8ueU7vroZATupOxPU=;
 h=From:To:Cc:Subject:Date:From;
 b=X+Nhl/+Jx8dZwiuMkysGfsPThYErLSaXjYEp0Kki/JmR+r9aXQ6b9RxqpsIQkbT1K
 ixdWuIYJ6I2bSdGmk0LWo9PLV5vx3IaQBtf83Qr/IRpZswkSiUZ/A08hxPeA0q6Usl
 ztTJO29EC3b+xkPerhH+oTEK5dSw1nPpcAKYE58mRFtpxMOEGz10sGwTe0c8PPG3rU
 tF9ElXG3sSPqs58HKCJ3O6MW4UXKU0XWrrLSzt0jdu0dpvypr4ni5usFsudqFTY5bj
 agIGD9xxGOgjnuuhIypjqVu7oCooHuKcPd3rxq6EdAa5q/v9kYgfWgjJ5Bl3rkT/fp
 firXfGIcPrITA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 24 Aug 2023 14:45:32 -0700
Message-ID: <20230824214532.2021270-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Waldemar Brodkorb <wbx@openadk.org> This patch replaces
 lseek64 with lseek() having #define _FILE_OFFSET_BITS 64. Signed-off-by:
 Waldemar Brodkorb <wbx@openadk.org> Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 --- configure.ac | 2 -- fsck/Makefile.am | 2 +- include/android_config.h
 | 4 ---- lib/Makefile.am | 2 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qZI96-0008G4-8H
Subject: [f2fs-dev] [PATCH] f2fs-tools: convert to lseek() and kill lseek64
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
Cc: Waldemar Brodkorb <wbx@openadk.org>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Waldemar Brodkorb <wbx@openadk.org>

This patch replaces lseek64 with lseek() having #define _FILE_OFFSET_BITS 64.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 configure.ac              |  2 --
 fsck/Makefile.am          |  2 +-
 include/android_config.h  |  4 ----
 lib/Makefile.am           |  2 +-
 lib/libf2fs.c             |  3 ---
 lib/libf2fs_io.c          | 47 +++++++++++++++------------------------
 lib/libf2fs_zoned.c       |  1 -
 mkfs/Makefile.am          |  4 ++--
 mkfs/f2fs_format.c        |  2 --
 mkfs/f2fs_format_main.c   |  2 --
 mkfs/f2fs_format_utils.c  | 10 ---------
 mkfs/f2fs_format_utils.h  |  2 --
 tools/Makefile.am         |  2 +-
 tools/f2fs_io/Makefile.am |  2 +-
 tools/f2fs_io/f2fs_io.c   |  6 -----
 tools/f2fs_io_parse.c     |  1 -
 tools/f2fscrypt.c         |  9 --------
 tools/fibmap.c            |  7 ------
 18 files changed, 24 insertions(+), 84 deletions(-)

diff --git a/configure.ac b/configure.ac
index efab8d8412b6..123ddbbaf3eb 100644
--- a/configure.ac
+++ b/configure.ac
@@ -187,8 +187,6 @@ AC_CHECK_FUNCS_ONCE([
 	getmntent
 	getuid
 	keyctl
-	llseek
-	lseek64
 	memset
 	setmntent
 	clock_gettime
diff --git a/fsck/Makefile.am b/fsck/Makefile.am
index 579dd26cd6c9..40d31b837dac 100644
--- a/fsck/Makefile.am
+++ b/fsck/Makefile.am
@@ -1,7 +1,7 @@
 ## Makefile.am
 
 AM_CPPFLAGS = ${libuuid_CFLAGS} -I$(top_srcdir)/include
-AM_CFLAGS = -Wall
+AM_CFLAGS = -Wall -D_FILE_OFFSET_BITS=64
 sbin_PROGRAMS = fsck.f2fs
 noinst_HEADERS = common.h dict.h dqblk_v2.h f2fs.h fsck.h node.h quotaio.h \
 		quotaio_tree.h quotaio_v2.h xattr.h compress.h
diff --git a/include/android_config.h b/include/android_config.h
index 141fe0640a17..da8abcb2f972 100644
--- a/include/android_config.h
+++ b/include/android_config.h
@@ -30,8 +30,6 @@
 #define HAVE_FSTAT 1
 #define HAVE_FSTAT64 1
 #define HAVE_GETMNTENT 1
-#define HAVE_LLSEEK 1
-#define HAVE_LSEEK64 1
 #define HAVE_MEMSET 1
 #define HAVE_SELINUX_ANDROID_H 1
 #define HAVE_SETMNTENT 1
@@ -67,7 +65,6 @@
 #define HAVE_FSTAT 1
 #define HAVE_FSTAT64 1
 #define HAVE_GETMNTENT 1
-#define HAVE_LLSEEK 1
 #define HAVE_MEMSET 1
 #define HAVE_SPARSE_SPARSE_H 1
 #define HAVE_LIBLZ4 1
@@ -78,6 +75,5 @@
 #endif
 
 #if defined(_WIN32)
-#define HAVE_LSEEK64
 #define HAVE_SPARSE_SPARSE_H 1
 #endif
diff --git a/lib/Makefile.am b/lib/Makefile.am
index 871d773176e9..69d46f833c30 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -3,7 +3,7 @@
 lib_LTLIBRARIES = libf2fs.la
 
 libf2fs_la_SOURCES = libf2fs.c libf2fs_io.c libf2fs_zoned.c nls_utf8.c
-libf2fs_la_CFLAGS = -Wall
+libf2fs_la_CFLAGS = -Wall -D_FILE_OFFSET_BITS=64
 libf2fs_la_CPPFLAGS = -I$(top_srcdir)/include
 libf2fs_la_LDFLAGS = -version-info $(LIBF2FS_CURRENT):$(LIBF2FS_REVISION):$(LIBF2FS_AGE)
 
diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 577a7e8caccd..c3d574432c87 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -6,9 +6,6 @@
  *
  * Dual licensed under the GPL or LGPL version 2 licenses.
  */
-#define _LARGEFILE64_SOURCE
-#define _FILE_OFFSET_BITS 64
-
 #include <f2fs_fs.h>
 #include <stdio.h>
 #include <stdlib.h>
diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index 1a8167dc60e5..74e5f3ac49ba 100644
--- a/lib/libf2fs_io.c
+++ b/lib/libf2fs_io.c
@@ -11,8 +11,6 @@
  *
  * Dual licensed under the GPL or LGPL version 2 licenses.
  */
-#define _LARGEFILE64_SOURCE
-
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -67,22 +65,13 @@ static int __get_device_fd(__u64 *offset)
 	return -1;
 }
 
-#ifndef HAVE_LSEEK64
-typedef off_t	off64_t;
-
-static inline off64_t lseek64(int fd, __u64 offset, int set)
-{
-	return lseek(fd, offset, set);
-}
-#endif
-
 /* ---------- dev_cache, Least Used First (LUF) policy  ------------------- */
 /*
  * Least used block will be the first victim to be replaced when max hash
  * collision exceeds
  */
 static bool *dcache_valid; /* is the cached block valid? */
-static off64_t  *dcache_blk; /* which block it cached */
+static off_t  *dcache_blk; /* which block it cached */
 static uint64_t *dcache_lastused; /* last used ticks for cache entries */
 static char *dcache_buf; /* cached block data */
 static uint64_t dcache_usetick; /* current use tick */
@@ -172,7 +161,7 @@ static int dcache_alloc_all(long n)
 {
 	if (n <= 0)
 		return -1;
-	if ((dcache_blk = (off64_t *) malloc(sizeof(off64_t) * n)) == NULL
+	if ((dcache_blk = (off_t *) malloc(sizeof(off_t) * n)) == NULL
 		|| (dcache_lastused = (uint64_t *)
 				malloc(sizeof(uint64_t) * n)) == NULL
 		|| (dcache_buf = (char *) malloc (F2FS_BLKSIZE * n)) == NULL
@@ -257,7 +246,7 @@ static inline long dcache_relocate(long entry, int n)
 			dcache_config.num_cache_entry;
 }
 
-static long dcache_find(off64_t blk)
+static long dcache_find(off_t blk)
 {
 	register long n = dcache_config.num_cache_entry;
 	register unsigned m = dcache_config.max_hash_collision;
@@ -278,10 +267,10 @@ static long dcache_find(off64_t blk)
 }
 
 /* Physical read into cache */
-static int dcache_io_read(int fd, long entry, off64_t offset, off64_t blk)
+static int dcache_io_read(int fd, long entry, off_t offset, off_t blk)
 {
-	if (lseek64(fd, offset, SEEK_SET) < 0) {
-		MSG(0, "\n lseek64 fail.\n");
+	if (lseek(fd, offset, SEEK_SET) < 0) {
+		MSG(0, "\n lseek fail.\n");
 		return -1;
 	}
 	if (read(fd, dcache_buf + entry * F2FS_BLKSIZE, F2FS_BLKSIZE) < 0) {
@@ -308,12 +297,12 @@ static int dcache_io_read(int fd, long entry, off64_t offset, off64_t blk)
  *       1: cache not available (uninitialized)
  *      -1: error
  */
-static int dcache_update_rw(int fd, void *buf, off64_t offset,
+static int dcache_update_rw(int fd, void *buf, off_t offset,
 		size_t byte_count, bool is_write)
 {
-	off64_t blk;
+	off_t blk;
 	int addr_in_blk;
-	off64_t start;
+	off_t start;
 
 	if (!dcache_initialized)
 		dcache_init(); /* auto initialize */
@@ -377,13 +366,13 @@ static int dcache_update_rw(int fd, void *buf, off64_t offset,
  * return value: 1: cache not available
  *               0: success, -1: I/O error
  */
-int dcache_update_cache(int fd, void *buf, off64_t offset, size_t count)
+int dcache_update_cache(int fd, void *buf, off_t offset, size_t count)
 {
 	return dcache_update_rw(fd, buf, offset, count, true);
 }
 
 /* handles read into cache + read into buffer  */
-int dcache_read(int fd, void *buf, off64_t offset, size_t count)
+int dcache_read(int fd, void *buf, off_t offset, size_t count)
 {
 	return dcache_update_rw(fd, buf, offset, count, false);
 }
@@ -395,7 +384,7 @@ int dev_read_version(void *buf, __u64 offset, size_t len)
 {
 	if (c.sparse_mode)
 		return 0;
-	if (lseek64(c.kd, (off64_t)offset, SEEK_SET) < 0)
+	if (lseek(c.kd, (off_t)offset, SEEK_SET) < 0)
 		return -1;
 	if (read(c.kd, buf, len) < 0)
 		return -1;
@@ -534,10 +523,10 @@ int dev_read(void *buf, __u64 offset, size_t len)
 
 	/* err = 1: cache not available, fall back to non-cache R/W */
 	/* err = 0: success, err=-1: I/O error */
-	err = dcache_read(fd, buf, (off64_t)offset, len);
+	err = dcache_read(fd, buf, (off_t)offset, len);
 	if (err <= 0)
 		return err;
-	if (lseek64(fd, (off64_t)offset, SEEK_SET) < 0)
+	if (lseek(fd, (off_t)offset, SEEK_SET) < 0)
 		return -1;
 	if (read(fd, buf, len) < 0)
 		return -1;
@@ -580,9 +569,9 @@ int dev_write(void *buf, __u64 offset, size_t len)
 	 * dcache_update_cache() just update cache, won't do I/O.
 	 * Thus even no error, we need normal non-cache I/O for actual write
 	 */
-	if (dcache_update_cache(fd, buf, (off64_t)offset, len) < 0)
+	if (dcache_update_cache(fd, buf, (off_t)offset, len) < 0)
 		return -1;
-	if (lseek64(fd, (off64_t)offset, SEEK_SET) < 0)
+	if (lseek(fd, (off_t)offset, SEEK_SET) < 0)
 		return -1;
 	if (write(fd, buf, len) < 0)
 		return -1;
@@ -596,7 +585,7 @@ int dev_write_block(void *buf, __u64 blk_addr)
 
 int dev_write_dump(void *buf, __u64 offset, size_t len)
 {
-	if (lseek64(c.dump_fd, (off64_t)offset, SEEK_SET) < 0)
+	if (lseek(c.dump_fd, (off_t)offset, SEEK_SET) < 0)
 		return -1;
 	if (write(c.dump_fd, buf, len) < 0)
 		return -1;
@@ -618,7 +607,7 @@ int dev_fill(void *buf, __u64 offset, size_t len)
 	/* Only allow fill to zero */
 	if (*((__u8*)buf))
 		return -1;
-	if (lseek64(fd, (off64_t)offset, SEEK_SET) < 0)
+	if (lseek(fd, (off_t)offset, SEEK_SET) < 0)
 		return -1;
 	if (write(fd, buf, len) < 0)
 		return -1;
diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
index a0dd8bd269ef..2ab2497ab211 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -6,7 +6,6 @@
  *
  * Dual licensed under the GPL or LGPL version 2 licenses.
  */
-#define _LARGEFILE64_SOURCE
 
 #include <f2fs_fs.h>
 #include <stdio.h>
diff --git a/mkfs/Makefile.am b/mkfs/Makefile.am
index af5b1c74b831..bfffd88de108 100644
--- a/mkfs/Makefile.am
+++ b/mkfs/Makefile.am
@@ -1,7 +1,7 @@
 ## Makefile.am
 
 AM_CPPFLAGS = ${libuuid_CFLAGS} ${libblkid_CFLAGS} -I$(top_srcdir)/include
-AM_CFLAGS = -Wall -DWITH_BLKDISCARD
+AM_CFLAGS = -Wall -DWITH_BLKDISCARD -D_FILE_OFFSET_BITS=64
 sbin_PROGRAMS = mkfs.f2fs
 noinst_HEADERS = f2fs_format_utils.h
 include_HEADERS = $(top_srcdir)/include/f2fs_fs.h
@@ -10,7 +10,7 @@ mkfs_f2fs_LDADD = ${libuuid_LIBS} ${libblkid_LIBS} $(top_builddir)/lib/libf2fs.l
 
 lib_LTLIBRARIES = libf2fs_format.la
 libf2fs_format_la_SOURCES = f2fs_format_main.c f2fs_format.c f2fs_format_utils.c
-libf2fs_format_la_CFLAGS = -DWITH_BLKDISCARD
+libf2fs_format_la_CFLAGS = -DWITH_BLKDISCARD -D_FILE_OFFSET_BITS=64
 libf2fs_format_la_LDFLAGS = ${libblkid_LIBS} ${libuuid_LIBS} -L$(top_builddir)/lib -lf2fs \
 	-version-info $(FMT_CURRENT):$(FMT_REVISION):$(FMT_AGE)
 
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 019fb3a3d9af..d937eda39221 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -6,8 +6,6 @@
  *
  * Dual licensed under the GPL or LGPL version 2 licenses.
  */
-#define _LARGEFILE64_SOURCE
-
 #include <stdio.h>
 #include <stdlib.h>
 #include <fcntl.h>
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index d8c9cea160a3..08c1b254d24c 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -6,8 +6,6 @@
  *
  * Dual licensed under the GPL or LGPL version 2 licenses.
  */
-#define _LARGEFILE64_SOURCE
-
 #include <stdio.h>
 #include <stdlib.h>
 #include <fcntl.h>
diff --git a/mkfs/f2fs_format_utils.c b/mkfs/f2fs_format_utils.c
index 448fbaa8866e..437f113b49c6 100644
--- a/mkfs/f2fs_format_utils.c
+++ b/mkfs/f2fs_format_utils.c
@@ -6,20 +6,10 @@
  *
  * Dual licensed under the GPL or LGPL version 2 licenses.
  */
-#ifndef _LARGEFILE_SOURCE
-#define _LARGEFILE_SOURCE
-#endif
-#ifndef _LARGEFILE64_SOURCE
-#define _LARGEFILE64_SOURCE
-#endif
 #ifndef _GNU_SOURCE
 #define _GNU_SOURCE
 #endif
 
-#ifndef _FILE_OFFSET_BITS
-#define _FILE_OFFSET_BITS 64
-#endif
-
 #include <f2fs_fs.h>
 
 #include <stdio.h>
diff --git a/mkfs/f2fs_format_utils.h b/mkfs/f2fs_format_utils.h
index 807e7c327601..6a7f6874a951 100644
--- a/mkfs/f2fs_format_utils.h
+++ b/mkfs/f2fs_format_utils.h
@@ -6,8 +6,6 @@
  *
  * Dual licensed under the GPL or LGPL version 2 licenses.
  */
-#define _LARGEFILE64_SOURCE
-
 #include "f2fs_fs.h"
 
 extern struct f2fs_configuration c;
diff --git a/tools/Makefile.am b/tools/Makefile.am
index 6b03814463bc..7dfffb17a31f 100644
--- a/tools/Makefile.am
+++ b/tools/Makefile.am
@@ -1,7 +1,7 @@
 ## Makefile.am
 
 AM_CPPFLAGS = ${libuuid_CFLAGS} -I$(top_srcdir)/include
-AM_CFLAGS = -Wall
+AM_CFLAGS = -Wall -D_FILE_OFFSET_BITS=64
 sbin_PROGRAMS =
 if !WINDOWS
 sbin_PROGRAMS += fibmap.f2fs parse.f2fs
diff --git a/tools/f2fs_io/Makefile.am b/tools/f2fs_io/Makefile.am
index bc4f9d011331..f5227ce21b00 100644
--- a/tools/f2fs_io/Makefile.am
+++ b/tools/f2fs_io/Makefile.am
@@ -2,7 +2,7 @@
 
 if LINUX
 AM_CPPFLAGS = -I$(top_srcdir)/include
-AM_CFLAGS = -Wall
+AM_CFLAGS = -Wall -D_FILE_OFFSET_BITS=64
 sbin_PROGRAMS = f2fs_io
 f2fs_io_SOURCES = f2fs_io.c
 endif
diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 771fd165fb68..1f6549b46746 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -9,12 +9,6 @@
 #ifndef _GNU_SOURCE
 #define _GNU_SOURCE
 #endif
-#ifndef _LARGEFILE_SOURCE
-#define _LARGEFILE_SOURCE
-#endif
-#ifndef _LARGEFILE64_SOURCE
-#define _LARGEFILE64_SOURCE
-#endif
 #ifndef O_LARGEFILE
 #define O_LARGEFILE 0
 #endif
diff --git a/tools/f2fs_io_parse.c b/tools/f2fs_io_parse.c
index 47f1194f7335..c3c1005ac27f 100644
--- a/tools/f2fs_io_parse.c
+++ b/tools/f2fs_io_parse.c
@@ -8,7 +8,6 @@
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
  */
-#define _LARGEFILE64_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
diff --git a/tools/f2fscrypt.c b/tools/f2fscrypt.c
index 8640ffae1404..d5222fb4121b 100644
--- a/tools/f2fscrypt.c
+++ b/tools/f2fscrypt.c
@@ -7,15 +7,6 @@
  * Authors: Michael Halcrow <mhalcrow@google.com>,
  *	    Ildar Muslukhov <ildarm@google.com>
  */
-
-#ifndef _LARGEFILE_SOURCE
-#define _LARGEFILE_SOURCE
-#endif
-
-#ifndef _LARGEFILE64_SOURCE
-#define _LARGEFILE64_SOURCE
-#endif
-
 #ifndef _GNU_SOURCE
 #define _GNU_SOURCE
 #endif
diff --git a/tools/fibmap.c b/tools/fibmap.c
index bda8238d5ece..3acc77ba1f6a 100644
--- a/tools/fibmap.c
+++ b/tools/fibmap.c
@@ -1,13 +1,6 @@
 #if !defined(__FreeBSD__) && !defined(__NetBSD__) && !defined(__OpenBSD__)
 #define _XOPEN_SOURCE 600
 #define _DARWIN_C_SOURCE
-#define _FILE_OFFSET_BITS 64
-#ifndef _LARGEFILE_SOURCE
-#define _LARGEFILE_SOURCE
-#endif
-#ifndef _LARGEFILE64_SOURCE
-#define _LARGEFILE64_SOURCE
-#endif
 #ifndef _GNU_SOURCE
 #define _GNU_SOURCE
 #endif
-- 
2.42.0.rc1.204.g551eb34607-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
