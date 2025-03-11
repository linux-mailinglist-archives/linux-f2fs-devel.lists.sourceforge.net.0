Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAAAA5CFE6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Mar 2025 20:50:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ts5cN-0007VQ-Jv;
	Tue, 11 Mar 2025 19:50:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1ts5cL-0007VJ-AA
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 19:50:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gfjpYMM8JEJjHpvttOmtXsazDK6eFAFmHXSqeBlWizM=; b=AIH3PeZB1pBbnyPwbHU+mfRSmT
 TQ/tjFSYnSYCmnMo9fx9l99bDhxh20GALMFjFWfcaYfxgrYANJkUDH8ziy/3eMzdH3epQgdGURNdu
 H6BY15ZK7D0qu4j79emH6aE2ZzW/tkCO4TZ28cL6ODZ6pVaE6X4LISmO9YKPF/y+QTsM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gfjpYMM8JEJjHpvttOmtXsazDK6eFAFmHXSqeBlWizM=; b=UlqtRLApQsj1wIz4ZnOg7T+P/q
 ZlAcujHYtF0kNoEPEoM/FNsYee2cqXgPlkjBjsYWqwPgdbNTgHypZlnFrWfzmi4XIqu77/6kGNNWt
 72T8MoOVctc8f8rf3jOXHPVMPf+DLqAMBQO8SwapyxhAWCauPcQ1b3steRTNspjTUt/Y=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ts5c9-0002ie-9V for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 19:50:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9132BA465A2;
 Tue, 11 Mar 2025 19:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4642EC4CEE9;
 Tue, 11 Mar 2025 19:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741722603;
 bh=+qG6d7S8I82gDrV+L5d1hoVLSp/ulhZqrxchLH9vvts=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=rVpVc7b8z7nqnLhZibPYVf8s9QMOTSjZblbCf/+IK9FbN22X5U/MdL0hk7gV801xP
 lZotN5FSP5dmuyr2P9YpeOleSumSUf9y9b67eGJy1nHb+zgZUNdMGT0Kpa3Ks3Efcy
 i+CO5ThSGz5xxod4LPBGM60AY1bwqs6AIHopehg9uzOPhNd4eTXJzThhkNTLb2RFAt
 Qv9TqQRTzr0ggsqX0epj4hv09348pLGP6gWvnG6Vu4osoaRQF4L82SlfJ1Tx2ddKjX
 RYRsynF7utmWqMb8zW3sVtZVrBojsNECS6oCtIWBeIUeT+OFSxukh0JKtZF0PFBQ9S
 /hI4EwJIzb8Jg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADCCB380AC1C; Tue, 11 Mar 2025 19:50:38 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174172263724.214029.5489516472538640830.git-patchwork-notify@kernel.org>
Date: Tue, 11 Mar 2025 19:50:37 +0000
References: <20250224102923.93758-1-chao@kernel.org>
In-Reply-To: <20250224102923.93758-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 24 Feb 2025 18:29:23 +0800 you
 wrote: > syzbot reports a f2fs bug as below: > > F2FS-fs (loop3): Stopped
 filesystem due to reason: 7 > kworker/u8:7: attempt to access beyond end of
 device > BU [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ts5c9-0002ie-9V
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid accessing
 uninitialized curseg
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
 syzbot+b6b347b7a4ea1b2e29b6@syzkaller.appspotmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 24 Feb 2025 18:29:23 +0800 you wrote:
> syzbot reports a f2fs bug as below:
> 
> F2FS-fs (loop3): Stopped filesystem due to reason: 7
> kworker/u8:7: attempt to access beyond end of device
> BUG: unable to handle page fault for address: ffffed1604ea3dfa
> RIP: 0010:get_ckpt_valid_blocks fs/f2fs/segment.h:361 [inline]
> RIP: 0010:has_curseg_enough_space fs/f2fs/segment.h:570 [inline]
> RIP: 0010:__get_secs_required fs/f2fs/segment.h:620 [inline]
> RIP: 0010:has_not_enough_free_secs fs/f2fs/segment.h:633 [inline]
> RIP: 0010:has_enough_free_secs+0x575/0x1660 fs/f2fs/segment.h:649
>  <TASK>
>  f2fs_is_checkpoint_ready fs/f2fs/segment.h:671 [inline]
>  f2fs_write_inode+0x425/0x540 fs/f2fs/inode.c:791
>  write_inode fs/fs-writeback.c:1525 [inline]
>  __writeback_single_inode+0x708/0x10d0 fs/fs-writeback.c:1745
>  writeback_sb_inodes+0x820/0x1360 fs/fs-writeback.c:1976
>  wb_writeback+0x413/0xb80 fs/fs-writeback.c:2156
>  wb_do_writeback fs/fs-writeback.c:2303 [inline]
>  wb_workfn+0x410/0x1080 fs/fs-writeback.c:2343
>  process_one_work kernel/workqueue.c:3236 [inline]
>  process_scheduled_works+0xa66/0x1840 kernel/workqueue.c:3317
>  worker_thread+0x870/0xd30 kernel/workqueue.c:3398
>  kthread+0x7a9/0x920 kernel/kthread.c:464
>  ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: fix to avoid accessing uninitialized curseg
    https://git.kernel.org/jaegeuk/f2fs/c/986c50f6bca1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
