Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E5DCFBDA4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 07 Jan 2026 04:33:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+YIa0VQgK+LAcj0s3Zlko1kIygxzyJYvUcNzF/ndYQ=; b=fInfVVUBceVNMNOfknBPt6p73o
	o/4wpt2PriVFYPTjuJ7ANt35EIVzwjKGhC4581EFw+R2W5XtU5VzsWsjaKfh45n3Vv4wAWUno2SPM
	ia00IMwm26AsNXw5LbfkHM7o1b0RI1mBSZjgtbrwKu5/9AGXp+5TJTDVJqqDzKiRYpBI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdKJ2-0006qs-S0;
	Wed, 07 Jan 2026 03:33:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vdKJ1-0006qb-UH
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 03:33:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wXlE0ZhXIugB6OZiy5Z64ePE+FI3/Do8aavmiTEaPqE=; b=HiQ1bp/VOiNSv6XMhlJw2yS0bU
 62Q0sxkDO+6Uvefuk9Zw1pEIXf229ZIKWRSoBYlSLM7/dCr74x2g4/EfNiopgZSqjZeJDrhMLxNIx
 4QGZy/SxevBEX4IA1YKU8MEs5hEX1Oy0cQqT0pCBtfoQwi6DPTNJC6TZUzPFgcbEmENE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wXlE0ZhXIugB6OZiy5Z64ePE+FI3/Do8aavmiTEaPqE=; b=jVlDPnLmlqbO5LTG2YpkZdrxXU
 vqj5/9qMXvfVXPTdJdxXaNzZeTOXbLQxhTH2VAwUnFVdagh39VRUKoRYQaIbFXvLYG200EY9a3S3O
 AZh8cQG076X3NQA818kWJt8dW6tVAtJXcaXsB2giw/AKIvJaLwbNEzaGT+lrhXuDVCQg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdKJ1-0004Ya-Dg for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 03:33:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D28EF60147;
 Wed,  7 Jan 2026 03:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E37C4CEF7;
 Wed,  7 Jan 2026 03:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767756829;
 bh=2L/CBeINURPxehm4YsRgkPYcvaK7wHRBVIr61llWTHU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=dAIDMaQU+i5mDTHveGU3RNisuLQ2lpseAKYmCGmlhtS25Azuq+VfZj4KeeVZXHYuY
 7HIndsb1YjG4K3xP3dUMsyPURlsVW77qZJ10G8UNzIjroUR8PrDsrrKYeXXEnFshnN
 YIQUFLuZopFV3beDDGrxQOmkTVZQ8V9o7jx4AjkF4uWMyrdER9/4SGFGARhQ7fO2e+
 858JrC0E6P0lLKyLZelTuW6TG8M+Xf9Hkr+7yCeFA1U8EtXpX6HKtiFUgALom07WNT
 dI/50YKZVdsElYyBRhm37108mKlWnsIBA1Cyi7Uml2yKfRPqEnJeYjiT8RJeRV70qX
 Q4JCXWd+xESww==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3B5B1380CEF5; Wed,  7 Jan 2026 03:30:28 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176775662677.2218650.11507731650705298246.git-patchwork-notify@kernel.org>
Date: Wed, 07 Jan 2026 03:30:26 +0000
References: <1766717764-19956-1-git-send-email-zhiguo.niu@unisoc.com>
In-Reply-To: <1766717764-19956-1-git-send-email-zhiguo.niu@unisoc.com>
To: Zhiguo Niu <zhiguo.niu@unisoc.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 26 Dec 2025 10:56:04 +0800 you
 wrote: > It missed the stat count in f2fs_gc_range. > > Cc: stable@kernel.org
 > Fixes: 9bf1dcbdfdc8 ("f2fs: fix to account gc stats correctly") >
 Signed-off-by: [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vdKJ1-0004Ya-Dg
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix to add gc count stat in
 f2fs_gc_range
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 26 Dec 2025 10:56:04 +0800 you wrote:
> It missed the stat count in f2fs_gc_range.
> 
> Cc: stable@kernel.org
> Fixes: 9bf1dcbdfdc8 ("f2fs: fix to account gc stats correctly")
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
> V3: correct Fixes tags
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3] f2fs: fix to add gc count stat in f2fs_gc_range
    https://git.kernel.org/jaegeuk/f2fs/c/761dac9073cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
