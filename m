Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45333A86E52
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Apr 2025 19:11:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u3eNc-0004Ty-JX;
	Sat, 12 Apr 2025 17:10:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1u3eNa-0004To-IW
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Apr 2025 17:10:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D16ITCFMZGs8Za1lHdJVGu700hu18UxOEwp1Ka1o4NQ=; b=KULEgahXIzZmYlajQGl6x0M4/2
 QbiShzcRiIwCPHdDUFM2K1tpDKDxXjiWOBcNgOEm430UDaw2fXAyoOyxfQusAmQqwmT3EdmUSbtBY
 L7rDnMLa8+m7hw1IV1kUj7Mlc74naX6UMWtKxdg7XpL3VMHHTcG5ZX8SWzPyYcsyst0w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D16ITCFMZGs8Za1lHdJVGu700hu18UxOEwp1Ka1o4NQ=; b=Sh5yflnAJjShCpgK6CwA7YhHFK
 XfM9Z4miM+OmxaOjiVvvdy2hgi3O6Kca/uO0+aRVoIbXKcHbs1uhbdV2xW8GjTCOUcV+8zLGwGDOS
 4OmliSEL7b2zjhVHHancYcNTyvUOkcYNoT96grMnhZudJZiLX5QV/roZ8JSfe03xF+ow=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u3eNK-0008J0-Aj for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Apr 2025 17:10:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D83A95C567A;
 Sat, 12 Apr 2025 17:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A40DC4CEE3;
 Sat, 12 Apr 2025 17:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744477827;
 bh=qu1jYqemipsgVrkeM5Kv7xBfdBLk6/OQaJqZ6aUbcQg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=LiIR8Qq2Enl14WL2Qd0xLUiqDSgvDoqaw/OJR/S+w6rEnPggdDZU62dKHM9OjkeFI
 +c+tiayjgrQ9BJgBSCICMsJOzk7RroN/w/3Ab9JHpf4UNhMv4FwmtVnhEXi+1SG9Eg
 sAigrS3NvyhHTq8HyNL+drkS/aIPX68P7VTiUyQsSIZDzJCR4ww8+/aU/2Bltw07j3
 WR7A/E7+3jJCSR1+Xr6HAjYhOeFcZs6/lt570A0AeIGZtT5Rjokt3vJdrS7Qpr3xRw
 2ECGFfQ60A9zFkPhg+M1nGb/Bs3UTDt/JHXVmfH0CGMrDwPEiYsfhzDpXaBybi0R8n
 VQWVv2e7r6OIw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70C20380CED9; Sat, 12 Apr 2025 17:11:06 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174447786527.711489.2899173657997269764.git-patchwork-notify@kernel.org>
Date: Sat, 12 Apr 2025 17:11:05 +0000
References: <20250408122208.2297777-1-chao@kernel.org>
In-Reply-To: <20250408122208.2297777-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 8 Apr 2025 20:22:08 +0800 you wrote:
 > syzbot reported a f2fs bug as below: > > [ cut here ] > kernel BUG at
 fs/f2fs/f2fs.h:2521!
 > RIP: 0010:dec_valid_block_count+0x3b [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u3eNK-0008J0-Aj
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to do sanity check on
 sbi->total_valid_block_count
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
Cc: jaegeuk@kernel.org, syzbot+8b376a77b2f364097fbe@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue,  8 Apr 2025 20:22:08 +0800 you wrote:
> syzbot reported a f2fs bug as below:
> 
> ------------[ cut here ]------------
> kernel BUG at fs/f2fs/f2fs.h:2521!
> RIP: 0010:dec_valid_block_count+0x3b2/0x3c0 fs/f2fs/f2fs.h:2521
> Call Trace:
>  f2fs_truncate_data_blocks_range+0xc8c/0x11a0 fs/f2fs/file.c:695
>  truncate_dnode+0x417/0x740 fs/f2fs/node.c:973
>  truncate_nodes+0x3ec/0xf50 fs/f2fs/node.c:1014
>  f2fs_truncate_inode_blocks+0x8e3/0x1370 fs/f2fs/node.c:1197
>  f2fs_do_truncate_blocks+0x840/0x12b0 fs/f2fs/file.c:810
>  f2fs_truncate_blocks+0x10d/0x300 fs/f2fs/file.c:838
>  f2fs_truncate+0x417/0x720 fs/f2fs/file.c:888
>  f2fs_setattr+0xc4f/0x12f0 fs/f2fs/file.c:1112
>  notify_change+0xbca/0xe90 fs/attr.c:552
>  do_truncate+0x222/0x310 fs/open.c:65
>  handle_truncate fs/namei.c:3466 [inline]
>  do_open fs/namei.c:3849 [inline]
>  path_openat+0x2e4f/0x35d0 fs/namei.c:4004
>  do_filp_open+0x284/0x4e0 fs/namei.c:4031
>  do_sys_openat2+0x12b/0x1d0 fs/open.c:1429
>  do_sys_open fs/open.c:1444 [inline]
>  __do_sys_creat fs/open.c:1522 [inline]
>  __se_sys_creat fs/open.c:1516 [inline]
>  __x64_sys_creat+0x124/0x170 fs/open.c:1516
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to do sanity check on sbi->total_valid_block_count
    https://git.kernel.org/jaegeuk/f2fs/c/05872a167c2c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
