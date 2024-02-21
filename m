Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BA185E53D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Feb 2024 19:10:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcr3M-0007rC-Ae;
	Wed, 21 Feb 2024 18:10:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rcr3K-0007qs-LM
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Feb 2024 18:10:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7WrCL/o0ujc+VDRTjaTSu49V07fIrj0tDV0KaOoRYcg=; b=UN6g3ZuxIjLhTi0GSFI4jRp+Bh
 iH5FNQDSrY7sNxgRNKGLcv8HV6njgXrGyManx6/jgRafz6YvzM2TnEpWoUHfCIKC80RzTW18zCUS6
 zaMWJFTvJYKWUGilRv3P1TzqUlIZfakruXsbXC6FwOeLzjdhH9uwnR57V1yeB76AOulc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7WrCL/o0ujc+VDRTjaTSu49V07fIrj0tDV0KaOoRYcg=; b=ENvl+DIuuhVH1ORYhLtbhga9EN
 yF995v3xYYglsnXMztza2Ts9z5wmIye6QwER1RMZQFrXTnkqp3m9EOeoiVLTCn9gmuXoZ1ZBIkzCx
 W67rtJuInyoYNAcyFr3545vs9moJdL03BogUeeSZqHAs8+H6cLN35pYHl6DCv6rxBRcA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcr3J-0001SM-8B for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Feb 2024 18:10:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 12C1261584;
 Wed, 21 Feb 2024 18:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0663AC43390;
 Wed, 21 Feb 2024 18:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708539031;
 bh=LSFSDBN2BbV4Ss6DjtJcV5DIXFbLDO9Oe2KGI/JU90s=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=bsQmEVwUXjdVtTfsHXMUs1WEBqVwsmHT8htXjGEvXEOXUWUnwM4MYrT/DJBoRSEC/
 El3PxgYnfxjxK9B4bhz5NCiVE3T+/TIsWVdMYZzfnCGYcuI/ObVQ6qRQgMlw+WzTJY
 aNgbubCBLz+isAtPWE9MfC93bMK1GAm0uQi4Ra/q9xKTCDWo4AmNr488MI2m3aXNru
 qMjhpCLETG2UQ5AObHkcENTrb9YE9PPxGKdH0h4TEwXhwPgjRuawt9vvBZdLhq0pA6
 wSUHcqrameM/Jaks5n3KiRD7bNftWPs0QH9hfQPKdbG+iNADWdkJh0wwU3I7IbzgN4
 Xh6/qMG6+Tsfg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E1581D84BCD; Wed, 21 Feb 2024 18:10:30 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170853903091.7043.10526328421276609740.git-patchwork-notify@kernel.org>
Date: Wed, 21 Feb 2024 18:10:30 +0000
References: <20240213173812.1432663-1-daeho43@gmail.com>
In-Reply-To: <20240213173812.1432663-1-daeho43@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 13 Feb 2024 09:38:11 -0800 you
 wrote: > From: Daeho Jeong <daehojeong@google.com> > > Make f2fs_gc_range()
 an extenal function to use it for GC for a range. > > Signed-off-by: Daeho
 Jeong <dae [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rcr3J-0001SM-8B
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs: separate f2fs_gc_range() to use
 GC for a range
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
Cc: jaegeuk@kernel.org, daehojeong@google.com, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 13 Feb 2024 09:38:11 -0800 you wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Make f2fs_gc_range() an extenal function to use it for GC for a range.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3,1/2] f2fs: separate f2fs_gc_range() to use GC for a range
    https://git.kernel.org/jaegeuk/f2fs/c/50581e3bda8f
  - [f2fs-dev,v3,2/2] f2fs: support file pinning for zoned devices
    https://git.kernel.org/jaegeuk/f2fs/c/2fded30d8dce

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
