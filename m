Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D2A7FF965
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Nov 2023 19:31:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r8loN-0008Gy-Fa;
	Thu, 30 Nov 2023 18:30:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1r8loM-0008Gr-8i
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Nov 2023 18:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0YtJ6mlDY7gweDgv9jsrd98ymiYHhOWMjwU+5wEILLI=; b=KLHhlM0WkvEzGm++0J5mHG61XZ
 G7Pkfm/8jALhHgy4FRbD/umbFM9jRWOATssSNAKpnMh4nOQ0o7gkS0TFgUh8z+/OBfdhr8fBVXrLQ
 LBoqUbX/cWIdz/jjZ/HHOO7TjAgmcFuHysBfIfudYx4e5YZ44AN5htit7JXipRhKl5yg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0YtJ6mlDY7gweDgv9jsrd98ymiYHhOWMjwU+5wEILLI=; b=UovjP5V3zzGn7pAWhmJmY6kUFJ
 ++vYWLNhGHN/Ci0GZRq9QJTe2+pgrHWAX54+8kXXf3pJp60MflCWfnmTyWEib5w6Q/i5n2a9SMlJJ
 DG/oqHWjQELARh20hviDpNcZDO+i2w/Ye2nh/9Hu+B/IfpoXnydI1jLP7jYaleuW7sUE=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r8loF-0006TR-Lg for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Nov 2023 18:30:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 82FBBCE2486
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Nov 2023 18:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C02F2C433C8;
 Thu, 30 Nov 2023 18:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701369028;
 bh=apCs06f4J/Du08lI0NgP2FT6ujYJ6vHVZ/T9S1lKJeQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Ysnh1Sh2sCaD4/iAgls8JZt2CSRDEH6v3T7Xf13LwLICRSawMUFPaWclKJkZnGLHT
 DHaKsnJR52es2NIToxhAIPDeWVKqKNaH/jRcP8JM6nmrhdLpg/i97C/PSYVP9niF2j
 eKq95KbQy37EfJNS56+n+hmJx7PmRTVr1EV07wM3Fri+oOdtlksP/RuF80/2fPngcq
 Dhnhhv2MpqjkwlIMXFUMruWjjbEmG3FOLRqE6VUP/WXaHjvpSewedK7Zmbf09geE2T
 MY1gdUc2NhyO1OYr8M8+Db87bbSEDz38TOgRrO/tgxs/TGjbkIouD91/6la6hTnwaU
 sDFNxx3O/nhxw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A179DDFAA82; Thu, 30 Nov 2023 18:30:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170136902865.21709.4443581224551288791.git-patchwork-notify@kernel.org>
Date: Thu, 30 Nov 2023 18:30:28 +0000
References: <20231116062556.2451839-1-chao@kernel.org>
In-Reply-To: <20231116062556.2451839-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 16 Nov 2023 14:25:54 +0800 you
 wrote: > Just cleanup,
 no logic changes. > > Signed-off-by: Chao Yu <chao@kernel.org>
 > --- > fs/f2fs/namei.c | 5 ++--- > 1 file changed, 2 insertions(+), 3 dele
 [...] Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r8loF-0006TR-Lg
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: clean up w/ dotdot_name
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

On Thu, 16 Nov 2023 14:25:54 +0800 you wrote:
> Just cleanup, no logic changes.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/namei.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Here is the summary with links:
  - [f2fs-dev,1/3] f2fs: clean up w/ dotdot_name
    https://git.kernel.org/jaegeuk/f2fs/c/ff6584ac2c4b
  - [f2fs-dev,2/3] f2fs: use shared inode lock during f2fs_fiemap()
    https://git.kernel.org/jaegeuk/f2fs/c/9458915036dd
  - [f2fs-dev,3/3] f2fs: fix to check return value of f2fs_reserve_new_block()
    https://git.kernel.org/jaegeuk/f2fs/c/956fa1ddc132

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
