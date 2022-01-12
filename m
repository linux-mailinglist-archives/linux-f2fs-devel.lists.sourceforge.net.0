Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5164248CE38
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Jan 2022 23:07:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n7llw-0003wD-8U; Wed, 12 Jan 2022 22:07:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <timmurray@google.com>) id 1n7llu-0003w7-0F
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Jan 2022 22:07:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y1JyjUsSG/tC90anes6eSOJnWR9Q3etKeOSBPf+5wCQ=; b=HW8r0R9FEwqx7M69hzmhw87NMU
 32Zh2BxNasQErBfXkMDcDoSIxd8G1K4vNSxkE+aSmTNJSSTwbloLJ7Np6Iq3OWnorlbbwfPQ7vedt
 x+4v2XiE4rg9julgCatYgbvcJpl9QJ79A1QffRHFWepL0Gd8CbZQ/L6/RtJWyGC65/HI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y1JyjUsSG/tC90anes6eSOJnWR9Q3etKeOSBPf+5wCQ=; b=IpJuarCXDtI44OdSER/RmOjloK
 3/YEZYbJfLkrvNwDb/SzpG8UWb99td53IRI3S/rNT7h5Yre3/+7Oc/T0oyjdToisb06C7q+8BHwgr
 MO6+MHcjzgiCt4ukbMOPoUWfoeKkr2KJ3BmWuUlkfjBux5i4BSr0rgyUSoRQYaspoCco=;
Received: from mail-il1-f173.google.com ([209.85.166.173])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1n7lls-00DpZu-MW
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Jan 2022 22:07:10 +0000
Received: by mail-il1-f173.google.com with SMTP id o20so3828371ill.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Jan 2022 14:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y1JyjUsSG/tC90anes6eSOJnWR9Q3etKeOSBPf+5wCQ=;
 b=Q3y6vBc/2NoSipdG9xyq0Hn/hNADh8AEXVhgOMQK06NhjCdW1rIcWXpcNkhXQKqyEt
 ZdYpL80INGC9DMb/IM/itKk+qU9l1w1s7Fd4Q6v0kcv3GHmgalpZs1sdFwo6a/E6BW1I
 /QySbH2GlxKD88Xoyzpn3FLPbrZqa2rBY+1D7UjSXuPAfKrhRDH0iJWTjGLQNauTO3Ny
 kOX0GuQ4qr2KxUFN56k9Vhqob66k39+P0581P06QniPREVAlZAqq/Q/NdEPrmzsUY1vN
 NFlHGqeL6yqwteFmhknMLi/XS9a5ewQQcl4PAuOGAWF1InMqSnDZIV4Quoee681tp8MJ
 SFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y1JyjUsSG/tC90anes6eSOJnWR9Q3etKeOSBPf+5wCQ=;
 b=zyzICbXZSPI2t3ZsEuA+BYbDc8z4QGQLbUggPoPrGUqs8hvk0HEyOZspekW5S04ZQ0
 hpkOatZR0ZJ2CzVK04k/9K1aQZY/lB97YLG5WfE79VjrK3BqAuHp5jUQQs+utaNEnYf8
 CQQDi0+KJpxDAmmiKUrwqj2S3WfQZd4kRPqJq+dZ1WlRtrUXIOn/3cC2uUVyg88aF5Rb
 mxY8wR+266WjJTrVbSe1Nm/Td+SirDReQ9qELHdc5ft2/Un0kPqKDlcULPNMY7JHxgRI
 zOTdqVIv5pxCCqELkp7BJ3vD//G4qqvMcvITOy0aC9ebo1Oczdn0b500z0DZQInj0tPT
 BcLw==
X-Gm-Message-State: AOAM531eLGlV+6TkJ7IheHaGiihvx1IrJAYJLCqqMeOXeTENU/yieTWm
 rp1PylCNf6sfNsL/W1nYYzGJxPe4kgFV6TQ5wLfOKQ==
X-Google-Smtp-Source: ABdhPJwtTKZa+3RSsHFzPVEwy1zhEcEH0RO3KzgBl2q6/1ObHwMzOZF5Yf/htiNz+TMmVc3xP/rjSBCQR/QIR4Eqp2c=
X-Received: by 2002:a05:6e02:d08:: with SMTP id
 g8mr858200ilj.115.1642025222909; 
 Wed, 12 Jan 2022 14:07:02 -0800 (PST)
MIME-Version: 1.0
References: <20220108164617.3130175-1-jaegeuk@kernel.org>
 <YdvoxkAAquI17UbX@infradead.org>
 <a23a3226-95d9-9835-c1c7-2d13f4a1ee16@redhat.com>
 <CAEe=SxnWeK0pSfijPKJSTxBiMgD1Ev69fV3qSTCgWASk0b3vhA@mail.gmail.com>
 <Yd7gVLdHW11TQUAi@hirez.programming.kicks-ass.net>
In-Reply-To: <Yd7gVLdHW11TQUAi@hirez.programming.kicks-ass.net>
Date: Wed, 12 Jan 2022 14:06:50 -0800
Message-ID: <CAEe=Sx=6FCvrp_6x2Bqp3YTzep2s=aWdCmP29g7+sGCWkpNvkg@mail.gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 12,
 2022 at 6:06 AM Peter Zijlstra <peterz@infradead.org>
 wrote: > *urgh*... so you're making the worst case less likely but
 fundamentally
 > you don't change anything. > > If one of those [...] 
 Content analysis details:   (-15.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.173 listed in list.dnswl.org]
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.173 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1n7lls-00DpZu-MW
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
From: Tim Murray via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Tim Murray <timmurray@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jan 12, 2022 at 6:06 AM Peter Zijlstra <peterz@infradead.org> wrote:
> *urgh*... so you're making the worst case less likely but fundamentally
> you don't change anything.
>
> If one of those low prio threads manages to block while holding
> cp_rwsem your checkpoint thread will still block for a very long time.
>
> So while you improve the average case, the worst case doesn't improve
> much I think.

You're right about the worst case latency, but I think a lock
optimization is still useful. If I understand the rwsem implementation
correctly, if there's one pending reader while a writer holds the
rwsem and the reader is sleeping when the writer releases the lock,
the writer will mark the rwsem as reader-owned by incrementing the
reader count then wake the reader in rwsem_mark_wake(). Assuming
that's correct, hitting this case guarantees the lowest possible
latency of a second write lock is the sum of reader's scheduling
delay, the reader's critical section duration, and the writer's
scheduling delay. What we see here is that the reader's scheduling
delay is orders of magnitude larger than the read lock duration when
the readers are low priority (tens of milliseconds of scheduling delay
when the device is heavily loaded vs tens of microseconds of holding
the read lock). The scheduling delay of f2fs-ckpt seems insignificant
compared to the scheduling delay of the reader (and is easily
addressed because it's a kthread vs arbitrary userspace code).

If the stalls were due to preemption of a low-priority reader that
holds the cp_rwsem read lock, I would expect to see some traces like:

1. low-prio userspace thread is running
2. low-prio userspace thread grabs cp_rwsem read lock, is preempted,
switches back to runnable
3. f2fs-ckpt wakes up, blocks on cp_rwsem write lock
4. low-prio userspace thread switches to running and unblocks f2fs-ckpt

Specifically, the low-prio userspace thread would need to wake up
f2fs-ckpt without the userspace thread ending up in uninterruptible
sleep around that period. To my knowledge, we've never seen that in a
trace. The bad behavior we see always comes after the low-prio thread
was blocked acquiring the read lock and switches back to runnable from
uninterruptible sleep. I think the patches that Waiman mentioned don't
address the case we're seeing; I think they fix different patterns of
new readers preventing a writer from becoming runnable vs a long
scheduling delay of a reader awakened by a writer that in turn makes a
writer runnable once the reader finally runs.

With the existing rwsem usage in f2fs, f2fs-ckpt is guaranteed to wait
for the reader's scheduling delay plus the read lock time every time
there's a pending reader, which is the common case with f2fs-ckpt
(because the write lock is held for milliseconds of IO ops vs
microseconds for readers) and why we often see hundreds of 10-100ms
checkpoints in a row. By moving to a reader-unfair rwsem, f2fs-ckpt
would only pay the latency of the reader's scheduling delay if the
reader is preempted while holding the lock. I'm sure that preemption
does happen and that the max latency is about the same as a result,
but given how short the read locks are held vs the write lock and the
relative likelihood of a preempted reader vs any reader arriving at
the lock while the writer is doing IO, the reader-unfair approach
should be a dramatic improvement in 99th percentile (and greater) f2fs
checkpoint latency.

> Also, given that this is a system wide rwsem, would percpu-rwsem not be
> 'better' ? Arguably with the same hack cgroups uses for it (see
> cgroup_init()) to lower the cost of percpu_down_write().

Funny you should mention this--the next thing on my todo list is to
root causing stalls around cgroup_threadgroup_rwsem (mostly in
cgroup_css_set_fork() hit from pthread_create in userspace).

If I'm reading percpu-rwsem.c correctly, it's not fair to readers in
the same way that this patch is. It's probably okay to switch to
percpu_rwsem in f2fs given the distribution of readers to writers, but
I am concerned about giving up spin-on-owner given how often these
locks will be hit from different processes at very different
priorities. Does that seem overly paranoid?

> Now, I'm not a filesystem developer and I'm not much familiar with the
> problem space, but this locking reads like a fairly big problem. I'm not
> sure optimizing the lock is the answer.

I'm not a filesystem developer either, but rewriting the locking was
my first suggestion too. It seems much harder than tweaking the lock.
Rewriting the locking might still be necessary if we see regular
preemption while the cp_rwsem read lock is held, but I don't have any
data showing that preemption is happening regularly right now.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
