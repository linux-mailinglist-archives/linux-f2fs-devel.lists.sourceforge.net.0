Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 027B950C105
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 23:18:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ni0fy-0005lV-Vq; Fri, 22 Apr 2022 21:18:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1ni0fw-0005lH-A3
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Apr 2022 21:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qrvtMSmm9sZ5T9Moltaa946o4wRdhO4JZHFKRluiLbo=; b=GAQzNrBKZ+HCddokQbXSzExzL+
 FnohX2RX4vZeD9YuOQs5SPGFnDhVKBc8PsCEsW2TH5Fa+5kahL/00HLG87SWBYsZyv3PQSuinyE5F
 5Fm1sFnxLORTOri+6kMywbebHP2AbMX9NAJdIAiGYZ4C82uYPqSCaBajrqh1R4wdfmmE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qrvtMSmm9sZ5T9Moltaa946o4wRdhO4JZHFKRluiLbo=; b=Va9DgFpr7bO/2GLzMZT2qJWvEm
 IPqqkg5N+Gdw/XaTXO+TMKDkfvv/6/mm7GYLATUiHQLsIQ2bifr+Q8w/Y8m2lekoka3ymSxxeDK6W
 Lz0y73EkFR/tV5/C3vz06vDSln/XgdZiEZ9FevoLYOQITwx2uLJKheEMwLgB1WK7cOXQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ni0fp-000711-B8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Apr 2022 21:18:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D00D361952
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 22 Apr 2022 21:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E786C385AC;
 Fri, 22 Apr 2022 21:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650662307;
 bh=1o4ML7iEFazSJGd8SuKzRzTam9YZjK1eppy6Dg9BcnQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=by6UeALkWzf2mQhmEB25p/pCF0oWC/qxzi9rhvDFRgeE9OfT7Qm4QcnIyNgw7aELr
 cKBtUEQcklrLnbXGwniyngqSNyM61zgo97ByOCdm987YvsK2u76TH4+L9FFqzfk/QE
 9rJSjwTpkvj22lAh4oMdPAAl5bq5c6gQ5lQ7grCj8dwcfFekEKspCLJ9cHmKCRqI2/
 0r1bTGkDLE8XNcYLzEvHcqtWaKiFF3RNrFY1bHWDXlpUvDqzm2HexfBL7/k2OCBWPN
 UsyRUFJ7dB7ttEZ/qZRQfBBdcmV93NrPVaNCbtT400omuCWAYAsFbvQwEFWS8zbIdc
 hmdLtUwYWcRmA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 22 Apr 2022 14:18:16 -0700
Message-Id: <20220422211819.2230879-3-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
In-Reply-To: <20220422211819.2230879-1-jaegeuk@kernel.org>
References: <20220422211819.2230879-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This requires to change Android.bp in AOSP. Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> Change-Id:
 I28a4a701513cb2420cdf0e0e2aa3f60e712f2fcb
 --- configure.ac | 9 ++++++++- fsck/fsck.c | 2 +- include/android_config.h
 | 3 +++ include/f2fs_fs. [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ni0fp-000711-B8
Subject: [f2fs-dev] [PATCH 3/6] f2fs-tools: support zoned device in Android
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

This requires to change Android.bp in AOSP.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Change-Id: I28a4a701513cb2420cdf0e0e2aa3f60e712f2fcb
---
 configure.ac             |  9 ++++++++-
 fsck/fsck.c              |  2 +-
 include/android_config.h |  3 +++
 include/f2fs_fs.h        |  4 +++-
 lib/libf2fs.c            | 10 +++-------
 5 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/configure.ac b/configure.ac
index f0ed5f6528d9..e8ce0057c4ff 100644
--- a/configure.ac
+++ b/configure.ac
@@ -95,6 +95,7 @@ AC_CHECK_HEADERS(m4_flatten([
 	blkid/blkid.h
 	byteswap.h
 	fcntl.h
+	kernel/uapi/linux/blkzoned.h
 	linux/blkzoned.h
 	linux/falloc.h
 	linux/fiemap.h
@@ -222,7 +223,13 @@ AC_CONFIG_FILES([
 
 AC_CHECK_MEMBER([struct blk_zone.capacity],
 		[AC_DEFINE(HAVE_BLK_ZONE_REP_V2, [1], [report zones includes zone capacity])],
-		[], [[#include <linux/blkzoned.h>]])
+		[], [[
+#ifdef HAVE_KERNEL_UAPI_LINUX_BLKZONED_H
+#include <kernel/uapi/linux/blkzoned.h>
+#elif defined(HAVE_LINUX_BLKZONED_H)
+#include <linux/blkzoned.h>
+#endif
+		]])
 
 # export library version info for mkfs/libf2fs_format_la
 AC_SUBST(FMT_CURRENT, 7)
diff --git a/fsck/fsck.c b/fsck/fsck.c
index 19a28b0eedad..3b37519e9054 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2994,7 +2994,7 @@ struct write_pointer_check_data {
 	int dev_index;
 };
 
-static int chk_and_fix_wp_with_sit(int i, void *blkzone, void *opaque)
+static int chk_and_fix_wp_with_sit(int UNUSED(i), void *blkzone, void *opaque)
 {
 	struct blk_zone *blkz = (struct blk_zone *)blkzone;
 	struct write_pointer_check_data *wpd = opaque;
diff --git a/include/android_config.h b/include/android_config.h
index ce6723309447..671cab6fb003 100644
--- a/include/android_config.h
+++ b/include/android_config.h
@@ -1,7 +1,9 @@
 #if defined(__linux__)
+#define HAVE_BLK_ZONE_REP_V2 1
 #define HAVE_BYTESWAP_H 1
 #define HAVE_FCNTL_H 1
 #define HAVE_FALLOC_H 1
+#define HAVE_KERNEL_UAPI_LINUX_BLKZONED_H 1
 #define HAVE_LINUX_HDREG_H 1
 #define HAVE_LINUX_LIMITS_H 1
 #define HAVE_POSIX_ACL_H 1
@@ -19,6 +21,7 @@
 #define HAVE_SYS_SYSMACROS_H 1
 #define HAVE_SYS_XATTR_H 1
 #define HAVE_UNISTD_H 1
+#define HAVE_SCSI_SG_H 1
 
 #define HAVE_FALLOCATE 1
 #define HAVE_FSETXATTR 1
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 1d7103c1d6fe..d6374270c188 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -50,7 +50,9 @@
 #endif
 #include <sys/types.h>
 
-#ifdef HAVE_LINUX_BLKZONED_H
+#ifdef HAVE_KERNEL_UAPI_LINUX_BLKZONED_H
+#include <kernel/uapi/linux/blkzoned.h>
+#elif defined(HAVE_LINUX_BLKZONED_H)
 #include <linux/blkzoned.h>
 #endif
 
diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 63d07f26c739..afdbbbe17d84 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -34,11 +34,9 @@
 #ifdef HAVE_SYS_UTSNAME_H
 #include <sys/utsname.h>
 #endif
-#ifndef WITH_ANDROID
 #ifdef HAVE_SCSI_SG_H
 #include <scsi/sg.h>
 #endif
-#endif
 #ifdef HAVE_LINUX_HDREG_H
 #include <linux/hdreg.h>
 #endif
@@ -46,10 +44,8 @@
 #include <linux/limits.h>
 #endif
 
-#ifndef WITH_ANDROID
 /* SCSI command for standard inquiry*/
 #define MODELINQUIRY	0x12,0x00,0x00,0x00,0x4A,0x00
-#endif
 
 #ifndef _WIN32 /* O_BINARY is windows-specific flag */
 #define O_BINARY 0
@@ -900,7 +896,7 @@ int get_device_info(int i)
 #ifdef HDIO_GETGIO
 	struct hd_geometry geom;
 #endif
-#if !defined(WITH_ANDROID) && defined(__linux__)
+#ifdef __linux__
 	sg_io_hdr_t io_hdr;
 	unsigned char reply_buffer[96] = {0};
 	unsigned char model_inq[6] = {MODELINQUIRY};
@@ -1002,7 +998,7 @@ int get_device_info(int i)
 #endif
 		}
 
-#if !defined(WITH_ANDROID) && defined(__linux__)
+#ifdef __linux__
 		/* Send INQUIRY command */
 		memset(&io_hdr, 0, sizeof(sg_io_hdr_t));
 		io_hdr.interface_id = 'S';
@@ -1033,7 +1029,7 @@ int get_device_info(int i)
 		return -1;
 	}
 
-#if !defined(WITH_ANDROID) && defined(__linux__)
+#ifdef __linux__
 	if (S_ISBLK(stat_buf->st_mode)) {
 		if (f2fs_get_zoned_model(i) < 0) {
 			free(stat_buf);
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
