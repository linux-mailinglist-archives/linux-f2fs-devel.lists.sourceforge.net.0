Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D9599D7F1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Oct 2024 22:11:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t0RPJ-0004vI-HK;
	Mon, 14 Oct 2024 20:11:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1t0RPI-0004v8-GF
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Oct 2024 20:11:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8j++6LwGX3/j+0c5+IRHJELIXtiNOsiqiP7ey1bDDqY=; b=gJrL1tZ1XMZ9D79x2gmkErMtU7
 E5hfwLGCYS4AhWuDjsveYQsj1wrfIHuyoAgPcYl49DTYqHt1Apc2woBkAjy/+UuUquOegKixAhLlE
 x3K+P0DLDwqJa8Qdz0w80754tA+XiB/JuzQKhiGJf28z25AYPaR6CweDkRz7AsH71if4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8j++6LwGX3/j+0c5+IRHJELIXtiNOsiqiP7ey1bDDqY=; b=HrtG5VrNjNbaN+GYVTqe8URT6Q
 jWwhp7tmogIcpnBJ7TDgrgPLpUoDBkAc46W3G5ibGlByNuSFuMM7w+yLOQU1mb9c5KbaPOgK2l8W9
 X0j6kXrZwn1czHQYEDwAhW9xfQQGCO5pJfxpDQWE7G6QiAqDD34u3NqOVlQkMaytrnoc=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t0RPH-0004eT-M3 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Oct 2024 20:11:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 19FE6A40BE2;
 Mon, 14 Oct 2024 20:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFF4C4CEC3;
 Mon, 14 Oct 2024 20:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728936656;
 bh=p9G35PbIUK7+ewU8XEznrjm2gtY2iaGnOlU5FjnoMzI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ETvuTmWZfbvIBwricVrBM+hYqjKbL7+aiqWf8jeGfvaIle7BLpXe1ySv7Hk9G74Kt
 YmdO8fotJU6DkXNQkogW8a0roxG/CmBguKoY+gipsxsn4/aKoGzGLe8qp9A5lHtDKK
 yte4U3pkBWDJG7Fzi2pp0hQiQsiEGTZcv9oohriujVyK1QDhpvyZgwHbbEqdxo+w0s
 oVDygm/286D0EtVIrwunDZelcYVx8noxGYmnN9mavKcgqC5+1AKH1qUA7Iujt4NMqS
 EigkwpQjuVx3O5VrSPHHDQUdIyj5xODgIs/8ptsMRR1u78WqWF/uIE5nazqmRwcTEV
 2i0s1MCXSizJQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB3E43822E4C; Mon, 14 Oct 2024 20:11:02 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <172893666179.626029.10613192954961999474.git-patchwork-notify@kernel.org>
Date: Mon, 14 Oct 2024 20:11:01 +0000
References: <Zw1MHWwr3fRgJpLr@google.com>
In-Reply-To: <Zw1MHWwr3fRgJpLr@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This pull request was applied to jaegeuk/f2fs.git
 (dev)
 by Linus Torvalds <torvalds@linux-foundation.org>: On Mon, 14 Oct 2024 16:51:41
 +0000 you wrote: > Hi Linus, > > Could you please consider applying this
 patch in f2fs? > > Thanks,
 > > The following changes since commit 8cf0b93919e13d1e8d4466eb4080a4c4
 [...] Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t0RPH-0004eT-M3
Subject: Re: [f2fs-dev] [GIT PULL] f2fs fix for 6.12-rc4
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
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This pull request was applied to jaegeuk/f2fs.git (dev)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Mon, 14 Oct 2024 16:51:41 +0000 you wrote:
> Hi Linus,
> 
> Could you please consider applying this patch in f2fs?
> 
> Thanks,
> 
> The following changes since commit 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b:
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,GIT,PULL] f2fs fix for 6.12-rc4
    https://git.kernel.org/jaegeuk/f2fs/c/eca631b8fe80

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
