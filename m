Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0AA3BBC6A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Jul 2021 13:51:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m0N82-0006f4-Hd; Mon, 05 Jul 2021 11:51:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <willy@infradead.org>) id 1m0N5S-0006ab-QZ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Jul 2021 11:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EwWN7+UAKQIxLsDpSIp+JET9XMdfQgDUShXvpWDBlhk=; b=I620tRHovsL59BuyV4GDgJOOEe
 CfzbT5zoRtzq9+IMM2fFRi1zB81nFICNCJU4Tq5lhoDHQbea7EGXFnuQyOOdfigBWjC+/GMQk521u
 lfUja9whLwcVA/Hi0ixXXs8Y4E+diBH2nenCRlOGqIu39icEdxWMti5qtE6eFt3XXnqg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EwWN7+UAKQIxLsDpSIp+JET9XMdfQgDUShXvpWDBlhk=; b=XLPkqBSAYksnOKPz1ODXLzBfzY
 VIPfa83l7o8oIabWnvW2iqdY6UhfVpHo3T9MTpwtgupTMmBzHNVts8TTXDrT/Gr+YU/SsexB7BIKw
 GJBzyUuAOU01oj8NiaR9mcQpnWptBzADQjBWas4sYUECG7o0oTkKlQ7p9azmAvBMk56Y=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m0N5P-00030k-IG
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Jul 2021 11:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=EwWN7+UAKQIxLsDpSIp+JET9XMdfQgDUShXvpWDBlhk=; b=eAwDlJOBU+Tx+dEU6uv0PcpZ5Z
 RasJ+GroFUsGWxd2fKjoXsLzNuziTWVLUWfQutkeScELYfij7yZ7HJykLLat5dLYOcHcAvrHwDQwU
 W1CdwKpLbG4hh5TtyOOLcasY8ml+FqSPjWqH8XaH8/hkTt4v96+Ef5IeS+AurC8CDoczbLR9f7ubh
 mGx5mtZ7RbC++4TlVSaPOwifGtDvKqJWcQiiQ3oAFxNyUYBX1J/INz+UfIMpO79Tcc67eKXlrKkG5
 cphdgL9rx/FDAFW4Z26AGNEqDbHAU/OgDLaArnEVfPfpK10O4WOojU0P9+IYI6yTwpEfBFK+ogBhX
 +itC8tLQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1m0N4m-00AD6s-JQ; Mon, 05 Jul 2021 11:47:50 +0000
Date: Mon, 5 Jul 2021 12:47:48 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YOLxZAnaKSwBIlK9@casper.infradead.org>
References: <20210705052216.831989-1-jaegeuk@kernel.org>
 <c32642d6-6de2-eb2d-5771-c7cefa62fab5@kernel.org>
 <YOLJW0IgCagMk2tF@google.com>
 <e2fdf628-f25c-7495-cfd1-952899f7ff9a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e2fdf628-f25c-7495-cfd1-952899f7ff9a@kernel.org>
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
X-Headers-End: 1m0N5P-00030k-IG
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

On Mon, Jul 05, 2021 at 07:33:35PM +0800, Chao Yu wrote:
> On 2021/7/5 16:56, Jaegeuk Kim wrote:
> > On 07/05, Chao Yu wrote:
> > > On 2021/7/5 13:22, Jaegeuk Kim wrote:
> > > > We need to guarantee it's initially zero. Otherwise, it'll hurt entire flag
> > > > operations.
> > > 
> > > Oops, I didn't get the point, shouldn't .private be zero after page was
> > > just allocated by filesystem? What's the case we will encounter stall
> > > private data left in page?
> > 
> > I'm seeing f2fs_migrate_page() has the newpage with some value without Private
> > flag. That causes a kernel panic later due to wrong private flag used in f2fs.
> 
> I'm not familiar with that part of codes, so Cc mm mailing list for help.
> 
> My question is newpage in .migrate_page() may contain non-zero value in .private
> field but w/o setting PagePrivate flag, is it a normal case?

I think freshly allocated pages have a page->private of 0.  ie this
code in mm/page_alloc.c:

                page = rmqueue(ac->preferred_zoneref->zone, zone, order,
                                gfp_mask, alloc_flags, ac->migratetype);
                if (page) {
                        prep_new_page(page, order, gfp_mask, alloc_flags);

where prep_new_page() calls post_alloc_hook() which contains:
        set_page_private(page, 0);

Now, I do see in __buffer_migrate_page() (mm/migrate.c):

        attach_page_private(newpage, detach_page_private(page));

but as far as I can tell, f2fs doesn't call any of the
buffer_migrate_page() paths.  So I'm not sure why you're seeing
a non-zero page->private.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
