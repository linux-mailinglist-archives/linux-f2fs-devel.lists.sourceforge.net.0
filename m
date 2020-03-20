Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2ED18D779
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Mar 2020 19:40:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jFMZl-00005C-RZ; Fri, 20 Mar 2020 18:40:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jFMZf-0008W5-W2
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 18:40:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZgTQhl0s/REoLqVt6I6qU0MRaFmGJ3vbsDscDmYcgqo=; b=LZo0hBPw7oyAFfccCEvkfhQ2Sq
 V09RP5BPFgJFQnnKYR41PO6yJtj9LTcj7B4SoDtk88aXznqowjnpNcADCLWxH2jsZ/4EjFVD0jdZi
 0quSmKFfQATyMNJ87hnduyUsftcSjAhocY6rjCZyhxgRlQLQXFTBTF9Z/hUYn6jvYqLs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZgTQhl0s/REoLqVt6I6qU0MRaFmGJ3vbsDscDmYcgqo=; b=MGTDnlUxl/q7hNnPKd56ODCNKP
 6EY5JTH8nfwlC+RG9ODJuUzZR1RA73T88GXMjLcwFWevf3OWC3T6pD50OSnWuKcuvSP9E2n8POu0d
 sqwrd1cS6dusOeAylx/yv8yeAea5+fl3cK+q+IkhkhFE/LnxJG+lCM7dojTE+7t/srJI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jFMZe-00FYGr-45
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 18:40:51 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 275D420739;
 Fri, 20 Mar 2020 18:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584729643;
 bh=0lySpfIbLYVkl86wERt9XwrjnUjq7J+z8XZeuge/+7s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wi2vuW5Igyu46y5Wx05mkvW8a/VLckiN7s/9GNIOdxM9U7yQM1pyY2njL/QMwkPan
 KWQEARrCqs16OuxD5B6Kg1R9790qkHmt4v/O/PZizCk3+z+HWCmu6og3Em53508k9B
 iW3Hml7aQ3jDLnTGNz1ZqdOb+OAH89RjMJ2Qz1nU=
Date: Fri, 20 Mar 2020 11:40:41 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200320184041.GG851@sol.localdomain>
References: <20200320142231.2402-1-willy@infradead.org>
 <20200320142231.2402-21-willy@infradead.org>
 <20200320173734.GD851@sol.localdomain>
 <20200320174848.GC4971@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320174848.GC4971@bombadil.infradead.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jFMZe-00FYGr-45
Subject: Re: [f2fs-dev] [PATCH v9 20/25] ext4: Convert from readpages to
 readahead
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
Cc: cluster-devel@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 William Kucharski <william.kucharski@oracle.com>, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Mar 20, 2020 at 10:48:48AM -0700, Matthew Wilcox wrote:
> On Fri, Mar 20, 2020 at 10:37:34AM -0700, Eric Biggers wrote:
> > On Fri, Mar 20, 2020 at 07:22:26AM -0700, Matthew Wilcox wrote:
> > > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > > 
> > > Use the new readahead operation in ext4
> > > 
> > > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > > Reviewed-by: William Kucharski <william.kucharski@oracle.com>
> > > ---
> > >  fs/ext4/ext4.h     |  3 +--
> > >  fs/ext4/inode.c    | 21 +++++++++------------
> > >  fs/ext4/readpage.c | 22 ++++++++--------------
> > >  3 files changed, 18 insertions(+), 28 deletions(-)
> > > 
> > 
> > Reviewed-by: Eric Biggers <ebiggers@google.com>
> > 
> > > +		if (rac) {
> > > +			page = readahead_page(rac);
> > >  			prefetchw(&page->flags);
> > > -			list_del(&page->lru);
> > > -			if (add_to_page_cache_lru(page, mapping, page->index,
> > > -				  readahead_gfp_mask(mapping)))
> > > -				goto next_page;
> > >  		}
> > 
> > Maybe the prefetchw(&page->flags) should be included in readahead_page()?
> > Most of the callers do it.
> 
> I did notice that a lot of callers do that.  I wonder whether it (still)
> helps or whether it's just cargo-cult programming.  It can't possibly
> have helped before because we did list_del(&page->lru) as the very next
> instruction after prefetchw(), and they're in the same cacheline.  It'd
> be interesting to take it out and see what happens to performance.

Yeah, it does look like the list_del() made the prefetchw() useless, so it
should just be removed.  The prefetchw() dates all the way back to
mpage_readpages() being added in 2002, but even then the list_del() was
immediately afterwards, and 'flags' and 'lru' were in the same cache line in
'struct page' even then (assuming at least a 32-byte cache line size), so...

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
