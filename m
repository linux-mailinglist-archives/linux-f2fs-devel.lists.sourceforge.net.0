Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A64E813BFF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Dec 2023 21:50:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rDsfL-0001At-AR;
	Thu, 14 Dec 2023 20:50:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rDsfJ-0001Am-9v
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Dec 2023 20:50:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2mE0ogaXvm6kpdq7ftut6uEcBJwBz7LKqQkhaRzo6V0=; b=HgNfpnjlCsVKW3YGfYNom4uz/k
 +9SwsNWHDf7fDC12mpwxuP95Po/jYCagKPvFdOLiPs4J+c/3CLjmd93bLMVVexwQbhYX+K8C5b6Ek
 uIUOphf0CdRVVuhfSm9HhOHJ0I4SSS8EkIrkLfSHufs+/zrg3RbPev3syM/1/tsTC5QA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2mE0ogaXvm6kpdq7ftut6uEcBJwBz7LKqQkhaRzo6V0=; b=TpVT/vqCTEepBRqEd59okzptL2
 RvNajMYZrPgdq6r//OcJNcwPoSjs54aDsGo8ko3fnoi8FHMM9w7mUeHwpg88bWMSPK2cSePp8GP7I
 sOpvZlwxYWpTIj0FHD9P7B28A38Rb1yF9bv/nfE3jZi0/JW+PpxFpEfTpkmfpU+ueYTw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rDsfI-0000k5-IQ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Dec 2023 20:50:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C1F22B824B6;
 Thu, 14 Dec 2023 20:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F6C6C43391;
 Thu, 14 Dec 2023 20:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702587032;
 bh=giIJJNHa79sB0uALPwRRpHKv5T4mQDGH2IspWi9ybL8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=qSU6UZBovSYH49iaCntw78CR6ewX4MpTkVSb8c+wfYeWngmlPKCZJdAZbQybjdzfp
 WQA05Seg5gAYPG6QTHBBDOdgO6uy7uvECN+ID+urjHLRS6D/3IsRz12WH6h0mfBtNC
 KmFCV44o2JuVhmqR27ZWlP9ETa1QVsA52WBrc1N44yLrgs7AE0m2hfPTPktIlOhbsm
 DzwtyZxduquidrYNVXC/ktNpZ3Rr+oDz1mIIZLeNthutagNrqqwiASyHPOBOtl9dbn
 X4fMsjWHU1vRRw2uvTuSfmI+Z75YoImWLPWOESON1uk7wVmyQZbNMBuCxc8Zmzg04N
 2EOpPQpdxayTQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1FC10DD4EFA; Thu, 14 Dec 2023 20:50:32 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170258703212.30587.8025897708876464523.git-patchwork-notify@kernel.org>
Date: Thu, 14 Dec 2023 20:50:32 +0000
References: <20231212010120.252763-1-chao@kernel.org>
In-Reply-To: <20231212010120.252763-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 12 Dec 2023 09:01:20 +0800 you
 wrote: > In f2fs_preallocate_blocks(), if it is partial write in 4KB, it's
 not > necessary to call f2fs_map_blocks() and set FI_PREALLOCATED_ALL flag.
 > > Cc: Er [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rDsfI-0000k5-IQ
Subject: Re: [f2fs-dev] [PATCH v2 4/6] f2fs: don't set FI_PREALLOCATED_ALL
 for partial write
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
 linux-kernel@vger.kernel.org, ebiggers@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 12 Dec 2023 09:01:20 +0800 you wrote:
> In f2fs_preallocate_blocks(), if it is partial write in 4KB, it's not
> necessary to call f2fs_map_blocks() and set FI_PREALLOCATED_ALL flag.
> 
> Cc: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - clean up codes
>  fs/f2fs/file.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev,v2,4/6] f2fs: don't set FI_PREALLOCATED_ALL for partial write
    https://git.kernel.org/jaegeuk/f2fs/c/394e7f4dbb32

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
