Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 757BA50AB60
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 00:19:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhf94-0001ki-FN; Thu, 21 Apr 2022 22:19:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nhf92-0001k7-Vm
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+IbtZ04wa90zKfWSEAUnfC9y9YP3eIoqXsgdnPK5CtE=; b=V3SVP9iT2mOONRThI5dHP8ParC
 k5WgKgAkRgc+quhFdUrm0DyGUMTKh4YJwOtbs+q0rG5cnMSEG/1jba6cy1XWZzOiNxVVo+/XEd4VX
 I6RpoM11giSxBnV+iafWJ3DiUbpT63Yz1mByOaRkEbxRbk6uaVKviajP7yn/LTKmRm/c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+IbtZ04wa90zKfWSEAUnfC9y9YP3eIoqXsgdnPK5CtE=; b=XmfMF0Dn52k/k18B1enxQK++zB
 2tCoyR+NxzLxr4hOJoQ+BQTU8yye4Qtnk/qtOeg/yH7vZQap5yi5L1N+lUjAGLQrOsAiD2sH4ESFu
 5JP0CMpBp1lf2PMBxcjPdAxlU4dRJVNoUCI78cBWgAiA6xciw7lRo944cYj92sLEbu20=;
Received: from mail-pg1-f172.google.com ([209.85.215.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhf8z-0002x7-JB
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:23 +0000
Received: by mail-pg1-f172.google.com with SMTP id k14so5831977pga.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 15:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+IbtZ04wa90zKfWSEAUnfC9y9YP3eIoqXsgdnPK5CtE=;
 b=PoyRct3Is/FRUz+gv1O1t82EMZ+74EwYTiZHmszLmtYETkLm/BRrhw3Rc3v+dLI9dm
 HixhC/RDMXg//mb1nRsjeA6JoHfFj9D6abpKR9I9bgXOkWdWku+7EaJ8YZoBYLJHM4B9
 0DRLyq1CghIQRlWVxC7rdbqvmwRLYMboN5P/LsT6b2AH1EoOR+CutmTmu+/lt+jFRcfo
 OmHM+FCEunYX5z59umws8yuwLcG0JGbHnOLfA2IGaLXGKC/Bu1VtBqbX/nRhO73FCHEF
 dlnipsLCShQzNBqZ4Y9hnQ+ClLr5nq7ZcbMqLbpl4GrI8eczt7eM19Dz1FdstnbLlDHn
 cu1A==
X-Gm-Message-State: AOAM5302Jr5m9dQzkeFJCCM5DKnfOVjnqvwvuZ73odd9DQzw4/MEEcM3
 I6JzjJdz1yw2+m0k7BnMifA=
X-Google-Smtp-Source: ABdhPJyM4ATMa5niMGNckpFUsHmkMSJpnP6nFjTTjoYNF4JZ0zgzMOwMnFdcQKu0hZHfI/dmB0LEbQ==
X-Received: by 2002:a63:4f1d:0:b0:3a6:d255:9d7e with SMTP id
 d29-20020a634f1d000000b003a6d2559d7emr1365979pgb.152.1650579555969; 
 Thu, 21 Apr 2022 15:19:15 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:a034:31d8:ca4e:1f35])
 by smtp.gmail.com with ESMTPSA id
 hi21-20020a17090b30d500b001cd4989ff4csm3794876pjb.19.2022.04.21.15.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:19:15 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 21 Apr 2022 15:18:23 -0700
Message-Id: <20220421221836.3935616-19-bvanassche@acm.org>
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
 Content preview: The <sparse/sparse.h> header is available in Android but not
 in the Android NDK. Hence this patch that only includes the sparse header
 file if it is available. Signed-off-by: Bart Van Assche <bvanassche@acm.org>
 --- configure.ac | 1 + lib/libf2fs_io.c | 10 +++++-----
 mkfs/f2fs_format_main.c
 | 2 +- 3 files changed, 7 insertions(+), 6 deletions(-) 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.172 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.172 listed in wl.mailspike.net]
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1nhf8z-0002x7-JB
Subject: [f2fs-dev] [PATCH 18/31] configure.ac: Detect the sparse/sparse.h
 header
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

The <sparse/sparse.h> header is available in Android but not in the
Android NDK. Hence this patch that only includes the sparse header file
if it is available.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 configure.ac            |  1 +
 lib/libf2fs_io.c        | 10 +++++-----
 mkfs/f2fs_format_main.c |  2 +-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/configure.ac b/configure.ac
index 06aaed9a57d9..317030dad44f 100644
--- a/configure.ac
+++ b/configure.ac
@@ -109,6 +109,7 @@ AC_CHECK_HEADERS(m4_flatten([
 	pthread_time.h
 	scsi/sg.h
 	selinux/selinux.h
+	sparse/sparse.h
 	stdlib.h
 	string.h
 	sys/acl.h
diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index bf6dfe240bb7..287199314190 100644
--- a/lib/libf2fs_io.c
+++ b/lib/libf2fs_io.c
@@ -39,7 +39,7 @@
 
 struct f2fs_configuration c;
 
-#ifdef WITH_ANDROID
+#ifdef HAVE_SPARSE_SPARSE_H
 #include <sparse/sparse.h>
 struct sparse_file *f2fs_sparse_file;
 static char **blocks;
@@ -398,7 +398,7 @@ int dev_read_version(void *buf, __u64 offset, size_t len)
 	return 0;
 }
 
-#ifdef WITH_ANDROID
+#ifdef HAVE_SPARSE_SPARSE_H
 static int sparse_read_blk(__u64 block, int count, void *buf)
 {
 	int i;
@@ -649,7 +649,7 @@ int f2fs_fsync_device(void)
 
 int f2fs_init_sparse_file(void)
 {
-#ifdef WITH_ANDROID
+#ifdef HAVE_SPARSE_SPARSE_H
 	if (c.func == MKFS) {
 		f2fs_sparse_file = sparse_file_new(F2FS_BLKSIZE, c.device_size);
 		if (!f2fs_sparse_file)
@@ -691,7 +691,7 @@ int f2fs_init_sparse_file(void)
 
 void f2fs_release_sparse_resource(void)
 {
-#ifdef WITH_ANDROID
+#ifdef HAVE_SPARSE_SPARSE_H
 	int j;
 
 	if (c.sparse_mode) {
@@ -716,7 +716,7 @@ int f2fs_finalize_device(void)
 	int i;
 	int ret = 0;
 
-#ifdef WITH_ANDROID
+#ifdef HAVE_SPARSE_SPARSE_H
 	if (c.sparse_mode) {
 		int64_t chunk_start = (blocks[0] == NULL) ? -1 : 0;
 		uint64_t j;
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index 88b267492245..4d4fad9ad86d 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -37,7 +37,7 @@
 #ifdef HAVE_SYS_UTSNAME_H
 #include <sys/utsname.h>
 #endif
-#ifdef WITH_ANDROID
+#ifdef HAVE_SPARSE_SPARSE_H
 #include <sparse/sparse.h>
 extern struct sparse_file *f2fs_sparse_file;
 #endif


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
