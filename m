Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5D785E540
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Feb 2024 19:10:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcr3N-0002Qm-Km;
	Wed, 21 Feb 2024 18:10:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rcr3L-0002QT-Sm
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Feb 2024 18:10:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c/c+gM+QonD7+XeVO46UYmHcJji8iXeux0gkpt1alms=; b=IiCBSkK+efseuadKxstkp8hCa8
 bkjxwYsQ8x52vHj1YKotBUsh7t0X/XjgniyZYxGHtBy55M6XggzXwipE1sM5apnnyKDFldCewYyPu
 GnbG88uDrel2p4oDjiq67+UUW6IU/fwfpkoHXwoQQPRKlCurNFJxioUSv7iAItNE+gak=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c/c+gM+QonD7+XeVO46UYmHcJji8iXeux0gkpt1alms=; b=HO0NmrFBbWtehN7fM686E00gwo
 OLKQaEIPMhsxQc0IzU2Lf4ldM7MXb5wLeDcvA5ySBUi8QjHVbMHrTfJ+vd7DibsQg5G46U1EgixHk
 uuakxQ/AlgFKjMW+VEBg5Bi6zhW7qimj2BCdU1vtSY4OmOwjp3oAEpTGi5UpOSnUREGY=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcr3K-0001Sa-O1 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Feb 2024 18:10:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 61BACCE1A83;
 Wed, 21 Feb 2024 18:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24B9AC43609;
 Wed, 21 Feb 2024 18:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708539031;
 bh=oX4EdpTpbO8MejBIv3YlvOvhveBN1t+BKjJS4l8AiCA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=a5nTa5SEaMxM4vHu942onhLIICKUgYn7Q19DgYidK7JLBiT7FqaZCzgunXlwEJiuZ
 Sb45adoMh6XjrIiPjC3u2V5VDXR/MB1YAnZMnnxHTyDrEk58kaK/UzzHdEdIHp3teH
 P6p9rcbUpSIG8Vkf146UKlBQE7nABz2lVcFVmkbCjxPntTclLdOhZvzM2+ZvoPh7bm
 zcNhcPmOZ5JWv5pXJRXTqhwIQRVE5iakwdrF3z4fyc2kpRFNgK5mexBkgxW/lIBDov
 breV/8cxigGnl506a31c0XkugLdz0CpCie2BavlG0jH+vr0qll9Gf8QmdZbmEH/IjM
 vgJBEw4J7f6rA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 00E7FD84BD0; Wed, 21 Feb 2024 18:10:31 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170853903099.7043.6155002050076801898.git-patchwork-notify@kernel.org>
Date: Wed, 21 Feb 2024 18:10:30 +0000
References: <20240202165208.4091800-1-quic_jhugo@quicinc.com>
In-Reply-To: <20240202165208.4091800-1-quic_jhugo@quicinc.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 2 Feb 2024 09:52:08 -0700 you wrote:
 > The servers for the @codeaurora domain are long retired and any messages
 > addressed there will bounce. Sahitya Tummala has a .mailmap entry to an
 > upda [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rcr3K-0001Sa-O1
Subject: Re: [f2fs-dev] [PATCH] f2fs: doc: Fix bouncing email address for
 Sahitya Tummala
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
Cc: quic_stummala@quicinc.com, quic_bjorande@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 2 Feb 2024 09:52:08 -0700 you wrote:
> The servers for the @codeaurora domain are long retired and any messages
> addressed there will bounce.  Sahitya Tummala has a .mailmap entry to an
> updated address, but the documentation files still list @codeaurora
> which might be a problem for anyone reading the documentation directly.
> Update the documentation files to match the .mailmap update.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: doc: Fix bouncing email address for Sahitya Tummala
    https://git.kernel.org/jaegeuk/f2fs/c/bb516cc086ca

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
