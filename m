Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 178047A88F5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Sep 2023 17:50:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qizTV-0005lr-Lg;
	Wed, 20 Sep 2023 15:50:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qizTQ-0005lY-Hb
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 15:50:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UXoOLVuw0HWf4MEiWXEGdYADv59f1jgM6ClQH+Jwa4Y=; b=ZuKbY+OFAbi51iol7+84T3SUWp
 bBaCJ6EoOUq2CQ+5HnxxRyzxfy4B2hXTlh+8DLzBGn2GxYLNSpkW5wEBLuGvti2SrqaC+tbI4bIjz
 3DbmlvpeeLitXsrLB2t6UqSGa0SA6glQLJ2HZJtHsUik1z3RpIQw4SjXhfq674fcybos=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UXoOLVuw0HWf4MEiWXEGdYADv59f1jgM6ClQH+Jwa4Y=; b=FEQFvjsKvu4Bu6bSMg6qAXvwWN
 u28z0o4P2l2iIsaSPx3olVVSnyBTgx4uh3b3G87e/8BtDD4LKAySXx4M++Vy7S4+tqvZkvbyc3T+a
 Fvvcp2d/QAct8qNpbC1Ug/Zob/DBesgID/0rK6XBnbKWjsPbcxDUrqQ4SDGhMUNHehyo=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qizTK-0004cL-34 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 15:50:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 72964CE1B64;
 Wed, 20 Sep 2023 15:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76B78C43391;
 Wed, 20 Sep 2023 15:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695225025;
 bh=2V9YWG2+fo3tZJ+/Ft+3oV7Hjxta8RtJyN+jWzZUn+g=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=l/9w2KHqp7eJt7mTM0cOiuwP2lI63GUAL/xFaX4K4UXbKN8vCjfLKxRLdoKVKf5BS
 wrzkmACEslSl8FjMYPy1oS/kOoqcaSywjecKTWcNq15FlWunTNRqwMXmS3TZzcyZCZ
 xKMqHaLI9njLD+oo3usQHO1NHk/oI/Dy1qduF/yBIt/lmnwaX5YNzrI/ZYAHifnjK1
 shiYitESoIPaqLl+nRU3oWEeco5R1pBtj70IHE6wfY1MPgXeHLYtJgaKo8VFz2rIA9
 jbqBOlQ+5Y+sYIIwvc0r95gDweg889gvK+eIunn0ZacSsMnjksLvhNa2jzirfIEEaN
 WlyR2mb4NHYFQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 54F04E1F66C; Wed, 20 Sep 2023 15:50:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169522502534.22557.3452572888083664704.git-patchwork-notify@kernel.org>
Date: Wed, 20 Sep 2023 15:50:25 +0000
References: <20230907210859.3698691-1-jaegeuk@kernel.org>
In-Reply-To: <20230907210859.3698691-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 7 Sep 2023 14:08:58 -0700 you wrote:
 > Let's allocate the extent_cache tree without dynamic conditions to avoid
 a > missing condition causing a panic as below. > > # create a file w/ a
 compres [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qizTK-0004cL-34
Subject: Re: [f2fs-dev] [PATCH] f2fs: split initial and dynamic conditions
 for extent_cache
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
Cc: syzbot+d342e330a37b48c094b7@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu,  7 Sep 2023 14:08:58 -0700 you wrote:
> Let's allocate the extent_cache tree without dynamic conditions to avoid a
> missing condition causing a panic as below.
> 
>  # create a file w/ a compressed flag
>  # disable the compression
>  # panic while updating extent_cache
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: split initial and dynamic conditions for extent_cache
    https://git.kernel.org/jaegeuk/f2fs/c/f803982190f0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
