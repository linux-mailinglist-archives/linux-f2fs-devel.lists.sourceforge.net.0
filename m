Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E9F8A435B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 Apr 2024 17:33:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rw1qe-0005qS-Gk;
	Sun, 14 Apr 2024 15:32:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rw1qd-0005qM-MS
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:32:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CP3BuRckj+Hh1CTPEqi2P1g/LVd17QRHUyeC5qQEf/c=; b=JsYDka01YLxexsXXv+uA7dACAl
 ou99JqwuXXCm18oMKYn1JqOGQSHHydy4xjJmZPBvC1m7Zk3Dzy46hcWbJKCt+1V/5hsVLjxmC4D69
 NXG0pAte9OibBMM+a9j1++0MzR/VZStY+aUGkJyi/DiPYWGu9ACUCD/t8sIFdNabVaKI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CP3BuRckj+Hh1CTPEqi2P1g/LVd17QRHUyeC5qQEf/c=; b=RCB4fIlubn99/5HRPV5db2SffY
 bD8V/MCz1wj3tZhRL1YUnw/zT1yU0eTGSiCTDl4+xVdXG/SP/yKqO1sJF7wa2w0Hsucxgx4JOOVtQ
 7cORuWdyzvJhA48XLwOgtn3cG3qVEaOKMUXX56uGXadJUt+mhwHyXzwPHXmOmkOkWwrE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rw1qd-0003Vj-6e for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:32:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1F26960B85;
 Sun, 14 Apr 2024 15:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5294AC4AF0C;
 Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713108765;
 bh=3L4+fDkzDFHAZ+szBJYMTSWnDcyTz76RO9nlceD/Qaw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=T+2UEr+/0bY28FJoGI0rIhcARvlnL+B/v1b3OYpgWWURjntitMAYAmQxPvvHLqqVy
 sRvU8UzI/6+4EVOShVOojOkNiwN8EF1Z6ddzCDoNd55Ay4yBGROfaDdEnFZlCAGX6o
 Kua3RFCm2kUf2rRQUaxbU7gQOQfoqKatb0bwpCmc/J/V4Im0DWvTEA8JAhHJcea3JZ
 DNV032C0FyYWOlw8DuUyBXjgQSusSUgUlgZZrXyhOo7hb/CqzmHThp/EIJb2CzNwZ/
 SLhV9nshkeVyvrScyklNlSHY6aDRK77yPrgkKl2sdYcz0gAUQj/RRJaHDGwF/vj8Rv
 lioZavcJeypBQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 32D64C54BD1; Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171310876520.3156.2825403590213821856.git-patchwork-notify@kernel.org>
Date: Sun, 14 Apr 2024 15:32:45 +0000
References: <20240407072604.3488169-1-chao@kernel.org>
In-Reply-To: <20240407072604.3488169-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sun, 7 Apr 2024 15:26:03 +0800 you wrote:
 > Compress flag should be checked after inode lock held to avoid > racing
 w/ f2fs_setflags_common(), fix it. > > Fixes: 4c8ff7095bef ("f2fs: support
 data c [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rw1qd-0003Vj-6e
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: compress: fix to relocate check
 condition in f2fs_{release, reserve}_compress_blocks()
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
Cc: jaegeuk@kernel.org, zhiguo.niu@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sun,  7 Apr 2024 15:26:03 +0800 you wrote:
> Compress flag should be checked after inode lock held to avoid
> racing w/ f2fs_setflags_common(), fix it.
> 
> Fixes: 4c8ff7095bef ("f2fs: support data compression")
> Reported-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> Closes: https://lore.kernel.org/linux-f2fs-devel/CAHJ8P3LdZXLc2rqeYjvymgYHr2+YLuJ0sLG9DdsJZmwO7deuhw@mail.gmail.com
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: compress: fix to relocate check condition in f2fs_{release, reserve}_compress_blocks()
    https://git.kernel.org/jaegeuk/f2fs/c/7c5dffb3d90c
  - [f2fs-dev,2/2] f2fs: compress: fix to relocate check condition in f2fs_ioc_{, de}compress_file()
    https://git.kernel.org/jaegeuk/f2fs/c/bd9ae4ae9e58

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
