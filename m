Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C88DC992A8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 01 Dec 2025 22:25:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tt9sI1zkxjlBRzi1MjlwxYQGGW8xDDbvhf+XeWDQk34=; b=OxSYUenO1g/OH2PpGRvoABbk7j
	x/auyEstNbJbVmQSXN+VE8VjY/CYtQugGw17b8uk/jb9n5CJJBym+99XIBYFcwDMFsmdzKNXyxx8g
	BnRAELVPkP48d+Bzxd+kKWw6dxvovL1XirCVVRPrwPSaeLPsl9gyfmtr1q2doZP0aVEM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQBOC-00044L-3y;
	Mon, 01 Dec 2025 21:24:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vQBOA-00044E-Tl
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 21:24:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G/C5feLyQAWHnHqc78p55PKOT9HaqND2VHQRb+DoaN4=; b=XlAzWDITqhizBCl1BArRZkLqPr
 MavGWgjoLDJG+x5GcK9Az6jl34s96EUhCv0LEeupAxIPsywM+Ews7+g8ieUebD1hLWQ/ipI/aZFEQ
 uB5s2kABqczNlNeRqp0GwP6NusDREFhS+vHLk8TuUm/dxobu0E+ZOF1HLvowgsFTt/mk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G/C5feLyQAWHnHqc78p55PKOT9HaqND2VHQRb+DoaN4=; b=jE7qkMKkf4AWe0NSxC6Zd+ZswU
 SYAy5nRBheMaZv91gxn8BGG9JnWrraUnXWCPa45OLooWCIZvMmsWtSPrgAWQBqvr3owy3Pihohr4W
 q38uEj4t8H58fXAVE0VgmEB2ngPKthQ+cK8VJ6QCuYFn2paLOSs8y4aSYcObmvzjN+QY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQBOA-00037D-Do for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 21:24:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C60266014A;
 Mon,  1 Dec 2025 21:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 529D1C4CEF1;
 Mon,  1 Dec 2025 21:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764624283;
 bh=Diz0+bACmjM2TLHSfLwYpuxzqSwiJwi5SM5gyk06rTM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WCmis196wqbZY9mJ/hMHAC4BslWXP9ZhUHtY0YTPcr5qTh+qDb6vUY9v0d1Sb8kAB
 e1FhyuslxKKlhO8Viqa1Og+MxmReifTKIDv55qcujT8JG00VqvpT04AdvDixdSpjL5
 WuXiHuHcb+vBwZ+ocU5qEjY+aWKOrn4+VVYUFHOHdiNKYnfPC5vCuGfK3Tv178olIt
 G3pS7SBEv8ZPYP42vp7mTmS05jfNtc2pqQMPy6+hTdU6MDsR6Aty8eLcWL+xDhd13S
 TM3bDnHbU8eYl2JaYFKJTQe+v0eKY6Ckgz+ILR34MbBtaUL7jJZvmmYTObWOhHNKh6
 sHan9gM8tPErQ==
Date: Mon, 1 Dec 2025 21:24:41 +0000
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <aS4HmeRgsStngE5v@google.com>
References: <20251201210152.909339-1-jaegeuk@kernel.org>
 <20251201210152.909339-4-jaegeuk@kernel.org>
 <aS4GgfzfuYRHJdg_@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aS4GgfzfuYRHJdg_@casper.infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/01, Matthew Wilcox wrote: > On Mon, Dec 01, 2025 at
 09:01:26PM +0000, Jaegeuk Kim wrote: > > This patch introduces a new address
 operation, a_ops->ra_folio_order(), which > > proposes a new foli [...] 
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
X-Headers-End: 1vQBOA-00037D-Do
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
> On Mon, Dec 01, 2025 at 09:01:26PM +0000, Jaegeuk Kim wrote:
> > This patch introduces a new address operation, a_ops->ra_folio_order(), which
> > proposes a new folio order based on the adjusted order for page_cache_sync_ra.
> > 
> > Hence, each filesystem can set the desired minimum order of folio allocation
> > when requesting fadvise(POSIX_FADV_WILLNEED).
> 
> Again, you've said what but not why.  Does the mm code not ramp up the
> folio order sufficiently quickly?  What are you trying to accomplish?

That's why I posted a series of the patches to provide more details. Could you
please check the last patch in the series to show fadvise() does not increase
the folio order?

https://lore.kernel.org/linux-f2fs-devel/20251201210152.909339-5-jaegeuk@kernel.org/T/#u


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
