Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B1F7077A2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 May 2023 03:50:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pzSmj-0007HJ-AR;
	Thu, 18 May 2023 01:50:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pzSmi-0007HA-Hv
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 01:50:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UT3MaxTwipXzvBsbBCbjPaX8tW6Vs76Bz9M2UrrunVw=; b=Yt2n5pTEeve6WuPLADngo1zGd2
 ESf/+64FtjuqTEEnTjqYvdcEiq2YD/y3L4Onb/VD5P4wRkkqoup9BmPmgiTSnfmLIIJ145Deln2kb
 KGSb3MGdPFPChSrnzPX6OJQSjTBvCkCOWSt8u9K5+BJShdKjCemLj12rderNQpupLPXo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UT3MaxTwipXzvBsbBCbjPaX8tW6Vs76Bz9M2UrrunVw=; b=bO48EWsXggzUwZWtEB/PAhtY1F
 hIWGCZRmkEXCgbe+YxAVVTXHCylSuDiDk0IDftCGW3PL/ut8Gv7NH75SvKpV+vqJe7KI7y6LWeH+y
 ZRzVSgw5DTsphH8Z/Gxiz/yn+fit80W/8p8vM55+uEtz0M7ZOmSVKBBIzhNbIJ5rvfFE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pzSmh-0007UH-Fv for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 01:50:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1C8BB64BD0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 May 2023 01:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F714C4339B;
 Thu, 18 May 2023 01:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684374621;
 bh=M4NXrzfMePAJlv1Nw6DolPKf3y7XiO8lOTzcegyQ7es=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XorD9/84Fr0zofRSfYcEuChNLaEVSU0TSFdjlEFOq+4SEGLg6YJPZ5bXIwkGdpL9c
 7LtTscgOvu8JBOW77P0v9lmvbQw6FtrcxnfEuR0wxvwKlFts+zF64DUnT2SB1Sk6zU
 v/mLQgbss4IilNiS2ASclvUYtDqKkkZ52T9x8YUxYmGtA8HvxvOrazplRoVu4LNg36
 xs2f3qhCqKhAp0ZmhuEdMWOR+I5yZ/4JjLvzklK8zjlebJqUvKqBBd8gERC/F3OglT
 tSGdEX/n+fjYB2ajGTwS+F3tsPGKJi01tnQPV7TqjGhkeuL+BbN4KhehXLHyPGwSOp
 ObgpAWl6v2mTA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 4E009E54228; Thu, 18 May 2023 01:50:21 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168437462131.19511.13978967731542088264.git-patchwork-notify@kernel.org>
Date: Thu, 18 May 2023 01:50:21 +0000
References: <20230517094250.1407910-1-chao@kernel.org>
In-Reply-To: <20230517094250.1407910-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 17 May 2023 17:42:49 +0800 you
 wrote: > Then we can just define newly introduced mount option w/ lasted >
 free number rather than random free one. > > Just cleanup, no logic changes.
 > > Signe [...] 
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
X-Headers-End: 1pzSmh-0007UH-Fv
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: renew value of F2FS_MOUNT_*
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

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 17 May 2023 17:42:49 +0800 you wrote:
> Then we can just define newly introduced mount option w/ lasted
> free number rather than random free one.
> 
> Just cleanup, no logic changes.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: renew value of F2FS_MOUNT_*
    https://git.kernel.org/jaegeuk/f2fs/c/c235f42fffe1
  - [f2fs-dev,2/2] f2fs: renew value of F2FS_FEATURE_*
    https://git.kernel.org/jaegeuk/f2fs/c/a4ebabf341d9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
