Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA714E5727
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Mar 2022 18:07:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nX4SA-0002vf-Ay; Wed, 23 Mar 2022 17:07:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <torvalds@linuxfoundation.org>) id 1nX4S0-0002vP-Hi
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Mar 2022 17:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IlrAr0XGIkCPHJPtx2Tduug/t/fZJ/9Vzuvrk/N2Q/Q=; b=fFc2UpNSPhertl2iSGTfwqOFFR
 LkMFX9/AdaNCCAp66PbFnLGwImH2flrskxgw0IJrwJvGzQJhShSIA0DSCVuKZF2tUWZNuIfyS88Qw
 2p7pP9eKHw64TLWdQnenKeDC4/Kjx8GLWkzFb8QCnNqcoIvghH0G5XaPe82a80TYOW9g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IlrAr0XGIkCPHJPtx2Tduug/t/fZJ/9Vzuvrk/N2Q/Q=; b=E38YPTxldO7hK/Oxg103jMMf1K
 xeo78rP+47bxBMCY1Oa7ziJMimUHze26juE/mZZOnPe+UELpLtwN1zfJgq9duT9bB2bu7ceCLUYxV
 zsXOuyUMQQSZxQRniUi96MKsAlYQz0+XOBeYhsvro2gDCqyI7oTSWTLqOYT/LoT1cf98=;
Received: from mail-lf1-f44.google.com ([209.85.167.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nX4Rw-0007dZ-4q
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Mar 2022 17:07:09 +0000
Received: by mail-lf1-f44.google.com with SMTP id l20so3744269lfg.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 23 Mar 2022 10:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IlrAr0XGIkCPHJPtx2Tduug/t/fZJ/9Vzuvrk/N2Q/Q=;
 b=hqUvDc/QeHQ/xjFHfG7JAjDu4YLkDG/f7uB5ksXCiZ1ZlTw5C3L78mZ1/srJPloc6x
 ZOAi94hYrH0w5BZzgyEhUX8+R+4z9fJu6uRrr2IvYVfyozbYpV6MWARLRlat8qVa8F09
 yL0AxhRmGiFSkxscQQ2/yvVsTtqmAI+fY1bN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IlrAr0XGIkCPHJPtx2Tduug/t/fZJ/9Vzuvrk/N2Q/Q=;
 b=yIgkg5d8P9psNd6HWZy1O1oXH+BKtIRIsz+CXIBTBQRpv4lJ8gxI/Xcvzrh76TxQRh
 Cc99NHP+pbLUYnuq2wPXeWPe0iRaI38qX7sEoyvaFLMzsJFQ47jCy+TqCX/2ToQSIhJe
 MgCDI7qmgDm55vxOXZHWrng1zHPOlSvTX+YwGEIA0rX2RyUtyNnckhxBbiC8lLKt7xmC
 Zai0i4WmVfYTB/BBd8sJ0ZvgkLhZqvtYEgWMjfLq0Bw7iuE7A8coixRN5TBtZ5r+c4A5
 V6eefbZntNiu7vR80aBQj6nVaJJjKkNsgTOdbcu1K8T8/rauP1yIPiSOOt/9rLeoDo9b
 8mLw==
X-Gm-Message-State: AOAM533LDvzr8mcQGbgJoDo4kb+QHW6cs11clPTiSVQSgarKCd3OxFOS
 nSf1GbrUcoI/HR5lJK3J3fLNH7crct2X7sSuavI=
X-Google-Smtp-Source: ABdhPJySOKQGagN4v2P3FhwW9Ur6hkCbv243Z4VjZL6uXi900ZEAYEy4zaOvrg6lhdFUGeTOuPfL6g==
X-Received: by 2002:a19:d619:0:b0:43a:1224:bf8c with SMTP id
 n25-20020a19d619000000b0043a1224bf8cmr617149lfg.276.1648055220791; 
 Wed, 23 Mar 2022 10:07:00 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173]) by smtp.gmail.com with ESMTPSA id
 x1-20020a056512130100b004484c116de3sm40710lfu.246.2022.03.23.10.06.59
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 10:06:59 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id bn33so2759352ljb.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 23 Mar 2022 10:06:59 -0700 (PDT)
X-Received: by 2002:a2e:9904:0:b0:247:ec95:fdee with SMTP id
 v4-20020a2e9904000000b00247ec95fdeemr811787lji.291.1648055219283; Wed, 23 Mar
 2022 10:06:59 -0700 (PDT)
MIME-Version: 1.0
References: <YjjihIZuvZpUjaSs@google.com>
 <CAHk-=wgsmvoJFKFWxQ2orEVUOWH1agk9iUNZ=-DFh5OXZL=Ldw@mail.gmail.com>
 <51cded74-3135-eed8-06d3-0b2165e3b379@redhat.com>
 <CAHk-=wi=Xsekgj7zfw_vpOM673CG24vznmz-yx9G05rWSAAYXg@mail.gmail.com>
 <CAEe=Sxmcn5+YUXBQhxDpzZVJu_T6S6+EURDqrP9uUS-PHGyuSg@mail.gmail.com>
 <CAHk-=whGKUyJpi0dTQJjyJxdmG+WCeKkJJyycpOaUW0De17h_Q@mail.gmail.com>
 <YjtKRAgFmBfgU0al@google.com>
In-Reply-To: <YjtKRAgFmBfgU0al@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Mar 2022 10:06:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi99R8i=uvHiHo3jjZPzg6oTJW1rin3ekuPbuccS5XZqA@mail.gmail.com>
Message-ID: <CAHk-=wi99R8i=uvHiHo3jjZPzg6oTJW1rin3ekuPbuccS5XZqA@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Mar 23,
 2022 at 9:26 AM Jaegeuk Kim <jaegeuk@kernel.org>
 wrote: > > OTOH, I was suspecting the major contetion would be > f2fs_lock_op
 -> f2fs_down_read(&sbi->cp_rwsem); > , which was used for [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.44 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.44 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1nX4Rw-0007dZ-4q
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

On Wed, Mar 23, 2022 at 9:26 AM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>
> OTOH, I was suspecting the major contetion would be
>         f2fs_lock_op -> f2fs_down_read(&sbi->cp_rwsem);
> , which was used for most of filesystem operations.

Very possible, I was just looking at a random one in f2fs/file.c
obviously with no actual numbers in hand.

In general, I really hate seeing specialized locks, but this f2fs use
case is in some ways worse than other ad-hoc locks I've seen - simply
because it's been one whole-sale conversion of "down_read/write()" to
"f2fs_down_read/write()" - regardless of _which_ lock is being locked.

(Now, it's not all bad news - in other respects it's much better than
some ad-hoc locking: at least you still will participate in lockdep,
and you use the actual low-level locking primitives instead of making
up your own and getting memory ordering wrong).

But basically I think it would have been much nicer if you would have
done this for just the _one_ lock that mattered, whichever lock that
might be. Partly as documentation, and partly so that maybe some day
you can split that lock up (or maybe notice cases where you can avoid
it entirely).

For example, if it's really just f2fs_lock_op() that needs this, the
special "wait_event(trylock)" hack could have been entirely local to
just *that*, rather than affecting all the other locks too.

And the very first f2fs_lock_op() case I find, I see that the lock is
pointless. Again, that's unlikely to be the *cause* of any of these
problems, but the fact that I've now looked at two of the f2fs locks,
and gone "the locking seems to be pointlessly badly done" does imply
that the problem isn't "down_read()", it's the use.

That other lock I reacted to was the f2fs_lock_op(sbi) at the top of
f2fs_new_inode().

Look, you have a new inode that you just allocated, that nobody else
can yet access.

And the only thing that that f2fs_lock_op(sbi) -> f2fs_unlock_op(sbi)
sequence protects is the f2fs_alloc_nid() for that new inode.

Ok, so maybe f2fs_alloc_nid() needs that lock?

No it doesn't. It already has

 - &nm_i->nid_list_lock spinlock for its own in-memory internal NID caches

*and* when that fails

 - &NM_I(sbi)->build_lock for protecting all of f2fs_build_free_nids()

*and* inside of that lock

 - f2fs_down_read(&nm_i->nat_tree_lock) for protecting the NAT tree structures.

So I see two major issues in the very first user of that
f2fs_lock_op() that I look at:

 (a) it seems to be entirely unnecessary

 (b) it is a classic case of "multiple nested locks".

Now, it's possible that I'm wrong on (a) and there's some odd reason
that lock is needed (maybe there is a lock ordering problem for one of
the other locks between readers and writers, and the op-lock acts as a
mutual exclusion for that).

But (b) really is a classic problem case for locking: nested locks are
*much* more likely to cause horrible contention, because not any
contention in any of the locks will end up affecting the others (and
you easily get "bunching up" of different processes when they get
synchronized with each other thanks to the inner lock).

Nested locking is often required, but it's one of those things where
you just need to be aware that they can be horribly bad for
performance, _particularly_ if an inner lock sees contention and
essentially "transfers" that contention to an outer lock.

Maybe I've been unlucky. Maybe the two cases I happened to look at
were just completely harmless, and very unusual. But the fact that I'm
two-for-two and go "that locking looks like a prime candidate to be
fixed" makes me suspect there's a lot of low-hanging fruit in there.

And that whole "wait_event(trylock)" thing is a symptom of problematic
f2fs locking, rather than a solution to it.

                 Linus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
