Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EFD8C2E19
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 May 2024 02:50:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s5awt-0002OR-98;
	Sat, 11 May 2024 00:50:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1s5awr-0002O0-UZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 May 2024 00:50:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3j2/afXuljUaZGoJXA7WEfow5olY4Di8ZOm8uVa1tTU=; b=eO9yh8OQgQ+KCRCg+eWYB5P4t9
 4DmN9t9n6u05ICzNUsKduUIXcpe0lo83e1AUwvuTIeBhzzfVo6gQv/dggLQunJTiX4NTMekTVv2oj
 6S/n4tdxD8kDn5UaJVYDdjSKwRDyRFcWqShnau+IyWN1FeVhxu65PyFJlj2oiBpvbDf4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3j2/afXuljUaZGoJXA7WEfow5olY4Di8ZOm8uVa1tTU=; b=fuycb3/ruayzWSGgtaR1oJGDb0
 vgk4UNkagI56O041cvBZG4px8dbU/pxwNXHnln+lWx5XSTmVBJKZEfheikP7rXzaAV/DYImxbZKEn
 pcSnr9US+d01Pwyqwn5KieaEMj0ley75UYRVH3pxbU+TXldVv9MdI5HyM8gVi74Pe90c=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s5awt-000509-Ax for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 May 2024 00:50:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 66D426204C;
 Sat, 11 May 2024 00:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 482E6C4DDE9;
 Sat, 11 May 2024 00:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715388634;
 bh=AgAMu+gDLWo3EWA4KTgzUI8GgEKMvy5SiUAFAwQuGwM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=L+SrKoc9SGVmN++aJfbvFTqyQWyyE23vY5zFm1SD2R+9b78XXzYe001PSUpSUkOFf
 CN06CP1/dYC2SkG8L1SlQ6PrffWQmT1V2MiKEO1Zi8RK0PXF2jX6glx+aehE2njMpF
 h1N+u6lh2FtjI2AtkE/PtOvvq3gpKQs1wShsEx1yzJ51iASqehniyh+EYdFaU3ZdTz
 uVHNmd3RZ62BmBb+2Kvd52Z9IBuC47+NyqrdBhufQWT+mhmjdk92p5FFbrk6xiwHms
 OxvJS59nkArUUIGJBIU6Tlo1D9GIrs7zEdvJG2Q0SPqQRrLDu00qd00lc7nBDUkllx
 T5QHjCfo+cjMw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 3C5A0C32759; Sat, 11 May 2024 00:50:34 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171538863424.11229.12572874171964870634.git-patchwork-notify@kernel.org>
Date: Sat, 11 May 2024 00:50:34 +0000
References: <1714132889-9423-1-git-send-email-zhiguo.niu@unisoc.com>
In-Reply-To: <1714132889-9423-1-git-send-email-zhiguo.niu@unisoc.com>
To: =?utf-8?b?54mb5b+X5Zu9IChaaGlndW8gTml1KSA8emhpZ3VvLm5pdUB1bmlzb2MuY29tPg==?=@ci.codeaurora.org
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 26 Apr 2024 20:01:29 +0800 you
 wrote: > After commit d7e9a9037de2 ("f2fs: Support Block Size == Page Size"), 
 > Some comments are confused and just correct with block size is 4KB. > >
 Signed-of [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s5awt-000509-Ax
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: fix some ambiguous comments
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hongyu.jin@unisoc.com,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 26 Apr 2024 20:01:29 +0800 you wrote:
> After commit d7e9a9037de2 ("f2fs: Support Block Size == Page Size"),
> Some comments are confused and just correct with block size is 4KB.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
> v2: add comments "support 64 TB disk size for 16K page size"
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,V2] f2fs: fix some ambiguous comments
    https://git.kernel.org/jaegeuk/f2fs/c/991b6bdf1b00

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
