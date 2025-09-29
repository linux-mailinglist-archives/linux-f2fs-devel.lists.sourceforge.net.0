Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B12BAAB11
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Sep 2025 00:30:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46T82IHp6fhtSVTKC6OjiwSQZDiktRIRXhAqHNvDkZw=; b=BIXhW6D4YoSaPfvUFtAcAt1N0G
	/bjiPk/2opYEhXF8cfCl3739S1mMiMKDpSVsJu9K+riSRQf+rMbF2FN2FtM/yekCnLuH65rhMpwtB
	gkBJ1DbbqRsj/DA3a3XPJJ9jRdOhZ+E26qXAwxml0BZI+38RhxAEB91WM3LBgHk6kP1g=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3MOP-0007XG-GR;
	Mon, 29 Sep 2025 22:30:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1v3MOM-0007Wx-Gf
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 22:30:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aT5YN10rlCrtOeWzL/wwrb6ufu8a5Wjd0whZpiyhXu8=; b=KSCb+ycbGf+t5g7XUeeakbyPB4
 jewsA8XuXEbW8X1FH6IsNWJ7/12yUoiK5FYBqUGr5xcJgrs2NHP+SGa4Q+56rEP1fGP1e5sGHUbyi
 ZGcBJtLurmz2BY3W24GiOTxXePOejOgLTs8JNd9nS6jlNp8pnRq+YtEydUHiLWrk9kLY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aT5YN10rlCrtOeWzL/wwrb6ufu8a5Wjd0whZpiyhXu8=; b=BNNTtJ9Cwu+m9thrKBUj1v12rH
 pjDaqlMzVjFls3zxNloFHXno6n3yEEK3azV0zNtJzeBh01JS1zXMF/DwQMkyYHVELOs9hzK2Mpvcv
 k4Wxs4QHxC38BKITU+q3zOPLf71M9juJIx/lAoGJ3HO433HVMyNlkJFHTusKWOerAWL0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v3MOF-0005Nb-2o for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 22:30:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 857D66025B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Sep 2025 22:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A57C4CEF4;
 Mon, 29 Sep 2025 22:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759185028;
 bh=07u/WUF+ys2ZzKDNaEiodqR+31ShOCgxlIlySpsJCnw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=S/OA4gzNOhLtzSUYJUUfP9jTQMNhF4MsRiMycK8dHxNb7ZEDivGmb9nIeG2epK6+2
 1mK+gRIZeXb4SzcdDxS4KVlqB4rf+9c+z6+R0EErW0QOyCJ892oKu8HYXWfx20fZk6
 VRB8myVL1XnEIbty5hKJnEOj3NThqJ1yiHIXTNC4t0wxpafhtHmwNgcUH+KIsw4JVW
 rRlZ+g9XmoY9zDs/nLBfzWtGn/lty7V9i1TCfsqtVPpudGO4iSWuPzaGwYK6tAthhF
 R/qpdRBq9vYnX8bqU00NmOuL7XFI41RilmxFaZVhhOLFd+ctIjaONavt7XxrbDtpfD
 m0Il255rJok3Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EACEA39D0C1A; Mon, 29 Sep 2025 22:30:22 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175918502149.1733438.11140938754376368014.git-patchwork-notify@kernel.org>
Date: Mon, 29 Sep 2025 22:30:21 +0000
References: <20250909002717.829981-1-jaegeuk@kernel.org>
In-Reply-To: <20250909002717.829981-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 9 Sep 2025 00:27:17 +0000 you wrote:
 > This patch fixes to support different block size. > > Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> > --- > fs/f2fs/sysfs.c | 9 ++++++--- > 1 file chan
 [...] Content analysis details:   (-0.2 points, 5.0 required)
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
X-Headers-End: 1v3MOF-0005Nb-2o
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix wrong layout information on 16KB
 page
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

On Tue,  9 Sep 2025 00:27:17 +0000 you wrote:
> This patch fixes to support different block size.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/sysfs.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: fix wrong layout information on 16KB page
    https://git.kernel.org/jaegeuk/f2fs/c/a33be64b98d0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
