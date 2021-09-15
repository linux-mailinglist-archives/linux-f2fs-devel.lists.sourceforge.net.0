Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B9740C004
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Sep 2021 09:03:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mQOwz-0004V0-GP; Wed, 15 Sep 2021 07:03:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+8aa05ddd91fea3e0ef51+6597+infradead.org+hch@casper.srs.infradead.org>)
 id 1mQOwp-0004Th-I2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Sep 2021 07:03:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VKaffHFWSRm/yCMplD53VSse+hztiHYRn8PjIcWPpKM=; b=eBerPI6BzIU1bdroI2Yx6iwibw
 v0380o27k7iWx0ukyXjFSfOBSmaiNEf6iiOXbYi38HjqrMLheNtgRizK5TedZt/0F0iFDkvxHsKwA
 JVKLaMbduSgHGkKJCi8f50OfhmkeHItkVIMmmXQA8O7z8yclvmy5rjVyQyC/s0p5WADQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VKaffHFWSRm/yCMplD53VSse+hztiHYRn8PjIcWPpKM=; b=hLGUI/+eqPJjXI+qw8EKM21e0X
 x60uSx9m9sTQFyiah6QraTYdIHd0J6DYRtdNnnyKpXNYBCQqLp0y2AcaMLVwkJaRx9WAcOcrT6iqF
 PQV9vZ/g/b6JIiYEMIqLdWsBlQrYJkv/H13b2KT7gcR8qBmTThQv8GQswLZrdhJBUkLQ=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mQOwl-00BFRC-N2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Sep 2021 07:03:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=VKaffHFWSRm/yCMplD53VSse+hztiHYRn8PjIcWPpKM=; b=uj0Ofy7XgP6OgXzPjYT8sCdKLc
 NyBvXZ86VKghnXyKlkxoMWuRNlBSau2Cr0BiTRWjUDSRpnAawHCTSILZdvrnFSxd3moUbiGYM8vy2
 c2Tfs81/1HqrptgNOsTQawhO7eYpM537/9imvqmO2kTcuzm/IqqLEqxaEovwfBC58+sqT7XajvSOR
 xmvYVaPxQXYGMV8dEdtqoaltpm2wXWY9CTVK3Wm2ADGfmee+MHxTpKo5rKZSiKHX4y3uvfstGK0sa
 GGbxM6FNbNZKbmPafz0eN7lmthZBfKG2ElatGu44y2ZSy3RJtINa9QxVnhlNYXN7qT3Q7sus+FNwa
 LgQYwCnw==;
Received: from [2001:4bb8:184:72db:8457:d7a:6e21:dd20] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQOvd-00FRXp-O7; Wed, 15 Sep 2021 07:02:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Date: Wed, 15 Sep 2021 08:59:58 +0200
Message-Id: <20210915070006.954653-4-hch@lst.de>
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
 Content preview:  It is hardcoded and only used for a f2fs sysfs file where
 it can be hardcoded just as easily. Signed-off-by: Christoph Hellwig
 <hch@lst.de>
 Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com> ---
 fs/f2fs/sysfs.c
 | 3 +-- fs/unicode/utf8-core.c | 3 --- include/linux/unicode.h | 1 - 3 fi
 [...] Content analysis details:   (0.2 points, 6.0 required)
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
X-Headers-End: 1mQOwl-00BFRC-N2
Subject: [f2fs-dev] [PATCH 03/11] unicode: remove the charset field from
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

It is hardcoded and only used for a f2fs sysfs file where it can be
hardcoded just as easily.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 fs/f2fs/sysfs.c         | 3 +--
 fs/unicode/utf8-core.c  | 3 ---
 include/linux/unicode.h | 1 -
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index a32fe31c33b8e..650e84398f744 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -196,8 +196,7 @@ static ssize_t encoding_show(struct f2fs_attr *a,
 	struct super_block *sb = sbi->sb;
 
 	if (f2fs_sb_has_casefold(sbi))
-		return snprintf(buf, PAGE_SIZE, "%s (%d.%d.%d)\n",
-			sb->s_encoding->charset,
+		return snprintf(buf, PAGE_SIZE, "UTF-8 (%d.%d.%d)\n",
 			(sb->s_encoding->version >> 16) & 0xff,
 			(sb->s_encoding->version >> 8) & 0xff,
 			sb->s_encoding->version & 0xff);
diff --git a/fs/unicode/utf8-core.c b/fs/unicode/utf8-core.c
index dc25823bfed96..86f42a078d99b 100644
--- a/fs/unicode/utf8-core.c
+++ b/fs/unicode/utf8-core.c
@@ -219,10 +219,7 @@ struct unicode_map *utf8_load(const char *version)
 	um = kzalloc(sizeof(struct unicode_map), GFP_KERNEL);
 	if (!um)
 		return ERR_PTR(-ENOMEM);
-
-	um->charset = "UTF-8";
 	um->version = unicode_version;
-
 	return um;
 }
 EXPORT_SYMBOL(utf8_load);
diff --git a/include/linux/unicode.h b/include/linux/unicode.h
index 74484d44c7554..6a392cd9f076d 100644
--- a/include/linux/unicode.h
+++ b/include/linux/unicode.h
@@ -6,7 +6,6 @@
 #include <linux/dcache.h>
 
 struct unicode_map {
-	const char *charset;
 	int version;
 };
 
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
