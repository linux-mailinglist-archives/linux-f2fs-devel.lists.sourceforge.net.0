Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94940CC5016
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Dec 2025 20:23:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ryIuicHfSQuQL/PyGqAA3dJTjtbnxXX5oS/nx7T6m8w=; b=eOvc3n1mdG0Mtxh187IEfEk+sP
	wd7iL9viFKrwLb/vGO+cQx5BG6BjjsP6XLZF6qZo9AzRHULycm+pKC/6hMbVwYGZCXu5DLCQtSYZ3
	9QJd3xUL3vTJ2QWQf3tTbGharykK80/EDGUNJgL8darmfkZ64Vq9Ol8JtJGAOh7+8Lbk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vVadt-0005oA-9f;
	Tue, 16 Dec 2025 19:23:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vVadr-0005o1-Bs
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Dec 2025 19:23:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uq36z4OT+zk9AwKW4pfPus2dFCRJTUxeRGlb3BTfnbc=; b=m2mwhTDghuUj9NqM5DpiG25jef
 fc6cDOcsQ3FVZqHGQzxKPZ49Ahx1MMuC9sYrjf0axZXtynHBkvzfsQSzFgLtN2uQvJ7m+AzeJEMyK
 KOkw/Yq/xOQI/c9EOerxkHhkSSJ36j8a7PKldazAJb++otul5jjrbggV5eZYURgOR6kc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uq36z4OT+zk9AwKW4pfPus2dFCRJTUxeRGlb3BTfnbc=; b=IV7YGhPrCpLBOw5yqko/1274cd
 VpGSTuvLs5MHkfMzmq65fm8W7sWLNNOP4Zde0klgLopdNhY38BjCE9pYOexYyEt3klzR+CYQwC6Yj
 K/eimJ1d00ylENYAjDXtRS//0Tz+TBl8rDrI+jt70iPxaG3czzsGt7ji5kZeRuk4NObE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vVadq-0004nY-SV for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Dec 2025 19:23:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 955644428A;
 Tue, 16 Dec 2025 19:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FBAAC4CEF1;
 Tue, 16 Dec 2025 19:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765912996;
 bh=fC7id54LkGoKR7GnG+/WjLUSsepuCuq6iRQ+++y4FKk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=LiJL0SacjbC1c/+NmVYDvJzuXzBCvEapV9Qn8AYhjWqAhybr/swqNwcdFRl5FHYdz
 gOhv05S1FcFWf0XdFffrWI2DUIULPYlU3tzB7ldOaG5tav8znilSJw9eW0zBiHDNVr
 pcWaofKBsfviUnS07YRckkZ5+FPeCwBNdoQv54F6MAysuusyherXLW/HuMcT6MJfaI
 /xgB4GXnyqvEJ5du+edENQGlWW+3xMyIqpaPqp8b2m3BEWrSwZNnOXifo0PeJ0sS+e
 XfBC0b8cfI0HpW73jqs7FAkEb5ARfjdj78p2ZFWJ2IdWuhQbqi88GrEEmNUMgfSK0U
 j1ex5qtGYcQlQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3B7B03808200; Tue, 16 Dec 2025 19:20:08 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176591280702.1247282.1033511885316097703.git-patchwork-notify@kernel.org>
Date: Tue, 16 Dec 2025 19:20:07 +0000
References: <20251212084034.2878836-1-joannechien@google.com>
In-Reply-To: <20251212084034.2878836-1-joannechien@google.com>
To: Joanne Chang <joannechien@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 12 Dec 2025 08:40:34 +0000 you
 wrote: > The check for enough sections in segment.h has the following issues:
 > > 1. has_not_enough_free_secs() should return "enough secs" when "free_secs
 > >= [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vVadq-0004nY-SV
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: improve check for enough free
 sections
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

On Fri, 12 Dec 2025 08:40:34 +0000 you wrote:
> The check for enough sections in segment.h has the following issues:
> 
> 1. has_not_enough_free_secs() should return "enough secs" when "free_secs
> >= upper_secs", not just structly greater. Conversely, it should only
> return "not enough secs" when "free_secs < lower_secs", not when they are
> equal. This accounts for the possibility that blocks can fit within
> curseg without requiring an additional free section.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v1] f2fs: improve check for enough free sections
    https://git.kernel.org/jaegeuk/f2fs/c/4a210a5be279

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
