Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E04618D49
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Nov 2022 01:39:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oqkkH-00033B-Me;
	Fri, 04 Nov 2022 00:39:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1oqkkG-000335-M7
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Nov 2022 00:39:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nqFWmWfUe3nfY/W1IhQtBrk1jdkAMC8SotBe5qoKInk=; b=BtOlFBse5kBVIJmuzgxF88kLMP
 wenbJUXuo4XHUcSfE+ufYX4TyShhLI7/ISviEOds7ar3d1W31C/6ABhYfkalYCkCfW7kscv1xfeZP
 sOrV9L7EH1GoXwhBiOhZLqtndgWR/phixoU87xC0docPH75lcaJJDxoSO84zzWCK0oyI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nqFWmWfUe3nfY/W1IhQtBrk1jdkAMC8SotBe5qoKInk=; b=MJNDBTttrjcAWFDTP/rt/nQX/d
 RJI+gJO9d0YsCEHtbXW6WiiT3IioLmgtD0/5cIA/sjgGReE1Bxp12KgGZGfbAYd2DofOYFgZHVZdG
 XEcJc4E/D4BSChryhXGb6tzIgepDPfL/QZcWzlUSLz7KMbrHiiWJIDCqVFYVCwHfBfr8=;
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oqkkA-00BANl-0n for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Nov 2022 00:39:40 +0000
Received: by mail-pj1-f46.google.com with SMTP id
 z5-20020a17090a8b8500b00210a3a2364fso6740622pjn.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 03 Nov 2022 17:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nqFWmWfUe3nfY/W1IhQtBrk1jdkAMC8SotBe5qoKInk=;
 b=59fd9mimgkb3jqAEBB6FDge8YWbKgQ9cCVLSYc0vbz/ITZ/+MWGUAhT+BfkD/WyOKR
 ZS72otyTGSBCMIn5KXHq3LY3eBVqj847EAys1SC/2LtlNG2ca/p3U0PFwYXe/Wnqkktr
 I3J8EoDvRfIbPMbLnYr+wIQ9y3cFpGyrA7PQRcteKx3oRqTR+RVUuWrOgzafCb1uOAwz
 nCRdmg7rcl4JIOC/F7kvcGFV4AMwfIgrEUm/9771CgvZ3C7eQT9zBQ3v6zbQ4HsMWHhf
 YC3gUQD3VRGl+O7/Jyi2szZ3xH6y79IvLO1d72Ja/0b7kFUBkMCtbZ/1nn2lxndqgNOT
 QynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nqFWmWfUe3nfY/W1IhQtBrk1jdkAMC8SotBe5qoKInk=;
 b=r2yBel3ldbwC6WlIsGD2XJszlO+Uv4B7emKcr9gey13LHe1PrEzw+9ewm+erwPzitR
 EsfHIFVFAupcy5zlnsUw20CVYE41DRoQVDpFlZ0VeHAL/hi+Yvil/EwCArRsxNd6/u9O
 Vjj0kUplUrBlsZ35nxUWhEGBBEGIA2UPh7vcXO/N5Ptd7IO9fYig/9Nnppy84bWhBFbE
 p8/4A4NcJFrAFIEX9Cfw7JWHTgweYXG2AZEMnpzsMW6or2lzBULQ6TTnzeQOMLb59Xzo
 2sKyiPzylH86n8C2HGgpFrj5AFszm29fr342BoAjW0Q4AsSL7NCrXOdJEv+8Qi5AFUXT
 owFA==
X-Gm-Message-State: ACrzQf2LYB9GHiRJRrv6Fk4Pb5D3krS8tcg9Igw1MC/ZsTvRkYH8nAC6
 JyGQjROF9F7+K/6PxQ8bJbceyoT/+1jPUQ==
X-Google-Smtp-Source: AMsMyM6iJ2SNWGuGLen8Rv+LFYo5aa41OR1ELR00lyKv92EB0uGeLIs3Yf+UrlIB5ACN2HoiTY/hWA==
X-Received: by 2002:aa7:962c:0:b0:56c:14c9:70dc with SMTP id
 r12-20020aa7962c000000b0056c14c970dcmr224950pfg.17.1667521959674; 
 Thu, 03 Nov 2022 17:32:39 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-106-210.pa.nsw.optusnet.com.au.
 [49.181.106.210]) by smtp.gmail.com with ESMTPSA id
 w189-20020a6282c6000000b0056c04dee930sm1341605pfd.120.2022.11.03.17.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 17:32:39 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1oqkdP-009ySF-U9; Fri, 04 Nov 2022 11:32:35 +1100
Date: Fri, 4 Nov 2022 11:32:35 +1100
From: Dave Chinner <david@fromorbit.com>
To: Vishal Moola <vishal.moola@gmail.com>
Message-ID: <20221104003235.GZ2703033@dread.disaster.area>
References: <20220901220138.182896-1-vishal.moola@gmail.com>
 <20220901220138.182896-5-vishal.moola@gmail.com>
 <20221018210152.GH2703033@dread.disaster.area>
 <Y2RAdUtJrOJmYU4L@fedora>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y2RAdUtJrOJmYU4L@fedora>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Nov 03, 2022 at 03:28:05PM -0700, Vishal Moola wrote:
 > On Wed, Oct 19, 2022 at 08:01:52AM +1100, Dave Chinner wrote: > > On Thu,
 Sep 01, 2022 at 03:01:19PM -0700, Vishal Moola (Oracle) wrote: [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.46 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.46 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oqkkA-00BANl-0n
Subject: Re: [f2fs-dev] [PATCH 04/23] page-writeback: Convert
 write_cache_pages() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Nov 03, 2022 at 03:28:05PM -0700, Vishal Moola wrote:
> On Wed, Oct 19, 2022 at 08:01:52AM +1100, Dave Chinner wrote:
> > On Thu, Sep 01, 2022 at 03:01:19PM -0700, Vishal Moola (Oracle) wrote:
> > > Converted function to use folios throughout. This is in preparation for
> > > the removal of find_get_pages_range_tag().
> > > 
> > > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > > ---
> > >  mm/page-writeback.c | 44 +++++++++++++++++++++++---------------------
> > >  1 file changed, 23 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/mm/page-writeback.c b/mm/page-writeback.c
> > > index 032a7bf8d259..087165357a5a 100644
> > > --- a/mm/page-writeback.c
> > > +++ b/mm/page-writeback.c
> > > @@ -2285,15 +2285,15 @@ int write_cache_pages(struct address_space *mapping,
> > >  	int ret = 0;
> > >  	int done = 0;
> > >  	int error;
> > > -	struct pagevec pvec;
> > > -	int nr_pages;
> > > +	struct folio_batch fbatch;
> > > +	int nr_folios;
> > >  	pgoff_t index;
> > >  	pgoff_t end;		/* Inclusive */
> > >  	pgoff_t done_index;
> > >  	int range_whole = 0;
> > >  	xa_mark_t tag;
> > >  
> > > -	pagevec_init(&pvec);
> > > +	folio_batch_init(&fbatch);
> > >  	if (wbc->range_cyclic) {
> > >  		index = mapping->writeback_index; /* prev offset */
> > >  		end = -1;
> > > @@ -2313,17 +2313,18 @@ int write_cache_pages(struct address_space *mapping,
> > >  	while (!done && (index <= end)) {
> > >  		int i;
> > >  
> > > -		nr_pages = pagevec_lookup_range_tag(&pvec, mapping, &index, end,
> > > -				tag);
> > > -		if (nr_pages == 0)
> > > +		nr_folios = filemap_get_folios_tag(mapping, &index, end,
> > > +				tag, &fbatch);
> > 
> > This can find and return dirty multi-page folios if the filesystem
> > enables them in the mapping at instantiation time, right?
> 
> Yup, it will.
> 
> > > +
> > > +		if (nr_folios == 0)
> > >  			break;
> > >  
> > > -		for (i = 0; i < nr_pages; i++) {
> > > -			struct page *page = pvec.pages[i];
> > > +		for (i = 0; i < nr_folios; i++) {
> > > +			struct folio *folio = fbatch.folios[i];
> > >  
> > > -			done_index = page->index;
> > > +			done_index = folio->index;
> > >  
> > > -			lock_page(page);
> > > +			folio_lock(folio);
> > >  
> > >  			/*
> > >  			 * Page truncated or invalidated. We can freely skip it
> > > @@ -2333,30 +2334,30 @@ int write_cache_pages(struct address_space *mapping,
> > >  			 * even if there is now a new, dirty page at the same
> > >  			 * pagecache address.
> > >  			 */
> > > -			if (unlikely(page->mapping != mapping)) {
> > > +			if (unlikely(folio->mapping != mapping)) {
> > >  continue_unlock:
> > > -				unlock_page(page);
> > > +				folio_unlock(folio);
> > >  				continue;
> > >  			}
> > >  
> > > -			if (!PageDirty(page)) {
> > > +			if (!folio_test_dirty(folio)) {
> > >  				/* someone wrote it for us */
> > >  				goto continue_unlock;
> > >  			}
> > >  
> > > -			if (PageWriteback(page)) {
> > > +			if (folio_test_writeback(folio)) {
> > >  				if (wbc->sync_mode != WB_SYNC_NONE)
> > > -					wait_on_page_writeback(page);
> > > +					folio_wait_writeback(folio);
> > >  				else
> > >  					goto continue_unlock;
> > >  			}
> > >  
> > > -			BUG_ON(PageWriteback(page));
> > > -			if (!clear_page_dirty_for_io(page))
> > > +			BUG_ON(folio_test_writeback(folio));
> > > +			if (!folio_clear_dirty_for_io(folio))
> > >  				goto continue_unlock;
> > >  
> > >  			trace_wbc_writepage(wbc, inode_to_bdi(mapping->host));
> > > -			error = (*writepage)(page, wbc, data);
> > > +			error = writepage(&folio->page, wbc, data);
> > 
> > Yet, IIUC, this treats all folios as if they are single page folios.
> > i.e. it passes the head page of a multi-page folio to a callback
> > that will treat it as a single PAGE_SIZE page, because that's all
> > the writepage callbacks are currently expected to be passed...
> > 
> > So won't this break writeback of dirty multipage folios?
> 
> Yes, it appears it would. But it wouldn't because its already 'broken'.

It is? Then why isn't XFS broken on existing kernels? Oh, we don't
know because it hasn't been tested?

Seriously - if this really is broken, and this patchset further
propagating the brokeness, then somebody needs to explain to me why
this is not corrupting data in XFS.

I get it that page/folios are in transition, but passing a
multi-page folio page to an interface that expects a PAGE_SIZE
struct page is a pretty nasty landmine, regardless of how broken the
higher level iteration code already might be.

At minimum, it needs to be documented, though I'd much prefer that
we explicitly duplicate write_cache_pages() as write_cache_folios()
with a callback that takes a folio and change the code to be fully
multi-page folio safe. Then filesystems that support folios (and
large folios) natively can be passed folios without going through
this crappy "folio->page, page->folio" dance because the writepage
APIs are unaware of multi-page folio constructs.

Then you can convert the individual filesystems using
write_cache_pages() to call write_cache_folios() one at a time,
updating the filesystem callback to do the conversion from folio to
struct page and checking that it an order-0 page that it has been
handed....

> The current find_get_pages_range_tag() actually has the exact same
> issue. The current code to fill up the pages array is:
> 
> 		pages[ret] = &folio->page;
> 		if (++ret == nr_pages) {
> 			*index = folio->index + folio_nr_pages(folio);
> 			goto out;

"It's already broken so we can make it more broken" isn't an
acceptible answer....

> Its not great to leave it 'broken' but its something that isn't - or at
> least shouldn't be - creating any problems at present. And I believe Matthew
> has plans to address them at some point before they actually become problems?

You are modifying the interfaces and doing folio conversions that
expose and propagate the brokenness. The brokeness needs to be
either avoided or fixed and not propagated further. Doing the above
write_cache_folios() conversion avoids the propagating the
brokenness, adds runtime detection of brokenness, and provides the
right interface for writeback iteration of folios.

Fixing the generic writeback iterator properly is not much extra
work, and it sets the model for filesytsems that have copy-pasted
write_cache_pages() and then hacked it around for their own purposes
(e.g. ext4, btrfs) to follow.

-Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
