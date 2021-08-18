Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4D33F0627
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Aug 2021 16:15:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mGMLx-0006cU-Hw; Wed, 18 Aug 2021 14:15:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+c26a8f31a710de91e748+6569+infradead.org+hch@casper.srs.infradead.org>)
 id 1mGMLv-0006cJ-MY
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 14:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H/WqWK1cJ0GtgtFLFrx2fxpNc4slPIfD/lu1pq4V1XU=; b=fgKO1Vct9XcoYc5CPri+jwF0nU
 Rqub+8XYOakWLK6zaRsbhn9TFekjz4tqH+LhXoV/tfALwZttx3v+jn6thv9IKS3b+fPMpt3V25k9q
 kwq0SixtQax3WVC00PKUgu1wt2yMKu43rZINZA/UrcSxWuiMN0LEtWPj6eK7ipjdJxrs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H/WqWK1cJ0GtgtFLFrx2fxpNc4slPIfD/lu1pq4V1XU=; b=dwkajVHcQVjld8t9VgXwJWVDjg
 yIMwh5CHsSMLJkz9q6hjotgmIcFGB3GfRYlB1Oq7O1DzUYN75G+e8k09NXUTJOpVMUhp7W619QrIF
 P6cuUSX9N+yIiOF9eesRcbxzR5qfYGmWS8QK77rwosFhXxi5JpBx44zxstPAvFORfSnc=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mGMLs-00AXfT-Dq
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 14:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=H/WqWK1cJ0GtgtFLFrx2fxpNc4slPIfD/lu1pq4V1XU=; b=hgzM3x73kVdu+XyZ5Xa7LLeE5x
 Uu1HqlooxiYejM8VZ0nlxlbe9IzvCDoVCZyoQXQl3YZyqePo5hWvaH28IoL0RWIaW5QtWR7mLxN2f
 T/1P/QiJB3b/HvqlBC9DzM+G5cGbRcC6lLfmrgotwBDVmohJhCh4eHhdrPycEajtcjM2OdsY4EBJ7
 z1crpfXWNP6n1gzl9A1Uj8oqcbMO0QPtgtOW5GNfbbTR8Lbye5kabEgTxzmEunykEaHgJBS7sIf5O
 2BjwYXKRJ15/8hvmHzB/lUk3ZBiY59xBAO22eefywFMOmCpygal4r5YowlDM3D9tqwiDMlg2DoAJK
 j0hxCZJw==;
Received: from [2001:4bb8:188:1b1:5a9e:9f39:5a86:b20c] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGMJx-003ueO-Pa; Wed, 18 Aug 2021 14:13:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Date: Wed, 18 Aug 2021 16:06:45 +0200
Message-Id: <20210818140651.17181-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818140651.17181-1-hch@lst.de>
References: <20210818140651.17181-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Don't bother with pointless string parsing when the caller
 can just pass the version in the format that the core expects. Also remove
 the fallback to the latest version that none of the callers actual [...] 
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mGMLs-00AXfT-Dq
Subject: [f2fs-dev] [PATCH 05/11] unicode: pass a UNICODE_AGE() tripple to
 utf8_load
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Shreeya Patel <shreeya.patel@collabora.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Don't bother with pointless string parsing when the caller can just pass
the version in the format that the core expects.  Also remove the
fallback to the latest version that none of the callers actually uses.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ext4/super.c            | 10 ++++----
 fs/f2fs/super.c            | 10 ++++----
 fs/unicode/utf8-core.c     | 50 ++++----------------------------------
 fs/unicode/utf8-norm.c     | 11 ++-------
 fs/unicode/utf8-selftest.c | 15 ++++++------
 fs/unicode/utf8n.h         | 14 ++---------
 include/linux/unicode.h    | 11 ++++++++-
 7 files changed, 37 insertions(+), 84 deletions(-)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index a68be582bba5..be418a30b52e 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -2016,9 +2016,9 @@ static const struct mount_opts {
 static const struct ext4_sb_encodings {
 	__u16 magic;
 	char *name;
-	char *version;
+	unsigned int version;
 } ext4_sb_encoding_map[] = {
-	{EXT4_ENC_UTF8_12_1, "utf8", "12.1.0"},
+	{EXT4_ENC_UTF8_12_1, "utf8", UNICODE_AGE(12, 1, 0)},
 };
 
 static const struct ext4_sb_encodings *
@@ -4308,15 +4308,15 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
 		encoding = utf8_load(encoding_info->version);
 		if (IS_ERR(encoding)) {
 			ext4_msg(sb, KERN_ERR,
-				 "can't mount with superblock charset: %s-%s "
+				 "can't mount with superblock charset: %s-0x%x "
 				 "not supported by the kernel. flags: 0x%x.",
 				 encoding_info->name, encoding_info->version,
 				 encoding_flags);
 			goto failed_mount;
 		}
 		ext4_msg(sb, KERN_INFO,"Using encoding defined by superblock: "
-			 "%s-%s with flags 0x%hx", encoding_info->name,
-			 encoding_info->version?:"\b", encoding_flags);
+			 "%s-0x%x with flags 0x%hx", encoding_info->name,
+			 encoding_info->version, encoding_flags);
 
 		sb->s_encoding = encoding;
 		sb->s_encoding_flags = encoding_flags;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index af63ae009582..d107480f88a3 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -255,9 +255,9 @@ void f2fs_printk(struct f2fs_sb_info *sbi, const char *fmt, ...)
 static const struct f2fs_sb_encodings {
 	__u16 magic;
 	char *name;
-	char *version;
+	unsigned int version;
 } f2fs_sb_encoding_map[] = {
-	{F2FS_ENC_UTF8_12_1, "utf8", "12.1.0"},
+	{F2FS_ENC_UTF8_12_1, "utf8", UNICODE_AGE(12, 1, 0)},
 };
 
 static const struct f2fs_sb_encodings *
@@ -3734,15 +3734,15 @@ static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
 		encoding = utf8_load(encoding_info->version);
 		if (IS_ERR(encoding)) {
 			f2fs_err(sbi,
-				 "can't mount with superblock charset: %s-%s "
+				 "can't mount with superblock charset: %s-0x%x "
 				 "not supported by the kernel. flags: 0x%x.",
 				 encoding_info->name, encoding_info->version,
 				 encoding_flags);
 			return PTR_ERR(encoding);
 		}
 		f2fs_info(sbi, "Using encoding defined by superblock: "
-			 "%s-%s with flags 0x%hx", encoding_info->name,
-			 encoding_info->version?:"\b", encoding_flags);
+			 "%s-0x%x with flags 0x%hx", encoding_info->name,
+			 encoding_info->version, encoding_flags);
 
 		sbi->sb->s_encoding = encoding;
 		sbi->sb->s_encoding_flags = encoding_flags;
diff --git a/fs/unicode/utf8-core.c b/fs/unicode/utf8-core.c
index 86f42a078d99..dca2865c3bee 100644
--- a/fs/unicode/utf8-core.c
+++ b/fs/unicode/utf8-core.c
@@ -167,59 +167,19 @@ int utf8_normalize(const struct unicode_map *um, const struct qstr *str,
 	}
 	return -EINVAL;
 }
-
 EXPORT_SYMBOL(utf8_normalize);
 
-static int utf8_parse_version(const char *version, unsigned int *maj,
-			      unsigned int *min, unsigned int *rev)
+struct unicode_map *utf8_load(unsigned int version)
 {
-	substring_t args[3];
-	char version_string[12];
-	static const struct match_token token[] = {
-		{1, "%d.%d.%d"},
-		{0, NULL}
-	};
-
-	strncpy(version_string, version, sizeof(version_string));
-
-	if (match_token(version_string, token, args) != 1)
-		return -EINVAL;
-
-	if (match_int(&args[0], maj) || match_int(&args[1], min) ||
-	    match_int(&args[2], rev))
-		return -EINVAL;
+	struct unicode_map *um;
 
-	return 0;
-}
-
-struct unicode_map *utf8_load(const char *version)
-{
-	struct unicode_map *um = NULL;
-	int unicode_version;
-
-	if (version) {
-		unsigned int maj, min, rev;
-
-		if (utf8_parse_version(version, &maj, &min, &rev) < 0)
-			return ERR_PTR(-EINVAL);
-
-		if (!utf8version_is_supported(maj, min, rev))
-			return ERR_PTR(-EINVAL);
-
-		unicode_version = UNICODE_AGE(maj, min, rev);
-	} else {
-		unicode_version = utf8version_latest();
-		printk(KERN_WARNING"UTF-8 version not specified. "
-		       "Assuming latest supported version (%d.%d.%d).",
-		       (unicode_version >> 16) & 0xff,
-		       (unicode_version >> 8) & 0xff,
-		       (unicode_version & 0xff));
-	}
+	if (!utf8version_is_supported(version))
+		return ERR_PTR(-EINVAL);
 
 	um = kzalloc(sizeof(struct unicode_map), GFP_KERNEL);
 	if (!um)
 		return ERR_PTR(-ENOMEM);
-	um->version = unicode_version;
+	um->version = version;
 	return um;
 }
 EXPORT_SYMBOL(utf8_load);
diff --git a/fs/unicode/utf8-norm.c b/fs/unicode/utf8-norm.c
index 1d2d2e5b906a..12abf89ae6ec 100644
--- a/fs/unicode/utf8-norm.c
+++ b/fs/unicode/utf8-norm.c
@@ -15,13 +15,12 @@ struct utf8data {
 #include "utf8data.h"
 #undef __INCLUDED_FROM_UTF8NORM_C__
 
-int utf8version_is_supported(u8 maj, u8 min, u8 rev)
+int utf8version_is_supported(unsigned int version)
 {
 	int i = ARRAY_SIZE(utf8agetab) - 1;
-	unsigned int sb_utf8version = UNICODE_AGE(maj, min, rev);
 
 	while (i >= 0 && utf8agetab[i] != 0) {
-		if (sb_utf8version == utf8agetab[i])
+		if (version == utf8agetab[i])
 			return 1;
 		i--;
 	}
@@ -29,12 +28,6 @@ int utf8version_is_supported(u8 maj, u8 min, u8 rev)
 }
 EXPORT_SYMBOL(utf8version_is_supported);
 
-int utf8version_latest(void)
-{
-	return utf8vers;
-}
-EXPORT_SYMBOL(utf8version_latest);
-
 /*
  * UTF-8 valid ranges.
  *
diff --git a/fs/unicode/utf8-selftest.c b/fs/unicode/utf8-selftest.c
index 6fe8af7edccb..37f33890e012 100644
--- a/fs/unicode/utf8-selftest.c
+++ b/fs/unicode/utf8-selftest.c
@@ -235,7 +235,7 @@ static void check_utf8_nfdicf(void)
 static void check_utf8_comparisons(void)
 {
 	int i;
-	struct unicode_map *table = utf8_load("12.1.0");
+	struct unicode_map *table = utf8_load(UNICODE_AGE(12, 1, 0));
 
 	if (IS_ERR(table)) {
 		pr_err("%s: Unable to load utf8 %d.%d.%d. Skipping.\n",
@@ -269,18 +269,19 @@ static void check_utf8_comparisons(void)
 static void check_supported_versions(void)
 {
 	/* Unicode 7.0.0 should be supported. */
-	test(utf8version_is_supported(7, 0, 0));
+	test(utf8version_is_supported(UNICODE_AGE(7, 0, 0)));
 
 	/* Unicode 9.0.0 should be supported. */
-	test(utf8version_is_supported(9, 0, 0));
+	test(utf8version_is_supported(UNICODE_AGE(9, 0, 0)));
 
 	/* Unicode 1x.0.0 (the latest version) should be supported. */
-	test(utf8version_is_supported(latest_maj, latest_min, latest_rev));
+	test(utf8version_is_supported(
+		UNICODE_AGE(latest_maj, latest_min, latest_rev)));
 
 	/* Next versions don't exist. */
-	test(!utf8version_is_supported(13, 0, 0));
-	test(!utf8version_is_supported(0, 0, 0));
-	test(!utf8version_is_supported(-1, -1, -1));
+	test(!utf8version_is_supported(UNICODE_AGE(13, 0, 0)));
+	test(!utf8version_is_supported(UNICODE_AGE(0, 0, 0)));
+	test(!utf8version_is_supported(UNICODE_AGE(-1, -1, -1)));
 }
 
 static int __init init_test_ucd(void)
diff --git a/fs/unicode/utf8n.h b/fs/unicode/utf8n.h
index 0acd530c2c79..85a7bebf6927 100644
--- a/fs/unicode/utf8n.h
+++ b/fs/unicode/utf8n.h
@@ -11,19 +11,9 @@
 #include <linux/export.h>
 #include <linux/string.h>
 #include <linux/module.h>
+#include <linux/unicode.h>
 
-/* Encoding a unicode version number as a single unsigned int. */
-#define UNICODE_MAJ_SHIFT		(16)
-#define UNICODE_MIN_SHIFT		(8)
-
-#define UNICODE_AGE(MAJ, MIN, REV)			\
-	(((unsigned int)(MAJ) << UNICODE_MAJ_SHIFT) |	\
-	 ((unsigned int)(MIN) << UNICODE_MIN_SHIFT) |	\
-	 ((unsigned int)(REV)))
-
-/* Highest unicode version supported by the data tables. */
-extern int utf8version_is_supported(u8 maj, u8 min, u8 rev);
-extern int utf8version_latest(void);
+int utf8version_is_supported(unsigned int version);
 
 /*
  * Look for the correct const struct utf8data for a unicode version.
diff --git a/include/linux/unicode.h b/include/linux/unicode.h
index 0744f81c4b5f..a5cc44a8f90c 100644
--- a/include/linux/unicode.h
+++ b/include/linux/unicode.h
@@ -5,6 +5,15 @@
 #include <linux/init.h>
 #include <linux/dcache.h>
 
+/* Encoding a unicode version number as a single unsigned int. */
+#define UNICODE_MAJ_SHIFT		(16)
+#define UNICODE_MIN_SHIFT		(8)
+
+#define UNICODE_AGE(MAJ, MIN, REV)			\
+	(((unsigned int)(MAJ) << UNICODE_MAJ_SHIFT) |	\
+	 ((unsigned int)(MIN) << UNICODE_MIN_SHIFT) |	\
+	 ((unsigned int)(REV)))
+
 struct unicode_map {
 	unsigned int version;
 };
@@ -29,7 +38,7 @@ int utf8_casefold(const struct unicode_map *um, const struct qstr *str,
 int utf8_casefold_hash(const struct unicode_map *um, const void *salt,
 		       struct qstr *str);
 
-struct unicode_map *utf8_load(const char *version);
+struct unicode_map *utf8_load(unsigned int version);
 void utf8_unload(struct unicode_map *um);
 
 #endif /* _LINUX_UNICODE_H */
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
