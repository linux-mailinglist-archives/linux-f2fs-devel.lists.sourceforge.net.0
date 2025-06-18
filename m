Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 670C7ADF8DC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Jun 2025 23:39:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gbVKdkn2TAU8AL8b5+LtJZ6HifLgNDhu1UZ6RGUMNt4=; b=dtE9/SF0x0X7medZe/BGIRJZe9
	Uh5/usS4AXEn94boxZHylAGcmQy+mK1MFVout262Sqk2xf1BuhHZ4phbOTjvumHIJwkhwaoqMZRsv
	zMn4KPtnddWEjUQaCt3Ftyk6UR1asSe2IcFuXwHZxYQNzY7a66Zz2e7yjXK/nhpMEo/g=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uS0VU-0008Vo-9S;
	Wed, 18 Jun 2025 21:39:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uS0VS-0008Vg-LO
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Jun 2025 21:39:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QeTtnF/ZRjsTdmIYNY3aN5cVl/gPFVGkDphFdlWRojQ=; b=HfiqB2qoMkLKCI/BdZZd7kmYR3
 YKzXrJqqq9yPzSkN4EgY5W+Wal8UOG5fdL6ZtNR1IDkqMVKX8w7GILFRGDee5F/gxZT7DXjMC4Ibi
 O7WaMrXsNZc9swrmrVP8TH2b1dqoQiHsSmSQ59+yaLKO5e4p2HzfQ1gf59eAqx+nIixI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QeTtnF/ZRjsTdmIYNY3aN5cVl/gPFVGkDphFdlWRojQ=; b=X3GthaSsRuaUC+bq07hns0Dh1U
 3HJJ9djewkxcXSRF4yZpNGMRQjwky8O8LlV+80MURwJtVKiALU6nezy8MLEeM1mI56TiXlHoYCAef
 DFQl5CQg1MvTKDI/eF0XDZ03y8jyTQSEK2B4mvPHhVL14kbjK17FBIn4kkvOQs1tLNGw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uS0VS-0006BR-6h for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Jun 2025 21:39:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 47C665C5841
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Jun 2025 21:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5FBC4CEE7;
 Wed, 18 Jun 2025 21:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750282776;
 bh=HCAM12Fe5DXcRBQegk/n8DQ9rGaqr48kn3TlT7cARz0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=pB6en+2cjScKzWpspCIDSmEsXTjk9ujyDZwq5Jjzrtmh2naZttLu+CitYTR5ROG4V
 0Nj30en/CTs6Esojp9Aajfz/nK9BfJT4ZVfsf+Y7ZqhYZmpraKRkEFgeEZT17PY20U
 SOc1MIbnQNCsYLyK2gpBSZqzNVGMB8x+95ZfaqmDqrqIrzGEC+U40A6ILrfpJEH1Z1
 ElBIELDwSLbj7nyPl3kDb1WdgTXeUHh6ckzWDwmGYMj+FDjADvQKj29MRxPB2NhgMY
 Y5bzmxda77v04K4IJXPu8KMgxzgpPbzidMtdiA4W7TVciSj6w88Ios47KvK9mqHBaB
 SHUC0aqLf2TYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAE503806649; Wed, 18 Jun 2025 21:40:05 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175028280475.266369.5996296776480428957.git-patchwork-notify@kernel.org>
Date: Wed, 18 Jun 2025 21:40:04 +0000
References: <20250605032633.2744434-1-chao@kernel.org>
In-Reply-To: <20250605032633.2744434-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 5 Jun 2025 11:26:33 +0800 you wrote:
 > fstest reports a f2fs bug: > > generic/363 42s ... [failed, exit status
 1]- output mismatch (see /share/git/fstests/results//generic/363.out.bad)
 > --- t [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uS0VS-0006BR-6h
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix to zero post-eof page
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
 stable@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu,  5 Jun 2025 11:26:33 +0800 you wrote:
> fstest reports a f2fs bug:
> 
> generic/363 42s ... [failed, exit status 1]- output mismatch (see /share/git/fstests/results//generic/363.out.bad)
>     --- tests/generic/363.out   2025-01-12 21:57:40.271440542 +0800
>     +++ /share/git/fstests/results//generic/363.out.bad 2025-05-19 19:55:58.000000000 +0800
>     @@ -1,2 +1,78 @@
>      QA output created by 363
>      fsx -q -S 0 -e 1 -N 100000
>     +READ BAD DATA: offset = 0xd6fb, size = 0xf044, fname = /mnt/f2fs/junk
>     +OFFSET      GOOD    BAD     RANGE
>     +0x1540d     0x0000  0x2a25  0x0
>     +operation# (mod 256) for the bad data may be 37
>     +0x1540e     0x0000  0x2527  0x1
>     ...
>     (Run 'diff -u /share/git/fstests/tests/generic/363.out /share/git/fstests/results//generic/363.out.bad'  to see the entire diff)
> Ran: generic/363
> Failures: generic/363
> Failed 1 of 1 tests
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3] f2fs: fix to zero post-eof page
    https://git.kernel.org/jaegeuk/f2fs/c/ba8dac350faf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
