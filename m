Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 036DBA7407A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Mar 2025 22:58:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txvEj-0004AA-VW;
	Thu, 27 Mar 2025 21:58:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1txvEh-00049t-QR
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 21:58:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9+KiLDhyKzmkYauqDvX9e0RcJkMoTYAJyBSZPbPJdEI=; b=etm5/2B+3aa8Jfn6krbTVx6bzM
 0Hx6TRz+E+ayqAABy6YwWtJJAH9jt3+K8H6rdvixneiB80N595MZMZqor+z4K1spngMXMNE8GuEb+
 klgBR2mm4F/f1ernMew00lfHmOFGbavLwBjkEWR6BR+9gJ9KoHNgqRE+d6RjwGx1pbm4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9+KiLDhyKzmkYauqDvX9e0RcJkMoTYAJyBSZPbPJdEI=; b=NZgAkjtKSfP4bA4BvvcjEdz1N0
 bvkExiafZ/mxKaq4ZvXUI9iOWZbbmMPsZfpb5puxAkFWsxS5ubSVAlOD4g377McKijkzKKsvAiIue
 8nVG7QW0VuMtpxoth3QnAXpAqEQnuLKZSCtrYcgJrbQVNcHiG6hJtcd6Hzk+AIa2ND08=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1txvEc-0008Ue-V1 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 21:58:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 50506A42F1C;
 Thu, 27 Mar 2025 21:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6409C4CEE4;
 Thu, 27 Mar 2025 21:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743112667;
 bh=vEC3nYe4sWrHn3kHC+aFv+04EDeh1WBI0+LQ94j77lg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=DB2RCX2cWhuHNyqWI6njfIZ13qrH8OLPGMhIK9YTjurF/mCuPF1AtrG/pZY5THO+0
 z+wy1grw7twTWqrvbmm5DixOeJm4of8v3oDe4IhaXAyBqCbt14nO14hV1QxNnxNX63
 6d9YHweyIAwUgo9AtKoCKVbFIUt2A5Jg7buhePHGtUNYEKWIAMOCCpDKGpSTzMXUX1
 r1nLWWUypagCcXAyRPvqiUVffDyw+4BXO30SxOowEAMie1OlQadFodsFb3ABj9SOfY
 uYgYCLQ48HTyK/iqeET2zZ5VrKqIsFL7JRXXoYUxQzRW5BjH+8INY3B66/GLqqTt1c
 tJ0hgNJdd9Lpg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70C9C380AAFD; Thu, 27 Mar 2025 21:58:25 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174311270426.2230226.11533981024198489963.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 21:58:24 +0000
References: <Z-GPopTYCOl0hjp3@google.com>
In-Reply-To: <Z-GPopTYCOl0hjp3@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This pull request was applied to jaegeuk/f2fs.git
 (dev)
 by Linus Torvalds <torvalds@linux-foundation.org>: On Mon, 24 Mar 2025 17:00:18
 +0000 you wrote: > Hi Linus, > > Could you please consider this pull request?
 > > Thanks, > > The following changes since commit
 f286757b644c226b6b31779da95a4fa7ab245ef5: [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1txvEc-0008Ue-V1
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 6.15-rc1
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
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This pull request was applied to jaegeuk/f2fs.git (dev)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Mon, 24 Mar 2025 17:00:18 +0000 you wrote:
> Hi Linus,
> 
> Could you please consider this pull request?
> 
> Thanks,
> 
> The following changes since commit f286757b644c226b6b31779da95a4fa7ab245ef5:
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,GIT,PULL] f2fs update for 6.15-rc1
    https://git.kernel.org/jaegeuk/f2fs/c/81d8e5e21322

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
