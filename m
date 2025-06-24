Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A73EAE58B4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Jun 2025 02:40:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xg/EI56kK+FI+hV6TpL9qkjCq+0421yDHDq4HCe0UNA=; b=NvVZNpHxnA2yQJKP00ZZmN8BzG
	VXuY2irI53gdUJ+nV3r8JnFDS9cmsbSL51HgICwBQu65deIBR4hHVUP0225jogelZ3DmDW/Uw3Jrw
	FRAmzPkFT3S3TRHPYLh/kHHyJd/8C8N5TmpruFPM8ezc+NkLHU4v8TElj4wT3onEFJaU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uTria-0002OD-C6;
	Tue, 24 Jun 2025 00:40:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uTriJ-0002NV-N3
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 00:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ekWdd1l3cnjlOXWisLfKPyfQkaODtKLwbwCdeNLozd4=; b=HUgUull9Z8ZMu6XgS++1QVWTgB
 VpSRJ49wFxPwnMfGPrDU1REcCrVSxQaCOeKy9n833HJJcexiqCKujvnHts1YH1zg9FTsDWMT/+LF/
 8OzhEu7SAzaxYU4SQ8I0x4ioiuRlZEm64lyv6fKhl2VL41N+KV9EIgrRAgCFkY5pwg8o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ekWdd1l3cnjlOXWisLfKPyfQkaODtKLwbwCdeNLozd4=; b=WbAB/Evc2JS4mPVRe0CIeDDNUz
 AeiIfj420Jyw6UPgkS/UaN9dp0bkgY+yIztZ790QRzH20MW4CleS1GD5Ci0NVVyDD8c6OD712lFVl
 kSrhnDySysYFEcD3LYs91AAbB+LiXW+oyDgFy+4RUAIeawCoUbXdW13lCgv4+zdycCao=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uTriJ-0006y9-6O for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 00:40:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7F198A51385
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 24 Jun 2025 00:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D002C4CEED;
 Tue, 24 Jun 2025 00:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750725633;
 bh=JOohz5CpylJwMb4/VsRDLhJkRFPmCKGfkJaLP7xenXI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=lJ+CORPX1P+4hVWu2i3ap2zVfOuP2N9D7HiQZcMuWW7LV31tGTO7cvUODjuONN0dz
 WVQ9VLjoXSJq+F+ioTXpNtH8j/7PHamUhqrqAjA1UpjhAbfy89tErAJGRAjTOg5jAb
 0nls2/PF0UmYj9DT+UUSpUAH1a/mkQWeZfbdgkPkLfQcTVDYJXgiJ+SpmrV3AIafjz
 wL8hmPBPqP0WQXjZDhlPEiM8ZQzNkOk6cel2VMOqwA2DPzCMcHRTTPF/PN7IHijvqw
 q865XCIYev6eJPNxlw2CER7niJAnXfWwCSJolzkoA2gW5pWp/LFIb2aDmwQYDuZ5kT
 oQro+bWCrqfWg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70CB339FEB7D; Tue, 24 Jun 2025 00:41:01 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175072566023.3346761.5670110283778494132.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jun 2025 00:41:00 +0000
References: <20250611084218.62774-1-chao@kernel.org>
In-Reply-To: <20250611084218.62774-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 11 Jun 2025 16:42:18 +0800 you
 wrote: > ============================= > [ BUG: Invalid wait context ] >
 6.13.0-rc1
 #84 Tainted: G O > > cat/56160 is trying to loc [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
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
X-Headers-End: 1uTriJ-0006y9-6O
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid invalid wait context issue
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

On Wed, 11 Jun 2025 16:42:18 +0800 you wrote:
> =============================
> [ BUG: Invalid wait context ]
> 6.13.0-rc1 #84 Tainted: G           O
> -----------------------------
> cat/56160 is trying to lock:
> ffff888105c86648 (&cprc->stat_lock){+.+.}-{3:3}, at: update_general_status+0x32a/0x8c0 [f2fs]
> other info that might help us debug this:
> context-{5:5}
> 2 locks held by cat/56160:
>  #0: ffff88810a002a98 (&p->lock){+.+.}-{4:4}, at: seq_read_iter+0x56/0x4c0
>  #1: ffffffffa0462638 (f2fs_stat_lock){....}-{2:2}, at: stat_show+0x29/0x1020 [f2fs]
> stack backtrace:
> CPU: 0 UID: 0 PID: 56160 Comm: cat Tainted: G           O       6.13.0-rc1 #84
> Tainted: [O]=OOT_MODULE
> Hardware name: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x88/0xd0
>  dump_stack+0x14/0x20
>  __lock_acquire+0x8d4/0xbb0
>  lock_acquire+0xd6/0x300
>  _raw_spin_lock+0x38/0x50
>  update_general_status+0x32a/0x8c0 [f2fs]
>  stat_show+0x50/0x1020 [f2fs]
>  seq_read_iter+0x116/0x4c0
>  seq_read+0xfa/0x130
>  full_proxy_read+0x66/0x90
>  vfs_read+0xc4/0x350
>  ksys_read+0x74/0xf0
>  __x64_sys_read+0x1d/0x20
>  x64_sys_call+0x17d9/0x1b80
>  do_syscall_64+0x68/0x130
>  entry_SYSCALL_64_after_hwframe+0x67/0x6f
> RIP: 0033:0x7f2ca53147e2
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to avoid invalid wait context issue
    https://git.kernel.org/jaegeuk/f2fs/c/90d5c9ba3ed9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
