Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E5A999365
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Oct 2024 22:10:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1syzUd-0002VZ-Qh;
	Thu, 10 Oct 2024 20:10:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1syzUc-0002VT-73
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Oct 2024 20:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+8kyffQtKTqyhsbmb41cvbeXIJBtuCl2vWTtbJFxtDA=; b=VmkLjeJ/sy8wbbxnfCcPw81blN
 qWJzmtF4eLY3oynXyTfs0/rVFgqTtYkDx8+Lhut9Cixk+jH0Bq9CZFMdw5WMwZ6hFrs/Y9Vf+cRdY
 wldw79ifYtZxzM+xYSIwwrhwfLL1bC0dbBQa+Ra4dCoVTIEOLMMfGsKC1PaWQk503P8U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+8kyffQtKTqyhsbmb41cvbeXIJBtuCl2vWTtbJFxtDA=; b=C4fEMvzVA/7atB50nCMkbY8Pza
 /Ivwx/Cs2O9IdRwwNJYUy9rSKJdS8+KXCLuQaUQMVA13Y21S/BhK2Q5RVdeYSERniVTo+ljNG7uJA
 lZRlumLKzwtUdwGO598VPzhiFf7nAyFX7KIzFnspgBE9rcS5ap2UhZRm3yoHhetc7wAQ=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1syzUc-000558-AI for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Oct 2024 20:10:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E7177A44CA3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Oct 2024 20:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A7E2C4CECC;
 Thu, 10 Oct 2024 20:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728591027;
 bh=BSsw+Y7OCGA/ex7b4VjgtD8Mj7ponFqGdm1B/6PluOQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=amNPfYSHH/H53KPD3Uewa6He4jRlEirCJxFEDoJLPcVOcDL8lt8PZyP2ZiG4aE6C8
 5slTYrC3pXTca8AykH0lVGYjB+YpN7DkuTibj+wGrA30BaDvgl0q23+p2sbvR64DSP
 1mR3RHmTlRIgzbsRlEfwjAkvYEvpsvI88rkf8gXanYMGdpWBM2DEfbjXEt/W9mRxh6
 uAbSl8AGgE9lTMo30/wqdv96nKIZIXIS7twmx+6rD7aZ5rmqvXmwioVkLLfcIZ4KRx
 wNBIPjk7JLTSiCS7MSJiLWEWsKwjoMHeii/KCJvNaGFU+kmfQ8QaMCnX2xFZSgiETV
 IA0g3Q/U8gI3Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAD6F3803263; Thu, 10 Oct 2024 20:10:32 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <172859103175.2156650.13652147260460527526.git-patchwork-notify@kernel.org>
Date: Thu, 10 Oct 2024 20:10:31 +0000
References: <20241010000923.1278817-1-jaegeuk@kernel.org>
In-Reply-To: <20241010000923.1278817-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 10 Oct 2024 00:09:23 +0000 you
 wrote: > This fixes a regression which prevents parallel DIO reads. > > Fixes:
 0cac51185e65 ("f2fs: fix to avoid racing in between read and OPU dio write")
 > Sig [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1syzUc-000558-AI
Subject: Re: [f2fs-dev] [PATCH] f2fs: allow parallel DIO reads
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 10 Oct 2024 00:09:23 +0000 you wrote:
> This fixes a regression which prevents parallel DIO reads.
> 
> Fixes: 0cac51185e65 ("f2fs: fix to avoid racing in between read and OPU dio write")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/file.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: allow parallel DIO reads
    https://git.kernel.org/jaegeuk/f2fs/c/bdab38b79199

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
