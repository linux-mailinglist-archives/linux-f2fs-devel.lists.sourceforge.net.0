Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 357E48A436C
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 Apr 2024 17:33:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rw1qt-0005bE-Rn;
	Sun, 14 Apr 2024 15:33:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rw1qo-0005aR-Cp
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:33:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/glegaXpWQxC78jFUhYwcsKilx/DTb5v+0yrJTrOzyE=; b=T+vIUAu7Kt2Ces3CVQhRn70sE/
 tVva1E613wLUiMGuqPUCDs5OKvAly6bXbnihLNKZlUcpL4n7O2rCUvk8Dron180W0HRLfsiCOxWPU
 Z2zy/LA6NRDKFoehhAU8+ZxL8MagHUOUKP3k+E+8eLQbsNAvYEjmYmSV5iwcNTCCF8EE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/glegaXpWQxC78jFUhYwcsKilx/DTb5v+0yrJTrOzyE=; b=IKyOPXrK0G07ov2ptznqK1DY3w
 KVOmLUL0WeXZ4PKLEpyTJqHoZgyoLHB+6+fbBOr/tOpQSYEyBkemxDX4hduuDTwu23XGKkJ9UnMoH
 Am6spx8zLAaDO5rvTWJPguxi0KIFgjiaLdWL9NU/G75ExgbB+6UPH1u2IZgHLMdVpV9w=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rw1qn-0003XS-LE for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:33:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7836960B94;
 Sun, 14 Apr 2024 15:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 635CEC4AF13;
 Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713108765;
 bh=4ggQ41BG3rYA6nIIBBk8X4i+JEP2BD4lyUROk9QZV3c=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=KFyAuMoUy1JlvllZWRJz/lLmYyLTww7klLoY8RQMIVrbx+47VUVhxFOVAP4puAJbV
 zBn7T7YQ2U/mfbBuX9bhf28yRxgRGcUorPTy7f/Fl2sshJgL/6+acT9NrMe0oP9SLQ
 XeiBVbURaBgZn1eG0RE3QMaEOHhdJSk4WKCNPknsLadLPrb8mM/8JStaa0w/UJuR5p
 7R+1cI6U/7LI/yxISvPMI5gon3Fy4OXV6vDP6Jgmgt6M8moykE/8NhRyh4dDql4EZQ
 kvhJ/AAgq8zKxoU7l9R5tF3tgIgeDDpquU1KRf5KATHaV56TacSXmfl7AZWjoMROHd
 Sybv9HEXinfpw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 56AADC32751; Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171310876535.3156.3836022504525734711.git-patchwork-notify@kernel.org>
Date: Sun, 14 Apr 2024 15:32:45 +0000
References: <20240322041639.23144-1-youngjin.gil@samsung.com>
In-Reply-To: <20240322041639.23144-1-youngjin.gil@samsung.com>
To: Yeongjin Gil <youngjin.gil@samsung.com>
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 22 Mar 2024 13:16:39 +0900 you
 wrote: > If f2fs_evict_inode is called between freeze_super and thaw_super,
 the > s_writer rwsem count may become negative, resulting in hang. > > CPU1
 CPU2 > > [...] 
 Content analysis details:   (-7.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rw1qn-0003XS-LE
Subject: Re: [f2fs-dev] [PATCH] f2fs: Prevent s_writer rw_sem count mismatch
 in f2fs_evict_inode
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, sj1557.seo@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 22 Mar 2024 13:16:39 +0900 you wrote:
> If f2fs_evict_inode is called between freeze_super and thaw_super, the
> s_writer rwsem count may become negative, resulting in hang.
> 
> CPU1                       CPU2
> 
> f2fs_resize_fs()           f2fs_evict_inode()
>   f2fs_freeze
>     set SBI_IS_FREEZING
>                              skip sb_start_intwrite
>   f2fs_unfreeze
>     clear SBI_IS_FREEZING
>                              sb_end_intwrite
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: Prevent s_writer rw_sem count mismatch in f2fs_evict_inode
    https://git.kernel.org/jaegeuk/f2fs/c/3127f1010c9b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
