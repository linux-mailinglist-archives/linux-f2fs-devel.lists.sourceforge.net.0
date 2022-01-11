Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E5448A7FC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Jan 2022 07:53:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n7B2J-0006O7-MG; Tue, 11 Jan 2022 06:53:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <timmurray@google.com>) id 1n7B2H-0006O1-Di
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Jan 2022 06:53:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mSDl3QNPw4cusWftYB9ASogJT1ZlpHBuHV1JbJnIkcs=; b=H7HOLMdmZY3VyicCbqGvUEi+nB
 NTeFrCCgiz/FBuApjoPzDSCacvFd5khtpIMd7HJSiNTTj4k8+VKmiT4PSmSdzSLpVOvzNydC9XxHO
 Uuw0Oite67NcbQ+LAc14w6d2pKOG57mpFKyqwQZn+vH3vB1kjWy+k+e3CdrYc6tsYiDw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mSDl3QNPw4cusWftYB9ASogJT1ZlpHBuHV1JbJnIkcs=; b=F/EDa2gElxFnD0LQpI06YRN7Z0
 ZddVZDXcHP1z8v9F7vTZGtbvCB3/nCfDbbmt9edVf33JHFco7yFXSIVUBkbFIa8rmvAkY+J9ItAxt
 yDKYwoQQAbqKiNdWZgLQy8ln5Kzja/Dv5y7Li5nQ2BLiqyhiuz3Q2KWigDBNpoPR6q20=;
Received: from mail-io1-f42.google.com ([209.85.166.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1n7B2E-0003Tj-EK
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Jan 2022 06:53:36 +0000
Received: by mail-io1-f42.google.com with SMTP id 19so21039799ioz.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Jan 2022 22:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mSDl3QNPw4cusWftYB9ASogJT1ZlpHBuHV1JbJnIkcs=;
 b=EglXCHArEpYpL7rh/UinFzlp1BBkEt46ijZrwE1U+E3jdCWiq8UShov6puMiGCPQ/3
 QMpPM0B8CJT2t9jCtocSbc0iLnhqkJGtA5JF388ATZQg+zBgbV6FDexxN7mY91kjfD9M
 UnRzDfmEHUyH8EgVFBKoNRyBKLgTSzuP8i2mpqrkjPbqaMzUAy85rkBptZ+ErT4cqfH/
 VM5bpFN8lBQy4Vs0l81nGqCkb6PSyiSd0iXOaJHdp5XSqS70ONVZGnWZPVJCev47VWlT
 3UWPPkkJMJ2CLC+WMDixnyaAdaHQHxWs4GK/+7dXiWKPDWv/ZMMoucUErvvR4HnzBpeL
 ND1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mSDl3QNPw4cusWftYB9ASogJT1ZlpHBuHV1JbJnIkcs=;
 b=W96GlGeuIUbdjlFYTPye3mbBCiBmKyRhTJEGx+VEYM1o1Sjd1mIvq7nZrREIkiyysk
 Dy6ELk6FFLSpPyYEXZoAKwvj8CubsxriQfmFuaZnrZCc5chH+Ti8Go2SEjPX7EPBYiqB
 o3GhsROddLhEqBug6ZBsc7GZx3Vx9I4ORzoTTzZGFYhmGK8wMNmE+f6nphqA2RGnHGuS
 IGRWVe247EoBODSCUbj9rYxlhJp82EanijiBLg2XPrlS+r1bItZT7r+hbyd7K+FL5iHx
 CUNutlibOYkNTQqmevEqXIPLHxe40Sz6JA6Ha7BsKM6QgGTWDqUFSs/WNrUY6mCHviJx
 Z5hw==
X-Gm-Message-State: AOAM532/Z6LQy0vd+NzAS1MNhX/FFBGuKCprtVZ6ePDUyA9EC/Src1Cy
 xBVV9OSLnlwYVTHzmohGM5utBgwkZ9uFkBwS7rkKGhVc3qAf8Q==
X-Google-Smtp-Source: ABdhPJztacg8YHUE48ljmhu2/De8xlmIklTvWPbHOcEJi/2sSA+6bP6x2m9vsxqPaSpG0al/1KqmwoCfK5rUlFEBzDw=
X-Received: by 2002:a05:6602:2b03:: with SMTP id
 p3mr1590314iov.74.1641884008720; 
 Mon, 10 Jan 2022 22:53:28 -0800 (PST)
MIME-Version: 1.0
References: <20220108164617.3130175-1-jaegeuk@kernel.org>
 <YdvoxkAAquI17UbX@infradead.org>
 <a23a3226-95d9-9835-c1c7-2d13f4a1ee16@redhat.com>
 <CAEe=SxnWeK0pSfijPKJSTxBiMgD1Ev69fV3qSTCgWASk0b3vhA@mail.gmail.com>
 <9efbbcb7-29cd-a8ab-0632-01986edc862f@redhat.com>
In-Reply-To: <9efbbcb7-29cd-a8ab-0632-01986edc862f@redhat.com>
Date: Mon, 10 Jan 2022 22:53:16 -0800
Message-ID: <CAEe=Sx=C8e7=A6ziy8dYC+FvkWvVYZ+o=XMCP_4vX0efsUPT4Q@mail.gmail.com>
To: Waiman Long <longman@redhat.com>
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 10,
 2022 at 8:15 PM Waiman Long <longman@redhat.com>
 wrote: > That is not how rwsem works. A reader which fails to get the lock
 > because it is write-locked will remove its reader count be [...] 
 Content analysis details:   (-15.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.42 listed in list.dnswl.org]
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 white-list
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.42 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
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
X-Headers-End: 1n7B2E-0003Tj-EK
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
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 10, 2022 at 8:15 PM Waiman Long <longman@redhat.com> wrote:
> That is not how rwsem works. A reader which fails to get the lock
> because it is write-locked will remove its reader count before going to
> sleep. So the reader count will be zero eventually. Of course, there is
> a short period of time where the reader count will be non-zero until the
> reader removes its own reader count. So if a new writer comes in at that
> time, it will fail its initial trylock and probably go to optimistic
> spinning mode. If the writer that owns the lock release it at the right
> moment, the reader may acquire the read lock.

Thanks for the correction, that makes sense. I haven't spent too much
time on rwsem internals and I'm not confident about when flags are set
and cleared in sem->count; is there a case where sem->count after
up_write() could be nonzero?

An example from one trace:

1. Low-priority userspace thread 4764 is blocked in f2fs_unlink,
probably at f2fs_lock_op, which is a wrapper around
down_read(cp_rwsem).
2. f2fs-ckpt runs at t=0ms and wakes thread 4764, making it runnable.
3. At t=1ms, f2fs-ckpt enters uninterruptible sleep and blocks at
rwsem_down_write_slowpath per sched_blocked_reason.
4. At t=26ms, thread 4764 runs for the first time since being made
runnable. Within 40us, thread 4764 unblocks f2fs-ckpt and makes it
runnable.

Since thread 4764 is awakened by f2fs-ckpt but never runs before it
unblocks f2fs-ckpt in down_write_slowpath(), the only idea I had is
that cp_rwsem->count is nonzero after f2fs-ckpt's up_write() in step 2
(maybe because of rwsem_mark_wake()?).

> I do have a question about the number of readers in such a case compared
> with the number of writers. Are there a large number of low priority
> hanging around? What is an average read lock hold time?
>
> Blocking for 9.7s for a write lock is quite excessive and we need to
> figure out how this happen.,

Just to be 100% clear, it's not a single 9.7s stall, it's many smaller
stalls of 10-500+ms in f2fs-ckpt that add up to 9.7s over that range.

f2fs is not my area of expertise, but my understanding is that
cp_rwsem in f2fs has many (potentially unbounded) readers and a single
writer. Arbitrary userspace work (fsync, creating/deleting/truncating
files, atomic writes) may grab the read lock, but assuming the
merge_checkpoint option is enabled, only f2fs-ckpt will ever grab the
write lock during normal operation. However, in this particular
example, it looks like there may have been 5-10 threads blocked on
f2fs-ckpt that were awakened alongside thread 4764 in step 2.

I'll defer to the f2fs experts on the average duration that the read
lock is held.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
