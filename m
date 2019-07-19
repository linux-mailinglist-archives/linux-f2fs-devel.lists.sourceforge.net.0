Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3FD6D7A3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jul 2019 02:11:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=31wn+LuAKN/Rssg5HdsksYCKGx5ix1mMFW9IgQQYixA=; b=NRVwf2T1ssTRmdOEltW2JwYDj
	p5ay1KYdlsSpGZWkfytri8ftNeKUwbrYy5+5OXP9DZEN6tc/teuNiWNk34kxwtcJRXjAmDRQdzkNR
	UQLKJZuQ1QJ4RKUGqrfbiffDd5KJ6wG3vqnDdt6/NaDAGGwdVo0gUn1adW4gCle3WDWt0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hoGUN-0003rQ-Ok; Fri, 19 Jul 2019 00:11:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <30wgxXQYKAJg5JGK6F8GG8D6.4GE@flex--drosen.bounces.google.com>)
 id 1hoGUM-0003pn-Q3
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jul 2019 00:11:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kRVaRFxFi0b3k0iafEJz+cY2fWuDSXm5hYT3CThYRD4=; b=eYl6E56SDM6UvJGisMtnuyRb7
 I3jJ+mNoVxtzIpWEPzjsSI05MIIQC50Iz1YGiDkXd307r7wbuN+72Wkae4yYdR3wamCgZtG68jH+S
 K5HpTVtwGO2PADHUiUfgQaAKKaI5bbr0JXYGmz5YZILiBMaSw5IqJJ9BXWyEJSnDNlnDM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kRVaRFxFi0b3k0iafEJz+cY2fWuDSXm5hYT3CThYRD4=; b=J2GIwezF6sUAAsUFUDLe0vH2RK
 vSTK6oXHo/2VD6T37wAEDsCPu04ohWkD9jAhWxYD0XzVPBg0xCi9pRubh7BbcegOCwNIf5yxL+P93
 Nvety10j9WEIO9wNehDQhZ6YHrm+j9mzRR5fkXsuFhFKR7ey/n8BkjW9BGyLTM3utqGc=;
Received: from mail-vk1-f202.google.com ([209.85.221.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hoGUL-006bpd-2N
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jul 2019 00:11:06 +0000
Received: by mail-vk1-f202.google.com with SMTP id r4so13187452vkr.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 Jul 2019 17:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=kRVaRFxFi0b3k0iafEJz+cY2fWuDSXm5hYT3CThYRD4=;
 b=cAGzO4zZtM5uNBUPJ46ESMtsSpfRIgBUzgCJ/kC6gohg+Afa1uJN3sOIN1gQX44sVf
 VrXlCLeMAE6CysXQXKVaTZZMV45RPfHFvvzPiywxgwmtYefdYWWUF1RI9wCUwJt+tiPh
 EZJ3EpwFqH3AM6I8hP8d5o55HCJRSlsNOznY3XiRO6ToURKHTm9qXNMLnaILXSmRpp/f
 g/wxuSU8a9yvWMnb9pixlX8xwnCA36sGW/BJr23jycoYBb9qxRcuI3gymqR3giJ4rDB5
 GQUNdnzJwYGPNmBOS+u7qLkBh2gNEZHtEeuE80KUQSicMmrGtUJ6FXV911IUqRygNYY+
 GF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=kRVaRFxFi0b3k0iafEJz+cY2fWuDSXm5hYT3CThYRD4=;
 b=CZ4+sQbGA8+r0AnJ/CYuUq0LdhEt47d/xTz44FwGO7gR8yR9qSL7XBHGsa94kwxjRf
 YcuKIeuzIFXaxc7AlCCL31EKo45LM3Db+Ea+lRLDBvRIadw69hNL4Pq55irmOdkPQrAj
 OLSeRHHSrXMrMGk/EzxtN1F/8PWoDLlpzXQB0OAHHuWB5dlTu4vilvnFbL+JAPxMM7iW
 ZA5F9LCHLLvNpJRhd41+ZNUszD/h7s4fl3EKa2wiQiaI5VIehV2U3B5ZeZOKUge31tNT
 RjiebfvK8O/7LEJQpX0S82BuXDt4zHXg98Puxb0/AVrT1Hf23YROXza7M7d+AQqXJMrL
 XSHQ==
X-Gm-Message-State: APjAAAXQn7gRCz+aRNFb5aud6ruv3pQFGaoBtsjmchpWAMg7+g0GNRwa
 nFHR2VX55FFqgk0ef6ilkJ6lj8HgBKc=
X-Google-Smtp-Source: APXvYqxhfDj57okbUhLQgWVc1X4+OSgbpH1lfXznDXrcOUz/GsyojXubxUCY56fQp3AaqkruKYz2pYMc5Ho=
X-Received: by 2002:a63:f04:: with SMTP id e4mr49219380pgl.38.1563494611121;
 Thu, 18 Jul 2019 17:03:31 -0700 (PDT)
Date: Thu, 18 Jul 2019 17:03:21 -0700
In-Reply-To: <20190719000322.106163-1-drosen@google.com>
Message-Id: <20190719000322.106163-2-drosen@google.com>
Mime-Version: 1.0
References: <20190719000322.106163-1-drosen@google.com>
X-Mailer: git-send-email 2.22.0.657.g960e92d24f-goog
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>, 
 Jonathan Corbet <corbet@lwn.net>, linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.202 listed in list.dnswl.org]
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
X-Headers-End: 1hoGUL-006bpd-2N
Subject: [f2fs-dev] [PATCH v3 1/2] f2fs: include charset encoding
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
 fs/f2fs/super.c         | 94 +++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/sysfs.c         | 23 ++++++++++
 include/linux/f2fs_fs.h |  9 +++-
 4 files changed, 131 insertions(+), 1 deletion(-)

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
index 6de6cda440315..82f7da93c3ed1 100644
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
 
@@ -3031,6 +3072,51 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
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
+}
+
 static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_sm_info *sm_i = SM_I(sbi);
@@ -3127,6 +3213,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 				le32_to_cpu(raw_super->log_blocksize);
 	sb->s_max_links = F2FS_LINK_MAX;
 
+	err = f2fs_setup_casefold(sbi);
+	if (err)
+		goto free_options;
+
 #ifdef CONFIG_QUOTA
 	sb->dq_op = &f2fs_quota_operations;
 	sb->s_qcop = &f2fs_quotactl_ops;
@@ -3477,6 +3567,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
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
