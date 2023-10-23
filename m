Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B357D3AC8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Oct 2023 17:30:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1quwt4-00076l-9M;
	Mon, 23 Oct 2023 15:30:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1quwsz-00076d-Mm
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Oct 2023 15:30:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JWwU3CoZI3IjLx5lEcH6/4Au6wMwb2AGuQ6NaOt4nxI=; b=XaDIQWTj41qPorkpTsfztNFWXC
 8/e5rT/Apsw4Hpdj+3LHR31ofO8B52Zfs3cNoAXXBqTm9axcC6ime1twbiN5+vXgavY/+ygXuR6KJ
 8oIF0BuCc8N7f3NpOdkzg6IP8oKSl/7OteBOsQOKmNipPfjznxa9T5likbb1JpRKk9JU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JWwU3CoZI3IjLx5lEcH6/4Au6wMwb2AGuQ6NaOt4nxI=; b=KoggdkxZ0S/WWy4qZEDo6TNmm7
 N2CGcvBO9dk35U0pmENzK+HnNQzUnbSL5uFSLvRHds7Act5xNZChYlMQtzE6/mll4eJ2jb5th8rlQ
 yFNHIgptsT5V9DU5o7NJxYlimTCWuokb3yy+dR9vAoaUaxD19yDxwqB0krX5ttndq39A=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1quwsx-0002HV-LT for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Oct 2023 15:30:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4377F61E29
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 23 Oct 2023 15:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 541FBC433B6;
 Mon, 23 Oct 2023 15:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698075025;
 bh=bUtVoh6YaTR2e9kd3iT8lvGM2BLtR/4vtkRIDHJ3FNY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=MUkjNIA1zWr4Q1NAuiy992Ih9icgnKqn0745p5V9X6rY25Da24EBUmgohWr4VwPfE
 zneIrISV9LPC2JBOUwR46yCz4jkX/qX+gtYvKmc6SyfVrl0Yx8tt6O2q6qqJ/riovD
 Et5w+te/cb5Rr3kyITBZmYFsSz51DI06NGhEA2jIgMrgvpU9rUHUNM/AeGMOmMkqT4
 R9rp7cL0AFicWs64L8mMdLPVLxgw3y37hW9iX6zn1MEqMOJIsq5wx82z9tPTdTSe8p
 dQc9fbyCQ5BnE2d9K5d866Su+wcSnnX+1JrCi2j7ZiPZ8fpOK9Lw6Gawes/MCwtAQU
 wkmLQg3SAY2mQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 3AB8CE21EC3; Mon, 23 Oct 2023 15:30:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169807502523.26537.10004934909406083909.git-patchwork-notify@kernel.org>
Date: Mon, 23 Oct 2023 15:30:25 +0000
References: <20231019225300.1846362-1-jaegeuk@kernel.org>
In-Reply-To: <20231019225300.1846362-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 19 Oct 2023 15:53:00 -0700 you
 wrote: > If we return the error, there's no way to recover the status as of
 now, since > fsck does not fix the xattr boundary issue. > > Cc:
 stable@vger.kernel.o [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1quwsx-0002HV-LT
Subject: Re: [f2fs-dev] [PATCH] f2fs: do not return EFSCORRUPTED,
 but try to run online repair
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

On Thu, 19 Oct 2023 15:53:00 -0700 you wrote:
> If we return the error, there's no way to recover the status as of now, since
> fsck does not fix the xattr boundary issue.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/node.c  |  4 +++-
>  fs/f2fs/xattr.c | 20 +++++++++++++-------
>  2 files changed, 16 insertions(+), 8 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: do not return EFSCORRUPTED, but try to run online repair
    https://git.kernel.org/jaegeuk/f2fs/c/50a472bbc79f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
