Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C22193885
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Mar 2020 07:22:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jHLuP-00084Y-L7; Thu, 26 Mar 2020 06:22:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jHLuP-00084S-4D
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Mar 2020 06:22:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lkhDfD5poa/2n1Ns7u8rz+0cbjd2axAsCTd8kN9bvW0=; b=dMQiQ2praJstuVBA/9ApN+KF0j
 oqJexxzpAG6uqedVWk81bRuRACwS2dbdn6LFET5u/VxJ/YPcUclGPwwfbf1qYcyPh8E1X7rCy2KBp
 vWWV7lMbG2993ihxtycxIasdSBmYLmH0KQbd6ij94RqUka2s1j3rfYmEpvL7IFEgr/54=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lkhDfD5poa/2n1Ns7u8rz+0cbjd2axAsCTd8kN9bvW0=; b=BVQSTC7iLxfN1WQViNKIIUyfh0
 XyllshUnilTCvCrOCzFdPRmXkAcbIFuk4IbJW9I+XTadALyfzoA0syaB/X3hwqmZEHphDUSyhliKa
 SV6Pw7TQZaT/R45zT3nwKJUOGje7VcQ1uWx2MQ8lBB+LgJ20DR053lOciOKMb7DtSHKk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jHLuL-0049lq-DF
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Mar 2020 06:22:28 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B21A220719;
 Thu, 26 Mar 2020 06:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585203735;
 bh=K+kHVF/Iujh5T5XgswnV6YpdFz4a2MkXO+R7tqFLY64=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xglru3pt3HR7qeGgEGIn6HyiIUPw+zCBOTpQhQEW8n44G3VjtH5VjfEVp6yKixAch
 d6xQM3gmYjB8pZ1AzHNGTqB4RpEyuVrhFGYROivHxnbdIc/2Yq8PBe8YSlggBjIAmI
 I2kVCF5ZhhYnVlOBygbICXk8hrIm4ralc6GrJlEU=
Date: Wed, 25 Mar 2020 23:22:13 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200326062213.GF858@sol.localdomain>
References: <20200326030702.223233-1-satyat@google.com>
 <20200326030702.223233-2-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200326030702.223233-2-satyat@google.com>
X-Spam-Score: -0.5 (/)
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
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jHLuL-0049lq-DF
Subject: Re: [f2fs-dev] [PATCH v9 01/11] block: Keyslot Manager for Inline
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

On Wed, Mar 25, 2020 at 08:06:52PM -0700, Satya Tangirala wrote:
> Inline Encryption hardware allows software to specify an encryption context
> (an encryption key, crypto algorithm, data unit num, data unit size) along
> with a data transfer request to a storage device, and the inline encryption
> hardware will use that context to en/decrypt the data. The inline
> encryption hardware is part of the storage device, and it conceptually sits
> on the data path between system memory and the storage device.
> 
> Inline Encryption hardware implementations often function around the
> concept of "keyslots". These implementations often have a limited number
> of "keyslots", each of which can hold a key (we say that a key can be
> "programmed" into a keyslot). Requests made to the storage device may have
> a keyslot and a data unit number associated with them, and the inline
> encryption hardware will en/decrypt the data in the requests using the key
> programmed into that associated keyslot and the data unit number specified
> with the request.
> 
> As keyslots are limited, and programming keys may be expensive in many
> implementations, and multiple requests may use exactly the same encryption
> contexts, we introduce a Keyslot Manager to efficiently manage keyslots.
> 
> We also introduce a blk_crypto_key, which will represent the key that's
> programmed into keyslots managed by keyslot managers. The keyslot manager
> also functions as the interface that upper layers will use to program keys
> into inline encryption hardware. For more information on the Keyslot
> Manager, refer to documentation found in block/keyslot-manager.c and
> linux/keyslot-manager.h.
> 
> Co-developed-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Satya Tangirala <satyat@google.com>

Thanks, this patch looks much better now.  I don't see any real issues, but as
usual here are a couple nits I noticed while reading through this latest version
:-)

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
> +int blk_ksm_init(struct blk_keyslot_manager *ksm, unsigned int num_slots)

The @dev parameter was removed, so its kerneldoc should be too.

One tip, you can check the validity of kerneldoc comments by running:

$ ./scripts/kernel-doc -v -none block/keyslot-manager.c
block/keyslot-manager.c:67: info: Scanning doc for blk_ksm_init
block/keyslot-manager.c:78: warning: Excess function parameter 'dev' description in 'blk_ksm_init'
block/keyslot-manager.c:180: info: Scanning doc for blk_ksm_get_slot_for_key
block/keyslot-manager.c:198: warning: Function parameter or member 'slot_ptr' not described in 'blk_ksm_get_slot_for_key'
block/keyslot-manager.c:198: warning: Excess function parameter 'keyslot' description in 'blk_ksm_get_slot_for_key'
block/keyslot-manager.c:258: info: Scanning doc for blk_ksm_put_slot
block/keyslot-manager.c:282: info: Scanning doc for blk_ksm_crypto_key_supported
block/keyslot-manager.c:303: info: Scanning doc for blk_ksm_evict_key
block/keyslot-manager.c:343: info: Scanning doc for blk_ksm_reprogram_all_keys
3 warnings

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
> + *	   allocated keyslot), or some other blk_status_t otherwise (and
> + *	   keyslot is set to NULL).
> + */

It's actually "BLK_STS_OK", not "BLK_STATUS_OK".

> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index f629d40c645cd..27d460d0a8508 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -43,6 +43,7 @@ struct pr_ops;
>  struct rq_qos;
>  struct blk_queue_stats;
>  struct blk_stat_callback;
> +struct blk_keyslot_manager;
>  
>  #define BLKDEV_MIN_RQ	4
>  #define BLKDEV_MAX_RQ	128	/* Default maximum */
> @@ -474,6 +475,11 @@ struct request_queue {
>  	unsigned int		dma_pad_mask;
>  	unsigned int		dma_alignment;
>  
> +#ifdef CONFIG_BLK_INLINE_ENCRYPTION
> +	/* Inline crypto capabilities */
> +	struct blk_keyslot_manager *ksm;
> +#endif

I do still wonder whether the concept of inline crypto support should be more
separated from keyslot management, to be better prepared for device-mapper
passthrough support and for hardware that accepts keys directly.  (Such hardware
exists, though I'm not sure support for it will be upstreamed.)  For example,
the crypto capabilities could be stored in a 'struct blk_crypto_capabilities'
rather than in 'struct blk_keyslot_manager', and the latter could be optional.

What you have now is fine for the functionality in the current patchset though,
so I'm not really complaining.  Just something to think about.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
