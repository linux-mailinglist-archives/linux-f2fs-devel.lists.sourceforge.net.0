Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EA5182AAB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2020 09:09:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yM4KG6RmdxGMqueTGO/Fg/zgsXRCceAXoPkej0pLa5g=; b=aidS0wbf1joCbYE5Yywn9Cl2+
	QwzP86I6So+VEAFddO26whuXXm/NVbUr6O01gPQTAT4AC+CDIvleZCRpaLJvmhmqbet9V/1hEw8WL
	OfIyvHDZyjyzNmRrnwy0KPgApnuYBefu9yICC5w8SZN+j6dAuLLw/Q0LRWuykUQMc3yl4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jCIuL-00017Y-DF; Thu, 12 Mar 2020 08:09:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3uOxpXgYKADMhPinPiVddVaT.Rdb@flex--satyat.bounces.google.com>)
 id 1jCIuJ-00017Q-Gw
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Mar 2020 08:09:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y4J7x4sgBD2MWVKR1yBhXE2h9kXw62XcBMpS2jeEWho=; b=JKWuVjGa1+qkqvWiJ694JuyzA
 OferCcwfnepU4nzdRrRSD33q6cPQruVF0D1/6y7SCuMaEXQxCS0XA5SzvjbxKQhbztdXDI/9fkR/U
 5W8uzzTOQNROmI1jJwVJ0588AFsVHBiUS7Joo01FD4rr5eiBPGd+R3FnVdq+TzkcylhWE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y4J7x4sgBD2MWVKR1yBhXE2h9kXw62XcBMpS2jeEWho=; b=AG780y1GdDLjYJ8PoTM+m1oVwT
 errXI/TfynZy8Atx6Ois1dzX0ZWqChWyxZXxzLaVA9GNVuHfW+sPyE3p2OvY565KdVg6/eYoWyy14
 CFZ/yu8sMHa4kXCsG332rvabdSJ8zQQSxytO11QUw2z6mC/tZcKQzk4g774S24viyALM=;
Received: from mail-il1-f202.google.com ([209.85.166.202])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jCIuH-0098P7-8S
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Mar 2020 08:09:31 +0000
Received: by mail-il1-f202.google.com with SMTP id f19so3341771ill.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Mar 2020 01:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=y4J7x4sgBD2MWVKR1yBhXE2h9kXw62XcBMpS2jeEWho=;
 b=VcjS3xBrm5r3ckHx2Cbu01slzMftdPqAQz+SNQcJniKZAkqawO7dnior2dFaY8bBv/
 ITQdV9sHmDxLDfiQUZSdG7dUBDLFDHvDzslX4kuNvo0GlWaYVi6pntboId3nWHSeQlfL
 lAQ/2LguOS8Oy/K7qE68bG5753TPzmaCNIPMZ71+ym9hAdJ55gZGbUOcNnvP1Z82Sm5x
 WIdOnm3IKVPEC90CtGHOSauKw36qi11rNak++wbKXAgiRtQ244iOKq+GLtKYRNlc2lyG
 Ftr4phAJgPRMxkhy0Xws/5BvM1vAVnBf0I6qzS7lyTyzr4T24kyfktL68wK5gFGHnTDF
 Nocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=y4J7x4sgBD2MWVKR1yBhXE2h9kXw62XcBMpS2jeEWho=;
 b=CLWzgcYpgHY0bJ5Oh5hjcdOUXQDS8N4LqfOIY18gdhb8FLdvtReuGDd637/ZZbzFem
 vTiR0G80QM3dZigKmZyjaNLvcF0i+CR0S3rckc0Yrv563y6LiKppnHSHxDJiL0AWmoS4
 QBafthU8/EqfOz4TT1Xxcox2pdEwacd/0E4NPXN5Fia6igRvmwRvG1AqXNlP4tnrXE36
 fF0JuX++uz/fpWNq+RYaovY81MS8YZ80XdFg4zU2uC5O971ZpxncweS/jOjyiL0Aqvfl
 Ca19U9E7Wt5+4/pIn0heKRrnqcU3IxdsOVmlYVzTuHwuS9/MWd6MBT18OT5MPhp6sOhV
 IwuQ==
X-Gm-Message-State: ANhLgQ0TmrMWAI/xbl+cdGriDf5w44dye4njPHhUdxoWyzR2qUazCxrO
 Nk2Ey/aX6QXSNI1kVqCzmwf2Nwsd540=
X-Google-Smtp-Source: ADFU+vtPd+EenKMzhDFTZFJcdRZgoVPDYFG09y3+AIGTcW+1obT9vK+LeQu+bahJ5Fon07Kr4qPZQrIrGhA=
X-Received: by 2002:a37:514:: with SMTP id 20mr4605499qkf.420.1584000184070;
 Thu, 12 Mar 2020 01:03:04 -0700 (PDT)
Date: Thu, 12 Mar 2020 01:02:44 -0700
In-Reply-To: <20200312080253.3667-1-satyat@google.com>
Message-Id: <20200312080253.3667-3-satyat@google.com>
Mime-Version: 1.0
References: <20200312080253.3667-1-satyat@google.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.202 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.202 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jCIuH-0098P7-8S
Subject: [f2fs-dev] [PATCH v8 02/11] block: Inline encryption support for
 blk-mq
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
Cc: Kuohong Wang <kuohong.wang@mediatek.com>,
 Satya Tangirala <satyat@google.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Kim Boojin <boojin.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We must have some way of letting a storage device driver know what
encryption context it should use for en/decrypting a request. However,
it's the upper layers (like the filesystem/fscrypt) that know about and
manages encryption contexts. As such, when the upper layer submits a bio
to the block layer, and this bio eventually reaches a device driver with
support for inline encryption, the device driver will need to have been
told the encryption context for that bio.

We want to communicate the encryption context from the upper layer to the
storage device along with the bio, when the bio is submitted to the block
layer. To do this, we add a struct bio_crypt_ctx to struct bio, which can
represent an encryption context (note that we can't use the bi_private
field in struct bio to do this because that field does not function to pass
information across layers in the storage stack). We also introduce various
functions to manipulate the bio_crypt_ctx and make the bio/request merging
logic aware of the bio_crypt_ctx.

We also make changes to blk-mq to make it handle bios with encryption
contexts. blk-mq can merge many bios into the same request. These bios need
to have contiguous data unit numbers (the necessary changes to blk-merge
are also made to ensure this) - as such, it suffices to keep the data unit
number of just the first bio, since that's all a storage driver needs to
infer the data unit number to use for each data block in each bio in a
request. blk-mq keeps track of the encryption context to be used for all
the bios in a request with the request's rq_crypt_ctx. When the first bio
is added to an empty request, blk-mq will program the encryption context
of that bio into the request_queue's keyslot manager, and store the
returned keyslot in the request's rq_crypt_ctx. All the functions to
operate on encryption contexts are in blk-crypto.c.

Upper layers only need to call bio_crypt_set_ctx with the encryption key,
algorithm and data_unit_num; they don't have to worry about getting a
keyslot for each encryption context, as blk-mq/blk-crypto handles that.
Blk-crypto also makes it possible for request-based layered devices like
dm-rq to make use of inline encryption hardware by cloning the
rq_crypt_ctx and programming a keyslot in the new request_queue when
necessary.

Note that any user of the block layer can submit bios with an
encryption context, such as filesystems, device-mapper targets, etc.

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 block/Makefile              |   2 +-
 block/bio.c                 |   9 +-
 block/blk-core.c            |  27 ++-
 block/blk-crypto-internal.h | 144 +++++++++++++
 block/blk-crypto.c          | 408 ++++++++++++++++++++++++++++++++++++
 block/blk-map.c             |   2 +
 block/blk-merge.c           |  11 +
 block/blk-mq.c              |  15 ++
 block/blk.h                 |   5 +
 block/bounce.c              |   3 +
 drivers/md/dm.c             |   4 +
 include/linux/blk-crypto.h  |  72 ++++++-
 include/linux/blk_types.h   |   6 +
 include/linux/blkdev.h      |   5 +
 14 files changed, 706 insertions(+), 7 deletions(-)
 create mode 100644 block/blk-crypto-internal.h
 create mode 100644 block/blk-crypto.c

diff --git a/block/Makefile b/block/Makefile
index ef3a05dcf1f2..82f42ca3f769 100644
--- a/block/Makefile
+++ b/block/Makefile
@@ -37,4 +37,4 @@ obj-$(CONFIG_BLK_DEBUG_FS)	+= blk-mq-debugfs.o
 obj-$(CONFIG_BLK_DEBUG_FS_ZONED)+= blk-mq-debugfs-zoned.o
 obj-$(CONFIG_BLK_SED_OPAL)	+= sed-opal.o
 obj-$(CONFIG_BLK_PM)		+= blk-pm.o
-obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= keyslot-manager.o
+obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= keyslot-manager.o blk-crypto.o
diff --git a/block/bio.c b/block/bio.c
index 94d697217887..9e2542809279 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -17,6 +17,7 @@
 #include <linux/cgroup.h>
 #include <linux/blk-cgroup.h>
 #include <linux/highmem.h>
+#include <linux/blk-crypto.h>
 
 #include <trace/events/block.h>
 #include "blk.h"
@@ -236,6 +237,9 @@ void bio_uninit(struct bio *bio)
 
 	if (bio_integrity(bio))
 		bio_integrity_free(bio);
+
+	if (bio_has_crypt_ctx(bio))
+		bio_crypt_free_ctx(bio);
 }
 EXPORT_SYMBOL(bio_uninit);
 
@@ -664,11 +668,13 @@ struct bio *bio_clone_fast(struct bio *bio, gfp_t gfp_mask, struct bio_set *bs)
 
 	__bio_clone_fast(b, bio);
 
+	if (bio_has_crypt_ctx(bio))
+		bio_crypt_clone(b, bio, gfp_mask);
+
 	if (bio_integrity(bio)) {
 		int ret;
 
 		ret = bio_integrity_clone(b, bio, gfp_mask);
-
 		if (ret < 0) {
 			bio_put(b);
 			return NULL;
@@ -1046,6 +1052,7 @@ void bio_advance(struct bio *bio, unsigned bytes)
 	if (bio_integrity(bio))
 		bio_integrity_advance(bio, bytes);
 
+	bio_crypt_advance(bio, bytes);
 	bio_advance_iter(bio, &bio->bi_iter, bytes);
 }
 EXPORT_SYMBOL(bio_advance);
diff --git a/block/blk-core.c b/block/blk-core.c
index 089e890ab208..199837d1c15d 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -38,6 +38,7 @@
 #include <linux/debugfs.h>
 #include <linux/bpf.h>
 #include <linux/psi.h>
+#include <linux/blk-crypto.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/block.h>
@@ -120,6 +121,7 @@ void blk_rq_init(struct request_queue *q, struct request *rq)
 	rq->start_time_ns = ktime_get_ns();
 	rq->part = NULL;
 	refcount_set(&rq->ref, 1);
+	blk_crypto_rq_set_defaults(rq);
 }
 EXPORT_SYMBOL(blk_rq_init);
 
@@ -617,6 +619,9 @@ bool bio_attempt_back_merge(struct request *req, struct bio *bio,
 	req->biotail = bio;
 	req->__data_len += bio->bi_iter.bi_size;
 
+	if (bio_has_crypt_ctx(bio))
+		bio_crypt_free_ctx(bio);
+
 	blk_account_io_start(req, false);
 	return true;
 }
@@ -641,6 +646,9 @@ bool bio_attempt_front_merge(struct request *req, struct bio *bio,
 	req->__sector = bio->bi_iter.bi_sector;
 	req->__data_len += bio->bi_iter.bi_size;
 
+	if (bio_has_crypt_ctx(bio))
+		blk_crypto_rq_bio_prep(req, bio);
+
 	blk_account_io_start(req, false);
 	return true;
 }
@@ -1066,7 +1074,9 @@ blk_qc_t generic_make_request(struct bio *bio)
 			/* Create a fresh bio_list for all subordinate requests */
 			bio_list_on_stack[1] = bio_list_on_stack[0];
 			bio_list_init(&bio_list_on_stack[0]);
-			ret = q->make_request_fn(q, bio);
+			if (!bio_has_crypt_ctx(bio) ||
+			    !blk_crypto_bio_prep(&bio))
+				ret = q->make_request_fn(q, bio);
 
 			blk_queue_exit(q);
 
@@ -1114,7 +1124,7 @@ blk_qc_t direct_make_request(struct bio *bio)
 {
 	struct request_queue *q = bio->bi_disk->queue;
 	bool nowait = bio->bi_opf & REQ_NOWAIT;
-	blk_qc_t ret;
+	blk_qc_t ret = BLK_QC_T_NONE;
 
 	if (!generic_make_request_checks(bio))
 		return BLK_QC_T_NONE;
@@ -1127,8 +1137,8 @@ blk_qc_t direct_make_request(struct bio *bio)
 		bio_endio(bio);
 		return BLK_QC_T_NONE;
 	}
-
-	ret = q->make_request_fn(q, bio);
+	if (!bio_has_crypt_ctx(bio) || !blk_crypto_bio_prep(&bio))
+		ret = q->make_request_fn(q, bio);
 	blk_queue_exit(q);
 	return ret;
 }
@@ -1258,6 +1268,10 @@ blk_status_t blk_insert_cloned_request(struct request_queue *q, struct request *
 	    should_fail_request(&rq->rq_disk->part0, blk_rq_bytes(rq)))
 		return BLK_STS_IOERR;
 
+	if (blk_crypto_rq_is_encrypted(rq) &&
+	    blk_crypto_insert_cloned_request(rq))
+		return BLK_STS_IOERR;
+
 	if (blk_queue_io_stat(q))
 		blk_account_io_start(rq, true);
 
@@ -1646,6 +1660,9 @@ int blk_rq_prep_clone(struct request *rq, struct request *rq_src,
 
 	__blk_rq_prep_clone(rq, rq_src);
 
+	if (blk_crypto_rq_is_encrypted(rq_src))
+		blk_crypto_rq_prep_clone(rq, rq_src);
+
 	return 0;
 
 free_and_out:
@@ -1813,5 +1830,7 @@ int __init blk_dev_init(void)
 	blk_debugfs_root = debugfs_create_dir("block", NULL);
 #endif
 
+	bio_crypt_ctx_init();
+
 	return 0;
 }
diff --git a/block/blk-crypto-internal.h b/block/blk-crypto-internal.h
new file mode 100644
index 000000000000..5cdf45167117
--- /dev/null
+++ b/block/blk-crypto-internal.h
@@ -0,0 +1,144 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2019 Google LLC
+ */
+
+#ifndef __LINUX_BLK_CRYPTO_INTERNAL_H
+#define __LINUX_BLK_CRYPTO_INTERNAL_H
+
+#include <linux/bio.h>
+#include <linux/blkdev.h>
+
+/* Represents a crypto mode supported by blk-crypto  */
+struct blk_crypto_mode {
+	const char *cipher_str; /* crypto API name (for fallback case) */
+	unsigned int keysize; /* key size in bytes */
+	unsigned int ivsize; /* iv size in bytes */
+};
+
+#ifdef CONFIG_BLK_INLINE_ENCRYPTION
+
+void bio_crypt_ctx_init(void);
+
+void bio_crypt_free_ctx(struct bio *bio);
+
+void bio_crypt_dun_increment(u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE],
+			     unsigned int inc);
+
+void bio_crypt_advance(struct bio *bio, unsigned int bytes);
+
+bool bio_crypt_rq_ctx_compatible(struct request *rq, struct bio *bio);
+
+bool bio_crypt_ctx_mergeable(struct bio_crypt_ctx *bc1, unsigned int bc1_bytes,
+			     struct bio_crypt_ctx *bc2);
+
+static inline bool bio_crypt_ctx_back_mergeable(struct request *req,
+						struct bio *bio)
+{
+	return bio_crypt_ctx_mergeable(req->crypt_ctx, blk_rq_bytes(req),
+				       bio->bi_crypt_context);
+}
+
+static inline bool bio_crypt_ctx_front_mergeable(struct request *req,
+						 struct bio *bio)
+{
+	return bio_crypt_ctx_mergeable(bio->bi_crypt_context,
+				       bio->bi_iter.bi_size, req->crypt_ctx);
+}
+
+static inline bool bio_crypt_ctx_merge_rq(struct request *req,
+					  struct request *next)
+{
+	return bio_crypt_ctx_mergeable(req->crypt_ctx, blk_rq_bytes(req),
+				       next->crypt_ctx);
+}
+
+void blk_crypto_free_request(struct request *rq);
+
+static inline void blk_crypto_rq_set_defaults(struct request *rq)
+{
+	rq->crypt_ctx = NULL;
+	rq->crypt_keyslot = NULL;
+}
+
+static inline bool blk_crypto_rq_is_encrypted(struct request *rq)
+{
+	return rq->crypt_ctx;
+}
+
+blk_status_t blk_crypto_init_request(struct request *rq, struct bio *bio);
+
+int blk_crypto_bio_prep(struct bio **bio_ptr);
+
+void blk_crypto_rq_bio_prep(struct request *rq, struct bio *bio);
+
+void blk_crypto_rq_prep_clone(struct request *dst, struct request *src);
+
+blk_status_t blk_crypto_insert_cloned_request(struct request *rq);
+
+#else /* CONFIG_BLK_INLINE_ENCRYPTION */
+
+static inline void bio_crypt_ctx_init(void) { }
+
+static inline void bio_crypt_free_ctx(struct bio *bio) { }
+
+static inline void bio_crypt_advance(struct bio *bio, unsigned int bytes) { }
+
+static inline bool bio_crypt_rq_ctx_compatible(struct request *rq,
+					       struct bio *bio)
+{
+	return true;
+}
+
+static inline bool bio_crypt_ctx_front_mergeable(struct request *req,
+						 struct bio *bio)
+{
+	return true;
+}
+
+static inline bool bio_crypt_ctx_back_mergeable(struct request *req,
+						struct bio *bio)
+{
+	return true;
+}
+
+static inline bool bio_crypt_ctx_merge_rq(struct request *req,
+					  struct request *next)
+{
+	return true;
+}
+
+static inline void blk_crypto_free_request(struct request *rq) { }
+
+static inline void blk_crypto_rq_set_defaults(struct request *rq) { }
+
+static inline bool blk_crypto_rq_is_encrypted(struct request *rq)
+{
+	return false;
+}
+
+static inline blk_status_t blk_crypto_init_request(struct request *rq,
+						   struct bio *bio)
+{
+	return 0;
+}
+
+static inline int blk_crypto_bio_prep(struct bio **bio_ptr)
+{
+	return 0;
+}
+
+static inline void blk_crypto_rq_bio_prep(struct request *rq, struct bio *bio)
+{ }
+
+static inline void blk_crypto_rq_prep_clone(struct request *dst,
+					    struct request *src) { }
+
+static inline blk_status_t blk_crypto_insert_cloned_request(struct request *rq)
+{
+	return 0;
+}
+
+#endif /* CONFIG_BLK_INLINE_ENCRYPTION */
+
+#endif /* __LINUX_BLK_CRYPTO_INTERNAL_H */
diff --git a/block/blk-crypto.c b/block/blk-crypto.c
new file mode 100644
index 000000000000..1c38de053bb6
--- /dev/null
+++ b/block/blk-crypto.c
@@ -0,0 +1,408 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2019 Google LLC
+ */
+
+#define pr_fmt(fmt) "blk-crypto: " fmt
+
+#include <linux/bio.h>
+#include <linux/blkdev.h>
+#include <linux/keyslot-manager.h>
+#include <linux/module.h>
+#include <linux/random.h>
+#include <linux/siphash.h>
+#include <linux/slab.h>
+
+#include "blk-crypto-internal.h"
+
+const struct blk_crypto_mode blk_crypto_modes[] = {
+	[BLK_ENCRYPTION_MODE_AES_256_XTS] = {
+		.cipher_str = "xts(aes)",
+		.keysize = 64,
+		.ivsize = 16,
+	},
+	[BLK_ENCRYPTION_MODE_AES_128_CBC_ESSIV] = {
+		.cipher_str = "essiv(cbc(aes),sha256)",
+		.keysize = 16,
+		.ivsize = 16,
+	},
+	[BLK_ENCRYPTION_MODE_ADIANTUM] = {
+		.cipher_str = "adiantum(xchacha12,aes)",
+		.keysize = 32,
+		.ivsize = 32,
+	},
+};
+
+/*
+ * This number needs to be at least (the number of threads doing IO
+ * concurrently) * (maximum recursive depth of a bio), so that we don't
+ * deadlock on crypt_ctx allocations. The default is chosen to be the same
+ * as the default number of post read contexts in both EXT4 and F2FS.
+ */
+static int num_prealloc_crypt_ctxs = 128;
+
+module_param(num_prealloc_crypt_ctxs, int, 0444);
+MODULE_PARM_DESC(num_prealloc_crypt_ctxs,
+		"Number of bio crypto contexts to preallocate");
+
+static struct kmem_cache *bio_crypt_ctx_cache;
+static mempool_t *bio_crypt_ctx_pool;
+
+void __init bio_crypt_ctx_init(void)
+{
+	size_t i;
+
+	bio_crypt_ctx_cache = KMEM_CACHE(bio_crypt_ctx, 0);
+	if (!bio_crypt_ctx_cache)
+		goto out_no_mem;
+
+	bio_crypt_ctx_pool = mempool_create_slab_pool(num_prealloc_crypt_ctxs,
+						      bio_crypt_ctx_cache);
+	if (!bio_crypt_ctx_pool)
+		goto out_no_mem;
+
+	/* This is assumed in various places. */
+	BUILD_BUG_ON(BLK_ENCRYPTION_MODE_INVALID != 0);
+
+	/* Sanity check that no algorithm exceeds the defined limits. */
+	for (i = 0; i < BLK_ENCRYPTION_MODE_MAX; i++) {
+		BUG_ON(blk_crypto_modes[i].keysize > BLK_CRYPTO_MAX_KEY_SIZE);
+		BUG_ON(blk_crypto_modes[i].ivsize > BLK_CRYPTO_MAX_IV_SIZE);
+	}
+
+	return;
+out_no_mem:
+	panic("Failed to allocate mem for bio crypt ctxs\n");
+}
+
+void bio_crypt_set_ctx(struct bio *bio, const struct blk_crypto_key *key,
+		       const u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE], gfp_t gfp_mask)
+{
+	struct bio_crypt_ctx *bc = mempool_alloc(bio_crypt_ctx_pool, gfp_mask);
+
+	bc->bc_key = key;
+	memcpy(bc->bc_dun, dun, sizeof(bc->bc_dun));
+
+	bio->bi_crypt_context = bc;
+}
+
+void bio_crypt_free_ctx(struct bio *bio)
+{
+	mempool_free(bio->bi_crypt_context, bio_crypt_ctx_pool);
+	bio->bi_crypt_context = NULL;
+}
+
+void bio_crypt_clone(struct bio *dst, struct bio *src, gfp_t gfp_mask)
+{
+	dst->bi_crypt_context = mempool_alloc(bio_crypt_ctx_pool, gfp_mask);
+	*dst->bi_crypt_context = *src->bi_crypt_context;
+}
+EXPORT_SYMBOL_GPL(bio_crypt_clone);
+
+void bio_crypt_dun_increment(u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE],
+			     unsigned int inc)
+{
+	int i = 0;
+
+	while (inc && i < BLK_CRYPTO_DUN_ARRAY_SIZE) {
+		dun[i] += inc;
+		inc = (dun[i] < inc);
+		i++;
+	}
+}
+
+void bio_crypt_advance(struct bio *bio, unsigned int bytes)
+{
+	struct bio_crypt_ctx *bc = bio->bi_crypt_context;
+
+	if (!bc)
+		return;
+
+	bio_crypt_dun_increment(bc->bc_dun,
+				bytes >> bc->bc_key->data_unit_size_bits);
+}
+
+bool bio_crypt_dun_is_contiguous(const struct bio_crypt_ctx *bc,
+				 unsigned int bytes,
+				 u64 next_dun[BLK_CRYPTO_DUN_ARRAY_SIZE])
+{
+	int i = 0;
+	unsigned int inc = bytes >> bc->bc_key->data_unit_size_bits;
+
+	while (i < BLK_CRYPTO_DUN_ARRAY_SIZE) {
+		if (bc->bc_dun[i] + inc != next_dun[i])
+			return false;
+		inc = ((bc->bc_dun[i] + inc)  < inc);
+		i++;
+	}
+
+	return true;
+}
+
+/*
+ * Checks that two bio crypt contexts are compatible - i.e. that
+ * they are mergeable except for data_unit_num continuity.
+ */
+static bool bio_crypt_ctx_compatible(struct bio_crypt_ctx *bc1,
+				     struct bio_crypt_ctx *bc2)
+{
+	if (!bc1)
+		return !bc2;
+
+	return bc2 && bc1->bc_key == bc2->bc_key;
+}
+
+bool bio_crypt_rq_ctx_compatible(struct request *rq, struct bio *bio)
+{
+	return bio_crypt_ctx_compatible(rq->crypt_ctx, bio->bi_crypt_context);
+}
+
+/*
+ * Checks that two bio crypt contexts are compatible, and also
+ * that their data_unit_nums are continuous (and can hence be merged)
+ * in the order b_1 followed by b_2.
+ */
+bool bio_crypt_ctx_mergeable(struct bio_crypt_ctx *bc1, unsigned int bc1_bytes,
+			     struct bio_crypt_ctx *bc2)
+{
+	if (!bio_crypt_ctx_compatible(bc1, bc2))
+		return false;
+
+	return !bc1 || bio_crypt_dun_is_contiguous(bc1, bc1_bytes, bc2->bc_dun);
+}
+
+/*
+ * Check that all I/O segments are data unit aligned, and set bio->bi_status
+ * on error.
+ */
+static void bio_crypt_check_alignment(struct bio *bio)
+{
+	const unsigned int data_unit_size =
+				bio->bi_crypt_context->bc_key->data_unit_size;
+	struct bvec_iter iter;
+	struct bio_vec bv;
+
+	bio_for_each_segment(bv, bio, iter) {
+		if (!IS_ALIGNED(bv.bv_len | bv.bv_offset, data_unit_size)) {
+			bio->bi_status = BLK_STS_IOERR;
+			return;
+		}
+	}
+}
+
+/**
+ * blk_crypto_init_request - Initializes the request's crypto fields based on
+ *			     the bio to be added to the request, and prepares
+ *			     it for hardware inline encryption.
+ *
+ * @rq: The request to init
+ * @bio: The bio that will (eventually) be added to @rq.
+ *
+ * Initializes the request's crypto fields to appropriate default values and
+ * tries to get a keyslot for the bio crypt ctx. Caller must ensure that bio has
+ * a bio_crypt_ctx.
+ *
+ * Return: BLK_STATUS_OK on success, and negative error code otherwise.
+ */
+blk_status_t blk_crypto_init_request(struct request *rq, struct bio *bio)
+{
+	blk_status_t err;
+
+	blk_crypto_rq_set_defaults(rq);
+
+	err = blk_ksm_get_slot_for_key(rq->q->ksm,
+				       bio->bi_crypt_context->bc_key,
+				       &rq->crypt_keyslot);
+	if (err != BLK_STS_OK)
+		pr_warn_once("Failed to acquire keyslot for %s (err=%d).\n",
+			     bio->bi_disk->disk_name, err);
+	return err;
+}
+
+/**
+ * blk_crypto_free_request - Uninitialize the crypto fields of a request.
+ *
+ * @rq: The request whose crypto fields to uninitialize.
+ *
+ * Completely uninitializes the crypto fields of a request. If a keyslot has
+ * been programmed into some inline encryption hardware, that keyslot is
+ * released. The rq->crypt_ctx is also freed.
+ */
+void blk_crypto_free_request(struct request *rq)
+{
+	blk_ksm_put_slot(rq->crypt_keyslot);
+	mempool_free(rq->crypt_ctx, bio_crypt_ctx_pool);
+	blk_crypto_rq_set_defaults(rq);
+}
+
+/**
+ * blk_crypto_bio_prep - Prepare bio for inline encryption
+ *
+ * @bio_ptr: pointer to original bio pointer
+ *
+ * Succeeds if the bio doesn't have inline encryption enabled or if the bio
+ * crypt context provided for the bio is supported by the underlying device's
+ * inline encryption hardware. Ends the bio with error otherwise.
+ *
+ * Caller must ensure bio has bio_crypt_ctx.
+ *
+ * Return: 0 on success; nonzero on error (and bio->bi_status will be set
+ *	   appropriately, and bio_endio() will have been called so bio
+ *	   submission should abort).
+ */
+int blk_crypto_bio_prep(struct bio **bio_ptr)
+{
+	struct bio *bio = *bio_ptr;
+
+	/*
+	 * If bio has no data, just pretend it didn't have an encryption
+	 * context.
+	 */
+	if (!bio_has_data(bio)) {
+		bio_crypt_free_ctx(bio);
+		return 0;
+	}
+
+	bio_crypt_check_alignment(bio);
+	if (bio->bi_status != BLK_STS_OK)
+		goto fail;
+
+	/*
+	 * Success if device supports the encryption context, and blk-integrity
+	 * isn't supported by device/is turned off.
+	 */
+	if (!blk_ksm_crypto_key_supported(bio->bi_disk->queue->ksm,
+					  bio->bi_crypt_context->bc_key)) {
+		bio->bi_status = BLK_STS_NOTSUPP;
+		goto fail;
+	}
+
+	return 0;
+fail:
+	bio_endio(*bio_ptr);
+	return -EIO;
+}
+
+/**
+ * blk_crypto_rq_bio_prep - Prepare a request when its first bio is inserted
+ *
+ * @rq: The request to prepare
+ * @bio: The first bio being inserted into the request
+ *
+ * Frees the bio crypt context in the request's old rq->crypt_ctx, if any, and
+ * moves the bio crypt context of the bio into the request's rq->crypt_ctx.
+ */
+void blk_crypto_rq_bio_prep(struct request *rq, struct bio *bio)
+{
+	mempool_free(rq->crypt_ctx, bio_crypt_ctx_pool);
+	rq->crypt_ctx = bio->bi_crypt_context;
+	bio->bi_crypt_context = NULL;
+}
+
+void blk_crypto_rq_prep_clone(struct request *dst, struct request *src)
+{
+	dst->crypt_ctx = src->crypt_ctx;
+}
+
+/**
+ * blk_crypto_insert_cloned_request - Prepare a cloned request to be inserted
+ *				      into a request queue.
+ * @rq: the request being queued
+ *
+ * Return: BLK_STS_OK on success, nonzero on error.
+ */
+blk_status_t blk_crypto_insert_cloned_request(struct request *rq)
+{
+	blk_status_t err;
+
+	if (!rq->bio)
+		return 0;
+
+	/*
+	 * Pretend that the bio had the encryption ctx before calling
+	 * blk_crypto_init_request
+	 */
+	rq->bio->bi_crypt_context = rq->crypt_ctx;
+	err = blk_crypto_init_request(rq, rq->bio);
+	/*
+	 * blk_crypto_init_request *always* clears the crypto fields in rq to
+	 * defaults, so regardless of what err is, restore rq->crypt_ctx.
+	 */
+	blk_crypto_rq_bio_prep(rq, rq->bio);
+
+	return err;
+}
+
+/**
+ * blk_crypto_init_key() - Prepare a key for use with blk-crypto
+ * @blk_key: Pointer to the blk_crypto_key to initialize.
+ * @raw_key: Pointer to the raw key. Must be the correct length for the chosen
+ *	     @crypto_mode; see blk_crypto_modes[].
+ * @crypto_mode: identifier for the encryption algorithm to use
+ * @blk_crypto_dun_bytes: number of bytes that will be used to specify the DUN
+ *			  when this key is used
+ * @data_unit_size: the data unit size to use for en/decryption
+ *
+ * Return: 0 on success, -errno on failure.  The caller is responsible for
+ *	   zeroizing both blk_key and raw_key when done with them.
+ */
+int blk_crypto_init_key(struct blk_crypto_key *blk_key, const u8 *raw_key,
+			enum blk_crypto_mode_num crypto_mode,
+			unsigned int blk_crypto_dun_bytes,
+			unsigned int data_unit_size)
+{
+	const struct blk_crypto_mode *mode;
+	static siphash_key_t hash_key;
+
+	memset(blk_key, 0, sizeof(*blk_key));
+
+	if (crypto_mode >= ARRAY_SIZE(blk_crypto_modes))
+		return -EINVAL;
+
+	mode = &blk_crypto_modes[crypto_mode];
+	if (mode->keysize == 0)
+		return -EINVAL;
+
+	if (!is_power_of_2(data_unit_size))
+		return -EINVAL;
+
+	blk_key->crypto_mode = crypto_mode;
+	blk_key->dun_bytes = blk_crypto_dun_bytes;
+	blk_key->data_unit_size = data_unit_size;
+	blk_key->data_unit_size_bits = ilog2(data_unit_size);
+	blk_key->size = mode->keysize;
+	memcpy(blk_key->raw, raw_key, mode->keysize);
+
+	/*
+	 * The keyslot manager uses the SipHash of the key to implement O(1) key
+	 * lookups while avoiding leaking information about the keys.  It's
+	 * precomputed here so that it only needs to be computed once per key.
+	 */
+	get_random_once(&hash_key, sizeof(hash_key));
+	blk_key->hash = siphash(raw_key, mode->keysize, &hash_key);
+
+	return 0;
+}
+
+/**
+ * blk_crypto_evict_key() - Evict a key from any inline encryption hardware
+ *			    it may have been programmed into
+ * @q: The request queue who's keyslot manager this key might have been
+ *     programmed into
+ * @key: The key to evict
+ *
+ * Upper layers (filesystems) should call this function to ensure that a key
+ * is evicted from hardware that it might have been programmed into. This
+ * will call blk_ksm_evict_key on the queue's keyslot manager, if one
+ * exists, and supports the crypto algorithm with the specified data unit size.
+ *
+ * Return: 0 on success or if key is not present in the q's ksm, -err on error.
+ */
+int blk_crypto_evict_key(struct request_queue *q,
+			 const struct blk_crypto_key *key)
+{
+	if (q->ksm && blk_ksm_crypto_key_supported(q->ksm, key))
+		return blk_ksm_evict_key(q->ksm, key);
+
+	return 0;
+}
diff --git a/block/blk-map.c b/block/blk-map.c
index b0790268ed9d..1c8acc39584d 100644
--- a/block/blk-map.c
+++ b/block/blk-map.c
@@ -41,6 +41,8 @@ int blk_rq_append_bio(struct request *rq, struct bio **bio)
 		rq->biotail->bi_next = *bio;
 		rq->biotail = *bio;
 		rq->__data_len += (*bio)->bi_iter.bi_size;
+		if (bio_has_crypt_ctx(*bio))
+			bio_crypt_free_ctx(*bio);
 	}
 
 	return 0;
diff --git a/block/blk-merge.c b/block/blk-merge.c
index 1534ed736363..a0c24b6e0eb3 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -596,6 +596,8 @@ int ll_back_merge_fn(struct request *req, struct bio *bio, unsigned int nr_segs)
 	if (blk_integrity_rq(req) &&
 	    integrity_req_gap_back_merge(req, bio))
 		return 0;
+	if (!bio_crypt_ctx_back_mergeable(req, bio))
+		return 0;
 	if (blk_rq_sectors(req) + bio_sectors(bio) >
 	    blk_rq_get_max_sectors(req, blk_rq_pos(req))) {
 		req_set_nomerge(req->q, req);
@@ -612,6 +614,8 @@ int ll_front_merge_fn(struct request *req, struct bio *bio, unsigned int nr_segs
 	if (blk_integrity_rq(req) &&
 	    integrity_req_gap_front_merge(req, bio))
 		return 0;
+	if (!bio_crypt_ctx_front_mergeable(req, bio))
+		return 0;
 	if (blk_rq_sectors(req) + bio_sectors(bio) >
 	    blk_rq_get_max_sectors(req, bio->bi_iter.bi_sector)) {
 		req_set_nomerge(req->q, req);
@@ -661,6 +665,9 @@ static int ll_merge_requests_fn(struct request_queue *q, struct request *req,
 	if (blk_integrity_merge_rq(q, req, next) == false)
 		return 0;
 
+	if (!bio_crypt_ctx_merge_rq(req, next))
+		return 0;
+
 	/* Merge is OK... */
 	req->nr_phys_segments = total_phys_segments;
 	return 1;
@@ -885,6 +892,10 @@ bool blk_rq_merge_ok(struct request *rq, struct bio *bio)
 	if (blk_integrity_merge_bio(rq->q, rq, bio) == false)
 		return false;
 
+	/* Only merge if the crypt contexts are compatible */
+	if (!bio_crypt_rq_ctx_compatible(rq, bio))
+		return false;
+
 	/* must be using the same buffer */
 	if (req_op(rq) == REQ_OP_WRITE_SAME &&
 	    !blk_write_same_mergeable(rq->bio, bio))
diff --git a/block/blk-mq.c b/block/blk-mq.c
index d92088dec6c3..b98dd06daf8f 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -26,6 +26,7 @@
 #include <linux/delay.h>
 #include <linux/crash_dump.h>
 #include <linux/prefetch.h>
+#include <linux/blk-crypto.h>
 
 #include <trace/events/block.h>
 
@@ -317,6 +318,7 @@ static struct request *blk_mq_rq_ctx_init(struct blk_mq_alloc_data *data,
 #if defined(CONFIG_BLK_DEV_INTEGRITY)
 	rq->nr_integrity_segments = 0;
 #endif
+	blk_crypto_rq_set_defaults(rq);
 	/* tag was already set */
 	rq->extra_len = 0;
 	WRITE_ONCE(rq->deadline, 0);
@@ -474,6 +476,8 @@ static void __blk_mq_free_request(struct request *rq)
 	struct blk_mq_hw_ctx *hctx = rq->mq_hctx;
 	const int sched_tag = rq->internal_tag;
 
+	if (blk_crypto_rq_is_encrypted(rq))
+		blk_crypto_free_request(rq);
 	blk_pm_mark_last_busy(rq);
 	rq->mq_hctx = NULL;
 	if (rq->tag != -1)
@@ -1971,6 +1975,7 @@ static blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio)
 	struct request *same_queue_rq = NULL;
 	unsigned int nr_segs;
 	blk_qc_t cookie;
+	blk_status_t err;
 
 	blk_queue_bounce(q, &bio);
 	__blk_queue_split(q, &bio, &nr_segs);
@@ -2002,6 +2007,16 @@ static blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio)
 
 	cookie = request_to_qc_t(data.hctx, rq);
 
+	if (bio_has_crypt_ctx(bio)) {
+		err = blk_crypto_init_request(rq, bio);
+		if (err != BLK_STS_OK) {
+			bio->bi_status = err;
+			bio_endio(bio);
+			blk_mq_end_request(rq, err);
+			return BLK_QC_T_NONE;
+		}
+	}
+
 	blk_mq_bio_to_request(rq, bio, nr_segs);
 
 	plug = blk_mq_plug(q, bio);
diff --git a/block/blk.h b/block/blk.h
index 0b8884353f6b..35e675ac845d 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -4,7 +4,9 @@
 
 #include <linux/idr.h>
 #include <linux/blk-mq.h>
+#include <linux/blk-crypto.h>
 #include <xen/xen.h>
+#include "blk-crypto-internal.h"
 #include "blk-mq.h"
 #include "blk-mq-sched.h"
 
@@ -117,6 +119,9 @@ static inline void blk_rq_bio_prep(struct request *rq, struct bio *bio,
 
 	if (bio->bi_disk)
 		rq->rq_disk = bio->bi_disk;
+
+	if (bio_has_crypt_ctx(bio))
+		blk_crypto_rq_bio_prep(rq, bio);
 }
 
 #ifdef CONFIG_BLK_DEV_INTEGRITY
diff --git a/block/bounce.c b/block/bounce.c
index f8ed677a1bf7..c345132e91dd 100644
--- a/block/bounce.c
+++ b/block/bounce.c
@@ -267,6 +267,9 @@ static struct bio *bounce_clone_bio(struct bio *bio_src, gfp_t gfp_mask,
 		break;
 	}
 
+	if (bio_has_crypt_ctx(bio_src))
+		bio_crypt_clone(bio, bio_src, gfp_mask);
+
 	if (bio_integrity(bio_src)) {
 		int ret;
 
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index b89f07ee2eff..d3f8fab33ee2 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -25,6 +25,7 @@
 #include <linux/wait.h>
 #include <linux/pr.h>
 #include <linux/refcount.h>
+#include <linux/blk-crypto.h>
 
 #define DM_MSG_PREFIX "core"
 
@@ -1304,6 +1305,9 @@ static int clone_bio(struct dm_target_io *tio, struct bio *bio,
 
 	__bio_clone_fast(clone, bio);
 
+	if (bio_has_crypt_ctx(bio))
+		bio_crypt_clone(clone, bio, GFP_NOIO);
+
 	if (bio_integrity(bio)) {
 		int r;
 
diff --git a/include/linux/blk-crypto.h b/include/linux/blk-crypto.h
index b8d54eca1c0d..90a28df26106 100644
--- a/include/linux/blk-crypto.h
+++ b/include/linux/blk-crypto.h
@@ -6,6 +6,8 @@
 #ifndef __LINUX_BLK_CRYPTO_H
 #define __LINUX_BLK_CRYPTO_H
 
+#include <linux/types.h>
+
 enum blk_crypto_mode_num {
 	BLK_ENCRYPTION_MODE_INVALID,
 	BLK_ENCRYPTION_MODE_AES_256_XTS,
@@ -24,7 +26,7 @@ enum blk_crypto_mode_num {
  *	ciphertext.  This is always a power of 2.  It might be e.g. the
  *	filesystem block size or the disk sector size.
  * @data_unit_size_bits: log2 of data_unit_size
- * @dun_bytes: the number of bytes of DUN used when using this key
+ * @dun_bytes: the maximum number of bytes of DUN used when using this key
  * @size: size of this key in bytes (determined by @crypto_mode)
  * @hash: hash of this key, for keyslot manager use only
  * @raw: the raw bytes of this key.  Only the first @size bytes are used.
@@ -42,4 +44,72 @@ struct blk_crypto_key {
 	u8 raw[BLK_CRYPTO_MAX_KEY_SIZE];
 };
 
+#define BLK_CRYPTO_MAX_IV_SIZE		32
+#define BLK_CRYPTO_DUN_ARRAY_SIZE	(BLK_CRYPTO_MAX_IV_SIZE/sizeof(u64))
+
+/**
+ * struct bio_crypt_ctx - an inline encryption context
+ * @bc_key: the key, algorithm, and data unit size to use
+ * @bc_dun: the data unit number (starting IV) to use
+ * @bc_keyslot: the keyslot that has been assigned for this key in @bc_ksm,
+ *		or -1 if no keyslot has been assigned yet.
+ * @bc_ksm: the keyslot manager into which the key has been programmed with
+ *	    @bc_keyslot, or NULL if this key hasn't yet been programmed.
+ *
+ * A bio_crypt_ctx specifies that the contents of the bio will be encrypted (for
+ * write requests) or decrypted (for read requests) inline by the storage device
+ * or controller.
+ */
+struct bio_crypt_ctx {
+	const struct blk_crypto_key	*bc_key;
+	u64				bc_dun[BLK_CRYPTO_DUN_ARRAY_SIZE];
+};
+
+#ifdef CONFIG_BLOCK
+
+#include <linux/blk_types.h>
+#include <linux/blkdev.h>
+
+struct request;
+struct request_queue;
+
+#ifdef CONFIG_BLK_INLINE_ENCRYPTION
+
+void bio_crypt_set_ctx(struct bio *bio, const struct blk_crypto_key *key,
+		       const u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE],
+		       gfp_t gfp_mask);
+
+static inline bool bio_has_crypt_ctx(struct bio *bio)
+{
+	return bio->bi_crypt_context;
+}
+
+void bio_crypt_clone(struct bio *dst, struct bio *src, gfp_t gfp_mask);
+
+bool bio_crypt_dun_is_contiguous(const struct bio_crypt_ctx *bc,
+				 unsigned int bytes,
+				 u64 next_dun[BLK_CRYPTO_DUN_ARRAY_SIZE]);
+
+int blk_crypto_init_key(struct blk_crypto_key *blk_key, const u8 *raw_key,
+			enum blk_crypto_mode_num crypto_mode,
+			unsigned int blk_crypto_dun_bytes,
+			unsigned int data_unit_size);
+
+int blk_crypto_evict_key(struct request_queue *q,
+			 const struct blk_crypto_key *key);
+
+#else /* CONFIG_BLK_INLINE_ENCRYPTION */
+
+static inline bool bio_has_crypt_ctx(struct bio *bio)
+{
+	return false;
+}
+
+static inline void bio_crypt_clone(struct bio *dst, struct bio *src,
+				   gfp_t gfp_mask) { }
+
+#endif /* CONFIG_BLK_INLINE_ENCRYPTION */
+
+#endif /* CONFIG_BLOCK */
+
 #endif /* __LINUX_BLK_CRYPTO_H */
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 70254ae11769..1996689c51d3 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -18,6 +18,7 @@ struct block_device;
 struct io_context;
 struct cgroup_subsys_state;
 typedef void (bio_end_io_t) (struct bio *);
+struct bio_crypt_ctx;
 
 /*
  * Block error status values.  See block/blk-core:blk_errors for the details.
@@ -173,6 +174,11 @@ struct bio {
 	u64			bi_iocost_cost;
 #endif
 #endif
+
+#ifdef CONFIG_BLK_INLINE_ENCRYPTION
+	struct bio_crypt_ctx	*bi_crypt_context;
+#endif
+
 	union {
 #if defined(CONFIG_BLK_DEV_INTEGRITY)
 		struct bio_integrity_payload *bi_integrity; /* data integrity */
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index c447361952d1..c6ea578c1f79 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -224,6 +224,11 @@ struct request {
 	unsigned short nr_integrity_segments;
 #endif
 
+#ifdef CONFIG_BLK_INLINE_ENCRYPTION
+	struct bio_crypt_ctx *crypt_ctx;
+	struct blk_ksm_keyslot *crypt_keyslot;
+#endif
+
 	unsigned short write_hint;
 	unsigned short ioprio;
 
-- 
2.25.1.481.gfbce0eb801-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
