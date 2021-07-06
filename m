Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AB53BC880
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Jul 2021 11:28:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m0hNh-00009A-93; Tue, 06 Jul 2021 09:28:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <mgorman@techsingularity.net>) id 1m0hNf-000090-Rj
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Jul 2021 09:28:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+FYBuLn9sPaVyFv6yMeNu3tpSPQuRAZZofS8wKS2V0M=; b=ZZS0DQbZEwAyrpXy+CfJ6F+AE6
 1AO1DcVDIiJu6Ju71lnILaOscaDa230MBmgPfQ0WQVjqfVxz5/j7NFCjEAaFTPGoxlxqGHFZQ/qFb
 DCZ8ie3EcK+53gUk+ylz7usmfPO+5H9pti/YDc+0RetGWbqWtfUn7yca5KoFuadyZCqc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+FYBuLn9sPaVyFv6yMeNu3tpSPQuRAZZofS8wKS2V0M=; b=QT8uQhtsHMoXt6YFQCgCINZtXs
 WE7+LfJomVgsuY94vbunW4zJzsPY58KxbC1ePKsfaX8leQXKyFGb8ZoC708N97JYZcmVETeMX01Tl
 WYme8ZDsMhS4eT5wWMnxN+IOVsKIYHa5erBQgIPLpBvbL0VIBIemOKvIsF40tWzFnrA4=;
Received: from outbound-smtp30.blacknight.com ([81.17.249.61])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m0hNV-0004np-Qr
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Jul 2021 09:28:39 +0000
Received: from mail.blacknight.com (pemlinmail05.blacknight.ie [81.17.254.26])
 by outbound-smtp30.blacknight.com (Postfix) with ESMTPS id 982371C001
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 Jul 2021 10:12:12 +0100 (IST)
Received: (qmail 24893 invoked from network); 6 Jul 2021 09:12:12 -0000
Received: from unknown (HELO techsingularity.net)
 (mgorman@techsingularity.net@[84.203.17.255])
 by 81.17.254.9 with ESMTPSA (AES256-SHA encrypted, authenticated);
 6 Jul 2021 09:12:12 -0000
Date: Tue, 6 Jul 2021 10:12:11 +0100
From: Mel Gorman <mgorman@techsingularity.net>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20210706091211.GR3840@techsingularity.net>
References: <20210705052216.831989-1-jaegeuk@kernel.org>
 <c32642d6-6de2-eb2d-5771-c7cefa62fab5@kernel.org>
 <YOLJW0IgCagMk2tF@google.com>
 <e2fdf628-f25c-7495-cfd1-952899f7ff9a@kernel.org>
 <YOLxZAnaKSwBIlK9@casper.infradead.org>
 <YONJpQapR7BRnW/J@google.com>
 <YONTRlrJugeVq6Fj@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YONTRlrJugeVq6Fj@casper.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1m0hNV-0004np-Qr
Subject: Re: [f2fs-dev] [PATCH] f2fs: initialize page->private when using
 for our internal use
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
Cc: linux-mm@kvack.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jul 05, 2021 at 07:45:26PM +0100, Matthew Wilcox wrote:
> On Mon, Jul 05, 2021 at 11:04:21AM -0700, Jaegeuk Kim wrote:
> > On 07/05, Matthew Wilcox wrote:
> > > I think freshly allocated pages have a page->private of 0.  ie this
> > > code in mm/page_alloc.c:
> > > 
> > >                 page = rmqueue(ac->preferred_zoneref->zone, zone, order,
> > >                                 gfp_mask, alloc_flags, ac->migratetype);
> > >                 if (page) {
> > >                         prep_new_page(page, order, gfp_mask, alloc_flags);
> > > 
> > > where prep_new_page() calls post_alloc_hook() which contains:
> > >         set_page_private(page, 0);
> > 
> > Hmm, I can see it in 4.14 and 5.10 kernel.
> > 
> > The trace is on:
> > 
> >  30875 [ 1065.118750] c3     87  f2fs_migrate_page+0x354/0x45c
> >  30876 [ 1065.123872] c3     87  move_to_new_page+0x70/0x30c
> >  30877 [ 1065.128813] c3     87  migrate_pages+0x3a0/0x964
> >  30878 [ 1065.133583] c3     87  compact_zone+0x608/0xb04
> >  30879 [ 1065.138257] c3     87  kcompactd+0x378/0x4ec
> >  30880 [ 1065.142664] c3     87  kthread+0x11c/0x12c
> >  30881 [ 1065.146897] c3     87  ret_from_fork+0x10/0x18
> > 
> >  It seems compaction_alloc() gets a free page which doesn't reset the fields?
> 
> I'm not really familiar with the compaction code.  Mel, I see a call
> to post_alloc_hook() in split_map_pages().  Are there other ways of
> getting the compaction code to allocate a page which don't go through
> split_map_pages()?

I don't *think* so but I didn't look too hard as I had limited time
available before a meeting. compaction_alloc calls isolate_freepages
and that calls split_map_pages whether fast or slow isolating pages. The
problem *may* be in split_page because only the head page gets order set
to 0 but it's a bad fit because tail pages should be cleared of private
state by del_page_from_free_list. It might be worth adding a debugging
patch to split_pages that prints a warning once if a tail page has private
state and dump the contents of private to see if it looks like an order.

-- 
Mel Gorman
SUSE Labs


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
