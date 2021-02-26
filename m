Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ED63264F7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Feb 2021 16:52:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lFfPO-0002p9-O4; Fri, 26 Feb 2021 15:52:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>) id 1lFfPN-0002ot-Kk
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Feb 2021 15:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b6QpkCxawrBAh+PZh0BWmzHBFlE3jyDvjO4PZJst3eY=; b=jjfmkiUGvQ2WGO3cCNBwQbS3nL
 NbxJvksp0jjfK2LVAXXoBq9Tu3WdYKzyEunVnQjwIkTCORy6uJEblsc6Y+WD12myWhW2hgFHGkCkp
 dbu9oA4BKunFpukBQgM7PwuL+csYKKpIBpWhC64ZuX1lKSsjT4dlp+4kMzM1N6RfPyh4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=b6QpkCxawrBAh+PZh0BWmzHBFlE3jyDvjO4PZJst3eY=; b=K
 l/5hrdCPwwEgoLDhUkJ2wQoRLZP/FW7TnoyZh8sOBmBo0b/j6+qx1oyhAoTbbmTKnz1z4SjyY72ha
 Dv85XPKi+MWgLyvBwBo/tAk6+zaSAnng2vFEWytKEXqFFIP7ySt9R34IJNDVx6G3Zi8kltZ20Qu/R
 hT2WSGJaaE+KHNF4=;
Received: from andre.telenet-ops.be ([195.130.132.53])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lFfPE-006SEu-KR
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Feb 2021 15:52:01 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:15af:edeb:8b51:79e0])
 by andre.telenet-ops.be with bizsmtp
 id Zrrj2400Q16s2Gb01rrj26; Fri, 26 Feb 2021 16:51:44 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lFfP5-0025aW-8K; Fri, 26 Feb 2021 16:51:43 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lFfP4-00CCuu-SQ; Fri, 26 Feb 2021 16:51:42 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>
Date: Fri, 26 Feb 2021 16:51:42 +0100
Message-Id: <20210226155142.2909545-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux-m68k.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.130.132.53 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lFfPE-006SEu-KR
Subject: [f2fs-dev] [PATCH v3] f2fs: compress: Allow modular (de)compression
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

As modular dependency propagation through intermediate symbols is
obscure, fix this in a robust way by moving the selection of tristate
(de)compression algorithms from the boolean compression options to the
tristate main F2FS_FS option.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v3:
  - Drop redundant selects (F2FS_FS_LZORLE depends on F2FS_FS_LZO),

v2:
  - Move the selects to F2FS_FS instead of adding direct dependencies
    on F2FS_FS.
---
 fs/f2fs/Kconfig | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index 62e638a49bbf089a..7669de7b49cea189 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -7,6 +7,13 @@ config F2FS_FS
 	select CRYPTO_CRC32
 	select F2FS_FS_XATTR if FS_ENCRYPTION
 	select FS_ENCRYPTION_ALGS if FS_ENCRYPTION
+	select LZ4_COMPRESS if F2FS_FS_LZ4
+	select LZ4_DECOMPRESS if F2FS_FS_LZ4
+	select LZ4HC_COMPRESS if F2FS_FS_LZ4HC
+	select LZO_COMPRESS if F2FS_FS_LZO
+	select LZO_DECOMPRESS if F2FS_FS_LZO
+	select ZSTD_COMPRESS if F2FS_FS_ZSTD
+	select ZSTD_DECOMPRESS if F2FS_FS_ZSTD
 	help
 	  F2FS is based on Log-structured File System (LFS), which supports
 	  versatile "flash-friendly" features. The design has been focused on
@@ -94,8 +101,6 @@ config F2FS_FS_COMPRESSION
 config F2FS_FS_LZO
 	bool "LZO compression support"
 	depends on F2FS_FS_COMPRESSION
-	select LZO_COMPRESS
-	select LZO_DECOMPRESS
 	default y
 	help
 	  Support LZO compress algorithm, if unsure, say Y.
@@ -103,8 +108,6 @@ config F2FS_FS_LZO
 config F2FS_FS_LZ4
 	bool "LZ4 compression support"
 	depends on F2FS_FS_COMPRESSION
-	select LZ4_COMPRESS
-	select LZ4_DECOMPRESS
 	default y
 	help
 	  Support LZ4 compress algorithm, if unsure, say Y.
@@ -113,7 +116,6 @@ config F2FS_FS_LZ4HC
 	bool "LZ4HC compression support"
 	depends on F2FS_FS_COMPRESSION
 	depends on F2FS_FS_LZ4
-	select LZ4HC_COMPRESS
 	default y
 	help
 	  Support LZ4HC compress algorithm, LZ4HC has compatible on-disk
@@ -122,8 +124,6 @@ config F2FS_FS_LZ4HC
 config F2FS_FS_ZSTD
 	bool "ZSTD compression support"
 	depends on F2FS_FS_COMPRESSION
-	select ZSTD_COMPRESS
-	select ZSTD_DECOMPRESS
 	default y
 	help
 	  Support ZSTD compress algorithm, if unsure, say Y.
@@ -132,8 +132,6 @@ config F2FS_FS_LZORLE
 	bool "LZO-RLE compression support"
 	depends on F2FS_FS_COMPRESSION
 	depends on F2FS_FS_LZO
-	select LZO_COMPRESS
-	select LZO_DECOMPRESS
 	default y
 	help
 	  Support LZO-RLE compress algorithm, if unsure, say Y.
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
