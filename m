Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7477D3AC6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Oct 2023 17:30:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1quwt0-0003AS-Mp;
	Mon, 23 Oct 2023 15:30:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1quwsz-0003AF-BY
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Oct 2023 15:30:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x7fm6kHVzxNBeGp83tN2ID9/OpjzwL2m+nL03Fhply4=; b=TLLw8y20Q3GHunFwFG/gQeo1ar
 YC+T1am/p/whvdilVYUAkVAXCpoZzeR33kZHZu5EGz8qbsBPDJNmyRAStrr9rVrDQPH8DsAXmRevF
 zXuoRdHfDLMFArJGmrk934nXNze3IN519rgMblc437eLVTkQg62fJ6fKbRGKlUVAZSGA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x7fm6kHVzxNBeGp83tN2ID9/OpjzwL2m+nL03Fhply4=; b=mBpmqi0hu//5ZFYdexhSoV2OcH
 zuSIhV/+cBBGnsCgAzY0jWVMaczUTYBiKKStoklack5mBvnrWCY+UJJhdXcKk/cpUOjk2YGO3wNlI
 QFex9YjH833GAAAyj/vprjBcIIWTpmfgMzs6mirRa0Hm8dy09YFNFP5AczgZ5lytA5jE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1quwsw-0002HP-R8 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Oct 2023 15:30:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6F5B761BE2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 23 Oct 2023 15:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1AC53C433CA;
 Mon, 23 Oct 2023 15:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698075025;
 bh=Qr2qJ1m47DDdX9GbktKLz922kAXN4MXJALybWvMfpNE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=IufPDlv7a+lFU6I5mBddw8bwm+roi+Fw+YghKAnnBSugnmaThqzqrqtqQ7ZNnOndx
 kDpJAXL0wHA4VHZ25YaWouXO6YDdALGa0ybnGYF6rivcE1wTqYxC1p8R3DN5/fo9UC
 95VE+yrbjI/Xm6nP2UjovzXqfNRpEy5ei/UCP0qa+yZIsny9yO8WOpHv+TqYuIXrMR
 tYTnkoDzRfhLiCMz8Ud14VJp8HgrihRTK1gt7lDp9QTnubdwCT+LcUnuMAKmQJ99YU
 NdeRPCHA1yc+/ox0rWQXr7VSRb1EOHnkUqtIJTJud8dfd3n8/SVrKbd80HAghn8a1c
 IjIhsqc6xaXzQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 EBC00E4CC1C; Mon, 23 Oct 2023 15:30:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169807502496.26537.15638158417948699715.git-patchwork-notify@kernel.org>
Date: Mon, 23 Oct 2023 15:30:24 +0000
References: <20231007074552.3170496-1-chao@kernel.org>
In-Reply-To: <20231007074552.3170496-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sat, 7 Oct 2023 15:45:52 +0800 you wrote:
 > Otherwise, it may print random physical block address in tracepoint > of
 f2fs_map_blocks() as below: > > f2fs_map_blocks: dev = (253,16), ino = 2297,
 fil [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1quwsw-0002HP-R8
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to initialize map.m_pblk in
 f2fs_precache_extents()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sat,  7 Oct 2023 15:45:52 +0800 you wrote:
> Otherwise, it may print random physical block address in tracepoint
> of f2fs_map_blocks() as below:
> 
> f2fs_map_blocks: dev = (253,16), ino = 2297, file offset = 0, start blkaddr = 0xa356c421, len = 0x0, flags = 0
> 
> Fixes: c4020b2da4c9 ("f2fs: support F2FS_IOC_PRECACHE_EXTENTS")
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to initialize map.m_pblk in f2fs_precache_extents()
    https://git.kernel.org/jaegeuk/f2fs/c/8b07c1fb0f1a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
