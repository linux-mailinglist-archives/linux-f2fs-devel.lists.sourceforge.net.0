Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2684E4A42
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Mar 2022 01:58:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nWpKL-0003BD-GB; Wed, 23 Mar 2022 00:58:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <timmurray@google.com>) id 1nWpKL-0003B7-41
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Mar 2022 00:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tA0C2APjUPvxOGUAlEU8GKwotzyFo+z45yPKoKfaa6s=; b=QjeII+v7b6JvYLJHRbCWbjPn9E
 SQmsnoTuv/CI6dTjwbKoqu8AyeHY5gS9Zi0ufEV1zDvvB6mYXU5pGcnNSCSevkss8c1sAj6VDaJAg
 /cDp2m48IRs08IvBXKofzZqjn+UNJsAh8BMvqLux5fwCzjRseo6pgnPsPV7wEkd5afCo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tA0C2APjUPvxOGUAlEU8GKwotzyFo+z45yPKoKfaa6s=; b=gtz6lxuKV3DPeK0vYnGHR2BTre
 vtu+XliX3aZvasbpbFAheT0XAluUEOiA9YIn7lek9qATAnWBJb+MzIrlyeGMFLeBnbwPpK9MCSVtV
 uK/jBRmJ8yvo5Ack6iMn0lSvfZ9zv8dCFLQ58nAf0WHSDbkCmJCwV2TtFAIdtKnyRIfM=;
Received: from mail-qv1-f50.google.com ([209.85.219.50])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nWpKF-0091kN-RR
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Mar 2022 00:58:15 +0000
Received: by mail-qv1-f50.google.com with SMTP id kk12so155086qvb.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Mar 2022 17:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tA0C2APjUPvxOGUAlEU8GKwotzyFo+z45yPKoKfaa6s=;
 b=UIfE2szw5aFGRoxdGdKE3qdtZTi2+u5iPxxQjMMmCXkTbWP9F9bS2qGnERpXXLziPK
 1EWr+DZb6FZ13CMYpQnNPp4JKmpJ3dLI01g0r/6LJD9nelX37RczDQbcLY05lS4IaXKF
 LWtztqIuurveXB2MF9ZoqK9exAeKxKg49K/vj9UUZ/kFNra7vFHpdGR4Z/XzfSlfqHPs
 e8sEN3urYQl4Q/T5nDW9solGeNgNKb/Pf/7eccQQx6v/IW4hIybJszkF5C4BYH+REEdt
 UhYkU+3XP3D+TT4ECPVJAftyRi0R62VQLZGh+t7KeRVjVRTA/WR5MATXPVZirokf8J5Z
 qmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tA0C2APjUPvxOGUAlEU8GKwotzyFo+z45yPKoKfaa6s=;
 b=nCcrIZDf/sjWPCQVvJzFweDbGT6390J5rSUnMReAR9ZQxmVCsN/wONWeXYfmifwgN5
 iz4abLWZx3CDyI9kMjvBOwqhuKem4i/EHDYsNM2QrAGpc0NAKapyDvFH04v20LGHn0k2
 S1gla54R1pLp15bzViwg7X8WK6keuwdqcezGeKd42liqF9EPmsAeYRZ21OR9y3IZteLm
 DlbSQe27Uen5m7AkLf4vLYA27S+i0E1s/olh1vpOBSOkrH8leSvEoGYpn4JL98DtNH8G
 WSl86Hv8ftoLtQwtPFnTS6a86g8J2y6Dlm6xf5g7A/05xkx4HDd2LQSmfMukJhdfwXFv
 yVrQ==
X-Gm-Message-State: AOAM531h1WfSxZXMYt2xgKTYWXb+xJKVyPJc+NFHjsGok6uLYvi140Nw
 qFC+9XPauVexHY7yictIEDHRYKVNlrXxcajMEXVUWM3M0mnhMA==
X-Google-Smtp-Source: ABdhPJyLub9dB4R+fTlvR/EuxqZBTpRYAlQxAPGC3ICdYzW6yU0PKlpe2iYHRKc8ZjLENRyagkWkRieQ+5Z4BKCX/V8=
X-Received: by 2002:a67:ee95:0:b0:324:d2e8:9b5e with SMTP id
 n21-20020a67ee95000000b00324d2e89b5emr9463036vsp.58.1647995669348; Tue, 22
 Mar 2022 17:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <YjjihIZuvZpUjaSs@google.com>
 <CAHk-=wgsmvoJFKFWxQ2orEVUOWH1agk9iUNZ=-DFh5OXZL=Ldw@mail.gmail.com>
 <51cded74-3135-eed8-06d3-0b2165e3b379@redhat.com>
 <CAHk-=wi=Xsekgj7zfw_vpOM673CG24vznmz-yx9G05rWSAAYXg@mail.gmail.com>
In-Reply-To: <CAHk-=wi=Xsekgj7zfw_vpOM673CG24vznmz-yx9G05rWSAAYXg@mail.gmail.com>
Date: Tue, 22 Mar 2022 17:34:17 -0700
Message-ID: <CAEe=Sxmcn5+YUXBQhxDpzZVJu_T6S6+EURDqrP9uUS-PHGyuSg@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, On Tue, Mar 22, 2022 at 10:50 AM Linus Torvalds
 <torvalds@linux-foundation.org> wrote: > > Even when people get the semantics
 and memory ordering right (which is > not always the case, but at least th
 [...] Content analysis details:   (-15.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 white-list
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.50 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.50 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1nWpKF-0091kN-RR
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
From: Tim Murray via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Tim Murray <timmurray@google.com>
Cc: Waiman Long <longman@redhat.com>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Linus,

On Tue, Mar 22, 2022 at 10:50 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Even when people get the semantics and memory ordering right (which is
> not always the case, but at least the f2fs code uses real lock
> primitives - just oddly - and should thus be ok), it invariably tends
> to be a sign of something else being very wrong.
>
> And I can easily believe that in this case it's due to a rmsem issue
> that was already fixed long long ago as per Waiman.
>
> Can people please test with the actual modern rwsem code and with the
> odd reader-unfair locks disabled?

I did try the patch from Waiman (backported to a local Android device
running 5.10 without the unfair-rwsem patch) when we were first
discussing this, and as far as I could tell, his patch did not make a
difference for this problem. I think I can explain why it solves a
different problem, and it is related to how f2fs uses locking
primitives and worker threads. In this case, it's important to know
that f2fs's checkpoint thread coalesces checkpoints on behalf of all
userspace threads calling fsync(), userspace threads calling many f2fs
functions take the read lock on the rwsem, and the checkpoint thread
takes the write lock. The userspace threads can be any CFS priority
and may be throttled for various reasons (constrained cpuset or cpuctl
runtime limits).

Here's one example from a trace associated with a very slow app start
from a 5.10 device before the unfair-rwsem patch:

1. pid 6711, a random userspace thread, is running on a CPU at time 0ms.
2. After 2.6ms of running, pid 6711 enters state D, deschedules, and
is blocked in f2fs_new_inode according to sched_blocked_reason (a
tracepoint we added in the Android kernel that emits the function
where a thread is blocked in uninterruptible sleep).
3. The f2fs_checkpoint thread runs 5ms after pid 6711 deschedules.
f2fs_ckpt runs for 63us, makes pid 6711 runnable, and then deschedules
in state D blocked at rwsem_down_write_slowpath.
4. pid 6711 remains runnable for 341ms--it's a low priority thread in
a throttled process and the system is busy. Meanwhile, f2fs_ckpt
remains in D for 341ms.
5. pid 6711 finally runs and makes f2fs_ckpt runnable after 11us.

If the problem were related to optimistic spinning that would be
addressed by Waiman's patch, I'd expect to see pid 6711 running
concurrently with f2fs_ckpt. However, that's not what happens; there's
a 5ms gap in between pid 6711 blocking on the read lock and f2fs_ckpt
running. AFAICT, what's happening is that rwsem_down_read_slowpath
modifies sem->count to indicate that there's a pending reader while
f2fs_ckpt holds the write lock, and when f2fs_ckpt releases the write
lock, it wakes pending readers and hands the lock over to readers.
This means that any subsequent attempt to grab the write lock from
f2fs_ckpt will stall until the newly-awakened reader releases the read
lock, which depends on the readers' arbitrarily long scheduling
delays.

AFAICT, any solution for this problem that doesn't require an overhaul
of f2fs locking requires that the newly-awakened readers can't block
f2fs_ckpt until they are scheduled and grab the read lock. Either we
could do something trylock-related like this patch implemented, or we
could move f2fs to percpu_rwsem. However, moving to percpu_rwsem means
no optimistic spinning, which also seems bad given how short the
read-locked critical sections are. We have seen similar problems with
contention on the cgroup percpu_rwsem that spin-on-owner could have
alleviated, so I'm hesitant to get rid of optimistic spinning for f2fs
by switching to percpu_rwsem.

The most obvious objection to the patch is that f2fs_ckpt will still
stall if a reader deschedules while holding the lock. That is
absolutely true! However, in practice, we were hitting the worst case
every time because any attempt to grab the read lock while f2fs_ckpt
holds the write lock exposes f2fs_ckpt to arbitrary scheduling delay
from the reader. The reader-unfair rwsem patch prevents this problem.
We have evidence this is true in practice, too. I just ran a quick
comparison on 150 slow app start traces from our internal population
comparing kernels pre- and post-unfair-rwsem patch, and the percentage
of time the thread responsible for UI was stalled on f2fs locks went
from ~50% of all uninterruptible sleep time on that thread to less
than 5%.

I think this is a special case where fairness to readers is explicitly
harmful because any thread at any priority can block on the only
writer (f2fs_ckpt) but any low priority thread could be a reader
blocking the only writer. I don't know if it's worth explicit support
in rw_semaphore for this kind of use case, but I don't think an
existing rwsem patch addresses this issue because it is so unusual.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
