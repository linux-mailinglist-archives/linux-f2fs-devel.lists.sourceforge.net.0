Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B3C124B76
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Dec 2019 16:21:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ay01rVbT6BlMdNwAOa7z3ZQ8Et13C0+jz2q1uxV5Wz4=; b=SrOfVvUJz8LZRB3O8a0THLdOJ
	EioQVQXtwnb59tg6cD4u7zLn87Xniy/eGIMZjpBTEvEVyvg/RRYU1WLB5H+PNVvojQnKTCF0Jfoj6
	0aJKVVTYUidFg7vLFSXDjedBWbBtigwnOu2sbq8N73DVIKxun7VuiBklkK4r/4vyQygvY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ihb8S-00039W-HI; Wed, 18 Dec 2019 15:21:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3Jj36XQYKAH8vdw1dwjrrjoh.frp@flex--satyat.bounces.google.com>)
 id 1ihb8Q-00039O-RD
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 15:21:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i6tUuy7TVhBHkRf+63OSgdriuOt6hPil9BSqL4X+lZA=; b=RlwIBcdojQwD/mQgBfrIWSUvu
 7WhW94x8QSUX37sqcs1m8eS06wziGSnPPvrUnv4HFxzlIvmqfU50StNDB20I3eaUqB6j3nMNNlSIv
 iAJvZuqx0VGsAVVq/NIaiK9yqyQhOgvBLys0XzhYkn+psJkU2hIFy4IvMDfnDRl2nnINg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i6tUuy7TVhBHkRf+63OSgdriuOt6hPil9BSqL4X+lZA=; b=RIDnTR0sQursmDjb+WsNoiE+jT
 +pj0/PdLXE2F4Kvkh3G/bW+F9o79TP59HDBpCJr6JobXSJtrJn5+MpGqsS4qG9invOKX8rScIZ7jg
 MtIlHtbBfzEMnLQ+bHoafPz2CbeFDInP+0WGQPzodUwfRsV33DO03MaX5+iLQeyi0Fvs=;
Received: from mail-qv1-f74.google.com ([209.85.219.74])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ihb8O-005llV-S2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 15:21:10 +0000
Received: by mail-qv1-f74.google.com with SMTP id c22so1547538qvc.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Dec 2019 07:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=i6tUuy7TVhBHkRf+63OSgdriuOt6hPil9BSqL4X+lZA=;
 b=sUfwVq1MkljfEyfXUl2Kx+Kh76tFDanzswd33LuO8HL+d6vNVzqnC2urgANWsxn4ii
 Ot9r9ViPcvXGiEPq2kEZLsn9Vr7XoGZaNPmu6tjFkAZ0XFIhQ0ZCrCtTfb1M6jzUTN/J
 cFu2757ha+/0X0LJtTOJtt0e21NaJS2LpjaAFPBY3bsL1ZbvKITicGw1Kubm5yiWWIo3
 W1o063b0TcjyFyJNkYq78PgjH0aVW/vMVsYkhl62N8viaTIp+LwAM6NpB6L9fmNsWroE
 vf/2LC29rtG4mGywsoO1AbQ7f6RCzwdQU8zNrBrsPPX5mT1A3IgcU2ApDdzitpJRubYs
 ffWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=i6tUuy7TVhBHkRf+63OSgdriuOt6hPil9BSqL4X+lZA=;
 b=Er39eJV0aQFKONTo87tRgDomsV/CtuktkHhQ2yB+m3GWdCv3XHikOF4b6sxSMoVGrp
 t0JOTJCgz2KiJJpzJqs+XgV1YGRvPbC4zEEKWgekIzYfG4h7lheXUcSCo6YSlod+RtY8
 Wak22y6HhwcgkENacUiw3lYQf1ax6LPJK0DtP3QgxiBqTqSY+Ba2eP8XPIDE/yl8pBg8
 ET7x79o8/mFXZCMyoJsR3XAVXH+Bpgi35k97djGf8n38fm/ksV9a3Nx4BoEGHjLlNqT9
 0sY4lsWDUABP9YSy6kqVHVewW4AN1+VTJS5mDBcurRenpa9lwovuIpoPZxvIDjSm60Vf
 YPKw==
X-Gm-Message-State: APjAAAXsAuKTPlJJv+rwxGWAH48P8qa1kPALnk/PapsvE0UVxsFCSEKf
 0Ng06jYTw3/szV/PF+iNIsKxNBo0L1Q=
X-Google-Smtp-Source: APXvYqx26Fvr5rx9DzbxFQORVGOdNZxD03Vj4O3d120R6DJqCLIK61bL0uyx/QENqLOMXzm8zudl3s5Y2vo=
X-Received: by 2002:aed:2202:: with SMTP id n2mr2567206qtc.4.1576680742067;
 Wed, 18 Dec 2019 06:52:22 -0800 (PST)
Date: Wed, 18 Dec 2019 06:51:28 -0800
In-Reply-To: <20191218145136.172774-1-satyat@google.com>
Message-Id: <20191218145136.172774-2-satyat@google.com>
Mime-Version: 1.0
References: <20191218145136.172774-1-satyat@google.com>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.74 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.74 listed in wl.mailspike.net]
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
X-Headers-End: 1ihb8O-005llV-S2
Subject: [f2fs-dev] [PATCH v6 1/9] block: Keyslot Manager for Inline
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
 include/linux/bio-crypt-ctx.h   |  49 ++++
 include/linux/bio.h             |   1 +
 include/linux/blkdev.h          |   6 +
 include/linux/keyslot-manager.h |  60 +++++
 7 files changed, 550 insertions(+)
 create mode 100644 block/keyslot-manager.c
 create mode 100644 include/linux/bio-crypt-ctx.h
 create mode 100644 include/linux/keyslot-manager.h

diff --git a/block/Kconfig b/block/Kconfig
index c23094a14a2b..f19da9da80fc 100644
--- a/block/Kconfig
+++ b/block/Kconfig
@@ -181,6 +181,13 @@ config BLK_SED_OPAL
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
index 205a5f2fef17..7c603669f216 100644
--- a/block/Makefile
+++ b/block/Makefile
@@ -37,3 +37,4 @@ obj-$(CONFIG_BLK_DEBUG_FS)	+= blk-mq-debugfs.o
 obj-$(CONFIG_BLK_DEBUG_FS_ZONED)+= blk-mq-debugfs-zoned.o
 obj-$(CONFIG_BLK_SED_OPAL)	+= sed-opal.o
 obj-$(CONFIG_BLK_PM)		+= blk-pm.o
+obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= keyslot-manager.o
\ No newline at end of file
diff --git a/block/keyslot-manager.c b/block/keyslot-manager.c
new file mode 100644
index 000000000000..cdf0607019d4
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
+ * Upper layers will call keyslot_manager_get_slot_for_key() to program a
+ * key into some slot in the inline encryption hardware.
+ */
+#include <crypto/algapi.h>
+#include <linux/keyslot-manager.h>
+#include <linux/atomic.h>
+#include <linux/mutex.h>
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
+struct keyslot_manager {
+	unsigned int num_slots;
+	struct keyslot_mgmt_ll_ops ksm_ll_ops;
+	unsigned int crypto_mode_supported[BLK_ENCRYPTION_MODE_MAX];
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
+	struct keyslot slots[];
+};
+
+/**
+ * keyslot_manager_create() - Create a keyslot manager
+ * @num_slots: The number of key slots to manage.
+ * @ksm_ll_ops: The struct keyslot_mgmt_ll_ops for the device that this keyslot
+ *		manager will use to perform operations like programming and
+ *		evicting keys.
+ * @crypto_mode_supported:	Array of size BLK_ENCRYPTION_MODE_MAX of
+ *				bitmasks that represents whether a crypto mode
+ *				and data unit size are supported. The i'th bit
+ *				of crypto_mode_supported[crypto_mode] is set iff
+ *				a data unit size of (1 << i) is supported. We
+ *				only support data unit sizes that are powers of
+ *				2.
+ * @ll_priv_data: Private data passed as is to the functions in ksm_ll_ops.
+ *
+ * Allocate memory for and initialize a keyslot manager. Called by e.g.
+ * storage drivers to set up a keyslot manager in their request_queue.
+ *
+ * Context: May sleep
+ * Return: Pointer to constructed keyslot manager or NULL on error.
+ */
+struct keyslot_manager *keyslot_manager_create(unsigned int num_slots,
+	const struct keyslot_mgmt_ll_ops *ksm_ll_ops,
+	const unsigned int crypto_mode_supported[BLK_ENCRYPTION_MODE_MAX],
+	void *ll_priv_data)
+{
+	struct keyslot_manager *ksm;
+	unsigned int slot;
+	unsigned int i;
+
+	if (num_slots == 0)
+		return NULL;
+
+	/* Check that all ops are specified */
+	if (ksm_ll_ops->keyslot_program == NULL ||
+	    ksm_ll_ops->keyslot_evict == NULL)
+		return NULL;
+
+	ksm = kvzalloc(struct_size(ksm, slots, num_slots), GFP_KERNEL);
+	if (!ksm)
+		return NULL;
+
+	ksm->num_slots = num_slots;
+	ksm->ksm_ll_ops = *ksm_ll_ops;
+	memcpy(ksm->crypto_mode_supported, crypto_mode_supported,
+	       sizeof(ksm->crypto_mode_supported));
+	ksm->ll_priv_data = ll_priv_data;
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
+	return ksm;
+
+err_free_ksm:
+	keyslot_manager_destroy(ksm);
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(keyslot_manager_create);
+
+static inline struct hlist_head *
+hash_bucket_for_key(struct keyslot_manager *ksm,
+		    const struct blk_crypto_key *key)
+{
+	return &ksm->slot_hashtable[key->hash & (ksm->slot_hashtable_size - 1)];
+}
+
+static void remove_slot_from_lru_list(struct keyslot_manager *ksm, int slot)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&ksm->idle_slots_lock, flags);
+	list_del(&ksm->slots[slot].idle_slot_node);
+	spin_unlock_irqrestore(&ksm->idle_slots_lock, flags);
+}
+
+static int find_keyslot(struct keyslot_manager *ksm,
+			const struct blk_crypto_key *key)
+{
+	const struct hlist_head *head = hash_bucket_for_key(ksm, key);
+	const struct keyslot *slotp;
+
+	hlist_for_each_entry(slotp, head, hash_node) {
+		if (slotp->key.hash == key->hash &&
+		    slotp->key.crypto_mode == key->crypto_mode &&
+		    slotp->key.data_unit_size == key->data_unit_size &&
+		    !crypto_memneq(slotp->key.raw, key->raw, key->size))
+			return slotp - ksm->slots;
+	}
+	return -ENOKEY;
+}
+
+static int find_and_grab_keyslot(struct keyslot_manager *ksm,
+				 const struct blk_crypto_key *key)
+{
+	int slot;
+
+	slot = find_keyslot(ksm, key);
+	if (slot < 0)
+		return slot;
+	if (atomic_inc_return(&ksm->slots[slot].slot_refs) == 1) {
+		/* Took first reference to this slot; remove it from LRU list */
+		remove_slot_from_lru_list(ksm, slot);
+	}
+	return slot;
+}
+
+/**
+ * keyslot_manager_get_slot_for_key() - Program a key into a keyslot.
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
+int keyslot_manager_get_slot_for_key(struct keyslot_manager *ksm,
+				     const struct blk_crypto_key *key)
+{
+	int slot;
+	int err;
+	struct keyslot *idle_slot;
+
+	down_read(&ksm->lock);
+	slot = find_and_grab_keyslot(ksm, key);
+	up_read(&ksm->lock);
+	if (slot != -ENOKEY)
+		return slot;
+
+	for (;;) {
+		down_write(&ksm->lock);
+		slot = find_and_grab_keyslot(ksm, key);
+		if (slot != -ENOKEY) {
+			up_write(&ksm->lock);
+			return slot;
+		}
+
+		/*
+		 * If we're here, that means there wasn't a slot that was
+		 * already programmed with the key. So try to program it.
+		 */
+		if (!list_empty(&ksm->idle_slots))
+			break;
+
+		up_write(&ksm->lock);
+		wait_event(ksm->idle_slots_wait_queue,
+			   !list_empty(&ksm->idle_slots));
+	}
+
+	idle_slot = list_first_entry(&ksm->idle_slots, struct keyslot,
+					     idle_slot_node);
+	slot = idle_slot - ksm->slots;
+
+	err = ksm->ksm_ll_ops.keyslot_program(ksm, key, slot);
+	if (err) {
+		wake_up(&ksm->idle_slots_wait_queue);
+		up_write(&ksm->lock);
+		return err;
+	}
+
+	/* Move this slot to the hash list for the new key. */
+	if (idle_slot->key.crypto_mode != BLK_ENCRYPTION_MODE_INVALID)
+		hlist_del(&idle_slot->hash_node);
+	hlist_add_head(&idle_slot->hash_node, hash_bucket_for_key(ksm, key));
+
+	atomic_set(&idle_slot->slot_refs, 1);
+	idle_slot->key = *key;
+
+	remove_slot_from_lru_list(ksm, slot);
+
+	up_write(&ksm->lock);
+	return slot;
+}
+
+/**
+ * keyslot_manager_get_slot() - Increment the refcount on the specified slot.
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
+void keyslot_manager_get_slot(struct keyslot_manager *ksm, unsigned int slot)
+{
+	if (WARN_ON(slot >= ksm->num_slots))
+		return;
+
+	WARN_ON(atomic_inc_return(&ksm->slots[slot].slot_refs) < 2);
+}
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
+ * keyslot_manager_crypto_mode_supported() - Find out if a crypto_mode/data
+ *					     unit size combination is supported
+ *					     by a ksm.
+ * @ksm: The keyslot manager to check
+ * @crypto_mode: The crypto mode to check for.
+ * @data_unit_size: The data_unit_size for the mode.
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
+	if (WARN_ON(crypto_mode >= BLK_ENCRYPTION_MODE_MAX))
+		return false;
+	if (WARN_ON(!is_power_of_2(data_unit_size)))
+		return false;
+	return ksm->crypto_mode_supported[crypto_mode] & data_unit_size;
+}
+
+/**
+ * keyslot_manager_evict_key() - Evict a key from the lower layer device.
+ * @ksm: The keyslot manager to evict from
+ * @key: The key to evict
+ *
+ * Find the keyslot that the specified key was programmed into, and evict that
+ * slot from the lower layer device if that slot is not currently in use.
+ *
+ * Context: Process context. Takes and releases ksm->lock.
+ * Return: 0 on success, -EBUSY if the key is still in use, or another
+ *	   -errno value on other error.
+ */
+int keyslot_manager_evict_key(struct keyslot_manager *ksm,
+			      const struct blk_crypto_key *key)
+{
+	int slot;
+	int err;
+	struct keyslot *slotp;
+
+	down_write(&ksm->lock);
+	slot = find_keyslot(ksm, key);
+	if (slot < 0) {
+		err = slot;
+		goto out_unlock;
+	}
+	slotp = &ksm->slots[slot];
+
+	if (atomic_read(&slotp->slot_refs) != 0) {
+		err = -EBUSY;
+		goto out_unlock;
+	}
+	err = ksm->ksm_ll_ops.keyslot_evict(ksm, key, slot);
+	if (err)
+		goto out_unlock;
+
+	hlist_del(&slotp->hash_node);
+	memzero_explicit(&slotp->key, sizeof(slotp->key));
+	err = 0;
+out_unlock:
+	up_write(&ksm->lock);
+	return err;
+}
+
+/**
+ * keyslot_manager_reprogram_all_keys() - Re-program all keyslots.
+ * @ksm: The keyslot manager
+ *
+ * Re-program all keyslots that are supposed to have a key programmed.  This is
+ * intended only for use by drivers for hardware that loses its keys on reset.
+ *
+ * Context: Process context. Takes and releases ksm->lock.
+ */
+void keyslot_manager_reprogram_all_keys(struct keyslot_manager *ksm)
+{
+	unsigned int slot;
+
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
+EXPORT_SYMBOL_GPL(keyslot_manager_reprogram_all_keys);
+
+/**
+ * keyslot_manager_private() - return the private data stored with ksm
+ * @ksm: The keyslot manager
+ *
+ * Returns the private data passed to the ksm when it was created.
+ */
+void *keyslot_manager_private(struct keyslot_manager *ksm)
+{
+	return ksm->ll_priv_data;
+}
+EXPORT_SYMBOL_GPL(keyslot_manager_private);
+
+void keyslot_manager_destroy(struct keyslot_manager *ksm)
+{
+	if (ksm) {
+		kvfree(ksm->slot_hashtable);
+		memzero_explicit(ksm, struct_size(ksm, slots, ksm->num_slots));
+		kvfree(ksm);
+	}
+}
+EXPORT_SYMBOL_GPL(keyslot_manager_destroy);
diff --git a/include/linux/bio-crypt-ctx.h b/include/linux/bio-crypt-ctx.h
new file mode 100644
index 000000000000..dd4ac9d95428
--- /dev/null
+++ b/include/linux/bio-crypt-ctx.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2019 Google LLC
+ */
+#ifndef __LINUX_BIO_CRYPT_CTX_H
+#define __LINUX_BIO_CRYPT_CTX_H
+
+enum blk_crypto_mode_num {
+	BLK_ENCRYPTION_MODE_INVALID,
+	BLK_ENCRYPTION_MODE_AES_256_XTS,
+	BLK_ENCRYPTION_MODE_AES_128_CBC,
+	BLK_ENCRYPTION_MODE_ADIANTUM,
+	BLK_ENCRYPTION_MODE_MAX,
+};
+
+#ifdef CONFIG_BLOCK
+#include <linux/blk_types.h>
+
+#ifdef CONFIG_BLK_INLINE_ENCRYPTION
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
+	unsigned int size;
+	unsigned int hash;
+	u8 raw[BLK_CRYPTO_MAX_KEY_SIZE];
+};
+
+#endif /* CONFIG_BLK_INLINE_ENCRYPTION */
+#endif /* CONFIG_BLOCK */
+#endif /* __LINUX_BIO_CRYPT_CTX_H */
diff --git a/include/linux/bio.h b/include/linux/bio.h
index 3cdb84cdc488..63d0fee423fa 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -8,6 +8,7 @@
 #include <linux/highmem.h>
 #include <linux/mempool.h>
 #include <linux/ioprio.h>
+#include <linux/bio-crypt-ctx.h>
 
 #ifdef CONFIG_BLOCK
 /* struct bio, bio_vec and BIO_* flags are defined in blk_types.h */
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 47eb22a3b7f9..cb98f4bdff87 100644
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
index 000000000000..fbc423fe5cd5
--- /dev/null
+++ b/include/linux/keyslot-manager.h
@@ -0,0 +1,60 @@
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
+struct keyslot_manager *keyslot_manager_create(unsigned int num_slots,
+	const struct keyslot_mgmt_ll_ops *ksm_ops,
+	const unsigned int crypto_mode_supported[BLK_ENCRYPTION_MODE_MAX],
+	void *ll_priv_data);
+
+int keyslot_manager_get_slot_for_key(struct keyslot_manager *ksm,
+				     const struct blk_crypto_key *key);
+
+void keyslot_manager_get_slot(struct keyslot_manager *ksm, unsigned int slot);
+
+void keyslot_manager_put_slot(struct keyslot_manager *ksm, unsigned int slot);
+
+bool keyslot_manager_crypto_mode_supported(struct keyslot_manager *ksm,
+					   enum blk_crypto_mode_num crypto_mode,
+					   unsigned int data_unit_size);
+
+int keyslot_manager_evict_key(struct keyslot_manager *ksm,
+			      const struct blk_crypto_key *key);
+
+void keyslot_manager_reprogram_all_keys(struct keyslot_manager *ksm);
+
+void *keyslot_manager_private(struct keyslot_manager *ksm);
+
+void keyslot_manager_destroy(struct keyslot_manager *ksm);
+
+#endif /* __LINUX_KEYSLOT_MANAGER_H */
-- 
2.24.1.735.g03f4e72817-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
