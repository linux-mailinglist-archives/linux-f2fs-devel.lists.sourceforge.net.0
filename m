Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC19236A5B7
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Apr 2021 10:27:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1laa6d-00022N-7h; Sun, 25 Apr 2021 08:27:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <shreeya.patel@collabora.com>) id 1laa6H-000206-NY
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 25 Apr 2021 08:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qel2XdOtfAvO3On3BmrTxkOC6+dQs5iZhTsIvAI79SQ=; b=B0RWP08PU2jXsxlIK5TR+lBnfP
 ezhaGAM2RpZyTt2bqSJZ05AoH7s5cExfKEL9cYrZLWtbSlOYI8u1AV96sIsleSSR8i5u3vehfjPXV
 AAP16SZPsEm8D2Dx7SXM5iVv5PVQsWd6llwp0ZoNZFXCCZEPr6DxcLrX6B+6lwELxxRo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qel2XdOtfAvO3On3BmrTxkOC6+dQs5iZhTsIvAI79SQ=; b=Jzv0f4AzXWqiXhCddvGIpO/qbK
 KfqXAUajrEGN8DPMsPWHc6cqnQWJ16AWBg2k6ISrZpAWmsmFUYUYlQKAXZRXsvSy6ADk6r/NpSjr9
 rxcyov9oeW5gwsoGtNmCbnNom4HTZv/rCJLtbvUjXGXpbP0orY8hZHJtRZKYYQOG+Cno=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1laa67-005mE7-S3
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 25 Apr 2021 08:26:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: shreeya) with ESMTPSA id 7B01A1F43B29
From: Shreeya Patel <shreeya.patel@collabora.com>
To: tytso@mit.edu, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 chao@kernel.org, krisman@collabora.com, ebiggers@google.com,
 drosen@google.com, ebiggers@kernel.org, yuchao0@huawei.com
Date: Sat, 24 Apr 2021 02:21:36 +0530
Message-Id: <20210423205136.1015456-5-shreeya.patel@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210423205136.1015456-1-shreeya.patel@collabora.com>
References: <20210423205136.1015456-1-shreeya.patel@collabora.com>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.5 DATE_IN_PAST_24_48     Date: is 24 to 48 hours before Received: date
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1laa67-005mE7-S3
Subject: [f2fs-dev] [PATCH v8 4/4] fs: unicode: Add utf8 module and a
 unicode layer
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

utf8data.h_shipped has a large database table which is an auto-generated
decodification trie for the unicode normalization functions.
We can avoid carrying this large table in the kernel unless it is required
by the filesystem during boot process.

Hence, make UTF-8 encoding loadable by converting it into a module and
also add built-in UTF-8 support option for compiling it into the
kernel whenever required by the filesystem.

Modify the file called unicode-core which will act as a layer for
unicode subsystem. It will be responsible for loading the UTF-8 module
and accessing it's functions.

Currently, only UTF-8 encoding is supported but if any other encodings
are supported in future then the layer file would be responsible for
loading the desired encoding module.

Also, indirect calls using function pointers are slow, use static calls to
avoid overhead caused in case of repeated indirect calls. Static calls
improves the performance by directly calling the functions as opposed to
indirect calls.

Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
---
Changes in v8
  - Improve the commit messages to better understand the use of built-in option.
  - Improve the help text in Kconfig for avoiding contradictory statements.
  - Make spinlock definition static.
  - Use int instead of bool to avoid gcc warning.
  - Add a comment for decribing why we are using try_then_request_module()
    instead of request_module()

Changes in v7
  - Update the help text in Kconfig
  - Handle the unicode_load_static_call function failure by decrementing
    the reference.
  - Correct the code for handling built-in utf8 option as well.
  - Correct the synchronization for accessing utf8mod.
  - Make changes to unicode_unload() for handling the situation where
    utf8mod != NULL and um == NULL.

Changes in v6
  - Add spinlock to protect utf8mod and avoid NULL pointer
    dereference.
  - Change the static call function names for being consistent with
    kernel coding style.
  - Merge the unicode_load_module function with unicode_load as it is
    not really needed to have a separate function.
  - Use try_then_module_get instead of module_get to avoid loading the
    module even when it is already loaded.
  - Improve the commit message.

Changes in v5
  - Rename global variables and default static call functions for better
    understanding
  - Make only config UNICODE_UTF8 visible and config UNICODE to be always
    enabled provided UNICODE_UTF8 is enabled.  
  - Improve the documentation for Kconfig
  - Improve the commit message.
 
Changes in v4
  - Return error from the static calls instead of doing nothing and
    succeeding even without loading the module.
  - Remove the complete usage of utf8_ops and use static calls at all
    places.
  - Restore the static calls to default values when module is unloaded.
  - Decrement the reference of module after calling the unload function.
  - Remove spinlock as there will be no race conditions after removing
    utf8_ops.

Changes in v3
  - Add a patch which checks if utf8 is loaded before calling utf8_unload()
    in ext4 and f2fs filesystems
  - Return error if strscpy() returns value < 0
  - Correct the conditions to prevent NULL pointer dereference while
    accessing functions via utf8_ops variable.
  - Add spinlock to avoid race conditions.
  - Use static_call() for preventing speculative execution attacks.

Changes in v2
  - Remove the duplicate file from the last patch.
  - Make the wrapper functions inline.
  - Remove msleep and use try_module_get() and module_put()
    for ensuring that module is loaded correctly and also
    doesn't get unloaded while in use.
  - Resolve the warning reported by kernel test robot.
  - Resolve all the checkpatch.pl warnings.

 fs/unicode/Kconfig        |  26 +++-
 fs/unicode/Makefile       |   5 +-
 fs/unicode/unicode-core.c | 310 +++++++++++++++-----------------------
 fs/unicode/unicode-utf8.c | 264 ++++++++++++++++++++++++++++++++
 include/linux/unicode.h   |  96 ++++++++++--
 5 files changed, 496 insertions(+), 205 deletions(-)
 create mode 100644 fs/unicode/unicode-utf8.c

diff --git a/fs/unicode/Kconfig b/fs/unicode/Kconfig
index 2c27b9a5cd6c..250b3671a0e2 100644
--- a/fs/unicode/Kconfig
+++ b/fs/unicode/Kconfig
@@ -2,13 +2,31 @@
 #
 # UTF-8 normalization
 #
+# CONFIG_UNICODE will be automatically enabled if CONFIG_UNICODE_UTF8
+# is enabled. This config option adds the unicode subsystem layer which loads
+# the UTF-8 module whenever any filesystem needs it.
 config UNICODE
-	bool "UTF-8 normalization and casefolding support"
+	bool
+
+config UNICODE_UTF8
+	tristate "UTF-8 support for native Case-Insensitive filesystems"
+	select UNICODE
 	help
-	  Say Y here to enable UTF-8 NFD normalization and NFD+CF casefolding
-	  support.
+	  Say M here to enable UTF-8 NFD normalization and NFD+CF casefolding
+	  support as a loadable module or say Y for building it into the kernel.
+	  It is currently supported by EXT4 and F2FS filesystems.
+
+	  utf8data.h_shipped has a large database table which is an
+	  auto-generated decodification trie for the unicode normalization
+	  functions. Enabling UNICODE_UTF8 as M will allow you to avoid
+	  carrying this large table into the kernel and module will only be
+	  loaded whenever required by any filesystem.
+	  Please note, in this case utf8 module will only be available after
+	  booting into the compiled kernel. If your filesystem requires it to
+	  have utf8 during boot time then you should have it built into the
+	  kernel by saying Y here to avoid boot failure.
 
 config UNICODE_NORMALIZATION_SELFTEST
 	tristate "Test UTF-8 normalization support"
-	depends on UNICODE
+	depends on UNICODE_UTF8
 	default n
diff --git a/fs/unicode/Makefile b/fs/unicode/Makefile
index fbf9a629ed0d..49d50083e6ee 100644
--- a/fs/unicode/Makefile
+++ b/fs/unicode/Makefile
@@ -1,11 +1,14 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_UNICODE) += unicode.o
+obj-$(CONFIG_UNICODE_UTF8) += utf8.o
 obj-$(CONFIG_UNICODE_NORMALIZATION_SELFTEST) += utf8-selftest.o
 
-unicode-y := utf8-norm.o unicode-core.o
+unicode-y := unicode-core.o
+utf8-y := unicode-utf8.o utf8-norm.o
 
 $(obj)/utf8-norm.o: $(obj)/utf8data.h
+$(obj)/unicode-utf8.o: $(obj)/utf8-norm.o
 
 # In the normal build, the checked-in utf8data.h is just shipped.
 #
diff --git a/fs/unicode/unicode-core.c b/fs/unicode/unicode-core.c
index 730dbaedf593..bf442446ed89 100644
--- a/fs/unicode/unicode-core.c
+++ b/fs/unicode/unicode-core.c
@@ -1,228 +1,145 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/module.h>
 #include <linux/kernel.h>
-#include <linux/string.h>
 #include <linux/slab.h>
-#include <linux/parser.h>
 #include <linux/errno.h>
 #include <linux/unicode.h>
-#include <linux/stringhash.h>
+#include <linux/spinlock.h>
 
-#include "utf8n.h"
+static DEFINE_SPINLOCK(utf8mod_lock);
 
-int unicode_validate(const struct unicode_map *um, const struct qstr *str)
-{
-	const struct utf8data *data = utf8nfdi(um->version);
+static struct module *utf8mod;
+static bool utf8mod_loaded;
 
-	if (utf8nlen(data, str->name, str->len) < 0)
-		return -1;
-	return 0;
+int unicode_validate_default(const struct unicode_map *um,
+			     const struct qstr *str)
+{
+	WARN_ON(1);
+	return -EIO;
 }
-EXPORT_SYMBOL(unicode_validate);
+EXPORT_SYMBOL(unicode_validate_default);
 
-int unicode_strncmp(const struct unicode_map *um,
-		    const struct qstr *s1, const struct qstr *s2)
+int unicode_strncmp_default(const struct unicode_map *um,
+			    const struct qstr *s1,
+			    const struct qstr *s2)
 {
-	const struct utf8data *data = utf8nfdi(um->version);
-	struct utf8cursor cur1, cur2;
-	int c1, c2;
-
-	if (utf8ncursor(&cur1, data, s1->name, s1->len) < 0)
-		return -EINVAL;
-
-	if (utf8ncursor(&cur2, data, s2->name, s2->len) < 0)
-		return -EINVAL;
-
-	do {
-		c1 = utf8byte(&cur1);
-		c2 = utf8byte(&cur2);
-
-		if (c1 < 0 || c2 < 0)
-			return -EINVAL;
-		if (c1 != c2)
-			return 1;
-	} while (c1);
-
-	return 0;
+	WARN_ON(1);
+	return -EIO;
 }
-EXPORT_SYMBOL(unicode_strncmp);
+EXPORT_SYMBOL(unicode_strncmp_default);
 
-int unicode_strncasecmp(const struct unicode_map *um,
-			const struct qstr *s1, const struct qstr *s2)
+int unicode_strncasecmp_default(const struct unicode_map *um,
+				const struct qstr *s1,
+				const struct qstr *s2)
 {
-	const struct utf8data *data = utf8nfdicf(um->version);
-	struct utf8cursor cur1, cur2;
-	int c1, c2;
-
-	if (utf8ncursor(&cur1, data, s1->name, s1->len) < 0)
-		return -EINVAL;
-
-	if (utf8ncursor(&cur2, data, s2->name, s2->len) < 0)
-		return -EINVAL;
-
-	do {
-		c1 = utf8byte(&cur1);
-		c2 = utf8byte(&cur2);
-
-		if (c1 < 0 || c2 < 0)
-			return -EINVAL;
-		if (c1 != c2)
-			return 1;
-	} while (c1);
-
-	return 0;
+	WARN_ON(1);
+	return -EIO;
 }
-EXPORT_SYMBOL(unicode_strncasecmp);
-
-/* String cf is expected to be a valid UTF-8 casefolded
- * string.
- */
-int unicode_strncasecmp_folded(const struct unicode_map *um,
-			       const struct qstr *cf,
-			       const struct qstr *s1)
+EXPORT_SYMBOL(unicode_strncasecmp_default);
+
+int unicode_strncasecmp_folded_default(const struct unicode_map *um,
+				       const struct qstr *cf,
+				       const struct qstr *s1)
 {
-	const struct utf8data *data = utf8nfdicf(um->version);
-	struct utf8cursor cur1;
-	int c1, c2;
-	int i = 0;
-
-	if (utf8ncursor(&cur1, data, s1->name, s1->len) < 0)
-		return -EINVAL;
-
-	do {
-		c1 = utf8byte(&cur1);
-		c2 = cf->name[i++];
-		if (c1 < 0)
-			return -EINVAL;
-		if (c1 != c2)
-			return 1;
-	} while (c1);
-
-	return 0;
+	WARN_ON(1);
+	return -EIO;
 }
-EXPORT_SYMBOL(unicode_strncasecmp_folded);
+EXPORT_SYMBOL(unicode_strncasecmp_folded_default);
 
-int unicode_casefold(const struct unicode_map *um, const struct qstr *str,
-		     unsigned char *dest, size_t dlen)
+int unicode_normalize_default(const struct unicode_map *um,
+			      const struct qstr *str,
+			      unsigned char *dest, size_t dlen)
 {
-	const struct utf8data *data = utf8nfdicf(um->version);
-	struct utf8cursor cur;
-	size_t nlen = 0;
-
-	if (utf8ncursor(&cur, data, str->name, str->len) < 0)
-		return -EINVAL;
-
-	for (nlen = 0; nlen < dlen; nlen++) {
-		int c = utf8byte(&cur);
+	WARN_ON(1);
+	return -EIO;
+}
+EXPORT_SYMBOL(unicode_normalize_default);
 
-		dest[nlen] = c;
-		if (!c)
-			return nlen;
-		if (c == -1)
-			break;
-	}
-	return -EINVAL;
+int unicode_casefold_default(const struct unicode_map *um,
+			     const struct qstr *str,
+			     unsigned char *dest, size_t dlen)
+{
+	WARN_ON(1);
+	return -EIO;
 }
-EXPORT_SYMBOL(unicode_casefold);
+EXPORT_SYMBOL(unicode_casefold_default);
 
-int unicode_casefold_hash(const struct unicode_map *um, const void *salt,
-			  struct qstr *str)
+int unicode_casefold_hash_default(const struct unicode_map *um,
+				  const void *salt, struct qstr *str)
 {
-	const struct utf8data *data = utf8nfdicf(um->version);
-	struct utf8cursor cur;
-	int c;
-	unsigned long hash = init_name_hash(salt);
-
-	if (utf8ncursor(&cur, data, str->name, str->len) < 0)
-		return -EINVAL;
-
-	while ((c = utf8byte(&cur))) {
-		if (c < 0)
-			return -EINVAL;
-		hash = partial_name_hash((unsigned char)c, hash);
-	}
-	str->hash = end_name_hash(hash);
-	return 0;
+	WARN_ON(1);
+	return -EIO;
 }
-EXPORT_SYMBOL(unicode_casefold_hash);
+EXPORT_SYMBOL(unicode_casefold_hash_default);
 
-int unicode_normalize(const struct unicode_map *um, const struct qstr *str,
-		      unsigned char *dest, size_t dlen)
+struct unicode_map *unicode_load_default(const char *version)
 {
-	const struct utf8data *data = utf8nfdi(um->version);
-	struct utf8cursor cur;
-	ssize_t nlen = 0;
+	WARN_ON(1);
+	return ERR_PTR(-EIO);
+}
+EXPORT_SYMBOL(unicode_load_default);
 
-	if (utf8ncursor(&cur, data, str->name, str->len) < 0)
-		return -EINVAL;
+DEFINE_STATIC_CALL(unicode_validate_static_call, unicode_validate_default);
+EXPORT_STATIC_CALL(unicode_validate_static_call);
 
-	for (nlen = 0; nlen < dlen; nlen++) {
-		int c = utf8byte(&cur);
+DEFINE_STATIC_CALL(unicode_strncmp_static_call, unicode_strncmp_default);
+EXPORT_STATIC_CALL(unicode_strncmp_static_call);
 
-		dest[nlen] = c;
-		if (!c)
-			return nlen;
-		if (c == -1)
-			break;
-	}
-	return -EINVAL;
-}
-EXPORT_SYMBOL(unicode_normalize);
+DEFINE_STATIC_CALL(unicode_strncasecmp_static_call,
+		   unicode_strncasecmp_default);
+EXPORT_STATIC_CALL(unicode_strncasecmp_static_call);
 
-static int unicode_parse_version(const char *version, unsigned int *maj,
-				 unsigned int *min, unsigned int *rev)
-{
-	substring_t args[3];
-	char version_string[12];
-	static const struct match_token token[] = {
-		{1, "%d.%d.%d"},
-		{0, NULL}
-	};
-	int ret = strscpy(version_string, version, sizeof(version_string));
+DEFINE_STATIC_CALL(unicode_strncasecmp_folded_static_call,
+		   unicode_strncasecmp_folded_default);
+EXPORT_STATIC_CALL(unicode_strncasecmp_folded_static_call);
 
-	if (ret < 0)
-		return ret;
+DEFINE_STATIC_CALL(unicode_normalize_static_call, unicode_normalize_default);
+EXPORT_STATIC_CALL(unicode_normalize_static_call);
 
-	if (match_token(version_string, token, args) != 1)
-		return -EINVAL;
+DEFINE_STATIC_CALL(unicode_casefold_static_call, unicode_casefold_default);
+EXPORT_STATIC_CALL(unicode_casefold_static_call);
 
-	if (match_int(&args[0], maj) || match_int(&args[1], min) ||
-	    match_int(&args[2], rev))
-		return -EINVAL;
+DEFINE_STATIC_CALL(unicode_casefold_hash_static_call,
+		   unicode_casefold_hash_default);
+EXPORT_STATIC_CALL(unicode_casefold_hash_static_call);
 
-	return 0;
+DEFINE_STATIC_CALL(unicode_load_static_call, unicode_load_default);
+EXPORT_STATIC_CALL(unicode_load_static_call);
+
+static int utf8mod_get(void)
+{
+	int ret;
+
+	spin_lock(&utf8mod_lock);
+	ret = utf8mod_loaded && try_module_get(utf8mod);
+	spin_unlock(&utf8mod_lock);
+	return ret;
 }
 
 struct unicode_map *unicode_load(const char *version)
 {
-	struct unicode_map *um = NULL;
-	int unicode_version;
-
-	if (version) {
-		unsigned int maj, min, rev;
-
-		if (unicode_parse_version(version, &maj, &min, &rev) < 0)
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
+	struct unicode_map *um;
+
+	/*
+	 * try_then_request_module() is used here instead of using
+	 * request_module() because of the following problems that
+	 * could occur with the usage of request_module().
+	 * 1) Multiple calls in parallel to unicode_load() would fail if
+	 * kmod_concurrent_max == 0
+	 * 2) There would be unnecessary memory allocation and userspace
+	 * invocation in call_modprobe() that would always happen even if
+	 * the module is already loaded.
+	 * Hence, using try_then_request_module() would first check if the
+	 * module is already loaded, if not then it calls the request_module()
+	 * and finally would aquire the reference of the loaded module.
+	 */
+	if (!try_then_request_module(utf8mod_get(), "utf8")) {
+		pr_err("Failed to load UTF-8 module\n");
+		return ERR_PTR(-ENODEV);
 	}
-
-	um = kzalloc(sizeof(struct unicode_map), GFP_KERNEL);
-	if (!um)
-		return ERR_PTR(-ENOMEM);
-
-	um->charset = "UTF-8";
-	um->version = unicode_version;
+	um = static_call(unicode_load_static_call)(version);
+	if (IS_ERR(um))
+		module_put(utf8mod);
 
 	return um;
 }
@@ -230,8 +147,29 @@ EXPORT_SYMBOL(unicode_load);
 
 void unicode_unload(struct unicode_map *um)
 {
-	kfree(um);
+	if (um) {
+		kfree(um);
+		module_put(utf8mod);
+	}
 }
 EXPORT_SYMBOL(unicode_unload);
 
+void unicode_register(struct module *owner)
+{
+	spin_lock(&utf8mod_lock);
+	utf8mod = owner;
+	utf8mod_loaded = true;
+	spin_unlock(&utf8mod_lock);
+}
+EXPORT_SYMBOL(unicode_register);
+
+void unicode_unregister(void)
+{
+	spin_lock(&utf8mod_lock);
+	utf8mod = NULL;
+	utf8mod_loaded = false;
+	spin_unlock(&utf8mod_lock);
+}
+EXPORT_SYMBOL(unicode_unregister);
+
 MODULE_LICENSE("GPL v2");
diff --git a/fs/unicode/unicode-utf8.c b/fs/unicode/unicode-utf8.c
new file mode 100644
index 000000000000..e0180f1c5ea8
--- /dev/null
+++ b/fs/unicode/unicode-utf8.c
@@ -0,0 +1,264 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/slab.h>
+#include <linux/parser.h>
+#include <linux/errno.h>
+#include <linux/unicode.h>
+#include <linux/stringhash.h>
+#include <linux/static_call.h>
+
+#include "utf8n.h"
+
+static int utf8_validate(const struct unicode_map *um, const struct qstr *str)
+{
+	const struct utf8data *data = utf8nfdi(um->version);
+
+	if (utf8nlen(data, str->name, str->len) < 0)
+		return -1;
+	return 0;
+}
+
+static int utf8_strncmp(const struct unicode_map *um,
+			const struct qstr *s1, const struct qstr *s2)
+{
+	const struct utf8data *data = utf8nfdi(um->version);
+	struct utf8cursor cur1, cur2;
+	int c1, c2;
+
+	if (utf8ncursor(&cur1, data, s1->name, s1->len) < 0)
+		return -EINVAL;
+
+	if (utf8ncursor(&cur2, data, s2->name, s2->len) < 0)
+		return -EINVAL;
+
+	do {
+		c1 = utf8byte(&cur1);
+		c2 = utf8byte(&cur2);
+
+		if (c1 < 0 || c2 < 0)
+			return -EINVAL;
+		if (c1 != c2)
+			return 1;
+	} while (c1);
+
+	return 0;
+}
+
+static int utf8_strncasecmp(const struct unicode_map *um,
+			    const struct qstr *s1, const struct qstr *s2)
+{
+	const struct utf8data *data = utf8nfdicf(um->version);
+	struct utf8cursor cur1, cur2;
+	int c1, c2;
+
+	if (utf8ncursor(&cur1, data, s1->name, s1->len) < 0)
+		return -EINVAL;
+
+	if (utf8ncursor(&cur2, data, s2->name, s2->len) < 0)
+		return -EINVAL;
+
+	do {
+		c1 = utf8byte(&cur1);
+		c2 = utf8byte(&cur2);
+
+		if (c1 < 0 || c2 < 0)
+			return -EINVAL;
+		if (c1 != c2)
+			return 1;
+	} while (c1);
+
+	return 0;
+}
+
+/* String cf is expected to be a valid UTF-8 casefolded
+ * string.
+ */
+static int utf8_strncasecmp_folded(const struct unicode_map *um,
+				   const struct qstr *cf,
+				   const struct qstr *s1)
+{
+	const struct utf8data *data = utf8nfdicf(um->version);
+	struct utf8cursor cur1;
+	int c1, c2;
+	int i = 0;
+
+	if (utf8ncursor(&cur1, data, s1->name, s1->len) < 0)
+		return -EINVAL;
+
+	do {
+		c1 = utf8byte(&cur1);
+		c2 = cf->name[i++];
+		if (c1 < 0)
+			return -EINVAL;
+		if (c1 != c2)
+			return 1;
+	} while (c1);
+
+	return 0;
+}
+
+static int utf8_casefold(const struct unicode_map *um, const struct qstr *str,
+			 unsigned char *dest, size_t dlen)
+{
+	const struct utf8data *data = utf8nfdicf(um->version);
+	struct utf8cursor cur;
+	size_t nlen = 0;
+
+	if (utf8ncursor(&cur, data, str->name, str->len) < 0)
+		return -EINVAL;
+
+	for (nlen = 0; nlen < dlen; nlen++) {
+		int c = utf8byte(&cur);
+
+		dest[nlen] = c;
+		if (!c)
+			return nlen;
+		if (c == -1)
+			break;
+	}
+	return -EINVAL;
+}
+
+static int utf8_casefold_hash(const struct unicode_map *um, const void *salt,
+			      struct qstr *str)
+{
+	const struct utf8data *data = utf8nfdicf(um->version);
+	struct utf8cursor cur;
+	int c;
+	unsigned long hash = init_name_hash(salt);
+
+	if (utf8ncursor(&cur, data, str->name, str->len) < 0)
+		return -EINVAL;
+
+	while ((c = utf8byte(&cur))) {
+		if (c < 0)
+			return -EINVAL;
+		hash = partial_name_hash((unsigned char)c, hash);
+	}
+	str->hash = end_name_hash(hash);
+	return 0;
+}
+
+static int utf8_normalize(const struct unicode_map *um, const struct qstr *str,
+			  unsigned char *dest, size_t dlen)
+{
+	const struct utf8data *data = utf8nfdi(um->version);
+	struct utf8cursor cur;
+	ssize_t nlen = 0;
+
+	if (utf8ncursor(&cur, data, str->name, str->len) < 0)
+		return -EINVAL;
+
+	for (nlen = 0; nlen < dlen; nlen++) {
+		int c = utf8byte(&cur);
+
+		dest[nlen] = c;
+		if (!c)
+			return nlen;
+		if (c == -1)
+			break;
+	}
+	return -EINVAL;
+}
+
+static int utf8_parse_version(const char *version, unsigned int *maj,
+			      unsigned int *min, unsigned int *rev)
+{
+	substring_t args[3];
+	char version_string[12];
+	static const struct match_token token[] = {
+		{1, "%d.%d.%d"},
+		{0, NULL}
+	};
+
+	int ret = strscpy(version_string, version, sizeof(version_string));
+
+	if (ret < 0)
+		return ret;
+
+	if (match_token(version_string, token, args) != 1)
+		return -EINVAL;
+
+	if (match_int(&args[0], maj) || match_int(&args[1], min) ||
+	    match_int(&args[2], rev))
+		return -EINVAL;
+
+	return 0;
+}
+
+static struct unicode_map *utf8_load(const char *version)
+{
+	struct unicode_map *um = NULL;
+	int unicode_version;
+
+	if (version) {
+		unsigned int maj, min, rev;
+
+		if (utf8_parse_version(version, &maj, &min, &rev) < 0)
+			return ERR_PTR(-EINVAL);
+
+		if (!utf8version_is_supported(maj, min, rev))
+			return ERR_PTR(-EINVAL);
+
+		unicode_version = UNICODE_AGE(maj, min, rev);
+	} else {
+		unicode_version = utf8version_latest();
+		pr_warn("UTF-8 version not specified. Assuming latest supported version (%d.%d.%d).",
+			(unicode_version >> 16) & 0xff,
+			(unicode_version >> 8) & 0xff,
+			(unicode_version & 0xfe));
+	}
+
+	um = kzalloc(sizeof(*um), GFP_KERNEL);
+	if (!um)
+		return ERR_PTR(-ENOMEM);
+
+	um->charset = "UTF-8";
+	um->version = unicode_version;
+
+	return um;
+}
+
+static int __init utf8_init(void)
+{
+	static_call_update(unicode_validate_static_call, utf8_validate);
+	static_call_update(unicode_strncmp_static_call, utf8_strncmp);
+	static_call_update(unicode_strncasecmp_static_call, utf8_strncasecmp);
+	static_call_update(unicode_strncasecmp_folded_static_call,
+			   utf8_strncasecmp_folded);
+	static_call_update(unicode_normalize_static_call, utf8_normalize);
+	static_call_update(unicode_casefold_static_call, utf8_casefold);
+	static_call_update(unicode_casefold_hash_static_call,
+			   utf8_casefold_hash);
+	static_call_update(unicode_load_static_call, utf8_load);
+
+	unicode_register(THIS_MODULE);
+	return 0;
+}
+
+static void __exit utf8_exit(void)
+{
+	static_call_update(unicode_validate_static_call,
+			   unicode_validate_default);
+	static_call_update(unicode_strncmp_static_call, unicode_strncmp_default);
+	static_call_update(unicode_strncasecmp_static_call,
+			   unicode_strncasecmp_default);
+	static_call_update(unicode_strncasecmp_folded_static_call,
+			   unicode_strncasecmp_folded_default);
+	static_call_update(unicode_normalize_static_call,
+			   unicode_normalize_default);
+	static_call_update(unicode_casefold_static_call,
+			   unicode_casefold_default);
+	static_call_update(unicode_casefold_hash_static_call,
+			   unicode_casefold_hash_default);
+	static_call_update(unicode_load_static_call, unicode_load_default);
+
+	unicode_unregister();
+}
+
+module_init(utf8_init);
+module_exit(utf8_exit);
+
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/unicode.h b/include/linux/unicode.h
index de23f9ee720b..0b157c6830c6 100644
--- a/include/linux/unicode.h
+++ b/include/linux/unicode.h
@@ -4,33 +4,101 @@
 
 #include <linux/init.h>
 #include <linux/dcache.h>
+#include <linux/static_call.h>
+
 
 struct unicode_map {
 	const char *charset;
 	int version;
 };
 
-int unicode_validate(const struct unicode_map *um, const struct qstr *str);
+int unicode_validate_default(const struct unicode_map *um,
+			     const struct qstr *str);
+
+int unicode_strncmp_default(const struct unicode_map *um,
+			    const struct qstr *s1,
+			    const struct qstr *s2);
+
+int unicode_strncasecmp_default(const struct unicode_map *um,
+				const struct qstr *s1,
+				const struct qstr *s2);
+
+int unicode_strncasecmp_folded_default(const struct unicode_map *um,
+				       const struct qstr *cf,
+				       const struct qstr *s1);
+
+int unicode_normalize_default(const struct unicode_map *um,
+			      const struct qstr *str,
+			      unsigned char *dest, size_t dlen);
+
+int unicode_casefold_default(const struct unicode_map *um,
+			     const struct qstr *str,
+			     unsigned char *dest, size_t dlen);
+
+int unicode_casefold_hash_default(const struct unicode_map *um,
+				  const void *salt, struct qstr *str);
 
-int unicode_strncmp(const struct unicode_map *um,
-		    const struct qstr *s1, const struct qstr *s2);
+struct unicode_map *unicode_load_default(const char *version);
 
-int unicode_strncasecmp(const struct unicode_map *um,
-			const struct qstr *s1, const struct qstr *s2);
-int unicode_strncasecmp_folded(const struct unicode_map *um,
-			       const struct qstr *cf,
-			       const struct qstr *s1);
+DECLARE_STATIC_CALL(unicode_validate_static_call, unicode_validate_default);
+DECLARE_STATIC_CALL(unicode_strncmp_static_call, unicode_strncmp_default);
+DECLARE_STATIC_CALL(unicode_strncasecmp_static_call,
+		    unicode_strncasecmp_default);
+DECLARE_STATIC_CALL(unicode_strncasecmp_folded_static_call,
+		    unicode_strncasecmp_folded_default);
+DECLARE_STATIC_CALL(unicode_normalize_static_call, unicode_normalize_default);
+DECLARE_STATIC_CALL(unicode_casefold_static_call, unicode_casefold_default);
+DECLARE_STATIC_CALL(unicode_casefold_hash_static_call,
+		    unicode_casefold_hash_default);
+DECLARE_STATIC_CALL(unicode_load_static_call, unicode_load_default);
 
-int unicode_normalize(const struct unicode_map *um, const struct qstr *str,
-		      unsigned char *dest, size_t dlen);
 
-int unicode_casefold(const struct unicode_map *um, const struct qstr *str,
-		     unsigned char *dest, size_t dlen);
+static inline int unicode_validate(const struct unicode_map *um, const struct qstr *str)
+{
+	return static_call(unicode_validate_static_call)(um, str);
+}
 
-int unicode_casefold_hash(const struct unicode_map *um, const void *salt,
-			  struct qstr *str);
+static inline int unicode_strncmp(const struct unicode_map *um,
+				  const struct qstr *s1, const struct qstr *s2)
+{
+	return static_call(unicode_strncmp_static_call)(um, s1, s2);
+}
+
+static inline int unicode_strncasecmp(const struct unicode_map *um,
+				      const struct qstr *s1, const struct qstr *s2)
+{
+	return static_call(unicode_strncasecmp_static_call)(um, s1, s2);
+}
+
+static inline int unicode_strncasecmp_folded(const struct unicode_map *um,
+					     const struct qstr *cf,
+					     const struct qstr *s1)
+{
+	return static_call(unicode_strncasecmp_folded_static_call)(um, cf, s1);
+}
+
+static inline int unicode_normalize(const struct unicode_map *um, const struct qstr *str,
+				    unsigned char *dest, size_t dlen)
+{
+	return static_call(unicode_normalize_static_call)(um, str, dest, dlen);
+}
+
+static inline int unicode_casefold(const struct unicode_map *um, const struct qstr *str,
+				   unsigned char *dest, size_t dlen)
+{
+	return static_call(unicode_casefold_static_call)(um, str, dest, dlen);
+}
+
+static inline int unicode_casefold_hash(const struct unicode_map *um, const void *salt,
+					struct qstr *str)
+{
+	return static_call(unicode_casefold_hash_static_call)(um, salt, str);
+}
 
 struct unicode_map *unicode_load(const char *version);
 void unicode_unload(struct unicode_map *um);
 
+void unicode_register(struct module *owner);
+void unicode_unregister(void);
+
 #endif /* _LINUX_UNICODE_H */
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
