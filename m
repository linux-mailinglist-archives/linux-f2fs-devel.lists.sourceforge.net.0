Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B213F0648
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Aug 2021 16:17:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mGMNV-0008Sz-Sl; Wed, 18 Aug 2021 14:17:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from
 <BATV+c26a8f31a710de91e748+6569+infradead.org+hch@casper.srs.infradead.org>)
 id 1mGMNU-0008Sq-38
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 14:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mg81CqRAZmZfDj14bc3WrVlEByj2jtQtmklitDTRhOU=; b=HBXUapK478+wfGu9718omELfi+
 ZnJraltltVPCAyoZrMkAfPoukHUuvErMjZ87lYLA17B+60MCrSYVun4yv53LBA674Optl5vJoSbR1
 5n9FPyNUx/fAG+P8webc1sR3B0td+Lyhg1PrApkEUPhkcQxQQ6kZ5pWvz+0fqWR9QGIA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mg81CqRAZmZfDj14bc3WrVlEByj2jtQtmklitDTRhOU=; b=Vx+6L/hHJvaDbxZWbA6N05CoeX
 zu2J9khGKhpK4ErXyMmfJ9PNdKURZ5UuxKjUftar5OmioWKH3db9mtzMExhjtcKg/arR2qiMWjhxk
 R4YU9kCVJnJSrFsM+e6yoGSTHxQB6tTe9PaRgvnrzoKp5ZlW51oSGjgvO9QJptZWuAQY=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mGMNS-0007vl-95
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 14:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=mg81CqRAZmZfDj14bc3WrVlEByj2jtQtmklitDTRhOU=; b=OTlOyB9WwcjLOvQvfh7xU2KCUc
 tiXAXSH66WT8kGH44M8eINhTDMYtmJCHyyzRr2MrVCIab9nXUGi25HOz5/J/fWaRIgT4orvVFk0aB
 ZQ4UsHzlhNnqydnsFLOYK2eZv3k9mQzxTWhVSRxHj9Qm2GtE1lH/YzxlQV4iFN/svLnRij9xvpwQv
 XZiUZaduenhMJfWN++HX0TCCsGuhlG3phL048CHZ9DNttvZXVss4lgOEvj4NRNDdbop1sP/wyZEng
 phL/yPMKJ1qmKZZ5mfW2xeCsX45unEKwDQIp8V4wNlVBAPqtwzZy21i+lVOEPzRwbHyRkZfipqmPL
 mO20Txyg==;
Received: from [2001:4bb8:188:1b1:5a9e:9f39:5a86:b20c] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGMLF-003uhx-Uo; Wed, 18 Aug 2021 14:15:26 +0000
From: Christoph Hellwig <hch@lst.de>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Date: Wed, 18 Aug 2021 16:06:46 +0200
Message-Id: <20210818140651.17181-7-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818140651.17181-1-hch@lst.de>
References: <20210818140651.17181-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal information
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mGMNS-0007vl-95
Subject: [f2fs-dev] [PATCH 06/11] unicode: remove the unused utf8{, n}age{min,
 max} functions
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

No actually used anywhere.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/unicode/utf8-norm.c | 113 -----------------------------------------
 fs/unicode/utf8n.h     |  16 ------
 2 files changed, 129 deletions(-)

diff --git a/fs/unicode/utf8-norm.c b/fs/unicode/utf8-norm.c
index 12abf89ae6ec..4b1b53391ce4 100644
--- a/fs/unicode/utf8-norm.c
+++ b/fs/unicode/utf8-norm.c
@@ -391,119 +391,6 @@ static utf8leaf_t *utf8lookup(const struct utf8data *data,
 	return utf8nlookup(data, hangul, s, (size_t)-1);
 }
 
-/*
- * Maximum age of any character in s.
- * Return -1 if s is not valid UTF-8 unicode.
- * Return 0 if only non-assigned code points are used.
- */
-int utf8agemax(const struct utf8data *data, const char *s)
-{
-	utf8leaf_t	*leaf;
-	int		age = 0;
-	int		leaf_age;
-	unsigned char	hangul[UTF8HANGULLEAF];
-
-	if (!data)
-		return -1;
-
-	while (*s) {
-		leaf = utf8lookup(data, hangul, s);
-		if (!leaf)
-			return -1;
-
-		leaf_age = utf8agetab[LEAF_GEN(leaf)];
-		if (leaf_age <= data->maxage && leaf_age > age)
-			age = leaf_age;
-		s += utf8clen(s);
-	}
-	return age;
-}
-EXPORT_SYMBOL(utf8agemax);
-
-/*
- * Minimum age of any character in s.
- * Return -1 if s is not valid UTF-8 unicode.
- * Return 0 if non-assigned code points are used.
- */
-int utf8agemin(const struct utf8data *data, const char *s)
-{
-	utf8leaf_t	*leaf;
-	int		age;
-	int		leaf_age;
-	unsigned char	hangul[UTF8HANGULLEAF];
-
-	if (!data)
-		return -1;
-	age = data->maxage;
-	while (*s) {
-		leaf = utf8lookup(data, hangul, s);
-		if (!leaf)
-			return -1;
-		leaf_age = utf8agetab[LEAF_GEN(leaf)];
-		if (leaf_age <= data->maxage && leaf_age < age)
-			age = leaf_age;
-		s += utf8clen(s);
-	}
-	return age;
-}
-EXPORT_SYMBOL(utf8agemin);
-
-/*
- * Maximum age of any character in s, touch at most len bytes.
- * Return -1 if s is not valid UTF-8 unicode.
- */
-int utf8nagemax(const struct utf8data *data, const char *s, size_t len)
-{
-	utf8leaf_t	*leaf;
-	int		age = 0;
-	int		leaf_age;
-	unsigned char	hangul[UTF8HANGULLEAF];
-
-	if (!data)
-		return -1;
-
-	while (len && *s) {
-		leaf = utf8nlookup(data, hangul, s, len);
-		if (!leaf)
-			return -1;
-		leaf_age = utf8agetab[LEAF_GEN(leaf)];
-		if (leaf_age <= data->maxage && leaf_age > age)
-			age = leaf_age;
-		len -= utf8clen(s);
-		s += utf8clen(s);
-	}
-	return age;
-}
-EXPORT_SYMBOL(utf8nagemax);
-
-/*
- * Maximum age of any character in s, touch at most len bytes.
- * Return -1 if s is not valid UTF-8 unicode.
- */
-int utf8nagemin(const struct utf8data *data, const char *s, size_t len)
-{
-	utf8leaf_t	*leaf;
-	int		leaf_age;
-	int		age;
-	unsigned char	hangul[UTF8HANGULLEAF];
-
-	if (!data)
-		return -1;
-	age = data->maxage;
-	while (len && *s) {
-		leaf = utf8nlookup(data, hangul, s, len);
-		if (!leaf)
-			return -1;
-		leaf_age = utf8agetab[LEAF_GEN(leaf)];
-		if (leaf_age <= data->maxage && leaf_age < age)
-			age = leaf_age;
-		len -= utf8clen(s);
-		s += utf8clen(s);
-	}
-	return age;
-}
-EXPORT_SYMBOL(utf8nagemin);
-
 /*
  * Length of the normalization of s.
  * Return -1 if s is not valid UTF-8 unicode.
diff --git a/fs/unicode/utf8n.h b/fs/unicode/utf8n.h
index 85a7bebf6927..e4c8a767cf7a 100644
--- a/fs/unicode/utf8n.h
+++ b/fs/unicode/utf8n.h
@@ -33,22 +33,6 @@ int utf8version_is_supported(unsigned int version);
 extern const struct utf8data *utf8nfdi(unsigned int maxage);
 extern const struct utf8data *utf8nfdicf(unsigned int maxage);
 
-/*
- * Determine the maximum age of any unicode character in the string.
- * Returns 0 if only unassigned code points are present.
- * Returns -1 if the input is not valid UTF-8.
- */
-extern int utf8agemax(const struct utf8data *data, const char *s);
-extern int utf8nagemax(const struct utf8data *data, const char *s, size_t len);
-
-/*
- * Determine the minimum age of any unicode character in the string.
- * Returns 0 if any unassigned code points are present.
- * Returns -1 if the input is not valid UTF-8.
- */
-extern int utf8agemin(const struct utf8data *data, const char *s);
-extern int utf8nagemin(const struct utf8data *data, const char *s, size_t len);
-
 /*
  * Determine the length of the normalized from of the string,
  * excluding any terminating NULL byte.
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
