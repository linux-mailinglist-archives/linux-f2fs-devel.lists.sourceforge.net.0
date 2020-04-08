Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 030E21A2077
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Apr 2020 13:56:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jM9KA-0003X2-Qj; Wed, 08 Apr 2020 11:56:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jM9KA-0003Wv-4e
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Apr 2020 11:56:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kggf/5IbJZ3U7faVADMtGO1Jwo0nedQKpy9jes9S7RM=; b=EMcNrlMu1NgJ/dSgvaO7o40H7Y
 2EYSrosxpSp5B9XOhQaNJ208+HfARQRTWecxglW6aAmhvR/+peOJNnnkxPtK9oEYZybd5HAYRzKCg
 9q1Qc+/1zDYHFB47qJc3x0KDcMRerS2Ki4ZGroNf2ld/nibZHpAsBS3zLtv060hsLa6E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kggf/5IbJZ3U7faVADMtGO1Jwo0nedQKpy9jes9S7RM=; b=m
 VkWyg/7APu3ToH2mf3JQmSeemb6N3YwTVC+wfLOTcOVzAG7wpoU2+CO5+s/4SytmtoVjiUyZhQT/7
 AXdEJ+rN8G1jOdzqs0VM8gqT4psj8mEBjb/4PQLx2TTAZ7X8TPa/M3cAG7PcPHF/qysYsDJT4cz0g
 D4gvL+flwpcgQnnc=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jM9K6-0082Ox-AH
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Apr 2020 11:56:54 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D9C8B1FD422C2A0619FE;
 Wed,  8 Apr 2020 19:56:40 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Wed, 8 Apr 2020 19:56:34 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 8 Apr 2020 19:56:32 +0800
Message-ID: <20200408115632.15712-1-yuchao0@huawei.com>
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
X-Headers-End: 1jM9K6-0082Ox-AH
Subject: [f2fs-dev] [PATCH] f2fs: compress: support lzo-rle compress
 algorithm
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

LZO-RLE extension (run length encoding) was introduced to improve
performance of LZO algorithm in scenario of data contains many zeros,
zram has changed to use this extended algorithm by default, this
patch adds to support this algorithm extension, to enable this
extension, it needs to enable F2FS_FS_LZO and F2FS_FS_LZORLE config,
and specifies "compress_algorithm=lzo-rle" mountoption.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 Documentation/filesystems/f2fs.txt |  2 +-
 fs/f2fs/Kconfig                    | 10 ++++++++++
 fs/f2fs/compress.c                 | 30 ++++++++++++++++++++++++++++++
 fs/f2fs/f2fs.h                     |  1 +
 fs/f2fs/super.c                    |  7 +++++++
 include/trace/events/f2fs.h        |  3 ++-
 6 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/f2fs.txt b/Documentation/filesystems/f2fs.txt
index b1a66cf0e967..f3f1184cca29 100644
--- a/Documentation/filesystems/f2fs.txt
+++ b/Documentation/filesystems/f2fs.txt
@@ -236,7 +236,7 @@ checkpoint=%s[:%u[%]]     Set to "disable" to turn off checkpointing. Set to "en
                        would be unusable can be viewed at /sys/fs/f2fs/<disk>/unusable
                        This space is reclaimed once checkpoint=enable.
 compress_algorithm=%s  Control compress algorithm, currently f2fs supports "lzo",
-                       "lz4" and "zstd" algorithm.
+                       "lz4", "zstd" and "lzo-rle" algorithm.
 compress_log_size=%u   Support configuring compress cluster size, the size will
                        be 4KB * (1 << %u), 16KB is minimum size, also it's
                        default size.
diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index bb68d21e1f8c..d13c5c6a9787 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -127,3 +127,13 @@ config F2FS_FS_ZSTD
 	default y
 	help
 	  Support ZSTD compress algorithm, if unsure, say Y.
+
+config F2FS_FS_LZORLE
+	bool "LZO-RLE compression support"
+	depends on F2FS_FS_COMPRESSION
+	depends on F2FS_FS_LZO
+	select LZO_COMPRESS
+	select LZO_DECOMPRESS
+	default y
+	help
+	  Support LZO-RLE compress algorithm, if unsure, say Y.
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index ac265c6c40b5..498e0c2ba6ea 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -442,6 +442,31 @@ static const struct f2fs_compress_ops f2fs_zstd_ops = {
 };
 #endif
 
+#ifdef CONFIG_F2FS_FS_LZO
+#ifdef CONFIG_F2FS_FS_LZORLE
+static int lzorle_compress_pages(struct compress_ctx *cc)
+{
+	int ret;
+
+	ret = lzorle1x_1_compress(cc->rbuf, cc->rlen, cc->cbuf->cdata,
+					&cc->clen, cc->private);
+	if (ret != LZO_E_OK) {
+		printk_ratelimited("%sF2FS-fs (%s): lzo-rle compress failed, ret:%d\n",
+				KERN_ERR, F2FS_I_SB(cc->inode)->sb->s_id, ret);
+		return -EIO;
+	}
+	return 0;
+}
+
+static const struct f2fs_compress_ops f2fs_lzorle_ops = {
+	.init_compress_ctx	= lzo_init_compress_ctx,
+	.destroy_compress_ctx	= lzo_destroy_compress_ctx,
+	.compress_pages		= lzorle_compress_pages,
+	.decompress_pages	= lzo_decompress_pages,
+};
+#endif
+#endif
+
 static const struct f2fs_compress_ops *f2fs_cops[COMPRESS_MAX] = {
 #ifdef CONFIG_F2FS_FS_LZO
 	&f2fs_lzo_ops,
@@ -458,6 +483,11 @@ static const struct f2fs_compress_ops *f2fs_cops[COMPRESS_MAX] = {
 #else
 	NULL,
 #endif
+#if defined(CONFIG_F2FS_FS_LZO) && defined(CONFIG_F2FS_FS_LZORLE)
+	&f2fs_lzorle_ops,
+#else
+	NULL,
+#endif
 };
 
 bool f2fs_is_compress_backend_ready(struct inode *inode)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e0d520f2c142..f2071bb72deb 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1272,6 +1272,7 @@ enum compress_algorithm_type {
 	COMPRESS_LZO,
 	COMPRESS_LZ4,
 	COMPRESS_ZSTD,
+	COMPRESS_LZORLE,
 	COMPRESS_MAX,
 };
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9ad927c4d259..a321d78e8601 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -833,6 +833,10 @@ static int parse_options(struct super_block *sb, char *options)
 					!strcmp(name, "zstd")) {
 				F2FS_OPTION(sbi).compress_algorithm =
 								COMPRESS_ZSTD;
+			} else if (strlen(name) == 7 &&
+					!strcmp(name, "lzo-rle")) {
+				F2FS_OPTION(sbi).compress_algorithm =
+								COMPRESS_LZORLE;
 			} else {
 				kfree(name);
 				return -EINVAL;
@@ -1426,6 +1430,9 @@ static inline void f2fs_show_compress_options(struct seq_file *seq,
 	case COMPRESS_ZSTD:
 		algtype = "zstd";
 		break;
+	case COMPRESS_LZORLE:
+		algtype = "lzo-rle";
+		break;
 	}
 	seq_printf(seq, ",compress_algorithm=%s", algtype);
 
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index d97adfc327f0..226ac89cf7c9 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -154,7 +154,8 @@ TRACE_DEFINE_ENUM(CP_PAUSE);
 	__print_symbolic(type,						\
 		{ COMPRESS_LZO,		"LZO" },			\
 		{ COMPRESS_LZ4,		"LZ4" },			\
-		{ COMPRESS_ZSTD,	"ZSTD" })
+		{ COMPRESS_ZSTD,	"ZSTD" },			\
+		{ COMPRESS_LZORLE,	"LZO-RLE" })
 
 struct f2fs_sb_info;
 struct f2fs_io_info;
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
