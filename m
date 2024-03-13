Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEAF87A0C6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Mar 2024 02:30:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rkDSC-0007ER-F6;
	Wed, 13 Mar 2024 01:30:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rkDSA-0007EH-Oe
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Mar 2024 01:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kSmY527TjYzEGBFvn8IW7XT6nImaDn7crCBlsaM+dE0=; b=M3SnViPygVjkgHuolMApVEpWRE
 GFSwZ/kjrumLb6VZvv1kUkk6/5fizlaTKwmXEZIBHGn5wp+66wPGxZh1lWtxMqT88xSk9LdM2cx3z
 PDGZYmGBgZ5Rf/vIBcw4dEa3zfI20jwRAWUoa8/3UtuXjNA/SXswAWLoNKI6LMAMTUoY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kSmY527TjYzEGBFvn8IW7XT6nImaDn7crCBlsaM+dE0=; b=G9aCiyWFUXcqrb/PudSNDukSRf
 eVP8ovdb7NxBxMzOJn7VXOprx6AgX1Q5zS2l4g7B8XgXTUs8m1/QHXOvcX9KQ/uAHFgKt/nHr33Kz
 HeEmv8BOQXADASzpv8mcyNeerq6z8wvnw2Ef/b9xVPShxBa2YgJjwEv6MqsxtsZlZWzk=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rkDS0-00023j-Fr for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Mar 2024 01:30:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BFA8DCE19F8;
 Wed, 13 Mar 2024 01:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07E8CC433C7;
 Wed, 13 Mar 2024 01:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710293430;
 bh=h8pOeiSdPI8iajU4IaZNdfrgsdrTQVx5B+jm+TWhEWg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=L4PzfoP9Wo383wNbc5BDShHMAaUAteOMrpcRwlP9W+XkyacJQL7EAW8RvpSMUsl/i
 c33IceUb9vKGv2iwCwCzhNpKFiamzAO2Sn2i1yQna6ml9XsyXc4tJoFZ1f60so+w/X
 UsQzNXjM7/k3i4TaVWx6F946oaFNsi+tg4bMIoJ9uwy74exGV3ofvjwfpt8AuOkq7L
 aXqmOYP0vbXMn6e6RKxGWJigF4zcZf1leYFnXxx3nJ5miZJfoD8nvIi6IyKuzNalUA
 h+VMpMMLrH2AuA/dRFgjmRECxaXXwhCrZMV9w1PlOWk0oXSp98uWSq/w1F90EAdKi/
 axu5hHpZDF+ug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D8054D84BAC; Wed, 13 Mar 2024 01:30:29 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171029342988.17296.17999527024833802144.git-patchwork-notify@kernel.org>
Date: Wed, 13 Mar 2024 01:30:29 +0000
References: <20240308035057.62660-1-chao@kernel.org>
In-Reply-To: <20240308035057.62660-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 8 Mar 2024 11:50:57 +0800 you wrote:
 > Commit 2e2c6e9b72ce ("f2fs: remove power-of-two limitation of zoned >
 device")
 missed to remove pow2 check condition in init_blkz_info(), > fix it. > >
 F [...] Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rkDS0-00023j-Fr
Subject: Re: [f2fs-dev] [PATCH] f2fs: zone: fix to remove pow2 check
 condition for zoned block device
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
 songfeng@oppo.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri,  8 Mar 2024 11:50:57 +0800 you wrote:
> Commit 2e2c6e9b72ce ("f2fs: remove power-of-two limitation of zoned
> device") missed to remove pow2 check condition in init_blkz_info(),
> fix it.
> 
> Fixes: 2e2c6e9b72ce ("f2fs: remove power-of-two limitation of zoned device")
> Signed-off-by: Feng Song <songfeng@oppo.com>
> Signed-off-by: Yongpeng Yang <yangyongpeng1@oppo.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: zone: fix to remove pow2 check condition for zoned block device
    https://git.kernel.org/jaegeuk/f2fs/c/11bec96afbfb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
