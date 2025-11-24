Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D62CCC82283
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 19:50:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsKCguEfxDf+RjQ8fyiS67HzlEodIYLTMiUUgwjoghY=; b=bBlwvHSZjs+5QjYYIhQo+ZUnyK
	cRTUJ480G7h+lrc/ACltxRsSEfNR26fTBdE1YmZsHJdP0OUVQBok19pSyAQTuMGeSHJx2ZWXw9QQW
	FfLUajCcGyLF2FuTRkqOOKyLpSaIwv4FZdWS7Ckx6ya0oSm446KDa6JflJ2LdmMu6ibY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNbeI-0003jv-GH;
	Mon, 24 Nov 2025 18:50:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vNbeH-0003ji-JU
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 18:50:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XQf/9pHcMC/VDDfIUuGqwizfPlib4NnNnznkGSxD67c=; b=WfPRxpKffzU8+zqotNqoW5anhk
 nzuocToshMK60dotcU7VWkygUPJ6Qvq9LLkgadRInR/lTto+pZqVxI/r+2RPgVzULWVp6JsIycUf3
 CiWhqZ8XFD3yIu2pDq45PNp1tgk8nZFF0iqfhT7Y049n4+JxFQXN2tidIOz1ygS2BYW0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XQf/9pHcMC/VDDfIUuGqwizfPlib4NnNnznkGSxD67c=; b=ErL+zBCb3AhQuLGUOknpmgSm2M
 6a2/lrsxy4DXVS9BWmqOGXitMFab7YfiT9k1g4E7w/53xTmZuVmMMWopEgo77NK4gFO6thNwTQR+c
 EuZlXcD/zsBjjKrijGCIZ+XH3qItx7zcBR8HER7/AJnM3Hab2IWaVwIMdFdBg7vWufKE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vNbeH-0002e5-LY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 18:50:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 60DD74419E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Nov 2025 18:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF38C4CEF1;
 Mon, 24 Nov 2025 18:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764010248;
 bh=81TwqGSrD3HsK2AoJY51n9CmO/PS/aw8f2nlNC3KZZ8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=i0gasd8GqrySZW6rfBjapTghq6KZgo9Jz+4nchNC9Mk01pi0MdktsrARWfILKirLA
 3WjnHBUe11Ygg7y1UWjwapWD7Sd+inVmoKARzzTgGZ6VB+QhfX/16p1Sb1uK2TY3sb
 kh9lnY6mUIQxcxJKq0554hK5F3rIi6i59WEITMzKqMxR8gcSH5BLBPxW60iLlU2TLW
 0UFXW266dlYt31XqMXIAWv4qqmXor3C87M0uQBRP4xJgG75ZiE5UN2VeAblSqegoqq
 CrKwvStTUSBNXwEDPF8XYLi0B/dACBo09ynJm3zJe5a5fzPazZlaSdRQf/TVaWRXLg
 g+4xaWFXspVMw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70EC23A86296; Mon, 24 Nov 2025 18:50:12 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176401021111.42009.2835774626378827103.git-patchwork-notify@kernel.org>
Date: Mon, 24 Nov 2025 18:50:11 +0000
References: <20251112014749.2006439-1-chao@kernel.org>
In-Reply-To: <20251112014749.2006439-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 12 Nov 2025 09:47:47 +0800 you
 wrote: > memalloc_retry_wait() is recommended in memory allocation retry logic,
 > use it as much as possible. > > Signed-off-by: Chao Yu <chao@kernel.org>
 > --- [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vNbeH-0002e5-LY
Subject: Re: [f2fs-dev] [PATCH v2 1/3] f2fs: use memalloc_retry_wait() as
 much as possible
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

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 12 Nov 2025 09:47:47 +0800 you wrote:
> memalloc_retry_wait() is recommended in memory allocation retry logic,
> use it as much as possible.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> use memalloc_retry_wait() instead of f2fs_io_schedule_timeout()
>  fs/f2fs/segment.c | 2 +-
>  fs/f2fs/super.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [f2fs-dev,v2,1/3] f2fs: use memalloc_retry_wait() as much as possible
    https://git.kernel.org/jaegeuk/f2fs/c/00e24c488596
  - [f2fs-dev,v2,2/3] f2fs: introduce f2fs_schedule_timeout()
    https://git.kernel.org/jaegeuk/f2fs/c/517eb4747ad8
  - [f2fs-dev,v2,3/3] f2fs: change default schedule timeout value
    https://git.kernel.org/jaegeuk/f2fs/c/2f4c126cc08b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
