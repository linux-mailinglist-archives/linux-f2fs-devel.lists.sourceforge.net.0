Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D25A19A4E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jan 2025 22:20:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tai9B-0007bV-JE;
	Wed, 22 Jan 2025 21:20:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tai99-0007bN-Si
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Jan 2025 21:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JsBWNc23iiHxTszk952XnHCWa+waCnlEIaURk4pxW3o=; b=DribJVHXHw0t334lvizs42TvSV
 GY1yLOu+MNdfV/b0+LtApeJaLV9xkPNf/eh8e48h6XVDBNzVRNZ5CjAw9qvw+CwGLRVYR+97KLxlr
 otS8D7q+InwOm/tVRdJACZ/WMr8Dvzs0erm+Dexv1Ihjtyitn0Vf+FZVZxthbEncDZVc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JsBWNc23iiHxTszk952XnHCWa+waCnlEIaURk4pxW3o=; b=DpietWQ4uJnjFePucohwdlOUPm
 RIlsdegSDTzNOIpjh4koIrUr2noOJqobXm9SjnCKVxPiGYWWUXu69pQc+UKyCZMuOWiRwXs3Xww2u
 WNcDVNoTjlQcPnDmkch5PLmonh17Sbeani8Tsp0uj/VSYHXD6tJQ2vgwpfD/OmhGVSkg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tai98-0005NT-LM for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Jan 2025 21:20:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E7FD05C615F;
 Wed, 22 Jan 2025 21:19:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04DB0C4CED2;
 Wed, 22 Jan 2025 21:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737580812;
 bh=+Q7LFwUZda3SrgpKQEAzCV4LAgsTqtdaHROntrcJtVg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=lmuolhWovFS7hsDSVwZGsgORqWPSNWschR3OgFn6C9g2aleJ0SKLUs+EE3QVgOO5B
 BrWzkTLGCP713+tPg4wzqCo5ytpbgNHjzGfxhvrXkNn3L1G2PMwPseEV9ay6oG3Ph+
 kIW8WWC6RSHeWzh+l7aQAUktkPgDAeiXcSCCW5mmKfz2YlIRTf+iuRqcwwT2VDvds0
 RyfF8X3ncnh/QSa+daMPbRX+q1gHVMt8eG2w8T3QuFaIc/MPtjnUJpKSBSJNtXRK8m
 geF0P41gQv75g+j/IAnBqafl2wikt2xgJWHGZKvBb5ZALAGkjnGECOz4eHatslWEWC
 eTdKbl9ExpBzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADD7C380AA62; Wed, 22 Jan 2025 21:20:37 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173758083652.821180.16921883379931025676.git-patchwork-notify@kernel.org>
Date: Wed, 22 Jan 2025 21:20:36 +0000
References: <20250113014702.2312729-1-yi.sun@unisoc.com>
In-Reply-To: <20250113014702.2312729-1-yi.sun@unisoc.com>
To: Yi Sun <yi.sun@unisoc.com>
X-Spam-Score: -8.2 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 13 Jan 2025 09:47:02 +0800 you
 wrote: > Now f2fs_invalidate_blocks() supports a continuous range of addresses,
 > so the for loop can be omitted. > > Signed-off-by: Yi Sun
 <yi.sun@unisoc.com> > [...] 
 Content analysis details:   (-8.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tai98-0005NT-LM
Subject: Re: [f2fs-dev] [PATCH] f2fs: Clean up the loop outside of
 f2fs_invalidate_blocks()
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
Cc: Ke.Wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, zhiguo.niu@unisoc.com,
 jaegeuk@kernel.org, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 13 Jan 2025 09:47:02 +0800 you wrote:
> Now f2fs_invalidate_blocks() supports a continuous range of addresses,
> so the for loop can be omitted.
> 
> Signed-off-by: Yi Sun <yi.sun@unisoc.com>
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
>  fs/f2fs/file.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: Clean up the loop outside of f2fs_invalidate_blocks()
    https://git.kernel.org/jaegeuk/f2fs/c/6d4008dc4a8e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
