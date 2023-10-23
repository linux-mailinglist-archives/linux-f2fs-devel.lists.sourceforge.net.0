Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3FD7D3ACF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Oct 2023 17:30:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1quwtD-00077Z-H0;
	Mon, 23 Oct 2023 15:30:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1quwt7-000775-I9
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Oct 2023 15:30:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R+jLo7IfWYibxXrNCF2TESUzM9lzJUGhsAoisgf79CM=; b=fxyJDSOmeOfic8yPY16J8Qo7K/
 oQcWg4vshUyEUSqJMRPQ+VlRmTHdB8HvKH7j5zGHxun0kZX5HhYK4KoDuOrMh6BNB/rDM4xxZfndD
 z1lcxBTMrZcagmrY0+RYfezqLiXfD8UlVRZExcPENYl3wSR6XdpUG7Un+Iw17B3VqUQ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R+jLo7IfWYibxXrNCF2TESUzM9lzJUGhsAoisgf79CM=; b=ej+EdzDh0r+DaQ6zR65A0+Hl0b
 LxAsES8sKHO5gnOsYvhboRx98Qt+iNZcNpPC8stXYdpfgKcDcqJ6jp6jQrQK/knK/OyqHOaz4PeHq
 pnsB6aPuJxsIW1IGsZxIbbE45bHrXbqAzpmQEEllMc1dDynO33vCeLTWGl49ycl6ECOY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1quwt3-0002Hx-Nx for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Oct 2023 15:30:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 50F9561DC5;
 Mon, 23 Oct 2023 15:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4FE46C433AB;
 Mon, 23 Oct 2023 15:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698075025;
 bh=OKWIKmca4kW63hOA9qQevvO3LIv+dqiLYJlGjPsbZbE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=g8B7PKtpL0Scf8QfuO9OGn5ygw3uIm7XzZl97Yoe42zP21xgVHm8hbbe6I/4UbDvg
 v3S+ldLjWaqgP27EGKbtXwmQDeDoXqwgTg9flJx41VgPG0OLhY7ewiiFg/P9IosP0b
 /RtDY81G0jyk3yQ0FD4xYrXmfqE20wTBAuiesuVxgLRjN93LpoPLEy2zLxZP9JmUHu
 Ea3OZ9hOuMkv/3Tr02mXDaYI8Jab+W9hvRNjEbXTffGgMN5qfS7KzmbqDXpyqH+G6P
 w+CPYRnpjbkaQR7VpI7w42n11oMQ5yuqIt8D1ShDViYEIxvyDE0rZV45GxhrhFlgxh
 RrloaKs36azeA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 33E20E4CC1C; Mon, 23 Oct 2023 15:30:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169807502520.26537.15643252943037065209.git-patchwork-notify@kernel.org>
Date: Mon, 23 Oct 2023 15:30:25 +0000
References: <20231002230935.169229-1-drosen@google.com>
In-Reply-To: <20231002230935.169229-1-drosen@google.com>
To: Daniel Rosenberg <drosen@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 2 Oct 2023 16:09:34 -0700 you wrote:
 > F2fs filesystems currently have two large restrictions around block size.
 > The block size must equal the page size, and the block size must be 4096.
 > > [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1quwt3-0002Hx-Nx
Subject: Re: [f2fs-dev] [PATCH v2 0/1] Add 16K Support for f2fs
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
Cc: jaegeuk@kernel.org, kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon,  2 Oct 2023 16:09:34 -0700 you wrote:
> F2fs filesystems currently have two large restrictions around block size.
> The block size must equal the page size, and the block size must be 4096.
> 
> The following patch, along with the associated f2fs-tools patch set, relax the
> latter restriction, allowing you to use 16K block size f2fs on a 16K page size
> system. It does not allow mounting 4K block size f2fs on a 16k page system.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2,1/1] f2fs: Support Block Size == Page Size
    https://git.kernel.org/jaegeuk/f2fs/c/d7e9a9037de2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
