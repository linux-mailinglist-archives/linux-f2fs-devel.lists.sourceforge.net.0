Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 736EB3F05CC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Aug 2021 16:10:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mGMGW-0006Sh-R9; Wed, 18 Aug 2021 14:10:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+c26a8f31a710de91e748+6569+infradead.org+hch@casper.srs.infradead.org>)
 id 1mGMGU-0006Sb-H6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 14:09:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cibSNcvbBNy3d99J0xcybasLYRaPm2YAac4xI0ywMu8=; b=BYC+ePE8P9rZ+Spu4hoG7FkWSk
 z648c6msQdaybVkhtixQpR36gOkLKAfI04WNgzKMklUw8KRqYE6926LZOt5dO1V3oDyKuKAUc1mae
 eMrKkjKVDIkw8pLI0CEW+FQ98g5n1UI3m95oZlZ3eBSky1h12vlEqSSJtUUL3IDy//fs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cibSNcvbBNy3d99J0xcybasLYRaPm2YAac4xI0ywMu8=; b=QluVAEOAiaJBoKFICeV0jNOmG7
 dtl9auIbsdJqOKdbj6GssSU6+84gPNHCuAGi0QAdMnr36UcIkhUzz0epUbkTLGHGcSxt27Q/F4B6H
 de1sQda2UFGEtsp8GrIfWBoiPQ7b5xWXOA4M/v6gKNknKgadQb9mXBZFhbuurM2MEWLw=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mGMGS-0007Uc-NS
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 14:09:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=cibSNcvbBNy3d99J0xcybasLYRaPm2YAac4xI0ywMu8=; b=dlWPccbA45UR38UUdOxp+hXJ6w
 k6xHpfeWjanPnLTGesnuRrC3bHSxpNX/PaH/BecYbfmTwtflh1+SKGdZcgHlwoOUWnfwS+QJEWLAJ
 2UgSTJSSgmxNuzobdkYK0nSL66Q8eB8PvsYAHQfv0aMC4zwVMQ1/CuOVNrOIfkeYz2TfGj5wGB3jV
 T+xRI+oCQZB+H+vTJw0TYgFzT4yy6pSb4ScX+H8xP5achbWhvZia0Zom9WSkg0NOnclkRFfaaGAXT
 MSOQPRxTqS4K6//RXhEwyAaeum4IKnrAYqqhdz5p0InvM23dKMsNFoXwhDrvd7WdAOelONE+lX613
 KEDaOecA==;
Received: from [2001:4bb8:188:1b1:5a9e:9f39:5a86:b20c] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGMEZ-003uKw-LT; Wed, 18 Aug 2021 14:08:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Date: Wed, 18 Aug 2021 16:06:41 +0200
Message-Id: <20210818140651.17181-2-hch@lst.de>
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
X-Headers-End: 1mGMGS-0007Uc-NS
Subject: [f2fs-dev] [PATCH 01/11] ext4: simplify ext4_sb_read_encoding
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

Return the encoding table as the return value instead of as an argument,
and don't bother with the encoding flags as the caller can handle that
trivially.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ext4/super.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index dfa09a277b56..a68be582bba5 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -2021,24 +2021,17 @@ static const struct ext4_sb_encodings {
 	{EXT4_ENC_UTF8_12_1, "utf8", "12.1.0"},
 };
 
-static int ext4_sb_read_encoding(const struct ext4_super_block *es,
-				 const struct ext4_sb_encodings **encoding,
-				 __u16 *flags)
+static const struct ext4_sb_encodings *
+ext4_sb_read_encoding(const struct ext4_super_block *es)
 {
 	__u16 magic = le16_to_cpu(es->s_encoding);
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(ext4_sb_encoding_map); i++)
 		if (magic == ext4_sb_encoding_map[i].magic)
-			break;
-
-	if (i >= ARRAY_SIZE(ext4_sb_encoding_map))
-		return -EINVAL;
+			return &ext4_sb_encoding_map[i];
 
-	*encoding = &ext4_sb_encoding_map[i];
-	*flags = le16_to_cpu(es->s_encoding_flags);
-
-	return 0;
+	return NULL;
 }
 #endif
 
@@ -4303,10 +4296,10 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
 	if (ext4_has_feature_casefold(sb) && !sb->s_encoding) {
 		const struct ext4_sb_encodings *encoding_info;
 		struct unicode_map *encoding;
-		__u16 encoding_flags;
+		__u16 encoding_flags = le16_to_cpu(es->s_encoding_flags);
 
-		if (ext4_sb_read_encoding(es, &encoding_info,
-					  &encoding_flags)) {
+		encoding_info = ext4_sb_read_encoding(es);
+		if (!encoding_info) {
 			ext4_msg(sb, KERN_ERR,
 				 "Encoding requested by superblock is unknown");
 			goto failed_mount;
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
