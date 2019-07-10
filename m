Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4512564EE9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jul 2019 00:56:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YIws/CKQpEG2tNjlhQNBlpLb8twCfFzD8btYgd7ZanA=; b=ZrYOBofICV/gluDwtRYG1Cx6v
	XZ164OtojlIDPFzmqBt2OwpHlwy0vR0AvPb0MsrudU6fRuwFFuIQbUyIcA6BzMdxbVOClJw66Obim
	iZA/AijiV5cUWftrzxNeMdCthb0A2dDJsvg83E7jwie0Rd4i101t/i4HylrQJpqS/J5xQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hlLVo-0003r5-0u; Wed, 10 Jul 2019 22:56:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3Fm0mXQYKAHkpXqvXqdlldib.Zlj@flex--satyat.bounces.google.com>)
 id 1hlLVm-0003qq-G4
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Jul 2019 22:56:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qYSGFpNSJhKp475kALq7yHbfHYEidLwstNNnaj8Vm00=; b=EZR38te25LfDFsfWIJoXlJ86N
 hS8echk4HmrXk1mUduZHjubWhEMo772Sj0HJfKyFQzhHu65yaTDMbXl0Y7T7Xu2f/wJbNDwAIAaRw
 A6HDN6ildANQj6gDOm8hZtTI5kNPhlx1sB5AvFhuPz8xCnq14WP9sty2qzpuuBUPIKdV8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qYSGFpNSJhKp475kALq7yHbfHYEidLwstNNnaj8Vm00=; b=MqRV2Kp9ulrlAzEfGkWNpN10BO
 zLGxUNyBNc5mMh5GMz4+ZWi5rwdHE/xLcIM58bHzGiY5QgvVoYu4se8xb8EhJkTMv0TX6tQxQpy77
 Zh3NbQeGeQSeN6O+gOGJLr/CXcnDy+NWWj3iaNvyO8+94/M3J4VbGpSVDMk8KOI+Apm8=;
Received: from mail-pg1-f201.google.com ([209.85.215.201])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hlLVk-00F2no-R5
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Jul 2019 22:56:30 +0000
Received: by mail-pg1-f201.google.com with SMTP id s5so2342269pgr.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 10 Jul 2019 15:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=qYSGFpNSJhKp475kALq7yHbfHYEidLwstNNnaj8Vm00=;
 b=RY/JUR/ovXiATuQN2sVPwNsg051cPJ7ctqq5roz2j1YrORWyyYyh7VXZHvAFRN4sca
 u2DAZJTutaHsquEXT/dVxvhoxlSPahqbPqdSQvBhnK2KhRqJEHxshRQNwk7pgReItd0h
 48SWHQqIU7n352dqZ3p8PeCLRWCckoNro6fsul/u+am65SAIfQF1PLpaR1QtBnKkJq1D
 jtZl4zSLX9XvMr4mKoMPPw8fm++UQDraMJ8jSmbPkOSpCBG+HQANE3TF9+WaCBR4w9kO
 r3gFJ8t1iZ4lPV3rGgBQJBBImh8nzIkAv/7wmXSE/HodxjLspHJD4rTY8Xkz8t7+jK3d
 YeFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=qYSGFpNSJhKp475kALq7yHbfHYEidLwstNNnaj8Vm00=;
 b=d5SM2Q2o+WwkS3Ldkdi19yu+AMQUSX5zSO/XyHqkevRFpPONBFp7cgD3SmAzcdA6/K
 eQlBXY8MaSDQvN9lbkCJUz3nCG2zmPrwa8NpX+2CsH21zwQ7//KxkI5c+qhQMI/4y/S6
 O/R7KkVmvRWf9ROMluX41j4o/2YwUWB5JByPiKb1j3E2RaqnaGeNjj1GoTuhIuFblBNx
 aVYILZtEqag+ejJPL2T+1WbwrS0lIAY/wR0J1O8NL20sdqrNaLbdN7xa/58y4B+JQ5bm
 n13f/ckyqRmK127wX9hEHuMfcM0ClAYCS2U47o/XDboiHInHZ5eCXEbRZZGRpmKaj07a
 04+Q==
X-Gm-Message-State: APjAAAU6FvqAOB84IVhsqPZUC6qASmAtEFW3wFWwI37z8WbstnMVplZt
 Vro9NqTMmhoW5i6kFSSXN4D1UUrWE+w=
X-Google-Smtp-Source: APXvYqxdChk3ZixHz0ohSloSlvQAKjRO7ndDr9TxN3nyYAaGpw3TM2FhIEV4VCiLwBqz1MvJ/ETjGVbw4OY=
X-Received: by 2002:a63:db47:: with SMTP id x7mr720621pgi.375.1562799382881;
 Wed, 10 Jul 2019 15:56:22 -0700 (PDT)
Date: Wed, 10 Jul 2019 15:56:03 -0700
In-Reply-To: <20190710225609.192252-1-satyat@google.com>
Message-Id: <20190710225609.192252-3-satyat@google.com>
Mime-Version: 1.0
References: <20190710225609.192252-1-satyat@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -6.3 (------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.201 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.3 PDS_NO_HELO_DNS        High profile HELO but no A record
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1hlLVk-00F2no-R5
Subject: [f2fs-dev] [PATCH 2/8] block: Add encryption context to struct bio
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
Cc: Ladvine D Almeida <ladvine.dalmeida@synopsys.com>,
 Parshuram Raju Thombare <pthombar@cadence.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>, Satya Tangirala <satyat@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We must have some way of letting a storage device driver know what
encryption context it should use for en/decrypting a request. However,
it's the filesystem/fscrypt that knows about and manages encryption
contexts. As such, when the filesystem layer submits a bio to the block
layer, and this bio eventually reaches a device driver with support for
inline encryption, the device driver will need to have been told the
encryption context for that bio.

We want to communicate the encryption context from the filesystem layer
to the storage device along with the bio, when the bio is submitted to the
block layer. To do this, we add a struct bio_crypt_ctx to struct bio, which
can represent an encryption context (note that we can't use the bi_private
field in struct bio to do this because that field does not function to pass
information across layers in the storage stack). We also introduce various
functions to manipulate the bio_crypt_ctx and make the bio/request merging
logic aware of the bio_crypt_ctx.

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 block/Makefile            |   2 +-
 block/bio-crypt-ctx.c     | 117 +++++++++++++++++++++++
 block/bio.c               |  11 ++-
 block/blk-merge.c         |  34 ++++++-
 block/bounce.c            |   9 +-
 drivers/md/dm.c           |  15 ++-
 include/linux/bio.h       | 190 ++++++++++++++++++++++++++++++++++++++
 include/linux/blk_types.h |   7 ++
 8 files changed, 371 insertions(+), 14 deletions(-)
 create mode 100644 block/bio-crypt-ctx.c

diff --git a/block/Makefile b/block/Makefile
index a72abd61b220..4147ffa63631 100644
--- a/block/Makefile
+++ b/block/Makefile
@@ -35,4 +35,4 @@ obj-$(CONFIG_BLK_DEBUG_FS)	+= blk-mq-debugfs.o
 obj-$(CONFIG_BLK_DEBUG_FS_ZONED)+= blk-mq-debugfs-zoned.o
 obj-$(CONFIG_BLK_SED_OPAL)	+= sed-opal.o
 obj-$(CONFIG_BLK_PM)		+= blk-pm.o
-obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= keyslot-manager.o
+obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= keyslot-manager.o bio-crypt-ctx.o
diff --git a/block/bio-crypt-ctx.c b/block/bio-crypt-ctx.c
new file mode 100644
index 000000000000..8b884ef32007
--- /dev/null
+++ b/block/bio-crypt-ctx.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2019 Google LLC
+ */
+
+#include <linux/bio.h>
+#include <linux/blkdev.h>
+#include <linux/slab.h>
+#include <linux/keyslot-manager.h>
+
+struct bio_crypt_ctx *bio_crypt_alloc_ctx(gfp_t gfp_mask)
+{
+	return kzalloc(sizeof(struct bio_crypt_ctx), gfp_mask);
+}
+EXPORT_SYMBOL(bio_crypt_alloc_ctx);
+
+void bio_crypt_free_ctx(struct bio *bio)
+{
+	kzfree(bio->bi_crypt_context);
+	bio->bi_crypt_context = NULL;
+}
+EXPORT_SYMBOL(bio_crypt_free_ctx);
+
+int bio_crypt_clone(struct bio *dst, struct bio *src, gfp_t gfp_mask)
+{
+	if (!bio_is_encrypted(src))
+		return 0;
+
+	dst->bi_crypt_context = bio_crypt_alloc_ctx(gfp_mask);
+	if (!dst->bi_crypt_context)
+		return -ENOMEM;
+
+	*dst->bi_crypt_context = *src->bi_crypt_context;
+
+	if (bio_crypt_has_keyslot(src))
+		keyslot_manager_get_slot(src->bi_crypt_context->processing_ksm,
+					 src->bi_crypt_context->keyslot);
+
+	return 0;
+}
+EXPORT_SYMBOL(bio_crypt_clone);
+
+bool bio_crypt_should_process(struct bio *bio, struct request_queue *q)
+{
+	if (!bio_is_encrypted(bio))
+		return false;
+
+	WARN_ON(!bio_crypt_has_keyslot(bio));
+	return q->ksm == bio->bi_crypt_context->processing_ksm;
+}
+EXPORT_SYMBOL(bio_crypt_should_process);
+
+/*
+ * Checks that two bio crypt contexts are compatible - i.e. that
+ * they are mergeable except for data_unit_num continuity.
+ */
+bool bio_crypt_ctx_compatible(struct bio *b_1, struct bio *b_2)
+{
+	struct bio_crypt_ctx *bc1 = b_1->bi_crypt_context;
+	struct bio_crypt_ctx *bc2 = b_2->bi_crypt_context;
+
+	if (bio_is_encrypted(b_1) != bio_is_encrypted(b_2))
+		return false;
+
+	if (!bio_is_encrypted(b_1))
+		return true;
+
+	return bc1->keyslot == bc2->keyslot &&
+	       bc1->data_unit_size_bits == bc2->data_unit_size_bits;
+}
+
+/*
+ * Checks that two bio crypt contexts are compatible, and also
+ * that their data_unit_nums are continuous (and can hence be merged)
+ */
+bool bio_crypt_ctx_back_mergeable(struct bio *b_1,
+				  unsigned int b1_sectors,
+				  struct bio *b_2)
+{
+	struct bio_crypt_ctx *bc1 = b_1->bi_crypt_context;
+	struct bio_crypt_ctx *bc2 = b_2->bi_crypt_context;
+
+	if (!bio_crypt_ctx_compatible(b_1, b_2))
+		return false;
+
+	return !bio_is_encrypted(b_1) ||
+		(bc1->data_unit_num +
+		(b1_sectors >> (bc1->data_unit_size_bits - 9)) ==
+		bc2->data_unit_num);
+}
+
+void bio_crypt_ctx_release_keyslot(struct bio *bio)
+{
+	struct bio_crypt_ctx *crypt_ctx = bio->bi_crypt_context;
+
+	keyslot_manager_put_slot(crypt_ctx->processing_ksm, crypt_ctx->keyslot);
+	bio->bi_crypt_context->processing_ksm = NULL;
+	bio->bi_crypt_context->keyslot = -1;
+}
+
+int bio_crypt_ctx_acquire_keyslot(struct bio *bio, struct keyslot_manager *ksm)
+{
+	int slot;
+	enum blk_crypt_mode_num crypt_mode = bio_crypt_mode(bio);
+
+	if (!ksm)
+		return -ENOMEM;
+
+	slot = keyslot_manager_get_slot_for_key(ksm,
+			bio_crypt_raw_key(bio), crypt_mode,
+			1 << bio->bi_crypt_context->data_unit_size_bits);
+	if (slot < 0)
+		return slot;
+
+	bio_crypt_set_keyslot(bio, slot, ksm);
+	return 0;
+}
diff --git a/block/bio.c b/block/bio.c
index ce797d73bb43..2a272cda6dfa 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -240,6 +240,7 @@ static void bio_free(struct bio *bio)
 	struct bio_set *bs = bio->bi_pool;
 	void *p;
 
+	bio_crypt_free_ctx(bio);
 	bio_uninit(bio);
 
 	if (bs) {
@@ -612,6 +613,7 @@ EXPORT_SYMBOL(__bio_clone_fast);
 struct bio *bio_clone_fast(struct bio *bio, gfp_t gfp_mask, struct bio_set *bs)
 {
 	struct bio *b;
+	int ret;
 
 	b = bio_alloc_bioset(gfp_mask, 0, bs);
 	if (!b)
@@ -619,9 +621,13 @@ struct bio *bio_clone_fast(struct bio *bio, gfp_t gfp_mask, struct bio_set *bs)
 
 	__bio_clone_fast(b, bio);
 
-	if (bio_integrity(bio)) {
-		int ret;
+	ret = bio_crypt_clone(b, bio, gfp_mask);
+	if (ret < 0) {
+		bio_put(b);
+		return NULL;
+	}
 
+	if (bio_integrity(bio)) {
 		ret = bio_integrity_clone(b, bio, gfp_mask);
 
 		if (ret < 0) {
@@ -1022,6 +1028,7 @@ void bio_advance(struct bio *bio, unsigned bytes)
 	if (bio_integrity(bio))
 		bio_integrity_advance(bio, bytes);
 
+	bio_crypt_advance(bio, bytes);
 	bio_advance_iter(bio, &bio->bi_iter, bytes);
 }
 EXPORT_SYMBOL(bio_advance);
diff --git a/block/blk-merge.c b/block/blk-merge.c
index 17713d7d98d5..f416e7f38270 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -531,6 +531,9 @@ static inline int ll_new_hw_segment(struct request_queue *q,
 	if (blk_integrity_merge_bio(q, req, bio) == false)
 		goto no_merge;
 
+	if (WARN_ON(!bio_crypt_ctx_compatible(bio, req->bio)))
+		goto no_merge;
+
 	/*
 	 * This will form the start of a new hw segment.  Bump both
 	 * counters.
@@ -696,8 +699,13 @@ static enum elv_merge blk_try_req_merge(struct request *req,
 {
 	if (blk_discard_mergable(req))
 		return ELEVATOR_DISCARD_MERGE;
-	else if (blk_rq_pos(req) + blk_rq_sectors(req) == blk_rq_pos(next))
+	else if (blk_rq_pos(req) + blk_rq_sectors(req) == blk_rq_pos(next)) {
+		if (!bio_crypt_ctx_back_mergeable(
+			req->bio, blk_rq_sectors(req), next->bio)) {
+			return ELEVATOR_NO_MERGE;
+		}
 		return ELEVATOR_BACK_MERGE;
+	}
 
 	return ELEVATOR_NO_MERGE;
 }
@@ -733,6 +741,9 @@ static struct request *attempt_merge(struct request_queue *q,
 	if (req->ioprio != next->ioprio)
 		return NULL;
 
+	if (!bio_crypt_ctx_compatible(req->bio, next->bio))
+		return NULL;
+
 	/*
 	 * If we are allowed to merge, then append bio list
 	 * from next to rq and release next. merge_requests_fn
@@ -865,16 +876,31 @@ bool blk_rq_merge_ok(struct request *rq, struct bio *bio)
 	if (rq->ioprio != bio_prio(bio))
 		return false;
 
+	/* Only merge if the crypt contexts are compatible */
+	if (!bio_crypt_ctx_compatible(bio, rq->bio))
+		return false;
+
 	return true;
 }
 
 enum elv_merge blk_try_merge(struct request *rq, struct bio *bio)
 {
-	if (blk_discard_mergable(rq))
+	if (blk_discard_mergable(rq)) {
 		return ELEVATOR_DISCARD_MERGE;
-	else if (blk_rq_pos(rq) + blk_rq_sectors(rq) == bio->bi_iter.bi_sector)
+	} else if (blk_rq_pos(rq) + blk_rq_sectors(rq) ==
+		   bio->bi_iter.bi_sector) {
+		if (!bio_crypt_ctx_back_mergeable(rq->bio,
+						  blk_rq_sectors(rq), bio)) {
+			return ELEVATOR_NO_MERGE;
+		}
 		return ELEVATOR_BACK_MERGE;
-	else if (blk_rq_pos(rq) - bio_sectors(bio) == bio->bi_iter.bi_sector)
+	} else if (blk_rq_pos(rq) - bio_sectors(bio) ==
+		   bio->bi_iter.bi_sector) {
+		if (!bio_crypt_ctx_back_mergeable(bio,
+						  bio_sectors(bio), rq->bio)) {
+			return ELEVATOR_NO_MERGE;
+		}
 		return ELEVATOR_FRONT_MERGE;
+	}
 	return ELEVATOR_NO_MERGE;
 }
diff --git a/block/bounce.c b/block/bounce.c
index f8ed677a1bf7..1307238d3951 100644
--- a/block/bounce.c
+++ b/block/bounce.c
@@ -220,6 +220,7 @@ static struct bio *bounce_clone_bio(struct bio *bio_src, gfp_t gfp_mask,
 	struct bvec_iter iter;
 	struct bio_vec bv;
 	struct bio *bio;
+	int ret;
 
 	/*
 	 * Pre immutable biovecs, __bio_clone() used to just do a memcpy from
@@ -267,9 +268,13 @@ static struct bio *bounce_clone_bio(struct bio *bio_src, gfp_t gfp_mask,
 		break;
 	}
 
-	if (bio_integrity(bio_src)) {
-		int ret;
+	ret = bio_crypt_clone(bio, bio_src, gfp_mask);
+	if (ret < 0) {
+		bio_put(bio);
+		return NULL;
+	}
 
+	if (bio_integrity(bio_src)) {
 		ret = bio_integrity_clone(bio, bio_src, gfp_mask);
 		if (ret < 0) {
 			bio_put(bio);
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 5475081dcbd6..22517d03aa39 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1324,12 +1324,15 @@ static int clone_bio(struct dm_target_io *tio, struct bio *bio,
 		     sector_t sector, unsigned len)
 {
 	struct bio *clone = &tio->clone;
+	int ret;
 
 	__bio_clone_fast(clone, bio);
 
-	if (bio_integrity(bio)) {
-		int r;
+	ret = bio_crypt_clone(clone, bio, GFP_NOIO);
+	if (ret < 0)
+		return ret;
 
+	if (bio_integrity(bio)) {
 		if (unlikely(!dm_target_has_integrity(tio->ti->type) &&
 			     !dm_target_passes_integrity(tio->ti->type))) {
 			DMWARN("%s: the target %s doesn't support integrity data.",
@@ -1338,9 +1341,11 @@ static int clone_bio(struct dm_target_io *tio, struct bio *bio,
 			return -EIO;
 		}
 
-		r = bio_integrity_clone(clone, bio, GFP_NOIO);
-		if (r < 0)
-			return r;
+		ret = bio_integrity_clone(clone, bio, GFP_NOIO);
+		if (ret < 0) {
+			bio_crypt_free_ctx(clone);
+			return ret;
+		}
 	}
 
 	bio_advance(clone, to_bytes(sector - clone->bi_iter.bi_sector));
diff --git a/include/linux/bio.h b/include/linux/bio.h
index ef9c6e2e92bc..4e664d6441d5 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -572,6 +572,196 @@ enum blk_crypt_mode_num {
 	 */
 };
 
+#ifdef CONFIG_BLK_INLINE_ENCRYPTION
+struct bio_crypt_ctx {
+	int keyslot;
+	u8 *raw_key;
+	enum blk_crypt_mode_num crypt_mode;
+	u64 data_unit_num;
+	unsigned int data_unit_size_bits;
+
+	/*
+	 * The keyslot manager where the key has been programmed
+	 * with keyslot.
+	 */
+	struct keyslot_manager *processing_ksm;
+
+	/*
+	 * Copy of the bvec_iter when this bio was submitted.
+	 * We only want to en/decrypt the part of the bio
+	 * as described by the bvec_iter upon submission because
+	 * bio might be split before being resubmitted
+	 */
+	struct bvec_iter crypt_iter;
+	u64 sw_data_unit_num;
+};
+
+extern int bio_crypt_clone(struct bio *dst, struct bio *src,
+			   gfp_t gfp_mask);
+
+static inline bool bio_is_encrypted(struct bio *bio)
+{
+	return bio->bi_crypt_context;
+}
+
+static inline void bio_crypt_advance(struct bio *bio, unsigned int bytes)
+{
+	if (bio_is_encrypted(bio)) {
+		bio->bi_crypt_context->data_unit_num +=
+			bytes >> bio->bi_crypt_context->data_unit_size_bits;
+	}
+}
+
+static inline bool bio_crypt_has_keyslot(struct bio *bio)
+{
+	return bio->bi_crypt_context->keyslot >= 0;
+}
+
+extern struct bio_crypt_ctx *bio_crypt_alloc_ctx(gfp_t gfp_mask);
+
+extern void bio_crypt_free_ctx(struct bio *bio);
+
+static inline int bio_crypt_set_ctx(struct bio *bio,
+				    u8 *raw_key,
+				    enum blk_crypt_mode_num crypt_mode,
+				    u64 dun,
+				    unsigned int dun_bits)
+{
+	struct bio_crypt_ctx *crypt_ctx;
+
+	crypt_ctx = bio_crypt_alloc_ctx(GFP_NOIO);
+	if (!crypt_ctx)
+		return -ENOMEM;
+
+	crypt_ctx->raw_key = raw_key;
+	crypt_ctx->data_unit_num = dun;
+	crypt_ctx->data_unit_size_bits = dun_bits;
+	crypt_ctx->crypt_mode = crypt_mode;
+	crypt_ctx->processing_ksm = NULL;
+	crypt_ctx->keyslot = -1;
+	bio->bi_crypt_context = crypt_ctx;
+
+	return 0;
+}
+
+static inline int bio_crypt_get_keyslot(struct bio *bio)
+{
+	return bio->bi_crypt_context->keyslot;
+}
+
+static inline void bio_crypt_set_keyslot(struct bio *bio,
+					 unsigned int keyslot,
+					 struct keyslot_manager *ksm)
+{
+	bio->bi_crypt_context->keyslot = keyslot;
+	bio->bi_crypt_context->processing_ksm = ksm;
+}
+
+extern void bio_crypt_ctx_release_keyslot(struct bio *bio);
+
+extern int bio_crypt_ctx_acquire_keyslot(struct bio *bio,
+					 struct keyslot_manager *ksm);
+
+static inline u8 *bio_crypt_raw_key(struct bio *bio)
+{
+	return bio->bi_crypt_context->raw_key;
+}
+
+static inline enum blk_crypt_mode_num bio_crypt_mode(struct bio *bio)
+{
+	return bio->bi_crypt_context->crypt_mode;
+}
+
+static inline u64 bio_crypt_data_unit_num(struct bio *bio)
+{
+	WARN_ON(!bio_is_encrypted(bio));
+	return bio->bi_crypt_context->data_unit_num;
+}
+
+static inline u64 bio_crypt_sw_data_unit_num(struct bio *bio)
+{
+	WARN_ON(!bio_is_encrypted(bio));
+	return bio->bi_crypt_context->sw_data_unit_num;
+}
+
+extern bool bio_crypt_should_process(struct bio *bio, struct request_queue *q);
+
+extern bool bio_crypt_ctx_compatible(struct bio *b_1, struct bio *b_2);
+
+extern bool bio_crypt_ctx_back_mergeable(struct bio *b_1,
+					 unsigned int b1_sectors,
+					 struct bio *b_2);
+
+#else /* CONFIG_BLK_INLINE_ENCRYPTION */
+struct keyslot_manager;
+
+static inline int bio_crypt_clone(struct bio *dst, struct bio *src,
+				  gfp_t gfp_mask)
+{
+	return 0;
+}
+
+static inline void bio_crypt_advance(struct bio *bio,
+				     unsigned int bytes) { }
+
+static inline bool bio_is_encrypted(struct bio *bio)
+{
+	return false;
+}
+
+static inline void bio_crypt_free_ctx(struct bio *bio) { }
+
+static inline void bio_crypt_set_ctx(struct bio *bio,
+				     u8 *raw_key,
+				     enum blk_crypt_mode_num crypt_mode,
+				     u64 dun,
+				     unsigned int dun_bits) { }
+
+static inline bool bio_crypt_has_keyslot(struct bio *bio)
+{
+	return false;
+}
+
+static inline void bio_crypt_set_keyslot(struct bio *bio,
+					 unsigned int keyslot,
+					 struct keyslot_manager *ksm) { }
+
+static inline int bio_crypt_get_keyslot(struct bio *bio)
+{
+	return -1;
+}
+
+static inline u8 *bio_crypt_raw_key(struct bio *bio)
+{
+	return NULL;
+}
+
+static inline u64 bio_crypt_data_unit_num(struct bio *bio)
+{
+	WARN_ON(1);
+	return 0;
+}
+
+static inline bool bio_crypt_should_process(struct bio *bio,
+					    struct request_queue *q)
+{
+	return false;
+}
+
+static inline bool bio_crypt_ctx_compatible(struct bio *b_1, struct bio *b_2)
+{
+	return true;
+}
+
+static inline bool bio_crypt_ctx_back_mergeable(struct bio *b_1,
+						unsigned int b1_sectors,
+						struct bio *b_2)
+{
+	return true;
+}
+
+#endif /* CONFIG_BLK_INLINE_ENCRYPTION */
+
 /*
  * BIO list management for use by remapping drivers (e.g. DM or MD) and loop.
  *
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 95202f80676c..0b794fe3530a 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -137,6 +137,8 @@ static inline void bio_issue_init(struct bio_issue *issue,
 			((u64)size << BIO_ISSUE_SIZE_SHIFT));
 }
 
+struct bio_crypt_ctx;
+
 /*
  * main unit of I/O for the block layer and lower layers (ie drivers and
  * stacking drivers)
@@ -175,6 +177,11 @@ struct bio {
 	struct blkcg_gq		*bi_blkg;
 	struct bio_issue	bi_issue;
 #endif
+
+#ifdef CONFIG_BLK_INLINE_ENCRYPTION
+	struct bio_crypt_ctx	*bi_crypt_context;
+#endif
+
 	union {
 #if defined(CONFIG_BLK_DEV_INTEGRITY)
 		struct bio_integrity_payload *bi_integrity; /* data integrity */
-- 
2.22.0.410.gd8fdbe21b5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
