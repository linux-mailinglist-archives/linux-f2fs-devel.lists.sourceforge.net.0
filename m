Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9202D16277D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2020 14:56:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j43MU-0001LN-Lv; Tue, 18 Feb 2020 13:56:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j43MT-0001LG-JN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 13:56:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QWm+MsHkSRgQJK1eFxqCcWrvQ90y26mjyjBOZ11Iwkk=; b=aAr6YwfP/exlyt41JbgsbPR4Av
 Xc3+Mnt3qwVAcRBv9nvKXSeyo2cxzjlEazJIbGLbCiqoZBphmTBMUGVR4fxGAo+dZM1twvdhmhPr+
 X4l/yRXutD8ls0KhlxaXNmsNX+Ih81CIdUKbRjQStwlcrTXPZ532roofxK5yS3JZGzes=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QWm+MsHkSRgQJK1eFxqCcWrvQ90y26mjyjBOZ11Iwkk=; b=gcSd8XkKDvpSVn0nl1R63FA6g6
 0XdrK4XpKnLb0C5zEJ2Kbf1XfHlJDeKy105mS4OglAMxso0G/f1HTeOXZrV19A7II1hsEO+efHKHn
 9OQ74hrQh7IiolYeP/vPGQ7/BwbXyNjo3KC2zB017VO2eM1N+EZuTCgN3mgccMkBfTSY=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j43MS-007Msf-C2
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 13:56:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=QWm+MsHkSRgQJK1eFxqCcWrvQ90y26mjyjBOZ11Iwkk=; b=jb2+luyxr+xSioYyaBNa3dAEcG
 HSkNE/u4FRJRlH9iJvfMy5PCbL6cVJNDiZN1T+0cd1NFPBhswNdJGqv4MI+l2rK+i+tYpDmuT8Bqa
 v4kTQEGSXMc95ruYcJyKvonnTr8/VCdmBG1QzESKMSk9lJUywki+bnjFt/A2gjwlx0PFneQN6p+Z8
 w8PFnDecZukQL71k/MfBJQ4M0XvKWkJLm4emA2PDAS90/6wmUKCMv8DC2uYB8tZIweEjrWjDvK1i9
 ARqcVs4oiBQgZVdD9JO7vnPU+QZg8rs4gj+Y0mapS7yUw3ZxNuiOhm4hApWihKBeAmYq71FGdgE8W
 1g9mrcqA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j43MI-0000Q8-5H; Tue, 18 Feb 2020 13:56:18 +0000
Date: Tue, 18 Feb 2020 05:56:18 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200218135618.GO7778@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-4-willy@infradead.org>
 <20200218050300.GI10776@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218050300.GI10776@dread.disaster.area>
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
X-Headers-End: 1j43MS-007Msf-C2
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

On Tue, Feb 18, 2020 at 04:03:00PM +1100, Dave Chinner wrote:
> On Mon, Feb 17, 2020 at 10:45:44AM -0800, Matthew Wilcox wrote:
> > +static void read_pages(struct readahead_control *rac, struct list_head *pages,
> > +		gfp_t gfp)
> >  {
> > +	const struct address_space_operations *aops = rac->mapping->a_ops;
> >  	struct blk_plug plug;
> >  	unsigned page_idx;
> 
> Splitting out the aops rather than the mapping here just looks
> weird, especially as you need the mapping later in the function.
> Using aops doesn't even reduce the code side....

It does in subsequent patches ... I agree it looks a little weird here,
but I think in the final form, it makes sense:

static void read_pages(struct readahead_control *rac, struct list_head *pages)
{
        const struct address_space_operations *aops = rac->mapping->a_ops;
        struct page *page;
        struct blk_plug plug;

        blk_start_plug(&plug);

        if (aops->readahead) {
                aops->readahead(rac);
                readahead_for_each(rac, page) {
                        unlock_page(page);
                        put_page(page);
                }
        } else if (aops->readpages) {
                aops->readpages(rac->file, rac->mapping, pages,
                                readahead_count(rac));
                /* Clean up the remaining pages */
                put_pages_list(pages);
        } else {
                readahead_for_each(rac, page) {
                        aops->readpage(rac->file, page);
                        put_page(page);
                }
        }

        blk_finish_plug(&plug);
}

It'll look even better once ->readpages goes away.

> > @@ -155,9 +158,13 @@ void __do_page_cache_readahead(struct address_space *mapping,
> >  	unsigned long end_index;	/* The last page we want to read */
> >  	LIST_HEAD(page_pool);
> >  	int page_idx;
> > -	unsigned int nr_pages = 0;
> >  	loff_t isize = i_size_read(inode);
> >  	gfp_t gfp_mask = readahead_gfp_mask(mapping);
> > +	struct readahead_control rac = {
> > +		.mapping = mapping,
> > +		.file = filp,
> > +		._nr_pages = 0,
> > +	};
> 
> No need to initialise _nr_pages to zero, leaving it out will do the
> same thing.

Yes, it does, but I wanted to make it explicit here.

> > +			if (readahead_count(&rac))
> > +				read_pages(&rac, &page_pool, gfp_mask);
> > +			rac._nr_pages = 0;
> 
> Hmmm. Wondering ig it make sense to move the gfp_mask to the readahead
> control structure - if we have to pass the gfp_mask down all the
> way along side the rac, then I think it makes sense to do that...

So we end up removing it later on in this series, but I do wonder if
it would make sense anyway.  By the end of the series, we still have
this in iomap:

                if (ctx->rac) /* same as readahead_gfp_mask */
                        gfp |= __GFP_NORETRY | __GFP_NOWARN;

and we could get rid of that by passing gfp flags down in the rac.  On the
other hand, I don't know why it doesn't just use readahead_gfp_mask()
here anyway ... Christoph?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
