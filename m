Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C940D1BF780
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Apr 2020 14:00:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bZ0YwaUczWGPqgcSwU76ilxMON/6gbQcW2Igxs8pC/8=; b=SrzSP8jVkZdx6pOl2iJKvf1ib
	c8O+NT9GT7zw/gD+61wqHXueMysaaOYz9jksEDFN/BsLFYW5R6jCQdFX5p9+FPS83afHX+UEjx6Cq
	ptHxGcBAyaaOVQKxAEK0wC0BHKGC/PRt/IvtwXGcQ03SRD+a97P8r/45EtCkQEhhvwHUU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jU7rT-0000Qb-N1; Thu, 30 Apr 2020 12:00:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3xL2qXgYKAOUZHafHaNVVNSL.JVT@flex--satyat.bounces.google.com>)
 id 1jU7rR-0000QD-Pf
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Apr 2020 12:00:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BGL0YZEfUSam5rOzWw3Przpalc43EljyqO9JSjRYWYY=; b=SL5VOUJDUeGN1uEZT327C5zjB
 FdRtBNmOUx3rzRLEXXjXi527c8nkDieFlhtRA/mqi6fgEIujOnTgI4lgb4YI+bUtPi3jHLFRis8Z8
 +77hyGGygRJ6hfMHqqz1/a/i5nnvljEEpnB1VaDf5bk1xCVqb3yirfriS1c7P7rvU0WeY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BGL0YZEfUSam5rOzWw3Przpalc43EljyqO9JSjRYWYY=; b=M0XMdu9VXJBkAMafcoMLsVvQd8
 SJ+0OqgYqZHfJ+sL7Ota7HMmkhFAI5IBM7FHg7TVYUrDuGgWepKT5YD1BhFWm3+AlV15dUFZLNIM7
 POhMYsh/8uXbnQAIX/lD1cqxPvGf9ZdHefBTD5VDbbPukmgfKICx9BkTBU7J4j1rH7MA=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jU7rP-005C3B-16
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Apr 2020 12:00:13 +0000
Received: by mail-yb1-f202.google.com with SMTP id 186so7458271ybq.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Apr 2020 05:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=BGL0YZEfUSam5rOzWw3Przpalc43EljyqO9JSjRYWYY=;
 b=vlfFCcCHOJlNuZ+e7MFbSJMwA5IgJEi5eu9v6CBxWA11dUg5MWDwz1tq4ImLhvpBol
 PrmsFWR5rUgqg5RKTY9yiyqMD0nNyb3tvRPEfoFBkSrx3648LUSBWBLmRJR4aF+zdbWg
 SUNorpohMr1MT3eUk938AXys8Y/RT9oTGnV+WavF2Y5pYfPS7W9Vr/9fYNTN+hFUk1FD
 wAtnLWOQiY0Rw8I/ryd/dLv7rvXk5tbgtP93AWM0aY4au5s3XTNsW/5ZmF/RTrKdcuim
 W/FsBWztjQj6M3LV2EJfbzOEdw6BPzDNUbk5jWPivP6FS2cANcaZiYIoPzMDcFtrccRA
 LcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=BGL0YZEfUSam5rOzWw3Przpalc43EljyqO9JSjRYWYY=;
 b=sp2ZIZhf8LBwKLcSXcq7zME/U5cdDRfPyGkJ+ALw39iz+P6fJjCi8ybLevKxl4A1D+
 W7KsvB8PYBKhvCfZUs10IS7/ROH/SfK6kvrhQWf5AfgMCegOY5c2wxwD2JyleT2j7mmc
 Bq2Uzg5+MmteH2N9Xa4QdpeI/rTDkcftZ5fW2KaYry26252xPru1MdXxTs7HKWSzeBUn
 Y4FsPRJ3Fs+BNmd6TNlZnGunCHFvfJxGkCN5ogCDruR4+sZFwpqeEfpZA2MWmfpjLuZq
 VGJhcfsqQxUC9//tfGthvv+jNhkgoTvjn6bEKVrtjQIHeUBDCezdDLFNGu+hBjvRUfIa
 N48A==
X-Gm-Message-State: AGi0PuZgOWeYyyYtJyvpPnTWwhsb/+fRYtrDAs4XMhu/BHNiDnYtmM4E
 gKbL0vVVixxJMmSGLZZrrovxkquYI1Y=
X-Google-Smtp-Source: APiQypLo1XPckdsMFZ+rAssAmnrmFGMt2ANzC3vq7jsUKOIIdthACWBQ2wW8B5z76bes0/LOUGI2PYz1slk=
X-Received: by 2002:a25:58d:: with SMTP id 135mr5306731ybf.504.1588248004711; 
 Thu, 30 Apr 2020 05:00:04 -0700 (PDT)
Date: Thu, 30 Apr 2020 11:59:49 +0000
In-Reply-To: <20200430115959.238073-1-satyat@google.com>
Message-Id: <20200430115959.238073-3-satyat@google.com>
Mime-Version: 1.0
References: <20200430115959.238073-1-satyat@google.com>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.202 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.202 listed in list.dnswl.org]
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
X-Headers-End: 1jU7rP-005C3B-16
Subject: [f2fs-dev] [PATCH v12 02/12] block: Keyslot Manager for Inline
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

Inline Encryption hardware allows software to specify an encryption context
(an encryption key, crypto algorithm, data unit num, data unit size) along
with a data transfer request to a storage device, and the inline encryption
hardware will use that context to en/decrypt the data. The inline
encryption hardware is part of the storage device, and it conceptually sits
on the data path between system memory and the storage device.

Inline Encryption hardware implementations often function around the
concept of "keyslots". These implementations often have a limited number
of "keyslots", each of which can hold a key (we say that a key can be
"programmed" into a keyslot). Requests made to the storage device may have
a keyslot and a data unit number associated with them, and the inline
encryption hardware will en/decrypt the data in the requests using the key
programmed into that associated keyslot and the data unit number specified
with the request.

As keyslots are limited, and programming keys may be expensive in many
implementations, and multiple requests may use exactly the same encryption
contexts, we introduce a Keyslot Manager to efficiently manage keyslots.

We also introduce a blk_crypto_key, which will represent the key that's
programmed into keyslots managed by keyslot managers. The keyslot manager
also functions as the interface that upper layers will use to program keys
into inline encryption hardware. For more information on the Keyslot
Manager, refer to documentation found in block/keyslot-manager.c and
linux/keyslot-manager.h.

Co-developed-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
---
 block/Kconfig                   |   7 +
 block/Makefile                  |   1 +
 block/keyslot-manager.c         | 378 ++++++++++++++++++++++++++++++++
 include/linux/blk-crypto.h      |  51 +++++
 include/linux/blkdev.h          |   6 +
 include/linux/keyslot-manager.h | 106 +++++++++
 6 files changed, 549 insertions(+)
 create mode 100644 block/keyslot-manager.c
 create mode 100644 include/linux/blk-crypto.h
 create mode 100644 include/linux/keyslot-manager.h

diff --git a/block/Kconfig b/block/Kconfig
index 3bc76bb113a08..c04a1d5008421 100644
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
index 206b96e9387f4..fc963e4676b0a 100644
--- a/block/Makefile
+++ b/block/Makefile
@@ -36,3 +36,4 @@ obj-$(CONFIG_BLK_DEBUG_FS)	+= blk-mq-debugfs.o
 obj-$(CONFIG_BLK_DEBUG_FS_ZONED)+= blk-mq-debugfs-zoned.o
 obj-$(CONFIG_BLK_SED_OPAL)	+= sed-opal.o
 obj-$(CONFIG_BLK_PM)		+= blk-pm.o
+obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= keyslot-manager.o
diff --git a/block/keyslot-manager.c b/block/keyslot-manager.c
new file mode 100644
index 0000000000000..69f51909fc8ad
--- /dev/null
+++ b/block/keyslot-manager.c
@@ -0,0 +1,378 @@
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
+#include <linux/keyslot-manager.h>
+#include <linux/atomic.h>
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
+#include <linux/wait.h>
+#include <linux/blkdev.h>
+
+struct blk_ksm_keyslot {
+	atomic_t slot_refs;
+	struct list_head idle_slot_node;
+	struct hlist_node hash_node;
+	const struct blk_crypto_key *key;
+	struct blk_keyslot_manager *ksm;
+};
+
+static inline void blk_ksm_hw_enter(struct blk_keyslot_manager *ksm)
+{
+	/*
+	 * Calling into the driver requires ksm->lock held and the device
+	 * resumed.  But we must resume the device first, since that can acquire
+	 * and release ksm->lock via blk_ksm_reprogram_all_keys().
+	 */
+	if (ksm->dev)
+		pm_runtime_get_sync(ksm->dev);
+	down_write(&ksm->lock);
+}
+
+static inline void blk_ksm_hw_exit(struct blk_keyslot_manager *ksm)
+{
+	up_write(&ksm->lock);
+	if (ksm->dev)
+		pm_runtime_put_sync(ksm->dev);
+}
+
+/**
+ * blk_ksm_init() - Initialize a keyslot manager
+ * @ksm: The keyslot_manager to initialize.
+ * @num_slots: The number of key slots to manage.
+ *
+ * Allocate memory for keyslots and initialize a keyslot manager. Called by
+ * e.g. storage drivers to set up a keyslot manager in their request_queue.
+ *
+ * Return: 0 on success, or else a negative error code.
+ */
+int blk_ksm_init(struct blk_keyslot_manager *ksm, unsigned int num_slots)
+{
+	unsigned int slot;
+	unsigned int i;
+	unsigned int slot_hashtable_size;
+
+	memset(ksm, 0, sizeof(*ksm));
+
+	if (num_slots == 0)
+		return -EINVAL;
+
+	ksm->slots = kvcalloc(num_slots, sizeof(ksm->slots[0]), GFP_KERNEL);
+	if (!ksm->slots)
+		return -ENOMEM;
+
+	ksm->num_slots = num_slots;
+
+	init_rwsem(&ksm->lock);
+
+	init_waitqueue_head(&ksm->idle_slots_wait_queue);
+	INIT_LIST_HEAD(&ksm->idle_slots);
+
+	for (slot = 0; slot < num_slots; slot++) {
+		ksm->slots[slot].ksm = ksm;
+		list_add_tail(&ksm->slots[slot].idle_slot_node,
+			      &ksm->idle_slots);
+	}
+
+	spin_lock_init(&ksm->idle_slots_lock);
+
+	slot_hashtable_size = roundup_pow_of_two(num_slots);
+	ksm->log_slot_ht_size = ilog2(slot_hashtable_size);
+	ksm->slot_hashtable = kvmalloc_array(slot_hashtable_size,
+					     sizeof(ksm->slot_hashtable[0]),
+					     GFP_KERNEL);
+	if (!ksm->slot_hashtable)
+		goto err_destroy_ksm;
+	for (i = 0; i < slot_hashtable_size; i++)
+		INIT_HLIST_HEAD(&ksm->slot_hashtable[i]);
+
+	return 0;
+
+err_destroy_ksm:
+	blk_ksm_destroy(ksm);
+	return -ENOMEM;
+}
+EXPORT_SYMBOL_GPL(blk_ksm_init);
+
+static inline struct hlist_head *
+blk_ksm_hash_bucket_for_key(struct blk_keyslot_manager *ksm,
+			    const struct blk_crypto_key *key)
+{
+	return &ksm->slot_hashtable[hash_ptr(key, ksm->log_slot_ht_size)];
+}
+
+static void blk_ksm_remove_slot_from_lru_list(struct blk_ksm_keyslot *slot)
+{
+	struct blk_keyslot_manager *ksm = slot->ksm;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ksm->idle_slots_lock, flags);
+	list_del(&slot->idle_slot_node);
+	spin_unlock_irqrestore(&ksm->idle_slots_lock, flags);
+}
+
+static struct blk_ksm_keyslot *blk_ksm_find_keyslot(
+					struct blk_keyslot_manager *ksm,
+					const struct blk_crypto_key *key)
+{
+	const struct hlist_head *head = blk_ksm_hash_bucket_for_key(ksm, key);
+	struct blk_ksm_keyslot *slotp;
+
+	hlist_for_each_entry(slotp, head, hash_node) {
+		if (slotp->key == key)
+			return slotp;
+	}
+	return NULL;
+}
+
+static struct blk_ksm_keyslot *blk_ksm_find_and_grab_keyslot(
+					struct blk_keyslot_manager *ksm,
+					const struct blk_crypto_key *key)
+{
+	struct blk_ksm_keyslot *slot;
+
+	slot = blk_ksm_find_keyslot(ksm, key);
+	if (!slot)
+		return NULL;
+	if (atomic_inc_return(&slot->slot_refs) == 1) {
+		/* Took first reference to this slot; remove it from LRU list */
+		blk_ksm_remove_slot_from_lru_list(slot);
+	}
+	return slot;
+}
+
+unsigned int blk_ksm_get_slot_idx(struct blk_ksm_keyslot *slot)
+{
+	return slot - slot->ksm->slots;
+}
+EXPORT_SYMBOL_GPL(blk_ksm_get_slot_idx);
+
+/**
+ * blk_ksm_get_slot_for_key() - Program a key into a keyslot.
+ * @ksm: The keyslot manager to program the key into.
+ * @key: Pointer to the key object to program, including the raw key, crypto
+ *	 mode, and data unit size.
+ * @slot_ptr: A pointer to return the pointer of the allocated keyslot.
+ *
+ * Get a keyslot that's been programmed with the specified key.  If one already
+ * exists, return it with incremented refcount.  Otherwise, wait for a keyslot
+ * to become idle and program it.
+ *
+ * Context: Process context. Takes and releases ksm->lock.
+ * Return: BLK_STS_OK on success (and keyslot is set to the pointer of the
+ *	   allocated keyslot), or some other blk_status_t otherwise (and
+ *	   keyslot is set to NULL).
+ */
+blk_status_t blk_ksm_get_slot_for_key(struct blk_keyslot_manager *ksm,
+				      const struct blk_crypto_key *key,
+				      struct blk_ksm_keyslot **slot_ptr)
+{
+	struct blk_ksm_keyslot *slot;
+	int slot_idx;
+	int err;
+
+	*slot_ptr = NULL;
+	down_read(&ksm->lock);
+	slot = blk_ksm_find_and_grab_keyslot(ksm, key);
+	up_read(&ksm->lock);
+	if (slot)
+		goto success;
+
+	for (;;) {
+		blk_ksm_hw_enter(ksm);
+		slot = blk_ksm_find_and_grab_keyslot(ksm, key);
+		if (slot) {
+			blk_ksm_hw_exit(ksm);
+			goto success;
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
+	slot = list_first_entry(&ksm->idle_slots, struct blk_ksm_keyslot,
+				idle_slot_node);
+	slot_idx = blk_ksm_get_slot_idx(slot);
+
+	err = ksm->ksm_ll_ops.keyslot_program(ksm, key, slot_idx);
+	if (err) {
+		wake_up(&ksm->idle_slots_wait_queue);
+		blk_ksm_hw_exit(ksm);
+		return errno_to_blk_status(err);
+	}
+
+	/* Move this slot to the hash list for the new key. */
+	if (slot->key)
+		hlist_del(&slot->hash_node);
+	slot->key = key;
+	hlist_add_head(&slot->hash_node, blk_ksm_hash_bucket_for_key(ksm, key));
+
+	atomic_set(&slot->slot_refs, 1);
+
+	blk_ksm_remove_slot_from_lru_list(slot);
+
+	blk_ksm_hw_exit(ksm);
+success:
+	*slot_ptr = slot;
+	return BLK_STS_OK;
+}
+
+/**
+ * blk_ksm_put_slot() - Release a reference to a slot
+ * @slot: The keyslot to release the reference of.
+ *
+ * Context: Any context.
+ */
+void blk_ksm_put_slot(struct blk_ksm_keyslot *slot)
+{
+	struct blk_keyslot_manager *ksm;
+	unsigned long flags;
+
+	if (!slot)
+		return;
+
+	ksm = slot->ksm;
+
+	if (atomic_dec_and_lock_irqsave(&slot->slot_refs,
+					&ksm->idle_slots_lock, flags)) {
+		list_add_tail(&slot->idle_slot_node, &ksm->idle_slots);
+		spin_unlock_irqrestore(&ksm->idle_slots_lock, flags);
+		wake_up(&ksm->idle_slots_wait_queue);
+	}
+}
+
+/**
+ * blk_ksm_crypto_cfg_supported() - Find out if a crypto configuration is
+ *				    supported by a ksm.
+ * @ksm: The keyslot manager to check
+ * @cfg: The crypto configuration to check for.
+ *
+ * Checks for crypto_mode/data unit size/dun bytes support.
+ *
+ * Return: Whether or not this ksm supports the specified crypto config.
+ */
+bool blk_ksm_crypto_cfg_supported(struct blk_keyslot_manager *ksm,
+				  const struct blk_crypto_config *cfg)
+{
+	if (!ksm)
+		return false;
+	if (!(ksm->crypto_modes_supported[cfg->crypto_mode] &
+	      cfg->data_unit_size))
+		return false;
+	if (ksm->max_dun_bytes_supported < cfg->dun_bytes)
+		return false;
+	return true;
+}
+
+/**
+ * blk_ksm_evict_key() - Evict a key from the lower layer device.
+ * @ksm: The keyslot manager to evict from
+ * @key: The key to evict
+ *
+ * Find the keyslot that the specified key was programmed into, and evict that
+ * slot from the lower layer device. The slot must not be in use by any
+ * in-flight IO when this function is called.
+ *
+ * Context: Process context. Takes and releases ksm->lock.
+ * Return: 0 on success or if there's no keyslot with the specified key, -EBUSY
+ *	   if the keyslot is still in use, or another -errno value on other
+ *	   error.
+ */
+int blk_ksm_evict_key(struct blk_keyslot_manager *ksm,
+		      const struct blk_crypto_key *key)
+{
+	struct blk_ksm_keyslot *slot;
+	int err = 0;
+
+	blk_ksm_hw_enter(ksm);
+	slot = blk_ksm_find_keyslot(ksm, key);
+	if (!slot)
+		goto out_unlock;
+
+	if (WARN_ON_ONCE(atomic_read(&slot->slot_refs) != 0)) {
+		err = -EBUSY;
+		goto out_unlock;
+	}
+	err = ksm->ksm_ll_ops.keyslot_evict(ksm, key,
+					    blk_ksm_get_slot_idx(slot));
+	if (err)
+		goto out_unlock;
+
+	hlist_del(&slot->hash_node);
+	slot->key = NULL;
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
+void blk_ksm_reprogram_all_keys(struct blk_keyslot_manager *ksm)
+{
+	unsigned int slot;
+
+	/* This is for device initialization, so don't resume the device */
+	down_write(&ksm->lock);
+	for (slot = 0; slot < ksm->num_slots; slot++) {
+		const struct blk_crypto_key *key = ksm->slots[slot].key;
+		int err;
+
+		if (!key)
+			continue;
+
+		err = ksm->ksm_ll_ops.keyslot_program(ksm, key, slot);
+		WARN_ON(err);
+	}
+	up_write(&ksm->lock);
+}
+EXPORT_SYMBOL_GPL(blk_ksm_reprogram_all_keys);
+
+void blk_ksm_destroy(struct blk_keyslot_manager *ksm)
+{
+	if (!ksm)
+		return;
+	kvfree(ksm->slot_hashtable);
+	memzero_explicit(ksm->slots, sizeof(ksm->slots[0]) * ksm->num_slots);
+	kvfree(ksm->slots);
+	memzero_explicit(ksm, sizeof(*ksm));
+}
+EXPORT_SYMBOL_GPL(blk_ksm_destroy);
diff --git a/include/linux/blk-crypto.h b/include/linux/blk-crypto.h
new file mode 100644
index 0000000000000..570fdd251e032
--- /dev/null
+++ b/include/linux/blk-crypto.h
@@ -0,0 +1,51 @@
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
+/**
+ * struct blk_crypto_config - an inline encryption key's crypto configuration
+ * @crypto_mode: encryption algorithm this key is for
+ * @data_unit_size: the data unit size for all encryption/decryptions with this
+ *	key.  This is the size in bytes of each individual plaintext and
+ *	ciphertext.  This is always a power of 2.  It might be e.g. the
+ *	filesystem block size or the disk sector size.
+ * @dun_bytes: the maximum number of bytes of DUN used when using this key
+ */
+struct blk_crypto_config {
+	enum blk_crypto_mode_num crypto_mode;
+	unsigned int data_unit_size;
+	unsigned int dun_bytes;
+};
+
+/**
+ * struct blk_crypto_key - an inline encryption key
+ * @crypto_cfg: the crypto configuration (like crypto_mode, key size) for this
+ *		key
+ * @data_unit_size_bits: log2 of data_unit_size
+ * @size: size of this key in bytes (determined by @crypto_cfg.crypto_mode)
+ * @raw: the raw bytes of this key.  Only the first @size bytes are used.
+ *
+ * A blk_crypto_key is immutable once created, and many bios can reference it at
+ * the same time.  It must not be freed until all bios using it have completed.
+ */
+struct blk_crypto_key {
+	struct blk_crypto_config crypto_cfg;
+	unsigned int data_unit_size_bits;
+	unsigned int size;
+	u8 raw[BLK_CRYPTO_MAX_KEY_SIZE];
+};
+
+#endif /* __LINUX_BLK_CRYPTO_H */
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 32868fbedc9e9..7b36695f71931 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -43,6 +43,7 @@ struct pr_ops;
 struct rq_qos;
 struct blk_queue_stats;
 struct blk_stat_callback;
+struct blk_keyslot_manager;
 
 #define BLKDEV_MIN_RQ	4
 #define BLKDEV_MAX_RQ	128	/* Default maximum */
@@ -474,6 +475,11 @@ struct request_queue {
 	unsigned int		dma_pad_mask;
 	unsigned int		dma_alignment;
 
+#ifdef CONFIG_BLK_INLINE_ENCRYPTION
+	/* Inline crypto capabilities */
+	struct blk_keyslot_manager *ksm;
+#endif
+
 	unsigned int		rq_timeout;
 	int			poll_nsec;
 
diff --git a/include/linux/keyslot-manager.h b/include/linux/keyslot-manager.h
new file mode 100644
index 0000000000000..18f3f5346843f
--- /dev/null
+++ b/include/linux/keyslot-manager.h
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2019 Google LLC
+ */
+
+#ifndef __LINUX_KEYSLOT_MANAGER_H
+#define __LINUX_KEYSLOT_MANAGER_H
+
+#include <linux/bio.h>
+#include <linux/blk-crypto.h>
+
+struct blk_keyslot_manager;
+
+/**
+ * struct blk_ksm_ll_ops - functions to manage keyslots in hardware
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
+struct blk_ksm_ll_ops {
+	int (*keyslot_program)(struct blk_keyslot_manager *ksm,
+			       const struct blk_crypto_key *key,
+			       unsigned int slot);
+	int (*keyslot_evict)(struct blk_keyslot_manager *ksm,
+			     const struct blk_crypto_key *key,
+			     unsigned int slot);
+};
+
+struct blk_keyslot_manager {
+	/*
+	 * The struct blk_ksm_ll_ops that this keyslot manager will use
+	 * to perform operations like programming and evicting keys on the
+	 * device
+	 */
+	struct blk_ksm_ll_ops ksm_ll_ops;
+
+	/*
+	 * The maximum number of bytes supported for specifying the data unit
+	 * number.
+	 */
+	unsigned int max_dun_bytes_supported;
+
+	/*
+	 * Array of size BLK_ENCRYPTION_MODE_MAX of bitmasks that represents
+	 * whether a crypto mode and data unit size are supported. The i'th
+	 * bit of crypto_mode_supported[crypto_mode] is set iff a data unit
+	 * size of (1 << i) is supported. We only support data unit sizes
+	 * that are powers of 2.
+	 */
+	unsigned int crypto_modes_supported[BLK_ENCRYPTION_MODE_MAX];
+
+	/* Device for runtime power management (NULL if none) */
+	struct device *dev;
+
+	/* Here onwards are *private* fields for internal keyslot manager use */
+
+	unsigned int num_slots;
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
+	 * Hash table which maps struct *blk_crypto_key to keyslots, so that we
+	 * can find a key's keyslot in O(1) time rather than O(num_slots).
+	 * Protected by 'lock'.
+	 */
+	struct hlist_head *slot_hashtable;
+	unsigned int log_slot_ht_size;
+
+	/* Per-keyslot data */
+	struct blk_ksm_keyslot *slots;
+};
+
+int blk_ksm_init(struct blk_keyslot_manager *ksm, unsigned int num_slots);
+
+blk_status_t blk_ksm_get_slot_for_key(struct blk_keyslot_manager *ksm,
+				      const struct blk_crypto_key *key,
+				      struct blk_ksm_keyslot **slot_ptr);
+
+unsigned int blk_ksm_get_slot_idx(struct blk_ksm_keyslot *slot);
+
+void blk_ksm_put_slot(struct blk_ksm_keyslot *slot);
+
+bool blk_ksm_crypto_cfg_supported(struct blk_keyslot_manager *ksm,
+				  const struct blk_crypto_config *cfg);
+
+int blk_ksm_evict_key(struct blk_keyslot_manager *ksm,
+		      const struct blk_crypto_key *key);
+
+void blk_ksm_reprogram_all_keys(struct blk_keyslot_manager *ksm);
+
+void blk_ksm_destroy(struct blk_keyslot_manager *ksm);
+
+#endif /* __LINUX_KEYSLOT_MANAGER_H */
-- 
2.26.2.303.gf8c07b1a785-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
