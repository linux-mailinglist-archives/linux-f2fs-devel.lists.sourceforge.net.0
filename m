Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GAHEIOcpWlTFwYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 15:19:47 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBB11DA97E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 15:19:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URtbT8JdQixe8jHN+DaGwgYqQh+CDZzRM/E0p0UpTzs=; b=aI6bxSurLD13Iy9vQkEhlVB+70
	M8Mr3GFHFIPVjYWVHOJcKGF4iaPlv3uWdXNBtqil1b4aqe4P0uXgv/e3DgtGauMklxFkVpze9PLrB
	Bwwf9dMjk+DLteTogwEcG6aVZ7hqA8zV59MhiMJWHiOdfkzOHJfb4CveYIgoF8cpwRFY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vx47c-0005wH-Nh;
	Mon, 02 Mar 2026 14:19:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+ce5019daea4c3780914a+8226+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vx47a-0005vv-Ll for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Mar 2026 14:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=981JrJEhyRiYZyrkee4ERVVanRl6HjCwizmbTqnXlo0=; b=I4dStFa/SLJ1thPKxWT2T0AFOr
 OIdIss4G9bXTWJSXdiupqG93oPfK3CgrAX0D9kc/GO6KT6cCFn9eEANMfxPr2hQ88mOU8shnhITtL
 MwI7RKdkoJGd+u2/zWdk7GebhSg4qwr7Q+dQ+UbhQQB56vXNCB+EN5fBOicDtdjWmUTI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=981JrJEhyRiYZyrkee4ERVVanRl6HjCwizmbTqnXlo0=; b=LuNSzo7oJxO0rQK24tvop7dc61
 fRvLqaDTTuiksrxWZqUzydAJb4SyLlreIK9vNwGsRdsRNd09tJsTa5jBbWLEMVi63nAC5FMBgv2uy
 P6+PCeWwwoApK0jOglRm4V87ksnzA1S4XmKBd8+3V7lKKEyzdBOlLnuVt5FfHZL90cxA=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vx47a-0001U5-T6 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Mar 2026 14:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=981JrJEhyRiYZyrkee4ERVVanRl6HjCwizmbTqnXlo0=; b=GTXX8ReVCvaFWk1ngz3tDZNREr
 QgMzyzQTtsZ/ezvM1TVbutAlx83LG6YCV4JSQQ/cbB0bPUJHSNh+Hp+b/p1pIPcEueghQZ0WgBkFJ
 yehoXRHNNbnZrqquCNM0Tk1IWVgLbwwJIcZCl8VXmwchs2Ib+/y6AnyZclZiDz0nHPYGzysjdljZD
 8KHwHEyQUnxBt7oa8pCN/xcUwJBcEVTSvA6me7LYoLlNffczloP3zzP//GUC9ux1ASraqn0SlCqqk
 dSrxT4NhEfPAwuZJ4LzWpVKUBaqytBjxJBVgeCEHyKXb6r8q4CXCC0pwdJNwekEqOMKVdy21pK1Fd
 J+5sOOGQ==;
Received: from [2604:3d08:797f:2840::9d5f] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vx47P-0000000DDSm-2spb; Mon, 02 Mar 2026 14:19:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon,  2 Mar 2026 06:18:12 -0800
Message-ID: <20260302141922.370070-8-hch@lst.de>
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
 Content preview: Logical offsets into an inode are usually expressed as bytes
 in the VFS. Switch fscrypt_mergeable_bio to that convention. Signed-off-by:
 Christoph Hellwig <hch@lst.de> --- fs/crypto/bio.c | 3 ++-
 fs/crypto/inline_crypt.c
 | 6 +++--- fs/ext4/page-io.c | 2 +- fs/ext4/readpage.c | 3 ++- fs/f2fs/data.c
 | 3 ++- include/linux/f [...] 
 Content analysis details:   (0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vx47a-0001U5-T6
Subject: [f2fs-dev] [PATCH 07/14] fscrypt: pass a byte offset to
 fscrypt_mergeable_bio
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
X-Rspamd-Queue-Id: CFBB11DA97E
X-Rspamd-Action: no action

Logical offsets into an inode are usually expressed as bytes in the VFS.
Switch fscrypt_mergeable_bio to that convention.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/crypto/bio.c          | 3 ++-
 fs/crypto/inline_crypt.c | 6 +++---
 fs/ext4/page-io.c        | 2 +-
 fs/ext4/readpage.c       | 3 ++-
 fs/f2fs/data.c           | 3 ++-
 include/linux/fscrypt.h  | 4 ++--
 6 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index 6da683ea69dc..0a701d4a17ef 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -100,7 +100,8 @@ static int fscrypt_zeroout_range_inline_crypt(const struct inode *inode,
 			len -= blocks_this_page;
 			lblk += blocks_this_page;
 			sector += (bytes_this_page >> SECTOR_SHIFT);
-			if (!len || !fscrypt_mergeable_bio(bio, inode, lblk))
+			if (!len || !fscrypt_mergeable_bio(bio, inode,
+					(loff_t)lblk << blockbits))
 				break;
 		}
 
diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index 5279565e9846..b0954d17904b 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -316,7 +316,7 @@ EXPORT_SYMBOL_GPL(fscrypt_set_bio_crypt_ctx);
  * fscrypt_mergeable_bio() - test whether data can be added to a bio
  * @bio: the bio being built up
  * @inode: the inode for the next part of the I/O
- * @next_lblk: the next file logical block number in the I/O
+ * @pos: the next file position (in bytes) in the I/O
  *
  * When building a bio which may contain data which should undergo inline
  * encryption (or decryption) via fscrypt, filesystems should call this function
@@ -334,7 +334,7 @@ EXPORT_SYMBOL_GPL(fscrypt_set_bio_crypt_ctx);
  * Return: true iff the I/O is mergeable
  */
 bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
-			   u64 next_lblk)
+			   loff_t pos)
 {
 	const struct bio_crypt_ctx *bc = bio->bi_crypt_context;
 	const struct fscrypt_inode_info *ci;
@@ -354,7 +354,7 @@ bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 	if (bc->bc_key != ci->ci_enc_key.blk_key)
 		return false;
 
-	fscrypt_generate_dun(ci, next_lblk << inode->i_blkbits, next_dun);
+	fscrypt_generate_dun(ci, pos, next_dun);
 	return bio_crypt_dun_is_contiguous(bc, bio->bi_iter.bi_size, next_dun);
 }
 EXPORT_SYMBOL_GPL(fscrypt_mergeable_bio);
diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
index 293314d7f236..50f507bab82c 100644
--- a/fs/ext4/page-io.c
+++ b/fs/ext4/page-io.c
@@ -447,7 +447,7 @@ static bool io_submit_need_new_bio(struct ext4_io_submit *io,
 	if (bh->b_blocknr != io->io_next_block)
 		return true;
 	if (!fscrypt_mergeable_bio(io->io_bio, inode,
-			(folio_pos(folio) + bh_offset(bh)) >> inode->i_blkbits))
+			folio_pos(folio) + bh_offset(bh)))
 		return true;
 	return false;
 }
diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index 830f3b8a321f..ba7cfddd6038 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -342,7 +342,8 @@ static int ext4_mpage_readpages(struct inode *inode, struct fsverity_info *vi,
 		 * BIO off first?
 		 */
 		if (bio && (last_block_in_bio != first_block - 1 ||
-			    !fscrypt_mergeable_bio(bio, inode, next_block))) {
+			    !fscrypt_mergeable_bio(bio, inode,
+				(loff_t)next_block << blkbits))) {
 		submit_and_realloc:
 			blk_crypto_submit_bio(bio);
 			bio = NULL;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 338df7a2aea6..dca273fedfde 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -541,7 +541,8 @@ static bool f2fs_crypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 	if (fio && fio->encrypted_page)
 		return !bio_has_crypt_ctx(bio);
 
-	return fscrypt_mergeable_bio(bio, inode, next_idx);
+	return fscrypt_mergeable_bio(bio, inode,
+			(loff_t)next_idx << inode->i_blkbits);
 }
 
 void f2fs_submit_read_bio(struct f2fs_sb_info *sbi, struct bio *bio,
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 26561b7994e0..98fb14660d40 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -870,7 +870,7 @@ void fscrypt_set_bio_crypt_ctx(struct bio *bio,
 			       gfp_t gfp_mask);
 
 bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
-			   u64 next_lblk);
+			   loff_t pos);
 
 bool fscrypt_dio_supported(struct inode *inode);
 
@@ -889,7 +889,7 @@ static inline void fscrypt_set_bio_crypt_ctx(struct bio *bio,
 
 static inline bool fscrypt_mergeable_bio(struct bio *bio,
 					 const struct inode *inode,
-					 u64 next_lblk)
+					 loff_t pos)
 {
 	return true;
 }
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
