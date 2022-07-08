Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 419EA56B0D5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Jul 2022 05:29:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o9egf-0007S7-In; Fri, 08 Jul 2022 03:29:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>)
 id 1o9ege-0007Rx-BC; Fri, 08 Jul 2022 03:29:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oM2k/skZQvyu3mUYfkmntJvn7Ev2BYz4NH8zgIp7wHI=; b=J1noFGr0iFnTIzdNQY68+Pi/ga
 jDvPyo0BSwza5CJeYdqR+aXiV1Ld97t/6ZoOuc8cjYXgynsmZ+p/5R5GpXSOvsIQeCF4TsIg/OH6Z
 yPGRIO9xKNleYfiC/XyA/oCYbwRXKkOozjCVMj2FwLHZITVPo3pG+fxSH39NIFcTGNC4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oM2k/skZQvyu3mUYfkmntJvn7Ev2BYz4NH8zgIp7wHI=; b=hXJ0hRTcpQaGZrqrganKzoi+gv
 hU9zDI6bSes/tBTsa/RxNRqenGELNgiloNPQU1ZJytwuswuz7+XHE/ULVVZosgCfFOfzBvGrPI23/
 5EDSPr40eACUiwR4yI/GeD0RpTgfcARNw2DYOHgdKh18FqGCKcDDzeDiRaiiXyaiThPI=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o9ega-00029C-Rh; Fri, 08 Jul 2022 03:29:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=oM2k/skZQvyu3mUYfkmntJvn7Ev2BYz4NH8zgIp7wHI=; b=rHG9dzm8IpPU7EfLVpII+KVjLX
 tK5RzYEsVvZxSEwtzFKftLvIoD7Gprdj8prhV6AczG/W1VhVFRA0+eJOe8FB1oYirYLF/RKjzuD1y
 UeDEi51PvWgAnfcZaU3Gwg3yJ7ho+xCZcFg47ydeQ/XmgoGz+hnH2UXSd2OVAnZpRaDhU4lA368tD
 oe+dO/0K+fc3cXMTKiXo8fOIKu03oBij5w1Ge8Sml/7vp/K9duiAF0tEeC/5h5rnSekPO7SDQxmi+
 t+Coa71RLCVtJVynZWQvpaKSs5ZIFuJtUldewmkkeABsbAtcvNHR4ZT5VhVmpe3X/ZzFhhyxT4Ch5
 5u2Qto6g==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o9eg6-003A5X-T9; Fri, 08 Jul 2022 03:29:15 +0000
Date: Fri, 8 Jul 2022 04:29:14 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hugh Dickins <hughd@google.com>
Message-ID: <Ysekikp60Hhs5lV0@casper.infradead.org>
References: <20220608150249.3033815-1-willy@infradead.org>
 <20220608150249.3033815-8-willy@infradead.org>
 <6e7599d1-8a5f-bf16-383c-febd753bd051@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6e7599d1-8a5f-bf16-383c-febd753bd051@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jul 07, 2022 at 07:50:17PM -0700, Hugh Dickins wrote:
 > On Wed, 8 Jun 2022, Matthew Wilcox (Oracle) wrote: > > > Now that both
 callers have a folio, convert this function to > > take a folio & [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1o9ega-00029C-Rh
Subject: Re: [f2fs-dev] [PATCH v2 07/19] mm/migrate: Convert
 expected_page_refs() to folio_expected_refs()
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ntfs-dev@lists.sourceforge.net, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 07, 2022 at 07:50:17PM -0700, Hugh Dickins wrote:
> On Wed, 8 Jun 2022, Matthew Wilcox (Oracle) wrote:
> 
> > Now that both callers have a folio, convert this function to
> > take a folio & rename it.
> > 
> > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  mm/migrate.c | 19 ++++++++++++-------
> >  1 file changed, 12 insertions(+), 7 deletions(-)
> > 
> > diff --git a/mm/migrate.c b/mm/migrate.c
> > index 2975f0c4d7cf..2e2f41572066 100644
> > --- a/mm/migrate.c
> > +++ b/mm/migrate.c
> > @@ -336,13 +336,18 @@ void pmd_migration_entry_wait(struct mm_struct *mm, pmd_t *pmd)
> >  }
> >  #endif
> >  
> > -static int expected_page_refs(struct address_space *mapping, struct page *page)
> > +static int folio_expected_refs(struct address_space *mapping,
> > +		struct folio *folio)
> >  {
> > -	int expected_count = 1;
> > +	int refs = 1;
> > +	if (!mapping)
> > +		return refs;
> >  
> > -	if (mapping)
> > -		expected_count += compound_nr(page) + page_has_private(page);
> > -	return expected_count;
> > +	refs += folio_nr_pages(folio);
> > +	if (folio_get_private(folio))
> > +		refs++;
> > +
> > +	return refs;
> >  }
> >  
> >  /*
> > @@ -359,7 +364,7 @@ int folio_migrate_mapping(struct address_space *mapping,
> >  	XA_STATE(xas, &mapping->i_pages, folio_index(folio));
> >  	struct zone *oldzone, *newzone;
> >  	int dirty;
> > -	int expected_count = expected_page_refs(mapping, &folio->page) + extra_count;
> > +	int expected_count = folio_expected_refs(mapping, folio) + extra_count;
> >  	long nr = folio_nr_pages(folio);
> >  
> >  	if (!mapping) {
> > @@ -669,7 +674,7 @@ static int __buffer_migrate_folio(struct address_space *mapping,
> >  		return migrate_page(mapping, &dst->page, &src->page, mode);
> >  
> >  	/* Check whether page does not have extra refs before we do more work */
> > -	expected_count = expected_page_refs(mapping, &src->page);
> > +	expected_count = folio_expected_refs(mapping, src);
> >  	if (folio_ref_count(src) != expected_count)
> >  		return -EAGAIN;
> >  
> > -- 
> > 2.35.1
> 
> This commit (742e89c9e352d38df1a5825fe40c4de73a5d5f7a in pagecache.git
> folio/for-next and recent linux-next) is dangerously wrong, at least
> for swapcache, and probably for some others.
> 
> I say "dangerously" because it tells page migration a swapcache page
> is safe for migration when it certainly is not.
> 
> The fun that typically ensues is kernel BUG at include/linux/mm.h:750!
> put_page_testzero() VM_BUG_ON_PAGE(page_ref_count(page) == 0, page),
> if CONFIG_DEBUG_VM=y (bisecting for that is what brought me to this).
> But I guess you might get silent data corruption too.
> 
> I assumed at first that you'd changed the rules, and were now expecting
> any subsystem that puts a non-zero value into folio->private to raise
> its refcount - whereas the old convention (originating with buffer heads)
> is that setting PG_private says an extra refcount has been taken, please
> call try_to_release_page() to lower it, and maybe that will use data in
> page->private to do so; but page->private free for the subsystem owning
> the page to use as it wishes, no refcount implication.  But that you
> had missed updating swapcache.
> 
> So I got working okay with the patch below; but before turning it into
> a proper patch, noticed that there were still plenty of other places
> applying the test for PG_private: so now think that maybe you set out
> with intention as above, realized it wouldn't work, but got distracted
> before cleaning up some places you'd already changed.  And patch below
> now goes in the wrong direction.
> 
> Or maybe you didn't intend any change, but the PG_private test just got
> missed in a few places.  I don't know, hope you remember, but current
> linux-next badly inconsistent.
> Over to you, thanks,

Ugh.  The problem I'm trying to solve is that we're short on page flags.
We _seemed_ to have correlation between "page->private != NULL" and
"PG_private is set", and so I thought I could make progress towards
removing PG_private.  But the rule you set out above wasn't written down
anywhere that I was able to find it.

I'm about to go to sleep, but I'll think on this some more tomorrow.

> Hugh
> 
> --- a/mm/migrate.c	2022-07-06 14:24:44.499941975 -0700
> +++ b/mm/migrate.c	2022-07-06 15:49:25.000000000 -0700
> @@ -351,6 +351,10 @@ unlock:
>  }
>  #endif
>  
> +static inline bool folio_counted_private(struct folio *folio)
> +{
> +	return !folio_test_swapcache(folio) && folio_get_private(folio);
> +}
>  static int folio_expected_refs(struct address_space *mapping,
>  		struct folio *folio)
>  {
> @@ -359,7 +363,7 @@ static int folio_expected_refs(struct ad
>  		return refs;
>  
>  	refs += folio_nr_pages(folio);
> -	if (folio_get_private(folio))
> +	if (folio_counted_private(folio))
>  		refs++;
>  
>  	return refs;
> --- a/mm/vmscan.c	2022-07-06 14:24:44.531942217 -0700
> +++ b/mm/vmscan.c	2022-07-06 15:49:37.000000000 -0700
> @@ -2494,6 +2494,10 @@ shrink_inactive_list(unsigned long nr_to
>   * The downside is that we have to touch folio->_refcount against each folio.
>   * But we had to alter folio->flags anyway.
>   */
> +static inline bool folio_counted_private(struct folio *folio)
> +{
> +	return !folio_test_swapcache(folio) && folio_get_private(folio);
> +}
>  static void shrink_active_list(unsigned long nr_to_scan,
>  			       struct lruvec *lruvec,
>  			       struct scan_control *sc,
> @@ -2538,8 +2542,9 @@ static void shrink_active_list(unsigned
>  		}
>  
>  		if (unlikely(buffer_heads_over_limit)) {
> -			if (folio_get_private(folio) && folio_trylock(folio)) {
> -				if (folio_get_private(folio))
> +			if (folio_counted_private(folio) &&
> +			    folio_trylock(folio)) {
> +				if (folio_counted_private(folio))
>  					filemap_release_folio(folio, 0);
>  				folio_unlock(folio);
>  			}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
