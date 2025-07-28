Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CEBB140BA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Jul 2025 18:50:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klMidttPY14KHWBrQT95BohdEzAOPAwRWnmkVOr5r70=; b=lOk0kuoP2Qu20KyYuslgFd+etb
	J8spiKNimqaEGYB+qpuvRnDCzXpIwH7WmHGSOr/E06KJvlapvetQEBWKsgv0iE+WVFtrDy9YHAHEZ
	azgdcJU/bN5EAa7fbo5ABq/bmABFO+dteK1hoCLmjSAc50ngUeavQcSZGf7dQbFjJWj4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ugR3K-0000Kh-QV;
	Mon, 28 Jul 2025 16:50:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1ugR3I-0000KX-Mv
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 16:50:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Km7TCnZMm36vgvle/MOHOLIb8ON/AohlDnqFq/nrLpc=; b=hXJ2bBS1ZR/ZhFxRNW+nQ72xyK
 mYhT/AWPzOTbEYjZaolVIpEklCzq0yqfi45IZFSmn4eaDMNjYj5jnA/UdxeqN56Ii8RTXfVQDMAkq
 z/ua0btBlrGcNQ4BQs2fHui0eLP4LV4I7HBGfx74GTJ8Sju0ku6x4BY13P8JLIRD/XCg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Km7TCnZMm36vgvle/MOHOLIb8ON/AohlDnqFq/nrLpc=; b=gi5wv9wdICLpy6TsrdWdNoy+rC
 ZUnnUsWFdaIfckgh31mp1c07N/vJ62ae2MDldQIWENWPZcG0BFIVewWrujhm+VQ5QDLRlE9LcFZej
 ZZilJSauj7p6mI/7vw8kYDMiY8fScMLm+C8DsC2DN/xr4zqELMJ9y0yPGGmk+XekhK2A=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ugR3I-0008L8-4s for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 16:50:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 73D42A55065;
 Mon, 28 Jul 2025 16:50:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF9DC4AF09;
 Mon, 28 Jul 2025 16:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753721405;
 bh=6EutzAVCHjHqKzoHzzGWXqSwBrav/UZGNTmp19cEhVo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=p+OcY9UvEwd8M1LAOuUhc81Ji3EhbsDoorZ5j/Evmj7hFZDTfY9GXrWehtftycZCG
 MzzLSq94WSKsSDwjfyL4mhJBLOnWP7aOBdhGhwaCX1xymo4NCGIB7sESWOqeQR6/xV
 o0XyGu3x1+OLrjW5KJH4CTuHux/lq77e7VOINTHwcFQ/9yL//xRfwaJz3Seeox7c3H
 oFspvpxhjXBk94L7lRCyM3sGbB4zQDBnoEDyxYE8G9eOD9dL3rxIGqLVhJ3YB52sYN
 rSWuvkpXiIip+V/AS8o6d9f2+4vqgzTxQwGktUcGYGCMY2cuh55fxWQDuP6YnhxnEv
 UqPD2Urd52edw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 F1F15383BF5F; Mon, 28 Jul 2025 16:50:22 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175372142174.776676.8052673774005577055.git-patchwork-notify@kernel.org>
Date: Mon, 28 Jul 2025 16:50:21 +0000
References: <20250724080144.3689181-1-chao@kernel.org>
In-Reply-To: <20250724080144.3689181-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 24 Jul 2025 16:01:42 +0800 you
 wrote: > Commit 1acd73edbbfe ("f2fs: fix to account dirty data in
 __get_secs_required()")
 > missed to calculate upper_p w/ data_secs, fix it. > > Fixes: 1acd73ed [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ugR3I-0008L8-4s
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: fix to update upper_p in
 __get_secs_required() correctly
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 daehojeong@google.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 24 Jul 2025 16:01:42 +0800 you wrote:
> Commit 1acd73edbbfe ("f2fs: fix to account dirty data in __get_secs_required()")
> missed to calculate upper_p w/ data_secs, fix it.
> 
> Fixes: 1acd73edbbfe ("f2fs: fix to account dirty data in __get_secs_required()")
> Cc: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/3] f2fs: fix to update upper_p in __get_secs_required() correctly
    https://git.kernel.org/jaegeuk/f2fs/c/6840faddb656
  - [f2fs-dev,2/3] f2fs: fix to calculate dirty data during has_not_enough_free_secs()
    https://git.kernel.org/jaegeuk/f2fs/c/e194e140ab7d
  - [f2fs-dev,3/3] f2fs: fix to trigger foreground gc during f2fs_map_blocks() in lfs mode
    https://git.kernel.org/jaegeuk/f2fs/c/1005a3ca28e9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
