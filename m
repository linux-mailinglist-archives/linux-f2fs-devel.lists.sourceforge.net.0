Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E83240C03C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Sep 2021 09:10:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mQP3v-0005Fj-3v; Wed, 15 Sep 2021 07:10:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+8aa05ddd91fea3e0ef51+6597+infradead.org+hch@casper.srs.infradead.org>)
 id 1mQP3u-0005FZ-C7
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Sep 2021 07:10:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yJ9JRVnTjOuw5QeCjIaK6cScQo+N4ZL5INbHF6iwuYk=; b=GsYUD+rxPsjno1zuHP6OapBAHG
 /QyBA71eXjVkb9M2lxS0O2lxPKBKLCiP6S235ijmCWRYDVFHGjWcxKLFOLviTefGeCP9RCpbeDjF+
 HVCslE+VktxF6jUOIgdETK47LXBBD48Ui0wNMQXtHaB1KgBx3NlJRwBcuUZpcRscgCj4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yJ9JRVnTjOuw5QeCjIaK6cScQo+N4ZL5INbHF6iwuYk=; b=fnt9ZfW9sS9VxlaAplfGO5FWCI
 Q5uflfMdKnY23DKeoMFgazNpIQ9nmYO6DS0vcFTegq+brVDBfvlXczLpMSOUq2XSZoZGfkWF+60KI
 BfptEqAGqZz+/AB6QBRiFcTj9DUeqzNpLDhR9ctlQ7e3x0lV5GovAqU8pYypPOwM0Inw=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mQP3t-0000PL-5i
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Sep 2021 07:10:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=yJ9JRVnTjOuw5QeCjIaK6cScQo+N4ZL5INbHF6iwuYk=; b=HV4l14hjwFLf3o/qN94qTREheF
 1P1s/W1AemYYr4Cvog41gKBj/bugvSlfOQ+xBfZ1Ppma41YIEyWNSbgyD0ae1An6iNrNqJUGhjU97
 4idJqYjqQf3dkf037TsQe3P4FYorMV/4mjRIZZgDY39MF+IL4YCoOvR1V7oXvlfTi+S8R4uJp+SFP
 c6Du1rrYlqQfzRkiiyRYJnx+Wf9ZZ29QebaWEZVEZRjSqt7dM+8ac2u5V7AOEZlPL8Q5l8SlgObex
 h6iDupejpVEaPgttG0WfhXhbzo2faG4xqWxd8MM1e3L+2lvTqIXQ7IqhKPbCb/awRjdTc9F/O9lhf
 SCGVUrww==;
Received: from [2001:4bb8:184:72db:8457:d7a:6e21:dd20] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQP2N-00FRvV-VB; Wed, 15 Sep 2021 07:09:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Date: Wed, 15 Sep 2021 09:00:05 +0200
Message-Id: <20210915070006.954653-11-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210915070006.954653-1-hch@lst.de>
References: <20210915070006.954653-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: utf8data.h contains a large database table which is an
 auto-generated
 decodification trie for the unicode normalization functions. Allow building
 it into a separate module. Based on a patch from Shreeya Patel
 <shreeya.patel@collabora.com>.
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mQP3t-0000PL-5i
Subject: [f2fs-dev] [PATCH 10/11] unicode: Add utf8-data module
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

utf8data.h contains a large database table which is an auto-generated
decodification trie for the unicode normalization functions.

Allow building it into a separate module.

Based on a patch from Shreeya Patel <shreeya.patel@collabora.com>.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/unicode/Kconfig                            | 13 ++++-
 fs/unicode/Makefile                           | 13 ++---
 fs/unicode/mkutf8data.c                       | 24 ++++++++--
 fs/unicode/utf8-core.c                        | 35 +++++++++++---
 fs/unicode/utf8-norm.c                        | 48 ++++---------------
 fs/unicode/utf8-selftest.c                    | 16 +++----
 ...{utf8data.h_shipped => utf8data.c_shipped} | 22 +++++++--
 fs/unicode/utf8n.h                            | 40 ++++++++--------
 include/linux/unicode.h                       |  2 +
 9 files changed, 123 insertions(+), 90 deletions(-)
 rename fs/unicode/{utf8data.h_shipped => utf8data.c_shipped} (99%)

diff --git a/fs/unicode/Kconfig b/fs/unicode/Kconfig
index 2c27b9a5cd6ce..610d7bc05d6e3 100644
--- a/fs/unicode/Kconfig
+++ b/fs/unicode/Kconfig
@@ -8,7 +8,16 @@ config UNICODE
 	  Say Y here to enable UTF-8 NFD normalization and NFD+CF casefolding
 	  support.
 
+config UNICODE_UTF8_DATA
+	tristate "UTF-8 normalization and casefolding tables"
+	depends on UNICODE
+	default UNICODE
+	help
+	  This contains a large table of case foldings, which can be loaded as
+	  a separate module if you say M here.  To be on the safe side stick
+	  to the default of Y.  Saying N here makes no sense, if you do not want
+	  utf8 casefolding support, disable CONFIG_UNICODE instead.
+
 config UNICODE_NORMALIZATION_SELFTEST
 	tristate "Test UTF-8 normalization support"
-	depends on UNICODE
-	default n
+	depends on UNICODE_UTF8_DATA
diff --git a/fs/unicode/Makefile b/fs/unicode/Makefile
index b88aecc865502..2f9d9188852b5 100644
--- a/fs/unicode/Makefile
+++ b/fs/unicode/Makefile
@@ -2,14 +2,15 @@
 
 obj-$(CONFIG_UNICODE) += unicode.o
 obj-$(CONFIG_UNICODE_NORMALIZATION_SELFTEST) += utf8-selftest.o
+obj-$(CONFIG_UNICODE_UTF8_DATA) += utf8data.o
 
 unicode-y := utf8-norm.o utf8-core.o
 
-$(obj)/utf8-norm.o: $(obj)/utf8data.h
+$(obj)/utf8-data.o: $(obj)/utf8data.c
 
-# In the normal build, the checked-in utf8data.h is just shipped.
+# In the normal build, the checked-in utf8data.c is just shipped.
 #
-# To generate utf8data.h from UCD, put *.txt files in this directory
+# To generate utf8data.c from UCD, put *.txt files in this directory
 # and pass REGENERATE_UTF8DATA=1 from the command line.
 ifdef REGENERATE_UTF8DATA
 
@@ -24,15 +25,15 @@ quiet_cmd_utf8data = GEN     $@
 		-t $(srctree)/$(src)/NormalizationTest.txt \
 		-o $@
 
-$(obj)/utf8data.h: $(obj)/mkutf8data $(filter %.txt, $(cmd_utf8data)) FORCE
+$(obj)/utf8data.c: $(obj)/mkutf8data $(filter %.txt, $(cmd_utf8data)) FORCE
 	$(call if_changed,utf8data)
 
 else
 
-$(obj)/utf8data.h: $(src)/utf8data.h_shipped FORCE
+$(obj)/utf8data.c: $(src)/utf8data.c_shipped FORCE
 	$(call if_changed,shipped)
 
 endif
 
-targets += utf8data.h
+targets += utf8data.c
 hostprogs += mkutf8data
diff --git a/fs/unicode/mkutf8data.c b/fs/unicode/mkutf8data.c
index ff2025ac5a325..bc1a7c8b5c8df 100644
--- a/fs/unicode/mkutf8data.c
+++ b/fs/unicode/mkutf8data.c
@@ -3287,12 +3287,10 @@ static void write_file(void)
 		open_fail(utf8_name, errno);
 
 	fprintf(file, "/* This file is generated code, do not edit. */\n");
-	fprintf(file, "#ifndef __INCLUDED_FROM_UTF8NORM_C__\n");
-	fprintf(file, "#error Only nls_utf8-norm.c should include this file.\n");
-	fprintf(file, "#endif\n");
 	fprintf(file, "\n");
-	fprintf(file, "static const unsigned int utf8vers = %#x;\n",
-		unicode_maxage);
+	fprintf(file, "#include <linux/module.h>\n");
+	fprintf(file, "#include <linux/kernel.h>\n");
+	fprintf(file, "#include \"utf8n.h\"\n");
 	fprintf(file, "\n");
 	fprintf(file, "static const unsigned int utf8agetab[] = {\n");
 	for (i = 0; i != ages_count; i++)
@@ -3339,6 +3337,22 @@ static void write_file(void)
 		fprintf(file, "\n");
 	}
 	fprintf(file, "};\n");
+	fprintf(file, "\n");
+	fprintf(file, "struct utf8data_table utf8_data_table = {\n");
+	fprintf(file, "\t.utf8agetab = utf8agetab,\n");
+	fprintf(file, "\t.utf8agetab_size = ARRAY_SIZE(utf8agetab),\n");
+	fprintf(file, "\n");
+	fprintf(file, "\t.utf8nfdicfdata = utf8nfdicfdata,\n");
+	fprintf(file, "\t.utf8nfdicfdata_size = ARRAY_SIZE(utf8nfdicfdata),\n");
+	fprintf(file, "\n");
+	fprintf(file, "\t.utf8nfdidata = utf8nfdidata,\n");
+	fprintf(file, "\t.utf8nfdidata_size = ARRAY_SIZE(utf8nfdidata),\n");
+	fprintf(file, "\n");
+	fprintf(file, "\t.utf8data = utf8data,\n");
+	fprintf(file, "};\n");
+	fprintf(file, "EXPORT_SYMBOL_GPL(utf8_data_table);");
+	fprintf(file, "\n");
+	fprintf(file, "MODULE_LICENSE(\"GPL v2\");\n");
 	fclose(file);
 }
 
diff --git a/fs/unicode/utf8-core.c b/fs/unicode/utf8-core.c
index d9f713d38c0ad..38ca824f10158 100644
--- a/fs/unicode/utf8-core.c
+++ b/fs/unicode/utf8-core.c
@@ -160,25 +160,45 @@ int utf8_normalize(const struct unicode_map *um, const struct qstr *str,
 }
 EXPORT_SYMBOL(utf8_normalize);
 
+static const struct utf8data *find_table_version(const struct utf8data *table,
+		size_t nr_entries, unsigned int version)
+{
+	size_t i = nr_entries - 1;
+
+	while (version < table[i].maxage)
+		i--;
+	if (version > table[i].maxage)
+		return NULL;
+	return &table[i];
+}
+
 struct unicode_map *utf8_load(unsigned int version)
 {
 	struct unicode_map *um;
 
-	if (!utf8version_is_supported(version))
-		return ERR_PTR(-EINVAL);
-
 	um = kzalloc(sizeof(struct unicode_map), GFP_KERNEL);
 	if (!um)
 		return ERR_PTR(-ENOMEM);
 	um->version = version;
-	um->ntab[UTF8_NFDI] = utf8nfdi(version);
-	if (!um->ntab[UTF8_NFDI])
+
+	um->tables = symbol_request(utf8_data_table);
+	if (!um->tables)
 		goto out_free_um;
-	um->ntab[UTF8_NFDICF] = utf8nfdicf(version);
+
+	if (!utf8version_is_supported(um, version))
+		goto out_symbol_put;
+	um->ntab[UTF8_NFDI] = find_table_version(um->tables->utf8nfdidata,
+			um->tables->utf8nfdidata_size, um->version);
+	if (!um->ntab[UTF8_NFDI])
+		goto out_symbol_put;
+	um->ntab[UTF8_NFDICF] = find_table_version(um->tables->utf8nfdicfdata,
+			um->tables->utf8nfdicfdata_size, um->version);
 	if (!um->ntab[UTF8_NFDICF])
-		goto out_free_um;
+		goto out_symbol_put;
 	return um;
 
+out_symbol_put:
+	symbol_put(um->tables);
 out_free_um:
 	kfree(um);
 	return ERR_PTR(-EINVAL);
@@ -187,6 +207,7 @@ EXPORT_SYMBOL(utf8_load);
 
 void utf8_unload(struct unicode_map *um)
 {
+	symbol_put(utf8_data_table);
 	kfree(um);
 }
 EXPORT_SYMBOL(utf8_unload);
diff --git a/fs/unicode/utf8-norm.c b/fs/unicode/utf8-norm.c
index 7c1f28ab31a80..829c7e2ad764a 100644
--- a/fs/unicode/utf8-norm.c
+++ b/fs/unicode/utf8-norm.c
@@ -6,21 +6,12 @@
 
 #include "utf8n.h"
 
-struct utf8data {
-	unsigned int maxage;
-	unsigned int offset;
-};
-
-#define __INCLUDED_FROM_UTF8NORM_C__
-#include "utf8data.h"
-#undef __INCLUDED_FROM_UTF8NORM_C__
-
-int utf8version_is_supported(unsigned int version)
+int utf8version_is_supported(const struct unicode_map *um, unsigned int version)
 {
-	int i = ARRAY_SIZE(utf8agetab) - 1;
+	int i = um->tables->utf8agetab_size - 1;
 
-	while (i >= 0 && utf8agetab[i] != 0) {
-		if (version == utf8agetab[i])
+	while (i >= 0 && um->tables->utf8agetab[i] != 0) {
+		if (version == um->tables->utf8agetab[i])
 			return 1;
 		i--;
 	}
@@ -161,7 +152,7 @@ typedef const unsigned char utf8trie_t;
  * underlying datatype: unsigned char.
  *
  * leaf[0]: The unicode version, stored as a generation number that is
- *          an index into utf8agetab[].  With this we can filter code
+ *          an index into ->utf8agetab[].  With this we can filter code
  *          points based on the unicode version in which they were
  *          defined.  The CCC of a non-defined code point is 0.
  * leaf[1]: Canonical Combining Class. During normalization, we need
@@ -313,7 +304,7 @@ static utf8leaf_t *utf8nlookup(const struct unicode_map *um,
 		enum utf8_normalization n, unsigned char *hangul, const char *s,
 		size_t len)
 {
-	utf8trie_t	*trie = utf8data + um->ntab[n]->offset;
+	utf8trie_t	*trie = um->tables->utf8data + um->ntab[n]->offset;
 	int		offlen;
 	int		offset;
 	int		mask;
@@ -404,7 +395,8 @@ ssize_t utf8nlen(const struct unicode_map *um, enum utf8_normalization n,
 		leaf = utf8nlookup(um, n, hangul, s, len);
 		if (!leaf)
 			return -1;
-		if (utf8agetab[LEAF_GEN(leaf)] > um->ntab[n]->maxage)
+		if (um->tables->utf8agetab[LEAF_GEN(leaf)] >
+		    um->ntab[n]->maxage)
 			ret += utf8clen(s);
 		else if (LEAF_CCC(leaf) == DECOMPOSE)
 			ret += strlen(LEAF_STR(leaf));
@@ -520,7 +512,7 @@ int utf8byte(struct utf8cursor *u8c)
 
 		ccc = LEAF_CCC(leaf);
 		/* Characters that are too new have CCC 0. */
-		if (utf8agetab[LEAF_GEN(leaf)] >
+		if (u8c->um->tables->utf8agetab[LEAF_GEN(leaf)] >
 		    u8c->um->ntab[u8c->n]->maxage) {
 			ccc = STOPPER;
 		} else if (ccc == DECOMPOSE) {
@@ -597,25 +589,3 @@ int utf8byte(struct utf8cursor *u8c)
 	}
 }
 EXPORT_SYMBOL(utf8byte);
-
-const struct utf8data *utf8nfdi(unsigned int maxage)
-{
-	int i = ARRAY_SIZE(utf8nfdidata) - 1;
-
-	while (maxage < utf8nfdidata[i].maxage)
-		i--;
-	if (maxage > utf8nfdidata[i].maxage)
-		return NULL;
-	return &utf8nfdidata[i];
-}
-
-const struct utf8data *utf8nfdicf(unsigned int maxage)
-{
-	int i = ARRAY_SIZE(utf8nfdicfdata) - 1;
-
-	while (maxage < utf8nfdicfdata[i].maxage)
-		i--;
-	if (maxage > utf8nfdicfdata[i].maxage)
-		return NULL;
-	return &utf8nfdicfdata[i];
-}
diff --git a/fs/unicode/utf8-selftest.c b/fs/unicode/utf8-selftest.c
index cfa3832b75f42..eb2bbdd688d71 100644
--- a/fs/unicode/utf8-selftest.c
+++ b/fs/unicode/utf8-selftest.c
@@ -255,21 +255,21 @@ static void check_utf8_comparisons(struct unicode_map *table)
 	}
 }
 
-static void check_supported_versions(void)
+static void check_supported_versions(struct unicode_map *um)
 {
 	/* Unicode 7.0.0 should be supported. */
-	test(utf8version_is_supported(UNICODE_AGE(7, 0, 0)));
+	test(utf8version_is_supported(um, UNICODE_AGE(7, 0, 0)));
 
 	/* Unicode 9.0.0 should be supported. */
-	test(utf8version_is_supported(UNICODE_AGE(9, 0, 0)));
+	test(utf8version_is_supported(um, UNICODE_AGE(9, 0, 0)));
 
 	/* Unicode 1x.0.0 (the latest version) should be supported. */
-	test(utf8version_is_supported(UTF8_LATEST));
+	test(utf8version_is_supported(um, UTF8_LATEST));
 
 	/* Next versions don't exist. */
-	test(!utf8version_is_supported(UNICODE_AGE(13, 0, 0)));
-	test(!utf8version_is_supported(UNICODE_AGE(0, 0, 0)));
-	test(!utf8version_is_supported(UNICODE_AGE(-1, -1, -1)));
+	test(!utf8version_is_supported(um, UNICODE_AGE(13, 0, 0)));
+	test(!utf8version_is_supported(um, UNICODE_AGE(0, 0, 0)));
+	test(!utf8version_is_supported(um, UNICODE_AGE(-1, -1, -1)));
 }
 
 static int __init init_test_ucd(void)
@@ -285,7 +285,7 @@ static int __init init_test_ucd(void)
 		return PTR_ERR(um);
 	}
 
-	check_supported_versions();
+	check_supported_versions(um);
 	check_utf8_nfdi(um);
 	check_utf8_nfdicf(um);
 	check_utf8_comparisons(um);
diff --git a/fs/unicode/utf8data.h_shipped b/fs/unicode/utf8data.c_shipped
similarity index 99%
rename from fs/unicode/utf8data.h_shipped
rename to fs/unicode/utf8data.c_shipped
index 76e4f0e1b0891..d9b62901aa96b 100644
--- a/fs/unicode/utf8data.h_shipped
+++ b/fs/unicode/utf8data.c_shipped
@@ -1,9 +1,8 @@
 /* This file is generated code, do not edit. */
-#ifndef __INCLUDED_FROM_UTF8NORM_C__
-#error Only nls_utf8-norm.c should include this file.
-#endif
 
-static const unsigned int utf8vers = 0xc0100;
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include "utf8n.h"
 
 static const unsigned int utf8agetab[] = {
 	0,
@@ -4107,3 +4106,18 @@ static const unsigned char utf8data[64256] = {
 	0x52,0x04,0x00,0x00,0x11,0x04,0x00,0x00,0x02,0x00,0xcf,0x86,0xcf,0x06,0x02,0x00,
 	0x81,0x80,0xcf,0x86,0x85,0x84,0xcf,0x86,0xcf,0x06,0x02,0x00,0x00,0x00,0x00,0x00
 };
+
+struct utf8data_table utf8_data_table = {
+	.utf8agetab = utf8agetab,
+	.utf8agetab_size = ARRAY_SIZE(utf8agetab),
+
+	.utf8nfdicfdata = utf8nfdicfdata,
+	.utf8nfdicfdata_size = ARRAY_SIZE(utf8nfdicfdata),
+
+	.utf8nfdidata = utf8nfdidata,
+	.utf8nfdidata_size = ARRAY_SIZE(utf8nfdidata),
+
+	.utf8data = utf8data,
+};
+EXPORT_SYMBOL_GPL(utf8_data_table);
+MODULE_LICENSE("GPL v2");
diff --git a/fs/unicode/utf8n.h b/fs/unicode/utf8n.h
index 206c89f0dbf71..bd00d587747a7 100644
--- a/fs/unicode/utf8n.h
+++ b/fs/unicode/utf8n.h
@@ -13,25 +13,7 @@
 #include <linux/module.h>
 #include <linux/unicode.h>
 
-int utf8version_is_supported(unsigned int version);
-
-/*
- * Look for the correct const struct utf8data for a unicode version.
- * Returns NULL if the version requested is too new.
- *
- * Two normalization forms are supported: nfdi and nfdicf.
- *
- * nfdi:
- *  - Apply unicode normalization form NFD.
- *  - Remove any Default_Ignorable_Code_Point.
- *
- * nfdicf:
- *  - Apply unicode normalization form NFD.
- *  - Remove any Default_Ignorable_Code_Point.
- *  - Apply a full casefold (C + F).
- */
-extern const struct utf8data *utf8nfdi(unsigned int maxage);
-extern const struct utf8data *utf8nfdicf(unsigned int maxage);
+int utf8version_is_supported(const struct unicode_map *um, unsigned int version);
 
 /*
  * Determine the length of the normalized from of the string,
@@ -78,4 +60,24 @@ int utf8ncursor(struct utf8cursor *u8c, const struct unicode_map *um,
  */
 extern int utf8byte(struct utf8cursor *u8c);
 
+struct utf8data {
+	unsigned int maxage;
+	unsigned int offset;
+};
+
+struct utf8data_table {
+	const unsigned int *utf8agetab;
+	int utf8agetab_size;
+
+	const struct utf8data *utf8nfdicfdata;
+	int utf8nfdicfdata_size;
+
+	const struct utf8data *utf8nfdidata;
+	int utf8nfdidata_size;
+
+	const unsigned char *utf8data;
+};
+
+extern struct utf8data_table utf8_data_table;
+
 #endif /* UTF8NORM_H */
diff --git a/include/linux/unicode.h b/include/linux/unicode.h
index 526ca8b8391a5..4d39e6e11a950 100644
--- a/include/linux/unicode.h
+++ b/include/linux/unicode.h
@@ -6,6 +6,7 @@
 #include <linux/dcache.h>
 
 struct utf8data;
+struct utf8data_table;
 
 #define UNICODE_MAJ_SHIFT		16
 #define UNICODE_MIN_SHIFT		8
@@ -49,6 +50,7 @@ enum utf8_normalization {
 struct unicode_map {
 	unsigned int version;
 	const struct utf8data *ntab[UTF8_NMAX];
+	const struct utf8data_table *tables;
 };
 
 int utf8_validate(const struct unicode_map *um, const struct qstr *str);
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
