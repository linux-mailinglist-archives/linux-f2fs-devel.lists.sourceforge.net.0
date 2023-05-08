Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3996FB656
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 May 2023 20:34:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pw5h3-0000qe-QP;
	Mon, 08 May 2023 18:34:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pw5h0-0000qX-Dh
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 May 2023 18:34:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NdnoQDRjnQp+qZzNYW+L47cHiX2duhUreawxU024aFg=; b=IhIxoy9G3urfxJyMSgHNaRPnyV
 pYDfH7StAbkGj/z8Vt6LPs53oGb6aoCGfgeMJO7Bney85kUlalCJQlSovTe5GbxQv/3C2/8ijDg+T
 rpE9u5jtlLbUM64ZIB/jWIuPBb82DYJHzVK/XyfushN3N3kLME66GpcHOapa1+XE95T4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NdnoQDRjnQp+qZzNYW+L47cHiX2duhUreawxU024aFg=; b=BGfg5bfq8lTrrFAaYZvF30UqBT
 kPSqSAW2o6qFgCA2a54vhkovLwXunCmU/FfGHdMhDRW8gH3P4KKWUlwnLJljEwT8YqofficKcZ4AH
 /VpUTQb8nr0Ud3wR8oWN70OlPZokkL7Nl3HCFKGvBvZdcFSkKEhP1pQKokRf5tyxqlTc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pw5gv-002LNH-74 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 May 2023 18:34:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D2DC762080;
 Mon,  8 May 2023 18:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3854EC433D2;
 Mon,  8 May 2023 18:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683570867;
 bh=Dn7+e8seK6/zwfLvdedKADC/j3PIr8QfOPcWNlmROtU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=D8gF7m1nvfltldXU0tUm0i9BzkC0+M4VLhXZRrDUDCjs1mxxe02T9VXg1d8MW49yN
 HFqIVWnZEe6XUQOXRZ/vZCxjh3c4iZqBCCIrSl8MoSPs59YOwPiqsaBfcn4JLz1f1U
 O5agOHtKQ6XK5Q9X6h0xUWO1NwI7l5zSiJjMht4ZWQtEDvj2j+yGPUIDRKLcb5EHzy
 izTpIkCDm+m74FPEgUEZTvpbegUo3IDUUp3riV2rnl6Iq8TuFEDTll9FKEY9i3vo7B
 Wu88ENKVdcy60gCWZhFOD3ERo1FitJCJgNIJiAWM6+nhbEoJcM+tv0ZNhPWSS4T+pb
 jzV+1wuzP5saA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1698CC39562; Mon,  8 May 2023 18:34:27 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168357086708.2764.4303615885378186638.git-patchwork-notify@kernel.org>
Date: Mon, 08 May 2023 18:34:27 +0000
References: <20230425160611.79848-1-frank.li@vivo.com>
In-Reply-To: <20230425160611.79848-1-frank.li@vivo.com>
To: Yangtao Li <frank.li@vivo.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 26 Apr 2023 00:06:11 +0800 you
 wrote: > Return -ENOMEM when proc_mkdir failed. > > Signed-off-by: Yangtao
 Li <frank.li@vivo.com> > --- > v2: > -removing check for proc in
 f2fs_unregister_sysfs [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pw5gv-002LNH-74
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add sanity check for proc_mkdir
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

On Wed, 26 Apr 2023 00:06:11 +0800 you wrote:
> Return -ENOMEM when proc_mkdir failed.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v2:
> -removing check for proc in f2fs_unregister_sysfs and f2fs_register_sysfs
>  fs/f2fs/sysfs.c | 39 +++++++++++++++++++++++----------------
>  1 file changed, 23 insertions(+), 16 deletions(-)

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: add sanity check for proc_mkdir
    https://git.kernel.org/jaegeuk/f2fs/c/888ca6edac81

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
