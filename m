Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC72C50015
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Nov 2025 23:51:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vbS2DC3XG6deMgvAq07XKO/SwsCKaF8ScbA+U4RsnY=; b=djD8w5W16YsNMwSi9jnJ7mAdmm
	UJAYqNOHLSU8w0Nda0gn6P2gUJFe3ponv5KLsRPu3uZqs8Vu+9+rbGC0vbICzyuM99XwyoEY4tI4Y
	iL4gvA+LlLeqG8udaN4SHsiVgZHrb/V15ONILRKKOY9C8jAdcFew7dEj2YVTtP8NciOU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIxCY-0002yq-D7;
	Tue, 11 Nov 2025 22:51:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vIxCS-0002yF-Uy
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:50:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Saxw2KCWUjGjqwUaverz3YSXi+y34iho60NeMiVCyLc=; b=Uu5ZrAlf6SX/IqHrvDzjvyJUKV
 HNXeFruKVOpw23YNmIajfjPFhdT0mHjjCRhjpnNVbhEy+xE+xy+4/4EC70qsiJDH27nWUD8cmfp5c
 25Xl3NR4aiOwaU3320ayyElBz9DDYm76rcs12oe3Tj/WPukQpBN5MDmAtcEphImOh/0Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Saxw2KCWUjGjqwUaverz3YSXi+y34iho60NeMiVCyLc=; b=DPqJviKNU6WIxkEkb+6H+A1oJt
 Tv64/3y1/sHtPq7ZA4qTA4zbdVjoZzN9PTik0IoMqks/8WkPO0SJigo79Bgmnt63wTU+Fa5pTyWgs
 VpEivULMkVJN5DXD2RgMKf5DTSfDmC+cj60VzS6WtnvuN/SwySuMjhd3EXItznYZbtSE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIxCR-00046R-9g for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:50:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 044B5446BD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Nov 2025 22:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD14CC116B1;
 Tue, 11 Nov 2025 22:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762901444;
 bh=XwfyhGg09HKqiv7zmaScf+pdUnoKEQvBL1rZ1pJG430=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=JilYNZfxLPmfHyaCTQJoVFJb3IeTwYf5amGNtREVrvu9EaRpy6VsL0dLlventvjK9
 yOauQRBGWWXQ4+UweOPMHrABqf5oZdSGcLuLWgADsIMCVY6XxdBYqiVTF61RFoX36O
 GjNy3499ULqolGFQRX1UhfcVnvD050TZvxWCJ7/SQtXj2OIpcpwTbhmTaQCw1ur1HV
 GFX92QtmonljbCflEvGwXp9LcmOq4tUA1E0X0enULGbRN4WV+8CZyXwiiyRl8zcis+
 GIx9HG5u/iEU6eYpwnc1xDL2jyuma6MPGwyQvnsZH+gyDsosaODx6PYLXus78Qc8Fj
 oyCh64XDPOZRg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33C87380DBCD; Tue, 11 Nov 2025 22:50:16 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176290141484.3596344.169057131556061047.git-patchwork-notify@kernel.org>
Date: Tue, 11 Nov 2025 22:50:14 +0000
References: <20251027063534.103963-1-chao@kernel.org>
In-Reply-To: <20251027063534.103963-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 27 Oct 2025 14:35:33 +0800 you
 wrote: > In order to let userspace detect such error rather than suffering
 > silent failure. > > Fixes: 4354994f097d ("f2fs: checkpoint disabling")
 > Cc: stable@ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vIxCR-00046R-9g
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix to propagate error from
 f2fs_enable_checkpoint()
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

On Mon, 27 Oct 2025 14:35:33 +0800 you wrote:
> In order to let userspace detect such error rather than suffering
> silent failure.
> 
> Fixes: 4354994f097d ("f2fs: checkpoint disabling")
> Cc: stable@kernel.org
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: fix to propagate error from f2fs_enable_checkpoint()
    https://git.kernel.org/jaegeuk/f2fs/c/9e2d7d763a3c
  - [f2fs-dev,2/2] f2fs: block cache/dio write during f2fs_enable_checkpoint()
    https://git.kernel.org/jaegeuk/f2fs/c/ba4591f78dc1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
