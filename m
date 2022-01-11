Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BA848B2E5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Jan 2022 18:07:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n7KcX-00088u-8l; Tue, 11 Jan 2022 17:07:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1n7KcW-00088n-Ac
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Jan 2022 17:07:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gN9GJswln7iEUW2lj7ht1Bi8HxfMOOaojitkMFyBuOk=; b=GmZzQQkGsG4lTpOu1AF/uHl3p/
 Yf9fkq5x52Aqap5ahfnk8RbbNziQyTwof5W6MhZreETteoJAYM7kTDycma8uOxUn9blwzw1WD2NqV
 Fl9Ka5TV59fBTNeW3/+7n4I1c0aBAjaoH1bAhNXfmeV0+TlUS51oZUVk4+PhBNJardh8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gN9GJswln7iEUW2lj7ht1Bi8HxfMOOaojitkMFyBuOk=; b=Fp6LioYMMj9JY545cikWLlNO/3
 mrP+R188PZDd5Cg0sRXTX5r6ni1Sjzqv6LIkjijOGGkjboH89p0Msxio5dK6XGcqCgQtotagbUzV3
 VXrUZpudWbptLsOHTATfUExQzw9YzcyXoVxSmmJP6VV37DYCKgSgs6ZClExSTU4Q0m1I=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n7KcR-00By8h-G0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Jan 2022 17:07:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 62BC4B81C01;
 Tue, 11 Jan 2022 17:07:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5145C36AE3;
 Tue, 11 Jan 2022 17:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641920843;
 bh=1aKvxW1YjvTIY3SBy7OkI59R1o/3bPCk/XviHnCmEPo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TNK5jsKyZfzfJigQ7f1P2eieBU+GE29GZ336tyBkCrd4LIDmH04JRVL5EoJLOJpnf
 ec+IleccxRjHoBiH88ETRiwKbmLG9YoZvUwadgroGHmm1F3rNvjOe1uOW9WrlVPVtb
 GJC9+OwIKVEfO8A+NTABJqML7ZZSetQLRf12wMcagXcM6W9lpIS4GpNLvZvhLipSl3
 jn+eO0L3R8dz5eW4KXwsFlj6JqJXHoEK5uTTdef9DgsCn4dovOT4Rj8AIDxfFojOA7
 ut36nhQBcFNRN08x8AwHLvzHVMqDfyvp2U2hhZZkETRXNvBoUjunsOqfujhStR/Vlj
 0Kq8BcMlqj0pA==
Date: Tue, 11 Jan 2022 09:07:21 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Waiman Long <longman@redhat.com>
Message-ID: <Yd25SWaqEDSpR1vO@google.com>
References: <20220108164617.3130175-1-jaegeuk@kernel.org>
 <YdvoxkAAquI17UbX@infradead.org>
 <a23a3226-95d9-9835-c1c7-2d13f4a1ee16@redhat.com>
 <CAEe=SxnWeK0pSfijPKJSTxBiMgD1Ev69fV3qSTCgWASk0b3vhA@mail.gmail.com>
 <9efbbcb7-29cd-a8ab-0632-01986edc862f@redhat.com>
 <CAEe=Sx=C8e7=A6ziy8dYC+FvkWvVYZ+o=XMCP_4vX0efsUPT4Q@mail.gmail.com>
 <86891228-9c91-09f1-0e2d-0a3392649d52@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86891228-9c91-09f1-0e2d-0a3392649d52@redhat.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/11, Waiman Long wrote: > > On 1/11/22 01:53, Tim Murray
 wrote: > > On Mon, Jan 10, 2022 at 8:15 PM Waiman Long <longman@redhat.com>
 wrote: > > > That is not how rwsem works. A reader which fails [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1n7KcR-00By8h-G0
Subject: Re: [f2fs-dev] [PATCH] f2fs: move f2fs to use reader-unfair rwsems
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
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Tim Murray <timmurray@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/11, Waiman Long wrote:
> 
> On 1/11/22 01:53, Tim Murray wrote:
> > On Mon, Jan 10, 2022 at 8:15 PM Waiman Long <longman@redhat.com> wrote:
> > > That is not how rwsem works. A reader which fails to get the lock
> > > because it is write-locked will remove its reader count before going to
> > > sleep. So the reader count will be zero eventually. Of course, there is
> > > a short period of time where the reader count will be non-zero until the
> > > reader removes its own reader count. So if a new writer comes in at that
> > > time, it will fail its initial trylock and probably go to optimistic
> > > spinning mode. If the writer that owns the lock release it at the right
> > > moment, the reader may acquire the read lock.
> > Thanks for the correction, that makes sense. I haven't spent too much
> > time on rwsem internals and I'm not confident about when flags are set
> > and cleared in sem->count; is there a case where sem->count after
> > up_write() could be nonzero?
> > 
> > An example from one trace:
> > 
> > 1. Low-priority userspace thread 4764 is blocked in f2fs_unlink,
> > probably at f2fs_lock_op, which is a wrapper around
> > down_read(cp_rwsem).
> > 2. f2fs-ckpt runs at t=0ms and wakes thread 4764, making it runnable.
> > 3. At t=1ms, f2fs-ckpt enters uninterruptible sleep and blocks at
> > rwsem_down_write_slowpath per sched_blocked_reason.
> > 4. At t=26ms, thread 4764 runs for the first time since being made
> > runnable. Within 40us, thread 4764 unblocks f2fs-ckpt and makes it
> > runnable.
> > 
> > Since thread 4764 is awakened by f2fs-ckpt but never runs before it
> > unblocks f2fs-ckpt in down_write_slowpath(), the only idea I had is
> > that cp_rwsem->count is nonzero after f2fs-ckpt's up_write() in step 2
> > (maybe because of rwsem_mark_wake()?).
> > 
> > > I do have a question about the number of readers in such a case compared
> > > with the number of writers. Are there a large number of low priority
> > > hanging around? What is an average read lock hold time?
> > > 
> > > Blocking for 9.7s for a write lock is quite excessive and we need to
> > > figure out how this happen.,
> > Just to be 100% clear, it's not a single 9.7s stall, it's many smaller
> > stalls of 10-500+ms in f2fs-ckpt that add up to 9.7s over that range.
> > 
> > f2fs is not my area of expertise, but my understanding is that
> > cp_rwsem in f2fs has many (potentially unbounded) readers and a single
> > writer. Arbitrary userspace work (fsync, creating/deleting/truncating
> > files, atomic writes) may grab the read lock, but assuming the
> > merge_checkpoint option is enabled, only f2fs-ckpt will ever grab the
> > write lock during normal operation. However, in this particular
> > example, it looks like there may have been 5-10 threads blocked on
> > f2fs-ckpt that were awakened alongside thread 4764 in step 2.
> > 
> > I'll defer to the f2fs experts on the average duration that the read
> > lock is held.
> 
> Thanks for the explanation.
> 
> Another question that I have is whether the test result is based on the
> latest upstream kernel or earlier kernel version. We used to allow reader
> optimistic spinning which was then removed in later kernel. Reader
> optimistic spinning may further increase writer wait time.

It's on 5.10 kernel having all the upstream f2fs patches, and yes, we wanted
to get higher priority on writer over many readers since the writer, checkpoint,
is the  most latency-critical operation that can block all the other filesystem
operations.

> 
> Anyway, AFAICS, this patch keeps readers out of the rwsem wait queue and so
> only writers can go into it. We can make an unfair rwsem to give preference
> to writers in the wait queue and wake up readers only if there is no more
> writers in the wait queue or even in the optimistic spinning queue. That
> should achieve the same effect as this patch.

Can we get a patch for the variant to test a bit? Meanwhile, I think we can
merge this patch to add a wraper first and switches to it later?

> 
> Cheers,
> Longman


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
