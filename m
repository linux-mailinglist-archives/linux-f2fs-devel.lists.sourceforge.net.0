Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4913F065E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Aug 2021 16:18:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mGMOv-0006h4-SO; Wed, 18 Aug 2021 14:18:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+c26a8f31a710de91e748+6569+infradead.org+hch@casper.srs.infradead.org>)
 id 1mGMOu-0006gy-80
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 14:18:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LK8VlrRcKR0O2tJY3isCs3pM/e17RyWbKPDimZLEThA=; b=nGhDkMl30J/bApx/yi9CyncFzB
 Q5dTrjpiMBtYtN2lrnlxkVludAiGFYEaPVwYZcb+hZWJuNuprhcJbXdQhU2EU/smIEggRRG2wgq3a
 YDE8oseKUhNN7CvYXfghPA7UYcNBRWRxtAx0dycrk++BkhesjnGweUXMU70+e5bX67Bw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LK8VlrRcKR0O2tJY3isCs3pM/e17RyWbKPDimZLEThA=; b=cPgFHWF13t90zyBcoz//nYPIE6
 voFxttYSHF8nqt8tqDB22MxZOsL3LxPGuW6xAzctYcuNI/a+YtvORWVHvxUcSMyT3Edq/o8w1G6fG
 6oraol+gtbnkISif/xwQSc2/SWzMRX0SjJdjkiYMuWBazM95i4LeQHgrryTzTwoqgMWU=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mGMOs-00081a-WE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 14:18:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=LK8VlrRcKR0O2tJY3isCs3pM/e17RyWbKPDimZLEThA=; b=SaqTl615icihQdyj6cH4ZebOOY
 CqeeoB06hXy/5ZM5skyZ78sQVNip29QpdM9j85yX/SFLsWLpUAcoPHIU/Gqt5VV7SJBuNhPZfUJ8Q
 g9hTb0kCU+dKAcmGLsmpywLzdu+EvYilR0Ivo5PWtGU56Uj2FFBlXzonIV0iHe2SWXyCdKOw3gpLI
 uP60aLYIigfzV5uKBoVLPrhGQjKRmmpKqHXiW8k9Bb6phAzpp7LsS2+kShH8tQ5ZEKNLwhc14+JP4
 I8P1rMGI+rnia2acIGH7zrH2dNt41qTZuaZ0Umdzua6iBCC8Kg+NQ1cMduVzkuNyK1idOLtn1pdyN
 2XLJzoIw==;
Received: from [2001:4bb8:188:1b1:5a9e:9f39:5a86:b20c] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGMN1-003un9-7F; Wed, 18 Aug 2021 14:17:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Date: Wed, 18 Aug 2021 16:06:47 +0200
Message-Id: <20210818140651.17181-8-hch@lst.de>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mGMOs-00081a-WE
Subject: [f2fs-dev] [PATCH 07/11] unicode: simplify utf8len
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

Just use the utf8nlen implementation with a (size_t)-1 len argument,
similar to utf8_lookup.  Also move the function to utf8-selftest.c, as
it isn't used anywhere else.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/unicode/utf8-norm.c     | 30 ------------------------------
 fs/unicode/utf8-selftest.c |  5 +++++
 fs/unicode/utf8n.h         |  1 -
 3 files changed, 5 insertions(+), 31 deletions(-)

diff --git a/fs/unicode/utf8-norm.c b/fs/unicode/utf8-norm.c
index 4b1b53391ce4..348d6e97553f 100644
--- a/fs/unicode/utf8-norm.c
+++ b/fs/unicode/utf8-norm.c
@@ -391,36 +391,6 @@ static utf8leaf_t *utf8lookup(const struct utf8data *data,
 	return utf8nlookup(data, hangul, s, (size_t)-1);
 }
 
-/*
- * Length of the normalization of s.
- * Return -1 if s is not valid UTF-8 unicode.
- *
- * A string of Default_Ignorable_Code_Point has length 0.
- */
-ssize_t utf8len(const struct utf8data *data, const char *s)
-{
-	utf8leaf_t	*leaf;
-	size_t		ret = 0;
-	unsigned char	hangul[UTF8HANGULLEAF];
-
-	if (!data)
-		return -1;
-	while (*s) {
-		leaf = utf8lookup(data, hangul, s);
-		if (!leaf)
-			return -1;
-		if (utf8agetab[LEAF_GEN(leaf)] > data->maxage)
-			ret += utf8clen(s);
-		else if (LEAF_CCC(leaf) == DECOMPOSE)
-			ret += strlen(LEAF_STR(leaf));
-		else
-			ret += utf8clen(s);
-		s += utf8clen(s);
-	}
-	return ret;
-}
-EXPORT_SYMBOL(utf8len);
-
 /*
  * Length of the normalization of s, touch at most len bytes.
  * Return -1 if s is not valid UTF-8 unicode.
diff --git a/fs/unicode/utf8-selftest.c b/fs/unicode/utf8-selftest.c
index 37f33890e012..80fb7c75acb2 100644
--- a/fs/unicode/utf8-selftest.c
+++ b/fs/unicode/utf8-selftest.c
@@ -160,6 +160,11 @@ static const struct {
 	}
 };
 
+static ssize_t utf8len(const struct utf8data *data, const char *s)
+{
+	return utf8nlen(data, s, (size_t)-1);
+}
+
 static void check_utf8_nfdi(void)
 {
 	int i;
diff --git a/fs/unicode/utf8n.h b/fs/unicode/utf8n.h
index e4c8a767cf7a..41182e5464df 100644
--- a/fs/unicode/utf8n.h
+++ b/fs/unicode/utf8n.h
@@ -39,7 +39,6 @@ extern const struct utf8data *utf8nfdicf(unsigned int maxage);
  * Returns 0 if only ignorable code points are present.
  * Returns -1 if the input is not valid UTF-8.
  */
-extern ssize_t utf8len(const struct utf8data *data, const char *s);
 extern ssize_t utf8nlen(const struct utf8data *data, const char *s, size_t len);
 
 /* Needed in struct utf8cursor below. */
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
