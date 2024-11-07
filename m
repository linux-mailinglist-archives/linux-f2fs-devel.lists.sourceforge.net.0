Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E6F9C0FB4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Nov 2024 21:30:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t999d-0005bk-9r;
	Thu, 07 Nov 2024 20:30:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1t999b-0005bX-Tp
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Nov 2024 20:30:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kOzf9VL2vnFa33Bf9vnomCmQSCq3kN3wQ66jPXJcO2Y=; b=W0B4rhrN/U++xMHLZrtMppOsRM
 sdwaZNhGUYm9FUJ+M35W3KTOYTHObhgU6xmFtNILVtpO0JvWnyFRmdUqufAD9NKrgIhhlP8xfj92g
 QexVxibmozIFLQ5vPqiO1RGS0QrifQhb2AmLS2I6O0R02na3JdA0/Gmp+Iru5srMpgfM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kOzf9VL2vnFa33Bf9vnomCmQSCq3kN3wQ66jPXJcO2Y=; b=JfNeS7SaJGVJddL+/aRmdXGM+H
 WQlmXl54tDAsnx5AUPL1cj2N3XOQ8iU2PE/4Quf+zbfuMRawJEt48N8mJghSZbj4vFE2z1HKIuiZn
 UiM+z8kvoaeerwpvcG642NcryQ7l3dtXevOz/weJSAtCVN/DTijahNl6IvP3aN6+czDU=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t999b-0003vC-AR for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Nov 2024 20:30:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D4AC5A44934;
 Thu,  7 Nov 2024 20:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A4F2C4CECC;
 Thu,  7 Nov 2024 20:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731011444;
 bh=EYuGwPoXdKxAgBqaNBZh+1hyRDGNtUBv9XJ3c5kvPiw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=U7SjE5uz79zkZdtsINzKOjTg987S4JtDbVfzXHQWRkysn3NF38Rj5IE2b81EqXd+a
 k8lt66PjfWNNlamfVO83pCQ8VrXWZlrszmmnREZbLo9OvZmHHbqJsPoJ3q5allxHBW
 ByMp5C8RoUxEjXfjGT59CLXNGIQ6fpAaIpPp3rFYDaSpQJS7AXoE0Ul3IyTJjCbhc8
 UrTgR8yuEOblgrpZiAHhWBPUd9M0DOJ7Fx9c+D5cgHpf4yY5mgcKRm9q6JIr4SIbMv
 PG5mZQDapg+oxmEYhaVFVwmL2UWZOe2pI6ZiyaHSlEovOFmrNjiIJdy/puoFA1YEpC
 KbSV0KyzAcnkw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB3593809A80; Thu,  7 Nov 2024 20:30:54 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173101145349.2084993.4012866127488813376.git-patchwork-notify@kernel.org>
Date: Thu, 07 Nov 2024 20:30:53 +0000
References: <20241022083623.2641434-1-chao@kernel.org>
In-Reply-To: <20241022083623.2641434-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 22 Oct 2024 16:36:23 +0800 you
 wrote: > syzbot reports deadlock issue of f2fs as below: > >
 ======================================================
 > WARNING: possible circular locking dependen [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t999b-0003vC-AR
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid potential deadlock in
 f2fs_record_stop_reason()
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
 linux-kernel@vger.kernel.org,
 syzbot+be4a9983e95a5e25c8d3@syzkaller.appspotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 22 Oct 2024 16:36:23 +0800 you wrote:
> syzbot reports deadlock issue of f2fs as below:
> 
> ======================================================
> WARNING: possible circular locking dependency detected
> 6.12.0-rc3-syzkaller-00087-gc964ced77262 #0 Not tainted
> ------------------------------------------------------
> kswapd0/79 is trying to acquire lock:
> ffff888011824088 (&sbi->sb_lock){++++}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2199 [inline]
> ffff888011824088 (&sbi->sb_lock){++++}-{3:3}, at: f2fs_record_stop_reason+0x52/0x1d0 fs/f2fs/super.c:4068
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: fix to avoid potential deadlock in f2fs_record_stop_reason()
    https://git.kernel.org/jaegeuk/f2fs/c/f10a890308a7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
