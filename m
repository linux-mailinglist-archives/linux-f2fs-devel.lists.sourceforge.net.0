Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34216666389
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Jan 2023 20:20:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pFgeA-00072c-6o;
	Wed, 11 Jan 2023 19:20:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pFge8-00072W-RX
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jan 2023 19:20:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i94L1ksy+mivigY/YGznbkEIFS/UPYEtSjA+R+0kESk=; b=Mq/Vh7rZn4Nkjfbe2R+TqaYUOD
 fMj+MADCNWWrbOjynGGsQLXxB2WHvVR/CGbUbBVWfOJBSXf6fzT1mMcSXG0ZKlInd6I+DNAfMZmka
 wwMIHe9om4EowxQBLRBCSf/7kG5UcVBGi/bO+Z78ikv+trwX/gdBnG/qOFlbiZJYgODc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i94L1ksy+mivigY/YGznbkEIFS/UPYEtSjA+R+0kESk=; b=E9TI3jc/clV2A20lPrQRMUw2vF
 eZdYfZK88WenwxOme72xoq8ay+fchHe7xs6n2SPyibpvMo+kUiAZgH+I5THHdV3wpXcrKc/YOh/Wn
 cM5WqIaaWb8MA7ttHvo38hpmdkYdDPjlnTCgRYRYLO/QsfCzYIW2S8mkSDcsLMm5kASg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pFge7-0001VF-KT for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jan 2023 19:20:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3C9D161E07;
 Wed, 11 Jan 2023 19:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06ACBC433AE;
 Wed, 11 Jan 2023 19:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673464818;
 bh=kNvNOvylHjWzU3GA1gta75zMrroVfqpYNdHi3hvG1y0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=P5vBoI+sbqBd9z2VYX0Whmvz/Yfprf+uCGsDo7wAT544GfnC0N+VzYM3k5D8vyC4G
 mJPDbJ2HDJEMVAgT0f2mueSB1WMuF4rTvKW7dzf5AaH7tUE1e4bo7Jj/esa+UxhL1A
 /FB0+/5j2xEXWAzhAvX3aOqyRMAAQu0OjkMdZpZpOdny9/3AjB/TBUtLMFFMXhuXZ5
 FHzZViQuEIEtVCyiskFxbh1Ke1pLVjNx37fp5TG/J66eDuglpx9HNAGExqLh34pwm0
 HRTyCY1ecQy2jumWKojpM3hY++wDYwdaiEIY1uIR2go2Tdh+tJ1i0qVVHoCYpvFdLh
 eMmW/bU2ZCegQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D6C89E524C9; Wed, 11 Jan 2023 19:20:17 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167346481787.5008.1714393402439701709.git-patchwork-notify@kernel.org>
Date: Wed, 11 Jan 2023 19:20:17 +0000
References: <20221229131828.59116-1-frank.li@vivo.com>
In-Reply-To: <20221229131828.59116-1-frank.li@vivo.com>
To: Yangtao Li <frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 29 Dec 2022 21:18:28 +0800 you
 wrote: > f2fs_init_compress_mempool() only initializes the memory pool during
 > the f2fs module init phase. Let's mark it as __init like any other >
 function. > [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pFge7-0001VF-KT
Subject: Re: [f2fs-dev] [PATCH] f2fs: mark f2fs_init_compress_mempool w/
 __init
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

On Thu, 29 Dec 2022 21:18:28 +0800 you wrote:
> f2fs_init_compress_mempool() only initializes the memory pool during
> the f2fs module init phase. Let's mark it as __init like any other
> function.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  fs/f2fs/compress.c | 2 +-
>  fs/f2fs/f2fs.h     | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: mark f2fs_init_compress_mempool w/ __init
    https://git.kernel.org/jaegeuk/f2fs/c/a1357a91ec9e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
