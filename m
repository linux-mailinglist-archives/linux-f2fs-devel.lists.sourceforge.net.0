Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25941985194
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Sep 2024 05:41:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1stIuF-0008Aw-Kg;
	Wed, 25 Sep 2024 03:41:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1stIuD-0008Ae-T9
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Sep 2024 03:41:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p96nb79rODfFx3A+wAxZtWbQKMZTTDJfcSrtRf1YouU=; b=Ob/WlFj3erQ3Xby3Smu5sOWn9f
 sQKQR2i+rewItCPvyIRn0JNxN02lJaLgkQM5RuWi2PJEgreJOONlgGZWb4vDzMN1jDSRhCulTVy/W
 yccSvH+c2vyJd89vWDcjr/oWB7yMd9jUZa+ZoHJMTQEV/I6AX1iCrzRsav58heSLjsgs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p96nb79rODfFx3A+wAxZtWbQKMZTTDJfcSrtRf1YouU=; b=P+B0FUer0SzuhKKWnD73/wddph
 3YY/hOp2FWgmX5REcoI5k66vJtVINXGLms66OOD2fvFkvS7aJ5b2t6ZCcLq1iDF0e6r3hQxz/DHV+
 YH5qykRd5hFuOaKVEMdjmeOSrBC6ZndyLdKKVuK4KjuHnAGUHWqOgwmWIyKwPneLUw80=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1stIuD-0003Ap-Ay for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Sep 2024 03:41:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 057FE5C5A02;
 Wed, 25 Sep 2024 03:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E35C4CECE;
 Wed, 25 Sep 2024 03:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727235687;
 bh=Xce3UyyGKlz+3jg4rHmmMiwwmv+9dBnd289UDXz6Hik=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=p7a3609TEJhik1mwSQt7x/NJ8qqpriX4ccJviepFHCZuj0q9sLmTXwlinr9xIif9q
 Le0phncemRRwx/UbTAf/V2EZrVJVrCYaMm31KAIpibtMP01CEOcWxQXo1wtOYRuW+J
 P8KItNkkb1wkRpdQLiR+yQ5bGznlZT75wT949R50JrMXuvO9b1lz04uZG19SA55guk
 DVb6wr56YP8hXX8nh6STo4z7x1fR5RaJLC6xE2hMLVW++4sR3NhFDl64pS9p1m2vzp
 waVOwcZPedegSQZLE5mh4NNVDSjU1dnHS2i7nqznqnN2nfdqmfZXrwp93tmo636A/z
 EcE/cfeR4Ho1g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 34597380DBF5; Wed, 25 Sep 2024 03:41:31 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <172723568980.97387.2632105381881398970.git-patchwork-notify@kernel.org>
Date: Wed, 25 Sep 2024 03:41:29 +0000
References: <ZvInHczHWvWeXEoF@google.com>
In-Reply-To: <ZvInHczHWvWeXEoF@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This pull request was applied to jaegeuk/f2fs.git
 (dev)
 by Linus Torvalds <torvalds@linux-foundation.org>: On Tue, 24 Sep 2024 02:42:37
 +0000 you wrote: > Hi Linus, > > Could you please consider this pull reuqest?
 > > Thanks, > > The following changes since commit
 c813111d19e65b6336a6352eae9c1ff5c40f722f: [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1stIuD-0003Ap-Ay
Subject: Re: [f2fs-dev] [GIT PULL] f2fs for 6.12-rc1
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
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This pull request was applied to jaegeuk/f2fs.git (dev)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Tue, 24 Sep 2024 02:42:37 +0000 you wrote:
> Hi Linus,
> 
> Could you please consider this pull reuqest?
> 
> Thanks,
> 
> The following changes since commit c813111d19e65b6336a6352eae9c1ff5c40f722f:
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,GIT,PULL] f2fs for 6.12-rc1
    https://git.kernel.org/jaegeuk/f2fs/c/79952bdcbcea

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
