Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A25AFF083
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jul 2025 20:10:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bfDWi3eYI79vpFn1oqzWKnvE/AMqAw+SMmjUeqTkJXg=; b=HEUbO4eidtZho6xi+GNiKOsx+f
	sInti6iC0mY040TTtiyhkz3rfpjm/SXq1jrsMTri4U9GyD5cKdokRLdpyJ/aH9Fsk39E7RiMeYXaq
	vqUL1So1bY0VsMMSycqVxFbo1v5dpHtegcGgN2ige9Cs58y8WUGZdfABzHb+klRz90MU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZZF2-0004u2-Bz;
	Wed, 09 Jul 2025 18:10:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uZZF1-0004tt-9T
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 18:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uvKDtjeuE7wR2pgrTUF5WRhRKpimFnhDxpXHbhoNSUw=; b=fAIhrPL2fenYne4FdyyVASt0R9
 W6AX2cQK6LXdq4bD+6bQ4pGy16W1uMGxJO538llVHUKO9cpoQOo3LoEhCAErKsViUVUFDc7JzbFf4
 TpLO05Z6/75K/7/AKaCvQW0k4tyJSj49rrkgJU0ePmFhzfVtV7x0YVGYiv+uKvA1f27E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uvKDtjeuE7wR2pgrTUF5WRhRKpimFnhDxpXHbhoNSUw=; b=CCU6aLXOnjCPtPB+C+UQ1M2I6W
 WDRWHs85d7bF52nE2yABqNnAkFg3kPnotr7V14202GDintxUjn90khgWYFNm08DvKtaMwcpHf948C
 cr7aVDpY8JMXZnw7KFI2xaaiFURAVg48QYzEGGuNk6lG42mn7BlkICw5pfTo1FeZGg+0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZZF0-00013U-RK for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 18:09:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8EDE646A69;
 Wed,  9 Jul 2025 18:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7207EC4CEEF;
 Wed,  9 Jul 2025 18:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752084588;
 bh=BsOGMwnuVXVpxz2AP8u8d6e3+gRAhs6ZI8AQjqzy5Yc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=NImqP9NwFNL4Bfwe8gFXCoPICs82sfyFJOOHb8n6vbxwXPKSDC04ucnnVTc8NjX+B
 VDNfSSGu2zJ73+jrX3TCnLOaCWCbpXADtZMNSeJ/61gW0MXR7M5XJ1YfeM1z+UXXZr
 6zJSE3T9CKxpyZigWulmbcAAtGaf5LG5aMq2B04/L9oXIpNd8xjuZhSX87O/9t84uG
 YucrL8TFLoJWg7xJeCXjh6yisxsvTExvFmuOTAVMJD6IokcuKYh34LhX6r3TNxCXFs
 Qq8etC9DVvC8JJcpHQIeaTd7xc1BSPANgaUGguq6+07iDnkHvV/sgMBrKviEIzW9yw
 EV7NN25ZJiRAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33BC5380DBEE; Wed,  9 Jul 2025 18:10:12 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175208461075.806926.14733447162737936340.git-patchwork-notify@kernel.org>
Date: Wed, 09 Jul 2025 18:10:10 +0000
References: <20250625001408.1961-1-yohan.joung@sk.com>
In-Reply-To: <20250625001408.1961-1-yohan.joung@sk.com>
To: yohan.joung <yohan.joung@sk.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 25 Jun 2025 09:14:07 +0900 you
 wrote: > to check the upper boundary when setting gc_boost_zoned_gc_percent
 > > Signed-off-by: yohan.joung <yohan.joung@sk.com> > --- > fs/f2fs/sysfs.c
 | 7 +++++ [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uZZF0-00013U-RK
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to check upper boundary for value
 of gc_boost_zoned_gc_percent
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, pilhyun.kim@sk.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 25 Jun 2025 09:14:07 +0900 you wrote:
> to check the upper boundary when setting gc_boost_zoned_gc_percent
> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>
> ---
>  fs/f2fs/sysfs.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to check upper boundary for value of gc_boost_zoned_gc_percent
    https://git.kernel.org/jaegeuk/f2fs/c/10dcaa56ef93

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
