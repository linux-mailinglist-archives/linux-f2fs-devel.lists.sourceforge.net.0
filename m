Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A219683628
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Jan 2023 20:10:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMw1b-00035s-Va;
	Tue, 31 Jan 2023 19:10:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pMw1W-00035J-S1
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Jan 2023 19:10:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i+BJyLv2VbOaDrWdZ5eKgUSRqAAL1jE5fnOEsb2+F1Y=; b=H1XcUjvn/LoDuojzhnTfBM1LFS
 FNqRsVlj4aTJdhZlkfVBJylvnrjK5fhXEfKt7yXyfFM7zJTeE0cv/oiSnFcZ3TkHyNEndFzkH60Ds
 B9iI9eE/aVX3SdV8YA8f8amYWRfu7iHjiOj/XM/S8rNBU+okxHqMjKSKHDVC/Kn4c3LI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i+BJyLv2VbOaDrWdZ5eKgUSRqAAL1jE5fnOEsb2+F1Y=; b=dhTUg13vDnUlLvVinEDQz7SjmC
 u1VuJVmOM5Ezvy29taMmETj7szBHqBeENKCOqLXIc7OPhHNHM9ObhxYVCo4gIAedA+sXCiQsbnL7Z
 kwslKqX6JWjggzSfkT644Nd5AYkTa6r/XlGdBzeNkoJFTtK/b+Yw5LAriIjStN4bQjgM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pMw1U-0006XP-3x for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Jan 2023 19:10:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A0B36B81E72
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 31 Jan 2023 19:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62722C433B0;
 Tue, 31 Jan 2023 19:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675192220;
 bh=yzX1tBKQhuZAP0hOlezcqUW87/muXUy9MPuvKR760Xo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Mb2k4q5j6EK43w2DUYWverfsdB2fx3kYrNig+5mWeMfAcDYCk0ByGOr8UExvPbOZC
 aukYwFS2g3Hne0PQZCvNkTUD/syHmBc+je0VmuyAv9HRL61+7Vd33AyGoNDaAlZI0J
 j7YyAf4kLAJ4K+1+XC9/AEsc1l8vr7Y026tlxi/hu5kbYQnmp9Ji8rHWRS/+HeN5Zo
 oKf1DOB2I6c2++D4QeSFMopoPn520KA9JuPZ9VIeMZGcCKGe8F8z/7/H5g47m/OW21
 fwnXLabXByCrMtOUzC8g01n1tMwTCW5WH1nWKcTavISXOcvvozOXvkg/onjYCL+Oih
 EKm2KenHK3NTg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 2B656E50D70; Tue, 31 Jan 2023 19:10:20 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167519222017.20142.14408794007264344446.git-patchwork-notify@kernel.org>
Date: Tue, 31 Jan 2023 19:10:20 +0000
References: <20230128103226.1318362-1-chao@kernel.org>
In-Reply-To: <20230128103226.1318362-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sat, 28 Jan 2023 18:32:26 +0800 you
 wrote: > Otherwise, 32-bits binary call ioctl(F2FS_IOC_START_ATOMIC_REPLACE)
 will > fail in 64-bits kernel. > > Fixes: 41e8f85a75fc ("f2fs: introduce
 F2FS_IOC_ST [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pMw1U-0006XP-3x
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to handle
 F2FS_IOC_START_ATOMIC_REPLACE in f2fs_compat_ioctl()
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

On Sat, 28 Jan 2023 18:32:26 +0800 you wrote:
> Otherwise, 32-bits binary call ioctl(F2FS_IOC_START_ATOMIC_REPLACE) will
> fail in 64-bits kernel.
> 
> Fixes: 41e8f85a75fc ("f2fs: introduce F2FS_IOC_START_ATOMIC_REPLACE")
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/file.c | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to handle F2FS_IOC_START_ATOMIC_REPLACE in f2fs_compat_ioctl()
    https://git.kernel.org/jaegeuk/f2fs/c/848be5e25469

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
