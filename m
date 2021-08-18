Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5805A3F0697
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Aug 2021 16:23:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mGMTb-0008BV-UJ; Wed, 18 Aug 2021 14:23:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+c26a8f31a710de91e748+6569+infradead.org+hch@casper.srs.infradead.org>)
 id 1mGMTa-0008BC-PJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 14:23:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EItct/4LybJFgbzlVrgpqSv7WDkE+DpQx7uqSXk8vHY=; b=BTJqg+HKeKifTy21HPaX/uHPn3
 w2iKtAYGxKudxM3hE2D/fnTiZnBbP4lomaWoU/szf9qdsEe/f0aWjsL55kr5ETBDA+8gZSte4HhYq
 EPL9DhUHKd41vpfnsSTDTR39v9vYzvjmjkmpl+rQlP0+FD+TaXHt0vvv08h+Ttb0h6kw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EItct/4LybJFgbzlVrgpqSv7WDkE+DpQx7uqSXk8vHY=; b=f639h8cJcfcTvFj0Uyty47vWoa
 hXf6h+US2rlV0T3AD0ruoz/gluJdYE1CK9tqruIR+W+FtNGtEnpZhSVYnNtNmjTweC9nv4edgsvve
 2d8NxYKKjQBkDfJgEDLrrJCrd/T3WPnI57DdHf3oRtGPk68ZDGbW3qDtq/A6oGNlacaI=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mGMTa-00AYCP-9W
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 14:23:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=EItct/4LybJFgbzlVrgpqSv7WDkE+DpQx7uqSXk8vHY=; b=Oi9YlwS38JMx8g2TCuOBCZ/rGs
 FvpX/QMst217W1jvJ/yiGztjw5E2p9zV9VDhXbodHOXs9Gb2Ka2LUWolbL4+Q0sF+deWk9K6/lRAI
 RN76vlgkG69i1yiVq0wX/GGS8/8xmU24iFYX7fdR23FRDtBRYs7N2Wvcfs6U2eo6C0tcQ8+USY4bn
 03ZTm/qeArw87v+PRoTkOmIAuoruSYRtkoZPK/J0QMITKJd1ZX9FxM+eWsrfruc5qodR2tx5vNkWA
 f6spZbtYv/Xs2ApMtsuX9sNdXziaMqzs4Eqm1GMLiGKD9xdioADPx4Op+s39mNMwQLAnzgS8LDAHY
 LtaUuS0Q==;
Received: from [2001:4bb8:188:1b1:5a9e:9f39:5a86:b20c] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGMRk-003vEu-0m; Wed, 18 Aug 2021 14:21:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Date: Wed, 18 Aug 2021 16:06:51 +0200
Message-Id: <20210818140651.17181-12-hch@lst.de>
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
 Content preview: The exported symbols in utf8-norm.c are not needed for normal
 file system consumers, so move them to conditional _GPL exports just for
 the selftest. Signed-off-by: Christoph Hellwig <hch@lst.de> ---
 fs/unicode/utf8-norm.c
 | 11 +++++++---- 1 file changed, 7 insertions(+), 4 deletions(-) 
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
X-Headers-End: 1mGMTa-00AYCP-9W
Subject: [f2fs-dev] [PATCH 11/11] unicode: only export internal symbols for
 the selftests
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

The exported symbols in utf8-norm.c are not needed for normal
file system consumers, so move them to conditional _GPL exports
just for the selftest.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/unicode/utf8-norm.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/fs/unicode/utf8-norm.c b/fs/unicode/utf8-norm.c
index 829c7e2ad764..768f8ab448b8 100644
--- a/fs/unicode/utf8-norm.c
+++ b/fs/unicode/utf8-norm.c
@@ -17,7 +17,6 @@ int utf8version_is_supported(const struct unicode_map *um, unsigned int version)
 	}
 	return 0;
 }
-EXPORT_SYMBOL(utf8version_is_supported);
 
 /*
  * UTF-8 valid ranges.
@@ -407,7 +406,6 @@ ssize_t utf8nlen(const struct unicode_map *um, enum utf8_normalization n,
 	}
 	return ret;
 }
-EXPORT_SYMBOL(utf8nlen);
 
 /*
  * Set up an utf8cursor for use by utf8byte().
@@ -442,7 +440,6 @@ int utf8ncursor(struct utf8cursor *u8c, const struct unicode_map *um,
 		return -1;
 	return 0;
 }
-EXPORT_SYMBOL(utf8ncursor);
 
 /*
  * Get one byte from the normalized form of the string described by u8c.
@@ -588,4 +585,10 @@ int utf8byte(struct utf8cursor *u8c)
 		}
 	}
 }
-EXPORT_SYMBOL(utf8byte);
+
+#ifdef CONFIG_UNICODE_NORMALIZATION_SELFTEST_MODULE
+EXPORT_SYMBOL_GPL(utf8version_is_supported);
+EXPORT_SYMBOL_GPL(utf8nlen);
+EXPORT_SYMBOL_GPL(utf8ncursor);
+EXPORT_SYMBOL_GPL(utf8byte);
+#endif
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
