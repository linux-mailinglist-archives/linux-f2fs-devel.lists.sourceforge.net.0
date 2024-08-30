Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F2E966AE8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Aug 2024 22:52:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sk8bC-0000mD-6s;
	Fri, 30 Aug 2024 20:52:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sk8b8-0000lc-Jb
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Aug 2024 20:51:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oZrsCLSDhhzOngp3AjvhXO/yWEDOi9SRwjC2QUJ66P4=; b=AcHuvg5WAqOaaD49JuczU6+f2S
 qhzfCPm+4fXQDMGWNDXJfbLVhuoN09RiZ0i5U7sCMYqoQi/4iJVYa3jnu4LGxsl81rgQpc1IkN6t3
 k8nOYFKCRdglA3+brlzcEoOjjzDAcDqOIXa4IqJ53DbJ5TOa6GmjE9MMeWVx0oW9MPrE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oZrsCLSDhhzOngp3AjvhXO/yWEDOi9SRwjC2QUJ66P4=; b=V1yLGlKs8tDu9Y0sb/oJCOmxie
 V/xv9GNU+DIUbD5JibFkKLL2lt4nNFP1wZlZhJSJPBCCmkDLPKo6rxxRqy/S6khu0xZCTLfEaHojb
 P4KNg8UN+3Fb3HOprN9QxusYii8Za9dixIk1LOC/gRUKOXD4Tp3J6xoBCgPGZNcc+Iis=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sk8b8-0005nb-Mi for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Aug 2024 20:51:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F25CEA41A84;
 Fri, 30 Aug 2024 20:51:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3921C4CEC6;
 Fri, 30 Aug 2024 20:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725051106;
 bh=+uGLknkE6IoO7a90AR+5N+DJ4wXbk1knYsF6gQ4Z0iU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=LuY3lw/o8cVgpsG0zbxiatyxvXTQqqsXeepFteXMMYvxLJCC0o2bVYp081n77XiWI
 VOHpM4dQUlKXlDyLPShI+nnB+JNP4895XkICs1aSsmfL4fZzx/Dgm4raGw3QAwD7Xv
 buQKS79wFpF2mQBvTzh0vJYznWS+1/lngLkTxpz+JMpMlCPFd5i+5zTvNTF9DW51Dc
 aXX0aPhDtuHfTpuZ6WsY7V9d15K2i9h3IbBhoE1hsWwx9+OVb9cWvPWpCSCiS2i0GY
 kerj/6Ft2ze9AA83B9gKwUBPIQb1CLGVHY4y5snf+9lCuUnrxDf9asWEBEyqKDc0GP
 W6RZcQplP69sg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70ECC3809A80; Fri, 30 Aug 2024 20:51:48 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <172505110700.2712133.2963157749047738751.git-patchwork-notify@kernel.org>
Date: Fri, 30 Aug 2024 20:51:47 +0000
References: <20240815004728.983290-1-chao@kernel.org>
In-Reply-To: <20240815004728.983290-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 15 Aug 2024 08:47:28 +0800 you
 wrote: > From: Christophe JAILLET <christophe.jaillet@wanadoo.fr> > > This
 file already uses sysfs_emit(). So be consistent and also use >
 sysfs_emit_at(). > > T [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sk8b8-0005nb-Mi
Subject: Re: [f2fs-dev] [PATCH RESEND] f2fs: Use sysfs_emit_at() to simplify
 code
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
Cc: jaegeuk@kernel.org, christophe.jaillet@wanadoo.fr,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 15 Aug 2024 08:47:28 +0800 you wrote:
> From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> This file already uses sysfs_emit(). So be consistent and also use
> sysfs_emit_at().
> 
> This slightly simplifies the code and makes it more readable.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,RESEND] f2fs: Use sysfs_emit_at() to simplify code
    https://git.kernel.org/jaegeuk/f2fs/c/f7a678bbe5a8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
