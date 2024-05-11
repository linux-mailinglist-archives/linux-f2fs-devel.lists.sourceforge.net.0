Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC3C8C2E1E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 May 2024 02:50:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s5awx-0002QN-L6;
	Sat, 11 May 2024 00:50:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1s5aww-0002Q7-CB
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 May 2024 00:50:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NIzVXrr44wgMkSBInuhiNMSolzNRvJ4uRD283fKLuC8=; b=RbrrLc7sqR/dLDoNNxUnCeZjyv
 qS351TPVsNQranp0jhWoyzqBwffoeCiW5I8JWbbdLyrH5sQaec88hOj7wQ1dzf7/wo/UoomDbVBc5
 MFuchTOi+UshWZSc8APbJreM6CHTlO0pxz2xRhtvulHDbBw61L4u49AQ4dcsUU11qsY0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NIzVXrr44wgMkSBInuhiNMSolzNRvJ4uRD283fKLuC8=; b=J7p7dMtBre3ajfiYzy5bFfF6RV
 WhQOkDUltq72S5+usC/dSQUdfTf/Qk4e80/ZVPDT/mdu9W5OLJDkFB/WqENJM21neGJfyERqEmcLn
 EWgogyjDfUuv1salh+Jgh435N91BcuIGHHbTnpuic4FERfqCAH2BLwhiFXv+tAgQdOBU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s5awx-00050s-JZ for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 May 2024 00:50:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C285BCE1F47;
 Sat, 11 May 2024 00:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BFA6C4DDE3;
 Sat, 11 May 2024 00:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715388634;
 bh=Pz+ow3JxEINc2wts5BR00ZQMF+TsSbf1YGi3BBPfPxg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=lwBXNb7xi/6jTNONWTORQWCM0OTldyOVw9RcQyzfhL6TUPOhyyKR+vnyKp8PbO0mi
 Ie9T2GmFCklKqn5gYCC78I+69DZcSf9jNvIpXKcvkjaf/yj8czyeUcpME7fn0KPf6/
 EfRX/4sc5lnVCWQPcLxNfwgkMzgK87IP67hFr+O+elgezAE9vgW+8wmUrg+VMpXCqh
 KVYwn1R8fqGhs1pwIpZs4KCEvoaPRI3ISyfW87gMWnzNxONl/oYfJz40W2TtRGYtmb
 vDnXmB4M+TtlAtQJhDGAcLqAu6cznDqNRKebH70ptxjChOeOx1xn8U5TQ5UVaI0XoM
 ksCqbF4XXeMeA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 20D5CE7C112; Sat, 11 May 2024 00:50:34 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171538863413.11229.14009197979317413967.git-patchwork-notify@kernel.org>
Date: Sat, 11 May 2024 00:50:34 +0000
References: <20240429035142.706356-1-bo.wu@vivo.com>
In-Reply-To: <20240429035142.706356-1-bo.wu@vivo.com>
To: Wu Bo <bo.wu@vivo.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sun, 28 Apr 2024 21:51:42 -0600 you
 wrote: > As for zoned-UFS, f2fs section size is forced to zone size. And zone
 > size may not aligned to pow2. > > Fixes: 859fca6b706e ("f2fs: swap: support
 migra [...] 
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s5awx-00050s-JZ
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix block migration when section is
 not aligned to pow2
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
Cc: liaoyuanhong@vivo.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, wubo.oduw@gmail.com,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sun, 28 Apr 2024 21:51:42 -0600 you wrote:
> As for zoned-UFS, f2fs section size is forced to zone size. And zone
> size may not aligned to pow2.
> 
> Fixes: 859fca6b706e ("f2fs: swap: support migrating swapfile in aligned write mode")
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> Signed-off-by: Wu Bo <bo.wu@vivo.com>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: fix block migration when section is not aligned to pow2
    https://git.kernel.org/jaegeuk/f2fs/c/aa4074e8fec4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
