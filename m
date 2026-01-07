Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4617CCFBDA7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 07 Jan 2026 04:33:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gR7lbjaLGcXU1P8Dygh2crWcDd6kajnOzZH8RrUqax4=; b=ir/hUj8puzTl1mTgIaeys5Borv
	vxxSgdy8hbyHk+d5FKX5NjrQI38XT+YbihaG9LP7WQ+GQqOCV6sZloKdNVQUy14NN5GmdGF50CcCR
	gG3twMr8aGtrq0mnDFtiibHL995txSjW/x0TOZdfsvfoqX7s18w8+5Y5EVtXTC7s4COA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdKJ4-0002QC-05;
	Wed, 07 Jan 2026 03:33:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vdKJ2-0002Pu-LK
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 03:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H5v2m8hDRVrsktUlTuRHjspB0vGr7d8wN/vWE9BDYmE=; b=M445OM4MgWs9hxv1Mn7rMYJRTH
 krYGejrCmm30Lz9QG1UtST4SENyedEuBGN2S+iOoLmPxr37HWZmAQa/gIJ2XgUE+3hjoNNY/dWYgf
 Oag+ixW+PNzircktqmUqB+lxjU7nXWZE5PvEVPJXvY5LvDOFNIYctXqFv0+REqzRDGak=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H5v2m8hDRVrsktUlTuRHjspB0vGr7d8wN/vWE9BDYmE=; b=RF6b2VmDRYWnyRNM5tutmWnKrc
 pTOuMIFCyx5KC/DRiwibEuGGHhZxebxc/huSm5lYykXtmyxFsa4Le4gekmzoGzRPldCZIIFlTSkWY
 3xm2cbsWojHOodzV1OWdMdSB2Fk2dOyM/29EQl4LMZX467tMR3hedM+nvkWoE5OKXDok=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdKJ2-0004Ye-5x for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 03:33:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A29DD60007;
 Wed,  7 Jan 2026 03:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CF3C4CEF7;
 Wed,  7 Jan 2026 03:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767756825;
 bh=PJ4PmrR24RMG0Bcr4OQEO7J5U5CQzdkOk6dHsF6LXnI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=F5SnN1xH7cT5/KVU0ouaeKoQp956g/n9rzaTsVIb1rTECUUtVVeQpgCrW5MlbuuQ0
 3CmyoHRD8KykzP0fyr+EhBmX+eOuWJLP8tzqbfTwgI1MGvBgHnlNzBSH5/M834XnpH
 aj2sYAKqE2LBwiVD9JrNZlQqWnrnlnbedqwmL1ogyqni1RaPkI62Vya5MIFZIYT3tv
 HIee3BOpBTcQiJp9Jrhk81qo55i11LTEj5U2ydkS4zov6xui9gORCftzH2u21Lngiu
 32ZQJMCfTJpFCHkBm6Hn7TtDPEe3OSW3uddqi76goiW9SOu8eVOEJ8kEJMlmsCdY9E
 cIL+oe44DJ9+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 F2AFC380CEF5; Wed,  7 Jan 2026 03:30:23 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176775662252.2218650.15325210865015918584.git-patchwork-notify@kernel.org>
Date: Wed, 07 Jan 2026 03:30:22 +0000
References: <20251231135433.1069590-2-monty.pavel.devel@gmail.com>
In-Reply-To: <20251231135433.1069590-2-monty.pavel.devel@gmail.com>
To: Yongpeng Yang <monty.pavel.devel@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 31 Dec 2025 21:54:33 +0800 you
 wrote: > From: Yongpeng Yang <yangyongpeng@xiaomi.com> > > Some f2fs sysfs
 attributes suffer from out-of-bounds memory access and > incorrect handling
 of integer [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vdKJ2-0004Ye-5x
Subject: Re: [f2fs-dev] [PATCH RESEND 1/2] f2fs: fix out-of-bounds access in
 sysfs attribute read/write
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
Cc: jinbaoliu365@gmail.com, yangyongpeng@xiaomi.com, liujinbao1@xiaomi.com,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 yangyongpeng.storage@outlook.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 31 Dec 2025 21:54:33 +0800 you wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> Some f2fs sysfs attributes suffer from out-of-bounds memory access and
> incorrect handling of integer values whose size is not 4 bytes.
> 
> For example:
> vm:~# echo 65537 > /sys/fs/f2fs/vde/gc_pin_file_thresh
> vm:~# cat /sys/fs/f2fs/vde/gc_pin_file_thresh
> 65537
> vm:~# echo 4294967297 > /sys/fs/f2fs/vde/atgc_age_threshold
> vm:~# cat /sys/fs/f2fs/vde/atgc_age_threshold
> 1
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,RESEND,1/2] f2fs: fix out-of-bounds access in sysfs attribute read/write
    https://git.kernel.org/jaegeuk/f2fs/c/98ea0039dbfd
  - [f2fs-dev,RESEND,2/2] f2fs: change seq_file_ra_mul and max_io_bytes to unsigned int
    https://git.kernel.org/jaegeuk/f2fs/c/071e50d61cf2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
