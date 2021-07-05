Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC783BC278
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Jul 2021 20:07:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m0Szj-0003U3-VC; Mon, 05 Jul 2021 18:06:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1m0Szi-0003Tj-RF
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Jul 2021 18:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qyFOSK3UeeFTdbaTOk9xpwuk0JXriGxPW/+6hhvWQTY=; b=kIozAIcb0fInGiPbV/W+LY5roO
 /7WWcI2W7vd9Z2w7L4x0mgZi5mW6LN8tv5EUFlFVl/exhLnPsLlCSHFDNFkmc1QgXNp8O9zvMRz8E
 NJqgQQ9UWCRBS8zetZSHSCTFb8iI9TnJKxKHe6klAO/7WQpt3dwtonN8oHUImVrQ0+Hk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qyFOSK3UeeFTdbaTOk9xpwuk0JXriGxPW/+6hhvWQTY=; b=GuWbLWltoYB1ZQhBVD2nwde+IC
 M5T1oYUAkf/ip+o9KgXCwT3klH05rX6aOD6TrLmQXhOICP9HnLuZuhnWcHH6EVVfeaD8XFCcsQlTV
 eOGwFiX+2xc62AefGB4qYErvWkKF52ITcibqIOMH0Omycn/PQnsV8X19tLXa/vJ0Iwr8=;
Received: from [198.145.29.99] (helo=mail.kernel.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m0SzZ-0008CJ-Sa
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Jul 2021 18:06:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53BEC61960;
 Mon,  5 Jul 2021 18:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625508394;
 bh=Xy6ubhejwEcN3GLCCD+sUqLDtIYEEis2KKMbHhLmyHA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ovqck0GUI7kaHVA3NtrmtZq5CWV8zozOpFvTU9JFlmuOX/dfRPmcX1M0CDgg5Z+RC
 4f7ezNI1khjahp7kAobT7VkG0vANfLf4cv1rjM05f+sEvrup8/cZmYkrM/LnSFvtCd
 6Mbs4za5rspQEE3YKc68gNKuZKRGWsI097MuPsQ2PVGhU5VNy6beqYOmz09+uEJ+zS
 6R720ei75uXWBTOZomxorAldcIwevOd2KlakHB+LArrWrv0lkTSMHsjSdA2TwBGeyf
 iIBXMciczvBOC6ndXA2v1UTt8dYAQm9qNVqC5LdJWaNb6rQI3W16KhgsFwIWcbvamQ
 KKInZt6FF9szg==
Date: Mon, 5 Jul 2021 11:06:32 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YONKKOBwPUdORO59@google.com>
References: <20210705052216.831989-1-jaegeuk@kernel.org>
 <c32642d6-6de2-eb2d-5771-c7cefa62fab5@kernel.org>
 <YOLJW0IgCagMk2tF@google.com>
 <e2fdf628-f25c-7495-cfd1-952899f7ff9a@kernel.org>
 <YOLxZAnaKSwBIlK9@casper.infradead.org>
 <5ab8d01a-8fac-60b2-9c2c-a32c5a81b394@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5ab8d01a-8fac-60b2-9c2c-a32c5a81b394@kernel.org>
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
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m0SzZ-0008CJ-Sa
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
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/06, Chao Yu wrote:
> On 2021/7/5 19:47, Matthew Wilcox wrote:
> > On Mon, Jul 05, 2021 at 07:33:35PM +0800, Chao Yu wrote:
> > > On 2021/7/5 16:56, Jaegeuk Kim wrote:
> > > > On 07/05, Chao Yu wrote:
> > > > > On 2021/7/5 13:22, Jaegeuk Kim wrote:
> > > > > > We need to guarantee it's initially zero. Otherwise, it'll hurt entire flag
> > > > > > operations.
> > > > > 
> > > > > Oops, I didn't get the point, shouldn't .private be zero after page was
> > > > > just allocated by filesystem? What's the case we will encounter stall
> > > > > private data left in page?
> > > > 
> > > > I'm seeing f2fs_migrate_page() has the newpage with some value without Private
> > > > flag. That causes a kernel panic later due to wrong private flag used in f2fs.
> > > 
> > > I'm not familiar with that part of codes, so Cc mm mailing list for help.
> > > 
> > > My question is newpage in .migrate_page() may contain non-zero value in .private
> > > field but w/o setting PagePrivate flag, is it a normal case?
> > 
> > I think freshly allocated pages have a page->private of 0.  ie this
> > code in mm/page_alloc.c:
> > 
> >                  page = rmqueue(ac->preferred_zoneref->zone, zone, order,
> >                                  gfp_mask, alloc_flags, ac->migratetype);
> >                  if (page) {
> >                          prep_new_page(page, order, gfp_mask, alloc_flags);
> > 
> > where prep_new_page() calls post_alloc_hook() which contains:
> >          set_page_private(page, 0);
> > 
> > Now, I do see in __buffer_migrate_page() (mm/migrate.c):
> > 
> >          attach_page_private(newpage, detach_page_private(page));
> > 
> > but as far as I can tell, f2fs doesn't call any of the
> > buffer_migrate_page() paths.  So I'm not sure why you're seeing
> > a non-zero page->private.
> 
> Well, that's strange.
> 
> Jaegeuk, let's add a BUGON in f2fs to track the call path where newpage
> has non-zero private value? if this issue is reproducible.

We can debug anything tho, this issue is blocking the production, and I'd
like to get this in this merge windows. Could you please check the patch
has any holes?

> 
> Thanks,
> 
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
