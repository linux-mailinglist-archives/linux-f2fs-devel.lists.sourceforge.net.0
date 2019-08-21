Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D4C9749A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Aug 2019 10:22:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MJd7KPVlNVUx+Ckjh0UDhgJ34F4dCxKtfoV1UhW/Eo4=; b=Z8V4bTWGqCWl6Tb94bJTQvO9f
	v71TJY9LWcLjk6mvszoMLn67cKcDHHuTUClcgjT5/eTtYMieK62fYmPbd+kisWwbYJKnF9lnRz92Y
	Ol3iEn5U7n8WekJz7T4yPRYMyA1RwVnbiV9Qx04DG25hvfjLr5K7vh296BuX8eB2z34ao=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i0Lsa-0001CH-Fy; Wed, 21 Aug 2019 08:22:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3YPlcXQYKALcpXqvXqdlldib.Zlj@flex--satyat.bounces.google.com>)
 id 1i0LsY-0001C7-Sb
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Aug 2019 08:22:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GYHwPi7d8kDthlxRC2QtqYXeGrYkCO6cHAiAxIeKl2w=; b=mv2lCgS6241vTib1vIVpbAZaV
 7mw28mkJ9PMnRR5ENMH+kU4XFBdFj5Ztc3JO9QhP9tvxkdsP0i1OWEGEDz/eOTBKun7iL0BLbNWip
 ObmzepnB9q3Y2HcXz6ytcBvyVZ72S365ZPl6XBRdxPdVgOwQYcFpPOxiWqXA8oBx/EYPk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GYHwPi7d8kDthlxRC2QtqYXeGrYkCO6cHAiAxIeKl2w=; b=RnrYtR/AAo8z4VKvOBTBBMIISg
 bqUbHQY8V2UqNYa+TWQShMvE7uFzmQp5mYm9hAI7sKXMkhys3k31cyYCqGwZ9OtExdGcg8rx4nRyC
 8pJ119mWWsyCOeC+n4OyQJ0hq1+dgvuw416bXNS91kQIsfWOxVvYCGtMPbe3Ws0WsruA=;
Received: from mail-vk1-f201.google.com ([209.85.221.201])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1i0LsR-00AKgW-L3
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Aug 2019 08:22:02 +0000
Received: by mail-vk1-f201.google.com with SMTP id l3so613063vkb.15
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Aug 2019 01:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=GYHwPi7d8kDthlxRC2QtqYXeGrYkCO6cHAiAxIeKl2w=;
 b=IKW0aN+yLv7Ic3R8BjawRQWYh+JA/tjHRPyOkAe4uCVOZhHSNH7f3EdxqcueZzS0TV
 hvvFNZXC78bRng8tEVNrfSLhwlyfjIqcYkT/gTQkxFUK7has5vjW1KdEp2BzDKmWOBzt
 86rwshilNU306hzb3YkdkCnAPv0GnqtgLpw0EZUVqzMAnsym0XAnHvWPgY0GqZz5v0U7
 y7ahDdgTOzxCIsuRgq0EkYO6VBI6OMOZ//Dt3703izWC4wuW3pxJ8EfQPxIO38BkNjTi
 XMkY2XadI+ddT+C2PjCfmsigOMZBPiHpXSOJCMGiZsU1C33mCBkXAJ+uzyf5MwcUvn9r
 ZNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=GYHwPi7d8kDthlxRC2QtqYXeGrYkCO6cHAiAxIeKl2w=;
 b=bP24w+Yd1cZYoWuvw3dEmxheuJDniV/mM9GwL58JCHWRpN7u+q3IkXqadLarUVQFvk
 ATx/cC9ev43fSopgtT0ysvb6/dQJIXQaegYhXchCWCIMILbbMuiIuIggYmlP1H6TmEYu
 OC9V/5c8jzjOiRSt3NXQaFr+l3Bbker+wlXnP8adkUWk3lbiyeI+U9hwP0zIha5MB7ts
 3NtvL/ROzSsozvnfv9RzK4Gz0PMf+GeVUsqJovT2YwbdIzzvpVB5jK9tY6+wSjrHJlsO
 uRpve3yV99m7hh4RssoEMWNK2JROLJ1pME+FuLan5PWvdmMj27hdAbHipYdxrFu2svFA
 j/Ig==
X-Gm-Message-State: APjAAAUvrFEsj8uP6qeBbQxzHmMXPhcrubKCTOYofmChDZbfLYtfjIRw
 jZgeLld5/OtvoSN4LW2TebtB3rtq+94=
X-Google-Smtp-Source: APXvYqyV+P2tAM3aKCN6LYEg9vDK991bwuZUHQOqXrruD+VPP7UHRwbR1hbfob9NKwvxEUEZ7imMKQsdBc4=
X-Received: by 2002:a63:6d6:: with SMTP id 205mr28824838pgg.262.1566374240737; 
 Wed, 21 Aug 2019 00:57:20 -0700 (PDT)
Date: Wed, 21 Aug 2019 00:57:07 -0700
In-Reply-To: <20190821075714.65140-1-satyat@google.com>
Message-Id: <20190821075714.65140-2-satyat@google.com>
Mime-Version: 1.0
References: <20190821075714.65140-1-satyat@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i0LsR-00AKgW-L3
Subject: [f2fs-dev] [PATCH v4 1/8] block: Keyslot Manager for Inline
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
(an encryption key, crypto algorithm, data unit num, data unit size, etc.)
along with a data transfer request to a storage device, and the inline
encryption hardware will use that context to en/decrypt the data. The
inline encryption hardware is part of the storage device, and it
conceptually sits on the data path between system memory and the storage
device.

Inline Encryption hardware implementations often function around the
concept of "keyslots". These implementations often have a limited number
of "keyslots", each of which can hold an encryption context (we say that
an encryption context can be "programmed" into a keyslot). Requests made
to the storage device may have a keyslot associated with them, and the
inline encryption hardware will en/decrypt the data in the requests using
the encryption context programmed into that associated keyslot. As
keyslots are limited, and programming keys may be expensive in many
implementations, and multiple requests may use exactly the same encryption
contexts, we introduce a Keyslot Manager to efficiently manage keyslots.
The keyslot manager also functions as the interface that upper layers will
use to program keys into inline encryption hardware. For more information
on the Keyslot Manager, refer to documentation found in
block/keyslot-manager.c and linux/keyslot-manager.h.

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 block/Kconfig                   |   8 +
 block/Makefile                  |   1 +
 block/keyslot-manager.c         | 351 ++++++++++++++++++++++++++++++++
 include/linux/bio.h             |  12 ++
 include/linux/blkdev.h          |   6 +
 include/linux/keyslot-manager.h |  94 +++++++++
 6 files changed, 472 insertions(+)
 create mode 100644 block/keyslot-manager.c
 create mode 100644 include/linux/keyslot-manager.h

diff --git a/block/Kconfig b/block/Kconfig
index 8b5f8e560eb4..1469efdd385b 100644
--- a/block/Kconfig
+++ b/block/Kconfig
@@ -164,6 +164,14 @@ config BLK_SED_OPAL
 	Enabling this option enables users to setup/unlock/lock
 	Locking ranges for SED devices using the Opal protocol.
 
+config BLK_INLINE_ENCRYPTION
+	bool "Enable inline encryption support in block layer"
+	help
+	  Build the blk-crypto subsystem.
+	  Enabling this lets the block layer handle encryption,
+	  so users can take advantage of inline encryption
+	  hardware if present.
+
 menu "Partition Types"
 
 source "block/partitions/Kconfig"
diff --git a/block/Makefile b/block/Makefile
index eee1b4ceecf9..a72abd61b220 100644
--- a/block/Makefile
+++ b/block/Makefile
@@ -35,3 +35,4 @@ obj-$(CONFIG_BLK_DEBUG_FS)	+= blk-mq-debugfs.o
 obj-$(CONFIG_BLK_DEBUG_FS_ZONED)+= blk-mq-debugfs-zoned.o
 obj-$(CONFIG_BLK_SED_OPAL)	+= sed-opal.o
 obj-$(CONFIG_BLK_PM)		+= blk-pm.o
+obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= keyslot-manager.o
diff --git a/block/keyslot-manager.c b/block/keyslot-manager.c
new file mode 100644
index 000000000000..2f8582eb4e65
--- /dev/null
+++ b/block/keyslot-manager.c
@@ -0,0 +1,351 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * keyslot-manager.c
+ *
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
+ * Upper layers will call keyslot_manager_get_slot_for_key() to program a
+ * key into some slot in the inline encryption hardware.
+ */
+#include <linux/keyslot-manager.h>
+#include <linux/atomic.h>
+#include <linux/mutex.h>
+#include <linux/wait.h>
+#include <linux/blkdev.h>
+
+struct keyslot {
+	atomic_t slot_refs;
+	struct list_head idle_slot_node;
+};
+
+struct keyslot_manager {
+	unsigned int num_slots;
+	atomic_t num_idle_slots;
+	struct keyslot_mgmt_ll_ops ksm_ll_ops;
+	void *ll_priv_data;
+
+	/* Protects programming and evicting keys from the device */
+	struct rw_semaphore lock;
+
+	/* List of idle slots, with least recently used slot at front */
+	wait_queue_head_t idle_slots_wait_queue;
+	struct list_head idle_slots;
+	spinlock_t idle_slots_lock;
+
+	/* Per-keyslot data */
+	struct keyslot slots[];
+};
+
+/**
+ * keyslot_manager_create() - Create a keyslot manager
+ * @num_slots: The number of key slots to manage.
+ * @ksm_ll_ops: The struct keyslot_mgmt_ll_ops for the device that this keyslot
+ *		manager will use to perform operations like programming and
+ *		evicting keys.
+ * @ll_priv_data: Private data passed as is to the functions in ksm_ll_ops.
+ *
+ * Allocate memory for and initialize a keyslot manager. Called by for e.g.
+ * storage drivers to set up a keyslot manager in their request_queue.
+ *
+ * Context: May sleep
+ * Return: Pointer to constructed keyslot manager or NULL on error.
+ */
+struct keyslot_manager *keyslot_manager_create(unsigned int num_slots,
+				const struct keyslot_mgmt_ll_ops *ksm_ll_ops,
+				void *ll_priv_data)
+{
+	struct keyslot_manager *ksm;
+	int slot;
+
+	if (num_slots == 0)
+		return NULL;
+
+	/* Check that all ops are specified */
+	if (ksm_ll_ops->keyslot_program == NULL ||
+	    ksm_ll_ops->keyslot_evict == NULL ||
+	    ksm_ll_ops->crypto_mode_supported == NULL ||
+	    ksm_ll_ops->keyslot_find == NULL)
+		return NULL;
+
+	ksm = kvzalloc(struct_size(ksm, slots, num_slots), GFP_KERNEL);
+	if (!ksm)
+		return NULL;
+
+	ksm->num_slots = num_slots;
+	atomic_set(&ksm->num_idle_slots, num_slots);
+	ksm->ksm_ll_ops = *ksm_ll_ops;
+	ksm->ll_priv_data = ll_priv_data;
+
+	init_rwsem(&ksm->lock);
+
+	init_waitqueue_head(&ksm->idle_slots_wait_queue);
+	INIT_LIST_HEAD(&ksm->idle_slots);
+
+	for (slot = 0; slot < num_slots; slot++)
+		list_add(&ksm->slots[slot].idle_slot_node, &ksm->idle_slots);
+
+	spin_lock_init(&ksm->idle_slots_lock);
+
+	return ksm;
+}
+EXPORT_SYMBOL(keyslot_manager_create);
+
+static int find_and_grab_keyslot(struct keyslot_manager *ksm, const u8 *key,
+				 enum blk_crypto_mode_num crypto_mode,
+				 unsigned int data_unit_size)
+{
+	int slot;
+	unsigned long flags;
+
+	slot = ksm->ksm_ll_ops.keyslot_find(ksm->ll_priv_data, key,
+					    crypto_mode, data_unit_size);
+	if (slot < 0)
+		return slot;
+	if (WARN_ON(slot >= ksm->num_slots))
+		return -EINVAL;
+	if (atomic_inc_return(&ksm->slots[slot].slot_refs) == 1) {
+		/* Took first reference to this slot; remove it from LRU list */
+		spin_lock_irqsave(&ksm->idle_slots_lock, flags);
+		list_del(&ksm->slots[slot].idle_slot_node);
+		spin_unlock_irqrestore(&ksm->idle_slots_lock, flags);
+		atomic_dec(&ksm->num_idle_slots);
+	}
+	return slot;
+}
+
+/**
+ * keyslot_manager_get_slot_for_key() - Program a key into a keyslot.
+ * @ksm: The keyslot manager to program the key into.
+ * @key: Pointer to the bytes of the key to program. Must be the correct length
+ *      for the chosen @crypto_mode; see blk_crypto_modes in blk-crypto.c.
+ * @crypto_mode: Identifier for the encryption algorithm to use.
+ * @data_unit_size: The data unit size to use for en/decryption.
+ *
+ * Get a keyslot that's been programmed with the specified key, crypto_mode, and
+ * data_unit_size.  If one already exists, return it with incremented refcount.
+ * Otherwise, wait for a keyslot to become idle and program it.
+ *
+ * Context: Process context. Takes and releases ksm->lock.
+ * Return: The keyslot on success, else a -errno value.
+ */
+int keyslot_manager_get_slot_for_key(struct keyslot_manager *ksm,
+				     const u8 *key,
+				     enum blk_crypto_mode_num crypto_mode,
+				     unsigned int data_unit_size)
+{
+	int slot;
+	int err;
+	struct keyslot *idle_slot;
+	unsigned long flags;
+
+	down_read(&ksm->lock);
+	slot = find_and_grab_keyslot(ksm, key, crypto_mode, data_unit_size);
+	up_read(&ksm->lock);
+	if (slot != -ENOKEY)
+		return slot;
+
+	while (true) {
+		down_write(&ksm->lock);
+		slot = find_and_grab_keyslot(ksm, key, crypto_mode,
+					     data_unit_size);
+		if (slot != -ENOKEY) {
+			up_write(&ksm->lock);
+			return slot;
+		}
+
+		/*
+		 * If we're here, that means there wasn't a slot that was
+		 * already programmed with the key. So try to program it.
+		 */
+		if (atomic_read(&ksm->num_idle_slots) > 0)
+			break;
+
+		up_write(&ksm->lock);
+		wait_event(ksm->idle_slots_wait_queue,
+			(atomic_read(&ksm->num_idle_slots) > 0));
+	}
+
+	idle_slot = list_first_entry(&ksm->idle_slots, struct keyslot,
+					     idle_slot_node);
+	slot = idle_slot - ksm->slots;
+
+	err = ksm->ksm_ll_ops.keyslot_program(ksm->ll_priv_data, key,
+					      crypto_mode,
+					      data_unit_size,
+					      slot);
+
+	if (err) {
+		wake_up(&ksm->idle_slots_wait_queue);
+		up_write(&ksm->lock);
+		return err;
+	}
+
+	atomic_inc(&ksm->slots[slot].slot_refs);
+	spin_lock_irqsave(&ksm->idle_slots_lock, flags);
+	list_del(&idle_slot->idle_slot_node);
+	spin_unlock_irqrestore(&ksm->idle_slots_lock, flags);
+	atomic_dec(&ksm->num_idle_slots);
+
+	up_write(&ksm->lock);
+	return slot;
+
+}
+EXPORT_SYMBOL(keyslot_manager_get_slot_for_key);
+
+/**
+ * keyslot_manager_get_slot() - Increment the refcount on the specified slot.
+ * @ksm - The keyslot manager that we want to modify.
+ * @slot - The slot to increment the refcount of.
+ *
+ * This function assumes that there is already an active reference to that slot
+ * and simply increments the refcount. This is useful when cloning a bio that
+ * already has a reference to a keyslot, and we want the cloned bio to also have
+ * its own reference.
+ *
+ * Context: Any context.
+ */
+void keyslot_manager_get_slot(struct keyslot_manager *ksm, unsigned int slot)
+{
+	if (WARN_ON(slot >= ksm->num_slots))
+		return;
+
+	WARN_ON(atomic_inc_return(&ksm->slots[slot].slot_refs) < 2);
+}
+EXPORT_SYMBOL(keyslot_manager_get_slot);
+
+/**
+ * keyslot_manager_put_slot() - Release a reference to a slot
+ * @ksm: The keyslot manager to release the reference from.
+ * @slot: The slot to release the reference from.
+ *
+ * Context: Any context.
+ */
+void keyslot_manager_put_slot(struct keyslot_manager *ksm, unsigned int slot)
+{
+	unsigned long flags;
+
+	if (WARN_ON(slot >= ksm->num_slots))
+		return;
+
+	spin_lock_irqsave(&ksm->idle_slots_lock, flags);
+	if (atomic_dec_and_test(&ksm->slots[slot].slot_refs)) {
+		list_add_tail(&ksm->slots[slot].idle_slot_node,
+			      &ksm->idle_slots);
+		spin_unlock_irqrestore(&ksm->idle_slots_lock, flags);
+		atomic_inc(&ksm->num_idle_slots);
+		wake_up(&ksm->idle_slots_wait_queue);
+	} else {
+		spin_unlock_irqrestore(&ksm->idle_slots_lock, flags);
+	}
+}
+EXPORT_SYMBOL(keyslot_manager_put_slot);
+
+/**
+ * keyslot_manager_crypto_mode_supported() - Find out if a crypto_mode/data
+ *					     unit size combination is supported
+ *					     by a ksm.
+ * @ksm - The keyslot manager to check
+ * @crypto_mode - The crypto mode to check for.
+ * @data_unit_size - The data_unit_size for the mode.
+ *
+ * Calls and returns the result of the crypto_mode_supported function specified
+ * by the ksm.
+ *
+ * Context: Process context.
+ * Return: Whether or not this ksm supports the specified crypto_mode/
+ *	   data_unit_size combo.
+ */
+bool keyslot_manager_crypto_mode_supported(struct keyslot_manager *ksm,
+					   enum blk_crypto_mode_num crypto_mode,
+					   unsigned int data_unit_size)
+{
+	if (!ksm)
+		return false;
+	return ksm->ksm_ll_ops.crypto_mode_supported(ksm->ll_priv_data,
+						     crypto_mode,
+						     data_unit_size);
+}
+EXPORT_SYMBOL(keyslot_manager_crypto_mode_supported);
+
+bool keyslot_manager_rq_crypto_mode_supported(struct request_queue *q,
+					enum blk_crypto_mode_num crypto_mode,
+					unsigned int data_unit_size)
+{
+	return keyslot_manager_crypto_mode_supported(q->ksm, crypto_mode,
+						     data_unit_size);
+}
+EXPORT_SYMBOL(keyslot_manager_rq_crypto_mode_supported);
+
+/**
+ * keyslot_manager_evict_key() - Evict a key from the lower layer device.
+ * @ksm - The keyslot manager to evict from
+ * @key - The key to evict
+ * @crypto_mode - The crypto algorithm the key was programmed with.
+ * @data_unit_size - The data_unit_size the key was programmed with.
+ *
+ * Finds the slot that the specified key, crypto_mode, data_unit_size combo
+ * was programmed into, and evicts that slot from the lower layer device if
+ * the refcount on the slot is 0. Returns -EBUSY if the refcount is not 0, and
+ * -errno on error.
+ *
+ * Context: Process context. Takes and releases ksm->lock.
+ */
+int keyslot_manager_evict_key(struct keyslot_manager *ksm,
+			      const u8 *key,
+			      enum blk_crypto_mode_num crypto_mode,
+			      unsigned int data_unit_size)
+{
+	int slot;
+	int err = 0;
+
+	down_write(&ksm->lock);
+	slot = ksm->ksm_ll_ops.keyslot_find(ksm->ll_priv_data, key,
+					    crypto_mode,
+					    data_unit_size);
+
+	if (slot < 0) {
+		up_write(&ksm->lock);
+		return slot;
+	}
+
+	if (atomic_read(&ksm->slots[slot].slot_refs) == 0) {
+		err = ksm->ksm_ll_ops.keyslot_evict(ksm->ll_priv_data, key,
+						    crypto_mode,
+						    data_unit_size,
+						    slot);
+	} else {
+		err = -EBUSY;
+	}
+
+	up_write(&ksm->lock);
+	return err;
+}
+EXPORT_SYMBOL(keyslot_manager_evict_key);
+
+void keyslot_manager_destroy(struct keyslot_manager *ksm)
+{
+	if (!ksm)
+		return;
+	kvfree(ksm);
+}
+EXPORT_SYMBOL(keyslot_manager_destroy);
diff --git a/include/linux/bio.h b/include/linux/bio.h
index 3cdb84cdc488..6c9228dd3156 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -564,6 +564,18 @@ static inline void bvec_kunmap_irq(char *buffer, unsigned long *flags)
 }
 #endif
 
+enum blk_crypto_mode_num {
+	BLK_ENCRYPTION_MODE_INVALID	= -1,
+	BLK_ENCRYPTION_MODE_AES_256_XTS	= 0,
+	/*
+	 * TODO: Support these too
+	 * BLK_ENCRYPTION_MODE_AES_256_CTS	= 1,
+	 * BLK_ENCRYPTION_MODE_AES_128_CBC	= 2,
+	 * BLK_ENCRYPTION_MODE_AES_128_CTS	= 3,
+	 * BLK_ENCRYPTION_MODE_ADIANTUM		= 4,
+	 */
+};
+
 /*
  * BIO list management for use by remapping drivers (e.g. DM or MD) and loop.
  *
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 1ef375dafb1c..afcca4c1ff64 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -43,6 +43,7 @@ struct pr_ops;
 struct rq_qos;
 struct blk_queue_stats;
 struct blk_stat_callback;
+struct keyslot_manager;
 
 #define BLKDEV_MIN_RQ	4
 #define BLKDEV_MAX_RQ	128	/* Default maximum */
@@ -478,6 +479,11 @@ struct request_queue {
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
index 000000000000..284f53973271
--- /dev/null
+++ b/include/linux/keyslot-manager.h
@@ -0,0 +1,94 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2019 Google LLC
+ */
+
+#include <linux/bio.h>
+
+#ifndef __LINUX_KEYSLOT_MANAGER_H
+#define __LINUX_KEYSLOT_MANAGER_H
+
+/**
+ * struct keyslot_mgmt_ll_ops - functions to manage keyslots in hardware
+ * @keyslot_program:	Program the specified key and algorithm into the
+ *			specified slot in the inline encryption hardware.
+ * @keyslot_evict:	Evict key from the specified keyslot in the hardware.
+ *			The key, crypto_mode and data_unit_size are also passed
+ *			down so that for e.g. dm layers can evict keys from
+ *			the devices that they map over.
+ *			Returns 0 on success, -errno otherwise.
+ * @crypto_mode_supported:	Check whether a crypto_mode and data_unit_size
+ *				combo is supported.
+ * @keyslot_find:	Returns the slot number that matches the key,
+ *			or -ENOKEY if no match found, or -errno on
+ *			error.
+ *
+ * This structure should be provided by storage device drivers when they set up
+ * a keyslot manager - this structure holds the function ptrs that the keyslot
+ * manager will use to manipulate keyslots in the hardware.
+ */
+struct keyslot_mgmt_ll_ops {
+	int (*keyslot_program)(void *ll_priv_data, const u8 *key,
+			       enum blk_crypto_mode_num crypto_mode,
+			       unsigned int data_unit_size,
+			       unsigned int slot);
+	int (*keyslot_evict)(void *ll_priv_data, const u8 *key,
+			     enum blk_crypto_mode_num crypto_mode,
+			     unsigned int data_unit_size,
+			     unsigned int slot);
+	bool (*crypto_mode_supported)(void *ll_priv_data,
+				      enum blk_crypto_mode_num crypto_mode,
+				      unsigned int data_unit_size);
+	int (*keyslot_find)(void *ll_priv_data, const u8 *key,
+			    enum blk_crypto_mode_num crypto_mode,
+			    unsigned int data_unit_size);
+};
+
+#ifdef CONFIG_BLK_INLINE_ENCRYPTION
+struct keyslot_manager;
+
+extern struct keyslot_manager *keyslot_manager_create(unsigned int num_slots,
+				const struct keyslot_mgmt_ll_ops *ksm_ops,
+				void *ll_priv_data);
+
+extern int
+keyslot_manager_get_slot_for_key(struct keyslot_manager *ksm,
+				 const u8 *key,
+				 enum blk_crypto_mode_num crypto_mode,
+				 unsigned int data_unit_size);
+
+extern void keyslot_manager_get_slot(struct keyslot_manager *ksm,
+				     unsigned int slot);
+
+extern void keyslot_manager_put_slot(struct keyslot_manager *ksm,
+				     unsigned int slot);
+
+extern bool
+keyslot_manager_crypto_mode_supported(struct keyslot_manager *ksm,
+				      enum blk_crypto_mode_num crypto_mode,
+				      unsigned int data_unit_size);
+
+extern bool
+keyslot_manager_rq_crypto_mode_supported(struct request_queue *q,
+					 enum blk_crypto_mode_num crypto_mode,
+					 unsigned int data_unit_size);
+
+extern int keyslot_manager_evict_key(struct keyslot_manager *ksm,
+				     const u8 *key,
+				     enum blk_crypto_mode_num crypto_mode,
+				     unsigned int data_unit_size);
+
+extern void keyslot_manager_destroy(struct keyslot_manager *ksm);
+
+#else /* CONFIG_BLK_INLINE_ENCRYPTION */
+
+static inline bool
+keyslot_manager_rq_crypto_mode_supported(struct request_queue *q,
+					 enum blk_crypto_mode_num crypto_mode,
+					 unsigned int data_unit_size)
+{
+	return false;
+}
+#endif /* CONFIG_BLK_INLINE_ENCRYPTION */
+
+#endif /* __LINUX_KEYSLOT_MANAGER_H */
-- 
2.23.0.rc1.153.gdeed80330f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
