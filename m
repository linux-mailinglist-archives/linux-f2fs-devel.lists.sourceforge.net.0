Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACE518B1E8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2020 12:02:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jEsw3-0006GK-Jx; Thu, 19 Mar 2020 11:01:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+061b0704d8249feb4593+6052+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1jEsw1-0006GC-BH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Mar 2020 11:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+vl1LPoxkxHOU07W4GJvGU25FEPxKQgvle0+E353mqE=; b=jUjnWuztqQc5CckbGDtGCdmCCR
 0JNH8uS7EXZGekqCDBwRvxgzPzmXf/lfpYdReacsY0AiXHzg7U5QhITKxOTZEr2FRgKeSh3f0zxFu
 xgCI7AHq1ilBDqsA1LWPkZdsYb4XHlEey25d0HRmMgGBRPfHoqj3ktx6oPcIOSaNZwMA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+vl1LPoxkxHOU07W4GJvGU25FEPxKQgvle0+E353mqE=; b=CcVxTvNw2p1po0cHYZbfJdnm/a
 WXGiBaWyCAwS60RwHwQlQEYxQT0YX9PdwOcMFT4UXhJL9/AfxGHpCJ+47FHly4sDaXaL5Rv/rMrxz
 zsrWoiAhwR96/a6/kew8EdiJdw8niDPZq7kguJYWQWVZN32A99B38MwgCO+7hzs17ieo=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jEsvu-00E4c7-Vk
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Mar 2020 11:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+vl1LPoxkxHOU07W4GJvGU25FEPxKQgvle0+E353mqE=; b=uB9WB4ppC1GoT/zWSO4kHWQgqn
 YEUMLeqg4KslKZWQmzvuxToWpdzkInoQ6yirSVGLEzZWN+M49KYCqhQL1Kp0IO7qy8wXnrOv3x2aO
 W5D2/C6QV2R2hwbcqQSbe4YYjO+POTtpgdUFtQJSuA2tp3egSU0flbEt9754bcOhT2aqNszvXB0od
 0+QAE9ZkFUa8gPY94HJMWAQlEQGtIfutJ+QDTm+6CjBOF8Je23JCGh8n3eOneufR5e0CN4hxZ18r8
 LBvvqDmI6PGwo4zu5Al12gwJ1sq+GzNaODmkYU5KRKsLc3UYVVWEN6IHokPY+Xlg3+X+ajSHl6+su
 i3opea0g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jEsvi-00047Y-O6; Thu, 19 Mar 2020 11:01:38 +0000
Date: Thu, 19 Mar 2020 04:01:38 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200319110138.GA20097@infradead.org>
References: <20200312080253.3667-1-satyat@google.com>
 <20200312080253.3667-3-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200312080253.3667-3-satyat@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jEsvu-00E4c7-Vk
Subject: Re: [f2fs-dev] [PATCH v8 02/11] block: Inline encryption support
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

On Thu, Mar 12, 2020 at 01:02:44AM -0700, Satya Tangirala wrote:
> +	if (bio_has_crypt_ctx(bio))
> +		bio_crypt_clone(b, bio, gfp_mask);

FYI, what I had tried to suggest when moving the the bio_has_crypt_ctx
checks out was not to open code them, but to have inline functions.

E.g. your current bio_crypt_clone becomes __bio_crypt_clone,

and then a wrapper is added ala:

static inline void bio_crypt_clone(struct bio *dst, struct bio *src,
		gfp_t gfp_mask)
{
	if (bio_has_crypt_ctx(bio))
		__bio_crypt_clone(dst, src, gfp_mask);
}

Which also means in all the headers you can now declare everything
unconditional as long as bio_has_crypt_ctx is stubbed out for the case
where blk crypto is disabled.

>  	if (bio_integrity(bio)) {
>  		int ret;
>  
>  		ret = bio_integrity_clone(b, bio, gfp_mask);
> -
>  		if (ret < 0) {
>  			bio_put(b);
>  			return NULL;

Spurious whitespace change.

>  free_and_out:
> @@ -1813,5 +1830,7 @@ int __init blk_dev_init(void)
>  	blk_debugfs_root = debugfs_create_dir("block", NULL);
>  #endif
>  
> +	bio_crypt_ctx_init();
> +

Is there any good reason to explicitly call bio_crypt_ctx_init vs just
making it a local subsys_initcall?

> +bool bio_crypt_dun_is_contiguous(const struct bio_crypt_ctx *bc,
> +				 unsigned int bytes,
> +				 u64 next_dun[BLK_CRYPTO_DUN_ARRAY_SIZE])
> +{
> +	int i = 0;
> +	unsigned int inc = bytes >> bc->bc_key->data_unit_size_bits;
> +
> +	while (i < BLK_CRYPTO_DUN_ARRAY_SIZE) {
> +		if (bc->bc_dun[i] + inc != next_dun[i])
> +			return false;
> +		inc = ((bc->bc_dun[i] + inc)  < inc);

Besides the bracing and double whitespace issue this code looks weird
to me.

So inc starts out as the number of bytes shifted to the dun size.

We then check if it matches the next dun for every entry in the
array.

But then inc is turned into a bollean for the next iteration.  At that
point I'm a little lost, can you add comments or make the code more
explicit?

> +	blk_crypto_rq_set_defaults(rq);
> +
> +	err = blk_ksm_get_slot_for_key(rq->q->ksm,
> +				       bio->bi_crypt_context->bc_key,
> +				       &rq->crypt_keyslot);
> +	if (err != BLK_STS_OK)
> +		pr_warn_once("Failed to acquire keyslot for %s (err=%d).\n",
> +			     bio->bi_disk->disk_name, err);
> +	return err;

Is this error really that important?  If someone prints an error here
I'd expect the low-level driver to do that, as that is the only place
knowing what kind of error we could have here.

> +int blk_crypto_bio_prep(struct bio **bio_ptr)
> +{
> +	struct bio *bio = *bio_ptr;
> +
> +	/*
> +	 * If bio has no data, just pretend it didn't have an encryption
> +	 * context.
> +	 */
> +	if (!bio_has_data(bio)) {
> +		bio_crypt_free_ctx(bio);
> +		return 0;
> +	}

Shouldn't a submitted bio without data but with a crypt context be a
hard error?

> +	bio_crypt_check_alignment(bio);
> +	if (bio->bi_status != BLK_STS_OK)
> +		goto fail;

Weird calling convention.  Why doesn't bio_crypt_check_alignment
return a bool, and then this becomes the much more obvious:

	if (!bio_crypt_check_alignment(bio)) {
		bio->bi_status = BLK_STS_IOERR;
		goto fail;
	}

> +	/*
> +	 * Success if device supports the encryption context, and blk-integrity
> +	 * isn't supported by device/is turned off.
> +	 */
> +	if (!blk_ksm_crypto_key_supported(bio->bi_disk->queue->ksm,
> +					  bio->bi_crypt_context->bc_key)) {
> +		bio->bi_status = BLK_STS_NOTSUPP;
> +		goto fail;
> +	}
> +
> +	return 0;
> +fail:
> +	bio_endio(*bio_ptr);
> +	return -EIO;

Weird calling convention again.  If the actual error is in the bio,
this should just be a bool.

> +void blk_crypto_rq_prep_clone(struct request *dst, struct request *src)
> +{
> +	dst->crypt_ctx = src->crypt_ctx;
> +}

This seems reasonable to inline in the header..

> +	blk_status_t err;
>  
>  	blk_queue_bounce(q, &bio);
>  	__blk_queue_split(q, &bio, &nr_segs);
> @@ -2002,6 +2007,16 @@ static blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio)
>  
>  	cookie = request_to_qc_t(data.hctx, rq);
>  
> +	if (bio_has_crypt_ctx(bio)) {
> +		err = blk_crypto_init_request(rq, bio);
> +		if (err != BLK_STS_OK) {

The err declaration can go into this scope.  I'd also rather call it
ret as err is usually used for errno codes.

Also blk_crypto_init_request doesn't really need the bio, but just the
key.  So I'd rather pass the key to avoid confusion what this function
might do with the bio.

> +			bio->bi_status = err;
> +			bio_endio(bio);
> +			blk_mq_end_request(rq, err);
> +			return BLK_QC_T_NONE;

Shoudn't the blk_mq_end_request just be a blk_mq_free_request here?

> +#ifdef CONFIG_BLOCK
> +
> +#include <linux/blk_types.h>
> +#include <linux/blkdev.h>
> +
> +struct request;
> +struct request_queue;
> +
> +#ifdef CONFIG_BLK_INLINE_ENCRYPTION

Does the #ifdef CONFIG_BLOCK buy us anything?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
