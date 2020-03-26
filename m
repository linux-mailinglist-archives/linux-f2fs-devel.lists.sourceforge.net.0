Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17889194839
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Mar 2020 21:05:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jHYkp-00042f-8L; Thu, 26 Mar 2020 20:05:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jHYkn-00042Y-QW
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Mar 2020 20:05:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7Yc3WB5tzOaxGnXp4WY45jijFtt7YMYolGFtP97KQ0Q=; b=l13det2i1nC6YdWTimhk3TrxYz
 EuKeWJgxMVrUq8qYkYximN/yy18gemKibxjEkIrZWRE9+Jn3KBqHkvP/telaD9tLM3ezq7SnhjcTZ
 cokzMkNa+zDFqy9qFFiDjAax/0k4eRKJQOKT9itI+pmlyjf/jE1VpGBY/aCrz3Kwrpys=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7Yc3WB5tzOaxGnXp4WY45jijFtt7YMYolGFtP97KQ0Q=; b=XGJHjvYiDzY/xzEQPHgXP/2v8J
 UsU+uTZsgAkObc3633hLxRw4Vu6xCPvrkUbMkmtYa/gBVq+04dSN5j2evGW/6a+CY69EFLsQ5o9FF
 3TZMZKLobk34ytOqUfKXJ51pq4S5g2qxvHMmMtWmAsJ74CQCs2jBbFh9Kmy1PBTBqv38=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jHYkm-000zc1-Az
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Mar 2020 20:05:25 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 48D6D206E6;
 Thu, 26 Mar 2020 20:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585253113;
 bh=i90GPVVMddJ9UP46AIVqCSSHuZjc/Jw2ie3t9xHROsQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N4KW5Pzh6OYDS0R1JNKExpJ0WZBpxcboGqiY4MFzVV+VOcQBojGycsTRiAI6wPRQ9
 x+PTRYeZl4waspAeBC1xp46kxkX1P7GMmras2ZaP6BwG3i037nKjbnH6DHq4tDwjxT
 mJQi1S7nhfn4kwnUSiBWbr0JqowDbNDntDYY4I70=
Date: Thu, 26 Mar 2020 13:05:11 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200326200511.GA186343@gmail.com>
References: <20200326030702.223233-1-satyat@google.com>
 <20200326030702.223233-3-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200326030702.223233-3-satyat@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
X-Headers-End: 1jHYkm-000zc1-Az
Subject: Re: [f2fs-dev] [PATCH v9 02/11] block: Inline encryption support
 for blk-mq
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

On Wed, Mar 25, 2020 at 08:06:53PM -0700, Satya Tangirala wrote:
> diff --git a/block/blk-crypto-internal.h b/block/blk-crypto-internal.h
> new file mode 100644
> index 0000000000000..1e6d339fe1429
> --- /dev/null
> +++ b/block/blk-crypto-internal.h
> @@ -0,0 +1,172 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2019 Google LLC
> + */
> +
> +#ifndef __LINUX_BLK_CRYPTO_INTERNAL_H
> +#define __LINUX_BLK_CRYPTO_INTERNAL_H
> +
> +#include <linux/bio.h>
> +#include <linux/blkdev.h>
> +
> +/* Represents a crypto mode supported by blk-crypto  */
> +struct blk_crypto_mode {
> +	const char *cipher_str; /* crypto API name (for fallback case) */

Technically, cipher_str shouldn't be added until the patch that adds
blk-crypto-fallback.

> +	unsigned int keysize; /* key size in bytes */
> +	unsigned int ivsize; /* iv size in bytes */
> +};
> +
> +#ifdef CONFIG_BLK_INLINE_ENCRYPTION
> +
> +static inline const struct blk_crypto_key *bio_crypt_key(struct bio *bio)
> +{
> +	if (!bio_has_crypt_ctx(bio))
> +		return NULL;
> +	return bio->bi_crypt_context->bc_key;
> +}


I don't believe bio_crypt_key() is necessary -- see my comment below regarding
blk_mq_make_request().

> +bool bio_crypt_dun_is_contiguous(const struct bio_crypt_ctx *bc,
> +				 unsigned int bytes,
> +				 u64 next_dun[BLK_CRYPTO_DUN_ARRAY_SIZE])

next_dun should be const.

> +{
> +	int i = 0;
> +	unsigned int inc = bytes >> bc->bc_key->data_unit_size_bits;
> +
> +	while (i < BLK_CRYPTO_DUN_ARRAY_SIZE) {
> +		if (bc->bc_dun[i] + inc != next_dun[i])
> +			return false;
> +		/*
> +		 * If addition of inc to the current entry caused an overflow,
> +		 * then we have to carry "1" for the next entry - so inc
> +		 * needs to be "1" for the next loop iteration). Otherwise,
> +		 * we need inc to be 0 for the next loop iteration. Since
> +		 * overflow can be determined by (bc->bc_dun[i] + inc)  < inc
> +		 * we can do the following.
> +		 */
> +		inc = ((bc->bc_dun[i] + inc)  < inc);
> +		i++;
> +	}

This comment is verbose but doesn't really explain what's going on.
I think it would be much more useful to add comments like:

/*
 * Returns true if @bc_dun plus @bytes converted to data units is equal to
 * @next_dun, treating the DUNs as multi-limb integers.
 */
bool bio_crypt_dun_is_contiguous(const struct bio_crypt_ctx *bc,
                                 unsigned int bytes,
				 const u64 next_dun[BLK_CRYPTO_DUN_ARRAY_SIZE])

And:


		/*
		 * If the addition in this limb overflowed, then the carry bit
		 * into the next limb is 1.  Else the carry bit is 0.
		 */
		inc = ((bc->bc_dun[i] + inc)  < inc);


> +
> +	/*
> +	 * After going through all the entries in the dun, inc must be 0 for
> +	 * the duns to be contiguous.
> +	 */
> +	return !inc;
> +}

This is new in v9; before it just returned true.

It would be more helpful if this comment was like:

	/* If the DUN wrapped through 0, don't treat it as contiguous. */

> +/**
> + * __blk_crypto_init_request - Initializes the request's crypto fields based on
> + *			       the blk_crypto_key for a bio to be added to the
> + *			       request, and prepares it for hardware inline
> + *			       encryption.
> + *
> + * @rq: The request to init
> + * @key: The blk_crypto_key of bios that will (eventually) be added to @rq.
> + *
> + * Initializes the request's crypto fields to appropriate default values and
> + * tries to get a keyslot for the blk_crypto_key.
> + *
> + * Return: BLK_STATUS_OK on success, and negative error code otherwise.
> + */
> +blk_status_t __blk_crypto_init_request(struct request *rq,
> +				       const struct blk_crypto_key *key)
> +{
> +	return blk_ksm_get_slot_for_key(rq->q->ksm, key, &rq->crypt_keyslot);
> +}

The comment of this function seems outdated.  All it does it get a keyslot, but
the comment talks about initializing "crypto fields" (plural).

> +/**
> + * blk_crypto_evict_key() - Evict a key from any inline encryption hardware
> + *			    it may have been programmed into
> + * @q: The request queue who's keyslot manager this key might have been
> + *     programmed into
> + * @key: The key to evict
> + *
> + * Upper layers (filesystems) should call this function to ensure that a key
> + * is evicted from hardware that it might have been programmed into. This
> + * will call blk_ksm_evict_key on the queue's keyslot manager, if one
> + * exists, and supports the crypto algorithm with the specified data unit size.
> + *
> + * Return: 0 on success or if key is not present in the q's ksm, -err on error.
> + */
> +int blk_crypto_evict_key(struct request_queue *q,
> +			 const struct blk_crypto_key *key)
> +{
> +	if (q->ksm && blk_ksm_crypto_key_supported(q->ksm, key))
> +		return blk_ksm_evict_key(q->ksm, key);
> +
> +	return 0;
> +}

The keyslot manager is really an implementation detail of the block layer.
Therefore when documenting functions like blk_crypto_evict_key() that are the
API for use by upper layers like filesystems, we shouldn't really talk about the
keyslot manager, but rather describe the behavior in higher-level terms like
"evict a key from the inline encryption hardware".

> @@ -1971,6 +1974,7 @@ static blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio)
>  	struct request *same_queue_rq = NULL;
>  	unsigned int nr_segs;
>  	blk_qc_t cookie;
> +	blk_status_t ret;
>  
>  	blk_queue_bounce(q, &bio);
>  	__blk_queue_split(q, &bio, &nr_segs);
> @@ -2002,6 +2006,14 @@ static blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio)
>  
>  	cookie = request_to_qc_t(data.hctx, rq);
>  
> +	ret = blk_crypto_init_request(rq, bio_crypt_key(bio));
> +	if (ret != BLK_STS_OK) {
> +		bio->bi_status = ret;
> +		bio_endio(bio);
> +		blk_mq_free_request(rq);
> +		return BLK_QC_T_NONE;
> +	}
> +
>  	blk_mq_bio_to_request(rq, bio, nr_segs);

Wouldn't it make a lot more sense to do blk_crypto_init_request() after
blk_mq_bio_to_request() rather than before?

I.e., initialize request::crypt_ctx first, *then* get the keyslot.  Not the
other way around.

That would allow removing the second argument to blk_crypto_init_request() and
removing bio_crypt_key().  blk_crypto_init_request() would only need to take in
the struct request.

> diff --git a/include/linux/blk-crypto.h b/include/linux/blk-crypto.h
> index b8d54eca1c0d8..4add2e8846fea 100644
> --- a/include/linux/blk-crypto.h
> +++ b/include/linux/blk-crypto.h
> @@ -6,6 +6,8 @@
>  #ifndef __LINUX_BLK_CRYPTO_H
>  #define __LINUX_BLK_CRYPTO_H
>  
> +#include <linux/types.h>
> +
>  enum blk_crypto_mode_num {
>  	BLK_ENCRYPTION_MODE_INVALID,
>  	BLK_ENCRYPTION_MODE_AES_256_XTS,
> @@ -24,7 +26,7 @@ enum blk_crypto_mode_num {
>   *	ciphertext.  This is always a power of 2.  It might be e.g. the
>   *	filesystem block size or the disk sector size.
>   * @data_unit_size_bits: log2 of data_unit_size
> - * @dun_bytes: the number of bytes of DUN used when using this key
> + * @dun_bytes: the maximum number of bytes of DUN used when using this key

This comment update should be folded into the patch that added this.

> +/**
> + * struct bio_crypt_ctx - an inline encryption context
> + * @bc_key: the key, algorithm, and data unit size to use
> + * @bc_dun: the data unit number (starting IV) to use
> + * @bc_keyslot: the keyslot that has been assigned for this key in @bc_ksm,
> + *		or -1 if no keyslot has been assigned yet.
> + * @bc_ksm: the keyslot manager into which the key has been programmed with
> + *	    @bc_keyslot, or NULL if this key hasn't yet been programmed.
> + *
> + * A bio_crypt_ctx specifies that the contents of the bio will be encrypted (for
> + * write requests) or decrypted (for read requests) inline by the storage device
> + * or controller.
> + */
> +struct bio_crypt_ctx {
> +	const struct blk_crypto_key	*bc_key;
> +	u64				bc_dun[BLK_CRYPTO_DUN_ARRAY_SIZE];
> +};


Kerneldoc needs to be updated; bc_keyslot and bc_ksm no longer exist.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
