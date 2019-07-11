Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEE866103
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jul 2019 23:12:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7/7b4md2hfqhivaXsHENCTHUxORL6XAJXMmzNkkGEu8=; b=BD5UDqFzuw7Pi1P7l1Li3md/hj
	cMRsJrsk/hbAzg3iK52l3i8k4uGqq9CBeIbP70CnYb1ZyvFYFccWf3q8cr261GpzUg8SlgJdUrmpn
	PMWtDBOEZns8PPWNMinZo94ozYaF0I/cwwD4IHxJfjnWGIB3J1H4o4A2cxiYL1Zi7csg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hlgMl-0002ws-4l; Thu, 11 Jul 2019 21:12:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3EKAnXQYKAN0CQNRDMFNNFKD.BNL@flex--drosen.bounces.google.com>)
 id 1hlgMd-0002w3-Cj
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jul 2019 21:12:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2nOMssPtO1cH3T+GMLLMaLH0crWCHI+VftxrWYAdn94=; b=CD4ln7eumlE2HXc8qNEFqmZ3AT
 vTZOi4CtGpf137vXLWOwdrOEFMG6KUQtj94uNqGub7ipp6565r6U4W4/KEPMoYBTx3pZmjrYAwkpM
 c4WvrdVF32yNAdJlSfPrN+gznpN6/x8uYAz7veodJsHt+Lw+PjdkkaO6gbn+JVcfD0TI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2nOMssPtO1cH3T+GMLLMaLH0crWCHI+VftxrWYAdn94=; b=U
 0JBkWJLfgenV88rCOdPJOlSTK5iFl9xKF1XxA0o5sTDmIzk0bL688ClYEFGoA61Ir0yV1K3y0zWZD
 COmviwJ+VGlu8PCiRJjes5HsTeDvx9UdvGsW25d65AhOo0t2byVTarJ1Jj9FLdYQbL7eIf554Afw/
 TRYNCOSWCdMwzMjk=;
Received: from mail-oi1-f202.google.com ([209.85.167.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hlgMZ-00Fbfs-Cy
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jul 2019 21:12:27 +0000
Received: by mail-oi1-f202.google.com with SMTP id s197so3222831oih.14
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Jul 2019 14:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=2nOMssPtO1cH3T+GMLLMaLH0crWCHI+VftxrWYAdn94=;
 b=l5bFpTzALjS+of3hqFSmwnFHxKjF9DE5xciJsJbw/ClNzD/5SEz6R+Tloj8pbutyAu
 7lbiLaa6CqLda7uT0+P8sMwCSIWA36cNSRcbXv7Lg9+FRwHEYCA87Rsf7ptGaEjFIOXF
 IJVVj2oxL806jR0S3vHY0vGaQ5AYi3en5rdMAb+AuhlWMZaxGqyFRbdmGIe+p7/DmfBd
 atjoTpJffEhRjjRrfAAkGlmYNeNT7EdTlqZGVK0antAoSIbhxhm9R3fTJr+II6XV5yN9
 AaWGxvKZsZRLwqzwCWeMpSTNoVWnXZsy9fST5lGOZPdM+1QUhlkZsmfvSO5lzpuFfijK
 ISwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=2nOMssPtO1cH3T+GMLLMaLH0crWCHI+VftxrWYAdn94=;
 b=bbhWMrjhIOA2szheQFY606LOB7LipofWqdJIDdOVnxXPFb28gzCniL1PQ+ok9IVQ4I
 BBjYsJe+uZ2IwTqZl0MfNPPSToSivOvwd4K+9V+zG4UuZux/BZhLxkRnyrpXTXx2AqFt
 ZYvVgM4c8/JWPCphRLQzwWhq8en7C+mxOAaHOQ6jve+fFLUTNgfiEj1PI8ngWirXV0kh
 9VQNjO7xfM+EVdU+fmhVXarqbHUIqqYFba3iaqv2qwI/w62dgzodNZT8dNhRkjHqatXh
 fN0KKg830+8Zqty30hfiE2TSmVP/7WG3eP9KWHpuB/PimGqBZN9h5vJDw5AFstTo8bgx
 UssA==
X-Gm-Message-State: APjAAAWuE29IB6YAHaqUQkRV0Wl0j8IgTQbrd5gGxBQM5kGkkBjZAE/z
 +tIjdlxQ6q14miYAnjgGa0TJK+CUvvM=
X-Google-Smtp-Source: APXvYqyvcz51Sc4HpM1CYPHcs6sp1LinvZioLWJVGKqr51P5lbFMVOuGFCSWAKHIA/EdVgeTCK5UaFK9DxI=
X-Received: by 2002:a63:eb51:: with SMTP id b17mr6256398pgk.384.1562877968916; 
 Thu, 11 Jul 2019 13:46:08 -0700 (PDT)
Date: Thu, 11 Jul 2019 13:45:55 -0700
Message-Id: <20190711204556.120381-1-drosen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>, 
 Jonathan Corbet <corbet@lwn.net>, linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -6.3 (------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.3 PDS_NO_HELO_DNS        High profile HELO but no A record
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1hlgMZ-00Fbfs-Cy
Subject: [f2fs-dev] [PATCH 1/2] f2fs: include charset encoding information
 in the superblock
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: linux-fsdevel@vger.kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org, Daniel Rosenberg <drosen@google.com>,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add charset encoding to f2fs to support casefolding. It is modeled after
the same feature introduced in commit c83ad55eaa91 ("ext4: include charset
encoding information in the superblock")

Currently this is not compatible with encryption, similar to the current
ext4 imlpementation. This will change in the future.

From the ext4 patch:
"""
The s_encoding field stores a magic number indicating the encoding
format and version used globally by file and directory names in the
filesystem.  The s_encoding_flags defines policies for using the charset
encoding, like how to handle invalid sequences.  The magic number is
mapped to the exact charset table, but the mapping is specific to ext4.
Since we don't have any commitment to support old encodings, the only
encoding I am supporting right now is utf8-12.1.0.

The current implementation prevents the user from enabling encoding and
per-directory encryption on the same filesystem at the same time.  The
incompatibility between these features lies in how we do efficient
directory searches when we cannot be sure the encryption of the user
provided fname will match the actual hash stored in the disk without
decrypting every directory entry, because of normalization cases.  My
quickest solution is to simply block the concurrent use of these
features for now, and enable it later, once we have a better solution.
"""

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/f2fs/f2fs.h          |  6 +++
 fs/f2fs/super.c         | 81 +++++++++++++++++++++++++++++++++++++++++
 include/linux/f2fs_fs.h |  9 ++++-
 3 files changed, 95 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 06b89a9862ab2..0e101f699eccd 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -150,6 +150,7 @@ struct f2fs_mount_info {
 #define F2FS_FEATURE_LOST_FOUND		0x0200
 #define F2FS_FEATURE_VERITY		0x0400	/* reserved */
 #define F2FS_FEATURE_SB_CHKSUM		0x0800
+#define F2FS_FEATURE_CASEFOLD		0x1000
 
 #define __F2FS_HAS_FEATURE(raw_super, mask)				\
 	((raw_super->feature & cpu_to_le32(mask)) != 0)
@@ -1162,6 +1163,10 @@ struct f2fs_sb_info {
 	int valid_super_block;			/* valid super block no */
 	unsigned long s_flag;				/* flags for sbi */
 	struct mutex writepages;		/* mutex for writepages() */
+#ifdef CONFIG_UNICODE
+	struct unicode_map *s_encoding;
+	__u16 s_encoding_flags;
+#endif
 
 #ifdef CONFIG_BLK_DEV_ZONED
 	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
@@ -3565,6 +3570,7 @@ F2FS_FEATURE_FUNCS(quota_ino, QUOTA_INO);
 F2FS_FEATURE_FUNCS(inode_crtime, INODE_CRTIME);
 F2FS_FEATURE_FUNCS(lost_found, LOST_FOUND);
 F2FS_FEATURE_FUNCS(sb_chksum, SB_CHKSUM);
+F2FS_FEATURE_FUNCS(casefold, CASEFOLD);
 
 #ifdef CONFIG_BLK_DEV_ZONED
 static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 6b959bbb336a3..a346f5a01370b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -23,6 +23,7 @@
 #include <linux/f2fs_fs.h>
 #include <linux/sysfs.h>
 #include <linux/quota.h>
+#include <linux/unicode.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -211,6 +212,36 @@ void f2fs_msg(struct super_block *sb, const char *level, const char *fmt, ...)
 	va_end(args);
 }
 
+#ifdef CONFIG_UNICODE
+static const struct f2fs_sb_encodings {
+	__u16 magic;
+	char *name;
+	char *version;
+} f2fs_sb_encoding_map[] = {
+	{F2FS_ENC_UTF8_12_1, "utf8", "12.1.0"},
+};
+
+static int f2fs_sb_read_encoding(const struct f2fs_super_block *sb,
+				 const struct f2fs_sb_encodings **encoding,
+				 __u16 *flags)
+{
+	__u16 magic = le16_to_cpu(sb->s_encoding);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(f2fs_sb_encoding_map); i++)
+		if (magic == f2fs_sb_encoding_map[i].magic)
+			break;
+
+	if (i >= ARRAY_SIZE(f2fs_sb_encoding_map))
+		return -EINVAL;
+
+	*encoding = &f2fs_sb_encoding_map[i];
+	*flags = le16_to_cpu(sb->s_encoding_flags);
+
+	return 0;
+}
+#endif
+
 static inline void limit_reserve_root(struct f2fs_sb_info *sbi)
 {
 	block_t limit = (sbi->user_block_count << 1) / 1000;
@@ -812,6 +843,13 @@ static int parse_options(struct super_block *sb, char *options)
 		return -EINVAL;
 	}
 #endif
+#ifndef CONFIG_UNICODE
+	if (f2fs_sb_has_casefold(sbi)) {
+		f2fs_msg(sb, KERN_ERR,
+			"Filesystem with casefold feature cannot be mounted without CONFIG_UNICODE");
+		return -EINVAL;
+	}
+#endif
 
 	if (F2FS_IO_SIZE_BITS(sbi) && !test_opt(sbi, LFS)) {
 		f2fs_msg(sb, KERN_ERR,
@@ -1110,6 +1148,9 @@ static void f2fs_put_super(struct super_block *sb)
 	destroy_percpu_info(sbi);
 	for (i = 0; i < NR_PAGE_TYPE; i++)
 		kvfree(sbi->write_io[i]);
+#ifdef CONFIG_UNICODE
+	utf8_unload(sbi->s_encoding);
+#endif
 	kvfree(sbi);
 }
 
@@ -3157,6 +3198,42 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	sb->s_maxbytes = sbi->max_file_blocks <<
 				le32_to_cpu(raw_super->log_blocksize);
 	sb->s_max_links = F2FS_LINK_MAX;
+#ifdef CONFIG_UNICODE
+	if (f2fs_sb_has_casefold(sbi) && !sbi->s_encoding) {
+		const struct f2fs_sb_encodings *encoding_info;
+		struct unicode_map *encoding;
+		__u16 encoding_flags;
+
+		if (f2fs_sb_has_encrypt(sbi)) {
+			f2fs_msg(sb, KERN_ERR,
+				 "Can't mount with encoding and encryption");
+			goto free_options;
+		}
+
+		if (f2fs_sb_read_encoding(raw_super, &encoding_info,
+					  &encoding_flags)) {
+			f2fs_msg(sb, KERN_ERR,
+				 "Encoding requested by superblock is unknown");
+			goto free_options;
+		}
+
+		encoding = utf8_load(encoding_info->version);
+		if (IS_ERR(encoding)) {
+			f2fs_msg(sb, KERN_ERR,
+				 "can't mount with superblock charset: %s-%s "
+				 "not supported by the kernel. flags: 0x%x.",
+				 encoding_info->name, encoding_info->version,
+				 encoding_flags);
+			goto free_options;
+		}
+		f2fs_msg(sb, KERN_INFO, "Using encoding defined by superblock: "
+			 "%s-%s with flags 0x%hx", encoding_info->name,
+			 encoding_info->version?:"\b", encoding_flags);
+
+		sbi->s_encoding = encoding;
+		sbi->s_encoding_flags = encoding_flags;
+	}
+#endif
 
 #ifdef CONFIG_QUOTA
 	sb->dq_op = &f2fs_quota_operations;
@@ -3511,6 +3588,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 free_bio_info:
 	for (i = 0; i < NR_PAGE_TYPE; i++)
 		kvfree(sbi->write_io[i]);
+
+#ifdef CONFIG_UNICODE
+	utf8_unload(sbi->s_encoding);
+#endif
 free_options:
 #ifdef CONFIG_QUOTA
 	for (i = 0; i < MAXQUOTAS; i++)
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 65559900d4d76..b7c9c7f721339 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -36,6 +36,11 @@
 
 #define F2FS_MAX_QUOTAS		3
 
+#define F2FS_ENC_UTF8_12_1	1
+#define F2FS_ENC_STRICT_MODE_FL	(1 << 0)
+#define f2fs_has_strict_mode(sbi) \
+	(sbi->s_encoding_flags & F2FS_ENC_STRICT_MODE_FL)
+
 #define F2FS_IO_SIZE(sbi)	(1 << F2FS_OPTION(sbi).write_io_size_bits) /* Blocks */
 #define F2FS_IO_SIZE_KB(sbi)	(1 << (F2FS_OPTION(sbi).write_io_size_bits + 2)) /* KB */
 #define F2FS_IO_SIZE_BYTES(sbi)	(1 << (F2FS_OPTION(sbi).write_io_size_bits + 12)) /* B */
@@ -109,7 +114,9 @@ struct f2fs_super_block {
 	struct f2fs_device devs[MAX_DEVICES];	/* device list */
 	__le32 qf_ino[F2FS_MAX_QUOTAS];	/* quota inode numbers */
 	__u8 hot_ext_count;		/* # of hot file extension */
-	__u8 reserved[310];		/* valid reserved region */
+	__le16  s_encoding;		/* Filename charset encoding */
+	__le16  s_encoding_flags;	/* Filename charset encoding flags */
+	__u8 reserved[306];		/* valid reserved region */
 	__le32 crc;			/* checksum of superblock */
 } __packed;
 
-- 
2.22.0.410.gd8fdbe21b5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
