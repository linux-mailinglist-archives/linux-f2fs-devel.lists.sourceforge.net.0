Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 285F21B3B7F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Apr 2020 11:35:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jRBmh-0005yS-D0; Wed, 22 Apr 2020 09:35:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+f4d323def9086acb1ddf+6086+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1jRBmg-0005yL-Aw
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Apr 2020 09:35:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xcFiTZSrglcMD8nwtpbYfjiJzGQ3uCCaDpM9G1wNLKM=; b=NTMFzN+qes5a8XVSU87DxgA4em
 ODXR4ZXLEruXrQql5GqoQAtcx1Wy5IqSR/8hwf+6vBR3iZ+5Ol0zHE3mOcV+7IUwV5bHV5glASuqV
 IsfWy1UlCzFG5qI2E8SgjjZLARty96f8tade5yZbuBoLHXgMrpdeRYBQKAhlNqXQ+x4o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xcFiTZSrglcMD8nwtpbYfjiJzGQ3uCCaDpM9G1wNLKM=; b=GrGjtrQPXbGyZs6k4F3HoOK67Z
 V3WkOYET0IerBpNxAS3sWE3DFJUp64e49iZ3bYxgl93p3yEOkFNIsjWmGP1kcFAcvrHrKFC/dATyM
 +A7BNCgtH7AwbNo6KclbPyS9AspBlbBnI14N8RAd/K+Ce9VQAqLzIzJY2gFE+Xzfnh3g=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jRBme-009U1L-9g
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Apr 2020 09:35:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xcFiTZSrglcMD8nwtpbYfjiJzGQ3uCCaDpM9G1wNLKM=; b=TXFsXmPaYrp/VOshmRq5oS5gpB
 mH8EcHlmIZWR7Ds6MAyC3WNS9aJnVXMn5IBRQHmpHDNAaqgSJtN3Y5dM+5jCkkUPU9VIPuHBa0J5w
 hVKMsEVfCMpOpt19u+puh31aNERk7mTEFexQ19XaWimZfLH1XSuJzkCOFd8jnMoINlW6iJf4GKT1E
 RtHfgCVYHHVVqS8qCgihDk98Z9DjyOAtOR0VdaskIIHBcg2iEBSQciGxpj3KTviLZLUNBiSzLB8Bz
 rcSYZiir5vXAA7VR8XsKJrTJqgSaZLCmWDx5eJUt+HUGpWpvnk6yp4wwRd0E7ZzdRp1l60YO9hHcs
 lXmKpV8A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jRBmY-0006Xx-9a; Wed, 22 Apr 2020 09:35:02 +0000
Date: Wed, 22 Apr 2020 02:35:02 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200422093502.GB12290@infradead.org>
References: <20200408035654.247908-1-satyat@google.com>
 <20200408035654.247908-4-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408035654.247908-4-satyat@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jRBme-009U1L-9g
Subject: Re: [f2fs-dev] [PATCH v10 03/12] block: Inline encryption support
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

> +/**
> + * __blk_crypto_bio_prep - Prepare bio for inline encryption
> + *
> + * @bio_ptr: pointer to original bio pointer
> + *
> + * Succeeds if the bio doesn't have inline encryption enabled or if the bio
> + * crypt context provided for the bio is supported by the underlying device's
> + * inline encryption hardware. Ends the bio with error otherwise.
> + *
> + * Caller must ensure bio has bio_crypt_ctx.
> + *
> + * Return: true on success; false on error (and bio->bi_status will be set
> + *	   appropriately, and bio_endio() will have been called so bio
> + *	   submission should abort).
> + */
> +bool __blk_crypto_bio_prep(struct bio **bio_ptr)
> +{
> +	struct bio *bio = *bio_ptr;

Why is the bio passed by references?  As far as I can see it is never
changed.

> +
> +	/* Error if bio has no data. */
> +	if (WARN_ON_ONCE(!bio_has_data(bio)))
> +		goto fail;
> +
> +	if (!bio_crypt_check_alignment(bio))
> +		goto fail;
> +
> +	/*
> +	 * Success if device supports the encryption context, and blk-integrity
> +	 * isn't supported by device/is turned off.
> +	 */
> +	if (!blk_ksm_crypto_cfg_supported(bio->bi_disk->queue->ksm,
> +				&bio->bi_crypt_context->bc_key->crypto_cfg)) {

The indentation here looks odd.

> +		bio->bi_status = BLK_STS_NOTSUPP;
> +		goto fail;
> +	}
> +
> +	return true;
> +fail:
> +	bio_endio(*bio_ptr);

This seems to fail to set a status for the bio_has_data case,
and setting the status for bio_crypt_check_alignment should be moved
to here, where we also end the IO.

> + * __blk_crypto_rq_bio_prep - Prepare a request when its first bio is inserted
> + *
> + * @rq: The request to prepare
> + * @bio: The first bio being inserted into the request
> + *
> + * Frees the bio crypt context in the request's old rq->crypt_ctx, if any, and
> + * moves the bio crypt context of the bio into the request's rq->crypt_ctx.
> + */
> +void __blk_crypto_rq_bio_prep(struct request *rq, struct bio *bio)
> +{
> +	mempool_free(rq->crypt_ctx, bio_crypt_ctx_pool);
> +	rq->crypt_ctx = bio->bi_crypt_context;
> +	bio->bi_crypt_context = NULL;
> +}

This seems to be called in case of the both the initial request
creation and merging a bio into the request (although only the
front merge and not the back merge, which seems weird).

But even then the behvior seems odd as bio->bi_crypt_context becomes
NULL as soon as the bio is attached to a request, which seems like
a somewhat dangerous condition.  Maybe it works, but is it really worth
saving a little memory?  Why not just propagate the context of the first
bio to the request, and free them when the bio is completed?

Why do we always take the context from the bio instead of keeping
the one in the request?  After all we merge the bio into the request.

> +void __blk_crypto_rq_prep_clone(struct request *dst, struct request *src)
> +{
> +	dst->crypt_ctx = src->crypt_ctx;

Probably worth just open coding in the only caller..

> +
> +/**
> + * __blk_crypto_insert_cloned_request - Prepare a cloned request to be inserted
> + *					into a request queue.
> + * @rq: the request being queued
> + *
> + * Return: BLK_STS_OK on success, nonzero on error.
> + */
> +blk_status_t __blk_crypto_insert_cloned_request(struct request *rq)
> +{
> +	return blk_crypto_init_request(rq);

Same.

>  	__blk_queue_split(q, &bio, &nr_segs);
> @@ -2011,6 +2015,15 @@ static blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio)
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

Didn't Eric have a comment last round that we shoul dtry this before
attaching the bio to simplify error handling?

> +#define BLK_CRYPTO_DUN_ARRAY_SIZE	(BLK_CRYPTO_MAX_IV_SIZE/sizeof(u64))

Please use whitespace before and after operators.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
