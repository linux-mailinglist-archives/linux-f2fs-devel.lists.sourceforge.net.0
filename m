Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A197171D6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 May 2023 01:40:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q48x9-0004nd-Nu;
	Tue, 30 May 2023 23:40:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1q48x8-0004nQ-NJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 23:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DmwLT4s3vcHNRd5pHUJvtYeNehX4nK6cGUaSM+n4+DU=; b=b6kPLii8PJKVaFFRYTiqiTOfZ8
 l9NCavetH01E1hahsZSxiFzxf7mesJOhRAF7VQhT14twLTBgCHpncGpouHEonuQBvXaT3vIVknjcC
 5rCIPoszs0AZ17ujZKY2HLlLpyIiOqhp+OUlSctZS8kQT0e1cdIeZEIaBhbZvT/cvbgo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DmwLT4s3vcHNRd5pHUJvtYeNehX4nK6cGUaSM+n4+DU=; b=dnSOA6tzm+6kHQ4JakReMa0d5X
 /NT1wgTYRBBrWgQj2/OOjh2QFPNZ1zmg4nMj4MdB7DEdBZ6V5F46dhqlJmXm4oJ3/iSjWuYrWVkcw
 cIrif+54jPKy70UN9jQ8HxLZOzhpIq4UeRZw9BYSloJ0QhMa45u49FlCH1CkT3jQDheY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q48x4-0000NP-OK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 23:40:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 59AA46354D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 May 2023 23:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4622AC4339C;
 Tue, 30 May 2023 23:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685490024;
 bh=+sbfkCGq8BzDi8rChbGwTkXONATdk9LCRY+eodRnV0w=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=g1JrjJCqORaffZCMuSSK4lselvoVdajwPAeQiPwwg56+GkiItHICjCU0Y5Eq1LslX
 2v47elE9rVKBAOxt1z23IY8iSClg2jh/2hwIksqcjFvP2DzBxlbtewEfdW4kf2o5k8
 WHvZN5tuE+QN7GqdCE16Putyv9cl0P6rsb0R2lh2wwLC9+6SWjmyHg48wJZbHPeI8y
 AdOsV+XXRfQ3d8nS4iK8Ypnc6FsZk6ElH8eLiWMbipwLV+HayNI6QJbNCwSXDrKDmI
 GutIS2X5TOcog1gA50jJ8+cE1juQKiatFdJb8LGgtSTe7S+ee1iKVSOA1yPaow3Xw1
 flYMIpVZQT4JA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1EBBBE21ECC; Tue, 30 May 2023 23:40:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168549002411.8773.18270821240993946589.git-patchwork-notify@kernel.org>
Date: Tue, 30 May 2023 23:40:24 +0000
References: <20230523123521.67656-1-chao@kernel.org>
In-Reply-To: <20230523123521.67656-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 23 May 2023 20:35:21 +0800 you
 wrote: > Use sbi->log_sectors_per_block to clean up below calculated one:
 > > unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
 > > Signed- [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q48x4-0000NP-OK
Subject: Re: [f2fs-dev] [PATCH] f2fs: clean up w/ sbi->log_sectors_per_block
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

On Tue, 23 May 2023 20:35:21 +0800 you wrote:
> Use sbi->log_sectors_per_block to clean up below calculated one:
> 
> unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/segment.c | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: clean up w/ sbi->log_sectors_per_block
    https://git.kernel.org/jaegeuk/f2fs/c/584212446615

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
