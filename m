Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4140AAC6DDB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 May 2025 18:20:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dMN8J6BexO0wU8j1H/6I7AhaCWJeaWsJJvJoDCktXs0=; b=S8GEPZLS9IoPWDEKkmsri8h9aC
	MCxhd+x2rBCRYeQ2TqTDnG3qh7XsbQws5bOs2Nlo52VAct2aNhsY9h5i04CYdeW1k7wFafPSx0XvL
	8ORb2Zn6TVM+wIoK5q3olfrhOLxuU3ggfwGiLQcuazV8TK9Lt9x3ZYCgiHe+zB4gyOmc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uKJVi-0000WQ-1v;
	Wed, 28 May 2025 16:20:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uKJVg-0000WF-ED
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 May 2025 16:20:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hvKghRhrPrJwP95crEOAmBcyipg0Jn5j8xawkFKpXoU=; b=JeXmz0TZrMMSQzd/q5yrWzhMl9
 gPG3LyQi3UlTNDQe5iKrn0zipXXR0tV13p7qCiGBPqu76/i83VZNaLk6cU0d5b9CBMMSR4ZS9gmXr
 q6Sv6XTYMI+wt468R1w6uHQx5S/fCEWyPSVurxYBNnLlZDMkmpaDibfLlYDO803YALMY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hvKghRhrPrJwP95crEOAmBcyipg0Jn5j8xawkFKpXoU=; b=eNJ1IHYVQPw7EZCg1he09ksrL8
 Si+KypJJcfi5Wo/la5WGPMd3Np+xUDSiXrhAJaf0ISRzOZilEjcEzI3P1MyTcK6aOkJ5Fp6Q7zO60
 d7yHyZeH8o4SIypcC1RyJ1n1HjsHFFBUp0ehAbaL4uNoLSqyAfvY+wJcOVsbjwRJGp7s=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uKJVf-0003WF-KC for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 May 2025 16:20:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EF959A4F629;
 Wed, 28 May 2025 16:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB3BC4AF0B;
 Wed, 28 May 2025 16:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748449196;
 bh=was6HKWg8q3bCy8wjBqt1mSU3XXZMmZRo8cHl90Nx4s=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=raZEqM78y6G5f+VeQ+ip3ezKW5gxf9742s7boQMiPJygBDc58q9/g9ySexHD9l8U0
 o5Kfu/WJMW3sclf8+J31S+AsBe6m9o5kxAss49PiD1E8LZXU31JX0jVxJVHKD72iVU
 DgaaiPbH8Asg/Pe7X6cuiRU7d6eJMg2LxnG9iPD4GrYYTNYhmCJUN1BCTjU99iKvil
 YueBvvhXBfH52zN03PPES/B69HaHwNWcAR0fHnV8WB68pP/IPnoOCmYdE2T7knZ+BS
 NUS/zkelFKqnMMlxY/ng99Pt3LSlHR6hbuLd4i8oAv90KDv5MmgdvHqV9cRMNfKBQ5
 AbyUuAN5J4fgA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADB0A3822D1A; Wed, 28 May 2025 16:20:31 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174844923023.2455931.17793935058942024770.git-patchwork-notify@kernel.org>
Date: Wed, 28 May 2025 16:20:30 +0000
References: <20250523032545.1392641-1-chao@kernel.org>
In-Reply-To: <20250523032545.1392641-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 23 May 2025 11:25:45 +0800 you
 wrote: > Syzbot reports a f2fs bug as below: > > INFO: task
 syz-executor328:5856
 blocked for more than 144 seconds. > Not tainted
 6.15.0-rc6-syzkaller-00208-g3c2 [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.9 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uKJVf-0003WF-KC
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix to skip f2fs_balance_fs() if
 checkpoint is disabled
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
Cc: syzbot+aa5bb5f6860e08a60450@syzkaller.appspotmail.com, jaegeuk@kernel.org,
 hanqi@vivo.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 23 May 2025 11:25:45 +0800 you wrote:
> Syzbot reports a f2fs bug as below:
> 
> INFO: task syz-executor328:5856 blocked for more than 144 seconds.
>       Not tainted 6.15.0-rc6-syzkaller-00208-g3c21441eeffc #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:syz-executor328 state:D stack:24392 pid:5856  tgid:5832  ppid:5826   task_flags:0x400040 flags:0x00004006
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5382 [inline]
>  __schedule+0x168f/0x4c70 kernel/sched/core.c:6767
>  __schedule_loop kernel/sched/core.c:6845 [inline]
>  schedule+0x165/0x360 kernel/sched/core.c:6860
>  io_schedule+0x81/0xe0 kernel/sched/core.c:7742
>  f2fs_balance_fs+0x4b4/0x780 fs/f2fs/segment.c:444
>  f2fs_map_blocks+0x3af1/0x43b0 fs/f2fs/data.c:1791
>  f2fs_expand_inode_data+0x653/0xaf0 fs/f2fs/file.c:1872
>  f2fs_fallocate+0x4f5/0x990 fs/f2fs/file.c:1975
>  vfs_fallocate+0x6a0/0x830 fs/open.c:338
>  ioctl_preallocate fs/ioctl.c:290 [inline]
>  file_ioctl fs/ioctl.c:-1 [inline]
>  do_vfs_ioctl+0x1b8f/0x1eb0 fs/ioctl.c:885
>  __do_sys_ioctl fs/ioctl.c:904 [inline]
>  __se_sys_ioctl+0x82/0x170 fs/ioctl.c:892
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3] f2fs: fix to skip f2fs_balance_fs() if checkpoint is disabled
    https://git.kernel.org/jaegeuk/f2fs/c/c836d3b8d94e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
