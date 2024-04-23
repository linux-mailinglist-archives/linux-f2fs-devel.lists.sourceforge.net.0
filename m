Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F388AFC47
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Apr 2024 00:56:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzP3b-0005NH-PI;
	Tue, 23 Apr 2024 22:56:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1rzP3Z-0005N6-Ew
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Apr 2024 22:56:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=INusEyB6dR3vgU5usJpWnfIw4VplmU4zwONWpNN/d/w=; b=SJdA7IMMfkPFyv8AYtqDKFk7io
 P4rG3yrDTZQt1XT3U0j/ZT5RzL1yAi8vlznS0mzXwf66/aS/L34C943EUkEow5RQC/tENvEm/uoC0
 tl4IKiVbw9s4WwVp01Rll4Pu0PElMikiiY5gVA5v96ssgcxGJQykU7SmYyog8RtW0z18=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=INusEyB6dR3vgU5usJpWnfIw4VplmU4zwONWpNN/d/w=; b=KFyVbgjYT7/FRWXQFXN6UrGRUx
 wCTh+Vtad15vpw9gMBQT+GgKznJoBqFMAN0HG97mE2caDxiBE98M0DOEASR+sUrPrIN0pp/PXqdWq
 JZAMhe9nsRSfgK3HRxdNVQELkjG3vQCJ7cV2u0X+CCPjJJgLv4h6kQESG9nLpuck+nZE=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzP3X-0007Dl-Kt for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Apr 2024 22:56:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=INusEyB6dR3vgU5usJpWnfIw4VplmU4zwONWpNN/d/w=; b=NT2phuhB9ilem0ZbyyRx5jBEPe
 JMbXTjlRG5reeWvDli1o699wO7DV0K1j8OXZXC8c8ksIm2T9sSZfzRhbwbbmtDaYai/OMJX/h/1JI
 2Hn/U3vhEWzalCdjm77c4mqnQ+rH/OsTFTV8JaPtAvfgZwPAvz5UHlCvTC8+vsBdFMTjE3HcZXKYo
 DpCBiYu1SklMcCKYgHCwhIswIDNhKdBrOEFI9xxAiMPxg3s4gsElsBR9yY7M+djUeP8uizrw/2tDR
 YHfKURym5m/8DjC3/f6CiRiSoFIkd0ryFFDjaIS3EB+O0v+cFV4uZQo6kEfFJbQf6gmj6pJeYFn6Y
 S3L4opow==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rzP3K-0000000HG6E-1Erv;
 Tue, 23 Apr 2024 22:55:54 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Date: Tue, 23 Apr 2024 23:55:32 +0100
Message-ID: <20240423225552.4113447-2-willy@infradead.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240423225552.4113447-1-willy@infradead.org>
References: <20240423225552.4113447-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Remove uses of page->index, page_mapping() and b_page. Saves
 a call to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/crypto/inline_crypt.c | 6 +++--- 1 file changed, 3 insertions(+),
 3 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1rzP3X-0007Dl-Kt
Subject: [f2fs-dev] [PATCH 1/6] fscrypt: Convert bh_get_inode_and_lblk_num
 to use a folio
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Remove uses of page->index, page_mapping() and b_page.  Saves a call
to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/crypto/inline_crypt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index b4002aea7cdb..40de69860dcf 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -284,7 +284,7 @@ static bool bh_get_inode_and_lblk_num(const struct buffer_head *bh,
 				      const struct inode **inode_ret,
 				      u64 *lblk_num_ret)
 {
-	struct page *page = bh->b_page;
+	struct folio *folio = bh->b_folio;
 	const struct address_space *mapping;
 	const struct inode *inode;
 
@@ -292,13 +292,13 @@ static bool bh_get_inode_and_lblk_num(const struct buffer_head *bh,
 	 * The ext4 journal (jbd2) can submit a buffer_head it directly created
 	 * for a non-pagecache page.  fscrypt doesn't care about these.
 	 */
-	mapping = page_mapping(page);
+	mapping = folio_mapping(folio);
 	if (!mapping)
 		return false;
 	inode = mapping->host;
 
 	*inode_ret = inode;
-	*lblk_num_ret = ((u64)page->index << (PAGE_SHIFT - inode->i_blkbits)) +
+	*lblk_num_ret = ((u64)folio->index << (PAGE_SHIFT - inode->i_blkbits)) +
 			(bh_offset(bh) >> inode->i_blkbits);
 	return true;
 }
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
