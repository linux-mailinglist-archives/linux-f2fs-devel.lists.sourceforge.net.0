Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 846CECFBDAA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 07 Jan 2026 04:34:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYPDVk1HalZ23WRHbcLpFDGs/blLWyKkfYGohh1VWGY=; b=m71zBN+aSCrA5fatmG2TyC3OiC
	IhRS/wws6nEZghCuv7++GboBnb/T6ndIbd7MAtTl9nNKhK5TyrMDPWGjtYVI4DGQF2DnWFnr0HhLy
	xYimSn4U7v8a+kR0OCNNc9Udjzh7FWmN+uyBVFZrt83quEyDifbkD+Ymmf/+2SpBbUL8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdKJ5-0001fc-7o;
	Wed, 07 Jan 2026 03:33:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vdKJ3-0001fL-V2
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 03:33:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IwnZIihGOXxfpvzfKcC8LAOx0EfQwmcwKAMW/h1sP38=; b=lGNAgTews+bYY7FZYcM0vFCZfP
 XqrsvYS7bBv669kAKKXtayKJTnaHAr6yHgOL/Tj4EOfCARScff+5OQhGrgBxcVmxU9giv0oACUAhn
 ikCM8UFei/GEZYFXNSENHR2TuyKq5Nwq1h6J3227pnd+/UX2QbBoEVcnibfV3G9Pf8pM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IwnZIihGOXxfpvzfKcC8LAOx0EfQwmcwKAMW/h1sP38=; b=I85RWY4aQoS/E6H5yVnnWsG44C
 3xdNJ9lvmFSJmJYpKI5nDoT6fp47vaTeu/ohejMy/3+T/c/EQbMBlww3I0vBkbul5g9rum8KboB0E
 mJzSumh3R5yItI8REdxHCq/TioV0N+imvL8Jy+3QEN3nq7BkC3eRV3TAw5/o9gbTLrVA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdKJ3-0004Yo-D1 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 03:33:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D5C2960149;
 Wed,  7 Jan 2026 03:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C136C4CEF7;
 Wed,  7 Jan 2026 03:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767756826;
 bh=ODtkXlAVicCq+eBjYVXRUeZajRzH5TNsI93S76n0p3U=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Jt97H8NDiHIS8+bTGcIlRCOMB+gctaT0gcQBDjEz6KInl7Tk87tP3isR2i7CYVxXR
 zZg/et98u1FUynXyUa9enVTZITvrByqemjx4PP+gJ9yJleWgBtR/SMuh0cBmygl3VX
 7mO7WmW/N+esfQPz9uoBtCjWbzQ1+U876N1cmOF5sMTwaxCErUBMsv7KoheqT3eyoV
 9cs0jl4kmyoxDEi3jjx4+rZ2cJ1gBUEDpZ+vf7EvFGX3WKnYh4B2MKKJ8YkduY6ySf
 1TrqkULTT3DIIJaW5+XVaCheXLU1JsgfPGPrmDZzkbjPORFAv723Jjt3a2gvkK8I3T
 GNnZ1mYxFGQ1g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3B80A380CEF5; Wed,  7 Jan 2026 03:30:25 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176775662402.2218650.9834077386452095457.git-patchwork-notify@kernel.org>
Date: Wed, 07 Jan 2026 03:30:24 +0000
References: <20260107023346.2507670-2-monty_pavel@sina.com>
In-Reply-To: <20260107023346.2507670-2-monty_pavel@sina.com>
To: Yongpeng Yang <monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 7 Jan 2026 10:33:46 +0800 you wrote:
 > From: Yongpeng Yang <yangyongpeng@xiaomi.com> > > Some f2fs sysfs attributes
 suffer from out-of-bounds memory access and > incorrect handling of integer
 [...] Content analysis details:   (-0.2 points, 5.0 required)
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
X-Headers-End: 1vdKJ3-0004Yo-D1
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs: fix out-of-bounds access in
 sysfs attribute read/write
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
Cc: jinbaoliu365@gmail.com, liujinbao1@xiaomi.com, yangyongpeng@xiaomi.com,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org, stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed,  7 Jan 2026 10:33:46 +0800 you wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> Some f2fs sysfs attributes suffer from out-of-bounds memory access and
> incorrect handling of integer values whose size is not 4 bytes.
> 
> For example:
> vm:~# echo 65537 > /sys/fs/f2fs/vde/carve_out
> vm:~# cat /sys/fs/f2fs/vde/carve_out
> 65537
> vm:~# echo 4294967297 > /sys/fs/f2fs/vde/atgc_age_threshold
> vm:~# cat /sys/fs/f2fs/vde/atgc_age_threshold
> 1
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3,1/2] f2fs: fix out-of-bounds access in sysfs attribute read/write
    https://git.kernel.org/jaegeuk/f2fs/c/98ea0039dbfd
  - [f2fs-dev,v3,2/2] f2fs: change seq_file_ra_mul and max_io_bytes to unsigned int
    https://git.kernel.org/jaegeuk/f2fs/c/071e50d61cf2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
