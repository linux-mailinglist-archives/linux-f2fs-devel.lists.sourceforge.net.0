Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F4ABAAB07
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Sep 2025 00:30:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJNRdXSpoEy2rcqYbyTvlKDSh7WSgO7Rj6FatditdjU=; b=hf6Q2XMHawY4eOt16Is1XmchGv
	HgHcwcHEz/jd+QXp3XfoyosZPK6YL1hJMMm3fmoPsPunuD48cKyTpz4HHe06AC3AbuZVC6yhnTzzk
	B+CleOYNsWlm1S6lprhqHk32x9xvAjqucFPwDr/4dtIQsip/DeQO4M+htVaUfCwlJT6M=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3MOO-0007zQ-Cd;
	Mon, 29 Sep 2025 22:30:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1v3MOM-0007zB-GI
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 22:30:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=chzYpniA7apEshp/WQbt/JkeQo1riVk8VD6sxRZ5t+A=; b=kEGyrRWD8PI8m+kPvXjGql3aLY
 hbdrY0xqfN6p5eeUZDJG0HTpexSVEXbR21zz7GY9cJ8GjEhVgeFoPJbvVgELwOj/L6gLC1hisB5Gd
 W3uSYGnog0idzU+gTWaW50Ao8syOpSY24xYCUHEvLlaUCAXhwe+9HmvVFAW48k5Nyqb8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=chzYpniA7apEshp/WQbt/JkeQo1riVk8VD6sxRZ5t+A=; b=NgdrqL7WqX8YbpJNUlWwcQVm8C
 Of0x8J7ffz1ZyAHUs0iUDXWdkPeJ7A+fvVq3TqV29JVaP3flYVxx75lUjIO0F0ApWQw/u/n20Js/c
 gJwTlcrZ7NgFn+9FhHC3UWRePJaRZPLbRzBJt2H3AT6IIY9sVp2jPHSnqqsvqVTVDKao=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v3MOF-0005Ng-UG for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 22:30:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 94166488AC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Sep 2025 22:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730E5C4CEF4;
 Mon, 29 Sep 2025 22:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759185029;
 bh=r/6eQ4xAfKw7QHXF/YCZUxGy7DBiUINaTSM4hQEn4z0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=M2YChlgfWXGdg06vduN1JrCokTYZ8ScAMft6ncK+4R/M2HC/iyOKMQgUQg3BsQgvE
 OZ+NpLanNEmvnB+xP9EyEnRzgqlcKtR4fsA1ljICspHEeZLRRzr8BMIDmg5yd/5jaE
 tTo6/VxHiaruEbJchfHUYH/Gk6gppWK2k7VSwhR1OJ7bbmBibEKK7lpxbGoF1jC5Ak
 EC9NJjhAyMdQvTtUGL69emncKQz+00LQWz0NLpJvgq+E/VwkaPX9DRVX9ACy5L67tM
 mZMi1J7ETg/6J/4w1uwi0B3e4PTiqc9Hqm0LNrPtnUqPCFMYeuVEmT2h2k9iMqJ6/d
 okdAgEHYrjdPg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33B5F39D0C1A; Mon, 29 Sep 2025 22:30:24 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175918502299.1733438.14091327351810942619.git-patchwork-notify@kernel.org>
Date: Mon, 29 Sep 2025 22:30:22 +0000
References: <20250904181642.3879283-1-jaegeuk@kernel.org>
In-Reply-To: <20250904181642.3879283-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 4 Sep 2025 18:16:42 +0000 you wrote:
 > FUA writes can be merged to the existing write IOs. > > Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> > --- > fs/f2fs/data.c | 4 +++- > 1 file
 changed, [...] 
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
X-Headers-End: 1v3MOF-0005Ng-UG
Subject: Re: [f2fs-dev] [PATCH] f2fs: merge FUA command with the existing
 writes
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

On Thu,  4 Sep 2025 18:16:42 +0000 you wrote:
> FUA writes can be merged to the existing write IOs.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/data.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: merge FUA command with the existing writes
    https://git.kernel.org/jaegeuk/f2fs/c/44749759d5e6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
