Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5249B37DA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2024 18:40:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5TjN-0002Jt-9j;
	Mon, 28 Oct 2024 17:40:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1t5TjL-0002Jm-Ob
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 17:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HCGoAHSVebK0FL+NCHRE0wnim//6Ql61qDjBOhETUyU=; b=azut4UD14nhM3qNJ58/TVTPw95
 T9viM5WTPHdIf4TrUUXWJNOelxahjqNmSpG13qWqb5DJDTXnkr/5qDwssFV3nbbs3ZGMVp6XbzkPk
 Ys24bMEzZm5Ut2DBq2llJJERBUMTNY5V4tBzY90auS8fZBHl17Nrq5WMqt2C53Vassq4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HCGoAHSVebK0FL+NCHRE0wnim//6Ql61qDjBOhETUyU=; b=PthKH30sXA/1GlJQaRfEGhgYhA
 kFdg2K1d40Nc+qke5oghI1mQn5PycXOcVzR7FSvLHyWdkCiVE7MxBI6JQhxDnGE5fKOhc8RjpLUqH
 zKe6pEwzih7KmYglFLu1WbcFipsk9Gwk0opk65lHN8+EPXuCPCWcvwHqq/RoR6QyqMoA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5TjK-0005Gp-J3 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 17:40:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 30E8C5C5DB4;
 Mon, 28 Oct 2024 17:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089AAC4CEC3;
 Mon, 28 Oct 2024 17:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730137228;
 bh=pzjuA7a0UBgxrDJfx4P5HZ7OtYa+qi3cJ01PrrZVlPw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=WBui1R7ZabXIBWVC0PUz7rAOYiu3kiZtiXDzPJYbXNpXDnCivfLg8dD4NW8DcL7j8
 wiUYkPklhWFjLvI6B9BPgMDkmfDyFy1q95KsI8Rzu8jNKkD+lxmAPk2Beyy1z1BFs9
 ++q3xzPPOpzrK9vxgl8thsVIFNa/ml638EjgGw0WWUoyGN4Jc43djvliZwggdF3K6H
 icNw7tDi9Co1xm9Zzc6XY2ids7qRmJbKgFAMdbGc9AYvTsfuN/q4sWJ1Lg2WXS6mGJ
 GHEARKZ8Xpp5Hkv3zdt5A+Yx7Y1p6WS/CEXqYfy8MH5b6rKSb9uJfMWfTuQ8g+Kr6M
 dFypaxERJW3wA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70EEB380AC1C; Mon, 28 Oct 2024 17:40:36 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173013723523.126843.1225973042359349619.git-patchwork-notify@kernel.org>
Date: Mon, 28 Oct 2024 17:40:35 +0000
References: <20241028112058.3346-2-thorsten.blum@linux.dev>
In-Reply-To: <20241028112058.3346-2-thorsten.blum@linux.dev>
To: Thorsten Blum <thorsten.blum@linux.dev>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 28 Oct 2024 12:20:58 +0100 you
 wrote: > Use struct_size() to calculate the number of bytes to allocate for
 a > cloned acl. > > Reviewed-by: Chao Yu <chao@kernel.org> > Signed-off-by:
 Thorsten [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t5TjK-0005Gp-J3
Subject: Re: [f2fs-dev] [RESEND PATCH] f2fs: Use struct_size() to improve
 f2fs_acl_clone()
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

On Mon, 28 Oct 2024 12:20:58 +0100 you wrote:
> Use struct_size() to calculate the number of bytes to allocate for a
> cloned acl.
> 
> Reviewed-by: Chao Yu <chao@kernel.org>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  fs/f2fs/acl.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Here is the summary with links:
  - [f2fs-dev,RESEND] f2fs: Use struct_size() to improve f2fs_acl_clone()
    https://git.kernel.org/jaegeuk/f2fs/c/527a4ded09b9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
