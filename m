Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F9F4C0D7F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Feb 2022 08:42:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nMmIR-0005OG-64; Wed, 23 Feb 2022 07:42:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+94e795790efaf498204f+6758+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1nMmIN-0005Le-E8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Feb 2022 07:42:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UUDMqr/9c1gNA/wamWMnwltjDT92zuHM5PlATkNE7uw=; b=A1vuzldz0liHoERfACqLwjnigf
 K1FbpAT2Ebv4xr9rfYrwiEuoK8oYn6iCtQnOFIg2v4nCeFdt1p+dn9ODRvvDE4L0EYJBgsVU2EDm5
 nTh9ncfj68mXhcp5++taAZEx1ZE90/h1qffyYS0kqxQv8CphIfpQACx+Le1SdYEn7/II=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UUDMqr/9c1gNA/wamWMnwltjDT92zuHM5PlATkNE7uw=; b=FXnhEaboi8nov8lB75E0kmNd16
 hpuE5w/XEM95fNWn/71zlckCWogBa+/XYCQiQivgnQPEfOF4gy99eI1YY7sJua9uEkeyhUj/3IRfQ
 WJrjMzFXw1YUMN5F0peJ6Qp/+1l+TagvZvGcv9qiNrEd55W6G3jZ57xvCkj0O6slYkxA=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nMmII-0001fT-0H
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Feb 2022 07:42:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=UUDMqr/9c1gNA/wamWMnwltjDT92zuHM5PlATkNE7uw=; b=knZxiD9W6pRdpjcOchY0fSbRZR
 TuX7xUFcdsrpfwV71LIZFOUZdYME9PbodVM8OlD9ckYCHq7+g7pkI7gveYqEcn19vo1h8el7P7AXC
 1mlrWZ3BikTpHCM40cJUPGsz7RP2HKehF0FmgMFveF/UMFqfPmPGUkN64YwrVOzTaD33TupF3ngnj
 KrEiIHAC2p9PbwASviKdVZbh9jgQlkuH3eKJTMlvCyTM+U91+FYI0ja+C7wHvvN74hRFb5gz95CJy
 egwLl1rGprTjkvVpVVv9pygIkadMFj8FaFPZE/Uh27euKaX7zniv9e5rkfQ+Xj132fVaVLw7wCI8C
 0l+g6oVA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nMmI1-00D9pM-CA; Wed, 23 Feb 2022 07:42:21 +0000
Date: Tue, 22 Feb 2022 23:42:21 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <YhXlXY28XiG7lVH1@infradead.org>
References: <20220108164617.3130175-1-jaegeuk@kernel.org>
 <YdvoxkAAquI17UbX@infradead.org>
 <a23a3226-95d9-9835-c1c7-2d13f4a1ee16@redhat.com>
 <CAEe=SxnWeK0pSfijPKJSTxBiMgD1Ev69fV3qSTCgWASk0b3vhA@mail.gmail.com>
 <Yd7gVLdHW11TQUAi@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yd7gVLdHW11TQUAi@hirez.programming.kicks-ass.net>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  It looks like this patch landed in linux-next despite all
 the perfectly reasonable objections. Jaegeuk, please drop it again. On Wed,
 Jan 12, 2022 at 03:06:12PM +0100, Peter Zijlstra wrote: > On Mon, Jan 10,
 2022 at 11:41:23AM -0800, Tim Murray wrote: > > > 1. f2fs-ckpt thread is
 running f2fs_write_checkpoint(), holding the [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nMmII-0001fT-0H
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
Cc: Boqun Feng <boqun.feng@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Tim Murray <timmurray@google.com>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Waiman Long <longman@redhat.com>,
 Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It looks like this patch landed in linux-next despite all the perfectly
reasonable objections.  Jaegeuk, please drop it again.

On Wed, Jan 12, 2022 at 03:06:12PM +0100, Peter Zijlstra wrote:
> On Mon, Jan 10, 2022 at 11:41:23AM -0800, Tim Murray wrote:
> 
> > 1. f2fs-ckpt thread is running f2fs_write_checkpoint(), holding the
> > cp_rwsem write lock while doing so via f2fs_lock_all() in
> > block_operations().
> > 2. Random very-low-priority thread A makes some other f2fs call that
> > tries to get the cp_rwsem read lock by atomically adding on the rwsem,
> > fails and deschedules in uninterruptible sleep. cp_rwsem now has a
> > non-zero reader count but is write-locked.
> > 3. f2fs-ckpt thread releases the cp_rwsem write lock. cp_rwsem now has
> > a non-zero reader count and is not write-locked, so is reader-locked.
> > 4. Other threads call fsync(), which requests checkpoints from
> > f2fs-ckpt, and block on a completion event that f2fs-ckpt dispatches.
> > cp_rwsem still has a non-zero reader count because the low-prio thread
> > A from (2) has not been scheduled again yet.
> > 5. f2fs-ckpt wakes up to perform checkpoints, but it stalls on the
> > write lock via cmpxchg in block_operations() until the low-prio thread
> > A has run and released the cp_rwsem read lock. Because f2fs-ckpt can't
> > run, all fsync() callers are also effectively blocked by the
> > low-priority thread holding the read lock.
> > 
> > I think this is the rough shape of the problem (vs readers holding the
> > lock for too long or something like that) because the low-priority
> > thread is never run between when it is initially made runnable by
> > f2fs-ckpt and when it runs tens/hundreds of milliseconds later then
> > immediately unblocks f2fs-ckpt.
> 
> *urgh*... so you're making the worst case less likely but fundamentally
> you don't change anything.
> 
> If one of those low prio threads manages to block while holding
> cp_rwsem your checkpoint thread will still block for a very long time.
> 
> So while you improve the average case, the worst case doesn't improve
> much I think.
> 
> Also, given that this is a system wide rwsem, would percpu-rwsem not be
> 'better' ? Arguably with the same hack cgroups uses for it (see
> cgroup_init()) to lower the cost of percpu_down_write().
> 
> Now, I'm not a filesystem developer and I'm not much familiar with the
> problem space, but this locking reads like a fairly big problem. I'm not
> sure optimizing the lock is the answer.
> 
> 
---end quoted text---


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
