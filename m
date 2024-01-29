Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3069F841448
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jan 2024 21:29:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUYGB-000100-Tv;
	Mon, 29 Jan 2024 20:29:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rUYGA-0000zt-7X
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 20:29:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kq8yqJ8we/JpLjiUcpEJyg4DZ6iuCBd3c6IVZ0iEwyM=; b=T//Lo4F2KIgdB5uHTVyFtva8+a
 lBCP+eDMqeGUhHty0YNDqQKKw0FM491Uf38Tqo/fKm4O5X/lB1dOdM31gEO+HhSeIHWikXYdZbziU
 sZQ1WgBlwjKPm59z+Y7cIaB+xt/f3rhUKwfajnE9j8jICtmACmCRPhrPqlh5j4VgPINs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kq8yqJ8we/JpLjiUcpEJyg4DZ6iuCBd3c6IVZ0iEwyM=; b=P9Gos1LLdeUFaefYBsNiLNqe0N
 ShrRukxb/PDqod/hQuNqSay5kvdYPpDSXA2GXWIrpA+tnNFMvgaUH80KccjMmfDEqi0/hvicsU2uu
 G4VMUnJd121HlCZ6vJ4ximbRhTKQMIKb1+IzVt7e1gfIg1jJO2I5niT8cbtUN0V4tDMI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rUYG8-0008Pe-Ox for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 20:29:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 025C8624C0;
 Mon, 29 Jan 2024 20:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16A46C433B1;
 Mon, 29 Jan 2024 20:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706560171;
 bh=yWmpbnXM/oVWfqPBS4YrTlyIBoP8/TRPGn3ZwYhxOQo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=QXGk+NEBDLXPiY4qf66OfTVVGYuQzrMxeMuuu8+Bg/UIKUU7tAzB715eOg9JK3xMt
 jso/LpSE9BCEO+kekNrlOWslp2pxpLNEVp1pyxaPyh/A87wXUxM0YjtMB5Aji20RcD
 LxYfmEwJ6bVbgqOIAn0YYtUJOj6T2evLoVOIZa4h+u0pM+hNTBJ8yqR9JdvoHifovl
 uXCfEbgTKOza5FsWkTUpAb+zTYcf/aYjPA5lED2aE9TORcfp3n8k2RNO4VuhuOSRp0
 MdMZcjpUpKgkg94prIHeC0baRkqkUYoU9jsysMuwt/IEd/SXPOb8QLAvYqpoXoiyPo
 chtdtPr6s6WQw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 EAE81C595D2; Mon, 29 Jan 2024 20:29:30 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170656017095.16041.709559809690249792.git-patchwork-notify@kernel.org>
Date: Mon, 29 Jan 2024 20:29:30 +0000
References: <20240129112740.1908649-1-chao@kernel.org>
In-Reply-To: <20240129112740.1908649-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 29 Jan 2024 19:27:40 +0800 you
 wrote: > It needs to check last zone_pending_bio and wait IO completion before
 > traverse next fio in io->io_list, otherwise, bio in next zone may be >
 submitted [...] 
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rUYG8-0008Pe-Ox
Subject: Re: [f2fs-dev] [PATCH] f2fs: zone: fix to wait completion of last
 bio in zone correctly
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 daehojeong@google.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 29 Jan 2024 19:27:40 +0800 you wrote:
> It needs to check last zone_pending_bio and wait IO completion before
> traverse next fio in io->io_list, otherwise, bio in next zone may be
> submitted before all IO completion in current zone.
> 
> Fixes: e067dc3c6b9c ("f2fs: maintain six open zones for zoned devices")
> Cc: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: zone: fix to wait completion of last bio in zone correctly
    https://git.kernel.org/jaegeuk/f2fs/c/cd3ac0d15df7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
