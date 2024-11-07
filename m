Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5829C0FAC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Nov 2024 21:30:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t999H-0000Cm-VW;
	Thu, 07 Nov 2024 20:30:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1t999G-0000Cd-Od
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Nov 2024 20:30:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dMIWvsmN7PD2qFUdvbp4Z0g1n1hizCKQ8PQgi3crVvE=; b=ib+C+JNLEYgCfFVLxIIwqlRkJf
 V2h+BX4ZAuFNqe+8dXOof44r0wBdGi8YF2akix/VDzZGR8rB1xy5Zz1Zhva4gPSP31woFSGWMR0PL
 q4NeQ1Sgm3++qyGzJdoKiRkQZFBI5cXm7f6nQuYpMS1AAUhnQVIJ/y4a7VrVg12Bfjcw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dMIWvsmN7PD2qFUdvbp4Z0g1n1hizCKQ8PQgi3crVvE=; b=mz6I9mBoR9xfvoKqPQ4DFO8OJC
 IZJzTZkbjFS0BYmH//uRBl3LIr3eCPguKdMjHsEp4rA0HK9TGgEI5WH++weJQ5NC+gi9tWl+6aYax
 zlwW65y1RkAYOFpeDcwneHiz1vTJz+LfvqIUf/2V6j9ldftTqzL2HarrwAaNPGlVIqqI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t999G-0003tU-5n for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Nov 2024 20:30:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2A9BC5C108C;
 Thu,  7 Nov 2024 20:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78CB5C4CECC;
 Thu,  7 Nov 2024 20:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731011428;
 bh=PJa3ud3Q4IAiR4hQi7wTBGOpeDpVzUhFTJUlSeSTUdk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XAD71rx1PtiyTGxLPou1xMbtKKSLlluSJgKWnUEzmLK8eA0Uy3EHMwa1xiqA9PUNa
 Ob6ihufkTwq1uszccY5s5adJxevwNTUvhEMaKNAYN7yj62P0fUo/UTA/XZbbuloM5n
 EP9oRMndrR/BbChRyDYZvcb2qfAFAUnPizK5v9/lPjU7cfxOznQLukK6A60FfNwe2P
 7WfUv81dQ8XuYHZHB18Qmlhp4wyYPagyV99efgmvxTS0pJ2SyXE04Ys7Sg12DFi9d3
 7yciC5WFcoVDksnNg6AMmcRTGYEvs33OOrrsAwMV/H32JnDMX2k414sueJUTk2ZEU/
 rvqehrfOVnOZg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB3373809A80; Thu,  7 Nov 2024 20:30:38 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173101143777.2084993.11494159010925970965.git-patchwork-notify@kernel.org>
Date: Thu, 07 Nov 2024 20:30:37 +0000
References: <20241104020542.2603607-1-leo.lilong@huawei.com>
In-Reply-To: <20241104020542.2603607-1-leo.lilong@huawei.com>
To: Long Li <leo.lilong@huawei.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 4 Nov 2024 10:05:42 +0800 you wrote:
 > In my test case, concurrent calls to f2fs shutdown report the following
 > stack trace: > > Oops: general protection fault, probably for non-canonical
 add [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t999G-0003tU-5n
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix race in concurrent
 f2fs_stop_gc_thread
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
Cc: yi.zhang@huawei.com, lonuxli.64@gmail.com, yangerkun@huawei.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 4 Nov 2024 10:05:42 +0800 you wrote:
> In my test case, concurrent calls to f2fs shutdown report the following
> stack trace:
> 
>  Oops: general protection fault, probably for non-canonical address 0xc6cfff63bb5513fc: 0000 [#1] PREEMPT SMP PTI
>  CPU: 0 UID: 0 PID: 678 Comm: f2fs_rep_shutdo Not tainted 6.12.0-rc5-next-20241029-g6fb2fa9805c5-dirty #85
>  Call Trace:
>   <TASK>
>   ? show_regs+0x8b/0xa0
>   ? __die_body+0x26/0xa0
>   ? die_addr+0x54/0x90
>   ? exc_general_protection+0x24b/0x5c0
>   ? asm_exc_general_protection+0x26/0x30
>   ? kthread_stop+0x46/0x390
>   f2fs_stop_gc_thread+0x6c/0x110
>   f2fs_do_shutdown+0x309/0x3a0
>   f2fs_ioc_shutdown+0x150/0x1c0
>   __f2fs_ioctl+0xffd/0x2ac0
>   f2fs_ioctl+0x76/0xe0
>   vfs_ioctl+0x23/0x60
>   __x64_sys_ioctl+0xce/0xf0
>   x64_sys_call+0x2b1b/0x4540
>   do_syscall_64+0xa7/0x240
>   entry_SYSCALL_64_after_hwframe+0x76/0x7e
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: fix race in concurrent f2fs_stop_gc_thread
    https://git.kernel.org/jaegeuk/f2fs/c/7b0033dbc483

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
