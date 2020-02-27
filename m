Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 366401727F8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Feb 2020 19:48:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j7ODF-0001sU-Qw; Thu, 27 Feb 2020 18:48:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j7ODE-0001sH-L6
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Feb 2020 18:48:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RoGuaaxOKjgeE3V+wu434dFa2U6zjIYOQiWTu5TqQIM=; b=gPHevZrH2GDBOXp5tiG/NJCjHe
 hNO7hyOUH4PV3ltaKEQ4xMfjnOAFYrWN99NjHeP40Ga38LkuOOjWVzhDxEQXZUtGiazgz9wgfWzJb
 1CCS40GLL2l9EX2b45pHq+b3LWzXq4qsKAMPCryRgA7+Ph4EQnhtrWs6Kc2Wtac5XaDo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RoGuaaxOKjgeE3V+wu434dFa2U6zjIYOQiWTu5TqQIM=; b=O8hIcOEcqriNVbaSvNB59NrpQV
 p3XuCsFgcrgSi7pU6H46S0DlMsjrzq0BasRptNPr6lZl94TXvWOsRAFnpy88UaLadjIyMNAR8hXaT
 I5dJ2XJsfYhXL/IaJnqcLRQXvg7MdR6hRtIbySeYwkoJw+G0pmshOuzaaV8LJWBZx0yU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j7OD6-007tWD-HZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Feb 2020 18:48:44 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9FEE8246C6;
 Thu, 27 Feb 2020 18:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582829310;
 bh=6F5eBwIExz2pRbV8uz/NxfeoItn55B8grvYEoyUuWRA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pwRBzyUIjv0eiNQY+EZ9h3OG20DhpbuVFa3MDYHKHkkWzDLEzD1MPaFa3MaeyfqZb
 P+fHdXgLr57xqJvNfrn5SzyN0rvTl/yX/yaasPJapqqQAudlyz7hBbrUomvSVVtbwy
 vhaDc6eduxxI2nqIGWp3fOcNzfCLw8+wqEZmBBd0=
Date: Thu, 27 Feb 2020 10:48:29 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200227184829.GD877@sol.localdomain>
References: <20200221115050.238976-1-satyat@google.com>
 <20200221115050.238976-2-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221115050.238976-2-satyat@google.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j7OD6-007tWD-HZ
Subject: Re: [f2fs-dev] [PATCH v7 1/9] block: Keyslot Manager for Inline
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
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Feb 21, 2020 at 03:50:42AM -0800, Satya Tangirala wrote:
> Inline Encryption hardware allows software to specify an encryption context
> (an encryption key, crypto algorithm, data unit num, data unit size) along
> with a data transfer request to a storage device, and the inline encryption
> hardware will use that context to en/decrypt the data. The inline
> encryption hardware is part of the storage device, and it conceptually sits
> on the data path between system memory and the storage device.
> 
> Inline Encryption hardware implementations often function around the
> concept of "keyslots". These implementations often have a limited number
> of "keyslots", each of which can hold an encryption context (we say that
> an encryption context can be "programmed" into a keyslot). Requests made
> to the storage device may have a keyslot associated with them, and the
> inline encryption hardware will en/decrypt the data in the requests using
> the encryption context programmed into that associated keyslot.

The second paragraph uses the phrase "encryption context" differently from the
first.  In the first it's (key, alg, dun, dusize) while in the second it's (key,
alg, dusize).  Maybe simply say "key" in the second?  "Key" is already used as
shorthand in lots of places without specifying that it really means also the
(alg, dusize), like in "keyslot" and "keyslot manager".

This inconsistency shows up in some other places in the patchset too.

> diff --git a/block/keyslot-manager.c b/block/keyslot-manager.c
> new file mode 100644
> index 000000000000..15dfc0c12c7f
> --- /dev/null
> +++ b/block/keyslot-manager.c
[...]
> +/**
> + * blk_ksm_init() - Initialize a keyslot manager
> + * @ksm: The keyslot_manager to initialize.
> + * @dev: Device for runtime power management (NULL if none)
> + * @num_slots: The number of key slots to manage.
> + *
> + * Allocate memory for keyslots and initialize a keyslot manager. Called by
> + * e.g. storage drivers to set up a keyslot manager in their request_queue.
> + *
> + * Return: 0 on success, or else a negative error code.
> + */
> +int blk_ksm_init(struct keyslot_manager *ksm, struct device *dev,
> +		 unsigned int num_slots)
> +{
> +	unsigned int slot;
> +	unsigned int i;
> +
> +	memset(ksm, 0, sizeof(*ksm));
> +
> +	if (num_slots == 0)
> +		return -EINVAL;
> +
> +	ksm->slots = kvzalloc(sizeof(ksm->slots[0]) * num_slots, GFP_KERNEL);
> +	if (!ksm->slots)
> +		return -ENOMEM;

This should use kvcalloc() so that an integer overflow check is included.

> +
> +	ksm->num_slots = num_slots;
> +	blk_ksm_set_dev(ksm, dev);
> +
> +	init_rwsem(&ksm->lock);
> +
> +	init_waitqueue_head(&ksm->idle_slots_wait_queue);
> +	INIT_LIST_HEAD(&ksm->idle_slots);
> +
> +	for (slot = 0; slot < num_slots; slot++) {
> +		list_add_tail(&ksm->slots[slot].idle_slot_node,
> +			      &ksm->idle_slots);
> +	}
> +
> +	spin_lock_init(&ksm->idle_slots_lock);
> +
> +	ksm->slot_hashtable_size = roundup_pow_of_two(num_slots);
> +	ksm->slot_hashtable = kvmalloc_array(ksm->slot_hashtable_size,
> +					     sizeof(ksm->slot_hashtable[0]),
> +					     GFP_KERNEL);
> +	if (!ksm->slot_hashtable)
> +		goto err_free_ksm;
> +	for (i = 0; i < ksm->slot_hashtable_size; i++)
> +		INIT_HLIST_HEAD(&ksm->slot_hashtable[i]);
> +
> +	return 0;
> +
> +err_free_ksm:
> +	blk_ksm_destroy(ksm);
> +	return -ENOMEM;
> +}
> +EXPORT_SYMBOL_GPL(blk_ksm_init);

The label should be called 'err_destroy_ksm' now that it's not actually freeing
the memory of the 'struct keyslot_manager' itself.

> +/**
> + * blk_ksm_crypto_mode_supported() - Find out if a crypto_mode/data unit size
> + *				     combination is supported by a ksm.
> + * @ksm: The keyslot manager to check
> + * @crypto_mode: The crypto mode to check for.
> + * @blk_crypto_dun_bytes: The minimum number of bytes needed for specifying DUNs
> + * @data_unit_size: The data_unit_size for the mode.
> + *
> + * Checks for crypto_mode/data unit size support.
> + *
> + * Return: Whether or not this ksm supports the specified crypto_mode/
> + *	   data_unit_size combo.
> + */
> +bool blk_ksm_crypto_mode_supported(struct keyslot_manager *ksm,
> +				   const struct blk_crypto_key *key)
> +{
> +	if (!ksm)
> +		return false;
> +	if (WARN_ON((unsigned int)key->crypto_mode >= BLK_ENCRYPTION_MODE_MAX))
> +		return false;
> +	if (WARN_ON(!is_power_of_2(key->data_unit_size)))
> +		return false;
> +	return (ksm->crypto_modes_supported[key->crypto_mode] &
> +		key->data_unit_size) &&
> +	       (ksm->max_dun_bytes_supported[key->crypto_mode] >=
> +		key->dun_bytes);
> +}

The kerneldoc for this function is outdated now that it was changed to take in a
'struct blk_crypto_key'.

Also, since the crypto_mode and data_unit_size fields of 'struct blk_crypto_key'
are already validated by blk_crypto_init_key(), they don't really need to
validated again here anymore.

> +void blk_ksm_destroy(struct keyslot_manager *ksm)
> +{
> +	if (!ksm)
> +		return;
> +	kvfree(ksm->slot_hashtable);
> +	kvfree(ksm->slots);
> +	memzero_explicit(ksm, sizeof(*ksm));
> +}
> +EXPORT_SYMBOL_GPL(blk_ksm_destroy);

In v6 => v7, zeroing the keys was lost.  We need:

	memzero_explicit(ksm->slots, sizeof(ksm->slots[0]) * ksm->num_slots);

> diff --git a/include/linux/blk-crypto.h b/include/linux/blk-crypto.h
> new file mode 100644
> index 000000000000..b8d54eca1c0d
> --- /dev/null
> +++ b/include/linux/blk-crypto.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2019 Google LLC
> + */
> +
> +#ifndef __LINUX_BLK_CRYPTO_H
> +#define __LINUX_BLK_CRYPTO_H
> +
> +enum blk_crypto_mode_num {
> +	BLK_ENCRYPTION_MODE_INVALID,
> +	BLK_ENCRYPTION_MODE_AES_256_XTS,
> +	BLK_ENCRYPTION_MODE_AES_128_CBC_ESSIV,
> +	BLK_ENCRYPTION_MODE_ADIANTUM,
> +	BLK_ENCRYPTION_MODE_MAX,
> +};
> +
> +#define BLK_CRYPTO_MAX_KEY_SIZE		64
> +
> +/**
> + * struct blk_crypto_key - an inline encryption key
> + * @crypto_mode: encryption algorithm this key is for
> + * @data_unit_size: the data unit size for all encryption/decryptions with this
> + *	key.  This is the size in bytes of each individual plaintext and
> + *	ciphertext.  This is always a power of 2.  It might be e.g. the
> + *	filesystem block size or the disk sector size.
> + * @data_unit_size_bits: log2 of data_unit_size
> + * @dun_bytes: the number of bytes of DUN used when using this key

Shouldn't @dun_bytes be:

	the maximum number of bytes of DUN needed when using this key

> +struct keyslot_manager {
> +	unsigned int num_slots;
> +
> +	/*
> +	 * The struct keyslot_mgmt_ll_ops that this keyslot manager will use
> +	 * to perform operations like programming and evicting keys on the
> +	 * device
> +	 */
> +	struct keyslot_mgmt_ll_ops ksm_ll_ops;
> +
> +	/*
> +	 * Array of size BLK_ENCRYPTION_MODE_MAX of bitmasks that represents
> +	 * whether a crypto mode and data unit size are supported. The i'th
> +	 * bit of crypto_mode_supported[crypto_mode] is set iff a data unit
> +	 * size of (1 << i) is supported. We only support data unit sizes
> +	 * that are powers of 2.
> +	 */
> +	unsigned int crypto_modes_supported[BLK_ENCRYPTION_MODE_MAX];
> +	/*
> +	 * Array of size BLK_ENCRYPTION_MODE_MAX. The i'th entry specifies the
> +	 * maximum number of dun bytes supported by the i'th crypto mode.
> +	 */
> +	unsigned int max_dun_bytes_supported[BLK_ENCRYPTION_MODE_MAX];
> +
> +	/* Private data unused by keyslot_manager. */
> +	void *ll_priv_data;
> +
> +#ifdef CONFIG_PM
> +	/* Device for runtime power management (NULL if none) */
> +	struct device *dev;
> +#endif
> +
> +	/* Protects programming and evicting keys from the device */
> +	struct rw_semaphore lock;
> +
> +	/* List of idle slots, with least recently used slot at front */
> +	wait_queue_head_t idle_slots_wait_queue;
> +	struct list_head idle_slots;
> +	spinlock_t idle_slots_lock;
> +
> +	/*
> +	 * Hash table which maps key hashes to keyslots, so that we can find a
> +	 * key's keyslot in O(1) time rather than O(num_slots).  Protected by
> +	 * 'lock'.  A cryptographic hash function is used so that timing attacks
> +	 * can't leak information about the raw keys.
> +	 */
> +	struct hlist_head *slot_hashtable;
> +	unsigned int slot_hashtable_size;
> +
> +	/* Per-keyslot data */
> +	struct keyslot *slots;
> +};

Now that struct keyslot_manager is exposed to everyone, it would be helpful if
the comments and field order made the fields clearly divided into two parts: one
part that's public, and one part that's for keyslot manager use only.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
