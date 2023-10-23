Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1DE7D3AD3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Oct 2023 17:30:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1quwtF-0003BU-Ii;
	Mon, 23 Oct 2023 15:30:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1quwt7-0003Ay-6H
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Oct 2023 15:30:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DrxmgZr6HozkXo4qUpgKfZ7v/zR+tbg+ZnMDEtRWVqo=; b=hsCyEkThEbpfaisao6dfCZuIfr
 wrO2S12oTNfuFFV7GdoGkz4GZg7OTXTkzff+nECMID/h4lTfuSrClCKQ/xHr1CA5TF0PxG0o13zVd
 emNcxKg2gQLhFgcTgI7IECIMOOC+cN02r3ipfxLMaLM1g7vVSshUNK+tFMFLUj8PuzQQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DrxmgZr6HozkXo4qUpgKfZ7v/zR+tbg+ZnMDEtRWVqo=; b=Ha52cQw8nJuhBwaEciv4bJg2DY
 DfUWPdOUd12l02wJM2YsaRdM2CLNBffzyjWhnypHbgpkBEdjo/sPYZEi4jpQUM3ax4sAwfJZmWneX
 ad+qLjDGhBhpAN+mPFRjc9Sjpt1XrbZK10daNrvA7iFMFlzpcgojfXJf68/LTQ2lBniI=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1quwt3-0002HX-Lb for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Oct 2023 15:30:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 40287CE25F8;
 Mon, 23 Oct 2023 15:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3AE56C433D9;
 Mon, 23 Oct 2023 15:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698075025;
 bh=KnASla35Yk8mT/Sw5VL+9nhWIgXHk7sLBFUwKgaMFlM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=nzALcLDWPiWYWH+MJJ6qf5mVY68VDW69q6r1x810xoqxxfdu5w8UbH4e39lHIQPem
 nUhDaFijt7OJWSE1YNMqSkDfOiNHxxqX7CicQZNqiLEqHTtxqEZtIpbSkXw2ITa1b6
 trvbLDveo78EMsM8oQQGPB/aPfcI1DY0IzUMj80SML0RnK7iYz2jyk8QhJ1lHjIoSu
 X2EXgD47iCTVLcIgq+QiJitfTxp6iwGASohF3pSLM5QESS77+DNqFatbSeXo9mpnDz
 tnkkf0XkoZgmRFRLRGXWnKbDQgKb2A4TwF1zXEbN93DrkisejVdPn1HqG+ctTGixZM
 rKlwc19PY2Bag==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1F9B4E4CC13; Mon, 23 Oct 2023 15:30:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169807502512.26537.14708449902617826361.git-patchwork-notify@kernel.org>
Date: Mon, 23 Oct 2023 15:30:25 +0000
References: <1697611862-25239-1-git-send-email-zhiguo.niu@unisoc.com>
In-Reply-To: <1697611862-25239-1-git-send-email-zhiguo.niu@unisoc.com>
To: Zhiguo Niu <zhiguo.niu@unisoc.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 18 Oct 2023 14:51:02 +0800 you
 wrote: > Use f2fs_handle_error to record inconsistent node block error > and
 return -EFSCORRUPTED instead of -EINVAL. > > Signed-off-by: Zhiguo Niu
 <zhiguo.niu@u [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1quwt3-0002HX-Lb
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix error handling of __get_node_page
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
Cc: jaegeuk@kernel.org, niuzhiguo84@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 18 Oct 2023 14:51:02 +0800 you wrote:
> Use f2fs_handle_error to record inconsistent node block error
> and return -EFSCORRUPTED instead of -EINVAL.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
>  fs/f2fs/node.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: fix error handling of __get_node_page
    https://git.kernel.org/jaegeuk/f2fs/c/9b4c8dd99fe4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
