Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F6174454E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Jul 2023 01:40:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qFNj4-00018z-3N;
	Fri, 30 Jun 2023 23:40:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qFNj3-00018t-Dd
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Jun 2023 23:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tAqhXfUaV//ZTYCxM2CXd8wOkrqeLHTW+GJdge6ESn8=; b=OjC+3HBKke8AYTfi1fH9uQfIyX
 vzihlwvpzawxHWLUnKv4mMJ2s95QcYTnlHWRK/9o5j9pGutrxmWvf8dWF0BudSmRn0ikgghLKQUPh
 qWDmWEpQcaUKtYRt/htdvWCbdJSKJgGQIlWkQxB14xK9FLuLc1pimUc7ZzvsqEu3YexY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tAqhXfUaV//ZTYCxM2CXd8wOkrqeLHTW+GJdge6ESn8=; b=IShDYYlhpd/c9TOsz8g/t2Bch+
 jmhnBgblPlIxhVV9wmYNG8gn+Mt4kKlqzRXoodDI9bYRIJxbKx0lcSn7K+PDs/evsgRhTkLR4pj77
 cshMKgdds4vLwoanI0oWh8DmARk7AHHvNopmiBTJk9MQKAsMJitgD0AX8ElCX6twPQrw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qFNj3-0000xC-Le for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Jun 2023 23:40:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 33CE26181E;
 Fri, 30 Jun 2023 23:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91B75C433C9;
 Fri, 30 Jun 2023 23:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688168423;
 bh=UmejxkXIML2SmVsndrL54sLN4+SWqQuPNnFV/KUaB6o=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=R/ng6125sVXVQLA3NmLTUpjyqJyZolsiY5eQVI5/in53F6U5f6m1XxTAf29tOJSiR
 A9puuBQ2CXSvDvq+c/7nd7Nwsk0Zx2Zq0kQKlNVc1eeOHnb+7kF2c00LgoU4skbctj
 uI1m+3AePHvGBDE/c70EIob2WFLtN1TXLc9trVwiuXpeQlr6qwK4i5NbpD/fPH63l7
 ncwKnaINd5rOx70V1fK6+Bi5XP1ZF3QBhH3Tjg/JREwrg/6Me2uWYVQlAdbwLLOnr5
 7Ej2e37GCjSjNdYQWokTr2/q2tMfJXQfnxVTNA3MITD/3ld2Fps7zlIKtETmwYphwT
 W/Al5VNca742g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6B06CC691F0; Fri, 30 Jun 2023 23:40:23 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168816842343.31915.10115139157095674.git-patchwork-notify@kernel.org>
Date: Fri, 30 Jun 2023 23:40:23 +0000
References: <20230627122153.1557656-1-shengyong@oppo.com>
In-Reply-To: <20230627122153.1557656-1-shengyong@oppo.com>
To: Sheng Yong <shengyong@oppo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 27 Jun 2023 20:21:53 +0800 you
 wrote: > If a file is not comprssed yet or does not have compressed data,
 > for example, its data has a very low compression ratio,
 do not > set FI_COMPRESS_RELE [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qFNj3-0000xC-Le
Subject: Re: [f2fs-dev] [PATCH RFC] f2fs: only set release for file that has
 compressed data
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

On Tue, 27 Jun 2023 20:21:53 +0800 you wrote:
> If a file is not comprssed yet or does not have compressed data,
> for example, its data has a very low compression ratio, do not
> set FI_COMPRESS_RELEASED flag.
> 
> Signed-off-by: Sheng Yong <shengyong@oppo.com>
> ---
>  fs/f2fs/file.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Here is the summary with links:
  - [f2fs-dev,RFC] f2fs: only set release for file that has compressed data
    https://git.kernel.org/jaegeuk/f2fs/c/87a91a155902

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
