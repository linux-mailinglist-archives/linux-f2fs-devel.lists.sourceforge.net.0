Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 609758C2E17
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 May 2024 02:50:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s5aws-0002OF-V5;
	Sat, 11 May 2024 00:50:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1s5awo-0002NO-44
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 May 2024 00:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jyopC3G+MEJd86s+4zW0x7qm4kfRnwX0NrvEILiypbI=; b=enO4gvaK3n96wDfftA6pX1pzXy
 hXIn0oAgrjk3cfvJ/nKmdCYUXKUwF9cKr6LIAgfUvOeoqj6yGcdVWXTGDT3qZQcpi9JNtxkslxBP9
 0+uPPgkmkwkRS6ze2h4U6nHbe/bl7dSEA6XZO17fudEL0/QL7eu7pgq5T6lXbWrvODks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jyopC3G+MEJd86s+4zW0x7qm4kfRnwX0NrvEILiypbI=; b=ZqN52+iWYmBIl4ZMfbG/WgGk8N
 JLu0fuMMvBKPoYgbmS1ZTK8oTZI+CBs5VbuhTCOJxMshjGrt/DZGuwPOGX0rl8EwW/kpEnesxKJhp
 HAGI6wQvN/a7FjuVxNsUuJ8zlOQ0cs9JRD//CzMvHlb62/4rgD84GS2rdDjpNAKYqgXg=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s5awp-0004zJ-Bp for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 May 2024 00:50:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D4C7BCE1F2F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 11 May 2024 00:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8EFDC32782;
 Sat, 11 May 2024 00:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715388633;
 bh=8Yop3smxewSROz7DAHuqzNJwUb8FvXPb5lUi3OGSIu8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=qaItr4cVfJp6WlyqcwFaD0BnCkFTkgScfqQp8CaRtpcdAH/29//J/LyJVc/LX6+gZ
 8IYtMVrqHFD+0MzUesF/5gRTpk/MyUQuOlHEg/6/k7J5exaoei8DMsLEkZ2TqP7F++
 RfahxO49CNmWumvP+23GlopBn7G8iXs1n4rBECKxj4UMKgNkrAdik+oiCFJEPjetf3
 Npp7L4AbtTq5In0XDieCtlngZ12hSYp4Ji2tfWgsRkEQVAYHmLNW/skz0Rj8yYxpip
 u2HfRMpLPh8Nm9VThxVNDpWxbdRXU/tsHrC8vuxxn7WzER+GpT1oUsTfiyi6vxufVq
 yFwin0Vhp27bQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 BBE27C54BA2; Sat, 11 May 2024 00:50:33 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171538863376.11229.7632095101337485351.git-patchwork-notify@kernel.org>
Date: Sat, 11 May 2024 00:50:33 +0000
References: <20240506104742.778789-1-chao@kernel.org>
In-Reply-To: <20240506104742.778789-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 6 May 2024 18:47:42 +0800 you wrote:
 > Commit b1c9d3f833ba ("f2fs: support printk_ratelimited() in f2fs_printk()")
 > missed some cases, cover all remains for cleanup. > > Signed-off-by: Chao
 Y [...] Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s5awp-0004zJ-Bp
Subject: Re: [f2fs-dev] [PATCH] f2fs: use f2fs_{err,
 info}_ratelimited() for cleanup
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon,  6 May 2024 18:47:42 +0800 you wrote:
> Commit b1c9d3f833ba ("f2fs: support printk_ratelimited() in f2fs_printk()")
> missed some cases, cover all remains for cleanup.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/compress.c | 54 +++++++++++++++++++++-------------------------
>  fs/f2fs/segment.c  |  5 ++---
>  2 files changed, 26 insertions(+), 33 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: use f2fs_{err, info}_ratelimited() for cleanup
    https://git.kernel.org/jaegeuk/f2fs/c/a78118406d52

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
