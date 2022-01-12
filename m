Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFCE48C581
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Jan 2022 15:06:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n7eGo-00061n-Bl; Wed, 12 Jan 2022 14:06:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <peterz@infradead.org>) id 1n7eGl-000617-IS
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Jan 2022 14:06:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+j1dla8yYdTDIkB0+h/HiKBaQzQ6SzSOKXqcY9iZad0=; b=HEe0BPxZbkVmgAvdkiXCPhjXuB
 RKsvl2Pi0S/X56fJ2ICfckptXG/jz11PMzRLifYRlk8eWFdY+5WCHjzgihh/IXozwKLlpU7WRmNno
 1mDtHhHXzoklX5W3ftBpi8v8/dcp6I5H7PS++/hp/YyLSyfukxkakFp2RvGCpAPj5mLg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+j1dla8yYdTDIkB0+h/HiKBaQzQ6SzSOKXqcY9iZad0=; b=FvDZuOFHIOV9VM0TtqBKQ5BIVp
 hW0MTJaXgfPy9zaBKuCPsoNU2SmSOlsIpCT3ZRqdXxJ8NCOi3B1/QnnTuEtcpcn1gr9mIT8i14A5C
 M48rMskzfCtrIdWDHdDzA4z3CRi+0vtOte3Qr7kSDAXn1coGZ4olBXTUFhfmeKhVk2Yw=;
Received: from desiato.infradead.org ([90.155.92.199])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n7eGk-00022K-7o
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Jan 2022 14:06:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+j1dla8yYdTDIkB0+h/HiKBaQzQ6SzSOKXqcY9iZad0=; b=OJm2Ml5A8vUj2ThKvkhxcAzzxp
 HaSo9ZEp0/JRAs0+n0PIEjYuGA0C/f7yL8xUAzQD1iLVA1tmI0VssQTbjo+wxreUIXhKasUNW+EiK
 53WIoe56QZcE9kaqZVzhmKdswZPAjfqiyoOJ5peBVqmMbeX+exDshrQXjqq+dZTsa/mbHmoo0a/V7
 p1keNNzCZOxMOhHJiM8e3uyPMQ7i4Gd0O2eCkoGaBSgShhycgfq7JfDFPMKuVWTBdENEKDPoJkMT5
 Z3+BJxLpH5mQf3eONrVqMxF2bFLZnzKrQegTrj1KrtXb8ZpJ08AhCRSEImrJDJ2Hl8ob59xD5D4/s
 +dqwm9ow==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7eGU-000oJp-Vj; Wed, 12 Jan 2022 14:06:15 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 928AF300222;
 Wed, 12 Jan 2022 15:06:12 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 7345B29CA46E8; Wed, 12 Jan 2022 15:06:12 +0100 (CET)
Date: Wed, 12 Jan 2022 15:06:12 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Tim Murray <timmurray@google.com>
Message-ID: <Yd7gVLdHW11TQUAi@hirez.programming.kicks-ass.net>
References: <20220108164617.3130175-1-jaegeuk@kernel.org>
 <YdvoxkAAquI17UbX@infradead.org>
 <a23a3226-95d9-9835-c1c7-2d13f4a1ee16@redhat.com>
 <CAEe=SxnWeK0pSfijPKJSTxBiMgD1Ev69fV3qSTCgWASk0b3vhA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEe=SxnWeK0pSfijPKJSTxBiMgD1Ev69fV3qSTCgWASk0b3vhA@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 10, 2022 at 11:41:23AM -0800, Tim Murray wrote:
 > 1. f2fs-ckpt thread is running f2fs_write_checkpoint(),
 holding the > cp_rwsem
 write lock while doing so via f2fs_lock_all() in > block_operations(). >
 2. Random very-low-priority thread A makes som [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.92.199 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1n7eGk-00022K-7o
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
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 10, 2022 at 11:41:23AM -0800, Tim Murray wrote:

> 1. f2fs-ckpt thread is running f2fs_write_checkpoint(), holding the
> cp_rwsem write lock while doing so via f2fs_lock_all() in
> block_operations().
> 2. Random very-low-priority thread A makes some other f2fs call that
> tries to get the cp_rwsem read lock by atomically adding on the rwsem,
> fails and deschedules in uninterruptible sleep. cp_rwsem now has a
> non-zero reader count but is write-locked.
> 3. f2fs-ckpt thread releases the cp_rwsem write lock. cp_rwsem now has
> a non-zero reader count and is not write-locked, so is reader-locked.
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

*urgh*... so you're making the worst case less likely but fundamentally
you don't change anything.

If one of those low prio threads manages to block while holding
cp_rwsem your checkpoint thread will still block for a very long time.

So while you improve the average case, the worst case doesn't improve
much I think.

Also, given that this is a system wide rwsem, would percpu-rwsem not be
'better' ? Arguably with the same hack cgroups uses for it (see
cgroup_init()) to lower the cost of percpu_down_write().

Now, I'm not a filesystem developer and I'm not much familiar with the
problem space, but this locking reads like a fairly big problem. I'm not
sure optimizing the lock is the answer.




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
