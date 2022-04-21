Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D3350AB66
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 00:19:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhf9B-0005TZ-Gm; Thu, 21 Apr 2022 22:19:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nhf99-0005Sm-TZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T8iwjekXPxiaj17fydIQh0TWX87G4zsmH15HXBX4IN4=; b=PCRYjvNcotieoFaC13xnv+RX7e
 /aiJzxq2Xzuf0EMxnOnaWLolHLHJG6EuNkDE6ID+mzlPQXRBnjAxKNTAIjiFtWlEYeAkSFXBths+4
 /mkAq9Rs+U2JqC00eoqc1hqvpqmJh/rxE3OfI05fiKaxkvldkhgLiCbzOOGqd6b7iyu0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T8iwjekXPxiaj17fydIQh0TWX87G4zsmH15HXBX4IN4=; b=RDhnXUNhpyTiCwbb+fjdjf4UGM
 UcmmkExWWyQxxXv2VBw/3V6Aes8H3mHnfwMU3VBISlyBoWU6sSvMdOFkDsvbcub6u/FwZJXMXS2Pm
 6a1noQehyP7TMzZ8N3K31QA/WpbkjNNGGfmxQAjuqhy/AMSguL5iwqKn2ghEy4B3NMTI=;
Received: from mail-pl1-f170.google.com ([209.85.214.170])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhf99-005sRu-6F
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:32 +0000
Received: by mail-pl1-f170.google.com with SMTP id t12so6770310pll.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 15:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T8iwjekXPxiaj17fydIQh0TWX87G4zsmH15HXBX4IN4=;
 b=LE9sMgR5VoPzVbREgBBBfgEQPYlnVKxZn90gLjdM83XPrj9B1QR8bGn0yR8oLCnPHD
 DneN7RZaWLH9+YS0Ub4iWotdp6AXclnNqVu38XbY16N0X9/tzAWOgUEU0DKgDbyYwz7i
 GWSSBtTIxLtOU3bfYJgzbeqnEPxVaWVfWsTjQw+7E1UMSW7Mu+Q5mtB/+OyoxU4hCvtn
 K+LobtZUb3FOSf+YNLlp1PRGF97Wdgyy3tDKjIl4YJceLUX0Y1RLqZwH1YQTOZ+KsK+2
 e1Q4RQH729a6kZqj9uEKo1lnEW1k2OFGp1PJZvH2mCHA1Dyg5OA34ranVdj5rBorRa4Z
 x+YA==
X-Gm-Message-State: AOAM530OPgg3G2RRg2P9pcHSf0nKodJXklRUPxKLFSIujfaZ//wqLINU
 O05FMRGMWKWNC4PIaz18d0naOY2f1f4kJQ==
X-Google-Smtp-Source: ABdhPJwebUgUg2ZwszSzoSWOytY7V3KWAdsmklBxanrCKWGVb1XoR6oGD9+TG6wVHOMs1qOfObYT7w==
X-Received: by 2002:a17:902:7d81:b0:14f:e18b:2b9e with SMTP id
 a1-20020a1709027d8100b0014fe18b2b9emr1322910plm.160.1650579565578; 
 Thu, 21 Apr 2022 15:19:25 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:a034:31d8:ca4e:1f35])
 by smtp.gmail.com with ESMTPSA id
 hi21-20020a17090b30d500b001cd4989ff4csm3794876pjb.19.2022.04.21.15.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:19:24 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 21 Apr 2022 15:18:29 -0700
Message-Id: <20220421221836.3935616-25-bvanassche@acm.org>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
In-Reply-To: <20220421221836.3935616-1-bvanassche@acm.org>
References: <20220421221836.3935616-1-bvanassche@acm.org>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: It is recommended to test a HAVE_* macro instead of directly
 testing the host type in source code. Hence this patch. Signed-off-by: Bart
 Van Assche <bvanassche@acm.org> --- configure.ac | 2 ++ lib/libf2fs.c | 4
 +++- lib/libf2fs_io.c | 10 +++++++--- lib/libf2fs_zoned.c | 2 +-
 mkfs/f2fs_format.c | 4 +++- mkfs/f2fs_for [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.170 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.170 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1nhf99-005sRu-6F
Subject: [f2fs-dev] [PATCH 24/31] Change #ifdef _WIN32 checks into #ifdef
 HAVE_.*
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

It is recommended to test a HAVE_* macro instead of directly testing the
host type in source code. Hence this patch.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 configure.ac             |  2 ++
 lib/libf2fs.c            |  4 +++-
 lib/libf2fs_io.c         | 10 +++++++---
 lib/libf2fs_zoned.c      |  2 +-
 mkfs/f2fs_format.c       |  4 +++-
 mkfs/f2fs_format_main.c  |  2 +-
 mkfs/f2fs_format_utils.c |  7 +++++--
 7 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/configure.ac b/configure.ac
index fc094b72b583..f0ed5f6528d9 100644
--- a/configure.ac
+++ b/configure.ac
@@ -116,6 +116,7 @@ AC_CHECK_HEADERS(m4_flatten([
 	sys/acl.h
 	sys/ioctl.h
 	sys/mount.h
+	sys/stat.h
 	sys/syscall.h
 	sys/sysmacros.h
 	sys/utsname.h
@@ -138,6 +139,7 @@ AC_CHECK_FUNCS_ONCE([
 	fsetxattr
 	fstat
 	fstat64
+	fsync
 	getgid
 	getmntent
 	getuid
diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index c7102528f2f4..aa4e854acc9d 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -22,8 +22,10 @@
 #endif
 #include <time.h>
 #include <sys/stat.h>
-#ifndef _WIN32
+#ifdef HAVE_SYS_MOUNT_H
 #include <sys/mount.h>
+#endif
+#ifdef HAVE_SYS_IOCTL_H
 #include <sys/ioctl.h>
 #endif
 #ifdef HAVE_SYS_SYSMACROS_H
diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index 287199314190..09a689293356 100644
--- a/lib/libf2fs_io.c
+++ b/lib/libf2fs_io.c
@@ -23,9 +23,13 @@
 #include <mntent.h>
 #endif
 #include <time.h>
-#ifndef _WIN32
+#ifdef HAVE_SYS_STAT_H
 #include <sys/stat.h>
+#endif
+#ifdef HAVE_SYS_MOUNT_H
 #include <sys/mount.h>
+#endif
+#ifdef HAVE_SYS_IOCTL_H
 #include <sys/ioctl.h>
 #endif
 #ifdef HAVE_LINUX_HDREG_H
@@ -634,7 +638,7 @@ int dev_reada_block(__u64 blk_addr)
 
 int f2fs_fsync_device(void)
 {
-#ifndef _WIN32
+#ifdef HAVE_FSYNC
 	int i;
 
 	for (i = 0; i < c.ndevs; i++) {
@@ -783,7 +787,7 @@ int f2fs_finalize_device(void)
 	 * in the block device page cache.
 	 */
 	for (i = 0; i < c.ndevs; i++) {
-#ifndef _WIN32
+#ifdef HAVE_FSYNC
 		ret = fsync(c.devices[i].fd);
 		if (ret < 0) {
 			MSG(0, "\tError: Could not conduct fsync!!!\n");
diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
index cb954feabe61..fdde3f70a606 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -22,7 +22,7 @@
 #ifdef HAVE_LINUX_LIMITS_H
 #include <linux/limits.h>
 #endif
-#ifndef _WIN32
+#ifdef HAVE_SYS_IOCTL_H
 #include <sys/ioctl.h>
 #endif
 #include <libgen.h>
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 6f2761cfdb75..ce7d1c9e40bd 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -13,8 +13,10 @@
 #include <fcntl.h>
 #include <string.h>
 #include <unistd.h>
-#ifndef _WIN32
+#ifdef HAVE_SYS_STAT_H
 #include <sys/stat.h>
+#endif
+#ifdef HAVE_SYS_MOUNT_H
 #include <sys/mount.h>
 #endif
 #include <time.h>
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index 4d4fad9ad86d..b8936f15e0f2 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -15,7 +15,7 @@
 #include <stdbool.h>
 #include <unistd.h>
 #include <sys/stat.h>
-#ifndef _WIN32
+#ifdef HAVE_SYS_MOUNT_H
 #include <sys/mount.h>
 #endif
 #include <time.h>
diff --git a/mkfs/f2fs_format_utils.c b/mkfs/f2fs_format_utils.c
index 53101d1bd790..e3c58936e968 100644
--- a/mkfs/f2fs_format_utils.c
+++ b/mkfs/f2fs_format_utils.c
@@ -26,7 +26,7 @@
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdbool.h>
-#ifndef _WIN32
+#ifdef HAVE_SYS_IOCTL_H
 #include <sys/ioctl.h>
 #endif
 #include <sys/stat.h>
@@ -39,16 +39,19 @@
 #include <linux/falloc.h>
 #endif
 
+#ifdef __linux__
 #ifndef BLKDISCARD
 #define BLKDISCARD	_IO(0x12,119)
 #endif
 #ifndef BLKSECDISCARD
 #define BLKSECDISCARD	_IO(0x12,125)
 #endif
+#endif
 
 static int trim_device(int i)
 {
-#ifndef _WIN32
+#if defined(FALLOC_FL_PUNCH_HOLE) || defined(BLKDISCARD) || \
+	defined(BLKSECDISCARD)
 	unsigned long long range[2];
 	struct stat *stat_buf;
 	struct device_info *dev = c.devices + i;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
