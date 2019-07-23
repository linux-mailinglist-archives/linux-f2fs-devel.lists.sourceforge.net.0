Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6095372324
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jul 2019 01:37:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QsfjdbaE5GDQbbjhtEm6zNkkXF64dCTltF05I5MKRp0=; b=gVyGDuaCQaiDUE3G/ZRA5b0nn
	b8rrjmTRVqegHDqdTNInYkq0nB5ox9ETbysI9n/p9X1INlTrGXqwVw+YpJdNhv3CRflANST5yHBXh
	5vgrJaRB/LytkNxHEHqAFGdKOyhMyCMxehkW2Y7dukYhN6SVb4e94wYArd1e3n0a22+iw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hq4Lr-00070t-0W; Tue, 23 Jul 2019 23:37:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3EZM3XQYKAAYjxuyktmuumrk.ius@flex--drosen.bounces.google.com>)
 id 1hq4Lp-00070k-2m
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Jul 2019 23:37:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wvLNg8NcuoS7wb0H9ZA222Zg9ztyo15ouGDUprK/ePU=; b=cAyUYVPCdZH8aCm6jYX7CflW1
 XjatqmEiXI0lilKVavdB1szmP6DojxxHkOMSp/u7ZjU6ML4XNxsdvZVIkFV1BA/sgs1a/fdk0/l7V
 ns3ZxJuSbzrKXcpA8KIl0HBjulauBH2rZd3v2p/wBeul+kIeuLndSVJa+U7ih6De23l+o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wvLNg8NcuoS7wb0H9ZA222Zg9ztyo15ouGDUprK/ePU=; b=bhkWqVrgsGwhgAJ+XI5eAXeJBO
 /jg7Aa6gNfq35L0luZ1y3TXG+A2UIbRpDrjG7bi+T3Ovru2uOb5tCWCeEQtY80L0h57U421FHSs6M
 i1ejGQgrZI3GoQRt7LQpNr2EzN448dsFjBBg6vFE136fsCaD5j0gv6xyVQyIv1LN5hrg=;
Received: from mail-ot1-f73.google.com ([209.85.210.73])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hq4Ln-00CyvH-AY
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Jul 2019 23:37:45 +0000
Received: by mail-ot1-f73.google.com with SMTP id f11so24754025otq.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 23 Jul 2019 16:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=wvLNg8NcuoS7wb0H9ZA222Zg9ztyo15ouGDUprK/ePU=;
 b=FSAfvWySk6Qw4cPKAS3LLIphbDFrIewlPpNaqNaTg3D+tzKO1q+azRlfrXHk3iXjeW
 4UW3oMiN75xy4cGVwt04gLu+eJe/kja0dYYMUaXgTR7muRtafS6WFe5ASFJVxC0q/r3d
 xnh0QY6e1jtXkRo4YFOrpkPs0uoYxzBdtpXLbbJelf6JnS1wdCTkiGAkXEVh+TvTEz2L
 kHd2E0+2pna1HH6XrVOkoMvBVaVoUE01k0ok29FBw0N7SXbohYFhNgNK8/kmaHcUYGRc
 kA6Cnw2csnDo16E5XlK5mqnF8qEwOSBDONekyU/KYybW2gr4aRCg6HOb/OoeRBwV/LjA
 Mzpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=wvLNg8NcuoS7wb0H9ZA222Zg9ztyo15ouGDUprK/ePU=;
 b=RFyHq13bZXQRBBp019Fud3LumvZpeqhSD1f46GbF3Is9yKT9GM+iod2ZmI3+KWPSzS
 HzxAzQhbUBYgQP13vFQ1cdoa/mgwobvCXBqe2UlOEe+KXBjmrXyrTi4cXFzilpZIpPyX
 GKyuCm0WPcoZNb7d0M3LfE3tk8yeG4sdYbLs7xLJFbZhgupwqTuqSRUvU7FeTFmbsmxq
 TXWLRi+mwO/xfrDPj9rkzBkY8kePZ38QB7po5NyeI0NhOw3FCrC6jdhJs4buvZK9V2Pk
 F4Rb2PiLHe/Te0zMZ7X6mJhfQXDYwrB8sf0XpbWhGKVA5qAzVGWUj/sgnUBXOF8R2zlh
 TI8g==
X-Gm-Message-State: APjAAAVzFbHgVseR9QvoUVrL/pSCZa3aGU5yKmTTKd4YuwjF9gVt+Dbj
 3ogmnN3MCVMLABgc+s+rZZwtKuxk+Ug=
X-Google-Smtp-Source: APXvYqxQ2N5+hrKMTcNvG99AM3UAOyoyfwV2jm+tg2jnZsMCfKYRehTSnBBq2moJUCbaHq5+xnNmIt+3Qp8=
X-Received: by 2002:a63:2cd1:: with SMTP id s200mr74475008pgs.10.1563923217260; 
 Tue, 23 Jul 2019 16:06:57 -0700 (PDT)
Date: Tue, 23 Jul 2019 16:05:28 -0700
In-Reply-To: <20190723230529.251659-1-drosen@google.com>
Message-Id: <20190723230529.251659-3-drosen@google.com>
Mime-Version: 1.0
References: <20190723230529.251659-1-drosen@google.com>
X-Mailer: git-send-email 2.22.0.657.g960e92d24f-goog
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>, 
 Jonathan Corbet <corbet@lwn.net>, linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.73 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hq4Ln-00CyvH-AY
Subject: [f2fs-dev] [PATCH v4 2/3] f2fs: include charset encoding
 information in the superblock
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
Cc: Daniel Rosenberg <drosen@google.com>, linux-doc@vger.kernel.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, kernel-team@android.com
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
 Documentation/ABI/testing/sysfs-fs-f2fs |  7 ++
 Documentation/filesystems/f2fs.txt      |  3 +
 fs/f2fs/f2fs.h                          |  6 ++
 fs/f2fs/super.c                         | 95 +++++++++++++++++++++++++
 fs/f2fs/sysfs.c                         | 23 ++++++
 include/linux/f2fs_fs.h                 |  9 ++-
 6 files changed, 142 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index dca326e0ee3e1..7ab2b1b5e255f 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -251,3 +251,10 @@ Description:
 		If checkpoint=disable, it displays the number of blocks that are unusable.
                 If checkpoint=enable it displays the enumber of blocks that would be unusable
                 if checkpoint=disable were to be set.
+
+What:		/sys/fs/f2fs/<disk>/encoding
+Date		July 2019
+Contact:	"Daniel Rosenberg" <drosen@google.com>
+Description:
+		Displays name and version of the encoding set for the filesystem.
+                If no encoding is set, displays (none)
diff --git a/Documentation/filesystems/f2fs.txt b/Documentation/filesystems/f2fs.txt
index 496fa28b24925..5fa38ab373cab 100644
--- a/Documentation/filesystems/f2fs.txt
+++ b/Documentation/filesystems/f2fs.txt
@@ -413,6 +413,9 @@ Files in /sys/fs/f2fs/<devname>
                               that would be unusable if checkpoint=disable were
                               to be set.
 
+encoding 	              This shows the encoding used for casefolding.
+                              If casefolding is not enabled, returns (none)
+
 ================================================================================
 USAGE
 ================================================================================
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 17382da7f0bd9..c6c7904572d0d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -153,6 +153,7 @@ struct f2fs_mount_info {
 #define F2FS_FEATURE_LOST_FOUND		0x0200
 #define F2FS_FEATURE_VERITY		0x0400	/* reserved */
 #define F2FS_FEATURE_SB_CHKSUM		0x0800
+#define F2FS_FEATURE_CASEFOLD		0x1000
 
 #define __F2FS_HAS_FEATURE(raw_super, mask)				\
 	((raw_super->feature & cpu_to_le32(mask)) != 0)
@@ -1169,6 +1170,10 @@ struct f2fs_sb_info {
 	int valid_super_block;			/* valid super block no */
 	unsigned long s_flag;				/* flags for sbi */
 	struct mutex writepages;		/* mutex for writepages() */
+#ifdef CONFIG_UNICODE
+	struct unicode_map *s_encoding;
+	__u16 s_encoding_flags;
+#endif
 
 #ifdef CONFIG_BLK_DEV_ZONED
 	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
@@ -3562,6 +3567,7 @@ F2FS_FEATURE_FUNCS(quota_ino, QUOTA_INO);
 F2FS_FEATURE_FUNCS(inode_crtime, INODE_CRTIME);
 F2FS_FEATURE_FUNCS(lost_found, LOST_FOUND);
 F2FS_FEATURE_FUNCS(sb_chksum, SB_CHKSUM);
+F2FS_FEATURE_FUNCS(casefold, CASEFOLD);
 
 #ifdef CONFIG_BLK_DEV_ZONED
 static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 6de6cda440315..068db78a1e03e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -23,6 +23,7 @@
 #include <linux/f2fs_fs.h>
 #include <linux/sysfs.h>
 #include <linux/quota.h>
+#include <linux/unicode.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -222,6 +223,36 @@ void f2fs_printk(struct f2fs_sb_info *sbi, const char *fmt, ...)
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
 	block_t limit = min((sbi->user_block_count << 1) / 1000,
@@ -798,6 +829,13 @@ static int parse_options(struct super_block *sb, char *options)
 		return -EINVAL;
 	}
 #endif
+#ifndef CONFIG_UNICODE
+	if (f2fs_sb_has_casefold(sbi)) {
+		f2fs_err(sbi,
+			"Filesystem with casefold feature cannot be mounted without CONFIG_UNICODE");
+		return -EINVAL;
+	}
+#endif
 
 	if (F2FS_IO_SIZE_BITS(sbi) && !test_opt(sbi, LFS)) {
 		f2fs_err(sbi, "Should set mode=lfs with %uKB-sized IO",
@@ -1089,6 +1127,9 @@ static void f2fs_put_super(struct super_block *sb)
 	destroy_percpu_info(sbi);
 	for (i = 0; i < NR_PAGE_TYPE; i++)
 		kvfree(sbi->write_io[i]);
+#ifdef CONFIG_UNICODE
+	utf8_unload(sbi->s_encoding);
+#endif
 	kvfree(sbi);
 }
 
@@ -3031,6 +3072,52 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 	return 0;
 }
 
+static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
+{
+#ifdef CONFIG_UNICODE
+	if (f2fs_sb_has_casefold(sbi) && !sbi->s_encoding) {
+		const struct f2fs_sb_encodings *encoding_info;
+		struct unicode_map *encoding;
+		__u16 encoding_flags;
+
+		if (f2fs_sb_has_encrypt(sbi)) {
+			f2fs_err(sbi,
+				"Can't mount with encoding and encryption");
+			return -EINVAL;
+		}
+
+		if (f2fs_sb_read_encoding(sbi->raw_super, &encoding_info,
+					  &encoding_flags)) {
+			f2fs_err(sbi,
+				 "Encoding requested by superblock is unknown");
+			return -EINVAL;
+		}
+
+		encoding = utf8_load(encoding_info->version);
+		if (IS_ERR(encoding)) {
+			f2fs_err(sbi,
+				 "can't mount with superblock charset: %s-%s "
+				 "not supported by the kernel. flags: 0x%x.",
+				 encoding_info->name, encoding_info->version,
+				 encoding_flags);
+			return PTR_ERR(encoding);
+		}
+		f2fs_info(sbi, "Using encoding defined by superblock: "
+			 "%s-%s with flags 0x%hx", encoding_info->name,
+			 encoding_info->version?:"\b", encoding_flags);
+
+		sbi->s_encoding = encoding;
+		sbi->s_encoding_flags = encoding_flags;
+	}
+#else
+	if (f2fs_sb_has_casefold(sbi)) {
+		f2fs_err(sbi, "Filesystem with casefold feature cannot be mounted without CONFIG_UNICODE");
+		return -EINVAL;
+	}
+#endif
+	return 0;
+}
+
 static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_sm_info *sm_i = SM_I(sbi);
@@ -3127,6 +3214,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 				le32_to_cpu(raw_super->log_blocksize);
 	sb->s_max_links = F2FS_LINK_MAX;
 
+	err = f2fs_setup_casefold(sbi);
+	if (err)
+		goto free_options;
+
 #ifdef CONFIG_QUOTA
 	sb->dq_op = &f2fs_quota_operations;
 	sb->s_qcop = &f2fs_quotactl_ops;
@@ -3477,6 +3568,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
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
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 3aeacd0aacfd2..f9fcca695db9f 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -10,6 +10,7 @@
 #include <linux/proc_fs.h>
 #include <linux/f2fs_fs.h>
 #include <linux/seq_file.h>
+#include <linux/unicode.h>
 
 #include "f2fs.h"
 #include "segment.h"
@@ -81,6 +82,19 @@ static ssize_t unusable_show(struct f2fs_attr *a,
 		(unsigned long long)unusable);
 }
 
+static ssize_t encoding_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+#ifdef CONFIG_UNICODE
+	if (f2fs_sb_has_casefold(sbi))
+		return snprintf(buf, PAGE_SIZE, "%s (%d.%d.%d)\n",
+			sbi->s_encoding->charset,
+			(sbi->s_encoding->version >> 16) & 0xff,
+			(sbi->s_encoding->version >> 8) & 0xff,
+			sbi->s_encoding->version & 0xff);
+#endif
+	return snprintf(buf, PAGE_SIZE, "(none)");
+}
 
 static ssize_t lifetime_write_kbytes_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
@@ -134,6 +148,9 @@ static ssize_t features_show(struct f2fs_attr *a,
 	if (f2fs_sb_has_sb_chksum(sbi))
 		len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
 				len ? ", " : "", "sb_checksum");
+	if (f2fs_sb_has_casefold(sbi))
+		len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
+				len ? ", " : "", "casefold");
 	len += snprintf(buf + len, PAGE_SIZE - len, "\n");
 	return len;
 }
@@ -365,6 +382,7 @@ enum feat_id {
 	FEAT_INODE_CRTIME,
 	FEAT_LOST_FOUND,
 	FEAT_SB_CHECKSUM,
+	FEAT_CASEFOLD,
 };
 
 static ssize_t f2fs_feature_show(struct f2fs_attr *a,
@@ -382,6 +400,7 @@ static ssize_t f2fs_feature_show(struct f2fs_attr *a,
 	case FEAT_INODE_CRTIME:
 	case FEAT_LOST_FOUND:
 	case FEAT_SB_CHECKSUM:
+	case FEAT_CASEFOLD:
 		return snprintf(buf, PAGE_SIZE, "supported\n");
 	}
 	return 0;
@@ -455,6 +474,7 @@ F2FS_GENERAL_RO_ATTR(lifetime_write_kbytes);
 F2FS_GENERAL_RO_ATTR(features);
 F2FS_GENERAL_RO_ATTR(current_reserved_blocks);
 F2FS_GENERAL_RO_ATTR(unusable);
+F2FS_GENERAL_RO_ATTR(encoding);
 
 #ifdef CONFIG_FS_ENCRYPTION
 F2FS_FEATURE_RO_ATTR(encryption, FEAT_CRYPTO);
@@ -471,6 +491,7 @@ F2FS_FEATURE_RO_ATTR(quota_ino, FEAT_QUOTA_INO);
 F2FS_FEATURE_RO_ATTR(inode_crtime, FEAT_INODE_CRTIME);
 F2FS_FEATURE_RO_ATTR(lost_found, FEAT_LOST_FOUND);
 F2FS_FEATURE_RO_ATTR(sb_checksum, FEAT_SB_CHECKSUM);
+F2FS_FEATURE_RO_ATTR(casefold, FEAT_CASEFOLD);
 
 #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
 static struct attribute *f2fs_attrs[] = {
@@ -515,6 +536,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(features),
 	ATTR_LIST(reserved_blocks),
 	ATTR_LIST(current_reserved_blocks),
+	ATTR_LIST(encoding),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
@@ -535,6 +557,7 @@ static struct attribute *f2fs_feat_attrs[] = {
 	ATTR_LIST(inode_crtime),
 	ATTR_LIST(lost_found),
 	ATTR_LIST(sb_checksum),
+	ATTR_LIST(casefold),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs_feat);
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
2.22.0.657.g960e92d24f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
