Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 760EE7D3AC9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Oct 2023 17:30:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1quwt3-0008BN-Mz;
	Mon, 23 Oct 2023 15:30:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1quwsy-0008BG-N7
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Oct 2023 15:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HmECVV1mlavG4dW9VmJ6ewn2la11A3/BxpONeadGjkM=; b=V3qvsZ2rzvTIRfxzB9gtRVnwCS
 B58IvGhEQyyW+GpuGNmzDw2Z9imAgL2aREm+9WMg6Ba+Ofr8nU0nLLYHiIPf/MRbYa/ipR00I/7wu
 1Rr3Xp62saA2Uxccb4MSVJeO2KljA6CUnId/fjBlC1KiomXBPvkPYfb3nWlfz2Nzz+GY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HmECVV1mlavG4dW9VmJ6ewn2la11A3/BxpONeadGjkM=; b=XNW/QR2xjR+Sk36+qNs19N1bqY
 KSvLxu+bXDYTcU45EWcWbUGLWmN1NfIucOkBu5qApLsYLRsE6D/pTJeapBJvTbGc8CJ3drM2T8MKk
 0d1k3TW8DkEbn/d7I7qMYPFpdQe9Dvp0kZBAeJq9/cd9XjH+6D7XKs0E7LEfWluArnhA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1quwsy-007FvP-Bj for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Oct 2023 15:30:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CB99561DDC;
 Mon, 23 Oct 2023 15:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AEF3C433C9;
 Mon, 23 Oct 2023 15:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698075025;
 bh=fky56o6OGMffUlnNTnMeI5GtbOUQM5DLVFGgZZmx03Y=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Jc6QPJo75xtph1CujVnPQqnI3CLhVnBru/a8uHyKGDs2fjbhtrd5x6OQ0oOUMGjLl
 4oHtqftbPmkFD9XtcMwNPWaF00FIa2qw5p0M+0TpDOrl81JdQR2rtVdfCOxQzE4J/I
 vWdN0RveX8K8GeMFkovi/8bqWtOHhzi+sHjbehq1nSkvFiMBwrBWp92OYsdsQj//FR
 lWnLgoPbKElVUOUZXy8PVGibQHkWoIZWhTA3FmbWPuWhcRlgC6cEIe0DMLtd/43LDY
 V+9zQlfNZNoJWS5ZjicFtD9R0VBojqqsgJTjvns39DJJ9zhe/O6t0qORJSmyOfAGG8
 GqkrNRWajupMw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 05A90C2BBF6; Mon, 23 Oct 2023 15:30:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169807502501.26537.6061670597610762355.git-patchwork-notify@kernel.org>
Date: Mon, 23 Oct 2023 15:30:25 +0000
References: <20231010193628.2629168-1-daeho43@gmail.com>
In-Reply-To: <20231010193628.2629168-1-daeho43@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 10 Oct 2023 12:36:28 -0700 you
 wrote: > From: Daeho Jeong <daehojeong@google.com> > > We can't trust write
 pointers when the previous mount was not > successfully unmounted. > >
 Signed-off-by: [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1quwsy-007FvP-Bj
Subject: Re: [f2fs-dev] [PATCH] f2fs: clean up zones when not successfully
 unmounted
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

On Tue, 10 Oct 2023 12:36:28 -0700 you wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> We can't trust write pointers when the previous mount was not
> successfully unmounted.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: clean up zones when not successfully unmounted
    https://git.kernel.org/jaegeuk/f2fs/c/9f792ab8e33d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
