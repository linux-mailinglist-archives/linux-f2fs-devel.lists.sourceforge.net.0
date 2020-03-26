Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 420A119490D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Mar 2020 21:28:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jHZ7D-0005Lq-3b; Thu, 26 Mar 2020 20:28:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jHZ7B-0005Lj-Qv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Mar 2020 20:28:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NMOGfZHI3v888ne9aQG7xGLZhTH/5DBq/rWL7No63Qg=; b=V0rnxuLLTNV2HLazuZyRRbP3KA
 yDUrxA5fSNK/2Lnq0aZ6j+Ox8kifp59pUI1SmQbOGGV5HIhsUtDkeI3kbqlSr3k9eAOhgo3VcL6Eh
 IGzUKLAX5uT/NSJUZLgR1GtQTvCoVbpUi4QN80iBczcam28kkL7ZlI/lfOjll9SU+Rek=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NMOGfZHI3v888ne9aQG7xGLZhTH/5DBq/rWL7No63Qg=; b=VLNkVstecQXq4gsMujiSq3N8P/
 C5sHUrE6MFiifliuNMwH3TYOi+hwSsBWXNZRrTH+UFJS7zMriTcE6QaUGuVIN0lHIMxF8SfeU449D
 Mtkhm6zpZxz65Frj4fdRnBqu9QqfJg1dcRm1Nu8uBm1urgazc/b08O6xlMwtFqlT6Gho=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jHZ7A-0011AK-Iu
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Mar 2020 20:28:33 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B6A4B20775;
 Thu, 26 Mar 2020 20:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585254507;
 bh=POApO7xjc2R9qUby99KjfBYobM0PigxIu6iKSXh0YTw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yuuDV27xql+w9QP6gC4+BD06IS1YX5PzuojXqTrytI3EHuPsDyEakoaUOUk2IszZq
 npS0PJjgCrleVPprMkQ6LTZfJVPqpL/INQwScBLJeIaL8XlfQcmubkt8aArHtn/lwz
 wUbq664xyeCUft0Idt/gUcOADdvieH2ZeBJEVmEM=
Date: Thu, 26 Mar 2020 13:28:25 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200326202825.GB186343@gmail.com>
References: <20200326030702.223233-1-satyat@google.com>
 <20200326030702.223233-5-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200326030702.223233-5-satyat@google.com>
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
X-Headers-End: 1jHZ7A-0011AK-Iu
Subject: Re: [f2fs-dev] [PATCH v9 04/11] block: blk-crypto-fallback for
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

On Wed, Mar 25, 2020 at 08:06:55PM -0700, Satya Tangirala wrote:
> Blk-crypto delegates crypto operations to inline encryption hardware when
> available. The separately configurable blk-crypto-fallback contains a
> software fallback to the kernel crypto API - when enabled, blk-crypto
> will use this fallback for en/decryption when inline encryption hardware is
> not available. This lets upper layers not have to worry about whether or
> not the underlying device has support for inline encryption before
> deciding to specify an encryption context for a bio, and also allows for
> testing without actual inline encryption hardware. For more details, refer
> to Documentation/block/inline-encryption.rst.
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>

It might be helpful to also mention some real-world examples of how this helps
testing, e.g. it makes it possible to test the inline encryption code in ext4
and f2fs simply by running xfstests with the inlinecrypt mount option.
Therefore it makes it possible for the regular upstream regression testing of
ext4 to cover the inline encryption code paths.

> diff --git a/Documentation/block/inline-encryption.rst b/Documentation/block/inline-encryption.rst
> new file mode 100644
> index 0000000000000..3fa475799ecd1
> --- /dev/null
> +++ b/Documentation/block/inline-encryption.rst
> @@ -0,0 +1,195 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=================
> +Inline Encryption
> +=================

You may want to consider further improving this documentation file and then
putting it as patch 1 of the series as its own patch to introduce the rest of
the series, rather than "hiding" it in this particular patch.  The documentation
is for blk-crypto as a whole; it's not specific to blk-crypto-fallback.

> +struct bio_fallback_crypt_ctx {
> +	struct bio_crypt_ctx crypt_ctx;
> +	/*
> +	 * Copy of the bvec_iter when this bio was submitted.
> +	 * We only want to en/decrypt the part of the bio as described by the
> +	 * bvec_iter upon submission because bio might be split before being
> +	 * resubmitted
> +	 */
> +	struct bvec_iter crypt_iter;
> +	u64 fallback_dun[BLK_CRYPTO_DUN_ARRAY_SIZE];
> +	union {
> +		struct {
> +			struct work_struct work;
> +			struct bio *bio;
> +		};
> +		struct {
> +			void *bi_private_orig;
> +			bio_end_io_t *bi_end_io_orig;
> +		};
> +	};
> +};

Isn't 'fallback_dun' unnecessary now that blk-crypto-fallback uses bi_private?
'fallback_dun' should always be equal to 'crypt_ctx.bc_dun', right?

> +/**
> + * blk_crypto_fallback_bio_prep - Prepare a bio to use fallback en/decryption
> + *
> + * @bio_ptr: pointer to the bio to prepare
> + *
> + * If bio is doing a WRITE operation, we split the bio into two parts, resubmit
> + * the second part. Allocates a bounce bio for the first part, encrypts it, and
> + * update bio_ptr to point to the bounce bio.

This comment is misleading.  The code actually only splits the bio if it's very
large; it doesn't always split it.

> diff --git a/block/blk-crypto.c b/block/blk-crypto.c
> index a52ec4eb153be..41d5e421624e5 100644
> --- a/block/blk-crypto.c
> +++ b/block/blk-crypto.c
> @@ -3,6 +3,10 @@
>   * Copyright 2019 Google LLC
>   */
>  
> +/*
> + * Refer to Documentation/block/inline-encryption.rst for detailed explanation.
> + */
> +
>  #define pr_fmt(fmt) "blk-crypto: " fmt
>  
>  #include <linux/bio.h>
> @@ -206,7 +210,8 @@ static bool bio_crypt_check_alignment(struct bio *bio)
>   * __blk_crypto_init_request - Initializes the request's crypto fields based on
>   *			       the blk_crypto_key for a bio to be added to the
>   *			       request, and prepares it for hardware inline
> - *			       encryption.
> + *			       encryption (as opposed to using the crypto API
> + *			       fallback).
>   *
>   * @rq: The request to init
>   * @key: The blk_crypto_key of bios that will (eventually) be added to @rq.
> @@ -219,6 +224,10 @@ static bool bio_crypt_check_alignment(struct bio *bio)
>  blk_status_t __blk_crypto_init_request(struct request *rq,
>  				       const struct blk_crypto_key *key)
>  {
> +	/*
> +	 * We have a bio crypt context here - that means we didn't fallback
> +	 * to crypto API, so try to program a keyslot now.
> +	 */
>  	return blk_ksm_get_slot_for_key(rq->q->ksm, key, &rq->crypt_keyslot);
>  }

Since the fallback is now transparent to everything below it, we probably
shouldn't leave as many comments like this around that mention the fallback.
Comments are more useful if the code is doing something unexpected, as opposed
to something expected.

>  void __blk_crypto_rq_prep_clone(struct request *dst, struct request *src)
>  {
> +	/* Don't clone crypto info if src uses fallback en/decryption */
> +	if (!src->crypt_keyslot)
> +		return;
> +
>  	dst->crypt_ctx = src->crypt_ctx;
>  }

Isn't this part unnecessary?  If the fallback was used, there is no crypt
context anymore.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
