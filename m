Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BA31D1C3F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 May 2020 19:27:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jYvAR-0004cd-Il; Wed, 13 May 2020 17:27:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jYvAQ-0004cN-DS
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 May 2020 17:27:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=msmoZUFWTYamfi7gwAD9W+Dvry1jyIJNd8LxbMR3LAo=; b=TivKwF7UmPJo7+ePQNhs70t2fn
 Ukvx1kYBSKAUDumprv+9Iu52FdsVHfh4+MfiBPWGDMPp6OyAj3O60tvikcBIIRC5UhBDiDYzV/JPu
 +illco2AHvx1obz5KlWkn8Os0JgIcGnNX/rT3l9enxAjG2vQGX5IrE6DrSiB/aeD7+Gg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=msmoZUFWTYamfi7gwAD9W+Dvry1jyIJNd8LxbMR3LAo=; b=NOIgsKLWbVLZGT9/YaEjCnjw0U
 QiSzVfEkROQy/s+M0S0pbuQanT8IENbe+wYbjviDiNmg48R1HYFv7rvFnBnqT4Ng6C5R4m9vDuCum
 ybwEA8APq272hn+4GLPp2uXll3Jv3duwfKg8qfR/8E2lm4WTQxh8gxqMMO4Ym8Ldm2lM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jYvAP-00EAnq-0x
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 May 2020 17:27:38 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0EA452053B;
 Wed, 13 May 2020 17:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589390847;
 bh=0cEJvOzqzlvc+ckapq/Ksd7zF4cLk0jrLsa+BhyTNKY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G1kma4bEuOTNMJPk6yVPXMrF6c+ycpfGtt+l4NA60vp8JgwOg6P0jHIwbxtbMq2ye
 W913pvitFAMsz71ChlNbORZFi8aZwjsphudV+GDYaAUZpzY4B3EIsO9bosnFhpHFOp
 KLdY1gZOo17YKHVEZvuTrAmP5OX5qv4DNT1pVYh0=
Date: Wed, 13 May 2020 10:27:25 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200513172725.GC1243@sol.localdomain>
References: <20200430115959.238073-1-satyat@google.com>
 <20200430115959.238073-4-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430115959.238073-4-satyat@google.com>
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
X-Headers-End: 1jYvAP-00EAnq-0x
Subject: Re: [f2fs-dev] [PATCH v12 03/12] block: Inline encryption support
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

On Thu, Apr 30, 2020 at 11:59:50AM +0000, Satya Tangirala wrote:
> We must have some way of letting a storage device driver know what
> encryption context it should use for en/decrypting a request. However,
> it's the upper layers (like the filesystem/fscrypt) that know about and
> manages encryption contexts. As such, when the upper layer submits a bio
> to the block layer, and this bio eventually reaches a device driver with
> support for inline encryption, the device driver will need to have been
> told the encryption context for that bio.
> 
> We want to communicate the encryption context from the upper layer to the
> storage device along with the bio, when the bio is submitted to the block
> layer. To do this, we add a struct bio_crypt_ctx to struct bio, which can
> represent an encryption context (note that we can't use the bi_private
> field in struct bio to do this because that field does not function to pass
> information across layers in the storage stack). We also introduce various
> functions to manipulate the bio_crypt_ctx and make the bio/request merging
> logic aware of the bio_crypt_ctx.
> 
> We also make changes to blk-mq to make it handle bios with encryption
> contexts. blk-mq can merge many bios into the same request. These bios need
> to have contiguous data unit numbers (the necessary changes to blk-merge
> are also made to ensure this) - as such, it suffices to keep the data unit
> number of just the first bio, since that's all a storage driver needs to
> infer the data unit number to use for each data block in each bio in a
> request. blk-mq keeps track of the encryption context to be used for all
> the bios in a request with the request's rq_crypt_ctx. When the first bio
> is added to an empty request, blk-mq will program the encryption context
> of that bio into the request_queue's keyslot manager, and store the
> returned keyslot in the request's rq_crypt_ctx. All the functions to
> operate on encryption contexts are in blk-crypto.c.
> 
> Upper layers only need to call bio_crypt_set_ctx with the encryption key,
> algorithm and data_unit_num; they don't have to worry about getting a
> keyslot for each encryption context, as blk-mq/blk-crypto handles that.
> Blk-crypto also makes it possible for request-based layered devices like
> dm-rq to make use of inline encryption hardware by cloning the
> rq_crypt_ctx and programming a keyslot in the new request_queue when
> necessary.
> 
> Note that any user of the block layer can submit bios with an
> encryption context, such as filesystems, device-mapper targets, etc.
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>

Looks good, you can add:

    Reviewed-by: Eric Biggers <ebiggers@google.com>

A few comments for if you resend:

> @@ -647,6 +651,8 @@ bool bio_attempt_front_merge(struct request *req, struct bio *bio,
>  	req->__sector = bio->bi_iter.bi_sector;
>  	req->__data_len += bio->bi_iter.bi_size;
>  
> +	bio_crypt_attempt_front_merge(req, bio);
> +
>  	blk_account_io_start(req, false);
>  	return true;
>  }

I think this should be called "bio_crypt_do_front_merge()", since at this point
we've already decided to do the front merge, not just "attempt" it.
"bio_crypt_attempt_front_merge()" sounds like it should have a return value, so
it confused me at first glance.

> +/**
> + * blk_crypto_init_key() - Prepare a key for use with blk-crypto
> + * @blk_key: Pointer to the blk_crypto_key to initialize.
> + * @raw_key: Pointer to the raw key. Must be the correct length for the chosen
> + *	     @crypto_mode; see blk_crypto_modes[].
> + * @crypto_mode: identifier for the encryption algorithm to use
> + * @dun_bytes: number of bytes that will be used to specify the DUN when this
> + *	       key is used
> + * @data_unit_size: the data unit size to use for en/decryption
> + *
> + * Return: 0 on success, -errno on failure.  The caller is responsible for
> + *	   zeroizing both blk_key and raw_key when done with them.
> + */
> +int blk_crypto_init_key(struct blk_crypto_key *blk_key, const u8 *raw_key,
> +			enum blk_crypto_mode_num crypto_mode,
> +			unsigned int dun_bytes,
> +			unsigned int data_unit_size)
> +{
> +	const struct blk_crypto_mode *mode;
> +
> +	memset(blk_key, 0, sizeof(*blk_key));
> +
> +	if (crypto_mode >= ARRAY_SIZE(blk_crypto_modes))
> +		return -EINVAL;
> +
> +	mode = &blk_crypto_modes[crypto_mode];
> +	if (mode->keysize == 0)
> +		return -EINVAL;
> +
> +	if (!is_power_of_2(data_unit_size))
> +		return -EINVAL;

Since we're validating the crypto_mode and data_unit_size, we should validate
the dun_bytes too:

	if (dun_bytes <= 0 || dun_bytes > BLK_CRYPTO_MAX_IV_SIZE)
		return -EINVAL;

(One might argue that dun_bytes == 0 should be allowed in case we add support
for AES-ECB to blk-crypto, to align with the UFS specification which allows it.
But ECB isn't suitable for disk encryption and should never have been included
in the specification, so IMO we should reject dun_bytes==0 with prejudice :-) )

> @@ -2016,6 +2021,15 @@ static blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio)
>  
>  	blk_mq_bio_to_request(rq, bio, nr_segs);
>  
> +	ret = blk_crypto_init_request(rq);
> +	if (ret != BLK_STS_OK) {
> +		bio->bi_status = ret;
> +		bio_endio(bio);
> +		blk_mq_free_request(rq);
> +		return BLK_QC_T_NONE;
> +	}
> +
> +

There's an extra blank line here.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
