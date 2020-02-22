Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16836168B4A
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Feb 2020 01:53:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KesydvlSNqBqIyBYak5hP1FHuk3QGxZP4UKR7htf+tc=; b=fR3loUCRIDcKs6rOX4rSb4oc8
	jBZLHyOV5ONPjSG9+i093FxcwWa2JnrYnm/OJhNPIhBgcMb3VChXvH9Y+IImo602VHz4bkL0MuT5M
	J/X+RbdFpHram26wROPCyxxD0dVG+uBQflokjU4pjf/b4m3lNgKqss9V2fuqrhdpBR51c=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j5J2J-0000Yw-BD; Sat, 22 Feb 2020 00:52:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1j5J2F-0000Ym-JC
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Feb 2020 00:52:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RgwHC/xJ6z3IoTDapB9+p/azB4W+mfq89bfnSBwiKXw=; b=YRW6KaJ8e9pOga+n+qhGbxXCLG
 SHz79az5MkiFGwP07vyveYDttiaF+9RprG9Oun/luwhd5xxSdhSGxF4P4h4J0x8YkB7kNrBK/f+iN
 KYI9pfrjHLolRH5roTpP4/k3w7TXnKBzsCqFlEW0GrcIszy+4srvcIy+osDl6BRAvnTg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RgwHC/xJ6z3IoTDapB9+p/azB4W+mfq89bfnSBwiKXw=; b=UFDVnFB7mBT1smhAoZg/yEfSHI
 kh674NVQXHnguVrBc+v/ThzKL3qVVJvDc3u7TYeGIJOA3diAg9M/IDnjz7QeweVIuuJMc5BOEmvwc
 5yzbMCC0plNgp+a95z1xSocq5XjL56MERJ+c+hf5ug6S7V0ndaA+NBH/O4Ur0IC/jt/g=;
Received: from mail-pj1-f65.google.com ([209.85.216.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1j5J2D-0007B2-W4
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Feb 2020 00:52:47 +0000
Received: by mail-pj1-f65.google.com with SMTP id j17so1526787pjz.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Feb 2020 16:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RgwHC/xJ6z3IoTDapB9+p/azB4W+mfq89bfnSBwiKXw=;
 b=GjuIbG+7JA8abt7bW6huT9ZvjkX1f3LeWLtW5lZ5cGz7SJ2HOzUv/dG2M4967+1JYP
 HJRxITLIyW/oZmu04niY1J1QG/KT/nxK6DxZtm3pKN9Ajr1DeUiqqW9drC6CR9OqQKes
 lKiJQqwd4OoEPalnxIh00V+nH1Yz209z9U0t0etisTudESVS2PTg51Y79+QAe0k+hNsK
 WvyDA565stfk7ZmKC4wypvKeB+dE8zuRptwJRq1THi5oB6zlm8ixUNZRx9jB2hjqbn0n
 Zw+0qic6cakfHxYEWHPkgyk06t2EQbf4rokK4lQrkhEeRwxVygCOBAgv7LRllNhvUw6Z
 OLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RgwHC/xJ6z3IoTDapB9+p/azB4W+mfq89bfnSBwiKXw=;
 b=jTfVrtARXCsQ4tZ6gFovZkMsB55WFFDD+Pb1/3jcQUKElJkRdjbiFuE7XNHgfT7H/e
 MN79b1XszJfVe+Lpeu0JYbd3DpzIxkl1JzZF96Igql4HqPqQ5wznVwu+hkQAhwF5wGJM
 L5J+dq16EZL4fS3Blk0t8H4ZOuCPgtq1be1OFKphvLOMahF10PHlIb+/ZhQJqQIN2WOk
 /Q6+31f8SdN2ReTqhHYC6w5pW24w60HsiBS6ysXeI9LaOAF1XFrA2aaq93Gm/+FDKXFG
 C6MDsXUMcldAaUhHCeC8EWiBmQJcRyHtKQ3ylYbBy98VNzyeHD0eV1lez09tUEamhAey
 0J2Q==
X-Gm-Message-State: APjAAAU3rG+LwFZN6q5rLLTok87EmTd+ign78Chz5GBhosrOdJk+abkh
 kKKfvU1magj/OpabV3f/IDvtdA==
X-Google-Smtp-Source: APXvYqxQiXBE77sn3DOouv+cexHyfbWflYwaP1vyX0KGTbCxCKNBOxslYHw0Aq5oGZmGbGj9/1XTiQ==
X-Received: by 2002:a17:902:104:: with SMTP id 4mr38397960plb.24.1582332759540; 
 Fri, 21 Feb 2020 16:52:39 -0800 (PST)
Received: from google.com ([2620:15c:201:0:7f8c:9d6e:20b8:e324])
 by smtp.gmail.com with ESMTPSA id j4sm4086854pfh.152.2020.02.21.16.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 16:52:38 -0800 (PST)
Date: Fri, 21 Feb 2020 16:52:33 -0800
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200222005233.GA209268@google.com>
References: <20200221115050.238976-1-satyat@google.com>
 <20200221115050.238976-3-satyat@google.com>
 <20200221172205.GB438@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221172205.GB438@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -14.1 (--------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.8 FSL_HELO_FAKE          No description available.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.65 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j5J2D-0007B2-W4
Subject: Re: [f2fs-dev] [PATCH v7 2/9] block: Inline encryption support for
 blk-mq
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

On Fri, Feb 21, 2020 at 09:22:05AM -0800, Christoph Hellwig wrote:
> > index bf62c25cde8f..bce563031e7c 100644
> > --- a/block/bio-integrity.c
> > +++ b/block/bio-integrity.c
> > @@ -42,6 +42,11 @@ struct bio_integrity_payload *bio_integrity_alloc(struct bio *bio,
> >  	struct bio_set *bs = bio->bi_pool;
> >  	unsigned inline_vecs;
> >  
> > +	if (bio_has_crypt_ctx(bio)) {
> > +		pr_warn("blk-integrity can't be used together with blk-crypto en/decryption.");
> > +		return ERR_PTR(-EOPNOTSUPP);
> > +	}
> 
> What is the rationale for this limitation?  Restricting unrelated
> features from being used together is a pretty bad design pattern and
> should be avoided where possible.  If it can't it needs to be documented
> very clearly.
> 
My understanding of blk-integrity is that for writes, blk-integrity
generates some integrity info for a bio and sends it along with the bio,
and the device on the other end verifies that the data it received to
write matches up with the integrity info provided with the bio, and
saves the integrity info along with the data. As for reads, the device
sends the data along with the saved integrity info and blk-integrity
verifies that the data received matches up with the integrity info.

So for encryption and integrity to work together, in systems without
hardware inline encryption support, encryption of data in a bio must
happen in the kernel before bio_integrity_prep, since we shouldn't
modify data in the bio after integrity calculation, and similarly,
decryption of data in the bio must happen in the kernel after integrity
verification. The integrity info saved on disk is the integrity info of
the ciphertext.

But in systems with hardware inline encryption support, during write, the
device will receive integrity info of the plaintext data, and during
read, it will send integrity info of the plaintext data to the kernel. I'm
worried that the device may not do anything special and simply save the
integrity info of the plaintext on disk which will cause the on disk
format to no longer be the same whether or not hardware inline encryption
support is present, which will cause issues like not being able to ever
switch between using the "inlinecrypt" mount option (and in particular,
that means people with existing encrypted filesystems on disks with
integrity can't just turn on the "inlinecrypt" mount option).

As far as I can tell, I think all the issues go away if the hardware
explicitly computes integrity info for the ciphertext and stores that on
disk instead of what the kernel passes it, and on the read path, it
decrypts the data on disk and generates integrity info for the plain
text, and passes it to the kernel. Eric also points out that a device
that just stores integrity info of the plaintext on disk would be broken
since the integrity info would leak information about the plaintext, and
that the correct thing for the device to do is store integrity info
computed using only the ciphertext.

So if we're alright with assuming for now that hardware vendors will at
least plan to do the "right" thing, I'll just remove the exclusivity
check in bio-integrity and also the REQ_NO_SPECIAL code :) (and figure
out how to handle dm-integrity) because the rest of the code will
otherwise work as intended w.r.t encryption with integrity. As for
handling cases like devices that actually don't do the "right" thing, or
devices that support both features but just not at the same time, I think
I'll leave that to when we actually have hardware that has both these
features.

> > +#ifdef CONFIG_BLK_INLINE_ENCRYPTION
> > +	rq->rq_crypt_ctx.keyslot = -EINVAL;
> > +#endif
> 
> All the other core block calls to the crypto code are in helpers that
> are stubbed out.  It might make sense to follow that style here.
> 
> >  
> >  free_and_out:
> > @@ -1813,5 +1826,8 @@ int __init blk_dev_init(void)
> >  	blk_debugfs_root = debugfs_create_dir("block", NULL);
> >  #endif
> >  
> > +	if (bio_crypt_ctx_init() < 0)
> > +		panic("Failed to allocate mem for bio crypt ctxs\n");
> 
> Maybe move that panic into bio_crypt_ctx_init itself?
> 
> > +static int num_prealloc_crypt_ctxs = 128;
> > +
> > +module_param(num_prealloc_crypt_ctxs, int, 0444);
> > +MODULE_PARM_DESC(num_prealloc_crypt_ctxs,
> > +		"Number of bio crypto contexts to preallocate");
> 
> Please write a comment why this is a tunable, how the default is choosen
> and why someone might want to chane it.
> 
> > +struct bio_crypt_ctx *bio_crypt_alloc_ctx(gfp_t gfp_mask)
> > +{
> > +	return mempool_alloc(bio_crypt_ctx_pool, gfp_mask);
> > +}
> 
> I'd rather move bio_crypt_set_ctx out of line, at which point we don't
> really need this helper.
> 
> > +/* Return: 0 on success, negative on error */
> > +int rq_crypt_ctx_acquire_keyslot(struct bio_crypt_ctx *bc,
> > +				  struct keyslot_manager *ksm,
> > +				  struct rq_crypt_ctx *rc)
> > +{
> > +	rc->keyslot = blk_ksm_get_slot_for_key(ksm, bc->bc_key);
> > +	return rc->keyslot >= 0 ? 0 : rc->keyslot;
> > +}
> > +
> > +void rq_crypt_ctx_release_keyslot(struct keyslot_manager *ksm,
> > +				  struct rq_crypt_ctx *rc)
> > +{
> > +	if (rc->keyslot >= 0)
> > +		blk_ksm_put_slot(ksm, rc->keyslot);
> > +	rc->keyslot = -EINVAL;
> > +}
> 
> Is there really much of a need for these helpers?  I think the
> callers would generally be simpler without them.  Especially the
> fallback code can avoid having to declare rq_crypt_ctx variables
> on stack without the helpers.
> 
> > +int blk_crypto_init_request(struct request *rq, struct request_queue *q,
> > +			    struct bio *bio)
> 
> We can always derive the request_queue from rq->q, so there is no need
> to pass it explicitly (even if a lot of legacy block code does, but
> it is slowly getting cleaned up).
> 
> > +{
> > +	struct rq_crypt_ctx *rc = &rq->rq_crypt_ctx;
> > +	struct bio_crypt_ctx *bc;
> > +	int err;
> > +
> > +	rc->bc = NULL;
> > +	rc->keyslot = -EINVAL;
> > +
> > +	if (!bio)
> > +		return 0;
> > +
> > +	bc = bio->bi_crypt_context;
> > +	if (!bc)
> > +		return 0;
> 
> Shouldn't the checks if the bio actually requires crypto handling be
> done by the caller based on a new handler ala:
> 
> static inline bool bio_is_encrypted(struct bio *bio)
> {
> 	return bio && bio->bi_crypt_context;
> }
> 
> and maybe some inline helpers to reduce the clutter?
> 
> That way a kernel with blk crypto support, but using non-crypto I/O
> saves all the function calls to blk-crypto.
> 
> > +	err = bio_crypt_check_alignment(bio);
> > +	if (err)
> > +		goto fail;
> 
> This seems pretty late to check the alignment, it would be more
> useful in bio_add_page.  Then again Jens didn't like alignment checks
> in the block layer at all even for the normal non-crypto alignment,
> so I don't see why we'd have them here but not for the general case
> (I'd actually like to ee them for the general case, btw).
> 
> > +int blk_crypto_evict_key(struct request_queue *q,
> > +			 const struct blk_crypto_key *key)
> > +{
> > +	if (q->ksm && blk_ksm_crypto_mode_supported(q->ksm, key))
> > +		return blk_ksm_evict_key(q->ksm, key);
> > +
> > +	return 0;
> > +}
> 
> Is there any point in this wrapper that just has a single caller?
> Als why doesn't blk_ksm_evict_key have the blk_ksm_crypto_mode_supported
> sanity check itself?
> 
> > @@ -1998,6 +2007,13 @@ static blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio)
> >  
> >  	cookie = request_to_qc_t(data.hctx, rq);
> >  
> > +	if (blk_crypto_init_request(rq, q, bio)) {
> > +		bio->bi_status = BLK_STS_RESOURCE;
> > +		bio_endio(bio);
> > +		blk_mq_end_request(rq, BLK_STS_RESOURCE);
> > +		return BLK_QC_T_NONE;
> > +	}
> 
> This looks fundamentally wrong given that layers above blk-mq
> can't handle BLK_STS_RESOURCE.  It will just show up as an error
> in the calller insteaf of being requeued.
> 
> That being said I think the only error return from
> blk_crypto_init_request is and actual hardware error.  So failing this
> might be ok, but it should be BLK_STS_IOERR, or even better an error
> directly propagated from the driver. 
> 
> > +int bio_crypt_ctx_init(void);
> > +
> > +struct bio_crypt_ctx *bio_crypt_alloc_ctx(gfp_t gfp_mask);
> > +
> > +void bio_crypt_free_ctx(struct bio *bio);
> 
> These can go into block layer internal headers.
> 
> > +static inline bool bio_crypt_dun_is_contiguous(const struct bio_crypt_ctx *bc,
> > +					       unsigned int bytes,
> > +					u64 next_dun[BLK_CRYPTO_DUN_ARRAY_SIZE])
> > +{
> > +	int i = 0;
> > +	unsigned int inc = bytes >> bc->bc_key->data_unit_size_bits;
> > +
> > +	while (i < BLK_CRYPTO_DUN_ARRAY_SIZE) {
> > +		if (bc->bc_dun[i] + inc != next_dun[i])
> > +			return false;
> > +		inc = ((bc->bc_dun[i] + inc)  < inc);
> > +		i++;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> > +static inline void bio_crypt_dun_increment(u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE],
> > +					   unsigned int inc)
> > +{
> > +	int i = 0;
> > +
> > +	while (inc && i < BLK_CRYPTO_DUN_ARRAY_SIZE) {
> > +		dun[i] += inc;
> > +		inc = (dun[i] < inc);
> > +		i++;
> > +	}
> > +}
> 
> Should these really be inline?
> 
> > +bool bio_crypt_rq_ctx_compatible(struct request *rq, struct bio *bio);
> > +
> > +bool bio_crypt_ctx_front_mergeable(struct request *req, struct bio *bio);
> > +
> > +bool bio_crypt_ctx_back_mergeable(struct request *req, struct bio *bio);
> > +
> > +bool bio_crypt_ctx_merge_rq(struct request *req, struct request *next);
> > +
> > +void blk_crypto_bio_back_merge(struct request *req, struct bio *bio);
> > +
> > +void blk_crypto_bio_front_merge(struct request *req, struct bio *bio);
> > +
> > +void blk_crypto_free_request(struct request *rq);
> > +
> > +int blk_crypto_init_request(struct request *rq, struct request_queue *q,
> > +			    struct bio *bio);
> > +
> > +int blk_crypto_bio_prep(struct bio **bio_ptr);
> > +
> > +void blk_crypto_rq_bio_prep(struct request *rq, struct bio *bio);
> > +
> > +void blk_crypto_rq_prep_clone(struct request *dst, struct request *src);
> > +
> > +int blk_crypto_insert_cloned_request(struct request_queue *q,
> > +				     struct request *rq);
> > +
> > +int blk_crypto_init_key(struct blk_crypto_key *blk_key, const u8 *raw_key,
> > +			enum blk_crypto_mode_num crypto_mode,
> > +			unsigned int blk_crypto_dun_bytes,
> > +			unsigned int data_unit_size);
> > +
> > +int blk_crypto_evict_key(struct request_queue *q,
> > +			 const struct blk_crypto_key *key);
> 
> Most of this should be block layer private.
> 
> > +struct rq_crypt_ctx {
> > +	struct bio_crypt_ctx *bc;
> > +	int keyslot;
> > +};
> > +
> >  /*
> >   * Try to put the fields that are referenced together in the same cacheline.
> >   *
> > @@ -224,6 +230,10 @@ struct request {
> >  	unsigned short nr_integrity_segments;
> >  #endif
> >  
> > +#ifdef CONFIG_BLK_INLINE_ENCRYPTION
> > +	struct rq_crypt_ctx rq_crypt_ctx;
> > +#endif
> 
> I'd be tempted to just add
> 
> 	struct bio_crypt_ctx *crypt_ctx;
> 	int crypt_keyslot;
> 
> directly to struct request.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
