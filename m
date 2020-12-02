Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E782CB1E7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Dec 2020 01:58:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkGTR-0004NB-J5; Wed, 02 Dec 2020 00:58:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <robinh3123@gmail.com>) id 1kkGTP-0004Mu-TE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Dec 2020 00:58:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r8Dqx64NtmWE/rcfljGWWSOnLh5E2fpRKEuO+95a5Mw=; b=WZyxSDLoMq9xqfeNPAt93pZfME
 JXta2fBtmgVnesNRnw8Lg6/+oT8ykvTcjHSXsOcVrchU/ir8SUKY0nLp2S2E37eghMGY4KgN59X5N
 4mLWMUotZRdIXnKlOVe+vkek7XuYNgsouwr5oTj3ZAtyrfC3DyQSfA3cnvPRGCwbWtx0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r8Dqx64NtmWE/rcfljGWWSOnLh5E2fpRKEuO+95a5Mw=; b=izTz/vbY44LtUGRe+lWvaWRaPF
 KbzdoXYFsT7dbOZFQ3rkSrCUa4KAA8blC4Ef7gnNtR3WtP9Pwno41Kkx2+xz2Ucpa0WTle/D57G/e
 Wrv4jmLmOISX/1wJzitpE3xxxFV5Ph/24UFNnjUaKAWl2Shf9i01uA8uLbIKOIurWq5M=;
Received: from mail-pg1-f193.google.com ([209.85.215.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kkGTH-00ACPm-F4
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Dec 2020 00:58:23 +0000
Received: by mail-pg1-f193.google.com with SMTP id q3so24136pgr.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 01 Dec 2020 16:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r8Dqx64NtmWE/rcfljGWWSOnLh5E2fpRKEuO+95a5Mw=;
 b=R4tZgus2TolOesFRuuT6Jjb5JWsdoXO4wMxobsSJTb8kf0yphnYFU1hza/hCdkhQ/d
 LFq4X3RmrruWoICQ7GkTLCEkpM/l0DPyg8IZMLyj9Gm5XvqLN5yLUY7nmlTLrk+Lo7Jl
 7hHlMmndG/0H4SHV3NgdyP/h8r67Vt6JbEyTWl+SqjuHslfiJVpeAPjoUKLx1U47+rTy
 IZ3ZPVwaNyenOQt6kKdR8t+BHwhxscDxW0gETHwaXNSycOxqi+EG9CAMBS35FJBn0HeD
 XmItne9sitScBGWDZEt+rWh4axdMQWMX5FnBTQDkYfgedxnMykl3k1aGJDp6djy2ud+O
 8IJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r8Dqx64NtmWE/rcfljGWWSOnLh5E2fpRKEuO+95a5Mw=;
 b=KH6PHKxkAoty7IOyGrkvmNvrVcWCFcZHMvVIt0h1M+4Row2bCfz6BsqhYlxvLcFOK1
 vo3+Z2IS0A7IFwP2cvR4+Iau8AuNmdpOPRGcdZZDbm+53453P7jxzwno7qXBqwe/T5+A
 6pclGgtS2CJMYjVW0IQTo8V1T6NX0nF/9wbbWY+DKLqJKH+IQHAM2OaBIjl8NEOOgJPH
 YCrW2vZDpnwkf2Ts0tY5V8oKZRptS4lKyKRgHJWdNCV0XEMk1boXz/UECo4i17y1Zwnr
 JIE5javS1PRTfEQ1qFanOPyYySk7vBbHYL+/A/w9vMc46yrV7RVWAoBSHojHLZs3VQ8g
 egZg==
X-Gm-Message-State: AOAM531Q/HbLSTWMAWwANESd0iwjX25V2ea/cie3ebmxerXGNDnd8rk6
 uAo4f7KlwtWIgqz+7YbNNDE98CnooL0=
X-Google-Smtp-Source: ABdhPJwIK6+WSHA8JoySjXhZByAYfzH8jZKoYpm78uaROn55/IEnmMyfyzTNxD/2mllhcbVVB9TMJA==
X-Received: by 2002:aa7:9315:0:b029:18b:6372:d43e with SMTP id
 21-20020aa793150000b029018b6372d43emr132090pfj.2.1606870682552; 
 Tue, 01 Dec 2020 16:58:02 -0800 (PST)
Received: from robinhsu-p520.ntc.corp.google.com
 ([2401:fa00:fc:202:1ea0:b8ff:fe77:fe45])
 by smtp.gmail.com with ESMTPSA id gz2sm116974pjb.2.2020.12.01.16.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 16:58:02 -0800 (PST)
From: Robin Hsu <robinh3123@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org, chao@kernel.org
Date: Wed,  2 Dec 2020 08:57:24 +0800
Message-Id: <20201202005724.691458-4-robinh3123@gmail.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
In-Reply-To: <20201202005724.691458-1-robinh3123@gmail.com>
References: <20201202005724.691458-1-robinh3123@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.193 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (robinh3123[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (robinh3123[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kkGTH-00ACPm-F4
Subject: [f2fs-dev] [PATCH 3/3] f2fs-tools:sload.f2fs compress: Fixed
 automake
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Robin Hsu <robinhsu@google.com>

Fixed automake for sload.f2fs compression support

./configure now will by default depends on liblzo2 and liblz4.

To compile without liblzo2 (and thus not support liblzo2 compression),
run ./configure with '--without-lzo2' option.

To compile without liblz4 (and thus not support liblz4 compression),
run ./configure with '--without-lz4' option.

Signed-off-by: Robin Hsu <robinhsu@google.com>
---
 configure.ac     | 32 ++++++++++++++++++++++++++++++++
 fsck/Makefile.am |  9 ++++++---
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/configure.ac b/configure.ac
index 1e5619d..3a357b2 100644
--- a/configure.ac
+++ b/configure.ac
@@ -44,6 +44,14 @@ AC_ARG_WITH([blkid],
 	AS_HELP_STRING([--without-blkid],
 	  [Ignore presence of libblkid and disable blkid support]))
 
+AC_ARG_WITH([lzo2],
+	AS_HELP_STRING([--without-lzo2],
+	  [Ignore liblzo ver.2 for sload (not supporting lzo compression)]))
+
+AC_ARG_WITH([lz4],
+	AS_HELP_STRING([--without-lz4],
+	  [Ignore liblz4 for sload (not supporting lz4 compression)]))
+
 # Checks for programs.
 AC_PROG_CC
 AC_PROG_LIBTOOL
@@ -52,6 +60,30 @@ AC_PATH_PROG([LDCONFIG], [ldconfig],
        [$PATH:/sbin])
 
 # Checks for libraries.
+AS_IF([test "x$with_lzo2" != xno],
+            [AC_CHECK_LIB([lzo2], [main],
+              [AC_SUBST([liblzo2_LIBS], ["-llzo2"])
+               AC_DEFINE([HAVE_LIBLZO2], [1],
+                         [Define if you have liblzo2])
+              ],
+              [if test "x$with_lzo2" != xcheck; then
+                 AC_MSG_FAILURE(
+                   [--with-lzo2 was given (or by default), but test for liblzo2 failed])
+               fi
+              ], [])])
+
+AS_IF([test "x$with_lz4" != xno],
+            [AC_CHECK_LIB([lz4], [main],
+              [AC_SUBST([liblz4_LIBS], ["-llz4"])
+               AC_DEFINE([HAVE_LIBLZ4], [1],
+                         [Define if you have liblz4])
+              ],
+              [if test "x$with_lz4" != xcheck; then
+                 AC_MSG_FAILURE(
+                   [--with-lz4 was given (or by default), but test for liblz4 failed])
+               fi
+              ], [])])
+
 PKG_CHECK_MODULES([libuuid], [uuid])
 
 AS_IF([test "x$with_selinux" != "xno"],
diff --git a/fsck/Makefile.am b/fsck/Makefile.am
index 1fc7310..74bc4b8 100644
--- a/fsck/Makefile.am
+++ b/fsck/Makefile.am
@@ -3,12 +3,15 @@
 AM_CPPFLAGS = ${libuuid_CFLAGS} -I$(top_srcdir)/include
 AM_CFLAGS = -Wall
 sbin_PROGRAMS = fsck.f2fs
-noinst_HEADERS = common.h dict.h dqblk_v2.h f2fs.h fsck.h node.h quotaio.h quotaio_tree.h quotaio_v2.h xattr.h
+noinst_HEADERS = common.h dict.h dqblk_v2.h f2fs.h fsck.h node.h quotaio.h \
+		quotaio_tree.h quotaio_v2.h xattr.h compress_wrapper.h
 include_HEADERS = $(top_srcdir)/include/quota.h
 fsck_f2fs_SOURCES = main.c fsck.c dump.c mount.c defrag.c resize.c \
-		node.c segment.c dir.c sload.c xattr.c \
+		node.c segment.c dir.c sload.c xattr.c compress_wrapper.c \
 		dict.c mkquota.c quotaio.c quotaio_tree.c quotaio_v2.c
-fsck_f2fs_LDADD = ${libselinux_LIBS} ${libuuid_LIBS} $(top_builddir)/lib/libf2fs.la
+fsck_f2fs_LDADD = ${libselinux_LIBS} ${libuuid_LIBS} \
+	${liblzo2_LIBS} ${liblz4_LIBS} \
+	$(top_builddir)/lib/libf2fs.la
 
 install-data-hook:
 	ln -sf fsck.f2fs $(DESTDIR)/$(sbindir)/dump.f2fs
-- 
2.29.2.454.gaff20da3a2-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
