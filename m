Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B07B8C2E15
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 May 2024 02:50:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s5awt-0006Ri-Hx;
	Sat, 11 May 2024 00:50:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1s5awn-0006RG-KU
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 May 2024 00:50:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zfBFkoHrBH/vD41E7kdiANAm46zJ4ZZeEffysrVUJ+4=; b=X4798ABAP+SPy4iEVuVv8UNlXw
 c/N7h7FOPq9qQns7zggNzMkEOCS3acKWNZMOJPGrGlkw6E6dnR93BKbQBlrnnqEd1JYcWaqQWgKtd
 2rPvbuLd1yj+Q30IzowCf/QFEIxGx48zmIkdmsW700iJZvVlhAWWbS86/k8QcKKSwRxg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zfBFkoHrBH/vD41E7kdiANAm46zJ4ZZeEffysrVUJ+4=; b=m73YCuITul3muR6XyUfXfwbSka
 3SVkv1t2tjSBkiSwYXyHR9xSuyPDgJX/zBo1zyzleaXezX5DI0DaIvNpPnqOAhaLhpe+EaZQYnt8Z
 nBubS5JEl/hBHDfS7tefm3cWBvPuna/O9V2gQ6OnwIewkIbIJjb39kMz1ycxuVTLEDS0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s5awo-0004zI-4U for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 May 2024 00:50:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0C38E6203F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 11 May 2024 00:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10032C4AF12;
 Sat, 11 May 2024 00:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715388634;
 bh=x6JU8P/5APIQD+V7RPpFEEmBjkv6DyMsYkZv1QVVlhk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=kyXhe8Q8wiUv+KzYnnxHiOES1CAI+3tgweb7creUuJGzzRp9aMgvh2amrUae8r/4C
 Nw0REH5GBstRAuNg7pyoV3rKEb2PumlcEG6RLpx/yXZ9C7lp0BRUYgHc3HwN9pifgK
 h6qM1mwAwI/xU0zRT+AEdEbeDYJeqAk1kI/NEfQLUgB1zV1+wrn/cm+OZXchgwPfi+
 LJGehwS748xl56lCovkOGdH72jWrGqZMj0Qi9DL3bdt4Nc3+UyEWplSv72DXI8RT4a
 /dEzGzPj7zd/KZQlM3/6VfQMJ1mOewToBcJ0e5Zvs7raQOK9Z3YpoUluO5JYmzPWDo
 AHOpjmcS07Ucg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 04AEAE7C114; Sat, 11 May 2024 00:50:34 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171538863401.11229.5177002465976586784.git-patchwork-notify@kernel.org>
Date: Sat, 11 May 2024 00:50:34 +0000
References: <20240428011236.1008917-1-chao@kernel.org>
In-Reply-To: <20240428011236.1008917-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sun, 28 Apr 2024 09:12:36 +0800 you
 wrote: > Otherwise,
 it breaks pinfile's sematics. > > Cc: Daeho Jeong <daeho43@gmail.com>
 > Signed-off-by: Chao Yu <chao@kernel.org> > --- > v2: > - fix to disal [...]
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s5awo-0004zI-4U
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: zone: fix to don't trigger OPU on
 pinfile for direct IO
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

On Sun, 28 Apr 2024 09:12:36 +0800 you wrote:
> Otherwise, it breaks pinfile's sematics.
> 
> Cc: Daeho Jeong <daeho43@gmail.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - fix to disallow OPU on pinfile no matter what device type f2fs uses.
>  fs/f2fs/data.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: zone: fix to don't trigger OPU on pinfile for direct IO
    https://git.kernel.org/jaegeuk/f2fs/c/48d180e2bf5a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
