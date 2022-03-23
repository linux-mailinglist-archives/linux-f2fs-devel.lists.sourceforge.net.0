Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0825A4E5AA0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Mar 2022 22:25:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nX8U3-0000iC-NK; Wed, 23 Mar 2022 21:25:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nX8U2-0000i5-Li
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Mar 2022 21:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/7MvI86TNi6twDzmvx9QeSCyVlj9eT0WFUP1oxc8PRg=; b=XjccjsBGiyGGXzQHObsyXYqH2u
 xc7TvKWIouKfSemGHGpNiH4yBOnFxIQTxq1x2but2IGc5daRWhP9J7wk7Th45jbqjLnF119BlAG9i
 4hRnn7eJtucmjWRMNb+D8afCWEY0Ru/WoiXjRaZLaYmUkRYHFF09HEHg8S3IdCvjMDxE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/7MvI86TNi6twDzmvx9QeSCyVlj9eT0WFUP1oxc8PRg=; b=G16QDO7OxH/hfjvRiCSqVRz9Zn
 QUBSRVM1uIBoKVLLjK6hSP2QhGEN9bxI1ZxmQu3W0KAhU/0plbmxf+AWMFPTaOA2h9ZF+0pS16EK9
 5IjZXcbe4+ACqO5LLalYqrNHlpngB2RTWQJCE1NtnxF1XVShS7O1FPnYXleA+QeNPOU8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nX8Tz-0001PR-Ok
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Mar 2022 21:25:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84B7B61727;
 Wed, 23 Mar 2022 21:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B2AC340ED;
 Wed, 23 Mar 2022 21:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648070721;
 bh=UNfONMtlF855BsJew0qEGgqnLnCWd3MQfe8qfpIICXM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SY0pUtLwEFmemMc6BZVriNke9zLCOi/pYPhuWuejyDUBd70A8xAnFJbqzgllZ6rT5
 HoCLYgkEjppmpltqvKChQT37aZgltqQXNv2iWUrVVS3vSR+/tTJmWQ8vZh7RAxDcOz
 3sJeUqLuSZShT/0AGNS+DKzuT8jolHvE+e8KqCq2n3yIQWnbkMAVwEbe/DQSe1PUKP
 QAlDU25zXQktF1giyAYmRkOqiOxe68tKJZyfleBt3/VrDB7DoglaKeKCZ93+NGalht
 /wSk+1BLdeDsXHv7uD+ld6Jjy21m28vAMEGeGKiAUrlxHxyRMOWD2t68D9BujI4gYf
 CtD4s/qFa7y0w==
Date: Wed, 23 Mar 2022 14:25:19 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Waiman Long <longman@redhat.com>
Message-ID: <YjuQP/L3EnAF/NE8@google.com>
References: <YjjihIZuvZpUjaSs@google.com>
 <CAHk-=wgsmvoJFKFWxQ2orEVUOWH1agk9iUNZ=-DFh5OXZL=Ldw@mail.gmail.com>
 <YjrNRpbo/i3tgbAA@infradead.org> <YjtPUec8jiqUXGuf@google.com>
 <5acaaf61-5419-178d-c805-62f979697653@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5acaaf61-5419-178d-c805-62f979697653@redhat.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/23, Waiman Long wrote: > On 3/23/22 12:48, Jaegeuk Kim
 wrote: > > On 03/23, Christoph Hellwig wrote: > > > On Tue, Mar 22, 2022
 at 10:22:50AM -0700, Linus Torvalds wrote: > > > > On Mon, Mar 21, [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nX8Tz-0001PR-Ok
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
Cc: Christoph Hellwig <hch@infradead.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/23, Waiman Long wrote:
> On 3/23/22 12:48, Jaegeuk Kim wrote:
> > On 03/23, Christoph Hellwig wrote:
> > > On Tue, Mar 22, 2022 at 10:22:50AM -0700, Linus Torvalds wrote:
> > > > On Mon, Mar 21, 2022 at 1:39 PM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
> > > > > In this cycle, f2fs has some performance improvements for Android workloads such
> > > > > as using read-unfair rwsems [...]
> > > > I've pulled this, but that read-unfair rwsem code looks incredibly
> > > > dodgy. Doing your own locking is always a bad sign, and it ahs
> > > > traditionally come back to bite us pretty much every time. At least it
> > > > uses real lock primitives, just in a really odd way.
> > > FYI, Peter and I both pointed this out when the patches were posted
> > > and NAKed the patch, but the feedback was ignored.
> > Christoph, I proposed,
> > 
> > "I've been waiting for a generic solution as suggested here. Until then, I'd like
> > to keep this in f2fs *only* in order to ship the fix in products. Once there's
> > a right fix, let me drop or revise this patch again."
> > 
> > https://lore.kernel.org/linux-f2fs-devel/YhZzV11+BlgI1PBd@google.com/
> > 
> I suspect f2fs may also need the 617f3ef95177 ("locking/rwsem: Remove reader
> optimistic spinning") to give higher priority to writer. Please let me know
> the test result when you are able to test v5.15 LTS to see if these commits
> are able to address the f2fs issue.

Sure, I'll keep an eye on it, but next kernel is likely to be applied to the
products in next year. It may take some time. :(

> 
> I have some ideas of making a reader-unfair rwsem, but that requires either
> the introduction of a set of new down_read() variants or keeping the unfair
> state in the rwsem itself. I would like to make sure that there is really a
> need for such a thing before working on it.
> 
> Cheers,
> Longman
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
