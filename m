Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D05C99B37D7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2024 18:40:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5TjO-0002fB-MO;
	Mon, 28 Oct 2024 17:40:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1t5TjM-0002f2-Vp
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 17:40:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JiiEDq2WRhDtEuiXBzF0RBUGMyHKy65Tvuu0PkW6wks=; b=ckHZt7ZpLNDAHeajm5JPxsDF5D
 jwDbIg8UFiCg8kGQzkc10MqIVVLTNsUybZijcepV0xFGkwGd7rOffhDTWaTp07NJhquf/g1xVFXM9
 X3Y4jTSf5VfcJylST70NK4PUbOOkeMZNCNmyn1qwC7wzKwWcgxbKtA9uz9dHFfGRhI5o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JiiEDq2WRhDtEuiXBzF0RBUGMyHKy65Tvuu0PkW6wks=; b=C+26BuB0eOfIHI3LyQbgMpRcvl
 tsvGISjVduGeiL9C9iyJsBmD+R4JR+iagsGqRyjxAhB+SlZF4VNFyPlYcCDF2MSnHaxuU5AQj/wkL
 DTvIOzKMxDdyZaPrTWVQ1tx1atNZAzg8w5WU51S6YyKzvMag7zTttWaF0arMnHdjOtFU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5TjN-0005Gx-25 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 17:40:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A4B325C5DAE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Oct 2024 17:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79148C4CEEB;
 Mon, 28 Oct 2024 17:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730137230;
 bh=jbD4kB2lny49lkRI36bb9+2SD3KFP/t23sZnoMVzfUE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=WLehbrUe0YqtilgTOIPZpghc25nUgpurmNrxelnT63js+josYYPVb+VSgS36IiK+e
 hQSLTvCvpdcd6a6m8xWLQW5HrLZ8IDTnwhvLyOj3El1KGJCxzzbO+1BCmPIUkhDF6s
 rQNfkqd1VopVfpV9EpQ81M3aQhsM5S/9ckkkHMLINF38aaIp5IIBWs6ATOrRf+ugIR
 McQpLeseRsSQPBVs0w+psZ9KTVR2eyuSUWjGLr+40l8w32AN+NQqD6Wb8YUwAOym3v
 Dqd6z/+5YE7mTH0qdTFsQNNi26Xjy8gxVyXaJa3WR7zjSh0pvv2CbW2EfwoA2RC0pP
 gW4pysviKaKLg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EACC1380AC1C; Mon, 28 Oct 2024 17:40:38 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173013723774.126843.10015173129385559237.git-patchwork-notify@kernel.org>
Date: Mon, 28 Oct 2024 17:40:37 +0000
References: <20241016082420.610844-1-chao@kernel.org>
In-Reply-To: <20241016082420.610844-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 16 Oct 2024 16:24:20 +0800 you
 wrote: > This patch adds per-device stats in debugfs, the examples > are as
 below: > > mkfs.f2fs -f -c /dev/vdc /dev/vdb > mount /dev/vdb /mnt/f2fs/
 > cat /sys/k [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t5TjN-0005Gx-25
Subject: Re: [f2fs-dev] [PATCH] f2fs: multidevice: add stats in debugfs
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 16 Oct 2024 16:24:20 +0800 you wrote:
> This patch adds per-device stats in debugfs, the examples
> are as below:
> 
> mkfs.f2fs -f -c /dev/vdc /dev/vdb
> mount /dev/vdb /mnt/f2fs/
> cat /sys/kernel/debug/f2fs/status
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: multidevice: add stats in debugfs
    https://git.kernel.org/jaegeuk/f2fs/c/4d11e609f4c0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
