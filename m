Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC9E2B73D2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Nov 2020 02:40:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JBml69oROZot3lPKZw0l3WuHZdqdZo1zaLWTMYxDZcI=; b=b7Cxm/MXohBV8HBqh5N7dn7QM
	Tcxj8rcO47A7hryGXTiH3EdSqgWv8O7H4X7ccK1bA1dOJJfbY5JLQHqn1oNmC6s2o8WjcOAGc43kr
	03E5IcdcVI71ec1V2tbpmA7R7IMfEzbO3BAV1NLntf08kwxbkLsZsazl6R0rAdQWs4+ig=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kfCSU-0006aw-KB; Wed, 18 Nov 2020 01:40:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1kfCSS-0006an-K0
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 01:40:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OZQGoYGnoHs+9ApYZ7Z+Ccs9twmxhveiKgSrp4BfJLE=; b=C7zvR6wPPPAwG2r2ZGobEsZ6G4
 UK3VLtRippotSy2HyF22BkrkRkTqwSI948B7gRuGroa7RjwNcKnkZOMG4eeF1Ss6C25se0gvQrjX5
 Bb++4ELOszddgHa+EVq6q4zYtrveGkdChGgb40uwPuETa/dMuWT9xD6dV8Kk0CVgrHNk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OZQGoYGnoHs+9ApYZ7Z+Ccs9twmxhveiKgSrp4BfJLE=; b=jhMep8j9tRxdI6cHLQwSCJllIQ
 EuclM3BcDylq1+DzKkuAjb1548F10BunmdQdFCs0kO8UsCrldPwJ5xn37qfAd0LG2c5bKlKsXg8pi
 e0pYUG/KyOrLBh0cTx/th912TfZ1mbJA4YYIQnsMcwXZH2HCaXO2C7p8qB0sgAYDYQcw=;
Received: from mail-vk1-f194.google.com ([209.85.221.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kfCSJ-00BsL3-09
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 01:40:28 +0000
Received: by mail-vk1-f194.google.com with SMTP id s135so93733vkh.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Nov 2020 17:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OZQGoYGnoHs+9ApYZ7Z+Ccs9twmxhveiKgSrp4BfJLE=;
 b=VW5QwgY8S3ARm2OVTjam3i2IiD1+N2XN2ZOpY78Dg6yLSF1FBsaEY7/QfGJY/AuE5f
 7dGXOd/o80EAP+JeGVtvWPLq0V7bI5Re7+ALp/3OqjqJIbgDPAgciEemvPOXvdtfmt+7
 3LLT4XPVeM9UbtidwTQzyBEusTxTrddWxswP44+1l717WS/bp3r+J4r/7nmS22SYANU3
 VJ0K1MTmIE03z/3WYqA+b8Y+pIxigoZLnRFDTwUGkCCezoxMtaDH1RwCyJUCbAx2Ivj5
 MPmSBra+unacpWd3V20u0lV55tt+RJn+mK2Ja+keZxkO2DzIimnFzo8BWkVkC54cHr/3
 y9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OZQGoYGnoHs+9ApYZ7Z+Ccs9twmxhveiKgSrp4BfJLE=;
 b=oev2dtqo+xWf1gtO11ZxFTIL4MTnrwcajyFj4qzHFGS4M9kv3kmJq4FbhYWkI2r910
 ZbtUjilM3al+zvDJe0z4/x3Xsv9F9BYumYxm0GpB6Dom04ndPnUNz9rPKwRDcFEq6WOp
 IdABNaIQI6bVjV0md0PHo3D1YKYPuG6FC3/TA84iTnqFRQ3f9PBhC5sgSyQ4F+Nqzl1i
 VNEW3/Xo2Rrw9dZdeannTjjsFTyatbUtlLvUkxZnXx9j97MHPisyCTrRPAPEV8xIRXO8
 e7HzPy2x5JM4jcXMADoonTqssFBrpNNHgO0Xy1kQz/rY5oAt6U1ryJNGhyZVaZK9ms4i
 D5Bw==
X-Gm-Message-State: AOAM532jhhq5yX1Tk3uAkU5BIHxzexhsHpG1D1wbh3E99pXAgQzyTGxD
 mCsdNexTL/shb9Pogj2QpKA3vvt+AhKkog==
X-Google-Smtp-Source: ABdhPJy2TXTaf056zBPCxRa1SgWNX6EQTPXIT5lKAHimL06t/ZIdVFml/2imblFH+T5TNY4TESqiBQ==
X-Received: by 2002:a17:902:d211:b029:d7:cd5e:2857 with SMTP id
 t17-20020a170902d211b02900d7cd5e2857mr1660911ply.45.1605659900567; 
 Tue, 17 Nov 2020 16:38:20 -0800 (PST)
Received: from google.com (154.137.233.35.bc.googleusercontent.com.
 [35.233.137.154])
 by smtp.gmail.com with ESMTPSA id p4sm285186pjo.6.2020.11.17.16.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 16:38:19 -0800 (PST)
Date: Wed, 18 Nov 2020 00:38:15 +0000
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20201118003815.GA1155188@google.com>
References: <20201117140708.1068688-1-satyat@google.com>
 <20201117140708.1068688-2-satyat@google.com>
 <X7RdS2cINwFkl/MN@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X7RdS2cINwFkl/MN@sol.localdomain>
X-Spam-Score: -13.2 (-------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 2.4 FSL_HELO_FAKE          No description available.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.194 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kfCSJ-00BsL3-09
Subject: Re: [f2fs-dev] [PATCH v7 1/8] block: ensure bios are not split in
 middle of crypto data unit
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 "Theodore Y . Ts'o" <tytso@mit.edu>,
 "Darrick J . Wong" <darrick.wong@oracle.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 17, 2020 at 03:31:23PM -0800, Eric Biggers wrote:
> On Tue, Nov 17, 2020 at 02:07:01PM +0000, Satya Tangirala wrote:
> > Introduce blk_crypto_bio_sectors_alignment() that returns the required
> > alignment for the number of sectors in a bio. Any bio split must ensure
> > that the number of sectors in the resulting bios is aligned to that
> > returned value. This patch also updates __blk_queue_split(),
> > __blk_queue_bounce() and blk_crypto_split_bio_if_needed() to respect
> > blk_crypto_bio_sectors_alignment() when splitting bios.
> > 
> > Signed-off-by: Satya Tangirala <satyat@google.com>
> > ---
> >  block/bio.c                 |  1 +
> >  block/blk-crypto-fallback.c | 10 ++--
> >  block/blk-crypto-internal.h | 18 +++++++
> >  block/blk-merge.c           | 96 ++++++++++++++++++++++++++++++++-----
> >  block/blk-mq.c              |  3 ++
> >  block/bounce.c              |  4 ++
> >  6 files changed, 117 insertions(+), 15 deletions(-)
> > 
> 
> I feel like this should be split into multiple patches: one patch that
> introduces blk_crypto_bio_sectors_alignment(), and a patch for each place that
> needs to take blk_crypto_bio_sectors_alignment() into account.
> 
> It would also help to give a real-world example of why support for
> data_unit_size > logical_block_size is needed.  E.g. ext4 or f2fs encryption
> with a 4096-byte filesystem block size, using eMMC inline encryption hardware
> that has logical_block_size=512.
> 
> Also, is this needed even without the fscrypt direct I/O support?  If so, it
> should be sent out separately.
> 
Yes, I think it's needed even without the fscrypt direct I/O support.
And ok, I'll send it out separately then :)
> > diff --git a/block/blk-merge.c b/block/blk-merge.c
> > index bcf5e4580603..f34dda7132f9 100644
> > --- a/block/blk-merge.c
> > +++ b/block/blk-merge.c
> > @@ -149,13 +149,15 @@ static inline unsigned get_max_io_size(struct request_queue *q,
> >  	unsigned pbs = queue_physical_block_size(q) >> SECTOR_SHIFT;
> >  	unsigned lbs = queue_logical_block_size(q) >> SECTOR_SHIFT;
> >  	unsigned start_offset = bio->bi_iter.bi_sector & (pbs - 1);
> > +	unsigned int bio_sectors_alignment =
> > +					blk_crypto_bio_sectors_alignment(bio);
> >  
> >  	max_sectors += start_offset;
> >  	max_sectors &= ~(pbs - 1);
> > -	if (max_sectors > start_offset)
> > -		return max_sectors - start_offset;
> > +	if (max_sectors - start_offset >= bio_sectors_alignment)
> > +		return round_down(max_sectors - start_offset, bio_sectors_alignment);
> >  
> > -	return sectors & ~(lbs - 1);
> > +	return round_down(sectors & ~(lbs - 1), bio_sectors_alignment);
> >  }
> 
> 'max_sectors - start_offset >= bio_sectors_alignment' looks wrong, as
> 'max_sectors - start_offset' underflows if 'max_sectors < start_offset'.
> 
> Maybe consider something like the below?
> 
> static inline unsigned get_max_io_size(struct request_queue *q,
> 				       struct bio *bio)
> {
> 	unsigned sectors = blk_max_size_offset(q, bio->bi_iter.bi_sector);
> 	unsigned pbs = queue_physical_block_size(q) >> SECTOR_SHIFT;
> 	unsigned lbs = queue_logical_block_size(q) >> SECTOR_SHIFT;
> 	sector_t pb_aligned_sector =
> 		round_down(bio->bi_iter.bi_sector + sectors, pbs);
> 
> 	lbs = max(lbs, blk_crypto_bio_sectors_alignment(bio));
> 
> 	if (pb_aligned_sector >= bio->bi_iter.bi_sector + lbs)
> 		sectors = pb_aligned_sector - bio->bi_iter.bi_sector;
> 
> 	return round_down(sectors, lbs);
> }
> 
> Maybe it would be useful to have a helper function bio_required_alignment() that
> returns the crypto data unit size if the bio has an encryption context, and the
> logical block size if it doesn't?
>
> >  
> >  static inline unsigned get_max_segment_size(const struct request_queue *q,
> > @@ -174,6 +176,41 @@ static inline unsigned get_max_segment_size(const struct request_queue *q,
> >  			(unsigned long)queue_max_segment_size(q));
> >  }
> >  
> > +/**
> > + * update_aligned_sectors_and_segs() - Ensures that *@aligned_sectors is aligned
> > + *				       to @bio_sectors_alignment, and that
> > + *				       *@aligned_segs is the value of nsegs
> > + *				       when sectors reached/first exceeded that
> > + *				       value of *@aligned_sectors.
> > + *
> > + * @nsegs: [in] The current number of segs
> > + * @sectors: [in] The current number of sectors
> > + * @aligned_segs: [in,out] The number of segments that make up @aligned_sectors
> > + * @aligned_sectors: [in,out] The largest number of sectors <= @sectors that is
> > + *		     aligned to @sectors
> > + * @bio_sectors_alignment: [in] The alignment requirement for the number of
> > + *			  sectors
> > + *
> > + * Updates *@aligned_sectors to the largest number <= @sectors that is also a
> > + * multiple of @bio_sectors_alignment. This is done by updating *@aligned_sectors
> > + * whenever @sectors is at least @bio_sectors_alignment more than
> > + * *@aligned_sectors, since that means we can increment *@aligned_sectors while
> > + * still keeping it aligned to @bio_sectors_alignment and also keeping it <=
> > + * @sectors. *@aligned_segs is updated to the value of nsegs when @sectors first
> > + * reaches/exceeds any value that causes *@aligned_sectors to be updated.
> > + */
> > +static inline void update_aligned_sectors_and_segs(const unsigned int nsegs,
> > +						   const unsigned int sectors,
> > +						   unsigned int *aligned_segs,
> > +				unsigned int *aligned_sectors,
> > +				const unsigned int bio_sectors_alignment)
> > +{
> > +	if (sectors - *aligned_sectors < bio_sectors_alignment)
> > +		return;
> > +	*aligned_sectors = round_down(sectors, bio_sectors_alignment);
> > +	*aligned_segs = nsegs;
> > +}
> > +
> >  /**
> >   * bvec_split_segs - verify whether or not a bvec should be split in the middle
> >   * @q:        [in] request queue associated with the bio associated with @bv
> > @@ -195,9 +232,12 @@ static inline unsigned get_max_segment_size(const struct request_queue *q,
> >   * the block driver.
> >   */
> >  static bool bvec_split_segs(const struct request_queue *q,
> > -			    const struct bio_vec *bv, unsigned *nsegs,
> > -			    unsigned *sectors, unsigned max_segs,
> > -			    unsigned max_sectors)
> > +			    const struct bio_vec *bv, unsigned int *nsegs,
> > +			    unsigned int *sectors, unsigned int *aligned_segs,
> > +			    unsigned int *aligned_sectors,
> > +			    unsigned int bio_sectors_alignment,
> > +			    unsigned int max_segs,
> > +			    unsigned int max_sectors)
> >  {
> >  	unsigned max_len = (min(max_sectors, UINT_MAX >> 9) - *sectors) << 9;
> >  	unsigned len = min(bv->bv_len, max_len);
> > @@ -211,6 +251,11 @@ static bool bvec_split_segs(const struct request_queue *q,
> >  
> >  		(*nsegs)++;
> >  		total_len += seg_size;
> > +		update_aligned_sectors_and_segs(*nsegs,
> > +						*sectors + (total_len >> 9),
> > +						aligned_segs,
> > +						aligned_sectors,
> > +						bio_sectors_alignment);
> >  		len -= seg_size;
> >  
> >  		if ((bv->bv_offset + total_len) & queue_virt_boundary(q))
> > @@ -235,6 +280,8 @@ static bool bvec_split_segs(const struct request_queue *q,
> >   * following is guaranteed for the cloned bio:
> >   * - That it has at most get_max_io_size(@q, @bio) sectors.
> >   * - That it has at most queue_max_segments(@q) segments.
> > + * - That the number of sectors in the returned bio is aligned to
> > + *   blk_crypto_bio_sectors_alignment(@bio)
> >   *
> >   * Except for discard requests the cloned bio will point at the bi_io_vec of
> >   * the original bio. It is the responsibility of the caller to ensure that the
> > @@ -252,6 +299,9 @@ static struct bio *blk_bio_segment_split(struct request_queue *q,
> >  	unsigned nsegs = 0, sectors = 0;
> >  	const unsigned max_sectors = get_max_io_size(q, bio);
> >  	const unsigned max_segs = queue_max_segments(q);
> > +	const unsigned int bio_sectors_alignment =
> > +					blk_crypto_bio_sectors_alignment(bio);
> > +	unsigned int aligned_segs = 0, aligned_sectors = 0;
> >  
> >  	bio_for_each_bvec(bv, bio, iter) {
> >  		/*
> > @@ -266,8 +316,14 @@ static struct bio *blk_bio_segment_split(struct request_queue *q,
> >  		    bv.bv_offset + bv.bv_len <= PAGE_SIZE) {
> >  			nsegs++;
> >  			sectors += bv.bv_len >> 9;
> > -		} else if (bvec_split_segs(q, &bv, &nsegs, &sectors, max_segs,
> > -					 max_sectors)) {
> > +			update_aligned_sectors_and_segs(nsegs, sectors,
> > +							&aligned_segs,
> > +							&aligned_sectors,
> > +							bio_sectors_alignment);
> > +		} else if (bvec_split_segs(q, &bv, &nsegs, &sectors,
> > +					   &aligned_segs, &aligned_sectors,
> > +					   bio_sectors_alignment, max_segs,
> > +					   max_sectors)) {
> >  			goto split;
> >  		}
> >  
> > @@ -275,11 +331,24 @@ static struct bio *blk_bio_segment_split(struct request_queue *q,
> >  		bvprvp = &bvprv;
> >  	}
> >  
> > +	/*
> > +	 * The input bio's number of sectors is assumed to be aligned to
> > +	 * bio_sectors_alignment. If that's the case, then this function should
> > +	 * ensure that aligned_segs == nsegs and aligned_sectors == sectors if
> > +	 * the bio is not going to be split.
> > +	 */
> > +	WARN_ON(aligned_segs != nsegs || aligned_sectors != sectors);
> >  	*segs = nsegs;
> >  	return NULL;
> >  split:
> > -	*segs = nsegs;
> > -	return bio_split(bio, sectors, GFP_NOIO, bs);
> > +	*segs = aligned_segs;
> > +	if (WARN_ON(aligned_sectors == 0))
> > +		goto err;
> > +	return bio_split(bio, aligned_sectors, GFP_NOIO, bs);
> > +err:
> > +	bio->bi_status = BLK_STS_IOERR;
> > +	bio_endio(bio);
> > +	return bio;
> >  }
> 
> This part is pretty complex.  Are you sure it's needed?  How was alignment to
> logical_block_size ensured before?
> 
Afaict, alignment to logical_block_size (lbs) is done by assuming that
bv->bv_len is always lbs aligned (among other things). Is that not the
case?

If it is the case, that's what we're trying to avoid with this patch (we
want to be able to submit bios that have 2 bvecs that together make up a
single crypto data unit, for example). And this is complex because
multiple segments could "add up" to make up a single crypto data unit,
but this function's job is to limit both the number of segments *and*
the number of sectors - so when ensuring that the number of sectors is
aligned to crypto data unit size, we also want the smallest number of
segments that can make up that aligned number of sectors.
> > diff --git a/block/bounce.c b/block/bounce.c
> > index 162a6eee8999..b15224799008 100644
> > --- a/block/bounce.c
> > +++ b/block/bounce.c
> > @@ -295,6 +295,7 @@ static void __blk_queue_bounce(struct request_queue *q, struct bio **bio_orig,
> >  	bool bounce = false;
> >  	int sectors = 0;
> >  	bool passthrough = bio_is_passthrough(*bio_orig);
> > +	unsigned int bio_sectors_alignment;
> >  
> >  	bio_for_each_segment(from, *bio_orig, iter) {
> >  		if (i++ < BIO_MAX_PAGES)
> > @@ -305,6 +306,9 @@ static void __blk_queue_bounce(struct request_queue *q, struct bio **bio_orig,
> >  	if (!bounce)
> >  		return;
> >  
> > +	bio_sectors_alignment = blk_crypto_bio_sectors_alignment(bio);
> > +	sectors = round_down(sectors, bio_sectors_alignment);
> > +
> 
> This can be one line:
> 
> 	sectors = round_down(sectors, blk_crypto_bio_sectors_alignment(bio));
> 
Sure thing. I also messed up the argument being passed - it should've
been *bio_orig, not bio :(. Would you have any recommendations on how to
test code in bounce.c?
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
