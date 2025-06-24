Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2854EAE58B7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Jun 2025 02:40:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sIXXbOV0HFDLnpPqZVssJvfXByA401ubO3lEbfqA2O8=; b=JnWXDyCkhyJ2tc4vdfrRwPaGXh
	B/0ekS+ziXP9adEwV224a5P7sncp0DxEtMcO+RUWe5LcMTwnmf8HqQb+rTBTG4VHWiLg2KYqYcOT1
	5LwM6GpJTxsWIegHzyWw2jl6Rz28nAEwWUsibaKbLbSQX3dIkBn4r2yARDXk/rfSPCqs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uTriZ-0001e9-HS;
	Tue, 24 Jun 2025 00:40:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uTriK-0001dM-Bo
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 00:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0baj9GFHry9kdxVm6A/kvpTgDELdQpXfWpvcqMEqUvM=; b=Yn/cT6sxRHG41hwcfLIi53z++u
 zUMAabsFHYLheYnuXefKOiVMgPGo7lI0JfgTVlzTnTyG4nBi/IVgALfXv0r9zatRVwUR4HBgxf8Er
 8sZ3GpmQVbb7Q8M1M8zipTvx29lxMdQ+GwDLHoZxDzLey8lKGUy6QUqIpyVWoMD47hDU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0baj9GFHry9kdxVm6A/kvpTgDELdQpXfWpvcqMEqUvM=; b=kduQ3hnILwc26cp2bkjsh6XroU
 sdWXRjNlBru9qtYW5MbqJAy27z1ePg3Hn3+lB1ssj6nuwL4gqDuPBaeaBrawnTxqj1hn5u5d+iI+j
 nanfnnZYSuatvn6q9Gf5Gkc6feVOzpbKUqMRHIWqIKgHZYEx/2TyZZFyUiUxehCpK8Wk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uTriJ-0006yJ-TG for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 00:40:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0FFE95C3F5D;
 Tue, 24 Jun 2025 00:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BAE7C4CEEA;
 Tue, 24 Jun 2025 00:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750725629;
 bh=qKo0UmaPptGag6CyO9k3PD/eop53y1VYiyYvNlVqaIA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=osF9Bp2vZkhsl9BBLuDE1u3SgFdFNRqOK6ibcilEppgMciEZWA+2vZr9FpEQezfXE
 0r/eupRjKP87Ex2seyxZoQbXbd1xFIYKrbvDBk6k0p9Le7Ur27TwH1NNPxyql1N40Q
 nTovHP3073Slx1GZgJsTNtjfnbNJt/8suI9Z/5y3W1l5GmAJSmPhfFxlVJC6DvS97Z
 y99+i4n68MgvCD50anvipS60do9GONXHHOk9bKOxj//blnI9pv1NHVF+y9iPUgl8JL
 58pR0X89cxc2Dtrmy2+GxWe23QqIytN+D2rcN5oSuaG2iEsooHP3N9QRUtu0DqNvN5
 L3m6ybcAa/QBw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70FDA39FEB7D; Tue, 24 Jun 2025 00:40:57 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175072565599.3346761.7520240849473534184.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jun 2025 00:40:55 +0000
References: <20250607064116.2993239-1-shengyong1@xiaomi.com>
In-Reply-To: <20250607064116.2993239-1-shengyong1@xiaomi.com>
To: Sheng Yong <shengyong2021@gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sat, 7 Jun 2025 14:41:16 +0800 you wrote:
 > From: Sheng Yong <shengyong1@xiaomi.com> > > When committing new super
 block, bio is allocated but not freed,
 and > kmemleak complains: > > unreferenced [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uTriJ-0006yJ-TG
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix bio memleak when committing super
 block
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
Cc: jaegeuk@kernel.org, shengyong1@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sat,  7 Jun 2025 14:41:16 +0800 you wrote:
> From: Sheng Yong <shengyong1@xiaomi.com>
> 
> When committing new super block, bio is allocated but not freed, and
> kmemleak complains:
> 
>   unreferenced object 0xffff88801d185600 (size 192):
>     comm "kworker/3:2", pid 128, jiffies 4298624992
>     hex dump (first 32 bytes):
>       00 00 00 00 00 00 00 00 80 67 c3 00 81 88 ff ff  .........g......
>       01 08 06 00 00 00 00 00 00 00 00 00 01 00 00 00  ................
>     backtrace (crc 650ecdb1):
>       kmem_cache_alloc_noprof+0x3a9/0x460
>       mempool_alloc_noprof+0x12f/0x310
>       bio_alloc_bioset+0x1e2/0x7e0
>       __f2fs_commit_super+0xe0/0x370
>       f2fs_commit_super+0x4ed/0x8c0
>       f2fs_record_error_work+0xc7/0x190
>       process_one_work+0x7db/0x1970
>       worker_thread+0x518/0xea0
>       kthread+0x359/0x690
>       ret_from_fork+0x34/0x70
>       ret_from_fork_asm+0x1a/0x30
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix bio memleak when committing super block
    https://git.kernel.org/jaegeuk/f2fs/c/554d9b7242a7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
