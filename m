Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE5A1BF788
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Apr 2020 14:00:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DhX1BK5cNmtcLPxRbjwjLbVTYMLZ8StuQmhR+Fw5fMQ=; b=PA5UJWJ//oSyhV00S46/knJsV
	8gbNZ7m9Ywxp0RoesUvLvdcQ0y5lGdJOYlCfLzzHa25eN5qEiQlI0q6P/5SBpwm212NRhd+nVUGqx
	2Q44/3G8pQMu3HORVxm8wPJE8oImKVW5ZDNAkjQrbjgu9mGnKNmT0AzVufVdv7w17G9Nc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jU7rY-00087T-3j; Thu, 30 Apr 2020 12:00:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3x72qXgYKAOgcKdiKdQYYQVO.MYW@flex--satyat.bounces.google.com>)
 id 1jU7rT-00087K-K3
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Apr 2020 12:00:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xb7ctfgBkT8MKaWibTzyhvK9qysU0rW7SMEIFQJPgjA=; b=EbQGKMd89PlvpHIIiq7m58FuO
 jsnsgfl0IrER9mhz/0M+sUvMF/Pt6UIPAEWzYj1vYImay+nsO957Ew+tIBHU2lm1m4z/7RJ/dwvzm
 uVPU/NcJo7qkDgwKmRHI75eAqIV9HR3BIaTv+sWanNhIIAwPT01fdjf8mDSdOjpeflxiU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xb7ctfgBkT8MKaWibTzyhvK9qysU0rW7SMEIFQJPgjA=; b=a34Pq0b8L3Jdohwakwm8+VaC8M
 34DmAhFCwibAoVFf2JbJKxQzT10Ny52dQow7rfb6Ph0bNSOSyvgqsOI3dsJkLQOvDROri1kOJ6b6C
 OGJ6seagivQBS5pbLnT79s03rAnc7PbadY5b1HSsqhgHc/C0p0uuAutzePC6OHnvF/hY=;
Received: from mail-qk1-f202.google.com ([209.85.222.202])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jU7rS-003IE3-9Z
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Apr 2020 12:00:15 +0000
Received: by mail-qk1-f202.google.com with SMTP id v6so6205471qkd.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Apr 2020 05:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=xb7ctfgBkT8MKaWibTzyhvK9qysU0rW7SMEIFQJPgjA=;
 b=j3MV8ehiEKFgagO26nEjNhVxO4Z3rfz3PgodR90MbmrOihzmftOVMN3dBSVjw6DwcH
 NwnboOih2ghd10oscPSB9TbkVyxMFmxTmRY9cfbQYPSStmlGMGHr4pXkNtCKksXqcReZ
 VmjTcKlNEs5zmmT5nzpxh8Q4oACZ2GFvoGqw5BcrCu7lRNJhLvd8n0p8WvM7/2zMhXRC
 MChmDritFxEmgy7hFU9O/trQyxIrq47yNSgUDXcWBXHbTrr6Hx7+nBsFawKzrqskLaa2
 vz8ZbhrtwnNrqNVciVFxtHPWdZimvNauQchtfjH7114FebUU3UGoR8rZ65ov0YMMRTqZ
 cTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=xb7ctfgBkT8MKaWibTzyhvK9qysU0rW7SMEIFQJPgjA=;
 b=NC9D6tmjl4HLjZhx3y37/gBdXe40qpIeC4qDfQCQSS0w8e3otfXtBf8U0bLQmEaItK
 EpQPpIc5nxAfHoKstWiK7Ff9WoTD3g0F/FWFb89QReBqqJxyefzyFe02dzRt9YxEY/BB
 KzVjlU+3bpsQ1RkY6fi5JrpadZ7PvHJNJpblQdGemHxwZ4bRo7kHk8MNxTkQYiE7LgKv
 rxHRXLyDUFbLkpW4eoqjwfP8eRwyNKz0ihEuEQzxav4ok7uCbwTIvPaqxlQFJ29nG2Ir
 46hNCqr146F35OBLE0ZD6jaDNl1OAdjM8XYvEsP5EEsDqkC0SG0GFkUZMBtIZdODXLdi
 Ir0g==
X-Gm-Message-State: AGi0Puas7IA3BILY0aV0y6y2Tkifqk/hYB4VGb4aEkFWYDzQ+MHjA28l
 NGhM+quOJAHoI9XTDa8F9VKqQo6xehk=
X-Google-Smtp-Source: APiQypJ0+JbtQIPsOVpdih60Wu/ehAdkUx4TBNQKmrynPl5SshZ274V1P85qpQJQSoRICJ+5d5v3BF8jgY8=
X-Received: by 2002:ad4:4f01:: with SMTP id fb1mr2711453qvb.162.1588248007896; 
 Thu, 30 Apr 2020 05:00:07 -0700 (PDT)
Date: Thu, 30 Apr 2020 11:59:51 +0000
In-Reply-To: <20200430115959.238073-1-satyat@google.com>
Message-Id: <20200430115959.238073-5-satyat@google.com>
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
 trust [209.85.222.202 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.202 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1jU7rS-003IE3-9Z
Subject: [f2fs-dev] [PATCH v12 04/12] block: Make blk-integrity preclude
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
Cc: Kuohong Wang <kuohong.wang@mediatek.com>,
 Satya Tangirala <satyat@google.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Kim Boojin <boojin.kim@samsung.com>
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
index 69f51909fc8ad..8d388cdbcd5d0 100644
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
index 98aae4638fda9..17738dab8ae04 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1562,6 +1562,12 @@ struct blk_integrity *bdev_get_integrity(struct block_device *bdev)
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
@@ -1642,6 +1648,11 @@ static inline struct blk_integrity *blk_get_integrity(struct gendisk *disk)
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
@@ -1693,6 +1704,25 @@ static inline struct bio_vec *rq_integrity_vec(struct request *rq)
 
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
2.26.2.303.gf8c07b1a785-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
