Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AD7158F3D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Feb 2020 13:54:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j1V3i-0004To-Md; Tue, 11 Feb 2020 12:54:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j1V3h-0004Tb-ED
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Feb 2020 12:54:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+uQN30cS5Bj87iEEBzdOLx8lg9+i0ExEu8VOZjq8Ndo=; b=FpE7nzERDlD5kkcc5w4iPgcGto
 XmgfrRyQOIGkF8usbJ76qXJuMUrPCwl7SrONAQxwCtogKumUDi+IAC3YKfM6HB+LR3u6sgfTv9IKu
 gFRe4CoZLE7AlkgbvZNSscdCpyVg3zKu/XBfUDPf2JvIC828EOqHDHXnAwBQ/+D+4jeI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+uQN30cS5Bj87iEEBzdOLx8lg9+i0ExEu8VOZjq8Ndo=; b=et53wajcgINOnginWIYY9+n+N0
 XQKNkKTYbZetZBAQeAaNw+WEtZPcX6UK6I5ByIsfheiC0UYzykOuGEPpmVuBD3lmMbprQzlWTIndy
 ab/BAfTKw3o9aDEip6Xa4qhmQ+pAFMAi720LAHZCxp2G5U/e+Mm+H5xk6i5jQSXHlU7w=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j1V3g-000TkO-5K
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Feb 2020 12:54:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+uQN30cS5Bj87iEEBzdOLx8lg9+i0ExEu8VOZjq8Ndo=; b=eWC7poTUmbgHCYbKut5tUcDZwL
 w3YYTT854/6orjDXWt0o8myOrLaqYxmNildHwtqHwB9P6sAmRSzUVkC2ndTa5MBo6vPhEIM38iBQg
 3QFH9rbgbTMx5jUAauOSubj91u3I4QqJCftUeJ3u2BRZFY7uw1LRQwqgp3/dZBByXH8F5OzZAb0t+
 miBihdnvmVJGXqnRBr1rG3atRoSZFunPwyyK3rI6Tg1RqDm7wVtET7WbIVm0KlJr9sAYInPEKF3Lu
 GTYeC4TiyWPK4e73vfdDf6T1j5MFZMYQQejC42VttS5bt+wx+jfOtOIGuI60RBaTCQF1YD4hRLaX6
 1eYOefYA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j1V3O-0006U6-1C; Tue, 11 Feb 2020 12:54:14 +0000
Date: Tue, 11 Feb 2020 04:54:13 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200211125413.GU8731@bombadil.infradead.org>
References: <20200211010348.6872-1-willy@infradead.org>
 <20200211010348.6872-5-willy@infradead.org>
 <20200211045230.GD10776@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211045230.GD10776@dread.disaster.area>
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
X-Headers-End: 1j1V3g-000TkO-5K
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

On Tue, Feb 11, 2020 at 03:52:30PM +1100, Dave Chinner wrote:
> > +struct readahead_control {
> > +	struct file *file;
> > +	struct address_space *mapping;
> > +/* private: use the readahead_* accessors instead */
> > +	pgoff_t start;
> > +	unsigned int nr_pages;
> > +	unsigned int batch_count;
> > +};
> > +
> > +static inline struct page *readahead_page(struct readahead_control *rac)
> > +{
> > +	struct page *page;
> > +
> > +	if (!rac->nr_pages)
> > +		return NULL;
> > +
> > +	page = xa_load(&rac->mapping->i_pages, rac->start);
> > +	VM_BUG_ON_PAGE(!PageLocked(page), page);
> > +	rac->batch_count = hpage_nr_pages(page);
> > +	rac->start += rac->batch_count;
> 
> There's no mention of large page support in the patch description
> and I don't recall this sort of large page batching in previous
> iterations.
> 
> This seems like new functionality to me, not directly related to
> the initial ->readahead API change? What have I missed?

I had a crisis of confidence when I was working on this -- the loop
originally looked like this:

#define readahead_for_each(rac, page)                                   \
        for (; (page = readahead_page(rac)); rac->nr_pages--)

and then I started thinking about what I'd need to do to support large
pages, and that turned into

#define readahead_for_each(rac, page)                                   \
        for (; (page = readahead_page(rac));				\
		rac->nr_pages -= hpage_nr_pages(page))

but I realised that was potentially a use-after-free because 'page' has
certainly had put_page() called on it by then.  I had a brief period
where I looked at moving put_page() away from being the filesystem's
responsibility and into the iterator, but that would introduce more
changes into the patchset, as well as causing problems for filesystems
that want to break out of the loop.

By this point, I was also looking at the readahead_for_each_batch()
iterator that btrfs uses, and so we have the batch count anyway, and we
might as well use it to store the number of subpages of the large page.
And so it became easier to just put the whole ball of wax into the initial
patch set, rather than introduce the iterator now and then fix it up in
the patch set that I'm basing on this.

So yes, there's a certain amount of excess functionality in this patch
set ... I can remove it for the next release.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
