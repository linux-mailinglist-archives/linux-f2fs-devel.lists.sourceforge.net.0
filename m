Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 874476DFB10
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Apr 2023 18:16:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmd9H-00060A-Lq;
	Wed, 12 Apr 2023 16:16:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pmd9D-000603-AW
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 16:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3ieQQMkDQJ+TSEiNHSHuIwxgeYRmv3vMpYh193kMNIs=; b=gn2dFLUE7KtT1uOXF3h8dAo3KL
 HYcg5klvlvsfFinkoZeEWv400pucMhpHfGMSCaGoyR2SzyyaA684pXJoVbEJg7kYXxzcGCNcUlU7v
 hzoINjxHgJMW1ZoI9rK6RCsF/+qpTBRO9dUlZqxk/FgKirkSl7CSFxv3kDiZG5+iEg5Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3ieQQMkDQJ+TSEiNHSHuIwxgeYRmv3vMpYh193kMNIs=; b=eGVABE2OUtLzJ5EY8qKOFguvWh
 WqurmdkaDW4ModZ5JuaUoCEBhRS5Cbxfpv1/BIV94C3zgun5eSOxSVRvI1fdV9pXFJBRoI24rHShk
 3yefYaKBv9pwBkKpH7XkmAV0ivyIv2ruEJvmAIljEn7p2FwT40wGdzRnmyjsIy8lNYWk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmd9A-0000MK-HH for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 16:16:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1FB2262EE5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Apr 2023 16:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A308C433D2;
 Wed, 12 Apr 2023 16:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681316190;
 bh=IEkH/ynJCXIAwn5YhmCClWHXwjym7LfLQzhX+bYkHdg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lXcrXlHST5Dx5SF0gScJarNkfcQbZvibjbPapL9lte46EYckhHWe55DyELsChtVXC
 w/gPU04e9udKubVl72EKAENZCh8sToPwCVL8457zPq6bLxNOLzRap/GyHh+1nfEvGk
 Th1yvxLQlWKW7iZC6+6leWcmBLTrPp2CrXXs90jNsPJHlVx6s2OdphIz7MSN/vp9lD
 bfDK3ElKjHc9rh0us9Cav1hyIQHvIbpcW2ypHFT2cAK7c5V5kspIQT5dQLF6/dBccK
 feqHaw/MVDtklbfScX7KVg/X8lx3nxnEcxn2DjB0epaE4PokeLB2Gni+NK6cJAlMwk
 2E/Bn+rn4lg0Q==
Date: Wed, 12 Apr 2023 09:16:28 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZDbZXG8pix/AG6/y@google.com>
References: <20230410022418.1843178-1-chao@kernel.org>
 <ZDRWdJxP6QzcIU7G@google.com>
 <b05d7ce8-ef98-a7ef-9873-4403ec0858c1@kernel.org>
 <ZDWRqRgwuLpkR7qO@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZDWRqRgwuLpkR7qO@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/11, Jaegeuk Kim wrote: > On 04/11, Chao Yu wrote: >
 > On 2023/4/11 2:33, Jaegeuk Kim wrote: > > > On 04/10, Chao Yu wrote: > >
 > > We have maintain PagePrivate and page_private and page referenc [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pmd9A-0000MK-HH
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: remove folio_detach_private() in
 .invalidate_folio and .release_folio
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/11, Jaegeuk Kim wrote:
> On 04/11, Chao Yu wrote:
> > On 2023/4/11 2:33, Jaegeuk Kim wrote:
> > > On 04/10, Chao Yu wrote:
> > > > We have maintain PagePrivate and page_private and page reference
> > > > w/ {set,clear}_page_private_*, it doesn't need to call
> > > > folio_detach_private() in the end of .invalidate_folio and
> > > > .release_folio, remove it and use f2fs_bug_on instead.
> > > > 
> > > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > > ---
> > > >   fs/f2fs/data.c | 7 +++++--
> > > >   1 file changed, 5 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > > > index 4946df6dd253..8b179b4bdc03 100644
> > > > --- a/fs/f2fs/data.c
> > > > +++ b/fs/f2fs/data.c
> > > > @@ -3737,7 +3737,8 @@ void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
> > > >   			inode->i_ino == F2FS_COMPRESS_INO(sbi))
> > > >   		clear_page_private_data(&folio->page);
> > > > -	folio_detach_private(folio);
> > > > +	f2fs_bug_on(sbi, PagePrivate(&folio->page));
> > > > +	f2fs_bug_on(sbi, page_private(&folio->page));
> > > 
> > > I think we can just check page_private() only.
> > 
> > Why? how about the case PagePrivate was set, but page_private was't? It must
> > be a bug as well?
> 
> Given the code, I think both are set all the time. My concern is someone is
> not doing set/get properly. Actually, I got a panic on page_private() when
> running fsstress overnight. I'm trying to reproduce it to find which bit was
> set.

It turned out that inline bit is somehow set, guessing the bit was not cleared
when the first dirty page was truncated or somewhere else.

Anyway, tooking a look at the usecase of flushing inline_data to inode page
aggressively, I feel it's kinda hack and may increase the checkpoint latency.
Hence, I'd like to remove it simply.

https://lore.kernel.org/linux-f2fs-devel/20230412160810.1534632-1-jaegeuk@kernel.org/T/#t

> 
> > 
> > Thanks,
> > 
> > > 
> > > >   }
> > > >   bool f2fs_release_folio(struct folio *folio, gfp_t wait)
> > > > @@ -3759,7 +3760,9 @@ bool f2fs_release_folio(struct folio *folio, gfp_t wait)
> > > >   	clear_page_private_reference(&folio->page);
> > > >   	clear_page_private_gcing(&folio->page);
> > > > -	folio_detach_private(folio);
> > > > +	f2fs_bug_on(sbi, PagePrivate(&folio->page));
> > > > +	f2fs_bug_on(sbi, page_private(&folio->page));
> > > > +
> > > >   	return true;
> > > >   }
> > > > -- 
> > > > 2.25.1
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
