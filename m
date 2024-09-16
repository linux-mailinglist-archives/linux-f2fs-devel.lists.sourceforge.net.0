Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC93F97A8BF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Sep 2024 23:30:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sqJJ2-0007zd-F6;
	Mon, 16 Sep 2024 21:30:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sqJJ1-0007zK-5p
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Sep 2024 21:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ve2mvte3bqvyqEOGjwLCt046fq2EtM/f+jCTGmd5SGM=; b=ZJKZI9EamLE+EeLwVyiHaub8AK
 D8uJ7pJOTsKBw0O5T1QTt4t1lsI1rONuXzRTjL9/z61QwySFf4XC64osH1rXzYXV4Te5JTUgQ6ri/
 oZW4aKetiZwDFbOt2Q2MhGnsCPp2Th8/5VzRmCXpQT9mPynXr48EsclM+i6CpEV4RrIw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ve2mvte3bqvyqEOGjwLCt046fq2EtM/f+jCTGmd5SGM=; b=ikrCktcvxkWxlvKw6bHedcUuio
 zpnILw5YyjwzhqqjVJpwfPtwLv5b/1jx9o/dPes83A3brDqgDxRX0YUPL29f0q64TCF/kfSddtiwm
 HErfMgcHhiJwgpt4RbKs7h0M6ffMiGP1HYv7Gp8Vwhyd/pfso3IajNRQVPTPXLRkKehk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sqJJ0-0000Oc-HI for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Sep 2024 21:30:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7AB4A5C05F7;
 Mon, 16 Sep 2024 21:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E4DC4CEC4;
 Mon, 16 Sep 2024 21:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726522235;
 bh=gpAhyyWTTofmD5p8pqREwF5xUfCBBnrCVAI8oGe8Bgg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=c990Pe7+XpgXXAA49chRytqdlsJLhHDzty95z/zdhO2T6/VZAuNZoqUbhmCRD/RUA
 iNV/gNpEGdnUQdlxYpaEYznsZ5Viv/+IpsFJf229yIqVZKbGZGoy1/Q3Jmn+KxGqkf
 aTFeHUOHKhPtCYUePlKvEYM2y8CYvFhPX8eu60XLO++0P5iXvG4D5h1/7uKs9S6niz
 PRmRpL7B7wUNKQ9EKEkHdOxZHchTRp8vvXnuSXVZaAJSi6PBIM9X4gvdJM6p36DYtr
 bZdGXsUT1kmcr7Tm40X54M/uu/fvEwkjqbSe3qnT/39aFY3pot6EIVY2dFeX8U1WSI
 EkDUUudPePB5A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE5393806644; Mon, 16 Sep 2024 21:30:38 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <172652223724.3820990.15004713720565188782.git-patchwork-notify@kernel.org>
Date: Mon, 16 Sep 2024 21:30:37 +0000
References: <20240904153306.816988-1-daeho43@gmail.com>
In-Reply-To: <20240904153306.816988-1-daeho43@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 4 Sep 2024 08:33:06 -0700 you wrote:
 > From: Daeho Jeong <daehojeong@google.com> > > Keep atomic file clean while
 updating and make it dirtied during commit > in order to avoid unnecessary
 and [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sqJJ0-0000Oc-HI
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: prevent atomic file from being
 dirtied before commit
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
Cc: daehojeong@google.com, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed,  4 Sep 2024 08:33:06 -0700 you wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Keep atomic file clean while updating and make it dirtied during commit
> in order to avoid unnecessary and excessive inode updates in the previous
> fix.
> 
> Fixes: 4bf78322346f ("f2fs: mark inode dirty for FI_ATOMIC_COMMITTED flag")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: prevent atomic file from being dirtied before commit
    https://git.kernel.org/jaegeuk/f2fs/c/fccaa81de87e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
