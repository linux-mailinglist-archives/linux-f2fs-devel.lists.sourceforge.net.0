Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B3B3467ED
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Mar 2021 19:43:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lOlzd-0002dr-4q; Tue, 23 Mar 2021 18:43:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <shreeya.patel@collabora.com>) id 1lOlq4-00021G-14
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Mar 2021 18:33:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BCDddc66HLg1FkBcQrgR42yrmo95nxmmMJmzEpb3A5A=; b=EAiyEgc34I/+SwRrQC/dUZM6C5
 pFbJO2ll51k7/QtF/IFNWuec/18jIF+a6gokDH44tAsPS9hwSfgqNW5O58ehlcUk/RxklhW/vKRof
 f2wauTcdafwz55NkGPztLbYiKS6kk4GYsSbYUOHVNg8Wpn9srU7Yg+oqJVotTPhCHeqA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BCDddc66HLg1FkBcQrgR42yrmo95nxmmMJmzEpb3A5A=; b=i2DggJRmB5+z/eN0l2vvyal+wE
 CyVA9KdVKl4Ga86e4evogE/teCnGng+zie82Ajqxiz2AFLBLySmHXT6aAQVJgr3XsXTK80fu8VjZo
 NxBjuyW5C0THegHcezUMvUUqcqNfApO4heQViBSCcbxoyEldd/EuwOfxFAVvkY3v+HUM=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lOlq1-0007EF-8Z
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Mar 2021 18:33:11 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2401:4900:5170:240f:f606:c194:2a1c:c147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: shreeya)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DA5631F44A67;
 Tue, 23 Mar 2021 18:32:53 +0000 (GMT)
From: Shreeya Patel <shreeya.patel@collabora.com>
To: tytso@mit.edu, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 chao@kernel.org, krisman@collabora.com, ebiggers@google.com,
 drosen@google.com, ebiggers@kernel.org, yuchao0@huawei.com
Date: Wed, 24 Mar 2021 00:01:59 +0530
Message-Id: <20210323183201.812944-4-shreeya.patel@collabora.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323183201.812944-1-shreeya.patel@collabora.com>
References: <20210323183201.812944-1-shreeya.patel@collabora.com>
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1lOlq1-0007EF-8Z
Subject: [f2fs-dev] [PATCH v3 3/5] fs: unicode: Rename function names from
 utf8 to unicode
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 andre.almeida@collabora.com, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Rename the function names from utf8 to unicode for taking the first step
towards the transformation of utf8-core file into the unicode subsystem
layer file.

Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
---
 fs/ext4/hash.c             |  2 +-
 fs/ext4/namei.c            | 12 ++++----
 fs/ext4/super.c            |  6 ++--
 fs/f2fs/dir.c              | 12 ++++----
 fs/f2fs/super.c            |  6 ++--
 fs/libfs.c                 |  6 ++--
 fs/unicode/utf8-core.c     | 57 +++++++++++++++++++-------------------
 fs/unicode/utf8-selftest.c |  8 +++---
 include/linux/unicode.h    | 32 ++++++++++-----------
 9 files changed, 70 insertions(+), 71 deletions(-)

diff --git a/fs/ext4/hash.c b/fs/ext4/hash.c
index a92eb79de..8890a76ab 100644
--- a/fs/ext4/hash.c
+++ b/fs/ext4/hash.c
@@ -285,7 +285,7 @@ int ext4fs_dirhash(const struct inode *dir, const char *name, int len,
 		if (!buff)
 			return -ENOMEM;
 
-		dlen = utf8_casefold(um, &qstr, buff, PATH_MAX);
+		dlen = unicode_casefold(um, &qstr, buff, PATH_MAX);
 		if (dlen < 0) {
 			kfree(buff);
 			goto opaque_seq;
diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 686bf982c..dde5ce795 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1290,9 +1290,9 @@ int ext4_ci_compare(const struct inode *parent, const struct qstr *name,
 	int ret;
 
 	if (quick)
-		ret = utf8_strncasecmp_folded(um, name, entry);
+		ret = unicode_strncasecmp_folded(um, name, entry);
 	else
-		ret = utf8_strncasecmp(um, name, entry);
+		ret = unicode_strncasecmp(um, name, entry);
 
 	if (ret < 0) {
 		/* Handle invalid character sequence as either an error
@@ -1324,9 +1324,9 @@ void ext4_fname_setup_ci_filename(struct inode *dir, const struct qstr *iname,
 	if (!cf_name->name)
 		return;
 
-	len = utf8_casefold(dir->i_sb->s_encoding,
-			    iname, cf_name->name,
-			    EXT4_NAME_LEN);
+	len = unicode_casefold(dir->i_sb->s_encoding,
+			       iname, cf_name->name,
+			       EXT4_NAME_LEN);
 	if (len <= 0) {
 		kfree(cf_name->name);
 		cf_name->name = NULL;
@@ -2201,7 +2201,7 @@ static int ext4_add_entry(handle_t *handle, struct dentry *dentry,
 
 #ifdef CONFIG_UNICODE
 	if (sb_has_strict_encoding(sb) && IS_CASEFOLDED(dir) &&
-	    sb->s_encoding && utf8_validate(sb->s_encoding, &dentry->d_name))
+	    sb->s_encoding && unicode_validate(sb->s_encoding, &dentry->d_name))
 		return -EINVAL;
 #endif
 
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index e438d14f9..853aeb294 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1260,7 +1260,7 @@ static void ext4_put_super(struct super_block *sb)
 	fscrypt_free_dummy_policy(&sbi->s_dummy_enc_policy);
 #ifdef CONFIG_UNICODE
 	if (sb->s_encoding)
-		utf8_unload(sb->s_encoding);
+		unicode_unload(sb->s_encoding);
 #endif
 	kfree(sbi);
 }
@@ -4305,7 +4305,7 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
 			goto failed_mount;
 		}
 
-		encoding = utf8_load(encoding_info->version);
+		encoding = unicode_load(encoding_info->version);
 		if (IS_ERR(encoding)) {
 			ext4_msg(sb, KERN_ERR,
 				 "can't mount with superblock charset: %s-%s "
@@ -5167,7 +5167,7 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
 
 #ifdef CONFIG_UNICODE
 	if (sb->s_encoding)
-		utf8_unload(sb->s_encoding);
+		unicode_unload(sb->s_encoding);
 #endif
 
 #ifdef CONFIG_QUOTA
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index e6270a867..f160f9dd6 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -84,10 +84,10 @@ int f2fs_init_casefolded_name(const struct inode *dir,
 						   GFP_NOFS);
 		if (!fname->cf_name.name)
 			return -ENOMEM;
-		fname->cf_name.len = utf8_casefold(sb->s_encoding,
-						   fname->usr_fname,
-						   fname->cf_name.name,
-						   F2FS_NAME_LEN);
+		fname->cf_name.len = unicode_casefold(sb->s_encoding,
+						      fname->usr_fname,
+						      fname->cf_name.name,
+						      F2FS_NAME_LEN);
 		if ((int)fname->cf_name.len <= 0) {
 			kfree(fname->cf_name.name);
 			fname->cf_name.name = NULL;
@@ -237,7 +237,7 @@ static int f2fs_match_ci_name(const struct inode *dir, const struct qstr *name,
 		entry.len = decrypted_name.len;
 	}
 
-	res = utf8_strncasecmp_folded(um, name, &entry);
+	res = unicode_strncasecmp_folded(um, name, &entry);
 	/*
 	 * In strict mode, ignore invalid names.  In non-strict mode,
 	 * fall back to treating them as opaque byte sequences.
@@ -246,7 +246,7 @@ static int f2fs_match_ci_name(const struct inode *dir, const struct qstr *name,
 		res = name->len == entry.len &&
 				memcmp(name->name, entry.name, name->len) == 0;
 	} else {
-		/* utf8_strncasecmp_folded returns 0 on match */
+		/* unicode_strncasecmp_folded returns 0 on match */
 		res = (res == 0);
 	}
 out:
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 0a04983c2..a0cd9bfa4 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1431,7 +1431,7 @@ static void f2fs_put_super(struct super_block *sb)
 		kvfree(sbi->write_io[i]);
 #ifdef CONFIG_UNICODE
 	if (sb->s_encoding)
-		utf8_unload(sb->s_encoding);
+		unicode_unload(sb->s_encoding);
 #endif
 	kfree(sbi);
 }
@@ -3561,7 +3561,7 @@ static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
 			return -EINVAL;
 		}
 
-		encoding = utf8_load(encoding_info->version);
+		encoding = unicode_load(encoding_info->version);
 		if (IS_ERR(encoding)) {
 			f2fs_err(sbi,
 				 "can't mount with superblock charset: %s-%s "
@@ -4075,7 +4075,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 
 #ifdef CONFIG_UNICODE
 	if (sb->s_encoding) {
-		utf8_unload(sb->s_encoding);
+		unicode_unload(sb->s_encoding);
 		sb->s_encoding = NULL;
 	}
 #endif
diff --git a/fs/libfs.c b/fs/libfs.c
index e2de5401a..766556165 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1404,7 +1404,7 @@ static int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
 	 * If the dentry name is stored in-line, then it may be concurrently
 	 * modified by a rename.  If this happens, the VFS will eventually retry
 	 * the lookup, so it doesn't matter what ->d_compare() returns.
-	 * However, it's unsafe to call utf8_strncasecmp() with an unstable
+	 * However, it's unsafe to call unicode_strncasecmp() with an unstable
 	 * string.  Therefore, we have to copy the name into a temporary buffer.
 	 */
 	if (len <= DNAME_INLINE_LEN - 1) {
@@ -1414,7 +1414,7 @@ static int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
 		/* prevent compiler from optimizing out the temporary buffer */
 		barrier();
 	}
-	ret = utf8_strncasecmp(um, name, &qstr);
+	ret = unicode_strncasecmp(um, name, &qstr);
 	if (ret >= 0)
 		return ret;
 
@@ -1443,7 +1443,7 @@ static int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
 	if (!dir || !needs_casefold(dir))
 		return 0;
 
-	ret = utf8_casefold_hash(um, dentry, str);
+	ret = unicode_casefold_hash(um, dentry, str);
 	if (ret < 0 && sb_has_strict_encoding(sb))
 		return -EINVAL;
 	return 0;
diff --git a/fs/unicode/utf8-core.c b/fs/unicode/utf8-core.c
index 706f086bb..686e95e90 100644
--- a/fs/unicode/utf8-core.c
+++ b/fs/unicode/utf8-core.c
@@ -10,7 +10,7 @@
 
 #include "utf8n.h"
 
-int utf8_validate(const struct unicode_map *um, const struct qstr *str)
+int unicode_validate(const struct unicode_map *um, const struct qstr *str)
 {
 	const struct utf8data *data = utf8nfdi(um->version);
 
@@ -18,10 +18,10 @@ int utf8_validate(const struct unicode_map *um, const struct qstr *str)
 		return -1;
 	return 0;
 }
-EXPORT_SYMBOL(utf8_validate);
+EXPORT_SYMBOL(unicode_validate);
 
-int utf8_strncmp(const struct unicode_map *um,
-		 const struct qstr *s1, const struct qstr *s2)
+int unicode_strncmp(const struct unicode_map *um,
+		    const struct qstr *s1, const struct qstr *s2)
 {
 	const struct utf8data *data = utf8nfdi(um->version);
 	struct utf8cursor cur1, cur2;
@@ -45,10 +45,10 @@ int utf8_strncmp(const struct unicode_map *um,
 
 	return 0;
 }
-EXPORT_SYMBOL(utf8_strncmp);
+EXPORT_SYMBOL(unicode_strncmp);
 
-int utf8_strncasecmp(const struct unicode_map *um,
-		     const struct qstr *s1, const struct qstr *s2)
+int unicode_strncasecmp(const struct unicode_map *um,
+			const struct qstr *s1, const struct qstr *s2)
 {
 	const struct utf8data *data = utf8nfdicf(um->version);
 	struct utf8cursor cur1, cur2;
@@ -72,14 +72,14 @@ int utf8_strncasecmp(const struct unicode_map *um,
 
 	return 0;
 }
-EXPORT_SYMBOL(utf8_strncasecmp);
+EXPORT_SYMBOL(unicode_strncasecmp);
 
 /* String cf is expected to be a valid UTF-8 casefolded
  * string.
  */
-int utf8_strncasecmp_folded(const struct unicode_map *um,
-			    const struct qstr *cf,
-			    const struct qstr *s1)
+int unicode_strncasecmp_folded(const struct unicode_map *um,
+			       const struct qstr *cf,
+			       const struct qstr *s1)
 {
 	const struct utf8data *data = utf8nfdicf(um->version);
 	struct utf8cursor cur1;
@@ -100,10 +100,10 @@ int utf8_strncasecmp_folded(const struct unicode_map *um,
 
 	return 0;
 }
-EXPORT_SYMBOL(utf8_strncasecmp_folded);
+EXPORT_SYMBOL(unicode_strncasecmp_folded);
 
-int utf8_casefold(const struct unicode_map *um, const struct qstr *str,
-		  unsigned char *dest, size_t dlen)
+int unicode_casefold(const struct unicode_map *um, const struct qstr *str,
+		     unsigned char *dest, size_t dlen)
 {
 	const struct utf8data *data = utf8nfdicf(um->version);
 	struct utf8cursor cur;
@@ -123,10 +123,10 @@ int utf8_casefold(const struct unicode_map *um, const struct qstr *str,
 	}
 	return -EINVAL;
 }
-EXPORT_SYMBOL(utf8_casefold);
+EXPORT_SYMBOL(unicode_casefold);
 
-int utf8_casefold_hash(const struct unicode_map *um, const void *salt,
-		       struct qstr *str)
+int unicode_casefold_hash(const struct unicode_map *um, const void *salt,
+			  struct qstr *str)
 {
 	const struct utf8data *data = utf8nfdicf(um->version);
 	struct utf8cursor cur;
@@ -144,10 +144,10 @@ int utf8_casefold_hash(const struct unicode_map *um, const void *salt,
 	str->hash = end_name_hash(hash);
 	return 0;
 }
-EXPORT_SYMBOL(utf8_casefold_hash);
+EXPORT_SYMBOL(unicode_casefold_hash);
 
-int utf8_normalize(const struct unicode_map *um, const struct qstr *str,
-		   unsigned char *dest, size_t dlen)
+int unicode_normalize(const struct unicode_map *um, const struct qstr *str,
+		      unsigned char *dest, size_t dlen)
 {
 	const struct utf8data *data = utf8nfdi(um->version);
 	struct utf8cursor cur;
@@ -167,11 +167,10 @@ int utf8_normalize(const struct unicode_map *um, const struct qstr *str,
 	}
 	return -EINVAL;
 }
+EXPORT_SYMBOL(unicode_normalize);
 
-EXPORT_SYMBOL(utf8_normalize);
-
-static int utf8_parse_version(const char *version, unsigned int *maj,
-			      unsigned int *min, unsigned int *rev)
+static int unicode_parse_version(const char *version, unsigned int *maj,
+				 unsigned int *min, unsigned int *rev)
 {
 	substring_t args[3];
 	char version_string[12];
@@ -195,7 +194,7 @@ static int utf8_parse_version(const char *version, unsigned int *maj,
 	return 0;
 }
 
-struct unicode_map *utf8_load(const char *version)
+struct unicode_map *unicode_load(const char *version)
 {
 	struct unicode_map *um = NULL;
 	int unicode_version;
@@ -203,7 +202,7 @@ struct unicode_map *utf8_load(const char *version)
 	if (version) {
 		unsigned int maj, min, rev;
 
-		if (utf8_parse_version(version, &maj, &min, &rev) < 0)
+		if (unicode_parse_version(version, &maj, &min, &rev) < 0)
 			return ERR_PTR(-EINVAL);
 
 		if (!utf8version_is_supported(maj, min, rev))
@@ -228,12 +227,12 @@ struct unicode_map *utf8_load(const char *version)
 
 	return um;
 }
-EXPORT_SYMBOL(utf8_load);
+EXPORT_SYMBOL(unicode_load);
 
-void utf8_unload(struct unicode_map *um)
+void unicode_unload(struct unicode_map *um)
 {
 	kfree(um);
 }
-EXPORT_SYMBOL(utf8_unload);
+EXPORT_SYMBOL(unicode_unload);
 
 MODULE_LICENSE("GPL v2");
diff --git a/fs/unicode/utf8-selftest.c b/fs/unicode/utf8-selftest.c
index 6fe8af7ed..796c1ed92 100644
--- a/fs/unicode/utf8-selftest.c
+++ b/fs/unicode/utf8-selftest.c
@@ -235,7 +235,7 @@ static void check_utf8_nfdicf(void)
 static void check_utf8_comparisons(void)
 {
 	int i;
-	struct unicode_map *table = utf8_load("12.1.0");
+	struct unicode_map *table = unicode_load("12.1.0");
 
 	if (IS_ERR(table)) {
 		pr_err("%s: Unable to load utf8 %d.%d.%d. Skipping.\n",
@@ -249,7 +249,7 @@ static void check_utf8_comparisons(void)
 		const struct qstr s2 = {.name = nfdi_test_data[i].dec,
 					.len = sizeof(nfdi_test_data[i].dec)};
 
-		test_f(!utf8_strncmp(table, &s1, &s2),
+		test_f(!unicode_strncmp(table, &s1, &s2),
 		       "%s %s comparison mismatch\n", s1.name, s2.name);
 	}
 
@@ -259,11 +259,11 @@ static void check_utf8_comparisons(void)
 		const struct qstr s2 = {.name = nfdicf_test_data[i].ncf,
 					.len = sizeof(nfdicf_test_data[i].ncf)};
 
-		test_f(!utf8_strncasecmp(table, &s1, &s2),
+		test_f(!unicode_strncasecmp(table, &s1, &s2),
 		       "%s %s comparison mismatch\n", s1.name, s2.name);
 	}
 
-	utf8_unload(table);
+	unicode_unload(table);
 }
 
 static void check_supported_versions(void)
diff --git a/include/linux/unicode.h b/include/linux/unicode.h
index 74484d44c..de23f9ee7 100644
--- a/include/linux/unicode.h
+++ b/include/linux/unicode.h
@@ -10,27 +10,27 @@ struct unicode_map {
 	int version;
 };
 
-int utf8_validate(const struct unicode_map *um, const struct qstr *str);
+int unicode_validate(const struct unicode_map *um, const struct qstr *str);
 
-int utf8_strncmp(const struct unicode_map *um,
-		 const struct qstr *s1, const struct qstr *s2);
+int unicode_strncmp(const struct unicode_map *um,
+		    const struct qstr *s1, const struct qstr *s2);
 
-int utf8_strncasecmp(const struct unicode_map *um,
-		 const struct qstr *s1, const struct qstr *s2);
-int utf8_strncasecmp_folded(const struct unicode_map *um,
-			    const struct qstr *cf,
-			    const struct qstr *s1);
+int unicode_strncasecmp(const struct unicode_map *um,
+			const struct qstr *s1, const struct qstr *s2);
+int unicode_strncasecmp_folded(const struct unicode_map *um,
+			       const struct qstr *cf,
+			       const struct qstr *s1);
 
-int utf8_normalize(const struct unicode_map *um, const struct qstr *str,
-		   unsigned char *dest, size_t dlen);
+int unicode_normalize(const struct unicode_map *um, const struct qstr *str,
+		      unsigned char *dest, size_t dlen);
 
-int utf8_casefold(const struct unicode_map *um, const struct qstr *str,
-		  unsigned char *dest, size_t dlen);
+int unicode_casefold(const struct unicode_map *um, const struct qstr *str,
+		     unsigned char *dest, size_t dlen);
 
-int utf8_casefold_hash(const struct unicode_map *um, const void *salt,
-		       struct qstr *str);
+int unicode_casefold_hash(const struct unicode_map *um, const void *salt,
+			  struct qstr *str);
 
-struct unicode_map *utf8_load(const char *version);
-void utf8_unload(struct unicode_map *um);
+struct unicode_map *unicode_load(const char *version);
+void unicode_unload(struct unicode_map *um);
 
 #endif /* _LINUX_UNICODE_H */
-- 
2.24.3 (Apple Git-128)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
