Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 813B92794B9
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 26 Sep 2020 01:27:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kLx7C-0004Kn-Rk; Fri, 25 Sep 2020 23:26:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kLx7B-0004Kf-15
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Sep 2020 23:26:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2xEghGJ0+8pk6ruRTMklfYucDUkwXnzKydeHQN7fldY=; b=U43ge+YfEF86fIy9X7Zas8ntM9
 4ZEJIQHMGa4XFPjNfln0n3Lmk6TqEmGCQg8pgZs93htXvou/B5zjqsmVXhwDS7gOlLZeo6R3DGWmJ
 IREJ57+vJ3B3x07OOM9AH53CeHl3bc0m6pmDKZ+O4uEtGgV7NvD4Hht5fNhShxQXsG+Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2xEghGJ0+8pk6ruRTMklfYucDUkwXnzKydeHQN7fldY=; b=jJc+xFlmoLfQWzCkBCNF1HkuDX
 D3u55FfpqVOxYzSJMf5+7IlaohXvWvXwXhOjxgoBYVIORfDYMdDK6zQfmf07gZyyUsG7LiMqQY3eG
 /0baZTq2LBO8PbmsV/ZGAe7tyHuI3DdOnAn1p2ORqxlZ05Nylc7JOBMSi0d7m0Ehd/s4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kLx6w-008Tfg-OQ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Sep 2020 23:26:56 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F25F420829;
 Fri, 25 Sep 2020 23:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601076390;
 bh=Ca+5C4Qq7R31FZuRHwrNOl2Jy6rDjHaodxP6qmO+inw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lLZU0v5TejF7xpLUEs8cIIrG98WvPfbqDZo+VhEYCYT1NJSWJ/PcjqgTaiISPVleT
 IqXiO4j/3FNFJ6Mca7i6Cm7Xs9fn5i5Cku9OVE4qCgaayGRuI2nU5HtBqtUl9X4RYJ
 GHPwp6R9XagbbbwWoz7fyl2x5YEm6GmUatCDu65k=
Date: Fri, 25 Sep 2020 16:26:29 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <20200925232629.GD4136545@google.com>
References: <20200918030349.19667-1-yuchao0@huawei.com>
 <20200924200305.GA2568648@google.com>
 <dbf3a532-cd38-2b31-e4ab-e83505c6c9c4@huawei.com>
 <7a072554-9d64-b4ac-b85b-de0acd9e507f@huawei.com>
 <20200925170729.GA2843966@google.com>
 <d05174f0-4ca6-c492-8ce3-ac8f146e177c@kernel.org>
 <20200925232332.GA4136545@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925232332.GA4136545@google.com>
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kLx6w-008Tfg-OQ
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: fix to disallow enabling
 compress on non-empty file
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

On 09/25, Jaegeuk Kim wrote:
> On 09/26, Chao Yu wrote:
> > On 2020-9-26 1:07, Jaegeuk Kim wrote:
> > > On 09/25, Chao Yu wrote:
> > > > Jaegeuk,
> > > > 
> > > > I noticed that in dev branch there are several patches which have not been
> > > > sent to mailing list, could you please send them out?
> > > 
> > > Chao, which patches?
> > 
> > Jaegeuk, they are
> > 
> > 	f2fs: point man pages for some f2fs utils
> 
> Ah, just sent.
> 
> > 	f2fs: fix slab leak of rpages pointer
> 
> I did before?

I missed to add f2fs mailing list. Resent them.

> 
> > 
> > Thanks,
> > 
> > > 
> > > > 
> > > > Thanks,
> > > 
> > > 
> > > _______________________________________________
> > > Linux-f2fs-devel mailing list
> > > Linux-f2fs-devel@lists.sourceforge.net
> > > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > > 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
