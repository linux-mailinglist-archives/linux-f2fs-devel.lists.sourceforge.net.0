Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA7AAC6DD9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 May 2025 18:20:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCJ5lB/5/GHoLhuEpqmio87fyVV62q2sbJYHEvX2LpA=; b=XiplLlj8/WO6gY/zBsW4oXGDB1
	aLGajKB0jnJc4AcgXilqzOahyvdg9r75WZ7S5F00AaSouKMK21IjigsDdod1WpynIWPIV5et5XdA9
	dOO36kRgLb0krFvljzZPxybVNpHKxfewDlzznuosAX48jkZeyPoPZr7RYEu8A18UaW0M=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uKJVf-0003o6-Tx;
	Wed, 28 May 2025 16:20:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uKJVe-0003nz-Eq
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 May 2025 16:20:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g7E5H9/fd4Ku+cPHcey5K67E7rcomlLstaQ0cnrLNDc=; b=NtKxv/pbgFHeRHrnmpuAeNgYf3
 6JaSE5PeScjg3UhpBw3/n+0pI/w9PQnXMmeoH52Se4VgFJEuf3x3kzL8krpISnq7AeZNKr4FEKDZ7
 95S2bHx47gIrdTAqRsVc1VRb+4O1wd36KlACro0tJR68kbk4MduBQ/VroMTfnIBO3l6Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g7E5H9/fd4Ku+cPHcey5K67E7rcomlLstaQ0cnrLNDc=; b=iTgUb4i4QQYAALmsDL6kYSCA/t
 vWx6+r9O6MHmztas/kCr5HUBSldEELSQbmMND+IMxNKyraLOQwjnX7lenOSJNLK97Geq2eA/gVR7o
 lylw+X0Fano2msZzLLlWJH5jNnDuzQptCTyFmZ8BRsRP5z+iE3uiON7dyBfJwlknngQ0=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uKJVd-0003Vq-Nc for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 May 2025 16:20:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1A2DDA4F5EB;
 Wed, 28 May 2025 16:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA02BC4CEE3;
 Wed, 28 May 2025 16:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748449194;
 bh=GZp11ENuxv/DI5WxX8XBwc+eyfzg6i5/j+qBKoGlfA4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=BmVUbI0e98gn3BVLuJcu+H1BilpfvEaUGqHKrF8vpEQ5/ir5YWdZRi4q+91aLQby2
 W8Nu7Byq5j8Dw58y31WYun9IoTXohJwoYwREDHnnn++QFlGMr22FZcet2R2KLute9L
 Vn3QKq0X17CkciGvkcI4brYu59YVZlp5EjhmuNSIuP18eLt+Dy/9Tuz2NQCdMvu8We
 8iEzJTt+rzGuZiqm+LDK65/fPqFMkpniN/EZSL3DilB5larSMMibj8LsCKwrS4IQAz
 TNFs0WbJR8qxTq2JTqb5vuLwlnTv1y3kgUSxNsY0Dq1XqeO2OLXH6iOJ6zpFhE/Utt
 Ulcp9bRMM9aRg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAE233822D1A; Wed, 28 May 2025 16:20:29 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174844922874.2455931.3646209198266412275.git-patchwork-notify@kernel.org>
Date: Wed, 28 May 2025 16:20:28 +0000
References: <1747212349-18425-1-git-send-email-zhiguo.niu@unisoc.com>
In-Reply-To: <1747212349-18425-1-git-send-email-zhiguo.niu@unisoc.com>
To: Zhiguo Niu <zhiguo.niu@unisoc.com>
X-Headers-End: 1uKJVd-0003Vq-Nc
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: use d_inode(dentry) cleanup
 dentry->d_inode
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 14 May 2025 16:45:48 +0800 you wrote:
> no logic changes.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
>  fs/f2fs/namei.c | 8 ++++----
>  fs/f2fs/super.c | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: use d_inode(dentry) cleanup dentry->d_inode
    https://git.kernel.org/jaegeuk/f2fs/c/a6c397a31f58
  - [f2fs-dev,2/2] f2fs: fix to correct check conditions in f2fs_cross_rename
    https://git.kernel.org/jaegeuk/f2fs/c/9883494c45a1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
