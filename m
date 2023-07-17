Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EE7756AC0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Jul 2023 19:34:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qLS7I-00063T-VK;
	Mon, 17 Jul 2023 17:34:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qLS7G-00063C-Im
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Jul 2023 17:34:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eCd0RKWc+ssL/GRxgZPlM5J7BEGdD0q+g6gV7d1NOcg=; b=BroP2AGaMouxJ4OBQK/5jPpyc/
 XW7+vZmKcVIvHOv7ULavXjArqym7FDsoTN4QlMFsFXRNX8wfeJ7SOPkr0iBrItgO8JS/xBDpsBHIY
 IpMG1C45280NI1dgsq0o3/Ymwhogw/7mmGW6E50elXCFFx+seRGPVgfc+3PnUlKPwbTU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eCd0RKWc+ssL/GRxgZPlM5J7BEGdD0q+g6gV7d1NOcg=; b=E0xPUV51/bfcmtR2TiV1r44Sm6
 2VpXFx6CiQw297IGVbDqvj0LUppxTLvfeHk05zaijCeUon7wj7jFfNwPS3NRGgM3Un3Pl5Jn2+5yk
 ZFVso42EhkRRvkVuysHIXhJtxXHfETv8l+soUwlbLgaorFKMi/0J8lh+yb16AB79aV0M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qLS7G-00AvG1-AP for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Jul 2023 17:34:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 23258611B8;
 Mon, 17 Jul 2023 17:34:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10CAFC43391;
 Mon, 17 Jul 2023 17:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689615262;
 bh=zjpi1nmFBRkngC9kx5uSz24LCTF4uH41+2V6jKvsHMc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=DlOnmUT3kCu61Ax6lKM/L4+gRXW8BImDVpK0xKK5s6Wq9QcuyzxwNgTeMG2DsetN9
 R985SPgNMPOi/UC+6XItv9cHotMURfRI4IQLf6OAGp/ObrvLnRSa9i5E30Ks237A2/
 jv7qSgeaCtvOSry7KrFXXvLsi8O80AhI9/LATJkvJ/+4FLXZ0KKaEfEWlx+8FesIm/
 VVwm+/+n3F4JWYnPrjeh3EaYI9ePJ5wQEN54vtKlVHHbODZYokwYyJ6TT7+WzxvI+M
 0JZTV8CC8zRuaKRR+bQkEGk2vu0jVSt9ZY9Ub3Rg0PRboeL6cfpOGLZFLMtiWsmYMv
 fsRMUWQIPaTYA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 ED88BE29F39; Mon, 17 Jul 2023 17:34:21 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168961526196.4078.16285159335200571257.git-patchwork-notify@kernel.org>
Date: Mon, 17 Jul 2023 17:34:21 +0000
References: <20230710052324.2857-1-rdunlap@infradead.org>
In-Reply-To: <20230710052324.2857-1-rdunlap@infradead.org>
To: Randy Dunlap <rdunlap@infradead.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sun, 9 Jul 2023 22:23:24 -0700 you wrote:
 > Correct spelling problems as identified by codespell. > > Fixes:
 9e615dbba41e
 ("f2fs: add missing description for ipu_policy node") > Fixes: b2e4a2b300e5
 [...] Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qLS7G-00AvG1-AP
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix spelling in ABI documentation
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, vkon@google.com, frank.li@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sun,  9 Jul 2023 22:23:24 -0700 you wrote:
> Correct spelling problems as identified by codespell.
> 
> Fixes: 9e615dbba41e ("f2fs: add missing description for ipu_policy node")
> Fixes: b2e4a2b300e5 ("f2fs: expose discard related parameters in sysfs")
> Fixes: 846ae671ad36 ("f2fs: expose extension_list sysfs entry")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Cc: Chao Yu <chao@kernel.org>
> Cc: linux-f2fs-devel@lists.sourceforge.net
> Cc: Yangtao Li <frank.li@vivo.com>
> Cc: Konstantin Vyshetsky <vkon@google.com>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix spelling in ABI documentation
    https://git.kernel.org/jaegeuk/f2fs/c/666de8daceef

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
