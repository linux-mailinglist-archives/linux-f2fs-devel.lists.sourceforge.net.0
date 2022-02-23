Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6134C1A31
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Feb 2022 18:48:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nMvkc-0008UZ-Co; Wed, 23 Feb 2022 17:48:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nMvkY-0008UL-DU
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Feb 2022 17:48:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U35VhKw1cNtAO+/2wCYql6IA9lOU09KNAzwinaYMKtM=; b=O0JupAacsvX3xCd9nx8r0eSpgu
 z/ACKsAfq5fa3dlnc4Xx4dRPSP0FmFvxKLUrqPuuBvNGWcNETjGAF19DafeuNEh9S6S7kZu6JSGhO
 YfJpFfooi+Ca4XkRi/vEdD0G6cI4UQargbNZDdvWo8YSywFrPINhS/tKU+BLTJxKBWwY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U35VhKw1cNtAO+/2wCYql6IA9lOU09KNAzwinaYMKtM=; b=QI8V2pvSZaZ9mHUNfpwJUMNaPc
 nsuX85qxVaYvIzbHmuRDG7N6neRWMtMZxvTO7utocDVCPGfYFSrC733R6p1CwP6yOmRKcf52z9eVK
 5jEaLv6wRmcQoB+OkEKG6qznf2sJ4EFFjsHZnE0bXAeGZFKN1hAtw12hXq6IsaGY2bT4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nMvkS-00CiH4-Hh
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Feb 2022 17:48:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4E8EB61331;
 Wed, 23 Feb 2022 17:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65FF5C340EC;
 Wed, 23 Feb 2022 17:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645638489;
 bh=1xDX2DoP/sSqEDn7SnmAcFIOAmtI6AhwaDrx27SiKAQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AtTbN93mKgAaUD6y9AUZ6pOJajHs3CjxeaMjc8wl9DHeIB5ZDQhcoBcLSjL4dqtPc
 1n2r2n4n7WpOaLIrurD/x+Tj7q3ONa0NiWgymKwnP477PrUXigyIIjm7zYt2A/N0ky
 mAVXwCzTNJkKelE314XUtXWSENJvpslCS17ZGfxUijW/mOz4zLn4rphh3/+xYPkePI
 H2aCKsydVOsvIeHb+1hwBTyUAPYffeTs4FqkUW80dXJbz0Oi/bP4Nbale5t4/YuYln
 TvFPWJAECazr2yI2XuUnXrc20YOhyW3wmp/5ObJIHo/8C7eZYLEmPZ2fmH84+YLrOD
 6BvLKZJyLOeqQ==
Date: Wed, 23 Feb 2022 09:48:07 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <YhZzV11+BlgI1PBd@google.com>
References: <20220108164617.3130175-1-jaegeuk@kernel.org>
 <YdvoxkAAquI17UbX@infradead.org>
 <a23a3226-95d9-9835-c1c7-2d13f4a1ee16@redhat.com>
 <CAEe=SxnWeK0pSfijPKJSTxBiMgD1Ev69fV3qSTCgWASk0b3vhA@mail.gmail.com>
 <Yd7gVLdHW11TQUAi@hirez.programming.kicks-ass.net>
 <YhXlXY28XiG7lVH1@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YhXlXY28XiG7lVH1@infradead.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/22, Christoph Hellwig wrote: > It looks like this patch
 landed in linux-next despite all the perfectly > reasonable objections.
 Jaegeuk, 
 please drop it again. I've been waiting for a generic solution as suggested
 here. Until then, I'd like to keep this in f2fs *only* in order to ship the
 fix in products. Once there's a right fix, let me drop or revise this [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nMvkS-00CiH4-Hh
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
 linux-f2fs-devel@lists.sourceforge.net, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 02/22, Christoph Hellwig wrote:
> It looks like this patch landed in linux-next despite all the perfectly
> reasonable objections.  Jaegeuk, please drop it again.

I've been waiting for a generic solution as suggested here. Until then, I'd like
to keep this in f2fs *only* in order to ship the fix in products. Once there's
a right fix, let me drop or revise this patch again.

> 
> On Wed, Jan 12, 2022 at 03:06:12PM +0100, Peter Zijlstra wrote:
> > On Mon, Jan 10, 2022 at 11:41:23AM -0800, Tim Murray wrote:
> > 
> > > 1. f2fs-ckpt thread is running f2fs_write_checkpoint(), holding the
> > > cp_rwsem write lock while doing so via f2fs_lock_all() in
> > > block_operations().
> > > 2. Random very-low-priority thread A makes some other f2fs call that
> > > tries to get the cp_rwsem read lock by atomically adding on the rwsem,
> > > fails and deschedules in uninterruptible sleep. cp_rwsem now has a
> > > non-zero reader count but is write-locked.
> > > 3. f2fs-ckpt thread releases the cp_rwsem write lock. cp_rwsem now has
> > > a non-zero reader count and is not write-locked, so is reader-locked.
> > > 4. Other threads call fsync(), which requests checkpoints from
> > > f2fs-ckpt, and block on a completion event that f2fs-ckpt dispatches.
> > > cp_rwsem still has a non-zero reader count because the low-prio thread
> > > A from (2) has not been scheduled again yet.
> > > 5. f2fs-ckpt wakes up to perform checkpoints, but it stalls on the
> > > write lock via cmpxchg in block_operations() until the low-prio thread
> > > A has run and released the cp_rwsem read lock. Because f2fs-ckpt can't
> > > run, all fsync() callers are also effectively blocked by the
> > > low-priority thread holding the read lock.
> > > 
> > > I think this is the rough shape of the problem (vs readers holding the
> > > lock for too long or something like that) because the low-priority
> > > thread is never run between when it is initially made runnable by
> > > f2fs-ckpt and when it runs tens/hundreds of milliseconds later then
> > > immediately unblocks f2fs-ckpt.
> > 
> > *urgh*... so you're making the worst case less likely but fundamentally
> > you don't change anything.
> > 
> > If one of those low prio threads manages to block while holding
> > cp_rwsem your checkpoint thread will still block for a very long time.
> > 
> > So while you improve the average case, the worst case doesn't improve
> > much I think.
> > 
> > Also, given that this is a system wide rwsem, would percpu-rwsem not be
> > 'better' ? Arguably with the same hack cgroups uses for it (see
> > cgroup_init()) to lower the cost of percpu_down_write().
> > 
> > Now, I'm not a filesystem developer and I'm not much familiar with the
> > problem space, but this locking reads like a fairly big problem. I'm not
> > sure optimizing the lock is the answer.
> > 
> > 
> ---end quoted text---


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
