Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5562B7272
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Nov 2020 00:31:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kfARy-0000en-21; Tue, 17 Nov 2020 23:31:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kfARx-0000eg-07
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 23:31:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nP61w0uhNG96v10PFBOUJ6ytLjaYNTnRzr1bdfq38dk=; b=MwJMeO9SngVxNf3Sn/mUq/KROp
 9pbRQC4JMFagwaALrLBXLHY8WewEYWYNe+owag7I8LHfZov30M6zKwbSWSr0fgqFqia9hO0cYxUzj
 fSb6bjhDFZua2n9BzAg2nu9G3V0uz1RGHwchswrzp71ydvAMrP41V/pTnOIYqIWbG/iY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nP61w0uhNG96v10PFBOUJ6ytLjaYNTnRzr1bdfq38dk=; b=Qj6vOJTtz3HLLmjYj2+HHqSuVK
 NQMm19N1mD7if4VgFbZEOB5EcF7pla/fNiC+lsD5Ens0D6JBLM47HBHTnDsysY2jIgR/KqlLaMgJq
 xEfRxAga4xXIIYlHy0e6lM/7cGnfyHr0YIuPW1AhkFCxlcwXFExIeNbyuxVeobjKGSD8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kfARs-001xfs-IM
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 23:31:48 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A98DF222E9;
 Tue, 17 Nov 2020 23:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605655894;
 bh=FUJIe+tYb6b4p8rYd+uv8J0w8N74SCpwrlgRhVa7pNk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MYOOAUI9L1eXqDkeV1RxSKp+K+I1rR6/H6uQISVBs4wuAePjqT8Xhac/CO++PrSA+
 6P1wWhwTERPrTRSOh1sLAsqXJuLyz99cfr6Xc9qowFB6msSTdCS/sGwO9bwYSeaXSh
 HG4+KvgLOatu+lo3gntPiatALwk7zwksyk6IYPwQ=
Date: Tue, 17 Nov 2020 15:31:23 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <X7RdS2cINwFkl/MN@sol.localdomain>
References: <20201117140708.1068688-1-satyat@google.com>
 <20201117140708.1068688-2-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117140708.1068688-2-satyat@google.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kfARs-001xfs-IM
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 "Theodore Y . Ts'o" <tytso@mit.edu>,
 "Darrick J . Wong" <darrick.wong@oracle.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 17, 2020 at 02:07:01PM +0000, Satya Tangirala wrote:
> Introduce blk_crypto_bio_sectors_alignment() that returns the required
> alignment for the number of sectors in a bio. Any bio split must ensure
> that the number of sectors in the resulting bios is aligned to that
> returned value. This patch also updates __blk_queue_split(),
> __blk_queue_bounce() and blk_crypto_split_bio_if_needed() to respect
> blk_crypto_bio_sectors_alignment() when splitting bios.
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>
> ---
>  block/bio.c                 |  1 +
>  block/blk-crypto-fallback.c | 10 ++--
>  block/blk-crypto-internal.h | 18 +++++++
>  block/blk-merge.c           | 96 ++++++++++++++++++++++++++++++++-----
>  block/blk-mq.c              |  3 ++
>  block/bounce.c              |  4 ++
>  6 files changed, 117 insertions(+), 15 deletions(-)
> 

I feel like this should be split into multiple patches: one patch that
introduces blk_crypto_bio_sectors_alignment(), and a patch for each place that
needs to take blk_crypto_bio_sectors_alignment() into account.

It would also help to give a real-world example of why support for
data_unit_size > logical_block_size is needed.  E.g. ext4 or f2fs encryption
with a 4096-byte filesystem block size, using eMMC inline encryption hardware
that has logical_block_size=512.

Also, is this needed even without the fscrypt direct I/O support?  If so, it
should be sent out separately.

> diff --git a/block/blk-merge.c b/block/blk-merge.c
> index bcf5e4580603..f34dda7132f9 100644
> --- a/block/blk-merge.c
> +++ b/block/blk-merge.c
> @@ -149,13 +149,15 @@ static inline unsigned get_max_io_size(struct request_queue *q,
>  	unsigned pbs = queue_physical_block_size(q) >> SECTOR_SHIFT;
>  	unsigned lbs = queue_logical_block_size(q) >> SECTOR_SHIFT;
>  	unsigned start_offset = bio->bi_iter.bi_sector & (pbs - 1);
> +	unsigned int bio_sectors_alignment =
> +					blk_crypto_bio_sectors_alignment(bio);
>  
>  	max_sectors += start_offset;
>  	max_sectors &= ~(pbs - 1);
> -	if (max_sectors > start_offset)
> -		return max_sectors - start_offset;
> +	if (max_sectors - start_offset >= bio_sectors_alignment)
> +		return round_down(max_sectors - start_offset, bio_sectors_alignment);
>  
> -	return sectors & ~(lbs - 1);
> +	return round_down(sectors & ~(lbs - 1), bio_sectors_alignment);
>  }

'max_sectors - start_offset >= bio_sectors_alignment' looks wrong, as
'max_sectors - start_offset' underflows if 'max_sectors < start_offset'.

Maybe consider something like the below?

static inline unsigned get_max_io_size(struct request_queue *q,
				       struct bio *bio)
{
	unsigned sectors = blk_max_size_offset(q, bio->bi_iter.bi_sector);
	unsigned pbs = queue_physical_block_size(q) >> SECTOR_SHIFT;
	unsigned lbs = queue_logical_block_size(q) >> SECTOR_SHIFT;
	sector_t pb_aligned_sector =
		round_down(bio->bi_iter.bi_sector + sectors, pbs);

	lbs = max(lbs, blk_crypto_bio_sectors_alignment(bio));

	if (pb_aligned_sector >= bio->bi_iter.bi_sector + lbs)
		sectors = pb_aligned_sector - bio->bi_iter.bi_sector;

	return round_down(sectors, lbs);
}

Maybe it would be useful to have a helper function bio_required_alignment() that
returns the crypto data unit size if the bio has an encryption context, and the
logical block size if it doesn't?

>  
>  static inline unsigned get_max_segment_size(const struct request_queue *q,
> @@ -174,6 +176,41 @@ static inline unsigned get_max_segment_size(const struct request_queue *q,
>  			(unsigned long)queue_max_segment_size(q));
>  }
>  
> +/**
> + * update_aligned_sectors_and_segs() - Ensures that *@aligned_sectors is aligned
> + *				       to @bio_sectors_alignment, and that
> + *				       *@aligned_segs is the value of nsegs
> + *				       when sectors reached/first exceeded that
> + *				       value of *@aligned_sectors.
> + *
> + * @nsegs: [in] The current number of segs
> + * @sectors: [in] The current number of sectors
> + * @aligned_segs: [in,out] The number of segments that make up @aligned_sectors
> + * @aligned_sectors: [in,out] The largest number of sectors <= @sectors that is
> + *		     aligned to @sectors
> + * @bio_sectors_alignment: [in] The alignment requirement for the number of
> + *			  sectors
> + *
> + * Updates *@aligned_sectors to the largest number <= @sectors that is also a
> + * multiple of @bio_sectors_alignment. This is done by updating *@aligned_sectors
> + * whenever @sectors is at least @bio_sectors_alignment more than
> + * *@aligned_sectors, since that means we can increment *@aligned_sectors while
> + * still keeping it aligned to @bio_sectors_alignment and also keeping it <=
> + * @sectors. *@aligned_segs is updated to the value of nsegs when @sectors first
> + * reaches/exceeds any value that causes *@aligned_sectors to be updated.
> + */
> +static inline void update_aligned_sectors_and_segs(const unsigned int nsegs,
> +						   const unsigned int sectors,
> +						   unsigned int *aligned_segs,
> +				unsigned int *aligned_sectors,
> +				const unsigned int bio_sectors_alignment)
> +{
> +	if (sectors - *aligned_sectors < bio_sectors_alignment)
> +		return;
> +	*aligned_sectors = round_down(sectors, bio_sectors_alignment);
> +	*aligned_segs = nsegs;
> +}
> +
>  /**
>   * bvec_split_segs - verify whether or not a bvec should be split in the middle
>   * @q:        [in] request queue associated with the bio associated with @bv
> @@ -195,9 +232,12 @@ static inline unsigned get_max_segment_size(const struct request_queue *q,
>   * the block driver.
>   */
>  static bool bvec_split_segs(const struct request_queue *q,
> -			    const struct bio_vec *bv, unsigned *nsegs,
> -			    unsigned *sectors, unsigned max_segs,
> -			    unsigned max_sectors)
> +			    const struct bio_vec *bv, unsigned int *nsegs,
> +			    unsigned int *sectors, unsigned int *aligned_segs,
> +			    unsigned int *aligned_sectors,
> +			    unsigned int bio_sectors_alignment,
> +			    unsigned int max_segs,
> +			    unsigned int max_sectors)
>  {
>  	unsigned max_len = (min(max_sectors, UINT_MAX >> 9) - *sectors) << 9;
>  	unsigned len = min(bv->bv_len, max_len);
> @@ -211,6 +251,11 @@ static bool bvec_split_segs(const struct request_queue *q,
>  
>  		(*nsegs)++;
>  		total_len += seg_size;
> +		update_aligned_sectors_and_segs(*nsegs,
> +						*sectors + (total_len >> 9),
> +						aligned_segs,
> +						aligned_sectors,
> +						bio_sectors_alignment);
>  		len -= seg_size;
>  
>  		if ((bv->bv_offset + total_len) & queue_virt_boundary(q))
> @@ -235,6 +280,8 @@ static bool bvec_split_segs(const struct request_queue *q,
>   * following is guaranteed for the cloned bio:
>   * - That it has at most get_max_io_size(@q, @bio) sectors.
>   * - That it has at most queue_max_segments(@q) segments.
> + * - That the number of sectors in the returned bio is aligned to
> + *   blk_crypto_bio_sectors_alignment(@bio)
>   *
>   * Except for discard requests the cloned bio will point at the bi_io_vec of
>   * the original bio. It is the responsibility of the caller to ensure that the
> @@ -252,6 +299,9 @@ static struct bio *blk_bio_segment_split(struct request_queue *q,
>  	unsigned nsegs = 0, sectors = 0;
>  	const unsigned max_sectors = get_max_io_size(q, bio);
>  	const unsigned max_segs = queue_max_segments(q);
> +	const unsigned int bio_sectors_alignment =
> +					blk_crypto_bio_sectors_alignment(bio);
> +	unsigned int aligned_segs = 0, aligned_sectors = 0;
>  
>  	bio_for_each_bvec(bv, bio, iter) {
>  		/*
> @@ -266,8 +316,14 @@ static struct bio *blk_bio_segment_split(struct request_queue *q,
>  		    bv.bv_offset + bv.bv_len <= PAGE_SIZE) {
>  			nsegs++;
>  			sectors += bv.bv_len >> 9;
> -		} else if (bvec_split_segs(q, &bv, &nsegs, &sectors, max_segs,
> -					 max_sectors)) {
> +			update_aligned_sectors_and_segs(nsegs, sectors,
> +							&aligned_segs,
> +							&aligned_sectors,
> +							bio_sectors_alignment);
> +		} else if (bvec_split_segs(q, &bv, &nsegs, &sectors,
> +					   &aligned_segs, &aligned_sectors,
> +					   bio_sectors_alignment, max_segs,
> +					   max_sectors)) {
>  			goto split;
>  		}
>  
> @@ -275,11 +331,24 @@ static struct bio *blk_bio_segment_split(struct request_queue *q,
>  		bvprvp = &bvprv;
>  	}
>  
> +	/*
> +	 * The input bio's number of sectors is assumed to be aligned to
> +	 * bio_sectors_alignment. If that's the case, then this function should
> +	 * ensure that aligned_segs == nsegs and aligned_sectors == sectors if
> +	 * the bio is not going to be split.
> +	 */
> +	WARN_ON(aligned_segs != nsegs || aligned_sectors != sectors);
>  	*segs = nsegs;
>  	return NULL;
>  split:
> -	*segs = nsegs;
> -	return bio_split(bio, sectors, GFP_NOIO, bs);
> +	*segs = aligned_segs;
> +	if (WARN_ON(aligned_sectors == 0))
> +		goto err;
> +	return bio_split(bio, aligned_sectors, GFP_NOIO, bs);
> +err:
> +	bio->bi_status = BLK_STS_IOERR;
> +	bio_endio(bio);
> +	return bio;
>  }

This part is pretty complex.  Are you sure it's needed?  How was alignment to
logical_block_size ensured before?

> diff --git a/block/bounce.c b/block/bounce.c
> index 162a6eee8999..b15224799008 100644
> --- a/block/bounce.c
> +++ b/block/bounce.c
> @@ -295,6 +295,7 @@ static void __blk_queue_bounce(struct request_queue *q, struct bio **bio_orig,
>  	bool bounce = false;
>  	int sectors = 0;
>  	bool passthrough = bio_is_passthrough(*bio_orig);
> +	unsigned int bio_sectors_alignment;
>  
>  	bio_for_each_segment(from, *bio_orig, iter) {
>  		if (i++ < BIO_MAX_PAGES)
> @@ -305,6 +306,9 @@ static void __blk_queue_bounce(struct request_queue *q, struct bio **bio_orig,
>  	if (!bounce)
>  		return;
>  
> +	bio_sectors_alignment = blk_crypto_bio_sectors_alignment(bio);
> +	sectors = round_down(sectors, bio_sectors_alignment);
> +

This can be one line:

	sectors = round_down(sectors, blk_crypto_bio_sectors_alignment(bio));

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
