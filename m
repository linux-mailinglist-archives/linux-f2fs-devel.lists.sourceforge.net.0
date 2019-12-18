Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7FA1252E8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Dec 2019 21:13:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ihfhY-0001Av-2j; Wed, 18 Dec 2019 20:13:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1ihfhW-0001Ae-9z
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 20:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9yHrAeFidQzVcFRB6rO4eMQs7bBw034Oo1hsXUQ32Qc=; b=d1uGYQpi3uYeONo1AnIRAeIBN9
 ySUd3bLGHZv2AlKXeHkQDyo/tsH6mv9q3uB0ETYAqjgD79Dy9NO1hOG/RmIZ2NPxMGr6j0YWh8/2M
 K7JfWsYMMJkfmwO90Jr0Sk7o+LSbIIhDWzqN9qui1rc+s+tE+d5cn4oO7dBr99XB5gZM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9yHrAeFidQzVcFRB6rO4eMQs7bBw034Oo1hsXUQ32Qc=; b=RMnoMp4whAw7994Y/7YjorI+Ju
 ZswHxP0vj0cZXgLVx+UeYUD5h9zyOsCFIDYxLZhrKw2XDOmd3gX7P2TAQfRtbnWzDS5eCym5AsHJ1
 MI3cRdm0JnJgbXndARTgOx078ToWsMZwnM+XZLezsbRgz2fl9M9RN3iuyRGOgBh0Q134=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ihfhU-0091yN-V4
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 20:13:42 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 190D72176D;
 Wed, 18 Dec 2019 20:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576700015;
 bh=UMmD5Z5ygH9aVGZDCv0TmAgy4F+Uw50SpSAzO3KWdWA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HbjIZjZiaO/pegR8UQwIlCL+CIc0+MOpHINMa6Wa4XC7CpM10gILJCfLd78ffIIU/
 4MDsuaJ1sOmbJou6wzefCczQtvBOCDftxK3nH5Qq+4/htt5t0TPTY2emEjareiijLb
 KPiqBjfQ10vuK0cXSKCh74afokCgwFJp3dhC23cc=
Date: Wed, 18 Dec 2019 12:13:33 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20191218201333.GA47399@gmail.com>
References: <20191218145136.172774-1-satyat@google.com>
 <20191218145136.172774-2-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218145136.172774-2-satyat@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 1.2 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.8 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ihfhU-0091yN-V4
Subject: Re: [f2fs-dev] [PATCH v6 1/9] block: Keyslot Manager for Inline
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
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 18, 2019 at 06:51:28AM -0800, Satya Tangirala wrote:
> Inline Encryption hardware allows software to specify an encryption context
> (an encryption key, crypto algorithm, data unit num, data unit size, etc.)

These four things (key, algorithm, DUN, and data unit size) fully specify the
crypto that is done.  So the use of "etc." is a bit misleading.

> along with a data transfer request to a storage device, and the inline
> encryption hardware will use that context to en/decrypt the data. The
> inline encryption hardware is part of the storage device, and it
> conceptually sits on the data path between system memory and the storage
> device.
> 
> Inline Encryption hardware implementations often function around the
> concept of "keyslots". These implementations often have a limited number
> of "keyslots", each of which can hold an encryption context (we say that
> an encryption context can be "programmed" into a keyslot). Requests made
> to the storage device may have a keyslot associated with them, and the
> inline encryption hardware will en/decrypt the data in the requests using
> the encryption context programmed into that associated keyslot. As
> keyslots are limited, and programming keys may be expensive in many
> implementations, and multiple requests may use exactly the same encryption
> contexts, we introduce a Keyslot Manager to efficiently manage keyslots.
> We also introduce a blk_crypto_key, which will represent the key that's
> programmed into keyslots managed by keyslot managers. The keyslot manager
> also functions as the interface that upper layers will use to program keys
> into inline encryption hardware. For more information on the Keyslot
> Manager, refer to documentation found in block/keyslot-manager.c and
> linux/keyslot-manager.h.

Long paragraphs are hard to read.  Maybe split this into multiple paragraphs.

> +/**
> + * keyslot_manager_crypto_mode_supported() - Find out if a crypto_mode/data
> + *					     unit size combination is supported
> + *					     by a ksm.
> + * @ksm: The keyslot manager to check
> + * @crypto_mode: The crypto mode to check for.
> + * @data_unit_size: The data_unit_size for the mode.
> + *
> + * Calls and returns the result of the crypto_mode_supported function specified
> + * by the ksm.
> + *
> + * Context: Process context.
> + * Return: Whether or not this ksm supports the specified crypto_mode/
> + *	   data_unit_size combo.
> + */
> +bool keyslot_manager_crypto_mode_supported(struct keyslot_manager *ksm,
> +					   enum blk_crypto_mode_num crypto_mode,
> +					   unsigned int data_unit_size)
> +{
> +	if (!ksm)
> +		return false;
> +	if (WARN_ON(crypto_mode >= BLK_ENCRYPTION_MODE_MAX))
> +		return false;
> +	if (WARN_ON(!is_power_of_2(data_unit_size)))
> +		return false;
> +	return ksm->crypto_mode_supported[crypto_mode] & data_unit_size;
> +}

There's no crypto_mode_supported() function anymore, so the comment above this
function is outdated, including both the part that mentions
crypto_mode_supported() and the part that says "Process context".

Also, since C enums are signed, and there's already a check for invalid
crypto_mode, it might be a good idea to catch crypto_mode < 0 too:

	if (WARN_ON((unsigned int)crypto_mode >= BLK_ENCRYPTION_MODE_MAX))

> +/**
> + * keyslot_manager_evict_key() - Evict a key from the lower layer device.
> + * @ksm: The keyslot manager to evict from
> + * @key: The key to evict
> + *
> + * Find the keyslot that the specified key was programmed into, and evict that
> + * slot from the lower layer device if that slot is not currently in use.
> + *
> + * Context: Process context. Takes and releases ksm->lock.
> + * Return: 0 on success, -EBUSY if the key is still in use, or another
> + *	   -errno value on other error.
> + */
> +int keyslot_manager_evict_key(struct keyslot_manager *ksm,
> +			      const struct blk_crypto_key *key)
> +{
> +	int slot;
> +	int err;
> +	struct keyslot *slotp;
> +
> +	down_write(&ksm->lock);
> +	slot = find_keyslot(ksm, key);
> +	if (slot < 0) {
> +		err = slot;
> +		goto out_unlock;
> +	}

I think this function should return 0 (rather than fail with -ENOKEY) if the key
is not currently programmed into a keyslot.  Otherwise anyone who wants to print
a warning if key eviction failed will have to ignore the -ENOKEY error.

(Note that this change would require an small update to the function comment.)

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
