Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3E42B6797
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Nov 2020 15:34:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RZOsdzKJpS3bQBUZZwkjyCBqOAsKKzGH7Gq4oaTorOo=; b=VzPSalOqeVi8g9QniQKiWY5rF
	pH3JR2dfNM7WH5SrTFTe0OuPfiqcZWYGHBBYYKk2A9T57cxLQfpO1WLS+nANkzTeHnSFhI2esZD/9
	x8nwQgwU73xydKHKflr9ft91IgPzV/BtrR/hNcduB4J6WB3Nm0LAQyMLB7HwwbpJ7WzUE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kf23u-0001XE-BP; Tue, 17 Nov 2020 14:34:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3FNmzXwYKAJkL3MR3M9HH9E7.5HF@flex--satyat.bounces.google.com>)
 id 1kf23t-0001Ws-81
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 14:34:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gI9t9CC9GAbETMLuNAlH/ClZ/2jSqevbRrvZwCwXB2c=; b=i5NOK+69LZdN1FCCX7CixhP74
 Maq5ziYb6kX/W/wCSUnFgat30pTmcWB/xOqky8G+h/Pras3ywydzmgacYw50rg3qn5CXw8LUY/wwz
 QXqWzNneQ0+i1LNj5M9+tqfBeEONmt4hAxyjS4C2/pgXGKnygJUzGRJCgVduabG7Hxrng=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gI9t9CC9GAbETMLuNAlH/ClZ/2jSqevbRrvZwCwXB2c=; b=LR6dRIDUvapslYkqibuEmqbOOP
 hWYcVq+Kbjl2vUaT1RzX1p86y0CwII8giDJ5GDJMdyEmWmN6ceYy1bpl74Le8PlP4LgszMSkAhZ69
 NW85sVZf/EkDRTmfb4N1Zkb+Oi6rVNF7mcoWkxUv0CjNmtehLAP3kK1n57UPnbDoG8hM=;
Received: from mail-ot1-f73.google.com ([209.85.210.73])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kf23a-000oTM-JW
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 14:34:23 +0000
Received: by mail-ot1-f73.google.com with SMTP id u8so9210248otg.18
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Nov 2020 06:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=gI9t9CC9GAbETMLuNAlH/ClZ/2jSqevbRrvZwCwXB2c=;
 b=RftOlyar3vMM+UuLWWoDc+3E4txH9IyOqegNk1ZKpYqJ+64DndBUuka4yGqTGvV8HZ
 kKKYIdA3FBdISG2pT5diEdurh7c6SenZdtfseQienr50nVwEs+lVPqoh/QQcPcHbxKTd
 6z7tLj8QkLtfqCHUCSwGQImVKkXObQm1qs9c+uvW7zoloZat5A0FTqmA9aG/G8SXJdsa
 XBCaiEzt4ANxyW9qoY3hqx21xVpXdpDPR+RQQfctNVrHqjmeDGIDEGd96xqHl9PF78S+
 xVP/FSmJPwvk20i6vSzW80obRBeRa+undBkZLraZ4Zn/siWNcMZHVxphaEILVDyr4sDw
 uynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=gI9t9CC9GAbETMLuNAlH/ClZ/2jSqevbRrvZwCwXB2c=;
 b=LBeBCe2Pl6Ddc18KTTIQYvAnGzg63LSyLvFbol8ljvrMr284iMVfMqcS/wzYVHpcrH
 IMuhMuUZaqOztgJ8MsWgVJP5Jso7OfqbrDWcklzPvR81IHYcBUBMRG4ZUa4hAHvZ8hvD
 nd7FCBxSy5wQ5Swga2vcvzRpGnRYialuO1rXOhOBqRL8Mbnge2/wefgnSpjD1EhMLoSD
 Nr5PW6lq3BXDgUIFFoUE5YSMzNGKixET1M7ETyM9L2Dh9G8gohnJMxQJomDCTryGTX4V
 Ug2dK06hfMb0qh4UigQHap7n2CQOeaVVqTq2H2qHJiwHGP9tI5U1wy7pwgQD+KKxla41
 J62A==
X-Gm-Message-State: AOAM5321OsKf87ziwkTr69SXlCvHeKAjYnwBTUGZpDRZN3qHqvfBcy1Q
 2SV22ru26jfeURQ6DT8SHEw1R+QzhF0=
X-Google-Smtp-Source: ABdhPJz9doXCbA2XybATuEWhl6nzDUH2qic2NqkzBZezLv85f8bG7r9mJGCgGG0IMaxYIkm8TwTZJBSohjQ=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a25:d7d4:: with SMTP id
 o203mr23633500ybg.286.1605622036343; 
 Tue, 17 Nov 2020 06:07:16 -0800 (PST)
Date: Tue, 17 Nov 2020 14:07:02 +0000
In-Reply-To: <20201117140708.1068688-1-satyat@google.com>
Message-Id: <20201117140708.1068688-3-satyat@google.com>
Mime-Version: 1.0
References: <20201117140708.1068688-1-satyat@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, "Darrick J . Wong" <darrick.wong@oracle.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1kf23a-000oTM-JW
Subject: [f2fs-dev] [PATCH v7 2/8] blk-crypto: don't require user buffer
 alignment
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: linux-block@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 Satya Tangirala <satyat@google.com>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Previously, blk-crypto-fallback required the offset and length of each bvec
in a bio to be aligned to the crypto data unit size. This patch enables
blk-crypto-fallback to work even if that's not the case - the requirement
now is only that the total length of the data in the bio is aligned to
the crypto data unit size.

Now that blk-crypto-fallback can handle bvecs not aligned to crypto data
units, and we've ensured that bios are not split in the middle of a
crypto data unit, we can relax the alignment check done by blk-crypto.

Co-developed-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
---
 block/blk-crypto-fallback.c | 202 +++++++++++++++++++++++++++---------
 block/blk-crypto.c          |  19 +---
 2 files changed, 157 insertions(+), 64 deletions(-)

diff --git a/block/blk-crypto-fallback.c b/block/blk-crypto-fallback.c
index db2d2c67b308..619f0746ce02 100644
--- a/block/blk-crypto-fallback.c
+++ b/block/blk-crypto-fallback.c
@@ -251,6 +251,65 @@ static void blk_crypto_dun_to_iv(const u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE],
 		iv->dun[i] = cpu_to_le64(dun[i]);
 }
 
+/*
+ * If the length of any bio segment isn't a multiple of data_unit_size
+ * (which can happen if data_unit_size > logical_block_size), then each
+ * encryption/decryption might need to be passed multiple scatterlist elements.
+ * If that will be the case, this function allocates and initializes src and dst
+ * scatterlists (or a combined src/dst scatterlist) with the needed length.
+ *
+ * If 1 element is guaranteed to be enough (which is usually the case, and is
+ * guaranteed when data_unit_size <= logical_block_size), then this function
+ * just initializes the on-stack scatterlist(s).
+ */
+static bool blk_crypto_alloc_sglists(struct bio *bio,
+				     const struct bvec_iter *start_iter,
+				     unsigned int data_unit_size,
+				     struct scatterlist **src_p,
+				     struct scatterlist **dst_p)
+{
+	struct bio_vec bv;
+	struct bvec_iter iter;
+	bool aligned = true;
+	unsigned int count = 0;
+
+	__bio_for_each_segment(bv, bio, iter, *start_iter) {
+		count++;
+		aligned &= IS_ALIGNED(bv.bv_len, data_unit_size);
+	}
+	if (aligned) {
+		count = 1;
+	} else {
+		/*
+		 * We can't need more elements than bio segments, and we can't
+		 * need more than the number of sectors per data unit.  This may
+		 * overestimate the required length by a bit, but that's okay.
+		 */
+		count = min(count, data_unit_size >> SECTOR_SHIFT);
+	}
+
+	if (count > 1) {
+		*src_p = kmalloc_array(count, sizeof(struct scatterlist),
+				       GFP_NOIO);
+		if (!*src_p)
+			return false;
+		if (dst_p) {
+			*dst_p = kmalloc_array(count,
+					       sizeof(struct scatterlist),
+					       GFP_NOIO);
+			if (!*dst_p) {
+				kfree(*src_p);
+				*src_p = NULL;
+				return false;
+			}
+		}
+	}
+	sg_init_table(*src_p, count);
+	if (dst_p)
+		sg_init_table(*dst_p, count);
+	return true;
+}
+
 /*
  * The crypto API fallback's encryption routine.
  * Allocate a bounce bio for encryption, encrypt the input bio using crypto API,
@@ -267,9 +326,12 @@ static bool blk_crypto_fallback_encrypt_bio(struct bio **bio_ptr)
 	struct skcipher_request *ciph_req = NULL;
 	DECLARE_CRYPTO_WAIT(wait);
 	u64 curr_dun[BLK_CRYPTO_DUN_ARRAY_SIZE];
-	struct scatterlist src, dst;
+	struct scatterlist _src, *src = &_src;
+	struct scatterlist _dst, *dst = &_dst;
 	union blk_crypto_iv iv;
-	unsigned int i, j;
+	unsigned int i;
+	unsigned int sg_idx = 0;
+	unsigned int du_filled = 0;
 	bool ret = false;
 	blk_status_t blk_st;
 
@@ -281,11 +343,18 @@ static bool blk_crypto_fallback_encrypt_bio(struct bio **bio_ptr)
 	bc = src_bio->bi_crypt_context;
 	data_unit_size = bc->bc_key->crypto_cfg.data_unit_size;
 
+	/* Allocate scatterlists if needed */
+	if (!blk_crypto_alloc_sglists(src_bio, &src_bio->bi_iter,
+				      data_unit_size, &src, &dst)) {
+		src_bio->bi_status = BLK_STS_RESOURCE;
+		return false;
+	}
+
 	/* Allocate bounce bio for encryption */
 	enc_bio = blk_crypto_clone_bio(src_bio);
 	if (!enc_bio) {
 		src_bio->bi_status = BLK_STS_RESOURCE;
-		return false;
+		goto out_free_sglists;
 	}
 
 	/*
@@ -305,45 +374,57 @@ static bool blk_crypto_fallback_encrypt_bio(struct bio **bio_ptr)
 	}
 
 	memcpy(curr_dun, bc->bc_dun, sizeof(curr_dun));
-	sg_init_table(&src, 1);
-	sg_init_table(&dst, 1);
 
-	skcipher_request_set_crypt(ciph_req, &src, &dst, data_unit_size,
+	skcipher_request_set_crypt(ciph_req, src, dst, data_unit_size,
 				   iv.bytes);
 
-	/* Encrypt each page in the bounce bio */
+	/*
+	 * Encrypt each data unit in the bounce bio.
+	 *
+	 * Take care to handle the case where a data unit spans bio segments.
+	 * This can happen when data_unit_size > logical_block_size.
+	 */
 	for (i = 0; i < enc_bio->bi_vcnt; i++) {
-		struct bio_vec *enc_bvec = &enc_bio->bi_io_vec[i];
-		struct page *plaintext_page = enc_bvec->bv_page;
+		struct bio_vec *bv = &enc_bio->bi_io_vec[i];
+		struct page *plaintext_page = bv->bv_page;
 		struct page *ciphertext_page =
 			mempool_alloc(blk_crypto_bounce_page_pool, GFP_NOIO);
+		unsigned int offset_in_bv = 0;
 
-		enc_bvec->bv_page = ciphertext_page;
+		bv->bv_page = ciphertext_page;
 
 		if (!ciphertext_page) {
 			src_bio->bi_status = BLK_STS_RESOURCE;
 			goto out_free_bounce_pages;
 		}
 
-		sg_set_page(&src, plaintext_page, data_unit_size,
-			    enc_bvec->bv_offset);
-		sg_set_page(&dst, ciphertext_page, data_unit_size,
-			    enc_bvec->bv_offset);
-
-		/* Encrypt each data unit in this page */
-		for (j = 0; j < enc_bvec->bv_len; j += data_unit_size) {
-			blk_crypto_dun_to_iv(curr_dun, &iv);
-			if (crypto_wait_req(crypto_skcipher_encrypt(ciph_req),
-					    &wait)) {
-				i++;
-				src_bio->bi_status = BLK_STS_IOERR;
-				goto out_free_bounce_pages;
+		while (offset_in_bv < bv->bv_len) {
+			unsigned int n = min(bv->bv_len - offset_in_bv,
+					     data_unit_size - du_filled);
+			sg_set_page(&src[sg_idx], plaintext_page, n,
+				    bv->bv_offset + offset_in_bv);
+			sg_set_page(&dst[sg_idx], ciphertext_page, n,
+				    bv->bv_offset + offset_in_bv);
+			sg_idx++;
+			offset_in_bv += n;
+			du_filled += n;
+			if (du_filled == data_unit_size) {
+				blk_crypto_dun_to_iv(curr_dun, &iv);
+				if (crypto_wait_req(crypto_skcipher_encrypt(ciph_req),
+						    &wait)) {
+					src_bio->bi_status = BLK_STS_IOERR;
+					goto out_free_bounce_pages;
+				}
+				bio_crypt_dun_increment(curr_dun, 1);
+				sg_idx = 0;
+				du_filled = 0;
 			}
-			bio_crypt_dun_increment(curr_dun, 1);
-			src.offset += data_unit_size;
-			dst.offset += data_unit_size;
 		}
 	}
+	if (WARN_ON_ONCE(du_filled != 0)) {
+		src_bio->bi_status = BLK_STS_IOERR;
+		goto out_free_bounce_pages;
+	}
 
 	enc_bio->bi_private = src_bio;
 	enc_bio->bi_end_io = blk_crypto_fallback_encrypt_endio;
@@ -364,7 +445,11 @@ static bool blk_crypto_fallback_encrypt_bio(struct bio **bio_ptr)
 out_put_enc_bio:
 	if (enc_bio)
 		bio_put(enc_bio);
-
+out_free_sglists:
+	if (src != &_src)
+		kfree(src);
+	if (dst != &_dst)
+		kfree(dst);
 	return ret;
 }
 
@@ -383,13 +468,21 @@ static void blk_crypto_fallback_decrypt_bio(struct work_struct *work)
 	DECLARE_CRYPTO_WAIT(wait);
 	u64 curr_dun[BLK_CRYPTO_DUN_ARRAY_SIZE];
 	union blk_crypto_iv iv;
-	struct scatterlist sg;
+	struct scatterlist _sg, *sg = &_sg;
 	struct bio_vec bv;
 	struct bvec_iter iter;
 	const int data_unit_size = bc->bc_key->crypto_cfg.data_unit_size;
-	unsigned int i;
+	unsigned int sg_idx = 0;
+	unsigned int du_filled = 0;
 	blk_status_t blk_st;
 
+	/* Allocate scatterlist if needed */
+	if (!blk_crypto_alloc_sglists(bio, &f_ctx->crypt_iter, data_unit_size,
+				      &sg, NULL)) {
+		bio->bi_status = BLK_STS_RESOURCE;
+		goto out_no_sglists;
+	}
+
 	/*
 	 * Use the crypto API fallback keyslot manager to get a crypto_skcipher
 	 * for the algorithm and key specified for this bio.
@@ -407,33 +500,48 @@ static void blk_crypto_fallback_decrypt_bio(struct work_struct *work)
 	}
 
 	memcpy(curr_dun, bc->bc_dun, sizeof(curr_dun));
-	sg_init_table(&sg, 1);
-	skcipher_request_set_crypt(ciph_req, &sg, &sg, data_unit_size,
-				   iv.bytes);
+	skcipher_request_set_crypt(ciph_req, sg, sg, data_unit_size, iv.bytes);
 
-	/* Decrypt each segment in the bio */
+	/*
+	 * Decrypt each data unit in the bio.
+	 *
+	 * Take care to handle the case where a data unit spans bio segments.
+	 * This can happen when data_unit_size > logical_block_size.
+	 */
 	__bio_for_each_segment(bv, bio, iter, f_ctx->crypt_iter) {
-		struct page *page = bv.bv_page;
-
-		sg_set_page(&sg, page, data_unit_size, bv.bv_offset);
-
-		/* Decrypt each data unit in the segment */
-		for (i = 0; i < bv.bv_len; i += data_unit_size) {
-			blk_crypto_dun_to_iv(curr_dun, &iv);
-			if (crypto_wait_req(crypto_skcipher_decrypt(ciph_req),
-					    &wait)) {
-				bio->bi_status = BLK_STS_IOERR;
-				goto out;
+		unsigned int offset_in_bv = 0;
+
+		while (offset_in_bv < bv.bv_len) {
+			unsigned int n = min(bv.bv_len - offset_in_bv,
+					     data_unit_size - du_filled);
+			sg_set_page(&sg[sg_idx++], bv.bv_page, n,
+				    bv.bv_offset + offset_in_bv);
+			offset_in_bv += n;
+			du_filled += n;
+			if (du_filled == data_unit_size) {
+				blk_crypto_dun_to_iv(curr_dun, &iv);
+				if (crypto_wait_req(crypto_skcipher_decrypt(ciph_req),
+						    &wait)) {
+					bio->bi_status = BLK_STS_IOERR;
+					goto out;
+				}
+				bio_crypt_dun_increment(curr_dun, 1);
+				sg_idx = 0;
+				du_filled = 0;
 			}
-			bio_crypt_dun_increment(curr_dun, 1);
-			sg.offset += data_unit_size;
 		}
 	}
-
+	if (WARN_ON_ONCE(du_filled != 0)) {
+		bio->bi_status = BLK_STS_IOERR;
+		goto out;
+	}
 out:
 	skcipher_request_free(ciph_req);
 	blk_ksm_put_slot(slot);
 out_no_keyslot:
+	if (sg != &_sg)
+		kfree(sg);
+out_no_sglists:
 	mempool_free(f_ctx, bio_fallback_crypt_ctx_pool);
 	bio_endio(bio);
 }
diff --git a/block/blk-crypto.c b/block/blk-crypto.c
index 5da43f0973b4..fcee0038f7e0 100644
--- a/block/blk-crypto.c
+++ b/block/blk-crypto.c
@@ -200,22 +200,6 @@ bool bio_crypt_ctx_mergeable(struct bio_crypt_ctx *bc1, unsigned int bc1_bytes,
 	return !bc1 || bio_crypt_dun_is_contiguous(bc1, bc1_bytes, bc2->bc_dun);
 }
 
-/* Check that all I/O segments are data unit aligned. */
-static bool bio_crypt_check_alignment(struct bio *bio)
-{
-	const unsigned int data_unit_size =
-		bio->bi_crypt_context->bc_key->crypto_cfg.data_unit_size;
-	struct bvec_iter iter;
-	struct bio_vec bv;
-
-	bio_for_each_segment(bv, bio, iter) {
-		if (!IS_ALIGNED(bv.bv_len | bv.bv_offset, data_unit_size))
-			return false;
-	}
-
-	return true;
-}
-
 blk_status_t __blk_crypto_init_request(struct request *rq)
 {
 	return blk_ksm_get_slot_for_key(rq->q->ksm, rq->crypt_ctx->bc_key,
@@ -271,7 +255,8 @@ bool __blk_crypto_bio_prep(struct bio **bio_ptr)
 		goto fail;
 	}
 
-	if (!bio_crypt_check_alignment(bio)) {
+	if (!IS_ALIGNED(bio->bi_iter.bi_size,
+			bc_key->crypto_cfg.data_unit_size)) {
 		bio->bi_status = BLK_STS_IOERR;
 		goto fail;
 	}
-- 
2.29.2.299.gdc1121823c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
