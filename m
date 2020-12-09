Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC642D3B64
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Dec 2020 07:25:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmsv6-0004vm-HJ; Wed, 09 Dec 2020 06:25:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kmsv4-0004vS-Az
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 06:25:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uG632F8LNtMtJth6Rnd6CqiHjujgj1FBcCLm4E6NdPA=; b=IgR6w/fh8/VB1fqmYTIwkV1q+Z
 ahKyk1Rlgb7AQgVn4Xujbizc3SLIS7FpOZvdK2Zk62uMAiZQMj9ooS54lfVkSp1e/tTki5C+4+wkb
 rcSMl6Wlidtl7CtIJhT7wY55UHhcpPLd5NhcedhFqfFmwXY4cDkrPoGdlppjOewgWdrs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uG632F8LNtMtJth6Rnd6CqiHjujgj1FBcCLm4E6NdPA=; b=RYdw/Nhz8YZxbq2gQonLINcmtm
 IXXF56b3OZMNireVJVHLmT11TD3gdsdAUGBWpkabNM03VsKXEhs2DU1feuHoQDHqm6cT9LR7tihwx
 jt9HBEcH/i+xz5HEjjgBC5ze7TreFFTzjmuVyPvW5di453DfJdAHpicfvqf8Zqvk7m1E=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmsuv-007QnQ-0y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 06:25:46 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CrRq85Xb5z7Bk6;
 Wed,  9 Dec 2020 14:24:52 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Wed, 9 Dec 2020 14:25:15 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 9 Dec 2020 14:24:54 +0800
Message-ID: <20201209062457.111907-3-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201209062457.111907-1-yuchao0@huawei.com>
References: <20201209062457.111907-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kmsuv-007QnQ-0y
Subject: [f2fs-dev] [PATCH RESEND 3/6] f2fs: compress: support compress level
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

CR and performance number on lz4/lz4hc algorithm:

dd if=enwik9 of=compressed_file conv=fsync

Original blocks:	244382

			lz4			lz4hc-9
compressed blocks	170647			163270
compress ratio		69.8%			66.8%
speed			16.4207 s, 60.9 MB/s	26.7299 s, 37.4 MB/s

compress ratio = after / before

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 Documentation/filesystems/f2fs.rst |  5 +++
 fs/f2fs/Kconfig                    | 10 +++++
 fs/f2fs/compress.c                 | 41 +++++++++++++++--
 fs/f2fs/f2fs.h                     |  9 ++++
 fs/f2fs/super.c                    | 71 +++++++++++++++++++++++++++++-
 include/linux/f2fs_fs.h            |  3 ++
 6 files changed, 134 insertions(+), 5 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 1169e6e9981e..217c95117e97 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -249,6 +249,11 @@ checkpoint=%s[:%u[%]]	 Set to "disable" to turn off checkpointing. Set to "enabl
 			 This space is reclaimed once checkpoint=enable.
 compress_algorithm=%s	 Control compress algorithm, currently f2fs supports "lzo",
 			 "lz4", "zstd" and "lzo-rle" algorithm.
+compress_algorithm=%s:%d Control compress algorithm and its compress level, now, only
+			 "lz4" and "zstd" support compress level config.
+			 algorithm	level range
+			 lz4		3 - 16
+			 zstd		1 - 22
 compress_log_size=%u	 Support configuring compress cluster size, the size will
 			 be 4KB * (1 << %u), 16KB is minimum size, also it's
 			 default size.
diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index d13c5c6a9787..63c1fc1a0e3b 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -119,6 +119,16 @@ config F2FS_FS_LZ4
 	help
 	  Support LZ4 compress algorithm, if unsure, say Y.
 
+config F2FS_FS_LZ4HC
+	bool "LZ4HC compression support"
+	depends on F2FS_FS_COMPRESSION
+	depends on F2FS_FS_LZ4
+	select LZ4HC_COMPRESS
+	default y
+	help
+	  Support LZ4HC compress algorithm, LZ4HC has compatible on-disk
+	  layout with LZ4, if unsure, say Y.
+
 config F2FS_FS_ZSTD
 	bool "ZSTD compression support"
 	depends on F2FS_FS_COMPRESSION
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 446dd41a7bad..8840f5f41bf1 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -254,8 +254,14 @@ static const struct f2fs_compress_ops f2fs_lzo_ops = {
 #ifdef CONFIG_F2FS_FS_LZ4
 static int lz4_init_compress_ctx(struct compress_ctx *cc)
 {
-	cc->private = f2fs_kvmalloc(F2FS_I_SB(cc->inode),
-				LZ4_MEM_COMPRESS, GFP_NOFS);
+	unsigned int size = LZ4_MEM_COMPRESS;
+
+#ifdef CONFIG_F2FS_FS_LZ4HC
+	if (F2FS_I(cc->inode)->i_compress_flag >> COMPRESS_LEVEL_OFFSET)
+		size = LZ4HC_MEM_COMPRESS;
+#endif
+
+	cc->private = f2fs_kvmalloc(F2FS_I_SB(cc->inode), size, GFP_NOFS);
 	if (!cc->private)
 		return -ENOMEM;
 
@@ -274,10 +280,34 @@ static void lz4_destroy_compress_ctx(struct compress_ctx *cc)
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
@@ -327,8 +357,13 @@ static int zstd_init_compress_ctx(struct compress_ctx *cc)
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
index 0ff8b18eda05..fbaef39e51df 100644
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
@@ -1314,6 +1316,8 @@ struct compress_data {
 
 #define F2FS_COMPRESSED_PAGE_MAGIC	0xF5F2C000
 
+#define	COMPRESS_LEVEL_OFFSET	8
+
 /* compress context */
 struct compress_ctx {
 	struct inode *inode;		/* inode the context belong to */
@@ -3962,6 +3966,11 @@ static inline void set_compress_context(struct inode *inode)
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
index 556ca4143e67..8637196dec7c 100644
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
@@ -466,6 +468,56 @@ static int f2fs_set_test_dummy_encryption(struct super_block *sb,
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
@@ -886,10 +938,22 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
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
@@ -1547,6 +1611,9 @@ static inline void f2fs_show_compress_options(struct seq_file *seq,
 	}
 	seq_printf(seq, ",compress_algorithm=%s", algtype);
 
+	if (F2FS_OPTION(sbi).compress_level)
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
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
