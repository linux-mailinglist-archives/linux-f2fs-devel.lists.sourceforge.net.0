Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3EC2FF867
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Jan 2021 00:06:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+YtnI18U4f5w11k3VtWaHnIoSV2e0Z39pGbj+GJ1DG4=; b=NPdx+fS39NxK7Uy00HptaN0Cz
	fCZstz77QfMppmzw8HRG9hvi1AaoFHfx2WzxDzDVS0tcuXJ7jL2VgMKQSAagMXQSn9Hg17lxNFCeP
	iul90or8VZcMcQzdHuAuzPbqf2gtCu07zfAJvnw6acFNgV0z5NclKmNNxAuYYwEwWL/1M=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l2j26-00015X-63; Thu, 21 Jan 2021 23:06:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3TQgKYAYKAIw8q9Eq9w44w1u.s42@flex--satyat.bounces.google.com>)
 id 1l2izk-0000zR-1Z
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Jan 2021 23:04:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tsvK1rDY/RlLBS3dgT5AwWIiim6Sn26CCHt+oR69tjk=; b=l2+ProFVeoEHfiit5qnJndmnc
 fY5E2jOHwlNQbh1Jw8GgVw7NpgCqwCdoTLhNjpol0beMjyWeZdYKJFfUOybaWlQFB5RHgy8QS+ieD
 hHxKxEfkokcQcgJnvTnl8gQ4Np+A60n84ISWk154yNdID9+Qmfj8bXPxvTMp7GTdSKNS8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tsvK1rDY/RlLBS3dgT5AwWIiim6Sn26CCHt+oR69tjk=; b=UBKrbQ1rcTf+8om5jFmQETBtRK
 fahIcZTB3vNpwMCVr8/eJrMo6wRy7vi8xYqHHY+R7LLv2lmdS2JKMjK2F+5CwUwoEZvcm9Lwry4co
 VvNuGhT1R7x3LRYXmoK6x4OL7YCjFvHM+X3yFoRzdBWVkFdLZasb676GyzjPoKmWDv+s=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l2iza-00BrDm-AP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Jan 2021 23:04:03 +0000
Received: by mail-yb1-f202.google.com with SMTP id y1so3682099ybe.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Jan 2021 15:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=tsvK1rDY/RlLBS3dgT5AwWIiim6Sn26CCHt+oR69tjk=;
 b=H/ahfyxTlyAPoLQaLRVWHEfSuE2axSrjqhW9z2Mnk7WuoPj/ZKZko57raR77rpxVUS
 vGwJPkad8WqGC5uNEHe2PllgE4DRbRX8ULPa/2hGY4Fjce2VmuAtEDmj9sxB+1HQd2Ij
 huFtfko8gVOilXe/PCJHJrALQh78niqaraqp7KGQbD2bAWxCJaBB820SMYDvaiJX3gva
 K8wTvNwsa7X/XHG9dnqW+3ZXusKESAnS9SCMqrpp24B2LurLmupOFgYBP9bgq6d5PE8t
 xOg1b8z4ACYb29jVYDdbIIaDsLqXtnJG+q87KfmXxu6L+6QG9jaQ45Pprba2uC92gd7v
 UJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=tsvK1rDY/RlLBS3dgT5AwWIiim6Sn26CCHt+oR69tjk=;
 b=h4q5KYXzK52pMf5VB6x3HnYQH1hFhEnPBeFcaIxLSq6Wl/Wy7Z2/LtROnWfh6GhtGS
 /SYrEOn/NbpTX7xYfVjIHI/UiEVofPZVOHXB6Z5TXtwyrFqVnddTwzQfo25qAHLXc2sE
 vSeDz+S0pN+ImogIq6SLFZ7iI3on11nb5S+0Qe9dVCMOP1ZEHhkbkvSHLJN4DOenzpSj
 oN4w7EKU2YFkUicwvhWRHwSHYWmYIXv5BGS6h3/4tNjvykq9WE354IZR9NVQ6LcHuA7p
 kJ6t3GVdM8CceS9pBBiKn8BzjGnPaAY6mjLfSXIxt0wJw1FqFq+Smdh1Sl+KAVnK9ak0
 2Mbg==
X-Gm-Message-State: AOAM532z2RrEm9ZjdxVfaJQQAdgKVMz1iwGtWhUrCLwM5QiSlU9L9AJq
 JbfuLBGyIdfKpoNObpuoiumKdzLAu6o=
X-Google-Smtp-Source: ABdhPJwhHYNflZk74TDje1JUFLXpn0ipWHt439v307Cf6eQCsO/Pjj34D7D9GE7Px3U3bAbbcwFM4hcAPjI=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a25:ced0:: with SMTP id
 x199mr2493767ybe.448.1611270221473; 
 Thu, 21 Jan 2021 15:03:41 -0800 (PST)
Date: Thu, 21 Jan 2021 23:03:29 +0000
In-Reply-To: <20210121230336.1373726-1-satyat@google.com>
Message-Id: <20210121230336.1373726-2-satyat@google.com>
Mime-Version: 1.0
References: <20210121230336.1373726-1-satyat@google.com>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, "Darrick J . Wong" <darrick.wong@oracle.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.202 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.202 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1l2iza-00BrDm-AP
Subject: [f2fs-dev] [PATCH v8 1/8] block: blk-crypto-fallback: handle data
 unit split across multiple bvecs
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

Till now, the blk-crypto-fallback required each crypto data unit to be
contained within a single bvec. It also required the starting offset
of each bvec to be aligned to the data unit size. This patch removes
both restrictions, so that blk-crypto-fallback can handle crypto data
units split across multiple bvecs. blk-crypto-fallback now only requires
that the total size of the bio be aligned to the crypto data unit size.
The buffer that is being read/written to no longer needs to be data unit
size aligned.

This is useful for making the alignment requirements for direct I/O on
encrypted files similar to those for direct I/O on unencrypted files.

Co-developed-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
---
 block/blk-crypto-fallback.c | 203 +++++++++++++++++++++++++++---------
 1 file changed, 156 insertions(+), 47 deletions(-)

diff --git a/block/blk-crypto-fallback.c b/block/blk-crypto-fallback.c
index c162b754efbd..663579d0783f 100644
--- a/block/blk-crypto-fallback.c
+++ b/block/blk-crypto-fallback.c
@@ -249,6 +249,65 @@ static void blk_crypto_dun_to_iv(const u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE],
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
@@ -265,9 +324,12 @@ static bool blk_crypto_fallback_encrypt_bio(struct bio **bio_ptr)
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
 
@@ -279,11 +341,18 @@ static bool blk_crypto_fallback_encrypt_bio(struct bio **bio_ptr)
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
@@ -303,45 +372,58 @@ static bool blk_crypto_fallback_encrypt_bio(struct bio **bio_ptr)
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
+					i++;
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
@@ -362,7 +444,11 @@ static bool blk_crypto_fallback_encrypt_bio(struct bio **bio_ptr)
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
 
@@ -381,13 +467,21 @@ static void blk_crypto_fallback_decrypt_bio(struct work_struct *work)
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
@@ -405,33 +499,48 @@ static void blk_crypto_fallback_decrypt_bio(struct work_struct *work)
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
-- 
2.30.0.280.ga3ce27912f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
