Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 542E94E56E2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Mar 2022 17:48:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nX49v-0003ki-Im; Wed, 23 Mar 2022 16:48:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nX49u-0003kb-P7
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Mar 2022 16:48:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iS0yrgXdzCc5O9c0UO6QbVnz4W5jPqnMFFb4jpEep+8=; b=f8Q5L7EkfomBiFoN2hwdwVlxet
 29mrt1QQiA4TKFEIH6DgWVewfUe3ae+cwTV5GU91cYkSME5TDHuWgxAaYzinToIoUipWTPgpNI1eQ
 isBtHI3d7s4F2vs6qW8JrWGdOOjRmvUR72mIZD9TlSKBhB2gYhMSdjYyBNRfbnt90wa0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iS0yrgXdzCc5O9c0UO6QbVnz4W5jPqnMFFb4jpEep+8=; b=mjO9XtRx+aqN2kmtNYNscAu7bf
 +SFZXhnNRy3fW++Rwl1W6DiGVvUswur/bJ2KTaTq5p7M8e5CuFdTUUnYcSbuGteY1Bqb/hAi2mz6R
 LFTCVeVO1s+qoT5jxkpM16yFQniHVLTpGhwqKwnc4pPvq05zqvcGkHvE6DQjrijDQHUg=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nX49r-009dJh-6o
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Mar 2022 16:48:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B3CBDB81FB6;
 Wed, 23 Mar 2022 16:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 312B9C340E8;
 Wed, 23 Mar 2022 16:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648054099;
 bh=KZysVJrReQA7i1Z1nRSDq4ryI+V0LIK35Q/WCAy5knM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kp0Ve9OH3/g0gQycRRJwUAl727z9uGUeetTB8IEQo4X9sqVNZ3Q2cZswd8Ncp9YFs
 l0lIZJoQGYohEDJjw2V7mkP65cBS/azJzO9PXy+q0YaCzY+Sp6xRBVHArVASk6PDqa
 R24FtNd2pjlMiUWtVeX/adzRoPj/xJqWx6KWT15EMq2UiTI5Dg6kaX2t0GpRvXbgC1
 0A7suf+GxwDWZKyioMW7Vwl4QxmE3VcoHG0DCpkKmF+9KxWCl9F7//FlOr0RPO6KDH
 wqdoJuz0Tnm5Gm0leMonwMHRwv8niqJrlvjRnm4fHR4ZxTgVQhMP6d/y0VBd9DCuuF
 En/iOcQ7w/yNA==
Date: Wed, 23 Mar 2022 09:48:17 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <YjtPUec8jiqUXGuf@google.com>
References: <YjjihIZuvZpUjaSs@google.com>
 <CAHk-=wgsmvoJFKFWxQ2orEVUOWH1agk9iUNZ=-DFh5OXZL=Ldw@mail.gmail.com>
 <YjrNRpbo/i3tgbAA@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YjrNRpbo/i3tgbAA@infradead.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/23, Christoph Hellwig wrote: > On Tue, Mar 22, 2022
 at 10:22:50AM -0700, Linus Torvalds wrote: > > On Mon, Mar 21, 2022 at 1:39
 PM Jaegeuk Kim <jaegeuk@kernel.org> wrote: > > > > > > In this cyc [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nX49r-009dJh-6o
Subject: Re: [f2fs-dev] [GIT PULL] f2fs for 5.18
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
Cc: Peter Zijlstra <peterz@infradead.org>, Waiman Long <longman@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/23, Christoph Hellwig wrote:
> On Tue, Mar 22, 2022 at 10:22:50AM -0700, Linus Torvalds wrote:
> > On Mon, Mar 21, 2022 at 1:39 PM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
> > >
> > > In this cycle, f2fs has some performance improvements for Android workloads such
> > > as using read-unfair rwsems [...]
> > 
> > I've pulled this, but that read-unfair rwsem code looks incredibly
> > dodgy. Doing your own locking is always a bad sign, and it ahs
> > traditionally come back to bite us pretty much every time. At least it
> > uses real lock primitives, just in a really odd way.
> 
> FYI, Peter and I both pointed this out when the patches were posted
> and NAKed the patch, but the feedback was ignored.

Christoph, I proposed,

"I've been waiting for a generic solution as suggested here. Until then, I'd like
to keep this in f2fs *only* in order to ship the fix in products. Once there's
a right fix, let me drop or revise this patch again."

https://lore.kernel.org/linux-f2fs-devel/YhZzV11+BlgI1PBd@google.com/


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
