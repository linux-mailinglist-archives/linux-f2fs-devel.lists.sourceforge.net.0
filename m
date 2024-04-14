Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 368888A4361
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 Apr 2024 17:33:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rw1qj-000104-1N;
	Sun, 14 Apr 2024 15:32:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rw1qh-0000zm-Mx
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:32:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KX8LmRNKibWaSe20BvZfWWdlGHRAp3PPSfNXlirclQQ=; b=jkAayEzvXMSObSI7+osfdCOMIx
 seN39jFp93VPY0gWqHtLxBqXYPeNRweZ5B1Bv6YhHVCOIoKrbolgiw60SNPJ81D4vnyItb+lnxWjX
 QJ01cxSXpu674kPiBujpUZNt8hMX6QNtVm1YzUgvrZppBtaX5xE6lfaxIDeVjAFziaGY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KX8LmRNKibWaSe20BvZfWWdlGHRAp3PPSfNXlirclQQ=; b=RIK744b14VBLziDtz1PzBchw5z
 Wh6M8Vhi38p2PIqC0gy4ocRWJkMCI5P0i65P/pwXqfkc+W5r0X1j/wiV2STVRS8wkRYeFtGzF3yH7
 e8anbBHPcYiLUX4Wn534d6ZPwwQJxa/UBwFajLp7fo4JnAvVUbhOXGKyTHMwGJMgJBYI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rw1qh-0003WJ-KY for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:32:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 878A960B78;
 Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E199C32781;
 Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713108765;
 bh=DXSKgdJzVmHazsq2hEXi5c55HkvD/ZF2dqfR0/U9l64=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=B4oGpevJo2dJXw4epeuwNrQ2HtBYNvKBgDga2ak/BbINJ0yJs54K2FlGXgdVZwxn7
 51ZsQ1HWQr0dRO+OAmunl9BPEmNNz2OiMF4MlHxq4zae4QMeOnbkHgBap5XzHqV6Fg
 xPS5hjW+IFarIfM/ZMB70dwrH/QvdyFM1w6+bbEOnB8/uNopL+o2Kla8uifahYHSO4
 B4JD2xOB34R8F54SlPHbaEat/3SQU6TAnFUnGVvDSr++qZXce4/oRdu9mnidi9A25d
 F53+N44fCRQhlNtjL/k08Kqq9JvshiHjHb7tg6qsbBG0cM3E+GgNHLTb1Ay+D7sbux
 taMIK0Up30Vrw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1D0D9C32751; Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171310876511.3156.10918924129747857805.git-patchwork-notify@kernel.org>
Date: Sun, 14 Apr 2024 15:32:45 +0000
References: <20240407072123.3484300-1-chao@kernel.org>
In-Reply-To: <20240407072123.3484300-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sun, 7 Apr 2024 15:21:23 +0800 you wrote:
 > From: Wenjie Qi <qwjhust@gmail.com> > > If the max open zones of zoned
 devices are less than > the active logs of F2FS, the device may error due
 to > ins [...] 
 Content analysis details:   (-7.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rw1qh-0003WJ-KY
Subject: Re: [f2fs-dev] [PATCH v7] f2fs: fix zoned block device information
 initialization
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
Cc: qwjhust@gmail.com, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sun,  7 Apr 2024 15:21:23 +0800 you wrote:
> From: Wenjie Qi <qwjhust@gmail.com>
> 
> If the max open zones of zoned devices are less than
> the active logs of F2FS, the device may error due to
> insufficient zone resources when multiple active logs
> are being written at the same time.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v7] f2fs: fix zoned block device information initialization
    https://git.kernel.org/jaegeuk/f2fs/c/0f9b12142be1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
