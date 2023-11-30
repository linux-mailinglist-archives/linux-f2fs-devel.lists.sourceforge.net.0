Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CACC7FF969
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Nov 2023 19:31:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r8lor-0004qu-DS;
	Thu, 30 Nov 2023 18:31:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1r8loS-0004qM-N2
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Nov 2023 18:31:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PpHNwytQMDfL+QWP6eqibV+fghpz8jrvzEgaEYxzSQ0=; b=PV2HjAS48JcaZJywR/e/0kwP1/
 ogfXC78UxuLuSqIvP9f3ZoIJrZ8iFCQyoI33nXWYSm6A6X+g8LrPxA6q+SwOpw0HJAs/cvzGCwW37
 Ma1OMgoEokwa+Jqoii6z7l1Ihxz1M39/TtmcrfZc5Df2jukuubK+KkKE7ch/7b8Np0Mo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PpHNwytQMDfL+QWP6eqibV+fghpz8jrvzEgaEYxzSQ0=; b=ZhzWvjmL9oWhIDVnMUX6h8JZGl
 Sx/aARIaW7okSYa7ceKzcwaVp1ar0nSFRBtPh2SUytLjoY4tCVYgPFx8hJ37+qJIwz29WnrWqjGpz
 yidZQEa6XgDZBfDG+L6PWBj//s1JOXuo3Z0m+SftZwXcbXrQM/tX5Kkw5EsOPDrrHyW4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r8loK-0006T7-6O for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Nov 2023 18:30:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AF49961F96
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Nov 2023 18:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D654BC433CB;
 Thu, 30 Nov 2023 18:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701369028;
 bh=N3FJPdmu6JG4s+PR7gx03k6+pt8NSSPRT5nSnkmdAAc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=UsI5fo1/ZNqUHbaVx4GgHZg6G2codDXYvR8docPWiZXFYD2Y/IGHKhDdwmQgmLQeR
 AMa6Zu6ChfAbZPN7k8LBLcnjv3vCHT9edceMyiDFbiEM+08EVW/ZrbDfjOL5t4u7qF
 zqwmyPqCpUSKdHr6QNltqFFfXHNAgN9LQv/vFrifqb24c3RUNuK2kCtUOz5tCltEQd
 v3T1or3ixKGtrnk8Eopp6dhaLdzqBwhdLDZV32yWpvdcJOHkN8M/fpdhsYmemuVpgt
 PcYJOQchApHJdxflK+u4iAM6tS3x1vrccQPMIAe/IgZRa6Ma+7jwPUkkHQq6JMhkqe
 +7sHlSktHQ6Ug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B5C4BE00090; Thu, 30 Nov 2023 18:30:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170136902874.21709.1570439758273381080.git-patchwork-notify@kernel.org>
Date: Thu, 30 Nov 2023 18:30:28 +0000
References: <20231122144715.518256-1-chao@kernel.org>
In-Reply-To: <20231122144715.518256-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 22 Nov 2023 22:47:15 +0800 you
 wrote: > It gives a way to enable/disable IO aware feature for background
 > discard, so that we can tune background discard more precisely > based on
 undiscard c [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r8loK-0006T7-6O
Subject: Re: [f2fs-dev] [PATCH] f2fs: sysfs: support discard_io_aware
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 22 Nov 2023 22:47:15 +0800 you wrote:
> It gives a way to enable/disable IO aware feature for background
> discard, so that we can tune background discard more precisely
> based on undiscard condition. e.g. force to disable IO aware if
> there are large number of discard extents, and discard IO may
> always be interrupted by frequent common IO.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: sysfs: support discard_io_aware
    https://git.kernel.org/jaegeuk/f2fs/c/d346fa09abff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
