Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4902AC67B45
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Nov 2025 07:23:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3R/9OdHHeIppCrDKiC+43a9yYiO+6vLmGM7nFLO2WY=; b=kSGn1XrlJHql4WNYuB0E3jmQDo
	GzZAMY+xHrMAjjUks+qreL4O1JBlNWxBf9Eg6poNl0vJAw9e/9Vwwe3ZIdVBGupEeQAjitPwM79kQ
	qAiJdcjA2MNoLsAlx3vaxnf4L5hvK8tnghmYEATx2KFN39rq61KGsWtAUB4hYOGeft80=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vLF7E-0003v5-NS;
	Tue, 18 Nov 2025 06:23:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+0812c32a4ab075f64334+8122+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vLF7D-0003ux-DN for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Nov 2025 06:22:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=riklaYaC8o2tdvy7FpPnqNZFcL07vFEnM3jtWWsAF2U=; b=UGw8Hk3BbJuBYvhKWmsIqQt+3l
 T70IX46DdV9zetwyNUDsiugfxDRu8THWkeY1v0fE3KEH1ipAT85PCfivrDzrtK3691hiry+ACrnT4
 99vrYDgoPZ3vsKC8lUOWd3S4DQ4rgkXxvrtDnLWC4aBHamR8wbblmhByLMTZjbZkK3G0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=riklaYaC8o2tdvy7FpPnqNZFcL07vFEnM3jtWWsAF2U=; b=Q/XA1qYH8CGsyxXt8SoQWOXOKn
 UTjd4bZeGRW/Wp2HFD+oMIIBnDF5cRHVMIk7QsHthO6+pkPTbNRKU4Ckp8wrJvyPnmG99Vqn1v8+r
 DlMqskk0GFShoNatwoNKyHzSKNhLZWUY3zbAUnxcUDpAZ7a9zYw5COP2P11e3TMnXGNw=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vLF7C-0007FY-WA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Nov 2025 06:22:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=riklaYaC8o2tdvy7FpPnqNZFcL07vFEnM3jtWWsAF2U=; b=wqeu3qz3TvBGdOaSMIBRfmhDMu
 RX+u60EalaYpNmlrPNdXsZcJcyIQhlrzhzbIL4FNB30wnw7UMid+vUzpBDPnPdjY8RbOkka3BviRk
 Y/bHNf7/i2Nio4PZt2WvimHNjXBQdZv8mME9rGQV1A2ZMmdu7kicmeUUYLRqB1s9k4IJev5cVZimw
 YNci+UHOm1j0T9BWojmEF7Yg0h4yhhwa4Mjewb6t7g8Xq1o2/vgVEF6P5gXc1aHHc4BGYC99MXh6f
 2A0lyP1lNR+E4EFZTj6lnqYzKqSmeGN2KYKzeBddgwrGHs5EozsNg1MYIAqZzAsnAyxzMNIco6LKV
 cH7oaCQg==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vLF70-0000000HUQo-0nDu; Tue, 18 Nov 2025 06:22:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Tue, 18 Nov 2025 07:21:51 +0100
Message-ID: <20251118062159.2358085-9-hch@lst.de>
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
 Content preview:  All the callers now want a byte offset into the inode, so
 return that from bh_get_inode_and_lblk_num. Signed-off-by: Christoph Hellwig
 <hch@lst.de> --- fs/crypto/inline_crypt.c | 18 ++++++++ 1 file changed, 8
 insertions(+), 10 deletions(-) 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vLF7C-0007FY-WA
Subject: [f2fs-dev] [PATCH 08/11] fscrypt: return a byte offset from
 bh_get_inode_and_lblk_num
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

All the callers now want a byte offset into the inode, so return
that from bh_get_inode_and_lblk_num.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/crypto/inline_crypt.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index c069958c4819..128268adf960 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -315,7 +315,7 @@ EXPORT_SYMBOL_GPL(fscrypt_set_bio_crypt_ctx);
 /* Extract the inode and logical block number from a buffer_head. */
 static bool bh_get_inode_and_lblk_num(const struct buffer_head *bh,
 				      const struct inode **inode_ret,
-				      u64 *lblk_num_ret)
+				      loff_t *pos_ret)
 {
 	struct folio *folio = bh->b_folio;
 	const struct address_space *mapping;
@@ -331,7 +331,7 @@ static bool bh_get_inode_and_lblk_num(const struct buffer_head *bh,
 	inode = mapping->host;
 
 	*inode_ret = inode;
-	*lblk_num_ret = (folio_pos(folio) + bh_offset(bh)) >> inode->i_blkbits;
+	*pos_ret = folio_pos(folio) + bh_offset(bh);
 	return true;
 }
 
@@ -350,11 +350,10 @@ void fscrypt_set_bio_crypt_ctx_bh(struct bio *bio,
 				  gfp_t gfp_mask)
 {
 	const struct inode *inode;
-	u64 first_lblk;
+	loff_t pos;
 
-	if (bh_get_inode_and_lblk_num(first_bh, &inode, &first_lblk))
-		fscrypt_set_bio_crypt_ctx(bio, inode,
-			first_lblk << inode->i_blkbits, gfp_mask);
+	if (bh_get_inode_and_lblk_num(first_bh, &inode, &pos))
+		fscrypt_set_bio_crypt_ctx(bio, inode, pos, gfp_mask);
 }
 EXPORT_SYMBOL_GPL(fscrypt_set_bio_crypt_ctx_bh);
 
@@ -419,13 +418,12 @@ bool fscrypt_mergeable_bio_bh(struct bio *bio,
 			      const struct buffer_head *next_bh)
 {
 	const struct inode *inode;
-	u64 next_lblk;
+	loff_t pos;
 
-	if (!bh_get_inode_and_lblk_num(next_bh, &inode, &next_lblk))
+	if (!bh_get_inode_and_lblk_num(next_bh, &inode, &pos))
 		return !bio->bi_crypt_context;
 
-	return fscrypt_mergeable_bio(bio, inode,
-		(loff_t)next_lblk << inode->i_blkbits);
+	return fscrypt_mergeable_bio(bio, inode, pos);
 }
 EXPORT_SYMBOL_GPL(fscrypt_mergeable_bio_bh);
 
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
