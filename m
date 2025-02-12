Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CCBA31C81
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Feb 2025 04:00:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ti2zF-0005CE-8v;
	Wed, 12 Feb 2025 03:00:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1ti2zA-0005C6-GQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Feb 2025 03:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v2DWfTC+fRuaLPdZaq0BSuTIvzL5/cfSbSXVUA6IL28=; b=FOlbbK5bd/yRsZgMz0/m/b0X4Q
 3y9efiJNyVpQyN9fwixYs1nV9KV/T59sAQOtJOb+7onZOvBxd5UUDu0hoGNrIQSt3m4IgINWn70tN
 7zpxtkI+tqNaEcngnH4SR8bAPWshFiuE+bh/4Dei9ZSfoiAFFJbvWpZextLx4OZN4mIQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v2DWfTC+fRuaLPdZaq0BSuTIvzL5/cfSbSXVUA6IL28=; b=NKTlpcoLRyslfWwuxF5YwtMRtT
 rZ3Aa3wiEpzYyEpea/Dz47lTYL4Q6FXI2QpA5iw0mPWRoQQiJp1j6yEXpWhxF0Ayp/G1lJWQoyWAd
 8pTbPTA5P5mkuPoAKG1tChGm91k6irT5qbG59edY5lt1ywvMMrlQQvyqw42rnLspGP6E=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ti2z6-0002C4-3a for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Feb 2025 03:00:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BFE56A40F37;
 Wed, 12 Feb 2025 02:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE76FC4CEE4;
 Wed, 12 Feb 2025 03:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739329211;
 bh=3asK8Y8U8glA2LNCKXEl2FC1l727IKQxHBsgJIa/F4o=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=biPZNrBVck1DuGNXkFv6+ys3dhIhKWjvbMkp8k+5TuEbaSyV+qyBsZZxx09jjoxQ5
 bboD2jmgDvfGtsYPSaUc4ZvXJIhydhl/PmkRYyvFvCVrgiwK+EbLtvbdZAdazNIevs
 NtJBMyX8/Gz3Epv6T7gnMhSic+pbYmqDj7OuD9WloamkPBfoOpSeewzlLhayaVRCaU
 rAK72SEyAYa7DB71cN1Kp9PHjkZ0s/EuMWNgU6BPY2QCpCgGOudJioQPl5rZQR0CK/
 bEUtwOnw7JN9c73e7KkaCZI0NXAv0ujH3ZmnmSlxav4pUernDDygErpIZ3XGN2Tx/b
 0pUhJK/4ff4Kw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EADBA380AAFF; Wed, 12 Feb 2025 03:00:41 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173932924049.82998.16364535718355132249.git-patchwork-notify@kernel.org>
Date: Wed, 12 Feb 2025 03:00:40 +0000
References: <20250211063657.405289-1-chao@kernel.org>
In-Reply-To: <20250211063657.405289-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -4.0 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 11 Feb 2025 14:36:57 +0800 you
 wrote: > syzbot reports a f2fs bug as below: > > [ cut here ] > kernel BUG
 at fs/f2fs/segment.c:2746! > CPU: 0 UID: 0 PID: 5323 Comm: syz [...] 
 Content analysis details:   (-4.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
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
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ti2z6-0002C4-3a
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid panic once fallocation
 fails for pinfile
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
Cc: jaegeuk@kernel.org, syzbot+15669ec8c35ddf6c3d43@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 11 Feb 2025 14:36:57 +0800 you wrote:
> syzbot reports a f2fs bug as below:
> 
> ------------[ cut here ]------------
> kernel BUG at fs/f2fs/segment.c:2746!
> CPU: 0 UID: 0 PID: 5323 Comm: syz.0.0 Not tainted 6.13.0-rc2-syzkaller-00018-g7cb1b4663150 #0
> RIP: 0010:get_new_segment fs/f2fs/segment.c:2746 [inline]
> RIP: 0010:new_curseg+0x1f52/0x1f70 fs/f2fs/segment.c:2876
> Call Trace:
>  <TASK>
>  __allocate_new_segment+0x1ce/0x940 fs/f2fs/segment.c:3210
>  f2fs_allocate_new_section fs/f2fs/segment.c:3224 [inline]
>  f2fs_allocate_pinning_section+0xfa/0x4e0 fs/f2fs/segment.c:3238
>  f2fs_expand_inode_data+0x696/0xca0 fs/f2fs/file.c:1830
>  f2fs_fallocate+0x537/0xa10 fs/f2fs/file.c:1940
>  vfs_fallocate+0x569/0x6e0 fs/open.c:327
>  do_vfs_ioctl+0x258c/0x2e40 fs/ioctl.c:885
>  __do_sys_ioctl fs/ioctl.c:904 [inline]
>  __se_sys_ioctl+0x80/0x170 fs/ioctl.c:892
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to avoid panic once fallocation fails for pinfile
    https://git.kernel.org/jaegeuk/f2fs/c/48ea8b200414

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
