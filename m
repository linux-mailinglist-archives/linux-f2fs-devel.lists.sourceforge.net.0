Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7769D69BE
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 23 Nov 2024 16:50:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tEsPB-0004XP-A2;
	Sat, 23 Nov 2024 15:50:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tEsPA-0004XD-4s
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 23 Nov 2024 15:50:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zB1STr80DASHH3sV5+8MF55YMnHE+Em988IMRx9NsBg=; b=h/D6UB7HSCzRj2R3BHwNgA7NQt
 A4kbV6IXkQtYFdfys8a+9alM5vHRMGKKBmw2X0HQwYURGKztv+yBfxQh+/4aBTDSZHsDD0dntlgI+
 2/4eWx5DgkRHPBjU3Q+ba5BgVoTNukQ0EcYvWbDcROUfBJx1pCDnuAfxgYxevC4K71Cc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zB1STr80DASHH3sV5+8MF55YMnHE+Em988IMRx9NsBg=; b=DA2eKmvd3Y9zeKXP5tgka3h1cN
 qNaofDgnuxIOc/LHJ7SUUhWQsbT3SHWLAbWtLu9YSh8dbXsUuKj2zF8hPjV0kQMQBhdPEXv2uVNAa
 ZQYG2/BXC93SbVgdx8ueqOAuAIc75xJIiskvUWhE+pkHS0sKCbKqxY1H9UDFEeE1qRfE=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tEsP9-0004MD-Go for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 23 Nov 2024 15:50:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A9FB9A4046E;
 Sat, 23 Nov 2024 15:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86518C4CED0;
 Sat, 23 Nov 2024 15:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732377028;
 bh=Kv86vApSh+6VFnQQ6AgK+uFE5X9tBqt+QALJDvB113o=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=bAq553/b7313j0r3Q7+1/MQugShfI+vjwcY7wP5mqr8rjeU1cMEFBoisr79zfw1jD
 Pv86bsFXfsOtU7/kOeOzAadEVKV1PocMPrYyw4/kQz3lY6pUTJM0y1hWQ6Ox0ecWq9
 FpHMofQVYu7pkctzGm5TMXImM7RzBiVDCFIx5VB+z5Tn6Qeocxq4gb66PAxNLRhMkX
 tJaW2M1qhJtdZ9mjxHAEceD6C6pquBuPNCTHcBwBJcmwyNKXxDYmutw/YcznJxe1lR
 VpkXur7nZJ44nLIee7fXCp5RL8ZCH8EyuIRyY7Eikyg0aD7ScpmOxXUIpKtU7o5ZD8
 nZ9TAiO37URpQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EBF933809A06; Sat, 23 Nov 2024 15:50:41 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173237704074.3018181.13969811981387299887.git-patchwork-notify@kernel.org>
Date: Sat, 23 Nov 2024 15:50:40 +0000
References: <20241121141716.3018855-1-chao@kernel.org>
In-Reply-To: <20241121141716.3018855-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 21 Nov 2024 22:17:16 +0800 you
 wrote: > Piergiorgio reported a bug in bugzilla as below: > > [ cut here ]
 > WARNING: CPU: 2 PID: 969 at fs/f2fs/segment.c:1330 > RIP: 00 [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tEsP9-0004MD-Go
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to drop all discards after
 creating snapshot on lvm device
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
Cc: jaegeuk@kernel.org, stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 piergiorgio.sartor@nexgo.de, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 21 Nov 2024 22:17:16 +0800 you wrote:
> Piergiorgio reported a bug in bugzilla as below:
> 
> ------------[ cut here ]------------
> WARNING: CPU: 2 PID: 969 at fs/f2fs/segment.c:1330
> RIP: 0010:__submit_discard_cmd+0x27d/0x400 [f2fs]
> Call Trace:
>  __issue_discard_cmd+0x1ca/0x350 [f2fs]
>  issue_discard_thread+0x191/0x480 [f2fs]
>  kthread+0xcf/0x100
>  ret_from_fork+0x31/0x50
>  ret_from_fork_asm+0x1a/0x30
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to drop all discards after creating snapshot on lvm device
    https://git.kernel.org/jaegeuk/f2fs/c/bc8aeb04fd80

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
