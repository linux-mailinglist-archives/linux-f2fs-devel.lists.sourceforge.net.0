Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA03618E6A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Nov 2022 03:45:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oqmhx-0004Cl-98;
	Fri, 04 Nov 2022 02:45:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1oqmhv-0004Cf-9c
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Nov 2022 02:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2j+9TJ2nW1WOaQ2I5RhiWQwWacGBbSFgPsVNgSs4IJo=; b=BHXqXhuAAoaETSZOq5bgNRkcmD
 oLsn7VXPdqn7BnpbHyqwwypIovbsiwgxmYlY0Nkxr2x5lFgk3uRNRxRi4Ei6MooPKr92ZEsvP6MYP
 cT75iRZOvj1cLQI1XfUa0eYn7KTbjQnHwU/bNM0fXmFKa08+MU2aDdWc8/0QVm1Y22Ps=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2j+9TJ2nW1WOaQ2I5RhiWQwWacGBbSFgPsVNgSs4IJo=; b=FrnToHuVxn2ed75v6trLh40ViM
 iohbMvnvr1DVYqqjJxYo7ZS8ENVLMkkCoo84o1UL5PEJ9P78M/zuWQl5Cr7QnAVNSC4SdK9SaGAo8
 2Mq2e5hPu2VWfOhzM/1R7To1Gkx62wSt/5bJDLcUJAmty4XyeXTHqXnJZzf6a7XlaOVs=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oqmht-0003wV-52 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Nov 2022 02:45:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 79242CE1E50;
 Fri,  4 Nov 2022 02:45:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BECBBC433D6;
 Fri,  4 Nov 2022 02:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667529901;
 bh=/0jE4wxnfsHa7OS5h1zoTRnX14BlhhgAYtontSD+goU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QhebSV3u30N+QMrsKozFq0hhvaud8wlCVNqX022uUgdQfIz0tPYAN8swZT4aNhxLF
 3JIvYoVIQ4c8gliQI0zeQ3FjbquYjZkECJ0znxkoy904ptfzyKKXnG+Za+6Mft1yFL
 1gARAUeU8iLcT94cx5M8segpPtf9cb8B5mW9kfWKuR/2m7Dnq0mgDABso09tQRvMh/
 x6Ut/TjR3G4G/b3+TX1EJ3q0VXjkBMQz3y+NXoo4A7OnJT7uVh2hezBWnZqsOjdeUu
 vr7N37u0q6j9BXIOK65jMN+ZW98hGZ9pwJPXOHvcqjsfVCdOmrDQ+o9MQTTolvngMB
 A2e28oevqKQrg==
Date: Thu, 3 Nov 2022 19:45:01 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <Y2R8rRr0ZdrlT32m@magnolia>
References: <20220901220138.182896-1-vishal.moola@gmail.com>
 <20220901220138.182896-5-vishal.moola@gmail.com>
 <20221018210152.GH2703033@dread.disaster.area>
 <Y2RAdUtJrOJmYU4L@fedora>
 <20221104003235.GZ2703033@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221104003235.GZ2703033@dread.disaster.area>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Nov 04, 2022 at 11:32:35AM +1100, Dave Chinner wrote:
 > On Thu, Nov 03, 2022 at 03:28:05PM -0700, Vishal Moola wrote: > > On Wed,
 Oct 19, 2022 at 08:01:52AM +1100, Dave Chinner wrote: > > > On [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oqmht-0003wV-52
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
Cc: linux-cifs@vger.kernel.org, cluster-devel@redhat.com,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Vishal Moola <vishal.moola@gmail.com>,
 linux-mm@kvack.org, linux-nilfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Nov 04, 2022 at 11:32:35AM +1100, Dave Chinner wrote:
> On Thu, Nov 03, 2022 at 03:28:05PM -0700, Vishal Moola wrote:
> > On Wed, Oct 19, 2022 at 08:01:52AM +1100, Dave Chinner wrote:
> > > On Thu, Sep 01, 2022 at 03:01:19PM -0700, Vishal Moola (Oracle) wrote:
> > > > Converted function to use folios throughout. This is in preparation for
> > > > the removal of find_get_pages_range_tag().
> > > > 
> > > > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > > > ---
> > > >  mm/page-writeback.c | 44 +++++++++++++++++++++++---------------------
> > > >  1 file changed, 23 insertions(+), 21 deletions(-)
> > > > 
> > > > diff --git a/mm/page-writeback.c b/mm/page-writeback.c
> > > > index 032a7bf8d259..087165357a5a 100644
> > > > --- a/mm/page-writeback.c
> > > > +++ b/mm/page-writeback.c
> > > > @@ -2285,15 +2285,15 @@ int write_cache_pages(struct address_space *mapping,
> > > >  	int ret = 0;
> > > >  	int done = 0;
> > > >  	int error;
> > > > -	struct pagevec pvec;
> > > > -	int nr_pages;
> > > > +	struct folio_batch fbatch;
> > > > +	int nr_folios;
> > > >  	pgoff_t index;
> > > >  	pgoff_t end;		/* Inclusive */
> > > >  	pgoff_t done_index;
> > > >  	int range_whole = 0;
> > > >  	xa_mark_t tag;
> > > >  
> > > > -	pagevec_init(&pvec);
> > > > +	folio_batch_init(&fbatch);
> > > >  	if (wbc->range_cyclic) {
> > > >  		index = mapping->writeback_index; /* prev offset */
> > > >  		end = -1;
> > > > @@ -2313,17 +2313,18 @@ int write_cache_pages(struct address_space *mapping,
> > > >  	while (!done && (index <= end)) {
> > > >  		int i;
> > > >  
> > > > -		nr_pages = pagevec_lookup_range_tag(&pvec, mapping, &index, end,
> > > > -				tag);
> > > > -		if (nr_pages == 0)
> > > > +		nr_folios = filemap_get_folios_tag(mapping, &index, end,
> > > > +				tag, &fbatch);
> > > 
> > > This can find and return dirty multi-page folios if the filesystem
> > > enables them in the mapping at instantiation time, right?
> > 
> > Yup, it will.
> > 
> > > > +
> > > > +		if (nr_folios == 0)
> > > >  			break;
> > > >  
> > > > -		for (i = 0; i < nr_pages; i++) {
> > > > -			struct page *page = pvec.pages[i];
> > > > +		for (i = 0; i < nr_folios; i++) {
> > > > +			struct folio *folio = fbatch.folios[i];
> > > >  
> > > > -			done_index = page->index;
> > > > +			done_index = folio->index;
> > > >  
> > > > -			lock_page(page);
> > > > +			folio_lock(folio);
> > > >  
> > > >  			/*
> > > >  			 * Page truncated or invalidated. We can freely skip it
> > > > @@ -2333,30 +2334,30 @@ int write_cache_pages(struct address_space *mapping,
> > > >  			 * even if there is now a new, dirty page at the same
> > > >  			 * pagecache address.
> > > >  			 */
> > > > -			if (unlikely(page->mapping != mapping)) {
> > > > +			if (unlikely(folio->mapping != mapping)) {
> > > >  continue_unlock:
> > > > -				unlock_page(page);
> > > > +				folio_unlock(folio);
> > > >  				continue;
> > > >  			}
> > > >  
> > > > -			if (!PageDirty(page)) {
> > > > +			if (!folio_test_dirty(folio)) {
> > > >  				/* someone wrote it for us */
> > > >  				goto continue_unlock;
> > > >  			}
> > > >  
> > > > -			if (PageWriteback(page)) {
> > > > +			if (folio_test_writeback(folio)) {
> > > >  				if (wbc->sync_mode != WB_SYNC_NONE)
> > > > -					wait_on_page_writeback(page);
> > > > +					folio_wait_writeback(folio);
> > > >  				else
> > > >  					goto continue_unlock;
> > > >  			}
> > > >  
> > > > -			BUG_ON(PageWriteback(page));
> > > > -			if (!clear_page_dirty_for_io(page))
> > > > +			BUG_ON(folio_test_writeback(folio));
> > > > +			if (!folio_clear_dirty_for_io(folio))
> > > >  				goto continue_unlock;
> > > >  
> > > >  			trace_wbc_writepage(wbc, inode_to_bdi(mapping->host));
> > > > -			error = (*writepage)(page, wbc, data);
> > > > +			error = writepage(&folio->page, wbc, data);
> > > 
> > > Yet, IIUC, this treats all folios as if they are single page folios.
> > > i.e. it passes the head page of a multi-page folio to a callback
> > > that will treat it as a single PAGE_SIZE page, because that's all
> > > the writepage callbacks are currently expected to be passed...
> > > 
> > > So won't this break writeback of dirty multipage folios?
> > 
> > Yes, it appears it would. But it wouldn't because its already 'broken'.
> 
> It is? Then why isn't XFS broken on existing kernels? Oh, we don't
> know because it hasn't been tested?
> 
> Seriously - if this really is broken, and this patchset further
> propagating the brokeness, then somebody needs to explain to me why
> this is not corrupting data in XFS.

It looks like iomap_do_writepage finds the folio size correctly

	end_pos = folio_pos(folio) + folio_size(folio);

and iomap_writpage_map will map out the correct number of blocks

	unsigned nblocks = i_blocks_per_folio(inode, folio);

	for (i = 0; i < nblocks && pos < end_pos; i++, pos += len) {

right?  The interface is dangerous because anyone who enables multipage
folios has to be aware that ->writepage can be handed a multipage folio.

(That said, the lack of mention of xfs in the testing plan doesn't give
me much confidence anyone has checked this...)

> I get it that page/folios are in transition, but passing a
> multi-page folio page to an interface that expects a PAGE_SIZE
> struct page is a pretty nasty landmine, regardless of how broken the
> higher level iteration code already might be.
> 
> At minimum, it needs to be documented, though I'd much prefer that
> we explicitly duplicate write_cache_pages() as write_cache_folios()
> with a callback that takes a folio and change the code to be fully
> multi-page folio safe. Then filesystems that support folios (and
> large folios) natively can be passed folios without going through
> this crappy "folio->page, page->folio" dance because the writepage
> APIs are unaware of multi-page folio constructs.

Agree.  Build the new one, move callers over, and kill the old one.

> Then you can convert the individual filesystems using
> write_cache_pages() to call write_cache_folios() one at a time,
> updating the filesystem callback to do the conversion from folio to
> struct page and checking that it an order-0 page that it has been
> handed....
> 
> > The current find_get_pages_range_tag() actually has the exact same
> > issue. The current code to fill up the pages array is:
> > 
> > 		pages[ret] = &folio->page;
> > 		if (++ret == nr_pages) {
> > 			*index = folio->index + folio_nr_pages(folio);
> > 			goto out;
> 
> "It's already broken so we can make it more broken" isn't an
> acceptible answer....
> 
> > Its not great to leave it 'broken' but its something that isn't - or at
> > least shouldn't be - creating any problems at present. And I believe Matthew
> > has plans to address them at some point before they actually become problems?
> 
> You are modifying the interfaces and doing folio conversions that
> expose and propagate the brokenness. The brokeness needs to be
> either avoided or fixed and not propagated further. Doing the above
> write_cache_folios() conversion avoids the propagating the
> brokenness, adds runtime detection of brokenness, and provides the
> right interface for writeback iteration of folios.
> 
> Fixing the generic writeback iterator properly is not much extra
> work, and it sets the model for filesytsems that have copy-pasted
> write_cache_pages() and then hacked it around for their own purposes
> (e.g. ext4, btrfs) to follow.
> 
> -Dave.
> -- 
> Dave Chinner
> david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
