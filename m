Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A66CFA49ED4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Feb 2025 17:31:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1to3GF-00074z-Lc;
	Fri, 28 Feb 2025 16:30:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1to3FY-00074N-EX
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Feb 2025 16:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3VbzXZpA8pCaXpiWgwL3DLNqA+fI0qLRtlDQb40/yUQ=; b=JVtOcHDAVF8AeZbvm5vif4i2Jp
 xXnVDndjEjBZCy7+r6KqkHnYIuT4xFn2l6fNLRK4/hCKj6Gm4EFwd/r6cHJwub5Bj1OJZQVQfnxIm
 iHNaVOetSNvI2upXkpICe50ji1nhB29z3JKqwJoIUSYa0I5Y1/vNs12ELOLBnfJLfBNo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3VbzXZpA8pCaXpiWgwL3DLNqA+fI0qLRtlDQb40/yUQ=; b=MIchAXpGa3igV8GuLs7kgVHgvL
 JOoLcRC6kx0AZduAcReVxNPIW+MPUFY7DQHzhlh4LXXtcV03D4WCYeQf06JHTHANaoF/MYFqruhDY
 2cVjzzVZ0soqIRSkeKzGIG/fvxj4F+XSTftv845tFYfvPdS9iFr8TDH4DCW3o7bPvYTo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1to3FX-0001b6-7t for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Feb 2025 16:30:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0F41F61148
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F226C4CED6;
 Fri, 28 Feb 2025 16:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740760201;
 bh=G5rKdfQ0+3VplmsFRvQVIXVao+ovPVqnNlr0+RqAmuk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=pCJ998JfZb7nOvtnr7xv+jSyfeNDdLg+2Y9XsaZgDWNQHfZIWgX4n9dfrwPmF7/8k
 eMp4VJWA2DYAwpWOsr7B1hibOdp4e9QpKW7ZsX+QGMjFiE1pgjrMwxGvD+e+/mG5y6
 +lckeVFK2N8T1dV/M/6GQAa/fPVFSjhlT8E0RbZlntjrB//OyyO1wTZnGjcx3GVGZY
 G+SU06q99F7mjQKhFYjxdzRe8WzSu/wMzRcNzN6p9eT67zN2a8c+9ZG86B0hqLMTPA
 mzEtY1/tMiuqMI29/4zJD2iRQHESV1Chyoz+LvME4xNL/YJQwVWGyanXzpCWw9acmJ
 rZR8IN2X1hO6g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE29D380CFF1; Fri, 28 Feb 2025 16:30:34 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174076023354.2198557.8859219710807097797.git-patchwork-notify@kernel.org>
Date: Fri, 28 Feb 2025 16:30:33 +0000
References: <20250227212401.152977-1-jaegeuk@kernel.org>
In-Reply-To: <20250227212401.152977-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 27 Feb 2025 21:24:01 +0000 you
 wrote: > If checkpoint was disabled, we missed to fix the write pointers.
 > > Cc: <stable@vger.kernel.org> > Fixes: 1015035609e4 ("f2fs: fix changing
 cursegs if [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1to3FX-0001b6-7t
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix the missing write pointer
 correction
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 27 Feb 2025 21:24:01 +0000 you wrote:
> If checkpoint was disabled, we missed to fix the write pointers.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 1015035609e4 ("f2fs: fix changing cursegs if recovery fails on zoned device")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/super.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: fix the missing write pointer correction
    https://git.kernel.org/jaegeuk/f2fs/c/201e07aec617

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
