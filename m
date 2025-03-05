Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 471ABA502A6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Mar 2025 15:50:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tpq4d-00011P-1D;
	Wed, 05 Mar 2025 14:50:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tpq4b-00011J-SX
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Mar 2025 14:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cmwBzJoS2VXzdkHqoHFti+sT0l7hEuYj3FneuL6w1JY=; b=Rouanw7z0vRDBmp2k5RV2M0Z61
 2RAXQ1UiP+0PRrGg/LyFQnEP9P/xPB+jzVvYGPqCKZRWlwwS6QdW1fizNuKWpQZBKy7UN11WRj3tm
 J42ecCeJx6TcBzxQsQCoiDM9Xyql0kdOO0WjxVIosbHLwstDhtpQieaXSFxmxLBSEiic=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cmwBzJoS2VXzdkHqoHFti+sT0l7hEuYj3FneuL6w1JY=; b=SSPG4wnWG2Waxl3bFu7v2HGQqs
 7R6wqK9O2RuoPL15MQBf4EDhxfQluibaRoCuEdFldx+EzKrs+xN5n0ES8Iv1sOgq7sjlct1i7G854
 PQS3LOKmbNvT7WY9WmdV/YsQvlnWn1TdE+JvR/VijOx4y4K0AiA2TAgECiE0ZwHUiDQI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tpq4R-0006df-6i for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Mar 2025 14:50:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 03EA65C69FF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  5 Mar 2025 14:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2FC6C4AF09;
 Wed,  5 Mar 2025 14:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741186197;
 bh=9xEXhLrBR5atNK+lZw0zgbyBegFoX8kfwxdSVNfyf5s=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=P+gzu8k1f5u3myFSIBSNXqozxdXNAQN18iCv0XmC+hXV1yce05voilvCcXnfbMxEH
 0VKWAWsOCvwgu7df3xt6HmOvnUd8A0CFGG95uSBS8vsOFm3CtA+1jdlzr9LmAXctGw
 w4iObZIxSaIkF79dFQ/RQrTvJpa7CCdbe+xZ7REgfvvuX3dJCwYnv0Qoq8uUVZ0Fp5
 FdLI0Jr3HWcGs65siLM3u+RxncHyK187oPNShalB9d9eVedbFVCsKJu0LZZG7OYS9X
 yk+k9a4dDMAdxF9O8XPNH/r3CJ1qMTRiPV73duFHUEEI8sxFW0+5K281rPGZqtlTS/
 EKgH1AvN6ciKQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB232380CEDD; Wed,  5 Mar 2025 14:50:31 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174118623075.908551.2988977620651257899.git-patchwork-notify@kernel.org>
Date: Wed, 05 Mar 2025 14:50:30 +0000
References: <20250303221730.1284822-1-jaegeuk@kernel.org>
In-Reply-To: <20250303221730.1284822-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 3 Mar 2025 22:17:30 +0000 you wrote:
 > The checkpoint is the top priority thread which can stop all the filesystem
 > operations. Let's make it RT priority. > > Signed-off-by: Jaegeuk Kim <jaeg
 [...] Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tpq4R-0006df-6i
Subject: Re: [f2fs-dev] [PATCH] f2fs: set highest IO priority for checkpoint
 thread
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
From: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: patchwork-bot+f2fs@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon,  3 Mar 2025 22:17:30 +0000 you wrote:
> The checkpoint is the top priority thread which can stop all the filesystem
> operations. Let's make it RT priority.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/checkpoint.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: set highest IO priority for checkpoint thread
    https://git.kernel.org/jaegeuk/f2fs/c/8a2d9f00d502

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
