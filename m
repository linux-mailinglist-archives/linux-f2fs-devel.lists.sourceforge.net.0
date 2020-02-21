Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B6D167DB4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2020 13:47:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dG/kZoYoGr/wE7cC498BpWUeIzjYMdMAxjqHU44ZnjM=; b=LoxkzF7n0piYnX6+M+J4kHImj
	2ZYracYx1szmQFwYXdzyLaoY+4fJmqkIixQb+PHq4IM9gXoxDE7PoweQK64AZJOKY/0hwUqJd/lSn
	8cUZnKu5QjqZ9Iohi2w0UXgz01DV0yAT0e1x+4y4rYvReSFM/XW6lDqiq6nrmm0/M6FmI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j57im-0005jh-4I; Fri, 21 Feb 2020 12:47:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3JsRPXgYKAOUZHafHaNVVNSL.JVT@flex--satyat.bounces.google.com>)
 id 1j57il-0005jV-He
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 12:47:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xKLnkoFtXFXVEhxTFrb1pVmbzYaFjlcgjF966icM7+Q=; b=hSgtNBZKAO71bIsMsMzWmWtsq
 a+NfmExEByWquFjP1LLe6fs4KTnbx2SI/Kv6Okf6nfxLYdCXKw8vzrVl4op3FdbdKDHl2lsk+lGYQ
 V5iWpPARfIIdoTvh5TOMwx7qApfgqs9qlizO+P8CmLYIGHSdvcJfU3iN9biPov6X3NB2w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xKLnkoFtXFXVEhxTFrb1pVmbzYaFjlcgjF966icM7+Q=; b=A5Zk6cTr6lbFdWb/4eVzuZ/aRT
 McOvLt6S+UX9zuj4/5Y/7QQPJAXp5DO+cjB+st7uM9wBTEY6yJI9pzLXZ3cQf9ECeSYzvNClmQJtn
 DvXTdjXxeIqnX3A+zyAe6vUMPv5D+ouolJmneBJWp8FkPDX6bncxMIac1i0m+vFXS9gg=;
Received: from mail-qv1-f74.google.com ([209.85.219.74])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1j57ig-003K9G-NT
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 12:47:55 +0000
Received: by mail-qv1-f74.google.com with SMTP id cn2so1289442qvb.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Feb 2020 04:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=xKLnkoFtXFXVEhxTFrb1pVmbzYaFjlcgjF966icM7+Q=;
 b=UggGpb96Qg5kSa4gjYb9r/JLZd4UP6Y54ghbq/AwhCA28eKteL0XWwlZ7XATY0nnCn
 bpFiyWT18YnXBV9FzUnRGFx/M5yPm9TWtPCcoMyebkXSG03DlmVWYtxWacqtXK2l50qU
 WgT8x+O7m6O8+jrpO1CvjXCIKYhcNGJ1aDIbj8DjaQx38Z9Uxgr4hMLbZXrLnsPHtkTB
 GaRvpwZz2LIq2TLaSiLDGC4LmIvs40ggQIah8VhzWddA/+VqR+KrdH0Y1bDIgx3clOrG
 wfOEnlTBDLi2ji+g0GYxH/grFxLp1KT5rEgkPoampwupMxwvju4/OW6uAVkSTFKCQ2kT
 lzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=xKLnkoFtXFXVEhxTFrb1pVmbzYaFjlcgjF966icM7+Q=;
 b=RajBZXJlWaYWSMwW0ev71MrUONdOE6GBK29ng/+AB1lKjcUNGN4XAmORJRcVxtDzOj
 mJRJw3ulXsuPaZFzrmWrXsXOCpRXxpkR7Jtzb7JlLOK11iUEAGLrpmom0mZncI/5f9hs
 sOhZGhdjOIos4o0rrEpW3Jfcda+eXiiBLQnUgwMyRkUEN1xFns6cWuZL59Ri9yjqd0CC
 vxho0BN6kb7mypqRylG7fwJvjKJJOTh9/TLjaVU4ijCF3Szb9sfnMUNIN9a+g6Nwo5Fu
 45GgI/CowdpZFDNyvlFR2pa+WLJ7sm1t4mGWPJyd1T3TcPWFW60B8CWF94i6yvjMFrM9
 Jwrg==
X-Gm-Message-State: APjAAAVTjn94XgiEFYtATCuUMqUYdrgregYZj2lxkpW27QX2+vP92lXW
 rIA+XVxsq5BPtx/hwOWFdHuezaqU/8Y=
X-Google-Smtp-Source: APXvYqwMknx64jGsOpxaDLyRgX0T6kkea5fTEHrmxQEcpBT09HmefD4b+7rtbLL7/+iHOr7SFkOOYqWe5xc=
X-Received: by 2002:a05:6214:965:: with SMTP id
 do5mr30031831qvb.202.1582285862591; 
 Fri, 21 Feb 2020 03:51:02 -0800 (PST)
Date: Fri, 21 Feb 2020 03:50:42 -0800
In-Reply-To: <20200221115050.238976-1-satyat@google.com>
Message-Id: <20200221115050.238976-2-satyat@google.com>
Mime-Version: 1.0
References: <20200221115050.238976-1-satyat@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.74 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.74 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j57ig-003K9G-NT
Subject: [f2fs-dev] [PATCH v7 1/9] block: Keyslot Manager for Inline
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
 Kim Boojin <boojin.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Inline Encryption hardware allows software to specify an encryption context
(an encryption key, crypto algorithm, data unit num, data unit size) along
with a data transfer request to a storage device, and the inline encryption
hardware will use that context to en/decrypt the data. The inline
encryption hardware is part of the storage device, and it conceptually sits
on the data path between system memory and the storage device.

Inline Encryption hardware implementations often function around the
concept of "keyslots". These implementations often have a limited number
of "keyslots", each of which can hold an encryption context (we say that
an encryption context can be "programmed" into a keyslot). Requests made
to the storage device may have a keyslot associated with them, and the
inline encryption hardware will en/decrypt the data in the requests using
the encryption context programmed into that associated keyslot.

As keyslots are limited, and programming keys may be expensive in many
implementations, and multiple requests may use exactly the same encryption
contexts, we introduce a Keyslot Manager to efficiently manage keyslots.

We also introduce a blk_crypto_key, which will represent the key that's
programmed into keyslots managed by keyslot managers. The keyslot manager
also functions as the interface that upper layers will use to program keys
into inline encryption hardware. For more information on the Keyslot
Manager, refer to documentation found in block/keyslot-manager.c and
linux/keyslot-manager.h.

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 block/Kconfig                   |   7 +
 block/Makefile                  |   1 +
 block/keyslot-manager.c         | 426 ++++++++++++++++++++++++++++++++
 include/linux/bio.h             |   1 +
 include/linux/blk-crypto.h      |  45 ++++
 include/linux/blkdev.h          |   6 +
 include/linux/keyslot-manager.h | 108 ++++++++
 7 files changed, 594 insertions(+)
 create mode 100644 block/keyslot-manager.c
 create mode 100644 include/linux/blk-crypto.h
 create mode 100644 include/linux/keyslot-manager.h

diff --git a/block/Kconfig b/block/Kconfig
index 3bc76bb113a0..c04a1d500842 100644
--- a/block/Kconfig
+++ b/block/Kconfig
@@ -185,6 +185,13 @@ config BLK_SED_OPAL
 	Enabling this option enables users to setup/unlock/lock
 	Locking ranges for SED devices using the Opal protocol.
 
+config BLK_INLINE_ENCRYPTION
+	bool "Enable inline encryption support in block layer"
+	help
+	  Build the blk-crypto subsystem. Enabling this lets the
+	  block layer handle encryption, so users can take
+	  advantage of inline encryption hardware if present.
+
 menu "Partition Types"
 
 source "block/partitions/Kconfig"
diff --git a/block/Makefile b/block/Makefile
index 1a43750f4b01..ef3a05dcf1f2 100644
--- a/block/Makefile
+++ b/block/Makefile
@@ -37,3 +37,4 @@ obj-$(CONFIG_BLK_DEBUG_FS)	+= blk-mq-debugfs.o
 obj-$(CONFIG_BLK_DEBUG_FS_ZONED)+= blk-mq-debugfs-zoned.o
 obj-$(CONFIG_BLK_SED_OPAL)	+= sed-opal.o
 obj-$(CONFIG_BLK_PM)		+= blk-pm.o
+obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= keyslot-manager.o
diff --git a/block/keyslot-manager.c b/block/keyslot-manager.c
new file mode 100644
index 000000000000..15dfc0c12c7f
--- /dev/null
+++ b/block/keyslot-manager.c
@@ -0,0 +1,426 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2019 Google LLC
+ */
+
+/**
+ * DOC: The Keyslot Manager
+ *
+ * Many devices with inline encryption support have a limited number of "slots"
+ * into which encryption contexts may be programmed, and requests can be tagged
+ * with a slot number to specify the key to use for en/decryption.
+ *
+ * As the number of slots are limited, and programming keys is expensive on
+ * many inline encryption hardware, we don't want to program the same key into
+ * multiple slots - if multiple requests are using the same key, we want to
+ * program just one slot with that key and use that slot for all requests.
+ *
+ * The keyslot manager manages these keyslots appropriately, and also acts as
+ * an abstraction between the inline encryption hardware and the upper layers.
+ *
+ * Lower layer devices will set up a keyslot manager in their request queue
+ * and tell it how to perform device specific operations like programming/
+ * evicting keys from keyslots.
+ *
+ * Upper layers will call blk_ksm_get_slot_for_key() to program a
+ * key into some slot in the inline encryption hardware.
+ */
+#include <crypto/algapi.h>
+#include <linux/keyslot-manager.h>
+#include <linux/atomic.h>
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
+#include <linux/wait.h>
+#include <linux/blkdev.h>
+
+struct keyslot {
+	atomic_t slot_refs;
+	struct list_head idle_slot_node;
+	struct hlist_node hash_node;
+	struct blk_crypto_key key;
+};
+
+#ifdef CONFIG_PM
+static inline void blk_ksm_set_dev(struct keyslot_manager *ksm,
+				   struct device *dev)
+{
+	ksm->dev = dev;
+}
+
+/* If there's an underlying device and it's suspended, resume it. */
+static inline void blk_ksm_pm_get(struct keyslot_manager *ksm)
+{
+	if (ksm->dev)
+		pm_runtime_get_sync(ksm->dev);
+}
+
+static inline void blk_ksm_pm_put(struct keyslot_manager *ksm)
+{
+	if (ksm->dev)
+		pm_runtime_put_sync(ksm->dev);
+}
+#else /* CONFIG_PM */
+static inline void blk_ksm_set_dev(struct keyslot_manager *ksm,
+				   struct device *dev)
+{
+}
+
+static inline void blk_ksm_pm_get(struct keyslot_manager *ksm)
+{
+}
+
+static inline void blk_ksm_pm_put(struct keyslot_manager *ksm)
+{
+}
+#endif /* !CONFIG_PM */
+
+static inline void blk_ksm_hw_enter(struct keyslot_manager *ksm)
+{
+	/*
+	 * Calling into the driver requires ksm->lock held and the device
+	 * resumed.  But we must resume the device first, since that can acquire
+	 * and release ksm->lock via blk_ksm_reprogram_all_keys().
+	 */
+	blk_ksm_pm_get(ksm);
+	down_write(&ksm->lock);
+}
+
+static inline void blk_ksm_hw_exit(struct keyslot_manager *ksm)
+{
+	up_write(&ksm->lock);
+	blk_ksm_pm_put(ksm);
+}
+
+/**
+ * blk_ksm_init() - Initialize a keyslot manager
+ * @ksm: The keyslot_manager to initialize.
+ * @dev: Device for runtime power management (NULL if none)
+ * @num_slots: The number of key slots to manage.
+ *
+ * Allocate memory for keyslots and initialize a keyslot manager. Called by
+ * e.g. storage drivers to set up a keyslot manager in their request_queue.
+ *
+ * Return: 0 on success, or else a negative error code.
+ */
+int blk_ksm_init(struct keyslot_manager *ksm, struct device *dev,
+		 unsigned int num_slots)
+{
+	unsigned int slot;
+	unsigned int i;
+
+	memset(ksm, 0, sizeof(*ksm));
+
+	if (num_slots == 0)
+		return -EINVAL;
+
+	ksm->slots = kvzalloc(sizeof(ksm->slots[0]) * num_slots, GFP_KERNEL);
+	if (!ksm->slots)
+		return -ENOMEM;
+
+	ksm->num_slots = num_slots;
+	blk_ksm_set_dev(ksm, dev);
+
+	init_rwsem(&ksm->lock);
+
+	init_waitqueue_head(&ksm->idle_slots_wait_queue);
+	INIT_LIST_HEAD(&ksm->idle_slots);
+
+	for (slot = 0; slot < num_slots; slot++) {
+		list_add_tail(&ksm->slots[slot].idle_slot_node,
+			      &ksm->idle_slots);
+	}
+
+	spin_lock_init(&ksm->idle_slots_lock);
+
+	ksm->slot_hashtable_size = roundup_pow_of_two(num_slots);
+	ksm->slot_hashtable = kvmalloc_array(ksm->slot_hashtable_size,
+					     sizeof(ksm->slot_hashtable[0]),
+					     GFP_KERNEL);
+	if (!ksm->slot_hashtable)
+		goto err_free_ksm;
+	for (i = 0; i < ksm->slot_hashtable_size; i++)
+		INIT_HLIST_HEAD(&ksm->slot_hashtable[i]);
+
+	return 0;
+
+err_free_ksm:
+	blk_ksm_destroy(ksm);
+	return -ENOMEM;
+}
+EXPORT_SYMBOL_GPL(blk_ksm_init);
+
+static inline struct hlist_head *
+blk_ksm_hash_bucket_for_key(struct keyslot_manager *ksm,
+			    const struct blk_crypto_key *key)
+{
+	return &ksm->slot_hashtable[key->hash & (ksm->slot_hashtable_size - 1)];
+}
+
+static void blk_ksm_remove_slot_from_lru_list(struct keyslot_manager *ksm,
+					      struct keyslot *slot)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&ksm->idle_slots_lock, flags);
+	list_del(&slot->idle_slot_node);
+	spin_unlock_irqrestore(&ksm->idle_slots_lock, flags);
+}
+
+static struct keyslot *blk_ksm_find_keyslot(struct keyslot_manager *ksm,
+					    const struct blk_crypto_key *key)
+{
+	const struct hlist_head *head = blk_ksm_hash_bucket_for_key(ksm, key);
+	struct keyslot *slotp;
+
+	hlist_for_each_entry(slotp, head, hash_node) {
+		if (slotp->key.hash == key->hash &&
+		    slotp->key.crypto_mode == key->crypto_mode &&
+		    slotp->key.data_unit_size == key->data_unit_size &&
+		    !crypto_memneq(slotp->key.raw, key->raw, key->size))
+			return slotp;
+	}
+	return NULL;
+}
+
+static struct keyslot *blk_ksm_find_and_grab_keyslot(
+					struct keyslot_manager *ksm,
+					const struct blk_crypto_key *key)
+{
+	struct keyslot *slot;
+
+	slot = blk_ksm_find_keyslot(ksm, key);
+	if (!slot)
+		return NULL;
+	if (atomic_inc_return(&slot->slot_refs) == 1) {
+		/* Took first reference to this slot; remove it from LRU list */
+		blk_ksm_remove_slot_from_lru_list(ksm, slot);
+	}
+	return slot;
+}
+
+static unsigned int blk_ksm_get_slot_idx(struct keyslot *slot,
+					 struct keyslot_manager *ksm)
+{
+	return slot - ksm->slots;
+}
+
+/**
+ * blk_ksm_get_slot_for_key() - Program a key into a keyslot.
+ * @ksm: The keyslot manager to program the key into.
+ * @key: Pointer to the key object to program, including the raw key, crypto
+ *	 mode, and data unit size.
+ *
+ * Get a keyslot that's been programmed with the specified key.  If one already
+ * exists, return it with incremented refcount.  Otherwise, wait for a keyslot
+ * to become idle and program it.
+ *
+ * Context: Process context. Takes and releases ksm->lock.
+ * Return: The keyslot on success, else a -errno value.
+ */
+int blk_ksm_get_slot_for_key(struct keyslot_manager *ksm,
+			     const struct blk_crypto_key *key)
+{
+	struct keyslot *slot;
+	int slot_idx;
+	int err;
+
+	down_read(&ksm->lock);
+	slot = blk_ksm_find_and_grab_keyslot(ksm, key);
+	up_read(&ksm->lock);
+	if (slot != NULL)
+		return blk_ksm_get_slot_idx(slot, ksm);
+
+	for (;;) {
+		blk_ksm_hw_enter(ksm);
+		slot = blk_ksm_find_and_grab_keyslot(ksm, key);
+		if (slot != NULL) {
+			blk_ksm_hw_exit(ksm);
+			return blk_ksm_get_slot_idx(slot, ksm);
+		}
+
+		/*
+		 * If we're here, that means there wasn't a slot that was
+		 * already programmed with the key. So try to program it.
+		 */
+		if (!list_empty(&ksm->idle_slots))
+			break;
+
+		blk_ksm_hw_exit(ksm);
+		wait_event(ksm->idle_slots_wait_queue,
+			   !list_empty(&ksm->idle_slots));
+	}
+
+	slot = list_first_entry(&ksm->idle_slots, struct keyslot,
+				idle_slot_node);
+	slot_idx = blk_ksm_get_slot_idx(slot, ksm);
+
+	err = ksm->ksm_ll_ops.keyslot_program(ksm, key, slot_idx);
+	if (err) {
+		wake_up(&ksm->idle_slots_wait_queue);
+		blk_ksm_hw_exit(ksm);
+		return err;
+	}
+
+	/* Move this slot to the hash list for the new key. */
+	if (slot->key.crypto_mode != BLK_ENCRYPTION_MODE_INVALID)
+		hlist_del(&slot->hash_node);
+	hlist_add_head(&slot->hash_node, blk_ksm_hash_bucket_for_key(ksm, key));
+
+	atomic_set(&slot->slot_refs, 1);
+	slot->key = *key;
+
+	blk_ksm_remove_slot_from_lru_list(ksm, slot);
+
+	blk_ksm_hw_exit(ksm);
+	return slot_idx;
+}
+
+/**
+ * blk_ksm_get_slot() - Increment the refcount on the specified slot.
+ * @ksm: The keyslot manager that we want to modify.
+ * @slot: The slot to increment the refcount of.
+ *
+ * This function assumes that there is already an active reference to that slot
+ * and simply increments the refcount. This is useful when cloning a bio that
+ * already has a reference to a keyslot, and we want the cloned bio to also have
+ * its own reference.
+ *
+ * Context: Any context.
+ */
+void blk_ksm_get_slot(struct keyslot_manager *ksm, unsigned int slot)
+{
+	if (WARN_ON(slot >= ksm->num_slots))
+		return;
+
+	WARN_ON(atomic_inc_return(&ksm->slots[slot].slot_refs) < 2);
+}
+
+/**
+ * blk_ksm_put_slot() - Release a reference to a slot
+ * @ksm: The keyslot manager to release the reference from.
+ * @slot: The slot to release the reference from.
+ *
+ * Context: Any context.
+ */
+void blk_ksm_put_slot(struct keyslot_manager *ksm, unsigned int slot)
+{
+	unsigned long flags;
+
+	if (WARN_ON(slot >= ksm->num_slots))
+		return;
+
+	if (atomic_dec_and_lock_irqsave(&ksm->slots[slot].slot_refs,
+					&ksm->idle_slots_lock, flags)) {
+		list_add_tail(&ksm->slots[slot].idle_slot_node,
+			      &ksm->idle_slots);
+		spin_unlock_irqrestore(&ksm->idle_slots_lock, flags);
+		wake_up(&ksm->idle_slots_wait_queue);
+	}
+}
+
+/**
+ * blk_ksm_crypto_mode_supported() - Find out if a crypto_mode/data unit size
+ *				     combination is supported by a ksm.
+ * @ksm: The keyslot manager to check
+ * @crypto_mode: The crypto mode to check for.
+ * @blk_crypto_dun_bytes: The minimum number of bytes needed for specifying DUNs
+ * @data_unit_size: The data_unit_size for the mode.
+ *
+ * Checks for crypto_mode/data unit size support.
+ *
+ * Return: Whether or not this ksm supports the specified crypto_mode/
+ *	   data_unit_size combo.
+ */
+bool blk_ksm_crypto_mode_supported(struct keyslot_manager *ksm,
+				   const struct blk_crypto_key *key)
+{
+	if (!ksm)
+		return false;
+	if (WARN_ON((unsigned int)key->crypto_mode >= BLK_ENCRYPTION_MODE_MAX))
+		return false;
+	if (WARN_ON(!is_power_of_2(key->data_unit_size)))
+		return false;
+	return (ksm->crypto_modes_supported[key->crypto_mode] &
+		key->data_unit_size) &&
+	       (ksm->max_dun_bytes_supported[key->crypto_mode] >=
+		key->dun_bytes);
+}
+
+/**
+ * blk_ksm_evict_key() - Evict a key from the lower layer device.
+ * @ksm: The keyslot manager to evict from
+ * @key: The key to evict
+ *
+ * Find the keyslot that the specified key was programmed into, and evict that
+ * slot from the lower layer device if that slot is not currently in use.
+ *
+ * Context: Process context. Takes and releases ksm->lock.
+ * Return: 0 on success or if there's no keyslot with the specified key, -EBUSY
+ *	   if the key is still in use, or another -errno value on other error.
+ */
+int blk_ksm_evict_key(struct keyslot_manager *ksm,
+		      const struct blk_crypto_key *key)
+{
+	struct keyslot *slot;
+	int err = 0;
+
+	blk_ksm_hw_enter(ksm);
+	slot = blk_ksm_find_keyslot(ksm, key);
+	if (!slot)
+		goto out_unlock;
+
+	if (atomic_read(&slot->slot_refs) != 0) {
+		err = -EBUSY;
+		goto out_unlock;
+	}
+	err = ksm->ksm_ll_ops.keyslot_evict(ksm, key,
+					    blk_ksm_get_slot_idx(slot, ksm));
+	if (err)
+		goto out_unlock;
+
+	hlist_del(&slot->hash_node);
+	memzero_explicit(&slot->key, sizeof(slot->key));
+	err = 0;
+out_unlock:
+	blk_ksm_hw_exit(ksm);
+	return err;
+}
+
+/**
+ * blk_ksm_reprogram_all_keys() - Re-program all keyslots.
+ * @ksm: The keyslot manager
+ *
+ * Re-program all keyslots that are supposed to have a key programmed.  This is
+ * intended only for use by drivers for hardware that loses its keys on reset.
+ *
+ * Context: Process context. Takes and releases ksm->lock.
+ */
+void blk_ksm_reprogram_all_keys(struct keyslot_manager *ksm)
+{
+	unsigned int slot;
+
+	/* This is for device initialization, so don't resume the device */
+	down_write(&ksm->lock);
+	for (slot = 0; slot < ksm->num_slots; slot++) {
+		const struct keyslot *slotp = &ksm->slots[slot];
+		int err;
+
+		if (slotp->key.crypto_mode == BLK_ENCRYPTION_MODE_INVALID)
+			continue;
+
+		err = ksm->ksm_ll_ops.keyslot_program(ksm, &slotp->key, slot);
+		WARN_ON(err);
+	}
+	up_write(&ksm->lock);
+}
+EXPORT_SYMBOL_GPL(blk_ksm_reprogram_all_keys);
+
+void blk_ksm_destroy(struct keyslot_manager *ksm)
+{
+	if (!ksm)
+		return;
+	kvfree(ksm->slot_hashtable);
+	kvfree(ksm->slots);
+	memzero_explicit(ksm, sizeof(*ksm));
+}
+EXPORT_SYMBOL_GPL(blk_ksm_destroy);
diff --git a/include/linux/bio.h b/include/linux/bio.h
index 853d92ceee64..b2103e207ed5 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -8,6 +8,7 @@
 #include <linux/highmem.h>
 #include <linux/mempool.h>
 #include <linux/ioprio.h>
+#include <linux/blk-crypto.h>
 
 #ifdef CONFIG_BLOCK
 /* struct bio, bio_vec and BIO_* flags are defined in blk_types.h */
diff --git a/include/linux/blk-crypto.h b/include/linux/blk-crypto.h
new file mode 100644
index 000000000000..b8d54eca1c0d
--- /dev/null
+++ b/include/linux/blk-crypto.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2019 Google LLC
+ */
+
+#ifndef __LINUX_BLK_CRYPTO_H
+#define __LINUX_BLK_CRYPTO_H
+
+enum blk_crypto_mode_num {
+	BLK_ENCRYPTION_MODE_INVALID,
+	BLK_ENCRYPTION_MODE_AES_256_XTS,
+	BLK_ENCRYPTION_MODE_AES_128_CBC_ESSIV,
+	BLK_ENCRYPTION_MODE_ADIANTUM,
+	BLK_ENCRYPTION_MODE_MAX,
+};
+
+#define BLK_CRYPTO_MAX_KEY_SIZE		64
+
+/**
+ * struct blk_crypto_key - an inline encryption key
+ * @crypto_mode: encryption algorithm this key is for
+ * @data_unit_size: the data unit size for all encryption/decryptions with this
+ *	key.  This is the size in bytes of each individual plaintext and
+ *	ciphertext.  This is always a power of 2.  It might be e.g. the
+ *	filesystem block size or the disk sector size.
+ * @data_unit_size_bits: log2 of data_unit_size
+ * @dun_bytes: the number of bytes of DUN used when using this key
+ * @size: size of this key in bytes (determined by @crypto_mode)
+ * @hash: hash of this key, for keyslot manager use only
+ * @raw: the raw bytes of this key.  Only the first @size bytes are used.
+ *
+ * A blk_crypto_key is immutable once created, and many bios can reference it at
+ * the same time.  It must not be freed until all bios using it have completed.
+ */
+struct blk_crypto_key {
+	enum blk_crypto_mode_num crypto_mode;
+	unsigned int data_unit_size;
+	unsigned int data_unit_size_bits;
+	unsigned int dun_bytes;
+	unsigned int size;
+	unsigned int hash;
+	u8 raw[BLK_CRYPTO_MAX_KEY_SIZE];
+};
+
+#endif /* __LINUX_BLK_CRYPTO_H */
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 053ea4b51988..8881b25ef58b 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -43,6 +43,7 @@ struct pr_ops;
 struct rq_qos;
 struct blk_queue_stats;
 struct blk_stat_callback;
+struct keyslot_manager;
 
 #define BLKDEV_MIN_RQ	4
 #define BLKDEV_MAX_RQ	128	/* Default maximum */
@@ -474,6 +475,11 @@ struct request_queue {
 	unsigned int		dma_pad_mask;
 	unsigned int		dma_alignment;
 
+#ifdef CONFIG_BLK_INLINE_ENCRYPTION
+	/* Inline crypto capabilities */
+	struct keyslot_manager *ksm;
+#endif
+
 	unsigned int		rq_timeout;
 	int			poll_nsec;
 
diff --git a/include/linux/keyslot-manager.h b/include/linux/keyslot-manager.h
new file mode 100644
index 000000000000..c26a3477f6dc
--- /dev/null
+++ b/include/linux/keyslot-manager.h
@@ -0,0 +1,108 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2019 Google LLC
+ */
+
+#ifndef __LINUX_KEYSLOT_MANAGER_H
+#define __LINUX_KEYSLOT_MANAGER_H
+
+#include <linux/bio.h>
+
+struct keyslot_manager;
+
+/**
+ * struct keyslot_mgmt_ll_ops - functions to manage keyslots in hardware
+ * @keyslot_program:	Program the specified key into the specified slot in the
+ *			inline encryption hardware.
+ * @keyslot_evict:	Evict key from the specified keyslot in the hardware.
+ *			The key is provided so that e.g. dm layers can evict
+ *			keys from the devices that they map over.
+ *			Returns 0 on success, -errno otherwise.
+ *
+ * This structure should be provided by storage device drivers when they set up
+ * a keyslot manager - this structure holds the function ptrs that the keyslot
+ * manager will use to manipulate keyslots in the hardware.
+ */
+struct keyslot_mgmt_ll_ops {
+	int (*keyslot_program)(struct keyslot_manager *ksm,
+			       const struct blk_crypto_key *key,
+			       unsigned int slot);
+	int (*keyslot_evict)(struct keyslot_manager *ksm,
+			     const struct blk_crypto_key *key,
+			     unsigned int slot);
+};
+
+struct keyslot_manager {
+	unsigned int num_slots;
+
+	/*
+	 * The struct keyslot_mgmt_ll_ops that this keyslot manager will use
+	 * to perform operations like programming and evicting keys on the
+	 * device
+	 */
+	struct keyslot_mgmt_ll_ops ksm_ll_ops;
+
+	/*
+	 * Array of size BLK_ENCRYPTION_MODE_MAX of bitmasks that represents
+	 * whether a crypto mode and data unit size are supported. The i'th
+	 * bit of crypto_mode_supported[crypto_mode] is set iff a data unit
+	 * size of (1 << i) is supported. We only support data unit sizes
+	 * that are powers of 2.
+	 */
+	unsigned int crypto_modes_supported[BLK_ENCRYPTION_MODE_MAX];
+	/*
+	 * Array of size BLK_ENCRYPTION_MODE_MAX. The i'th entry specifies the
+	 * maximum number of dun bytes supported by the i'th crypto mode.
+	 */
+	unsigned int max_dun_bytes_supported[BLK_ENCRYPTION_MODE_MAX];
+
+	/* Private data unused by keyslot_manager. */
+	void *ll_priv_data;
+
+#ifdef CONFIG_PM
+	/* Device for runtime power management (NULL if none) */
+	struct device *dev;
+#endif
+
+	/* Protects programming and evicting keys from the device */
+	struct rw_semaphore lock;
+
+	/* List of idle slots, with least recently used slot at front */
+	wait_queue_head_t idle_slots_wait_queue;
+	struct list_head idle_slots;
+	spinlock_t idle_slots_lock;
+
+	/*
+	 * Hash table which maps key hashes to keyslots, so that we can find a
+	 * key's keyslot in O(1) time rather than O(num_slots).  Protected by
+	 * 'lock'.  A cryptographic hash function is used so that timing attacks
+	 * can't leak information about the raw keys.
+	 */
+	struct hlist_head *slot_hashtable;
+	unsigned int slot_hashtable_size;
+
+	/* Per-keyslot data */
+	struct keyslot *slots;
+};
+
+int blk_ksm_init(struct keyslot_manager *ksm, struct device *dev,
+		 unsigned int num_slots);
+
+int blk_ksm_get_slot_for_key(struct keyslot_manager *ksm,
+			     const struct blk_crypto_key *key);
+
+void blk_ksm_get_slot(struct keyslot_manager *ksm, unsigned int slot);
+
+void blk_ksm_put_slot(struct keyslot_manager *ksm, unsigned int slot);
+
+bool blk_ksm_crypto_mode_supported(struct keyslot_manager *ksm,
+				   const struct blk_crypto_key *key);
+
+int blk_ksm_evict_key(struct keyslot_manager *ksm,
+			      const struct blk_crypto_key *key);
+
+void blk_ksm_reprogram_all_keys(struct keyslot_manager *ksm);
+
+void blk_ksm_destroy(struct keyslot_manager *ksm);
+
+#endif /* __LINUX_KEYSLOT_MANAGER_H */
-- 
2.25.0.265.gbab2e86ba0-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
