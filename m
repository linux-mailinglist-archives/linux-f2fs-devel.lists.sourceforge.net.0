Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FD8C67B31
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Nov 2025 07:23:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DH+Qb840YM3prL5RpJyG1gTUF7+ovxqv9K4Zb4irGAw=; b=YV8LS+KWRdnZhE30bTg23MOBxP
	ZESH4r6VLhq5Ly6i5EOka4+aQt9ZjT5dng2BQ8/dNFOlhlayeUYLMAo7cgGL2/3p8trxqvnsL5Ul9
	/l6h3H3l0TDwI7BhNLt1EfshO/2YV9M8cdhNxoEJ/826Y1lFZgoq2tRIEoqh5gaS1weo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vLF70-00032G-UE;
	Tue, 18 Nov 2025 06:22:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+0812c32a4ab075f64334+8122+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vLF6z-000325-BJ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Nov 2025 06:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OPIzFSk2TSTMy8PDNKkZIvullfOau/EvrnIO40ungf8=; b=Lmj/4jy718vygXxGYbpvmY4b0X
 cZaS33DQmKuO4CQdbMnrklAasaVTUDRds00nglX1hE9Us5/E8kfE3Eo4XyfAqm06CB8KCJlMtCeZC
 wOwghjAA8ory4CIbbY8KMsMBEIqR1ntAWgJrq82+h26+dyBmbbloimwJBmfKC/OYryD0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OPIzFSk2TSTMy8PDNKkZIvullfOau/EvrnIO40ungf8=; b=MeDvCs2+T8LY51BhWweW8wtSJe
 mUzMPWTkX1hxApMAfYoDrggUD4QXo8PXHgEmZ3TQTwmb0243ZJECOuq28ry0e47ha0sS8FtBD4Tx+
 moAP9VKUCSs8AlCpA68lab7EGbgfW4U5j39L22kj9J3UOFugzdyJY93by0czSxYA6j2U=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vLF6y-0007Eo-Fx for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Nov 2025 06:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=OPIzFSk2TSTMy8PDNKkZIvullfOau/EvrnIO40ungf8=; b=E+vK4oO9q9RxN/X6DrsIjv5N3W
 yuyGN/pxLD0dke7KtYXTlzM3XdGxf+gWc4Sk0b72l5y22QXpHJoblK9AZrWWjkpxb7s77cvIvr0vH
 zVQsGe4CxeALx7MqQ8Im0iujo3AR3Ueu70AuB5f6fmHbwZ7JJHSjXni2X5TND78MJ0zF+gkWQLVG8
 mfUNdAQqxOj6a4cCzPHfvohV7Co8yYPpp0snLB8VARm42Jz/mmNs2nvL15zXV40VYM+9Kzmql7sCJ
 gXfSBbOQhhT2JRLYK6TVT9z3Vp0xuoxi4HIixsWXhNwOZu0p8sRmEYHGBuMe6MqV7nxRja+Zel1Qv
 Qlq+Uzcw==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vLF6n-0000000HUPY-0cXV; Tue, 18 Nov 2025 06:22:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Tue, 18 Nov 2025 07:21:48 +0100
Message-ID: <20251118062159.2358085-6-hch@lst.de>
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
 in the VFS. Switch fscrypt_set_bio_crypt_ctx to that convention.
 Signed-off-by:
 Christoph Hellwig <hch@lst.de> --- fs/crypto/bio.c | 8 ++++----
 fs/crypto/inline_crypt.c
 | 9 +++++---- fs/ext4/readpage.c | 4 ++-- fs/f2fs/data.c | 4 +++-
 fs/iomap/direct-io.c | 6 ++--- [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vLF6y-0007Eo-Fx
Subject: [f2fs-dev] [PATCH 05/11] fscrypt: pass a byte offset to
 fscrypt_set_bio_crypt_ctx
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
Switch fscrypt_set_bio_crypt_ctx to that convention.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/crypto/bio.c          | 8 ++++----
 fs/crypto/inline_crypt.c | 9 +++++----
 fs/ext4/readpage.c       | 4 ++--
 fs/f2fs/data.c           | 4 +++-
 fs/iomap/direct-io.c     | 6 ++----
 include/linux/fscrypt.h  | 7 +++----
 6 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index fce401c9df98..3a7e3b37ac02 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -75,6 +75,7 @@ static int fscrypt_zeroout_range_inline_crypt(const struct inode *inode,
 {
 	const unsigned int blockbits = inode->i_blkbits;
 	const unsigned int blocks_per_page = 1 << (PAGE_SHIFT - blockbits);
+	loff_t pos = (loff_t)lblk << blockbits;
 	struct fscrypt_zero_done done = {
 		.pending	= ATOMIC_INIT(1),
 		.done		= COMPLETION_INITIALIZER_ONSTACK(done.done),
@@ -89,7 +90,7 @@ static int fscrypt_zeroout_range_inline_crypt(const struct inode *inode,
 		bio->bi_iter.bi_sector = sector;
 		bio->bi_private = &done;
 		bio->bi_end_io = fscrypt_zeroout_range_end_io;
-		fscrypt_set_bio_crypt_ctx(bio, inode, lblk, GFP_NOFS);
+		fscrypt_set_bio_crypt_ctx(bio, inode, pos, GFP_NOFS);
 
 		for (n = 0; n < BIO_MAX_VECS; n++) {
 			unsigned int blocks_this_page =
@@ -98,10 +99,9 @@ static int fscrypt_zeroout_range_inline_crypt(const struct inode *inode,
 
 			__bio_add_page(bio, ZERO_PAGE(0), bytes_this_page, 0);
 			len -= blocks_this_page;
-			lblk += blocks_this_page;
+			pos += bytes_this_page;
 			sector += (bytes_this_page >> SECTOR_SHIFT);
-			if (!len || !fscrypt_mergeable_bio(bio, inode,
-			    		(loff_t)lblk << blockbits))
+			if (!len || !fscrypt_mergeable_bio(bio, inode, pos))
 				break;
 		}
 
diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index aba830e0827d..c069958c4819 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -285,7 +285,7 @@ static void fscrypt_generate_dun(const struct fscrypt_inode_info *ci,
  * fscrypt_set_bio_crypt_ctx() - prepare a file contents bio for inline crypto
  * @bio: a bio which will eventually be submitted to the file
  * @inode: the file's inode
- * @first_lblk: the first file logical block number in the I/O
+ * @pos: the first file logical offset (in bytes) in the I/O
  * @gfp_mask: memory allocation flags - these must be a waiting mask so that
  *					bio_crypt_set_ctx can't fail.
  *
@@ -298,7 +298,7 @@ static void fscrypt_generate_dun(const struct fscrypt_inode_info *ci,
  * The encryption context will be freed automatically when the bio is freed.
  */
 void fscrypt_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
-			       u64 first_lblk, gfp_t gfp_mask)
+			       loff_t pos, gfp_t gfp_mask)
 {
 	const struct fscrypt_inode_info *ci;
 	u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE];
@@ -307,7 +307,7 @@ void fscrypt_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
 		return;
 	ci = fscrypt_get_inode_info_raw(inode);
 
-	fscrypt_generate_dun(ci, first_lblk << inode->i_blkbits, dun);
+	fscrypt_generate_dun(ci, pos, dun);
 	bio_crypt_set_ctx(bio, ci->ci_enc_key.blk_key, dun, gfp_mask);
 }
 EXPORT_SYMBOL_GPL(fscrypt_set_bio_crypt_ctx);
@@ -353,7 +353,8 @@ void fscrypt_set_bio_crypt_ctx_bh(struct bio *bio,
 	u64 first_lblk;
 
 	if (bh_get_inode_and_lblk_num(first_bh, &inode, &first_lblk))
-		fscrypt_set_bio_crypt_ctx(bio, inode, first_lblk, gfp_mask);
+		fscrypt_set_bio_crypt_ctx(bio, inode,
+			first_lblk << inode->i_blkbits, gfp_mask);
 }
 EXPORT_SYMBOL_GPL(fscrypt_set_bio_crypt_ctx_bh);
 
diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index 371f34a14084..ac3965040f85 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -359,8 +359,8 @@ int ext4_mpage_readpages(struct inode *inode,
 			 */
 			bio = bio_alloc(bdev, bio_max_segs(nr_pages),
 					REQ_OP_READ, GFP_KERNEL);
-			fscrypt_set_bio_crypt_ctx(bio, inode, next_block,
-						  GFP_KERNEL);
+			fscrypt_set_bio_crypt_ctx(bio, inode,
+					(loff_t)next_block << blkbits, GFP_KERNEL);
 			ext4_set_bio_post_read_ctx(bio, inode, folio->index);
 			bio->bi_iter.bi_sector = first_block << (blkbits - 9);
 			bio->bi_end_io = mpage_end_io;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index dd3c98fbe6b5..270770c611cf 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -489,7 +489,9 @@ static void f2fs_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
 	 * read/write raw data without encryption.
 	 */
 	if (!fio || !fio->encrypted_page)
-		fscrypt_set_bio_crypt_ctx(bio, inode, first_idx, gfp_mask);
+		fscrypt_set_bio_crypt_ctx(bio, inode,
+				(loff_t)first_idx << inode->i_blkbits,
+				gfp_mask);
 }
 
 static bool f2fs_crypt_mergeable_bio(struct bio *bio, const struct inode *inode,
diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index 5d5d63efbd57..01b4a8c44cc2 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -295,8 +295,7 @@ static int iomap_dio_zero(const struct iomap_iter *iter, struct iomap_dio *dio,
 		return -EINVAL;
 
 	bio = iomap_dio_alloc_bio(iter, dio, 1, REQ_OP_WRITE | REQ_SYNC | REQ_IDLE);
-	fscrypt_set_bio_crypt_ctx(bio, inode, pos >> inode->i_blkbits,
-				  GFP_KERNEL);
+	fscrypt_set_bio_crypt_ctx(bio, inode, pos, GFP_KERNEL);
 	bio->bi_iter.bi_sector = iomap_sector(&iter->iomap, pos);
 	bio->bi_private = dio;
 	bio->bi_end_io = iomap_dio_bio_end_io;
@@ -425,8 +424,7 @@ static int iomap_dio_bio_iter(struct iomap_iter *iter, struct iomap_dio *dio)
 		}
 
 		bio = iomap_dio_alloc_bio(iter, dio, nr_pages, bio_opf);
-		fscrypt_set_bio_crypt_ctx(bio, inode, pos >> inode->i_blkbits,
-					  GFP_KERNEL);
+		fscrypt_set_bio_crypt_ctx(bio, inode, pos, GFP_KERNEL);
 		bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
 		bio->bi_write_hint = inode->i_write_hint;
 		bio->bi_ioprio = dio->iocb->ki_ioprio;
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 5f2e02a61401..5b86d7d0d367 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -865,9 +865,8 @@ static inline void fscrypt_set_ops(struct super_block *sb,
 
 bool __fscrypt_inode_uses_inline_crypto(const struct inode *inode);
 
-void fscrypt_set_bio_crypt_ctx(struct bio *bio,
-			       const struct inode *inode, u64 first_lblk,
-			       gfp_t gfp_mask);
+void fscrypt_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
+			       loff_t pos, gfp_t gfp_mask);
 
 void fscrypt_set_bio_crypt_ctx_bh(struct bio *bio,
 				  const struct buffer_head *first_bh,
@@ -892,7 +891,7 @@ static inline bool __fscrypt_inode_uses_inline_crypto(const struct inode *inode)
 
 static inline void fscrypt_set_bio_crypt_ctx(struct bio *bio,
 					     const struct inode *inode,
-					     u64 first_lblk, gfp_t gfp_mask) { }
+					     loff_t pos, gfp_t gfp_mask) { }
 
 static inline void fscrypt_set_bio_crypt_ctx_bh(
 					 struct bio *bio,
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
