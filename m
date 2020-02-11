Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D57A1159A3F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Feb 2020 21:08:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j1bpo-0008K6-2S; Tue, 11 Feb 2020 20:08:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1j1bpn-0008Jw-C6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Feb 2020 20:08:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xI5wPlQAb6RYd+Bo7ZTjb9KE+NndnBDQlJMhAtCInEE=; b=G4Mf1OY0AgcdxaOe5w3Hbjgfj4
 DcYsVLL3i8JT5PTBKbS1X6W9UdRMEDgGX3BQyGvJkJanzhvYSA2KL6fOfbMunC3CfZ+WlQJfg+p+9
 NxBUP/mnEu66zqOj/3rjK01O595rHl9WbwB3XM3GB5e5SjTX+5nA+LDQTlUY22Jol9eE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xI5wPlQAb6RYd+Bo7ZTjb9KE+NndnBDQlJMhAtCInEE=; b=SVV6mrGPDxVRTPPDtHyorMJdmT
 lDB9/gL3KF+MMJttn1CnVW4WbI5EfSs2N1S8e8RDoAPLjnW2nbW3rYVklgManCb+lVshv/3fXectE
 7bbE4Ez6fG4SpUecC2zUoy5uJS7SUbor9U7b7yq3Pmf6iNH9hbEJpLoOe0FhI/PFEL40=;
Received: from mail105.syd.optusnet.com.au ([211.29.132.249])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1j1bpl-000nk2-5O
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Feb 2020 20:08:39 +0000
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
 [49.179.138.28])
 by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 2D0293A3899;
 Wed, 12 Feb 2020 07:08:28 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1j1bpa-0002l0-DL; Wed, 12 Feb 2020 07:08:26 +1100
Date: Wed, 12 Feb 2020 07:08:26 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200211200826.GK10776@dread.disaster.area>
References: <20200211010348.6872-1-willy@infradead.org>
 <20200211010348.6872-5-willy@infradead.org>
 <20200211045230.GD10776@dread.disaster.area>
 <20200211125413.GU8731@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211125413.GU8731@bombadil.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=X6os11be c=1 sm=1 tr=0
 a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
 a=7-415B0cAAAA:8 a=EnYlyWvjhy6VBD_eMqkA:9 a=CdacwtsPoHkD4rhW:21
 a=vlsg44Ume0T2P6Xz:21 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fromorbit.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j1bpl-000nk2-5O
Subject: Re: [f2fs-dev] [PATCH v5 04/13] mm: Add readahead address space
 operation
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

On Tue, Feb 11, 2020 at 04:54:13AM -0800, Matthew Wilcox wrote:
> On Tue, Feb 11, 2020 at 03:52:30PM +1100, Dave Chinner wrote:
> > > +struct readahead_control {
> > > +	struct file *file;
> > > +	struct address_space *mapping;
> > > +/* private: use the readahead_* accessors instead */
> > > +	pgoff_t start;
> > > +	unsigned int nr_pages;
> > > +	unsigned int batch_count;
> > > +};
> > > +
> > > +static inline struct page *readahead_page(struct readahead_control *rac)
> > > +{
> > > +	struct page *page;
> > > +
> > > +	if (!rac->nr_pages)
> > > +		return NULL;
> > > +
> > > +	page = xa_load(&rac->mapping->i_pages, rac->start);
> > > +	VM_BUG_ON_PAGE(!PageLocked(page), page);
> > > +	rac->batch_count = hpage_nr_pages(page);
> > > +	rac->start += rac->batch_count;
> > 
> > There's no mention of large page support in the patch description
> > and I don't recall this sort of large page batching in previous
> > iterations.
> > 
> > This seems like new functionality to me, not directly related to
> > the initial ->readahead API change? What have I missed?
> 
> I had a crisis of confidence when I was working on this -- the loop
> originally looked like this:
> 
> #define readahead_for_each(rac, page)                                   \
>         for (; (page = readahead_page(rac)); rac->nr_pages--)
> 
> and then I started thinking about what I'd need to do to support large
> pages, and that turned into
> 
> #define readahead_for_each(rac, page)                                   \
>         for (; (page = readahead_page(rac));				\
> 		rac->nr_pages -= hpage_nr_pages(page))
> 
> but I realised that was potentially a use-after-free because 'page' has
> certainly had put_page() called on it by then.  I had a brief period
> where I looked at moving put_page() away from being the filesystem's
> responsibility and into the iterator, but that would introduce more
> changes into the patchset, as well as causing problems for filesystems
> that want to break out of the loop.
> 
> By this point, I was also looking at the readahead_for_each_batch()
> iterator that btrfs uses, and so we have the batch count anyway, and we
> might as well use it to store the number of subpages of the large page.
> And so it became easier to just put the whole ball of wax into the initial
> patch set, rather than introduce the iterator now and then fix it up in
> the patch set that I'm basing on this.
> 
> So yes, there's a certain amount of excess functionality in this patch
> set ... I can remove it for the next release.

I'd say "Just document it" as that was the main reason I noticed it.
Or perhaps add the batching function as a stand-alone patch so it's
clear that the batch interface solves two problems at once - large
pages and the btrfs page batching implementation...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
