Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A66BACC892
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Jun 2025 15:59:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zXXtgbN7GDDJrPXSm2QdlYh19gZjBGR20IoxuSycLjI=; b=aEN08rQ34v9bd2zrj3tCqkpTyN
	ksa4l5tq0eX/U4j61fD0+qIJw9CiTaM4oRC+NCxK8akfc1H90TCRnm719Zk5QLublFmexLS7xcRFy
	k5HFkr7GQeg4v7OL+a8Hb6iRaeYW8NGwj81Le6gLPTqX8wdouVL+gVKt8wKiCt35TjNI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uMSAj-0005BU-T6;
	Tue, 03 Jun 2025 13:59:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <orbea@riseup.net>) id 1uMSAi-0005BO-NX
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jun 2025 13:59:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y4PVtOA4xaFcpNVXZkIbXk7tmbMGLt7I0dTTj+zf57o=; b=V5Wln0TAsjwIeHPyFDZ/hFE97p
 FNPLSbYQbCbvjctg1mxwuJ/muFsxnV3ycrlByZs8A35uu6zAOXiOy5cLfC53f7mb+ncDaEDLgnJFv
 7QC37jl4tojeA+yLe2lH9ZTSCaPhA1n7yak2vvuKCzzshiSrt8Azqb16+qbAyGxJ55Ls=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Y4PVtOA4xaFcpNVXZkIbXk7tmbMGLt7I0dTTj+zf57o=; b=e
 wHamWkc7WnzuMYzJlLmpdw2L7FYgyfMZBr8BczOBDsocoObRGLZysxhsYRVq3IeIiEQscxozJa2zZ
 APU+Ki/cgMJQl9wWCXXmrKtVjpFvn4pOdy/hSteuZUf6YsiWhKR98O5yowfV7LvxT+iM7EyuwR6o3
 owvIgCzMAbiAx6AI=;
Received: from mx1.riseup.net ([198.252.153.129])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uMSAh-0003wa-R6 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jun 2025 13:59:20 +0000
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4bBXPn2DD8zDrgT
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  3 Jun 2025 13:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1748959149; bh=Z2sz3s9tFeDt27iSxKo/PNSYCNXTc4b5K/xYuoBzrjI=;
 h=From:To:Cc:Subject:Date:From;
 b=cxofmy4YcDZG2fTDnZrGEOXmmrX94aZHgvMAePM0NkM8Iryr2rJimA7SPcG37/gYF
 i+kUoNvgclxUpbtaPRmRmUzNmD9Fh2+hn8amxfj0sIOQ/8BoCxfK8xme5/6Q8TR7AT
 c6U3WEMzK397dT+xB4V8rS8qtjU1Ivax8sO7ms9Q=
X-Riseup-User-ID: B4D925D47FEC40C6BEB794EBEDDEFF29239C27B4C9E97E93C2F3B3088EA0A8A1
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4bBXPm6dKjzJrcQ;
 Tue,  3 Jun 2025 13:59:08 +0000 (UTC)
From: orbea@riseup.net
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  3 Jun 2025 06:59:05 -0700
Message-ID: <20250603135905.13959-1-orbea@riseup.net>
MIME-Version: 1.0
X-Headers-End: 1uMSAh-0003wa-R6
Subject: [f2fs-dev] [PATCH 1/1] mkfs: link using libf2fs.la
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
Cc: orbea <orbea@riseup.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: orbea <orbea@riseup.net>

With slibtool the build will fail with 'cannot find -lf2fs'.

To fix this it is better to use the canonical method of linking internal
dependencies which is to use the generated .la files where the libtool
implementation will know what to do with it.

Gentoo-Issue: https://bugs.gentoo.org/929070
Signed-off-by: orbea <orbea@riseup.net>
---
 mkfs/Makefile.am | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mkfs/Makefile.am b/mkfs/Makefile.am
index bfffd88..9273eb6 100644
--- a/mkfs/Makefile.am
+++ b/mkfs/Makefile.am
@@ -11,8 +11,8 @@ mkfs_f2fs_LDADD = ${libuuid_LIBS} ${libblkid_LIBS} $(top_builddir)/lib/libf2fs.l
 lib_LTLIBRARIES = libf2fs_format.la
 libf2fs_format_la_SOURCES = f2fs_format_main.c f2fs_format.c f2fs_format_utils.c
 libf2fs_format_la_CFLAGS = -DWITH_BLKDISCARD -D_FILE_OFFSET_BITS=64
-libf2fs_format_la_LDFLAGS = ${libblkid_LIBS} ${libuuid_LIBS} -L$(top_builddir)/lib -lf2fs \
-	-version-info $(FMT_CURRENT):$(FMT_REVISION):$(FMT_AGE)
+libf2fs_format_la_LIBADD = ${libblkid_LIBS} ${libuuid_LIBS} $(top_builddir)/lib/libf2fs.la
+libf2fs_format_la_LDFLAGS = -version-info $(FMT_CURRENT):$(FMT_REVISION):$(FMT_AGE)
 
 install-exec-hook:
 	if test -n "$(root_libdir)" -a "$(libdir)" != "$(root_libdir)" -a \
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
