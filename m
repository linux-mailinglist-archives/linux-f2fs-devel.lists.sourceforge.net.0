Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD4968B4A2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Feb 2023 04:50:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pOsWR-0006mP-AB;
	Mon, 06 Feb 2023 03:50:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pOsWP-0006mI-Ni
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Feb 2023 03:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0/3cK961W3rHfgLR30gKFbIVsmVkEoYmvlXdsdrLOl8=; b=S56kX7+2X2wwJo5g3ZaPufVJ5D
 ZJBhY1Xx70gfzqnoOSpEM9A9UPGV1bWYgGXY+iLFqEE2tm+K3MKfqfeYc0tVtphtDXDIzyVPnCwF+
 Soo3j+CvhO/G03QmySBIn6kC5NBbo2Nz+ESoX1osluzpuvndDIEHhe/zkoxPDlfeR/wY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0/3cK961W3rHfgLR30gKFbIVsmVkEoYmvlXdsdrLOl8=; b=kvCm5yqpxHoMUEAVnoHyHRU1Cr
 QTiTqKGU0SBtwfLYX0pfUGT8dYdfTV97wfftyqvvDGlhu0aStaJGnkK9Di/vLuApUZUw5TeoDUdUX
 Oe7FL+VvDfZf6fwQQlZL15wkZD07ZPESb5O+ACBpXQZmXZllStnEcMAP6tYcff/OLK+M=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pOsWN-0005oo-Kb for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Feb 2023 03:50:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2676DB80D35;
 Mon,  6 Feb 2023 03:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8F46C4339B;
 Mon,  6 Feb 2023 03:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675655417;
 bh=tShHIVAsWrTXq/vjTB84km04tKH/kLs7E4lW6PVPjhM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=tdGiB22M3+SFu/sXgKWEz0Zj/bqsCBZGwzLG2kc1nKTNiaAkdBruUiuzrVqhGbarY
 gzmq6Pg1KhceYitA0nvCkX4wVJcmZnNUlRF2Lc1c/RWZ5454BRgtmEBQGEg2oDven2
 idLerX9JxlZICKniKXYKcof7lhvIF9BSDWFxHE5oQ9HJvl6Pqrbxq1TBl6xAloxzND
 xozOqa3x6/1005if6F+4DWAv94vSmReiBt73PO7JCknWj7UVcHpEYfv4xxyCFQObW+
 25Qoz9SITlG+ZQ1+OntJGaemiXGQU3m+Eu2u4+VKbsQ7ViB3pinzlnIuEl2XD0u7Gx
 +AnQZug5GWsKQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A714FE55F00; Mon,  6 Feb 2023 03:50:17 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167565541767.9334.7350798804353905371.git-patchwork-notify@kernel.org>
Date: Mon, 06 Feb 2023 03:50:17 +0000
References: <20230202094123.74342-1-frank.li@vivo.com>
In-Reply-To: <20230202094123.74342-1-frank.li@vivo.com>
To: Yangtao Li <frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 2 Feb 2023 17:41:23 +0800 you wrote:
 > Commit 5911d2d1d1a3 ("f2fs: introduce gc_merge mount option") forgot >
 to show nogc_merge option,
 let's fix it. > > Signed-off-by: Yangtao Li <frank.li@v [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pOsWN-0005oo-Kb
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix f2fs_show_options to show
 nogc_merge mount option
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu,  2 Feb 2023 17:41:23 +0800 you wrote:
> Commit 5911d2d1d1a3 ("f2fs: introduce gc_merge mount option") forgot
> to show nogc_merge option, let's fix it.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  fs/f2fs/super.c | 2 ++
>  1 file changed, 2 insertions(+)

Here is the summary with links:
  - [f2fs-dev] f2fs: fix f2fs_show_options to show nogc_merge mount option
    https://git.kernel.org/jaegeuk/f2fs/c/04d7a7ae43fc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
