Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F66316347E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2020 22:12:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4AAg-0004Lb-37; Tue, 18 Feb 2020 21:12:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j4AAe-0004LU-NB
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 21:12:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C6+FIzbRd5o0hW1kRRKUBom8n/N7TIIIJ10n6Bm+gNU=; b=Q53i4V4kl8Hcz1B+eRQnBj30hv
 vkEpEPe7dXDViKKPw7E6yuLxHG16A1lfR33QqyHqAYbB1ZslaNQfzbpIwJbz9GCgsgJqQc7+/rg4/
 gxDVx/pAFf40Ge58t/PZrjZGCwHo4HhLOPyI6qIhyrG43TcdPOHX56hHL0cNOA6HDWHI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C6+FIzbRd5o0hW1kRRKUBom8n/N7TIIIJ10n6Bm+gNU=; b=FIQvatGPPbozdoaeluthNh1RwA
 ViFeCJ5f/7y6NyiQZLHkgjnXUSzCAz8isnj8Ify9XnCkBRp2d/8EXh5F6B5e6DAED60pz9FPXrIZ8
 ENzi7qXjLuQSPVIDSVdFeAH+8bPq4OIstaQ3aZE5c3L7j61nwOIE8FGNUISDjwGm50M4=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4AAc-007hTe-UK
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 21:12:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=C6+FIzbRd5o0hW1kRRKUBom8n/N7TIIIJ10n6Bm+gNU=; b=SdZgWPmlYVT0XMUjMwdirbyYq5
 z/MvgHdWZUONYcHl0TnpfiGDmf095oomwV/N/RH6GifFj/rwydwe+kq6f2tbOAtJRElqxHz5Dgnh+
 EW7uBjnC3wOpboaXgsOCVQRD30ui8pjcMOhoklr/TvrXbI8o6CiPf6ruIhRLe6FKvhd2qrDgFPK1I
 KmNAWjN7hvSGK0O5AQs3X+tXrG9yBpfQMM6X25JmPmgGOzUnAROE3QwvicPpE9MgRzP8MlaGrDSXQ
 mBWD91boJiYlTGiZfTXKX3BebkqowPF+MM0ZAndsu5z1koT2azK+W51G0UZDdJcX2CL0ZNSIzEO5Y
 20S6gvOQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4AAO-0006yP-HR; Tue, 18 Feb 2020 21:12:28 +0000
Date: Tue, 18 Feb 2020 13:12:28 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200218211228.GF24185@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-19-willy@infradead.org>
 <20200218065758.GQ10776@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218065758.GQ10776@dread.disaster.area>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4AAc-007hTe-UK
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

On Tue, Feb 18, 2020 at 05:57:58PM +1100, Dave Chinner wrote:
> On Mon, Feb 17, 2020 at 10:45:59AM -0800, Matthew Wilcox wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > 
> > Use the new readahead operation in btrfs.  Add a
> > readahead_for_each_batch() iterator to optimise the loop in the XArray.
> > 
> > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > ---
> >  fs/btrfs/extent_io.c    | 46 +++++++++++++----------------------------
> >  fs/btrfs/extent_io.h    |  3 +--
> >  fs/btrfs/inode.c        | 16 +++++++-------
> >  include/linux/pagemap.h | 27 ++++++++++++++++++++++++
> >  4 files changed, 49 insertions(+), 43 deletions(-)
> > 
> > diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
> > index c0f202741e09..e97a6acd6f5d 100644
> > --- a/fs/btrfs/extent_io.c
> > +++ b/fs/btrfs/extent_io.c
> > @@ -4278,52 +4278,34 @@ int extent_writepages(struct address_space *mapping,
> >  	return ret;
> >  }
> >  
> > -int extent_readpages(struct address_space *mapping, struct list_head *pages,
> > -		     unsigned nr_pages)
> > +void extent_readahead(struct readahead_control *rac)
> >  {
> >  	struct bio *bio = NULL;
> >  	unsigned long bio_flags = 0;
> >  	struct page *pagepool[16];
> >  	struct extent_map *em_cached = NULL;
> > -	struct extent_io_tree *tree = &BTRFS_I(mapping->host)->io_tree;
> > -	int nr = 0;
> > +	struct extent_io_tree *tree = &BTRFS_I(rac->mapping->host)->io_tree;
> >  	u64 prev_em_start = (u64)-1;
> > +	int nr;
> >  
> > -	while (!list_empty(pages)) {
> > -		u64 contig_end = 0;
> > -
> > -		for (nr = 0; nr < ARRAY_SIZE(pagepool) && !list_empty(pages);) {
> > -			struct page *page = lru_to_page(pages);
> > -
> > -			prefetchw(&page->flags);
> > -			list_del(&page->lru);
> > -			if (add_to_page_cache_lru(page, mapping, page->index,
> > -						readahead_gfp_mask(mapping))) {
> > -				put_page(page);
> > -				break;
> > -			}
> > -
> > -			pagepool[nr++] = page;
> > -			contig_end = page_offset(page) + PAGE_SIZE - 1;
> > -		}
> > +	readahead_for_each_batch(rac, pagepool, ARRAY_SIZE(pagepool), nr) {
> > +		u64 contig_start = page_offset(pagepool[0]);
> > +		u64 contig_end = page_offset(pagepool[nr - 1]) + PAGE_SIZE - 1;
> 
> So this assumes a contiguous page range is returned, right?

Yes.  That's documented in the readahead API and is the behaviour of
the code.  I mean, btrfs asserts it's true while most of the rest of
the kernel is indifferent to it, but it's the documented and actual
behaviour.

> >  
> > -		if (nr) {
> > -			u64 contig_start = page_offset(pagepool[0]);
> > +		ASSERT(contig_start + nr * PAGE_SIZE - 1 == contig_end);
> 
> Ok, yes it does. :)
> 
> I don't see how readahead_for_each_batch() guarantees that, though.

I ... don't see how it doesn't?  We start at rac->_start and iterate
through the consecutive pages in the page cache.  readahead_for_each_batch()
does assume that __do_page_cache_readahead() has its current behaviour
of putting the pages in the page cache in order, and kicks off a new
call to ->readahead() every time it has to skip an index for whatever
reason (eg page already in page cache).

> > -	if (bio)
> > -		return submit_one_bio(bio, 0, bio_flags);
> > -	return 0;
> > +	if (bio) {
> > +		if (submit_one_bio(bio, 0, bio_flags))
> > +			return;
> > +	}
> >  }
> 
> Shouldn't that just be
> 
> 	if (bio)
> 		submit_one_bio(bio, 0, bio_flags);

It should, but some overzealous person decided to mark submit_one_bio()
as __must_check, so I have to work around that.

> > +static inline unsigned int readahead_page_batch(struct readahead_control *rac,
> > +		struct page **array, unsigned int size)
> > +{
> > +	unsigned int batch = 0;
> 
> Confusing when put alongside rac->_batch_count counting the number
> of pages in the batch, and "batch" being the index into the page
> array, and they aren't the same counts....

Yes.  Renamed to 'i'.

> > +	XA_STATE(xas, &rac->mapping->i_pages, rac->_start);
> > +	struct page *page;
> > +
> > +	rac->_batch_count = 0;
> > +	xas_for_each(&xas, page, rac->_start + rac->_nr_pages - 1) {
> 
> That just iterates pages in the start,end doesn't it? What
> guarantees that this fills the array with a contiguous page range?

The behaviour of __do_page_cache_readahead().  Dave Howells also has a
usecase for xas_for_each_contig(), so I'm going to add that soon.

> > +		VM_BUG_ON_PAGE(!PageLocked(page), page);
> > +		VM_BUG_ON_PAGE(PageTail(page), page);
> > +		array[batch++] = page;
> > +		rac->_batch_count += hpage_nr_pages(page);
> > +		if (PageHead(page))
> > +			xas_set(&xas, rac->_start + rac->_batch_count);
> 
> What on earth does this do? Comments please!

		/*
		 * The page cache isn't using multi-index entries yet,
		 * so xas_for_each() won't do the right thing for
		 * large pages.  This can be removed once the page cache
		 * is converted.
		 */

> > +
> > +		if (batch == size)
> > +			break;
> > +	}
> > +
> > +	return batch;
> > +}
> 
> Seems a bit big for an inline function.

It's only called by btrfs at the moment.  If it gets more than one caller,
then sure, let's move it out of line.

> > +
> > +#define readahead_for_each_batch(rac, array, size, nr)			\
> > +	for (; (nr = readahead_page_batch(rac, array, size));		\
> > +			readahead_next(rac))
> 
> I had to go look at the caller to work out what "size" refered to
> here.
> 
> This is complex enough that it needs proper API documentation.

How about just:

-#define readahead_for_each_batch(rac, array, size, nr)                 \
-       for (; (nr = readahead_page_batch(rac, array, size));           \
+#define readahead_for_each_batch(rac, array, array_sz, nr)             \
+       for (; (nr = readahead_page_batch(rac, array, array_sz));       \

(corresponding rename in readahead_page_batch).  I mean, we could also
do:

#define readahead_for_each_batch(rac, array, nr)			\
	for (; (nr = readahead_page_batch(rac, array, ARRAY_SIZE(array)); \
			readahead_next(rac))

making it less flexible, but easier to use.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
