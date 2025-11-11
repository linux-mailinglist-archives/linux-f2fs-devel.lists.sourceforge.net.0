Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15053C50017
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Nov 2025 23:51:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMKzJebsuaH2OMMfkRJiXnT9M7tOAGEvpkkbQN2Y8fg=; b=kNb0X9KfL89H9Dz0/1LKoD1sOT
	U9AP71EewPKLzMMgHDAs/clqdruLinOZXF928sNG5kuGNICkgRFDdpb/TweyuuMo9JyFu0rpca0+j
	dd0aVwZlTe/39RvPBYrAA22PvBcterM951HJjTBt5MP/VJsr0+hKeOC33SnSrhnvDn70=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIxCY-0002z4-Om;
	Tue, 11 Nov 2025 22:51:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vIxCU-0002yX-84
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:50:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CSgbMb1eOH6bDxCn5TJMcpxPdkAmuNskyttfgAJtzwQ=; b=ael/QE24n7uAEyXYEERMn7eJwn
 Rz1QHzNbqf2sq/T+vCNMoWRXFNgMkjz0H9NwOIQ4ctit5Fy1VRSkcw79c+oZdGpeUJenP8SsQmbJq
 PV0W7aIIIet7fQAgISwr+XkNX613x28kS9EMQZNpjwIPH8RvChH66OaxkwDyT9+MecnU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CSgbMb1eOH6bDxCn5TJMcpxPdkAmuNskyttfgAJtzwQ=; b=fZllH1hqMGAxA/4qkSPoq2NQmN
 3pI3k80mAgci1lhRVYb+AXMRIH9eeZRn4RfP4xjf7jYlX0OQ0ALhWqzJr5dWEsFIHMo8wWaRTdr1I
 L3ASWfAQdyo6PEH+rNcdm531EM3wR2M5Jow6yPk7ok86JwC6BuvBWWCR8gxwqvbYuS68=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIxCT-00046n-P8 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:50:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7CE474053F;
 Tue, 11 Nov 2025 22:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A2AEC4CEFB;
 Tue, 11 Nov 2025 22:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762901447;
 bh=ZqIUy/sw0TbrZF9bJ6CjXw5oR8zyi6SYNa7WHXDShao=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=DYWlyczZzCXFpt6htUoHmRxJN4xkciT69dZNrKYb2FMJd+VsJ3SNvjsDrHwNeS00U
 pnrJNnKBQNeukBSFjhOs3WUbn00Bg+moiv4ZEMUkaEswyHk3hyJr7+Rh+LfploilXk
 3fBQZmUYEILCzRQndlZaUyBwrNVLZ/zhSrBMx+b+VUzzZOt0K2f2GjzxbFKGibHo8I
 knmmqPmYg/wLJgKYtKFERkg1hSKdeeys6CbjvSbfLQ2iqX/D7/maSSppT6hHr62tGA
 xmk9ymvFWQC9wBAkgQjciF+JIn9g24kEv/pgyJRFQ1uFBj557DSZzjcBJyUBGyKKIO
 RIyVWCHQQjG3g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADCE1380DBCD; Tue, 11 Nov 2025 22:50:18 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176290141749.3596344.15754105220634232444.git-patchwork-notify@kernel.org>
Date: Tue, 11 Nov 2025 22:50:17 +0000
References: <20251020024213.332873-1-chao@kernel.org>
In-Reply-To: <20251020024213.332873-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 20 Oct 2025 10:42:12 +0800 you
 wrote: > As syzbot reported: > > F2FS-fs (loop0): __update_extent_tree_range:
 extent len is zero, type: 0, extent [0, 0, 0], age [0, 0] > [ cut here [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vIxCT-00046n-P8
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid updating zero-sized
 extent in extent cache
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
 stable@kernel.org, syzbot+24124df3170c3638b35f@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 20 Oct 2025 10:42:12 +0800 you wrote:
> As syzbot reported:
> 
> F2FS-fs (loop0): __update_extent_tree_range: extent len is zero, type: 0, extent [0, 0, 0], age [0, 0]
> ------------[ cut here ]------------
> kernel BUG at fs/f2fs/extent_cache.c:678!
> Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
> CPU: 0 UID: 0 PID: 5336 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full)
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
> RIP: 0010:__update_extent_tree_range+0x13bc/0x1500 fs/f2fs/extent_cache.c:678
> Call Trace:
>  <TASK>
>  f2fs_update_read_extent_cache_range+0x192/0x3e0 fs/f2fs/extent_cache.c:1085
>  f2fs_do_zero_range fs/f2fs/file.c:1657 [inline]
>  f2fs_zero_range+0x10c1/0x1580 fs/f2fs/file.c:1737
>  f2fs_fallocate+0x583/0x990 fs/f2fs/file.c:2030
>  vfs_fallocate+0x669/0x7e0 fs/open.c:342
>  ioctl_preallocate fs/ioctl.c:289 [inline]
>  file_ioctl+0x611/0x780 fs/ioctl.c:-1
>  do_vfs_ioctl+0xb33/0x1430 fs/ioctl.c:576
>  __do_sys_ioctl fs/ioctl.c:595 [inline]
>  __se_sys_ioctl+0x82/0x170 fs/ioctl.c:583
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f07bc58eec9
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: fix to avoid updating zero-sized extent in extent cache
    https://git.kernel.org/jaegeuk/f2fs/c/cbd96c6e304f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
