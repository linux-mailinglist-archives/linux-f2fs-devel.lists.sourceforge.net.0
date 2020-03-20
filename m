Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7042E18D69A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Mar 2020 19:11:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jFM7U-0004JC-1N; Fri, 20 Mar 2020 18:11:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jFM7S-0004It-Di
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 18:11:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p6kUQaVzyG/7aafQEj2oYoGKarn6agZvQF5qHrKX8Tc=; b=P9egvS9jv/F5XmNU/V40bPt7Ew
 zx2y0pYIcPjVyTdJQtsFQjhcVpyG3DHu+iefCFnLg/J2iGPbChHc6tnw4IfP8NEu821UJ0hhPirKJ
 hs1PGCIt35TC/SoKKS7jqeynCkbFqi7on5Tn8gSIZT+L6ZJeksUzq9atxVYglhl6Q2YQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p6kUQaVzyG/7aafQEj2oYoGKarn6agZvQF5qHrKX8Tc=; b=DLhN3u6NyOCfoMP9z+GYJoBPiF
 y1Vs6ZPagM2bKJaThXTqy8DQ2qmPy8HG/RPPPk8zvyvtHDrw1zM2Zvj7Xz/6ohga0u4b5/kuFisyC
 UAr1i3hyyMEiovMh8oKaMgKNxOiPD6buURA0hx9iOedvbwsGyxQZzmMhmc39JsOl4S64=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jFM7Q-001bHA-97
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 18:11:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=p6kUQaVzyG/7aafQEj2oYoGKarn6agZvQF5qHrKX8Tc=; b=eyNztVgX76i16/jeYqqPpZu4sX
 sXc8vs25jMw4vVAYXjoA8DgM2uzIMN5yBWkGawjo5WX9KQRuVqhyOMcR+1OXjTrnmUOvKFLlajWTh
 C/zG1s50fN4WqpS6HehSEJni5oQ1WzUhIAStAK+kmIlg6EMycQupwu059cgWaJPn310ClNl6D4VPx
 0e3/G4ggInF9NSQVBazYXx0s2qIlmusdCkBUh0+eyUkvYj7N4d9XynyqouwQZVf7LWrCI1BgqP8Cs
 UrxUi+eztNgKF6XQIzB1awOkum9npNrbgagQQwgGAqvgh6c/Ea6GWk8cbheHh79L9/ElbL5oi8/X6
 G99RY7Ig==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jFM7I-0001VF-Jx; Fri, 20 Mar 2020 18:11:32 +0000
Date: Fri, 20 Mar 2020 11:11:32 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200320181132.GD4971@bombadil.infradead.org>
References: <20200320142231.2402-1-willy@infradead.org>
 <20200320142231.2402-13-willy@infradead.org>
 <20200320165828.GB851@sol.localdomain>
 <20200320173040.GB4971@bombadil.infradead.org>
 <20200320180017.GE851@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320180017.GE851@sol.localdomain>
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
X-Headers-End: 1jFM7Q-001bHA-97
Subject: Re: [f2fs-dev] [PATCH v9 12/25] mm: Move end_index check out of
 readahead loop
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
Cc: cluster-devel@redhat.com, linux-mm@kvack.org,
 John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 William Kucharski <william.kucharski@oracle.com>, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Mar 20, 2020 at 11:00:17AM -0700, Eric Biggers wrote:
> On Fri, Mar 20, 2020 at 10:30:40AM -0700, Matthew Wilcox wrote:
> > On Fri, Mar 20, 2020 at 09:58:28AM -0700, Eric Biggers wrote:
> > > On Fri, Mar 20, 2020 at 07:22:18AM -0700, Matthew Wilcox wrote:
> > > > +	/* Avoid wrapping to the beginning of the file */
> > > > +	if (index + nr_to_read < index)
> > > > +		nr_to_read = ULONG_MAX - index + 1;
> > > > +	/* Don't read past the page containing the last byte of the file */
> > > > +	if (index + nr_to_read >= end_index)
> > > > +		nr_to_read = end_index - index + 1;
> > > 
> > > There seem to be a couple off-by-one errors here.  Shouldn't it be:
> > > 
> > > 	/* Avoid wrapping to the beginning of the file */
> > > 	if (index + nr_to_read < index)
> > > 		nr_to_read = ULONG_MAX - index;
> > 
> > I think it's right.  Imagine that index is ULONG_MAX.  We should read one
> > page (the one at ULONG_MAX).  That would be ULONG_MAX - ULONG_MAX + 1.
> > 
> > > 	/* Don't read past the page containing the last byte of the file */
> > > 	if (index + nr_to_read > end_index)
> > > 		nr_to_read = end_index - index + 1;
> > > 
> > > I.e., 'ULONG_MAX - index' rather than 'ULONG_MAX - index + 1', so that
> > > 'index + nr_to_read' is then ULONG_MAX rather than overflowed to 0.
> > > 
> > > Then 'index + nr_to_read > end_index' rather 'index + nr_to_read >= end_index',
> > > since otherwise nr_to_read can be increased by 1 rather than decreased or stay
> > > the same as expected.
> > 
> > Ooh, I missed the overflow case here.  It should be:
> > 
> > +	if (index + nr_to_read - 1 > end_index)
> > +		nr_to_read = end_index - index + 1;
> > 
> 
> But then if someone passes index=0 and nr_to_read=0, this underflows and the
> entire file gets read.

nr_to_read == 0 doesn't make sense ... I thought we filtered that out
earlier, but I can't find anywhere that does that right now.  I'd
rather return early from __do_page_cache_readahead() to fix that.

> The page cache isn't actually supposed to contain a page at index ULONG_MAX,
> since MAX_LFS_FILESIZE is at most ((loff_t)ULONG_MAX << PAGE_SHIFT), right?  So
> I don't think we need to worry about reading the page with index ULONG_MAX.
> I.e. I think it's fine to limit nr_to_read to 'ULONG_MAX - index', if that makes
> it easier to avoid an overflow or underflow in the next check.

I think we can get a page at ULONG_MAX on 32-bit systems?  I mean, we can buy
hard drives which are larger than 16TiB these days:
https://www.pcmag.com/news/seagate-will-ship-18tb-and-20tb-hard-drives-in-2020
(even ignoring RAID devices)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
