Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A6C1BF782
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Apr 2020 14:00:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n61RMbefcfRcOGr4+xLJ380BJcrb8yTMhqRQzfvinQQ=; b=h3xDaI70uR4lGAP1+EPOT1scv
	Q3q69tKt+PQJG2EC9SZQTdUnKELYJyVIC3HJ5jYD3cTJ2CklpLkkgd1zwOQPw39VUgTyrmP6VHjq6
	1fcsesY0aN/0Cpo/P8e9GaL5MRa7xdbDg9obuAVVjP3lFcxx37OHXxoBuGtF2zAIiOCs8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jU7rU-0000Qy-QG; Thu, 30 Apr 2020 12:00:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3xr2qXgYKAOcbJchJcPXXPUN.LXV@flex--satyat.bounces.google.com>)
 id 1jU7rT-0000Qg-Qh
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Apr 2020 12:00:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I8onJV2et/QJa7Xt8X+bnOCFVQme3CitidTmpyIUJDg=; b=REXX4KpMNJxPKlu/BnZMZILWR
 APZ0cPvPDexsu2IEnbkHv1M7MHbnx9mhRWQX5rStwlQcRaK812iiJbMNJu/JQrJKKfld3T3bA24EP
 H12gpZDacj6OHVwie5tswDirGgZ+THIYRa71Oz2/27pTWuCUlEPJA7UcGigJW5PdPI3Z8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I8onJV2et/QJa7Xt8X+bnOCFVQme3CitidTmpyIUJDg=; b=QdPrNDUBfOG/u/uwDpFEVUQc5p
 S27410/GUL3rR5E2Oqp1L3BSg38eyQ2bE/4+1xy771ndvjQxb7WWT+IpBHvZRISusj4et84WX4J+o
 h0atknuUC1T9t4XCp+MNicktAL2ZnDkZy7Xk3Igx2SA1D3yXRL5hPgvTJXa9QC8CBMGU=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jU7rR-005C3D-9O
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Apr 2020 12:00:15 +0000
Received: by mail-yb1-f202.google.com with SMTP id l187so7425634ybf.17
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Apr 2020 05:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=I8onJV2et/QJa7Xt8X+bnOCFVQme3CitidTmpyIUJDg=;
 b=f4TGfvis+hhSPZXscyvm3XBx8s46eH7eqq2GPAFhD2dj3prBgwYAEZ7MEsvag90kDb
 ydSX8/UTyMS4PmDY4VcIYEhSzDC7/oz55wPnO1Fn96iPTSK/2LNBF86g5BUnZVwXNlzs
 jPLWPxWPxAsTglGXjt23soEYKbLF6+N1OmQoVtbeJ7y/pDqWHW/Hhz09+3tATDHIGowS
 HIsLIKGf0A2SFbCcxumMgi0C2CeBG7j1Kyp9C4XOT8tPH6bdOXxxSl9YMD3HQNCCvoC2
 egA6zQK3je9pm+FzrqbdBzsgi4KLOXG6tCQ3do3brWNCAm8NSvHsEhTBRWA6b/Wkb5YY
 GdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=I8onJV2et/QJa7Xt8X+bnOCFVQme3CitidTmpyIUJDg=;
 b=Wozrn1KcyA/C3bK4Hq1KXPnLAxgGNk1u/8POaL3EKIZfapQuT6XCugzoUHHLMho+LA
 F4fgVmukVU60Qv/zGBOPpzG/9XwwC9jCzUoLDa0UnQH876kO7rKoO1C3AbyJvntfZCCD
 Ee5T/cS5mcTXrFp/29kUatfawrAb86VyUKQgVTa/Q7VvZEspYDke1ml9gpTQaEPLmEdG
 iz8rH7DohYk1UKWIv5OkK3wkaEfO6I+Dp5dCmBK+fR4KMY0/jlTWvfOrIu6nVA4uhZJf
 i4rLtVdA0SU+KTRQdXTkH95Ugh86bHvfF0Fwj+lF0uTLJfiQ/GpVvf/jg6OxM48mYdDl
 QgUA==
X-Gm-Message-State: AGi0PuaIj8zIfiSZdhdz1yn0PnaogXkcf9+f/iogaoErljsBpAD8TsDS
 g8PySihwHC6/DOl8nZWscZf2iWRGxhc=
X-Google-Smtp-Source: APiQypIOxR42SOK4MQOep4nmYj21zPMFnDdhwyb19F+MvuQkkTn8UmYZORJRXDWoIYU2iESxtNmpzsS97YA=
X-Received: by 2002:a25:1b07:: with SMTP id b7mr4869742ybb.351.1588248006249; 
 Thu, 30 Apr 2020 05:00:06 -0700 (PDT)
Date: Thu, 30 Apr 2020 11:59:50 +0000
In-Reply-To: <20200430115959.238073-1-satyat@google.com>
Message-Id: <20200430115959.238073-4-satyat@google.com>
Mime-Version: 1.0
References: <20200430115959.238073-1-satyat@google.com>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
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
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jU7rR-005C3D-9O
Subject: [f2fs-dev] [PATCH v12 03/12] block: Inline encryption support for
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
 block/bio.c                 |   6 +
 block/blk-core.c            |  21 +-
 block/blk-crypto-internal.h | 166 ++++++++++++++++
 block/blk-crypto.c          | 373 ++++++++++++++++++++++++++++++++++++
 block/blk-map.c             |   1 +
 block/blk-merge.c           |  11 ++
 block/blk-mq.c              |  14 ++
 block/blk.h                 |   2 +
 block/bounce.c              |   2 +
 drivers/md/dm.c             |   3 +
 include/linux/blk-crypto.h  |  71 +++++++
 include/linux/blk_types.h   |   6 +
 include/linux/blkdev.h      |   5 +
 14 files changed, 678 insertions(+), 5 deletions(-)
 create mode 100644 block/blk-crypto-internal.h
 create mode 100644 block/blk-crypto.c

diff --git a/block/Makefile b/block/Makefile
index fc963e4676b0a..3ee88d3e807d2 100644
--- a/block/Makefile
+++ b/block/Makefile
@@ -36,4 +36,4 @@ obj-$(CONFIG_BLK_DEBUG_FS)	+= blk-mq-debugfs.o
 obj-$(CONFIG_BLK_DEBUG_FS_ZONED)+= blk-mq-debugfs-zoned.o
 obj-$(CONFIG_BLK_SED_OPAL)	+= sed-opal.o
 obj-$(CONFIG_BLK_PM)		+= blk-pm.o
-obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= keyslot-manager.o
+obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= keyslot-manager.o blk-crypto.o
diff --git a/block/bio.c b/block/bio.c
index 21cbaa6a1c20e..960303de1bb4a 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -18,6 +18,7 @@
 #include <linux/blk-cgroup.h>
 #include <linux/highmem.h>
 #include <linux/sched/sysctl.h>
+#include <linux/blk-crypto.h>
 
 #include <trace/events/block.h>
 #include "blk.h"
@@ -237,6 +238,8 @@ void bio_uninit(struct bio *bio)
 
 	if (bio_integrity(bio))
 		bio_integrity_free(bio);
+
+	bio_crypt_free_ctx(bio);
 }
 EXPORT_SYMBOL(bio_uninit);
 
@@ -708,6 +711,8 @@ struct bio *bio_clone_fast(struct bio *bio, gfp_t gfp_mask, struct bio_set *bs)
 
 	__bio_clone_fast(b, bio);
 
+	bio_crypt_clone(b, bio, gfp_mask);
+
 	if (bio_integrity(bio)) {
 		int ret;
 
@@ -1105,6 +1110,7 @@ void bio_advance(struct bio *bio, unsigned bytes)
 	if (bio_integrity(bio))
 		bio_integrity_advance(bio, bytes);
 
+	bio_crypt_advance(bio, bytes);
 	bio_advance_iter(bio, &bio->bi_iter, bytes);
 }
 EXPORT_SYMBOL(bio_advance);
diff --git a/block/blk-core.c b/block/blk-core.c
index 7e4a1da0715ea..77455973cbe03 100644
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
 
@@ -623,6 +625,8 @@ bool bio_attempt_back_merge(struct request *req, struct bio *bio,
 	req->biotail = bio;
 	req->__data_len += bio->bi_iter.bi_size;
 
+	bio_crypt_free_ctx(bio);
+
 	blk_account_io_start(req, false);
 	return true;
 }
@@ -647,6 +651,8 @@ bool bio_attempt_front_merge(struct request *req, struct bio *bio,
 	req->__sector = bio->bi_iter.bi_sector;
 	req->__data_len += bio->bi_iter.bi_size;
 
+	bio_crypt_attempt_front_merge(req, bio);
+
 	blk_account_io_start(req, false);
 	return true;
 }
@@ -1072,7 +1078,8 @@ blk_qc_t generic_make_request(struct bio *bio)
 			/* Create a fresh bio_list for all subordinate requests */
 			bio_list_on_stack[1] = bio_list_on_stack[0];
 			bio_list_init(&bio_list_on_stack[0]);
-			ret = q->make_request_fn(q, bio);
+			if (blk_crypto_bio_prep(&bio))
+				ret = q->make_request_fn(q, bio);
 
 			blk_queue_exit(q);
 
@@ -1120,7 +1127,7 @@ blk_qc_t direct_make_request(struct bio *bio)
 {
 	struct request_queue *q = bio->bi_disk->queue;
 	bool nowait = bio->bi_opf & REQ_NOWAIT;
-	blk_qc_t ret;
+	blk_qc_t ret = BLK_QC_T_NONE;
 
 	if (!generic_make_request_checks(bio))
 		return BLK_QC_T_NONE;
@@ -1132,8 +1139,8 @@ blk_qc_t direct_make_request(struct bio *bio)
 			bio_io_error(bio);
 		return BLK_QC_T_NONE;
 	}
-
-	ret = q->make_request_fn(q, bio);
+	if (blk_crypto_bio_prep(&bio))
+		ret = q->make_request_fn(q, bio);
 	blk_queue_exit(q);
 	return ret;
 }
@@ -1263,6 +1270,9 @@ blk_status_t blk_insert_cloned_request(struct request_queue *q, struct request *
 	    should_fail_request(&rq->rq_disk->part0, blk_rq_bytes(rq)))
 		return BLK_STS_IOERR;
 
+	if (blk_crypto_insert_cloned_request(rq))
+		return BLK_STS_IOERR;
+
 	if (blk_queue_io_stat(q))
 		blk_account_io_start(rq, true);
 
@@ -1640,6 +1650,9 @@ int blk_rq_prep_clone(struct request *rq, struct request *rq_src,
 	rq->ioprio = rq_src->ioprio;
 	rq->extra_len = rq_src->extra_len;
 
+	if (rq->bio)
+		blk_crypto_rq_bio_prep(rq, rq->bio, gfp_mask);
+
 	return 0;
 
 free_and_out:
diff --git a/block/blk-crypto-internal.h b/block/blk-crypto-internal.h
new file mode 100644
index 0000000000000..3ef0f7495be69
--- /dev/null
+++ b/block/blk-crypto-internal.h
@@ -0,0 +1,166 @@
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
+	unsigned int keysize; /* key size in bytes */
+	unsigned int ivsize; /* iv size in bytes */
+};
+
+#ifdef CONFIG_BLK_INLINE_ENCRYPTION
+
+void bio_crypt_dun_increment(u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE],
+			     unsigned int inc);
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
+#else /* CONFIG_BLK_INLINE_ENCRYPTION */
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
+static inline void blk_crypto_rq_set_defaults(struct request *rq) { }
+
+static inline bool blk_crypto_rq_is_encrypted(struct request *rq)
+{
+	return false;
+}
+
+#endif /* CONFIG_BLK_INLINE_ENCRYPTION */
+
+void __bio_crypt_advance(struct bio *bio, unsigned int bytes);
+static inline void bio_crypt_advance(struct bio *bio, unsigned int bytes)
+{
+	if (bio_has_crypt_ctx(bio))
+		__bio_crypt_advance(bio, bytes);
+}
+
+void __bio_crypt_free_ctx(struct bio *bio);
+static inline void bio_crypt_free_ctx(struct bio *bio)
+{
+	if (bio_has_crypt_ctx(bio))
+		__bio_crypt_free_ctx(bio);
+}
+
+static inline void bio_crypt_attempt_front_merge(struct request *rq,
+						 struct bio *bio)
+{
+#ifdef CONFIG_BLK_INLINE_ENCRYPTION
+	if (bio_has_crypt_ctx(bio))
+		memcpy(rq->crypt_ctx->bc_dun, bio->bi_crypt_context->bc_dun,
+		       sizeof(rq->crypt_ctx->bc_dun));
+#endif
+}
+
+bool __blk_crypto_bio_prep(struct bio **bio_ptr);
+static inline bool blk_crypto_bio_prep(struct bio **bio_ptr)
+{
+	if (bio_has_crypt_ctx(*bio_ptr))
+		return __blk_crypto_bio_prep(bio_ptr);
+	return true;
+}
+
+blk_status_t __blk_crypto_init_request(struct request *rq);
+static inline blk_status_t blk_crypto_init_request(struct request *rq)
+{
+	if (blk_crypto_rq_is_encrypted(rq))
+		return __blk_crypto_init_request(rq);
+	return BLK_STS_OK;
+}
+
+void __blk_crypto_free_request(struct request *rq);
+static inline void blk_crypto_free_request(struct request *rq)
+{
+	if (blk_crypto_rq_is_encrypted(rq))
+		__blk_crypto_free_request(rq);
+}
+
+void __blk_crypto_rq_bio_prep(struct request *rq, struct bio *bio,
+			      gfp_t gfp_mask);
+static inline void blk_crypto_rq_bio_prep(struct request *rq, struct bio *bio,
+					  gfp_t gfp_mask)
+{
+	if (bio_has_crypt_ctx(bio))
+		__blk_crypto_rq_bio_prep(rq, bio, gfp_mask);
+}
+
+/**
+ * blk_crypto_insert_cloned_request - Prepare a cloned request to be inserted
+ *				      into a request queue.
+ * @rq: the request being queued
+ *
+ * Return: BLK_STS_OK on success, nonzero on error.
+ */
+static inline blk_status_t blk_crypto_insert_cloned_request(struct request *rq)
+{
+
+	if (blk_crypto_rq_is_encrypted(rq))
+		return blk_crypto_init_request(rq);
+	return BLK_STS_OK;
+}
+
+#endif /* __LINUX_BLK_CRYPTO_INTERNAL_H */
diff --git a/block/blk-crypto.c b/block/blk-crypto.c
new file mode 100644
index 0000000000000..0dfca2d47957e
--- /dev/null
+++ b/block/blk-crypto.c
@@ -0,0 +1,373 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2019 Google LLC
+ */
+
+/*
+ * Refer to Documentation/block/inline-encryption.rst for detailed explanation.
+ */
+
+#define pr_fmt(fmt) "blk-crypto: " fmt
+
+#include <linux/bio.h>
+#include <linux/blkdev.h>
+#include <linux/keyslot-manager.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+
+#include "blk-crypto-internal.h"
+
+const struct blk_crypto_mode blk_crypto_modes[] = {
+	[BLK_ENCRYPTION_MODE_AES_256_XTS] = {
+		.keysize = 64,
+		.ivsize = 16,
+	},
+	[BLK_ENCRYPTION_MODE_AES_128_CBC_ESSIV] = {
+		.keysize = 16,
+		.ivsize = 16,
+	},
+	[BLK_ENCRYPTION_MODE_ADIANTUM] = {
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
+static int __init bio_crypt_ctx_init(void)
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
+	return 0;
+out_no_mem:
+	panic("Failed to allocate mem for bio crypt ctxs\n");
+}
+subsys_initcall(bio_crypt_ctx_init);
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
+void __bio_crypt_free_ctx(struct bio *bio)
+{
+	mempool_free(bio->bi_crypt_context, bio_crypt_ctx_pool);
+	bio->bi_crypt_context = NULL;
+}
+
+void __bio_crypt_clone(struct bio *dst, struct bio *src, gfp_t gfp_mask)
+{
+	dst->bi_crypt_context = mempool_alloc(bio_crypt_ctx_pool, gfp_mask);
+	*dst->bi_crypt_context = *src->bi_crypt_context;
+}
+EXPORT_SYMBOL_GPL(__bio_crypt_clone);
+
+/* Increments @dun by @inc, treating @dun as a multi-limb integer. */
+void bio_crypt_dun_increment(u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE],
+			     unsigned int inc)
+{
+	int i;
+
+	for (i = 0; inc && i < BLK_CRYPTO_DUN_ARRAY_SIZE; i++) {
+		dun[i] += inc;
+		/*
+		 * If the addition in this limb overflowed, then we need to
+		 * carry 1 into the next limb. Else the carry is 0.
+		 */
+		if (dun[i] < inc)
+			inc = 1;
+		else
+			inc = 0;
+	}
+}
+
+void __bio_crypt_advance(struct bio *bio, unsigned int bytes)
+{
+	struct bio_crypt_ctx *bc = bio->bi_crypt_context;
+
+	bio_crypt_dun_increment(bc->bc_dun,
+				bytes >> bc->bc_key->data_unit_size_bits);
+}
+
+/*
+ * Returns true if @bc->bc_dun plus @bytes converted to data units is equal to
+ * @next_dun, treating the DUNs as multi-limb integers.
+ */
+bool bio_crypt_dun_is_contiguous(const struct bio_crypt_ctx *bc,
+				 unsigned int bytes,
+				 const u64 next_dun[BLK_CRYPTO_DUN_ARRAY_SIZE])
+{
+	int i;
+	unsigned int carry = bytes >> bc->bc_key->data_unit_size_bits;
+
+	for (i = 0; i < BLK_CRYPTO_DUN_ARRAY_SIZE; i++) {
+		if (bc->bc_dun[i] + carry != next_dun[i])
+			return false;
+		/*
+		 * If the addition in this limb overflowed, then we need to
+		 * carry 1 into the next limb. Else the carry is 0.
+		 */
+		if ((bc->bc_dun[i] + carry) < carry)
+			carry = 1;
+		else
+			carry = 0;
+	}
+
+	/* If the DUN wrapped through 0, don't treat it as contiguous. */
+	return carry == 0;
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
+ * in the order @bc1 followed by @bc2.
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
+/* Check that all I/O segments are data unit aligned. */
+static bool bio_crypt_check_alignment(struct bio *bio)
+{
+	const unsigned int data_unit_size =
+		bio->bi_crypt_context->bc_key->crypto_cfg.data_unit_size;
+	struct bvec_iter iter;
+	struct bio_vec bv;
+
+	bio_for_each_segment(bv, bio, iter) {
+		if (!IS_ALIGNED(bv.bv_len | bv.bv_offset, data_unit_size))
+			return false;
+	}
+
+	return true;
+}
+
+blk_status_t __blk_crypto_init_request(struct request *rq)
+{
+	return blk_ksm_get_slot_for_key(rq->q->ksm, rq->crypt_ctx->bc_key,
+					&rq->crypt_keyslot);
+}
+
+/**
+ * __blk_crypto_free_request - Uninitialize the crypto fields of a request.
+ *
+ * @rq: The request whose crypto fields to uninitialize.
+ *
+ * Completely uninitializes the crypto fields of a request. If a keyslot has
+ * been programmed into some inline encryption hardware, that keyslot is
+ * released. The rq->crypt_ctx is also freed.
+ */
+void __blk_crypto_free_request(struct request *rq)
+{
+	blk_ksm_put_slot(rq->crypt_keyslot);
+	mempool_free(rq->crypt_ctx, bio_crypt_ctx_pool);
+	blk_crypto_rq_set_defaults(rq);
+}
+
+/**
+ * __blk_crypto_bio_prep - Prepare bio for inline encryption
+ *
+ * @bio_ptr: pointer to original bio pointer
+ *
+ * Succeeds if the bio doesn't have inline encryption enabled or if the bio
+ * crypt context provided for the bio is supported by the underlying device's
+ * inline encryption hardware. Ends the bio with error otherwise.
+ *
+ * Caller must ensure bio has bio_crypt_ctx.
+ *
+ * Return: true on success; false on error (and bio->bi_status will be set
+ *	   appropriately, and bio_endio() will have been called so bio
+ *	   submission should abort).
+ */
+bool __blk_crypto_bio_prep(struct bio **bio_ptr)
+{
+	struct bio *bio = *bio_ptr;
+	const struct blk_crypto_key *bc_key = bio->bi_crypt_context->bc_key;
+	blk_status_t blk_st = BLK_STS_IOERR;
+
+	/* Error if bio has no data. */
+	if (WARN_ON_ONCE(!bio_has_data(bio)))
+		goto fail;
+
+	if (!bio_crypt_check_alignment(bio))
+		goto fail;
+
+	/*
+	 * Success if device supports the encryption context.
+	 */
+	if (!blk_ksm_crypto_cfg_supported(bio->bi_disk->queue->ksm,
+					  &bc_key->crypto_cfg)) {
+		blk_st = BLK_STS_NOTSUPP;
+		goto fail;
+	}
+
+	return true;
+fail:
+	(*bio_ptr)->bi_status = blk_st;
+	bio_endio(*bio_ptr);
+	return false;
+}
+
+/**
+ * __blk_crypto_rq_bio_prep - Prepare a request's crypt_ctx when its first bio
+ *			      is inserted
+ *
+ * @rq: The request to prepare
+ * @bio: The first bio being inserted into the request
+ * @gfp_mask: gfp mask
+ */
+void __blk_crypto_rq_bio_prep(struct request *rq, struct bio *bio,
+			      gfp_t gfp_mask)
+{
+	if (!rq->crypt_ctx)
+		rq->crypt_ctx = mempool_alloc(bio_crypt_ctx_pool, gfp_mask);
+	*rq->crypt_ctx = *bio->bi_crypt_context;
+}
+
+/**
+ * blk_crypto_init_key() - Prepare a key for use with blk-crypto
+ * @blk_key: Pointer to the blk_crypto_key to initialize.
+ * @raw_key: Pointer to the raw key. Must be the correct length for the chosen
+ *	     @crypto_mode; see blk_crypto_modes[].
+ * @crypto_mode: identifier for the encryption algorithm to use
+ * @dun_bytes: number of bytes that will be used to specify the DUN when this
+ *	       key is used
+ * @data_unit_size: the data unit size to use for en/decryption
+ *
+ * Return: 0 on success, -errno on failure.  The caller is responsible for
+ *	   zeroizing both blk_key and raw_key when done with them.
+ */
+int blk_crypto_init_key(struct blk_crypto_key *blk_key, const u8 *raw_key,
+			enum blk_crypto_mode_num crypto_mode,
+			unsigned int dun_bytes,
+			unsigned int data_unit_size)
+{
+	const struct blk_crypto_mode *mode;
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
+	blk_key->crypto_cfg.crypto_mode = crypto_mode;
+	blk_key->crypto_cfg.dun_bytes = dun_bytes;
+	blk_key->crypto_cfg.data_unit_size = data_unit_size;
+	blk_key->data_unit_size_bits = ilog2(data_unit_size);
+	blk_key->size = mode->keysize;
+	memcpy(blk_key->raw, raw_key, mode->keysize);
+
+	return 0;
+}
+
+bool blk_crypto_config_supported(struct request_queue *q,
+				 const struct blk_crypto_config *cfg)
+{
+	return blk_ksm_crypto_cfg_supported(q->ksm, cfg);
+}
+
+/**
+ * blk_crypto_start_using_key() - Start using a blk_crypto_key on a device
+ * @key: A key to use on the device
+ * @q: the request queue for the device
+ *
+ * Upper layers must call this function to ensure that the hardware supports
+ * the key's crypto settings.
+ *
+ * Return: 0 on success; -ENOPKG if the hardware doesn't support the key
+ */
+int blk_crypto_start_using_key(const struct blk_crypto_key *key,
+			       struct request_queue *q)
+{
+	if (blk_ksm_crypto_cfg_supported(q->ksm, &key->crypto_cfg))
+		return 0;
+	return -ENOPKG;
+}
+
+/**
+ * blk_crypto_evict_key() - Evict a key from any inline encryption hardware
+ *			    it may have been programmed into
+ * @q: The request queue who's associated inline encryption hardware this key
+ *     might have been programmed into
+ * @key: The key to evict
+ *
+ * Upper layers (filesystems) must call this function to ensure that a key is
+ * evicted from any hardware that it might have been programmed into.  The key
+ * must not be in use by any in-flight IO when this function is called.
+ *
+ * Return: 0 on success or if key is not present in the q's ksm, -err on error.
+ */
+int blk_crypto_evict_key(struct request_queue *q,
+			 const struct blk_crypto_key *key)
+{
+	if (blk_ksm_crypto_cfg_supported(q->ksm, &key->crypto_cfg))
+		return blk_ksm_evict_key(q->ksm, key);
+
+	return 0;
+}
diff --git a/block/blk-map.c b/block/blk-map.c
index b72c361911a48..92e23e5ff2458 100644
--- a/block/blk-map.c
+++ b/block/blk-map.c
@@ -549,6 +549,7 @@ int blk_rq_append_bio(struct request *rq, struct bio **bio)
 		rq->biotail->bi_next = *bio;
 		rq->biotail = *bio;
 		rq->__data_len += (*bio)->bi_iter.bi_size;
+		bio_crypt_free_ctx(*bio);
 	}
 
 	return 0;
diff --git a/block/blk-merge.c b/block/blk-merge.c
index 1534ed736363f..a0c24b6e0eb3e 100644
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
index a7785df2c9446..d7b5f338b2a95 100644
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
@@ -474,6 +476,7 @@ static void __blk_mq_free_request(struct request *rq)
 	struct blk_mq_hw_ctx *hctx = rq->mq_hctx;
 	const int sched_tag = rq->internal_tag;
 
+	blk_crypto_free_request(rq);
 	blk_pm_mark_last_busy(rq);
 	rq->mq_hctx = NULL;
 	if (rq->tag != -1)
@@ -1782,6 +1785,7 @@ static void blk_mq_bio_to_request(struct request *rq, struct bio *bio,
 	rq->__sector = bio->bi_iter.bi_sector;
 	rq->write_hint = bio->bi_write_hint;
 	blk_rq_bio_prep(rq, bio, nr_segs);
+	blk_crypto_rq_bio_prep(rq, bio, GFP_NOIO);
 
 	blk_account_io_start(rq, true);
 }
@@ -1983,6 +1987,7 @@ static blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio)
 	struct request *same_queue_rq = NULL;
 	unsigned int nr_segs;
 	blk_qc_t cookie;
+	blk_status_t ret;
 
 	blk_queue_bounce(q, &bio);
 	__blk_queue_split(q, &bio, &nr_segs);
@@ -2016,6 +2021,15 @@ static blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio)
 
 	blk_mq_bio_to_request(rq, bio, nr_segs);
 
+	ret = blk_crypto_init_request(rq);
+	if (ret != BLK_STS_OK) {
+		bio->bi_status = ret;
+		bio_endio(bio);
+		blk_mq_free_request(rq);
+		return BLK_QC_T_NONE;
+	}
+
+
 	plug = blk_mq_plug(q, bio);
 	if (unlikely(is_flush_fua)) {
 		/* Bypass scheduler for flush requests */
diff --git a/block/blk.h b/block/blk.h
index 0a94ec68af32b..1f524ae216017 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -5,7 +5,9 @@
 #include <linux/idr.h>
 #include <linux/blk-mq.h>
 #include <linux/part_stat.h>
+#include <linux/blk-crypto.h>
 #include <xen/xen.h>
+#include "blk-crypto-internal.h"
 #include "blk-mq.h"
 #include "blk-mq-sched.h"
 
diff --git a/block/bounce.c b/block/bounce.c
index f8ed677a1bf7e..c3aaed0701246 100644
--- a/block/bounce.c
+++ b/block/bounce.c
@@ -267,6 +267,8 @@ static struct bio *bounce_clone_bio(struct bio *bio_src, gfp_t gfp_mask,
 		break;
 	}
 
+	bio_crypt_clone(bio, bio_src, gfp_mask);
+
 	if (bio_integrity(bio_src)) {
 		int ret;
 
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index db9e461146531..761c9e4fe5621 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -26,6 +26,7 @@
 #include <linux/pr.h>
 #include <linux/refcount.h>
 #include <linux/part_stat.h>
+#include <linux/blk-crypto.h>
 
 #define DM_MSG_PREFIX "core"
 
@@ -1334,6 +1335,8 @@ static int clone_bio(struct dm_target_io *tio, struct bio *bio,
 
 	__bio_clone_fast(clone, bio);
 
+	bio_crypt_clone(clone, bio, GFP_NOIO);
+
 	if (bio_integrity(bio)) {
 		int r;
 
diff --git a/include/linux/blk-crypto.h b/include/linux/blk-crypto.h
index 570fdd251e032..af4807a493ca8 100644
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
@@ -48,4 +50,73 @@ struct blk_crypto_key {
 	u8 raw[BLK_CRYPTO_MAX_KEY_SIZE];
 };
 
+#define BLK_CRYPTO_MAX_IV_SIZE		32
+#define BLK_CRYPTO_DUN_ARRAY_SIZE	(BLK_CRYPTO_MAX_IV_SIZE / sizeof(u64))
+
+/**
+ * struct bio_crypt_ctx - an inline encryption context
+ * @bc_key: the key, algorithm, and data unit size to use
+ * @bc_dun: the data unit number (starting IV) to use
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
+#include <linux/blk_types.h>
+#include <linux/blkdev.h>
+
+struct request;
+struct request_queue;
+
+#ifdef CONFIG_BLK_INLINE_ENCRYPTION
+
+static inline bool bio_has_crypt_ctx(struct bio *bio)
+{
+	return bio->bi_crypt_context;
+}
+
+void bio_crypt_set_ctx(struct bio *bio, const struct blk_crypto_key *key,
+		       const u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE],
+		       gfp_t gfp_mask);
+
+bool bio_crypt_dun_is_contiguous(const struct bio_crypt_ctx *bc,
+				 unsigned int bytes,
+				 const u64 next_dun[BLK_CRYPTO_DUN_ARRAY_SIZE]);
+
+int blk_crypto_init_key(struct blk_crypto_key *blk_key, const u8 *raw_key,
+			enum blk_crypto_mode_num crypto_mode,
+			unsigned int dun_bytes,
+			unsigned int data_unit_size);
+
+int blk_crypto_start_using_key(const struct blk_crypto_key *key,
+			       struct request_queue *q);
+
+int blk_crypto_evict_key(struct request_queue *q,
+			 const struct blk_crypto_key *key);
+
+bool blk_crypto_config_supported(struct request_queue *q,
+				 const struct blk_crypto_config *cfg);
+
+#else /* CONFIG_BLK_INLINE_ENCRYPTION */
+
+static inline bool bio_has_crypt_ctx(struct bio *bio)
+{
+	return false;
+}
+
+#endif /* CONFIG_BLK_INLINE_ENCRYPTION */
+
+void __bio_crypt_clone(struct bio *dst, struct bio *src, gfp_t gfp_mask);
+static inline void bio_crypt_clone(struct bio *dst, struct bio *src,
+				   gfp_t gfp_mask)
+{
+	if (bio_has_crypt_ctx(src))
+		__bio_crypt_clone(dst, src, gfp_mask);
+}
+
 #endif /* __LINUX_BLK_CRYPTO_H */
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 31eb92876be7c..d0a84b8b4c6d6 100644
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
index 7b36695f71931..98aae4638fda9 100644
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
2.26.2.303.gf8c07b1a785-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
