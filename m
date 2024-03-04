Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A7E870960
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Mar 2024 19:20:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rhCvX-0001Dq-DL;
	Mon, 04 Mar 2024 18:20:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rhCvT-0001Dh-OW
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Mar 2024 18:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jIXCNE45wUzjVZFPD4JmKu1nfLrV1amCraPxnIHP9wE=; b=CXwwqntjRcbwi6FEudpskZprd4
 mlvae/1nZQTWV0ro9aHupX2GljHffwUyATw14ern6ysrCAsRZEnLCox2EOeq/ukyZW6MX+i7Uq953
 GSsiR/hiGK+8toTDQzdDGXm5NL8Pvp65xtH0UsZoyuY9R0DFuCX14rbE0eCD2eIG1ySI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jIXCNE45wUzjVZFPD4JmKu1nfLrV1amCraPxnIHP9wE=; b=LpFK8KCavcsFBZU1czKjpqjsSd
 ijW7sZTz9kGcV5A4UFe0rOvU1xS6oDW2EvL2q4c3yNKbV87d/Fxz2TZswqprzdkpVD2shMFxCPGD0
 NoSuDbI0cgOIv9IMhxcdWb2hcRQ9TOUx1zjA4XYEm/6DS4CQvAHVqPzXqp7nRhfOk80U=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rhCvN-0002fS-0E for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Mar 2024 18:20:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AE129611A5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Mar 2024 18:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A051C43394;
 Mon,  4 Mar 2024 18:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709576429;
 bh=T/3X6veZz+sGmgDP8Q15OLLlrv9DMOr44wm5m9TkjeM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ATryanJEpR8w0/e4fGxx04fafHwzfufxnkG4e+UIeedu26opiBwueB4q95yqEi1O9
 DAN3+Q7Pw9JPUR2teOWhQP7v6eP9PXIcyg3/azCR6IuE4XJEZloKJ/0rKlJtGyOaEV
 T3PbtwnlkVZhlC9R16urInrACZJD9y9mCY9T+qbPd6PVYdy0qM4DZA2xu7yppAckIG
 p5ausljT2UDuYYeq6zbez0TNnkRHG77jsHfOApEi1SD5S1kaHj3j/GE8B2BXYWthMq
 6bATvzTY05aoDL0C8b/z40TAAa0mUDLQZ7QxQRnKA+/Ndkli7PPEtAPJgFD452FOSW
 P57xnsOT4vQNg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D9C91D88F87; Mon,  4 Mar 2024 18:20:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170957642888.16816.6219443757049318154.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 18:20:28 +0000
References: <20240226013208.2389246-1-chao@kernel.org>
In-Reply-To: <20240226013208.2389246-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 26 Feb 2024 09:32:05 +0800 you
 wrote: > In f2fs_migrate_blocks(), when traversing blocks in last section,
 > blkofs_end should be (start_blk + blkcnt - 1) % blk_per_sec, fix it. >
 > Signed-off- [...] 
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
X-Headers-End: 1rhCvN-0002fS-0E
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: fix blkofs_end correctly in
 f2fs_migrate_blocks()
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

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 26 Feb 2024 09:32:05 +0800 you wrote:
> In f2fs_migrate_blocks(), when traversing blocks in last section,
> blkofs_end should be (start_blk + blkcnt - 1) % blk_per_sec, fix it.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/data.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [f2fs-dev,1/4] f2fs: fix blkofs_end correctly in f2fs_migrate_blocks()
    https://git.kernel.org/jaegeuk/f2fs/c/8249aac1b05c
  - [f2fs-dev,2/4] f2fs: relocate f2fs_precache_extents() in f2fs_swap_activate()
    https://git.kernel.org/jaegeuk/f2fs/c/f1e7646a8cd4
  - [f2fs-dev,3/4] f2fs: clean up new_curseg()
    https://git.kernel.org/jaegeuk/f2fs/c/1081b5121b27
  - [f2fs-dev,4/4] f2fs: fix to reset fields for unloaded curseg
    https://git.kernel.org/jaegeuk/f2fs/c/42a80aacb76b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
