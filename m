Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9FD1D2467
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 May 2020 03:01:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aWO8gNLBtuD6KNznIXVGl/mDJtjLCz9XX7rDzYvEAuc=; b=EDs9HI9KEUYdnki0fD8TDZs9r
	1eIOdAl1qkXEMsx6frzHBuOBcuD5vfWMB7pAecKd9rrynDgJeRyUUgFB9ZfYP9VbXIuaSVcrwJB8f
	lvQbhbIkCQJLVQ5c/5qREOQDKRdOfP2jWof8X9sqPWGHkIvmZ+5MVaWcnh/C9Z8FNAp38=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jZ2Fi-0003qt-AS; Thu, 14 May 2020 01:01:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <31JK8XgYKAOcbJchJcPXXPUN.LXV@flex--satyat.bounces.google.com>)
 id 1jZ2Ff-0003qP-SF
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 May 2020 01:01:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2a1/6iexsVaAsJm0zmzLMWWLusJiPio4DT5jdk5JBwA=; b=U0bKMNtTzU/QD94AsOlQ/gvue
 lWAdrJgy/gLVLYl42wWRu9xwVHSAnHs2Nr18GQN34QlJqHNd9y18l2PbNzDlNViNPGc9AU6dnqTa5
 HwH3Qw3Bytv0avCAmPUlD/SofVfS49kLxqKR3h0mymah4oL43JwVDPN59C622PtxxPJ6c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2a1/6iexsVaAsJm0zmzLMWWLusJiPio4DT5jdk5JBwA=; b=OhTvZTDtuoH18wXse9mGWwuwjq
 ydrO39ZtohdYmeL6Y0mA+zLxczIj8hDFriay7JCDxoRG0kg/q4DYDHGbTPE7pRzo7S9q/fTkN9Dff
 Jwc2OHLTKmPjJjTuza8HXmgWpwdDwZlIaZYyBAT3TfrX5OfJhVvNfoIa5lN6QFlPIHsU=;
Received: from mail-qv1-f73.google.com ([209.85.219.73])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jZ2Fe-006CkD-BF
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 May 2020 01:01:31 +0000
Received: by mail-qv1-f73.google.com with SMTP id z1so1672194qvd.23
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 13 May 2020 18:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=2a1/6iexsVaAsJm0zmzLMWWLusJiPio4DT5jdk5JBwA=;
 b=qgIaOplrCikSNBkGIriRGFSxoWJE0hZrycHHNLysncx+37fXhnpldyi9/GJf5pfkD9
 uQRYBh2+FA3JBYi5/Ev1m3DYPjlmv0HUKs50wtVzYWcoIHmLy6MKRybf6uo1SnhKyP65
 xsc4pofml5pz/fSKk3SUTvZ8qTZRC7t1XEmiC7ZlKHvvUVEdU+cgR0kaRXfaD7wGmgVj
 Rz+dmRwXO7wIOwy6Z+aPSiBgKUkM3n6jYV5ORzOlOI+qe7iv/jFC+YL6eabgxMA+Fpr1
 Tr8NIi/4cWJ0SJ4DYAhRJYc0Sy5YsvRWIpEYJfFRk/4dkFGjEeHRGgYkUcnmpVN/5a4F
 WGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=2a1/6iexsVaAsJm0zmzLMWWLusJiPio4DT5jdk5JBwA=;
 b=cXHweoGzJQQCtFZbnIK5plAKSdx9OXBBElFvJPb2zLV9DsA6Ga1aBqaWhaPwEeezxT
 WEDznCAcbD7+x4TKAnjfX7pkJOP5GMIrMPyg4FRn/tmkRXxKLrFV+TOknqAHvvF6UOt2
 arhVmZyJcWj7OYORMyFfYxW/GK/3e6JGVmoPiqDTOW3Vk7YYW4ZLUF7kj89Le9BmlRv5
 1RcINa8q9mxny7teht3JoGdSd9BJAjeafzDeIPMBpyBz9p0Eq/aygozd9fQjvU3BzJlg
 pCOB82bIOGo/FTF9z3L3EqFvpJr/fy9k7aMvOB9m5/bv9XOe7SEu2IV5cOWwQ44a5RKw
 e2RA==
X-Gm-Message-State: AOAM532IOHiAr0iFG9jTnF0Xf/46qDhhLfPUa60HpVAMt8/2f94eW8BP
 6O+akx3TqdaDqB5qCtMVrcIInYH+ZtY=
X-Google-Smtp-Source: ABdhPJxasO7CuvbgVMrryShWRnajhNBFChEkNUrrAJjMb5JoLsPu1wFEEDlrSFyCr2M5sCz96zL9uZgIBPw=
X-Received: by 2002:a05:6214:1262:: with SMTP id
 r2mr2374970qvv.126.1589416660998; 
 Wed, 13 May 2020 17:37:40 -0700 (PDT)
Date: Thu, 14 May 2020 00:37:19 +0000
In-Reply-To: <20200514003727.69001-1-satyat@google.com>
Message-Id: <20200514003727.69001-5-satyat@google.com>
Mime-Version: 1.0
References: <20200514003727.69001-1-satyat@google.com>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.73 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.73 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jZ2Fe-006CkD-BF
Subject: [f2fs-dev] [PATCH v13 04/12] block: Make blk-integrity preclude
 hardware inline encryption
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
Cc: Eric Biggers <ebiggers@google.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Kim Boojin <boojin.kim@samsung.com>, Kuohong Wang <kuohong.wang@mediatek.com>,
 Satya Tangirala <satyat@google.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Whenever a device supports blk-integrity, make the kernel pretend that
the device doesn't support inline encryption (essentially by setting the
keyslot manager in the request queue to NULL).

There's no hardware currently that supports both integrity and inline
encryption. However, it seems possible that there will be such hardware
in the near future (like the NVMe key per I/O support that might support
both inline encryption and PI).

But properly integrating both features is not trivial, and without
real hardware that implements both, it is difficult to tell if it will
be done correctly by the majority of hardware that support both.
So it seems best not to support both features together right now, and
to decide what to do at probe time.

Signed-off-by: Satya Tangirala <satyat@google.com>
Reviewed-by: Eric Biggers <ebiggers@google.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 block/bio-integrity.c   |  3 +++
 block/blk-integrity.c   |  7 +++++++
 block/keyslot-manager.c | 19 +++++++++++++++++++
 include/linux/blkdev.h  | 30 ++++++++++++++++++++++++++++++
 4 files changed, 59 insertions(+)

diff --git a/block/bio-integrity.c b/block/bio-integrity.c
index bf62c25cde8f4..3579ac0f6ec1f 100644
--- a/block/bio-integrity.c
+++ b/block/bio-integrity.c
@@ -42,6 +42,9 @@ struct bio_integrity_payload *bio_integrity_alloc(struct bio *bio,
 	struct bio_set *bs = bio->bi_pool;
 	unsigned inline_vecs;
 
+	if (WARN_ON_ONCE(bio_has_crypt_ctx(bio)))
+		return ERR_PTR(-EOPNOTSUPP);
+
 	if (!bs || !mempool_initialized(&bs->bio_integrity_pool)) {
 		bip = kmalloc(struct_size(bip, bip_inline_vecs, nr_vecs), gfp_mask);
 		inline_vecs = nr_vecs;
diff --git a/block/blk-integrity.c b/block/blk-integrity.c
index ff1070edbb400..c03705cbb9c9f 100644
--- a/block/blk-integrity.c
+++ b/block/blk-integrity.c
@@ -409,6 +409,13 @@ void blk_integrity_register(struct gendisk *disk, struct blk_integrity *template
 	bi->tag_size = template->tag_size;
 
 	disk->queue->backing_dev_info->capabilities |= BDI_CAP_STABLE_WRITES;
+
+#ifdef CONFIG_BLK_INLINE_ENCRYPTION
+	if (disk->queue->ksm) {
+		pr_warn("blk-integrity: Integrity and hardware inline encryption are not supported together. Disabling hardware inline encryption.\n");
+		blk_ksm_unregister(disk->queue);
+	}
+#endif
 }
 EXPORT_SYMBOL(blk_integrity_register);
 
diff --git a/block/keyslot-manager.c b/block/keyslot-manager.c
index fcd3fd469d7c1..c2ef41b3147ba 100644
--- a/block/keyslot-manager.c
+++ b/block/keyslot-manager.c
@@ -25,6 +25,9 @@
  * Upper layers will call blk_ksm_get_slot_for_key() to program a
  * key into some slot in the inline encryption hardware.
  */
+
+#define pr_fmt(fmt) "blk-crypto: " fmt
+
 #include <linux/keyslot-manager.h>
 #include <linux/atomic.h>
 #include <linux/mutex.h>
@@ -376,3 +379,19 @@ void blk_ksm_destroy(struct blk_keyslot_manager *ksm)
 	memzero_explicit(ksm, sizeof(*ksm));
 }
 EXPORT_SYMBOL_GPL(blk_ksm_destroy);
+
+bool blk_ksm_register(struct blk_keyslot_manager *ksm, struct request_queue *q)
+{
+	if (blk_integrity_queue_supports_integrity(q)) {
+		pr_warn("Integrity and hardware inline encryption are not supported together. Disabling hardware inline encryption.\n");
+		return false;
+	}
+	q->ksm = ksm;
+	return true;
+}
+EXPORT_SYMBOL_GPL(blk_ksm_register);
+
+void blk_ksm_unregister(struct request_queue *q)
+{
+	q->ksm = NULL;
+}
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index de38318a7acf0..d8f85fe696752 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1582,6 +1582,12 @@ struct blk_integrity *bdev_get_integrity(struct block_device *bdev)
 	return blk_get_integrity(bdev->bd_disk);
 }
 
+static inline bool
+blk_integrity_queue_supports_integrity(struct request_queue *q)
+{
+	return q->integrity.profile;
+}
+
 static inline bool blk_integrity_rq(struct request *rq)
 {
 	return rq->cmd_flags & REQ_INTEGRITY;
@@ -1662,6 +1668,11 @@ static inline struct blk_integrity *blk_get_integrity(struct gendisk *disk)
 {
 	return NULL;
 }
+static inline bool
+blk_integrity_queue_supports_integrity(struct request_queue *q)
+{
+	return false;
+}
 static inline int blk_integrity_compare(struct gendisk *a, struct gendisk *b)
 {
 	return 0;
@@ -1713,6 +1724,25 @@ static inline struct bio_vec *rq_integrity_vec(struct request *rq)
 
 #endif /* CONFIG_BLK_DEV_INTEGRITY */
 
+#ifdef CONFIG_BLK_INLINE_ENCRYPTION
+
+bool blk_ksm_register(struct blk_keyslot_manager *ksm, struct request_queue *q);
+
+void blk_ksm_unregister(struct request_queue *q);
+
+#else /* CONFIG_BLK_INLINE_ENCRYPTION */
+
+static inline bool blk_ksm_register(struct blk_keyslot_manager *ksm,
+				    struct request_queue *q)
+{
+	return true;
+}
+
+static inline void blk_ksm_unregister(struct request_queue *q) { }
+
+#endif /* CONFIG_BLK_INLINE_ENCRYPTION */
+
+
 struct block_device_operations {
 	int (*open) (struct block_device *, fmode_t);
 	void (*release) (struct gendisk *, fmode_t);
-- 
2.26.2.645.ge9eca65c58-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
