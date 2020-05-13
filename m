Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE1D1D1CFC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 May 2020 20:05:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jYvlF-0002fm-Jr; Wed, 13 May 2020 18:05:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jYvlE-0002fc-PO
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 May 2020 18:05:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x/7upIikr9L34xfXnYqAfdKUNnxvAyGO+oCE85PlS2c=; b=JJzHJ/kx2Rg5InWjgU2XR5vDg5
 rY95dbNxVk3DZaIwX4hSkgCDFZf2W5wiEOUPFjRs1OGEJR/VCpFHp5YVcoACk56IbQEViZtXZSgZu
 CJrqEVqBe2jZrv7CVhxI3ttoltYLuuK+8lF+UWmGU1KUpnRNcUcldAj+Pi6nlbzILeb8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x/7upIikr9L34xfXnYqAfdKUNnxvAyGO+oCE85PlS2c=; b=FBBTB6TaC9LgzREh6dLYdUmPpk
 4CAh4N9Ko+85zchf96/MH1zaM8l7tVWr73GrDGcHLYuVVL83AcMg0w5v5F88x32DM4VrRTYVaV0e9
 TgDwc5K4+ON8jtThzb2IgYUifYfKfdCTDcYJ54FERugIENMEsTgUpO1I4eJKNH5as0Do=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jYvl8-00EDiJ-OT
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 May 2020 18:05:40 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C06BB20659;
 Wed, 13 May 2020 18:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589393130;
 bh=s05yTJaJ2U7VPeAsl86vdaH+LHnd7rgYFl+s/FhtxDQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l53rt7Jg1VZ1vN8qaLqR66Jj869Gfdem81Rm7UNH+doDXsfeAfBcHsW6f0jhbVxyR
 rLlwJ0ZJ1tWTRl0PeQzVcYkXg2mktappox+Aya1s8YtjZQufMhI3JeGpkVbA/m8Y/N
 ScL5AC2Tzm0ntsf6eYnFfhgvw7yA2Nohsr1DH0jo=
Date: Wed, 13 May 2020 11:05:27 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200513180527.GE1243@sol.localdomain>
References: <20200430115959.238073-1-satyat@google.com>
 <20200430115959.238073-6-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430115959.238073-6-satyat@google.com>
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
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jYvl8-00EDiJ-OT
Subject: Re: [f2fs-dev] [PATCH v12 05/12] block: blk-crypto-fallback for
 Inline Encryption
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

On Thu, Apr 30, 2020 at 11:59:52AM +0000, Satya Tangirala wrote:
> Blk-crypto delegates crypto operations to inline encryption hardware when
> available. The separately configurable blk-crypto-fallback contains a
> software fallback to the kernel crypto API - when enabled, blk-crypto
> will use this fallback for en/decryption when inline encryption hardware is
> not available. This lets upper layers not have to worry about whether or
> not the underlying device has support for inline encryption before
> deciding to specify an encryption context for a bio. It also allows for
> testing without actual inline encryption hardware - in particular, it
> makes it possible to test the inline encryption code in ext4 and f2fs
> simply by running xfstests with the inlinecrypt mount option, which in
> turn allows for things like the regular upstream regression testing of
> ext4 to cover the inline encryption code paths. For more details, refer
> to Documentation/block/inline-encryption.rst.
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>

Generally looks good, you can add:

    Reviewed-by: Eric Biggers <ebiggers@google.com>

A few comments below for when you resend.  Also, can you split the paragraph
above into multiple?  E.g.

	Blk-crypto delegates...

	This lets upper layers...

	For more details, refer to...

> +static int blk_crypto_keyslot_program(struct blk_keyslot_manager *ksm,
> +				      const struct blk_crypto_key *key,
> +				      unsigned int slot)
> +{
> +	struct blk_crypto_keyslot *slotp = &blk_crypto_keyslots[slot];
> +	const enum blk_crypto_mode_num crypto_mode =
> +						key->crypto_cfg.crypto_mode;
> +	int err;
> +
> +	if (crypto_mode != slotp->crypto_mode &&
> +	    slotp->crypto_mode != BLK_ENCRYPTION_MODE_INVALID)
> +		blk_crypto_evict_keyslot(slot);
> +
> +	slotp->crypto_mode = crypto_mode;
> +	err = crypto_skcipher_setkey(slotp->tfms[crypto_mode], key->raw,
> +				     key->size);
> +	if (err) {
> +		blk_crypto_evict_keyslot(slot);
> +		return -EIO;
> +	}
> +	return 0;
> +}

Shouldn't this just return 'err'?  Is there a good reason for EIO?

> +static bool blk_crypto_alloc_cipher_req(struct bio *src_bio,
> +					struct blk_ksm_keyslot *slot,
> +					struct skcipher_request **ciph_req_ret,
> +					struct crypto_wait *wait)
> +{
> +	struct skcipher_request *ciph_req;
> +	const struct blk_crypto_keyslot *slotp;
> +	int keyslot_idx = blk_ksm_get_slot_idx(slot);
> +
> +	slotp = &blk_crypto_keyslots[keyslot_idx];
> +	ciph_req = skcipher_request_alloc(slotp->tfms[slotp->crypto_mode],
> +					  GFP_NOIO);
> +	if (!ciph_req) {
> +		src_bio->bi_status = BLK_STS_RESOURCE;
> +		return false;
> +	}
> +
> +	skcipher_request_set_callback(ciph_req,
> +				      CRYPTO_TFM_REQ_MAY_BACKLOG |
> +				      CRYPTO_TFM_REQ_MAY_SLEEP,
> +				      crypto_req_done, wait);
> +	*ciph_req_ret = ciph_req;
> +
> +	return true;
> +}

I think it would be better to remove the 'src_bio' argument from here and make
the two callers set BLK_STS_RESOURCE instead.  See e.g.
bio_crypt_check_alignment() which uses a similar convention.

> +/**
> + * blk_crypto_fallback_decrypt_endio - clean up bio w.r.t fallback decryption
> + *
> + * @bio: the bio to clean up.
> + *
> + * Restore bi_private and bi_end_io, and queue the bio for decryption into a
> + * workqueue, since this function will be called from an atomic context.
> + */

"clean up bio w.r.t fallback decryption" is misleading, since the main point of
this function is to queue the bio for decryption.  How about:

/**
 * blk_crypto_fallback_decrypt_endio - queue bio for fallback decryption
 *
 * @bio: the bio to queue
 *
 * Restore bi_private and bi_end_io, and queue the bio for decryption into a
 * workqueue, since this function will be called from an atomic context.
 */

> +bool blk_crypto_fallback_bio_prep(struct bio **bio_ptr)
> +{
> +	struct bio *bio = *bio_ptr;
> +	struct bio_crypt_ctx *bc = bio->bi_crypt_context;
> +	struct bio_fallback_crypt_ctx *f_ctx;
> +
> +	if (!tfms_inited[bc->bc_key->crypto_cfg.crypto_mode]) {
> +		bio->bi_status = BLK_STS_IOERR;
> +		return false;
> +	}

This can only happen if the user forgot to call blk_crypto_start_using_key().
And if someone does that, it might be hard for them to understand why they're
getting IOERR.  A WARN_ON_ONCE() and a comment would help:

	if (WARN_ON_ONCE(!tfms_inited[bc->bc_key->crypto_cfg.crypto_mode])) {
		/* User didn't call blk_crypto_start_using_key() first */
		bio->bi_status = BLK_STS_IOERR;
		return false;
	}

This would be similar to how __blk_crypto_bio_prep() does
WARN_ON_ONCE(!bio_has_data(bio)) to catch another type of usage error.

> +/*
> + * Prepare blk-crypto-fallback for the specified crypto mode.
> + * Returns -ENOPKG if the needed crypto API support is missing.
> + */
> +int blk_crypto_fallback_start_using_mode(enum blk_crypto_mode_num mode_num)
> +{
> +	const char *cipher_str = blk_crypto_modes[mode_num].cipher_str;
> +	struct blk_crypto_keyslot *slotp;
> +	unsigned int i;
> +	int err = 0;
> +
> +	/*
> +	 * Fast path
> +	 * Ensure that updates to blk_crypto_keyslots[i].tfms[mode_num]
> +	 * for each i are visible before we try to access them.
> +	 */
> +	if (likely(smp_load_acquire(&tfms_inited[mode_num])))
> +		return 0;
> +
> +	mutex_lock(&tfms_init_lock);
> +	err = blk_crypto_fallback_init();
> +	if (err)
> +		goto out;
> +
> +	if (tfms_inited[mode_num])
> +		goto out;

It would make more sense to check tfms_inited[mode_num] immediately after
acquiring the mutex, given that it's checked before.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
