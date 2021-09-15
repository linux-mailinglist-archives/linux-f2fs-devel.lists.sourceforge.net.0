Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0EC40C036
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Sep 2021 09:09:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mQP2s-0002Go-Tm; Wed, 15 Sep 2021 07:09:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+8aa05ddd91fea3e0ef51+6597+infradead.org+hch@casper.srs.infradead.org>)
 id 1mQP2r-0002Gc-AY
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Sep 2021 07:09:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OB49vZlYoTEvDYf8tsf4tZVFb5Npj4l7DC/VewRgPKI=; b=hthdBdf+dPici3i8XEmkDK01Mc
 uftGBy6g0QO6OMoBQuwuNcyq+NbGtx1AGMh+3NEr/Fm6K5Ecol0x0BMUsO07XV2yEIKhyU2dQBLCA
 8CAqefuF5qU59raYwhUX+4DbcuD2GjkxG5nBr5XLaEWVMcUPXvKArdtfgjZDI9yJgOPc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OB49vZlYoTEvDYf8tsf4tZVFb5Npj4l7DC/VewRgPKI=; b=gh7vuDG64ryv/EesL1wQ0nK8Zt
 IXawwsw10IUgQlie0fFo7MFCUJV54SR2hyareHeSe2KpCqZSyn2+d/ddTUTJusui8kVpWOS+GAj0b
 TklotOuEzIn0/nt6uM3s7OMnJYO6Oqwnb6Ov/UZriP5/fRZkJB1hNUn+6SY5G/prRtms=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mQP2o-0000La-Kg
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Sep 2021 07:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=OB49vZlYoTEvDYf8tsf4tZVFb5Npj4l7DC/VewRgPKI=; b=WiTmtBKXYprjur1vD89aAr634D
 EyBg4CKmP/zuUkNRSLCAJCTXwTf0HV1sESMV7H2lsdMnQ88DN+6e47tTPoNYbNxg7yblNh1Zn+sFE
 4u7G1ng5vWb6vZX5usiSTldd5l+XCa8W5iT3IH85wGrCd98BgZ3MBh2Q4/91i6uEPHXsMh726ja7l
 mHb7HvJnJHE92IbdyNjv3uOiQwwVFftiqp+yHikv3OmqLABElz+bDbAaOcjN6h4azm2zhosuNUpOG
 xBtfdg9J7U/QXTVYSxMul3xe3zhhPYUugroT0YCfgvdLuK3PE2ZYCsw5TP2pLdwWnhaKWAX02y/wn
 G0pQumyg==;
Received: from [2001:4bb8:184:72db:8457:d7a:6e21:dd20] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQP1U-00FRrH-N7; Wed, 15 Sep 2021 07:08:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Date: Wed, 15 Sep 2021 09:00:04 +0200
Message-Id: <20210915070006.954653-10-hch@lst.de>
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
 Content preview:  Instead of repeatedly looking up the version add pointers
 to the NFD and NFD+CF tables to struct unicode_map, and pass a unicode_map
 plus index to the functions using the normalization tables. Signed-off-by:
 Christoph Hellwig <hch@lst.de> --- fs/unicode/utf8-core.c | 37
 +++++++++---------
 fs/unicode/utf8-norm.c | 45 ++++++++++ fs/unicode/utf8-selftest.c | 80
 ++++++++++++++++----- [...] 
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
X-Headers-End: 1mQP2o-0000La-Kg
Subject: [f2fs-dev] [PATCH 09/11] unicode: cache the normalization tables in
 struct unicode_map
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

Instead of repeatedly looking up the version add pointers to the
NFD and NFD+CF tables to struct unicode_map, and pass a
unicode_map plus index to the functions using the normalization
tables.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/unicode/utf8-core.c     | 37 +++++++++---------
 fs/unicode/utf8-norm.c     | 45 ++++++++++-----------
 fs/unicode/utf8-selftest.c | 80 ++++++++++++++++----------------------
 fs/unicode/utf8n.h         | 10 +++--
 include/linux/unicode.h    | 19 +++++++++
 5 files changed, 97 insertions(+), 94 deletions(-)

diff --git a/fs/unicode/utf8-core.c b/fs/unicode/utf8-core.c
index dca2865c3bee8..d9f713d38c0ad 100644
--- a/fs/unicode/utf8-core.c
+++ b/fs/unicode/utf8-core.c
@@ -5,16 +5,13 @@
 #include <linux/slab.h>
 #include <linux/parser.h>
 #include <linux/errno.h>
-#include <linux/unicode.h>
 #include <linux/stringhash.h>
 
 #include "utf8n.h"
 
 int utf8_validate(const struct unicode_map *um, const struct qstr *str)
 {
-	const struct utf8data *data = utf8nfdi(um->version);
-
-	if (utf8nlen(data, str->name, str->len) < 0)
+	if (utf8nlen(um, UTF8_NFDI, str->name, str->len) < 0)
 		return -1;
 	return 0;
 }
@@ -23,14 +20,13 @@ EXPORT_SYMBOL(utf8_validate);
 int utf8_strncmp(const struct unicode_map *um,
 		 const struct qstr *s1, const struct qstr *s2)
 {
-	const struct utf8data *data = utf8nfdi(um->version);
 	struct utf8cursor cur1, cur2;
 	int c1, c2;
 
-	if (utf8ncursor(&cur1, data, s1->name, s1->len) < 0)
+	if (utf8ncursor(&cur1, um, UTF8_NFDI, s1->name, s1->len) < 0)
 		return -EINVAL;
 
-	if (utf8ncursor(&cur2, data, s2->name, s2->len) < 0)
+	if (utf8ncursor(&cur2, um, UTF8_NFDI, s2->name, s2->len) < 0)
 		return -EINVAL;
 
 	do {
@@ -50,14 +46,13 @@ EXPORT_SYMBOL(utf8_strncmp);
 int utf8_strncasecmp(const struct unicode_map *um,
 		     const struct qstr *s1, const struct qstr *s2)
 {
-	const struct utf8data *data = utf8nfdicf(um->version);
 	struct utf8cursor cur1, cur2;
 	int c1, c2;
 
-	if (utf8ncursor(&cur1, data, s1->name, s1->len) < 0)
+	if (utf8ncursor(&cur1, um, UTF8_NFDICF, s1->name, s1->len) < 0)
 		return -EINVAL;
 
-	if (utf8ncursor(&cur2, data, s2->name, s2->len) < 0)
+	if (utf8ncursor(&cur2, um, UTF8_NFDICF, s2->name, s2->len) < 0)
 		return -EINVAL;
 
 	do {
@@ -81,12 +76,11 @@ int utf8_strncasecmp_folded(const struct unicode_map *um,
 			    const struct qstr *cf,
 			    const struct qstr *s1)
 {
-	const struct utf8data *data = utf8nfdicf(um->version);
 	struct utf8cursor cur1;
 	int c1, c2;
 	int i = 0;
 
-	if (utf8ncursor(&cur1, data, s1->name, s1->len) < 0)
+	if (utf8ncursor(&cur1, um, UTF8_NFDICF, s1->name, s1->len) < 0)
 		return -EINVAL;
 
 	do {
@@ -105,11 +99,10 @@ EXPORT_SYMBOL(utf8_strncasecmp_folded);
 int utf8_casefold(const struct unicode_map *um, const struct qstr *str,
 		  unsigned char *dest, size_t dlen)
 {
-	const struct utf8data *data = utf8nfdicf(um->version);
 	struct utf8cursor cur;
 	size_t nlen = 0;
 
-	if (utf8ncursor(&cur, data, str->name, str->len) < 0)
+	if (utf8ncursor(&cur, um, UTF8_NFDICF, str->name, str->len) < 0)
 		return -EINVAL;
 
 	for (nlen = 0; nlen < dlen; nlen++) {
@@ -128,12 +121,11 @@ EXPORT_SYMBOL(utf8_casefold);
 int utf8_casefold_hash(const struct unicode_map *um, const void *salt,
 		       struct qstr *str)
 {
-	const struct utf8data *data = utf8nfdicf(um->version);
 	struct utf8cursor cur;
 	int c;
 	unsigned long hash = init_name_hash(salt);
 
-	if (utf8ncursor(&cur, data, str->name, str->len) < 0)
+	if (utf8ncursor(&cur, um, UTF8_NFDICF, str->name, str->len) < 0)
 		return -EINVAL;
 
 	while ((c = utf8byte(&cur))) {
@@ -149,11 +141,10 @@ EXPORT_SYMBOL(utf8_casefold_hash);
 int utf8_normalize(const struct unicode_map *um, const struct qstr *str,
 		   unsigned char *dest, size_t dlen)
 {
-	const struct utf8data *data = utf8nfdi(um->version);
 	struct utf8cursor cur;
 	ssize_t nlen = 0;
 
-	if (utf8ncursor(&cur, data, str->name, str->len) < 0)
+	if (utf8ncursor(&cur, um, UTF8_NFDI, str->name, str->len) < 0)
 		return -EINVAL;
 
 	for (nlen = 0; nlen < dlen; nlen++) {
@@ -180,7 +171,17 @@ struct unicode_map *utf8_load(unsigned int version)
 	if (!um)
 		return ERR_PTR(-ENOMEM);
 	um->version = version;
+	um->ntab[UTF8_NFDI] = utf8nfdi(version);
+	if (!um->ntab[UTF8_NFDI])
+		goto out_free_um;
+	um->ntab[UTF8_NFDICF] = utf8nfdicf(version);
+	if (!um->ntab[UTF8_NFDICF])
+		goto out_free_um;
 	return um;
+
+out_free_um:
+	kfree(um);
+	return ERR_PTR(-EINVAL);
 }
 EXPORT_SYMBOL(utf8_load);
 
diff --git a/fs/unicode/utf8-norm.c b/fs/unicode/utf8-norm.c
index 1ac90fa00070d..7c1f28ab31a80 100644
--- a/fs/unicode/utf8-norm.c
+++ b/fs/unicode/utf8-norm.c
@@ -309,21 +309,19 @@ utf8hangul(const char *str, unsigned char *hangul)
  * is well-formed and corresponds to a known unicode code point.  The
  * shorthand for this will be "is valid UTF-8 unicode".
  */
-static utf8leaf_t *utf8nlookup(const struct utf8data *data,
-			       unsigned char *hangul, const char *s, size_t len)
+static utf8leaf_t *utf8nlookup(const struct unicode_map *um,
+		enum utf8_normalization n, unsigned char *hangul, const char *s,
+		size_t len)
 {
-	utf8trie_t	*trie = NULL;
+	utf8trie_t	*trie = utf8data + um->ntab[n]->offset;
 	int		offlen;
 	int		offset;
 	int		mask;
 	int		node;
 
-	if (!data)
-		return NULL;
 	if (len == 0)
 		return NULL;
 
-	trie = utf8data + data->offset;
 	node = 1;
 	while (node) {
 		offlen = (*trie & OFFLEN) >> OFFLEN_SHIFT;
@@ -385,29 +383,28 @@ static utf8leaf_t *utf8nlookup(const struct utf8data *data,
  *
  * Forwards to utf8nlookup().
  */
-static utf8leaf_t *utf8lookup(const struct utf8data *data,
-			      unsigned char *hangul, const char *s)
+static utf8leaf_t *utf8lookup(const struct unicode_map *um,
+		enum utf8_normalization n, unsigned char *hangul, const char *s)
 {
-	return utf8nlookup(data, hangul, s, (size_t)-1);
+	return utf8nlookup(um, n, hangul, s, (size_t)-1);
 }
 
 /*
  * Length of the normalization of s, touch at most len bytes.
  * Return -1 if s is not valid UTF-8 unicode.
  */
-ssize_t utf8nlen(const struct utf8data *data, const char *s, size_t len)
+ssize_t utf8nlen(const struct unicode_map *um, enum utf8_normalization n,
+		const char *s, size_t len)
 {
 	utf8leaf_t	*leaf;
 	size_t		ret = 0;
 	unsigned char	hangul[UTF8HANGULLEAF];
 
-	if (!data)
-		return -1;
 	while (len && *s) {
-		leaf = utf8nlookup(data, hangul, s, len);
+		leaf = utf8nlookup(um, n, hangul, s, len);
 		if (!leaf)
 			return -1;
-		if (utf8agetab[LEAF_GEN(leaf)] > data->maxage)
+		if (utf8agetab[LEAF_GEN(leaf)] > um->ntab[n]->maxage)
 			ret += utf8clen(s);
 		else if (LEAF_CCC(leaf) == DECOMPOSE)
 			ret += strlen(LEAF_STR(leaf));
@@ -430,14 +427,13 @@ EXPORT_SYMBOL(utf8nlen);
  *
  * Returns -1 on error, 0 on success.
  */
-int utf8ncursor(struct utf8cursor *u8c, const struct utf8data *data,
-		const char *s, size_t len)
+int utf8ncursor(struct utf8cursor *u8c, const struct unicode_map *um,
+		enum utf8_normalization n, const char *s, size_t len)
 {
-	if (!data)
-		return -1;
 	if (!s)
 		return -1;
-	u8c->data = data;
+	u8c->um = um;
+	u8c->n = n;
 	u8c->s = s;
 	u8c->p = NULL;
 	u8c->ss = NULL;
@@ -512,9 +508,9 @@ int utf8byte(struct utf8cursor *u8c)
 
 		/* Look up the data for the current character. */
 		if (u8c->p) {
-			leaf = utf8lookup(u8c->data, u8c->hangul, u8c->s);
+			leaf = utf8lookup(u8c->um, u8c->n, u8c->hangul, u8c->s);
 		} else {
-			leaf = utf8nlookup(u8c->data, u8c->hangul,
+			leaf = utf8nlookup(u8c->um, u8c->n, u8c->hangul,
 					   u8c->s, u8c->len);
 		}
 
@@ -524,7 +520,8 @@ int utf8byte(struct utf8cursor *u8c)
 
 		ccc = LEAF_CCC(leaf);
 		/* Characters that are too new have CCC 0. */
-		if (utf8agetab[LEAF_GEN(leaf)] > u8c->data->maxage) {
+		if (utf8agetab[LEAF_GEN(leaf)] >
+		    u8c->um->ntab[u8c->n]->maxage) {
 			ccc = STOPPER;
 		} else if (ccc == DECOMPOSE) {
 			u8c->len -= utf8clen(u8c->s);
@@ -538,7 +535,7 @@ int utf8byte(struct utf8cursor *u8c)
 				goto ccc_mismatch;
 			}
 
-			leaf = utf8lookup(u8c->data, u8c->hangul, u8c->s);
+			leaf = utf8lookup(u8c->um, u8c->n, u8c->hangul, u8c->s);
 			if (!leaf)
 				return -1;
 			ccc = LEAF_CCC(leaf);
@@ -611,7 +608,6 @@ const struct utf8data *utf8nfdi(unsigned int maxage)
 		return NULL;
 	return &utf8nfdidata[i];
 }
-EXPORT_SYMBOL(utf8nfdi);
 
 const struct utf8data *utf8nfdicf(unsigned int maxage)
 {
@@ -623,4 +619,3 @@ const struct utf8data *utf8nfdicf(unsigned int maxage)
 		return NULL;
 	return &utf8nfdicfdata[i];
 }
-EXPORT_SYMBOL(utf8nfdicf);
diff --git a/fs/unicode/utf8-selftest.c b/fs/unicode/utf8-selftest.c
index 04628b50351d3..cfa3832b75f42 100644
--- a/fs/unicode/utf8-selftest.c
+++ b/fs/unicode/utf8-selftest.c
@@ -18,9 +18,7 @@ unsigned int failed_tests;
 unsigned int total_tests;
 
 /* Tests will be based on this version. */
-#define latest_maj 12
-#define latest_min 1
-#define latest_rev 0
+#define UTF8_LATEST	UNICODE_AGE(12, 1, 0)
 
 #define _test(cond, func, line, fmt, ...) do {				\
 		total_tests++;						\
@@ -160,29 +158,22 @@ static const struct {
 	}
 };
 
-static ssize_t utf8len(const struct utf8data *data, const char *s)
+static ssize_t utf8len(const struct unicode_map *um, enum utf8_normalization n,
+		const char *s)
 {
-	return utf8nlen(data, s, (size_t)-1);
+	return utf8nlen(um, n, s, (size_t)-1);
 }
 
-static int utf8cursor(struct utf8cursor *u8c, const struct utf8data *data,
-		const char *s)
+static int utf8cursor(struct utf8cursor *u8c, const struct unicode_map *um,
+		enum utf8_normalization n, const char *s)
 {
-	return utf8ncursor(u8c, data, s, (unsigned int)-1);
+	return utf8ncursor(u8c, um, n, s, (unsigned int)-1);
 }
 
-static void check_utf8_nfdi(void)
+static void check_utf8_nfdi(struct unicode_map *um)
 {
 	int i;
 	struct utf8cursor u8c;
-	const struct utf8data *data;
-
-	data = utf8nfdi(UNICODE_AGE(latest_maj, latest_min, latest_rev));
-	if (!data) {
-		pr_err("%s: Unable to load utf8-%d.%d.%d. Skipping.\n",
-		       __func__, latest_maj, latest_min, latest_rev);
-		return;
-	}
 
 	for (i = 0; i < ARRAY_SIZE(nfdi_test_data); i++) {
 		int len = strlen(nfdi_test_data[i].str);
@@ -190,10 +181,11 @@ static void check_utf8_nfdi(void)
 		int j = 0;
 		unsigned char c;
 
-		test((utf8len(data, nfdi_test_data[i].str) == nlen));
-		test((utf8nlen(data, nfdi_test_data[i].str, len) == nlen));
+		test((utf8len(um, UTF8_NFDI, nfdi_test_data[i].str) == nlen));
+		test((utf8nlen(um, UTF8_NFDI, nfdi_test_data[i].str, len) ==
+			nlen));
 
-		if (utf8cursor(&u8c, data, nfdi_test_data[i].str) < 0)
+		if (utf8cursor(&u8c, um, UTF8_NFDI, nfdi_test_data[i].str) < 0)
 			pr_err("can't create cursor\n");
 
 		while ((c = utf8byte(&u8c)) > 0) {
@@ -207,18 +199,10 @@ static void check_utf8_nfdi(void)
 	}
 }
 
-static void check_utf8_nfdicf(void)
+static void check_utf8_nfdicf(struct unicode_map *um)
 {
 	int i;
 	struct utf8cursor u8c;
-	const struct utf8data *data;
-
-	data = utf8nfdicf(UNICODE_AGE(latest_maj, latest_min, latest_rev));
-	if (!data) {
-		pr_err("%s: Unable to load utf8-%d.%d.%d. Skipping.\n",
-		       __func__, latest_maj, latest_min, latest_rev);
-		return;
-	}
 
 	for (i = 0; i < ARRAY_SIZE(nfdicf_test_data); i++) {
 		int len = strlen(nfdicf_test_data[i].str);
@@ -226,10 +210,13 @@ static void check_utf8_nfdicf(void)
 		int j = 0;
 		unsigned char c;
 
-		test((utf8len(data, nfdicf_test_data[i].str) == nlen));
-		test((utf8nlen(data, nfdicf_test_data[i].str, len) == nlen));
+		test((utf8len(um, UTF8_NFDICF, nfdicf_test_data[i].str) ==
+				nlen));
+		test((utf8nlen(um, UTF8_NFDICF, nfdicf_test_data[i].str, len) ==
+				nlen));
 
-		if (utf8cursor(&u8c, data, nfdicf_test_data[i].str) < 0)
+		if (utf8cursor(&u8c, um, UTF8_NFDICF,
+				nfdicf_test_data[i].str) < 0)
 			pr_err("can't create cursor\n");
 
 		while ((c = utf8byte(&u8c)) > 0) {
@@ -243,16 +230,9 @@ static void check_utf8_nfdicf(void)
 	}
 }
 
-static void check_utf8_comparisons(void)
+static void check_utf8_comparisons(struct unicode_map *table)
 {
 	int i;
-	struct unicode_map *table = utf8_load(UNICODE_AGE(12, 1, 0));
-
-	if (IS_ERR(table)) {
-		pr_err("%s: Unable to load utf8 %d.%d.%d. Skipping.\n",
-		       __func__, latest_maj, latest_min, latest_rev);
-		return;
-	}
 
 	for (i = 0; i < ARRAY_SIZE(nfdi_test_data); i++) {
 		const struct qstr s1 = {.name = nfdi_test_data[i].str,
@@ -273,8 +253,6 @@ static void check_utf8_comparisons(void)
 		test_f(!utf8_strncasecmp(table, &s1, &s2),
 		       "%s %s comparison mismatch\n", s1.name, s2.name);
 	}
-
-	utf8_unload(table);
 }
 
 static void check_supported_versions(void)
@@ -286,8 +264,7 @@ static void check_supported_versions(void)
 	test(utf8version_is_supported(UNICODE_AGE(9, 0, 0)));
 
 	/* Unicode 1x.0.0 (the latest version) should be supported. */
-	test(utf8version_is_supported(
-		UNICODE_AGE(latest_maj, latest_min, latest_rev)));
+	test(utf8version_is_supported(UTF8_LATEST));
 
 	/* Next versions don't exist. */
 	test(!utf8version_is_supported(UNICODE_AGE(13, 0, 0)));
@@ -297,19 +274,28 @@ static void check_supported_versions(void)
 
 static int __init init_test_ucd(void)
 {
+	struct unicode_map *um;
+
 	failed_tests = 0;
 	total_tests = 0;
 
+	um = utf8_load(UTF8_LATEST);
+	if (IS_ERR(um)) {
+		pr_err("%s: Unable to load utf8 table.\n", __func__);
+		return PTR_ERR(um);
+	}
+
 	check_supported_versions();
-	check_utf8_nfdi();
-	check_utf8_nfdicf();
-	check_utf8_comparisons();
+	check_utf8_nfdi(um);
+	check_utf8_nfdicf(um);
+	check_utf8_comparisons(um);
 
 	if (!failed_tests)
 		pr_info("All %u tests passed\n", total_tests);
 	else
 		pr_err("%u out of %u tests failed\n", failed_tests,
 		       total_tests);
+	utf8_unload(um);
 	return 0;
 }
 
diff --git a/fs/unicode/utf8n.h b/fs/unicode/utf8n.h
index 736b6460a38cb..206c89f0dbf71 100644
--- a/fs/unicode/utf8n.h
+++ b/fs/unicode/utf8n.h
@@ -39,7 +39,8 @@ extern const struct utf8data *utf8nfdicf(unsigned int maxage);
  * Returns 0 if only ignorable code points are present.
  * Returns -1 if the input is not valid UTF-8.
  */
-extern ssize_t utf8nlen(const struct utf8data *data, const char *s, size_t len);
+ssize_t utf8nlen(const struct unicode_map *um, enum utf8_normalization n,
+		const char *s, size_t len);
 
 /* Needed in struct utf8cursor below. */
 #define UTF8HANGULLEAF	(12)
@@ -48,7 +49,8 @@ extern ssize_t utf8nlen(const struct utf8data *data, const char *s, size_t len);
  * Cursor structure used by the normalizer.
  */
 struct utf8cursor {
-	const struct utf8data	*data;
+	const struct unicode_map *um;
+	enum utf8_normalization n;
 	const char	*s;
 	const char	*p;
 	const char	*ss;
@@ -65,8 +67,8 @@ struct utf8cursor {
  * Returns 0 on success.
  * Returns -1 on failure.
  */
-extern int utf8ncursor(struct utf8cursor *u8c, const struct utf8data *data,
-		       const char *s, size_t len);
+int utf8ncursor(struct utf8cursor *u8c, const struct unicode_map *um,
+		enum utf8_normalization n, const char *s, size_t len);
 
 /*
  * Get the next byte in the normalization.
diff --git a/include/linux/unicode.h b/include/linux/unicode.h
index 77bb915fd1f05..526ca8b8391a5 100644
--- a/include/linux/unicode.h
+++ b/include/linux/unicode.h
@@ -5,6 +5,8 @@
 #include <linux/init.h>
 #include <linux/dcache.h>
 
+struct utf8data;
+
 #define UNICODE_MAJ_SHIFT		16
 #define UNICODE_MIN_SHIFT		8
 
@@ -28,8 +30,25 @@ static inline u8 unicode_rev(unsigned int age)
 	return age & 0xff;
 }
 
+/*
+ * Two normalization forms are supported:
+ * 1) NFDI
+ *   - Apply unicode normalization form NFD.
+ *   - Remove any Default_Ignorable_Code_Point.
+ * 2) NFDICF
+ *   - Apply unicode normalization form NFD.
+ *   - Remove any Default_Ignorable_Code_Point.
+ *   - Apply a full casefold (C + F).
+ */
+enum utf8_normalization {
+	UTF8_NFDI = 0,
+	UTF8_NFDICF,
+	UTF8_NMAX,
+};
+
 struct unicode_map {
 	unsigned int version;
+	const struct utf8data *ntab[UTF8_NMAX];
 };
 
 int utf8_validate(const struct unicode_map *um, const struct qstr *str);
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
