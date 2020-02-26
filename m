Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8570416F45B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Feb 2020 01:33:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6kdN-0006MX-Up; Wed, 26 Feb 2020 00:33:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chris.ruehl@gtsys.com.hk>) id 1j6kdM-0006MI-Li
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 Feb 2020 00:33:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2EmxknqdJzqtESA6ZSYyMIxOGBcbfdlhtXtOfBl4V/Y=; b=XPZJSmSM4pb5YCA0AR34+hCbyf
 HfGsY7uGrfxK/KLj437venMKFAWQCC5te4UUzzYOScgg+KHL0nPDFk/kIDcOrb3Y5JEM2vpe9TrIH
 NIGlVRXUdKodcP+wt/UAlEuwxu5UT3rTacf5B+NdHpnpPtAuS+xesFxYV2lkirY4MeAA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:
 Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2EmxknqdJzqtESA6ZSYyMIxOGBcbfdlhtXtOfBl4V/Y=; b=j
 iJ2SkrkUdV99aNA/n+KdLrOFkQcSNMYnKi1tcpX8oNXn/EGQq8ZB5DEwI09DyUWH4s9bQWmRH9b3a
 a2xLBQQBT0fFwJC5FTBULMHYR7HR4Vs5AQRrvzhyFZjrdTY34U3xqEat9cs7i/V6y9HMgaXnPqTam
 L7kMtfF3rSp0UyFo=;
Received: from [27.111.83.178] (helo=mail.gtsys.com.hk)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6kdH-006NTU-Pn
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 Feb 2020 00:33:04 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.gtsys.com.hk (Postfix) with ESMTP id 8F3BC20161AF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Feb 2020 08:13:40 +0800 (HKT)
X-Virus-Scanned: Debian amavisd-new at gtsys.com.hk
Received: from mail.gtsys.com.hk ([127.0.0.1])
 by localhost (mail.gtsys.com.hk [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v0m7xfw8uRZr
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Feb 2020 08:13:40 +0800 (HKT)
Received: from s01.gtsys.com.hk (unknown [10.128.4.2])
 by mail.gtsys.com.hk (Postfix) with ESMTP id 6BF8F20160C7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Feb 2020 08:13:40 +0800 (HKT)
Received: from [10.128.2.32] (n058152218242.netvigator.com [58.152.218.242])
 by s01.gtsys.com.hk (Postfix) with ESMTPSA id 41DF5C01A0C
 for <linux-f2fs-devel@lists.sourceforge.net.>;
 Wed, 26 Feb 2020 08:13:40 +0800 (HKT)
To: linux-f2fs-devel@lists.sourceforge.net
From: Chris Ruehl <chris.ruehl@gtsys.com.hk>
Message-ID: <d1f8b052-afaf-1473-0fa6-7b18bd6f6c69@gtsys.com.hk>
Date: Wed, 26 Feb 2020 08:13:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: makefile.am]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1j6kdH-006NTU-Pn
Subject: [f2fs-dev] AArch64 static build link order fix
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

Had a recently a cross compile to arm64 for f2fs-tools and run into
a couple of issues and want to share the resolving.

I running on Debian buster, and using the tool-chain from them
COLLECT_GCC=/usr/bin/aarch64-linux-gnu-gcc
gcc version 8.3.0 (Debian 8.3.0-2)

1) if HAVE_LIBSELINUX is enabled in the config.h
fsck will fail to build missing the libraries
* libsepol
* libpcre
* libpthread
I add this temporally in the Makefile, it must be a fix done in the configure 
process
** add the link path which is missing for cross compilation too.
orig:
libselinux_LIBS = -lselinux
fix:
libselinux_LIBS = -L/usr/lib/aarch64-linux-gnu -lselinux -lsepol -lprce -lpthread

Sadly the selinux static library us dynamic function from the glibc throw a 
warning that the glibc shared library version is needed on runtime! So I removed
the SELINUX support in my static build comment out HAVE_LIBSELINUX.


2) mkfs the link order for blkid & uuid is wrong, leads to unresolved objects
below change fix it.

diff --git a/mkfs/Makefile.am b/mkfs/Makefile.am
index 83e2389..d3206e8 100644
--- a/mkfs/Makefile.am
+++ b/mkfs/Makefile.am
@@ -6,7 +6,8 @@ sbin_PROGRAMS = mkfs.f2fs
  noinst_HEADERS = f2fs_format_utils.h
  include_HEADERS = $(top_srcdir)/include/f2fs_fs.h
  mkfs_f2fs_SOURCES = f2fs_format_main.c f2fs_format.c f2fs_format_utils.c
-mkfs_f2fs_LDADD = ${libuuid_LIBS} ${libblkid_LIBS} $(top_builddir)/lib/libf2fs.la
+mkfs_f2fs_LDADD = ${libblkid_LIBS} ${libuuid_LIBS} $(top_builddir)/lib/libf2fs.la
+mkfs_f2fs_LDFLAGS = -all-static

  lib_LTLIBRARIES = libf2fs_format.la
  libf2fs_format_la_SOURCES = f2fs_format_main.c f2fs_format.c f2fs_format_utils.c


The outcome of my cross compilation works fine.

May someone run in the same problem, and benefit from my fix.

Have a nice one!

Chris

-- 
GTSYS Limited RFID Technology
9/F, Unit E, R07, Kwai Shing Industrial Building Phase 2,
42-46 Tai Lin Pai Road, Kwai Chung, N.T., Hong Kong
Tel (852) 9079 9521

Disclaimer: https://www.gtsys.com.hk/email/classified.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
