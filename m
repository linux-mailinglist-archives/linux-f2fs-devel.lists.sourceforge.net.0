Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E01B11735E6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Feb 2020 12:15:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j7dc6-0002g6-7I; Fri, 28 Feb 2020 11:15:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j7dc3-0002fx-Ry
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Feb 2020 11:15:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dRSf9j6fARkZrCm8+BgqYipE696qXhJEfX27TioH4pI=; b=K5aK+QQIDhGu//cMX1fVDpkQAN
 mhrYy+/FXuHDz3BIvuSxNMFWNABkgMgD7HQ4K55DU49SM17VXM/WqLJumRMwyGXWnvQVJblZEeKCC
 iafscesRowRFksMxQAVLiwVWZjeNPJ3FaMEdo7nnn5wrJGdOrXMnrED7Z26fDqgTF+HI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dRSf9j6fARkZrCm8+BgqYipE696qXhJEfX27TioH4pI=; b=U
 faEXfX1VDUJlWj9pKLmFDrhwVOblZ4XXjiCE1fUNb5MeB0adroVzWss6U52MZFkbkw1liFRzsiCT/
 Xy/geLi0TYb9PwvEvLDP2Gzrp4gKGHNm6TRW0dsmzwhAM+ESU9PR8SkT4pG/hlNVmfA5Xg1hq5W3c
 C5Hjp+wPi9RDLcGY=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j7dbz-00BxAp-65
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Feb 2020 11:15:23 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E76B9384A98F9223624F;
 Fri, 28 Feb 2020 19:15:08 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.439.0; Fri, 28 Feb 2020 19:14:58 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 28 Feb 2020 19:14:56 +0800
Message-ID: <20200228111456.11311-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j7dbz-00BxAp-65
Subject: [f2fs-dev] [PATCH] f2fs: compress: support zstd compress algorithm
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add zstd compress algorithm support, use "compress_algorithm=zstd"
mountoption to enable it.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 Documentation/filesystems/f2fs.txt |   4 +-
 fs/f2fs/Kconfig                    |   9 ++
 fs/f2fs/compress.c                 | 151 +++++++++++++++++++++++++++++
 fs/f2fs/f2fs.h                     |   2 +
 fs/f2fs/super.c                    |   7 ++
 include/trace/events/f2fs.h        |   3 +-
 6 files changed, 173 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/f2fs.txt b/Documentation/filesystems/f2fs.txt
index 4eb3e2ddd00e..b1a66cf0e967 100644
--- a/Documentation/filesystems/f2fs.txt
+++ b/Documentation/filesystems/f2fs.txt
@@ -235,8 +235,8 @@ checkpoint=%s[:%u[%]]     Set to "disable" to turn off checkpointing. Set to "en
                        hide up to all remaining free space. The actual space that
                        would be unusable can be viewed at /sys/fs/f2fs/<disk>/unusable
                        This space is reclaimed once checkpoint=enable.
-compress_algorithm=%s  Control compress algorithm, currently f2fs supports "lzo"
-                       and "lz4" algorithm.
+compress_algorithm=%s  Control compress algorithm, currently f2fs supports "lzo",
+                       "lz4" and "zstd" algorithm.
 compress_log_size=%u   Support configuring compress cluster size, the size will
                        be 4KB * (1 << %u), 16KB is minimum size, also it's
                        default size.
diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index f0faada30f30..bb68d21e1f8c 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -118,3 +118,12 @@ config F2FS_FS_LZ4
 	default y
 	help
 	  Support LZ4 compress algorithm, if unsure, say Y.
+
+config F2FS_FS_ZSTD
+	bool "ZSTD compression support"
+	depends on F2FS_FS_COMPRESSION
+	select ZSTD_COMPRESS
+	select ZSTD_DECOMPRESS
+	default y
+	help
+	  Support ZSTD compress algorithm, if unsure, say Y.
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index bd3ea01db448..c8e1175eaf4e 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -11,6 +11,7 @@
 #include <linux/backing-dev.h>
 #include <linux/lzo.h>
 #include <linux/lz4.h>
+#include <linux/zstd.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -291,6 +292,151 @@ static const struct f2fs_compress_ops f2fs_lz4_ops = {
 };
 #endif
 
+#ifdef CONFIG_F2FS_FS_ZSTD
+#define F2FS_ZSTD_DEFAULT_CLEVEL	1
+
+static int zstd_init_compress_ctx(struct compress_ctx *cc)
+{
+	return 0;
+}
+
+static void zstd_destroy_compress_ctx(struct compress_ctx *cc)
+{
+}
+
+static int zstd_compress_pages(struct compress_ctx *cc)
+{
+	ZSTD_parameters params;
+	ZSTD_CStream *stream;
+	ZSTD_inBuffer inbuf;
+	ZSTD_outBuffer outbuf;
+	void *workspace;
+	unsigned int workspace_size;
+	int src_size = cc->rlen;
+	int dst_size = src_size - PAGE_SIZE - COMPRESS_HEADER_SIZE;
+	int ret;
+
+	params = ZSTD_getParams(F2FS_ZSTD_DEFAULT_CLEVEL, src_size, 0);
+	workspace_size = ZSTD_CStreamWorkspaceBound(params.cParams);
+
+	workspace = f2fs_kvmalloc(F2FS_I_SB(cc->inode),
+					workspace_size, GFP_NOFS);
+	if (!workspace)
+		return -ENOMEM;
+
+	stream = ZSTD_initCStream(params, 0,
+					workspace, workspace_size);
+	if (!stream) {
+		printk_ratelimited("%sF2FS-fs (%s): %s ZSTD_initCStream failed\n",
+				KERN_ERR, F2FS_I_SB(cc->inode)->sb->s_id,
+				__func__);
+		ret = -EIO;
+		goto free_workspace;
+	}
+
+	inbuf.pos = 0;
+	inbuf.src = cc->rbuf;
+	inbuf.size = src_size;
+
+	outbuf.pos = 0;
+	outbuf.dst = cc->cbuf->cdata;
+	outbuf.size = dst_size;
+
+	ret = ZSTD_compressStream(stream, &outbuf, &inbuf);
+	if (ZSTD_isError(ret)) {
+		printk_ratelimited("%sF2FS-fs (%s): %s ZSTD_compressStream failed, ret: %d\n",
+				KERN_ERR, F2FS_I_SB(cc->inode)->sb->s_id,
+				__func__, ZSTD_getErrorCode(ret));
+		ret = -EIO;
+		goto free_workspace;
+	}
+
+	ret = ZSTD_endStream(stream, &outbuf);
+	if (ZSTD_isError(ret)) {
+		printk_ratelimited("%sF2FS-fs (%s): %s ZSTD_endStream returned %d\n",
+				KERN_ERR, F2FS_I_SB(cc->inode)->sb->s_id,
+				__func__, ZSTD_getErrorCode(ret));
+		ret = -EIO;
+		goto free_workspace;
+	}
+
+	cc->clen = outbuf.pos;
+
+	ret = 0;
+free_workspace:
+	kvfree(workspace);
+	return ret;
+}
+
+static int zstd_decompress_pages(struct decompress_io_ctx *dic)
+{
+	ZSTD_parameters params;
+	ZSTD_DStream *stream;
+	ZSTD_inBuffer inbuf;
+	ZSTD_outBuffer outbuf;
+	void *workspace;
+	unsigned int workspace_size;
+	int ret;
+
+	params = ZSTD_getParams(F2FS_ZSTD_DEFAULT_CLEVEL, dic->clen, 0);
+	workspace_size = ZSTD_DStreamWorkspaceBound(MAX_COMPRESS_WINDOW_SIZE);
+
+	workspace = f2fs_kvmalloc(F2FS_I_SB(dic->inode),
+					workspace_size, GFP_NOFS);
+	if (!workspace)
+		return -ENOMEM;
+
+	stream = ZSTD_initDStream(MAX_COMPRESS_WINDOW_SIZE,
+					workspace, workspace_size);
+	if (!stream) {
+		printk_ratelimited("%sF2FS-fs (%s): %s ZSTD_initDStream failed\n",
+				KERN_ERR, F2FS_I_SB(dic->inode)->sb->s_id,
+				__func__);
+		ret = -EIO;
+		goto free_workspace;
+	}
+
+	inbuf.pos = 0;
+	inbuf.src = dic->cbuf->cdata;
+	inbuf.size = dic->clen;
+
+	outbuf.pos = 0;
+	outbuf.dst = dic->rbuf;
+	outbuf.size = dic->rlen;
+
+	ret = ZSTD_decompressStream(stream, &outbuf, &inbuf);
+	if (ZSTD_isError(ret)) {
+		printk_ratelimited("%sF2FS-fs (%s): %s ZSTD_compressStream failed, ret: %d\n",
+				KERN_ERR, F2FS_I_SB(dic->inode)->sb->s_id,
+				__func__, ZSTD_getErrorCode(ret));
+		ret = -EIO;
+		goto free_workspace;
+	}
+
+	if (dic->rlen != outbuf.pos) {
+		printk_ratelimited("%sF2FS-fs (%s): %s ZSTD invalid rlen:%zu, "
+				"expected:%lu\n", KERN_ERR,
+				F2FS_I_SB(dic->inode)->sb->s_id,
+				__func__, dic->rlen,
+				PAGE_SIZE << dic->log_cluster_size);
+		ret = -EIO;
+		goto free_workspace;
+	}
+
+	ret = 0;
+free_workspace:
+	kvfree(workspace);
+	return ret;
+}
+
+static const struct f2fs_compress_ops f2fs_zstd_ops = {
+	.init_compress_ctx	= zstd_init_compress_ctx,
+	.destroy_compress_ctx	= zstd_destroy_compress_ctx,
+	.compress_pages		= zstd_compress_pages,
+	.decompress_pages	= zstd_decompress_pages,
+};
+#endif
+
 static const struct f2fs_compress_ops *f2fs_cops[COMPRESS_MAX] = {
 #ifdef CONFIG_F2FS_FS_LZO
 	&f2fs_lzo_ops,
@@ -302,6 +448,11 @@ static const struct f2fs_compress_ops *f2fs_cops[COMPRESS_MAX] = {
 #else
 	NULL,
 #endif
+#ifdef CONFIG_F2FS_FS_ZSTD
+	&f2fs_zstd_ops,
+#else
+	NULL,
+#endif
 };
 
 bool f2fs_is_compress_backend_ready(struct inode *inode)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5ca9efaf2ddc..f4bcbbd5e9ed 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1231,6 +1231,7 @@ enum fsync_mode {
 enum compress_algorithm_type {
 	COMPRESS_LZO,
 	COMPRESS_LZ4,
+	COMPRESS_ZSTD,
 	COMPRESS_MAX,
 };
 
@@ -1294,6 +1295,7 @@ struct decompress_io_ctx {
 #define NULL_CLUSTER			((unsigned int)(~0))
 #define MIN_COMPRESS_LOG_SIZE		2
 #define MAX_COMPRESS_LOG_SIZE		8
+#define MAX_COMPRESS_WINDOW_SIZE	((PAGE_SIZE) << MAX_COMPRESS_LOG_SIZE)
 
 struct f2fs_sb_info {
 	struct super_block *sb;			/* pointer to VFS super block */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9f435191f1e5..db3a63f7c769 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -829,6 +829,10 @@ static int parse_options(struct super_block *sb, char *options)
 					!strcmp(name, "lz4")) {
 				F2FS_OPTION(sbi).compress_algorithm =
 								COMPRESS_LZ4;
+			} else if (strlen(name) == 4 &&
+					!strcmp(name, "zstd")) {
+				F2FS_OPTION(sbi).compress_algorithm =
+								COMPRESS_ZSTD;
 			} else {
 				kfree(name);
 				return -EINVAL;
@@ -1419,6 +1423,9 @@ static inline void f2fs_show_compress_options(struct seq_file *seq,
 	case COMPRESS_LZ4:
 		algtype = "lz4";
 		break;
+	case COMPRESS_ZSTD:
+		algtype = "zstd";
+		break;
 	}
 	seq_printf(seq, ",compress_algorithm=%s", algtype);
 
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 67a97838c2a0..d97adfc327f0 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -153,7 +153,8 @@ TRACE_DEFINE_ENUM(CP_PAUSE);
 #define show_compress_algorithm(type)					\
 	__print_symbolic(type,						\
 		{ COMPRESS_LZO,		"LZO" },			\
-		{ COMPRESS_LZ4,		"LZ4" })
+		{ COMPRESS_LZ4,		"LZ4" },			\
+		{ COMPRESS_ZSTD,	"ZSTD" })
 
 struct f2fs_sb_info;
 struct f2fs_io_info;
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
