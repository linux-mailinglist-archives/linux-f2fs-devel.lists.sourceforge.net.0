Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9EB3BC2DA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Jul 2021 20:46:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m0Tbi-0003Op-Uv; Mon, 05 Jul 2021 18:46:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1m0Tbg-0003Oh-04
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Jul 2021 18:46:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aNDwCscw1p86DkXqINJ193YMMwMojg7IqAtfTHOFrf0=; b=LZ9fX2alT3NDoV2ESHv4vyGrBs
 Sf//6jrqVx4BA1GCr3H/Ms/QX8UXx6V6huisSlXossPUy7gJR95ek+lcJ0G7r8SIlP4rqJHMY8uUA
 eJ5tULqfbHIHdNlXEXMtOb/ZJVPUgqpbC59gnqt1C1xvHv58FqJq+FAi66Gc/bU2EY6U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aNDwCscw1p86DkXqINJ193YMMwMojg7IqAtfTHOFrf0=; b=SdloieTJyaGo4zKVLo9URT12GM
 pdJZYgaAENbsHfEwBtObhlaJzc7SjNPdzvIY9guCAvPr5H45r2zm2CqL43Psk2qZGnLt/519ILAPD
 r0/HI4UQpiF5cyq2D/uIlQrkHuIsMXwvpSDmINlvisvQR31DYNAFn/UdGqYQFoxCCXEk=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m0TbP-0001kr-Vf
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Jul 2021 18:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=aNDwCscw1p86DkXqINJ193YMMwMojg7IqAtfTHOFrf0=; b=tli0JQf63aKNQuU6V30vDNoLKW
 xs1PRFkoJOOygR1Pe/ZKjRhuqlwLDKBN6y1ULUtJb/dYAbDQRHxf9AgySXqDNdzbFgtk8EDNx+JqV
 iO7ICp+tFdRpf1XWxhgO2SAOSEG8V0KORR1aUAAh6ROogwS3XXW0GzzsqGrRYRkjIA/dwN5XJRFgO
 DM6jIV+NFd2QqIpBA+rjPQS2f2455MclI6qONorqe5aHu8DjB3D4PlHvSMDCAVgzUNz+kAKyzX92g
 b13se+6qajfCbSwFF1hA9kH/PbvTj34O0SD3hPjiWrz/IL2Quv0N+M8pd9z2xTXqmep1hBEKHyPM8
 sX/mjbTA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1m0Taw-00AW2c-IU; Mon, 05 Jul 2021 18:45:30 +0000
Date: Mon, 5 Jul 2021 19:45:26 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <YONTRlrJugeVq6Fj@casper.infradead.org>
References: <20210705052216.831989-1-jaegeuk@kernel.org>
 <c32642d6-6de2-eb2d-5771-c7cefa62fab5@kernel.org>
 <YOLJW0IgCagMk2tF@google.com>
 <e2fdf628-f25c-7495-cfd1-952899f7ff9a@kernel.org>
 <YOLxZAnaKSwBIlK9@casper.infradead.org>
 <YONJpQapR7BRnW/J@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YONJpQapR7BRnW/J@google.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m0TbP-0001kr-Vf
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
Cc: linux-mm@kvack.org, Mel Gorman <mgorman@techsingularity.net>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jul 05, 2021 at 11:04:21AM -0700, Jaegeuk Kim wrote:
> On 07/05, Matthew Wilcox wrote:
> > I think freshly allocated pages have a page->private of 0.  ie this
> > code in mm/page_alloc.c:
> > 
> >                 page = rmqueue(ac->preferred_zoneref->zone, zone, order,
> >                                 gfp_mask, alloc_flags, ac->migratetype);
> >                 if (page) {
> >                         prep_new_page(page, order, gfp_mask, alloc_flags);
> > 
> > where prep_new_page() calls post_alloc_hook() which contains:
> >         set_page_private(page, 0);
> 
> Hmm, I can see it in 4.14 and 5.10 kernel.
> 
> The trace is on:
> 
>  30875 [ 1065.118750] c3     87  f2fs_migrate_page+0x354/0x45c
>  30876 [ 1065.123872] c3     87  move_to_new_page+0x70/0x30c
>  30877 [ 1065.128813] c3     87  migrate_pages+0x3a0/0x964
>  30878 [ 1065.133583] c3     87  compact_zone+0x608/0xb04
>  30879 [ 1065.138257] c3     87  kcompactd+0x378/0x4ec
>  30880 [ 1065.142664] c3     87  kthread+0x11c/0x12c
>  30881 [ 1065.146897] c3     87  ret_from_fork+0x10/0x18
> 
>  It seems compaction_alloc() gets a free page which doesn't reset the fields?

I'm not really familiar with the compaction code.  Mel, I see a call
to post_alloc_hook() in split_map_pages().  Are there other ways of
getting the compaction code to allocate a page which don't go through
split_map_pages()?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
