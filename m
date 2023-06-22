Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2317397E1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jun 2023 09:11:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qCETK-0006Fz-CC;
	Thu, 22 Jun 2023 07:11:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qCETI-0006Fm-QX
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jun 2023 07:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9qSKJKeOY7IsFH/+Cw+yjXqQwKOAfpVWsmJnRRGDhLE=; b=FmHtzOyV33sM01fzphQ4EqJB2+
 RkGT5eF8So47qVYcF+IbM2J8J7p2yxbWl/hH1a7VlHYHmnzHzkoxzkGmFPtDFEnvz7qH1lRoQ9S3m
 J1jwz+Pr+dIBhtrRhra5Tqw9xyTj2Tqxyr5bt5iKk92Sjf5QB9Qj9rxezP3n9H48kKZI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9qSKJKeOY7IsFH/+Cw+yjXqQwKOAfpVWsmJnRRGDhLE=; b=ioyPh1FrPMZ2fbsO4/oNtHC4K+
 sll02JqD3b34bEYo/I3zN3jArj/6vn5ztrT2iybfe9hgNA8Q3WLN6RkGDImS6EnrATJSubxshHHof
 BteZ5C9yMXW+au79/YdY0kWxZK1lS7TrhtM8hgen5X6WHiBx1lLcSVSRCfIP9WRylrBY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qCETI-0006St-7k for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jun 2023 07:11:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E6B2961779;
 Thu, 22 Jun 2023 07:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59B79C433C9;
 Thu, 22 Jun 2023 07:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687417865;
 bh=GjxOJYaBtSOlnk07x5M2xCANMesU4QG/68w08znZ5Sw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=GBRM4w2W9hv/OLK76SCW0rizK456TApuO8uBeABjJ1fVuQLKkT5Thw+WEHMXrrweH
 /yHkEO1ccNwCvX7Y+xQacloD7xw7lE/6CAMwWfi5eSRlKcigosVlAp6TayRX7nSXib
 vg2rXLKZOzYwLlopkCccEPFhdr6REICTNVNYbVBpJHK8brZwFXt2Fm+oFs1kvBIHmB
 9fv+F8qrIXYQI9OSYJWlcPI4ttelV0wKV+wWqmkBISxtogrx6KzEUWYuFf2zJTwDrn
 3LkNCZnmhJy2FRAf2YA9CWQN5jNj3E3sekWQekNqV5Qk7PysaMy5yfC+26P8JhvVJJ
 m+34yQKrfiCqg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 3AC49C691F0; Thu, 22 Jun 2023 07:11:05 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168741786523.21692.5617086196942708682.git-patchwork-notify@kernel.org>
Date: Thu, 22 Jun 2023 07:11:05 +0000
References: <20230613075157.41065-1-frank.li@vivo.com>
In-Reply-To: <20230613075157.41065-1-frank.li@vivo.com>
To: Yangtao Li <frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 13 Jun 2023 15:51:56 +0800 you
 wrote: > Just for cleanup. > > Signed-off-by: Yangtao Li <frank.li@vivo.com>
 > --- > fs/f2fs/segment.h | 2 ++ > fs/f2fs/super.c | 3 +-- > 2 files changed, 
 3 inse [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qCETI-0006St-7k
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: convert to use
 F2FS_SMALL_VOLUME_IPU_POLICY macro
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

On Tue, 13 Jun 2023 15:51:56 +0800 you wrote:
> Just for cleanup.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  fs/f2fs/segment.h | 2 ++
>  fs/f2fs/super.c   | 3 +--
>  2 files changed, 3 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: convert to use F2FS_SMALL_VOLUME_IPU_POLICY macro
    (no matching commit)
  - [f2fs-dev,2/2] f2fs: convert to use sbi directly
    https://git.kernel.org/jaegeuk/f2fs/c/08f83cb23a3e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
