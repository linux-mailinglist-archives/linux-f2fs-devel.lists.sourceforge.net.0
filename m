Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA429B37DB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2024 18:40:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5TjN-0005SR-8k;
	Mon, 28 Oct 2024 17:40:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1t5TjM-0005SI-GH
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 17:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BNvASEdglKC7I79qdcQzQpaHislyB8IRTkSxJvLYKAg=; b=irDaysJudYw/MrLOplRFySj1tC
 JT14y2+ezLgsdaz8wLnm8gTX/Msk5csO252eVUO6QVve6rX5I2i/kAeEp0/HnUc2uPN5zuetwvWw/
 jHHfEa4C7HlVDprhONLlTErMFOHE6z191dw1CLWqOfYNnS+DxuBI8UNequHHLFpk/IAo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BNvASEdglKC7I79qdcQzQpaHislyB8IRTkSxJvLYKAg=; b=N9XTTYALYtbNvILkUPzgdRozyA
 nn2knA2r7tI0pmeWl8UAD6MGgp4BOOGh+IJF6kIv2MmwR+vidIIX206dozXQ97+roLAkzGxlV2wNw
 GWyGatfos3QjJDvu5jG13I9K+PNCJQN0eqqEE9z6nh3ZbLp7kPNAktfogOT8KJcxA2KY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5TjL-0005Gv-Td for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 17:40:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7E80D5C5DE5;
 Mon, 28 Oct 2024 17:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4829CC4AF48;
 Mon, 28 Oct 2024 17:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730137229;
 bh=M57Z0VxnT5yC46WkZqloqUomYzVIUkLNmjPO7S8c6bQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=k5tbBbvy+fGZReQZKRQEJp69eb4geJdVN1aYGK6fX8Y7/GhKfQ3iDXo1smdaOIPws
 clpQN0pzF06qVO+ykkaNKq7IC+BwJMx95z1U/OsRPOZAlfvarVJjn9gsR37kZcRH/D
 TfpG1toCPO7it6oNyOynbYIj9PtqFVfTLvUcTb+HZrlgQnqKBvNiuTDoSoYEJd/t1t
 /h3xPE2grW106xqOnx33BG9LzRXzvtI2KMkMybshGq8aKuHVU6wrbIhzmbEM72Zcca
 6NucGqXcuoaHqALkVfw58H3ivNyxw+IOWAeHW3ewPojDQ1CY8+iG4LX+qJZ7PufuSM
 IIgWBvb0w8WJQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADE93380AC1C; Mon, 28 Oct 2024 17:40:37 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173013723649.126843.961245482692582747.git-patchwork-notify@kernel.org>
Date: Mon, 28 Oct 2024 17:40:36 +0000
References: <20240918084400.1821317-1-hanqi@vivo.com>
In-Reply-To: <20240918084400.1821317-1-hanqi@vivo.com>
To: Qi Han <hanqi@vivo.com>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 18 Sep 2024 02:44:00 -0600 you
 wrote: > creating a large files during checkpoint disable until it runs out
 of > space and then delete it, then remount to enable checkpoint again, and
 > then un [...] 
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
X-Headers-End: 1t5TjL-0005Gv-Td
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix f2fs_bug_on when uninstalling
 filesystem call f2fs_evict_inode.
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

On Wed, 18 Sep 2024 02:44:00 -0600 you wrote:
> creating a large files during checkpoint disable until it runs out of
> space and then delete it, then remount to enable checkpoint again, and
> then unmount the filesystem triggers the f2fs_bug_on as below:
> 
> ------------[ cut here ]------------
> kernel BUG at fs/f2fs/inode.c:896!
> CPU: 2 UID: 0 PID: 1286 Comm: umount Not tainted 6.11.0-rc7-dirty #360
> Oops: invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> RIP: 0010:f2fs_evict_inode+0x58c/0x610
> Call Trace:
>  __die_body+0x15/0x60
>  die+0x33/0x50
>  do_trap+0x10a/0x120
>  f2fs_evict_inode+0x58c/0x610
>  do_error_trap+0x60/0x80
>  f2fs_evict_inode+0x58c/0x610
>  exc_invalid_op+0x53/0x60
>  f2fs_evict_inode+0x58c/0x610
>  asm_exc_invalid_op+0x16/0x20
>  f2fs_evict_inode+0x58c/0x610
>  evict+0x101/0x260
>  dispose_list+0x30/0x50
>  evict_inodes+0x140/0x190
>  generic_shutdown_super+0x2f/0x150
>  kill_block_super+0x11/0x40
>  kill_f2fs_super+0x7d/0x140
>  deactivate_locked_super+0x2a/0x70
>  cleanup_mnt+0xb3/0x140
>  task_work_run+0x61/0x90
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix f2fs_bug_on when uninstalling filesystem call f2fs_evict_inode.
    https://git.kernel.org/jaegeuk/f2fs/c/d5c367ef8287

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
