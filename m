Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOeQGoCcpWk+FwYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 15:19:44 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0261A1DA94B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 15:19:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2lEb4+0fU+Ip9J2jcnSUsIIJ3bp+f75WwBcuAn22yEU=; b=TPAZYUPYb4fuVSYiQP2brrDoBk
	yr3YJju5b6jpH8g0qEKLOd10npLsr1rO1oe3gLbf0+4DoRQZGqiDKZKmWYZdabaHnwX+jI2TDjeOl
	VkANztdTGiSIz/P36nZs9ox9m7HveYjR5oo00kd4XHf/J7hUHvvEIr4AjGq5dS0UaP8w=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vx47V-0007oe-N8;
	Mon, 02 Mar 2026 14:19:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+ce5019daea4c3780914a+8226+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vx47U-0007oW-7K for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Mar 2026 14:19:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=48teM5i6x6CJSM3TGQYT8hhQxdMcjJfXJZ8vD9qJOdY=; b=nAl3p2eGkvzUIarOCaO+0d+r9x
 qjlZIGIcSfBtjsFPk75gOzEPjCmvPgITFkSIT7LbxLLjzkpn6BLvsvyqox4jFxaTX36fk3aDQRLlh
 /doEZoHaZWP8K+CZVlh2Rwg7KH6Yw0ODtN98eSVGcXklCIWm1o3EeZHNNnU8eGRHUHq4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=48teM5i6x6CJSM3TGQYT8hhQxdMcjJfXJZ8vD9qJOdY=; b=h/xiqanFLNJB/txrC8YZnxaACz
 P3eyl5rkjjs6p0xGea8H7xA/iGJrg771TqIubUDNVmA/K/bqh13nIMoKawpQumOaM1DEvLYOSExHl
 ll8IxjH+r+/6zH8tLR3vCe5uSYtIoBromIe0IFMq7jCLSR7f9/8vhkSbqkpJoz2vItdk=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vx47T-0001TP-MI for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Mar 2026 14:19:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=48teM5i6x6CJSM3TGQYT8hhQxdMcjJfXJZ8vD9qJOdY=; b=RPkSqP8dHSz24530yzuWpRqsGz
 ePeHTyYaqLuZRrEgzv1lL0ApgmPV2NZL34ErG9ihgs8AypsiazDD0vOSrubqi1QWuXWAhTWimSiuk
 TZ/A0UmKJTQOExo9/DO0fYCSN9+2hWeX819DxkAN/UZa/l/irMkUncTBtNtx/sngDmt4TNueewXQk
 rM8C0MHadezqEDMLmvyi1JPd6I2iibtRcsFkAFpPgUBe7CzNt86/kgYosxt9kZEcfZAH+Y1nZ01EW
 lIcS0IGbCBhtQBej5DNlsNDVoE13WRmmxU22OW21ZaCglh12Cht5Q4pPDCzNutU+gIfsM6TXgI6OP
 lKWqnUTQ==;
Received: from [2604:3d08:797f:2840::9d5f] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vx47N-0000000DDSL-2kqP; Mon, 02 Mar 2026 14:19:29 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon,  2 Mar 2026 06:18:10 -0800
Message-ID: <20260302141922.370070-6-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302141922.370070-1-hch@lst.de>
References: <20260302141922.370070-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  fscrypt_set_bio_crypt_ctx_bh is only used by submit_bh_wbc
 now. Move it there and merge bh_get_inode_and_lblk_num into it. Note that
 this does not add ifdefs for fscrypt as the compiler will optimize away the
 dead code if it is not built in. 
 Content analysis details:   (0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vx47T-0001TP-MI
Subject: [f2fs-dev] [PATCH 05/14] fscrypt: move fscrypt_set_bio_crypt_ctx_bh
 to buffer.c
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
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:brauner@kernel.org,m:tytso@mit.edu,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:adilger.kernel@dilger.ca,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,lst.de:email]
X-Rspamd-Queue-Id: 0261A1DA94B
X-Rspamd-Action: no action

fscrypt_set_bio_crypt_ctx_bh is only used by submit_bh_wbc now.  Move it
there and merge bh_get_inode_and_lblk_num into it.

Note that this does not add ifdefs for fscrypt as the compiler will
optimize away the dead code if it is not built in.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/buffer.c              | 21 ++++++++++++++++++-
 fs/crypto/inline_crypt.c | 45 ----------------------------------------
 include/linux/fscrypt.h  |  9 --------
 3 files changed, 20 insertions(+), 55 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 22b43642ba57..b6504ec7fa4c 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -2774,6 +2774,24 @@ static void end_bio_bh_io_sync(struct bio *bio)
 	bio_put(bio);
 }
 
+static void buffer_set_crypto_ctx(struct bio *bio, const struct buffer_head *bh,
+				  gfp_t gfp_mask)
+{
+	const struct address_space *mapping = folio_mapping(bh->b_folio);
+	const struct inode *inode;
+	u64 lblk;
+
+	/*
+	 * The ext4 journal (jbd2) can submit a buffer_head it directly created
+	 * for a non-pagecache page.  fscrypt doesn't care about these.
+	 */
+	if (!mapping)
+		return;
+	inode = mapping->host;
+	lblk = (folio_pos(bh->b_folio) + bh_offset(bh)) >> inode->i_blkbits;
+	fscrypt_set_bio_crypt_ctx(bio, inode, lblk, gfp_mask);
+}
+
 static void submit_bh_wbc(blk_opf_t opf, struct buffer_head *bh,
 			  enum rw_hint write_hint,
 			  struct writeback_control *wbc)
@@ -2800,7 +2818,8 @@ static void submit_bh_wbc(blk_opf_t opf, struct buffer_head *bh,
 
 	bio = bio_alloc(bh->b_bdev, 1, opf, GFP_NOIO);
 
-	fscrypt_set_bio_crypt_ctx_bh(bio, bh, GFP_NOIO);
+	if (IS_ENABLED(CONFIG_FS_ENCRYPTION))
+		buffer_set_crypto_ctx(bio, bh, GFP_NOIO);
 
 	bio->bi_iter.bi_sector = bh->b_blocknr * (bh->b_size >> 9);
 	bio->bi_write_hint = write_hint;
diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index 0da53956a9b1..702d13d138aa 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -314,51 +314,6 @@ void fscrypt_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
 }
 EXPORT_SYMBOL_GPL(fscrypt_set_bio_crypt_ctx);
 
-/* Extract the inode and logical block number from a buffer_head. */
-static bool bh_get_inode_and_lblk_num(const struct buffer_head *bh,
-				      const struct inode **inode_ret,
-				      u64 *lblk_num_ret)
-{
-	struct folio *folio = bh->b_folio;
-	const struct address_space *mapping;
-	const struct inode *inode;
-
-	/*
-	 * The ext4 journal (jbd2) can submit a buffer_head it directly created
-	 * for a non-pagecache page.  fscrypt doesn't care about these.
-	 */
-	mapping = folio_mapping(folio);
-	if (!mapping)
-		return false;
-	inode = mapping->host;
-
-	*inode_ret = inode;
-	*lblk_num_ret = (folio_pos(folio) + bh_offset(bh)) >> inode->i_blkbits;
-	return true;
-}
-
-/**
- * fscrypt_set_bio_crypt_ctx_bh() - prepare a file contents bio for inline
- *				    crypto
- * @bio: a bio which will eventually be submitted to the file
- * @first_bh: the first buffer_head for which I/O will be submitted
- * @gfp_mask: memory allocation flags
- *
- * Same as fscrypt_set_bio_crypt_ctx(), except this takes a buffer_head instead
- * of an inode and block number directly.
- */
-void fscrypt_set_bio_crypt_ctx_bh(struct bio *bio,
-				  const struct buffer_head *first_bh,
-				  gfp_t gfp_mask)
-{
-	const struct inode *inode;
-	u64 first_lblk;
-
-	if (bh_get_inode_and_lblk_num(first_bh, &inode, &first_lblk))
-		fscrypt_set_bio_crypt_ctx(bio, inode, first_lblk, gfp_mask);
-}
-EXPORT_SYMBOL_GPL(fscrypt_set_bio_crypt_ctx_bh);
-
 /**
  * fscrypt_mergeable_bio() - test whether data can be added to a bio
  * @bio: the bio being built up
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 6af3c1907adc..26561b7994e0 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -869,10 +869,6 @@ void fscrypt_set_bio_crypt_ctx(struct bio *bio,
 			       const struct inode *inode, u64 first_lblk,
 			       gfp_t gfp_mask);
 
-void fscrypt_set_bio_crypt_ctx_bh(struct bio *bio,
-				  const struct buffer_head *first_bh,
-				  gfp_t gfp_mask);
-
 bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 			   u64 next_lblk);
 
@@ -891,11 +887,6 @@ static inline void fscrypt_set_bio_crypt_ctx(struct bio *bio,
 					     const struct inode *inode,
 					     u64 first_lblk, gfp_t gfp_mask) { }
 
-static inline void fscrypt_set_bio_crypt_ctx_bh(
-					 struct bio *bio,
-					 const struct buffer_head *first_bh,
-					 gfp_t gfp_mask) { }
-
 static inline bool fscrypt_mergeable_bio(struct bio *bio,
 					 const struct inode *inode,
 					 u64 next_lblk)
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
