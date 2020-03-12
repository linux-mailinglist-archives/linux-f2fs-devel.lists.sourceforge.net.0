Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A984182B27
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2020 09:26:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=34m1NVN80RVHYX59ZIjJvhIv67Y1CCuof4zyAvrOMiY=; b=BGVkldnjCkcclBz4kwbHVYjNq
	D2RrY/pIGT2nkB1jX13+J3oeYBFbccywzWlf7cO/Ov4b1tEO600S7wVsZKOPfl6YXVLXWPtsKXy2q
	B2XYiJpg9geVX4SXVwLwfT7+egGvmvspn+WdG4S/rlOVjvBc80uw/Cj+yeSXqGnnpXsrk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jCJAc-0003PE-J7; Thu, 12 Mar 2020 08:26:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3uuxpXgYKADUjRkpRkXffXcV.Tfd@flex--satyat.bounces.google.com>)
 id 1jCJAb-0003Op-AT
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Mar 2020 08:26:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b9K5ZF1QsnMyis2Iwao7Kx/jSimzBrtZiFuBRS+8W2Q=; b=j2PwBtLlXcz5BBa81JT6nario
 eqANsJHGimTjrdqjmVwXjH+wvYAH59rpAAQVF2Z2O+kpZbO1oGnqcAmw5qSnX3FPB1kFTF583Gupv
 9VYwzUh+4TFpxcVRRaI8ZgiGm3Q935gIbA+PO6EYdGpEj+i3tqooe7UzTvdK9IFZypMtQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b9K5ZF1QsnMyis2Iwao7Kx/jSimzBrtZiFuBRS+8W2Q=; b=HEo0J89cKjQ5wyGw778UFE1WZ/
 aKd3FYCv7SlS/k4y1GXeCRpe725gR0ijVRhQ/FC7NNrI8Tu1EZnz8llOFU/Py1Oqsr9nw7OTnzXr6
 g0yJEcneBjUNSq55Hd53n1d5O8wU1mDrs4Tk6GxcXoNvXkgvu9+aVvsUAJqfWI5k4seo=;
Received: from mail-oi1-f201.google.com ([209.85.167.201])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jCJAZ-0099UP-32
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Mar 2020 08:26:21 +0000
Received: by mail-oi1-f201.google.com with SMTP id s10so2617083oie.22
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Mar 2020 01:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=b9K5ZF1QsnMyis2Iwao7Kx/jSimzBrtZiFuBRS+8W2Q=;
 b=kZidW+4uWj572uSVMaga3/kGllNvwppjeLnRckxNsn5ZtGRgpnGQcc6m+YfG02XymY
 7tPFhcGqWEa67J+CmGysa8gt+VL2iS3Dk1nu4qmKVGDtEuGKRdk9OTprEm7Sq7wNTUQb
 jm4UKSAttJSRDGZIUOMetDNaBKuN/8i11J9iBmRO7yzZeRSH+kVX796hnd4X6iRm9js3
 HvIoMDpjRbNuLUCqTwU8dmF6IrTB0Ng1lTyKWjJU9IhHK481X8Sg6flTQ60sYOC/JB9O
 BxfWCBsbLHPhcjl5wrHg34DADUUc+phrttzuJ3JEpwy9v/IFlJAzdCo89bwQ8EnS+BUy
 T/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=b9K5ZF1QsnMyis2Iwao7Kx/jSimzBrtZiFuBRS+8W2Q=;
 b=O5zf9Fz7w3FJMv+yIUAaDxDOTqpbZLWwSNQqN7vysJ1f+QFMTjPxDxFgEtUhgjlc7c
 HV4fyr0yco1Ykjs767I+jOcyAd1hh4OahUcIzxGL756xBVn0JGUmxuvv4aO3OlGCazeq
 3bJ7XzkQn2eXpepQ4seHPNAQzyN25fDpqQejtITCJrYqrLTHMCJHuwy9xIA4XH9tg6nl
 9yhYUgcsymGFHqMZePQ9GwQR0qLz06hgl0IKkHvpV+JkC4hNPm9Pcvq6OnPy+dy8z3lj
 rVU0Qh86jLEG5TC9Mkn5zeECBz1/3vlnLb459ONjGWoiKPLxkjTl+U5KIzPgiPl1KO4/
 14vg==
X-Gm-Message-State: ANhLgQ131ZsJ8EfD/+LbgraInTcRNvA2GuzCqR/2P8rWxGISNB/pgN5V
 boH3k2uZ6gHqTQ1YJQb0aZorQXZ9tOc=
X-Google-Smtp-Source: ADFU+vtoROhgaUUciKRMglgoersUjDrTpk4PeN3QMGxv3qFhvT5zpCtRD+M2MWAfK7e+3A+TCNAAjfUqW68=
X-Received: by 2002:a17:90a:f311:: with SMTP id
 ca17mr2920448pjb.6.1584000186546; 
 Thu, 12 Mar 2020 01:03:06 -0700 (PDT)
Date: Thu, 12 Mar 2020 01:02:45 -0700
In-Reply-To: <20200312080253.3667-1-satyat@google.com>
Message-Id: <20200312080253.3667-4-satyat@google.com>
Mime-Version: 1.0
References: <20200312080253.3667-1-satyat@google.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.201 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.201 listed in list.dnswl.org]
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
X-Headers-End: 1jCJAZ-0099UP-32
Subject: [f2fs-dev] [PATCH v8 03/11] block: Make blk-integrity preclude
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

Whenever a device supports blk-integrity, the kernel will now always
pretend that the device doesn't support inline encryption (essentially
by setting the keyslot manager in the request queue to NULL).

There's no hardware currently that supports both integrity and inline
encryption. However, it seems possible that there will be in the near
future, based on discussion at
https://lore.kernel.org/r/20200108140730.GC2896@infradead.org/
But properly integrating both features is not trivial, and without
real hardware that implements both, it is difficult to tell if it will
be done correctly by the majority of hardware that support both, and
through discussions at
https://lore.kernel.org/r/20200224233459.GA30288@infradead.org/
it seems best not to support both features together right now, and
to decide what to do at probe time.

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 block/bio-integrity.c   |  5 +++++
 block/blk-integrity.c   |  7 +++++++
 block/keyslot-manager.c | 20 ++++++++++++++++++++
 include/linux/blkdev.h  | 30 ++++++++++++++++++++++++++++++
 4 files changed, 62 insertions(+)

diff --git a/block/bio-integrity.c b/block/bio-integrity.c
index bf62c25cde8f..a5c57991c6fa 100644
--- a/block/bio-integrity.c
+++ b/block/bio-integrity.c
@@ -42,6 +42,11 @@ struct bio_integrity_payload *bio_integrity_alloc(struct bio *bio,
 	struct bio_set *bs = bio->bi_pool;
 	unsigned inline_vecs;
 
+	if (bio_has_crypt_ctx(bio)) {
+		pr_warn("blk-integrity can't be used together with inline en/decryption.");
+		return ERR_PTR(-EOPNOTSUPP);
+	}
+
 	if (!bs || !mempool_initialized(&bs->bio_integrity_pool)) {
 		bip = kmalloc(struct_size(bip, bip_inline_vecs, nr_vecs), gfp_mask);
 		inline_vecs = nr_vecs;
diff --git a/block/blk-integrity.c b/block/blk-integrity.c
index ff1070edbb40..793ba23e8688 100644
--- a/block/blk-integrity.c
+++ b/block/blk-integrity.c
@@ -409,6 +409,13 @@ void blk_integrity_register(struct gendisk *disk, struct blk_integrity *template
 	bi->tag_size = template->tag_size;
 
 	disk->queue->backing_dev_info->capabilities |= BDI_CAP_STABLE_WRITES;
+
+#ifdef BLK_INLINE_ENCRYPTION
+	if (disk->queue->ksm) {
+		pr_warn("blk-integrity: Integrity and hardware inline encryption are not supported together. Unregistering keyslot manager from request queue, to disable hardware inline encryption.");
+		blk_ksm_unregister(disk->queue);
+	}
+#endif
 }
 EXPORT_SYMBOL(blk_integrity_register);
 
diff --git a/block/keyslot-manager.c b/block/keyslot-manager.c
index 38df0652df80..a7970e18a122 100644
--- a/block/keyslot-manager.c
+++ b/block/keyslot-manager.c
@@ -25,6 +25,9 @@
  * Upper layers will call blk_ksm_get_slot_for_key() to program a
  * key into some slot in the inline encryption hardware.
  */
+
+#define pr_fmt(fmt) "blk_ksm: " fmt
+
 #include <crypto/algapi.h>
 #include <linux/keyslot-manager.h>
 #include <linux/atomic.h>
@@ -375,3 +378,20 @@ void blk_ksm_destroy(struct keyslot_manager *ksm)
 	memzero_explicit(ksm, sizeof(*ksm));
 }
 EXPORT_SYMBOL_GPL(blk_ksm_destroy);
+
+bool blk_ksm_register(struct keyslot_manager *ksm, struct request_queue *q)
+{
+	if (blk_integrity_queue_supports_integrity(q)) {
+		pr_warn("Integrity and hardware inline encryption are not supported together. Won't register keyslot manager with request queue.");
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
+EXPORT_SYMBOL_GPL(blk_ksm_unregister);
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index c6ea578c1f79..abe886d48cc4 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1570,6 +1570,12 @@ struct blk_integrity *bdev_get_integrity(struct block_device *bdev)
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
@@ -1650,6 +1656,11 @@ static inline struct blk_integrity *blk_get_integrity(struct gendisk *disk)
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
@@ -1701,6 +1712,25 @@ static inline struct bio_vec *rq_integrity_vec(struct request *rq)
 
 #endif /* CONFIG_BLK_DEV_INTEGRITY */
 
+#ifdef CONFIG_BLK_INLINE_ENCRYPTION
+
+bool blk_ksm_register(struct keyslot_manager *ksm, struct request_queue *q);
+
+void blk_ksm_unregister(struct request_queue *q);
+
+#else /* CONFIG_BLK_INLINE_ENCRYPTION */
+
+static inline bool blk_ksm_register(struct keyslot_manager *ksm,
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
2.25.1.481.gfbce0eb801-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
