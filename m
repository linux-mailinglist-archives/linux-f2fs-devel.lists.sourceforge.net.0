Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DF37077A8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 May 2023 03:50:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pzSn1-0005vk-Rf;
	Thu, 18 May 2023 01:50:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pzSmo-0005vX-HA
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 01:50:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hiJkOE4sF397K528VCy6DbZQ2gJCBHiPoeu0MIB0Gw0=; b=Iups4ekCBbT7/4We0Zxgvih/hk
 i8rPryh51nUA1KdGdNQLRRlJMAHFwftsJpIybm+dYl+4GBQvAzeL+qdjXlCfBUTkKlG7w70lpdOiP
 NJ9wuA26WumykuDw0UKRMH7/WSOZ2lVkRTJnYC292lWgSeiRTE8i1j3eP6IwmzyW/Njw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hiJkOE4sF397K528VCy6DbZQ2gJCBHiPoeu0MIB0Gw0=; b=c3egvpuJUPeansInzhpTiLhXC2
 ADBfhnLiKlyYsWuTIvrlaoQu3+iT/ifv+jOImZ1mYpgBJarQzUgDx17EV0djsyAuXvrDZxrzGPpp+
 0mxhEWW+Dz+Q7aIEmUUCn4/p6wkilB5iRv4vTUCkD1cUvUk10ViCTC4pw5UAvn73DFt8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pzSmn-00BlvX-GU for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 01:50:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A377564C44
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 May 2023 01:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91D37C4339E;
 Thu, 18 May 2023 01:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684374621;
 bh=6P3qFN0pUzsg+xFu4WJdAzDQLrByxRzOzEBQ1mm69iI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hEt+kkNHD7RrBapnZKztBgIsBPqHhgP2MomnRfGqFj3hKRc3miQkfc6rRfFdU9J26
 qdlA18xP/UH4EEAEf5DE4n2x64CDpN9gyuLBA+1zygYU90pWGkWooyQqjoUOgxMvsF
 AoskRgD8OUs6EKebgYbrqGv+Mfe2S4zjEgzJlBakfEE5Omu/qPjmdESbtd6m4MG9jw
 4Lt1szILdr6bo4JzgDqAfesBdU9YC+PblEdsMvQ3MoHKNrTeEltpNOqPtWunOzNlYq
 Gu+/LwHBpChhxuvFnPPXp4bluWjH0L77l8Y8iSkBE3A1pdp3WFhWe3jM4DBoYdwb9c
 yO9VzUiXCngLg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 7642CC4166F; Thu, 18 May 2023 01:50:21 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168437462148.19511.5245634211423194029.git-patchwork-notify@kernel.org>
Date: Thu, 18 May 2023 01:50:21 +0000
References: <20230517034139.12879-1-chao@kernel.org>
In-Reply-To: <20230517034139.12879-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 17 May 2023 11:41:39 +0800 you
 wrote: > The last valid compress related field is i_compress_flag, check its
 > validity instead of i_log_cluster_size. > > Signed-off-by: Chao Yu
 <chao@kernel.or [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pzSmn-00BlvX-GU
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: fix to check validity of
 i_compress_flag field
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

On Wed, 17 May 2023 11:41:39 +0800 you wrote:
> The last valid compress related field is i_compress_flag, check its
> validity instead of i_log_cluster_size.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - rebase the code.
>  fs/f2fs/inode.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: compress: fix to check validity of i_compress_flag field
    https://git.kernel.org/jaegeuk/f2fs/c/8a0dbd506b6d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
