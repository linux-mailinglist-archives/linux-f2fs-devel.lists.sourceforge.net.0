Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 278FAAFF08E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jul 2025 20:10:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5CDOcvTVMK5SReE6Fih0HrUZuxqrskvxUiaDE72Mmk=; b=Qpk/uQVOPB6GCkZnBOZelxWxpi
	Y9nLb/yn4yb53fl+tNj0h/4kODWEVcRAqgqPNNWS+JNJPWMzJRYSjTHqg+M2DpeNQCHo7NzSxVkib
	CjjliRPgU8wp9GbuaW5fDvw1Hrjsww++dU6hlleGHyoWUHEBFfBfWmqZUaYeJERMqor0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZZFF-00009j-VH;
	Wed, 09 Jul 2025 18:10:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uZZFE-00009M-59
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 18:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TXY9efnBEK4mDQkWo3dfvtrn9ZgO57IvqJXH2+qeRec=; b=mrFxtr9MTr8UpoUVwvsv7YXzyT
 jXnPTRvA1/0RrRkvhAyF8uMYaJoQ4F4R6V/74sbXB6KaiZhLMSzeRNOekR5hv3q0EQW3Y8+fvh5wT
 rt3WCexBPjlWzYxaIdx60T+twbOi09p02y79mL6nnlneef3XrpVNz2LjDO5cTfDmsok4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TXY9efnBEK4mDQkWo3dfvtrn9ZgO57IvqJXH2+qeRec=; b=gVOfEJD05DOlAYfhYgLhGjHD19
 DF4FxJhyECLsmiqhNjegGooJFRMXKSfG/dos3jZ7Do4e4tiZ0MuHljQ3E7edcom1KpgLJf28dwxgk
 ecJLm/ygj2CuHCt79YfAyp/JZUNY/rGZEz39pKL+B3mKoA6n1iSusFfPB4Iq3GoP1Ek8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZZFD-00015C-MM for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 18:10:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 638894651D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  9 Jul 2025 18:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3514CC4CEF6;
 Wed,  9 Jul 2025 18:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752084601;
 bh=mJ9WqK/8icfLcC6c9p9BYfG6hXc4QbryyxexJn6MkSE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=U3vClbvhUGqY0+2ckhZ6lW5x4MJHJyEqcmcOLc8AMjhWAtgnUskAeo30Ro1L/cGMX
 mEfcOoE48coM8UTLkuQVSeVC/aN0YEp51qC5i84fwMhHvzfXkFopk6pm1oQ//OJOeO
 +QDIMIqnRhI3yC5Kvw4jbFICVBwkrCRgoFo/jCt54zjyOjAXZywBpxAQUUXubLuN7k
 aPcbqH9xDJZURdJDt3CAzAS8a5KnRR/Pf8LGEWCw32dTDBYcyG2IF8rKSiPd3m48gc
 584NRZNmrMTBZHa4lO4ASTMkX+XQdjqUg7vENmelpIMf/GIw0nhwTgep6gyWpa44hM
 dYarRjvAJTYAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB000380DBEE; Wed,  9 Jul 2025 18:10:24 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175208462350.806926.12405140086120666669.git-patchwork-notify@kernel.org>
Date: Wed, 09 Jul 2025 18:10:23 +0000
References: <20250702064925.1002176-1-chao@kernel.org>
In-Reply-To: <20250702064925.1002176-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 2 Jul 2025 14:49:25 +0800 you wrote:
 > We should use "{usr,grp,prj}jquota=" to disable journaled quota, > rather
 than using off{usr,grp,prj}jquota. > > Fixes: 4b2414d04e99 ("f2fs: support
 jour [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uZZFD-00015C-MM
Subject: Re: [f2fs-dev] [PATCH] f2fs: doc: fix wrong quota mount option
 description
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

On Wed,  2 Jul 2025 14:49:25 +0800 you wrote:
> We should use "{usr,grp,prj}jquota=" to disable journaled quota,
> rather than using off{usr,grp,prj}jquota.
> 
> Fixes: 4b2414d04e99 ("f2fs: support journalled quota")
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  Documentation/filesystems/f2fs.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: doc: fix wrong quota mount option description
    https://git.kernel.org/jaegeuk/f2fs/c/81b6ecca2f15

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
