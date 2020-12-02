Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F152CC9FD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Dec 2020 23:54:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ifAoiQ+MQK+O+dDqFXUj5al4sb3NlCx3dmX0FkDXa6I=; b=jjec8NfwCBrpB65l8TkJg3ylE
	5UncqRhvp/vCrlDPgKxdeoGIGzjXCQ4MCkMW5Rn9Q7JKIHnDscTCiJ7MDrzBCFQjwz4JZG5EEcTwy
	JBGod4Kx8NuxugJE7Y3encIFQP488okNGU0krbbhVc4vGssEblgQ0ziF99ORD+TcJpZC4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkb1K-0008Sl-J4; Wed, 02 Dec 2020 22:54:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1kkazq-0008PN-6Q
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Dec 2020 22:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w13vKkQO9QCP0aR5R9Nv4FOw9sZU+DjLBFqmX3t26s8=; b=H+5LbHx0pn2Q31HJmEdDN/iPvQ
 7djCQRFkc5DY6o0azdQpcq7qFs12UQ91oyQRw8pNmyZhn388OQtolXk+w1sbgIplHXmYvUEFoyVmr
 1yR/niCzBBNeHbRWXZVDhNE35N7vtDkFTZ150NQzBcQAibPumlVren8ykTPUoWgDLVKw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w13vKkQO9QCP0aR5R9Nv4FOw9sZU+DjLBFqmX3t26s8=; b=YRW2ORbUCd7knYZBU/0ixNv3tF
 SFV/iSqDSbkf3d02cYqUqe4FhFNXA0+biV1bxMBO5cwry77nGC32LNMnyZGaaICflMDGml0RWb6wt
 xD7UinbyDebbokymWks31ydUssz90z2+PIKe0QiOIDNysHop1HRPuRurFUqEIiPxO24I=;
Received: from mail-pl1-f196.google.com ([209.85.214.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kkazl-00CCKI-28
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Dec 2020 22:53:14 +0000
Received: by mail-pl1-f196.google.com with SMTP id j1so50948pld.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 02 Dec 2020 14:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=w13vKkQO9QCP0aR5R9Nv4FOw9sZU+DjLBFqmX3t26s8=;
 b=rxIMvrsLz416YTkoh8oP0XwIZGWM+lG9YJHHqWJFZPAJfdeUMvP8RjKlfZq98Rtmoj
 51XR5TMkAuVUmfbpRWeUYX2kReToKwMJxeCDaQAD4wb5BBQ0YDsOsp2MZViotWu9SI0X
 WYaing/GdzvYBEdsc7YEhc1/eVjqn58Lq2HNaKlwDFLykzFGKRaBJifz1RKFCWORX67N
 QqpxoNgr1sMlhz0EOwRyFVFgilPv7b58VK8xZ9L1w6ZREg/iO+rECdVjZ+SPYpk3mtv5
 n5AWnXd9VZw9D/DC4Ps2r8qIYENdVpJpYlEEmCS8ymJK3QZlqa5Q0FD0/c2TZbobCLnq
 GdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w13vKkQO9QCP0aR5R9Nv4FOw9sZU+DjLBFqmX3t26s8=;
 b=SDMHRFkykaxZQdLpGMW9D5mjJ2iEZMPC8Yk2LvR2ihd1qUka5VNwuO86PuSawAgsTo
 3/M+pN+vHJ56LdgJo1zQb9VoQdIXkwRmKDtwBM0oeHP/du1dUG4YDHV7swCVBXyRTxIV
 +Q48M+gapahj0pUxSm8lhKHWdx5+ZgYWRZ2oVabRwQbBhI/8LLU7kr4vI83hLcCsT1Rg
 /CqPupD19hkaPZytTR/YZz4b4Jh1KiJa36cs3XiRe9mLk7jEQ9KhM7d72w7FxjKPwX8r
 Mkqxvb12eVlCjMLN6UFQLurAR/lQ92MjVGWT4lwrmzUOiNSVWbUtcnWO6HNR59YF4kec
 JoOA==
X-Gm-Message-State: AOAM530o0gVFPI+CyH8HMKMxYcAMcnJzQgtk8ciPfbTd6+n/CB5BDJBX
 L8fcEm+8NE0FZR2pTV53d9yN/g==
X-Google-Smtp-Source: ABdhPJxMYQCCb1zJfnzSpLJeB756gwkPBF5cUE4tVCqByyJoHNiQ65qHwLsKgJXa31l+PERlBN+Reg==
X-Received: by 2002:a17:902:9307:b029:d9:d097:fd6c with SMTP id
 bc7-20020a1709029307b02900d9d097fd6cmr302473plb.10.1606949576165; 
 Wed, 02 Dec 2020 14:52:56 -0800 (PST)
Received: from google.com (154.137.233.35.bc.googleusercontent.com.
 [35.233.137.154])
 by smtp.gmail.com with ESMTPSA id z22sm119458pfn.153.2020.12.02.14.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 14:52:55 -0800 (PST)
Date: Wed, 2 Dec 2020 22:52:51 +0000
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <X8gaw4ouQQFd9unN@google.com>
References: <20201117140708.1068688-1-satyat@google.com>
 <20201117140708.1068688-2-satyat@google.com>
 <X7RdS2cINwFkl/MN@sol.localdomain>
 <20201118003815.GA1155188@google.com>
 <X77W05O8Pl8t0gPi@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X77W05O8Pl8t0gPi@sol.localdomain>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FSL_HELO_FAKE          No description available.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.196 listed in wl.mailspike.net]
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
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kkazl-00CCKI-28
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

On Wed, Nov 25, 2020 at 02:12:35PM -0800, Eric Biggers wrote:
> On Wed, Nov 18, 2020 at 12:38:15AM +0000, Satya Tangirala wrote:
> > > > +/**
> > > > + * update_aligned_sectors_and_segs() - Ensures that *@aligned_sectors is aligned
> > > > + *				       to @bio_sectors_alignment, and that
> > > > + *				       *@aligned_segs is the value of nsegs
> > > > + *				       when sectors reached/first exceeded that
> > > > + *				       value of *@aligned_sectors.
> > > > + *
> > > > + * @nsegs: [in] The current number of segs
> > > > + * @sectors: [in] The current number of sectors
> > > > + * @aligned_segs: [in,out] The number of segments that make up @aligned_sectors
> > > > + * @aligned_sectors: [in,out] The largest number of sectors <= @sectors that is
> > > > + *		     aligned to @sectors
> > > > + * @bio_sectors_alignment: [in] The alignment requirement for the number of
> > > > + *			  sectors
> > > > + *
> > > > + * Updates *@aligned_sectors to the largest number <= @sectors that is also a
> > > > + * multiple of @bio_sectors_alignment. This is done by updating *@aligned_sectors
> > > > + * whenever @sectors is at least @bio_sectors_alignment more than
> > > > + * *@aligned_sectors, since that means we can increment *@aligned_sectors while
> > > > + * still keeping it aligned to @bio_sectors_alignment and also keeping it <=
> > > > + * @sectors. *@aligned_segs is updated to the value of nsegs when @sectors first
> > > > + * reaches/exceeds any value that causes *@aligned_sectors to be updated.
> > > > + */
> > > > +static inline void update_aligned_sectors_and_segs(const unsigned int nsegs,
> > > > +						   const unsigned int sectors,
> > > > +						   unsigned int *aligned_segs,
> > > > +				unsigned int *aligned_sectors,
> > > > +				const unsigned int bio_sectors_alignment)
> > > > +{
> > > > +	if (sectors - *aligned_sectors < bio_sectors_alignment)
> > > > +		return;
> > > > +	*aligned_sectors = round_down(sectors, bio_sectors_alignment);
> > > > +	*aligned_segs = nsegs;
> > > > +}
> > > > +
> > > >  /**
> > > >   * bvec_split_segs - verify whether or not a bvec should be split in the middle
> > > >   * @q:        [in] request queue associated with the bio associated with @bv
> > > > @@ -195,9 +232,12 @@ static inline unsigned get_max_segment_size(const struct request_queue *q,
> > > >   * the block driver.
> > > >   */
> > > >  static bool bvec_split_segs(const struct request_queue *q,
> > > > -			    const struct bio_vec *bv, unsigned *nsegs,
> > > > -			    unsigned *sectors, unsigned max_segs,
> > > > -			    unsigned max_sectors)
> > > > +			    const struct bio_vec *bv, unsigned int *nsegs,
> > > > +			    unsigned int *sectors, unsigned int *aligned_segs,
> > > > +			    unsigned int *aligned_sectors,
> > > > +			    unsigned int bio_sectors_alignment,
> > > > +			    unsigned int max_segs,
> > > > +			    unsigned int max_sectors)
> > > >  {
> > > >  	unsigned max_len = (min(max_sectors, UINT_MAX >> 9) - *sectors) << 9;
> > > >  	unsigned len = min(bv->bv_len, max_len);
> > > > @@ -211,6 +251,11 @@ static bool bvec_split_segs(const struct request_queue *q,
> > > >  
> > > >  		(*nsegs)++;
> > > >  		total_len += seg_size;
> > > > +		update_aligned_sectors_and_segs(*nsegs,
> > > > +						*sectors + (total_len >> 9),
> > > > +						aligned_segs,
> > > > +						aligned_sectors,
> > > > +						bio_sectors_alignment);
> > > >  		len -= seg_size;
> > > >  
> > > >  		if ((bv->bv_offset + total_len) & queue_virt_boundary(q))
> > > > @@ -235,6 +280,8 @@ static bool bvec_split_segs(const struct request_queue *q,
> > > >   * following is guaranteed for the cloned bio:
> > > >   * - That it has at most get_max_io_size(@q, @bio) sectors.
> > > >   * - That it has at most queue_max_segments(@q) segments.
> > > > + * - That the number of sectors in the returned bio is aligned to
> > > > + *   blk_crypto_bio_sectors_alignment(@bio)
> > > >   *
> > > >   * Except for discard requests the cloned bio will point at the bi_io_vec of
> > > >   * the original bio. It is the responsibility of the caller to ensure that the
> > > > @@ -252,6 +299,9 @@ static struct bio *blk_bio_segment_split(struct request_queue *q,
> > > >  	unsigned nsegs = 0, sectors = 0;
> > > >  	const unsigned max_sectors = get_max_io_size(q, bio);
> > > >  	const unsigned max_segs = queue_max_segments(q);
> > > > +	const unsigned int bio_sectors_alignment =
> > > > +					blk_crypto_bio_sectors_alignment(bio);
> > > > +	unsigned int aligned_segs = 0, aligned_sectors = 0;
> > > >  
> > > >  	bio_for_each_bvec(bv, bio, iter) {
> > > >  		/*
> > > > @@ -266,8 +316,14 @@ static struct bio *blk_bio_segment_split(struct request_queue *q,
> > > >  		    bv.bv_offset + bv.bv_len <= PAGE_SIZE) {
> > > >  			nsegs++;
> > > >  			sectors += bv.bv_len >> 9;
> > > > -		} else if (bvec_split_segs(q, &bv, &nsegs, &sectors, max_segs,
> > > > -					 max_sectors)) {
> > > > +			update_aligned_sectors_and_segs(nsegs, sectors,
> > > > +							&aligned_segs,
> > > > +							&aligned_sectors,
> > > > +							bio_sectors_alignment);
> > > > +		} else if (bvec_split_segs(q, &bv, &nsegs, &sectors,
> > > > +					   &aligned_segs, &aligned_sectors,
> > > > +					   bio_sectors_alignment, max_segs,
> > > > +					   max_sectors)) {
> > > >  			goto split;
> > > >  		}
> > > >  
> > > > @@ -275,11 +331,24 @@ static struct bio *blk_bio_segment_split(struct request_queue *q,
> > > >  		bvprvp = &bvprv;
> > > >  	}
> > > >  
> > > > +	/*
> > > > +	 * The input bio's number of sectors is assumed to be aligned to
> > > > +	 * bio_sectors_alignment. If that's the case, then this function should
> > > > +	 * ensure that aligned_segs == nsegs and aligned_sectors == sectors if
> > > > +	 * the bio is not going to be split.
> > > > +	 */
> > > > +	WARN_ON(aligned_segs != nsegs || aligned_sectors != sectors);
> > > >  	*segs = nsegs;
> > > >  	return NULL;
> > > >  split:
> > > > -	*segs = nsegs;
> > > > -	return bio_split(bio, sectors, GFP_NOIO, bs);
> > > > +	*segs = aligned_segs;
> > > > +	if (WARN_ON(aligned_sectors == 0))
> > > > +		goto err;
> > > > +	return bio_split(bio, aligned_sectors, GFP_NOIO, bs);
> > > > +err:
> > > > +	bio->bi_status = BLK_STS_IOERR;
> > > > +	bio_endio(bio);
> > > > +	return bio;
> > > >  }
> > > 
> > > This part is pretty complex.  Are you sure it's needed?  How was alignment to
> > > logical_block_size ensured before?
> > > 
> > Afaict, alignment to logical_block_size (lbs) is done by assuming that
> > bv->bv_len is always lbs aligned (among other things). Is that not the
> > case?
> 
> I believe that's the case; bvecs are logical_block_size aligned.
> 
> So the new thing (with data_unit_size > logical_block_size) is that
> bvec boundaries aren't necessarily valid split points anymore.
> 
> > 
> > If it is the case, that's what we're trying to avoid with this patch (we
> > want to be able to submit bios that have 2 bvecs that together make up a
> > single crypto data unit, for example). And this is complex because
> > multiple segments could "add up" to make up a single crypto data unit,
> > but this function's job is to limit both the number of segments *and*
> > the number of sectors - so when ensuring that the number of sectors is
> > aligned to crypto data unit size, we also want the smallest number of
> > segments that can make up that aligned number of sectors.
> 
> Does the number of physical segments that is calculated have to be exact, or
> could it be a slight overestimate?  If the purpose of the calculation is just to
> size scatterlists and to avoid exceeding the hardware limit on the number of
> physical segments (and at a quick glance that seems to be the purpose, though I
> didn't look at everything), it seems that a slight overestimate would be okay.
> 
> If so, couldn't the number of sectors could simply be rounded down to
> blk_crypto_bio_sectors_alignment(bio) when blk_bio_segment_split() actually
> calls bio_split()?  That would be much simpler; why doesn't that work?
> 
I was assuming we'd prefer the better bound, but yeah it would be much
simpler if an overestimate was alright.

I'll look through the users of that estimate to try to gauge better
whether overestimating is ok to do (although if someone can already
authoritatively say that it's ok/not ok to overestimate, that would be
awesome too :)).
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
