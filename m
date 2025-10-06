Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EB4BBEDF2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Oct 2025 20:00:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5iur/d120yImXljbIVmRQopVvxsYufip0c1sG8dOPg=; b=TPfRjuQp6vVr+7TfiH90Wf+zim
	ysNBWk98ojyEFMzUwgSNaZtGddE1efrCsCV284aMbmGIrF8GrrpeDkDAiRF9Txi7abANU/XfNoj/W
	yEfP6bGrZUX8PH2PJLElf+hDIhmHEy09DNqaTOAFbpM3bSqBMxt4+JV32AvGy/Z3LZco=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v5pVc-0001pP-DP;
	Mon, 06 Oct 2025 18:00:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1v5pVb-0001pC-2V
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Oct 2025 18:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yT9r8Exp0PxwG/jWE7FissOSb7pRHm2tAy5/mrM9e3Y=; b=WOWS09jPrzGOVwGTORU9jCA2IQ
 PE+95T+U8ZmfUyLg9Oaot4wXRU3L7gOgC/jsoeWGmTU+eNy0LKnNaZICmLrvfaK634fKA9KdYCs09
 S76syZO4gocFObREsDSkngxnt7ok2mVpeB1G1ilkHx3pWYZdxIk8pBSTHMxYdUCZqgOM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yT9r8Exp0PxwG/jWE7FissOSb7pRHm2tAy5/mrM9e3Y=; b=WspgDn7zhYZ//s0XNr3SnIHE2l
 w13wGpQaqwfOnv89q5RJLP5axlid157O74rr8ij33GiXvI56l8jXSPm2bnSstp2dYWWGkgarRklgu
 Tv7r3iO0BrPHcR6dgoKl/igLJgHhoCoWgEWBrCWfTs9u+Gd7TGGtjOWqda8QiQI5irHQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v5pVb-0002xJ-Bp for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Oct 2025 18:00:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 03BF644659;
 Mon,  6 Oct 2025 18:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D087FC4CEF5;
 Mon,  6 Oct 2025 18:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759773616;
 bh=4oQM312+pd6+1kpC4XhmpsurK9XSGqTTsWN0CjZ8lq4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=O2yuGutB4qL5lsb4SdXQAtzJxblp7OLs5ozdOvhZYN3EEd27ojLWaNCTVyYL4eo7X
 NRX8fL7Yvj6ODvFH3L+keK20OWxGZEIasa2yEcp7qpsm2iJc+omRu4PEznFN0Wieo4
 dbDgNz0D2x3kIJq/foX2Zlht8KGTkYklOft0mekxFdKV0hb5fUWZQsJDtCcoQaEFL4
 /MK1omnuizEJm3aanHWZ26UllzGSAok1o0oGINyA0XcpO+KVpP8MMlvASsGqb7/Zrl
 egY2pfpFi8Xbm1GYBJSjK8/12SgnStNjcdaWr6ltXlnwYaY/vewT44dmjNrcaZOwGX
 HLQte2R/SgXlg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE17839D0C1A; Mon,  6 Oct 2025 18:00:07 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175977360652.1498132.2436692293138075252.git-patchwork-notify@kernel.org>
Date: Mon, 06 Oct 2025 18:00:06 +0000
References: <20250930232957.14361-1-mjguzik@gmail.com>
In-Reply-To: <20250930232957.14361-1-mjguzik@gmail.com>
To: Mateusz Guzik <mjguzik@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 1 Oct 2025 01:29:57 +0200 you wrote:
 > iput() calls the problematic routine, which does a ->i_count inc/dec >
 cycle. Undoing it with iput() recurses into the problem. > > Note f2fs should
 not [...] 
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
X-Headers-End: 1v5pVb-0002xJ-Bp
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't call iput() from
 f2fs_drop_inode()
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
Cc: brauner@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 oliver.sang@intel.com, oe-lkp@lists.linux.dev, josef@toxicpanda.com,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed,  1 Oct 2025 01:29:57 +0200 you wrote:
> iput() calls the problematic routine, which does a ->i_count inc/dec
> cycle. Undoing it with iput() recurses into the problem.
> 
> Note f2fs should not be playing games with the refcount to begin with,
> but that will be handled later. Right now solve the immediate
> regression.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: don't call iput() from f2fs_drop_inode()
    https://git.kernel.org/jaegeuk/f2fs/c/8ec5fc1ff77e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
