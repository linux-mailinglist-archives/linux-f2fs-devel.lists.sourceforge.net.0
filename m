Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEBF97A8C5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Sep 2024 23:30:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sqJJ1-0004V5-45;
	Mon, 16 Sep 2024 21:30:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sqJIz-0004Uq-Ol
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Sep 2024 21:30:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GD0HdTs5giBz6E5u9iw9eOobLckas5bz4rI9LPBajtI=; b=ADbpzbipGpDzQ6K1hM9ShlEJcj
 jC2jXEIgBpcxTiZDg81flUust7AVGYM0srUQSYtLv+mKhXUdOOW3Uh4ap6+AEjXrHKseqm79VXEBK
 of25ReIsMWxzgzl0MVxmXyvHNKw4yG2ti7eNtEyzGhgNUahyyk5Di2pPIqaMfe93LvKs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GD0HdTs5giBz6E5u9iw9eOobLckas5bz4rI9LPBajtI=; b=YrM7ABuWjxsmm4aVYg5ykNDHE3
 hBnfhA8G4r0SrU76fnGyNfSgIXJh1OO3cSx0jRHl0hxIbHT/sqyVL/OBpY9yZ4UyKA0oYOr6ylPDQ
 UMVMuRARXQCKiyMVpuUBFn0/QGfA1wAzCfdBK1/kRvOhYbj5vd+AYIDm4WVzHnF9y2YM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sqJIz-0000OZ-Ua for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Sep 2024 21:30:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5CAD35C0608
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 16 Sep 2024 21:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61D4C4CEC5;
 Mon, 16 Sep 2024 21:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726522238;
 bh=/LTfMGIkXGSWPvlj+TCbpSSwcSOa/6IWvXCKKM62UNU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=a3cqY3KrneybyUBzNYha9tYbpkgYUAlrR2Zl7Q4mxuSRDMjPUPfL2JJNgZTINxkhb
 lk5cTPvs1Mj3ok6G98BW4USYcWod8KodpiIlVDcsJUeMNuH96c3SJehFuc7MIqB5ox
 S95PrjhYpdQfXaIz/p8IPhQgriHJh79IB+T4QtFHkSahbHzzItUqy6ir41vwLpalKa
 7Qc5vQmtP8p9VZZdTl3PVJDMPXTff7vKAybGttFEX/eusDXRZ06twc+VhLaHPH9m4I
 +3VzAaV17JnlCt3jszMYMny31BoogcRIzeB5k3tfXU9Xj9qY6xc/HiXkkQdLVislF4
 y1fxr01YWjZEA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADBA43806644; Mon, 16 Sep 2024 21:30:41 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <172652224025.3820990.7553839359732316755.git-patchwork-notify@kernel.org>
Date: Mon, 16 Sep 2024 21:30:40 +0000
References: <20240915032251.2300459-1-jaegeuk@kernel.org>
In-Reply-To: <20240915032251.2300459-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sun, 15 Sep 2024 03:22:51 +0000 you
 wrote: > This patch allows f2fs to submit bios of in-place writes on pinned
 file. > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> > --- >
 fs/f2fs/sysfs.c | 3 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sqJIz-0000OZ-Ua
Subject: Re: [f2fs-dev] [PATCH] f2fs: allow F2FS_IPU_NOCACHE for pinned file
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

On Sun, 15 Sep 2024 03:22:51 +0000 you wrote:
> This patch allows f2fs to submit bios of in-place writes on pinned file.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/sysfs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: allow F2FS_IPU_NOCACHE for pinned file
    https://git.kernel.org/jaegeuk/f2fs/c/755f18261376

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
