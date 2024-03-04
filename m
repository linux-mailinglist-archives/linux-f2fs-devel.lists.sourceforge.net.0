Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BA2870962
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Mar 2024 19:20:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rhCvZ-0008TK-IY;
	Mon, 04 Mar 2024 18:20:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rhCvY-0008TB-3N
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Mar 2024 18:20:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b+bOU/y3FBi9I9SOoYRBhM7L7vuQijX/a9C724TTQh4=; b=eLwtHFwIzWHkTAqbWHbTDsrt+j
 OJu69lE5kA2FvU0oQDAHsALM++nX364xOIMKfyZxdhENqjet7wMw0XEbItS44w5VHwI+M0f69W29b
 tbGoZXJOTLxcm7iOyMy/muO6zk/GPViZWxcTL9VGUG4riF3FZBNkUFc6fbkR8eE2c39Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b+bOU/y3FBi9I9SOoYRBhM7L7vuQijX/a9C724TTQh4=; b=LV/PXkX9TL4wEgs+iqGA/5HU4m
 xb43M2vhXrWVrjeyDPMCPGvA3riC1E5sAKKudyGQlV0YJvFLU1S0zZ2rreEwxchZXLopIyOcLjLaK
 6GMAl35/OwbwYBrUGcPkONEfrgCMtAR0fqh/PUY4HLlQWIfi+VXJRJvsxCIx7aXhkaMY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rhCvR-0002fr-WF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Mar 2024 18:20:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A4988611A3;
 Mon,  4 Mar 2024 18:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0306FC433B2;
 Mon,  4 Mar 2024 18:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709576429;
 bh=3+YKLBXSvm2KnOYfZ9A26/aG3sIoBMt8bfvbid9PFaU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=PXmSdw/TWbB+0ho1n3G9PcRqUsDVD70CSwL3mYRByVbYI3523/ChvtgAVYCxjCB7a
 Sg10ID4XhnErJOH1ZiBAQJXOa7HgpaX+jdY1xtQRugUGx/M/c5hAiN4G+uUvOLPr/5
 2CeHeJ/0PS6J4B60sAgmRBwjS0CF7+2fX1ZoyZa3kiMzkxfyksEtrDf5A6/uyGb4L+
 1+5Kq0FPdh54bNnaKvxCC0IMM77uze3gy/+jNWv8L2X8Vcu1CjwWT23+/iJ7vKUxAp
 LFi+OMBs88SBPk9uUAYFjz9K7980hM7XArQx9sg3yzNGosK0KGBTB4NB4GKrM6EkzH
 39KEfAeevHEtw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D15E3D88F89; Mon,  4 Mar 2024 18:20:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170957642885.16816.17706378772269565327.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 18:20:28 +0000
References: <1709281555-11373-1-git-send-email-zhiguo.niu@unisoc.com>
In-Reply-To: <1709281555-11373-1-git-send-email-zhiguo.niu@unisoc.com>
To: Zhiguo Niu <zhiguo.niu@unisoc.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 1 Mar 2024 16:25:54 +0800 you wrote:
 > __allocate_new_segment may return error when get_new_segment > fails, so
 its caller should check its return value. > > Signed-off-by: Zhiguo Niu
 <zhiguo. [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rhCvR-0002fr-WF
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix to check return value
 __allocate_new_segment
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hongyu.jin@unisoc.com,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 1 Mar 2024 16:25:54 +0800 you wrote:
> __allocate_new_segment may return error when get_new_segment
> fails, so its caller should check its return value.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
>  fs/f2fs/f2fs.h     | 2 +-
>  fs/f2fs/recovery.c | 2 +-
>  fs/f2fs/segment.c  | 7 +++++--
>  3 files changed, 7 insertions(+), 4 deletions(-)

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: fix to check return value __allocate_new_segment
    https://git.kernel.org/jaegeuk/f2fs/c/28f66cc65403
  - [f2fs-dev,2/2] f2fs: fix to check return value of f2fs_gc_range
    https://git.kernel.org/jaegeuk/f2fs/c/22af1b8c31cb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
