Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E46F636D02
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Nov 2022 23:19:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oxy5i-0002pz-PS;
	Wed, 23 Nov 2022 22:19:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oxy5h-0002pt-7p
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Nov 2022 22:19:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NA3WIqVeUF8C//K3/M14wm74G2U0UROgiVHBFIEfHR0=; b=lH5nuomYyKqjUSOuYqdeKvUulJ
 d50J6bwDcr7pzy1EqhJrgyo2gN5PJM1n4vPTroS8V+j3y88wYjtZTwlsdGWnoD1zgimoJZWQefm4s
 nxJr5EWcOZJfgg5Eqv9DIlN6qvVrlMwnqVc/T9BIa93fmD7nQ57bMTQn3SRzO1fpSpCs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NA3WIqVeUF8C//K3/M14wm74G2U0UROgiVHBFIEfHR0=; b=mOf3iRNA/ZO400MwbwSNQjd7kD
 xxzZ2u8g902O5AVhQ2jWAhpiDjwBrRrhaNWxBZwOUWykUrelNe8UhyV+QfGciMjuwQL+5ICWSWNzt
 mggpVa844gc3cCqp97q1YyxIm1msH30NND1mvjSC6o/11JYjK+r/XQQG7rfyNWEp+pZE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oxy5g-0007mf-LC for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Nov 2022 22:19:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 45E4F61F3C;
 Wed, 23 Nov 2022 22:19:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88EDFC433D6;
 Wed, 23 Nov 2022 22:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669241970;
 bh=ZZiwh5s9GrphvhQmAD0il03WldxNsbh9fhgz97VZw4s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cfWEMTHSzfV7pNdYK4NSlbwYxT08YbQL83lw1ZZe2T2w9m6gFY0Z33+VuOEcLDz0L
 4DLMAlY7uhO1W/eb3OvFQ2l34uind+Oyc+zx56bOJHbzr5lkF7GWd+z9V7FAa6Hiti
 8h+AS0qKCRGcg8cFz+nGlgLWx1hcWOaZDWKe/Bok/8kgFiwiWwIHMpWva7Eaurf0yc
 inxjU41zPrNJLB8SOv58ttgUH4Wrfc9aTH0xSfVsdL+yeGs2dcPwn6LaaiDtdcKsk8
 XAKo1Nvn9KtnhNAIv4HS6U/I9dWxpozPYWEc1JH+9LD9VTDhNWY+aZjLRkMczKQUqW
 obOmJADBUyqfQ==
Date: Wed, 23 Nov 2022 22:19:29 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Message-ID: <Y36ccbZq9gsnbmWw@gmail.com>
References: <20221028175807.55495-1-ebiggers@kernel.org>
 <Y2y0cspSZG5dt6c+@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y2y0cspSZG5dt6c+@sol.localdomain>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Nov 10, 2022 at 12:21:06AM -0800, Eric Biggers wrote:
 > On Fri, Oct 28, 2022 at 10:58:07AM -0700, Eric Biggers wrote: > > From:
 Eric Biggers <ebiggers@google.com> > > > > As a step towards fre [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oxy5g-0007mf-LC
Subject: Re: [f2fs-dev] [PATCH v3] fsverity: stop using PG_error to track
 error status
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Nov 10, 2022 at 12:21:06AM -0800, Eric Biggers wrote:
> On Fri, Oct 28, 2022 at 10:58:07AM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > As a step towards freeing the PG_error flag for other uses, change ext4
> > and f2fs to stop using PG_error to track verity errors.  Instead, if a
> > verity error occurs, just mark the whole bio as failed.  The coarser
> > granularity isn't really a problem since it isn't any worse than what
> > the block layer provides, and errors from a multi-page readahead aren't
> > reported to applications unless a single-page read fails too.
> > 
> > f2fs supports compression, which makes the f2fs changes a bit more
> > complicated than desired, but the basic premise still works.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> > 
> > In v3, I made a small simplification to the f2fs changes.  I'm also only
> > sending the fsverity patch now, since the fscrypt one is now upstream.  
> > 
> >  fs/ext4/readpage.c |  8 ++----
> >  fs/f2fs/compress.c | 64 ++++++++++++++++++++++------------------------
> >  fs/f2fs/data.c     | 48 +++++++++++++++++++---------------
> >  fs/verity/verify.c | 12 ++++-----
> >  4 files changed, 67 insertions(+), 65 deletions(-)
> 
> I've applied this to the fsverity tree for 6.2.
> 
> Reviews would be greatly appreciated, of course.
> 

Jaegeuk and Chao, can I get a review or ack from one of you?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
