Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED2893AB0F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jul 2024 04:17:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWRYv-0007Mm-JT;
	Wed, 24 Jul 2024 02:17:06 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sWRYt-0007M4-Em
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jul 2024 02:17:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KbDTjoP/C6xjmkhAZqPe1I/tihgg9YwqsVwy1FLlXFA=; b=aEVRc6EkaX+c4v4rZ7tjFKdgEi
 5l0e144Ae2KgeqJWNivHGojszBRA5SXmN0WZUvFyaGZ0ACBxgvDIEABjaNOyNRi2sEIal4NAlItuD
 5v2Lz3dIFkr6GjHO946NfR0hwdq9HYzHaVzbJdtXc3gtD/v2WNVm5tur6eR0WWNQ91bE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KbDTjoP/C6xjmkhAZqPe1I/tihgg9YwqsVwy1FLlXFA=; b=fOzkuumULc2QsXrEBEvPwCjN1N
 15QfxY3DeL0+vFsEYeQfHdfmoRzC/+VGTI9lRsyOXokeeuNeS1pc1yaG5CicO21maAS+mDVgbAGfm
 ttRLz+bTE7OroYXI/KDP1dyy7Lj+AQDUD3xyQNcggm2zqH9H7B4LQb2k+qwGzTmTCUi0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWRYo-0002I9-7b for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jul 2024 02:16:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D331C6119F;
 Wed, 24 Jul 2024 02:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5B70C4AF18;
 Wed, 24 Jul 2024 02:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721787406;
 bh=uOhx3iyOqZfaap9huG8iloFal4jT6CiWr3f80xG7QOU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=nulDWwYH8l0hWWUETLAk7bpiheKu7MESq9AbkM0cZFEpiJcsuolnCatCt6Rra2A1D
 RHMwlVgK2bYwUwE3Sl50Xtnc9mqmaAWs1a9OSxLiYSHg4tjt2qNXA/YXqL4BHzj+uB
 WgHhupyvP8VJYUPdFiKuKpuZmjAY6HYeRIsnlTu8vClXoTmjC2PEvoe0KY3/8/tQRQ
 Vi5P15h1rm4ki+b+rztHNgxOMoOqLrZl4GQv4wsI14/Bj4i5Ijksd7FGX16XS2BKDm
 yaReHS6UlSV24T7IpahVZ3w1rA2x0o6SthmQ3JMcCZcCeihP76AiKRPrjNvGKPHn43
 itjEaaQpvr61A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B5F6FC8E8DD; Wed, 24 Jul 2024 02:16:46 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <172178740674.17759.3977282531593034304.git-patchwork-notify@kernel.org>
Date: Wed, 24 Jul 2024 02:16:46 +0000
References: <20240208064334.268216-1-eugen.hristev@collabora.com>
In-Reply-To: <20240208064334.268216-1-eugen.hristev@collabora.com>
To: Eugen Hristev <eugen.hristev@collabora.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Christian Brauner <brauner@kernel.org>: On Thu, 8 Feb 2024 08:43:31 +0200
 you wrote: > Hello,
 > > I am trying to respin the series here : >
 https://www.spinics.net/lists/linux-ext4/msg85081.html
 > > To make it easier to apply I split it int [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: spinics.net]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sWRYo-0002I9-7b
Subject: Re: [f2fs-dev] [RESEND PATCH v9 0/3] Introduce case-insensitive
 string comparison helper
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
Cc: brauner@kernel.org, kernel@collabora.com, tytso@mit.edu, jack@suse.cz,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 adilger.kernel@dilger.ca, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Christian Brauner <brauner@kernel.org>:

On Thu,  8 Feb 2024 08:43:31 +0200 you wrote:
> Hello,
> 
> I am trying to respin the series here :
> https://www.spinics.net/lists/linux-ext4/msg85081.html
> 
> To make it easier to apply I split it into smaller chunks which address
> one single thing.
> This series is based on top of the first series here:
> https://marc.info/?l=linux-ext4&m=170728813912935&w=2
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,RESEND,v9,1/3] libfs: Introduce case-insensitive string comparison helper
    (no matching commit)
  - [f2fs-dev,RESEND,v9,2/3] ext4: Reuse generic_ci_match for ci comparisons
    (no matching commit)
  - [f2fs-dev,RESEND,v9,3/3] f2fs: Reuse generic_ci_match for ci comparisons
    https://git.kernel.org/jaegeuk/f2fs/c/d66858eb0c72

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
