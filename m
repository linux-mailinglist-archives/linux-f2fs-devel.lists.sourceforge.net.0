Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B442CCD55
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 04:33:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkfMY-0004Pg-RB; Thu, 03 Dec 2020 03:32:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kkfMX-0004PT-3n
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 03:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LRzRHS5Q3cGXp876KNAa1KI5FYyvv1yvnk4ieOrmkf8=; b=Lbcag2lhKQhZQ/vZXFI0P9sSOm
 46GGK0ZxO4tCaRUXi8oPiSGDCoxkGBXlqual/F0eSQ5zljNRtCvPJUN97gZg7XdBplVdBX66ZMZHo
 JGM4aH3Qn2AtCAsyi8YzE7lLNgD5NwIctI8gpTaV1JDd3uCy2Gd/8qk63ggfYaosbfjk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LRzRHS5Q3cGXp876KNAa1KI5FYyvv1yvnk4ieOrmkf8=; b=V
 DJWzbimaJQOT7mMec5jgh0j1E96kobMN71QaB6FkzdHCoRH7EPV/k1fVIBJgNkkD6MlJAP3/0xS5B
 XEewdub7bQJIsesiLfKa3G9u0ZnitPnTC02rPhYdxp4gmo7xiubmnPVHA0qY1BVYl0TOiV4EAqvn/
 gGTMp/qgHlTGIYxU=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkfMI-00CXCI-7C
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 03:32:56 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CmhGN4t1xzkkjb;
 Thu,  3 Dec 2020 11:31:56 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Thu, 3 Dec 2020 11:32:23 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 3 Dec 2020 11:31:04 +0800
Message-ID: <20201203033104.42484-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kkfMI-00CXCI-7C
Subject: [f2fs-dev] [PATCH v5] f2fs: compress: support compress level
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

Expand 'compress_algorithm' mount option to accept parameter as format of
<algorithm>:<level>, by this way, it gives a way to allow user to do more
specified config on lz4 and zstd compression level, then f2fs compression
can provide higher compress ratio.

In order to set compress level for lz4 algorithm, it needs to set
CONFIG_LZ4HC_COMPRESS and CONFIG_F2FS_FS_LZ4HC config to enable lz4hc
compress algorithm.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v5:
- avoid compile error if CONFIG_F2FS_FS_ZSTD is off.
 Documentation/filesystems/f2fs.rst |  5 +++
 fs/f2fs/Kconfig                    |  9 ++++
 fs/f2fs/compress.c                 | 40 +++++++++++++++--
 fs/f2fs/f2fs.h                     |  9 ++++
 fs/f2fs/super.c                    | 72 +++++++++++++++++++++++++++++-
 include/linux/f2fs_fs.h            |  3 ++
 6 files changed, 133 insertions(+), 5 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index fd413d319e93..eef683c3266f 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -249,6 +249,11 @@ checkpoint=%s[:%u[%]]	 Set to "disable" to turn off checkpointing. Set to "enabl
 			 This space is reclaimed once checkpoint=enable.
 compress_algorithm=%s	 Control compress algorithm, currently f2fs supports "lzo",
 			 "lz4", "zstd" and "lzo-rle" algorithm.
+compress_algorithm=%s:%d Control compress algorithm and its compress level, now, only
+			 "lz4" and "zstd" support compress level config.
+			 		level range
+			 lz4		3 - 16
+			 zstd		1 - 22
 compress_log_size=%u	 Support configuring compress cluster size, the size will
 			 be 4KB * (1 << %u), 16KB is minimum size, also it's
 			 default size.
diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index d13c5c6a9787..8134b145ae4f 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -119,6 +119,15 @@ config F2FS_FS_LZ4
 	help
 	  Support LZ4 compress algorithm, if unsure, say Y.
 
+config F2FS_FS_LZ4HC
+	bool "LZ4HC compression support"
+	depends on F2FS_FS_COMPRESSION
+	depends on F2FS_FS_LZ4
+	select LZ4HC_COMPRESS
+	default y
+	help
+	  Support LZ4HC compress algorithm, if unsure, say Y.
+
 config F2FS_FS_ZSTD
 	bool "ZSTD compression support"
 	depends on F2FS_FS_COMPRESSION
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index db82da311fe4..dfadbc78946c 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -254,8 +254,13 @@ static const struct f2fs_compress_ops f2fs_lzo_ops = {
 #ifdef CONFIG_F2FS_FS_LZ4
 static int lz4_init_compress_ctx(struct compress_ctx *cc)
 {
-	cc->private = f2fs_kvmalloc(F2FS_I_SB(cc->inode),
-				LZ4_MEM_COMPRESS, GFP_NOFS);
+	unsigned int size;
+	unsigned char level = F2FS_I(cc->inode)->i_compress_flag >>
+						COMPRESS_LEVEL_OFFSET;
+
+	size = level ? LZ4HC_MEM_COMPRESS : LZ4_MEM_COMPRESS;
+
+	cc->private = f2fs_kvmalloc(F2FS_I_SB(cc->inode), size, GFP_NOFS);
 	if (!cc->private)
 		return -ENOMEM;
 
@@ -274,10 +279,34 @@ static void lz4_destroy_compress_ctx(struct compress_ctx *cc)
 	cc->private = NULL;
 }
 
+#ifdef CONFIG_F2FS_FS_LZ4HC
+static int lz4hc_compress_pages(struct compress_ctx *cc)
+{
+	unsigned char level = F2FS_I(cc->inode)->i_compress_flag >>
+						COMPRESS_LEVEL_OFFSET;
+	int len;
+
+	if (level)
+		len = LZ4_compress_HC(cc->rbuf, cc->cbuf->cdata, cc->rlen,
+					cc->clen, level, cc->private);
+	else
+		len = LZ4_compress_default(cc->rbuf, cc->cbuf->cdata, cc->rlen,
+						cc->clen, cc->private);
+	if (!len)
+		return -EAGAIN;
+
+	cc->clen = len;
+	return 0;
+}
+#endif
+
 static int lz4_compress_pages(struct compress_ctx *cc)
 {
 	int len;
 
+#ifdef CONFIG_F2FS_FS_LZ4HC
+	return lz4hc_compress_pages(cc);
+#endif
 	len = LZ4_compress_default(cc->rbuf, cc->cbuf->cdata, cc->rlen,
 						cc->clen, cc->private);
 	if (!len)
@@ -327,8 +356,13 @@ static int zstd_init_compress_ctx(struct compress_ctx *cc)
 	ZSTD_CStream *stream;
 	void *workspace;
 	unsigned int workspace_size;
+	unsigned char level = F2FS_I(cc->inode)->i_compress_flag >>
+						COMPRESS_LEVEL_OFFSET;
+
+	if (!level)
+		level = F2FS_ZSTD_DEFAULT_CLEVEL;
 
-	params = ZSTD_getParams(F2FS_ZSTD_DEFAULT_CLEVEL, cc->rlen, 0);
+	params = ZSTD_getParams(level, cc->rlen, 0);
 	workspace_size = ZSTD_CStreamWorkspaceBound(params.cParams);
 
 	workspace = f2fs_kvmalloc(F2FS_I_SB(cc->inode),
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 377a2e2bf466..76edec7483f3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -147,6 +147,7 @@ struct f2fs_mount_info {
 	/* For compression */
 	unsigned char compress_algorithm;	/* algorithm type */
 	unsigned char compress_log_size;	/* cluster log size */
+	unsigned char compress_level;		/* compress level */
 	bool compress_chksum;			/* compressed data chksum */
 	unsigned char compress_ext_cnt;		/* extension count */
 	int compress_mode;			/* compression mode */
@@ -736,6 +737,7 @@ struct f2fs_inode_info {
 	atomic_t i_compr_blocks;		/* # of compressed blocks */
 	unsigned char i_compress_algorithm;	/* algorithm type */
 	unsigned char i_log_cluster_size;	/* log of cluster size */
+	unsigned char i_compress_level;		/* compress level (lz4hc,zstd) */
 	unsigned short i_compress_flag;		/* compress flag */
 	unsigned int i_cluster_size;		/* cluster size */
 };
@@ -1308,6 +1310,8 @@ struct compress_data {
 
 #define F2FS_COMPRESSED_PAGE_MAGIC	0xF5F2C000
 
+#define	COMPRESS_LEVEL_OFFSET	8
+
 /* compress context */
 struct compress_ctx {
 	struct inode *inode;		/* inode the context belong to */
@@ -3959,6 +3963,11 @@ static inline void set_compress_context(struct inode *inode)
 				1 << COMPRESS_CHKSUM : 0;
 	F2FS_I(inode)->i_cluster_size =
 			1 << F2FS_I(inode)->i_log_cluster_size;
+	if (F2FS_I(inode)->i_compress_algorithm == COMPRESS_LZ4 &&
+			F2FS_OPTION(sbi).compress_level)
+		F2FS_I(inode)->i_compress_flag |=
+				F2FS_OPTION(sbi).compress_level <<
+				COMPRESS_LEVEL_OFFSET;
 	F2FS_I(inode)->i_flags |= F2FS_COMPR_FL;
 	set_inode_flag(inode, FI_COMPRESSED_FILE);
 	stat_inc_compr_inode(inode);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 8442333ca0e2..44ba870bb352 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -25,6 +25,8 @@
 #include <linux/quota.h>
 #include <linux/unicode.h>
 #include <linux/part_stat.h>
+#include <linux/zstd.h>
+#include <linux/lz4.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -466,6 +468,57 @@ static int f2fs_set_test_dummy_encryption(struct super_block *sb,
 	return 0;
 }
 
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+static int f2fs_compress_set_level(struct f2fs_sb_info *sbi, const char *str,
+						int type)
+{
+	unsigned int level;
+	int len;
+
+	if (type == COMPRESS_LZ4)
+		len = 3;
+	else if (type == COMPRESS_ZSTD)
+		len = 4;
+	else
+		return 0;
+
+	if (strlen(str) == len)
+		return 0;
+
+	str += len;
+
+	if (str[0] != ':') {
+		f2fs_info(sbi, "wrong format, e.g. <alg_name>:<compr_level>");
+		return -EINVAL;
+	}
+	if (kstrtouint(str + 1, 10, &level))
+		return -EINVAL;
+	if (type == COMPRESS_LZ4) {
+#ifdef CONFIG_F2FS_FS_LZ4HC
+		if (level < LZ4HC_MIN_CLEVEL || level > LZ4HC_MAX_CLEVEL) {
+			f2fs_info(sbi, "invalid lz4hc compress level: %d", level);
+			return -EINVAL;
+		}
+#else
+		f2fs_info(sbi, "doesn't support lz4hc compression");
+		return 0;
+#endif
+	} else if (type == COMPRESS_ZSTD) {
+#ifdef CONFIG_F2FS_FS_ZSTD
+		if (!level || level > ZSTD_maxCLevel()) {
+			f2fs_info(sbi, "invalid zstd compress level: %d", level);
+			return -EINVAL;
+		}
+#else
+		f2fs_info(sbi, "doesn't support zstd compression");
+		return 0;
+#endif
+	}
+	F2FS_OPTION(sbi).compress_level = level;
+	return 0;
+}
+#endif
+
 static int parse_options(struct super_block *sb, char *options, bool is_remount)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
@@ -886,10 +939,22 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			if (!strcmp(name, "lzo")) {
 				F2FS_OPTION(sbi).compress_algorithm =
 								COMPRESS_LZO;
-			} else if (!strcmp(name, "lz4")) {
+			} else if (!strncmp(name, "lz4", 3)) {
+				ret = f2fs_compress_set_level(sbi, name,
+								COMPRESS_LZ4);
+				if (ret) {
+					kfree(name);
+					return -EINVAL;
+				}
 				F2FS_OPTION(sbi).compress_algorithm =
 								COMPRESS_LZ4;
-			} else if (!strcmp(name, "zstd")) {
+			} else if (!strncmp(name, "zstd", 4)) {
+				ret = f2fs_compress_set_level(sbi, name,
+								COMPRESS_ZSTD);
+				if (ret) {
+					kfree(name);
+					return -EINVAL;
+				}
 				F2FS_OPTION(sbi).compress_algorithm =
 								COMPRESS_ZSTD;
 			} else if (!strcmp(name, "lzo-rle")) {
@@ -1547,6 +1612,9 @@ static inline void f2fs_show_compress_options(struct seq_file *seq,
 	}
 	seq_printf(seq, ",compress_algorithm=%s", algtype);
 
+	if (!F2FS_OPTION(sbi).compress_level)
+		seq_printf(seq, ":%d", F2FS_OPTION(sbi).compress_level);
+
 	seq_printf(seq, ",compress_log_size=%u",
 			F2FS_OPTION(sbi).compress_log_size);
 
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 55be7afeee90..2dcc63fe8494 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -275,6 +275,9 @@ struct f2fs_inode {
 			__u8 i_compress_algorithm;	/* compress algorithm */
 			__u8 i_log_cluster_size;	/* log of cluster size */
 			__le16 i_compress_flag;		/* compress flag */
+						/* 0 bit: chksum flag
+						 * [10,15] bits: compress level
+						 */
 			__le32 i_extra_end[0];	/* for attribute size calculation */
 		} __packed;
 		__le32 i_addr[DEF_ADDRS_PER_INODE];	/* Pointers to data blocks */
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
