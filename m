Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B12477C1BA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Aug 2023 22:50:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qVeWH-0006Di-JJ;
	Mon, 14 Aug 2023 20:50:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qVeWD-0006Db-UC
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 20:50:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oVVisoy2KXcdfc7aLsxhLWACkadRHQlbIxUbwExIHK8=; b=MzUUsHxdwde3J6XKPdltoVJYe9
 6LOmzh6UiWWWNvUp+AaXy8CrYZEU0hym/wyoAuuvzbfo0J5q1SQoMHksja9oF5sonEnRAMxg0S0BD
 v31ZzoYGVCAPFUnvMzEgkScEnZ2lGhhll+/RQUVQldPbTqYv/v1SQeb461XfG821sp9E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oVVisoy2KXcdfc7aLsxhLWACkadRHQlbIxUbwExIHK8=; b=PY9YGsUWQ7qGtFWCw9a6skhQoI
 9E9FREI/M60F878noFKBcBHCGvm1oGYWrMT9TI2kR9BKysIaOS+BRE8vPGuro+gwqCa2qORbpzJs6
 UaP/YAmimDpUWp1HtY6P4vL/LCZAJs9NA2vJLf66Auy2955SsZNiikiZ+VXRvxNrhFfc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qVeWD-005nrs-AY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 20:50:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 80C0464801;
 Mon, 14 Aug 2023 20:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6EDF6C433CC;
 Mon, 14 Aug 2023 20:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692046222;
 bh=bP6JV06tZ8YXN25wmMrcygtUZOf8dcGLxWUEUOKKt5w=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=gIqRE4KWBT3HvogOpQKUllrNRCdwMLNs+VMqlkB55l524rKMLlock6sx1idC6coRF
 7Ja9oCysYMUz8kcy6V6IkXiy3PmplRO9AHutERmsxd03g3jHBXHTux92vNVGJZGBX5
 Nf5OiNpzAWQh3Ci4kbwzvgLe1rfG+W/T0Cl9imeU8BOYcmy1Khyb+lP76zXu8/keU3
 F3UDtaMYXVV89s2Md+AbrZICYrahLnkpI3PzqmpD/iER661/9BaGTcLRuc/TPR6NCa
 1mjOLeUczfimTpF8c2pXug1XJa2TNG/O0Od4dYDmICrUccGMAPN0fS+9Nt2cg+WivT
 ni3nwyOSDNwqg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 4CD3AC395F3; Mon, 14 Aug 2023 20:50:22 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169204622231.5033.15990089424023133670.git-patchwork-notify@kernel.org>
Date: Mon, 14 Aug 2023 20:50:22 +0000
References: <20230803142842.29062-1-guochunhai@vivo.com>
In-Reply-To: <20230803142842.29062-1-guochunhai@vivo.com>
To: Chunhai Guo <guochunhai@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 3 Aug 2023 22:28:42 +0800 you wrote:
 > Now f2fs support four block allocation modes: lfs, adaptive,
 > fragment:segment, 
 fragment:block. Only lfs mode is allowed with zoned block > device featu
 [...] Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qVeWD-005nrs-AY
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Only lfs mode is allowed with zoned
 block device feature
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu,  3 Aug 2023 22:28:42 +0800 you wrote:
> Now f2fs support four block allocation modes: lfs, adaptive,
> fragment:segment, fragment:block. Only lfs mode is allowed with zoned block
> device feature.
> 
> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
> ---
>  fs/f2fs/super.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: Only lfs mode is allowed with zoned block device feature
    https://git.kernel.org/jaegeuk/f2fs/c/2bd4df8fcbc7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
