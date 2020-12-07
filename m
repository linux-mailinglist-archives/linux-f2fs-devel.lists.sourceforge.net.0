Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF432D0AD3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Dec 2020 07:44:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmAFd-0005Yg-K9; Mon, 07 Dec 2020 06:44:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <robinh3123@gmail.com>) id 1kmAFc-0005YI-Cr
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 06:44:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sqbax5Dbv5yNKE4iF+gv9rom4MxEy1t7FeY7u7rK6r8=; b=WSwvd2cSRI9DqFAFB9nyRiqzrk
 qTDr4z5sE+QeY+MGS9cyVXmHHatES7oldPap0SbSjST4FToXTI/yLZNH6ErFQmitvzkZg1wB5szcX
 GvPahseFTC9nJFp1UZTlGC7x83evZYAwd3KP8zGxKuNue6cNtAY4A/riJUZhmXu0jYeI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sqbax5Dbv5yNKE4iF+gv9rom4MxEy1t7FeY7u7rK6r8=; b=YyDEqzrMa9jxX00PeE0u1n8wcv
 vOENdV9S+iFSQERFhgghcFTN07R6DBOpCZ1rRJ82McBoDPNj4IYIX5aPgwTb55l+26zjJifrFNGvM
 T9cp7CSJSi8zt2jjeILP9xoI6Z8YQ1FVqVbwOM/cLNSjnLAc4hIAhdiHpJLtdSLZTtrs=;
Received: from mail-pf1-f177.google.com ([209.85.210.177])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kmAFY-001cDz-EZ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 06:44:00 +0000
Received: by mail-pf1-f177.google.com with SMTP id f9so8228854pfc.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 06 Dec 2020 22:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sqbax5Dbv5yNKE4iF+gv9rom4MxEy1t7FeY7u7rK6r8=;
 b=cN+6nwPn6B7ucFgkKVAlTbfUqzFRvR/lhJrFajfA1g+nEuikU3wsc+hB3jKhoZ+9cp
 7rvUHj8vBcmVCkne7jaNXkaz9VU0b9vQEjs/kYxoRG0TARu1XhxKJwv6gD0O+1Nmn4D5
 44p0b5GhuDDKbBay4Z+iQe4VqowErcwB2FrzV0KmgBcBHH4iUpBxWTkgUHAV3AWs3BoF
 4oG5V6+vlSOKKtBo4TPQojMBBLZ23kk0M0+KlSyI+hQ0CDtrg17pxB8vHYnszbPw3rx7
 n53o1pn8bbDPUGcHDYonu02d7W0TR0UnyLr1tnIVDDhkmXABS43Ivp5aEgu04aEx7tBk
 l/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sqbax5Dbv5yNKE4iF+gv9rom4MxEy1t7FeY7u7rK6r8=;
 b=knsGKjTVNVhPZSEe6TbSzpQEmMUOS9jUtpB2KPMhNs5Pcj7+Phm+jJdPNUpwYAhsPI
 EBLIdorFln58l+GTlprmyGN0ErlLtwOJUsUoNAPttS4SvTWGnY+XG+gSV88Bt4HCe3KK
 LS/ORfJmk5oGGZb+FOxWUx/seQWlqN03RA+2O8iDotfUeRizvd/iv11aeqX7JHe7SLEK
 Vetmf1n/I01c+qHk0Vmqom0CvWhpFBjbhBq3nLlmfzD+oeB6yLmcZ2nffVaoB54wO3Sq
 kr1gRA9c/6Ueg9gce8A6RDiY7Nir27Usw81WiyuIyJ7ulv0PBgm1YluLTCst/ta5aN4z
 tcHA==
X-Gm-Message-State: AOAM531B6D/Vj2ZnY9saQP6EM9ggSQ3mgne5iHcIpS5QD/WQyxaN4UCM
 yXpqNzzXFKzEdUMC8cDuF4qmq2G6Br0=
X-Google-Smtp-Source: ABdhPJzJwn5CVHyaRWkeYIswJgrj2NG64VIjXmkaMIY9sAP8Vis9NrJmmGMOnl5KBxQ5DfavM9EQCA==
X-Received: by 2002:a17:902:b209:b029:d8:e7a4:bf10 with SMTP id
 t9-20020a170902b209b02900d8e7a4bf10mr14910473plr.77.1607323422577; 
 Sun, 06 Dec 2020 22:43:42 -0800 (PST)
Received: from robinhsu-p520.ntc.corp.google.com
 ([2401:fa00:fc:202:1ea0:b8ff:fe77:fe45])
 by smtp.gmail.com with ESMTPSA id o9sm9079984pjl.11.2020.12.06.22.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 22:43:42 -0800 (PST)
From: Robin Hsu <robinh3123@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org, chao@kernel.org
Date: Mon,  7 Dec 2020 14:42:50 +0800
Message-Id: <20201207064250.272240-4-robinh3123@gmail.com>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
In-Reply-To: <20201207064250.272240-1-robinh3123@gmail.com>
References: <20201207064250.272240-1-robinh3123@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: makefile.am]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (robinh3123[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (robinh3123[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.177 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.177 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kmAFY-001cDz-EZ
Subject: [f2fs-dev] [PATCH v2 3/3] f2fs-tools:sload.f2fs compress: Fixed
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

Test: Build with automake OK on glinux
Bug: 170918502
Signed-off-by: Robin Hsu <robinhsu@google.com>
Change-Id: I25d339e4cab4ca196781da89fc3df3e13f869234
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
2.29.2.576.ga3fc446d84-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
