Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9099B37DD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2024 18:40:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5TjS-0005TQ-SB;
	Mon, 28 Oct 2024 17:40:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1t5TjR-0005TC-6B
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 17:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xzs7mVJiY/99JH78lXhRI/gpdMH/B1l1q49UGHLlZkI=; b=Zw/+/OMqWLSUxKOoeZgOVnJ7Od
 NMMPzZcD8VxHdOR0J5zFzmBAPIHMqJepZ+nxR1szP6meA03gcicCIgQkfmwLrKrXmirToDGdhBrFj
 q2JsuWdweaNc+GK1tDFA9xXbxQYWpgwXQiOhZ3L8fEJE+fuXKx4ajnoFI2LcbY+aUQ4I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xzs7mVJiY/99JH78lXhRI/gpdMH/B1l1q49UGHLlZkI=; b=CuZ5PM64UatUKPYfRJrLHSqKq6
 tQ8XaauW1fc5OW+bNXC7FzFXKofkNeeIq+gt9VHzxzyT3e4fz3n8x1LMKUn+6I70WUqom0aBXABVr
 B9mCjRmFAkic6mZyWN507zP6+DcO/y0RF8pD5emrPlvoX5KitMUGZDJRdgLYSo0hGvl8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5TjQ-0005HI-Jd for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 17:40:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C56F15C5DFB;
 Mon, 28 Oct 2024 17:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1863C4CEED;
 Mon, 28 Oct 2024 17:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730137236;
 bh=zUOiog+udt4w3pRdHXpty+ks/QHOzQoZWUfTUON0AYs=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=UsRHubI0me7oHxa5Kb7o/7aeKcWSxFiKQgLBQvaByvwSjv2FNS7+54LJVTaxb/mwQ
 UUsvqcCvOGPpsXvQRwHdX84W7MLdoiOz7JaN35kb0sk/pyfnW2zbAWKAIdFTsvm3Vf
 W/bkRpbIJwngDMFZaGIjl8TR8LTu4gboAEbILp3kFQYBx+9dIKbMeOM8HKNtMNSTzf
 bY0fP36aCD2ydDUJnNblZkM8vGrY3KLz8oR+Fm1Nm2zEZGpdxvFwj6uKqOV3R4MHuB
 dxYcQKmlFn7e6gS5bf5JMOzSGynQ8Xd9dJfViWRfbpYxnl4YgzoGzZpAf6f0REYwsH
 QjNoCfvF3xcmA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33F41380AC1C; Mon, 28 Oct 2024 17:40:45 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173013724399.126843.16835536679745667890.git-patchwork-notify@kernel.org>
Date: Mon, 28 Oct 2024 17:40:43 +0000
References: <20241011164450.3366215-1-yebin@huaweicloud.com>
In-Reply-To: <20241011164450.3366215-1-yebin@huaweicloud.com>
To: Ye Bin <yebin@huaweicloud.com>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sat, 12 Oct 2024 00:44:50 +0800 you
 wrote: > From: Ye Bin <yebin10@huawei.com> > > There's issue as follows when
 concurrently installing the f2fs.ko > module and mounting the f2fs file
 system: > KA [...] 
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
X-Headers-End: 1t5TjQ-0005HI-Jd
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix null-ptr-deref in
 f2fs_submit_page_bio()
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
Cc: jaegeuk@kernel.org, zhangxiaoxu5@huawei.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sat, 12 Oct 2024 00:44:50 +0800 you wrote:
> From: Ye Bin <yebin10@huawei.com>
> 
> There's issue as follows when concurrently installing the f2fs.ko
> module and mounting the f2fs file system:
> KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027]
> RIP: 0010:__bio_alloc+0x2fb/0x6c0 [f2fs]
> Call Trace:
>  <TASK>
>  f2fs_submit_page_bio+0x126/0x8b0 [f2fs]
>  __get_meta_page+0x1d4/0x920 [f2fs]
>  get_checkpoint_version.constprop.0+0x2b/0x3c0 [f2fs]
>  validate_checkpoint+0xac/0x290 [f2fs]
>  f2fs_get_valid_checkpoint+0x207/0x950 [f2fs]
>  f2fs_fill_super+0x1007/0x39b0 [f2fs]
>  mount_bdev+0x183/0x250
>  legacy_get_tree+0xf4/0x1e0
>  vfs_get_tree+0x88/0x340
>  do_new_mount+0x283/0x5e0
>  path_mount+0x2b2/0x15b0
>  __x64_sys_mount+0x1fe/0x270
>  do_syscall_64+0x5f/0x170
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix null-ptr-deref in f2fs_submit_page_bio()
    https://git.kernel.org/jaegeuk/f2fs/c/b7d0a97b2808

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
