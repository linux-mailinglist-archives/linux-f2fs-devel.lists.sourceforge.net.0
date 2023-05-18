Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FC27077A9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 May 2023 03:50:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pzSn5-00084o-Fs;
	Thu, 18 May 2023 01:50:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pzSmo-00084Y-5Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 01:50:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W6iWRekBHtz1heXpKMOPs9O0r0ELPkJKyE2d0MCapDU=; b=LXjkRnbqKP2Db6/ROxLWgoK6Cg
 BUmW4eJDcYxXik+p/CXYaW9uwtsBECy4D265wBSyjNqIgAL0oGCLdE/n99EtEQA34FxFGEEmCshGE
 LonMx/AeLwKPnprSRh2ej9h2XueOn4XPgeeFgkcCimcIYGhT2YOyygml1wmvPzYCZN5c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W6iWRekBHtz1heXpKMOPs9O0r0ELPkJKyE2d0MCapDU=; b=AWFqFsAq5QHc8TgK56VVdgHdqA
 IY6QhP/TOC5IdV3JGKoTkBiiiDCf8HANJFM1elA8CiXs++oG9VRjW+LmnsxCimxWLAI1uTqbyWZ7W
 4Ob+KuJlj4IoB9Bh8LP6avv0ulNDRnlRUOhEOnfR3U9fmg/ufl6XmhqHTbmctzndW/HU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pzSmn-00Blvb-TC for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 01:50:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D12D564C53;
 Thu, 18 May 2023 01:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B11B9C433AF;
 Thu, 18 May 2023 01:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684374621;
 bh=38bOYjNs1Ei5s3rnORJ5Nb8u0FgNezxRrYWUA2SytAU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Q1gogNMXzC873yWXitUSskmlkpMHUqrU/so15BeMInd63O95Z0PiQIDfc/lgwKtTv
 gVQ6yF2uolqfyJNpi2V7prfOB0aY4S3tclkU6T022njCExi8BNh6eOCDQr+Drw9El8
 b5tTfGVnZbj+WcQz+nyrZuxmb8Rzt7BzIDWtAgERR47rdL683Q67i6WPm4y+DhjSiT
 oydUe7rv37Kk0vNjrPrysEIAqxHaurhb9h4BX4u7m0jm9+X9R9IY4q/lGwLJlsjrqR
 8cFXhYDKGF6HKoBDAYeMd2HLdwp7VAsB5cIz6lXb6TNRjl3TIh2aHIp4mSd+ObbWij
 IHDi/2STeNaqg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 93F5CE5421C; Thu, 18 May 2023 01:50:21 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168437462160.19511.13019487085074367761.git-patchwork-notify@kernel.org>
Date: Thu, 18 May 2023 01:50:21 +0000
References: <20230512041610epcms2p506e7539079670524146ba6eeeb9dbd63@epcms2p5>
In-Reply-To: <20230512041610epcms2p506e7539079670524146ba6eeeb9dbd63@epcms2p5>
To: Yonggil Song <yonggil.song@samsung.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 12 May 2023 13:16:10 +0900 you
 wrote: > There was a bug that finishing FG GC unconditionally because free
 sections > are over-estimated after checkpoint in FG GC. > This patch
 initializes sec_ [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pzSmn-00Blvb-TC
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: Fix over-estimating free section
 during FG GC
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
Cc: linux-kernel@vger.kernel.org, beomsu7.kim@samsung.com,
 sukka.kim@samsung.com, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 12 May 2023 13:16:10 +0900 you wrote:
> There was a bug that finishing FG GC unconditionally because free sections
> are over-estimated after checkpoint in FG GC.
> This patch initializes sec_freed by every checkpoint in FG GC.
> 
> Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
> ---
>  fs/f2fs/gc.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)

Here is the summary with links:
  - [f2fs-dev,v1] f2fs: Fix over-estimating free section during FG GC
    https://git.kernel.org/jaegeuk/f2fs/c/62c85994b958

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
