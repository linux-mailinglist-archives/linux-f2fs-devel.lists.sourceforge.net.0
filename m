Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E48AAFF087
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jul 2025 20:10:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/+21CFYbBx6sk3foSI8AWMXeE7hTa3bKuZgfpTvnmo=; b=kEZ3V0P1RK5/XjkHZGXCQCY9A4
	Ik6M9NVVcbuagEZ/OIcuTlbMSghSo47zN6bw3cUkjhl6b37u4EIUid0EoBYUL3V+wq0DXbwEbyPLi
	W/QzNj2tc3FYTEqptOYDx9sdyPWkEaXOnPyjIlqBhms64bdSIGV4ki5csd0Z1tbPD0h0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZZF6-00007F-3X;
	Wed, 09 Jul 2025 18:10:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uZZF4-00006x-KD
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 18:10:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YilfW5Agj3fVv2eYG8uheiuPulcfqsdqNc35KJwv5WI=; b=KvmTuV0FxN66lk+Ooqx1XzXTTO
 gFJa/HNj3dnztGoPVgiD2uXR0YCGrZ+EGXygGC9H/mhSlH+xPWFsODkipTTPvj5OO6Qq6jqQyzqGn
 Q7uOIWQtrbLU36X8qVsn5lysa25N+m9BLhaaLVM39eR9UT3xiDdaOLi0VSveZj8c1jgU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YilfW5Agj3fVv2eYG8uheiuPulcfqsdqNc35KJwv5WI=; b=Uolz3Q4TLIOe97DCuYLecouGJD
 YZqHf09FwGVRg0wBcNhfRIIQc57SB8bOH4X18zU7/Lwn/Qa2yyFJ/I+IyRCGAZtx66FxWMZ5C6BWV
 UH6luysjIhisljUxpH00vXdTVTNpMUS2vDvgS2DJy44ttjinMHgCLTmvPcilmzHFjTfE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZZF4-00013k-4G for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 18:10:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C9AF246D00;
 Wed,  9 Jul 2025 18:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE9CC4CEEF;
 Wed,  9 Jul 2025 18:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752084596;
 bh=dNhTV6QpEwHlARJQYMxeWEWzOiLE1Qi9Ucnzl07IARw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=NqhMK6lKBxDXri8kql+WlK0bCWz40Kdp/RqXi2hI8Xf0tdzhOYnacatvsJgovRhv4
 8mbTM88JVfFieDUQcyBxJ3ytl0wZpolvxcSD0Odm3vJlOP9rlbUmaoQrm8kxkq2HKx
 xIAzRP4s1PEtWFtR0P0f6m3wkg6n6lDofut74f4ZnCHXLDW8jqA2MiZMR6OHnoTGHW
 OSoOfkvkrwGNnpHkCFDLDLXzzxWxT1netygjyuvYiyW0X0Ggd3H14SfJowIDgOBs7X
 JbgxS8ud910+rLCLMhvxYDFdx1kYghZG1Ck4iiykGUb+F/q0HrArzyXpGrEq80HS/h
 ciHNgY4okK9mw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 710E9380DBEE; Wed,  9 Jul 2025 18:10:20 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175208461925.806926.9116732012355450749.git-patchwork-notify@kernel.org>
Date: Wed, 09 Jul 2025 18:10:19 +0000
References: <20250701092610.511964-1-chao@kernel.org>
In-Reply-To: <20250701092610.511964-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 1 Jul 2025 17:26:10 +0800 you wrote:
 > As syzbot reported as below: > > F2FS-fs (loop9): inject invalid blkaddr
 in f2fs_is_valid_blkaddr of do_write_page+0x277/0xb10 fs/f2fs/segment.c:3956
 > - [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uZZF4-00013k-4G
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to use f2fs_is_valid_blkaddr_raw()
 in do_write_page()
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
 syzbot+9201a61c060513d4be38@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue,  1 Jul 2025 17:26:10 +0800 you wrote:
> As syzbot reported as below:
> 
> F2FS-fs (loop9): inject invalid blkaddr in f2fs_is_valid_blkaddr of do_write_page+0x277/0xb10 fs/f2fs/segment.c:3956
> ------------[ cut here ]------------
> kernel BUG at fs/f2fs/segment.c:3957!
> Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
> CPU: 0 UID: 0 PID: 10538 Comm: syz-executor Not tainted 6.16.0-rc3-next-20250627-syzkaller #0 PREEMPT(full)
> Call Trace:
>  <TASK>
>  f2fs_outplace_write_data+0x11a/0x220 fs/f2fs/segment.c:4017
>  f2fs_do_write_data_page+0x12ea/0x1a40 fs/f2fs/data.c:2752
>  f2fs_write_single_data_page+0xa68/0x1680 fs/f2fs/data.c:2851
>  f2fs_write_cache_pages fs/f2fs/data.c:3133 [inline]
>  __f2fs_write_data_pages fs/f2fs/data.c:3282 [inline]
>  f2fs_write_data_pages+0x195b/0x3000 fs/f2fs/data.c:3309
>  do_writepages+0x32b/0x550 mm/page-writeback.c:2636
>  filemap_fdatawrite_wbc mm/filemap.c:386 [inline]
>  __filemap_fdatawrite_range mm/filemap.c:419 [inline]
>  __filemap_fdatawrite mm/filemap.c:425 [inline]
>  filemap_fdatawrite+0x199/0x240 mm/filemap.c:430
>  f2fs_sync_dirty_inodes+0x31f/0x830 fs/f2fs/checkpoint.c:1108
>  block_operations fs/f2fs/checkpoint.c:1247 [inline]
>  f2fs_write_checkpoint+0x95a/0x1df0 fs/f2fs/checkpoint.c:1638
>  kill_f2fs_super+0x2c3/0x6c0 fs/f2fs/super.c:5081
>  deactivate_locked_super+0xb9/0x130 fs/super.c:474
>  cleanup_mnt+0x425/0x4c0 fs/namespace.c:1417
>  task_work_run+0x1d4/0x260 kernel/task_work.c:227
>  resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
>  exit_to_user_mode_loop+0xec/0x110 kernel/entry/common.c:114
>  exit_to_user_mode_prepare include/linux/entry-common.h:330 [inline]
>  syscall_exit_to_user_mode_work include/linux/entry-common.h:414 [inline]
>  syscall_exit_to_user_mode include/linux/entry-common.h:449 [inline]
>  do_syscall_64+0x2bd/0x3b0 arch/x86/entry/syscall_64.c:100
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to use f2fs_is_valid_blkaddr_raw() in do_write_page()
    https://git.kernel.org/jaegeuk/f2fs/c/8f4688591d96

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
