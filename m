Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4779F63C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Aug 2019 00:34:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i2k2n-0002J4-Iv; Tue, 27 Aug 2019 22:34:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1i2k2j-0002Ic-W8
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Aug 2019 22:34:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i7bmMtz/Up+fVE5s1VQDLyPEUxTd7kArvTrNnKD04po=; b=Hr+Lzkei1EamBd5oiuWwM4MERo
 7o9hHhz63GFf/8sIY6Gt+hfvVbGYAsgfXH4X6fVQxXfCmto+QcJUB9cUa53lDLMbRI84kqj/8Jw2P
 AEfKVNzmoLtMwrPWIAbIgZXs9BQbW+cGhoc7EM8Bfb+EcYpWTknzpplMBoYCQJZUmeFQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i7bmMtz/Up+fVE5s1VQDLyPEUxTd7kArvTrNnKD04po=; b=CpLZiT2tswszuNKDJKMmMkojl9
 SIXmVpFnD3k/IWZH8Hsddt0xgOI34mUlRGNSA+CPr2lIFZCSmvZ62FwwqSjAEEOkJRSfiucb3NP2F
 3+jG8tkjjOU1hJdQydU79v7aa1CYU7yKA+AE5Z3h27aZV9Y4NCT+vweJM5o0VcL62Ihw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i2k2i-000iFS-LT
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Aug 2019 22:34:25 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B50CF20856;
 Tue, 27 Aug 2019 22:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566945259;
 bh=z3xopfZ51WkV8awSgGyWZJzCisrDG8pyxGkIqqDVBSE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IHnbWObz7IdfNCr+53RBoZHkmbFKif0Ubb3U5DkhOtvlRer9YxXdAsIT9YoL7Kidv
 Q22s8MGqTqqZZeT2DNSgZhSuqMttd550jyK2IOBeMRSVdo96htJcCV2bX9pl4maVMR
 Z2Gg+MPSg2Ep+r0t8NHplneXUJkCyIiA254+HXT8=
Date: Tue, 27 Aug 2019 15:34:17 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20190827223415.GC27166@gmail.com>
Mail-Followup-To: Satya Tangirala <satyat@google.com>,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Kim Boojin <boojin.kim@samsung.com>
References: <20190821075714.65140-1-satyat@google.com>
 <20190821075714.65140-4-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190821075714.65140-4-satyat@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 3.1 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.2 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1i2k2i-000iFS-LT
Subject: Re: [f2fs-dev] [PATCH v4 3/8] block: blk-crypto for Inline
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

On Wed, Aug 21, 2019 at 12:57:09AM -0700, Satya Tangirala wrote:
> diff --git a/block/blk-crypto.c b/block/blk-crypto.c
> new file mode 100644
> index 000000000000..c8f06264a0f5
> --- /dev/null
> +++ b/block/blk-crypto.c
> @@ -0,0 +1,737 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2019 Google LLC
> + */
> +
> +/*
> + * Refer to Documentation/block/inline-encryption.txt for detailed explanation.
> + */
> +
> +#ifdef pr_fmt
> +#undef pr_fmt
> +#endif

This is the beginning of the file, so the

#ifdef pr_fmt
#undef pr_fmt
#endif

is unnecessary.

> +static struct blk_crypto_keyslot {
> +	struct crypto_skcipher *tfm;
> +	enum blk_crypto_mode_num crypto_mode;
> +	u8 key[BLK_CRYPTO_MAX_KEY_SIZE];
> +	struct crypto_skcipher *tfms[ARRAY_SIZE(blk_crypto_modes)];
> +} *blk_crypto_keyslots;

It would be helpful if there was a comment somewhere explaining what's going on
with the crypto tfms now, like:

/*
 * Allocating a crypto tfm during I/O can deadlock, so we have to preallocate
 * all a mode's tfms when that mode starts being used.  Since each mode may need
 * all the keyslots at some point, each mode needs its own tfm for each keyslot;
 * thus, a keyslot may contain tfms for multiple modes.  However, to match the
 * behavior of real inline encryption hardware (which only supports a single
 * encryption context per keyslot), we only allow one tfm per keyslot to be used
 * at a time.  Unused tfms have their keys cleared.
 */

Otherwise it's not at all obvious what's going on.

> +
> +static struct mutex tfms_lock[ARRAY_SIZE(blk_crypto_modes)];
> +static bool tfms_inited[ARRAY_SIZE(blk_crypto_modes)];
> +
> +struct work_mem {
> +	struct work_struct crypto_work;
> +	struct bio *bio;
> +};
> +
> +/* The following few vars are only used during the crypto API fallback */
> +static struct keyslot_manager *blk_crypto_ksm;
> +static struct workqueue_struct *blk_crypto_wq;
> +static mempool_t *blk_crypto_page_pool;
> +static struct kmem_cache *blk_crypto_work_mem_cache;
> +
> +bool bio_crypt_swhandled(struct bio *bio)
> +{
> +	return bio_has_crypt_ctx(bio) &&
> +	       bio->bi_crypt_context->processing_ksm == blk_crypto_ksm;
> +}
> +
> +static const u8 zeroes[BLK_CRYPTO_MAX_KEY_SIZE];
> +static void evict_keyslot(unsigned int slot)
> +{
> +	struct blk_crypto_keyslot *slotp = &blk_crypto_keyslots[slot];
> +	enum blk_crypto_mode_num crypto_mode = slotp->crypto_mode;
> +
> +	/* Clear the key in the skcipher */
> +	crypto_skcipher_setkey(slotp->tfms[crypto_mode], zeroes,
> +			       blk_crypto_modes[crypto_mode].keysize);
> +	memzero_explicit(slotp->key, BLK_CRYPTO_MAX_KEY_SIZE);
> +}

Unfortunately setting the all-zeroes key won't work, because the all-zeroes key
fails the "weak key" check for XTS, as its two halves are the same.

Presumably this wasn't noticed during testing because the return value of
crypto_skcipher_setkey() is ignored.  So I suggest adding a WARN_ON():

	err = crypto_skcipher_setkey(slotp->tfms[crypto_mode], blank_key,
				     blk_crypto_modes[crypto_mode].keysize);
	WARN_ON(err);

Then for the actual fix, maybe set a random key instead of an all-zeroes one?

> +
> +static int blk_crypto_keyslot_program(void *priv, const u8 *key,
> +				      enum blk_crypto_mode_num crypto_mode,
> +				      unsigned int data_unit_size,
> +				      unsigned int slot)
> +{
> +	struct blk_crypto_keyslot *slotp = &blk_crypto_keyslots[slot];
> +	const struct blk_crypto_mode *mode = &blk_crypto_modes[crypto_mode];
> +	size_t keysize = mode->keysize;
> +	int err;
> +
> +	if (crypto_mode != slotp->crypto_mode) {
> +		evict_keyslot(slot);
> +		slotp->crypto_mode = crypto_mode;
> +	}

Currently the crypto_mode of every blk_crypto_keyslot starts out as AES_256_XTS
(0).  So if the user starts by choosing some other mode, this will immediately
call evict_keyslot() and crash dereferencing a NULL pointer.

To fix this, how about initializing all the modes to
BLK_ENCRYPTION_MODE_INVALID?

Then here the code would need to be:

	if (crypto_mode != slotp->crypto_mode &&
	    slotp->crypto_mode != BLK_ENCRYPTION_MODE_INVALID)
		evict_keyslot(slot);

And evict_keyslot() should invalidate the crypto_mode:

static void evict_keyslot(unsigned int slot)
{
	...

	slotp->crypto_mode = BLK_ENCRYPTION_MODE_INVALID;
}

> +
> +static int blk_crypto_keyslot_evict(void *priv, const u8 *key,
> +				    enum blk_crypto_mode_num crypto_mode,
> +				    unsigned int data_unit_size,
> +				    unsigned int slot)
> +{
> +	evict_keyslot(slot);
> +	return 0;
> +}

It might be useful to have a WARN_ON() here if the keyslot isn't in use
(i.e., if slotp->crypto_mode == BLK_ENCRYPTION_MODE_INVALID).

> +int blk_crypto_submit_bio(struct bio **bio_ptr)
> +{
> +	struct bio *bio = *bio_ptr;
> +	struct request_queue *q;
> +	int err;
> +	struct bio_crypt_ctx *crypt_ctx;
> +
> +	if (!bio_has_crypt_ctx(bio) || !bio_has_data(bio))
> +		return 0;
> +
> +	/*
> +	 * When a read bio is marked for sw decryption, its bi_iter is saved
> +	 * so that when we decrypt the bio later, we know what part of it was
> +	 * marked for sw decryption (when the bio is passed down after
> +	 * blk_crypto_submit bio, it may be split or advanced so we cannot rely
> +	 * on the bi_iter while decrypting in blk_crypto_endio)
> +	 */
> +	if (bio_crypt_swhandled(bio))
> +		return 0;
> +
> +	err = bio_crypt_check_alignment(bio);
> +	if (err)
> +		goto out;

Need to set ->bi_status if bio_crypt_check_alignment() fails.

> +bool blk_crypto_endio(struct bio *bio)
> +{
> +	if (!bio_has_crypt_ctx(bio))
> +		return true;
> +
> +	if (bio_crypt_swhandled(bio)) {
> +		/*
> +		 * The only bios that are swhandled when they reach here
> +		 * are those with bio_data_dir(bio) == READ, since WRITE
> +		 * bios that are encrypted by the crypto API fallback are
> +		 * handled by blk_crypto_encrypt_endio.
> +		 */
> +
> +		/* If there was an IO error, don't decrypt. */
> +		if (bio->bi_status)
> +			return true;
> +
> +		blk_crypto_queue_decrypt_bio(bio);
> +		return false;
> +	}
> +
> +	if (bio_has_crypt_ctx(bio) && bio_crypt_has_keyslot(bio))
> +		bio_crypt_ctx_release_keyslot(bio);

No need to check bio_has_crypt_ctx(bio) here, as it was already checked above.

> +int blk_crypto_mode_alloc_ciphers(enum blk_crypto_mode_num mode_num)
> +{
> +	struct blk_crypto_keyslot *slotp;
> +	int err = 0;
> +	int i;
> +
> +	/* Fast path */
> +	if (likely(READ_ONCE(tfms_inited[mode_num]))) {
> +		/*
> +		 * Ensure that updates to blk_crypto_keyslots[i].tfms[mode_num]
> +		 * for each i are visible before we try to access them.
> +		 */
> +		smp_rmb();
> +		return 0;
> +	}

I think we want smp_load_acquire() here.

	/* pairs with smp_store_release() below */
	if (smp_load_acquire(&tfms_inited[mode_num]))
		return 0;

> +
> +	mutex_lock(&tfms_lock[mode_num]);
> +	if (likely(tfms_inited[mode_num]))
> +		goto out;
> +
> +	for (i = 0; i < blk_crypto_num_keyslots; i++) {
> +		slotp = &blk_crypto_keyslots[i];
> +		slotp->tfms[mode_num] = crypto_alloc_skcipher(
> +					blk_crypto_modes[mode_num].cipher_str,
> +					0, 0);
> +		if (IS_ERR(slotp->tfms[mode_num])) {
> +			err = PTR_ERR(slotp->tfms[mode_num]);
> +			slotp->tfms[mode_num] = NULL;
> +			goto out_free_tfms;
> +		}
> +
> +		crypto_skcipher_set_flags(slotp->tfms[mode_num],
> +					  CRYPTO_TFM_REQ_FORBID_WEAK_KEYS);
> +	}
> +
> +	/*
> +	 * Ensure that updates to blk_crypto_keyslots[i].tfms[mode_num]
> +	 * for each i are visible before we set tfms_inited[mode_num].
> +	 */
> +	smp_wmb();
> +	WRITE_ONCE(tfms_inited[mode_num], true);
> +	goto out;

... and smp_store_release() here.

	/* pairs with smp_load_acquire() above */
	smp_store_release(&tfms_inited[mode_num], true);
	goto out;

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
