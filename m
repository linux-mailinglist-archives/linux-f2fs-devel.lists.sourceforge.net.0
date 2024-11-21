Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A99D79D5094
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Nov 2024 17:20:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tE9v9-00054U-9r;
	Thu, 21 Nov 2024 16:20:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tE9uu-00053x-EP
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Nov 2024 16:20:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RZSObd+t+R2+cftKdEF91bHFTvMyMU22W8Dp6+VsTto=; b=ga3JSKwPqGX6B7KLggLoRWx0c7
 Ih2v0ouGq+EON73mCXpVswyAB5izElqtgz/NzCXPnYc67+i/Ix42DIdsdU20HQcVpsrQHOxCOFMBQ
 oWYJZ5npXv/6CqBJiuFjrZHiHVpCWTkjuZ4EPydYfT4naiBKPBNcfj6x/nIgZue66EMc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RZSObd+t+R2+cftKdEF91bHFTvMyMU22W8Dp6+VsTto=; b=I44xk5U+ojQtaQFboNNHr3y4jU
 MnH4vl0B3phHXW01QLDKBLqD0mmzOqK0neMOhFatsoqtyrIvxGVIoBglx3e92x7YbZ4MYI6edWA55
 We6Ur7K7QVwdWdThEpL5IEcP0jPXvnkAddKcMUiiq4ChT4N3TiSAiDUH1pDWlYDNBkrw=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tE9ut-0003Ox-6U for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Nov 2024 16:20:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 18975A40B5D;
 Thu, 21 Nov 2024 16:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1351AC4CECC;
 Thu, 21 Nov 2024 16:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732206021;
 bh=Pj6ucO4HVe7kpROZ5FlO+LChi3TwCRI5plILCfoqOk4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=btZWjhMWcQ3vOpyF/wL6XsXPB29yqL44PlgjuIDyWQSslkkT462c1ZMGHk3ARbN/n
 GeHHbC+v1BtF1xTah9eXhupEjD82/jVIpQUSmrgOnr/JKdmul9pU/snWdOnTSjhB5q
 IJomuCXHQ4yUkCHHEPp4/wzzoOJ/RAbarxweATJBVf6FQNmFJqY6MYuZFh0Va9FKQW
 IDPMACCGfLESl5AAWo5BM1+V964/4LxNT+TiZt0EmAj61KRlB+en972CHqQ0RMmJy0
 8+IrYyL6sj1THpnCpR+jKbZbYH/fqJnTQtJH1XAWKSi1o7Q6FwDEpm1idU0Q9UnZ7Q
 ewhrAxuRKWJtw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 36EF43809A00; Thu, 21 Nov 2024 16:20:34 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173220603268.1977996.10380394142241465930.git-patchwork-notify@kernel.org>
Date: Thu, 21 Nov 2024 16:20:32 +0000
References: <20241118070141.3474-1-danielyangkang@gmail.com>
In-Reply-To: <20241118070141.3474-1-danielyangkang@gmail.com>
To: Daniel Yang <danielyangkang@gmail.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sun, 17 Nov 2024 23:01:40 -0800 you
 wrote: > strcpy is deprecated. Kernel docs recommend replacing strcpy with
 > strscpy. The function strcpy() return value isn't used so there > shouldn't
 be an is [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tE9ut-0003Ox-6U
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: replace deprecated strcpy with
 strscpy
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

On Sun, 17 Nov 2024 23:01:40 -0800 you wrote:
> strcpy is deprecated. Kernel docs recommend replacing strcpy with
> strscpy. The function strcpy() return value isn't used so there
> shouldn't be an issue replacing with the safer alternative strscpy.
> 
> Signed-off-by: Daniel Yang <danielyangkang@gmail.com>
> ---
> v2 -> v3: store strscpy result in ret and return ret if error
> v1 -> v2: handle strscpy errors, changed prefix to f2fs
>  fs/f2fs/super.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [f2fs-dev,v3] f2fs: replace deprecated strcpy with strscpy
    https://git.kernel.org/jaegeuk/f2fs/c/789ca0eb47f7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
