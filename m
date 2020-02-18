Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEA5162789
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2020 14:57:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j43Ni-0003RU-2w; Tue, 18 Feb 2020 13:57:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j43Ng-0003RM-U1
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 13:57:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jx8+RumY/EwaN3Vd/61tpY+Z1W663ztwfvZQrgDHUFQ=; b=ivwalYx4V0ZbiDqxJzWlk8xCqv
 tOpbYJhYbFw3ntlTsBM25Y9ywPJ7efnGRzWmd8UgtwcTQT8oZj4RHJRiSKj3m4zPkW6uA4ZCanHVa
 Qhf6GOszkdhLAi6CzI8kwsYhOgwzm6ZttbDVS8XQCPr6DCSS+D8iwy2IrSkYwhB772mo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jx8+RumY/EwaN3Vd/61tpY+Z1W663ztwfvZQrgDHUFQ=; b=QuYgQnL4gNZrW/2jVSIJuI6Gku
 Nge+1krrRAdxYErqJ/bCQCSTiGcUXJb4NhGXCChIA5/AfQMsuL/yNBp7rxLxj42RuAZMqygVu7vXY
 33hhFPkUixixnglyJah5HEcUjYEfMU5J5+HWVMylHXPnRvew4o7HWzz3Sj2wvKt0e54A=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j43Nf-007MvL-SQ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 13:57:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Jx8+RumY/EwaN3Vd/61tpY+Z1W663ztwfvZQrgDHUFQ=; b=rGfMPaIHAb3P6XbMGIvcdO+8rY
 sBmTkGPBJklVWdfNXRDuSKEjSq0AFVxR4igsRCNRWkLTSdZaPuKfDPGA85IxvS8KIcx7DFnTNZV6W
 BdpAM1dpoQIHKgx4dqZN2aRI0LWXjx8nIAWXYI687doAh4ldNBkXEkTVqekaKNY0CyubyWbqxE6M5
 Xg7Lryv3cm9nrFO31P1UJNHNA7wxuxRW2EtO7eKe5YABbDbdcnHZkGrigQTKXbiHgLY2umxIsSqvI
 Ual5Uy7fsYoF2dnMFCLJNX+0G4LlqI7WSviwe0Pg1FuWAxDtAWX90MWgUi414drJd5pYulG3q7dzP
 HhOcKxhQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j43NY-0000gx-Gn; Tue, 18 Feb 2020 13:57:36 +0000
Date: Tue, 18 Feb 2020 05:57:36 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200218135736.GP7778@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-5-willy@infradead.org>
 <20200218050824.GJ10776@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218050824.GJ10776@dread.disaster.area>
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
X-Headers-End: 1j43Nf-007MvL-SQ
Subject: Re: [f2fs-dev] [PATCH v6 04/19] mm: Rearrange readahead loop
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

On Tue, Feb 18, 2020 at 04:08:24PM +1100, Dave Chinner wrote:
> On Mon, Feb 17, 2020 at 10:45:45AM -0800, Matthew Wilcox wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > 
> > Move the declaration of 'page' to inside the loop and move the 'kick
> > off a fresh batch' code to the end of the function for easier use in
> > subsequent patches.
> 
> Stale? the "kick off" code is moved to the tail of the loop, not the
> end of the function.

Braino; I meant to write end of the loop.

> > @@ -183,14 +183,14 @@ void __do_page_cache_readahead(struct address_space *mapping,
> >  		page = xa_load(&mapping->i_pages, page_offset);
> >  		if (page && !xa_is_value(page)) {
> >  			/*
> > -			 * Page already present?  Kick off the current batch of
> > -			 * contiguous pages before continuing with the next
> > -			 * batch.
> > +			 * Page already present?  Kick off the current batch
> > +			 * of contiguous pages before continuing with the
> > +			 * next batch.  This page may be the one we would
> > +			 * have intended to mark as Readahead, but we don't
> > +			 * have a stable reference to this page, and it's
> > +			 * not worth getting one just for that.
> >  			 */
> > -			if (readahead_count(&rac))
> > -				read_pages(&rac, &page_pool, gfp_mask);
> > -			rac._nr_pages = 0;
> > -			continue;
> > +			goto read;
> >  		}
> >  
> >  		page = __page_cache_alloc(gfp_mask);
> > @@ -201,6 +201,11 @@ void __do_page_cache_readahead(struct address_space *mapping,
> >  		if (page_idx == nr_to_read - lookahead_size)
> >  			SetPageReadahead(page);
> >  		rac._nr_pages++;
> > +		continue;
> > +read:
> > +		if (readahead_count(&rac))
> > +			read_pages(&rac, &page_pool, gfp_mask);
> > +		rac._nr_pages = 0;
> >  	}
> 
> Also, why? This adds a goto from branched code that continues, then
> adds a continue so the unbranched code doesn't execute the code the
> goto jumps to. In absence of any explanation, this isn't an
> improvement and doesn't make any sense...

I thought I was explaining it ... "for easier use in subsequent patches".


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
