Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF57048A6BC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Jan 2022 05:15:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n78Za-00032Q-7X; Tue, 11 Jan 2022 04:15:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <longman@redhat.com>) id 1n78ZZ-00032K-H8
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Jan 2022 04:15:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+Yqomcw7FDLVwm1unnn5IoDr3lTZAcCMoRqqIKZgAeA=; b=EVuzTrRhYMyqDrYOt2klY2NnAx
 w4QhVrx7H9yShY1VGJzWV0eZMrcCzi43fw+xh3MiCDE4912yNyj04gklJntSgOo6KBfKucF+xYxIx
 J1g2T3vL82tCKZKrWdO+SELBeAq4Y2DcheICuQNBCE0VO4igRf4Wfi2yzbQ8joxNHEKA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+Yqomcw7FDLVwm1unnn5IoDr3lTZAcCMoRqqIKZgAeA=; b=f2gjIRaOOddd4SrW4DulYv8Y3l
 Dw1WHrgC7ySOlRtX8d1h8SnvcAQA/rzYbggQsY7QGaF+EM3ABaVTMy6QNbyEJzh6STwjbI5QCKuZh
 O4Saq4qRTPc8OoSzHL0MxQdZ2AR2yyEXq17dpRnxLJXPa7OQ0lYtFy/8g/HX4UP02GSc=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n78ZT-00BHsZ-Tn
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Jan 2022 04:15:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641874537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Yqomcw7FDLVwm1unnn5IoDr3lTZAcCMoRqqIKZgAeA=;
 b=QLZWG7q+5Z4wRRU6pKA+/qO0IatarLtd68yp1nM4t9ipdihPVl5D564wRaC211oScjP8NV
 v5jEhN5Q4Z6deGf+mmn7p3GIOcq651qvxZsRvy7VY+jvKeg0TGpKBLSO+XZwC878SrOOcH
 hwO/pnj1Ie85GUZYFFlbUrRjgisxG04=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-rEvBisDbPraJbSP6cZHrJg-1; Mon, 10 Jan 2022 23:15:34 -0500
X-MC-Unique: rEvBisDbPraJbSP6cZHrJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32CE181CCB4;
 Tue, 11 Jan 2022 04:15:33 +0000 (UTC)
Received: from [10.22.16.145] (unknown [10.22.16.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 568821037F54;
 Tue, 11 Jan 2022 04:15:28 +0000 (UTC)
Message-ID: <9efbbcb7-29cd-a8ab-0632-01986edc862f@redhat.com>
Date: Mon, 10 Jan 2022 23:15:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Tim Murray <timmurray@google.com>
References: <20220108164617.3130175-1-jaegeuk@kernel.org>
 <YdvoxkAAquI17UbX@infradead.org>
 <a23a3226-95d9-9835-c1c7-2d13f4a1ee16@redhat.com>
 <CAEe=SxnWeK0pSfijPKJSTxBiMgD1Ev69fV3qSTCgWASk0b3vhA@mail.gmail.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <CAEe=SxnWeK0pSfijPKJSTxBiMgD1Ev69fV3qSTCgWASk0b3vhA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Spam-Score: -3.6 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/10/22 14:41, Tim Murray wrote: > On Mon, Jan 10, 2022
 at 7:02 AM Peter Zijlstra <peterz@infradead.org> wrote: >> Can we start by
 describing the actual problem? > Of course. Sorry, I didn't realiz [...] 
 Content analysis details:   (-3.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [170.10.133.124 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1n78ZT-00BHsZ-Tn
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
 LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Will Deacon <will@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 1/10/22 14:41, Tim Murray wrote:
> On Mon, Jan 10, 2022 at 7:02 AM Peter Zijlstra <peterz@infradead.org> wrote:
>> Can we start by describing the actual problem?
> Of course. Sorry, I didn't realize Jaegeuk was going to move so
> quickly with this patch :)
>
> We have a few thousand traces from internal Android devices where
> large numbers of threads throughout the system end up blocked on
> f2fs_issue_checkpoint(), which userspace code usually reaches via
> fsync(). In the same traces, the f2fs-ckpt kthread is often blocked
> around f2fs_write_checkpoint(), which does the actual fsync()
> operation on behalf of some number of callers (coalescing multiple
> fsync calls into a single checkpoint op). I think the problem is
> something like:
>
> 1. f2fs-ckpt thread is running f2fs_write_checkpoint(), holding the
> cp_rwsem write lock while doing so via f2fs_lock_all() in
> block_operations().
> 2. Random very-low-priority thread A makes some other f2fs call that
> tries to get the cp_rwsem read lock by atomically adding on the rwsem,
> fails and deschedules in uninterruptible sleep. cp_rwsem now has a
> non-zero reader count but is write-locked.
That is not how rwsem works. A reader which fails to get the lock 
because it is write-locked will remove its reader count before going to 
sleep. So the reader count will be zero eventually. Of course, there is 
a short period of time where the reader count will be non-zero until the 
reader removes its own reader count. So if a new writer comes in at that 
time, it will fail its initial trylock and probably go to optimistic 
spinning mode. If the writer that owns the lock release it at the right 
moment, the reader may acquire the read lock.
> 3. f2fs-ckpt thread releases the cp_rwsem write lock. cp_rwsem now has
> a non-zero reader count and is not write-locked, so is reader-locked.

That is not true in general, but a suitable race window as discussed 
above may make it looks like that.

> 4. Other threads call fsync(), which requests checkpoints from
> f2fs-ckpt, and block on a completion event that f2fs-ckpt dispatches.
> cp_rwsem still has a non-zero reader count because the low-prio thread
> A from (2) has not been scheduled again yet.
> 5. f2fs-ckpt wakes up to perform checkpoints, but it stalls on the
> write lock via cmpxchg in block_operations() until the low-prio thread
> A has run and released the cp_rwsem read lock. Because f2fs-ckpt can't
> run, all fsync() callers are also effectively blocked by the
> low-priority thread holding the read lock.
>
> I think this is the rough shape of the problem (vs readers holding the
> lock for too long or something like that) because the low-priority
> thread is never run between when it is initially made runnable by
> f2fs-ckpt and when it runs tens/hundreds of milliseconds later then
> immediately unblocks f2fs-ckpt.
>
> When there's a lot of oversubscription, threads running IO, etc, we
> see f2fs-ckpt stalls of tens to hundreds of milliseconds per f2fs-ckpt
> iteration. In one recent experiment of the immediate aftermath of
> booting and unlocking a phone for the first time, over a 10s period,
> we saw f2fs-ckpt blocked on the rwsem for 9.7s, running for <50ms over
> 110 separate slices (so probably ~110 fsyncs), and blocked on IO
> operations for <100ms. The worst 10s period I can find in a similar
> experiment with the unfair reader approach has f2fs-ckpt blocked on
> the rwsem for 130ms, running for 20ms over 95 slices, blocked on IO
> for 40ms, and sleeping the rest of the time.
>
> Unfair rwsems are rarely appropriate, but I think the lack of fairness
> makes sense here because of the relative importance of f2fs-ckpt vs
> any particular reader of that rwsem. The one concern I have about
> down_read_unfair() is whether the fairness should be a property of the
> down_read operation or the rw_semaphore itself. In the f2fs case, it
> seems like all read locks of the rw_semaphores should be unfair and
> that adding a single fair down_read() could introduce a similar
> regression, but duplicating rw_semaphore also seems bad. If it does
> make sense to make the fairness a property of the semaphore, could
> that property be flagged in an init_unfair_rwsem() macro and then
> checked in lockdep?

It is also possible to make unfair rwsem a property of the rwsem itself 
instead of relying on a variant down_read() call. We can isolate a bit 
in the owner word for this attribute and set it in the initialization 
phrase to guide its behavior.

I do have a question about the number of readers in such a case compared 
with the number of writers. Are there a large number of low priority 
hanging around? What is an average read lock hold time?

Blocking for 9.7s for a write lock is quite excessive and we need to 
figure out how this happen.,

Cheers,
Longman



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
