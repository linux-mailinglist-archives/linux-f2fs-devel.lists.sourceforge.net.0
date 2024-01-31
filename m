Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EA88437F3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jan 2024 08:34:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rV57P-0000Iq-7e;
	Wed, 31 Jan 2024 07:34:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rV57O-0000Ij-4s
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jan 2024 07:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pel17dfBgXLm0h8o3fm8ADIyoEy0CM2Yup/8T5oCA9c=; b=AtdTM2kz7OM6CxvJ6zhQg5erAm
 oXYNZmtdYhmhpglX1uYotoMuoaqB904lpYC91wiMKZfvIv17TAeE2jCH3qnstg7gxDBp6wlV0ZMHi
 2HS4B4Bteclqyne54b1CYPRLRQZZwioKPl0XP1/exdGNPNSpaAPfny8DebS5yuJQwVxk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Pel17dfBgXLm0h8o3fm8ADIyoEy0CM2Yup/8T5oCA9c=; b=L
 1iy7E0BOSOJInyq5d8DR7FhA0Ydfb265Q/8vElg7Uq0vSrSEIvSqLU5CEmXQEutawpJALhdS4wyJX
 HyXU/u5Kq31913YJiDZ+jXDKOlq3BjXiL9fa+dW6mF6YSUoEswSEp7D9MbgMSYoTQSK7/oBcj6Pjj
 cSxdTbkxxZ5Bf5jo=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rV57N-0003fU-9j for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jan 2024 07:34:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 38B32CE16C5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 31 Jan 2024 07:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D58C433C7;
 Wed, 31 Jan 2024 07:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706686473;
 bh=5WEPBicbrC9l7gCU5jpmXSo2vNMolaQFK60+OOWxapA=;
 h=From:To:Cc:Subject:Date:From;
 b=TOg0Viy/sHa1mcyhcZNMkOemGAWSAncXq/QBrwzSfTm0JC84zS5pVphUIKUWxZ8+b
 tIZBKpHvc2o5rf+E8Z5HCfA5jhvbepCP5/ZG6DsyQWvdMl9ruoEpABYyJKURMBo6wL
 hZ+mVVZPjPJeAiAuzLW0JYN9aw0CIqJxGRr7iBfyDGP8GBCLcovfLUiPuRnnQ7g++K
 O3RwKXDS30e2FAv7zAXsnTC5HKvU7cejvSq5a+qyKyUIkErHLJ9zjisutrPkmEiVVd
 R650nQOHAdE2LMMv7aOh/TGT/om2B/KwboMV9vVKoCAZTxJ9le70d2vYkvI62n0zr8
 dI6RcZV6mgW2A==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 31 Jan 2024 15:34:25 +0800
Message-Id: <20240131073425.4043962-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Otherwise,
 mkfs/fsck can update backfile of moutned loop device.
 1. mkfs.f2fs image 2. mount -o loop image /mnt/f2fs/ 3. mkfs.f2fs image -f
 Before: ... Info: format successful 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rV57N-0003fU-9j
Subject: [f2fs-dev] [PATCH] f2fs-tools: fix to check loop device
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Otherwise, mkfs/fsck can update backfile of moutned loop device.

1. mkfs.f2fs image
2. mount -o loop image /mnt/f2fs/
3. mkfs.f2fs image -f

Before:
...
Info: format successful

After:
...
	Error: In use by loop device!

Signed-off-by: Chao Yu <chao@kernel.org>
---
 configure.ac             |  2 ++
 fsck/main.c              |  4 +--
 include/android_config.h |  2 ++
 lib/libf2fs.c            | 74 ++++++++++++++++++++++++++++++++++------
 mkfs/f2fs_format_main.c  |  7 ++--
 5 files changed, 74 insertions(+), 15 deletions(-)

diff --git a/configure.ac b/configure.ac
index 123ddbb..21c6391 100644
--- a/configure.ac
+++ b/configure.ac
@@ -144,6 +144,8 @@ AC_CHECK_HEADERS(m4_flatten([
 	linux/fs.h
 	linux/hdreg.h
 	linux/limits.h
+	linux/loop.h
+	linux/major.h
 	linux/posix_acl.h
 	linux/types.h
 	linux/xattr.h
diff --git a/fsck/main.c b/fsck/main.c
index 1affa72..c4d0956 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -1111,8 +1111,8 @@ int main(int argc, char **argv)
 
 	f2fs_parse_options(argc, argv);
 
-	if (c.func != DUMP && f2fs_devs_are_umounted() < 0) {
-		if (errno == EBUSY) {
+	if (c.func != DUMP && (ret = f2fs_devs_are_umounted()) < 0) {
+		if (ret == -EBUSY) {
 			ret = -1;
 			if (c.func == FSCK)
 				ret = FSCK_OPERATIONAL_ERROR;
diff --git a/include/android_config.h b/include/android_config.h
index da8abcb..05b686e 100644
--- a/include/android_config.h
+++ b/include/android_config.h
@@ -6,6 +6,8 @@
 #define HAVE_FSYNC 1
 #define HAVE_LINUX_HDREG_H 1
 #define HAVE_LINUX_LIMITS_H 1
+#define HAVE_LINUX_LOOP_H 1
+#define HAVE_LINUX_MAJOR_H 1
 #define HAVE_POSIX_ACL_H 1
 #define HAVE_LINUX_TYPES_H 1
 #define HAVE_LINUX_XATTR_H 1
diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 2451201..8570689 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -19,6 +19,12 @@
 #endif
 #include <time.h>
 #include <sys/stat.h>
+#ifdef HAVE_LINUX_LOOP_H
+#include <linux/loop.h>
+#ifdef HAVE_LINUX_MAJOR_H
+#include <linux/major.h>
+#endif
+#endif
 #ifdef HAVE_SYS_IOCTL_H
 #include <sys/ioctl.h>
 #endif
@@ -756,7 +762,7 @@ int f2fs_dev_is_umounted(char *path)
 #ifdef _WIN32
 	return 0;
 #else
-	struct stat *st_buf;
+	struct stat st_buf;
 	int is_rootdev = 0;
 	int ret = 0;
 	char *rootdev_name = get_rootdev();
@@ -807,32 +813,78 @@ int f2fs_dev_is_umounted(char *path)
 	 * If f2fs is umounted with -l, the process can still use
 	 * the file system. In this case, we should not format.
 	 */
-	st_buf = malloc(sizeof(struct stat));
-	ASSERT(st_buf);
+	if (stat(path, &st_buf)) {
+		MSG(0, "Info: stat failed errno:%d\n", errno);
+		return -1;
+	}
 
-	if (stat(path, st_buf) == 0 && S_ISBLK(st_buf->st_mode)) {
+	if (S_ISBLK(st_buf.st_mode)) {
 		int fd = open(path, O_RDONLY | O_EXCL);
 
 		if (fd >= 0) {
 			close(fd);
 		} else if (errno == EBUSY) {
 			MSG(0, "\tError: In use by the system!\n");
-			free(st_buf);
-			return -1;
+			return -EBUSY;
 		}
+	} else if (S_ISREG(st_buf.st_mode)) {
+		/* check whether regular is backfile of loop device */
+#if defined(HAVE_LINUX_LOOP_H) && defined(HAVE_LINUX_MAJOR_H)
+		struct mntent *mnt;
+		struct stat st_loop;
+		FILE *f;
+
+		f = setmntent("/proc/mounts", "r");
+
+		while ((mnt = getmntent(f)) != NULL) {
+			struct loop_info64 loopinfo = {0, };
+			int loop_fd, err;
+
+			if (mnt->mnt_fsname[0] != '/')
+				continue;
+			if (stat(mnt->mnt_fsname, &st_loop) != 0)
+				continue;
+			if (!S_ISBLK(st_loop.st_mode))
+				continue;
+			if (major(st_loop.st_rdev) != LOOP_MAJOR)
+				continue;
+
+			loop_fd = open(mnt->mnt_fsname, O_RDONLY);
+			if (loop_fd < 0) {
+				MSG(0, "Info: open %s failed errno:%d\n",
+					mnt->mnt_fsname, errno);
+				return -1;
+			}
+
+			err = ioctl(loop_fd, LOOP_GET_STATUS64, &loopinfo);
+			close(loop_fd);
+			if (err < 0) {
+				MSG(0, "\tError: ioctl LOOP_GET_STATUS64 failed errno:%d!\n",
+					errno);
+				return -1;
+			}
+
+			if (st_buf.st_dev == loopinfo.lo_device &&
+				st_buf.st_ino == loopinfo.lo_inode) {
+				MSG(0, "\tError: In use by loop device!\n");
+				return -EBUSY;
+			}
+		}
+#endif
 	}
-	free(st_buf);
 	return ret;
 #endif
 }
 
 int f2fs_devs_are_umounted(void)
 {
-	int i;
+	int ret, i;
 
-	for (i = 0; i < c.ndevs; i++)
-		if (f2fs_dev_is_umounted((char *)c.devices[i].path))
-			return -1;
+	for (i = 0; i < c.ndevs; i++) {
+		ret = f2fs_dev_is_umounted((char *)c.devices[i].path);
+		if (ret)
+			return ret;
+	}
 	return 0;
 }
 
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index 4de517a..f3316f7 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -443,6 +443,8 @@ static int f2fs_check_overwrite(void)
 
 int main(int argc, char *argv[])
 {
+	int ret;
+
 	f2fs_init_configuration();
 
 	f2fs_parse_options(argc, argv);
@@ -451,8 +453,9 @@ int main(int argc, char *argv[])
 
 	c.func = MKFS;
 
-	if (f2fs_devs_are_umounted() < 0) {
-		if (errno != EBUSY)
+	ret = f2fs_devs_are_umounted();
+	if (ret) {
+		if (ret != -EBUSY)
 			MSG(0, "\tError: Not available on mounted device!\n");
 		goto err_format;
 	}
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
