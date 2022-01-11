Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9A548B04E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Jan 2022 16:05:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n7Ihl-000469-2R; Tue, 11 Jan 2022 15:04:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <longman@redhat.com>) id 1n7Ihj-000462-Eo
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Jan 2022 15:04:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D71TOijj/AaLdV4YKK2S1vulUsaeY97bR41W9OoZ9Ow=; b=ZgJZcBFhnmv+P+sSaRLUr2o9Ps
 yIIbpmzMObuFTB61OrN36zqhR0jDX69eHUSYGlIFAoAkCI7iTvB65bEo/b32DDLXZIDECtN67MjA/
 DKjvLjGkTVWsTrz8rNEyO7bf3ZCip1pW1RP4KNzApGyiRPZ4ZcIvPguWX6fZC5Uypx9E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=D71TOijj/AaLdV4YKK2S1vulUsaeY97bR41W9OoZ9Ow=; b=m0VYPBQxGJk3uFpeshzF1EaRoB
 ouXMlPfGLXE4UUjxoRZ+dI/M9dQdO28FwVmYoBfn/1W2M04U8+eECoEdj9aoVjtBnvoozw0/iZG6G
 qRSF8IN9RGFcqTdhtQ1d9KCNX3QsQ9OFN74PnTfPl0KEtpztFh75cOknuvwY/JhPRUg0=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n7Iha-0008N4-Iw
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Jan 2022 15:04:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641913480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D71TOijj/AaLdV4YKK2S1vulUsaeY97bR41W9OoZ9Ow=;
 b=ahSCpm7iv1sTyU7iZK1WERHrpcSUSUsrWJEmOMzS5k8iCBiNe9CAII/hKt8lXVNcOe9LzZ
 iWK6JQSon48wbwqz00qtWth63rh751qtItiFVX33whetPwOnzjWihzTbSRejN4YLfN61+X
 BLD3lTvFJJuPMiPW2tNLHMlZjUn8fRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-J8WF9aDANEyieIRi0fbUog-1; Tue, 11 Jan 2022 10:04:37 -0500
X-MC-Unique: J8WF9aDANEyieIRi0fbUog-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B570284BA54;
 Tue, 11 Jan 2022 15:04:35 +0000 (UTC)
Received: from [10.22.11.115] (unknown [10.22.11.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8E797EDA0;
 Tue, 11 Jan 2022 15:04:33 +0000 (UTC)
Message-ID: <86891228-9c91-09f1-0e2d-0a3392649d52@redhat.com>
Date: Tue, 11 Jan 2022 10:04:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Tim Murray <timmurray@google.com>
References: <20220108164617.3130175-1-jaegeuk@kernel.org>
 <YdvoxkAAquI17UbX@infradead.org>
 <a23a3226-95d9-9835-c1c7-2d13f4a1ee16@redhat.com>
 <CAEe=SxnWeK0pSfijPKJSTxBiMgD1Ev69fV3qSTCgWASk0b3vhA@mail.gmail.com>
 <9efbbcb7-29cd-a8ab-0632-01986edc862f@redhat.com>
 <CAEe=Sx=C8e7=A6ziy8dYC+FvkWvVYZ+o=XMCP_4vX0efsUPT4Q@mail.gmail.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <CAEe=Sx=C8e7=A6ziy8dYC+FvkWvVYZ+o=XMCP_4vX0efsUPT4Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Spam-Score: -3.6 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/11/22 01:53, Tim Murray wrote: > On Mon, Jan 10, 2022
 at 8:15 PM Waiman Long <longman@redhat.com> wrote: >> That is not how rwsem
 works. A reader which fails to get the lock >> because it is writ [...] 
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
X-Headers-End: 1n7Iha-0008N4-Iw
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


On 1/11/22 01:53, Tim Murray wrote:
> On Mon, Jan 10, 2022 at 8:15 PM Waiman Long <longman@redhat.com> wrote:
>> That is not how rwsem works. A reader which fails to get the lock
>> because it is write-locked will remove its reader count before going to
>> sleep. So the reader count will be zero eventually. Of course, there is
>> a short period of time where the reader count will be non-zero until the
>> reader removes its own reader count. So if a new writer comes in at that
>> time, it will fail its initial trylock and probably go to optimistic
>> spinning mode. If the writer that owns the lock release it at the right
>> moment, the reader may acquire the read lock.
> Thanks for the correction, that makes sense. I haven't spent too much
> time on rwsem internals and I'm not confident about when flags are set
> and cleared in sem->count; is there a case where sem->count after
> up_write() could be nonzero?
>
> An example from one trace:
>
> 1. Low-priority userspace thread 4764 is blocked in f2fs_unlink,
> probably at f2fs_lock_op, which is a wrapper around
> down_read(cp_rwsem).
> 2. f2fs-ckpt runs at t=0ms and wakes thread 4764, making it runnable.
> 3. At t=1ms, f2fs-ckpt enters uninterruptible sleep and blocks at
> rwsem_down_write_slowpath per sched_blocked_reason.
> 4. At t=26ms, thread 4764 runs for the first time since being made
> runnable. Within 40us, thread 4764 unblocks f2fs-ckpt and makes it
> runnable.
>
> Since thread 4764 is awakened by f2fs-ckpt but never runs before it
> unblocks f2fs-ckpt in down_write_slowpath(), the only idea I had is
> that cp_rwsem->count is nonzero after f2fs-ckpt's up_write() in step 2
> (maybe because of rwsem_mark_wake()?).
>
>> I do have a question about the number of readers in such a case compared
>> with the number of writers. Are there a large number of low priority
>> hanging around? What is an average read lock hold time?
>>
>> Blocking for 9.7s for a write lock is quite excessive and we need to
>> figure out how this happen.,
> Just to be 100% clear, it's not a single 9.7s stall, it's many smaller
> stalls of 10-500+ms in f2fs-ckpt that add up to 9.7s over that range.
>
> f2fs is not my area of expertise, but my understanding is that
> cp_rwsem in f2fs has many (potentially unbounded) readers and a single
> writer. Arbitrary userspace work (fsync, creating/deleting/truncating
> files, atomic writes) may grab the read lock, but assuming the
> merge_checkpoint option is enabled, only f2fs-ckpt will ever grab the
> write lock during normal operation. However, in this particular
> example, it looks like there may have been 5-10 threads blocked on
> f2fs-ckpt that were awakened alongside thread 4764 in step 2.
>
> I'll defer to the f2fs experts on the average duration that the read
> lock is held.

Thanks for the explanation.

Another question that I have is whether the test result is based on the 
latest upstream kernel or earlier kernel version. We used to allow 
reader optimistic spinning which was then removed in later kernel. 
Reader optimistic spinning may further increase writer wait time.

Anyway, AFAICS, this patch keeps readers out of the rwsem wait queue and 
so only writers can go into it. We can make an unfair rwsem to give 
preference to writers in the wait queue and wake up readers only if 
there is no more writers in the wait queue or even in the optimistic 
spinning queue. That should achieve the same effect as this patch.

Cheers,
Longman



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
