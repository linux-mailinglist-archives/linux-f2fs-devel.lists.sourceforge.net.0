Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B80F31D2408
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 May 2020 02:44:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7GJd4hOwWfvpV45AR/fpKIW06kKrI1AbDsY35/rokeo=; b=P7vvOpk0lDI/rlUfQWYHX/Frt
	KEpKohkU2KoqEmGq93Eur5o+i0w/YBl6hN/mEcaagJXlHsn2sgeGcLmZTAoWyGMxuzew7YXQs9tOq
	CLr5muxDFM6O/0Q9qP2K4fEABYGk2qsJ9q2FjXiC92Ml56H1xBweHlOF8gNRDK68nXTVk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jZ1yx-00078q-Ct; Thu, 14 May 2020 00:44:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <31pK8XgYKAOkdLejLeRZZRWP.NZX@flex--satyat.bounces.google.com>)
 id 1jZ1yv-00078d-W6
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 May 2020 00:44:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hoe9yNjdemIkHX/JnX9HanbBzm6UmCJUTe+5iOCF++0=; b=iCgDG/0ZnHmoSTwjiS5e91f5z
 k5AQ4YC/UqMFL4DPIU6S/+I0xMSqTZlet4Hta4KAYT7V0E90CmM4T+rx16Q1P0uc+4xQd/yLqCtoR
 aEyxkIqLcmABYg+MiT/CgRW7GfdJj+N5XhTXwDyCheo3s6aBFDY7yIRkeRF6hRLSjRzvo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hoe9yNjdemIkHX/JnX9HanbBzm6UmCJUTe+5iOCF++0=; b=XXqhQS2Lxk22EZCDiAJGCXdBYm
 xJGBeh9ID6PMqFybn1LMNvJ0UzFRNg8yVMVcbjSqxS4+jq9ZPZwOWFb0vH4L+SNDJfbOSIjJaKROS
 GCjwb00ArB2y9QBqD7XdFB+JoG/PjHxEiO1mTmbijfQzUSEWxLEI4k1BeaEMqggcHhBY=;
Received: from mail-pg1-f201.google.com ([209.85.215.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jZ1yt-00EdWD-LS
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 May 2020 00:44:13 +0000
Received: by mail-pg1-f201.google.com with SMTP id b131so1059216pga.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 13 May 2020 17:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=hoe9yNjdemIkHX/JnX9HanbBzm6UmCJUTe+5iOCF++0=;
 b=Kwd8p+WUW0JDzjduo1RrwBh3ewsAGr0rsM25+aHHjLJgF3u2lL3j4x4Gyr/iR2D672
 650pO6bPZrHRq59VM0wFT1TvrDxOZ/03Fz2nsD7B4d46c6dfYQgnPnN6HuApZCyWzGYQ
 +qXo1X4xMatCnk82rbJQsJ8b6ZW8vLZq8tgNiGCJR0HWmpKAmEPPLMrO9pRlBZ44q3qf
 BHb6OJ1P0E0WatPjMjJ9y01oJiUGiMjKoYMAmkInEjqzAZQiUXHP1jOi3YdNMrOexNAP
 /qIQEg02sgLnntmy1VozxYcE8qx5EZByWqcT90hsxXsyjK/MnlrUGdRbZf99a4/HfqbP
 x3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=hoe9yNjdemIkHX/JnX9HanbBzm6UmCJUTe+5iOCF++0=;
 b=JHDgxWMiaMX2oWfL/F6y/2AilSd4CanMx6mr3nD1UixVvX+6xkvyl/wsbTqG93m4BO
 eKdiYjBDJCnkdfYWcSF6/b370IMJtNh91kBwSpF6/D0gOmrP2ovO599+KuGLFB9zqEMj
 P+Mq4RuluU2edIrcnjIKUK1D7iJ/f8eGVj7vC9shg2e2VButi4yyzOExxrQeiSbjiCOY
 6tzxZKBnjUpdYt8Rxvx7RRESd8ey1ub915bObRQphPdM08zvkwQCDQB4wYUMHlInk8HW
 pilOQxsuvA7reDJj7X3gMD+zbnB9/lPTs2oeqN4Hm8ImA8rqrEfoC32k43Ik5cQfp4AN
 q/HQ==
X-Gm-Message-State: AOAM5329P6MRJjWlo93tVEB4jVGcP1BD8a8RWfuMzBMSsFDJd0ZrsTjW
 7/7JpkjCFuNcyBkNcr0O81OWXymBHJY=
X-Google-Smtp-Source: ABdhPJxbXJyuKE8AYCX+iMS7iXS/V25L1pDjJfoSQWtdrT32ey2A/HDRjP7ksOcqHt+duQfIZJdvl92tdYQ=
X-Received: by 2002:ad4:434a:: with SMTP id q10mr2355296qvs.81.1589416662762; 
 Wed, 13 May 2020 17:37:42 -0700 (PDT)
Date: Thu, 14 May 2020 00:37:20 +0000
In-Reply-To: <20200514003727.69001-1-satyat@google.com>
Message-Id: <20200514003727.69001-6-satyat@google.com>
Mime-Version: 1.0
References: <20200514003727.69001-1-satyat@google.com>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.201 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.201 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jZ1yt-00EdWD-LS
Subject: [f2fs-dev] [PATCH v13 05/12] block: blk-crypto-fallback for Inline
 Encryption
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
 Eric Biggers <ebiggers@google.com>, Kim Boojin <boojin.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Blk-crypto delegates crypto operations to inline encryption hardware
when available. The separately configurable blk-crypto-fallback contains
a software fallback to the kernel crypto API - when enabled, blk-crypto
will use this fallback for en/decryption when inline encryption hardware
is not available.

This lets upper layers not have to worry about whether or not the
underlying device has support for inline encryption before deciding to
specify an encryption context for a bio. It also allows for testing
without actual inline encryption hardware - in particular, it makes it
possible to test the inline encryption code in ext4 and f2fs simply by
running xfstests with the inlinecrypt mount option, which in turn allows
for things like the regular upstream regression testing of ext4 to cover
the inline encryption code paths.

For more details, refer to Documentation/block/inline-encryption.rst.

Signed-off-by: Satya Tangirala <satyat@google.com>
Reviewed-by: Eric Biggers <ebiggers@google.com>
---
 block/Kconfig               |  10 +
 block/Makefile              |   1 +
 block/blk-crypto-fallback.c | 657 ++++++++++++++++++++++++++++++++++++
 block/blk-crypto-internal.h |  35 ++
 block/blk-crypto.c          |  68 ++--
 include/linux/blk-crypto.h  |   2 +-
 6 files changed, 752 insertions(+), 21 deletions(-)
 create mode 100644 block/blk-crypto-fallback.c

diff --git a/block/Kconfig b/block/Kconfig
index f8870c316a038..9382a4acefc39 100644
--- a/block/Kconfig
+++ b/block/Kconfig
@@ -193,6 +193,16 @@ config BLK_INLINE_ENCRYPTION
 	  block layer handle encryption, so users can take
 	  advantage of inline encryption hardware if present.
 
+config BLK_INLINE_ENCRYPTION_FALLBACK
+	bool "Enable crypto API fallback for blk-crypto"
+	depends on BLK_INLINE_ENCRYPTION
+	select CRYPTO
+	select CRYPTO_SKCIPHER
+	help
+	  Enabling this lets the block layer handle inline encryption
+	  by falling back to the kernel crypto API when inline
+	  encryption hardware is not present.
+
 menu "Partition Types"
 
 source "block/partitions/Kconfig"
diff --git a/block/Makefile b/block/Makefile
index 3ee88d3e807d2..78719169fb2af 100644
--- a/block/Makefile
+++ b/block/Makefile
@@ -37,3 +37,4 @@ obj-$(CONFIG_BLK_DEBUG_FS_ZONED)+= blk-mq-debugfs-zoned.o
 obj-$(CONFIG_BLK_SED_OPAL)	+= sed-opal.o
 obj-$(CONFIG_BLK_PM)		+= blk-pm.o
 obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= keyslot-manager.o blk-crypto.o
+obj-$(CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK)	+= blk-crypto-fallback.o
diff --git a/block/blk-crypto-fallback.c b/block/blk-crypto-fallback.c
new file mode 100644
index 0000000000000..74ab137ae3baa
--- /dev/null
+++ b/block/blk-crypto-fallback.c
@@ -0,0 +1,657 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2019 Google LLC
+ */
+
+/*
+ * Refer to Documentation/block/inline-encryption.rst for detailed explanation.
+ */
+
+#define pr_fmt(fmt) "blk-crypto-fallback: " fmt
+
+#include <crypto/skcipher.h>
+#include <linux/blk-cgroup.h>
+#include <linux/blk-crypto.h>
+#include <linux/blkdev.h>
+#include <linux/crypto.h>
+#include <linux/keyslot-manager.h>
+#include <linux/mempool.h>
+#include <linux/module.h>
+#include <linux/random.h>
+
+#include "blk-crypto-internal.h"
+
+static unsigned int num_prealloc_bounce_pg = 32;
+module_param(num_prealloc_bounce_pg, uint, 0);
+MODULE_PARM_DESC(num_prealloc_bounce_pg,
+		 "Number of preallocated bounce pages for the blk-crypto crypto API fallback");
+
+static unsigned int blk_crypto_num_keyslots = 100;
+module_param_named(num_keyslots, blk_crypto_num_keyslots, uint, 0);
+MODULE_PARM_DESC(num_keyslots,
+		 "Number of keyslots for the blk-crypto crypto API fallback");
+
+static unsigned int num_prealloc_fallback_crypt_ctxs = 128;
+module_param(num_prealloc_fallback_crypt_ctxs, uint, 0);
+MODULE_PARM_DESC(num_prealloc_crypt_fallback_ctxs,
+		 "Number of preallocated bio fallback crypto contexts for blk-crypto to use during crypto API fallback");
+
+struct bio_fallback_crypt_ctx {
+	struct bio_crypt_ctx crypt_ctx;
+	/*
+	 * Copy of the bvec_iter when this bio was submitted.
+	 * We only want to en/decrypt the part of the bio as described by the
+	 * bvec_iter upon submission because bio might be split before being
+	 * resubmitted
+	 */
+	struct bvec_iter crypt_iter;
+	union {
+		struct {
+			struct work_struct work;
+			struct bio *bio;
+		};
+		struct {
+			void *bi_private_orig;
+			bio_end_io_t *bi_end_io_orig;
+		};
+	};
+};
+
+static struct kmem_cache *bio_fallback_crypt_ctx_cache;
+static mempool_t *bio_fallback_crypt_ctx_pool;
+
+/*
+ * Allocating a crypto tfm during I/O can deadlock, so we have to preallocate
+ * all of a mode's tfms when that mode starts being used. Since each mode may
+ * need all the keyslots at some point, each mode needs its own tfm for each
+ * keyslot; thus, a keyslot may contain tfms for multiple modes.  However, to
+ * match the behavior of real inline encryption hardware (which only supports a
+ * single encryption context per keyslot), we only allow one tfm per keyslot to
+ * be used at a time - the rest of the unused tfms have their keys cleared.
+ */
+static DEFINE_MUTEX(tfms_init_lock);
+static bool tfms_inited[BLK_ENCRYPTION_MODE_MAX];
+
+static struct blk_crypto_keyslot {
+	enum blk_crypto_mode_num crypto_mode;
+	struct crypto_skcipher *tfms[BLK_ENCRYPTION_MODE_MAX];
+} *blk_crypto_keyslots;
+
+static struct blk_keyslot_manager blk_crypto_ksm;
+static struct workqueue_struct *blk_crypto_wq;
+static mempool_t *blk_crypto_bounce_page_pool;
+
+/*
+ * This is the key we set when evicting a keyslot. This *should* be the all 0's
+ * key, but AES-XTS rejects that key, so we use some random bytes instead.
+ */
+static u8 blank_key[BLK_CRYPTO_MAX_KEY_SIZE];
+
+static void blk_crypto_evict_keyslot(unsigned int slot)
+{
+	struct blk_crypto_keyslot *slotp = &blk_crypto_keyslots[slot];
+	enum blk_crypto_mode_num crypto_mode = slotp->crypto_mode;
+	int err;
+
+	WARN_ON(slotp->crypto_mode == BLK_ENCRYPTION_MODE_INVALID);
+
+	/* Clear the key in the skcipher */
+	err = crypto_skcipher_setkey(slotp->tfms[crypto_mode], blank_key,
+				     blk_crypto_modes[crypto_mode].keysize);
+	WARN_ON(err);
+	slotp->crypto_mode = BLK_ENCRYPTION_MODE_INVALID;
+}
+
+static int blk_crypto_keyslot_program(struct blk_keyslot_manager *ksm,
+				      const struct blk_crypto_key *key,
+				      unsigned int slot)
+{
+	struct blk_crypto_keyslot *slotp = &blk_crypto_keyslots[slot];
+	const enum blk_crypto_mode_num crypto_mode =
+						key->crypto_cfg.crypto_mode;
+	int err;
+
+	if (crypto_mode != slotp->crypto_mode &&
+	    slotp->crypto_mode != BLK_ENCRYPTION_MODE_INVALID)
+		blk_crypto_evict_keyslot(slot);
+
+	slotp->crypto_mode = crypto_mode;
+	err = crypto_skcipher_setkey(slotp->tfms[crypto_mode], key->raw,
+				     key->size);
+	if (err) {
+		blk_crypto_evict_keyslot(slot);
+		return err;
+	}
+	return 0;
+}
+
+static int blk_crypto_keyslot_evict(struct blk_keyslot_manager *ksm,
+				    const struct blk_crypto_key *key,
+				    unsigned int slot)
+{
+	blk_crypto_evict_keyslot(slot);
+	return 0;
+}
+
+/*
+ * The crypto API fallback KSM ops - only used for a bio when it specifies a
+ * blk_crypto_key that was not supported by the device's inline encryption
+ * hardware.
+ */
+static const struct blk_ksm_ll_ops blk_crypto_ksm_ll_ops = {
+	.keyslot_program	= blk_crypto_keyslot_program,
+	.keyslot_evict		= blk_crypto_keyslot_evict,
+};
+
+static void blk_crypto_fallback_encrypt_endio(struct bio *enc_bio)
+{
+	struct bio *src_bio = enc_bio->bi_private;
+	int i;
+
+	for (i = 0; i < enc_bio->bi_vcnt; i++)
+		mempool_free(enc_bio->bi_io_vec[i].bv_page,
+			     blk_crypto_bounce_page_pool);
+
+	src_bio->bi_status = enc_bio->bi_status;
+
+	bio_put(enc_bio);
+	bio_endio(src_bio);
+}
+
+static struct bio *blk_crypto_clone_bio(struct bio *bio_src)
+{
+	struct bvec_iter iter;
+	struct bio_vec bv;
+	struct bio *bio;
+
+	bio = bio_alloc_bioset(GFP_NOIO, bio_segments(bio_src), NULL);
+	if (!bio)
+		return NULL;
+	bio->bi_disk		= bio_src->bi_disk;
+	bio->bi_opf		= bio_src->bi_opf;
+	bio->bi_ioprio		= bio_src->bi_ioprio;
+	bio->bi_write_hint	= bio_src->bi_write_hint;
+	bio->bi_iter.bi_sector	= bio_src->bi_iter.bi_sector;
+	bio->bi_iter.bi_size	= bio_src->bi_iter.bi_size;
+
+	bio_for_each_segment(bv, bio_src, iter)
+		bio->bi_io_vec[bio->bi_vcnt++] = bv;
+
+	bio_clone_blkg_association(bio, bio_src);
+	blkcg_bio_issue_init(bio);
+
+	return bio;
+}
+
+static bool blk_crypto_alloc_cipher_req(struct blk_ksm_keyslot *slot,
+					struct skcipher_request **ciph_req_ret,
+					struct crypto_wait *wait)
+{
+	struct skcipher_request *ciph_req;
+	const struct blk_crypto_keyslot *slotp;
+	int keyslot_idx = blk_ksm_get_slot_idx(slot);
+
+	slotp = &blk_crypto_keyslots[keyslot_idx];
+	ciph_req = skcipher_request_alloc(slotp->tfms[slotp->crypto_mode],
+					  GFP_NOIO);
+	if (!ciph_req)
+		return false;
+
+	skcipher_request_set_callback(ciph_req,
+				      CRYPTO_TFM_REQ_MAY_BACKLOG |
+				      CRYPTO_TFM_REQ_MAY_SLEEP,
+				      crypto_req_done, wait);
+	*ciph_req_ret = ciph_req;
+
+	return true;
+}
+
+static bool blk_crypto_split_bio_if_needed(struct bio **bio_ptr)
+{
+	struct bio *bio = *bio_ptr;
+	unsigned int i = 0;
+	unsigned int num_sectors = 0;
+	struct bio_vec bv;
+	struct bvec_iter iter;
+
+	bio_for_each_segment(bv, bio, iter) {
+		num_sectors += bv.bv_len >> SECTOR_SHIFT;
+		if (++i == BIO_MAX_PAGES)
+			break;
+	}
+	if (num_sectors < bio_sectors(bio)) {
+		struct bio *split_bio;
+
+		split_bio = bio_split(bio, num_sectors, GFP_NOIO, NULL);
+		if (!split_bio) {
+			bio->bi_status = BLK_STS_RESOURCE;
+			return false;
+		}
+		bio_chain(split_bio, bio);
+		generic_make_request(bio);
+		*bio_ptr = split_bio;
+	}
+
+	return true;
+}
+
+union blk_crypto_iv {
+	__le64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE];
+	u8 bytes[BLK_CRYPTO_MAX_IV_SIZE];
+};
+
+static void blk_crypto_dun_to_iv(const u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE],
+				 union blk_crypto_iv *iv)
+{
+	int i;
+
+	for (i = 0; i < BLK_CRYPTO_DUN_ARRAY_SIZE; i++)
+		iv->dun[i] = cpu_to_le64(dun[i]);
+}
+
+/*
+ * The crypto API fallback's encryption routine.
+ * Allocate a bounce bio for encryption, encrypt the input bio using crypto API,
+ * and replace *bio_ptr with the bounce bio. May split input bio if it's too
+ * large. Returns true on success. Returns false and sets bio->bi_status on
+ * error.
+ */
+static bool blk_crypto_fallback_encrypt_bio(struct bio **bio_ptr)
+{
+	struct bio *src_bio, *enc_bio;
+	struct bio_crypt_ctx *bc;
+	struct blk_ksm_keyslot *slot;
+	int data_unit_size;
+	struct skcipher_request *ciph_req = NULL;
+	DECLARE_CRYPTO_WAIT(wait);
+	u64 curr_dun[BLK_CRYPTO_DUN_ARRAY_SIZE];
+	struct scatterlist src, dst;
+	union blk_crypto_iv iv;
+	unsigned int i, j;
+	bool ret = false;
+	blk_status_t blk_st;
+
+	/* Split the bio if it's too big for single page bvec */
+	if (!blk_crypto_split_bio_if_needed(bio_ptr))
+		return false;
+
+	src_bio = *bio_ptr;
+	bc = src_bio->bi_crypt_context;
+	data_unit_size = bc->bc_key->crypto_cfg.data_unit_size;
+
+	/* Allocate bounce bio for encryption */
+	enc_bio = blk_crypto_clone_bio(src_bio);
+	if (!enc_bio) {
+		src_bio->bi_status = BLK_STS_RESOURCE;
+		return false;
+	}
+
+	/*
+	 * Use the crypto API fallback keyslot manager to get a crypto_skcipher
+	 * for the algorithm and key specified for this bio.
+	 */
+	blk_st = blk_ksm_get_slot_for_key(&blk_crypto_ksm, bc->bc_key, &slot);
+	if (blk_st != BLK_STS_OK) {
+		src_bio->bi_status = blk_st;
+		goto out_put_enc_bio;
+	}
+
+	/* and then allocate an skcipher_request for it */
+	if (!blk_crypto_alloc_cipher_req(slot, &ciph_req, &wait)) {
+		src_bio->bi_status = BLK_STS_RESOURCE;
+		goto out_release_keyslot;
+	}
+
+	memcpy(curr_dun, bc->bc_dun, sizeof(curr_dun));
+	sg_init_table(&src, 1);
+	sg_init_table(&dst, 1);
+
+	skcipher_request_set_crypt(ciph_req, &src, &dst, data_unit_size,
+				   iv.bytes);
+
+	/* Encrypt each page in the bounce bio */
+	for (i = 0; i < enc_bio->bi_vcnt; i++) {
+		struct bio_vec *enc_bvec = &enc_bio->bi_io_vec[i];
+		struct page *plaintext_page = enc_bvec->bv_page;
+		struct page *ciphertext_page =
+			mempool_alloc(blk_crypto_bounce_page_pool, GFP_NOIO);
+
+		enc_bvec->bv_page = ciphertext_page;
+
+		if (!ciphertext_page) {
+			src_bio->bi_status = BLK_STS_RESOURCE;
+			goto out_free_bounce_pages;
+		}
+
+		sg_set_page(&src, plaintext_page, data_unit_size,
+			    enc_bvec->bv_offset);
+		sg_set_page(&dst, ciphertext_page, data_unit_size,
+			    enc_bvec->bv_offset);
+
+		/* Encrypt each data unit in this page */
+		for (j = 0; j < enc_bvec->bv_len; j += data_unit_size) {
+			blk_crypto_dun_to_iv(curr_dun, &iv);
+			if (crypto_wait_req(crypto_skcipher_encrypt(ciph_req),
+					    &wait)) {
+				i++;
+				src_bio->bi_status = BLK_STS_IOERR;
+				goto out_free_bounce_pages;
+			}
+			bio_crypt_dun_increment(curr_dun, 1);
+			src.offset += data_unit_size;
+			dst.offset += data_unit_size;
+		}
+	}
+
+	enc_bio->bi_private = src_bio;
+	enc_bio->bi_end_io = blk_crypto_fallback_encrypt_endio;
+	*bio_ptr = enc_bio;
+	ret = true;
+
+	enc_bio = NULL;
+	goto out_free_ciph_req;
+
+out_free_bounce_pages:
+	while (i > 0)
+		mempool_free(enc_bio->bi_io_vec[--i].bv_page,
+			     blk_crypto_bounce_page_pool);
+out_free_ciph_req:
+	skcipher_request_free(ciph_req);
+out_release_keyslot:
+	blk_ksm_put_slot(slot);
+out_put_enc_bio:
+	if (enc_bio)
+		bio_put(enc_bio);
+
+	return ret;
+}
+
+/*
+ * The crypto API fallback's main decryption routine.
+ * Decrypts input bio in place, and calls bio_endio on the bio.
+ */
+static void blk_crypto_fallback_decrypt_bio(struct work_struct *work)
+{
+	struct bio_fallback_crypt_ctx *f_ctx =
+		container_of(work, struct bio_fallback_crypt_ctx, work);
+	struct bio *bio = f_ctx->bio;
+	struct bio_crypt_ctx *bc = &f_ctx->crypt_ctx;
+	struct blk_ksm_keyslot *slot;
+	struct skcipher_request *ciph_req = NULL;
+	DECLARE_CRYPTO_WAIT(wait);
+	u64 curr_dun[BLK_CRYPTO_DUN_ARRAY_SIZE];
+	union blk_crypto_iv iv;
+	struct scatterlist sg;
+	struct bio_vec bv;
+	struct bvec_iter iter;
+	const int data_unit_size = bc->bc_key->crypto_cfg.data_unit_size;
+	unsigned int i;
+	blk_status_t blk_st;
+
+	/*
+	 * Use the crypto API fallback keyslot manager to get a crypto_skcipher
+	 * for the algorithm and key specified for this bio.
+	 */
+	blk_st = blk_ksm_get_slot_for_key(&blk_crypto_ksm, bc->bc_key, &slot);
+	if (blk_st != BLK_STS_OK) {
+		bio->bi_status = blk_st;
+		goto out_no_keyslot;
+	}
+
+	/* and then allocate an skcipher_request for it */
+	if (!blk_crypto_alloc_cipher_req(slot, &ciph_req, &wait)) {
+		bio->bi_status = BLK_STS_RESOURCE;
+		goto out;
+	}
+
+	memcpy(curr_dun, bc->bc_dun, sizeof(curr_dun));
+	sg_init_table(&sg, 1);
+	skcipher_request_set_crypt(ciph_req, &sg, &sg, data_unit_size,
+				   iv.bytes);
+
+	/* Decrypt each segment in the bio */
+	__bio_for_each_segment(bv, bio, iter, f_ctx->crypt_iter) {
+		struct page *page = bv.bv_page;
+
+		sg_set_page(&sg, page, data_unit_size, bv.bv_offset);
+
+		/* Decrypt each data unit in the segment */
+		for (i = 0; i < bv.bv_len; i += data_unit_size) {
+			blk_crypto_dun_to_iv(curr_dun, &iv);
+			if (crypto_wait_req(crypto_skcipher_decrypt(ciph_req),
+					    &wait)) {
+				bio->bi_status = BLK_STS_IOERR;
+				goto out;
+			}
+			bio_crypt_dun_increment(curr_dun, 1);
+			sg.offset += data_unit_size;
+		}
+	}
+
+out:
+	skcipher_request_free(ciph_req);
+	blk_ksm_put_slot(slot);
+out_no_keyslot:
+	mempool_free(f_ctx, bio_fallback_crypt_ctx_pool);
+	bio_endio(bio);
+}
+
+/**
+ * blk_crypto_fallback_decrypt_endio - queue bio for fallback decryption
+ *
+ * @bio: the bio to queue
+ *
+ * Restore bi_private and bi_end_io, and queue the bio for decryption into a
+ * workqueue, since this function will be called from an atomic context.
+ */
+static void blk_crypto_fallback_decrypt_endio(struct bio *bio)
+{
+	struct bio_fallback_crypt_ctx *f_ctx = bio->bi_private;
+
+	bio->bi_private = f_ctx->bi_private_orig;
+	bio->bi_end_io = f_ctx->bi_end_io_orig;
+
+	/* If there was an IO error, don't queue for decrypt. */
+	if (bio->bi_status) {
+		mempool_free(f_ctx, bio_fallback_crypt_ctx_pool);
+		bio_endio(bio);
+		return;
+	}
+
+	INIT_WORK(&f_ctx->work, blk_crypto_fallback_decrypt_bio);
+	f_ctx->bio = bio;
+	queue_work(blk_crypto_wq, &f_ctx->work);
+}
+
+/**
+ * blk_crypto_fallback_bio_prep - Prepare a bio to use fallback en/decryption
+ *
+ * @bio_ptr: pointer to the bio to prepare
+ *
+ * If bio is doing a WRITE operation, this splits the bio into two parts if it's
+ * too big (see blk_crypto_split_bio_if_needed). It then allocates a bounce bio
+ * for the first part, encrypts it, and update bio_ptr to point to the bounce
+ * bio.
+ *
+ * For a READ operation, we mark the bio for decryption by using bi_private and
+ * bi_end_io.
+ *
+ * In either case, this function will make the bio look like a regular bio (i.e.
+ * as if no encryption context was ever specified) for the purposes of the rest
+ * of the stack except for blk-integrity (blk-integrity and blk-crypto are not
+ * currently supported together).
+ *
+ * Return: true on success. Sets bio->bi_status and returns false on error.
+ */
+bool blk_crypto_fallback_bio_prep(struct bio **bio_ptr)
+{
+	struct bio *bio = *bio_ptr;
+	struct bio_crypt_ctx *bc = bio->bi_crypt_context;
+	struct bio_fallback_crypt_ctx *f_ctx;
+
+	if (WARN_ON_ONCE(!tfms_inited[bc->bc_key->crypto_cfg.crypto_mode])) {
+		/* User didn't call blk_crypto_start_using_key() first */
+		bio->bi_status = BLK_STS_IOERR;
+		return false;
+	}
+
+	if (!blk_ksm_crypto_cfg_supported(&blk_crypto_ksm,
+					  &bc->bc_key->crypto_cfg)) {
+		bio->bi_status = BLK_STS_NOTSUPP;
+		return false;
+	}
+
+	if (bio_data_dir(bio) == WRITE)
+		return blk_crypto_fallback_encrypt_bio(bio_ptr);
+
+	/*
+	 * bio READ case: Set up a f_ctx in the bio's bi_private and set the
+	 * bi_end_io appropriately to trigger decryption when the bio is ended.
+	 */
+	f_ctx = mempool_alloc(bio_fallback_crypt_ctx_pool, GFP_NOIO);
+	f_ctx->crypt_ctx = *bc;
+	f_ctx->crypt_iter = bio->bi_iter;
+	f_ctx->bi_private_orig = bio->bi_private;
+	f_ctx->bi_end_io_orig = bio->bi_end_io;
+	bio->bi_private = (void *)f_ctx;
+	bio->bi_end_io = blk_crypto_fallback_decrypt_endio;
+	bio_crypt_free_ctx(bio);
+
+	return true;
+}
+
+int blk_crypto_fallback_evict_key(const struct blk_crypto_key *key)
+{
+	return blk_ksm_evict_key(&blk_crypto_ksm, key);
+}
+
+static bool blk_crypto_fallback_inited;
+static int blk_crypto_fallback_init(void)
+{
+	int i;
+	int err = -ENOMEM;
+
+	if (blk_crypto_fallback_inited)
+		return 0;
+
+	prandom_bytes(blank_key, BLK_CRYPTO_MAX_KEY_SIZE);
+
+	err = blk_ksm_init(&blk_crypto_ksm, blk_crypto_num_keyslots);
+	if (err)
+		goto out;
+	err = -ENOMEM;
+
+	blk_crypto_ksm.ksm_ll_ops = blk_crypto_ksm_ll_ops;
+	blk_crypto_ksm.max_dun_bytes_supported = BLK_CRYPTO_MAX_IV_SIZE;
+
+	/* All blk-crypto modes have a crypto API fallback. */
+	for (i = 0; i < BLK_ENCRYPTION_MODE_MAX; i++)
+		blk_crypto_ksm.crypto_modes_supported[i] = 0xFFFFFFFF;
+	blk_crypto_ksm.crypto_modes_supported[BLK_ENCRYPTION_MODE_INVALID] = 0;
+
+	blk_crypto_wq = alloc_workqueue("blk_crypto_wq",
+					WQ_UNBOUND | WQ_HIGHPRI |
+					WQ_MEM_RECLAIM, num_online_cpus());
+	if (!blk_crypto_wq)
+		goto fail_free_ksm;
+
+	blk_crypto_keyslots = kcalloc(blk_crypto_num_keyslots,
+				      sizeof(blk_crypto_keyslots[0]),
+				      GFP_KERNEL);
+	if (!blk_crypto_keyslots)
+		goto fail_free_wq;
+
+	blk_crypto_bounce_page_pool =
+		mempool_create_page_pool(num_prealloc_bounce_pg, 0);
+	if (!blk_crypto_bounce_page_pool)
+		goto fail_free_keyslots;
+
+	bio_fallback_crypt_ctx_cache = KMEM_CACHE(bio_fallback_crypt_ctx, 0);
+	if (!bio_fallback_crypt_ctx_cache)
+		goto fail_free_bounce_page_pool;
+
+	bio_fallback_crypt_ctx_pool =
+		mempool_create_slab_pool(num_prealloc_fallback_crypt_ctxs,
+					 bio_fallback_crypt_ctx_cache);
+	if (!bio_fallback_crypt_ctx_pool)
+		goto fail_free_crypt_ctx_cache;
+
+	blk_crypto_fallback_inited = true;
+
+	return 0;
+fail_free_crypt_ctx_cache:
+	kmem_cache_destroy(bio_fallback_crypt_ctx_cache);
+fail_free_bounce_page_pool:
+	mempool_destroy(blk_crypto_bounce_page_pool);
+fail_free_keyslots:
+	kfree(blk_crypto_keyslots);
+fail_free_wq:
+	destroy_workqueue(blk_crypto_wq);
+fail_free_ksm:
+	blk_ksm_destroy(&blk_crypto_ksm);
+out:
+	return err;
+}
+
+/*
+ * Prepare blk-crypto-fallback for the specified crypto mode.
+ * Returns -ENOPKG if the needed crypto API support is missing.
+ */
+int blk_crypto_fallback_start_using_mode(enum blk_crypto_mode_num mode_num)
+{
+	const char *cipher_str = blk_crypto_modes[mode_num].cipher_str;
+	struct blk_crypto_keyslot *slotp;
+	unsigned int i;
+	int err = 0;
+
+	/*
+	 * Fast path
+	 * Ensure that updates to blk_crypto_keyslots[i].tfms[mode_num]
+	 * for each i are visible before we try to access them.
+	 */
+	if (likely(smp_load_acquire(&tfms_inited[mode_num])))
+		return 0;
+
+	mutex_lock(&tfms_init_lock);
+	if (tfms_inited[mode_num])
+		goto out;
+
+	err = blk_crypto_fallback_init();
+	if (err)
+		goto out;
+
+	for (i = 0; i < blk_crypto_num_keyslots; i++) {
+		slotp = &blk_crypto_keyslots[i];
+		slotp->tfms[mode_num] = crypto_alloc_skcipher(cipher_str, 0, 0);
+		if (IS_ERR(slotp->tfms[mode_num])) {
+			err = PTR_ERR(slotp->tfms[mode_num]);
+			if (err == -ENOENT) {
+				pr_warn_once("Missing crypto API support for \"%s\"\n",
+					     cipher_str);
+				err = -ENOPKG;
+			}
+			slotp->tfms[mode_num] = NULL;
+			goto out_free_tfms;
+		}
+
+		crypto_skcipher_set_flags(slotp->tfms[mode_num],
+					  CRYPTO_TFM_REQ_FORBID_WEAK_KEYS);
+	}
+
+	/*
+	 * Ensure that updates to blk_crypto_keyslots[i].tfms[mode_num]
+	 * for each i are visible before we set tfms_inited[mode_num].
+	 */
+	smp_store_release(&tfms_inited[mode_num], true);
+	goto out;
+
+out_free_tfms:
+	for (i = 0; i < blk_crypto_num_keyslots; i++) {
+		slotp = &blk_crypto_keyslots[i];
+		crypto_free_skcipher(slotp->tfms[mode_num]);
+		slotp->tfms[mode_num] = NULL;
+	}
+out:
+	mutex_unlock(&tfms_init_lock);
+	return err;
+}
diff --git a/block/blk-crypto-internal.h b/block/blk-crypto-internal.h
index 796f757fe8e92..d2b0f565d83cb 100644
--- a/block/blk-crypto-internal.h
+++ b/block/blk-crypto-internal.h
@@ -11,10 +11,13 @@
 
 /* Represents a crypto mode supported by blk-crypto  */
 struct blk_crypto_mode {
+	const char *cipher_str; /* crypto API name (for fallback case) */
 	unsigned int keysize; /* key size in bytes */
 	unsigned int ivsize; /* iv size in bytes */
 };
 
+extern const struct blk_crypto_mode blk_crypto_modes[];
+
 #ifdef CONFIG_BLK_INLINE_ENCRYPTION
 
 void bio_crypt_dun_increment(u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE],
@@ -163,4 +166,36 @@ static inline blk_status_t blk_crypto_insert_cloned_request(struct request *rq)
 	return BLK_STS_OK;
 }
 
+#ifdef CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK
+
+int blk_crypto_fallback_start_using_mode(enum blk_crypto_mode_num mode_num);
+
+bool blk_crypto_fallback_bio_prep(struct bio **bio_ptr);
+
+int blk_crypto_fallback_evict_key(const struct blk_crypto_key *key);
+
+#else /* CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK */
+
+static inline int
+blk_crypto_fallback_start_using_mode(enum blk_crypto_mode_num mode_num)
+{
+	pr_warn_once("crypto API fallback is disabled\n");
+	return -ENOPKG;
+}
+
+static inline bool blk_crypto_fallback_bio_prep(struct bio **bio_ptr)
+{
+	pr_warn_once("crypto API fallback disabled; failing request.\n");
+	(*bio_ptr)->bi_status = BLK_STS_NOTSUPP;
+	return false;
+}
+
+static inline int
+blk_crypto_fallback_evict_key(const struct blk_crypto_key *key)
+{
+	return 0;
+}
+
+#endif /* CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK */
+
 #endif /* __LINUX_BLK_CRYPTO_INTERNAL_H */
diff --git a/block/blk-crypto.c b/block/blk-crypto.c
index 25b981257f5fa..6533c9b36ab80 100644
--- a/block/blk-crypto.c
+++ b/block/blk-crypto.c
@@ -19,14 +19,17 @@
 
 const struct blk_crypto_mode blk_crypto_modes[] = {
 	[BLK_ENCRYPTION_MODE_AES_256_XTS] = {
+		.cipher_str = "xts(aes)",
 		.keysize = 64,
 		.ivsize = 16,
 	},
 	[BLK_ENCRYPTION_MODE_AES_128_CBC_ESSIV] = {
+		.cipher_str = "essiv(cbc(aes),sha256)",
 		.keysize = 16,
 		.ivsize = 16,
 	},
 	[BLK_ENCRYPTION_MODE_ADIANTUM] = {
+		.cipher_str = "adiantum(xchacha12,aes)",
 		.keysize = 32,
 		.ivsize = 32,
 	},
@@ -229,9 +232,16 @@ void __blk_crypto_free_request(struct request *rq)
  *
  * @bio_ptr: pointer to original bio pointer
  *
- * Succeeds if the bio doesn't have inline encryption enabled or if the bio
- * crypt context provided for the bio is supported by the underlying device's
- * inline encryption hardware. Ends the bio with error otherwise.
+ * If the bio crypt context provided for the bio is supported by the underlying
+ * device's inline encryption hardware, do nothing.
+ *
+ * Otherwise, try to perform en/decryption for this bio by falling back to the
+ * kernel crypto API. When the crypto API fallback is used for encryption,
+ * blk-crypto may choose to split the bio into 2 - the first one that will
+ * continue to be processed and the second one that will be resubmitted via
+ * generic_make_request. A bounce bio will be allocated to encrypt the contents
+ * of the aforementioned "first one", and *bio_ptr will be updated to this
+ * bounce bio.
  *
  * Caller must ensure bio has bio_crypt_ctx.
  *
@@ -243,27 +253,29 @@ bool __blk_crypto_bio_prep(struct bio **bio_ptr)
 {
 	struct bio *bio = *bio_ptr;
 	const struct blk_crypto_key *bc_key = bio->bi_crypt_context->bc_key;
-	blk_status_t blk_st = BLK_STS_IOERR;
 
 	/* Error if bio has no data. */
-	if (WARN_ON_ONCE(!bio_has_data(bio)))
+	if (WARN_ON_ONCE(!bio_has_data(bio))) {
+		bio->bi_status = BLK_STS_IOERR;
 		goto fail;
+	}
 
-	if (!bio_crypt_check_alignment(bio))
+	if (!bio_crypt_check_alignment(bio)) {
+		bio->bi_status = BLK_STS_IOERR;
 		goto fail;
+	}
 
 	/*
-	 * Success if device supports the encryption context.
+	 * Success if device supports the encryption context, or if we succeeded
+	 * in falling back to the crypto API.
 	 */
-	if (!blk_ksm_crypto_cfg_supported(bio->bi_disk->queue->ksm,
-					  &bc_key->crypto_cfg)) {
-		blk_st = BLK_STS_NOTSUPP;
-		goto fail;
-	}
+	if (blk_ksm_crypto_cfg_supported(bio->bi_disk->queue->ksm,
+					 &bc_key->crypto_cfg))
+		return true;
 
-	return true;
+	if (blk_crypto_fallback_bio_prep(bio_ptr))
+		return true;
 fail:
-	(*bio_ptr)->bi_status = blk_st;
 	bio_endio(*bio_ptr);
 	return false;
 }
@@ -329,10 +341,16 @@ int blk_crypto_init_key(struct blk_crypto_key *blk_key, const u8 *raw_key,
 	return 0;
 }
 
+/*
+ * Check if bios with @cfg can be en/decrypted by blk-crypto (i.e. either the
+ * request queue it's submitted to supports inline crypto, or the
+ * blk-crypto-fallback is enabled and supports the cfg).
+ */
 bool blk_crypto_config_supported(struct request_queue *q,
 				 const struct blk_crypto_config *cfg)
 {
-	return blk_ksm_crypto_cfg_supported(q->ksm, cfg);
+	return IS_ENABLED(CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK) ||
+	       blk_ksm_crypto_cfg_supported(q->ksm, cfg);
 }
 
 /**
@@ -340,17 +358,22 @@ bool blk_crypto_config_supported(struct request_queue *q,
  * @key: A key to use on the device
  * @q: the request queue for the device
  *
- * Upper layers must call this function to ensure that the hardware supports
- * the key's crypto settings.
+ * Upper layers must call this function to ensure that either the hardware
+ * supports the key's crypto settings, or the crypto API fallback has transforms
+ * for the needed mode allocated and ready to go. This function may allocate
+ * an skcipher, and *should not* be called from the data path, since that might
+ * cause a deadlock
  *
- * Return: 0 on success; -ENOPKG if the hardware doesn't support the key
+ * Return: 0 on success; -ENOPKG if the hardware doesn't support the key and
+ *	   blk-crypto-fallback is either disabled or the needed algorithm
+ *	   is disabled in the crypto API; or another -errno code.
  */
 int blk_crypto_start_using_key(const struct blk_crypto_key *key,
 			       struct request_queue *q)
 {
 	if (blk_ksm_crypto_cfg_supported(q->ksm, &key->crypto_cfg))
 		return 0;
-	return -ENOPKG;
+	return blk_crypto_fallback_start_using_mode(key->crypto_cfg.crypto_mode);
 }
 
 /**
@@ -372,5 +395,10 @@ int blk_crypto_evict_key(struct request_queue *q,
 	if (blk_ksm_crypto_cfg_supported(q->ksm, &key->crypto_cfg))
 		return blk_ksm_evict_key(q->ksm, key);
 
-	return 0;
+	/*
+	 * If the request queue's associated inline encryption hardware didn't
+	 * have support for the key, then the key might have been programmed
+	 * into the fallback keyslot manager, so try to evict from there.
+	 */
+	return blk_crypto_fallback_evict_key(key);
 }
diff --git a/include/linux/blk-crypto.h b/include/linux/blk-crypto.h
index 76095b07dd902..e82342907f2b1 100644
--- a/include/linux/blk-crypto.h
+++ b/include/linux/blk-crypto.h
@@ -61,7 +61,7 @@ struct blk_crypto_key {
  *
  * A bio_crypt_ctx specifies that the contents of the bio will be encrypted (for
  * write requests) or decrypted (for read requests) inline by the storage device
- * or controller.
+ * or controller, or by the crypto API fallback.
  */
 struct bio_crypt_ctx {
 	const struct blk_crypto_key	*bc_key;
-- 
2.26.2.645.ge9eca65c58-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
