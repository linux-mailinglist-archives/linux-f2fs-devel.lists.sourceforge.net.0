Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02232773009
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Aug 2023 22:00:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qT6PB-0001on-Cz;
	Mon, 07 Aug 2023 20:00:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qT6P9-0001og-Su
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 20:00:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YiT/KK6HRJ01193+9nBkYFw5OAs3YBaArJSc+SnYcew=; b=Lk9QSLhjBMWpg/8FSvgG6XDpT9
 MaLUzE9UJAWNIcS4nmgq531ynVRxIhAiYeoCSogLkzngaFrjqCbOlmJhpiJBIYUqtck4OsxZ/TUtL
 HAVRR8Su5iak3+So15Gxtd2D+yvtxYPIMPElzrjMUMjMsjZcI2SscQnzy6xnNfst4C1Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YiT/KK6HRJ01193+9nBkYFw5OAs3YBaArJSc+SnYcew=; b=aPN2gt1sZwK861DwRwE9MRdIUJ
 B6kS63o4KYy/HBEWr4jtlhThasjIfyWeRZRA8I62/j9r0k2OH6lulqI7AtreJ+DKapacqLC5QOk9K
 KrG+vGac0tTwVg2qmuLrTBovWL+EUVbV310pdiMNo+bBPGEdiNBbe2K7VmQD2kV1+rn4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qT6P9-00GOAP-Mi for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 20:00:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 21BBF621C1;
 Mon,  7 Aug 2023 20:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 893A4C433CA;
 Mon,  7 Aug 2023 20:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691438433;
 bh=6x1f0CDkPY07PiLmERMbBg0AbE6kPaoNOevutTQlpsU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=kq3NK0iHwGA7dWaTY9/KwSdKcbo0/NXa9khrMylmw0zeW/3Lczndrres/GalYAeaz
 QfpoMnzBZGNsajgPx/MCGvgyTg0XkKmegC06/sg2owA5BUpya7+yp3+YNzzOX7qMXC
 H5eLR6550J5ndHYkJqgvZ10t9K5y3qWBVoGk3AYLAaCyX/k9CHBduUZIONOdSFku8c
 EQNnNxJeC/07cD4nyjTZ+O4krJ/v8E1T1WES8cD6lofs7vC35PpRmxWgkMTiXZ9Mh3
 cI6DZRYQCvuSy24qIvWp4abPaR8oAhFF4Kj1YBz8jorNAAXJhn9NM0kneovabArsrQ
 BnOJUuu2J06UA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 59C1BE505D4; Mon,  7 Aug 2023 20:00:33 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169143843336.8972.4125102884764821098.git-patchwork-notify@kernel.org>
Date: Mon, 07 Aug 2023 20:00:33 +0000
References: <20230807195219.371131-1-jaegeuk@kernel.org>
In-Reply-To: <20230807195219.371131-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 7 Aug 2023 12:52:19 -0700 you wrote:
 > This reverts commit bfd476623999118d9c509cb0fa9380f2912bc225. > > Shinichiro
 Kawasaki reported: > > When I ran workloads on f2fs using v6.5-rcX with fixe
 [...] Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qT6P9-00GOAP-Mi
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: clean up w/
 sbi->log_sectors_per_block"
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
Cc: shinichiro.kawasaki@wdc.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon,  7 Aug 2023 12:52:19 -0700 you wrote:
> This reverts commit bfd476623999118d9c509cb0fa9380f2912bc225.
> 
> Shinichiro Kawasaki reported:
> 
> When I ran workloads on f2fs using v6.5-rcX with fixes [1][2] and a zoned block
> devices with 4kb logical block size, I observe mount failure as follows. When
> I revert this commit, the failure goes away.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] Revert "f2fs: clean up w/ sbi->log_sectors_per_block"
    https://git.kernel.org/jaegeuk/f2fs/c/f7a177b8690e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
