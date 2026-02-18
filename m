Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGaLFDlZlWkqPQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Feb 2026 07:16:25 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E239715359D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Feb 2026 07:16:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkUHyCu4gD4wMPWlb3kRRUefYC+q9X2gdAtMeG+VxgI=; b=NOy7bs9zatPxiVnWxth8J6zJ3F
	ATMIlpavpxNmYtYN7+fJhO2ug4Nl1p9QVyaYPuQR3mhSceF8nmtAKPoBO/GHgWicFW0Im9wxh6buc
	nhkvOplnC9nQoHmPyXZ9E28dLf8b4lHCvV59zAx811zUzShHj29e4/e+A5U0yR9OFncs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vsarH-0000jI-J7;
	Wed, 18 Feb 2026 06:16:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+b7a6f314dcfbee4e7dbb+8214+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vsarD-0000ik-Cs for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Feb 2026 06:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m4IuMQ2TKa0TzW/JDk2yMMJ5yw7sTmpwUoByvrFH3Sw=; b=Ntn3v1OtoDULQv6yyaWf7jQDe2
 +FXl8QgITAaJJmokfdyLxq7gIcU/NPtHlicxy3m2jKlxL142DqcnS6WOVFhkAe7Mzq4bxpJBb52U8
 P2Z2f0U7++q69bfshayIkIF0o0AF8SYuHjaWeUqCGj1qRk8vf5eqS1e7eggvS7kvGRnA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m4IuMQ2TKa0TzW/JDk2yMMJ5yw7sTmpwUoByvrFH3Sw=; b=jm5mFNLGZS94ue4ye63dVDNK+k
 JtSWn6R9fu9Xl2ckPlCm4LBQJSv4Che2MOYfi0Fs9Z3s5A8eyOlXiTz/4gYh5JcGU7aA1K8fAAUUe
 iACRY0gxjoifCcYaQsjXO6T/WghIFbE8zCBt8/ACnT9GHDUMV3wwL/4NF3jDeZ66IKXw=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vsar7-0006Ja-Pe for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Feb 2026 06:16:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=m4IuMQ2TKa0TzW/JDk2yMMJ5yw7sTmpwUoByvrFH3Sw=; b=C5QMWPQFLvjR/YBgzjnZYR/Do9
 cyXCHtQhF+ZoYUKiW6oQsu0DijNGFGumq5GJ4EyWIqHQ76rKThFg9i2oDPY4pOQnl7sXrKUnOBqAd
 t4kNjqLPXBpofs1CmsGdxljbt5rd9qsLn5CScbSP8fCmLm28GT+ZH8nTUMmC/xXGhy7rKwg+m2hCQ
 vuB4qGdUGClgVphnxnI6D9Fb1BbW6y8wPb9GaAFWFgKdwSx0zY8w4SC4yIAB2zmeXWVmP0f4alyEz
 93fjwAE6Bp5jG9aTiCeXjBr6XygglastVUG0EUvILWEDYCPM9Dhcvj61QXTxT67fqnylDfj+Wdotr
 xxt10Xzg==;
Received: from [2001:4bb8:2dc:9863:1842:9381:9c0f:de32] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vsaqw-00000009Lhj-1Ye2; Wed, 18 Feb 2026 06:16:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Wed, 18 Feb 2026 07:14:43 +0100
Message-ID: <20260218061531.3318130-6-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218061531.3318130-1-hch@lst.de>
References: <20260218061531.3318130-1-hch@lst.de>
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vsar7-0006Ja-Pe
Subject: [f2fs-dev] [PATCH 5/9] fscrypt: pass a byte length to
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:brauner@kernel.org,m:tytso@mit.edu,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:adilger.kernel@dilger.ca,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lst.de:mid,lst.de:email]
X-Rspamd-Queue-Id: E239715359D
X-Rspamd-Action: no action

Range lengths are usually expressed as bytes in the VFS, switch
fscrypt_zeroout_range_inline_crypt to this convention.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/crypto/bio.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index 7558b3e69701..36025ce7a264 100644
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
