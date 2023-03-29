Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE276CCEDA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Mar 2023 02:36:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1phJnU-0004qR-S7;
	Wed, 29 Mar 2023 00:36:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1phJnT-0004qL-QB
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Mar 2023 00:36:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Prfc2KxVbcZ5ko0bKDwZiFuHSv84UiA7OWtoZbvM0aM=; b=DB0WXQEJQ+mSHXjXBkAf2Q0PIB
 wt642vq4DR66H6QWpxyb1rOQd2HS7cKLFcTnFapRhMUUBA7oOb0Jlj1tDcQbSAy2IMGpDSXcA3W4R
 uORXxie+TPWOMiEPJ/r3kupBAJ0s8EWIRgUo6RYu46bNRbTwbr7VP38JR5HOtFJorRX8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Prfc2KxVbcZ5ko0bKDwZiFuHSv84UiA7OWtoZbvM0aM=; b=CiWzGUyL5zj5vOWIR11abeqcv2
 h11vZwDfz2DGNBCScwM7uxh9gnLpZVv80QlWNa0/MZY/dpaOS+KvvxUpUQvyPJKtivdv1WFU9mg1J
 0pZNcRRbWs6dk2FJ9k92KOz4ZwvRIfgTzgFYfOq+iG4x/dG2Cm6kjkOuOHFvDAeuO20o=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1phJnR-0006IT-Sl for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Mar 2023 00:36:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7E3B861A17;
 Wed, 29 Mar 2023 00:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D71C433D2;
 Wed, 29 Mar 2023 00:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680050167;
 bh=CRGoe9g/Zg2dbVzuHdM29TbmYjg+4heFgOM3Ae0VP8s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WEobjo2qUZgLl+BRnj0/+9kJmxt/OoqabnlGUjaIW06Iuc+OwkrkkE0tbBlIKlyYf
 ssb+AWTkGyri1oyNJjro5YEOLLUCQeACb55VAXMKjZBaw5FA7/GdmzC0o35xnou59r
 QL3kd8E2gpFl0nGC+/kI8LwFvMzPTMzqTuVwlRmIEC5IAmU72CgNL8DKrttHRpxDe4
 ar0tOEDr35NOfBQ6cYtV4RUbxKOH9SRHu7VLQvjvU1oCDOAUlY9Hvi/c9CTnYDl3xo
 e8vBMNDurHtsBSYmIdoimwI/DPIvMKP6VKoC/nXzHD94vOwHXnHL2CANfxPfpCKlnt
 ynDaDGYd5CcAQ==
Date: Tue, 28 Mar 2023 17:36:06 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Message-ID: <ZCOH9pc3hBKU3G3Z@google.com>
References: <20230306122549.236561-1-douglas.raillard@arm.com>
 <167821082479.1693.18260840022075703789.git-patchwork-notify@kernel.org>
 <20230328190306.3337b7b0@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230328190306.3337b7b0@gandalf.local.home>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/28, Steven Rostedt wrote: > On Tue,
 07 Mar 2023 17:40:24
 +0000 > patchwork-bot+f2fs@kernel.org wrote: > > > Hello: > > > > This patch
 was applied to jaegeuk/f2fs.git (dev) > > by Jaegeuk Kim <ja [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1phJnR-0006IT-Sl
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix f2fs_truncate_partial_nodes ftrace
 event
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
Cc: patchwork-bot+f2fs@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, mhiramat@kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Douglas RAILLARD <douglas.raillard@arm.com>,
 linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/28, Steven Rostedt wrote:
> On Tue, 07 Mar 2023 17:40:24 +0000
> patchwork-bot+f2fs@kernel.org wrote:
> 
> > Hello:
> > 
> > This patch was applied to jaegeuk/f2fs.git (dev)
> > by Jaegeuk Kim <jaegeuk@kernel.org>:
> > 
> > On Mon,  6 Mar 2023 12:25:49 +0000 you wrote:
> > > From: Douglas Raillard <douglas.raillard@arm.com>
> > > 
> > > Fix the nid_t field so that its size is correctly reported in the text
> > > format embedded in trace.dat files. As it stands, it is reported as
> > > being of size 4:
> > > 
> > >         field:nid_t nid[3];     offset:24;      size:4; signed:0;
> > > 
> > > [...]  
> > 
> > Here is the summary with links:
> >   - [f2fs-dev] f2fs: Fix f2fs_truncate_partial_nodes ftrace event
> >     https://git.kernel.org/jaegeuk/f2fs/c/3ccc99d5a4ea
> > 
> > You are awesome, thank you!
> 
> I'm hoping you are not waiting for the merge window to get this in. Please
> get it to Linus before rc5 is out, because I plan on adding my patch[1]
> which will cause this to fail the build at rc5.
> 
> The above is a fix to bug that causes unwanted results. Please get it into
> mainline ASAP.

Thanks for heads-up. I sent a pull request having the above patch to Linus.

https://lore.kernel.org/linux-f2fs-devel/ZCOHd4jYn8zUCEZ0@google.com/T/#u

Thanks,

> 
> [1] https://patchwork.kernel.org/project/linux-trace-kernel/patch/20230309221302.642e82d9@gandalf.local.home/
> 
> -- Steve


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
