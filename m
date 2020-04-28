Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDF31BB45D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Apr 2020 05:02:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xCd5VnD2RLV+ccMmTpTbBtFq+i0yDEo0KkRjbud7pCc=; b=C68BlNwy66Kbgstv+Rsg6N0wa
	r/6X7ZOtI08PkKyv+OZrtmW5DKhr0gzSNNVIEX9EQN823Fmx5nu+/W4HmFSSc4rVl3qjNDWfoaA8R
	nkhAPfbI+NIQ/jYTghZioQkL5FvT7hNdMccMtDSPcw3twrLuuy3nN/XYNiuHBgRSt3pfs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jTGVQ-00035R-VY; Tue, 28 Apr 2020 03:01:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1jTGVP-00035A-MG
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Apr 2020 03:01:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8X7sjxWfBXEnwlAIccc/BIFynhnhZILqHqql667aJyw=; b=hfMu8+K/UQwiPs4S+O2AAe7SQP
 wBHDfwNYOWMuGsFjh2c2RUA8guIEN6x4YVdjCGcl1DOP74yLAc0eM9OSyzkMFbyzc2LjzulESVdrz
 n6VtQrfflo2A7UyrRpwVmtQIyqkFlMhaXNclJ0lughAyC1ra82E6rvhlPbYXyTR7I/x0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8X7sjxWfBXEnwlAIccc/BIFynhnhZILqHqql667aJyw=; b=MMNFZtDvFZAoY1ZqcYcQ6Ozr7T
 /AokeWNCsu3Vt9XUlGt4GE4/ksHZ8p+dc67m+WY5QN2R/W7jPOO6RpJYjDXXLgQYfMXOuZzMsmObd
 rxs0A1FbqBlXnjZex+lrVc8uUAJJINnWNZp17hXbcwYINja1zCdpvotdEbFeYBbqntqE=;
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jTGVL-000k6j-5g
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Apr 2020 03:01:55 +0000
Received: by mail-pf1-f196.google.com with SMTP id p25so9977978pfn.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 27 Apr 2020 20:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8X7sjxWfBXEnwlAIccc/BIFynhnhZILqHqql667aJyw=;
 b=MJ2naptCGJtgldjUsJvu9/UwdOT0JmFnfH/+x5mMTpOnQ2ncMJYuaCx4zW6DF/4t4c
 itBoG6k6aRmVzhMwFOtGzK/GZ5wAgSEAxGOR7n6aVsRdnfy4C2qEyzLaIyvp1hd7FrbX
 2ss7j58r/AX/yAF33kt4HFZOxhckH8CumL7yyrLbDKd+RZHObMK5kNIwvj829/j2A5FZ
 37K8QxqtAgS4jMIrpXW9RSPnmwuJf9mpr0FKyCwWjJcjkupDaO8gO+L5QXcrgzSGEMRf
 1I7WtlEw+d+pSjqOzeIEY36vua57zSKEj4NpyxCARWZD+/tZi76RXArDTGag40uTZ4Qx
 N89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8X7sjxWfBXEnwlAIccc/BIFynhnhZILqHqql667aJyw=;
 b=NY/J1u7C+7vZtxqBR6qIKXmqSDM184zLy6gM80w9TPomgzgBjG4ytF4xK+pa1w6pR1
 l67uWpfTu8wMt2aTpAZP+EZmQA9OMIf9iBUk5vEc6+nhtEnmL9imod/QN2iNaGw/mE3T
 kuPetuPX5YUn/Mr9BV0gpzd9ENyV169eE3cxP/Dtugn+8yipv6VJ2UBTiSEkNoNoQP/h
 jZZm84VHBgHf6SWUnAb/HmeNaq+2xTPaQTa5AyK50InqnC3TEkBryoo7nPRg3gxKBawH
 1XAOLLobgXj8JXP/Z/adU8TYVGYhA0/Tt/rBmx9O5mtz+HT4s6c13FEIj/53fzhe49p8
 oxfg==
X-Gm-Message-State: AGi0PuZ4tw+arWUAuivP3LJo0rI8+gGZlNhXhQLuhrCNvd1QoykHQWsv
 sX0zX2jAbfcOnLizPKRJpaQYY95s1Ixg0Q==
X-Google-Smtp-Source: APiQypIEv+gxMsWu08uDFo3qeiz6pIj/YV2Suq5AiiZQNzFqX8Rk/gg5BKQwyeLAGuc9ioMjuiPC6A==
X-Received: by 2002:a62:2783:: with SMTP id
 n125mr28966313pfn.133.1588042444920; 
 Mon, 27 Apr 2020 19:54:04 -0700 (PDT)
Received: from google.com (56.4.82.34.bc.googleusercontent.com. [34.82.4.56])
 by smtp.gmail.com with ESMTPSA id
 127sm14238478pfw.72.2020.04.27.19.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 19:54:04 -0700 (PDT)
Date: Tue, 28 Apr 2020 02:54:00 +0000
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200428025400.GB52406@google.com>
References: <20200408035654.247908-1-satyat@google.com>
 <20200408035654.247908-4-satyat@google.com>
 <20200422093502.GB12290@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200422093502.GB12290@infradead.org>
X-Spam-Score: -15.9 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.196 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.196 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jTGVL-000k6j-5g
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 22, 2020 at 02:35:02AM -0700, Christoph Hellwig wrote:
> > +/**
> > + * __blk_crypto_bio_prep - Prepare bio for inline encryption
> > + *
> > + * @bio_ptr: pointer to original bio pointer
> > + *
> > + * Succeeds if the bio doesn't have inline encryption enabled or if the bio
> > + * crypt context provided for the bio is supported by the underlying device's
> > + * inline encryption hardware. Ends the bio with error otherwise.
> > + *
> > + * Caller must ensure bio has bio_crypt_ctx.
> > + *
> > + * Return: true on success; false on error (and bio->bi_status will be set
> > + *	   appropriately, and bio_endio() will have been called so bio
> > + *	   submission should abort).
> > + */
> > +bool __blk_crypto_bio_prep(struct bio **bio_ptr)
> > +{
> > +	struct bio *bio = *bio_ptr;
> 
> Why is the bio passed by references?  As far as I can see it is never
> changed.
> 
It's modified by additions in the next patch in the series and I
thought I should introduce the function with the final type from the
get go - is that alright?
> > +
> > +	/* Error if bio has no data. */
> > +	if (WARN_ON_ONCE(!bio_has_data(bio)))
> > +		goto fail;
> > +
> > +	if (!bio_crypt_check_alignment(bio))
> > +		goto fail;
> > +
> > +	/*
> > +	 * Success if device supports the encryption context, and blk-integrity
> > +	 * isn't supported by device/is turned off.
> > +	 */
> > +	if (!blk_ksm_crypto_cfg_supported(bio->bi_disk->queue->ksm,
> > +				&bio->bi_crypt_context->bc_key->crypto_cfg)) {
> 
> The indentation here looks odd.
> 
> > +		bio->bi_status = BLK_STS_NOTSUPP;
> > +		goto fail;
> > +	}
> > +
> > +	return true;
> > +fail:
> > +	bio_endio(*bio_ptr);
> 
> This seems to fail to set a status for the bio_has_data case,
> and setting the status for bio_crypt_check_alignment should be moved
> to here, where we also end the IO.
> 
> > + * __blk_crypto_rq_bio_prep - Prepare a request when its first bio is inserted
> > + *
> > + * @rq: The request to prepare
> > + * @bio: The first bio being inserted into the request
> > + *
> > + * Frees the bio crypt context in the request's old rq->crypt_ctx, if any, and
> > + * moves the bio crypt context of the bio into the request's rq->crypt_ctx.
> > + */
> > +void __blk_crypto_rq_bio_prep(struct request *rq, struct bio *bio)
> > +{
> > +	mempool_free(rq->crypt_ctx, bio_crypt_ctx_pool);
> > +	rq->crypt_ctx = bio->bi_crypt_context;
> > +	bio->bi_crypt_context = NULL;
> > +}
> 
> This seems to be called in case of the both the initial request
> creation and merging a bio into the request (although only the
> front merge and not the back merge, which seems weird).
> 
> But even then the behvior seems odd as bio->bi_crypt_context becomes
> NULL as soon as the bio is attached to a request, which seems like
> a somewhat dangerous condition.  Maybe it works, but is it really worth
> saving a little memory?  Why not just propagate the context of the first
> bio to the request, and free them when the bio is completed?
> 
> Why do we always take the context from the bio instead of keeping
> the one in the request?  After all we merge the bio into the request.
> 
> > +void __blk_crypto_rq_prep_clone(struct request *dst, struct request *src)
> > +{
> > +	dst->crypt_ctx = src->crypt_ctx;
> 
> Probably worth just open coding in the only caller..
> 
> > +
> > +/**
> > + * __blk_crypto_insert_cloned_request - Prepare a cloned request to be inserted
> > + *					into a request queue.
> > + * @rq: the request being queued
> > + *
> > + * Return: BLK_STS_OK on success, nonzero on error.
> > + */
> > +blk_status_t __blk_crypto_insert_cloned_request(struct request *rq)
> > +{
> > +	return blk_crypto_init_request(rq);
> 
> Same.
> 
> >  	__blk_queue_split(q, &bio, &nr_segs);
> > @@ -2011,6 +2015,15 @@ static blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio)
> >  
> >  	blk_mq_bio_to_request(rq, bio, nr_segs);
> >  
> > +	ret = blk_crypto_init_request(rq);
> > +	if (ret != BLK_STS_OK) {
> > +		bio->bi_status = ret;
> > +		bio_endio(bio);
> > +		blk_mq_free_request(rq);
> > +		return BLK_QC_T_NONE;
> > +	}
> 
> Didn't Eric have a comment last round that we shoul dtry this before
> attaching the bio to simplify error handling?
> 
In the previous round, I believe Eric commented that I should call
blk_crypto_init_request after bio_to_request so that we can do away
with some of the arguments to blk_crypto_init_request and also a
boilerplate function used only while calling blk_crypto_init_request.
I realize you wrote "And we can fail just the request on an error, so
yes this doesn't seem too bad." in response to this particular
comment of Eric's, and it seems I might not actually have understood
what that meant - did you have something in mind different from what I'm
doing here?

> > +#define BLK_CRYPTO_DUN_ARRAY_SIZE	(BLK_CRYPTO_MAX_IV_SIZE/sizeof(u64))
> 
> Please use whitespace before and after operators.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
