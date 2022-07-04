Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E3B5650C5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Jul 2022 11:29:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o8IOq-0007bu-Sr; Mon, 04 Jul 2022 09:29:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <vincent@systemli.org>) id 1o8IOp-0007bo-6s
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 04 Jul 2022 09:29:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8UMYy7urMqNmk8J5bJrF50E9mCx9h66rfBC8g8FzNr8=; b=SkwkDuaEcOpT8a9qxVzuxj4w1i
 x7/A76quNYKnPmppijULoQtuHkwicaYiyqMfPqc2+o8X6eQGt4hgJT31C4yv0DKmjoZG5ZQpSUQdq
 auzwIXWa46U1Gb0eh5/1hWpYqcodwjAPctUlDYZMBtPMPT9EJas9lWwpYdpO+x25q5tI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8UMYy7urMqNmk8J5bJrF50E9mCx9h66rfBC8g8FzNr8=; b=J
 v6Zu68brrwtoUDU6tZmlY6mv3B7lwKApOlS0RUGtd5/rlP2D3p9vqOgMlshXX9puBBW+3ZaE/7u21
 Xfg5uB5BPKVH+1dGCka7DHDV0aXMBpyiqOQ054qu0kB6o0kFFknibqzwa2N3dJqRevl/1vuj+Oqon
 YwzcvwJFVDZ4QUCs=;
Received: from [93.190.126.36] (helo=mail1.systemli.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o8IOj-0001XJ-9V
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 04 Jul 2022 09:29:47 +0000
From: vincent@systemli.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=systemli.org;
 s=default; t=1656926964;
 bh=8UMYy7urMqNmk8J5bJrF50E9mCx9h66rfBC8g8FzNr8=;
 h=From:To:Cc:Subject:Date:From;
 b=1YoxuvbBGL6GTMQ7o7StvP++VF5t0bqiGlFQiq35QKXOEs5Ada6Xarm7yKYfKKO4w
 MgGDQ3tlWWr+VMjKXUF4d/IahzZHL4vtVgPWZzaYCHLlROa741WppWTiVXn+AmfIaW
 avV+NNrGRsNDKQRCs955x9bWJ4By2wZKqrwZJuM85sW8G6pumhPqOMup81mC8/pRRs
 v/J8BVNpc2BHNxnd3zZtunJT/fEnd8MePx/uJ2I+U0bps4arkRJajdVJw4wTCW3TWG
 jjfKjZSpznJWc+s32W76JDPJqr+IctPBzvhL0mC8Y0ZrrqeNVMEUlJFtrzIsjNHTeU
 qVArL99DHmw8w==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  4 Jul 2022 11:29:19 +0200
Message-Id: <20220704092919.1420469-1-vincent@systemli.org>
MIME-Version: 1.0
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Nick Hainke <vincent@systemli.org> AC_CHECK_LIB seems
 to not work correctly with OpenWrt. Add possibility to disable lz4 and lzo2
 manually. Fixes errors in the form of: Package f2fsck is missing dependencies
 for the following libraries: liblz4.so.1 liblzo2.so.2 
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1o8IOj-0001XJ-9V
Subject: [f2fs-dev] [PATCH] configure.ac: fix cross compilation
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

From: Nick Hainke <vincent@systemli.org>

AC_CHECK_LIB seems to not work correctly with OpenWrt. Add possibility
to disable lz4 and lzo2 manually.

Fixes errors in the form of:
  Package f2fsck is missing dependencies for the following libraries:
  liblz4.so.1
  liblzo2.so.2

Signed-off-by: Nick Hainke <vincent@systemli.org>
---
 configure.ac | 44 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/configure.ac b/configure.ac
index ea39461..dbe9ad3 100644
--- a/configure.ac
+++ b/configure.ac
@@ -50,6 +50,18 @@ AC_ARG_WITH([blkid],
 	[],
 	[with_blkid=check])
 
+AC_ARG_WITH([lzo2],
+	[AS_HELP_STRING([--without-lzo2],
+	  [Ignore presence of liblzo2 and disable lzo2 support])],
+	[],
+	[with_lzo2=check])
+
+AC_ARG_WITH([lz4],
+	[AS_HELP_STRING([--without-lz4],
+	  [Ignore presence of liblz4 and disable lz4 support])],
+	[],
+	[with_lz4=check])
+
 # Checks for programs.
 AC_PROG_CC
 AM_PROG_AR
@@ -71,17 +83,29 @@ AS_IF([test "x$with_blkid" != xno],
         fi
 	], -lblkid)])
 
-AC_CHECK_LIB([lzo2], [main],
-	[AC_SUBST([liblzo2_LIBS], ["-llzo2"])
-		AC_DEFINE([HAVE_LIBLZO2], [1],
-		[Define if you have liblzo2])
-	], [], [])
+AS_IF([test "x$with_lzo2" != xno],
+	[AC_CHECK_LIB([lzo2], [main],
+		[AC_SUBST([liblzo2_LIBS], ["-llzo2"])
+			AC_DEFINE([HAVE_LIBLZO2], [1],
+			[Define if you have liblzo2])
+		],
+		[if test "x$with_lzo2" != xcheck; then
+			AC_MSG_FAILURE(
+                [--with-lzo2 was given, but test for lzo2 failed])
+        fi
+	], -llzo2)])
 
-AC_CHECK_LIB([lz4], [main],
-	[AC_SUBST([liblz4_LIBS], ["-llz4"])
-		AC_DEFINE([HAVE_LIBLZ4], [1],
-		[Define if you have liblz4])
-	], [], [])
+AS_IF([test "x$with_lz4" != xno],
+	[AC_CHECK_LIB([lz4], [main],
+		[AC_SUBST([liblz4_LIBS], ["-llz4"])
+			AC_DEFINE([HAVE_LIBLZ4], [1],
+			[Define if you have liblz4])
+		],
+		[if test "x$with_lz4" != xcheck; then
+			AC_MSG_FAILURE(
+                [--with-lz4 was given, but test for lz4 failed])
+        fi
+	], -llz4)])
 
 AS_IF([test "x$with_selinux" != xno],
 	[AC_CHECK_LIB([selinux], [getcon],
-- 
2.37.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
