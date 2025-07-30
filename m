Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7AEB16553
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Jul 2025 19:20:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFv0RlQVnLIjczWgGGeR/i1eweJULIkZ6j9DnanzQgU=; b=WiqYkNB3Y5smdE/T+chT67CMVU
	GMQRtBjvwNhTSA+1PCqbONaetnRPiG/GtH6ao2J/XjmKKh2a0ohB5DuZ9SD+fT8YqWqTUNKEljNA9
	cCsF5cm+d7s7VX7F2BYi1/zN70LvdrQjvNDgbyBHfk8mEkCzQ+UdhY4Zkd85i5aZRiXc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uhATQ-00055j-Vy;
	Wed, 30 Jul 2025 17:20:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uhATA-000543-JF
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Jul 2025 17:20:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aX1ofByQwbGj4p5cK/72E0N6z7r15YZJJ/jHzQDiSaU=; b=DE38wpay5jjkPnK80lco22atXI
 WCMQ31lhNyh3febSERKb9bTIjqHw537VsAtwaBi2Twmqs8H9YeGcnPMBEwlegrm33LmWM3rHzE93s
 zMv1S38wHH1n3t34TF9zb6M06+XM6zCWsU1vcVcRBtLN6vV3oay7yhvcBBakMTxOH6Rc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aX1ofByQwbGj4p5cK/72E0N6z7r15YZJJ/jHzQDiSaU=; b=cIrERr94kWP0a2vvLHWTIbYkPm
 UxySAmfbyCwcjiewSdRsoETKmCQh949UKLWbjHhhFKBYlAbWvbG3G4SVN2FByw7ouG5YQ8UlCF4P8
 PeV1KfaPMKONOUsE75pJzUCCqndb/ZAkBnU7xiS95JdJmEPhyguEaFI3kfM7oPPb15tE=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uhATA-0001bg-RY for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Jul 2025 17:20:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3254CA53CEB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 30 Jul 2025 17:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2CBFC4CEE3;
 Wed, 30 Jul 2025 17:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753895989;
 bh=CQTsNGrLVlOyPWOkdIBqRhQz4jq7AfjVW2m4lEYekcw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Wr3IYbDFwiHigsUHmvJHnXDLg941kU2z9tuEFFQ3R2kdzUK92oLqifEKbMSBBDgKm
 iX1dFDichWNRxygenv/4SQCqEL95iTZ97kWrTAeUJuGlAY+lluVIsbnpvBFp5wSLbp
 teTmzLXmBtHC2uDrXMYFGvm++KvJStdhHN2FDx7JiJeIb9jm46dRzsreJE2HApKk8N
 Y2SbmbMuVX1EiMKdwbtE2WfQNHvNzCFU658TW5YBSuG5rWSxf/ZofQCFWrl7TNOowj
 DUCU5+j+dLGuS7hEBGzB9eRct/CSz9EDIMpuOSd7tzQVILqNYtYT2hdXWFWvOYFlkp
 RfqrEghmK7hMQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB114383BF5F; Wed, 30 Jul 2025 17:20:06 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175389600575.2380550.14219275331926903435.git-patchwork-notify@kernel.org>
Date: Wed, 30 Jul 2025 17:20:05 +0000
References: <20250729204719.1253285-1-jaegeuk@kernel.org>
In-Reply-To: <20250729204719.1253285-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 29 Jul 2025 20:47:19 +0000 you
 wrote: > Let's drop the inode from the donation list when there is no other
 > open file. > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> > --- >
 fs/f2fs/f2fs [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uhATA-0001bg-RY
Subject: Re: [f2fs-dev] [PATCH] f2fs: drop inode from the donation list when
 the last file is closed
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

On Tue, 29 Jul 2025 20:47:19 +0000 you wrote:
> Let's drop the inode from the donation list when there is no other
> open file.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/f2fs.h  | 2 ++
>  fs/f2fs/file.c  | 8 +++++++-
>  fs/f2fs/inode.c | 2 +-
>  fs/f2fs/super.c | 1 +
>  4 files changed, 11 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: drop inode from the donation list when the last file is closed
    https://git.kernel.org/jaegeuk/f2fs/c/078cad8212ce

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
