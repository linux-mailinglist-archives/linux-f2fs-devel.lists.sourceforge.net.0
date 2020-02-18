Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE99162139
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2020 07:58:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j3wpk-0001hi-9e; Tue, 18 Feb 2020 06:58:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1j3wpg-0001hF-00
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 06:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eLxUnbNyHIKRghA6UTv+GFISPACns0YMuiGBZdLsb30=; b=VzD6blMTcr9HD6k1s3JEYPeTK1
 ALfhMSKvMVZC4/f7GrUZFivJDAUPsuTo1BAqsiUUaNSyLHaTxIBqU393NeEnqiUqJMT28KFWgIK4I
 s2/CNguicN9PsG6idiYj4m0c1ptV3Gm4Lt88L5ZuTD/C31zaOlrAJtgb2d3sjseqJ8RI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eLxUnbNyHIKRghA6UTv+GFISPACns0YMuiGBZdLsb30=; b=JFJlh5YP29B1gv/AhD/61Y3yZK
 I8Tjonn8j0n51lnwQqJAMCEpojyJPfwU+Q+Z44m7QlR5k2Ifx01vWgm79hNxpZNK7Tch1gOlxxJIW
 eBHczFo49pzZAsOpV8OflE1Dhmld1oasNzQsdItD9KiEf+53h62An3RiI04YfjJsKa2E=;
Received: from mail105.syd.optusnet.com.au ([211.29.132.249])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1j3wpe-00GEKr-7i
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 06:58:11 +0000
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
 [49.179.138.28])
 by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 7C5BF3A2771;
 Tue, 18 Feb 2020 17:57:59 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1j3wpS-0006Wf-5F; Tue, 18 Feb 2020 17:57:58 +1100
Date: Tue, 18 Feb 2020 17:57:58 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200218065758.GQ10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-19-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217184613.19668-19-willy@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=W5xGqiek c=1 sm=1 tr=0
 a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
 a=JfrnYn6hAAAA:8 a=7-415B0cAAAA:8 a=cHVu4ezWpKoVtZSsmu8A:9
 a=a6t_wt_lAo5S5IOh:21 a=CcahuoPPjRgWG3dV:21 a=CjuIK1q_8ugA:10
 a=1CNFftbPRP8L7MoqJWF3:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j3wpe-00GEKr-7i
Subject: Re: [f2fs-dev] [PATCH v6 11/19] btrfs: Convert from readpages to
 readahead
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
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Feb 17, 2020 at 10:45:59AM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> Use the new readahead operation in btrfs.  Add a
> readahead_for_each_batch() iterator to optimise the loop in the XArray.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  fs/btrfs/extent_io.c    | 46 +++++++++++++----------------------------
>  fs/btrfs/extent_io.h    |  3 +--
>  fs/btrfs/inode.c        | 16 +++++++-------
>  include/linux/pagemap.h | 27 ++++++++++++++++++++++++
>  4 files changed, 49 insertions(+), 43 deletions(-)
> 
> diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
> index c0f202741e09..e97a6acd6f5d 100644
> --- a/fs/btrfs/extent_io.c
> +++ b/fs/btrfs/extent_io.c
> @@ -4278,52 +4278,34 @@ int extent_writepages(struct address_space *mapping,
>  	return ret;
>  }
>  
> -int extent_readpages(struct address_space *mapping, struct list_head *pages,
> -		     unsigned nr_pages)
> +void extent_readahead(struct readahead_control *rac)
>  {
>  	struct bio *bio = NULL;
>  	unsigned long bio_flags = 0;
>  	struct page *pagepool[16];
>  	struct extent_map *em_cached = NULL;
> -	struct extent_io_tree *tree = &BTRFS_I(mapping->host)->io_tree;
> -	int nr = 0;
> +	struct extent_io_tree *tree = &BTRFS_I(rac->mapping->host)->io_tree;
>  	u64 prev_em_start = (u64)-1;
> +	int nr;
>  
> -	while (!list_empty(pages)) {
> -		u64 contig_end = 0;
> -
> -		for (nr = 0; nr < ARRAY_SIZE(pagepool) && !list_empty(pages);) {
> -			struct page *page = lru_to_page(pages);
> -
> -			prefetchw(&page->flags);
> -			list_del(&page->lru);
> -			if (add_to_page_cache_lru(page, mapping, page->index,
> -						readahead_gfp_mask(mapping))) {
> -				put_page(page);
> -				break;
> -			}
> -
> -			pagepool[nr++] = page;
> -			contig_end = page_offset(page) + PAGE_SIZE - 1;
> -		}
> +	readahead_for_each_batch(rac, pagepool, ARRAY_SIZE(pagepool), nr) {
> +		u64 contig_start = page_offset(pagepool[0]);
> +		u64 contig_end = page_offset(pagepool[nr - 1]) + PAGE_SIZE - 1;

So this assumes a contiguous page range is returned, right?

>  
> -		if (nr) {
> -			u64 contig_start = page_offset(pagepool[0]);
> +		ASSERT(contig_start + nr * PAGE_SIZE - 1 == contig_end);

Ok, yes it does. :)

I don't see how readahead_for_each_batch() guarantees that, though.

>  
> -			ASSERT(contig_start + nr * PAGE_SIZE - 1 == contig_end);
> -
> -			contiguous_readpages(tree, pagepool, nr, contig_start,
> -				     contig_end, &em_cached, &bio, &bio_flags,
> -				     &prev_em_start);
> -		}
> +		contiguous_readpages(tree, pagepool, nr, contig_start,
> +				contig_end, &em_cached, &bio, &bio_flags,
> +				&prev_em_start);
>  	}
>  
>  	if (em_cached)
>  		free_extent_map(em_cached);
>  
> -	if (bio)
> -		return submit_one_bio(bio, 0, bio_flags);
> -	return 0;
> +	if (bio) {
> +		if (submit_one_bio(bio, 0, bio_flags))
> +			return;
> +	}
>  }

Shouldn't that just be

	if (bio)
		submit_one_bio(bio, 0, bio_flags);

> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index 4f36c06d064d..1bbb60a0bf16 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -669,6 +669,33 @@ static inline void readahead_next(struct readahead_control *rac)
>  #define readahead_for_each(rac, page)					\
>  	for (; (page = readahead_page(rac)); readahead_next(rac))
>  
> +static inline unsigned int readahead_page_batch(struct readahead_control *rac,
> +		struct page **array, unsigned int size)
> +{
> +	unsigned int batch = 0;

Confusing when put alongside rac->_batch_count counting the number
of pages in the batch, and "batch" being the index into the page
array, and they aren't the same counts....

> +	XA_STATE(xas, &rac->mapping->i_pages, rac->_start);
> +	struct page *page;
> +
> +	rac->_batch_count = 0;
> +	xas_for_each(&xas, page, rac->_start + rac->_nr_pages - 1) {

That just iterates pages in the start,end doesn't it? What
guarantees that this fills the array with a contiguous page range?

> +		VM_BUG_ON_PAGE(!PageLocked(page), page);
> +		VM_BUG_ON_PAGE(PageTail(page), page);
> +		array[batch++] = page;
> +		rac->_batch_count += hpage_nr_pages(page);
> +		if (PageHead(page))
> +			xas_set(&xas, rac->_start + rac->_batch_count);

What on earth does this do? Comments please!

> +
> +		if (batch == size)
> +			break;
> +	}
> +
> +	return batch;
> +}

Seems a bit big for an inline function.

> +
> +#define readahead_for_each_batch(rac, array, size, nr)			\
> +	for (; (nr = readahead_page_batch(rac, array, size));		\
> +			readahead_next(rac))

I had to go look at the caller to work out what "size" refered to
here.

This is complex enough that it needs proper API documentation.

Cheers,

Dave.

-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
