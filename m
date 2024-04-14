Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AED88A4360
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 Apr 2024 17:33:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rw1qn-0005a3-NP;
	Sun, 14 Apr 2024 15:33:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rw1ql-0005Zv-Pc
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:32:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nVcSH+197dWO6bH6J5MJy9vIRgqu39j6gighy/FtXZQ=; b=WyL5uu/EGzyAxTauTo/JJGRnXF
 bBg+iYsXErkX2lmMwuxa4lFGMhJG52KH765TfTpD8T3DAR9YgJXKLMQ7IY4wwQ9Gcpg+/g90/DKbj
 oU13YJxvcZza/Pw8WTXlAbgkk+shyAqOqJjFcfx3FtXaxh8ovUSpjx9u2INYZoJaW1+A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nVcSH+197dWO6bH6J5MJy9vIRgqu39j6gighy/FtXZQ=; b=hP1K61JwAJ32b/4oJ32Bb8oGr5
 BREfFq5ivcDtcDkA5e5g4K78f6O64PXh3KZSVZawP89rGLKfCtU07mi/rL4ZcgHKRK+p5CgHPRtig
 H76Rnz9TEIiNFkDcTcLYTxBAfJ4EsR2Hwon5jpWw2o76X3UHp9QZCPiQkfVEIekC1bcA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rw1qk-0003Wf-WA for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:32:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6E60F60B90;
 Sun, 14 Apr 2024 15:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C7DAC4AF11;
 Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713108765;
 bh=dFZGv7103jpCCbxlUjuW5cQQEfq9cMdFP4Oppn5UzUA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=g7kQyKjjgD4sM19o+tx6rc2GbsGGQvFjeP6V/jWMOztG88U4to3QjOlO47RGXIBMl
 avvFtKryAW4LehmfaIemTDNeIjMiDzKa0phE9+OFQ3WAKLiWQBy9t6Gs8l1vNhjZjp
 7xGPwz+Mf3MxiV57nz6G9/4qTRuqSJ4U3daq49PrtJTn5KjoB+pZxYCbuZRcqRoem/
 pk9JvH32wTFFrxLUo1rPkReFmNg0QmxgFf/4ATWj7FC6GyFQ006es/83kytQhF6186
 5vEJhC27wZMUT+fEy+dNhUt+V2cJ+bJh4mXTU8WTXZfIRLK2NSZogKI1r5UEt2g0Mz
 jJB2A5Fmby91w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 48BA2C54BD3; Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171310876529.3156.8543170120542673677.git-patchwork-notify@kernel.org>
Date: Sun, 14 Apr 2024 15:32:45 +0000
References: <20240326061043.1348968-1-heyunlei@oppo.com>
In-Reply-To: <20240326061043.1348968-1-heyunlei@oppo.com>
To: Yunlei He <heyunlei@oppo.com>
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 26 Mar 2024 14:10:43 +0800 you
 wrote: > In f2fs_remount, SB_INLINECRYPT flag will be clear and re-set. >
 If create new file or open file during this gap, these files > will not use
 inlinecrypt [...] 
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
X-Headers-End: 1rw1qk-0003Wf-WA
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove clear SB_INLINECRYPT flag in
 default_options
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 26 Mar 2024 14:10:43 +0800 you wrote:
> In f2fs_remount, SB_INLINECRYPT flag will be clear and re-set.
> If create new file or open file during this gap, these files
> will not use inlinecrypt. Worse case, it may lead to data
> corruption if wrappedkey_v0 is enable.
> 
> Thread A:                               Thread B:
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: remove clear SB_INLINECRYPT flag in default_options
    https://git.kernel.org/jaegeuk/f2fs/c/ac5eecf481c2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
