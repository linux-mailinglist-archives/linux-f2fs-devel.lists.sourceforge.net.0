Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0A29C0FB1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Nov 2024 21:30:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t999b-0003ig-GM;
	Thu, 07 Nov 2024 20:30:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1t999Z-0003iT-Ha
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Nov 2024 20:30:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nKDeNO4ykpuyCIbU6bCGvTYyBmUr6fiGc0QzzTkKbQ8=; b=MOd8D6t0NFILNSuN434vFpOklM
 A8FtnWKLePjfk85vp7tGhFCVxw3Er7TsKjTtIJXUu44wfeceuuUIvnQqxuhf76KNfv3B3TXF3nQFR
 X4I7Ch4qiIp1vhYQ84nnuK0Qa3ASyfn/xvy8x42vVv5B3vS6E3iYLHuFnhnwDv34wm88=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nKDeNO4ykpuyCIbU6bCGvTYyBmUr6fiGc0QzzTkKbQ8=; b=HzgtcMpU1Os/1Es4jJWf33jkFA
 QzicsKplOvTEcmd5zeEBLwM1vpp40s+XkeSRnHbsnByau7s8S5ZCIIwfjJozh9BQJY5m0XxMnzFLx
 cnBBNFGPr4o2Lh/Z53oBHbE5yDcd+DyAs5IPKFLJrldhC+FOtmgxYjgBBznp3+yb2NL0=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t999Y-0003uu-Ar for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Nov 2024 20:30:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D8F8EA44AF3;
 Thu,  7 Nov 2024 20:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79500C4CED2;
 Thu,  7 Nov 2024 20:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731011441;
 bh=oMNVIUV/2gXhGO79bi7zyHi1FsI92hW8uiqK7Tr2Auk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=YeWlLSPcfjgqht+Fs+T23njhbpo3W024B/jzsk3qebOodvIdtB64fSqrbXS2ElzhP
 GhQRmcVmORIplFZcPa84XNeR5UnxfZOMYj1oYbYPxv8V2Yfb9d4l/HJ9OiGKASXQTm
 bOmGt9lifToguuEkDEBo78PbPKekanvZztI9jkbPKH1hSKg2KTr8kwnhDTPI0miNMr
 g+tzrI3UW2S/JTQRnPth3YgGVHqjgiCH6t5DBfshOYBthcDrvvcNQelMFJpnpaOcFq
 T2GPVmgw3oJo6keQeLISE+iy4O4Qp9wXejY/KG0RKI7uJIjujRjmk71AOAggaR+iYx
 YYN38z4G5ry1g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB8303809A80; Thu,  7 Nov 2024 20:30:51 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173101145060.2084993.9827116469526913562.git-patchwork-notify@kernel.org>
Date: Thu, 07 Nov 2024 20:30:50 +0000
References: <20241029104907.310781-1-weilongping@oppo.com>
In-Reply-To: <20241029104907.310781-1-weilongping@oppo.com>
To: LongPing Wei <weilongping@oppo.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 29 Oct 2024 18:49:07 +0800 you
 wrote: > additional_reserved_segments was introduced by > commit 300a842937fb
 ("f2fs: fix to reserve space for IO align feature"), > and its initialization
 was d [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t999Y-0003uu-Ar
Subject: Re: [f2fs-dev] [PATCH] f2fs: clean up the unused variable
 additional_reserved_segments
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 29 Oct 2024 18:49:07 +0800 you wrote:
> additional_reserved_segments was introduced by
> commit 300a842937fb ("f2fs: fix to reserve space for IO align feature"),
> and its initialization was deleted by
> commit 87161a2b0aed ("f2fs: deprecate io_bits").
> 
> Signed-off-by: LongPing Wei <weilongping@oppo.com>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: clean up the unused variable additional_reserved_segments
    https://git.kernel.org/jaegeuk/f2fs/c/1df2bc3c8252

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
