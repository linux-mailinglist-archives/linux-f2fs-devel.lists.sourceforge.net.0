Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5EFC99C21
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 02 Dec 2025 02:33:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzXkwK7g19oBPrg9L3EpLBVSzgFH+zZB9lDFytkynv8=; b=SoAWvK+7OMmTSnc5R3QIn2uQ02
	BzILZOD4OBDjZCbAf50wE8JYEvJyx5DZm+mjY2EicjTI7HceLgupv2FUiy3kZygd0t4wxwYWrdrwE
	D4uhqMezVXP0BEtQMJlYi1bnQqLS+8y0pOzMm2nEL4gcmwKH+uWMyoeDEm9JjPaE6N/U=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQFGV-0000ni-BX;
	Tue, 02 Dec 2025 01:33:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vQFGU-0000nc-2s
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Dec 2025 01:33:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MQWHHWcsf1yDrXRN3kfOI9Jd+i+ZWG55FBfyel2UL8c=; b=KskobTQh+2H6laH5xXYIV33bks
 YcoGTGj+MGpG5HWSfe8w2mUWyjjUt+fGKhvCy63Y9Liix5Z/5QJg47m9Sc5PIXDaFEgLsf88mkFY8
 SkIEK1IDvsb9ajntKHFfIVSWbmt/ogQjXDhVm6xrwSll7o0qzjxxqgFtWqa/P/k1YkLA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MQWHHWcsf1yDrXRN3kfOI9Jd+i+ZWG55FBfyel2UL8c=; b=hGrrESoPJFcvpDpLhVkwanVpTu
 4Y2frbL25Qz/RCNWzI3yCRC4U8IDAORDF7xZ7AHdbglrv23JK/2rpwDbInmo//T98vP5op7KGgLTT
 sREf+tKol6M+W6IyMU9xG9NktAcsqpz0pe4YTA8JSIwJe9UrZJMUCpg3ayKPWV11Vo00=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQFGT-0006Jq-HF for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Dec 2025 01:33:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EE1966012B;
 Tue,  2 Dec 2025 01:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C379C116C6;
 Tue,  2 Dec 2025 01:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764639182;
 bh=oe4l/S1/X9n/DZSGZd0YfLwRU+TB8ogHEYv9W6fZxDM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bsb7incIdQwV+qbtSrzI1R1Lf8ogfLheOc8H0ztMhA0RhnFaShC6xduKsj9g9yOH1
 Vsv9IVe2mG39vW26gBS+TwZLbBcXVMZD+OCF2gUiE5S207/NKCOa0E5X0pnZWWJoHs
 3/nF6Qd4zY39/v/CPOrXw4SOihVHe9GUh52r5L2fTqWNyY0+jGPZ4t4903SQTpwoOq
 wznbIaBikJqPcmTutHBTQSHSXUtfroBY7jtFjHfziILFcNHSFrOeqq6QYWAlh+J/BV
 MiBQC0a/PkJbRzXCeC9dBaid3nScJUqdw4fYOIyYeyapRz6PWg2Y+YP+nUNsaaVVSp
 4voBa+5GpvLFg==
Date: Tue, 2 Dec 2025 01:33:01 +0000
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <aS5Bzd4jxuDjjCn5@google.com>
References: <20251201210152.909339-1-jaegeuk@kernel.org>
 <20251201210152.909339-4-jaegeuk@kernel.org>
 <aS4GgfzfuYRHJdg_@casper.infradead.org>
 <aS4HmeRgsStngE5v@google.com>
 <aS4K3jGkJErj94R_@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aS4K3jGkJErj94R_@casper.infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/01, Matthew Wilcox wrote: > On Mon, Dec 01, 2025 at
 09:24:41PM +0000, Jaegeuk Kim wrote: > > On 12/01, Matthew Wilcox wrote: >
 > > On Mon, Dec 01, 2025 at 09:01:26PM +0000, Jaegeuk Kim wrote: > [...] 
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vQFGT-0006Jq-HF
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/01, Matthew Wilcox wrote:
> On Mon, Dec 01, 2025 at 09:24:41PM +0000, Jaegeuk Kim wrote:
> > On 12/01, Matthew Wilcox wrote:
> > > On Mon, Dec 01, 2025 at 09:01:26PM +0000, Jaegeuk Kim wrote:
> > > > This patch introduces a new address operation, a_ops->ra_folio_order(), which
> > > > proposes a new folio order based on the adjusted order for page_cache_sync_ra.
> > > > 
> > > > Hence, each filesystem can set the desired minimum order of folio allocation
> > > > when requesting fadvise(POSIX_FADV_WILLNEED).
> > > 
> > > Again, you've said what but not why.  Does the mm code not ramp up the
> > > folio order sufficiently quickly?  What are you trying to accomplish?
> > 
> > That's why I posted a series of the patches to provide more details. Could you
> > please check the last patch in the series to show fadvise() does not increase
> > the folio order?
> > 
> > https://lore.kernel.org/linux-f2fs-devel/20251201210152.909339-5-jaegeuk@kernel.org/T/#u
> 
> So what you're trying to say is that readahead() currently only uses
> order-0 pages and you want it to use larger order pages?  I agree with
> that!  But I don't think this is the way to do it.  We should just use
> larger order allocations, always.  None of this "call the filesystem,
> check a sysfs parameter".  Just use the largest order page that fits.

I got that, and posted v2.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
