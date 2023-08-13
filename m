Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 913A077A4F3
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 13 Aug 2023 06:30:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qV2kJ-0001Cq-Kd;
	Sun, 13 Aug 2023 04:30:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qV2kI-0001Ck-K1
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 13 Aug 2023 04:30:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w+/Rmv9xJJ2diwOcU1QE0+QvCVLrd4a9U2hMT0JIc4g=; b=M7oz/lQFmyyw4MshDpcZH/y7tk
 SzMbLhZTy8jT0OAcnkSfSGzxbApIyxZebaSV3YJiG88+QwsyeHlhPZs2ZoW72UNPj04yeO8Er5+KE
 gbmdHnMgMMDozZ/rIYGu7mGMxSrvWEzq6rkywbmUqENL1xNlhvishdm1HSxiVfUL7eM8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w+/Rmv9xJJ2diwOcU1QE0+QvCVLrd4a9U2hMT0JIc4g=; b=Vix5mj5qFO92BterKjCD+7DP/B
 rixVcU2YuEANTxPO1++j7ZdYHx1AE2JJbBMnmDDi3kgV0qPvYMG3zBnTUXQ0uobl7Yj27meE/Ydat
 60zlk0LTIVybcKeRU0gvuh7eCaR/ZKxBj20CaSq29al7kY1T31/3ArQOggcTxlD9Z2U0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qV2kI-00036e-QN for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 13 Aug 2023 04:30:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3B71761D7C;
 Sun, 13 Aug 2023 04:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54070C433C7;
 Sun, 13 Aug 2023 04:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691901024;
 bh=C9pWXxBilxJdH8Y7mBGisX4v0+MjqIvuoPcip0f+Zu0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h1+iWqUxRkDve5Ugw1GmTMdyIORsu+T3tGZxclefsBMszOaJNk358YyigYEFw7m+3
 vjQNl9X950SqC48q7G9q4jG8hrL3D7Sg2HCG6RaT+yZKRSt7B0W/ingZWrdkWFHQLw
 zVNqmwMNrLIJv7UHT6b6TpTs7FuxN9bixOrEN+OT1yUi1nWzPm7c1OQR3rckCo0247
 W9icUGUqaMmRPVQX4/QxSjlb/CUzBiwSXb/9jAAq5boL5KUo+Us1N3facjhouxQrbo
 5NpTiV5pXmbfHmGauDtKW0Y6vfqdvs9xxOu1reMg/GmgLuUIh2Ild8w/t/2Mkw7xXv
 3xwkolkyKcnrw==
Date: Sat, 12 Aug 2023 21:30:22 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20230813043022.GA3545@sol.localdomain>
References: <20230812004146.30980-1-krisman@suse.de>
 <20230812004146.30980-2-krisman@suse.de>
 <20230812015915.GA971@sol.localdomain>
 <20230812230647.GB2247938@mit.edu>
 <ZNhJSlaLEExcoIiT@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZNhJSlaLEExcoIiT@casper.infradead.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Aug 13, 2023 at 04:08:58AM +0100,
 Matthew Wilcox wrote:
 > On Sat, Aug 12, 2023 at 07:06:47PM -0400, Theodore Ts'o wrote: > > One
 could say that this is an insane threat model, but the syzbot t [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qV2kI-00036e-QN
Subject: Re: [f2fs-dev] [PATCH v5 01/10] fs: Expose helper to check if a
 directory needs casefolding
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
Cc: Gabriel Krisman Bertazi <krisman@suse.de>, brauner@kernel.org,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Aug 13, 2023 at 04:08:58AM +0100, Matthew Wilcox wrote:
> On Sat, Aug 12, 2023 at 07:06:47PM -0400, Theodore Ts'o wrote:
> > One could say that this is an insane threat model, but the syzbot team
> > thinks that this can be used to break out of a kernel lockdown after a
> > UEFI secure boot.  Which is fine, except I don't think I've been able
> > to get any company (including Google) to pay for headcount to fix
> > problems like this, and the unremitting stream of these sorts of
> > syzbot reports have already caused one major file system developer to
> > burn out and step down.
> > 
> > So problems like this get fixed on my own time, and when I have some
> > free time.  And if we "simplify" the code, it will inevitably cause
> > more syzbot reports, which I will then have to ignore, and the syzbot
> > team will write more "kernel security disaster" slide deck
> > presentations to senior VP's, although I'll note this has never
> > resulted in my getting any additional SWE's to help me fix the
> > problem...
> > 
> > > So just __ext4_iget() needs to be fixed.  I think we should consider doing that
> > > before further entrenching all the extra ->s_encoding checks.
> > 
> > If we can get an upstream kernel consensus that syzbot reports caused
> > by writing to a mounted file system aren't important, and we can
> > publish this somewhere where hopefully the syzbot team will pay
> > attention to it, sure...
> 
> What the syzbot team don't seem to understand is that more bug reports
> aren't better.  I used to investigate one most days, but the onslaught is
> relentless and I just ignore syzbot reports now.  I appreciate maintainers
> don't necessarily get that privilege.
> 
> They seem motivated to find new and exciting ways to break the kernel
> without realising that they're sapping the will to work on the bugs that
> we already have.
> 

Well, one thing that the kernel community can do to make things better is
identify when a large number of bug reports are caused by a single issue
("userspace can write to mounted block devices"), and do something about that
underlying issue (https://lore.kernel.org/r/20230704122727.17096-1-jack@suse.cz)
instead of trying to "fix" large numbers of individual "bugs".  We can have 1000
bugs or 1 bug, it is actually our choice in this case.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
