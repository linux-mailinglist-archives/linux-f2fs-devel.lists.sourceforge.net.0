Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F1C166DF8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2020 04:43:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4zDn-0000oD-6E; Fri, 21 Feb 2020 03:43:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j4zDl-0000o6-NS
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 03:43:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=obz7ZWmqD71AwZdgsuEDd5gnze1ra3KYd/7cgjm7aL0=; b=cqbukQvmnv7eT2SdIB8nt6nvzg
 QDuL5xdtYIegxJV00iSpol+nQZ8/w1pFsuKtx7nsIHFCMLlnzmeCnFFvTSgOEFSIxGhPU4crCD6wq
 kULbB1FNZX0vfSOcpGY1lnZ+Z30niVvRTyclNpmMQfWf5LmXXmUgkyxGyYfFQg9uP0UE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=obz7ZWmqD71AwZdgsuEDd5gnze1ra3KYd/7cgjm7aL0=; b=YTo1HLYiF+dxwPl3P6l6L5/8Ht
 lXVmrcTUjYDZgZqYL2SrlwOygJaey639dV9YrBbv8Vy0UfGTQXzsFvQLFHwynRfsdgt47uy097ueD
 HGqmSWV3w4JA8kqDK4mf5uR4LftzmeuE02tZGW7WgSGRPWuJLaxN8IoQ0gXG3X9knoKs=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4zDi-00COr2-Ud
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 03:43:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=obz7ZWmqD71AwZdgsuEDd5gnze1ra3KYd/7cgjm7aL0=; b=tzHbVtBTFh2a8UdEUyBasiIqqj
 twF1z5EJw2Enwdp9ixs/2Kx03bq3t9vA8Kzfj4AGGpYk3IjOQ+Mz48wOXBoehzoUVi53lWjCelAQG
 jpO/8vC1YNcF5VdVBqFMl15zHF/s4HahZctnahjcauZds9X63imCS9ncsMJLTkThl2iyPBbHgptR7
 fAktfpbRlzralPnfL8HaKirMZ8fdCGmPvP++WjL/bvv3+KAHcFcQEAdLzhIk9Y+IFG+bQCbvexnV3
 ViTPBBNEhCk4g4S9vvbK91kwwnsUNaXhHruQcWFFJMZjSrxmZh9emiN9jabhqNTXu2lUTU89CMpcz
 EBVxS2vA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4zDU-0002Zk-HL; Fri, 21 Feb 2020 03:43:04 +0000
Date: Thu, 20 Feb 2020 19:43:04 -0800
From: Matthew Wilcox <willy@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <20200221034304.GC24185@bombadil.infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-10-willy@infradead.org>
 <5691442b-56c7-7b0d-d91b-275be52abb42@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5691442b-56c7-7b0d-d91b-275be52abb42@nvidia.com>
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
X-Headers-End: 1j4zDi-00COr2-Ud
Subject: Re: [f2fs-dev] [PATCH v7 09/24] mm: Put readahead pages in cache
 earlier
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

On Thu, Feb 20, 2020 at 07:19:58PM -0800, John Hubbard wrote:
> > +static inline struct page *readahead_page(struct readahead_control *rac)
> > +{
> > +	struct page *page;
> > +
> > +	BUG_ON(rac->_batch_count > rac->_nr_pages);
> > +	rac->_nr_pages -= rac->_batch_count;
> > +	rac->_index += rac->_batch_count;
> > +	rac->_batch_count = 0;
> 
> 
> Is it intentional, to set rac->_batch_count twice (here, and below)? The
> only reason I can see is if a caller needs to use ->_batch_count in the
> "return NULL" case, which doesn't seem to come up...

Ah, but it does.  Not in this patch, but the next one ...

+       if (aops->readahead) {
+               aops->readahead(rac);
+               /* Clean up the remaining pages */
+               while ((page = readahead_page(rac))) {
+                       unlock_page(page);
+                       put_page(page);
+               }

In the normal case, the ->readahead method will consume all the pages,
and we need readahead_page() to do nothing if it is called again.

> > +	if (!rac->_nr_pages)
> > +		return NULL;

... admittedly I could do:

	if (!rac->_nr_pages) {
		rac->_batch_count = 0;
		return NULL;
	}

which might be less confusing.

> > @@ -130,23 +129,23 @@ static void read_pages(struct readahead_control *rac, struct list_head *pages,
> >  				readahead_count(rac));
> >  		/* Clean up the remaining pages */
> >  		put_pages_list(pages);
> > -		goto out;
> > -	}
> > -
> > -	for (page_idx = 0; page_idx < readahead_count(rac); page_idx++) {
> > -		struct page *page = lru_to_page(pages);
> > -		list_del(&page->lru);
> > -		if (!add_to_page_cache_lru(page, rac->mapping, page->index,
> > -				gfp))
> > +		rac->_index += rac->_nr_pages;
> > +		rac->_nr_pages = 0;
> > +	} else {
> > +		while ((page = readahead_page(rac))) {
> >  			aops->readpage(rac->file, page);
> > -		put_page(page);
> > +			put_page(page);
> > +		}
> >  	}
> >  
> > -out:
> >  	blk_finish_plug(&plug);
> >  
> >  	BUG_ON(!list_empty(pages));
> > -	rac->_nr_pages = 0;
> > +	BUG_ON(readahead_count(rac));
> > +
> > +out:
> > +	/* If we were called due to a conflicting page, skip over it */
> 
> Tiny documentation nit: What if we were *not* called due to a conflicting page? 
> (And what is a "conflicting page", in this context, btw?) The next line unconditionally 
> moves the index ahead, so the "if" part of the comment really confuses me.

By the end of the series, read_pages() is called in three places:

1.              if (page && !xa_is_value(page)) {
                        read_pages(&rac, &page_pool);

2.              } else if (add_to_page_cache_lru(page, mapping, index + i,
                                        gfp_mask) < 0) {
                        put_page(page);
                        read_pages(&rac, &page_pool);

3.      read_pages(&rac, &page_pool);

In the first two cases, there's an existing page in the page cache
(which conflicts with this readahead operation), and so we need to
advance index.  In the third case, we're exiting the function, so it
does no harm to advance index one further.

> > +		} else if (add_to_page_cache_lru(page, mapping, index + i,
> > +					gfp_mask) < 0) {
> 
> I still think you'll want to compare against !=0, rather than < 0, here.

I tend to prefer < 0 when checking for an error value in case the function
decides to start using positive numbers to mean something.  I don't think
it's a particularly important preference though (after all, returning 1
might mean "failed, but for this weird reason rather than an errno").

> > +			put_page(page);
> > +			read_pages(&rac, &page_pool);
> 
> Doing a read_pages() in the error case is because...actually, I'm not sure yet.
> Why do we do this? Effectively it's a retry?

Same as the reason we call read_pages() if we found a page in the page
cache earlier -- we're sending down a set of pages which are consecutive
in the file's address space, and now we have to skip one.  At least one ;-)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
