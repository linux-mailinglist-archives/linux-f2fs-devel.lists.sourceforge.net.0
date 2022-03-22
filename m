Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C784E47F0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Mar 2022 21:58:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nWlSd-00038K-9H; Tue, 22 Mar 2022 20:58:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nWlSc-00038E-OO
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Mar 2022 20:58:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IPFf4rRNTkfLE4qT5dA3A4cfnFMzjH/sjEFMHi8mjpg=; b=kj4k/g1AzXXjz76U7cNz0hoeKT
 8ocobXM2b+SOttRkUtdMrfkFoY3aPO7JupbM8mXa1RWpEByfJTb6RJspFNhY5EKljm3nwWmOfgrSe
 U4XPynZUpLw9vneUTA0mk2fb999w5S+EhAK2WhWuddczHGFKachLhohDps2WaJL3MeSs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IPFf4rRNTkfLE4qT5dA3A4cfnFMzjH/sjEFMHi8mjpg=; b=BU7xWzN92oljLhTua41wSu1oIx
 9BTVQp0cAUtJlDBmiFX9JX+G1UHNZvqYo50Js0M+ztFyIDj/K3I6s8ZMG9g3Jw7wMEE7LkBSxe/3j
 I6LNYqRUHNkqtxy9MqWC5a3yH0DIT6mo0ioTOatMfbErsegj7ixL3bgc9qQerJJH+KAc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nWlaX-0000Hn-NJ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Mar 2022 20:58:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 538D861712;
 Tue, 22 Mar 2022 20:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019BBC340EC;
 Tue, 22 Mar 2022 20:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647982720;
 bh=qneKTjCnzz1tSRczDENyPpegPElP0m0jzzOPobXNPLk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ht4dYd/bNEB12UbTCLdQOiYj35b9WG6DBUguqxmVkhLeU5fCqJUa8ZLhRZbqmPnKa
 leOOQPPl9CIm2JlCWfDym3kx99dyQ8JyM0HmSxS3JWmsisL0aJhsL9wRjN6jnTRTTs
 Y16qQV8sHJCGnqSP9JDo//puaaVKuF/eQIQmIal2zlpphLTmsxqr78C43cE78uVYaz
 n0nPEsNfE/62DIrpwvnbCjB56Q9naia+8XdWszdQNMoWbkHchBr+qU1JJCgFL59abo
 2NWqJgv2/GiP0Rk640D9z4gmlJYagwuoyR+ALI6j49boo9+u6aEzvSkVvS+saGcqHG
 I5sa/JchBKDtw==
Date: Tue, 22 Mar 2022 13:58:38 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <Yjo4fg4HRzEVDr7o@google.com>
References: <YjjihIZuvZpUjaSs@google.com>
 <CAHk-=wgsmvoJFKFWxQ2orEVUOWH1agk9iUNZ=-DFh5OXZL=Ldw@mail.gmail.com>
 <51cded74-3135-eed8-06d3-0b2165e3b379@redhat.com>
 <CAHk-=wi=Xsekgj7zfw_vpOM673CG24vznmz-yx9G05rWSAAYXg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wi=Xsekgj7zfw_vpOM673CG24vznmz-yx9G05rWSAAYXg@mail.gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, On 03/22, Linus Torvalds wrote: > On Tue, Mar 22, 
 2022 at 10:37 AM Waiman Long <longman@redhat.com> wrote: > > > > AFAICS,
 the read-unfair rwsem code is created to resolve a potential > > lock starvat
 [...] Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nWlaX-0000Hn-NJ
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

Hi Linus,

On 03/22, Linus Torvalds wrote:
> On Tue, Mar 22, 2022 at 10:37 AM Waiman Long <longman@redhat.com> wrote:
> >
> > AFAICS, the read-unfair rwsem code is created to resolve a potential
> > lock starvation problem that they found on linux-5.10.y stable tree. I
> > believe I have fixed that in the v5.11 kernel, see commit 2f06f702925
> > ("locking/rwsem: Prevent potential lock starvation").
> 
> Ahh.
> 
> Adding Tim Murray to the cc, since he was the source of that odd
> reader-unfair thing.
> 
> I really *really* dislike people thinking they can do locking
> primitives, because history has taught us that they are wrong.
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

The pain point is 1) we don't have a specific test to reproduce the issue,
but got some foundings from field only, 2) in order to test the patches, we
need to merge the patches into Android kernel [1] through LTS, 3) but, LTS
wants to see any test results [2].

[1] https://android-review.googlesource.com/q/topic:rwsem_unfair
[2] https://lore.kernel.org/stable/988fd9b5-8e89-03ae-3858-85320382792e@redhat.com/

So, I thought applying it in f2fs could avoid kernel version issues without
any risk of updating rwsem. Meanwhile, agreed that we should use the right APIs,
I'm going to disable this f2fs change in the next device having newer kernel to
see whether or not uptodate rwsem can really fix the issue.

> 
>             Linus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
