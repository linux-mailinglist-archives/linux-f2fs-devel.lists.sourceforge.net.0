Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED06650AB56
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 00:19:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhf8o-0001dz-VP; Thu, 21 Apr 2022 22:19:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nhf8n-0001df-5E
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5eF/kEPp0NCNZxzoYvUyebXdhdVXQwZo8uakWZydwUk=; b=ToZFuxieqE0+8VU9WutuSF4nWt
 G+DEklWVCRDZtbTgpYGx/B+uHwqZKFg7Pbxz0fTS8FddWHDKcmJu2WHaaCXZ1D5q7RzgjmHvsVo9m
 a0a1PdAPTFconv+PkxdJJ/8NfHuE5ElApzV+XngBFC4vC+RepVSwEoyahoDUezp9UnW0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5eF/kEPp0NCNZxzoYvUyebXdhdVXQwZo8uakWZydwUk=; b=gGdAgO7aLYcgdvb5QHGB/wLRwZ
 oALwyW7VaWovu12SOP2r+qNGXq6q69kDpj9f2jrsdsK2qb6wSIAjb3PNwAnnVJ/5yAdmnd72os9cD
 tgznqI7YhMONbaQkWdLgqcWjLHfP9OC45YSpjsoc+grc2CqFgBfC9fpgY7LmxI8BYCK4=;
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhf8j-0002vF-8E
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:06 +0000
Received: by mail-pl1-f178.google.com with SMTP id n8so6793506plh.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 15:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5eF/kEPp0NCNZxzoYvUyebXdhdVXQwZo8uakWZydwUk=;
 b=i0x7kyu5cOGYJwVqqdbh/5eIMSdNgDDxJQsaqOT/1/7KezA2j8Yq53HSOSMNtOo8Dx
 Bb7w3Q4e1LhWDIOKzH9D2F/KV2NjjDYTM+SJMuTA5pqCI6fojUHF5qqryN2NjLUqw6xY
 YPDJXaGSNGRc1utZewal1TirRXFLnqtw8jmRgDnuCB06zmiMEFeQzv17Va4X2kq+PWzL
 2U9MMVK4UFe8AYdfhzJ4MFtRgpQySfta06MiLQj7MQPBgPxgvFIpjBnIv8E+vcJNfVoq
 dfuYhG6K0KerkP+QoEI76Tdu7dfFyPG30PT/A6Ue9Lk/WU8TZ4vogwjmL+HmYPMTyxPZ
 hYhg==
X-Gm-Message-State: AOAM532QHqHtTyXEhGyAMPGWvFtoc7kkFRtiucVXel1kZX+yMwbqltY4
 RXqOHXRQ4sG99vxvklgJwV3WJDmtXF48sg==
X-Google-Smtp-Source: ABdhPJxEYRR4hVBxo7/d4Z99Ts5m69kqiq4YpaJOetkc+deEQN+AC7goXqoHfLUWWBc2lvJHz38MqA==
X-Received: by 2002:a17:902:b10f:b0:156:612f:318d with SMTP id
 q15-20020a170902b10f00b00156612f318dmr1518153plr.143.1650579539617; 
 Thu, 21 Apr 2022 15:18:59 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:a034:31d8:ca4e:1f35])
 by smtp.gmail.com with ESMTPSA id
 hi21-20020a17090b30d500b001cd4989ff4csm3794876pjb.19.2022.04.21.15.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:18:58 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 21 Apr 2022 15:18:12 -0700
Message-Id: <20220421221836.3935616-8-bvanassche@acm.org>
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
 Content preview: This makes it easier to build f2fs-tools for Windows.
 Signed-off-by:
 Bart Van Assche <bvanassche@acm.org> --- lib/libf2fs.c | 10 +++++-----
 lib/libf2fs_io.c
 | 6 +++--- lib/libf2fs_zoned.c | 2 +- mkfs/f2fs_format.c | 2 +-
 mkfs/f2fs_format_main.c | 2 +- mk [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.178 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1nhf8j-0002vF-8E
Subject: [f2fs-dev] [PATCH 07/31] Change the ANDROID_WINDOWS_HOST macro into
 _WIN32
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

This makes it easier to build f2fs-tools for Windows.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 lib/libf2fs.c            | 10 +++++-----
 lib/libf2fs_io.c         |  6 +++---
 lib/libf2fs_zoned.c      |  2 +-
 mkfs/f2fs_format.c       |  2 +-
 mkfs/f2fs_format_main.c  |  2 +-
 mkfs/f2fs_format_utils.c |  4 ++--
 6 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index b0a892772de1..c7102528f2f4 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -22,7 +22,7 @@
 #endif
 #include <time.h>
 #include <sys/stat.h>
-#ifndef ANDROID_WINDOWS_HOST
+#ifndef _WIN32
 #include <sys/mount.h>
 #include <sys/ioctl.h>
 #endif
@@ -49,7 +49,7 @@
 #define MODELINQUIRY	0x12,0x00,0x00,0x00,0x4A,0x00
 #endif
 
-#ifndef ANDROID_WINDOWS_HOST /* O_BINARY is windows-specific flag */
+#ifndef _WIN32 /* O_BINARY is windows-specific flag */
 #define O_BINARY 0
 #else
 /* On Windows, wchar_t is 8 bit sized and it causes compilation errors. */
@@ -606,7 +606,7 @@ int write_inode(struct f2fs_node *inode, u64 blkaddr)
  */
 char *get_rootdev()
 {
-#if defined(ANDROID_WINDOWS_HOST) || defined(WITH_ANDROID)
+#if defined(_WIN32) || defined(WITH_ANDROID)
 	return NULL;
 #else
 	struct stat sb;
@@ -740,7 +740,7 @@ static int is_mounted(const char *mpt, const char *device)
 
 int f2fs_dev_is_umounted(char *path)
 {
-#ifdef ANDROID_WINDOWS_HOST
+#ifdef _WIN32
 	return 0;
 #else
 	struct stat *st_buf;
@@ -872,7 +872,7 @@ void get_kernel_uname_version(__u8 *version)
 #define BLKSSZGET	DKIOCGETBLOCKCOUNT
 #endif /* APPLE_DARWIN */
 
-#ifndef ANDROID_WINDOWS_HOST
+#ifndef _WIN32
 static int open_check_fs(char *path, int flag)
 {
 	if (c.func != DUMP && (c.func != FSCK || c.fix_on || c.auto_fix))
diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index b985e6f37a0a..bf6dfe240bb7 100644
--- a/lib/libf2fs_io.c
+++ b/lib/libf2fs_io.c
@@ -23,7 +23,7 @@
 #include <mntent.h>
 #endif
 #include <time.h>
-#ifndef ANDROID_WINDOWS_HOST
+#ifndef _WIN32
 #include <sys/stat.h>
 #include <sys/mount.h>
 #include <sys/ioctl.h>
@@ -634,7 +634,7 @@ int dev_reada_block(__u64 blk_addr)
 
 int f2fs_fsync_device(void)
 {
-#ifndef ANDROID_WINDOWS_HOST
+#ifndef _WIN32
 	int i;
 
 	for (i = 0; i < c.ndevs; i++) {
@@ -783,7 +783,7 @@ int f2fs_finalize_device(void)
 	 * in the block device page cache.
 	 */
 	for (i = 0; i < c.ndevs; i++) {
-#ifndef ANDROID_WINDOWS_HOST
+#ifndef _WIN32
 		ret = fsync(c.devices[i].fd);
 		if (ret < 0) {
 			MSG(0, "\tError: Could not conduct fsync!!!\n");
diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
index c408a4991fa1..cb954feabe61 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -22,7 +22,7 @@
 #ifdef HAVE_LINUX_LIMITS_H
 #include <linux/limits.h>
 #endif
-#ifndef ANDROID_WINDOWS_HOST
+#ifndef _WIN32
 #include <sys/ioctl.h>
 #endif
 #include <libgen.h>
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 8bd33ac003c5..332abf60d0d9 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -13,7 +13,7 @@
 #include <fcntl.h>
 #include <string.h>
 #include <unistd.h>
-#ifndef ANDROID_WINDOWS_HOST
+#ifndef _WIN32
 #include <sys/stat.h>
 #include <sys/mount.h>
 #endif
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index d05d4e2cb4e5..ecc942b61d63 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -15,7 +15,7 @@
 #include <stdbool.h>
 #include <unistd.h>
 #include <sys/stat.h>
-#ifndef ANDROID_WINDOWS_HOST
+#ifndef _WIN32
 #include <sys/mount.h>
 #endif
 #include <time.h>
diff --git a/mkfs/f2fs_format_utils.c b/mkfs/f2fs_format_utils.c
index e84311ae1287..53101d1bd790 100644
--- a/mkfs/f2fs_format_utils.c
+++ b/mkfs/f2fs_format_utils.c
@@ -26,7 +26,7 @@
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdbool.h>
-#ifndef ANDROID_WINDOWS_HOST
+#ifndef _WIN32
 #include <sys/ioctl.h>
 #endif
 #include <sys/stat.h>
@@ -48,7 +48,7 @@
 
 static int trim_device(int i)
 {
-#ifndef ANDROID_WINDOWS_HOST
+#ifndef _WIN32
 	unsigned long long range[2];
 	struct stat *stat_buf;
 	struct device_info *dev = c.devices + i;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
