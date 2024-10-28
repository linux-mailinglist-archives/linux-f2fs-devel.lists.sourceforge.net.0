Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B4F9B37DF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2024 18:40:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5TjV-0002g4-1T;
	Mon, 28 Oct 2024 17:40:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1t5TjT-0002fr-Ml
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 17:40:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O42C7f87tihQL+ej9eXdS+xt2FKc2rDH5s3krVamips=; b=AD64FWzth/pTLNsQ8OBRJb8/ot
 pYies5V0koFKaj10c7x82D6MFFoGOBWJ38q8iMrDw5Tysi5XylwohueL72mDjynrW9oYaj0bdMnzw
 Lvdc7XOg0KJctHbPEEaaYsR9HWrS1lAWEtiklQpsqyUEZJMp96NO1GnMjZ0ybxvvOZLc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O42C7f87tihQL+ej9eXdS+xt2FKc2rDH5s3krVamips=; b=GcQE77l9uawjnlhrSiiFgFgOB5
 /jDeujf5PWMiRy6n4frni1Lg3ZIwki7znZgibODTK+Jv4d/EdL5pUYIvxxUVC9JzdLrluhUMNOm4s
 SkxMxP1GVwdT4A10wGEqUDOqwrV/WTLOjCl1jqZIRe5ysuN5s7NIHMdBC7pw0DTwmhqI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5TjT-0005Hh-SI for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 17:40:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 577C15C4869;
 Mon, 28 Oct 2024 17:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F77C4CEF1;
 Mon, 28 Oct 2024 17:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730137233;
 bh=OQuqvgPpJTyymPkKHwhPpdLnmwUPe1+ON5uz/XBDNM8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=e3OrC9sAIpc9iKL1nLAhryd8obqC7SoBysVT3+UVb85m7FRcr3aF1dvYheK6hmBpT
 NyjxEwqb5lVTkVCqdMejqaU91Z05zAiVzUkZttRXc3Jey+gSXCG9EDrwgudFu3pxiX
 k/AU7jzGrCPM8bz7AgGAN6nUgO5nSYIvrKsUFFNf433MQqmC6AMmL/I7jbHxvPXicE
 tQwAFOXv2LQ5dCLUH494bcavUzYqJZQJ2kJftLvIQosjdLcQ3a8+Fx4nYfl1BnbTKe
 +YSCV1G2D6L4yrkgjgsjyIzjWKmURXDcYa18IjyT9PenudAHbDJlVOAAx60JcgfaOQ
 GTyTFZ0lUciZA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70F46380AC1C; Mon, 28 Oct 2024 17:40:41 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173013724023.126843.9607726471702748636.git-patchwork-notify@kernel.org>
Date: Mon, 28 Oct 2024 17:40:40 +0000
References: <20241016052758.3400359-1-yi.sun@unisoc.com>
In-Reply-To: <20241016052758.3400359-1-yi.sun@unisoc.com>
To: Yi Sun <yi.sun@unisoc.com>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 16 Oct 2024 13:27:56 +0800 you
 wrote: > Deleting large files is time-consuming, and a large part > of the
 time is spent in f2fs_invalidate_blocks() >
 ->down_write(sit_info->sentry_lock) and up [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t5TjT-0005Hh-SI
Subject: Re: [f2fs-dev] [RFC PATCH 0/2] Speed up f2fs truncate
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, sunyibuaa@gmail.com,
 jaegeuk@kernel.org, hao_hao.wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 16 Oct 2024 13:27:56 +0800 you wrote:
> Deleting large files is time-consuming, and a large part
> of the time is spent in f2fs_invalidate_blocks()
> ->down_write(sit_info->sentry_lock) and up_write().
> 
> If some blocks are continuous and belong to the same segment,
> we can process these blocks at the same time. This can reduce
> the number of calls to the down_write() and the up_write(),
> thereby improving the overall speed of doing truncate.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,RFC,1/2] f2fs: introduce update_sit_entry_for_release()
    https://git.kernel.org/jaegeuk/f2fs/c/af68d9b481ac
  - [f2fs-dev,RFC,2/2] f2fs: introduce f2fs_invalidate_consecutive_blocks()
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
