Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACE616367D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2020 23:52:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4BjT-0001Be-SP; Tue, 18 Feb 2020 22:52:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j4BjT-0001BU-7E
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 22:52:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bnOD/kBvTil/QNFSgjm+GLp6zzWRAz3n6ij6d1hLGNY=; b=FlhWdv1ilMG6iYwQOM2XBmt3af
 aLOIltKoYBkvXMyUUD35DqOO9aZhTbgq7gr/1/zTpGmSUyq3SJQyqi/xFycT3g2AuzC+nvHp4qmLH
 b5T53hKkbNkMvgneL5zs/BF0fd+t6WV+3fH++23Gu5d0Gd19xVc2iBQXpfWp8B/hiAlA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bnOD/kBvTil/QNFSgjm+GLp6zzWRAz3n6ij6d1hLGNY=; b=MBIelPf4sNGGF5P9jfNviJ2eXT
 uBpDNSVsNRimFSXxobNuWxH2w0XvQArPlrkXHtaqIXUJyQppQMLvNiN9Md6dFxi4TqjOIYT2UunzX
 uQbHZOXhz3nlYuAOVoUFoyzH7kYcN9Qk1CZq1qsqWt54IrrgZ39/9AamNDiGCTTh7uUM=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4BjR-007Q4Y-Lx
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 22:52:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=bnOD/kBvTil/QNFSgjm+GLp6zzWRAz3n6ij6d1hLGNY=; b=XSgImk4I4CPrF8cILzjHDscRop
 CKntSzDwT1ij4BALLtjNwmBKi3i+1IfSXkAQaoPfXtf07eWDDoH7YFsWdXgnyLOpzGMqaqq2CRFub
 BZHy/x7PNm6BUzKjUiVDBLzmlxGBQpmjsP1NCuIzQrq8LqeZQW+ZRvlEfOloZaYFkmTHi+0rwO9Zv
 Ddu6JQ1JidbbVmRq+Q5xXd42Gwb0b3Po5UprxnNSbBfzob2/ZnHN+sTLNiMTHuCydAiddiVUs3MxX
 OG1nnPjL5NZvf9Cd8Z/nKdIJ16rUosUsXRSn5/mrWjW4457q5JqxRPamjp6r4bhX8SSwQUCeBucUW
 P3njQkwQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4BjH-0004Ih-9n; Tue, 18 Feb 2020 22:52:35 +0000
Date: Tue, 18 Feb 2020 14:52:35 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200218225235.GH24185@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-4-willy@infradead.org>
 <20200218050300.GI10776@dread.disaster.area>
 <20200218135618.GO7778@bombadil.infradead.org>
 <20200218224610.GT10776@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218224610.GT10776@dread.disaster.area>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4BjR-007Q4Y-Lx
Subject: Re: [f2fs-dev] [PATCH v6 03/19] mm: Use readahead_control to pass
 arguments
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
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Feb 19, 2020 at 09:46:10AM +1100, Dave Chinner wrote:
> On Tue, Feb 18, 2020 at 05:56:18AM -0800, Matthew Wilcox wrote:
> > On Tue, Feb 18, 2020 at 04:03:00PM +1100, Dave Chinner wrote:
> > > On Mon, Feb 17, 2020 at 10:45:44AM -0800, Matthew Wilcox wrote:
> > > > +static void read_pages(struct readahead_control *rac, struct list_head *pages,
> > > > +		gfp_t gfp)
> > > >  {
> > > > +	const struct address_space_operations *aops = rac->mapping->a_ops;
> > > >  	struct blk_plug plug;
> > > >  	unsigned page_idx;
> > > 
> > > Splitting out the aops rather than the mapping here just looks
> > > weird, especially as you need the mapping later in the function.
> > > Using aops doesn't even reduce the code side....
> > 
> > It does in subsequent patches ... I agree it looks a little weird here,
> > but I think in the final form, it makes sense:
> 
> Ok. Perhaps just an additional commit comment to say "read_pages() is
> changed to be aops centric as @rac abstracts away all other
> implementation details by the end of the patchset."

ACK, will add.

> > > > +			if (readahead_count(&rac))
> > > > +				read_pages(&rac, &page_pool, gfp_mask);
> > > > +			rac._nr_pages = 0;
> > > 
> > > Hmmm. Wondering ig it make sense to move the gfp_mask to the readahead
> > > control structure - if we have to pass the gfp_mask down all the
> > > way along side the rac, then I think it makes sense to do that...
> > 
> > So we end up removing it later on in this series, but I do wonder if
> > it would make sense anyway.  By the end of the series, we still have
> > this in iomap:
> > 
> >                 if (ctx->rac) /* same as readahead_gfp_mask */
> >                         gfp |= __GFP_NORETRY | __GFP_NOWARN;
> > 
> > and we could get rid of that by passing gfp flags down in the rac.  On the
> > other hand, I don't know why it doesn't just use readahead_gfp_mask()
> > here anyway ... Christoph?
> 
> mapping->gfp_mask is awful. Is it a mask, or is it a valid set of
> allocation flags? Or both?  Some callers to mapping_gfp_constraint()
> uses it as a mask, some callers to mapping_gfp_constraint() use it
> as base flags that context specific flags get masked out of,
> readahead_gfp_mask() callers use it as the entire set of gfp flags
> for allocation.
> 
> That whole API sucks - undocumented as to what it's suposed to do
> and how it's supposed to be used. Hence it's difficult to use
> correctly or understand whether it's being used correctly. And
> reading callers only leads to more confusion and crazy code like in
> do_mpage_readpage() where readahead returns a mask that are used as
> base flags and normal reads return a masked set of base flags...
> 
> The iomap code is obviously correct when it comes to gfp flag
> manipulation. We start with GFP_KERNEL context, then constrain it
> via the mask held in mapping->gfp_mask, then if it's readahead we
> allow the allocation to silently fail.
> 
> Simple to read and understand code, versus having weird code that
> requires the reader to decipher an undocumented and inconsistent API
> to understand how the gfp flags have been calculated and are valid.

I think a lot of this is not so much a criticism of mapping->gfp_mask
as a criticism of the whole GFP flags concept.  Some of the flags make
allocations more likely to succeed, others make them more likely to
fail.  Some of them allow the allocator to do more things; some prevent
the allocator from doing things it would otherwise do.  Some of them
aren't flags at all.  Some of them are mutually incompatible (and will
be warned about if set in combination), some of them will silently win
over other flags.

I think they made a certain amount of clunky sense when they were added,
but they've grown to a point where they don't make sense any more and
partly that's because there's nobody standing over the allocator with
a flaming sword promising certain death to anyone who adds a new flag
without thoroughly documenting its interactions with every other flag.

I am no longer a fan of GFP flags ;-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
