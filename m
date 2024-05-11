Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A738C2E0F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 May 2024 02:50:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s5awq-00042g-4m;
	Sat, 11 May 2024 00:50:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1s5awo-00042O-I6
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 May 2024 00:50:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qcPBEErrThBzikN2LkBomtRvG3jp4XS3BRRwDS9Bw7o=; b=W092TfANdwS5dISpCwJaCiOuLR
 uhJqZeXu2wXfvdpLr+46v33mU5nKpOnbTUKXCnDsPI0KmJZBjhhQte1SDd3agXeRazRA9JwFjYZ/2
 +FUphFPya9bVeSaXTHv/hUndAqwDDx4D9fj+H9YIi4VUcsdTGvDMRtVayybHzzxvvMSA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qcPBEErrThBzikN2LkBomtRvG3jp4XS3BRRwDS9Bw7o=; b=YqDPgQLoyryDPP4FTaiwyWYhNa
 azeulWG8nEoeVU0kK9NqQh1rM4YpNYyTGBnwCPGkHhhyBTWMP7UqYtYX3+sXASvzxMUYpCeTfmDpj
 en+5+C1LNqW49GNxtn3aYRX28rv82sXxCZ3NQebQA6Djnjw059LY3EMGpx3HYYTUA3bA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s5awo-0004zG-1k for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 May 2024 00:50:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EC2B862040;
 Sat, 11 May 2024 00:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01859C4AF10;
 Sat, 11 May 2024 00:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715388634;
 bh=f/QziGJMQfc3AVEjvIb2SXkPaytTiSIZVj8Z4dQuuV0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=LKfmjuB/FrMY9Dza4ye4K5aty+xxhteXPrObXZ3zFb8GSxQwcVRPCiXY/TgiQ8kJC
 8y366RjZt6V2H4CsMAuY5Xntjgb7UcEnJJ4uNsPMh1uEwBV/Nh1teQhBY2xtF3cKIg
 qKblRdK+aRqjeetDfVLWXyo8Krqm0HTTEXfn71sF9p5oGybqt9jQiLQbSnKyX1OxBH
 9F1ckx4Won3+N4cuB57k/HRsm0jDPc4/DC1Iex/ckldSmhK8Sb5BMwnTjlidIRO36D
 urGIiMx0d6bVh2ioFgkqAt1LUpXjiPuiXGeuNcghcJOGjyCHcdpXEnNQvVNw8yrjy/
 0CuraQo5Lw7iA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E7716C32759; Sat, 11 May 2024 00:50:33 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171538863394.11229.6682600182078372745.git-patchwork-notify@kernel.org>
Date: Sat, 11 May 2024 00:50:33 +0000
References: <20240425145528.2925372-1-zhaoyifan@sjtu.edu.cn>
In-Reply-To: <20240425145528.2925372-1-zhaoyifan@sjtu.edu.cn>
To: Yifan Zhao <zhaoyifan@sjtu.edu.cn>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 25 Apr 2024 22:55:28 +0800 you
 wrote: > is_next_segment_free() takes a redundant `type` parameter. Remove
 it. > > Signed-off-by: Yifan Zhao <zhaoyifan@sjtu.edu.cn> > --- >
 fs/f2fs/segment.c | [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s5awo-0004zG-1k
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove redundant parameter in
 is_next_segment_free()
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

On Thu, 25 Apr 2024 22:55:28 +0800 you wrote:
> is_next_segment_free() takes a redundant `type` parameter. Remove it.
> 
> Signed-off-by: Yifan Zhao <zhaoyifan@sjtu.edu.cn>
> ---
>  fs/f2fs/segment.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: remove redundant parameter in is_next_segment_free()
    https://git.kernel.org/jaegeuk/f2fs/c/ecd69be71aad

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
