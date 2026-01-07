Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DFDCFBD8A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 07 Jan 2026 04:33:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERWR3a9ZmSBR7tD7KbxPhZe4qqQmkTnNlpYjKlEJ5k0=; b=OsAKwewxKqbC9QgIEcXz2NYEt8
	GiIuJP5dn9vgYNvz9sBuMBocF5YuYudvTxuvqPtnydtcQ0Vvj1EyPqNkbUOx/NGdPDBJqaP0DpSPe
	mA6XmQHRGOcFEfkKk2N2LhxeX/w1oddwXL1Jq789LksSMWoK7lTs2r5j5bBfK+RhSpkE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdKIt-0001do-9A;
	Wed, 07 Jan 2026 03:33:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vdKIs-0001di-0j
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 03:33:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xlf9kmq3mtUIcInqnd15lcfB4YuuDE09EUuQB3Sx0v0=; b=XlSLwPNV1FjbuEQjUetxiHIPqI
 LItwYyMdQ7ChMBvOl0Ly7IPm+Q3zdDaABBFe409q2dQKg+3NnHr7jzR9iuwWkzAGOab6Dat3bJB0q
 +gGFCI75FyEvmrxFX4mC4k3J4jQer5sLLR15oevtLJ9WYfkad1K8Z/XpPsEkwr3TZ+eU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xlf9kmq3mtUIcInqnd15lcfB4YuuDE09EUuQB3Sx0v0=; b=geu+DDZqp5AUZonltYIgbggQp9
 8nyY23t00t6rshP58iBsVG4aAlpuO3Klw9Sc6kAEz+cWVdXdA6uc4DQXt5Wr6BlHT5zmHEYyu+Jyh
 b35d+p6fCMO86c9MmDpysAfYcTr20onXYH/fwLpf81qVtR9G6Aa8Q8VGAtoGCgGYZv5M=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdKIr-0004Y3-FO for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 03:33:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3119543F8D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  7 Jan 2026 03:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11174C4CEF7;
 Wed,  7 Jan 2026 03:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767756815;
 bh=9wLdBMl9J4DS8hO/SDzAEIivmTkhRy+hggga6K/6R8w=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ZRYczZ7CO1pMZ2SMouY7rYTJhFwRqbKXWThoJUZzjw3WTbE5DOiTn7IEYdYt+t1lk
 Rv4S5g+rcA99ne2hiUzx7BoXyH5wZplIJcuzH+YEgJoHh6/0+xGO92/MmKr44Lkyvn
 AHzzg+2XZAJ35P2npe2wdwoBTyTwSsJGsTJA4wsEy50HrbUMCpS4AsXQILY3LEPS8o
 B+2Gp16DeTP5tk8IucdbcbMpPB4pMv2kcTQoJyZX1ZVnVC7B+RAKQEvXUAt4FwUFRu
 h34m78R2AwpzI1MfpU1h9jIyJSwcPxRWsdcjI/1mm+MZJ32hPXGuQI2V5YZQYMTGbk
 OGTIIM34BinrQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B5727380CEF5; Wed,  7 Jan 2026 03:30:13 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176775661252.2218650.8734034218364835852.git-patchwork-notify@kernel.org>
Date: Wed, 07 Jan 2026 03:30:12 +0000
References: <20260104020729.1064529-1-chao@kernel.org>
In-Reply-To: <20260104020729.1064529-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sun, 4 Jan 2026 10:07:16 +0800 you wrote:
 > This patch adds lock elapsed time trace facility for f2fs rwsemphore. >
 > If total elapsed time of critical region covered by lock exceeds a >
 threshold, [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vdKIr-0004Y3-FO
Subject: Re: [f2fs-dev] [PATCH 01/14] f2fs: add lock elapsed time trace
 facility for f2fs rwsemphore
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

On Sun,  4 Jan 2026 10:07:16 +0800 you wrote:
> This patch adds lock elapsed time trace facility for f2fs rwsemphore.
> 
> If total elapsed time of critical region covered by lock exceeds a
> threshold, it will print tracepoint to dump information of lock related
> context, including:
> - thread information
> - CPU/IO priority
> - lock information
> - elapsed time
>  - total time
>  - running time (depend on CONFIG_64BIT)
>  - runnable time (depend on CONFIG_SCHED_INFO and CONFIG_SCHEDSTATS)
>  - io sleep time (depend on CONFIG_TASK_DELAY_ACCT and
> 		  /proc/sys/kernel/task_delayacct)
>  - other time    (by default other time will account nonio sleep time,
>                   but, if above kconfig is not defined, other time will
>                   include runnable time and/or io sleep time as wll)
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,01/14] f2fs: add lock elapsed time trace facility for f2fs rwsemphore
    https://git.kernel.org/jaegeuk/f2fs/c/79b3cebc70fc
  - [f2fs-dev,02/14] f2fs: sysfs: introduce max_lock_elapsed_time
    https://git.kernel.org/jaegeuk/f2fs/c/e4b75621fc43
  - [f2fs-dev,03/14] f2fs: trace elapsed time for cp_rwsem lock
    https://git.kernel.org/jaegeuk/f2fs/c/66e9e0d55d11
  - [f2fs-dev,04/14] f2fs: trace elapsed time for node_change lock
    https://git.kernel.org/jaegeuk/f2fs/c/f9f93602512b
  - [f2fs-dev,05/14] f2fs: trace elapsed time for node_write lock
    https://git.kernel.org/jaegeuk/f2fs/c/bb28b66875cc
  - [f2fs-dev,06/14] f2fs: trace elapsed time for gc_lock lock
    (no matching commit)
  - [f2fs-dev,07/14] f2fs: trace elapsed time for cp_global_sem lock
    https://git.kernel.org/jaegeuk/f2fs/c/ce9fe67c9cdb
  - [f2fs-dev,08/14] f2fs: trace elapsed time for io_rwsem lock
    https://git.kernel.org/jaegeuk/f2fs/c/67972c2b8974
  - [f2fs-dev,09/14] f2fs: clean up w/ __f2fs_schedule_timeout()
    https://git.kernel.org/jaegeuk/f2fs/c/b5da276ae6ab
  - [f2fs-dev,10/14] f2fs: fix to use jiffies based precision for DEFAULT_SCHEDULE_TIMEOUT
    https://git.kernel.org/jaegeuk/f2fs/c/da90b6715567
  - [f2fs-dev,11/14] f2fs: fix timeout precision of f2fs_io_schedule_timeout_killable()
    https://git.kernel.org/jaegeuk/f2fs/c/6fa116053951
  - [f2fs-dev,12/14] f2fs: rename FAULT_TIMEOUT to FAULT_ATOMIC_TIMEOUT
    https://git.kernel.org/jaegeuk/f2fs/c/7a127c80b0ee
  - [f2fs-dev,13/14] f2fs: introduce FAULT_LOCK_TIMEOUT
    https://git.kernel.org/jaegeuk/f2fs/c/c56254e2e042
  - [f2fs-dev,14/14] f2fs: sysfs: introduce inject_lock_timeout
    https://git.kernel.org/jaegeuk/f2fs/c/d36de29f4bb5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
