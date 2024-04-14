Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 755D88A4365
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 Apr 2024 17:33:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rw1qo-0004pL-Uv;
	Sun, 14 Apr 2024 15:33:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rw1qm-0004oj-20
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:33:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3pNgsE5u7eH9CwzdZeGaxlAUykfl16lVvc3SoGCQh+A=; b=aj7eXtSJCS8P1R/Dy4/oMPkTIh
 0rjifr6X2PN/Z5o8BSVmR/T8PC8q3RuG8q/bswBrMfygW5h91PfjkAzVvHFEFhd+6EvOTD7JqYBA1
 UO0+7Zxss63Gkg3ZV2+kJl7flkRL6QdO9zsNTr7glmIWuwAlyuGQb6XP7KjJt+B6oRO8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3pNgsE5u7eH9CwzdZeGaxlAUykfl16lVvc3SoGCQh+A=; b=IKwGlDGcNr/vhtCfg/3P90xBXh
 dCmYLegPijv8zxk1BGytoGlh4cU4t5j6SidRBkN6t9p5W+CpBCV3brex+HkogfiipFgzVsEJSmU/r
 z3Q9Q/X/1yXlwce013LYNvqN88Fgb9D7Nvrb0PN65pS45lC1bbCsfwPMP5Q0ZvsxohLE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rw1qk-0003WY-W3 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:33:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 53F5E60B8B;
 Sun, 14 Apr 2024 15:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EA1CC4AF12;
 Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713108765;
 bh=HffsvLIWPYupnLLRGUro6qCAd4PWhu6U8ocjNHJuxnw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ToyjMp5qtRzUYH2jifdqiBNs0QatLgrah3+j45X7lCpCXWN8nwwC029iGcyrWkmpA
 IzjZ/bki934NFywDG74xj3uJG4u4LppiNiObZd+/GiwlF8X9oh4Tgb28yz3BdNVNe8
 PK1jryT+J5BxIwQDiwPYAMh4z3NpWa3nq0qlFiBQtKwH5qhXrjPUudDv91eh0SsI0e
 u8wRcwN1HQeLX9MQY7YrvS0rT05Ogg2m1N4bf9ZMJpGWQC9EqeR9WLxaM9MW0La7y7
 CCgp2HUMHafp95CkDNBFptpOYP4OT68BtAQktm27ikHj09bzutd27nkppDqS1UMXhr
 MHE57pffFpD+g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 4F653DF7857; Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171310876532.3156.10776428756258877374.git-patchwork-notify@kernel.org>
Date: Sun, 14 Apr 2024 15:32:45 +0000
References: <20240409233411.1197830-1-daeho43@gmail.com>
In-Reply-To: <20240409233411.1197830-1-daeho43@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 9 Apr 2024 16:34:11 -0700 you wrote:
 > From: Daeho Jeong <daehojeong@google.com> > > While do not allocating a
 new section in advance for file pinning area, I > missed that we should write
 the [...] 
 Content analysis details:   (-7.3 points, 6.0 required)
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
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rw1qk-0003WY-W3
Subject: Re: [f2fs-dev] [PATCH] f2fs: write missing last sum blk of file
 pinning section
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
Cc: daehojeong@google.com, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue,  9 Apr 2024 16:34:11 -0700 you wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> While do not allocating a new section in advance for file pinning area, I
> missed that we should write the sum block for the last segment of a file
> pinning section.
> 
> Fixes: 9703d69d9d15 ("f2fs: support file pinning for zoned devices")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: write missing last sum blk of file pinning section
    https://git.kernel.org/jaegeuk/f2fs/c/b084403cfc32

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
