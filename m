Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E68AE50AB53
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 00:19:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhf8j-0005Gh-F5; Thu, 21 Apr 2022 22:19:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nhf8i-0005GR-Ex
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QAWowuH2JNu6g3N6l+gN3Yi4/KW0w5q8MHntFqUTMoY=; b=hWBD0ex5TR/0xWQiGlX0lrxmWf
 Nb4ikutfpBD+l4zhWwGHx1okyon2aYacGmbcd6lKdMFH0/TiT648rslvMCxTuCTPGErO0NpXqmK8y
 eVCyB1Pejbu34myWTJWML61yAqww8ZxMb4BrqrZ1GXXyzrEd1Yk2Edvlc0TC9gh5DDqY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QAWowuH2JNu6g3N6l+gN3Yi4/KW0w5q8MHntFqUTMoY=; b=KfMZcEPpyGSCsnApWbyiUeg2dl
 i4vovN5KPdC3EevMlFa4eFGZk0kMcnfrzBX0bPRAtPYhWX/gjeIdphOaFOdxj7PBtGr26EHRh/PZ4
 la2k55m/hEZHr8ukpdkLArIM0i0OGxiJyL/tRBuKgUE4WyeePVAYQdX/2UWDOabZe+AA=;
Received: from mail-pg1-f181.google.com ([209.85.215.181])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhf8f-005sOu-RQ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:05 +0000
Received: by mail-pg1-f181.google.com with SMTP id g9so5778026pgc.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 15:19:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QAWowuH2JNu6g3N6l+gN3Yi4/KW0w5q8MHntFqUTMoY=;
 b=PnaeVBcklJE7Qm0EGY1Z69UwwIfk1BXhIy+hIhPJdd369CnqlzSbAcQxw+6D6vtQSt
 YnvbQIQuyorzp4+FOWB7H4J0wxm+Au6cWSuT9a0sCvjjLUfJNLYbWqdKfhpRHLyF+Efs
 dlLvM7Es/wSdQ9/ragwudJGDA6vY+H0hJBE5iAty7/dxjcMPd0cKoOf6kX0bAJ8YC2zf
 KaOm6rWpiomioNnyV/ulLHXdeNr3qBP9y5e/a3Q3M3wkxdrPTyWzqrz2o7FFy1ejXrGc
 hLEpYJEoleQftKHUvvms1t99aq8iEUQiOalvih/cohPMe1J9u7y/QN+aZCxhUkclS5v7
 uScQ==
X-Gm-Message-State: AOAM533JIhfi3r7aoeaNxQIEFp+88kbiJd9CjY6DehYXlpyLkLWgjtj6
 rPbNqKYKCyich/4XIt+g/XeWvEECys+Exg==
X-Google-Smtp-Source: ABdhPJzODgoTxltxARLlOGVUKc6bKR7dE1KmDWrZ7ZtdM9XCIrrmIF+tXFf/W8p7VNbgSxVkEcFgRw==
X-Received: by 2002:a05:6a02:20c:b0:381:f276:98d6 with SMTP id
 bh12-20020a056a02020c00b00381f27698d6mr1269487pgb.39.1650579536255; 
 Thu, 21 Apr 2022 15:18:56 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:a034:31d8:ca4e:1f35])
 by smtp.gmail.com with ESMTPSA id
 hi21-20020a17090b30d500b001cd4989ff4csm3794876pjb.19.2022.04.21.15.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:18:55 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 21 Apr 2022 15:18:10 -0700
Message-Id: <20220421221836.3935616-6-bvanassche@acm.org>
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
 Content preview: Stop using PKG_CHECK_MODULES() since that macro is not
 compatible
 with cross-compilation. Signed-off-by: Bart Van Assche <bvanassche@acm.org>
 --- README | 1 - configure.ac | 47 ++++++++++++++++++ mkfs/f2fs_format.c
 | 2 +- mkfs/f2fs_format_main.c | 4 ++-- tools/f2fscr [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.181 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.181 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1nhf8f-005sOu-RQ
Subject: [f2fs-dev] [PATCH 05/31] configure.ac: Enable cross-compilation
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

Stop using PKG_CHECK_MODULES() since that macro is not compatible with
cross-compilation.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 README                  |  1 -
 configure.ac            | 47 ++++++++++++++++++-----------------------
 mkfs/f2fs_format.c      |  2 +-
 mkfs/f2fs_format_main.c |  4 ++--
 tools/f2fscrypt.c       |  2 +-
 5 files changed, 24 insertions(+), 32 deletions(-)

diff --git a/README b/README
index afe334fc6170..c9b0c1f6f721 100644
--- a/README
+++ b/README
@@ -9,7 +9,6 @@ Before compilation
 
 You should install the following packages.
  - libuuid-devel or uuid-dev
- - pkg-config
  - autoconf
  - libtool
  - libselinux1-dev
diff --git a/configure.ac b/configure.ac
index 0d7872abde19..4a3afa4853eb 100644
--- a/configure.ac
+++ b/configure.ac
@@ -53,6 +53,12 @@ AC_PATH_PROG([LDCONFIG], [ldconfig],
        [$PATH:/sbin])
 
 # Checks for libraries.
+AC_CHECK_LIB([blkid], [blkid_probe_all],
+	[AC_SUBST([libblkid_LIBS], ["-lblkid"])
+		AC_DEFINE([HAVE_LIBBLKID], [1],
+		[Define if you have libblkid])
+	], [], [])
+
 AC_CHECK_LIB([lzo2], [main],
 	[AC_SUBST([liblzo2_LIBS], ["-llzo2"])
 		AC_DEFINE([HAVE_LIBLZO2], [1],
@@ -65,37 +71,22 @@ AC_CHECK_LIB([lz4], [main],
 		[Define if you have liblz4])
 	], [], [])
 
-PKG_CHECK_MODULES([libuuid], [uuid])
-
-AS_IF([test "x$with_selinux" != "xno"],
-	[PKG_CHECK_MODULES([libselinux], [libselinux],
-	                   [have_selinux=yes], [have_selinux=no])],
-	[have_selinux=no]
-)
-
-AS_IF([test "x$have_selinux" = "xyes"],
-	[AC_DEFINE([HAVE_LIBSELINUX], [1], [Use libselinux])],
-	[AS_IF([test "x$with_selinux" = "xyes"],
-		[AC_MSG_ERROR([selinux support requested but libselinux not found])]
-	)]
-)
-
-AS_IF([test "x$with_blkid" != "xno"],
-	[PKG_CHECK_MODULES([libblkid], [blkid],
-	                   [have_blkid=yes], [have_blkid=no])],
-	[have_blkid=no]
-)
-
-AS_IF([test "x$have_blkid" = "xyes"],
-	[AC_DEFINE([HAVE_LIBBLKID], [1], [Use blkid])],
-	[AS_IF([test "x$with_blkid" = "xyes"],
-		[AC_MSG_ERROR([blkid support requested but libblkid not found])]
-	)]
-)
+AC_CHECK_LIB([selinux], [getcon],
+	[AC_SUBST([libselinux_LIBS], ["-lselinux"])
+		AC_DEFINE([HAVE_LIBSELINUX], [1],
+		[Define if you have libselinux])
+	], [], [])
+
+AC_CHECK_LIB([uuid], [uuid_clear],
+	[AC_SUBST([libuuid_LIBS], ["-luuid"])
+		AC_DEFINE([HAVE_LIBUUID], [1],
+		[Define if you have libuuid])
+	], [], [])
 
 # Checks for header files.
 AC_CHECK_HEADERS(m4_flatten([
 	attr/xattr.h
+	blkid/blkid.h
 	byteswap.h
 	fcntl.h
 	linux/blkzoned.h
@@ -110,6 +101,7 @@ AC_CHECK_HEADERS(m4_flatten([
 	mach/mach_time.h
 	mntent.h
 	scsi/sg.h
+	selinux/selinux.h
 	stdlib.h
 	string.h
 	sys/acl.h
@@ -120,6 +112,7 @@ AC_CHECK_HEADERS(m4_flatten([
 	sys/utsname.h
 	sys/xattr.h
 	unistd.h
+	uuid/uuid.h
 ]))
 
 # Checks for typedefs, structures, and compiler characteristics.
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index dba0cec61e60..d237d1a8c12e 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -18,7 +18,7 @@
 #include <sys/mount.h>
 #endif
 #include <time.h>
-#include <uuid.h>
+#include <uuid/uuid.h>
 
 #include "f2fs_fs.h"
 #include "quota.h"
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index bf78756ed374..797e90a948f5 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -19,13 +19,13 @@
 #include <sys/mount.h>
 #endif
 #include <time.h>
-#include <uuid.h>
+#include <uuid/uuid.h>
 #include <errno.h>
 #include <getopt.h>
 
 #include "config.h"
 #ifdef HAVE_LIBBLKID
-#include <blkid.h>
+#include <blkid/blkid.h>
 #endif
 
 #include "f2fs_fs.h"
diff --git a/tools/f2fscrypt.c b/tools/f2fscrypt.c
index d5bc3c5ff50b..fe3e0ff3c1a9 100644
--- a/tools/f2fscrypt.c
+++ b/tools/f2fscrypt.c
@@ -43,7 +43,7 @@
 #ifdef __KERNEL__
 #include <linux/fs.h>
 #endif
-#include <uuid.h>
+#include <uuid/uuid.h>
 
 #if !defined(HAVE_ADD_KEY) || !defined(HAVE_KEYCTL)
 #include <sys/syscall.h>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
