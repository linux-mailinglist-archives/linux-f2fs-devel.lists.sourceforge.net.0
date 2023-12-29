Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 477D8820124
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Dec 2023 20:10:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rJIFk-0006ET-5K;
	Fri, 29 Dec 2023 19:10:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rJIFi-0006EM-9q
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Dec 2023 19:10:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1PraSrieD2rdzihnr8Cz78frBdemPo8RG1q5ToFJ+Rs=; b=kFTQaQDpK/5yzuTKRxwkWiuxxX
 pF6UO+2KQbCTLcAIACLInjCZzVtLZ5G6dfe7yyBU+Hpul8hf5cw+MBEq3dHzqoRy2rosIbjXJ2Ps5
 FR2XKxY1rfp6hlvP8my1aqwlVNkP8/GdBRIZFEtyxQN0iwxTtmPQHuc695w4vsUyFOlQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1PraSrieD2rdzihnr8Cz78frBdemPo8RG1q5ToFJ+Rs=; b=lHwnWn4PO+/yuM1OUUbqDJTtrS
 7NOYYHXymROlOhMmghenX9VJPHt7+XlugopwqyXyYUPG0YwdC5xnFQOBobsGdj4TGJR4IMoorcj4e
 I8ZRU+wr2S/V840Byeg9CjZVXfjagEcTBFJ52wtEiRP6ybHL25rjH1VmBE0BpNZrpg5k=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rJIFg-0005NL-HI for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Dec 2023 19:10:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9ABAACE1914;
 Fri, 29 Dec 2023 19:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8C0DC433C8;
 Fri, 29 Dec 2023 19:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703877024;
 bh=n/u8Is//v0Ro8/pG72yfz0N/NJ9Aar0atK9WepWLF0Y=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XfxT3tkTj8g4dQqKNG22Ez5UKdposJrahV8CZHcHOE05e8wMeZoJZRQzCs28efKkl
 HcFePXtpIffAUi1Ag/VvW1mYYJlUqVNS4IZDHEy/sPVsEi9UFSsAVkghG4gYW4+d2M
 qp93qI6g6bN9e4Nq6K6ofVWf+hyC2nQIMq0qiUdxkte/7ksDZ316WylDoJeyRYYHpA
 rZ3we5f+wKSEO7SpW4bbcGd5dDcfZI1mE1lHrLA1RfgjHwbuUGhxumuacTMg1dyg7O
 SJmfmmdnMp7ITnU1LC/Jr9btlyrwNyPVkifUA4AfoYX0rMbC8pnXaqV/HBDuxO63rE
 ZUr5wuHJbfxBw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 AAC7EE333D4; Fri, 29 Dec 2023 19:10:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170387702469.8173.10482825334878729099.git-patchwork-notify@kernel.org>
Date: Fri, 29 Dec 2023 19:10:24 +0000
References: <20231221064916.1930095-1-haokexin@gmail.com>
In-Reply-To: <20231221064916.1930095-1-haokexin@gmail.com>
To: Kevin Hao <haokexin@gmail.com>
X-Spam-Score: -5.1 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 21 Dec 2023 14:49:16 +0800 you
 wrote: > A freezable kernel thread can enter frozen state during freezing
 by > either calling try_to_freeze() or using wait_event_freezable() and its
 > variants. [...] 
 Content analysis details:   (-5.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rJIFg-0005NL-HI
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Use wait_event_freezable_timeout()
 for freezable kthread
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net, pavel@ucw.cz,
 rafael@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 21 Dec 2023 14:49:16 +0800 you wrote:
> A freezable kernel thread can enter frozen state during freezing by
> either calling try_to_freeze() or using wait_event_freezable() and its
> variants. So for the following snippet of code in a kernel thread loop:
>   wait_event_interruptible_timeout();
>   try_to_freeze();
> 
> We can change it to a simple wait_event_freezable_timeout() and then
> eliminate the function calls to try_to_freeze() and freezing().
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: Use wait_event_freezable_timeout() for freezable kthread
    https://git.kernel.org/jaegeuk/f2fs/c/94e7eb42414b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
