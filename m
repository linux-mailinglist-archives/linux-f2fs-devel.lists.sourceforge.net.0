Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CC72D392A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Dec 2020 04:15:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmpxA-0005JZ-5d; Wed, 09 Dec 2020 03:15:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kmpx9-0005J9-AJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 03:15:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sX1dnbAUTh+hrwv634lqTrA4nQ+b2QPUYBywankgDgU=; b=PZoFCywm1I6i+GS/CYxAYOK+6r
 PXupdiX2HQhh/Vkcr2te4RR+nNHZRAbntFiwIWbuEm8zPytVRA5OwZdOrb25/BeFysjCyS0MX0fU0
 qol41c8xXCFHxFODQqCs3qnULjtCfWCMztOJR/qgICpCutsajA+MMcnNWuYt/w+5Nqto=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sX1dnbAUTh+hrwv634lqTrA4nQ+b2QPUYBywankgDgU=; b=Q7mMkw04de1nB7RCAhsmMv5cUs
 79SU2KQuXMEX/pi6/xY5vs9aOPFmGCrl/ukzizEimcoH+wPfBKlVJxGHAlKGKZ8VG/7UrPopLCbe3
 irNDIHUf1ZtveMQtuna/gPKtAk6LWf8Belajkr7vLY0x3wQzT8AQH0+SDSN389uoif84=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmpx1-007JCR-N2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 03:15:43 +0000
Date: Tue, 8 Dec 2020 19:15:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607483728;
 bh=/4TCF+LoYzcyXRHmzC+6ypXWpRH+zDesJ+YVBcIHubI=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=aLahg2d33CLweu7xhCmj+NyikfQjlTnrdJKNKNP66cL2oBFj417284FYP0Xoy4PCX
 ewWVdfpu0TGF2ExWeQBjFI4/zZeG1S4H1ZQexJLzmablWlaZYfQZQQMJAgmA3tc4b2
 fJRnMMY3nKlT7cFXNukiAmwWEl5tO/3vcYP0OsnveA4bZwKUpFmI3FNN3Zc4Txx3Ku
 Twxrao+9ZCPEkFowmBomoWD6KXUeyG/ZUi45YtLLRNGG8VpPMn/NneufxlbTnSPobJ
 g06kc6WSERDwobDJ4kBsnhN+SQKEmkn+geqdsyg84j7Ey29HsfvGrHgyTa+5Zl+SWa
 9LlHGZmRCOHbQ==
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X9BBTr4uyb8wRtrP@sol.localdomain>
References: <20201205042626.1113600-1-daeho43@gmail.com>
 <X86RJdLhOVRm28Eu@gmail.com>
 <CACOAw_yp0LU-vcT2+NTF3ipibF6GvqfaQ4V=957CDPQLbes92Q@mail.gmail.com>
 <X88ZC4f2hZxAU3C0@gmail.com> <X9ASZV4ZBBPxCpU/@google.com>
 <55db08c3-6b3f-a78b-c40d-7f61cd7693b7@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55db08c3-6b3f-a78b-c40d-7f61cd7693b7@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kmpx1-007JCR-N2
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix race of pending_pages in
 decompression
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com, Daeho Jeong <daehojeong@google.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 09, 2020 at 09:34:06AM +0800, Chao Yu wrote:
> On 2020/12/9 7:55, Jaegeuk Kim wrote:
> > On 12/07, Eric Biggers wrote:
> > > On Tue, Dec 08, 2020 at 08:51:45AM +0900, Daeho Jeong wrote:
> > > > > I am trying to review this but it is very hard, as the f2fs compression code is
> > > > > very hard to understand.
> > > > > 
> > > > > It looks like a 'struct decompress_io_ctx' represents the work to decompress a
> > > > > particular cluster.  Since the compressed data of the cluster can be read using
> > > > > multiple bios, there is a reference count of how many pages are remaining to be
> > > > > read before all the cluster's pages have been read and decompression can start.
> > > > > 
> > > > > What I don't understand is why that reference counting needs to work differently
> > > > > depending on whether verity is enabled or not.  Shouldn't it be exactly the
> > > > > same?
> > > > > 
> > > > > There also seems to be some confusion about the scope of STEP_VERITY.  Before
> > > > > f2fs compression was added, it was a per-bio thing.  But now in a compressed
> > > > > file, it's really a per-cluster thing, since all decompressed pages in a
> > > > > compressed cluster are verified (or not verified) at once.
> > > > > 
> > > > > Wouldn't it make a lot more sense to, when a cluster needs both compression and
> > > > > verity, *not* set STEP_VERITY on the bios, but rather set a similar flag in the
> > > > > decompress_io_ctx?
> > > > > 
> > > > 
> > > > Eric,
> > > > 
> > > > Decompression and verity can be executed in different thread contexts
> > > > in different timing, so we need separate counts for each.
> > > > 
> > > > We already use STEP_VERITY for non-compression case, so I think using
> > > > this flag in here looks more making sense.
> > > > 
> > > > Thanks,
> > > 
> > > That didn't really answer my questions.
> > > 
> > > I gave up trying to review this patch as the compression post-read handling is
> > > just way too weird and hard to understand.  I wrote a patch to clean it all up
> > > instead, please take a look:
> > > https://lkml.kernel.org/r/20201208060328.2237091-1-ebiggers@kernel.org
> > 
> > Eric,
> > I also tried to review your patch, but it's quite hard to follow quickly and
> 
> Me too, it needs more time to check whether the cleanup doesn't miss any cases.
> 
> Thanks,
> 
> > requires stress tests for a while. Given upcoming merge window and urgency of
> > the bug, let me apply Daeho's fix first. By any chance, may I ask revisiting
> > your clean-up on top of the fix in the next cycle?
> > 
> > Thanks,

I'm not in a hurry, please just take a look when you have time.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
