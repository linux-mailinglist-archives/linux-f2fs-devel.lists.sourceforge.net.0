Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AE66CA9D0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Mar 2023 18:00:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pgpH3-0005qL-OJ;
	Mon, 27 Mar 2023 16:00:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pgpGr-0005q2-7y
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Mar 2023 16:00:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ss+7bnbd154HWz4Fx+8PlpVblowaeKSrvgsrv/MeAw0=; b=Pek4a3KSeXXNOunr01Wm0+/Vd8
 nY7uFIgGACil7/TUxc49E9m1HSc346vcqovYHFktrSivPiGQ32lEFm7wiXylOKJoPnkrks19XS4FL
 WSKiNW0btd+I+uqd2zEF6hRZuAiX1FWUHc00fp8hOulE1/1pJ3eQnvFCLUgisx77Wbk8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ss+7bnbd154HWz4Fx+8PlpVblowaeKSrvgsrv/MeAw0=; b=QRF2ZQNk3HQl5QVg1XJW5AhZJl
 sbFXA5R2yRkB3li0qMmEALnOJgDSDREWKe4jTzp/XCSXvbUz1x00q2TzF1sl9Z/FUkSS9MP+jUu46
 pE1YFknpvi6xb94Mr2MZRpqUYIetsEGTR8giuauc4Pg6DPXcOLRtZBU+Sl3qhqlu3PTM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pgpGm-005vGE-3q for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Mar 2023 16:00:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D648BB816B8;
 Mon, 27 Mar 2023 16:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E9F7C433AA;
 Mon, 27 Mar 2023 16:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679932820;
 bh=EWnaGYutZzwhc9eSNWffPnXSuPnCX8A2/5em0/333p0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=cMXFdG7JF2d4yzT7u+6ESr5W/ApuoFKbWmOSkLfPTf3UIl/G/JbVtaJR7H0HeOWRq
 gVsUOLAZmhg4E9USWbQNY/jil3g9qK/1oymYpg4KmBSxk/Z+NwBzzFvtbBsCwR3SDa
 JnppFOe3BSncBylcV6zS1VZ+1bDCDHfDRlms59cozM+xiinXmC6V52wn5beJ+5FfGf
 NMNv7iGDaHNz6XEMxw1ojh5yXI4bXwccppOCESbOFtn2/NJQkKtHxgyQcl6QFdT5qc
 hfq4EodGWhqwFnYgzDgQ6zLnD5z0iRvImipuIEtp12EQGQ2qQYnV6Avhgp99HwizWO
 vTMoHupMQK0Qg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0DC2DC41612; Mon, 27 Mar 2023 16:00:20 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167993282005.32120.8336365155332672616.git-patchwork-notify@kernel.org>
Date: Mon, 27 Mar 2023 16:00:20 +0000
References: <20230319075130.24962-1-frank.li@vivo.com>
In-Reply-To: <20230319075130.24962-1-frank.li@vivo.com>
To: Yangtao Li <frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sun, 19 Mar 2023 15:51:30 +0800 you
 wrote: > Opt_compress_chksum, Opt_compress_mode and Opt_compress_cache > lack
 the necessary check to see if the image supports compression, > let's add
 it. > > S [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pgpGm-005vGE-3q
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add compression feature check for
 all compress mount opt
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

On Sun, 19 Mar 2023 15:51:30 +0800 you wrote:
> Opt_compress_chksum, Opt_compress_mode and Opt_compress_cache
> lack the necessary check to see if the image supports compression,
> let's add it.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v2:
> -drop f2fs_mount_opt_need_skip()
>  fs/f2fs/super.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: add compression feature check for all compress mount opt
    https://git.kernel.org/jaegeuk/f2fs/c/2f3d837dbaa0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
