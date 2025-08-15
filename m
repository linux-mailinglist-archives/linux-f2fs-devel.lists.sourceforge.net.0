Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 913EBB283F8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Aug 2025 18:40:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sL7MJu6i5am3KQoq0XHn0WZbsF3AQInvCEd0jBMplTs=; b=fMusQliGpBbhuA5ykX2fKVlpd0
	fmqlYQEieVXHAEMGFcN1LFChP0aXeHxGPKh8LFoRtrEpfhx9iFgZbsg4wHBldiXfmlwBq6c284xXZ
	Gk5rroa2iv9TCdLAEGdvow7njWnvJk6u162xBttLxGao7RZv20qaPaAt4mewsUQN9f4Y=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umxTU-00013B-ET;
	Fri, 15 Aug 2025 16:40:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1umxTR-00012s-9q
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 16:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lBDlBcfPqNki14Lps0Emau/GRFX9Ae8gXHoofyf5LNQ=; b=jPiGtDE5xvLCCdXPavShTi6w89
 gWjNzyxf1cbPckm3skfBYkp7YnPpWMrgBet4StrGKUERTYkw7SFy7W0q0jo+19es2eL83g5xMA5Zf
 Tr14YtS63fFdk2Ln1S6ZpiuR0cL2FvHH5bCU4hFBuaefEJHgtufnkWz8RZ8D77UV1IfQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lBDlBcfPqNki14Lps0Emau/GRFX9Ae8gXHoofyf5LNQ=; b=Qy+q9u5XU56LxIMIa6xSHDGqat
 PdEJoDirrtpnAXMClBqrlqva7BU8JvhDcVOkPkQi0vU56vTxk2HNubIHaPKSBbkRu0HReQn3us/q0
 AOlyk5dgG5VM0AFznsFEdc7zV57jLabaEVTqIibs0POqMMSZrYfgstlObCfyXg8A9GxU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umxTQ-00018Q-NL for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 16:40:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 584BD5C5496
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 Aug 2025 16:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26736C4CEF7;
 Fri, 15 Aug 2025 16:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755276007;
 bh=S1ZmvEXjwv258ofLF72c0v+Zz594gSNk95FiMJ1gzP8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=oVHlx27YHSwXBrpYAcHK3BykupW5vDbkDkVI7BNOc3OCslrC9cKrVlYc29Sh2bpqi
 oG1k4W0a8eFbGaOFXHCJjPCDZChSWVpgw4urY9sBPhwPjzUDpGlaZYl8sWRNAquf8u
 5ZutAqcPRz7yxN4ju5rCABm+2Lh3oaHH/b4I/aN2K5nKhNueqkP8Kr2wSw5F+ZSWdS
 OtidMx9DtTIsV/czyU3SAxMXiDJK56rnbcGQDz4cAIVg9XO+MyObcwYYkHdFVZY87R
 i5xG1fGW4EVNK9PXCQDJqH60tmBAXqL6lf2CX1eAX98RybwPELT8QhAhb929d47x7u
 x4AEX9+eMV92w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70B9439D0C3D; Fri, 15 Aug 2025 16:40:19 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175527601823.1161945.11181817879105775454.git-patchwork-notify@kernel.org>
Date: Fri, 15 Aug 2025 16:40:18 +0000
References: <20250731060338.1136086-1-chao@kernel.org>
In-Reply-To: <20250731060338.1136086-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 31 Jul 2025 14:03:38 +0800 you
 wrote: > If reserve_root mount option is not assigned,
 __allow_reserved_blocks()
 > will return false, it's not correct, fix it. > > Fixes: 7e65be49ed94 ("f2fs:
 a [...] Content analysis details:   (-0.2 points, 5.0 required)
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
X-Headers-End: 1umxTQ-00018Q-NL
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix condition in
 __allow_reserved_blocks()
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

On Thu, 31 Jul 2025 14:03:38 +0800 you wrote:
> If reserve_root mount option is not assigned, __allow_reserved_blocks()
> will return false, it's not correct, fix it.
> 
> Fixes: 7e65be49ed94 ("f2fs: add reserved blocks for root user")
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/f2fs.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: fix condition in __allow_reserved_blocks()
    https://git.kernel.org/jaegeuk/f2fs/c/e75ce117905d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
