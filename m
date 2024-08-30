Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F951966AED
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Aug 2024 22:52:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sk8bH-00054d-12;
	Fri, 30 Aug 2024 20:52:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sk8bF-00054C-GT
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Aug 2024 20:52:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ty3PmaxjvbDMWL4PlRdp0DAQeY9IO/8N1ct6GRB5RyM=; b=OuSJErjZOzC5szLi1AKi+6R5s4
 dHpBfziO70nI9u0ZnjBODoovxMZkvD3OZhxquubuwnPuUn98pZgNoKWg8ZStCWdVZzyBOaY39fh1j
 hVF3qJfCWE+FCBgzRHEkz53LPCU8X1vQECGCTQLS8Igmljr6qM/mSfKhr/GCsa6Iiz1M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ty3PmaxjvbDMWL4PlRdp0DAQeY9IO/8N1ct6GRB5RyM=; b=RPJFCocJIqSvMuYQnpNlbAgOLl
 pSrEI9M0L1qgvlWmF1Cmy+ukVYNGsSH0lrx6LcLV0KxnpNcXbSNLmKOxiUPioljzboE9bWiBcHl8S
 SaoZdVLvCqAJ5ilddK2+2sRqfHGjTCuJcmzXVhGbVkhwNUC+k0TiV9AiK+mJMHHF07Gw=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sk8bD-0005np-IP for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Aug 2024 20:52:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E180FA41AC3;
 Fri, 30 Aug 2024 20:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40D5C4CEC8;
 Fri, 30 Aug 2024 20:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725051112;
 bh=BNWTmh8ILq4X1+YYGpjMMgsqivyDFQ8a56TQ7PCIOWk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=PHpUApkg3f5qVmWIKi4imN5/nzHh9AUpuTyTJWlQrJRqxyXS8htag6beGqyj/O8ga
 m2JbZNL13IA20fgqRNx8YIudGPeLKQkXnLDLonrlv36bM8iQ9mab2/TDFINtKaSAc0
 S1kvq95WgqZYMv8SPRbVT7rGcmhARRxSFCUVCgoLb33E8x5QhqtTUseydkWtyRm/zl
 tyt7P2117bp+wx243RmjsNx0sD3P/aPbVFr1wWqoNXYLnFFWpOE+NggBjdv1T9Yq6p
 eH9KyeEIVizTv9jq1WJC/P3o+/IdGk8vyuksq5er+m5BPWADYKlNnWDd8qw/NsKdLf
 BjRYZY7tnUPtA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 7100D3809A80; Fri, 30 Aug 2024 20:51:54 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <172505111299.2712133.3150061801664189477.git-patchwork-notify@kernel.org>
Date: Fri, 30 Aug 2024 20:51:52 +0000
References: <20240826202352.2150294-1-daeho43@gmail.com>
In-Reply-To: <20240826202352.2150294-1-daeho43@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 26 Aug 2024 13:23:52 -0700 you
 wrote: > From: Daeho Jeong <daehojeong@google.com> > > Keep atomic file clean
 while updating and make it dirtied during commit > in order to avoid
 unnecessary an [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sk8bD-0005np-IP
Subject: Re: [f2fs-dev] [PATCH] f2fs: prevent atomic file from being dirtied
 before commit
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
Cc: daehojeong@google.com, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 26 Aug 2024 13:23:52 -0700 you wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Keep atomic file clean while updating and make it dirtied during commit
> in order to avoid unnecessary and excessive inode updates in the previous
> fix.
> 
> Fixes: 4bf78322346f ("f2fs: mark inode dirty for FI_ATOMIC_COMMITTED flag")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: prevent atomic file from being dirtied before commit
    https://git.kernel.org/jaegeuk/f2fs/c/a433a8f0eb31

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
