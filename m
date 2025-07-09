Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D042AFF08A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jul 2025 20:10:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jwm7AWRPHTaoAWvMB9cPJEiuvmzKYiuByrWML8jJOoQ=; b=JxDU9xdqCyVnzORYothd8IoOdl
	Lwbs+mylWvJGfMM+MQTf59sfXlTVxk1z07qydpUgR7ZxXesqxKqKe3Bi2RCp+MhgN4y6BLoanQEn3
	6DOhV3nCpx5cmn5yAk/iMiLguvyRD8+HtLp5rmI67MNbZfCrXeN/R5QqdypxB781xnYE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZZF8-0003Es-TP;
	Wed, 09 Jul 2025 18:10:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uZZF7-0003Ec-Dl
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 18:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0DIs1Q4XlWRxX+wkfuf4qsi6K6EUqBjlUF/NpVuCoBI=; b=SAp3q+iRk1cXv8kaK7LCqXIP2e
 zA4dPaUqjW0efQ4/DA6K41FDWmIkV0Cu2PrW+UHddNdUtqaHgiHINzCFzBKeiSCkApcSc/WYQwY7U
 3rSXG7JBKJlIELIXH8jkBArQY1ARYC+juaBk9zcMvuChkb5QAF7YFaKSIdvxhJFF3les=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0DIs1Q4XlWRxX+wkfuf4qsi6K6EUqBjlUF/NpVuCoBI=; b=S54/oejh7zN2oevoCesAGl0SX1
 jp4U3n6AmLuH/m+Y7YT3se6NaMK81fMAchv4ot7gaWse07G3vg6Cbt/D3aIIsuY3fRpuPG/iXPUQF
 nqcrs6obLSHF3VvlTm75l3WRV/1XXpvZFt5AlL+1OKKcUOq6cHhZT1n/dqn039Y7CkZ8=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZZF6-00013y-TD for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 18:10:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4AE88A548C2;
 Wed,  9 Jul 2025 18:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E1EC4CEF4;
 Wed,  9 Jul 2025 18:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752084593;
 bh=deWznCu+qIVvHco4q82pWqu7tD2dtpJCvTArIsFwwoo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=pcg89k/5aI50z22ZC0VOG+RaCBBRuG0I2Rxs0OESF+As77JBKssJToQQvS/UpzHuV
 wj00tFkwiG6JcbRm0hlzPIASIOzpyIGa3PHs43Vv+/l4egALWvnHvOkam2jbemkZAU
 mxk2u9qQzqMwtcyGhB+N2n+F0d4A332lXpQPgnAx97dTOw4ueVGP4TikyjwXZ/lMBN
 dfJQ3/gnxp2IorXT941oMpQyPod9pwWptUl5eXyF5xlvgOauilLqFnJOyr4snZncJw
 Vw9U1jVzELHWNTmPFovgBl0fIclSHSRoUBG5y4uDTFxqKvRks8D/2DkHqb4ZTidapc
 WpCMqN9s9ikfg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE363380DBEE; Wed,  9 Jul 2025 18:10:17 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175208461625.806926.1915540263699572760.git-patchwork-notify@kernel.org>
Date: Wed, 09 Jul 2025 18:10:16 +0000
References: <20250617174047.1511951-1-s.prabhu@samsung.com>
In-Reply-To: <20250617174047.1511951-1-s.prabhu@samsung.com>
To: Swarna Prabhu <sw.prabhu6@gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 17 Jun 2025 17:40:47 +0000 you
 wrote: > This patch fixes minor typos in comments in f2fs. > > Signed-off-by:
 Swarna Prabhu <s.prabhu@samsung.com> > --- > fs/f2fs/f2fs.h | 6 +++--- >
 fs/f2fs/no [...] 
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
X-Headers-End: 1uZZF6-00013y-TD
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix the typos in comments
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 mcgrof@kernel.org, s.prabhu@samsung.com, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 17 Jun 2025 17:40:47 +0000 you wrote:
> This patch fixes minor typos in comments in f2fs.
> 
> Signed-off-by: Swarna Prabhu <s.prabhu@samsung.com>
> ---
>  fs/f2fs/f2fs.h  | 6 +++---
>  fs/f2fs/node.h  | 2 +-
>  fs/f2fs/super.c | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: Fix the typos in comments
    https://git.kernel.org/jaegeuk/f2fs/c/1f136890263c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
