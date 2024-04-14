Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A908A4363
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 Apr 2024 17:33:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rw1qn-00010y-Ip;
	Sun, 14 Apr 2024 15:33:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rw1ql-00010a-PS
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:33:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hbvcKxIs/KkFnbtpgzcVVCBoRUDFLduhJqlbxP2pGpo=; b=JY83cnRdJls5+CY6qEG+qnppJC
 bthCCeC/d5fCasur37luMVGPfjt9XyLeJEND+jejw8rmgBFnhDjhlH2060N68xp/opheqAY+hkfim
 Ngb1GktYCWQ8fMX3Yv3sB3SGCdWGsh7c8O4WV+tBKmuqsI1+E7xZRFXuwLvgRxbsqqbg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hbvcKxIs/KkFnbtpgzcVVCBoRUDFLduhJqlbxP2pGpo=; b=Z6NNgSGKwiaWCRio2fVyAGCtLZ
 19ocT5kf+SxusDeONLv2Q88R8Kcnu8T8x8ckhmlmGi+aOC2JRJHuLrj9/lb4GN+ght4qO1dp6Scn2
 bP5whz4oYnHDA1kU443n1NKcmLvB9fwNYTlNNi0hPp3mmvxaqKKdSfZ4abl7UjVJW2Nk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rw1qi-0003WP-6a for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:33:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1F22660B81
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 14 Apr 2024 15:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 522ECC32786;
 Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713108765;
 bh=bxNO3fkRN2ASJqrntL4vOhcWHQKY0KbQtg8KAE0BNuQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=cCzv8Lnk/2BPKQQn3P2DLmjc/aDjSDHRyDxOGODvk55yta9kZOAusmHl3RJYW+jNN
 Qj9KQ//DAH7+ehRwCObwBMT4Cyo87fqfDEAgDajEY9I14Rr84k0l3B4qNsCQcO2NzT
 JxjO9WSqDzdKIUbrfaGahBKIDscy4wk1u0jCkUhZPzAtP7Evg9+I8QTMzMfdt3tXew
 G2hUATt5gWcSaZDno7IAe2bb5RnMCGVi1j7Csr7z7mADH7DLRoUNR8qgi+nOuT/EPN
 vGLgThOdmRbdzylbstJhKMOq6ZgMZ40MnjPtAEGFYsmUoS74OpFXINSuLpymt4uGJg
 R8mCAnIPPnA/Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 41C5FC43140; Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171310876526.3156.6732886911990694550.git-patchwork-notify@kernel.org>
Date: Sun, 14 Apr 2024 15:32:45 +0000
References: <20240229143838.45149-1-chao@kernel.org>
In-Reply-To: <20240229143838.45149-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 29 Feb 2024 22:38:38 +0800 you
 wrote: > Support .shutdown callback in f2fs_sops, then, it can be called to
 > shut down the file system when underlying block device is marked dead.
 > > Signed-o [...] 
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
X-Headers-End: 1rw1qi-0003WP-6a
Subject: Re: [f2fs-dev] [PATCH] f2fs: support .shutdown in f2fs_sops
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 29 Feb 2024 22:38:38 +0800 you wrote:
> Support .shutdown callback in f2fs_sops, then, it can be called to
> shut down the file system when underlying block device is marked dead.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/f2fs.h  |  2 ++
>  fs/f2fs/file.c  | 70 ++++++++++++++++++++++++++++++-------------------
>  fs/f2fs/super.c |  6 +++++
>  3 files changed, 51 insertions(+), 27 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: support .shutdown in f2fs_sops
    https://git.kernel.org/jaegeuk/f2fs/c/ee745e4736fb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
