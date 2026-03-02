Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LexHICcpWmfEwYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 15:19:44 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 044071DA94C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 15:19:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRuau8JfKJGiOPebEBuhgq26NBqj+4casOrO5sQUdkI=; b=PXMzDNQ/BqHsMf6RAnDcACe5z/
	9YChC2N1+DHbY/pi3QpbybGtxK/I8/28vtDVQjeIpeP0fQ7L5A8eMvUXklX8Lnr1DVmTxP63aO6fe
	GUgobSh9CYyUcnQVHZxka21yP8tH2+OexTS8pAXWv9c5xiU0TSFIj01RyvY/OkV4FKoE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vx47a-0007p8-1M;
	Mon, 02 Mar 2026 14:19:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+ce5019daea4c3780914a+8226+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vx47Y-0007oz-78 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Mar 2026 14:19:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=omwZ8IhiwJk2jjmt8PKHtHDrWvCVdcVGy57zpjHtP6s=; b=Id0ocyDT0j5RJHoqpv9soN/LJE
 TopdCERxVC14xQ5yq+CjjzWYUPyUqheaPnhiRgpL66QR29YrK3QZGiJrhGn9H4p5RQiXJfRUPGKBU
 6KMrTsAneMCrAD5EXWUw7KKwcvqh7KspEFZvQ+ai06b4mELBf8sgDlpJyPe8Ao+bdcqI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=omwZ8IhiwJk2jjmt8PKHtHDrWvCVdcVGy57zpjHtP6s=; b=LfflAXF3x8p6cm2lJCImrecsMX
 cuRs9GS58fhjRVlUnGJLpnl/p+skFYNZhSa9LOlXsAIoeu5YTLvMwKYqYPUk5p1zXnhRxqjGfRMA9
 QGP1q+rnK/83DTiSvkXoE9bYPJVgiF4d7HoCfau9XlyQbRxCVy+B/mKoQ2G0qc6s5VKc=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vx47X-0001Ti-NY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Mar 2026 14:19:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=omwZ8IhiwJk2jjmt8PKHtHDrWvCVdcVGy57zpjHtP6s=; b=Z+vovTJXN+W+ak/BnEWOEXjDnP
 Eu3QJN3wPsDiFOp2eTzJyd+CiRtJQ+poCfTPPyfOumt6eL/93u32eLLiFC0SjB0Swdc8JLDnYjJC+
 grpIyij6YV58RFwXu6x0LX5/k+aRpzuyJBBi+ch6JdUEkQevLgr+uVfZLY/Rse5tYKSDs843iIJ1a
 OVkilvgM+jhkQNXpQbJw0KhI1bfhLTn4E47fYBoYj4aNLNWaQ0a3QgSA7sUBzPnC3+CoDL2s3tOJo
 LCo9yaT3WpNx/HSqskz9SW7aKjDw3xvdMWGnGBNTb1UKeuI8YfR+wrHxoUNWESzNkEsablN6yZUro
 OX8dLceg==;
Received: from [2604:3d08:797f:2840::9d5f] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vx47M-0000000DDSB-2i7g; Mon, 02 Mar 2026 14:19:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon,  2 Mar 2026 06:18:09 -0800
Message-ID: <20260302141922.370070-5-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302141922.370070-1-hch@lst.de>
References: <20260302141922.370070-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  ext4 already has the inode and folio and can't have a NULL
 folio->mapping in this path. Open code fscrypt_mergeable_bio_bh in
 io_submit_need_new_bio
 based on these simplifying assumptions. Signed-off-by: Christoph Hellwig
 <hch@lst.de> --- fs/crypto/inline_crypt.c | 23 fs/ext4/page-io.c | 7 +++++--
 include/linux/fscrypt.h | 9 --------- 3 files changed, 5 insertion [...] 
 Content analysis details:   (0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vx47X-0001Ti-NY
Subject: [f2fs-dev] [PATCH 04/14] ext4,
 fscrypt: merge fscrypt_mergeable_bio_bh into io_submit_need_new_bio
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
X-Rspamd-Queue-Id: 044071DA94C
X-Rspamd-Action: no action

ext4 already has the inode and folio and can't have a NULL
folio->mapping in this path. Open code fscrypt_mergeable_bio_bh in
io_submit_need_new_bio based on these simplifying assumptions.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/crypto/inline_crypt.c | 23 -----------------------
 fs/ext4/page-io.c        |  7 +++++--
 include/linux/fscrypt.h  |  9 ---------
 3 files changed, 5 insertions(+), 34 deletions(-)

diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index c0852b920dbc..0da53956a9b1 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -406,29 +406,6 @@ bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 }
 EXPORT_SYMBOL_GPL(fscrypt_mergeable_bio);
 
-/**
- * fscrypt_mergeable_bio_bh() - test whether data can be added to a bio
- * @bio: the bio being built up
- * @next_bh: the next buffer_head for which I/O will be submitted
- *
- * Same as fscrypt_mergeable_bio(), except this takes a buffer_head instead of
- * an inode and block number directly.
- *
- * Return: true iff the I/O is mergeable
- */
-bool fscrypt_mergeable_bio_bh(struct bio *bio,
-			      const struct buffer_head *next_bh)
-{
-	const struct inode *inode;
-	u64 next_lblk;
-
-	if (!bh_get_inode_and_lblk_num(next_bh, &inode, &next_lblk))
-		return !bio->bi_crypt_context;
-
-	return fscrypt_mergeable_bio(bio, inode, next_lblk);
-}
-EXPORT_SYMBOL_GPL(fscrypt_mergeable_bio_bh);
-
 /**
  * fscrypt_dio_supported() - check whether DIO (direct I/O) is supported on an
  *			     inode, as far as encryption is concerned
diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
index 58cdbd836fd6..293314d7f236 100644
--- a/fs/ext4/page-io.c
+++ b/fs/ext4/page-io.c
@@ -440,11 +440,14 @@ static void io_submit_init_bio(struct ext4_io_submit *io,
 }
 
 static bool io_submit_need_new_bio(struct ext4_io_submit *io,
+				   struct inode *inode,
+				   struct folio *folio,
 				   struct buffer_head *bh)
 {
 	if (bh->b_blocknr != io->io_next_block)
 		return true;
-	if (!fscrypt_mergeable_bio_bh(io->io_bio, bh))
+	if (!fscrypt_mergeable_bio(io->io_bio, inode,
+			(folio_pos(folio) + bh_offset(bh)) >> inode->i_blkbits))
 		return true;
 	return false;
 }
@@ -455,7 +458,7 @@ static void io_submit_add_bh(struct ext4_io_submit *io,
 			     struct folio *io_folio,
 			     struct buffer_head *bh)
 {
-	if (io->io_bio && io_submit_need_new_bio(io, bh)) {
+	if (io->io_bio && io_submit_need_new_bio(io, inode, folio, bh)) {
 submit_and_retry:
 		ext4_io_submit(io);
 	}
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 516aba5b858b..6af3c1907adc 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -876,9 +876,6 @@ void fscrypt_set_bio_crypt_ctx_bh(struct bio *bio,
 bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 			   u64 next_lblk);
 
-bool fscrypt_mergeable_bio_bh(struct bio *bio,
-			      const struct buffer_head *next_bh);
-
 bool fscrypt_dio_supported(struct inode *inode);
 
 u64 fscrypt_limit_io_blocks(const struct inode *inode, u64 lblk, u64 nr_blocks);
@@ -906,12 +903,6 @@ static inline bool fscrypt_mergeable_bio(struct bio *bio,
 	return true;
 }
 
-static inline bool fscrypt_mergeable_bio_bh(struct bio *bio,
-					    const struct buffer_head *next_bh)
-{
-	return true;
-}
-
 static inline bool fscrypt_dio_supported(struct inode *inode)
 {
 	return !fscrypt_needs_contents_encryption(inode);
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
