Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E93123F0600
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Aug 2021 16:14:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mGMKR-0006ZY-BK; Wed, 18 Aug 2021 14:14:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+c26a8f31a710de91e748+6569+infradead.org+hch@casper.srs.infradead.org>)
 id 1mGMKP-0006ZG-7Q
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 14:14:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z4MCNHhCspLoQHSiqkbpMAHembWOXPJmB4CL3aOqh6g=; b=hR4qJr0cXUmha+u4QQ03Ur9TxO
 TFI3WHMW4teHqJGvwBkiUSNQxdqB4ojGAImnurkA/s8u09KNgDpUmhGK2DTegli5hSlHaKxguoWfU
 28D8fT87M3rgbVdUNWBtW7hw2AAqm3ztvHX27+aKcnHEHfbN80hkokuNmwvEKoC60Z6I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z4MCNHhCspLoQHSiqkbpMAHembWOXPJmB4CL3aOqh6g=; b=IoQoEuXXYOlz5c2EeUZdQXDdKa
 W251fjOgWt4DLS5U5iUqd9M/6MDnkU4zYMJ98uwSIVU91eiW3eC6Q1JOZZnJoZiiyRtkJWsP5Z8AZ
 7keMov+eP+b4HxH5nD9pew32a0ksUFFmedvDxX/vvZhl/CKVjGkGcXoK9eK4hnzhxqWc=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mGMKO-00AXZf-2D
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 14:14:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=z4MCNHhCspLoQHSiqkbpMAHembWOXPJmB4CL3aOqh6g=; b=COcvMN76XdyCfAhgJuQ6dMLnms
 g2IC3e0WnV44+jc6XPYsI2NMnGfT7OMvlRZWG4Cb99F62uWbMbl1iUGWNqX0UH4RYk0nbaWDFzCq6
 mOB2nUeAmCS07Vir/rd8JTwGFshFfRRHQ44JW6pWbwPgCcMzspHj/JZYZ6XFJRuI6AVyZEV6m8aAG
 SgeTDqVXx9vg8onhQra9ltQA8brZFPxwYyoRILGm0keb3gtJeZ/pGx0oNu+5Im7s1sSQBhURkBUZ3
 EeeLqXbCKT4rzRIYDlKZXnB1D1ElKy433b2PcBXyH8WgVx6fJ+JR93nORvhtY9uUCpT3nXQ5G6L+g
 rQ7wDHwQ==;
Received: from [2001:4bb8:188:1b1:5a9e:9f39:5a86:b20c] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGMIE-003uZE-Pc; Wed, 18 Aug 2021 14:12:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Date: Wed, 18 Aug 2021 16:06:44 +0200
Message-Id: <20210818140651.17181-5-hch@lst.de>
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
 Content preview: unicode version tripplets are always unsigned. Signed-off-by:
 Christoph Hellwig <hch@lst.de> --- include/linux/unicode.h | 2 +- 1 file
 changed, 1 insertion(+), 1 deletion(-) diff --git a/include/linux/unicode.h
 b/include/linux/unicode.h index 6a392cd9f076..0744f81c4b5f 100644 ---
 a/include/linux/unicode.h
 +++ b/include/linux/unicode.h @@ -6,7 +6,7 @@ #include <linux/dcach [...]
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
X-Headers-End: 1mGMKO-00AXZf-2D
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
---
 include/linux/unicode.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/unicode.h b/include/linux/unicode.h
index 6a392cd9f076..0744f81c4b5f 100644
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
