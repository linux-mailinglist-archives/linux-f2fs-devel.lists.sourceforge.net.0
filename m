Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28018A3EAA7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2025 03:17:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tlIbO-0001dl-6M;
	Fri, 21 Feb 2025 02:17:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tlIbH-0001db-M3
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Feb 2025 02:17:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EncbhaPiNWk+0sV9DDUPGlnDcwic+5/6WPBfPorgqW8=; b=EucLeXUlcm+vKVGfvy4+qLjOPw
 srKb4yVo+JIaSOPCUg8wOqNHdMoL1VmKdaK48cmROETKHCXRrmj2WFprXHU3+y0cB2bAsNGuISfiW
 iiSXJVd5IyLeZVpB4O6S0chCBKyA4JjcG7wURFXI2vBAuA4irSn4q9t7wHV4EPbmjfxc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EncbhaPiNWk+0sV9DDUPGlnDcwic+5/6WPBfPorgqW8=; b=YhvLckeJVs+0L7J8lGbCWQmnla
 Li3acOzsGgmy+YipJJgaquejLq22YNux/UlsKOnEizta3AKHwnXoNEpeJYOgz/3WB8X3BRXZJYnZe
 Dh3Y9FvSapJTPNr4qI8B8dPh86wdJrutH4wITzjEcQGPyUQ59Dmfo3+86lPB0JKlTLsI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tlIbG-0005L1-D1 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Feb 2025 02:17:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DD1F15C57B6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Feb 2025 02:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F82C4CED1;
 Fri, 21 Feb 2025 02:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740104224;
 bh=uiNUJ3lKDfRoeOKZ5ry+tIO8kvsA/VVTsH8aehztNK8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=VpSQsBXFyAkLKUgFJ+spXMrAh4IhD/aBczA69eum2I60oQUyr4AOGIvr1zvgM/4K8
 mUJn4VEv0CLUd7DG09nqB5BxrtDEc6vEkeQe8FNGZKWGFETd8CfpG7Z6kTiJdoHaJO
 3lZ/1Rp2yoNXmkBm7sLOXiXEH8M0Ar7kjBTmPXP8bnAcsxp0WUromNobwDjDKD2BNs
 RL955nJ/zvUSIclIYh1ZAmCxaphy5IHFFdK+DI07T05lbSwY1jB3mZii3TiKOPOUWV
 Ts9mUWVWD5ptTXbScvmT0DOdlqrZmcEhkelyLdumwX0pY+ev/nyUR/h+/nSU4502qd
 Dp9cgXKqbc/ug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADD963806641; Fri, 21 Feb 2025 02:17:36 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174010425541.1545236.6174789060988336403.git-patchwork-notify@kernel.org>
Date: Fri, 21 Feb 2025 02:17:35 +0000
References: <20250212023518.897942-1-jaegeuk@kernel.org>
In-Reply-To: <20250212023518.897942-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 12 Feb 2025 02:31:55 +0000 you
 wrote: > This patch series does not add new API,
 but implements POSIX_FADV_NOREUSE
 where > it keeps the page ranges in the f2fs superblock and add a way for
 user [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tlIbG-0005L1-D1
Subject: Re: [f2fs-dev] [PATCH 0/2 v9] reclaim file-backed pages given
 POSIX_FADV_NOREUSE
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 12 Feb 2025 02:31:55 +0000 you wrote:
> This patch series does not add new API, but implements POSIX_FADV_NOREUSE where
> it keeps the page ranges in the f2fs superblock and add a way for users to
> reclaim the pages manually.
> 
> Change log from v8:
>  - remove new APIs, but use fadvise(POSIX_FADV_NOREUSE)
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: keep POSIX_FADV_NOREUSE ranges
    https://git.kernel.org/jaegeuk/f2fs/c/ef0c333cad8d
  - [f2fs-dev,2/2] f2fs: add a sysfs entry to reclaim POSIX_FADV_NOREUSE pages
    https://git.kernel.org/jaegeuk/f2fs/c/a907f3a68ee2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
