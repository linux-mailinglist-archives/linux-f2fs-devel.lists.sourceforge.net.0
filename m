Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A5F68E0B5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Feb 2023 20:00:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pPTCc-0006zq-Cp;
	Tue, 07 Feb 2023 19:00:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pPTCb-0006zj-A0
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Feb 2023 19:00:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gMxjgZt0z8E/fMF90dK8nCZM/POYKo2vJQhVrJPeNrQ=; b=ECKK6Z/wuECHh0PsaHFK5Njb7f
 AFHlcneCkpkfhvivVrujdhGBzzNfR63+/1z0TmZI/0rAkcxtuZKgrOXlHb87odbhh+N1gYGL/GF+p
 exgLfABYKN89RDawMMPsZcS1j9zzEs4BRz+Ds7vBUeHkH4m34QEsBBr7IQOz1PEqVqwg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gMxjgZt0z8E/fMF90dK8nCZM/POYKo2vJQhVrJPeNrQ=; b=cPvAdhfZDqRQrLaAIHhcY64j2m
 TCBN9raG5yBlP7sB7eVZjCmKcqo5vH7M0IHBsSxAqQXI07EJ1y59qLdSMh3EXTmUwpRPaA6tVHVQz
 m40YKS6g4709CHVf29Jawu+FZpKvnqEfqW4T4foBrzf8tdHCt7rdLiLOUZw8WHqwUvn0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pPTCZ-0005dq-4S for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Feb 2023 19:00:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84B2F61137
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  7 Feb 2023 19:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8337C4339B;
 Tue,  7 Feb 2023 19:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675796417;
 bh=r6UlP/dJGLR+YQx8+K0+rvbOWs3Gze3w+cUIcIpyEcQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XBM05Z/dQUrHSGNNknUCuLAZG9cWOZ9cWABPZbwUMpodUiLcdKum9BtT12O8a0yia
 1HWxcxHFD2FVBF/KXz5LYM69l73EIKEBsLeMCrdP26fc7sMqglH2Wwd1GIvqVkFwq5
 C8V7pvQZaMSI/gsPO+C+ueqtxxFURWC4fjeZNGYFIoZhbLKObugpMCCq9ebyMAJrjw
 ZCDFkYTSntfj7St3RvGr85fOR7/kCkglkxDjxsskun3KXI6ODRBokquJyr2uGKe+cP
 qqA3jRzqJvOfSHyKETFgJbrv7w2vcDRW5xpktcd3ULzTAHGFGrxu4pNeaROxXI/sb8
 qLA9hpdpRutLg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C2E39E55EFD; Tue,  7 Feb 2023 19:00:17 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167579641779.24576.11865638891088345725.git-patchwork-notify@kernel.org>
Date: Tue, 07 Feb 2023 19:00:17 +0000
References: <20230206034344.724593-1-jaegeuk@kernel.org>
In-Reply-To: <20230206034344.724593-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sun, 5 Feb 2023 19:43:44 -0800 you wrote:
 > We should return when io->bio is null before doing anything. Otherwise,
 panic. > > BUG: kernel NULL pointer dereference, address: 0000000000000010
 > RIP: [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pPTCZ-0005dq-4S
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix kernel crash due to null io->bio
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sun,  5 Feb 2023 19:43:44 -0800 you wrote:
> We should return when io->bio is null before doing anything. Otherwise, panic.
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000010
> RIP: 0010:__submit_merged_write_cond+0x164/0x240 [f2fs]
> Call Trace:
>  <TASK>
>  f2fs_submit_merged_write+0x1d/0x30 [f2fs]
>  commit_checkpoint+0x110/0x1e0 [f2fs]
>  f2fs_write_checkpoint+0x9f7/0xf00 [f2fs]
>  ? __pfx_issue_checkpoint_thread+0x10/0x10 [f2fs]
>  __checkpoint_and_complete_reqs+0x84/0x190 [f2fs]
>  ? preempt_count_add+0x82/0xc0
>  ? __pfx_issue_checkpoint_thread+0x10/0x10 [f2fs]
>  issue_checkpoint_thread+0x4c/0xf0 [f2fs]
>  ? __pfx_autoremove_wake_function+0x10/0x10
>  kthread+0xff/0x130
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork+0x2c/0x50
>  </TASK>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix kernel crash due to null io->bio
    https://git.kernel.org/jaegeuk/f2fs/c/267c159f9c7b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
