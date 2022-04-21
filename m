Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A53D50AB5F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 00:19:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhf92-00081H-1I; Thu, 21 Apr 2022 22:19:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nhf91-00080r-4C
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SVrGLULqPQ6w9V4XWPKhkiHB1EqprlyAtH+vlSKV2Zs=; b=boiL7bVJxg5UiT1VGiXsixDgy2
 XRm2VCsSpao7lHjk3d83Nobw6G+UQo8IDyiUXU1g60Lp0LF4QBSnxoGRPRYiYrHoLKC66Ih7gT3c7
 cUN/kqvvLKnCAujSRGTm4jSx6XO51wI7tK/BDXMCw76yaKcE0DrkpuYByW9AjEdnIMSU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SVrGLULqPQ6w9V4XWPKhkiHB1EqprlyAtH+vlSKV2Zs=; b=bVJ+2ZIomo6YAFKVPWJZ/JLc9F
 jeNJIJpi/KDwv3Tib1cr1lnhzLPb9wAIb3d6jWnWDtN2WNK/hIL7x+HuKDsDY2XFDYKsDOr3n/HqI
 j7dPBlkP0tksyZuYXSKD15DRpIq02oS6xJO1bIag6995O9TJlYWN6l2cMLwSFtnPyiMY=;
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhf8y-0002x1-9Q
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:22 +0000
Received: by mail-pl1-f178.google.com with SMTP id u15so3383187ple.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 15:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SVrGLULqPQ6w9V4XWPKhkiHB1EqprlyAtH+vlSKV2Zs=;
 b=5w3K3TBe1y0WyjQzdMPuSkmsFSmOTnA4Fa022HDJZWcuvE6H/ZNOvBIjEhm3daYIyq
 VJpA9azyYBhQCsp3cVGhGISmOL07YILcHJodAOc+kPcG/6Ybu3h4zJJUf2IBcXC9fXRq
 UWwpbYEco1FGCwjSc1q2890xjpzvaM1+i/QMgZjL1qiJ5xgH6V7a+anDP1+D94XKZ8uF
 l9N1vzwhpDC3F+jn32a3m9T1jUxMRbCTLwFYRrBD8Dhd6mwQ39w9/bLWGLrkXa1R6o9V
 UB6DdRzIA/8Jas7QCY4kacQ1ifXnjYc4h01dZV1UDG6Cy2GE+CiUis16TqIXA7vNw8Qj
 z/3Q==
X-Gm-Message-State: AOAM531V3ldUxrI10Hi/ykyFsq/rasNRHwJ28YFrT2qPg5ZltJObhJpm
 cwzivsQJy4thY2qZDud8/mCvnCKEzFI/ng==
X-Google-Smtp-Source: ABdhPJzRU2G4jNIeP+D6pVuHL2GtMhEOE0k27pNCi11tD6lwz5oNX9d7StO24mBk+DG/IfTTZ/uihw==
X-Received: by 2002:a17:90b:3e84:b0:1d2:c015:2182 with SMTP id
 rj4-20020a17090b3e8400b001d2c0152182mr1900095pjb.232.1650579554517; 
 Thu, 21 Apr 2022 15:19:14 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:a034:31d8:ca4e:1f35])
 by smtp.gmail.com with ESMTPSA id
 hi21-20020a17090b30d500b001cd4989ff4csm3794876pjb.19.2022.04.21.15.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:19:13 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 21 Apr 2022 15:18:22 -0700
Message-Id: <20220421221836.3935616-18-bvanassche@acm.org>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
In-Reply-To: <20220421221836.3935616-1-bvanassche@acm.org>
References: <20220421221836.3935616-1-bvanassche@acm.org>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Fix multiple compiler warnings and build errors reported by
 the MinGW cross-compiler. Signed-off-by: Bart Van Assche <bvanassche@acm.org>
 --- configure.ac | 46 +++++++++++++++++++++++++++++++++++++++++
 fsck/Makefile.am
 | 2 +- fsck/dir.c | 8 +++++++ fsck/f2fs.h | 8 +++++++ fsck/main.c | [...]
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.178 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1nhf8y-0002x1-9Q
Subject: [f2fs-dev] [PATCH 17/31] Fix the MinGW build
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
Cc: Bart Van Assche <bvanassche@acm.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fix multiple compiler warnings and build errors reported by the MinGW
cross-compiler.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 configure.ac            | 46 +++++++++++++++++++++++++++++++++++++++++
 fsck/Makefile.am        |  2 +-
 fsck/dir.c              |  8 +++++++
 fsck/f2fs.h             |  8 +++++++
 fsck/main.c             | 13 ++++++------
 fsck/mount.c            |  4 ++--
 fsck/quotaio.h          |  1 -
 fsck/sload.c            | 11 ++++++++++
 mkfs/f2fs_format.c      |  7 +++++++
 mkfs/f2fs_format_main.c |  4 +++-
 tools/Makefile.am       |  5 ++++-
 tools/f2fs_io/f2fs_io.c | 13 ++++++------
 tools/f2fscrypt.c       |  2 ++
 tools/fibmap.c          |  2 ++
 14 files changed, 108 insertions(+), 18 deletions(-)

diff --git a/configure.ac b/configure.ac
index 4a3afa4853eb..06aaed9a57d9 100644
--- a/configure.ac
+++ b/configure.ac
@@ -83,6 +83,12 @@ AC_CHECK_LIB([uuid], [uuid_clear],
 		[Define if you have libuuid])
 	], [], [])
 
+AC_CHECK_LIB([winpthread], [clock_gettime],
+	[AC_SUBST([libwinpthread_LIBS], ["-lwinpthread"])
+		AC_DEFINE([HAVE_LIBWINPTHREAD], [1],
+		[Define if you have libwinpthread])
+	], [], [])
+
 # Checks for header files.
 AC_CHECK_HEADERS(m4_flatten([
 	attr/xattr.h
@@ -100,6 +106,7 @@ AC_CHECK_HEADERS(m4_flatten([
 	linux/xattr.h
 	mach/mach_time.h
 	mntent.h
+	pthread_time.h
 	scsi/sg.h
 	selinux/selinux.h
 	stdlib.h
@@ -129,7 +136,9 @@ AC_CHECK_FUNCS_ONCE([
 	fsetxattr
 	fstat
 	fstat64
+	getgid
 	getmntent
+	getuid
 	keyctl
 	llseek
 	lseek64
@@ -140,6 +149,18 @@ AC_CHECK_FUNCS_ONCE([
 AS_IF([test "$ac_cv_header_byteswap_h" = "yes"],
       [AC_CHECK_DECLS([bswap_64],,,[#include <byteswap.h>])])
 
+AC_MSG_CHECKING([for CLOCK_BOOTIME])
+AC_COMPILE_IFELSE([AC_LANG_PROGRAM([
+#include <time.h>
+#ifdef HAVE_PTHREAD_TIME_H
+#include <pthread_time.h>
+#endif
+],[return CLOCK_BOOTTIME])],
+		  [AC_MSG_RESULT([yes])
+		  AC_DEFINE([HAVE_CLOCK_BOOTTIME], [1],
+		  [Define if CLOCK_BOOTTIME is available])],
+		  [AC_MSG_RESULT([no])])
+
 # AC_CANONICAL_HOST is needed to access the 'host_os' variable
 AC_CANONICAL_HOST
 
@@ -209,4 +230,29 @@ AC_SUBST(LIBF2FS_CURRENT, 8)
 AC_SUBST(LIBF2FS_REVISION, 0)
 AC_SUBST(LIBF2FS_AGE, 0)
 
+AH_BOTTOM([
+#ifndef _CONFIG_H_
+#define _CONFIG_H_
+
+#ifdef HAVE_SYS_STAT_H
+#include <sys/stat.h>
+#endif
+
+#ifndef HAVE_GETUID
+static inline unsigned int getuid(void) { return -1; }
+#endif
+#ifndef HAVE_GETGID
+static inline unsigned int getgid(void) { return -1; }
+#endif
+
+#ifndef S_ISLNK
+#define S_ISLNK(mode) false
+#endif
+#ifndef S_ISSOCK
+#define S_ISSOCK(mode) false
+#endif
+
+#endif
+])
+
 AC_OUTPUT
diff --git a/fsck/Makefile.am b/fsck/Makefile.am
index e31d4166e227..579dd26cd6c9 100644
--- a/fsck/Makefile.am
+++ b/fsck/Makefile.am
@@ -10,7 +10,7 @@ fsck_f2fs_SOURCES = main.c fsck.c dump.c mount.c defrag.c resize.c \
 		node.c segment.c dir.c sload.c xattr.c compress.c \
 		dict.c mkquota.c quotaio.c quotaio_tree.c quotaio_v2.c
 fsck_f2fs_LDADD = ${libselinux_LIBS} ${libuuid_LIBS} \
-	${liblzo2_LIBS} ${liblz4_LIBS} \
+	${liblzo2_LIBS} ${liblz4_LIBS} ${libwinpthread_LIBS} \
 	$(top_builddir)/lib/libf2fs.la
 
 install-data-hook:
diff --git a/fsck/dir.c b/fsck/dir.c
index f7491a778a30..4a3eb6ea7788 100644
--- a/fsck/dir.c
+++ b/fsck/dir.c
@@ -474,11 +474,19 @@ static void init_inode_block(struct f2fs_sb_info *sbi,
 		links++;
 		blocks++;
 	} else if (de->file_type == F2FS_FT_REG_FILE) {
+#ifdef S_IFREG
 		mode |= S_IFREG;
+#else
+		ASSERT(0);
+#endif
 		size = 0;
 	} else if (de->file_type == F2FS_FT_SYMLINK) {
 		ASSERT(de->link);
+#ifdef S_IFLNK
 		mode |= S_IFLNK;
+#else
+		ASSERT(0);
+#endif
 		size = strlen(de->link);
 		if (size + 1 > MAX_INLINE_DATA(node_blk))
 			blocks++;
diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index e5130ba19961..875f953fb6cc 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -27,8 +27,12 @@
 #include <mach/mach_time.h>
 #endif
 #include <sys/stat.h>
+#ifdef HAVE_SYS_IOCTL_H
 #include <sys/ioctl.h>
+#endif
+#ifdef HAVE_SYS_MOUNT_H
 #include <sys/mount.h>
+#endif
 #include <assert.h>
 
 #include "f2fs_fs.h"
@@ -589,8 +593,12 @@ static unsigned char f2fs_type_by_mode[S_IFMT >> S_SHIFT] = {
 	[S_IFCHR >> S_SHIFT]    = F2FS_FT_CHRDEV,
 	[S_IFBLK >> S_SHIFT]    = F2FS_FT_BLKDEV,
 	[S_IFIFO >> S_SHIFT]    = F2FS_FT_FIFO,
+#ifdef S_IFSOCK
 	[S_IFSOCK >> S_SHIFT]   = F2FS_FT_SOCK,
+#endif
+#ifdef S_IFLNK
 	[S_IFLNK >> S_SHIFT]    = F2FS_FT_SYMLINK,
+#endif
 };
 
 static inline int map_de_type(umode_t mode)
diff --git a/fsck/main.c b/fsck/main.c
index e4cfdf443867..b555ff4dbee7 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -1065,16 +1065,12 @@ static int do_label(struct f2fs_sb_info *sbi)
 }
 #endif
 
-#if defined(__APPLE__)
+#ifdef HAVE_MACH_TIME_H
 static u64 get_boottime_ns()
 {
-#ifdef HAVE_MACH_TIME_H
 	return mach_absolute_time();
-#else
-	return 0;
-#endif
 }
-#else
+#elif defined(HAVE_CLOCK_GETTIME) && defined(HAVE_CLOCK_BOOTTIME)
 static u64 get_boottime_ns()
 {
 	struct timespec t;
@@ -1082,6 +1078,11 @@ static u64 get_boottime_ns()
 	clock_gettime(CLOCK_BOOTTIME, &t);
 	return (u64)t.tv_sec * 1000000000LL + t.tv_nsec;
 }
+#else
+static u64 get_boottime_ns()
+{
+	return 0;
+}
 #endif
 
 int main(int argc, char **argv)
diff --git a/fsck/mount.c b/fsck/mount.c
index 584385d682b5..b1e318f099f0 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -31,6 +31,8 @@
 #define ACL_OTHER		(0x20)
 #endif
 
+#ifdef HAVE_LINUX_BLKZONED_H
+
 static int get_device_idx(struct f2fs_sb_info *sbi, uint32_t segno)
 {
 	block_t seg_start_blkaddr;
@@ -45,8 +47,6 @@ static int get_device_idx(struct f2fs_sb_info *sbi, uint32_t segno)
 	return 0;
 }
 
-#ifdef HAVE_LINUX_BLKZONED_H
-
 static int get_zone_idx_from_dev(struct f2fs_sb_info *sbi,
 					uint32_t segno, uint32_t dev_idx)
 {
diff --git a/fsck/quotaio.h b/fsck/quotaio.h
index 0024fe570727..fc40f98e8741 100644
--- a/fsck/quotaio.h
+++ b/fsck/quotaio.h
@@ -21,7 +21,6 @@
 #include <limits.h>
 #include <sys/types.h>
 #include <sys/stat.h>
-#include <arpa/inet.h>
 
 #include "dict.h"
 #include "f2fs_fs.h"
diff --git a/fsck/sload.c b/fsck/sload.c
index 692902344a55..475ea6dac5f6 100644
--- a/fsck/sload.c
+++ b/fsck/sload.c
@@ -28,6 +28,7 @@ typedef void (*fs_config_f)(const char *path, int dir,
 			    unsigned *uid, unsigned *gid,
 			    unsigned *mode, uint64_t *capabilities);
 
+#ifndef _WIN32
 static fs_config_f fs_config_func = NULL;
 
 #ifdef WITH_ANDROID
@@ -62,6 +63,7 @@ static int f2fs_make_directory(struct f2fs_sb_info *sbi,
 
 	return ret;
 }
+#endif
 
 #ifdef HAVE_LIBSELINUX
 static int set_selinux_xattr(struct f2fs_sb_info *sbi, const char *path,
@@ -99,6 +101,7 @@ static int set_selinux_xattr(struct f2fs_sb_info *sbi, const char *path,
 #define set_selinux_xattr(...)	0
 #endif
 
+#ifndef _WIN32
 static int set_perms_and_caps(struct dentry *de)
 {
 	uint64_t capabilities = 0;
@@ -291,6 +294,14 @@ out_free:
 	free(dentries);
 	return 0;
 }
+#else
+static int build_directory(struct f2fs_sb_info *sbi, const char *full_path,
+			const char *dir_path, const char *target_out_dir,
+			nid_t dir_ino)
+{
+	return -1;
+}
+#endif
 
 static int configure_files(void)
 {
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 332abf60d0d9..173f619585f3 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -18,7 +18,14 @@
 #include <sys/mount.h>
 #endif
 #include <time.h>
+
+#include "config.h"
+#ifdef HAVE_UUID_UUID_H
 #include <uuid/uuid.h>
+#else
+#define uuid_parse(a, b) -1
+#define uuid_generate(a)
+#endif
 
 #include "f2fs_fs.h"
 #include "quota.h"
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index ecc942b61d63..88b267492245 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -19,7 +19,6 @@
 #include <sys/mount.h>
 #endif
 #include <time.h>
-#include <uuid/uuid.h>
 #include <errno.h>
 #include <getopt.h>
 
@@ -27,6 +26,9 @@
 #ifdef HAVE_LIBBLKID
 #include <blkid/blkid.h>
 #endif
+#ifdef HAVE_UUID_UUID_H
+#include <uuid/uuid.h>
+#endif
 
 #include "f2fs_fs.h"
 #include "quota.h"
diff --git a/tools/Makefile.am b/tools/Makefile.am
index 56bf2e4e8a99..8756a298fdcf 100644
--- a/tools/Makefile.am
+++ b/tools/Makefile.am
@@ -2,7 +2,10 @@
 
 AM_CPPFLAGS = ${libuuid_CFLAGS} -I$(top_srcdir)/include
 AM_CFLAGS = -Wall
-sbin_PROGRAMS = f2fstat fibmap.f2fs parse.f2fs
+sbin_PROGRAMS = f2fstat
+if !WINDOWS
+sbin_PROGRAMS += fibmap.f2fs parse.f2fs
+endif
 f2fstat_SOURCES = f2fstat.c
 fibmap_f2fs_SOURCES = fibmap.c
 parse_f2fs_SOURCES = f2fs_io_parse.c
diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index af4a34b63471..e807177a4174 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -132,16 +132,12 @@ static void full_write(int fd, const void *buf, size_t count)
 	}
 }
 
-#if defined(__APPLE__)
+#ifdef HAVE_MACH_TIME_H
 static u64 get_current_us()
 {
-#ifdef HAVE_MACH_TIME_H
 	return mach_absolute_time() / 1000;
-#else
-	return 0;
-#endif
 }
-#else
+#elif defined(HAVE_CLOCK_GETTIME) && defined(HAVE_CLOCK_BOOTTIME)
 static u64 get_current_us()
 {
 	struct timespec t;
@@ -149,6 +145,11 @@ static u64 get_current_us()
 	clock_gettime(CLOCK_BOOTTIME, &t);
 	return (u64)t.tv_sec * 1000000LL + t.tv_nsec / 1000;
 }
+#else
+static u64 get_current_us()
+{
+	return 0;
+}
 #endif
 
 #define fsync_desc "fsync"
diff --git a/tools/f2fscrypt.c b/tools/f2fscrypt.c
index 72bfb6467300..0f0650f4dd63 100644
--- a/tools/f2fscrypt.c
+++ b/tools/f2fscrypt.c
@@ -43,7 +43,9 @@
 #ifdef __KERNEL__
 #include <linux/fs.h>
 #endif
+#ifdef HAVE_UUID_UUID_H
 #include <uuid/uuid.h>
+#endif
 
 #if !defined(HAVE_ADD_KEY) || !defined(HAVE_KEYCTL)
 #include <sys/syscall.h>
diff --git a/tools/fibmap.c b/tools/fibmap.c
index 9e96cb68cecc..3238f294e869 100644
--- a/tools/fibmap.c
+++ b/tools/fibmap.c
@@ -23,7 +23,9 @@
 #include <fcntl.h>
 #include <errno.h>
 #include <sys/types.h>
+#ifdef HAVE_SYS_IOCTL_H
 #include <sys/ioctl.h>
+#endif
 #include <sys/stat.h>
 #ifdef HAVE_SYS_SYSMACROS_H
 #include <sys/sysmacros.h>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
