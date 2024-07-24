Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B31693AB0D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jul 2024 04:17:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWRYv-0007MZ-61;
	Wed, 24 Jul 2024 02:17:05 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sWRYk-0007Lt-6n
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jul 2024 02:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rVx9ZKzNuyE2dUIFPtib19cKob9uzkeYuuO+uKMxt/o=; b=O4m3m7doen136Vb+RlWonBHVLu
 LOd8xOdy2kEDmZJqykc/pe29jjoW+s4VnPpfTePfjWDQnQjSVjEtVWrp+7+c5mHuJ+VOJ2pelj6Cm
 r9odwO861naAVUDLHVdU9QwgU0jrKp4kZcND3jAjkkSUW8t6sp0oCQCZS927tqKBMqA4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rVx9ZKzNuyE2dUIFPtib19cKob9uzkeYuuO+uKMxt/o=; b=j97CQxcLd8RMRihnOuPl+tQte8
 93VKXJrACDi3fbWay0AzxY3lbFcaxJnLdqrgpiNf6pS38sSQAtHXvq87TNX48jAO4UxYvoPgvRWly
 VhsXUZKCB7kLLr1M5nLvk65KK4e4Pnq8/lydi/yqduTMn/jf/c1P7NLUZNgCX3xARKLU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWRYk-0002Hp-2c for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jul 2024 02:16:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5805CCE062A;
 Wed, 24 Jul 2024 02:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9765CC4AF0C;
 Wed, 24 Jul 2024 02:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721787406;
 bh=RxzxknUylVUGaV6PlU26q9c37KnidmqlRfe2BEvESdk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=nN7AhojEmCkoanDQFv6I44e7EWMFSXU1x6iMMoigKHziv9uQFHxY1no7Fn0wDkBW5
 28Lub/kDH6FqgdW4NQtoKYr987oiobTrL+7MM5K3agoqMjgBd6QfGFIDgxKxWNK9aP
 Fm3LYhbEqKsQz5rbEunlb8sqiHObeavPnXIvN/iK4ghtj22gmc5cFPHQ2sd4EQk1Dk
 GHICy9UP1NghYQKLVkU0WtF+CutfmhpUB+hoPtly702cRAOK8lplGtOeoNC2pDNyu8
 0vqBe8huosEh/4c/t5bUQt5BxAp3eRDTurmhCUdDMTONUh3GfkV1FDvsqkpvacKp4C
 8Awq2ZOLFS1Ug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 83118C43638; Wed, 24 Jul 2024 02:16:46 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <172178740653.17759.16908087723522583018.git-patchwork-notify@kernel.org>
Date: Wed, 24 Jul 2024 02:16:46 +0000
References: <ZqAZZAmghKIaBAkJ@google.com>
In-Reply-To: <ZqAZZAmghKIaBAkJ@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This pull request was applied to jaegeuk/f2fs.git
 (dev)
 by Linus Torvalds <torvalds@linux-foundation.org>: On Tue, 23 Jul 2024 20:58:12
 +0000 you wrote: > Hi Linus, > > Could you please consider this pull request?
 > > Thanks, > > The following changes since commit
 2ef5971ff345d3c000873725db555085e0131961: [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sWRYk-0002Hp-2c
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 6.11-rc1
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
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This pull request was applied to jaegeuk/f2fs.git (dev)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Tue, 23 Jul 2024 20:58:12 +0000 you wrote:
> Hi Linus,
> 
> Could you please consider this pull request?
> 
> Thanks,
> 
> The following changes since commit 2ef5971ff345d3c000873725db555085e0131961:
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,GIT,PULL] f2fs update for 6.11-rc1
    https://git.kernel.org/jaegeuk/f2fs/c/5ad7ff8738b8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
