Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C36321850
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Feb 2021 14:19:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lEB7F-0008Q9-Be; Mon, 22 Feb 2021 13:19:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>) id 1lEB7E-0008Q1-Ji
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Feb 2021 13:19:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6KxLQfL3cs+++N7PfdXHdQcoebtp+h5U/eLWU48xE+Y=; b=D3kpzxJGe6iG7hHb3iwgCoGRz6
 NZmhXDumdaP3ShK5cmHcRDUM1K60IdqZZrGjMRUj6ej0S62+esJQvcBrTwUvLQVwgdowPpsZUPjBT
 Tf2uTYdgeIiwtBQQBhhMvKX/cJf1OQiKLN+bzLccEd+xNPuGpEwFDkucV7PsRlozk6vQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6KxLQfL3cs+++N7PfdXHdQcoebtp+h5U/eLWU48xE+Y=; b=D
 iMfMXvvRfUc4BjQqXbM0pNVEqAySSMAvYlAGFvJO4uFQNxuiswJhVGIgUfYss+pazP848+Gn2J1wj
 J/kci/EsIjbwjpv3WizwCa7B6IOboswppN3eKyNUYLC910XXmXQVBH0yy+3J5qVfK2KUdABWj/q73
 91VSn11zxREML4JU=;
Received: from newton.telenet-ops.be ([195.130.132.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lEB77-00065J-8q
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Feb 2021 13:19:08 +0000
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by newton.telenet-ops.be (Postfix) with ESMTPS id 4Dkj1x5s0xzMqmRY
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 22 Feb 2021 13:59:33 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:254f:253d:debc:790b])
 by albert.telenet-ops.be with bizsmtp
 id YCzP240011v7dkx06CzP0Y; Mon, 22 Feb 2021 13:59:23 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lEAo6-000kYH-My; Mon, 22 Feb 2021 13:59:22 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lEAo6-00HUVX-8I; Mon, 22 Feb 2021 13:59:22 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>
Date: Mon, 22 Feb 2021 13:59:16 +0100
Message-Id: <20210222125916.4168804-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lEB77-00065J-8q
Subject: [f2fs-dev] [PATCH] f2fs: compress: Allow modular (de)compression
 algorithms
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
Cc: linux-kbuild@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If F2FS_FS is modular, enabling the compressions options
F2FS_FS_{LZ4,LZ4HZ,LZO,LZORLE,ZSTD} will make the (de)compression
algorithms {LZ4,LZ4HC,LZO,ZSTD}_{,DE}COMPRESS builtin instead of
modular, as the former depend on an intermediate boolean
F2FS_FS_COMPRESSION, which in-turn depends on tristate F2FS_FS.

Indeed, if a boolean symbol A depends directly on a tristate symbol B
and selects another tristate symbol C:

    tristate B

    tristate C

    bool A
      depends on B
      select C

and B is modular, then C will also be modular.

However, if there is an intermediate boolean D in the dependency chain
between A and B:

    tristate B

    tristate C

    bool D
      depends on B

    bool A
      depends on D
      select C

then the modular state won't propagate from B to C, and C will be
builtin instead of modular.

Fix this by making the various compression options depend directly on
F2FS_FS using a big if/endif block.  Drop the now superfluous
dependencies on F2FS_FS from individual symbols.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Perhaps the propagation logic in Kconfig should be fixed instead?
Else people may reintroduce this issue when removing seemingly-unneeded
dependencies.
---
 fs/f2fs/Kconfig | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index 62e638a49bbf089a..20a82ecb72b42f84 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -20,9 +20,10 @@ config F2FS_FS
 
 	  If unsure, say N.
 
+if F2FS_FS
+
 config F2FS_STAT_FS
 	bool "F2FS Status Information"
-	depends on F2FS_FS
 	default y
 	help
 	  /sys/kernel/debug/f2fs/ contains information about all the partitions
@@ -35,7 +36,6 @@ config F2FS_STAT_FS
 
 config F2FS_FS_XATTR
 	bool "F2FS extended attributes"
-	depends on F2FS_FS
 	default y
 	help
 	  Extended attributes are name:value pairs associated with inodes by
@@ -70,7 +70,6 @@ config F2FS_FS_SECURITY
 
 config F2FS_CHECK_FS
 	bool "F2FS consistency checking feature"
-	depends on F2FS_FS
 	help
 	  Enables BUG_ONs which check the filesystem consistency in runtime.
 
@@ -78,7 +77,6 @@ config F2FS_CHECK_FS
 
 config F2FS_FAULT_INJECTION
 	bool "F2FS fault injection facility"
-	depends on F2FS_FS
 	help
 	  Test F2FS to inject faults such as ENOMEM, ENOSPC, and so on.
 
@@ -86,7 +84,6 @@ config F2FS_FAULT_INJECTION
 
 config F2FS_FS_COMPRESSION
 	bool "F2FS compression feature"
-	depends on F2FS_FS
 	help
 	  Enable filesystem-level compression on f2fs regular files,
 	  multiple back-end compression algorithms are supported.
@@ -137,3 +134,5 @@ config F2FS_FS_LZORLE
 	default y
 	help
 	  Support LZO-RLE compress algorithm, if unsure, say Y.
+
+endif
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
