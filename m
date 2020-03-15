Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8793F185FAE
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 Mar 2020 21:08:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jDZYi-0002ah-5b; Sun, 15 Mar 2020 20:08:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jDZYh-0002ab-2U
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 15 Mar 2020 20:08:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2xdDcY/AWYaqBzxZnH04Kx4VWIF2XGkFMyPOE5N+gBM=; b=TamXCI0Z0Jd8kGwZX/QPmCroO4
 2VsTthnK37A/w5OcSoxT5JAKSoNHDTJFNcwBwgc4V6WMRBjx+NAxx1JFfXkQiMhm4yaIhLu3V30LH
 7y40G9njSVQ1jO5rXb9trHF/pryRLUZxFyMh20w3DFDAzy67QBXuak10XFpQ9CY5rbKs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2xdDcY/AWYaqBzxZnH04Kx4VWIF2XGkFMyPOE5N+gBM=; b=Cq5BXfVZZH6MEcmz5qJFrFGLao
 1GUvzHCHEkHxoM2vzXqc9T/Ll6+tZ3Ol518rNcXkeFB95XFcXiBvoBh8Yt6nIeYQDnOpn3pK0beVW
 TWb1suH79y3H29UOhnjBXnbKkKYILJeKmT2cTHiVgehDVC5ffKZfIvdgPkmBuzRnqyiQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jDZYe-008I3r-7x
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 15 Mar 2020 20:08:27 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 67C74205ED;
 Sun, 15 Mar 2020 20:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584302893;
 bh=Ssco+4pYgONTp7ZfvK/vN+7ZlC1WiXKRne2NNmGbtQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hH61wGGIGKVQt6EL/9yLCEnVMdsS+NOazSWI2H+vsUtBwE50LoD1PA94Obfxgrsnf
 gmMOiqVAiAPeCHnMbuV/HDOOmgiSwBIQCXHapF7wcySwtq2KTjl/7HSkQ6l4Zr5k8K
 Dbfgmh+pFI+RffVdf88RUmuEHZC45BNTwDZ82p8Q=
Date: Sun, 15 Mar 2020 13:08:11 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200315200811.GG1055@sol.localdomain>
References: <20200312080253.3667-1-satyat@google.com>
 <20200312080253.3667-2-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200312080253.3667-2-satyat@google.com>
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jDZYe-008I3r-7x
Subject: Re: [f2fs-dev] [PATCH v8 01/11] block: Keyslot Manager for Inline
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

On Thu, Mar 12, 2020 at 01:02:43AM -0700, Satya Tangirala wrote:
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
> +	ksm->slots = kvcalloc(num_slots, sizeof(ksm->slots[0]), GFP_KERNEL);
> +	if (!ksm->slots)
> +		return -ENOMEM;
> +
> +	ksm->num_slots = num_slots;
> +	ksm->dev = dev;

Seems that now that keyslot_manager::dev is an unconditional field and callers
initialize other fields of the keyslot_manager, the 'dev' parameter should be
removed from blk_ksm_init() and the caller should be responsible for setting
'dev' if they need runtime power management.

> +/**
> + * blk_ksm_get_slot_for_key() - Program a key into a keyslot.
> + * @ksm: The keyslot manager to program the key into.
> + * @key: Pointer to the key object to program, including the raw key, crypto
> + *	 mode, and data unit size.
> + * @keyslot: A pointer to return the pointer of the allocated keyslot.
> + *
> + * Get a keyslot that's been programmed with the specified key.  If one already
> + * exists, return it with incremented refcount.  Otherwise, wait for a keyslot
> + * to become idle and program it.
> + *
> + * Context: Process context. Takes and releases ksm->lock.
> + * Return: BLK_STATUS_OK on success (and keyslot is set to the pointer of the
> + *	   allocated keyslot), and BLK_STATUS_IOERR otherwise (and keyslot is
> + *	   set to NULL).
> + */

There can be other errors besides BLK_STATUS_IOERR returned.

> +/**
> + * blk_ksm_put_slot() - Release a reference to a slot
> + * @slot: The keyslot to release the reference of.
> + *
> + * Context: Any context.
> + */
> +void blk_ksm_put_slot(struct blk_ksm_keyslot *slot)
> +{
> +	struct keyslot_manager *ksm = slot->ksm;
> +	unsigned long flags;
> +
> +	if (!slot)
> +		return;
> +
> +	if (atomic_dec_and_lock_irqsave(&slot->slot_refs,
> +					&ksm->idle_slots_lock, flags)) {
> +		list_add_tail(&slot->idle_slot_node,
> +			      &ksm->idle_slots);

Nit: the arguments to list_add_tail() fit on one line

> diff --git a/include/linux/keyslot-manager.h b/include/linux/keyslot-manager.h
> new file mode 100644
> index 000000000000..7f88ed02faee
> --- /dev/null
> +++ b/include/linux/keyslot-manager.h
> @@ -0,0 +1,108 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2019 Google LLC
> + */
> +
> +#ifndef __LINUX_KEYSLOT_MANAGER_H
> +#define __LINUX_KEYSLOT_MANAGER_H
> +
> +#include <linux/bio.h>
> +#include <linux/blk-crypto.h>
> +
> +struct keyslot_manager;
> +
> +/**
> + * struct keyslot_mgmt_ll_ops - functions to manage keyslots in hardware
> + * @keyslot_program:	Program the specified key into the specified slot in the
> + *			inline encryption hardware.
> + * @keyslot_evict:	Evict key from the specified keyslot in the hardware.
> + *			The key is provided so that e.g. dm layers can evict
> + *			keys from the devices that they map over.
> + *			Returns 0 on success, -errno otherwise.
> + *
> + * This structure should be provided by storage device drivers when they set up
> + * a keyslot manager - this structure holds the function ptrs that the keyslot
> + * manager will use to manipulate keyslots in the hardware.
> + */
> +struct keyslot_mgmt_ll_ops {
> +	blk_status_t (*keyslot_program)(struct keyslot_manager *ksm,
> +					const struct blk_crypto_key *key,
> +					unsigned int slot);
> +	int (*keyslot_evict)(struct keyslot_manager *ksm,
> +			     const struct blk_crypto_key *key,
> +			     unsigned int slot);
> +};

As I mentioned on one of the UFS patches, I'm not sure it's better to make
keyslot_program return blk_status_t rather than errno as it did before.
blk_ksm_get_slot_for_key() could just do the translation to blk_status_t.

> +struct keyslot_manager {

Now that the "blk_" prefix has been added to all the functions, perhaps the
actual struct should be renamed to "blk_keyslot_manager" too?
And likewise "blk_keyslot_mgmt_ll_ops".


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
