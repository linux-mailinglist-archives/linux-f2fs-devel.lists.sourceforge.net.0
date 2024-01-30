Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF04842E34
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jan 2024 21:50:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUv45-0003yN-Vc;
	Tue, 30 Jan 2024 20:50:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rUv43-0003yG-38
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jan 2024 20:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jag8gwET+ui9YlCNHVwUmvwrwQYwuC4AWM9bdKeWWu8=; b=GCRQ+wZIu5rlih5+dPd6zh+e26
 WaiJ/VAlIcVvHLJWgO+QiOJ3uZud1dUPNTnFe8dMfYwHcQDFp1q3KVPVLZ4N/wdZFYFtQh0Sd1iG4
 Mn33BAI21PghbdWXYuLjtSwBU/HLzuFGJCPQCgfXp+ek2Ftr5cIP/vHROC6eupjgwJSY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jag8gwET+ui9YlCNHVwUmvwrwQYwuC4AWM9bdKeWWu8=; b=E3+Rb27Q2ohI+8ZcetgnwQ4hbq
 QkHBg5aWduZYoJr8+meFDGVUeWIxTTeFLiWumCeU5n3zGZ2SraVxlaQ9n95cVQ93+H46Yhc7pMDic
 epG2yUgHoljhdwuzF7r8Ueze+H4goy2WAAmL3z8XqSThSUq9V6LTMrzZO/KoPcd1U7P4=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rUv41-00016m-MG for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jan 2024 20:50:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 990A0CE1CC9;
 Tue, 30 Jan 2024 20:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D971AC43399;
 Tue, 30 Jan 2024 20:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706647825;
 bh=K25gE3Wo83qSLGvuRVPDt9LO7PHsrUC7qYhPro/+GL0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=pK46OP+WvaAEiZ5z75KHNWIrKHOSpbGy6i78zRrrycyDzu01qoBtQ72XYvwPefB5y
 Ki1YQgCByViYH0BWGHkBQHNqOOHTYLqckKJr0+jKsktktFmtoTv8C53lRZ/ev6ctDT
 YXlGRiG15/Cru6ABhq3gxIGiECAbn+kdKplkKWzruTJZRcsU5u202MUKdLxQvTUVqg
 AsRDCKpI7Ypl2yD+ZXZfvlgcGiBzt+41g+RNfFuVTOh7mfWsxiC4bi6PjxMWNGv3XZ
 ok6cnzY0HBWFt6s6XiDaJt69hpBhZb1tDr/9pKVU/hkEhrFs6EmOuiJGjOd7/pFNUz
 IzkqZiq7MNg6w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 BD10CE3237E; Tue, 30 Jan 2024 20:50:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170664782577.32692.11682898649135634393.git-patchwork-notify@kernel.org>
Date: Tue, 30 Jan 2024 20:50:25 +0000
References: <20240124144915.19445-1-chao@kernel.org>
In-Reply-To: <20240124144915.19445-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 24 Jan 2024 22:49:15 +0800 you
 wrote: > During recovery, if FAULT_BLOCK is on,
 it is possible that > f2fs_reserve_new_block()
 will return -ENOSPC during recovery, > then it may trigger panic. [...] 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rUv41-00016m-MG
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid potential panic during
 recovery
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
Cc: jaegeuk@kernel.org, zhiguo.niu@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 24 Jan 2024 22:49:15 +0800 you wrote:
> During recovery, if FAULT_BLOCK is on, it is possible that
> f2fs_reserve_new_block() will return -ENOSPC during recovery,
> then it may trigger panic.
> 
> Also, if fault injection rate is 1 and only FAULT_BLOCK fault
> type is on, it may encounter deadloop in loop of block reservation.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to avoid potential panic during recovery
    https://git.kernel.org/jaegeuk/f2fs/c/f31438c16879

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
