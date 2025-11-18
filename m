Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF46EC67B20
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Nov 2025 07:22:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8/gK7vL4e+Prdm1cC8v8F+mzG2rNWqgEwOTuTxnYXw=; b=UB8VGfzK2T8aUwvhHdiyou4uWm
	edyXwy6HZo2zrP8H49qTDABc5kJln8BoRgoMdolb3tcCFtMus3/OMmB4wV1zAyveiVg77o5cFeH7Z
	UkHUDmDECZmv3x0kiyZNIgX0AwsXMiguVfVAgJcXQVDJic9LWqY0TMJf7Rbpdfc+Rt+A=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vLF6v-00031Y-Ay;
	Tue, 18 Nov 2025 06:22:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+0812c32a4ab075f64334+8122+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vLF6r-00031K-Ff for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Nov 2025 06:22:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i6+fGKzHN3lDbRkojfVRWpWl5kuHKUdtJvBCaJ8GUS8=; b=Q3a7rGnBZNabwcro61/kyDS0UM
 UXX2bB7um3IJ+2cCRYx8Ok4+2L35y2rJnhp9z7n1aqFXQYdTSOvSCgxJO0im575G8Fvcym2znE64A
 9jrWfmHJj48dRRF8+/ZR2fP6dMaNpdF8U3bJu1/JbItGq3xhvnKbMXfAjbEEzVyGdAX0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i6+fGKzHN3lDbRkojfVRWpWl5kuHKUdtJvBCaJ8GUS8=; b=jNKBmtN7ltpYkP7g2A/LQ1FKP5
 0ptzrrMnkBI0UBv7vS7/VhxQ4YO8tUVkVnxJjqneM1KBRCMn07XvowTHes31RZ5RNYSAjRy9QinWE
 KaOBkS5gb3Scj8K8pCO9wUjoAOdnwqzC3UNVZL3DKjcGdbnkVzhTaYF9CpbX+BgzePgs=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vLF6j-0007E1-KW for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Nov 2025 06:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=i6+fGKzHN3lDbRkojfVRWpWl5kuHKUdtJvBCaJ8GUS8=; b=3y/HK/UNEdCM1bwfjg6RKHP3RO
 uf876hLPwGoAnL74opaeFjsY3zqSM9epO3KTWP5I6Za2h33Ysst3d2W2Oxd0kGE7e/GZS1xJ/qrWE
 Bc6C8srmr5dyMYOSTGjuJTA+YD5btEIg5ObI7l5e3WCwIs3COrhfJJyULjTuB705dEAURIVNH1fTP
 PbxmxeK40VLfIzc97pjXHY9sxjs4ojK4p7MZbGEPhLYWK1f9078/Ow/0S1WJzFYBLtMc4PJpsNTW4
 1q5c8/4uTFy83fXMemiX98RxyAih1jQChMGXr/uMFm9eBx1NhVq8X6pRdazFLwPWFQwhbtrryj/fL
 KFsW/lkg==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vLF6d-0000000HUOn-25mJ; Tue, 18 Nov 2025 06:22:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Tue, 18 Nov 2025 07:21:46 +0100
Message-ID: <20251118062159.2358085-4-hch@lst.de>
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
 in the VFS. Switch fscrypt_generate_dun to that convention and remove the
 ci_data_units_per_block_bits member in struct fscrypt_inode_info [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vLF6j-0007E1-KW
Subject: [f2fs-dev] [PATCH 03/11] fscrypt: pass a byte offset to
 fscrypt_generate_dun
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
Switch fscrypt_generate_dun to that convention and remove the
ci_data_units_per_block_bits member in struct fscrypt_inode_info that
was only used to cache the DUN shift based on the logical block size
granularity.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/crypto/fscrypt_private.h |  3 ---
 fs/crypto/inline_crypt.c    | 10 ++++------
 fs/crypto/keysetup.c        |  2 --
 3 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 4e8e82a9ccf9..8d3c278a7591 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -278,9 +278,6 @@ struct fscrypt_inode_info {
 	 */
 	u8 ci_data_unit_bits;
 
-	/* Cached value: log2 of number of data units per FS block */
-	u8 ci_data_units_per_block_bits;
-
 	/* Hashed inode number.  Only set for IV_INO_LBLK_32 */
 	u32 ci_hashed_ino;
 
diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index ed6e926226b5..1773dd7ea7cf 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -268,14 +268,12 @@ bool __fscrypt_inode_uses_inline_crypto(const struct inode *inode)
 EXPORT_SYMBOL_GPL(__fscrypt_inode_uses_inline_crypto);
 
 static void fscrypt_generate_dun(const struct fscrypt_inode_info *ci,
-				 u64 lblk_num,
-				 u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE])
+				 loff_t pos, u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE])
 {
-	u64 index = lblk_num << ci->ci_data_units_per_block_bits;
 	union fscrypt_iv iv;
 	int i;
 
-	fscrypt_generate_iv(&iv, index, ci);
+	fscrypt_generate_iv(&iv, pos >> ci->ci_data_unit_bits, ci);
 
 	BUILD_BUG_ON(FSCRYPT_MAX_IV_SIZE > BLK_CRYPTO_MAX_IV_SIZE);
 	memset(dun, 0, BLK_CRYPTO_MAX_IV_SIZE);
@@ -309,7 +307,7 @@ void fscrypt_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
 		return;
 	ci = fscrypt_get_inode_info_raw(inode);
 
-	fscrypt_generate_dun(ci, first_lblk, dun);
+	fscrypt_generate_dun(ci, first_lblk << inode->i_blkbits, dun);
 	bio_crypt_set_ctx(bio, ci->ci_enc_key.blk_key, dun, gfp_mask);
 }
 EXPORT_SYMBOL_GPL(fscrypt_set_bio_crypt_ctx);
@@ -401,7 +399,7 @@ bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 	if (bc->bc_key != ci->ci_enc_key.blk_key)
 		return false;
 
-	fscrypt_generate_dun(ci, next_lblk, next_dun);
+	fscrypt_generate_dun(ci, next_lblk << inode->i_blkbits, next_dun);
 	return bio_crypt_dun_is_contiguous(bc, bio->bi_iter.bi_size, next_dun);
 }
 EXPORT_SYMBOL_GPL(fscrypt_mergeable_bio);
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index 4bd3918f50e3..f8a96d729dfc 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -609,8 +609,6 @@ fscrypt_setup_encryption_info(struct inode *inode,
 
 	crypt_info->ci_data_unit_bits =
 		fscrypt_policy_du_bits(&crypt_info->ci_policy, inode);
-	crypt_info->ci_data_units_per_block_bits =
-		inode->i_blkbits - crypt_info->ci_data_unit_bits;
 
 	res = setup_file_encryption_key(crypt_info, need_dirhash_key, &mk);
 	if (res)
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
