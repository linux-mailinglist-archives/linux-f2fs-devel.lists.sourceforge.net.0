Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63709A62062
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Mar 2025 23:30:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ttDXf-0002GV-7R;
	Fri, 14 Mar 2025 22:30:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1ttDXd-0002GN-Qc
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Mar 2025 22:30:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cM1wyMGZgOBjTNaXrF/bnhitF/Jwqw5UH8fS6yl02HA=; b=MyvHWouaoSC6r/ltC8VTbdtw/6
 KBcbAZL/i5A4Qd5Ea41WBX/p5H+tsmSNeqEUEofpVLpnPHMm8H71KNK45j5oEczD2bBdvwt4OWhDn
 ID82IQtbCo1NHdXNbZrYZ5ki3uy2AXXicErtzkMobFNzx7Wuf55uMukovhz2eBBvKiIw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cM1wyMGZgOBjTNaXrF/bnhitF/Jwqw5UH8fS6yl02HA=; b=EfFyAJyKr+TeoxO+D3JavhIRLO
 kWizvwjWUqDZ9bsscruULBIM+wuIPexYZIqshzbmXV4wBV13p+RV5yExkG80rtJHu5KYiNS7U1UlF
 OkmaENYZQ2A4MGFqRSw8pyc6p19ZWZBEYhCiDp1QGcZyTnkZl89GiD4GiNAVixGGJ2Fg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ttDXd-0007iz-6w for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Mar 2025 22:30:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 05D115C5402;
 Fri, 14 Mar 2025 22:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EDA3C4CEE9;
 Fri, 14 Mar 2025 22:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741991398;
 bh=ZVN1gXmayXjszbtmz2X55ie4YM/+jBh6LnYxP8usMAk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XoJJWhnxgbgyUBrWJ+Q0You4CIaneFkMJfxD57iTPu0ZYE4H6jNLvbZUbzoDzTmoN
 tc81Nwwj8vA8n3CVuM8ljmX6Ux31/XiPVU9rse7sit70yDydfTlCdM3iOS+04LhdFu
 vKPhDhYTvyld1Wg3iGnQw0MMoAw0huMsy6ELDjLHRBDKdhinv8O9P2OYC/PzCV+lAw
 PAE3G1WMDLyL0RXO55CL9kkavgZal8n/6L6YehkFkP8XVxBQeUDfkjTtOponGswDBA
 AH8jzZpWY7AipGXgsm7QdlKOid5oX/Yoag3erxpmMxzXtphsTGWpAxrFf5ICrZVrCf
 YMlvmkWPtV+gg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70F22380CFE7; Fri, 14 Mar 2025 22:30:34 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174199143325.2405968.380584551658170427.git-patchwork-notify@kernel.org>
Date: Fri, 14 Mar 2025 22:30:33 +0000
References: <20250314120651.443184-1-youngjin.gil@samsung.com>
In-Reply-To: <20250314120651.443184-1-youngjin.gil@samsung.com>
To: Yeongjin Gil <youngjin.gil@samsung.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 14 Mar 2025 21:06:51 +0900 you
 wrote: > In the case of the following call stack for an atomic file,
 > FI_DIRTY_INODE
 is set, but FI_ATOMIC_DIRTIED is not subsequently set. > > f2fs_file_write_
 [...] Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ttDXd-0007iz-6w
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid atomicity corruption of
 atomic file
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
Cc: daehojeong@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 sj1557.seo@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 14 Mar 2025 21:06:51 +0900 you wrote:
> In the case of the following call stack for an atomic file,
> FI_DIRTY_INODE is set, but FI_ATOMIC_DIRTIED is not subsequently set.
> 
> f2fs_file_write_iter
>   f2fs_map_blocks
>     f2fs_reserve_new_blocks
>       inc_valid_block_count
>         __mark_inode_dirty(dquot)
>           f2fs_dirty_inode
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to avoid atomicity corruption of atomic file
    https://git.kernel.org/jaegeuk/f2fs/c/c60b556bfe0a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
