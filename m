Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D8E905791
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Jun 2024 17:56:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sHQKn-00042n-PP;
	Wed, 12 Jun 2024 15:56:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sHQKX-00042I-Or
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 15:56:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XPaNDJXfWu320CAx+J96pKu6CkNUG6Qr1tyBXDufIhQ=; b=VgEBX4LvL6DoVuAs7sbER4GbjW
 cSNF23lusax+6sfOC/S14Nh8H+kpVl4m4nJtLuuoXy5PzHkg9RK6jR3htiQqOUh4RnZ6ktC/TjHAX
 uyWIuGAQpwCnpe17civUYwDiXPyyWzU7VzrVB2UFjN2xK0+slJ6lrSXvqlw7idvvOGFo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XPaNDJXfWu320CAx+J96pKu6CkNUG6Qr1tyBXDufIhQ=; b=UHXS/rR3t0Ypj8L2BjeF/rHQFQ
 VQWrVPM8CWCXetA0gVbQVpm59G073hiD3pGoZ49gzZQLRtid5iKOu+KPTdv6YANadl/ToLjd8HQv6
 P9e0dOkCEGA3tx/A/p/HisAcTb2g5Q0Z4iT2/shpG8PuE4nGEDA4yR8Hkh7IJUpwxLRw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sHQKX-0007SA-6u for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 15:56:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 192CB614DE;
 Wed, 12 Jun 2024 15:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40F0CC4AF51;
 Wed, 12 Jun 2024 15:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718207757;
 bh=xjFhkd1pDCVuCkX4MEJUFhIi2XRBRKnNHn6Nq/p1zpI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Qrybn7YOhRJp8ek1nsiVlA8Zdu3h4KRNRVbHTVynqLmRqUvAZ5muuOT4OW3EzbxU5
 a29mUTTgoY3TfJwTzK/vRYFRIGm899tsiYnj+8ZZoOR9SFFmKqxOU4zlZlfxAOYvxd
 zndh9YRaxOJ2VMsW2oLgHm/J/nXnZYJBBQgnFe+paqXWKZhiq7FPU7bgnFc3ggMN91
 oukIVY8CV6fo9sCNwZov8WPkd9UeAUsBQ/5pUHp6BQFqtZDfo3WfhOQw6bgMR0fxYN
 /SIQEjn2q1t+T9g6vpEw/Z9FnEwuY3QdB1jhyDDX6kq71PpIGuVU1klF67K5xMSMK7
 lrxLMIdtMa2dQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1F12FC43618; Wed, 12 Jun 2024 15:55:57 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171820775712.32393.17507695192982662246.git-patchwork-notify@kernel.org>
Date: Wed, 12 Jun 2024 15:55:57 +0000
References: <20240604075636.3126389-1-chao@kernel.org>
In-Reply-To: <20240604075636.3126389-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 4 Jun 2024 15:56:36 +0800 you wrote:
 > syzbot reports f2fs bug as below: > > kernel BUG at fs/f2fs/inode.c:933!
 > RIP: 0010:f2fs_evict_inode+0x1576/0x1590 fs/f2fs/inode.c:933 > Call Trace:
 > e [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sHQKX-0007SA-6u
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to don't dirty inode for readonly
 filesystem
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 syzbot+31e4659a3fe953aec2f4@syzkaller.appspotmail.com, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue,  4 Jun 2024 15:56:36 +0800 you wrote:
> syzbot reports f2fs bug as below:
> 
> kernel BUG at fs/f2fs/inode.c:933!
> RIP: 0010:f2fs_evict_inode+0x1576/0x1590 fs/f2fs/inode.c:933
> Call Trace:
>  evict+0x2a4/0x620 fs/inode.c:664
>  dispose_list fs/inode.c:697 [inline]
>  evict_inodes+0x5f8/0x690 fs/inode.c:747
>  generic_shutdown_super+0x9d/0x2c0 fs/super.c:675
>  kill_block_super+0x44/0x90 fs/super.c:1667
>  kill_f2fs_super+0x303/0x3b0 fs/f2fs/super.c:4894
>  deactivate_locked_super+0xc1/0x130 fs/super.c:484
>  cleanup_mnt+0x426/0x4c0 fs/namespace.c:1256
>  task_work_run+0x24a/0x300 kernel/task_work.c:180
>  ptrace_notify+0x2cd/0x380 kernel/signal.c:2399
>  ptrace_report_syscall include/linux/ptrace.h:411 [inline]
>  ptrace_report_syscall_exit include/linux/ptrace.h:473 [inline]
>  syscall_exit_work kernel/entry/common.c:251 [inline]
>  syscall_exit_to_user_mode_prepare kernel/entry/common.c:278 [inline]
>  __syscall_exit_to_user_mode_work kernel/entry/common.c:283 [inline]
>  syscall_exit_to_user_mode+0x15c/0x280 kernel/entry/common.c:296
>  do_syscall_64+0x50/0x110 arch/x86/entry/common.c:88
>  entry_SYSCALL_64_after_hwframe+0x63/0x6b
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to don't dirty inode for readonly filesystem
    https://git.kernel.org/jaegeuk/f2fs/c/192b8fb8d1c8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
