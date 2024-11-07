Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7919C0FB5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Nov 2024 21:31:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t999e-0000Ep-Cy;
	Thu, 07 Nov 2024 20:30:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1t999c-0000Ed-D5
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Nov 2024 20:30:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HREjyBQlqj3glu718XFf7ILU6UVY0atICYDWqRRtrQQ=; b=IADILeIwhaAhJMFNtVVONs4J5H
 EV2MYk7rEy08hzrXNoDGrDXErBtXjsBmhhMgpNYwwCDG87DQ4cnkwk7BAYLoNFdUB7JSmAGQtTmIY
 EVgF6NZiQ9t4ws+aX3WwjZeVdlQIRp9GaFtCoLyk4SaF2UnXvlCUo/f7vwy2EZtrsF3o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HREjyBQlqj3glu718XFf7ILU6UVY0atICYDWqRRtrQQ=; b=Uc+GK/mFwSaO0mizRxTpb4aJIx
 uFPv2wD5QtubZ+X2gMhAXTRKZY6Kb6n9qOrWjvtqbQEpVZAj6MihuM5uurQv+mfflvWoILIlxC532
 od2RL16RTutpKdTMwg6MAjFGrZlNezfFhEuT04cpUG0G9V2HyI1lBNiS+Nf7X5iyB9Ig=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t999c-0003vE-HP for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Nov 2024 20:30:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1B857A44B07
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  7 Nov 2024 20:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44F3C4CECC;
 Thu,  7 Nov 2024 20:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731011445;
 bh=stBgZK238R2cyyfyc6eob3WN+UB09hSCIb53SWNy9+E=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=E+Nl1vTgFE8jRqgFIiaEJTbxZDp4IgLVDAqEXWfUKOnl0iptFZH07eZKcKDQrtLuk
 lhIJwsd5O1urKl8+IsCpBXo2JH6YFbdk0x5j4U+1g9PYcMrnvOQa6J6dCPpTNNEf96
 bXKECgxqp/P12B8Y0Z3Lqj4GdvHGTYqBHvcoyCSvvA+HLrSg2TyqHJKBTH2QRmycMi
 6Bds44++hn9GZV3lPrrPe7ADvKwCziY0rHlanh8PD9p3jGMYhb2cPMkgMR/7wBsDS7
 zHGnMUfHMJBeMg1EiD8bpNYJlcuIU3CSSTkVnKx6J4IGFdTPr8Kl//scFI+KuHr47K
 nu2hlSkrmuv3w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33D0A3809A80; Thu,  7 Nov 2024 20:30:56 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173101145498.2084993.7253487947002191370.git-patchwork-notify@kernel.org>
Date: Thu, 07 Nov 2024 20:30:54 +0000
References: <20241029005703.2740230-1-chao@kernel.org>
In-Reply-To: <20241029005703.2740230-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 29 Oct 2024 08:57:03 +0800 you
 wrote: > Just cleanup,
 no logic change. > > Signed-off-by: Chao Yu <chao@kernel.org>
 > --- > fs/f2fs/node.c | 11 ++++------- > 1 file changed, 4 insertions(+),
 7 [...] Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t999c-0003vE-HP
Subject: Re: [f2fs-dev] [PATCH] f2fs: clean up opened code w/ {get,
 set}_nid()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 29 Oct 2024 08:57:03 +0800 you wrote:
> Just cleanup, no logic change.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/node.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: clean up opened code w/ {get,set}_nid()
    https://git.kernel.org/jaegeuk/f2fs/c/cffaa0976fcc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
