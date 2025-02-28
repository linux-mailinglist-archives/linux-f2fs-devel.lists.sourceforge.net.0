Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D4BA49ED3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Feb 2025 17:31:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1to3GK-0002sp-DC;
	Fri, 28 Feb 2025 16:30:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1to3Fa-0002sI-1P
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Feb 2025 16:30:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5bX7rC1r5sn5zuyiiaUXa9EDbOxSW6xz7QZTv1IHakk=; b=PSKLFAUgepasRYx2v+aqLJfFLt
 Sc5SG/NlqDA5Wg9NHQIuGFLCPLXk/2Jngqj++sspmbed6qITZf0Q0tk/+QSxSMymyFMvkcfJw0ExT
 q+89uirRQi8vRvxfIWw/Dfc9HBjrUyUKOx/14YPwT/o45eB4C/qzeGGSf+XydIFp1GWI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5bX7rC1r5sn5zuyiiaUXa9EDbOxSW6xz7QZTv1IHakk=; b=VOSMlFnKyBNuqF4SoCDCEUDlfL
 hPlxTthdU7dSdgtRNmmEHrQznClPo3HuNQiO7e+1KE4wQEcIeh79vfTY7pytVGpMMuUp6bPDdC/yE
 2cO2Bg82IhwWn7pzyCrqZDmQQBWEkdvJyLJwOnCg7Y4DOo/OA5PLR3gfnhX3/y18fq+0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1to3FY-0001b8-8a for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Feb 2025 16:30:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0941E5C67C0;
 Fri, 28 Feb 2025 16:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB23C4CEE5;
 Fri, 28 Feb 2025 16:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740760202;
 bh=YG9VrbbJr4DxSSh5Gb7qipZ8op4p6fRDOhDjWk3vF6k=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=M/yw6AqK47oxlHlP3ljgIoEVMsrvc4gzOKQ/JIaP9F4ynom8xlYn0SAX2Ergvl3WL
 oJc4SkA4zSSp/5EEnu4eYlJGOvCosRC02bYb4wsd+SXOvKFL9uZTrwXiG0EzA58tAA
 fxaJgWJwjkCALP4ezztuxW1TfWhGWhN2BU0g0jU3QfiTLwPV95pKb9cli9iUuI3TTw
 M5xRoQlIthV9UzTGp3x6szdJJ1g181GUrSac5QRgozNTsO1b6Vm2qJ4aXb5UD5/hmu
 r+PPTsvXDXMWErKY2xl07jnZPu8+tY1JHXcfQQsvlGvflov5EJRyjNQUFdFzua9nF1
 ZCJuLIBH95s9w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EADCC380CFF1; Fri, 28 Feb 2025 16:30:35 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174076023474.2198557.14487536579623357304.git-patchwork-notify@kernel.org>
Date: Fri, 28 Feb 2025 16:30:34 +0000
References: <20250224062007.1324623-1-chao@kernel.org>
In-Reply-To: <20250224062007.1324623-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 24 Feb 2025 14:20:07 +0800 you
 wrote: > commit 4f993264fe29 ("f2fs: introduce discard_unit mount option")
 introduced > a bug, when we enable discard_unit=section option, it will set
 > .discard [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1to3FY-0001b8-8a
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to set .discard_granularity
 correctly
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 daehojeong@google.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 24 Feb 2025 14:20:07 +0800 you wrote:
> commit 4f993264fe29 ("f2fs: introduce discard_unit mount option") introduced
> a bug, when we enable discard_unit=section option, it will set
> .discard_granularity to BLKS_PER_SEC(), however discard granularity only
> supports [1, 512], once section size is not equal to segment size, it will
> cause issue_discard_thread() in DPOLICY_BG mode will not select discard entry
> w/ any granularity to issue.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to set .discard_granularity correctly
    https://git.kernel.org/jaegeuk/f2fs/c/1b60b23975d6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
