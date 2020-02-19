Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8AA163904
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 02:08:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4DrA-0004IS-Ou; Wed, 19 Feb 2020 01:08:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1j4Dr8-0004I8-Hz
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 01:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=69yte0cxiQDQ5noC/pdwHvSjKTbmWJobQZj4QdlOwRI=; b=EAMDc7fANfsHnL8OaPvkhuXKlO
 VzkONewhHv5Um23f0QeRMR68z5AmgCDFkOPLAojgpK9JfWdLHS9gmpMGc18hbsTg9XX+t3meJoWTN
 oOP76qh5otS4d1bjjWg5j9yX5Y1Zr/ofdb6ntqvhuKYqsHE0Hg4sXVIpZnc99kNr72AY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=69yte0cxiQDQ5noC/pdwHvSjKTbmWJobQZj4QdlOwRI=; b=aYoWWfbktXpOwlEfJYMqdL4hNM
 K2cWiPWsMMxmps2WsOVedjrPwzwwLQaj85e4nwEX2xf4TOS3tknUeHp26SWJhETHcYxlVV71W8yQM
 AzHBq5Qib/zdSnjdCC9dV3iQM01oLqrgIIPkIiV4bq9qR2bPI+sudsomOnqKM2Mt68so=;
Received: from mail105.syd.optusnet.com.au ([211.29.132.249])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1j4Dr6-007pku-Ni
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 01:08:50 +0000
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
 [49.179.138.28])
 by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 6590F3A3346;
 Wed, 19 Feb 2020 12:08:42 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1j4Dqy-0004dZ-Qv; Wed, 19 Feb 2020 12:08:40 +1100
Date: Wed, 19 Feb 2020 12:08:40 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200219010840.GX10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-16-willy@infradead.org>
 <20200218063110.GO10776@dread.disaster.area>
 <20200218195404.GD24185@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218195404.GD24185@bombadil.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=W5xGqiek c=1 sm=1 tr=0
 a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
 a=JfrnYn6hAAAA:8 a=7-415B0cAAAA:8 a=pXOkKLco0wbfc50Nqe8A:9
 a=VBWjYGV6Kxsh7Hhu:21 a=T0X9MdoumZd6j53S:21 a=CjuIK1q_8ugA:10
 a=1CNFftbPRP8L7MoqJWF3:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [211.29.132.249 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4Dr6-007pku-Ni
Subject: Re: [f2fs-dev] [PATCH v6 09/19] mm: Add page_cache_readahead_limit
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

On Tue, Feb 18, 2020 at 11:54:04AM -0800, Matthew Wilcox wrote:
> On Tue, Feb 18, 2020 at 05:31:10PM +1100, Dave Chinner wrote:
> > On Mon, Feb 17, 2020 at 10:45:56AM -0800, Matthew Wilcox wrote:
> > > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > > 
> > > ext4 and f2fs have duplicated the guts of the readahead code so
> > > they can read past i_size.  Instead, separate out the guts of the
> > > readahead code so they can call it directly.
> > 
> > Gross and nasty (hosting non-stale data beyond EOF in the page
> > cache, that is).
> 
> I thought you meant sneaking changes into the VFS (that were rejected) by
> copying VFS code and modifying it ...

Well, now that you mention it... :P

> > > +/**
> > > + * page_cache_readahead_limit - Start readahead beyond a file's i_size.
> > > + * @mapping: File address space.
> > > + * @file: This instance of the open file; used for authentication.
> > > + * @offset: First page index to read.
> > > + * @end_index: The maximum page index to read.
> > > + * @nr_to_read: The number of pages to read.
> > > + * @lookahead_size: Where to start the next readahead.
> > > + *
> > > + * This function is for filesystems to call when they want to start
> > > + * readahead potentially beyond a file's stated i_size.  If you want
> > > + * to start readahead on a normal file, you probably want to call
> > > + * page_cache_async_readahead() or page_cache_sync_readahead() instead.
> > > + *
> > > + * Context: File is referenced by caller.  Mutexes may be held by caller.
> > > + * May sleep, but will not reenter filesystem to reclaim memory.
> > >   */
> > > -void __do_page_cache_readahead(struct address_space *mapping,
> > > -		struct file *filp, pgoff_t offset, unsigned long nr_to_read,
> > > -		unsigned long lookahead_size)
> > > +void page_cache_readahead_limit(struct address_space *mapping,
> > 
> > ... I don't think the function name conveys it's purpose. It's
> > really a ranged readahead that ignores where i_size lies. i.e
> > 
> > 	page_cache_readahead_range(mapping, start, end, nr_to_read)
> > 
> > seems like a better API to me, and then you can drop the "start
> > readahead beyond i_size" comments and replace it with "Range is not
> > limited by the inode's i_size and hence can be used to read data
> > stored beyond EOF into the page cache."
> 
> I'm concerned that calling it 'range' implies "I want to read between
> start and end" rather than "I want to read nr_to_read at start, oh but
> don't go past end".
> 
> Maybe the right way to do this is have the three callers cap nr_to_read.
> Well, the one caller ... after all, f2fs and ext4 have no desire to
> cap the length.  Then we can call it page_cache_readahead_exceed() or
> page_cache_readahead_dangerous() or something else like that to make it
> clear that you shouldn't be calling it.

Fair point.

And in reading this, it occurred to me that what we are enabling is
an "out of bounds" readahead function. so
page_cache_readahead_OOB() or *_unbounded() might be a better name....

>   * Like add_to_page_cache_locked, but used to add newly allocated pages:
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 9dd431fa16c9..cad26287ad8b 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -142,45 +142,43 @@ static void read_pages(struct readahead_control *rac, struct list_head *pages)
>  	blk_finish_plug(&plug);
>  }
>  
> -/*
> - * __do_page_cache_readahead() actually reads a chunk of disk.  It allocates
> - * the pages first, then submits them for I/O. This avoids the very bad
> - * behaviour which would occur if page allocations are causing VM writeback.
> - * We really don't want to intermingle reads and writes like that.
> +/**
> + * page_cache_readahead_exceed - Start unchecked readahead.
> + * @mapping: File address space.
> + * @file: This instance of the open file; used for authentication.
> + * @index: First page index to read.
> + * @nr_to_read: The number of pages to read.
> + * @lookahead_size: Where to start the next readahead.
> + *
> + * This function is for filesystems to call when they want to start
> + * readahead beyond a file's stated i_size.  This is almost certainly
> + * not the function you want to call.  Use page_cache_async_readahead()
> + * or page_cache_sync_readahead() instead.
> + *
> + * Context: File is referenced by caller.  Mutexes may be held by caller.
> + * May sleep, but will not reenter filesystem to reclaim memory.

Yup, looks much better.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
