Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC66A9B37E4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2024 18:40:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5TjY-0002gq-NQ;
	Mon, 28 Oct 2024 17:40:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1t5TjW-0002gZ-Sb
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 17:40:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V5AD2eg4lJeMXzMXbOHgHx41FIkjYxkLIO2fbbIw6c8=; b=AsU0sNOFu07lnJIXOKsC+v2TCP
 u3sMQy1gPKB9s8nTNRZ6jWO01Ppj3ffqlrF/SxrKR439RW+VAzqmXrkAPRtz0Z5Sey899RxDJeoLi
 7O96p2NOdkTh3Vbs0O61ZGBONsxsDPVSmKzl6huY7GO/c60xRVPCLb5i8RpqKR+tSt18=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V5AD2eg4lJeMXzMXbOHgHx41FIkjYxkLIO2fbbIw6c8=; b=gbRmFmZkBRIOnZq19EhvYEoN3p
 4wko9SYK12bsk5d8d6s+bH2lWIt03W3jWnawP0yZkLggQu4PigITdNAovP2ZUTcOU4vP8PrSWt17g
 Hc103aljT/TEAcm1btBU1DLH2W+1fFhgQfn+GPmCiOd6tzLNUiTIBJAPE/R0J7+BePfU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5TjW-0005I3-W2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 17:40:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 957B25C5B06;
 Mon, 28 Oct 2024 17:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE9EC4CEC3;
 Mon, 28 Oct 2024 17:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730137240;
 bh=kpJcVW/EFeg82s9DqGxirpAkIKtxE8wORBMCHE/olj0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hJZXsoaPeYMrAKfrAo7igcd5lhPjfIoUGs60u4X8HC4X9L+J/607xFDJYyepG6BwX
 IKznh9OSBXxpcH7h3GUljg6YvtXgkGKRskKLy4fZr0eh8+yq0FRg5KsnDUamkl0Lrt
 6lCVaFO8lTgo4lqFXPbFX6UdnaBqOAfGT+iROGFo2ZECzf/cO96OHS6Sfh0zXK3LVi
 kntKPK8ip9FwVggIOGeVewtIA1AJO4+rfnyiOuH0xEEpLAuZyXypBfHUfCfHDCx7DC
 W7IXBuagIRb1/2bjSfQ4PfA37lsEnG2yQNwGsZ4q6Du8n2siYehbnrSAWLP8WRbhJx
 oBGChQAIeNvjQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAEAC380AC1C; Mon, 28 Oct 2024 17:40:48 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173013724745.126843.2488678512223387224.git-patchwork-notify@kernel.org>
Date: Mon, 28 Oct 2024 17:40:47 +0000
References: <20241016081337.598979-1-chao@kernel.org>
In-Reply-To: <20241016081337.598979-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 16 Oct 2024 16:13:37 +0800 you
 wrote: > syzbot reports a f2fs bug as below: > > [ cut here ] > kernel BUG
 at fs/f2fs/segment.c:2534! > RIP: 0010:f2fs_invalidate_blocks+ [...] 
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
X-Headers-End: 1t5TjW-0005I3-W2
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to do sanity check on node blkaddr
 in truncate_node()
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
Cc: jaegeuk@kernel.org, syzbot+33379ce4ac76acf7d0c7@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 16 Oct 2024 16:13:37 +0800 you wrote:
> syzbot reports a f2fs bug as below:
> 
> ------------[ cut here ]------------
> kernel BUG at fs/f2fs/segment.c:2534!
> RIP: 0010:f2fs_invalidate_blocks+0x35f/0x370 fs/f2fs/segment.c:2534
> Call Trace:
>  truncate_node+0x1ae/0x8c0 fs/f2fs/node.c:909
>  f2fs_remove_inode_page+0x5c2/0x870 fs/f2fs/node.c:1288
>  f2fs_evict_inode+0x879/0x15c0 fs/f2fs/inode.c:856
>  evict+0x4e8/0x9b0 fs/inode.c:723
>  f2fs_handle_failed_inode+0x271/0x2e0 fs/f2fs/inode.c:986
>  f2fs_create+0x357/0x530 fs/f2fs/namei.c:394
>  lookup_open fs/namei.c:3595 [inline]
>  open_last_lookups fs/namei.c:3694 [inline]
>  path_openat+0x1c03/0x3590 fs/namei.c:3930
>  do_filp_open+0x235/0x490 fs/namei.c:3960
>  do_sys_openat2+0x13e/0x1d0 fs/open.c:1415
>  do_sys_open fs/open.c:1430 [inline]
>  __do_sys_openat fs/open.c:1446 [inline]
>  __se_sys_openat fs/open.c:1441 [inline]
>  __x64_sys_openat+0x247/0x2a0 fs/open.c:1441
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0010:f2fs_invalidate_blocks+0x35f/0x370 fs/f2fs/segment.c:2534
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to do sanity check on node blkaddr in truncate_node()
    https://git.kernel.org/jaegeuk/f2fs/c/e767ae13e67d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
