Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kP1pDSJZlWnQPAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Feb 2026 07:16:02 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAFF1534FF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Feb 2026 07:16:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ast72tfzWc3U+agjLYiiUlDWTB2nqmf5A7gUi+5gFB4=; b=mrdrtBO89xTyt9S3IY7+V+fPJ2
	JlocEKaNHbFmKallIzrrIeuMMuKy2huA0KGcHOkwIPsHJKFEFmIviN5VXtd0TOGgjLNlYVnGJ6fOs
	pw2lqxoFATm5NZcJ4SA53slnFsFwPytmYes2hwOaMfMZ1ErdBZB5ESMu0Rzsy0RToU64=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vsaqu-0002SM-Dw;
	Wed, 18 Feb 2026 06:16:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+b7a6f314dcfbee4e7dbb+8214+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vsaqt-0002SD-02 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Feb 2026 06:15:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=05yvQkQ/IIoBnO8rxYYjaFnyDqAsTEZmblpR2AVL5eg=; b=Emc5e2DrC9O85sKiUvQ2cWTwGt
 tgUboj51lgVS28Pa3+XrkD5gC098jsKeuHeqVQhsLtEiuHQG4jl40UhqyS+9NGF2qcyFS6iygpvpP
 oCY7rZoHEPK4KdjxZsnMN0Kpkapqm+E0wpvSqWpViWRYZCPcN9WNZHSueVFXuzs/qtPw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=05yvQkQ/IIoBnO8rxYYjaFnyDqAsTEZmblpR2AVL5eg=; b=Lxl0XU45gp7vehuAhPwjDXC1qC
 UI3JxEPy128N0jMK3/Vq2an+bEc9nMmKYK9sulCAzezvpfu+jf8EiSFSW/TxNtclD/J62AQZOT6Zz
 dZ//5HSw2oDfK3bjZlYXa/2n8SfNGReBYCfonbkFg6Hz9PQeZuQricez1s1NmrTUwGEQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vsaqs-0006Ig-ER for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Feb 2026 06:15:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=05yvQkQ/IIoBnO8rxYYjaFnyDqAsTEZmblpR2AVL5eg=; b=T6vnUiJBYDilMtnaZCXZK8be+J
 yj1KmhqkTX7Dp9lzNbh2jlV5ikaUf6NJIpMTSTA9Oc9MPW6KGQk28lwHpxrbvbnKI6/6fx+tftjqe
 IuUGRPJdsnqhP2H8Vszx+GOBsQ6gPNgch2Gh1anwfMjtQXzAunapFtwx0We3xHMtCALERpWF7QqKq
 EZ489ti8/8iw1aaxToWCL4CjiQBLONeI9bSC8xA72O2P3TTBC2Gt2Q2Tlf3gdknSxPccob641iZVG
 cWPcWk4cQ03u8ZpLfOcQVTbnQQmWStvDs9vWbkI+q9qvt0vzbGKR5+WOU3JhnCwokMvc5IK4yHjZU
 UV0VCG8Q==;
Received: from [2001:4bb8:2dc:9863:1842:9381:9c0f:de32] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vsaqg-00000009Lfu-3hjq; Wed, 18 Feb 2026 06:15:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Wed, 18 Feb 2026 07:14:40 +0100
Message-ID: <20260218061531.3318130-3-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218061531.3318130-1-hch@lst.de>
References: <20260218061531.3318130-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Logical offsets into an inode are usually expresssed as bytes
 in the VFS. Switch fscrypt_mergeable_bio to that convention. Signed-off-by:
 Christoph Hellwig <hch@lst.de> --- fs/crypto/bio.c | 3 ++-
 fs/crypto/inline_crypt.c
 | 9 +++++---- fs/ext4/readpage.c | 3 ++- fs/f2fs/data.c | 3 ++-
 include/linux/fscrypt.h | 4 ++-- 5 fi [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vsaqs-0006Ig-ER
Subject: [f2fs-dev] [PATCH 2/9] fscrypt: pass a byte offset to
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,lst.de:email,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: BCAFF1534FF
X-Rspamd-Action: no action

Logical offsets into an inode are usually expresssed as bytes in the VFS.
Switch fscrypt_mergeable_bio to that convention.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/crypto/bio.c          | 3 ++-
 fs/crypto/inline_crypt.c | 9 +++++----
 fs/ext4/readpage.c       | 3 ++-
 fs/f2fs/data.c           | 3 ++-
 include/linux/fscrypt.h  | 4 ++--
 5 files changed, 13 insertions(+), 9 deletions(-)

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
index 1773dd7ea7cf..aba830e0827d 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -361,7 +361,7 @@ EXPORT_SYMBOL_GPL(fscrypt_set_bio_crypt_ctx_bh);
  * fscrypt_mergeable_bio() - test whether data can be added to a bio
  * @bio: the bio being built up
  * @inode: the inode for the next part of the I/O
- * @next_lblk: the next file logical block number in the I/O
+ * @pos: the next file logical offset (in bytes) in the I/O
  *
  * When building a bio which may contain data which should undergo inline
  * encryption (or decryption) via fscrypt, filesystems should call this function
@@ -379,7 +379,7 @@ EXPORT_SYMBOL_GPL(fscrypt_set_bio_crypt_ctx_bh);
  * Return: true iff the I/O is mergeable
  */
 bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
-			   u64 next_lblk)
+			   loff_t pos)
 {
 	const struct bio_crypt_ctx *bc = bio->bi_crypt_context;
 	const struct fscrypt_inode_info *ci;
@@ -399,7 +399,7 @@ bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 	if (bc->bc_key != ci->ci_enc_key.blk_key)
 		return false;
 
-	fscrypt_generate_dun(ci, next_lblk << inode->i_blkbits, next_dun);
+	fscrypt_generate_dun(ci, pos, next_dun);
 	return bio_crypt_dun_is_contiguous(bc, bio->bi_iter.bi_size, next_dun);
 }
 EXPORT_SYMBOL_GPL(fscrypt_mergeable_bio);
@@ -423,7 +423,8 @@ bool fscrypt_mergeable_bio_bh(struct bio *bio,
 	if (!bh_get_inode_and_lblk_num(next_bh, &inode, &next_lblk))
 		return !bio->bi_crypt_context;
 
-	return fscrypt_mergeable_bio(bio, inode, next_lblk);
+	return fscrypt_mergeable_bio(bio, inode,
+		(loff_t)next_lblk << inode->i_blkbits);
 }
 EXPORT_SYMBOL_GPL(fscrypt_mergeable_bio_bh);
 
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
index 516aba5b858b..5f2e02a61401 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -874,7 +874,7 @@ void fscrypt_set_bio_crypt_ctx_bh(struct bio *bio,
 				  gfp_t gfp_mask);
 
 bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
-			   u64 next_lblk);
+			   loff_t pos);
 
 bool fscrypt_mergeable_bio_bh(struct bio *bio,
 			      const struct buffer_head *next_bh);
@@ -901,7 +901,7 @@ static inline void fscrypt_set_bio_crypt_ctx_bh(
 
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
