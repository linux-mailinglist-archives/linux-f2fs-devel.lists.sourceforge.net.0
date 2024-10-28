Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C24109B37D4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2024 18:40:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5TjK-0006YM-TH;
	Mon, 28 Oct 2024 17:40:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1t5TjJ-0006YE-To
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 17:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zS1rUD9vL4tU57u2O9ZtkJvY9P2KiNSy3pc5nILtzL4=; b=NnqvxAgkrdmmBhvA+cm6OSDMmK
 Z8nRFqUZ4nInsaankGMQzl5Lqfo1towdFWkdnSoRhSFzlPi+X+fcz6xMK3duvqsETEtqwUUBrZbYa
 2SC4vHx1LN1c0zJPlZsUlsr3s2spUHfoTlfbFFBEXQtEfS4w0XFC2i5fYrtQirQdyyM0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zS1rUD9vL4tU57u2O9ZtkJvY9P2KiNSy3pc5nILtzL4=; b=eLnhYGHDk8bzeLLpqY/3hoh/ne
 NPpheQvJR0Qa6LZtSiFVTDCbzunoWukcYmYouknq9HEPgUI4dL6fhV7jKnkDItdzSl7EFiVvzAzj9
 kBdbevX0W0RxJ8sJZphBP9pGb+ReXvHIh5NVSbwRFwT+SQVxLkhtlBxr4EGwoYWBZE7M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5TjJ-0005Gn-DE for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 17:40:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 024EF5C5DC3;
 Mon, 28 Oct 2024 17:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9AF4C4AF11;
 Mon, 28 Oct 2024 17:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730137226;
 bh=t790CU2G2j/NEXrCiMu4H/h7Ti3SE9Z+3VZODIkCWOU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=MOCmnBVf4Ujd4vpMssLLwsgl1TtO/x0DV/NioiMQ7r9FtHFaGCIrR9nSewCLA/oNC
 F0fNUj50pG6kDyv2mVdUihlKWaSP278AWT9wH+BDUUjTnBtE7DH8cHrdtrbEhw4lYm
 fjj9E/gM7X52gDu2gWf3+lUV6eYlkxvOr9AfihUKz8qBw6S0wSl5mKG9UwvxuACRvd
 6JlqUN4vLHfdBaSf4A0zBWtePWZkN9+W7qe+IS8SAzUtCvyjeCITFVO+/1dLuxrGtI
 LPEUJtoRTMU69aVa1gzwFSIriF4xYMgWKKy40lBVrYpHAfxLZ3krrhlH9kBAKSf6Q/
 hjzL5UpnjWhNw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33DFC380AC1C; Mon, 28 Oct 2024 17:40:35 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173013723403.126843.13404518317398636551.git-patchwork-notify@kernel.org>
Date: Mon, 28 Oct 2024 17:40:34 +0000
References: <20240924102800.240209-2-thorsten.blum@linux.dev>
In-Reply-To: <20240924102800.240209-2-thorsten.blum@linux.dev>
To: Thorsten Blum <thorsten.blum@linux.dev>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 24 Sep 2024 12:28:01 +0200 you
 wrote: > Use struct_size() to calculate the number of bytes to allocate for
 a > cloned acl. > > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
 > --- > fs [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t5TjJ-0005Gn-DE
Subject: Re: [f2fs-dev] [PATCH] f2fs: Use struct_size() helper to improve
 f2fs_acl_clone()
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

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 24 Sep 2024 12:28:01 +0200 you wrote:
> Use struct_size() to calculate the number of bytes to allocate for a
> cloned acl.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  fs/f2fs/acl.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: Use struct_size() helper to improve f2fs_acl_clone()
    https://git.kernel.org/jaegeuk/f2fs/c/527a4ded09b9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
