Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB809C67B1C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Nov 2025 07:22:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Btsc5QiFbYuffjn+uDKBG3Ib5spSYUw6tx56dRzuW58=; b=gsg0+c7AeMkwDDbXFC24vAGFWH
	jryjmgkjgFgDSRMLNOKleqhDLaLaGaVQX9d7M1JJPnnB87lY047mjHqh/ttYeSAgcxFgkwBlf86ZS
	x7jBfDhOklYVQdCHT37I85CW3vu2sSniW+lHEya8P/5M27G7qDprvYxSHxIzTVa0cBXI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vLF6w-0003tU-Be;
	Tue, 18 Nov 2025 06:22:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+0812c32a4ab075f64334+8122+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vLF6r-0003tA-Fo for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Nov 2025 06:22:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TAin3/W8srS40RHgLntcNUfNJVb6TACxP2TpbGdvN8Y=; b=c0TKUoGe+ILiKcD3VyCnfCPEpE
 6WCXQ35MubfoNxfU16fPTG2+IjqKfuxhkOlgbEXjWk3e291RkB5xAXK4Vg4jmJuVDgGIubY8b3+ms
 tuJ06YKL1dBeZSxKmmeVYAqr8NiF6y9hpGFwF+yCzFyEkQ48W9KV543PCl/xvQfkhoHM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TAin3/W8srS40RHgLntcNUfNJVb6TACxP2TpbGdvN8Y=; b=madawMzj67OfjeEwTnDoPXnILR
 HhM5s2vZY0psNKEqQzj2xrkyvR9uL1hMJcIU45nNH1PQbSU7htGg5FaJY5jnDEFkxAj2nDogoWOLq
 Byz6KXj2rnCkI38uhFXBtjS/COuvPjKE5mmaAV38V+BuZETQV79wnUNq8zwAocBAHVIc=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vLF6p-0007EK-BY for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Nov 2025 06:22:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=TAin3/W8srS40RHgLntcNUfNJVb6TACxP2TpbGdvN8Y=; b=VZoS19wu7+1lO80jOH9DA6NCw7
 Eijphx1cC2Tpo4pOKx0dKjuyAcAU1adn/p/KkrO2nKet9WbM0fkaPfvQtUAsQUG9kw/NNM2tTrBEP
 uAOxN3lKROUCE3FR8ZFU3Z2FsATbDQiqXaK9FQdaBm4mprrSfYC0S9zoa8GIeNoROH7/xtGJE+q9Z
 ZwZroD1clQxfEhwEtPONUtAaVn6v0ZW2hkzIfXHJv5JmqwCvkXl9+iE8rmklWx1HaTKeQGs73I8ph
 e22qX6/Z9kyxY9n1QsKmVkWnYaUMdqAdcwn9qsaZLlv/fq1IF+pVj9O9Rr/DxP2OAMALOGzxucs/5
 Bxjz0Y1w==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vLF6h-0000000HUP7-3I8f; Tue, 18 Nov 2025 06:22:29 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Tue, 18 Nov 2025 07:21:47 +0100
Message-ID: <20251118062159.2358085-5-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251118062159.2358085-1-hch@lst.de>
References: <20251118062159.2358085-1-hch@lst.de>
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vLF6p-0007EK-BY
Subject: [f2fs-dev] [PATCH 04/11] fscrypt: pass a byte offset to
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
index c2b3ca100f8d..fce401c9df98 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -100,7 +100,8 @@ static int fscrypt_zeroout_range_inline_crypt(const struct inode *inode,
 			len -= blocks_this_page;
 			lblk += blocks_this_page;
 			sector += (bytes_this_page >> SECTOR_SHIFT);
-			if (!len || !fscrypt_mergeable_bio(bio, inode, lblk))
+			if (!len || !fscrypt_mergeable_bio(bio, inode,
+			    		(loff_t)lblk << blockbits))
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
index f329daf6e5c7..371f34a14084 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -346,7 +346,8 @@ int ext4_mpage_readpages(struct inode *inode,
 		 * BIO off first?
 		 */
 		if (bio && (last_block_in_bio != first_block - 1 ||
-			    !fscrypt_mergeable_bio(bio, inode, next_block))) {
+			    !fscrypt_mergeable_bio(bio, inode,
+				(loff_t)next_block << blkbits))) {
 		submit_and_realloc:
 			submit_bio(bio);
 			bio = NULL;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 775aa4f63aa3..dd3c98fbe6b5 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -503,7 +503,8 @@ static bool f2fs_crypt_mergeable_bio(struct bio *bio, const struct inode *inode,
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
