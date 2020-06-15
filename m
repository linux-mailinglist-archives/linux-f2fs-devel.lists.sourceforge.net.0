Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F581F9F15
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2020 20:09:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jktXZ-0005PS-8b; Mon, 15 Jun 2020 18:09:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jktXX-0005Ot-5V
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 18:08:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gVNI199G5hrquEd83s2EcptIBieKGvRHwMrq3oorLJM=; b=WjCua0HcuRPlgJwf4S9dy/ycuQ
 Lx7hxnmjQM3MGDkypg0n0Ji3bucyAeOnkbzcs1vvQZxMmOH6Ihg7zWf5vWif26dMWCIDl6YOyiDmk
 YL5jpdNHPmLF7U96FjdCwb6H3NDyLaSNRxoHKLNBbtXHZrxmLUksDpk/r3Ub7Qy64CJw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gVNI199G5hrquEd83s2EcptIBieKGvRHwMrq3oorLJM=; b=VbOnnCvcjbFZD944h0i638ot+O
 dVQTXOMMyi9H8Nau9aX5L3i9deqSBmNSCbbg0UJ3jUYdQBuqnByoBS0R8jiT/JNOICrGayEIJ6NaC
 9c25wypUAjPAWFscrHaS66lITp4JR53OdjMnt6Tj4OnzWLeVP4BhrfsvLm3nzL1LCXak=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jktXO-003sEL-T7
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 18:08:59 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 707F720882;
 Mon, 15 Jun 2020 18:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592244525;
 bh=XbHLHZnGDzLCDQKwtoq20raDr35wGqv7DaYWtyjy/O4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J6Md72eC/DdFTod/LXtBNxpcgsNBHa5bPukffnVgqQdAU05226c+g7hWHkm58gF5R
 lUj0yCTQqAO1WASs8qdshAazr5hw1axNHaOxDRIJJ9ursdW1xXQRiQ8DF7FxaMFmaP
 baKIyJ09Qf9IVjCvQVWKg15s9FXF1vJ1ynGVVzzc=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 15 Jun 2020 11:08:42 -0700
Message-Id: <20200615180843.153299-3-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
In-Reply-To: <20200615180843.153299-1-jaegeuk@kernel.org>
References: <20200615180843.153299-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jktXO-003sEL-T7
Subject: [f2fs-dev] [PATCH 3/4] lib: use ${libuuid_LIBS} instead of -luuid
 everywhere
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Rolf Eike Beer <eb@emlix.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Rolf Eike Beer <eb@emlix.com>

Otherwise linking will fail if the library is in an uncommon location or has a
non-standard name.

Signed-off-by: Rolf Eike Beer <eb@emlix.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 mkfs/Makefile.am  | 2 +-
 tools/Makefile.am | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/mkfs/Makefile.am b/mkfs/Makefile.am
index 83e2389..42c8d31 100644
--- a/mkfs/Makefile.am
+++ b/mkfs/Makefile.am
@@ -12,7 +12,7 @@ lib_LTLIBRARIES = libf2fs_format.la
 libf2fs_format_la_SOURCES = f2fs_format_main.c f2fs_format.c f2fs_format_utils.c
 libf2fs_format_la_CFLAGS = -DWITH_BLKDISCARD
 libf2fs_format_la_CPPFLAGS = -I$(top_srcdir)/include
-libf2fs_format_la_LDFLAGS = ${libblkid_LIBS} -luuid -L$(top_builddir)/lib -lf2fs \
+libf2fs_format_la_LDFLAGS = ${libblkid_LIBS} ${libuuid_LIBS} -L$(top_builddir)/lib -lf2fs \
 	-version-info $(FMT_CURRENT):$(FMT_REVISION):$(FMT_AGE)
 
 install-exec-hook:
diff --git a/tools/Makefile.am b/tools/Makefile.am
index 446bb39..56bf2e4 100644
--- a/tools/Makefile.am
+++ b/tools/Makefile.am
@@ -10,7 +10,7 @@ parse_f2fs_SOURCES = f2fs_io_parse.c
 if LINUX
 sbin_PROGRAMS += f2fscrypt
 f2fscrypt_SOURCES = f2fscrypt.c sha512.c
-f2fscrypt_LDFLAGS = -luuid
+f2fscrypt_LDFLAGS = ${libuuid_LIBS}
 dist_man_MANS = f2fscrypt.8
 endif
 
-- 
2.27.0.290.gba653c62da-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
