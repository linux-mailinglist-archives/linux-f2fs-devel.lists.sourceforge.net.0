Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB066DE1BB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Apr 2023 19:00:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmHM5-0001Sz-35;
	Tue, 11 Apr 2023 17:00:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pmHM3-0001Sq-Sv
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 17:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RVxWB6Zsi+PGtuUD0LBpMZrqMhViABP5NX8k44//cmk=; b=nIvjjPrsOY+uTqTw2lbejd2hbR
 LoQ8D+CReB+I0N4hdJ0ADhEH/SnZbWCSYH6m1pdW4Kc1HxxKdi/uDZ6m/Xt/zrxbd9JNf+RVQuoKv
 9H1HWtfcBHK71w4Bm+qdf1cJ5r3MRiYOlBU89xhcKatPYqx4vhM92wZSVa29lT5BKtdo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RVxWB6Zsi+PGtuUD0LBpMZrqMhViABP5NX8k44//cmk=; b=gDoTK9bhDm8yqSoOYPHJl8LMTB
 7ZHdDVu419V6qfxtfxUXM/lphNLVcAN7Jizn6hvjr8lEcwuXZG8La9ZzOQVreT8nBCqHSGDrkDoiE
 Syw9Q3Yh+Kwt9jAi6zDsbjpwF4odQbQz1MLvhQSiJvd8mPOzcNUxyBj1SznuuaPai0rk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmHM2-0005Ch-FK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 17:00:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B4B7629AD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Apr 2023 17:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 053ADC433A0;
 Tue, 11 Apr 2023 17:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681232420;
 bh=y0sC1maeF6BaZCVKP2Dpae2MYRm6bDMWSoxaogWa0tw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Mu0Y+nL2v52Anxuw8M7kClUMoXtEdnoJ0tC7PXlRgKOG/GIIKEzqpAAHcR/YlBEDE
 oDbCqh45+oxLslZL/sU0YUoh561I/rKLGuMvXPJpW5gV8ysxQIqfOPlC97Y89+Jze9
 9rBlfZ77FyZ3tTTnvThj+6A5tzuQaiwH+1/cDtYAnrbLQ0hu82dCu9YDQVf5hCIjy1
 P63DHgOoSuJGs/CNu+ZkHT6t4juchCJZPanngquwV7gTeq9LPemJVaUxTXJ4MnlxV3
 Yo16NwKW8DgSlE2/m5HvQFNEWbmYKBs+DXBIshczsWl5INcr3cldZ+oII7ygM7ARlJ
 2/0W9RkcyPUKQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 CE94DE52447; Tue, 11 Apr 2023 17:00:19 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168123241984.4928.10498593969347479726.git-patchwork-notify@kernel.org>
Date: Tue, 11 Apr 2023 17:00:19 +0000
References: <20230410021722.1836433-1-chao@kernel.org>
In-Reply-To: <20230410021722.1836433-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 10 Apr 2023 10:17:22 +0800 you
 wrote: > f2fs has supported multi-device feature, to check devices' rw status, 
 > it should use f2fs_hw_is_readonly() rather than bdev_read_only(), fix >
 it. > > [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pmHM2-0005Ch-FK
Subject: Re: [f2fs-dev] [PATCH] f2fs: use f2fs_hw_is_readonly() instead of
 bdev_read_only()
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

On Mon, 10 Apr 2023 10:17:22 +0800 you wrote:
> f2fs has supported multi-device feature, to check devices' rw status,
> it should use f2fs_hw_is_readonly() rather than bdev_read_only(), fix
> it.
> 
> Meanwhile, it removes f2fs_hw_is_readonly() check condition in:
> - f2fs_write_checkpoint()
> - f2fs_convert_inline_inode()
> As it has checked f2fs_readonly() condition, and if f2fs' devices
> were readonly, f2fs_readonly() must be true.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: use f2fs_hw_is_readonly() instead of bdev_read_only()
    https://git.kernel.org/jaegeuk/f2fs/c/68f0453dabdb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
