Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D32C99335
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 01 Dec 2025 22:38:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCXe03VESUOC5GMirW3+BW2Vjrt4hb+CzIbWhgQooyk=; b=MejCu9NaReCxc0gSBZ1sLR4TkR
	hR6qnMU5t1gncG5ptby5VhuK/YQ8rTjqm24xoV7ajemCEzi/iU3OdeXiI93YD0TUAME84tpe1wdkG
	7zsO92B3BgkNj/cs7yLMgNC/yFYYNqLtSx964Uuxa6YddIe9dmffEy3/WtsTprnTDpkg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQBbg-0004Rb-HV;
	Mon, 01 Dec 2025 21:38:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1vQBbf-0004RS-39
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 21:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IC+JbYTz4wUsAbVSDTKYVEaA4vy5MxR+ihBKqV1SwpY=; b=gFg0Mib7as3Bup6ws+4HWi2wLb
 4GZi1zT94CT2vK+EC57htRL9VEaV1oO1mHFZJQHM7bl3EthmumbJC2uS/YgVaPssxSZMQebsCJNfB
 Mzm7qYhSPV4AbXbFcX9pGMkN+ZcEuxHVB0DRz3XQiwAAvleu4EhMMvCfsKjsh7Xi+IkI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IC+JbYTz4wUsAbVSDTKYVEaA4vy5MxR+ihBKqV1SwpY=; b=W9aNUq9Lu3irROkMjDFdZ/Gek8
 Ccy85qKOunH+IdNCYs2Lz6Y7Ve4WOKjn8VdfwuGM0JoY3+iaipczcl7FtmLNl1YyeV39Gs0up3dvQ
 KOfUmD4gLKbEmjWecy2KvkvEeMEuGeVVzpwVPWs2OS6+nrdbKm8MCRpxRToZZSswWUTg=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQBbe-0003uM-DC for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 21:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=IC+JbYTz4wUsAbVSDTKYVEaA4vy5MxR+ihBKqV1SwpY=; b=BScuargNrc58wdjz1s1pvVAF3f
 S7Z44Udh/Va6F/2fFBtK4irt8nS9jqp8otvn9ZEKOpAhQlLPwza4nL/P5OgJYQYJfhU33qBVR6Ift
 4Mf/Ic+H0/RxqD5wyCLW8INkT3UPhBjjvtd0Byn2sOEqsSsnPcZb88XM9fG2MvCU0a0fNW09KhIkA
 52YVC8klo6DfOr2cVomZf7kuvhNfS0dFfDQxairGo0Kgngptz1+GDkbcCGIispYlaA8BRAbHeIHMz
 cATdI15rflahY9IvrEcDxtFP4Vr7kD8dp/RXsJXQjEZVTxnyKrYqC4gbMsYZ1oC3mRFjN5QltrrTI
 oJSCju8w==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vQBbT-00000000GWw-0WWk;
 Mon, 01 Dec 2025 21:38:39 +0000
Date: Mon, 1 Dec 2025 21:38:38 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <aS4K3jGkJErj94R_@casper.infradead.org>
References: <20251201210152.909339-1-jaegeuk@kernel.org>
 <20251201210152.909339-4-jaegeuk@kernel.org>
 <aS4GgfzfuYRHJdg_@casper.infradead.org>
 <aS4HmeRgsStngE5v@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aS4HmeRgsStngE5v@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Dec 01, 2025 at 09:24:41PM +0000, Jaegeuk Kim wrote:
 > On 12/01, Matthew Wilcox wrote: > > On Mon, Dec 01, 2025 at 09:01:26PM
 +0000, Jaegeuk Kim wrote: > > > This patch introduces a new addres [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1vQBbe-0003uM-DC
Subject: Re: [f2fs-dev] [PATCH 3/4] mm/readahead: add a_ops->ra_folio_order
 to get a desired folio order
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

On Mon, Dec 01, 2025 at 09:24:41PM +0000, Jaegeuk Kim wrote:
> On 12/01, Matthew Wilcox wrote:
> > On Mon, Dec 01, 2025 at 09:01:26PM +0000, Jaegeuk Kim wrote:
> > > This patch introduces a new address operation, a_ops->ra_folio_order(), which
> > > proposes a new folio order based on the adjusted order for page_cache_sync_ra.
> > > 
> > > Hence, each filesystem can set the desired minimum order of folio allocation
> > > when requesting fadvise(POSIX_FADV_WILLNEED).
> > 
> > Again, you've said what but not why.  Does the mm code not ramp up the
> > folio order sufficiently quickly?  What are you trying to accomplish?
> 
> That's why I posted a series of the patches to provide more details. Could you
> please check the last patch in the series to show fadvise() does not increase
> the folio order?
> 
> https://lore.kernel.org/linux-f2fs-devel/20251201210152.909339-5-jaegeuk@kernel.org/T/#u

So what you're trying to say is that readahead() currently only uses
order-0 pages and you want it to use larger order pages?  I agree with
that!  But I don't think this is the way to do it.  We should just use
larger order allocations, always.  None of this "call the filesystem,
check a sysfs parameter".  Just use the largest order page that fits.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
