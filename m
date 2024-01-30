Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AF8842E30
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jan 2024 21:50:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUv40-0005aW-L2;
	Tue, 30 Jan 2024 20:50:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rUv3z-0005aQ-Dq
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jan 2024 20:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E6JMUoqT9u3S9Ih1SbKtKNGecvXKpPLdWCHZHkkbrw4=; b=YPYy+ZLxSwX53bHzaxzJk5xJWA
 9M1GrRsYQQbWQbRMq5M4n/f3nTArn2Zj5IIlIweOn5LVxzoyhwAEgwe2wN1Jyuy5mya7FDjKfF+HA
 FpYuKmGW7G+WZ4tWMXv5j01QHWdUDLQzy7k+eGreKsVE/oMG+lldo9QZshk9y/gbFZsE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E6JMUoqT9u3S9Ih1SbKtKNGecvXKpPLdWCHZHkkbrw4=; b=lq23QazbQEacvE+ZIqL0GgAL0h
 +Z1XkwT3UE+HswR9gjR5PvVSzIthctLwNh54G0Jdy3cTyMkVTxDNrmFr/NREc9ukv2C6ocD0SmNJJ
 I7GtLs8fuH6pX49LVxn4Ojv4SHrPDQdOlxbHN54+tMHnse+A2djAS1xkApqAqf6nccFw=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rUv3x-00016a-Bu for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jan 2024 20:50:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4BAAECE1CCE;
 Tue, 30 Jan 2024 20:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE4F9C433B2;
 Tue, 30 Jan 2024 20:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706647826;
 bh=sQMc1IpzbU1LGaOI5Qb27si2nqTsv75Gb9RB6VNreKg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=S2qgXbTKvGejivnNf9dn+MBpdfRKqz8haSykjAGabtKAPu2UrWG/3tqxnOxAgfYsm
 anwR44/uOSCPA6n6rFcGgRzzNzw+7Svn6SWFL9AHew1ts5Tk96IEbEh9QCXEV765ED
 9nwOO737ATUgzwTLM51yPgyP2EUb/Jm765YeO3r4VldRV/eVqF8uNrjpgGVJvUFMtK
 qzHyXe5Zgg85EDMMu3M8M5HCT8oySpbH1l8JS0hq7OS2vXN4jBAM0bO+RDTswyNyob
 fjruSQe9iAeQP/5ruT089WR9GcsTQHLUvt05a4IrZDgC0PMo43bZiw3DjbN4tqrbvj
 4s1KhGEylbDmw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D78A2C595C4; Tue, 30 Jan 2024 20:50:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170664782587.32692.11414863137927185609.git-patchwork-notify@kernel.org>
Date: Tue, 30 Jan 2024 20:50:25 +0000
References: <1705556911-24117-1-git-send-email-zhiguo.niu@unisoc.com>
In-Reply-To: <1705556911-24117-1-git-send-email-zhiguo.niu@unisoc.com>
To: Zhiguo Niu <zhiguo.niu@unisoc.com>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 18 Jan 2024 13:48:31 +0800 you
 wrote: > Just remove some redundant codes, no logic change. > > Signed-off-by:
 Zhiguo Niu <zhiguo.niu@unisoc.com> > --- > fs/f2fs/compress.c | 4 ---- >
 1 file ch [...] 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rUv3x-00016a-Bu
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: remove some redundant codes
 in f2fs_cache_compressed_page
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 niuzhiguo84@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 18 Jan 2024 13:48:31 +0800 you wrote:
> Just remove some redundant codes, no logic change.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
>  fs/f2fs/compress.c | 4 ----
>  1 file changed, 4 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: compress: remove some redundant codes in f2fs_cache_compressed_page
    https://git.kernel.org/jaegeuk/f2fs/c/16c326c7a519

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
