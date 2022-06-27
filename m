Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D2855BBBD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Jun 2022 21:38:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o5uYx-0000DT-69; Mon, 27 Jun 2022 19:38:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <vincent@systemli.org>) id 1o5uYv-0000DL-5a
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Jun 2022 19:38:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lrXzUc0M2h0zs56lBsl9mZ2SmXXlRn6yeaG9Kn32Apc=; b=EkxHklJ4vN7zmV2+5YEdOoNJV6
 aHiKBCClCh/l/FWGid4s6GeaXQW1uoPcRhtZDgPTFN6JxaTy3s2aUMRSPqA3rAm8ahfm5Kk/IiDoe
 mrP2oLOuHh4UEWF/db1AvfVc9BA05LMSHbajh0/AYT0754tS5mSBJg6krWnrIAa1ZFxI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lrXzUc0M2h0zs56lBsl9mZ2SmXXlRn6yeaG9Kn32Apc=; b=X
 1Shh7HUlv13PQr235v/g6XIjHo3aAxoQhZwkgZuIpOp6OShKmKUfRAZMhBg5ujxQdnPa9Exrfs1dH
 yB7aC2KnV0ilVo+GMxOmaryMzhKOyjMmC09ooxSZjt9AQ0r6ZmAQXO8Fgx/WNOjMmfYRsn7QnVMiZ
 zLaE5GnOc3W/a8Fs=;
Received: from mail1.systemli.org ([93.190.126.36])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o5uYn-0000GE-TO
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Jun 2022 19:38:19 +0000
From: vincent@systemli.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=systemli.org;
 s=default; t=1656357576;
 bh=lrXzUc0M2h0zs56lBsl9mZ2SmXXlRn6yeaG9Kn32Apc=;
 h=From:To:Cc:Subject:Date:From;
 b=vWH8Qjmx+i/CH9bQhETQB/zVwvih7ZeoLEVbWfEoCRq046pLfTQZTrfBfsXtiY1Ja
 TQEyzwbb3WkFjUMNTuBj80mtyx2H8zAvxosEkXehXJbKQfJixO/LddaP1HxssgylTK
 5Xs/jIAk9mqPgc+WdY3BGhfwleQnNic5+nYQGgpG+JUBq73xFL6HX04tCTnmuZOvO7
 jK9ig4hG4xFaHQ+HHCfT8Enr7x1CcC0Bj8daXZj4631ChY++tfJTRFTCeRVvlULX52
 g8qrLAfL8ZZJ8dfMgWFlDHHiyDC2sIuoevdiDWPVF4cS5QuH1slgVdwPH7+GFwNkiB
 qBBERXaTbblDQ==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 27 Jun 2022 21:19:26 +0200
Message-Id: <20220627191926.161390-1-vincent@systemli.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Nick Hainke <vincent@systemli.org> In the new version
 the configuration no longer respects the --without/--with blkid/selinux
 parameters.
 Add the tests for "with_blkid" and "with_selinux" back to configure.ac as
 described in the manual [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
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
X-Headers-End: 1o5uYn-0000GE-TO
Subject: [f2fs-dev] [PATCH] configure.ac: fix AC_ARG_WITH
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
Cc: Nick Hainke <vincent@systemli.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Nick Hainke <vincent@systemli.org>

In the new version the configuration no longer respects the
--without/--with blkid/selinux parameters. Add the tests for
"with_blkid" and "with_selinux" back to configure.ac as described
in the manual.

Link: https://www.gnu.org/software/autoconf/manual/autoconf-2.60/html_node/External-Software.html

Fixes: 	c48335416a09 ("configure.ac: Enable cross-compilation")

Signed-off-by: Nick Hainke <vincent@systemli.org>
---
 configure.ac | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/configure.ac b/configure.ac
index 91bf7ff..fbde054 100644
--- a/configure.ac
+++ b/configure.ac
@@ -55,11 +55,17 @@ AC_PATH_PROG([LDCONFIG], [ldconfig],
        [$PATH:/sbin])
 
 # Checks for libraries.
-AC_CHECK_LIB([blkid], [blkid_probe_all],
-	[AC_SUBST([libblkid_LIBS], ["-lblkid"])
-		AC_DEFINE([HAVE_LIBBLKID], [1],
-		[Define if you have libblkid])
-	], [], [])
+AS_IF([test "x$with_blkid" != xno],
+	[AC_CHECK_LIB([blkid], [blkid_probe_all],
+		[AC_SUBST([libblkid_LIBS], ["-lblkid"])
+			AC_DEFINE([HAVE_LIBBLKID], [1],
+			[Define if you have libblkid])
+		],
+		[if test "x$with_blkid" != xcheck; then
+			AC_MSG_FAILURE(
+                [--with-blkid was given, but test for blkid failed])
+        fi
+	], -lblkid)])
 
 AC_CHECK_LIB([lzo2], [main],
 	[AC_SUBST([liblzo2_LIBS], ["-llzo2"])
@@ -73,11 +79,17 @@ AC_CHECK_LIB([lz4], [main],
 		[Define if you have liblz4])
 	], [], [])
 
-AC_CHECK_LIB([selinux], [getcon],
-	[AC_SUBST([libselinux_LIBS], ["-lselinux"])
-		AC_DEFINE([HAVE_LIBSELINUX], [1],
-		[Define if you have libselinux])
-	], [], [])
+AS_IF([test "x$with_selinux" != xno],
+	[AC_CHECK_LIB([selinux], [getcon],
+		[AC_SUBST([libselinux_LIBS], ["-lselinux"])
+			AC_DEFINE([HAVE_LIBSELINUX], [1],
+			[Define if you have libselinux])
+		],
+		[if test "x$with_selinux" != xcheck; then
+			AC_MSG_FAILURE(
+				[--with-selinux was given, but test for selinux failed])
+		fi
+	], -lselinux)])
 
 AC_CHECK_LIB([uuid], [uuid_clear],
 	[AC_SUBST([libuuid_LIBS], ["-luuid"])
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
