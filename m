Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8324E564D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Mar 2022 17:27:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nX3p6-0001gz-Q6; Wed, 23 Mar 2022 16:26:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nX3p5-0001gt-3T
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Mar 2022 16:26:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3hZVbpHDywGkXTePwfYB+/7l7SaLUJq+aT60p7gyAiI=; b=mJx0hL8vuYy2i5u+LCx2Exb7ZB
 R87LSmsSxxX5chCJVpwUhjbnJ+MWHy/2CAgV6NicsbYs0wTYN6OYmk61iNiUCN01vNm2shvQu0Lq/
 NJ6xBCQ/OxcziZc0+D1CfYQCl/rvppyM5nQSHFMLPpUpGm+pSYFXwcz04rAZCNcDCSnI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3hZVbpHDywGkXTePwfYB+/7l7SaLUJq+aT60p7gyAiI=; b=XciLE+HvqDw1By5nd97pWCvP42
 qaeZehmeoGrAGqiltKuLreHFZUH8bA0LvaEGNVECvdqcCnCeYnbOGh3Q3A6Z63CVY8OK4cBNxOlPG
 r9P1oKkwbdWDIjxzQ5KiysAZ21+1Bc5xAr2RuDiyHPNdOCwd1ypYvdv3EX4rBwgrOliE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nX3p1-009cXF-2F
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Mar 2022 16:26:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EA379B81F84;
 Wed, 23 Mar 2022 16:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B50C340E8;
 Wed, 23 Mar 2022 16:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648052806;
 bh=CuBjkLYRVIIbPFpIa1Vl/F+x4Z7zFyfHbwVgo+ZjRio=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GvcXdybUQM9gcIggCekgj5mnNxjvBi72554H//JkbF6fQPFJIgDbDbZPvBnj5z19u
 fZXv1v3djBOYB+hysQsnADJtiCrUJjbv+4BlgCBsVrYcqXlWw/qBxW72kH0j6/EiPM
 JXngEyhQWZqh/wcv1dDYhyu4eeyxG1kTLp0+FQUFSBd4aMKMWILjRBrhgwFb+XWuWE
 BGql5CU7E8s4+tEx3RI300EvwKcbNRDxov5lbxMuDpAn8I3a2AQop4jxZk86Dx6AE0
 I14kSjNfnYcmVaHbh7PCNpgNBoXB/WeeVMbLIcBEWL7AMeOCCPWSZNESvo/gW0Mztt
 eAR6Jo9nyHNAQ==
Date: Wed, 23 Mar 2022 09:26:44 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YjtKRAgFmBfgU0al@google.com>
References: <YjjihIZuvZpUjaSs@google.com>
 <CAHk-=wgsmvoJFKFWxQ2orEVUOWH1agk9iUNZ=-DFh5OXZL=Ldw@mail.gmail.com>
 <51cded74-3135-eed8-06d3-0b2165e3b379@redhat.com>
 <CAHk-=wi=Xsekgj7zfw_vpOM673CG24vznmz-yx9G05rWSAAYXg@mail.gmail.com>
 <CAEe=Sxmcn5+YUXBQhxDpzZVJu_T6S6+EURDqrP9uUS-PHGyuSg@mail.gmail.com>
 <CAHk-=whGKUyJpi0dTQJjyJxdmG+WCeKkJJyycpOaUW0De17h_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=whGKUyJpi0dTQJjyJxdmG+WCeKkJJyycpOaUW0De17h_Q@mail.gmail.com>
X-Spam-Score: -6.4 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/22, Linus Torvalds wrote: > On Tue, Mar 22, 2022 at
 5:34 PM Tim Murray <timmurray@google.com> wrote: > > > > AFAICT,
 what's happening
 is that rwsem_down_read_slowpath > > modifies sem->count to [...] 
 Content analysis details:   (-6.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
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
X-Headers-End: 1nX3p1-009cXF-2F
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

On 03/22, Linus Torvalds wrote:
> On Tue, Mar 22, 2022 at 5:34 PM Tim Murray <timmurray@google.com> wrote:
> >
> > AFAICT, what's happening is that rwsem_down_read_slowpath
> > modifies sem->count to indicate that there's a pending reader while
> > f2fs_ckpt holds the write lock, and when f2fs_ckpt releases the write
> > lock, it wakes pending readers and hands the lock over to readers.
> > This means that any subsequent attempt to grab the write lock from
> > f2fs_ckpt will stall until the newly-awakened reader releases the read
> > lock, which depends on the readers' arbitrarily long scheduling
> > delays.
> 
> Ugh.
> 
> So I'm looking at some of this, and you have things like this:
> 
>         f2fs_down_read(&F2FS_I(inode)->i_sem);
>         cp_reason = need_do_checkpoint(inode);
>         f2fs_up_read(&F2FS_I(inode)->i_sem);
> 
> which really doesn't seem to want a sleeping lock at all.
> 
> In fact, it's not clear that it has any business serializing with IO
> at all. It seems to just check very basic inode state. Very strange.
> It's the kind of thing that the VFS layer tends to use te i_lock
> *spinlock* for.

Um.. let me check this i_sem, introduced by
d928bfbfe77a ("f2fs: introduce fi->i_sem to protect fi's info").

OTOH, I was suspecting the major contetion would be
	f2fs_lock_op -> f2fs_down_read(&sbi->cp_rwsem);
, which was used for most of filesystem operations.

And, when we need to do checkpoint, we'd like to block internal operations by
	f2fs_lock_all -> f2fs_down_write(&sbi->cp_rwsem);

So, what I expected was giving the highest priority to the checkpoint thread
by grabbing down_write to block all the other readers.

> 
> And perhaps equally oddly, then when you do f2fs_issue_checkpoint(),
> _that_ code uses fancy lockless lists.
> 
> I'm probably mis-reading it.
> 
>              Linus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
