Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E041C7997
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 May 2020 20:43:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWP0j-00057f-Qm; Wed, 06 May 2020 18:43:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jWP0i-00057X-0H
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 18:43:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fUI7oDce44pUZkcDBBk5dPadpr4Gy+1fNFc+b3uIujE=; b=B8KQ1cilHVEyevtVsuE0Oi5zzE
 tMP0Yq9QX+se2NEtidpNKpF5L+Porfc329DEbme21eRepm2VOAGo9HlD0xAmuIvyRu10x17fiE9kh
 cj0szzdA2Z9TgCneZdJCVhPcjSfQqLQx3PR92Roa5GEfpo5vP9Lir9mov1xzxWp2oAqY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fUI7oDce44pUZkcDBBk5dPadpr4Gy+1fNFc+b3uIujE=; b=TjJd15D9k3V+QcLG2HwUESvw8a
 j3XsFH2WJdbkA3DHhjc9C+oOATkDOxl7Nx9v9C+HR+2/M4Hxa8jtGKJZ7rNTbR7Fa612nX7ENDA30
 5ZZsKSzhgpXtZdxMBruEz82MwFd0Z2icl6KxdIG7AtRBqCu2yyOJbri3Iqb+VpTCLB/Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWP0f-00ABBV-VJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 18:43:11 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A947A20708;
 Wed,  6 May 2020 18:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588790582;
 bh=7wgeliBX3xJGZXbh1HJstndWK92mE6WWHwkxVJNcJ+k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=URXW4CgLPtIMjgFAMDCiKXmQT5FodihIKzs+tCFyRahbOofzHQAeFxCkX641qBwU9
 cVdjqYhEtBT4M2PkUrSizUG61Fy6QVwEemGfUlgtNL54KuJxUCST5qgIKsDGVcQDhW
 afUeRLcrvvleoYRbgZpocIiRROCHl6NVsxI+Dc6k=
Date: Wed, 6 May 2020 11:43:01 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200506184301.GA842@sol.localdomain>
References: <20200505204823.211214-1-ebiggers@kernel.org>
 <4143486a-41bf-e92f-cc99-c6a2d0a8270c@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4143486a-41bf-e92f-cc99-c6a2d0a8270c@huawei.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWP0f-00ABBV-VJ
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't return vmalloc() memory from
 f2fs_kmalloc()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 06, 2020 at 03:43:36PM +0800, Chao Yu wrote:
> On 2020/5/6 4:48, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > kmalloc() returns kmalloc'ed memory, and kvmalloc() returns either
> > kmalloc'ed or vmalloc'ed memory.  But the f2fs wrappers, f2fs_kmalloc()
> > and f2fs_kvmalloc(), both return both kinds of memory.
> > 
> > It's redundant to have two functions that do the same thing, and also
> > breaking the standard naming convention is causing bugs since people
> > assume it's safe to kfree() memory allocated by f2fs_kmalloc().  See
> > e.g. the various allocations in fs/f2fs/compress.c.
> > 
> > Fix this by making f2fs_kmalloc() just use kmalloc().  And to avoid
> > re-introducing the allocation failures that the vmalloc fallback was
> > intended to fix, convert the largest allocations to use f2fs_kvmalloc().
> 
> I've submitted one patch since you suggested when commented in compression
> support patch.
> 
> I remember Jaegeuk prefer to use f2fs_kvmalloc() to instead f2fs_kmalloc(),
> and keep the order of kmalloc - failed - kvmalloc.
> 

I think you're talking about
https://lkml.kernel.org/r/20191105030451.GA55090@jaegeuk-macbookpro.roam.corp.google.com?

I think that making the large allocations use kvmalloc(), as this patch does, is
good enough to address any memory allocation failures that may have been
encountered in the past.  We don't need to switch all allocations to use
kvmalloc(), as there's no benefit for small allocations.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
