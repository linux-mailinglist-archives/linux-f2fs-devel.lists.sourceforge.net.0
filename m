Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A84F1C67B33
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Nov 2025 07:23:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrfYfD2vCpQvBEFpm9TYMrPjD8SXm+Rts6XDyxXqsb8=; b=SVg12RE17qhhdCj7PSfTcJXREd
	GvYAr2KbkSMu7FzQdQT5nynBhuT9ZsGJqOUiQ38J3PbYHUEEF6LgjeRoy02CszprahBDaao00xaRC
	FYZbYXtfe2rswOiMA0gqs1GMnxLqSR/rN1n2gRzGWwa0Co7WxP7b1I1MKvpvwS/xyv3I=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vLF72-0005je-Hy;
	Tue, 18 Nov 2025 06:22:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+0812c32a4ab075f64334+8122+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vLF71-0005jP-F5 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Nov 2025 06:22:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VVOYWQ13oNwsCNhff4f/rJsJFg+2FBZoVLj8q2JKV1E=; b=JUrMUAdawu78Zw5WGAzr7cxpbX
 h4zM3Bf5GsYhHM8bnMQbXlS+0Zs2z8dG+EU978L32wlUr+GBTasBunKN0riw0Iaf+my/iYVulCrzu
 nqrDnicb+kDhEhvGMl3pARO9yeV8LHDGz0PoEp1Cse/NG8vz6rBcz+zwny4/2eeBUIVo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VVOYWQ13oNwsCNhff4f/rJsJFg+2FBZoVLj8q2JKV1E=; b=VVfPTC7RFtRi0SK3UaCC0tAIay
 z5n4p1JZAJOuOJx/lioDJWyfTtLQwLz0/u4HbgBB8ziRSb0hsGU4FdfhDSKoV5qWHtFxUWK6ivuLW
 JXe1itFagQxMyUMXixlPO3oUelBmRiIM2Au4kBPs56+S/jMMM/8MEkujFP98zqtr6KFc=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vLF71-0007Ev-Sd for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Nov 2025 06:22:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=VVOYWQ13oNwsCNhff4f/rJsJFg+2FBZoVLj8q2JKV1E=; b=EM0kw/ZouZuxOhyR7S6g19ABHp
 9z1jNHEAKfQud2JK/NZhuhZSBg26k/YVt9MEQwkF2dylE0Zg77iOpZDYgf+5vQhXmWSpr8vhF28ll
 hLaQns+d0OP/LfeZJJbkKUvCJK13wi+taeys9wLhh4+rhSczZ2ZhHhAJyJ4r0VdDrGv6x79mqItH4
 noM6NPRe7d8gnpRFfgSWTeaXG6PTH+VWB+PyriUdMZb5C7j/dRgfhvE3LE23uy/C/p39e/z+lWT9b
 Sx3C4CmZSqJ88bDu6MzRLpxO+S28GzAYS6yyN39E1mc1LJN/izjjApkwB1YLflh4oZaL26s0M+pZq
 AhCRPekQ==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vLF6v-0000000HUQ9-37bb; Tue, 18 Nov 2025 06:22:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Tue, 18 Nov 2025 07:21:50 +0100
Message-ID: <20251118062159.2358085-8-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251118062159.2358085-1-hch@lst.de>
References: <20251118062159.2358085-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Range lengths are usually expressed as bytes in the VFS,
 switch
 fscrypt_zeroout_range_inline_crypt to this convention. Signed-off-by:
 Christoph
 Hellwig <hch@lst.de> --- fs/crypto/bio.c | 10 +++------- 1 file changed,
 3 insertions(+), 7 deletions(-) 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vLF71-0007Ev-Sd
Subject: [f2fs-dev] [PATCH 07/11] fscrypt: pass a byte length to
 fscrypt_zeroout_range_inline_crypt
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
Cc: Christian Brauner <brauner@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Range lengths are usually expressed as bytes in the VFS, switch
fscrypt_zeroout_range_inline_crypt to this convention.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/crypto/bio.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index 07d757d2777e..be751bcd2976 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -73,8 +73,6 @@ static int fscrypt_zeroout_range_inline_crypt(const struct inode *inode,
 					      loff_t pos, sector_t sector,
 					      unsigned int len)
 {
-	const unsigned int blockbits = inode->i_blkbits;
-	const unsigned int blocks_per_page = 1 << (PAGE_SHIFT - blockbits);
 	struct fscrypt_zero_done done = {
 		.pending	= ATOMIC_INIT(1),
 		.done		= COMPLETION_INITIALIZER_ONSTACK(done.done),
@@ -92,12 +90,10 @@ static int fscrypt_zeroout_range_inline_crypt(const struct inode *inode,
 		fscrypt_set_bio_crypt_ctx(bio, inode, pos, GFP_NOFS);
 
 		for (n = 0; n < BIO_MAX_VECS; n++) {
-			unsigned int blocks_this_page =
-				min(len, blocks_per_page);
-			unsigned int bytes_this_page = blocks_this_page << blockbits;
+			unsigned int bytes_this_page = min(len, PAGE_SIZE);
 
 			__bio_add_page(bio, ZERO_PAGE(0), bytes_this_page, 0);
-			len -= blocks_this_page;
+			len -= bytes_this_page;
 			pos += bytes_this_page;
 			sector += (bytes_this_page >> SECTOR_SHIFT);
 			if (!len || !fscrypt_mergeable_bio(bio, inode, pos))
@@ -155,7 +151,7 @@ int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 
 	if (fscrypt_inode_uses_inline_crypto(inode))
 		return fscrypt_zeroout_range_inline_crypt(inode, pos, sector,
-							  len);
+				len << inode->i_blkbits);
 
 	BUILD_BUG_ON(ARRAY_SIZE(pages) > BIO_MAX_VECS);
 	nr_pages = min_t(u64, ARRAY_SIZE(pages),
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
