Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C46C7BC27
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Nov 2025 22:32:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AayZiY21hL6qSsLEVfcgiw2z7k4JzQC+kpMJ/TISfes=; b=A3KTUcAwqHQIu/BYNv+bBfPShm
	7OsQyyNL7DZoFtvKi54Vm7ZJvzqDfM5apO6yg+tKvivlQzM8SCb5ARscEmORQhdt2i0Bhd6VxZldu
	uo2qCmGZITwd2A9+AMadsg+ONcQBvqNpJHft5BNbliGAQEdoDwlOr4WZfhw2A0sY+y4M=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMYjy-00028A-Ed;
	Fri, 21 Nov 2025 21:32:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vMYjx-000284-P4
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 21:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lYoE+OlaecIlilZnJdX1xXHAW+IvyDep4xnmyFkZFSQ=; b=QvHSy/whnERiekGWt2KXBc1aRC
 jdgFLARnO3+gCAGf+hFgbb1+YpMAvZliToOgbx4BDOa+3ixIN95qTMuOdsZw5tyPf0Cv36bUByoEE
 WogMwoYEehqPryvAJxw6v/549YqU3S2CBPbe0lZMyI6GdI32HjgCd1vpW2CgCvTDVThw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lYoE+OlaecIlilZnJdX1xXHAW+IvyDep4xnmyFkZFSQ=; b=GjziUZuKtmtPwq55fE4qkrCBaX
 DzGTfkcf2dx4905O5r3VSnXBhVjB/at7vVO8RmhaYtla8GsfZMgdzyMYH8GPEHe/zgLzBFj2+a3XP
 HtcQ5K4dmzMb3CEXXDiEDZlUHZDiQijq+h16pARax6IVVV7xNdXVAXWn7E7YCqMk/V8Q=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vMYjx-0005Uc-9r for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 21:32:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E5380416CF;
 Fri, 21 Nov 2025 21:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97986C116C6;
 Fri, 21 Nov 2025 21:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763760734;
 bh=9CXYMqrOIm+Q10uDMB/uyJplbeY1MEE5pftnNW81HpY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nMjYo/daf/v/pGj0zjIz0yC1qxreOE5r1ZeyyiYlLQdzropLyAJ+/yphoLIMuv6TJ
 BhAP7mLvOh7w+8zluIiEo6BXH6fGDEm4vhqfy1PBRhHQ8/JFiSsAMD2QKR1NiXUFSR
 Hudl6H6y91ltl/SzecKQRISdewodQrHyUhPxoYFFyFAp5Qwl3F8akL63ZNMlaaynfh
 3ZPiz4q+DyPSwD7A+uzmjRnF+d7hMor4x+nFinc9hzvHFYsSTW63+turuEU7tDK5H5
 Jjw2NxFk1Fg6gN8m3E5Gcflh9I1Mq2kNOqIx/ZtH9Oyb2gtDIpX7+cwWjN8CI9fdIm
 97xU5Kq4GIQSA==
Date: Fri, 21 Nov 2025 21:32:12 +0000
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <aSDaXN-JhhfljCeT@google.com>
References: <20251121032718.1993528-1-jaegeuk@kernel.org>
 <aR_pCGtcc7ASeA77@casper.infradead.org>
 <aR_ultJzXh1rmOKs@google.com>
 <aSB25FFkLaJkbVfT@casper.infradead.org>
 <aSCpKx9ITAJfoSlw@google.com> <aSDC4jlaKSaKgbvc@google.com>
 <aSDEU_C5QaSXD18x@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aSDEU_C5QaSXD18x@casper.infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/21, Matthew Wilcox wrote: > On Fri, Nov 21, 2025 at
 07:52:02PM +0000, Jaegeuk Kim wrote: > > On 11/21, Jaegeuk Kim wrote: > >
 > On 11/21, Matthew Wilcox wrote: > > > > On Fri, Nov 21, 2025 at 04 [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vMYjx-0005Uc-9r
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/21, Matthew Wilcox wrote:
> On Fri, Nov 21, 2025 at 07:52:02PM +0000, Jaegeuk Kim wrote:
> > On 11/21, Jaegeuk Kim wrote:
> > > On 11/21, Matthew Wilcox wrote:
> > > > On Fri, Nov 21, 2025 at 04:46:14AM +0000, Jaegeuk Kim wrote:
> > > > > On 11/21, Matthew Wilcox wrote:
> > > > > > On Fri, Nov 21, 2025 at 03:27:18AM +0000, Jaegeuk Kim wrote:
> > > > > > > This patch introduces a new POSIX_FADV_MLOCK which 1) invalidates the range of
> > > > > > > cached pages, 2) sets the mapping as inaccessible, 3) POSIX_FADV_WILLNEED loads
> > > > > > > pages directly to the inaccessible mapping.
> > > > > > 
> > > > > > ... what?
> > > > > > 
> > > > > > This seems like something which is completely different from mlock().
> > > > > > So it needs a different name.
> > > > > > 
> > > > > > But I don't understand the point of this, whatever it's called.  Need
> > > > > > more information.
> > > > > 
> > > > > So, the sequence that I'd like to optimize is mmap(MAP_POPULATE) followed
> > > > > by  mlock(). For example, mmap() takes 1 second to load 4GB data, and mlock()
> > > > > takes 330ms additionally in order to migrate all the pages into inaccessible
> > > > > map, IIUC.
> > > > 
> > > > Oh, so the MLOCK part is right, but the inaccessible() part is wrong.
> > > > Inaccessible is special weird guest_memfd crap that has all kinds of
> > > > side-effects that you don't want.
> > > > 
> > > > Wouldn't you get the same effect by calling mlock2(MLOCK_ONFAULT) and
> > > > then calling readahead() for the desired range?
> > > 
> > > Oh, thank you. Let me try.
> > 
> > After checking the code and experiment, I don't think that gives what we need.
> > That flag skips populate_vma_page_range only, but we need to allocate pages
> > in the inaccessible mapping and fill the pages afterwards.
> 
> Then either I don't understand what you're trying to do, or you don't
> understand what the inaccessible mapping is for.  Is this just for
> speeding up mlock() as you suggested earlier, or are you genuinely
> trying to do something with the inaccessible mapping?

The latter. I'd like to propose a new read flow with the inaccessible mapping.

As-Is:
 mmap() -> fadvise(fd, POSIX_FADV_WILLNEED) -> mlock()

1. fadvise() proposal
 mmap() -> fadvise(fd, POSIX_FADV_MLOCK)
 : all the pages will be loaded into inaccessible page cache directly

2. mlock2() proposal
 mmap() -> mlock2(MLOCK_ONFAULT) -> madvise(MADV_POPULATE_READ)

If you mean #2, I need to find whether we can get the space for madvise, since
we have only fd when reading the pages. And, also I need to find a way to handle
the folio order directly instead of starging from 0 in madvise() path.
Let me think about it.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
