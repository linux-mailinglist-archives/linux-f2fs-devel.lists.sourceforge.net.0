Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2A71BF084
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Apr 2020 08:46:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jU2y0-0002aR-QI; Thu, 30 Apr 2020 06:46:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jU2xw-0002aF-OK
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Apr 2020 06:46:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y00lEMnHo5m3YYgjRZgc6ekEdIQO21MUeychMvvKxAc=; b=aeZmIrqC2CnnrYABkbOYZjSwlg
 Wkfp3XQtCyRcx7f9Te7J+LB8LElREdq6Xcpbc/1WDtWj+6WdaqzDYzcS9HYs+zmkwtswCG7CdQt+6
 SBalex6TKXR3HF3nk9GsKtyDtqhUs/zPYBxuwu241F5A1AH9gs4WyLpv+p20VBQg6n5M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y00lEMnHo5m3YYgjRZgc6ekEdIQO21MUeychMvvKxAc=; b=jZUYKFN6oYLf7TPSJNTprtJmcm
 mAtqefK186O7tEPs1qHHbgxBxTw7S2l961lMQBgzug5XOsSj3+aT2SbkYLr1bAyUVlhttlGevolPc
 66NLWA7FqcoI8l0sgPJKnOwXgkeq9GKLAKQJweKS0xUdEs9J8MahqUFOasJvs+PR/I/U=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jU2xt-00H1ru-Dz
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Apr 2020 06:46:34 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B66C8214D8;
 Thu, 30 Apr 2020 06:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588229183;
 bh=S8VnrcC8lJzFcPUaXFPCvyn46mx7gp2QMp+KtHDb6+E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AnHSkbJzWg0a+1u5u9ySsA8JJGJo6Pq7XgC03hxGia+a3xwYv0092zLFCF3QnpAmA
 R4z1iy7z2j2vd4IB8SXqek9ackjWIhsx9Xkdt4njmPINY3adLhUHAJbz5HoRzHDybp
 vR9e01b8EZprxcbpv7WK50etU4yWaGtZxHT7uueg=
Date: Wed, 29 Apr 2020 23:46:21 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200430064621.GA16238@sol.localdomain>
References: <20200429072121.50094-1-satyat@google.com>
 <20200429072121.50094-3-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429072121.50094-3-satyat@google.com>
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
X-Headers-End: 1jU2xt-00H1ru-Dz
Subject: Re: [f2fs-dev] [PATCH v11 02/12] block: Keyslot Manager for Inline
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

A few very minor comments:

On Wed, Apr 29, 2020 at 07:21:11AM +0000, Satya Tangirala wrote:
> diff --git a/block/keyslot-manager.c b/block/keyslot-manager.c
> new file mode 100644
> index 0000000000000..b584723b392ad
> --- /dev/null
> +++ b/block/keyslot-manager.c
> @@ -0,0 +1,380 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2019 Google LLC
> + */
> +
> +/**
> + * DOC: The Keyslot Manager
> + *
> + * Many devices with inline encryption support have a limited number of "slots"
> + * into which encryption contexts may be programmed, and requests can be tagged
> + * with a slot number to specify the key to use for en/decryption.
> + *
> + * As the number of slots are limited, and programming keys is expensive on
> + * many inline encryption hardware, we don't want to program the same key into
> + * multiple slots - if multiple requests are using the same key, we want to
> + * program just one slot with that key and use that slot for all requests.
> + *
> + * The keyslot manager manages these keyslots appropriately, and also acts as
> + * an abstraction between the inline encryption hardware and the upper layers.
> + *
> + * Lower layer devices will set up a keyslot manager in their request queue
> + * and tell it how to perform device specific operations like programming/
> + * evicting keys from keyslots.
> + *
> + * Upper layers will call blk_ksm_get_slot_for_key() to program a
> + * key into some slot in the inline encryption hardware.
> + */
> +#include <crypto/algapi.h>

Now that this file doesn't use crypto_memneq(), the include of <crypto/algapi.h>
can be removed.

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
> + * Return: BLK_STS_OK on success (and keyslot is set to the pointer of the
> + *	   allocated keyslot), or some other blk_status_t otherwise (and
> + *	   keyslot is set to NULL).
> + */
> +blk_status_t blk_ksm_get_slot_for_key(struct blk_keyslot_manager *ksm,
> +				      const struct blk_crypto_key *key,
> +				      struct blk_ksm_keyslot **slot_ptr)

The comment should say @slot_ptr, not @keyslot.  You can find kerneldoc warnings
using 'scripts/kernel-doc -v -none $file'.

> +/**
> + * blk_ksm_crypto_cfg_supported() - Find out if the crypto_mode, dusize, dun
> + *				    bytes of a crypto_config are supported by a
> + *				    ksm.

IMO, shorten this a bit to something like "Find out if a crypto configuration is
supported by a ksm", so that less of the comment becomes outdated when someone
adds a new field.

> + * @ksm: The keyslot manager to check
> + * @cfg: The crypto configuration to check for.
> + *
> + * Checks for crypto_mode/data unit size/dun bytes support.
> + *
> + * Return: Whether or not this ksm supports the specified crypto key.

"config", not "key".

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
