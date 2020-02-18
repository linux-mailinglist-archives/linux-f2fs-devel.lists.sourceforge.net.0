Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9953A163658
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2020 23:46:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4BdH-0008L3-GK; Tue, 18 Feb 2020 22:46:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1j4BdG-0008Ks-Jp
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 22:46:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zlSwHh36u9JVoSFhU4KXgmP3xcAvvhog/nJIiMVfYpM=; b=TPE+WMdAUR0hbTx3TX5EP809n4
 SuesFznrjHcRWhfqW3lxYghA57J+BIkQl4k6i/cT5R9hX5Be+dyLuNilHYurwrTKXJgeFZ0cY4RNB
 waeAAIIFUcKXuP5r/wVEMGj2kJjGCYdGWB9h9sL+G/eQqW0NteuFvFthxKnCF74btQxw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zlSwHh36u9JVoSFhU4KXgmP3xcAvvhog/nJIiMVfYpM=; b=TYjtlSQTHojoqlHkVcL/WAXSRS
 u7dJD1TK4ddEHp/CoC/bKxXqHnWvYRhkywb0Cd06aOH6ACbu8u1af0NhIZCGi+14+2Stvh6bbTlrd
 ifgnJxgfaDcUgGfgqSbMoeHiHmpG0bfEGL4hngKvXq++aV73GYz7feHhIZ4/M4l1iWd8=;
Received: from mail105.syd.optusnet.com.au ([211.29.132.249])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1j4BdC-007lUP-Ax
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 22:46:22 +0000
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
 [49.179.138.28])
 by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 2C6AA3A311C;
 Wed, 19 Feb 2020 09:46:11 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1j4Bd4-0003kz-H7; Wed, 19 Feb 2020 09:46:10 +1100
Date: Wed, 19 Feb 2020 09:46:10 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200218224610.GT10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-4-willy@infradead.org>
 <20200218050300.GI10776@dread.disaster.area>
 <20200218135618.GO7778@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218135618.GO7778@bombadil.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=W5xGqiek c=1 sm=1 tr=0
 a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
 a=7-415B0cAAAA:8 a=-669WvyOGAhHUzcTJR8A:9 a=CjuIK1q_8ugA:10
 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [211.29.132.249 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fromorbit.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4BdC-007lUP-Ax
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

On Tue, Feb 18, 2020 at 05:56:18AM -0800, Matthew Wilcox wrote:
> On Tue, Feb 18, 2020 at 04:03:00PM +1100, Dave Chinner wrote:
> > On Mon, Feb 17, 2020 at 10:45:44AM -0800, Matthew Wilcox wrote:
> > > +static void read_pages(struct readahead_control *rac, struct list_head *pages,
> > > +		gfp_t gfp)
> > >  {
> > > +	const struct address_space_operations *aops = rac->mapping->a_ops;
> > >  	struct blk_plug plug;
> > >  	unsigned page_idx;
> > 
> > Splitting out the aops rather than the mapping here just looks
> > weird, especially as you need the mapping later in the function.
> > Using aops doesn't even reduce the code side....
> 
> It does in subsequent patches ... I agree it looks a little weird here,
> but I think in the final form, it makes sense:

Ok. Perhaps just an additional commit comment to say "read_pages() is
changed to be aops centric as @rac abstracts away all other
implementation details by the end of the patchset."

> > > +			if (readahead_count(&rac))
> > > +				read_pages(&rac, &page_pool, gfp_mask);
> > > +			rac._nr_pages = 0;
> > 
> > Hmmm. Wondering ig it make sense to move the gfp_mask to the readahead
> > control structure - if we have to pass the gfp_mask down all the
> > way along side the rac, then I think it makes sense to do that...
> 
> So we end up removing it later on in this series, but I do wonder if
> it would make sense anyway.  By the end of the series, we still have
> this in iomap:
> 
>                 if (ctx->rac) /* same as readahead_gfp_mask */
>                         gfp |= __GFP_NORETRY | __GFP_NOWARN;
> 
> and we could get rid of that by passing gfp flags down in the rac.  On the
> other hand, I don't know why it doesn't just use readahead_gfp_mask()
> here anyway ... Christoph?

mapping->gfp_mask is awful. Is it a mask, or is it a valid set of
allocation flags? Or both?  Some callers to mapping_gfp_constraint()
uses it as a mask, some callers to mapping_gfp_constraint() use it
as base flags that context specific flags get masked out of,
readahead_gfp_mask() callers use it as the entire set of gfp flags
for allocation.

That whole API sucks - undocumented as to what it's suposed to do
and how it's supposed to be used. Hence it's difficult to use
correctly or understand whether it's being used correctly. And
reading callers only leads to more confusion and crazy code like in
do_mpage_readpage() where readahead returns a mask that are used as
base flags and normal reads return a masked set of base flags...

The iomap code is obviously correct when it comes to gfp flag
manipulation. We start with GFP_KERNEL context, then constrain it
via the mask held in mapping->gfp_mask, then if it's readahead we
allow the allocation to silently fail.

Simple to read and understand code, versus having weird code that
requires the reader to decipher an undocumented and inconsistent API
to understand how the gfp flags have been calculated and are valid.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
