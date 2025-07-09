Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5811AFF08F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jul 2025 20:10:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6qjaeGboscDAjYkj/i9mry3VPpFNsiHC2q05PZLgbU=; b=L8sjm6bvyNBCCpkvs/UAiLE4yX
	YdV6cNa3tGY/TuYLdCc6+akEoI5qnVNrxRGV/cVE6SNGayK85VcXmSwAfTa5STMUJxPZE8fbvP0g4
	hmchJwu3yaerE6MpL2tfhdjARgKRoVQJvU3drVOJ8QgkZafchZOivCd5AFHhiKil1EZo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZZFG-0004wz-Nt;
	Wed, 09 Jul 2025 18:10:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uZZFG-0004wq-0b
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 18:10:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=igLD/fGu9GBIGP8Bk3Dud5eVxKN+8gaHE7PsgUnW888=; b=loq7R5CHuAGDf1apFk7HECaLfX
 ejVE2nKZIUz2Wa1UEy4udmQoatP4uvtPmB142ZEL3xC/mcTx6ozQsB9Pqv3uY89Y7novF0q6Orcif
 UsxgSVuFhuPTxNHVnEx6oX+/ncfwktWjAY16Ctky4ZNBUAhk28KKpRZeyAyuknt9h5rg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=igLD/fGu9GBIGP8Bk3Dud5eVxKN+8gaHE7PsgUnW888=; b=BIIrrtDk4tIr/gGFX8Wtk6Q0Lz
 aoKfdFDIxSToU0cY6fp5GdzKWr1zZiLBN0k/f8b/3Ez962prnLvObucqm62h0X0WI/M0Apoz24xql
 rJNwopYd49CTlSRsc+/rq5Hu6mmVL4hzDupzAyCTPCA2NmunwR4eN0M4B0+2Iwp3AckI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZZFF-00015N-IA for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 18:10:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0279B61152
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  9 Jul 2025 18:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86B1C4CEEF;
 Wed,  9 Jul 2025 18:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752084602;
 bh=cRd5nDEBswJD9NlbHfNeBwVC3wA153yJFbPNFqRPhRs=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=MA7ya+4d4pfK2Fi8Nb2pLvO9mIA2gA2618IYFXoapepeV1QN1QVBJvP3tsv/gDj5p
 D8crhBu5PsCUpWTghsYhlUMn9g4bMqqUnMQajH73bFIXPtwPjbJX/g5UqPJ+G8wTqh
 w7DOVUVhOxDutaE3HqmaZqT7QAQwL/E8bnNk47qUd8YUyn2/m1JDOpo7k9lcepS93x
 Y6V5k+x2/7O1RSgeeSautuf2kZh3TwV6WQq3Fc4qyQt5kJ+n4q9SGLQNzITfJ+zZ1U
 9U//y5Y+ElV9b+3iF8M+Pbr991IJvotZD9nk9qlZKOpl6CPdWUSuYBU+FnECiuBdNV
 0ntRgp9l+zVVQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 714D2380DBEE; Wed,  9 Jul 2025 18:10:26 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175208462500.806926.7768132731103945108.git-patchwork-notify@kernel.org>
Date: Wed, 09 Jul 2025 18:10:25 +0000
References: <20250708095657.3081188-1-chao@kernel.org>
In-Reply-To: <20250708095657.3081188-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 8 Jul 2025 17:56:57 +0800 you wrote:
 > As syzbot [1] reported as below: > > R10: 0000000000000100 R11:
 0000000000000206
 R12: 00007ffe17473450 > R13: 00007f28b1c10854 R14: 000000000000dae5 R15:
 [...] Content analysis details:   (-0.3 points, 5.0 required)
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
X-Headers-End: 1uZZFF-00015N-IA
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid panic in
 f2fs_evict_inode
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

On Tue,  8 Jul 2025 17:56:57 +0800 you wrote:
> As syzbot [1] reported as below:
> 
> R10: 0000000000000100 R11: 0000000000000206 R12: 00007ffe17473450
> R13: 00007f28b1c10854 R14: 000000000000dae5 R15: 00007ffe17474520
>  </TASK>
> ---[ end trace 0000000000000000 ]---
> ==================================================================
> BUG: KASAN: use-after-free in __list_del_entry_valid+0xa6/0x130 lib/list_debug.c:62
> Read of size 8 at addr ffff88812d962278 by task syz-executor/564
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: fix to avoid panic in f2fs_evict_inode
    https://git.kernel.org/jaegeuk/f2fs/c/a509a55f8eec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
