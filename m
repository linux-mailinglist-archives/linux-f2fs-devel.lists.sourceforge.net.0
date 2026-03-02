Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HDTDo2cpWmfEwYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 15:19:57 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 603031DA9A8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 15:19:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tqgld9E/edzz2lxmJOEE7V+URF88ahwsezoWPGaIvOU=; b=N+NbFXUVhwJDoIwwiyVrv2lqHW
	aTkvtlODGJbJJ/tc6K3gC0hATK4j+YFm4ljT9zzsYZj8VJWKToPfvFw0qjidobC2NYGmMC71VMshz
	ZoXLN14THeW2YBiLNn/WjrtXBdZq+1GIx4AvR4kjSptchTQxL1kUkJBDbCpvD2yf1gO8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vx47l-0002QZ-2q;
	Mon, 02 Mar 2026 14:19:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+ce5019daea4c3780914a+8226+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vx47c-0002Pv-HE for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Mar 2026 14:19:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+suHXziN9hs1Lq65KRn6Suo1LC1ravVOVj6prf63pzg=; b=c8jQHggOwhkQmgIA8V+2uoV7+O
 7pHTxYiFjpgE9QyWcm2Fq7VMi+tZtK/KH5XUbcFZqg4EkTdsONBKf9vPklYy3PHHGkkx42AIxI9ia
 J4OFjgSQRaOTyCDNny3iS2kuTnPf+KaPAwOCASh8jJ/E16hbLybI+aCj/OaxMNblcp9U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+suHXziN9hs1Lq65KRn6Suo1LC1ravVOVj6prf63pzg=; b=KePlLeoIK0k+TVn2qKgYTNDoEt
 2jtVyB2HBaZ6aEGAH58Ibnqc7OHrxKht9hmjFhUq9OM200vgO+dd4d6dCAAa3AjqefpBiXf+p3ibx
 NJloFzQJhSs+jGWyxd6uJ3CTc+qOxpZsxMEF7jmGynfEY7NcaCieEu+GQdzTOxWUPg/Y=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vx47b-0001UA-Pi for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Mar 2026 14:19:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=+suHXziN9hs1Lq65KRn6Suo1LC1ravVOVj6prf63pzg=; b=cNi2zFGmtZmq2gr7RpRT20u+Du
 pDEaaIi4+J/IkBN2rZNBbLGLVO2A7+j9DAufKpG1M5NfTQiX0iX4oNEDnEAEObQfGu+zxc4yLzYFF
 8ZkoQO11iPuBii3X2MNH9X7AsZs89P2hkel+gsiT2t9WQYGqOPqsQTMI4MEnPoXDURbfn12SIf8Q/
 BWPegPda5CO/Lla/cTlk85I3GkXuW4b4raCHeIBieRxINVqTDFqerFIGjkd/npc1oZaK5S4Saixfg
 UKpU2Kl2HWYTRitCEUg3uOuG5Csyo9MKgEucRhLZmRLEQ70W2P7sSxQ5ad3WIJkNKbUsg9L64V+nb
 8EtIzNBA==;
Received: from [2604:3d08:797f:2840::9d5f] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vx47Q-0000000DDT4-34eW; Mon, 02 Mar 2026 14:19:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon,  2 Mar 2026 06:18:13 -0800
Message-ID: <20260302141922.370070-9-hch@lst.de>
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
 in the VFS. Switch fscrypt_set_bio_crypt_ctx to that convention.
 Signed-off-by:
 Christoph Hellwig <hch@lst.de> --- fs/buffer.c | 7 ++----- fs/crypto/bio.c
 | 8 ++++---- fs/crypto/inline_crypt.c | 6 +++--- fs/ext4/page-io.c | 5 ++---
 fs/ext4/readpage.c | 4 ++-- fs/f2 [...] 
 Content analysis details:   (0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vx47b-0001UA-Pi
Subject: [f2fs-dev] [PATCH 08/14] fscrypt: pass a byte offset to
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
X-Rspamd-Queue-Id: 603031DA9A8
X-Rspamd-Action: no action

Logical offsets into an inode are usually expressed as bytes in the VFS.
Switch fscrypt_set_bio_crypt_ctx to that convention.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/buffer.c              | 7 ++-----
 fs/crypto/bio.c          | 8 ++++----
 fs/crypto/inline_crypt.c | 6 +++---
 fs/ext4/page-io.c        | 5 ++---
 fs/ext4/readpage.c       | 4 ++--
 fs/f2fs/data.c           | 4 +++-
 fs/iomap/direct-io.c     | 6 ++----
 include/linux/fscrypt.h  | 7 +++----
 8 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index b6504ec7fa4c..1c8ee5a59f88 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -2778,8 +2778,6 @@ static void buffer_set_crypto_ctx(struct bio *bio, const struct buffer_head *bh,
 				  gfp_t gfp_mask)
 {
 	const struct address_space *mapping = folio_mapping(bh->b_folio);
-	const struct inode *inode;
-	u64 lblk;
 
 	/*
 	 * The ext4 journal (jbd2) can submit a buffer_head it directly created
@@ -2787,9 +2785,8 @@ static void buffer_set_crypto_ctx(struct bio *bio, const struct buffer_head *bh,
 	 */
 	if (!mapping)
 		return;
-	inode = mapping->host;
-	lblk = (folio_pos(bh->b_folio) + bh_offset(bh)) >> inode->i_blkbits;
-	fscrypt_set_bio_crypt_ctx(bio, inode, lblk, gfp_mask);
+	fscrypt_set_bio_crypt_ctx(bio, mapping->host,
+			folio_pos(bh->b_folio) + bh_offset(bh), gfp_mask);
 }
 
 static void submit_bh_wbc(blk_opf_t opf, struct buffer_head *bh,
diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index 0a701d4a17ef..e7fb2fdd9728 100644
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
-					(loff_t)lblk << blockbits))
+			if (!len || !fscrypt_mergeable_bio(bio, inode, pos))
 				break;
 		}
 
diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index b0954d17904b..37d42d357925 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -285,7 +285,7 @@ static void fscrypt_generate_dun(const struct fscrypt_inode_info *ci,
  * fscrypt_set_bio_crypt_ctx() - prepare a file contents bio for inline crypto
  * @bio: a bio which will eventually be submitted to the file
  * @inode: the file's inode
- * @first_lblk: the first file logical block number in the I/O
+ * @pos: the first file position (in bytes) in the I/O
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
diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
index 50f507bab82c..181cda58d387 100644
--- a/fs/ext4/page-io.c
+++ b/fs/ext4/page-io.c
@@ -427,9 +427,8 @@ static void io_submit_init_bio(struct ext4_io_submit *io,
 	 * __GFP_DIRECT_RECLAIM is set, see comments for bio_alloc_bioset().
 	 */
 	bio = bio_alloc(bh->b_bdev, BIO_MAX_VECS, REQ_OP_WRITE, GFP_NOIO);
-	fscrypt_set_bio_crypt_ctx(bio, inode,
-			(folio_pos(folio) + bh_offset(bh)) >> inode->i_blkbits,
-			GFP_NOIO);
+	fscrypt_set_bio_crypt_ctx(bio, inode, folio_pos(folio) + bh_offset(bh),
+				  GFP_NOIO);
 	bio->bi_iter.bi_sector = bh->b_blocknr * (bh->b_size >> 9);
 	bio->bi_end_io = ext4_end_bio;
 	bio->bi_private = ext4_get_io_end(io->io_end);
diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index ba7cfddd6038..fbfa4d830d9a 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -355,8 +355,8 @@ static int ext4_mpage_readpages(struct inode *inode, struct fsverity_info *vi,
 			 */
 			bio = bio_alloc(bdev, bio_max_segs(nr_pages),
 					REQ_OP_READ, GFP_KERNEL);
-			fscrypt_set_bio_crypt_ctx(bio, inode, next_block,
-						  GFP_KERNEL);
+			fscrypt_set_bio_crypt_ctx(bio, inode,
+					(loff_t)next_block << blkbits, GFP_KERNEL);
 			ext4_set_bio_post_read_ctx(bio, inode, vi);
 			bio->bi_iter.bi_sector = first_block << (blkbits - 9);
 			bio->bi_end_io = mpage_end_io;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index dca273fedfde..07b4ed6bb0cc 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -527,7 +527,9 @@ static void f2fs_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
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
index 95254aa1b654..b4ee4465f4db 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -298,8 +298,7 @@ static int iomap_dio_zero(const struct iomap_iter *iter, struct iomap_dio *dio,
 
 	bio = iomap_dio_alloc_bio(iter, dio, nr_vecs,
 				  REQ_OP_WRITE | REQ_SYNC | REQ_IDLE);
-	fscrypt_set_bio_crypt_ctx(bio, inode, pos >> inode->i_blkbits,
-				  GFP_KERNEL);
+	fscrypt_set_bio_crypt_ctx(bio, inode, pos, GFP_KERNEL);
 	bio->bi_iter.bi_sector = iomap_sector(&iter->iomap, pos);
 	bio->bi_private = dio;
 	bio->bi_end_io = iomap_dio_bio_end_io;
@@ -329,8 +328,7 @@ static ssize_t iomap_dio_bio_iter_one(struct iomap_iter *iter,
 		nr_vecs = bio_iov_vecs_to_alloc(dio->submit.iter, BIO_MAX_VECS);
 
 	bio = iomap_dio_alloc_bio(iter, dio, nr_vecs, op);
-	fscrypt_set_bio_crypt_ctx(bio, iter->inode,
-			pos >> iter->inode->i_blkbits, GFP_KERNEL);
+	fscrypt_set_bio_crypt_ctx(bio, iter->inode, pos, GFP_KERNEL);
 	bio->bi_iter.bi_sector = iomap_sector(&iter->iomap, pos);
 	bio->bi_write_hint = iter->inode->i_write_hint;
 	bio->bi_ioprio = dio->iocb->ki_ioprio;
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 98fb14660d40..90f75fe0e1c9 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -865,9 +865,8 @@ static inline void fscrypt_set_ops(struct super_block *sb,
 
 bool __fscrypt_inode_uses_inline_crypto(const struct inode *inode);
 
-void fscrypt_set_bio_crypt_ctx(struct bio *bio,
-			       const struct inode *inode, u64 first_lblk,
-			       gfp_t gfp_mask);
+void fscrypt_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
+			       loff_t pos, gfp_t gfp_mask);
 
 bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 			   loff_t pos);
@@ -885,7 +884,7 @@ static inline bool __fscrypt_inode_uses_inline_crypto(const struct inode *inode)
 
 static inline void fscrypt_set_bio_crypt_ctx(struct bio *bio,
 					     const struct inode *inode,
-					     u64 first_lblk, gfp_t gfp_mask) { }
+					     loff_t pos, gfp_t gfp_mask) { }
 
 static inline bool fscrypt_mergeable_bio(struct bio *bio,
 					 const struct inode *inode,
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
