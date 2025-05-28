Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 080B1AC6DD8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 May 2025 18:20:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bfE6MvyEK557TptgiQ04a5Ta5ltTBN7RFX+CkCs5H8=; b=JlNhI3aKaxHMB16aPBKGjSoll3
	P1oeYnj/ENrA1knav9khZ7P6MCMPWpabnOoDsPdpJZmuumEuqVcpPpjpNVYs9S864392CEhtkN/am
	0eNLL3T97hMl0kYpCvvqzAiXsE/9w0PmxLeCGeOBooqTkLhvMSelfc8KTpPmVHC7i2I4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uKJVZ-0005Cu-Of;
	Wed, 28 May 2025 16:20:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uKJVY-0005C5-31
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 May 2025 16:20:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f/erqKY1eLc4KyIhDHTPZMJ42gY8r6XiATglkj0bSt4=; b=fTBPh3weYtF8dRiKGSrHbmYCrq
 UGut6upr340cxwrbpJMVeTtDJAS3CSw5XAO5k11EUN7FJiCfvXgTca18w7cv3p018gxFYfS692SjY
 rBL+bGxGgs2KMOS0FLzWkYzraLncigI+WeJM1l9Xbtdu/3vBjgap7OozNrW1rIZXMh0Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f/erqKY1eLc4KyIhDHTPZMJ42gY8r6XiATglkj0bSt4=; b=OawamnrcEumD2FyPe/Njb/VD2V
 0ZMzTquu/eWhVgzOqdCQknsC7FuTq6oKfW+Q8sBTIZGTKe3Luevw9VLj1dfOcoAEycfz9AHGLCF8H
 o06474iFJ+nU9pO9eIVaHCVeMobeA8ZGAoeN/hHuev6vB/48uUnDl6hWHG4IlbDTUPx4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uKJVX-0003VO-CR for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 May 2025 16:20:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CDAA861F1D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 28 May 2025 16:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83433C4CEE3;
 Wed, 28 May 2025 16:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748449193;
 bh=6w+sSIEa2a6VRdcgdL1M84ZRtr3imad0eRZ9oLz8HW4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ZablnEiHJ2JJM401tyemi8r/4oK/yt++24MeyhqBRDvq7lrXWv15+reo1LkpFWpQM
 UsyupwxwkNK47A/VtSaTF4f261Y2D0xXXJNNdts91qd5esovrgdOfh3woEA/smyw7w
 fyPAvjd+xMGh/ZaqmjcHt+mnxr+c+zualif2vluqJ007Wg4Vb3suQ0s/X5ggGpH//h
 m19G+ThMzkQVxuFV03202eYTc9qekq31hP4NwFigqM2iItOzDuuyPBp0IzIgbQ3Mhm
 JW6I6TghXQ+DRPUW8oipVopLqkYnrsN4BBjrLdwJ+JEDzKMAGmmN3C5eq5MZ7tRxTX
 OVVaw+2Qavpqg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADDA33822D1A; Wed, 28 May 2025 16:20:28 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174844922750.2455931.7003358490084665923.git-patchwork-notify@kernel.org>
Date: Wed, 28 May 2025 16:20:27 +0000
References: <20250523073304.1454247-1-chao@kernel.org>
In-Reply-To: <20250523073304.1454247-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Headers-End: 1uKJVX-0003VO-CR
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: introduce is_{meta,node}_folio
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 23 May 2025 15:33:03 +0800 you wrote:
> Just cleanup, no changes.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/checkpoint.c |  4 ++--
>  fs/f2fs/data.c       |  2 +-
>  fs/f2fs/f2fs.h       | 13 +++++++++++--
>  fs/f2fs/gc.c         |  2 +-
>  fs/f2fs/node.c       | 18 +++++++++---------
>  5 files changed, 24 insertions(+), 15 deletions(-)

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: introduce is_{meta,node}_folio
    https://git.kernel.org/jaegeuk/f2fs/c/019a8912425e
  - [f2fs-dev,2/2] f2fs: clean up to check bi_status w/ BLK_STS_OK
    https://git.kernel.org/jaegeuk/f2fs/c/68e7f31eecf1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
