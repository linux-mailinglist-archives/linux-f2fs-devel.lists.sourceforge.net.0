Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 111EAA7407B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Mar 2025 22:58:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txvEp-0001zQ-Oa;
	Thu, 27 Mar 2025 21:58:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1txvEm-0001zF-Ib
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 21:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oO/QzIIMcjFyk5LwoSEjQbufVLaRzyJFjXFWeTu30gY=; b=DHv9SmPtPl0msYzWGinE35ZIyW
 8fqViFJFb4UDoszrXG/yTpPAYwLK7pTUAGb44BDnOsfb1DVzmIa8+6qD3FKeWjK//VbqJpVZnZdxB
 l8en4Zn+VRjYtc/sLmbR0GIA6ewMDi842W4ctuYSFManxaNyrYBdfE4GuNDs33R/4BnA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oO/QzIIMcjFyk5LwoSEjQbufVLaRzyJFjXFWeTu30gY=; b=KmwxNtN/x2NOqPUiEVwqOgZPHB
 S99zGGMEnomIoTPtbgX0axwwTFH4YBKo8Lhz0AL2wnTSDl1pv9CZhLk5r+1Cci2/XC6WPZQ+iebPm
 bto89FyrbyRCb8WnKNkM8+eywTHXUVMiKdJ8aE28bKZiWg0zaRaPnIAiB1HKTFvfJ5zE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1txvEg-0008VB-Uk for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 21:58:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 71DBA5C692B;
 Thu, 27 Mar 2025 21:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE61C4CEE4;
 Thu, 27 Mar 2025 21:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743112672;
 bh=ZsADyA8KuiZgxQVVEb+zpMu58RecCjloMAnX+/v+buo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=bIwuxwijA27zYL/rKK5iPIKDyPcIVvdquEhX4uJ/0O7kDQfBlQSwDEduEq7lBgSUP
 CarnIwjQQXg0LMhX247Z0yfZPAOVXs7ox6Yl/6ng4ld4ZhQwFVO6+OhtpmtLqg1lIr
 iDGMaIq3M2g+x+DmwQyJ12DqWV+J6JbeUBhYNUPdvWYTWaBIIt5G7iXhiqcWwUeKfG
 P2Y7tLT318zO2AKeuygoe8PKsHUjMAL0rFr2YeLw15OUpvxyxy6sb/6z+2jWBhe0Mb
 ItMPzIq+nMKnGeobPtSLjSKUrJjsGUms2R5sXtzR1yJaJJrkYEwrRv0anEeepMmFm+
 aAae3Ciufjrwg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADC26380AAFD; Thu, 27 Mar 2025 21:58:29 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174311270850.2230226.4852455108648362564.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 21:58:28 +0000
References: <cover.1739182025.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1739182025.git.mchehab+huawei@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jonathan Corbet <corbet@lwn.net>: On Mon, 10 Feb 2025 11:17:49 +0100 you
 wrote: > Hi Jon/Greg, > > This series replace get_abi.pl with a Python version.
 > > I originally started it due to some issues I noticed when searching for
 > ABI [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1txvEg-0008VB-Uk
Subject: Re: [f2fs-dev] [PATCH 00/27] Improve ABI documentation generation
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
From: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: patchwork-bot+f2fs@kernel.org
Cc: tony.luck@intel.com, linux-doc@vger.kernel.org, corbet@lwn.net,
 james.clark@linaro.org, suzuki.poulose@arm.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 gpiccoli@igalia.com, bpf@vger.kernel.org, linux-hardening@vger.kernel.org,
 johannes@sipsolutions.net, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, mike.leach@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jonathan Corbet <corbet@lwn.net>:

On Mon, 10 Feb 2025 11:17:49 +0100 you wrote:
> Hi Jon/Greg,
> 
> This series replace get_abi.pl with a Python version.
> 
> I originally started it due to some issues I noticed when searching for
> ABI symbols. While I could just go ahead and fix the already existing
> script, I noticed that the script maintainance didn't have much care over
> all those years, probably because it is easier to find Python programmers
> those days.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,07/27] ABI: sysfs-fs-f2fs: fix date tags
    https://git.kernel.org/jaegeuk/f2fs/c/90800df0da78

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
