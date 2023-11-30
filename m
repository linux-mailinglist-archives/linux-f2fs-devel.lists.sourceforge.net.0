Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF6E7FF964
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Nov 2023 19:31:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r8loN-0004q4-6c;
	Thu, 30 Nov 2023 18:30:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1r8loL-0004py-AF
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Nov 2023 18:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KCJNJ8lFo7Kn+iCgIeXBV9bdm1A0U1CcUPNGicQ72Vs=; b=lTvbFeC8cnI6sLVJMO3DVt68dQ
 Gr9ttDKq6y2pfVfr7fwir3WrcU4ZAXuwi3gDSX/DfbJkznKfqYFeDVkmPvFxzKAA1WXRWkG91PoCR
 AL3T/GremfJ4BLlSBOw/wVKELjcZSrDfxKC1kFCuaDNaNJpfFxAkLyDfvVfCY8QVccRk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KCJNJ8lFo7Kn+iCgIeXBV9bdm1A0U1CcUPNGicQ72Vs=; b=Mj9XuplwU2UGzckctsxBDGTOy6
 6JEXfXMWKjCmPSJxkkCg14lpnkwIWBGnGldWIKTBy4Bdmdb+SBS60/9lP5r7wGgADqZijwP3+rEsS
 uwzPZR8bNbaHfGK0aXZIBNxkDaWBZHTqp+LeU0h1zQuBVCF6XD3S/cSn8ZmrPIVkjHO4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r8loF-0006TB-Ld for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Nov 2023 18:30:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 5D18EB845CF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Nov 2023 18:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA4F4C43395;
 Thu, 30 Nov 2023 18:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701369029;
 bh=7EwKEblPzCXv6jUK/RHT67PlnQI6fT/hklcZDkI84Qw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=sPNkfQtGYm8ixzOJiq4KIQEnN1ywTZYSHEGg5ygm6lRcCqmG2vUkGLGQzJvS6qY3I
 zbVZi5N/BQh5nDleB671Y8MqlkGSWoCNwNIsL5pap2UIVgzwfnm90BiJybOiZSdrzt
 fbMOBG9DvKYNCjuXapnZL2NLaHMMum4YRA2hP6RkHrYMXBKmlfPUrt4xbMyA98J0o5
 CLNy97nw1R8e6Y1NKsyAGGYLMG1THxPi7WrxpxHkGqN6+jGh0S7mTcNBn2o4lUXQ58
 y9pEgCIzM2VsuwAMujAzRj0IG4udlsfgY7nHHxWAvdk7ga2SbZ70BzRp5LH7L31WEl
 a0gPHPYrk6fdQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 BBD64C691E1; Thu, 30 Nov 2023 18:30:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170136902876.21709.2888041762449260245.git-patchwork-notify@kernel.org>
Date: Thu, 30 Nov 2023 18:30:28 +0000
References: <20231114212414.3498074-1-jaegeuk@kernel.org>
In-Reply-To: <20231114212414.3498074-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 14 Nov 2023 13:24:14 -0800 you
 wrote: > When recovering zoned UFS, sometimes we add the same zone to discard
 multiple > times. Simple workaround is to bypass adding it. > > Signed-off-by:
 Jaeg [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r8loF-0006TB-Ld
Subject: Re: [f2fs-dev] [PATCH] f2fs: skip adding a discard command if exists
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 14 Nov 2023 13:24:14 -0800 you wrote:
> When recovering zoned UFS, sometimes we add the same zone to discard multiple
> times. Simple workaround is to bypass adding it.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/segment.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: skip adding a discard command if exists
    https://git.kernel.org/jaegeuk/f2fs/c/bbd3efed3383

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
