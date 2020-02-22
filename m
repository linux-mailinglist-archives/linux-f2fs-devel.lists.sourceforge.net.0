Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C15F168BE4
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Feb 2020 02:55:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j5K0Q-0003DT-06; Sat, 22 Feb 2020 01:54:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j5K0P-0003DJ-1k
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Feb 2020 01:54:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3z9OxyAbSn1SdH2kkHfL31c9BGogsy9OLW6r1AiETwA=; b=RaGdhcI5W6NxuS8rHzHxum7Qht
 md69uUY+LWiLK2eArC04XjM0rzc0+krkrtu0HyHfbCka/tgsSn1a1PpM+vnpaMJDyRr9CHqG8vyDd
 qquoLloripexd3Gdu83EBmQn7qLppn7FeRw5jXdkUf27QDl1OllcGWXn/y6o8231P8gI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3z9OxyAbSn1SdH2kkHfL31c9BGogsy9OLW6r1AiETwA=; b=Mp+ifEe5zbL3bZKtdJ/EnNUfBq
 0fManHJcWks/ey2rRuZ1DqyZ+aEnjRynyvydP4X6J3gyP48VM+637rKqIYmddsPvk10UHLBmF6lfF
 2A0A6tkghOiplvQqVQ5njMmm3FY7+UEx8zdXxfA78Z7akbcIFEvzDA7NKbvZ9Dngjhxc=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j5K0L-003hjU-ML
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Feb 2020 01:54:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3z9OxyAbSn1SdH2kkHfL31c9BGogsy9OLW6r1AiETwA=; b=okpmlLDUcn2WJSLgCMGAQ/y3ea
 wUx7sYNdOzqYPRD79lRmEtjSkrPrcJfVsD9xPGx/OEj4opTESHh6CYwZzOmuJEsyumYBwdnBSPv7g
 16GkwPCUQhbT1ezTB0jognGyz8oIm6SUil1aybwZf5s5+OhrDRLxuYqnAi5mVLeaU2RxOwOxA/zNs
 KYbdl3XUppUek8iRi+5uW/I3hpcLPqxH+AmdzbPTNFg7qp4grnRwvEiCEJmAo3/C8soB6NZZdaPwo
 6XP9UHgU7AUBNbe3o0CA3AZUkjmFriX3wxHNG3GcDmgcTse+CtXbmuDxLU2MsixE0H2J7aWT8SIfZ
 PnUpa2Fw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j5K03-0000tY-FT; Sat, 22 Feb 2020 01:54:35 +0000
Date: Fri, 21 Feb 2020 17:54:35 -0800
From: Matthew Wilcox <willy@infradead.org>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20200222015435.GH24185@bombadil.infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-22-willy@infradead.org>
 <20200222004425.GG9506@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200222004425.GG9506@magnolia>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j5K0L-003hjU-ML
Subject: Re: [f2fs-dev] [PATCH v7 21/24] iomap: Restructure
 iomap_readpages_actor
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

On Fri, Feb 21, 2020 at 04:44:25PM -0800, Darrick J. Wong wrote:
> On Wed, Feb 19, 2020 at 01:01:00PM -0800, Matthew Wilcox wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > 
> > By putting the 'have we reached the end of the page' condition at the end
> > of the loop instead of the beginning, we can remove the 'submit the last
> > page' code from iomap_readpages().  Also check that iomap_readpage_actor()
> > didn't return 0, which would lead to an endless loop.
> > 
> > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > ---
> >  fs/iomap/buffered-io.c | 32 ++++++++++++++++++--------------
> >  1 file changed, 18 insertions(+), 14 deletions(-)
> > 
> > diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> > index cb3511eb152a..31899e6cb0f8 100644
> > --- a/fs/iomap/buffered-io.c
> > +++ b/fs/iomap/buffered-io.c
> > @@ -400,15 +400,9 @@ iomap_readpages_actor(struct inode *inode, loff_t pos, loff_t length,
> >  		void *data, struct iomap *iomap, struct iomap *srcmap)
> >  {
> >  	struct iomap_readpage_ctx *ctx = data;
> > -	loff_t done, ret;
> > -
> > -	for (done = 0; done < length; done += ret) {
> > -		if (ctx->cur_page && offset_in_page(pos + done) == 0) {
> > -			if (!ctx->cur_page_in_bio)
> > -				unlock_page(ctx->cur_page);
> > -			put_page(ctx->cur_page);
> > -			ctx->cur_page = NULL;
> > -		}
> > +	loff_t ret, done = 0;
> > +
> > +	while (done < length) {
> >  		if (!ctx->cur_page) {
> >  			ctx->cur_page = iomap_next_page(inode, ctx->pages,
> >  					pos, length, &done);
> > @@ -418,6 +412,20 @@ iomap_readpages_actor(struct inode *inode, loff_t pos, loff_t length,
> >  		}
> >  		ret = iomap_readpage_actor(inode, pos + done, length - done,
> >  				ctx, iomap, srcmap);
> > +		done += ret;
> > +
> > +		/* Keep working on a partial page */
> > +		if (ret && offset_in_page(pos + done))
> > +			continue;
> > +
> > +		if (!ctx->cur_page_in_bio)
> > +			unlock_page(ctx->cur_page);
> > +		put_page(ctx->cur_page);
> > +		ctx->cur_page = NULL;
> > +
> > +		/* Don't loop forever if we made no progress */
> > +		if (WARN_ON(!ret))
> > +			break;
> >  	}
> >  
> >  	return done;
> > @@ -451,11 +459,7 @@ iomap_readpages(struct address_space *mapping, struct list_head *pages,
> >  done:
> >  	if (ctx.bio)
> >  		submit_bio(ctx.bio);
> > -	if (ctx.cur_page) {
> > -		if (!ctx.cur_page_in_bio)
> > -			unlock_page(ctx.cur_page);
> > -		put_page(ctx.cur_page);
> > -	}
> > +	BUG_ON(ctx.cur_page);
> 
> Whoah, is the system totally unrecoverably hosed at this point?
> 
> I get that this /shouldn't/ happen, but should we somehow end up with a
> page here, are we unable either to release it or even just leak it?  I'd
> have thought a WARN_ON would be just fine here.

If we do find a page here, we don't actually know what to do with it.
It might be (currently) locked, it might have the wrong refcount.
Whatever is going on, it's probably better that we stop everything right
here rather than allow things to go further and possibly present bad
data to the application.  I mean, we could even be leaking the previous
contents of this page to userspace.  Or maybe the future contents of a
page which shouldn't be in the page cache any more, but userspace gets
a mapping to it.

I'm not enthusiastic about putting in some code here to try to handle
a "can't happen" case, since it's never going to be tested, and might
end up causing more problems than it tries to solve.  Let's just stop.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
