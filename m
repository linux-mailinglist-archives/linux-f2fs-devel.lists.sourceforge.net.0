Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2103C84144F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jan 2024 21:29:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUYGJ-00025u-Am;
	Mon, 29 Jan 2024 20:29:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rUYGG-00025k-6M
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 20:29:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1sJ652kVpMhyPQuVJ6wcDaW/GJWDe7dbJKeG4znLoe4=; b=KkKQ88aeLkmaQEicBbGh1mnu/x
 aKYb7TtAAxwHCUGh/XEdLZAGKE++Aar8MJXGcWxvLemV1OWT50tcZ6n+PsqNrLX+A/sVwn84eSI4U
 0Fhuq76S3gNKegHd6rNIlWZ5nONzqxxxMgVxX24JKtMxT5KK6xCBBfJao8KTCxDVY9wg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1sJ652kVpMhyPQuVJ6wcDaW/GJWDe7dbJKeG4znLoe4=; b=aeNZUGliSd9JSonTacQ0FHcDrb
 TwO+btGO0rNmnNJ8K5nILRCAwI1NMDTYUqZeCulZEkIhehlyFFMQuo0+ULiybI1F3RDIpkdTKycyQ
 pbzA1rp/5F+rLnFU+KYpU7Ujw00EGx0XO18aDUPbQjsN7gezssNFJwi2xzBlOVNWcD3Y=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rUYGF-0008Ps-9a for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 20:29:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 17615CE1773;
 Mon, 29 Jan 2024 20:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0754AC43390;
 Mon, 29 Jan 2024 20:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706560171;
 bh=1dJSQ6Tnp2+ouIN2nL7yz88hd0l7IGvrUD6ww83AGCY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=MzZPMHWtTAC6aGCtBddBG+v34X5vJvNHnhA7bY/RxRJJIzS9PU7pB2ezeYYLCcRIZ
 BOdJVqin1SshTRvYp/Mi0HLbKotzhnMudhBYEUEZnX2Iz1kfF3XNnUr3dGcf18kN2C
 rQJKn9rQQibk7YBJjrLeZkE6O+Wi9fXdCQnY0AmZoOrLqyNgWhYDZw7miaLZ2VDROs
 fU14NZA5S2UcSVeCIpbJJ/OIq+Bvyk745XBoEmVLLy8JU0R3QYuBZ9rWfpjTdYphj3
 v4rxHKx4gnAk5eHUt1fBBzUOOgMgVq4hYncHFyVwdgyT28Wb6nnTGTyV0wHxi6Nos7
 AQvgpnPsDvJlg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E373EC561EE; Mon, 29 Jan 2024 20:29:30 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170656017092.16041.5056529810169892695.git-patchwork-notify@kernel.org>
Date: Mon, 29 Jan 2024 20:29:30 +0000
References: <20240112194132.25637-1-chao@kernel.org>
In-Reply-To: <20240112194132.25637-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sat, 13 Jan 2024 03:41:27 +0800 you
 wrote: > If data block in compressed cluster is not persisted with metadata
 > during checkpoint, after SPOR, the data may be corrupted, let's > guarantee
 to writ [...] 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rUYGF-0008Ps-9a
Subject: Re: [f2fs-dev] [PATCH v5 1/6] f2fs: compress: fix to guarantee
 persisting compressed blocks by CP
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
 daehojeong@google.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sat, 13 Jan 2024 03:41:27 +0800 you wrote:
> If data block in compressed cluster is not persisted with metadata
> during checkpoint, after SPOR, the data may be corrupted, let's
> guarantee to write compressed page by checkpoint.
> 
> Fixes: 4c8ff7095bef ("f2fs: support data compression")
> Reviewed-by: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v5,1/6] f2fs: compress: fix to guarantee persisting compressed blocks by CP
    https://git.kernel.org/jaegeuk/f2fs/c/fe2b98bcae7e
  - [f2fs-dev,v5,2/6] f2fs: compress: fix to cover normal cluster write with cp_rwsem
    https://git.kernel.org/jaegeuk/f2fs/c/bd0dddafd4a5
  - [f2fs-dev,v5,3/6] f2fs: compress: fix to check unreleased compressed cluster
    https://git.kernel.org/jaegeuk/f2fs/c/787f217e7f04
  - [f2fs-dev,v5,4/6] f2fs: compress: fix to avoid inconsistence bewteen i_blocks and dnode
    https://git.kernel.org/jaegeuk/f2fs/c/6d05c8d5997a
  - [f2fs-dev,v5,5/6] f2fs: fix to remove unnecessary f2fs_bug_on() to avoid panic
    https://git.kernel.org/jaegeuk/f2fs/c/ef62f2496f99
  - [f2fs-dev,v5,6/6] f2fs: introduce FAULT_BLKADDR_CONSISTENCE
    https://git.kernel.org/jaegeuk/f2fs/c/e2c2cb1a331f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
