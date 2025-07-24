Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B49B0B1125E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Jul 2025 22:30:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/UyyP+0XjMyNX+sFSGymv4aO6XSnSEHheDoDN+3yLlc=; b=XEaabE1P8I7Jxa/L1gXYv/adZq
	UCc+k4wPgKtruz+NSjzAv8cZLePSZlMLhMPnV/hNphC39egJnQhvKxvPJWrz4DhjXns0xlxFK2xuf
	Nq8QYWtDzWDjeKpEiEJGEZ6fyiVEhnI9/UhCzwPX/4K8NXFs84eK2stKZbAoDxjcqxT4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uf2Zn-0004tv-L0;
	Thu, 24 Jul 2025 20:30:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uf2Zk-0004sh-Sl
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 20:30:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mBqFnNKUhvZ+LayJt3PGa/S4MBBxwiYOu01Kn4Sz+0U=; b=ICECyCYXRJ4KWWMlT0juQsxpNQ
 aG+tikKJSaOq+Ru9ZcseTUTIHmHhaVTaBAsPb9eLYtiQ1Qgjiyx3guJafBD6B5iYFZgZ6GuwgwCFE
 GO7UnYt1whJpz2bdHFjz2IeQU5LwZ3WZmVq48W/u9kJLF4XDbrTaqayJIGyxlCmflCCA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mBqFnNKUhvZ+LayJt3PGa/S4MBBxwiYOu01Kn4Sz+0U=; b=KITehmlDoSCE0MdUozLy56D+EZ
 SqK0C6K/pVBsz8y29Jnpj06lqn+IswZu5F9Vv9GluhzjWSgR/DvSx4QU+xM0EZNge//60bkI12FQ0
 3nTq69a3qMKMCnITkmIkS3XCs0G54ilhMXiWLx5+UwFvSZ3LRGy9M0TCQ/GPf6uZBdnA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uf2Zk-00012J-EG for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 20:30:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 13D5F5C6396;
 Thu, 24 Jul 2025 20:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE1FC4CEED;
 Thu, 24 Jul 2025 20:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753388989;
 bh=RXhFM63F/0s+hjpp3fkwgqu+rmqBVdFqg8AZd8l2Vxg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=VIhh+KxDomNKFe9NHoCwgSGdg4FVROCbXJSwkequJkgB5+z4hpgnWiz054lpb1WPB
 61/cJNA1EXqxaCahEiTWNVEZgpZPmLF2XYdTQmfxBs4pCq0m4Wg59y75XhWQa62kFd
 LZjxueOmilD9mSQbLjPm9eVHkSOPWeAUQwYAvggJiFOWo4x7R73PmZrYw/b++6ur5y
 x/c5CGzhlKFFlyBrbrPh2UkzhjMfKqZY5v/IfRGDLI8s5ax2v2J8t41pmZIi1r5JXH
 tuiSRcPx3PYKGB/KyIL3YN8LBfAXg8HHSYi0pPyOB2sFy125z3DVEnVFxJtkKWrWCZ
 RrMD1yKOrOgxg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADFF6383BF4E; Thu, 24 Jul 2025 20:30:08 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175338900751.2519964.9709355114500985822.git-patchwork-notify@kernel.org>
Date: Thu, 24 Jul 2025 20:30:07 +0000
References: <20250723142456.2328461-1-shengyong1@xiaomi.com>
In-Reply-To: <20250723142456.2328461-1-shengyong1@xiaomi.com>
To: Sheng Yong <shengyong2021@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 23 Jul 2025 22:24:56 +0800 you
 wrote: > From: Sheng Yong <shengyong1@xiaomi.com> > > There is no extra work
 before trace_f2fs_[dataread|datawrite]_end(), > so there is no need to check
 trace_< [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uf2Zk-00012J-EG
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove unnecessary tracepoint enabled
 check
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

On Wed, 23 Jul 2025 22:24:56 +0800 you wrote:
> From: Sheng Yong <shengyong1@xiaomi.com>
> 
> There is no extra work before trace_f2fs_[dataread|datawrite]_end(),
> so there is no need to check trace_<tracepoint>_enabled().
> 
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: remove unnecessary tracepoint enabled check
    https://git.kernel.org/jaegeuk/f2fs/c/95d7c508b212

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
