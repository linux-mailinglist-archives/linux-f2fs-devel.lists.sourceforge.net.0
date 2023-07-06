Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B39A3749278
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jul 2023 02:18:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qHChb-0003GZ-H5;
	Thu, 06 Jul 2023 00:18:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qHChZ-0003EJ-4J
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jul 2023 00:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sIhwu2hpEHCr9gc6S1YJv3JO6lrMDt52GyIlj2O0sgA=; b=GGVMrPhShrBkepevA7wavAeDg+
 FecQoO/XEE3dxbc71um4YPc1xptHYfCukRetnau4EP15xfHujlGYIh/F1YPygbJL9SQy11ecvsKTW
 b1/Ld1DETtaw64fs50chkHO8sTEBOrwdhbn+9fI+xbdz9vv8Gwt5iOQMlfluBTyHwzIc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sIhwu2hpEHCr9gc6S1YJv3JO6lrMDt52GyIlj2O0sgA=; b=Hi7r3LO0ubkZufB9zFh2QOfYTP
 c/chzDozkzR+L6ZkbbBERRq/buL8J9nZ1dltEjnv0K04vtRpacVsJM5Y37yuzyXZOW/yjOSsti6yl
 /EqzgP0t8v6fxnTgfsOhRGOXKu8/hW+ZQ1Y1RYcbq1Fs/2xjMrNljAcSYe20hSS71UlA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qHChY-0006H7-64 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jul 2023 00:18:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 55AD761838;
 Thu,  6 Jul 2023 00:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30C45C4163C;
 Thu,  6 Jul 2023 00:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688602695;
 bh=NJw3PZzMuCwwMcMSxFbvLpZhobMhsPnQQv6wafbTKtk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=PTwth056POe7NUFtCvmuHa28xS5FyO5l+dQBHab2NGymq0TI+h83vnutmCEP7HZ4S
 7038WZ/oGBuSQ1rR9FTsGvdTZlPklGh9MT4IWUBxeX7XrjsW5R15UaphF70osX8wMY
 8LU77IEJy8gEQNO0LNJX1K96pyNk8+EKBSmFQqjvFQ6ZE+/xNy7IO2tRJpH70MTqHT
 LUk8NoEATcnxImLTeoS1I1yibU13ZweAEQJGrjaA9ljv/J8JLyTURwvwRK0hn+GDPQ
 dEdX95Ixxc9f8PCUcVwxY6fVVrDEVoGCxzv3QodF3LP+GRA1Y3lk9MhI0A2mFxWzwP
 eca8pDxHvLs7A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 06476C561EE; Thu,  6 Jul 2023 00:18:15 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168860269502.29151.1311493785535240240.git-patchwork-notify@kernel.org>
Date: Thu, 06 Jul 2023 00:18:15 +0000
References: <ZKWuP6+mGdW/W0/P@google.com>
In-Reply-To: <ZKWuP6+mGdW/W0/P@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This pull request was applied to jaegeuk/f2fs.git
 (dev)
 by Linus Torvalds <torvalds@linux-foundation.org>: On Wed, 5 Jul 2023 10:54:07
 -0700 you wrote: > Hi Linus, > > Could you please consider this pull request?
 > > Thank you. > > The following changes since commit
 ac9a78681b921877518763ba0e89202254349d1b [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qHChY-0006H7-64
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 6.5
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
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This pull request was applied to jaegeuk/f2fs.git (dev)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Wed, 5 Jul 2023 10:54:07 -0700 you wrote:
> Hi Linus,
> 
> Could you please consider this pull request?
> 
> Thank you.
> 
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,GIT,PULL] f2fs update for 6.5
    https://git.kernel.org/jaegeuk/f2fs/c/73a3fcdaa732

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
