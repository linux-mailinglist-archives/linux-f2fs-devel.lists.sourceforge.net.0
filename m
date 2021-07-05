Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E2E3BC276
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Jul 2021 20:04:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m0SxR-0002o9-Lt; Mon, 05 Jul 2021 18:04:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1m0SxP-0002nh-DE
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Jul 2021 18:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PJSSPaXz5F0sfBoHjigYVhBx+aIf2WKFa+82vNi4bdY=; b=OSrMG9fszUTLESzJGb/FaubMiE
 KuNAFzyIlP4M1hXAxkpW29WE2WG1v+FXnrX3LSeoocWdb8mhSdyQ7Th2UqmQ39n22TcxeARJQ5BBc
 iYtY+arueYfxJUVEQ+ApPhKdmAZDtyFjxxAlyCKvB8g7ceL8i7kwhi7oOiv6TeRF23tU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PJSSPaXz5F0sfBoHjigYVhBx+aIf2WKFa+82vNi4bdY=; b=ekF+Mq71yF3CG1L2bJDRlfeF2a
 ndWBwW1lCHUHA244Rn5KgJ4R0I3h+U/SOKQQFaq2rvZbyUZJVeaoWStIay6QFRnnk15ddGbISg2Xv
 KgIPIx/JDMs3tNI1pwNeNx/XV3OhvHPRbtVA0+9jOpvilBNN22zNPQ9VDrXX4Ee6Bfmk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m0SxM-00BHwy-UH
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Jul 2021 18:04:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A39E61960;
 Mon,  5 Jul 2021 18:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625508262;
 bh=SRd1GZBTCuo++RPTBqiScUUN2xrO3AaUUN5D9qs3T2g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FA6cdRCaN0Sau3UQE6S0Gp/0vlQbXFjjTVAAoo+RQ2Tpvj/TFe8y2IhFIG977C97g
 /X6EDRoi81LypTIHJtf2dZ+X6J1ca2Cxm6p8aGuVKddCy4NEVUpL0K5WGe4ygGR063
 YEF3YhcgPEPln39h4ZJXbKrw3GZt9AiQeGBCwICuAkdeEufwiSe/Hzn9a6BCPLD4MM
 jPga6q5SNA2DTE0ZSMXjlX8PdNGroj6WAyguU1LKzO6W57fyZH7lc9jwe/Hb70TOgW
 IQDzI8jij7jKvSu9qOSAAZjDthZ2HCoh1dnRXuzA7K7oe+xB0v/LU7CsuLO95qth0s
 tDlf5UYJ6YyNQ==
Date: Mon, 5 Jul 2021 11:04:21 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <YONJpQapR7BRnW/J@google.com>
References: <20210705052216.831989-1-jaegeuk@kernel.org>
 <c32642d6-6de2-eb2d-5771-c7cefa62fab5@kernel.org>
 <YOLJW0IgCagMk2tF@google.com>
 <e2fdf628-f25c-7495-cfd1-952899f7ff9a@kernel.org>
 <YOLxZAnaKSwBIlK9@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YOLxZAnaKSwBIlK9@casper.infradead.org>
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m0SxM-00BHwy-UH
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
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/05, Matthew Wilcox wrote:
> On Mon, Jul 05, 2021 at 07:33:35PM +0800, Chao Yu wrote:
> > On 2021/7/5 16:56, Jaegeuk Kim wrote:
> > > On 07/05, Chao Yu wrote:
> > > > On 2021/7/5 13:22, Jaegeuk Kim wrote:
> > > > > We need to guarantee it's initially zero. Otherwise, it'll hurt entire flag
> > > > > operations.
> > > > 
> > > > Oops, I didn't get the point, shouldn't .private be zero after page was
> > > > just allocated by filesystem? What's the case we will encounter stall
> > > > private data left in page?
> > > 
> > > I'm seeing f2fs_migrate_page() has the newpage with some value without Private
> > > flag. That causes a kernel panic later due to wrong private flag used in f2fs.
> > 
> > I'm not familiar with that part of codes, so Cc mm mailing list for help.
> > 
> > My question is newpage in .migrate_page() may contain non-zero value in .private
> > field but w/o setting PagePrivate flag, is it a normal case?
> 
> I think freshly allocated pages have a page->private of 0.  ie this
> code in mm/page_alloc.c:
> 
>                 page = rmqueue(ac->preferred_zoneref->zone, zone, order,
>                                 gfp_mask, alloc_flags, ac->migratetype);
>                 if (page) {
>                         prep_new_page(page, order, gfp_mask, alloc_flags);
> 
> where prep_new_page() calls post_alloc_hook() which contains:
>         set_page_private(page, 0);
> 
> Now, I do see in __buffer_migrate_page() (mm/migrate.c):
> 
>         attach_page_private(newpage, detach_page_private(page));
> 
> but as far as I can tell, f2fs doesn't call any of the
> buffer_migrate_page() paths.  So I'm not sure why you're seeing
> a non-zero page->private.

Hmm, I can see it in 4.14 and 5.10 kernel.

The trace is on:

 30875 [ 1065.118750] c3     87  f2fs_migrate_page+0x354/0x45c
 30876 [ 1065.123872] c3     87  move_to_new_page+0x70/0x30c
 30877 [ 1065.128813] c3     87  migrate_pages+0x3a0/0x964
 30878 [ 1065.133583] c3     87  compact_zone+0x608/0xb04
 30879 [ 1065.138257] c3     87  kcompactd+0x378/0x4ec
 30880 [ 1065.142664] c3     87  kthread+0x11c/0x12c
 30881 [ 1065.146897] c3     87  ret_from_fork+0x10/0x18

 It seems compaction_alloc() gets a free page which doesn't reset the fields?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
