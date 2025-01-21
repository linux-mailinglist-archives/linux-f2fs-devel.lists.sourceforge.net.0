Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8BDA1826B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Jan 2025 18:00:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1taHc2-0000Lb-S9;
	Tue, 21 Jan 2025 17:00:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1taHc1-0000LT-EM
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Jan 2025 17:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OjUB9Z2nYciyj9oa1AoI4iJtrPe5OYkooz28uiqtm9M=; b=Zivyz4yIdPnYJ249pMk5UVCmoT
 ajXFUGMhozGjmvAgN+u4vMFU/WZrZy33B6cNcT1VheyaVN5z0/Yf6C/5nR2XVuTRbu7FjE7QwHgac
 wMsGpHw0T4wYqwdSGCHX0IQhAE5VJMcDBsV8PaANrYbjfwFpbIKWaZF7h/tN87miS27E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OjUB9Z2nYciyj9oa1AoI4iJtrPe5OYkooz28uiqtm9M=; b=C40QAkGQg8hFamG+mjLXexxf2W
 XRcSoIqDYUkF5bnaFI508ULtMWMmPoJ7DZvli2t7Cnvtlt86+5eE33N+f6kwfaORqA+kAUAS/3OJV
 HToutChTf8dMjii9rVc2DCO7Rt5XggUtSRgDWZn/nKGZhN45Yhx4CpX72nB/XGSDSZZo=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1taHc0-0005kH-OW for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Jan 2025 17:00:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 83339A41DBC;
 Tue, 21 Jan 2025 16:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4961C4CEE6;
 Tue, 21 Jan 2025 17:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737478813;
 bh=jONEZRcx/K7eHrTIo0CVH1iksGCFRlswlFc+4BaWmYA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=sCbbYEQr1Z8AehoaJGIZ7nuUC70bXTB7kuUH5aSQCbxbQ/2PB5N9LKfCrHB8cp9yK
 aghvOUNKHEKNEQVZpYq/+2fZ2rJBRz9PF3g/fFwOlUcFQ7AOnvUCc4xiCqBHwQRBFH
 giCFBJvGSh9BPwPjTP56Czz/Z3KVFXRs1uaYMbzGaffQYkF7x9pNK1Rmp3dZk8VMS8
 Uw4RCDOazy49iC00euGmdBIhyGUBkGFCf6L2tZDOp/VvngBZtpE6c+hcxhbg4ZwzvA
 W3Z6Z8h6yONsco7Hyq4FR8MY6CDa9b4hxdp9Hkl+AELh9IB733xMT7dJ+eFsTSS6BS
 3Ebjm6mEmESaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3410E380AA75; Tue, 21 Jan 2025 17:00:39 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173747883774.55169.9141276708415158056.git-patchwork-notify@kernel.org>
Date: Tue, 21 Jan 2025 17:00:37 +0000
References: <20250120111941.191621-1-chao@kernel.org>
In-Reply-To: <20250120111941.191621-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 20 Jan 2025 19:19:40 +0800 you
 wrote: > syzbot reported a f2fs bug as below: > > [ cut here ] > kernel BUG
 at fs/f2fs/gc.c:373! > CPU: 0 UID: 0 PID: 5316 Comm: syz.0.0 [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
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
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1taHc0-0005kH-OW
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix to avoid return invalid mtime
 from f2fs_get_section_mtime()
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
Cc: syzbot+b9972806adbe20a910eb@syzkaller.appspotmail.com, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 20 Jan 2025 19:19:40 +0800 you wrote:
> syzbot reported a f2fs bug as below:
> 
> ------------[ cut here ]------------
> kernel BUG at fs/f2fs/gc.c:373!
> CPU: 0 UID: 0 PID: 5316 Comm: syz.0.0 Not tainted 6.13.0-rc3-syzkaller-00044-gaef25be35d23 #0
> RIP: 0010:get_cb_cost fs/f2fs/gc.c:373 [inline]
> RIP: 0010:get_gc_cost fs/f2fs/gc.c:406 [inline]
> RIP: 0010:f2fs_get_victim+0x68b1/0x6aa0 fs/f2fs/gc.c:912
> Call Trace:
>  <TASK>
>  __get_victim fs/f2fs/gc.c:1707 [inline]
>  f2fs_gc+0xc89/0x2f60 fs/f2fs/gc.c:1915
>  f2fs_ioc_gc fs/f2fs/file.c:2624 [inline]
>  __f2fs_ioctl+0x4cc9/0xb8b0 fs/f2fs/file.c:4482
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:906 [inline]
>  __se_sys_ioctl+0xf5/0x170 fs/ioctl.c:892
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: fix to avoid return invalid mtime from f2fs_get_section_mtime()
    https://git.kernel.org/jaegeuk/f2fs/c/75fe3d484897
  - [f2fs-dev,2/2] f2fs: procfs: show mtime in segment_bits
    https://git.kernel.org/jaegeuk/f2fs/c/46bbac0db377

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
