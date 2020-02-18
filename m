Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E481629A2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2020 16:42:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j451A-0008ME-Vd; Tue, 18 Feb 2020 15:42:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j4519-0008Lo-AH
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 15:42:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oQ+wHGdx1ULBXPBam1g8Uipf1yyfaaqxmlrcZ982o9k=; b=ibnGNIuFdcBS4P9FrUhV1+6xyN
 Rtd9A1nsc9XAtqaDxl+KfcDNLv8OHs3uezOKmiNngZvzYLtr+s3YFoX1U0QvIghlr9WI10b9RG4gG
 yLvf/D3bMvoo+sIYiF9qfVIJhJU44/Kg8ajtd9SqlW0n7hq8HImkv7lRsTGqVtf1EVAQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oQ+wHGdx1ULBXPBam1g8Uipf1yyfaaqxmlrcZ982o9k=; b=ln+xbSH0N/zO4DQH1bzGRYerqq
 eKIVoo/u8fnPUyok/BRajwD9T4VcBDGtJTSpnXeHN2R3l4uKJG2t9yVwIvxqhAOy6w2AB3o32iKsK
 Wh3A9bObQ3II4tfgcFWMTtaDIfCCtu5a/Eg54ekTCY+uX5pwU5ESMhhw7EGHEvPci+MQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4517-0076mQ-Lu
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 15:42:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=oQ+wHGdx1ULBXPBam1g8Uipf1yyfaaqxmlrcZ982o9k=; b=Wj2hN1Ys6lneGYnt6lyt28p7dX
 xcPHY3DggtQF0V8rHudxsyMEruSBB+yksYd5K4jTPpH1Sb6FwieHFjL9L4y2tE2u/FKfJKGHM07zk
 7aVuKRme2EL4Yz9RAVR+an3Misj05c3UKPtIB2h8TZRI5Is3OFhiQdPCfewKzO/jjjB0pr4J84clk
 JoeAVeGLWbHKY/xgLceP9WBHTLk19SxEnQx8FM7lcnxbWFWqoM7F8w+JhQvm0Ci7daJwE+nGYHtn3
 +8vcZGb7YOcxncpzTgWcLFEqCwt6gz/YgXx5oaJ9EhecdpELGPuj8YQkK5ZbDKGuAWwReHfNZzohN
 EfWd+hMA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j450w-0007Ik-FJ; Tue, 18 Feb 2020 15:42:22 +0000
Date: Tue, 18 Feb 2020 07:42:22 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200218154222.GQ7778@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-12-willy@infradead.org>
 <20200218061459.GM10776@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218061459.GM10776@dread.disaster.area>
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
X-Headers-End: 1j4517-0076mQ-Lu
Subject: Re: [f2fs-dev] [PATCH v6 07/19] mm: Put readahead pages in cache
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

On Tue, Feb 18, 2020 at 05:14:59PM +1100, Dave Chinner wrote:
> On Mon, Feb 17, 2020 at 10:45:52AM -0800, Matthew Wilcox wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > 
> > At allocation time, put the pages in the cache unless we're using
> > ->readpages.  Add the readahead_for_each() iterator for the benefit of
> > the ->readpage fallback.  This iterator supports huge pages, even though
> > none of the filesystems to be converted do yet.
> 
> This could be better written - took me some time to get my head
> around it and the code.
> 
> "When populating the page cache for readahead, mappings that don't
> use ->readpages need to have their pages added to the page cache
> before ->readpage is called. Do this insertion earlier so that the
> pages can be looked up immediately prior to ->readpage calls rather
> than passing them on a linked list. This early insert functionality
> is also required by the upcoming ->readahead method that will
> replace ->readpages.
> 
> Optimise and simplify the readpage loop by adding a
> readahead_for_each() iterator to provide the pages we need to read.
> This iterator also supports huge pages, even though none of the
> filesystems have been converted to use them yet."

Thanks, I'll use that.

> > +static inline struct page *readahead_page(struct readahead_control *rac)
> > +{
> > +	struct page *page;
> > +
> > +	if (!rac->_nr_pages)
> > +		return NULL;
> 
> Hmmmm.
> 
> > +
> > +	page = xa_load(&rac->mapping->i_pages, rac->_start);
> > +	VM_BUG_ON_PAGE(!PageLocked(page), page);
> > +	rac->_batch_count = hpage_nr_pages(page);
> 
> So we could have rac->_nr_pages = 2, and then we get an order 2
> large page returned, and so rac->_batch_count = 4.

Well, no, we couldn't.  rac->_nr_pages is incremented by 4 when we add
an order-2 page to the readahead.  I can put a
	BUG_ON(rac->_batch_count > rac->_nr_pages)
in here to be sure to catch any logic error like that.

> > @@ -159,6 +152,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
> >  	unsigned long i;
> >  	loff_t isize = i_size_read(inode);
> >  	gfp_t gfp_mask = readahead_gfp_mask(mapping);
> > +	bool use_list = mapping->a_ops->readpages;
> >  	struct readahead_control rac = {
> >  		.mapping = mapping,
> >  		.file = filp,
> 
> [ I do find these unstructured mixes of declarations and
> initialisations dense and difficult to read.... ]

Fair ... although I didn't create this mess, I can tidy it up a bit.

> > -		page->index = offset;
> > -		list_add(&page->lru, &page_pool);
> > +		if (use_list) {
> > +			page->index = offset;
> > +			list_add(&page->lru, &page_pool);
> > +		} else if (add_to_page_cache_lru(page, mapping, offset,
> > +					gfp_mask) < 0) {
> > +			put_page(page);
> > +			goto read;
> > +		}
> 
> Ok, so that's why you put read code at the end of the loop. To turn
> the code into spaghetti :/
> 
> How much does this simplify down when we get rid of ->readpages and
> can restructure the loop? This really seems like you're trying to
> flatten two nested loops into one by the use of goto....

I see it as having two failure cases in this loop.  One for "page is
already present" (which already existed) and one for "allocated a page,
but failed to add it to the page cache" (which used to be done later).
I didn't want to duplicate the "call read_pages()" code.  So I reshuffled
the code rather than add a nested loop.  I don't think the nested loop
is easier to read (we'll be at 5 levels of indentation for some statements).
Could do it this way ...

@@ -218,18 +218,17 @@ void page_cache_readahead_limit(struct address_space *mapping,
                } else if (add_to_page_cache_lru(page, mapping, offset,
                                        gfp_mask) < 0) {
                        put_page(page);
-                       goto read;
+read:
+                       if (readahead_count(&rac))
+                               read_pages(&rac, &page_pool);
+                       rac._nr_pages = 0;
+                       rac._start = ++offset;
+                       continue;
                }
                if (i == nr_to_read - lookahead_size)
                        SetPageReadahead(page);
                rac._nr_pages++;
                offset++;
-               continue;
-read:
-               if (readahead_count(&rac))
-                       read_pages(&rac, &page_pool);
-               rac._nr_pages = 0;
-               rac._start = ++offset;
        }
 
        /*

but I'm not sure that's any better.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
