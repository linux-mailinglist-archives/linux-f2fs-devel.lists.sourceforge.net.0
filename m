Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB244510C69
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Apr 2022 01:06:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njUGj-0004Ht-10; Tue, 26 Apr 2022 23:06:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1njUGY-0004Hl-Oj
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Apr 2022 23:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dh7EAPJZyvmA8mFLiU1B3pGdQFHe2YGfJgTvfkdEMqo=; b=aNQs7QRHCEOS3QbOI33N5OFXoH
 g+dhhmGcfWO3/X1IT6A6g79UNbKb1TtiKCiuZh1jkhwgg+WtB+JL+j1E1MIwSKhe8/tCfuuE0NEhS
 sXnjTxbNrW9WjI+WgP1I4CATA9gMsreK0U2E1Oyt3m9VTW1zDgWwcleVVnP8uE7JxE68=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Dh7EAPJZyvmA8mFLiU1B3pGdQFHe2YGfJgTvfkdEMqo=; b=Ix3ZBYUhMziXmb+Tkq0bs3GBNT
 lzjOUmpeefbolS8PV6pJPyBkVO8V8n8s3REZJfUm2F/mGhfmsGrCztTMRLSdP4S63+EpE7vhCdDf0
 5zVGcy6SWhBmXe3VLFAlih4s7vI19N0ghgWg2DTQQkOSgkBxPWyqXu7FX6/Wt1ywQZ70=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njUGS-00B7NL-AO
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Apr 2022 23:06:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 171D1619B9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 26 Apr 2022 23:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70844C385A0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 26 Apr 2022 23:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651014385;
 bh=iQU0CKO8lOoG+Myj3dOrmNHi3w/GKWV8VE39MnU0MyI=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=E3MVtBYDab/ZWWiih76hRPTHLO6g3x6yCA4b/EK/+0QmxSHIwkKiOYngcdeUBaIUH
 A+K1MV4xtuPuHeBQFcnlbzX118c3mxQoMXBG3AqIoEnjQCzjEbpm9r/FivkZWlAV2n
 7abTZy10ZWO4A6rkWs773DJIfr/2n+Mf7YyKw1R8QKAtGb6Y860ektLemUT6KpXGA+
 3S0jFwXKt1Y8iAVvmmmwdnqM6Rzmqs0UivN/HiLbuSA50VeR21WmGEJIioi4wfc5VD
 73RHniaQFczxMXNLN+uMgbyieWzT7m68lkSpwEeWctrqX1Rc634AI2v+Ne+hWVKyuh
 j3v3cVFt5wcjQ==
Date: Tue, 26 Apr 2022 16:06:23 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <Ymh678gnPofwuo7M@google.com>
References: <20220422211819.2230879-1-jaegeuk@kernel.org>
 <20220422211819.2230879-3-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220422211819.2230879-3-jaegeuk@kernel.org>
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
 | 4 ++++ include/f2fs_fs [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1njUGS-00B7NL-AO
Subject: Re: [f2fs-dev] [PATCH 3/6 v2] f2fs-tools: support zoned device in
 Android
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This requires to change Android.bp in AOSP.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Change-Id: I28a4a701513cb2420cdf0e0e2aa3f60e712f2fcb
---
 configure.ac             |  9 ++++++++-
 fsck/fsck.c              |  2 +-
 include/android_config.h |  4 ++++
 include/f2fs_fs.h        |  4 +++-
 lib/libf2fs.c            | 10 +++-------
 5 files changed, 19 insertions(+), 10 deletions(-)

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
index ce6723309447..d7e4f60d91c6 100644
--- a/include/android_config.h
+++ b/include/android_config.h
@@ -1,7 +1,10 @@
 #if defined(__linux__)
+#define HAVE_BLK_ZONE_REP_V2 1
 #define HAVE_BYTESWAP_H 1
 #define HAVE_FCNTL_H 1
 #define HAVE_FALLOC_H 1
+#define HAVE_KERNEL_UAPI_LINUX_BLKZONED_H 1
+#define HAVE_LINUX_BLKZONED_H 1
 #define HAVE_LINUX_HDREG_H 1
 #define HAVE_LINUX_LIMITS_H 1
 #define HAVE_POSIX_ACL_H 1
@@ -19,6 +22,7 @@
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
