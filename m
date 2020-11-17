Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8E42B6830
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Nov 2020 16:05:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+/3fzN/Rmp6LCjDyjLOMlqSHRPilvIEQ+vFrMW91LsU=; b=E58Z393vZSFuozOmiDKAtHbVm
	3p3bXOetUmwX7RJ5SWws4746l7a7kB06m5Afy9OJEcxCNg9SeBsUBtHU3xfEYHk7S+23lAIN4JqI3
	G0b8pnsn+fjvxIjDh+PoHEaCcSCNSjhNn3fjR70HovHr8m+l+RLTaCLBV413cSZ/piQhU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kf2Xv-0000qD-EF; Tue, 17 Nov 2020 15:05:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3EtmzXwYKAJcJ1KP1K7FF7C5.3FD@flex--satyat.bounces.google.com>)
 id 1kf2Xt-0000pl-QG
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 15:05:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TAjmsBc6qqfsA6JtVzH7iXxCcqn3Re43ZeihhwJWblk=; b=kG+mraTRaZRBQdcYYKdn41L40
 mb3liy1TUycyY6oDagafq465nfeXkJsUMinlALBOuLL5fcV0H9LHBwPxr9ABbkkwN4H/XW8LH83oR
 RiN+lGSMUlod+CfUSzTOKvsjDQrf/xnU8y5siOpBQXAfqRmU9XP/O9gJaVdu7buehUrEw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TAjmsBc6qqfsA6JtVzH7iXxCcqn3Re43ZeihhwJWblk=; b=DSinI/xMDAOygpMYo7GoPZDEzu
 VTxyRfr1Cu2Bqw11xDWn8uWvOt+H8+P08ibVlP82LEIGIuYxZwUsNqH9T9Ve0sQNQQnAdArVijel5
 MtcMTg3ScI4x92jK0hhy0haGJxn4sqIrpEThc3rS+MROF6ejASKMTT3ha660k+FK6G+c=;
Received: from mail-pl1-f201.google.com ([209.85.214.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kf2Xc-00AYNV-TZ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 15:05:25 +0000
Received: by mail-pl1-f201.google.com with SMTP id l3so11700466ply.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Nov 2020 07:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=TAjmsBc6qqfsA6JtVzH7iXxCcqn3Re43ZeihhwJWblk=;
 b=EMyEaxPRqKp6BJmvLRed7xNjmflfFIDpyGmyIGRvHgAeWoukL1WjrHvHe+O3b8rvLF
 8EI0zLB41F1sZawhV0uB603CdXjhro7CHUPP0rayhula8vN8WIdmPlSP60B1eecKULn5
 gTOQ9+9r5sq5GCsfD3ezd0jFpMuisFBf2mgC026o8DJmPV4x3edrmvcW+NXopyyf4nhT
 wBU/jWJT+2LhpPjmugxc0DLsv6/Dxj7PMbTbpFsa3ISpxIiBuqqwuXwNg2JTJr4GmTB8
 wopCcpBlc4k5j4S6DwLaJECovbaBQX0nBj85zqJi++0Rg8CIiknFMxqdKf/yhImhcATN
 s0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=TAjmsBc6qqfsA6JtVzH7iXxCcqn3Re43ZeihhwJWblk=;
 b=NW+uoTTjdeeXBjuhYO0L/FCpcApT4aI+1XqApoOrHUqduLtujpsE57KEt+Ca0VVVDi
 +k43IFZiwilAguSeLJbrYmPSOAJ8bSM5htoL/g5I4N3pfm2h6Ko7RhmXXBpjsg6PVVTp
 0FNMFlOtAzuEeNQPV4FN1oYJEGDh9yci29SEJx8RDv8sFnDg6cAUbaZVOrajoMRxNZch
 nZ79Vrpgg7uP1xuHVOFfwN38xzmvdqaZfjkAOK0qmjV2Hr1dOp8nmubkqbVuq3E8wGhC
 IbHWrsCHV3Zz5WUktWVkcwU9MAQ7uSixZNFoayl9GDCN5PfYp7WDSnGdCCa8EkwtGz5K
 LxeQ==
X-Gm-Message-State: AOAM5319PBU6rkwlKeC2Lf92RhOPvAlORpEErYxpMuoR068oIRly7ii0
 fXJQqk9mUqNmIEka4hkFf3CMEpV7CNM=
X-Google-Smtp-Source: ABdhPJyGAlbPfHrO4NdA530/bUyk6s6UcuhFEoGPXg9d+QKChA9y9f47sWaLpQrfr/X+MyYGDds7q+TuEqM=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:ad4:45eb:: with SMTP id
 q11mr21110656qvu.20.1605622034377; 
 Tue, 17 Nov 2020 06:07:14 -0800 (PST)
Date: Tue, 17 Nov 2020 14:07:01 +0000
In-Reply-To: <20201117140708.1068688-1-satyat@google.com>
Message-Id: <20201117140708.1068688-2-satyat@google.com>
Mime-Version: 1.0
References: <20201117140708.1068688-1-satyat@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, "Darrick J . Wong" <darrick.wong@oracle.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.201 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.201 listed in wl.mailspike.net]
 0.0 DKIM_ADSP_CUSTOM_MED   No valid author signature, adsp_override is
 CUSTOM_MED
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1kf2Xc-00AYNV-TZ
Subject: [f2fs-dev] [PATCH v7 1/8] block: ensure bios are not split in
 middle of crypto data unit
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
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Introduce blk_crypto_bio_sectors_alignment() that returns the required
alignment for the number of sectors in a bio. Any bio split must ensure
that the number of sectors in the resulting bios is aligned to that
returned value. This patch also updates __blk_queue_split(),
__blk_queue_bounce() and blk_crypto_split_bio_if_needed() to respect
blk_crypto_bio_sectors_alignment() when splitting bios.

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 block/bio.c                 |  1 +
 block/blk-crypto-fallback.c | 10 ++--
 block/blk-crypto-internal.h | 18 +++++++
 block/blk-merge.c           | 96 ++++++++++++++++++++++++++++++++-----
 block/blk-mq.c              |  3 ++
 block/bounce.c              |  4 ++
 6 files changed, 117 insertions(+), 15 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index fa01bef35bb1..259cef126df3 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -1472,6 +1472,7 @@ struct bio *bio_split(struct bio *bio, int sectors,
 
 	BUG_ON(sectors <= 0);
 	BUG_ON(sectors >= bio_sectors(bio));
+	WARN_ON(!IS_ALIGNED(sectors, blk_crypto_bio_sectors_alignment(bio)));
 
 	/* Zone append commands cannot be split */
 	if (WARN_ON_ONCE(bio_op(bio) == REQ_OP_ZONE_APPEND))
diff --git a/block/blk-crypto-fallback.c b/block/blk-crypto-fallback.c
index c162b754efbd..db2d2c67b308 100644
--- a/block/blk-crypto-fallback.c
+++ b/block/blk-crypto-fallback.c
@@ -209,20 +209,22 @@ static bool blk_crypto_alloc_cipher_req(struct blk_ksm_keyslot *slot,
 static bool blk_crypto_split_bio_if_needed(struct bio **bio_ptr)
 {
 	struct bio *bio = *bio_ptr;
+	struct bio_crypt_ctx *bc = bio->bi_crypt_context;
 	unsigned int i = 0;
-	unsigned int num_sectors = 0;
+	unsigned int len = 0;
 	struct bio_vec bv;
 	struct bvec_iter iter;
 
 	bio_for_each_segment(bv, bio, iter) {
-		num_sectors += bv.bv_len >> SECTOR_SHIFT;
+		len += bv.bv_len;
 		if (++i == BIO_MAX_PAGES)
 			break;
 	}
-	if (num_sectors < bio_sectors(bio)) {
+	if (len < bio->bi_iter.bi_size) {
 		struct bio *split_bio;
 
-		split_bio = bio_split(bio, num_sectors, GFP_NOIO, NULL);
+		len = round_down(len, bc->bc_key->crypto_cfg.data_unit_size);
+		split_bio = bio_split(bio, len >> SECTOR_SHIFT, GFP_NOIO, NULL);
 		if (!split_bio) {
 			bio->bi_status = BLK_STS_RESOURCE;
 			return false;
diff --git a/block/blk-crypto-internal.h b/block/blk-crypto-internal.h
index 0d36aae538d7..304e90ed99f5 100644
--- a/block/blk-crypto-internal.h
+++ b/block/blk-crypto-internal.h
@@ -60,6 +60,19 @@ static inline bool blk_crypto_rq_is_encrypted(struct request *rq)
 	return rq->crypt_ctx;
 }
 
+/*
+ * Returns the alignment requirement for the number of sectors in this bio based
+ * on its bi_crypt_context. Any bios split from this bio must follow this
+ * alignment requirement as well.
+ */
+static inline unsigned int blk_crypto_bio_sectors_alignment(struct bio *bio)
+{
+	if (!bio_has_crypt_ctx(bio))
+		return 1;
+	return bio->bi_crypt_context->bc_key->crypto_cfg.data_unit_size >>
+								SECTOR_SHIFT;
+}
+
 #else /* CONFIG_BLK_INLINE_ENCRYPTION */
 
 static inline bool bio_crypt_rq_ctx_compatible(struct request *rq,
@@ -93,6 +106,11 @@ static inline bool blk_crypto_rq_is_encrypted(struct request *rq)
 	return false;
 }
 
+static inline unsigned int blk_crypto_bio_sectors_alignment(struct bio *bio)
+{
+	return 1;
+}
+
 #endif /* CONFIG_BLK_INLINE_ENCRYPTION */
 
 void __bio_crypt_advance(struct bio *bio, unsigned int bytes);
diff --git a/block/blk-merge.c b/block/blk-merge.c
index bcf5e4580603..f34dda7132f9 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -149,13 +149,15 @@ static inline unsigned get_max_io_size(struct request_queue *q,
 	unsigned pbs = queue_physical_block_size(q) >> SECTOR_SHIFT;
 	unsigned lbs = queue_logical_block_size(q) >> SECTOR_SHIFT;
 	unsigned start_offset = bio->bi_iter.bi_sector & (pbs - 1);
+	unsigned int bio_sectors_alignment =
+					blk_crypto_bio_sectors_alignment(bio);
 
 	max_sectors += start_offset;
 	max_sectors &= ~(pbs - 1);
-	if (max_sectors > start_offset)
-		return max_sectors - start_offset;
+	if (max_sectors - start_offset >= bio_sectors_alignment)
+		return round_down(max_sectors - start_offset, bio_sectors_alignment);
 
-	return sectors & ~(lbs - 1);
+	return round_down(sectors & ~(lbs - 1), bio_sectors_alignment);
 }
 
 static inline unsigned get_max_segment_size(const struct request_queue *q,
@@ -174,6 +176,41 @@ static inline unsigned get_max_segment_size(const struct request_queue *q,
 			(unsigned long)queue_max_segment_size(q));
 }
 
+/**
+ * update_aligned_sectors_and_segs() - Ensures that *@aligned_sectors is aligned
+ *				       to @bio_sectors_alignment, and that
+ *				       *@aligned_segs is the value of nsegs
+ *				       when sectors reached/first exceeded that
+ *				       value of *@aligned_sectors.
+ *
+ * @nsegs: [in] The current number of segs
+ * @sectors: [in] The current number of sectors
+ * @aligned_segs: [in,out] The number of segments that make up @aligned_sectors
+ * @aligned_sectors: [in,out] The largest number of sectors <= @sectors that is
+ *		     aligned to @sectors
+ * @bio_sectors_alignment: [in] The alignment requirement for the number of
+ *			  sectors
+ *
+ * Updates *@aligned_sectors to the largest number <= @sectors that is also a
+ * multiple of @bio_sectors_alignment. This is done by updating *@aligned_sectors
+ * whenever @sectors is at least @bio_sectors_alignment more than
+ * *@aligned_sectors, since that means we can increment *@aligned_sectors while
+ * still keeping it aligned to @bio_sectors_alignment and also keeping it <=
+ * @sectors. *@aligned_segs is updated to the value of nsegs when @sectors first
+ * reaches/exceeds any value that causes *@aligned_sectors to be updated.
+ */
+static inline void update_aligned_sectors_and_segs(const unsigned int nsegs,
+						   const unsigned int sectors,
+						   unsigned int *aligned_segs,
+				unsigned int *aligned_sectors,
+				const unsigned int bio_sectors_alignment)
+{
+	if (sectors - *aligned_sectors < bio_sectors_alignment)
+		return;
+	*aligned_sectors = round_down(sectors, bio_sectors_alignment);
+	*aligned_segs = nsegs;
+}
+
 /**
  * bvec_split_segs - verify whether or not a bvec should be split in the middle
  * @q:        [in] request queue associated with the bio associated with @bv
@@ -195,9 +232,12 @@ static inline unsigned get_max_segment_size(const struct request_queue *q,
  * the block driver.
  */
 static bool bvec_split_segs(const struct request_queue *q,
-			    const struct bio_vec *bv, unsigned *nsegs,
-			    unsigned *sectors, unsigned max_segs,
-			    unsigned max_sectors)
+			    const struct bio_vec *bv, unsigned int *nsegs,
+			    unsigned int *sectors, unsigned int *aligned_segs,
+			    unsigned int *aligned_sectors,
+			    unsigned int bio_sectors_alignment,
+			    unsigned int max_segs,
+			    unsigned int max_sectors)
 {
 	unsigned max_len = (min(max_sectors, UINT_MAX >> 9) - *sectors) << 9;
 	unsigned len = min(bv->bv_len, max_len);
@@ -211,6 +251,11 @@ static bool bvec_split_segs(const struct request_queue *q,
 
 		(*nsegs)++;
 		total_len += seg_size;
+		update_aligned_sectors_and_segs(*nsegs,
+						*sectors + (total_len >> 9),
+						aligned_segs,
+						aligned_sectors,
+						bio_sectors_alignment);
 		len -= seg_size;
 
 		if ((bv->bv_offset + total_len) & queue_virt_boundary(q))
@@ -235,6 +280,8 @@ static bool bvec_split_segs(const struct request_queue *q,
  * following is guaranteed for the cloned bio:
  * - That it has at most get_max_io_size(@q, @bio) sectors.
  * - That it has at most queue_max_segments(@q) segments.
+ * - That the number of sectors in the returned bio is aligned to
+ *   blk_crypto_bio_sectors_alignment(@bio)
  *
  * Except for discard requests the cloned bio will point at the bi_io_vec of
  * the original bio. It is the responsibility of the caller to ensure that the
@@ -252,6 +299,9 @@ static struct bio *blk_bio_segment_split(struct request_queue *q,
 	unsigned nsegs = 0, sectors = 0;
 	const unsigned max_sectors = get_max_io_size(q, bio);
 	const unsigned max_segs = queue_max_segments(q);
+	const unsigned int bio_sectors_alignment =
+					blk_crypto_bio_sectors_alignment(bio);
+	unsigned int aligned_segs = 0, aligned_sectors = 0;
 
 	bio_for_each_bvec(bv, bio, iter) {
 		/*
@@ -266,8 +316,14 @@ static struct bio *blk_bio_segment_split(struct request_queue *q,
 		    bv.bv_offset + bv.bv_len <= PAGE_SIZE) {
 			nsegs++;
 			sectors += bv.bv_len >> 9;
-		} else if (bvec_split_segs(q, &bv, &nsegs, &sectors, max_segs,
-					 max_sectors)) {
+			update_aligned_sectors_and_segs(nsegs, sectors,
+							&aligned_segs,
+							&aligned_sectors,
+							bio_sectors_alignment);
+		} else if (bvec_split_segs(q, &bv, &nsegs, &sectors,
+					   &aligned_segs, &aligned_sectors,
+					   bio_sectors_alignment, max_segs,
+					   max_sectors)) {
 			goto split;
 		}
 
@@ -275,11 +331,24 @@ static struct bio *blk_bio_segment_split(struct request_queue *q,
 		bvprvp = &bvprv;
 	}
 
+	/*
+	 * The input bio's number of sectors is assumed to be aligned to
+	 * bio_sectors_alignment. If that's the case, then this function should
+	 * ensure that aligned_segs == nsegs and aligned_sectors == sectors if
+	 * the bio is not going to be split.
+	 */
+	WARN_ON(aligned_segs != nsegs || aligned_sectors != sectors);
 	*segs = nsegs;
 	return NULL;
 split:
-	*segs = nsegs;
-	return bio_split(bio, sectors, GFP_NOIO, bs);
+	*segs = aligned_segs;
+	if (WARN_ON(aligned_sectors == 0))
+		goto err;
+	return bio_split(bio, aligned_sectors, GFP_NOIO, bs);
+err:
+	bio->bi_status = BLK_STS_IOERR;
+	bio_endio(bio);
+	return bio;
 }
 
 /**
@@ -366,6 +435,9 @@ unsigned int blk_recalc_rq_segments(struct request *rq)
 {
 	unsigned int nr_phys_segs = 0;
 	unsigned int nr_sectors = 0;
+	unsigned int nr_aligned_phys_segs = 0;
+	unsigned int nr_aligned_sectors = 0;
+	unsigned int bio_sectors_alignment;
 	struct req_iterator iter;
 	struct bio_vec bv;
 
@@ -381,9 +453,11 @@ unsigned int blk_recalc_rq_segments(struct request *rq)
 		return 1;
 	}
 
+	bio_sectors_alignment = blk_crypto_bio_sectors_alignment(rq->bio);
 	rq_for_each_bvec(bv, rq, iter)
 		bvec_split_segs(rq->q, &bv, &nr_phys_segs, &nr_sectors,
-				UINT_MAX, UINT_MAX);
+				&nr_aligned_phys_segs, &nr_aligned_sectors,
+				bio_sectors_alignment, UINT_MAX, UINT_MAX);
 	return nr_phys_segs;
 }
 
diff --git a/block/blk-mq.c b/block/blk-mq.c
index 55bcee5dc032..de5c97ab8e5a 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -2161,6 +2161,9 @@ blk_qc_t blk_mq_submit_bio(struct bio *bio)
 	blk_queue_bounce(q, &bio);
 	__blk_queue_split(&bio, &nr_segs);
 
+	if (bio->bi_status != BLK_STS_OK)
+		goto queue_exit;
+
 	if (!bio_integrity_prep(bio))
 		goto queue_exit;
 
diff --git a/block/bounce.c b/block/bounce.c
index 162a6eee8999..b15224799008 100644
--- a/block/bounce.c
+++ b/block/bounce.c
@@ -295,6 +295,7 @@ static void __blk_queue_bounce(struct request_queue *q, struct bio **bio_orig,
 	bool bounce = false;
 	int sectors = 0;
 	bool passthrough = bio_is_passthrough(*bio_orig);
+	unsigned int bio_sectors_alignment;
 
 	bio_for_each_segment(from, *bio_orig, iter) {
 		if (i++ < BIO_MAX_PAGES)
@@ -305,6 +306,9 @@ static void __blk_queue_bounce(struct request_queue *q, struct bio **bio_orig,
 	if (!bounce)
 		return;
 
+	bio_sectors_alignment = blk_crypto_bio_sectors_alignment(bio);
+	sectors = round_down(sectors, bio_sectors_alignment);
+
 	if (!passthrough && sectors < bio_sectors(*bio_orig)) {
 		bio = bio_split(*bio_orig, sectors, GFP_NOIO, &bounce_bio_split);
 		bio_chain(bio, *bio_orig);
-- 
2.29.2.299.gdc1121823c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
