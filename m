Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E124163942
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 02:23:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4E5K-0006Im-5N; Wed, 19 Feb 2020 01:23:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1j4E5I-0006IV-A0
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 01:23:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0OCDGUxgSA7hoWJyZWv21OvhYSGqKZfc6sOr998fez8=; b=e0+R9UJiOsWTpHRgYWr7Iqcgj3
 UiX+Ec3zQqofnsn06MGFzMK312bpcDW/LKTwOp7R9trS+NHIOx8zRGTNEtuztncWpU//PcAkifXTO
 QrhCh8iCE9U47b/u0m4xL20Qp9QmfoTq41Cy/t6GQAJWLVYHHDwumIcLSRrvEtwKYg4k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0OCDGUxgSA7hoWJyZWv21OvhYSGqKZfc6sOr998fez8=; b=R0xzTj5IAkpY/gvyrbunHK5f22
 dsyuoNUFy0o7PnLBolfmdLk9I79GbREEDSNQwUXaAoYoddUwtdosfgUPD04gJ1O5PF0rhh9YspWGv
 Xg2qfbcHN2iQ/ErYrQNLwAoraM6hlzdU4n43/YHzJ8yBOo+PR9+drBo1kss6qgDfaXjw=;
Received: from mail105.syd.optusnet.com.au ([211.29.132.249])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1j4E5G-00H6iC-AN
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 01:23:28 +0000
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
 [49.179.138.28])
 by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 36F4A3A325B;
 Wed, 19 Feb 2020 12:23:20 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1j4E58-0004eU-Jt; Wed, 19 Feb 2020 12:23:18 +1100
Date: Wed, 19 Feb 2020 12:23:18 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200219012318.GY10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-19-willy@infradead.org>
 <20200218065758.GQ10776@dread.disaster.area>
 <20200218211228.GF24185@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218211228.GF24185@bombadil.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=LYdCFQXi c=1 sm=1 tr=0
 a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
 a=JfrnYn6hAAAA:8 a=7-415B0cAAAA:8 a=14rPMwcjc7DfypWj1-kA:9
 a=AEfJ2Jny-4_AqVfN:21 a=ibXzlZxNEIkIBOHq:21 a=CjuIK1q_8ugA:10
 a=1CNFftbPRP8L7MoqJWF3:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fromorbit.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [211.29.132.249 listed in wl.mailspike.net]
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4E5G-00H6iC-AN
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

On Tue, Feb 18, 2020 at 01:12:28PM -0800, Matthew Wilcox wrote:
> On Tue, Feb 18, 2020 at 05:57:58PM +1100, Dave Chinner wrote:
> > On Mon, Feb 17, 2020 at 10:45:59AM -0800, Matthew Wilcox wrote:
> > > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
....
> > >  
> > > -		if (nr) {
> > > -			u64 contig_start = page_offset(pagepool[0]);
> > > +		ASSERT(contig_start + nr * PAGE_SIZE - 1 == contig_end);
> > 
> > Ok, yes it does. :)
> > 
> > I don't see how readahead_for_each_batch() guarantees that, though.
> 
> I ... don't see how it doesn't?  We start at rac->_start and iterate
> through the consecutive pages in the page cache.  readahead_for_each_batch()
> does assume that __do_page_cache_readahead() has its current behaviour
> of putting the pages in the page cache in order, and kicks off a new
> call to ->readahead() every time it has to skip an index for whatever
> reason (eg page already in page cache).

And there is the comment I was looking for while reading
readahead_for_each_batch() :)

> 
> > > -	if (bio)
> > > -		return submit_one_bio(bio, 0, bio_flags);
> > > -	return 0;
> > > +	if (bio) {
> > > +		if (submit_one_bio(bio, 0, bio_flags))
> > > +			return;
> > > +	}
> > >  }
> > 
> > Shouldn't that just be
> > 
> > 	if (bio)
> > 		submit_one_bio(bio, 0, bio_flags);
> 
> It should, but some overzealous person decided to mark submit_one_bio()
> as __must_check, so I have to work around that.

/me looks at code

Ngggh.

I rather dislike functions that are named in a way that look like
they belong to core kernel APIs but in reality are local static
functions.

I'd ask for this to be fixed if it was generic code, but it's btrfs
specific code so they can deal with the ugliness of their own
creation. :/

> > Confusing when put alongside rac->_batch_count counting the number
> > of pages in the batch, and "batch" being the index into the page
> > array, and they aren't the same counts....
> 
> Yes.  Renamed to 'i'.
> 
> > > +	XA_STATE(xas, &rac->mapping->i_pages, rac->_start);
> > > +	struct page *page;
> > > +
> > > +	rac->_batch_count = 0;
> > > +	xas_for_each(&xas, page, rac->_start + rac->_nr_pages - 1) {
> > 
> > That just iterates pages in the start,end doesn't it? What
> > guarantees that this fills the array with a contiguous page range?
> 
> The behaviour of __do_page_cache_readahead().  Dave Howells also has a
> usecase for xas_for_each_contig(), so I'm going to add that soon.
> 
> > > +		VM_BUG_ON_PAGE(!PageLocked(page), page);
> > > +		VM_BUG_ON_PAGE(PageTail(page), page);
> > > +		array[batch++] = page;
> > > +		rac->_batch_count += hpage_nr_pages(page);
> > > +		if (PageHead(page))
> > > +			xas_set(&xas, rac->_start + rac->_batch_count);
> > 
> > What on earth does this do? Comments please!
> 
> 		/*
> 		 * The page cache isn't using multi-index entries yet,
> 		 * so xas_for_each() won't do the right thing for
> 		 * large pages.  This can be removed once the page cache
> 		 * is converted.
> 		 */

Oh, it's changing the internal xarray lookup cursor position to
point at the correct next page index? Perhaps it's better to say
that instead of "won't do the right thing"?

> > > +#define readahead_for_each_batch(rac, array, size, nr)			\
> > > +	for (; (nr = readahead_page_batch(rac, array, size));		\
> > > +			readahead_next(rac))
> > 
> > I had to go look at the caller to work out what "size" refered to
> > here.
> > 
> > This is complex enough that it needs proper API documentation.
> 
> How about just:
> 
> -#define readahead_for_each_batch(rac, array, size, nr)                 \
> -       for (; (nr = readahead_page_batch(rac, array, size));           \
> +#define readahead_for_each_batch(rac, array, array_sz, nr)             \
> +       for (; (nr = readahead_page_batch(rac, array, array_sz));       \

Yup, that's fine - now the macro documents itself.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
