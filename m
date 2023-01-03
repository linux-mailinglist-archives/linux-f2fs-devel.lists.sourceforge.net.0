Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A6965C6B8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Jan 2023 19:50:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pCmMo-0001Kv-3K;
	Tue, 03 Jan 2023 18:50:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pCmMm-0001Kf-K2
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jan 2023 18:50:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KChR8sXjV1LB92i2MGdi0LkqXD1ut0EhzUzUdUaBd3A=; b=kSmrQCwGKKI2SFTHHtPzQEft5p
 arhAYCPMZenl3s/21jQD3uGTWnP8sn+dqBKsZ7sCuJXJICh/opUWCbeIco9t0OqNBqJlpzWyCBj/K
 VEE5sIN4HgRikZNHEGLT6KJAMt5zSKDSnmIn6xlbiAdaF+Kzh8WisoE/NyMNPOp6wjhM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KChR8sXjV1LB92i2MGdi0LkqXD1ut0EhzUzUdUaBd3A=; b=B1TFJmxRucouWgocSmhLKhoHX1
 7Lfb+TALEV/lRSW+wcH+/Yo7ROpEo/HFynCn+WwJc5oMWAQXqyvKEI7j23YA1v2Nk1JqYyY804zAp
 IIJq547nGpOiNeGKIfPso3YEKO5ZWzYAEnyFjFK6N2dq4bgIsN32az9uctjg0jXnA0zs=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pCmMi-003cjP-5P for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jan 2023 18:50:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DC645B810A6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  3 Jan 2023 18:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CA5BC433F0;
 Tue,  3 Jan 2023 18:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672771816;
 bh=oxUs1mk9fjhojX+d/cpiJWecqbmfx6WhG1uIbFJCakc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=pAd/sfDIPfSoIX/zNIdDAxnetiqMTfvN7bLxf/AP0kJSc29XdkVx3VGmC1FFOo12s
 NcUdJ3LG5ruKo5es3Rz4GgDzKUqqlfufinKDRO5BFCjcq2jag0nhNwAFpnmVkKrA5/
 DkJLSyDMfxA1fF8GLy+Oruv3HLvwq+DZyFe/DGbD6ppKaN0xNPK5SO0Fn5rXsmsV0U
 617zHeNgdkvBhfk1D96D/Hab1LkgZu0Xp6FnYtvrBiosY4W1m+USzUzusI2n//gupa
 STbb/6T/8FZpZFFOvT9zJvqzrvbPH4TTBiat4UnJhKGeotgA/MKAFd/DTmF3IlPuF8
 Dj4UderVEztHQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6EE83C395DF; Tue,  3 Jan 2023 18:50:16 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167277181645.18849.7061029698605018840.git-patchwork-notify@kernel.org>
Date: Tue, 03 Jan 2023 18:50:16 +0000
References: <20221217004659.2092427-1-jaegeuk@kernel.org>
In-Reply-To: <20221217004659.2092427-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 16 Dec 2022 16:46:56 -0800 you
 wrote: > Clean up and one bug fix. > > Jaegeuk Kim (3): > f2fs: initialize
 extent_cache parameter > f2fs: don't mix to use union values in extent_info
 > f2fs: sh [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pCmMi-003cjP-5P
Subject: Re: [f2fs-dev] [PATCH 0/3] fix per-block age-based extent_cache
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

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 16 Dec 2022 16:46:56 -0800 you wrote:
> Clean up and one bug fix.
> 
> Jaegeuk Kim (3):
>   f2fs: initialize extent_cache parameter
>   f2fs: don't mix to use union values in extent_info
>   f2fs: should use a temp extent_info for lookup
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/3] f2fs: initialize extent_cache parameter
    https://git.kernel.org/jaegeux/f2fs/c/fe59109ae5c0
  - [f2fs-dev,2/3] f2fs: don't mix to use union values in extent_info
    https://git.kernel.org/jaegeux/f2fs/c/ed2724765e58
  - [f2fs-dev,3/3] f2fs: should use a temp extent_info for lookup
    https://git.kernel.org/jaegeux/f2fs/c/22a341b43036

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
