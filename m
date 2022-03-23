Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 808D64E5A94
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Mar 2022 22:21:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nX8Q0-0000OD-79; Wed, 23 Mar 2022 21:21:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nX8Pz-0000O6-3S
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Mar 2022 21:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Frj9I9cTH6FLXKjrTFBZsCGB8sdODq+Mv7HIowwztn8=; b=jtOyCz+IRSY65RS85dk1j7pM/e
 xRB9OzZfz5SpbW49PbKpk8NwQHxTqb7wtmPBrF3HMslywRG2UsvTXA34/Ra//2/2OSdv8hbsBb3Yk
 rbvFQQBQBJabw6lChID0MNzRWK6vSzV3fvfP2su0tN3y+F61AI4eVScoLpCLefit2nWE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Frj9I9cTH6FLXKjrTFBZsCGB8sdODq+Mv7HIowwztn8=; b=cSQe/BalcAg0981qFSBKO+nJ2N
 NzDnqmUl9LjUP/TpWkFI7qQU/yaiOjvycItFTyP3NXof4cJBsBFOH01EPXWoMZGXNfozdrTPCR1vN
 aGueJhuYpdD7F5amaYz3nSaUcJFwQJKnRK+RCCYK2unlsmSNgTzmENps4DWdUaSOymzg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nX8Pv-009mT7-Kq
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Mar 2022 21:21:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2D12161725;
 Wed, 23 Mar 2022 21:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D880C340EE;
 Wed, 23 Mar 2022 21:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648070469;
 bh=pi4TsVzQEBzAwpJQOAYodMLonLQpZSt0gqr4sMg+vN4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YFGFG1ApYl/SfF0lPexzaDWCb3nM7r0Q1oJaR4DWf34eUD1IdXXzArV5VsHEeDzkx
 jals1gSGpf1j4r5E+jG7aLG0ljiJ4j9qmS13NuVq5Qjcbi782RoAKBrKgOOXGyStGr
 f4nHE5kKMLC/fJAc/ABzSnB6LEv1UTucf4wqTRBsMHXT8OLtrC7ZOkVVb4AaJoKplP
 oGu9U5DcC/aMXgIyFsAi9k918VU87xWdBDfLvYO0rr7V3+Wc+auC4qN0tHoUcgm9sm
 9QacqXJLRd/WNbzWAWQRuGfzfVozPsws8uKQWcBTaS16QBqf8/W6/gEopsyA7iH3ZU
 bo2GrGLZmb11Q==
Date: Wed, 23 Mar 2022 14:21:07 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YjuPQ36A4W553ai1@google.com>
References: <YjjihIZuvZpUjaSs@google.com>
 <CAHk-=wgsmvoJFKFWxQ2orEVUOWH1agk9iUNZ=-DFh5OXZL=Ldw@mail.gmail.com>
 <51cded74-3135-eed8-06d3-0b2165e3b379@redhat.com>
 <CAHk-=wi=Xsekgj7zfw_vpOM673CG24vznmz-yx9G05rWSAAYXg@mail.gmail.com>
 <CAEe=Sxmcn5+YUXBQhxDpzZVJu_T6S6+EURDqrP9uUS-PHGyuSg@mail.gmail.com>
 <CAHk-=whGKUyJpi0dTQJjyJxdmG+WCeKkJJyycpOaUW0De17h_Q@mail.gmail.com>
 <YjtKRAgFmBfgU0al@google.com>
 <CAHk-=wi99R8i=uvHiHo3jjZPzg6oTJW1rin3ekuPbuccS5XZqA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wi99R8i=uvHiHo3jjZPzg6oTJW1rin3ekuPbuccS5XZqA@mail.gmail.com>
X-Spam-Score: -6.4 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/23, Linus Torvalds wrote: > On Wed, Mar 23, 2022 at
 9:26 AM Jaegeuk Kim <jaegeuk@kernel.org> wrote: > > > > OTOH, I was suspecting
 the major contetion would be > > f2fs_lock_op -> f2fs_down_read [...] 
 Content analysis details:   (-6.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nX8Pv-009mT7-Kq
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
Cc: Waiman Long <longman@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tim Murray <timmurray@google.com>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/23, Linus Torvalds wrote:
> On Wed, Mar 23, 2022 at 9:26 AM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
> >
> > OTOH, I was suspecting the major contetion would be
> >         f2fs_lock_op -> f2fs_down_read(&sbi->cp_rwsem);
> > , which was used for most of filesystem operations.
> 
> Very possible, I was just looking at a random one in f2fs/file.c
> obviously with no actual numbers in hand.
> 
> In general, I really hate seeing specialized locks, but this f2fs use
> case is in some ways worse than other ad-hoc locks I've seen - simply
> because it's been one whole-sale conversion of "down_read/write()" to
> "f2fs_down_read/write()" - regardless of _which_ lock is being locked.
> 
> (Now, it's not all bad news - in other respects it's much better than
> some ad-hoc locking: at least you still will participate in lockdep,
> and you use the actual low-level locking primitives instead of making
> up your own and getting memory ordering wrong).
> 
> But basically I think it would have been much nicer if you would have
> done this for just the _one_ lock that mattered, whichever lock that
> might be. Partly as documentation, and partly so that maybe some day
> you can split that lock up (or maybe notice cases where you can avoid
> it entirely).
> 
> For example, if it's really just f2fs_lock_op() that needs this, the
> special "wait_event(trylock)" hack could have been entirely local to
> just *that*, rather than affecting all the other locks too.
> 
> And the very first f2fs_lock_op() case I find, I see that the lock is
> pointless. Again, that's unlikely to be the *cause* of any of these
> problems, but the fact that I've now looked at two of the f2fs locks,
> and gone "the locking seems to be pointlessly badly done" does imply
> that the problem isn't "down_read()", it's the use.
> 
> That other lock I reacted to was the f2fs_lock_op(sbi) at the top of
> f2fs_new_inode().
> 
> Look, you have a new inode that you just allocated, that nobody else
> can yet access.
> 
> And the only thing that that f2fs_lock_op(sbi) -> f2fs_unlock_op(sbi)
> sequence protects is the f2fs_alloc_nid() for that new inode.
> 
> Ok, so maybe f2fs_alloc_nid() needs that lock?
> 
> No it doesn't. It already has
> 
>  - &nm_i->nid_list_lock spinlock for its own in-memory internal NID caches
> 
> *and* when that fails
> 
>  - &NM_I(sbi)->build_lock for protecting all of f2fs_build_free_nids()
> 
> *and* inside of that lock
> 
>  - f2fs_down_read(&nm_i->nat_tree_lock) for protecting the NAT tree structures.
> 
> So I see two major issues in the very first user of that
> f2fs_lock_op() that I look at:
> 
>  (a) it seems to be entirely unnecessary

Actually, when I took a look at the above path, indeed, f2fs_lock_op in
f2fs_new_inode may be unnecessary at all aligned to your points. Even, that
might hurt performance since we get f2fs_lock_op twice before dealing with
dentries like f2fs_add_link. Let me test a bit whether there's any regression
if I remove f2fs_lock_op in f2fs_new_inode.

> 
>  (b) it is a classic case of "multiple nested locks".
> 
> Now, it's possible that I'm wrong on (a) and there's some odd reason
> that lock is needed (maybe there is a lock ordering problem for one of
> the other locks between readers and writers, and the op-lock acts as a
> mutual exclusion for that).
> 
> But (b) really is a classic problem case for locking: nested locks are
> *much* more likely to cause horrible contention, because not any
> contention in any of the locks will end up affecting the others (and
> you easily get "bunching up" of different processes when they get
> synchronized with each other thanks to the inner lock).
> 
> Nested locking is often required, but it's one of those things where
> you just need to be aware that they can be horribly bad for
> performance, _particularly_ if an inner lock sees contention and
> essentially "transfers" that contention to an outer lock.
> 
> Maybe I've been unlucky. Maybe the two cases I happened to look at
> were just completely harmless, and very unusual. But the fact that I'm
> two-for-two and go "that locking looks like a prime candidate to be
> fixed" makes me suspect there's a lot of low-hanging fruit in there.

Thank you so much for taking the time to write this great advise. Let me dig
more whether there's anything that I can relax the lock use-cases further.
(tbh, I haven't reviewed them for a long time due to focusing on stability
issues mostly.)

> 
> And that whole "wait_event(trylock)" thing is a symptom of problematic
> f2fs locking, rather than a solution to it.

Understood. If I can avoid lock contention upfront, definitely it wouldn't
need to apply rwsem change at all. Let me take some time to think about how to
move forward.

> 
>                  Linus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
