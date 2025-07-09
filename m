Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8C3AFF085
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jul 2025 20:10:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOpYWrRtgBoRkRY/BEH6708EBwJVulle274KTZkLPL8=; b=fby47MUMkdrRRecxrb0grJUqSc
	a+1y7/VT3oKiPnS2aZ6rBhcBTQLWtMKHKOaHzx/+xkLnb4lhOTzYK7AoE1Bi/0aXeFruDgKdiWa2K
	+U9UTf2BMjQgX37Uiuo0LuTBZdjDJX5n0tOYIPHBfX15cGUy91HPGhS2okUA1y1+0ctY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZZF5-0004AW-0r;
	Wed, 09 Jul 2025 18:10:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uZZF3-00049k-5g
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 18:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kJBFSqcYbOU3QWXr1pRWSUxaSh0B+miv5BASVFBPOLw=; b=CgASr0SgoqFQan3XtgPGx0qUZF
 7JcnMaHzl9mMcl3UWXw9TgecccUNVikvup6RXjBXvO9AiNG7884POS3NnWWSgxTXM/+1GmGwIHfEL
 3mbW2rcjoq/vkzKE9vaVWaUGhWjQvn3LPwJUQ4UfxHtsBJaVm8jiNMY2TNTjsdfWtVpg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kJBFSqcYbOU3QWXr1pRWSUxaSh0B+miv5BASVFBPOLw=; b=YSKcY7VKm0q6GyPzqNWy0J3LaN
 gee8HuWkz6nhIMG7pNx75AaAEcOzlpXdudK/bSjCrLs5QVqzmI7TYpC/+Fxjpe2931/9znpcT+LlE
 YbkixAsjuSJCg4go6q+trVUPwSRIx4TaiXRRcw6T7akHcaGw4zl4pFUT2zexqJyrEUr0=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZZF2-00013d-MA for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 18:10:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 18C6DA548A6;
 Wed,  9 Jul 2025 18:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1238C4CEF0;
 Wed,  9 Jul 2025 18:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752084589;
 bh=qtyAN7Bob3SIVjNlHPMQVn0lrcTTxnFfB41foDJISKk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=CzPlKGvCIxHIs1GY12sNYFpmu0W2sAiDAfwDSTV20sSj5o6eRjeH0zL3NoBTdmILE
 x5jTKbSLy8pUdGEdFcfd76TTfxkX8BoqPDFOJC6XUKgQcSXY0UJ7yoc6t/3Sr9cQ5a
 i8ZXNiDZSMAAGqcCZl/rRmWwRQ9/qUzeoiTWkxk0ArCz94s+OKnJbcT5RNMQ59OvwG
 zd2Z/JU3ix6U/c//vM0FWuqa5NXSi8nG7qD6BU1mQd5GpTm4cjfVKxRnX0+mi+EfJB
 5R4V9OyWz72ztt/X+MhOhFpQxi42s9IpssHOhCOhj2XpyXwuULxEDHNZrLzvFZtrjF
 jj10qg0BWF5Tw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 71B56380DBEE; Wed,  9 Jul 2025 18:10:13 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175208461224.806926.6216509429033190385.git-patchwork-notify@kernel.org>
Date: Wed, 09 Jul 2025 18:10:12 +0000
References: <20250630095454.3912441-1-wangzijie1@honor.com>
In-Reply-To: <20250630095454.3912441-1-wangzijie1@honor.com>
To: wangzijie <wangzijie1@honor.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 30 Jun 2025 17:54:53 +0800 you
 wrote: > Introduce sbi in f2fs_setattr() and convert F2FS_I_SB to it. No logic
 > change,
 just cleanup and prepare to get CAP_BLKS_PER_SEC(sbi). > > Signed-off-by
 [...] Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uZZF2-00013d-MA
Subject: Re: [f2fs-dev] [PATCH v5 1/2] f2fs: convert F2FS_I_SB to sbi in
 f2fs_setattr()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, feng.han@honor.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 30 Jun 2025 17:54:53 +0800 you wrote:
> Introduce sbi in f2fs_setattr() and convert F2FS_I_SB to it. No logic
> change, just cleanup and prepare to get CAP_BLKS_PER_SEC(sbi).
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>
> ---
>  fs/f2fs/file.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Here is the summary with links:
  - [f2fs-dev,v5,1/2] f2fs: convert F2FS_I_SB to sbi in f2fs_setattr()
    https://git.kernel.org/jaegeuk/f2fs/c/90c5ce37adf0
  - [f2fs-dev,v5,2/2] f2fs: don't allow unaligned truncation to smaller/equal size on pinned file
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
