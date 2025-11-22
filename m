Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE80C7C34D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Nov 2025 03:48:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIlbDH+SXZ2C95lYa3DRxugxCfAS5gxkJZRXlH0j3nE=; b=BQWWEQGlEx2YE2gHqfO4jd7q1k
	2vrp/ohklo2ZjjLuXctLojNXLgm7ioQzSuU4eutvm+yNCZ67ODXf7PwXF5cQDMJ6wqpIsS5nbUcRf
	fYzorEL6PuRFYYDWU8OO1bt0cNYvo/v/S1uere5rzFBhRY6reRAblFnRqHbziOzRJfMY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMdfW-0004bz-DX;
	Sat, 22 Nov 2025 02:48:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1vMdfV-0004bt-EN
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 22 Nov 2025 02:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=stvCCt9K954CsHjs/RvYNwMszFaFznWD3NY5g2jONSc=; b=PTgPlhtK/cKZ8Nlo8Y55vywPZ9
 g2E+v3pn8LNx/WnGbsWJJ33GBH+GXBtv3cq3h5bXFPyzAL3N0UST4BYYPSK0f6p3OvzKCIYjrDTGz
 4/nnnI/mS4NVCf8Gykc/rV6dbOnLpSfmNehAaqNB0hOtJ0R3eWO9KBRfC2WQeCYQiwk8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=stvCCt9K954CsHjs/RvYNwMszFaFznWD3NY5g2jONSc=; b=GR53oLFzn+L3O1PC1d5RRRG651
 THACDPM/9wCgSB2v0Z+n1tCxND8eS0l91GUlUTgxPTCyz+TPF+MaR3dbMFcT5VVYhyPQhzo6LWHCj
 YIrPnM2JynPiM2wh5/pUkirzCHa62coHWSaCWyo0VUHS2dZIZtRO5wrKkC6guvWh8OR8=;
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vMdfU-0003vs-K8 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 22 Nov 2025 02:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=stvCCt9K954CsHjs/RvYNwMszFaFznWD3NY5g2jONSc=; b=mL20iFh5WeKxhfidhf3Q5XDldc
 PxcrBnUzYHJrTKxFFF93zvhsvEYx70ee2sBpsYK/sgGxI9Xa197WIARdvxVVwP5zKF6iLlx3J7LfI
 AfXylkn6GBaomDB2V3OIy5mu4gDCRX3yNJdvEQ68WmLFRVep36u8wcEb0NoftFlGrkvnLOdWrw1iQ
 G5RVeuXRYP5yBgGnw26nlrng3g/cS67L9hD12crzdh8O4xqAK/CpJLCPkgYPiSoOgZYCWNoCZcTaT
 EkieAiB6BMhBpLuCvumx2ctPM+63T6tY46jYgDdEv9ajqHbuQycIgMB67pBk6WKUzjoDPcGy+N94M
 wQLIUw5w==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vMdfJ-00000003nk3-14fx;
 Sat, 22 Nov 2025 02:47:57 +0000
Date: Sat, 22 Nov 2025 02:47:57 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <aSEkXSJ4apXs_zD0@casper.infradead.org>
References: <20251121032718.1993528-1-jaegeuk@kernel.org>
 <aR_pCGtcc7ASeA77@casper.infradead.org>
 <aR_ultJzXh1rmOKs@google.com>
 <aSB25FFkLaJkbVfT@casper.infradead.org>
 <aSCpKx9ITAJfoSlw@google.com> <aSDC4jlaKSaKgbvc@google.com>
 <aSDEU_C5QaSXD18x@casper.infradead.org>
 <aSDaXN-JhhfljCeT@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aSDaXN-JhhfljCeT@google.com>
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Nov 21, 2025 at 09:32:12PM +0000, Jaegeuk Kim wrote:
 > On 11/21, Matthew Wilcox wrote: > > On Fri, Nov 21, 2025 at 07:52:02PM
 +0000, Jaegeuk Kim wrote: > > > On 11/21, Jaegeuk Kim wrote: > > > [...] 
 Content analysis details:   (1.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1vMdfU-0003vs-K8
Subject: Re: [f2fs-dev] [PATCH] [RFC] mm/fadvise: introduce POSIX_FADV_MLOCK
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
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Nov 21, 2025 at 09:32:12PM +0000, Jaegeuk Kim wrote:
> On 11/21, Matthew Wilcox wrote:
> > On Fri, Nov 21, 2025 at 07:52:02PM +0000, Jaegeuk Kim wrote:
> > > On 11/21, Jaegeuk Kim wrote:
> > > > On 11/21, Matthew Wilcox wrote:
> > > > > On Fri, Nov 21, 2025 at 04:46:14AM +0000, Jaegeuk Kim wrote:
> > > > > > On 11/21, Matthew Wilcox wrote:
> > > > > > > On Fri, Nov 21, 2025 at 03:27:18AM +0000, Jaegeuk Kim wrote:
> > > > > > > > This patch introduces a new POSIX_FADV_MLOCK which 1) invalidates the range of
> > > > > > > > cached pages, 2) sets the mapping as inaccessible, 3) POSIX_FADV_WILLNEED loads
> > > > > > > > pages directly to the inaccessible mapping.
> > > > > > > 
> > > > > > > ... what?
> > > > > > > 
> > > > > > > This seems like something which is completely different from mlock().
> > > > > > > So it needs a different name.
> > > > > > > 
> > > > > > > But I don't understand the point of this, whatever it's called.  Need
> > > > > > > more information.
> > > > > > 
> > > > > > So, the sequence that I'd like to optimize is mmap(MAP_POPULATE) followed
> > > > > > by  mlock(). For example, mmap() takes 1 second to load 4GB data, and mlock()
> > > > > > takes 330ms additionally in order to migrate all the pages into inaccessible
> > > > > > map, IIUC.
> > > > > 
> > > > > Oh, so the MLOCK part is right, but the inaccessible() part is wrong.
> > > > > Inaccessible is special weird guest_memfd crap that has all kinds of
> > > > > side-effects that you don't want.
> > > > > 
> > > > > Wouldn't you get the same effect by calling mlock2(MLOCK_ONFAULT) and
> > > > > then calling readahead() for the desired range?
> > > > 
> > > > Oh, thank you. Let me try.
> > > 
> > > After checking the code and experiment, I don't think that gives what we need.
> > > That flag skips populate_vma_page_range only, but we need to allocate pages
> > > in the inaccessible mapping and fill the pages afterwards.
> > 
> > Then either I don't understand what you're trying to do, or you don't
> > understand what the inaccessible mapping is for.  Is this just for
> > speeding up mlock() as you suggested earlier, or are you genuinely
> > trying to do something with the inaccessible mapping?
> 
> The latter. I'd like to propose a new read flow with the inaccessible mapping.

You REALLY REALLY REALLY need to explain what you're doing because this
all sounds completely bogus.

The inaccessible mapping is something special that guest_memfd does.
But here you are talking about it like it's some kind of normal
filesystem thing.

So, from the top.  What are you trying to accomplish?  Starting from "We
have application A.  It wants to ..."

> As-Is:
>  mmap() -> fadvise(fd, POSIX_FADV_WILLNEED) -> mlock()
> 
> 1. fadvise() proposal
>  mmap() -> fadvise(fd, POSIX_FADV_MLOCK)
>  : all the pages will be loaded into inaccessible page cache directly
> 
> 2. mlock2() proposal
>  mmap() -> mlock2(MLOCK_ONFAULT) -> madvise(MADV_POPULATE_READ)
> 
> If you mean #2, I need to find whether we can get the space for madvise, since
> we have only fd when reading the pages. And, also I need to find a way to handle
> the folio order directly instead of starging from 0 in madvise() path.
> Let me think about it.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
