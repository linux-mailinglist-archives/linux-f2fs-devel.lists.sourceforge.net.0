Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 338BA36D7B3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Apr 2021 14:52:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lbjfy-00067l-9M; Wed, 28 Apr 2021 12:52:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <changfengnan@vivo.com>) id 1lbjfw-00067d-Gi
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Apr 2021 12:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EMTCxinlkrq0KQx0N+PN8sdpamMnvzKIq2CoF/lJg+I=; b=iDZAT8fttKv9F1P8URmO5tZxjW
 K17BoT971pV2epRQCoiQJi86CAaUAsFpW/E4kDkDDyCz5fFhWUbfpyzdmN25iDQQNLw4FCdkKKTGT
 u3Z+UvhIpYJ1mbFj2x/tWfc5jKvzCCADHs+sZKZmqBjcqGJ4wy/nolgLWKxhQ9x83nsY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EMTCxinlkrq0KQx0N+PN8sdpamMnvzKIq2CoF/lJg+I=; b=n
 GfV6bvuXtV8h1dSptWEdp59VVnYnIndLUT2Ena9Z7L/oU1JQGLuvX1VUJ+y9NWQ5YiF97DFTrjMPj
 ETgRcmHEqvj+qFGaOgqXVlw+/f6iv/xuxyGgkaodbZQRHMsWDI45MK+clLfelI81PLoxVHLrtBeLG
 rqBPu4uDUp0bRR/c=;
Received: from mail-m17637.qiye.163.com ([59.111.176.37])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lbjfh-0048Cy-PC
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Apr 2021 12:52:20 +0000
Received: from SZ-11126892.vivo.xyz (unknown [58.251.74.232])
 by mail-m17637.qiye.163.com (Hmail) with ESMTPA id 1DB17980148;
 Wed, 28 Apr 2021 20:51:57 +0800 (CST)
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 28 Apr 2021 20:51:55 +0800
Message-Id: <20210428125155.1020-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.29.2.windows.2
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQkNMGlYeQk4dGRkfSUpKTk5VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 9ISFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PBQ6Hzo4MD8RPEodFAkXC0MD
 DBAwCy1VSlVKTUpCTUpPSEpMTUhNVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOSlVMT1VJSElZV1kIAVlBQk5KQzcG
X-HM-Tid: 0a7918893ac9d992kuws1db17980148
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.37 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [59.111.176.37 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lbjfh-0048Cy-PC
Subject: [f2fs-dev] [PATCH v2] f2fs: compress: add nocompress extensions
 support
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
Cc: Fengnan Chang <changfengnan@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When we create a directory with enable compression, all file write into
directory will try to compress.But sometimes we may know, new file
cannot meet compression ratio requirements.
We need a nocompress extension to skip those files to avoid unnecessary
compress page test.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 Documentation/filesystems/f2fs.rst |  8 +++
 fs/f2fs/f2fs.h                     |  2 +
 fs/f2fs/namei.c                    | 18 +++++--
 fs/f2fs/super.c                    | 79 +++++++++++++++++++++++++++++-
 4 files changed, 103 insertions(+), 4 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 63c0c49b726d..f9248a36cd53 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -281,6 +281,14 @@ compress_extension=%s	 Support adding specified extension, so that f2fs can enab
 			 For other files, we can still enable compression via ioctl.
 			 Note that, there is one reserved special extension '*', it
 			 can be set to enable compression for all files.
+nocompress_extension=%s	   Support adding specified extension, so that f2fs can disable
+			 compression on those corresponding files, just contrary to compression extension.
+			 If you know exactly which files cannot be compressed, you can use this.
+			 The same extension name cannot not appear in both compress and nocompress
+			 extension at the same time.
+			 If the compress extension specifies all files, the types specified by the
+			 nocompress extension will be treated as special cases and will not be compressed.
+			 Don't allow the nocompress extension specifies all files.
 compress_chksum		 Support verifying chksum of raw data in compressed cluster.
 compress_mode=%s	 Control file compression mode. This supports "fs" and "user"
 			 modes. In "fs" mode (default), f2fs does automatic compression
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 87d734f5589d..3d5d28a2568f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -150,8 +150,10 @@ struct f2fs_mount_info {
 	unsigned char compress_level;		/* compress level */
 	bool compress_chksum;			/* compressed data chksum */
 	unsigned char compress_ext_cnt;		/* extension count */
+	unsigned char nocompress_ext_cnt;		/* nocompress extension count */
 	int compress_mode;			/* compression mode */
 	unsigned char extensions[COMPRESS_EXT_NUM][F2FS_EXTENSION_LEN];	/* extensions */
+	unsigned char noextensions[COMPRESS_EXT_NUM][F2FS_EXTENSION_LEN]; /* extensions */
 };

 #define F2FS_FEATURE_ENCRYPT		0x0001
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 405d85dbf9f1..84ca322a22ee 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -279,14 +279,16 @@ static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
 						const unsigned char *name)
 {
 	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
+	unsigned char (*noext)[F2FS_EXTENSION_LEN] = F2FS_OPTION(sbi).noextensions;
 	unsigned char (*ext)[F2FS_EXTENSION_LEN];
-	unsigned int ext_cnt = F2FS_OPTION(sbi).compress_ext_cnt;
+	unsigned char ext_cnt = F2FS_OPTION(sbi).compress_ext_cnt;
+	unsigned char noext_cnt = F2FS_OPTION(sbi).nocompress_ext_cnt;
 	int i, cold_count, hot_count;

 	if (!f2fs_sb_has_compression(sbi) ||
-			is_inode_flag_set(inode, FI_COMPRESSED_FILE) ||
 			F2FS_I(inode)->i_flags & F2FS_NOCOMP_FL ||
-			!f2fs_may_compress(inode))
+			!f2fs_may_compress(inode) ||
+			(!ext_cnt && !noext_cnt))
 		return;

 	down_read(&sbi->sb_lock);
@@ -303,6 +305,16 @@ static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,

 	up_read(&sbi->sb_lock);

+	for (i = 0; i < noext_cnt; i++) {
+		if (is_extension_exist(name, noext[i])) {
+			f2fs_disable_compressed_file(inode);
+			return;
+		}
+	}
+
+	if (is_inode_flag_set(inode, FI_COMPRESSED_FILE))
+		return;
+
 	ext = F2FS_OPTION(sbi).extensions;

 	for (i = 0; i < ext_cnt; i++) {
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 5020152aa8fc..865191339625 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -148,6 +148,7 @@ enum {
 	Opt_compress_algorithm,
 	Opt_compress_log_size,
 	Opt_compress_extension,
+	Opt_nocompress_extension,
 	Opt_compress_chksum,
 	Opt_compress_mode,
 	Opt_atgc,
@@ -222,6 +223,7 @@ static match_table_t f2fs_tokens = {
 	{Opt_compress_algorithm, "compress_algorithm=%s"},
 	{Opt_compress_log_size, "compress_log_size=%u"},
 	{Opt_compress_extension, "compress_extension=%s"},
+	{Opt_nocompress_extension, "nocompress_extension=%s"},
 	{Opt_compress_chksum, "compress_chksum"},
 	{Opt_compress_mode, "compress_mode=%s"},
 	{Opt_atgc, "atgc"},
@@ -473,6 +475,43 @@ static int f2fs_set_test_dummy_encryption(struct super_block *sb,
 }

 #ifdef CONFIG_F2FS_FS_COMPRESSION
+/*
+ * 1. The same extension name cannot not appear in both compress and non-compress extension
+ * at the same time.
+ * 2. If the compress extension specifies all files, the types specified by the non-compress
+ * extension will be treated as special cases and will not be compressed.
+ * 3. Don't allow the non-compress extension specifies all files.
+ */
+static int f2fs_test_compress_extension(struct f2fs_sb_info *sbi)
+{
+	unsigned char (*ext)[F2FS_EXTENSION_LEN];
+	unsigned char (*noext)[F2FS_EXTENSION_LEN];
+	int ext_cnt, noext_cnt, index = 0, no_index = 0;
+
+	ext = F2FS_OPTION(sbi).extensions;
+	ext_cnt = F2FS_OPTION(sbi).compress_ext_cnt;
+	noext = F2FS_OPTION(sbi).noextensions;
+	noext_cnt = F2FS_OPTION(sbi).nocompress_ext_cnt;
+
+	if (!ext_cnt || !noext_cnt)
+		return 0;
+
+	for (no_index = 0; no_index < noext_cnt; no_index++) {
+		if (!strcasecmp("*", noext[no_index])) {
+			f2fs_info(sbi, "Don't allow the non-compress extension specifies all files");
+			return -EINVAL;
+		}
+		for (index = 0; index < ext_cnt; index++) {
+			if (!strcasecmp(ext[index], noext[no_index])) {
+				f2fs_info(sbi, "Don't allow the same extension %s appear in both compress and non-compress extension",
+						ext[index]);
+				return -EINVAL;
+			}
+		}
+	}
+	return 0;
+}
+
 #ifdef CONFIG_F2FS_FS_LZ4
 static int f2fs_set_lz4hc_level(struct f2fs_sb_info *sbi, const char *str)
 {
@@ -546,7 +585,8 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 	substring_t args[MAX_OPT_ARGS];
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	unsigned char (*ext)[F2FS_EXTENSION_LEN];
-	int ext_cnt;
+	unsigned char (*noext)[F2FS_EXTENSION_LEN];
+	int ext_cnt, noext_cnt;
 #endif
 	char *p, *name;
 	int arg = 0;
@@ -1049,6 +1089,30 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			F2FS_OPTION(sbi).compress_ext_cnt++;
 			kfree(name);
 			break;
+		case Opt_nocompress_extension:
+			if (!f2fs_sb_has_compression(sbi)) {
+				f2fs_info(sbi, "Image doesn't support compression");
+				break;
+			}
+			name = match_strdup(&args[0]);
+			if (!name)
+				return -ENOMEM;
+
+			noext = F2FS_OPTION(sbi).noextensions;
+			noext_cnt = F2FS_OPTION(sbi).nocompress_ext_cnt;
+
+			if (strlen(name) >= F2FS_EXTENSION_LEN ||
+				noext_cnt >= COMPRESS_EXT_NUM) {
+				f2fs_err(sbi,
+					"invalid extension length/number");
+				kfree(name);
+				return -EINVAL;
+			}
+
+			strcpy(noext[noext_cnt], name);
+			F2FS_OPTION(sbi).nocompress_ext_cnt++;
+			kfree(name);
+			break;
 		case Opt_compress_chksum:
 			F2FS_OPTION(sbi).compress_chksum = true;
 			break;
@@ -1070,6 +1134,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		case Opt_compress_algorithm:
 		case Opt_compress_log_size:
 		case Opt_compress_extension:
+		case Opt_nocompress_extension:
 		case Opt_compress_chksum:
 		case Opt_compress_mode:
 			f2fs_info(sbi, "compression options not supported");
@@ -1122,6 +1187,13 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 	}
 #endif

+#ifdef CONFIG_F2FS_FS_COMPRESSION
+	if (f2fs_test_compress_extension(sbi)) {
+		f2fs_err(sbi, "invalid compress or nocompress extension");
+		return -EINVAL;
+	}
+#endif
+
 	if (F2FS_IO_SIZE_BITS(sbi) && !f2fs_lfs_mode(sbi)) {
 		f2fs_err(sbi, "Should set mode=lfs with %uKB-sized IO",
 			 F2FS_IO_SIZE_KB(sbi));
@@ -1665,6 +1737,11 @@ static inline void f2fs_show_compress_options(struct seq_file *seq,
 			F2FS_OPTION(sbi).extensions[i]);
 	}

+	for (i = 0; i < F2FS_OPTION(sbi).nocompress_ext_cnt; i++) {
+		seq_printf(seq, ",nocompress_extension=%s",
+			F2FS_OPTION(sbi).noextensions[i]);
+	}
+
 	if (F2FS_OPTION(sbi).compress_chksum)
 		seq_puts(seq, ",compress_chksum");

--
2.29.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
