Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD3BC5000B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Nov 2025 23:51:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSc0ojCFYsI02ikoYQLoYMM7XlSpxlmzGQmInqMA/vo=; b=ZV73/+U171A/yERr17UOxOodEI
	QqBd3G+E6ntgLKUvXgsZEzmYXqTtDNaJh2dX65GW/AFjT85MiaFVrOjhgeJdPynLJ78UfVT+h9ktX
	kmw7Hf1bJHFooU9AxSdfgbkwNbLoLQJGHDn50gsIa/9FXBVjgkszZrr+ZfzPdvIFSlzY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIxCX-0004bp-3s;
	Tue, 11 Nov 2025 22:51:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vIxCT-0004bI-MH
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:50:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dVssa95qYaxIJaRdTeyFuOQX6+WqyTabAyyHiivyt7Q=; b=lYUcAT8Ei/6WCICP2SF6gLYVzE
 Zvy6OiBLpPLjGMsKYHUlCqe7mAeOhk++o8OzUTCb7+4kRhR0b1cwaLzv331IvQZMD3mK2jZNy5gLL
 If05WenuolRdejgHVR0YOLK4pAn8tXC/r7dXdt+mwOnhGOfofBVs3UgCxCqRka3GUKtY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dVssa95qYaxIJaRdTeyFuOQX6+WqyTabAyyHiivyt7Q=; b=gd+JmuDoUUXzhHkOCYGqFHs2+5
 2EBfpOhHy4mNVDGz3ePVAg9dHL87e5ucRkXSlyPdAbIkVhjR/KnWKDQK4NqR/0e3CziXuhkS+ZPjm
 +pzuR3WrgJbQskI4ukrKmoTbssfkUKULN0RSNETZAP7MugmjmdQxpzZ5LNKdV9ZrUAPE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIxCT-00046g-1c for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:50:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BBA38446AB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Nov 2025 22:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A415C116B1;
 Tue, 11 Nov 2025 22:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762901451;
 bh=aBeUVRElA6skoKpJp7e24LRjOo41rE3IgWMUo5RwVfo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=oV4wwU7PMLNL8tSbxjcJBNKJZR2Yl7nZx1Bb/IvL3mHJ01hzFaUBvgK1qG8bD7hsV
 /DtyjbEDN/rG8im93qORWJ34LamMOqIhE/OJiCAnD8BRURQN2z4DeUx+xwRyLcsEeJ
 CwH8DPMUW5pNgVEMxysMZXpvRFBymo1xvjsJSLnV11gt4VjUpzwQSCSk5smqXgqxUR
 hmWU/KWEdPu5M3qvluZGjSmRcR6jq1vUY4dKYoYt3LLshIeBRemur5yfOJDaSuACR4
 PsXU+iVbPKDB7aK/GFtENSCoqaRLyMEK8Nm7kmwW16JXNz3IzM8NnJa4bUbMlymm8m
 1emtmFAaPklMQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB26E380DBCD; Tue, 11 Nov 2025 22:50:22 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176290142149.3596344.6185023964431728544.git-patchwork-notify@kernel.org>
Date: Tue, 11 Nov 2025 22:50:21 +0000
References: <20251105065023.3656975-1-chao@kernel.org>
In-Reply-To: <20251105065023.3656975-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 5 Nov 2025 14:50:22 +0800 you wrote:
 > With below scripts, it will trigger panic in f2fs: > > mkfs.f2fs -f /dev/vdd
 > mount /dev/vdd /mnt/f2fs > touch /mnt/f2fs/foo > sync > echo 111 >> /mnt/f
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vIxCT-00046g-1c
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix return value of
 f2fs_recover_fsync_data()
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 stable@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed,  5 Nov 2025 14:50:22 +0800 you wrote:
> With below scripts, it will trigger panic in f2fs:
> 
> mkfs.f2fs -f /dev/vdd
> mount /dev/vdd /mnt/f2fs
> touch /mnt/f2fs/foo
> sync
> echo 111 >> /mnt/f2fs/foo
> f2fs_io fsync /mnt/f2fs/foo
> f2fs_io shutdown 2 /mnt/f2fs
> umount /mnt/f2fs
> mount -o ro,norecovery /dev/vdd /mnt/f2fs
> or
> mount -o ro,disable_roll_forward /dev/vdd /mnt/f2fs
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: fix return value of f2fs_recover_fsync_data()
    https://git.kernel.org/jaegeuk/f2fs/c/d05faa07e7da
  - [f2fs-dev,2/2] f2fs: fix to detect recoverable inode during dryrun of find_fsync_dnodes()
    https://git.kernel.org/jaegeuk/f2fs/c/ca244e9242a1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
