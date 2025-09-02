Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFD0B40E7E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Sep 2025 22:20:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aupur+hN/T1LOwa9bu2oI/rIM38LEBTy/q6emykEtbI=; b=YBfZlfo0vMHcXisjV+p+5WdAEh
	aROOOkPxxWLpzUQ6nEtcuzcPGlYkRzqEmTnlnuJc+rscgHozEqsz2ofs7EAw/lNw/zpiU6tM9KmWr
	9+MILGiyd4ylt4b8JjxHwuvF3lVA0ogv3vhk+j55yAKdWQ9QQmJXHo3+HCACqetlNRVg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1utXUI-0003aD-MX;
	Tue, 02 Sep 2025 20:20:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1utXUG-0003a4-OY
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Sep 2025 20:20:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wA2VhuySUKdAvnvNMNxdiJx9ISXDlpmTHfBmHwHdNA4=; b=YHVM6S5lE4LO7hqyDao6TROWor
 VrxjCY2cHpZAOlm+WG2Im0TKROLOuNatbc+08Jfs/mn1WZmlwcvDXkBidMUaGvA3WkY3NSXtlPxJu
 Sj858VVriuEyvsIPR8f1DwrQpWzvBlr2FtRWMnkpcuK41IzdNGaWPYMxovy/8Lp2QV9o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wA2VhuySUKdAvnvNMNxdiJx9ISXDlpmTHfBmHwHdNA4=; b=a++PuOrGCoH8ffrlS8ozv8a6wP
 guUbwnWfK/RK4fKWUht+zRbxu2JnrdIRiTbE29g4cvGok2cxYRMaEZYghEkd5Minz82v3X4ZEwK7C
 yPpK+fgx5d5Fvj5Igsd5XJmlHxe4Yn7a5vfV/y9BhVy3rE4K9M+u93irUBlgZVF6h7S0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1utXUG-0004B6-9i for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Sep 2025 20:20:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F403544BCD;
 Tue,  2 Sep 2025 20:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D333CC4CEF7;
 Tue,  2 Sep 2025 20:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756844405;
 bh=a5xpJDyI0ZmkMroZh29UOG676SY5u7SLb7dCmmTu9+k=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=NmiWcB3IHJz772F5DpEGAcas6VNa8+Fkz0cWwJYTpPsFHcdGm9LSKNHOT3E6sljHG
 9Zw3hiTzj1Sa7/U21AivFGIehnF5jo6I2tg7sAr45YzdSWJHKJ2mHivBuMk5bM523X
 ne69b7UTaXNzWbop7uiYb+ia3Wk06CpVW9Tbgmss9bLhpVdnw7XSebvlVcWNKT2vGr
 5AVcI7xZUBTQex40S6s2qga/6M4+cRW4bTjZveK9lRoCn2Xm4onDs46f7EqUIqoQXI
 Xg9rdM8gt20ZNilLuhvmUCTSTBZ58wLAFi12s1CNuAHHIwqyXa5HShINl8+pKtmN8O
 9AbSPRBAERtGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 72A5A383BF64; Tue,  2 Sep 2025 20:20:12 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175684441099.425353.9345467792269228265.git-patchwork-notify@kernel.org>
Date: Tue, 02 Sep 2025 20:20:10 +0000
References: <20250828081130.392736-1-liaoyuanhong@vivo.com>
In-Reply-To: <20250828081130.392736-1-liaoyuanhong@vivo.com>
To: Liao Yuanhong <liaoyuanhong@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 28 Aug 2025 16:11:30 +0800 you
 wrote: > Introduces two new sys nodes: allocate_section_hint and >
 allocate_section_policy.
 The allocate_section_hint identifies the boundary > between devices, [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1utXUG-0004B6-9i
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: Use allocate_section_policy to
 control write priority in multi-devices setups
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

On Thu, 28 Aug 2025 16:11:30 +0800 you wrote:
> Introduces two new sys nodes: allocate_section_hint and
> allocate_section_policy. The allocate_section_hint identifies the boundary
> between devices, measured in sections; it defaults to the end of the device
> for single storage setups, and the end of the first device for multiple
> storage setups. The allocate_section_policy determines the write strategy,
> with a default value of 0 for normal sequential write strategy. A value of
> 1 prioritizes writes before the allocate_section_hint, while a value of 2
> prioritizes writes after it.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v4] f2fs: Use allocate_section_policy to control write priority in multi-devices setups
    https://git.kernel.org/jaegeuk/f2fs/c/b639c20e748c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
