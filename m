Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF9C3F0669
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Aug 2021 16:19:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mGMQ7-0000BK-MB; Wed, 18 Aug 2021 14:19:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from
 <BATV+c26a8f31a710de91e748+6569+infradead.org+hch@casper.srs.infradead.org>)
 id 1mGMQ5-0000BC-Tw
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 14:19:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XRJcay04c4+HGP8hA0k71ugb0TyE1umxocLGpm5yt80=; b=KH+cv+qmL1oaL5xmL/D0zQ6EPQ
 VSht2EeHdHnTfqgXvxf09HMw8PLuX0EOMesEPuIbrLsCpaYfr2seYfon8NXOi8eiT1frFj+8+8VjA
 LlUCPf6H8iX87RExqT/otWDqXkwUKsJfF0EkoI72jPsb/0bQo5bR8qpNvDRXYEbJ9Co0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XRJcay04c4+HGP8hA0k71ugb0TyE1umxocLGpm5yt80=; b=GVniBZ+H5u+7W6VC4zMuy1Kzcf
 J+OLc8lj5cwdj5GgfENSzEMFjA7zzLevROIg153cymD04Dwu5wLarxU2Cfdf6nWu9i48/RCJ9H/ZR
 5t65Velu6jUC5dRnOyxwzlKhSohJ1Bplt7d/FHF/uKsPTz3eKUdQXmQq28o/pUjh8NhE=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mGMQ4-00AXw0-FE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 14:19:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=XRJcay04c4+HGP8hA0k71ugb0TyE1umxocLGpm5yt80=; b=iVm0ncHopjP/X9nEmDSlzFnERU
 JKbD0lCGfy7zwAjuiKHB3s5gAxtodQVEZDAjn+Gfn/4dm2VXdzxQhP8PWZ8Zoe4ReKH21Zv6sH1bW
 QmEvKCjp501xWmFSz51Bi1HpWBxQScfahXr/7jACyvcd5MpImceC7PByna31Z7Vh19bZGqJvXhnt2
 xKBMfyWNHJ30rXvh0R9pZfwvfBa/Mzq2K/EVeiHRYbLWyrJpz8s15qSJdsGGh45/sZb+u/bJZ+/NG
 nkE/R1+VDD3bafiXiyn8PuW9kcnC7Tspn9v0MszsilEv545lvAJKyijYWBr8jaArsDB3DHCMMe2P1
 mcmP3XxQ==;
Received: from [2001:4bb8:188:1b1:5a9e:9f39:5a86:b20c] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGMOU-003uwG-4s; Wed, 18 Aug 2021 14:18:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Date: Wed, 18 Aug 2021 16:06:48 +0200
Message-Id: <20210818140651.17181-9-hch@lst.de>
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
 Content preview:  Only used by the tests, so no need to keep it in the core.
 Signed-off-by: Christoph Hellwig <hch@lst.de> --- fs/unicode/utf8-norm.c
 | 16 fs/unicode/utf8-selftest.c | 6 ++++++ fs/unicode/utf8n.h | 2 -- 3 files
 changed, 6 insertions(+), 18 dele [...] 
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
X-Headers-End: 1mGMQ4-00AXw0-FE
Subject: [f2fs-dev] [PATCH 08/11] unicode: move utf8cursor to utf8-selftest.c
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

Only used by the tests, so no need to keep it in the core.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/unicode/utf8-norm.c     | 16 ----------------
 fs/unicode/utf8-selftest.c |  6 ++++++
 fs/unicode/utf8n.h         |  2 --
 3 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/fs/unicode/utf8-norm.c b/fs/unicode/utf8-norm.c
index 348d6e97553f..1ac90fa00070 100644
--- a/fs/unicode/utf8-norm.c
+++ b/fs/unicode/utf8-norm.c
@@ -456,22 +456,6 @@ int utf8ncursor(struct utf8cursor *u8c, const struct utf8data *data,
 }
 EXPORT_SYMBOL(utf8ncursor);
 
-/*
- * Set up an utf8cursor for use by utf8byte().
- *
- *   u8c    : pointer to cursor.
- *   data   : const struct utf8data to use for normalization.
- *   s      : NUL-terminated string.
- *
- * Returns -1 on error, 0 on success.
- */
-int utf8cursor(struct utf8cursor *u8c, const struct utf8data *data,
-	       const char *s)
-{
-	return utf8ncursor(u8c, data, s, (unsigned int)-1);
-}
-EXPORT_SYMBOL(utf8cursor);
-
 /*
  * Get one byte from the normalized form of the string described by u8c.
  *
diff --git a/fs/unicode/utf8-selftest.c b/fs/unicode/utf8-selftest.c
index 80fb7c75acb2..04628b50351d 100644
--- a/fs/unicode/utf8-selftest.c
+++ b/fs/unicode/utf8-selftest.c
@@ -165,6 +165,12 @@ static ssize_t utf8len(const struct utf8data *data, const char *s)
 	return utf8nlen(data, s, (size_t)-1);
 }
 
+static int utf8cursor(struct utf8cursor *u8c, const struct utf8data *data,
+		const char *s)
+{
+	return utf8ncursor(u8c, data, s, (unsigned int)-1);
+}
+
 static void check_utf8_nfdi(void)
 {
 	int i;
diff --git a/fs/unicode/utf8n.h b/fs/unicode/utf8n.h
index 41182e5464df..736b6460a38c 100644
--- a/fs/unicode/utf8n.h
+++ b/fs/unicode/utf8n.h
@@ -65,8 +65,6 @@ struct utf8cursor {
  * Returns 0 on success.
  * Returns -1 on failure.
  */
-extern int utf8cursor(struct utf8cursor *u8c, const struct utf8data *data,
-		      const char *s);
 extern int utf8ncursor(struct utf8cursor *u8c, const struct utf8data *data,
 		       const char *s, size_t len);
 
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
