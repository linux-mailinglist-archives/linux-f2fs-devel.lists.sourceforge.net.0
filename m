Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A50340C008
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Sep 2021 09:04:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mQOxp-00029B-NN; Wed, 15 Sep 2021 07:04:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+8aa05ddd91fea3e0ef51+6597+infradead.org+hch@casper.srs.infradead.org>)
 id 1mQOxn-000294-3k
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Sep 2021 07:04:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xRexORlxlpSmmPQ2VemF90E+SWhy7i1/m1bX7rSd2nk=; b=WRpWq1OWlw4pRiFfJGDOFwxY0L
 86r7sK6UEta6d76yBakiwwdvS2WHagfOjMYv//ha20fiUYXDd4XAQwc3LA9vOg+2clrMUjkMUKaOc
 X8qYm5IlyhL+3WrytaymjNBi2Z4SmkitXBwlTp6ZWm5q3OuDcKBHwbliTnTYtLKZ4Hic=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xRexORlxlpSmmPQ2VemF90E+SWhy7i1/m1bX7rSd2nk=; b=h47z8+GsFKm+WKeArmXr0pCh06
 6u9y2P6S8pwIU0l7QzKDGwBLDuNZbooJZuWsbd1br57lHdYDCAnc9Y5k0PN9tTbXSbWlBCyyMmkhc
 8Njo38G6iHJqxs+5i4yDJoQqQuYG4I9HfBIRYZnTn7eIuBIkHvPzvTZwXWdTfuleUMl4=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mQOxm-0008Qf-KI
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Sep 2021 07:04:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=xRexORlxlpSmmPQ2VemF90E+SWhy7i1/m1bX7rSd2nk=; b=KoIB+YbvzUAPZywXg+BLeMZY1z
 fs0NZnlOkeF6jjQUAYl5WsIYaZhHgfKSUDnlFjwQglFNbJ5RVtDndDcom/6T0dkA+4qFlqNqjvRBV
 odEFv0cY/AzqUkGyfrXqIu6rIUp9txkVeyfulDat9pqM6JKkaIYBJ1U1D64hPkjwpG1z42rtCnPsX
 ULCmLTXRpwTZMjmGTqyJSBzwWyIUbHpJw8ov7j2j48L5CDx5InaHAaSEmOKMr4jLwuQR9G/QVYrO+
 LzYumvJp3jtMDGYmuusa/KDCmRK76kf55Vut1CTZRwkAtZ5rc9nB5FLL6rq9uTJ6GhrJ65zKmszSV
 frEKlROw==;
Received: from [2001:4bb8:184:72db:8457:d7a:6e21:dd20] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQOwP-00FRZJ-OT; Wed, 15 Sep 2021 07:03:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Date: Wed, 15 Sep 2021 08:59:59 +0200
Message-Id: <20210915070006.954653-5-hch@lst.de>
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
 Content preview: unicode version tripplets are always unsigned. Signed-off-by:
 Christoph Hellwig <hch@lst.de> Reviewed-by: Gabriel Krisman Bertazi
 <krisman@collabora.com>
 --- include/linux/unicode.h | 2 +- 1 file changed, 1 insertion(+),
 1 deletion(-)
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
X-Headers-End: 1mQOxm-0008Qf-KI
Subject: [f2fs-dev] [PATCH 04/11] unicode: mark the version field in struct
 unicode_map unsigned
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

unicode version tripplets are always unsigned.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 include/linux/unicode.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/unicode.h b/include/linux/unicode.h
index 6a392cd9f076d..0744f81c4b5fc 100644
--- a/include/linux/unicode.h
+++ b/include/linux/unicode.h
@@ -6,7 +6,7 @@
 #include <linux/dcache.h>
 
 struct unicode_map {
-	int version;
+	unsigned int version;
 };
 
 int utf8_validate(const struct unicode_map *um, const struct qstr *str);
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
