Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2A6CFBD93
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 07 Jan 2026 04:33:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEF73017zv5Gec9BJTtxD+J6XW9UbLe81ZuBns1tRQ4=; b=CGnoUHU5QGELyV9QUDpffOPdNu
	mJL9IcKtRsqwzSFRW/+cmpDLwmIS7E6oSsOxtWKcIQwEzAvwWhRbwXStSr4gRcUHYR2JxznzutXWn
	nj570hqf5IX5oYoziMIzu77uP7T+WC3Mu06C+90YyPnSzXrUC4twqgbhm5+09HnBuy30=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdKIy-0006pu-9K;
	Wed, 07 Jan 2026 03:33:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vdKIw-0006pj-Ng
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 03:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2pHTJSfaHitN4/wgKS+90QIfTPadJxwsUdVlZLDJSno=; b=NcQRfOba9D5KVs9Nqs8dkJx3Bu
 WSRC+fKNPJQ77UOK2gryMYbjyaf4UTFxSxDOQitu8jJAH84Cx5IIXX7W+bQTIs3BW3NGLUqxggJLr
 pzUUDBNXVhjjoVcClHXYa5VTmk179Ojz5bpw38h4g2wvj0z/cCL3+/QdPGGKrH5yx9JQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2pHTJSfaHitN4/wgKS+90QIfTPadJxwsUdVlZLDJSno=; b=i4LeABNQdhVp7nRAOWmXBCJbtD
 yQ9LedTUZfZGTWeyV5zHFz3SQsJhOXGoEOE22txgjFDscjjl8k+mS2wLhXkwWNxzOD6ihKWDrcQFE
 BmPKxUinE+L6jcjo0/GZsxhty7PKSbajUr959w6YoFAFBSL8E7D/3QypYah373fe/MCY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdKIw-0004YJ-8i for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 03:33:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A6ADE6014C;
 Wed,  7 Jan 2026 03:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB69C19424;
 Wed,  7 Jan 2026 03:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767756819;
 bh=PgUnEHH/rQE9ZAD5rQDKLsa85i3tRS0l86okO4XwnY4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=f+MACgFVirDaX4UpklRkwaxrNY33gdpqnlL+fvFCS4RJniMhZg0oIyGP1IB/Yj50X
 dBFKsYpcGKcxv41EfBP1vEOrAgklum5WOikLJj4o+ZNg37tREyva2EwOUntmw+yl86
 VSfjW5zrd9QWbn77PPLynndO0dg7vvdSQB8BO7aS2UWIFIe6wWez0JE0u4oj+/K8yJ
 vYf+9tYkxGguVnsVSXCw0qTT4B/dffxDjnWd6hqgBBP/SqPudu4W13kSDfVv44X6/y
 UVfR8mrvfG9AEgh3mZoM6ZH/EEOXW1Ah4h8e+6WLeDbxxum9U96bOrmjMaGlzXfo7s
 e4Zgfl7JifIMg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 F2861380CEF5; Wed,  7 Jan 2026 03:30:17 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176775661652.2218650.14618578319542873198.git-patchwork-notify@kernel.org>
Date: Wed, 07 Jan 2026 03:30:16 +0000
References: <20251230081429.8243-2-yangyongpeng.storage@gmail.com>
In-Reply-To: <20251230081429.8243-2-yangyongpeng.storage@gmail.com>
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 30 Dec 2025 16:14:30 +0800 you
 wrote: > From: Yongpeng Yang <yangyongpeng@xiaomi.com> > > During SPO tests,
 when mounting F2FS,
 an -EINVAL error was returned from > f2fs_recover_inode_page.
 Th [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vdKIw-0004YJ-8i
Subject: Re: [f2fs-dev] [PATCH v4 1/1] f2fs: fix IS_CHECKPOINTED flag
 inconsistency issue caused by concurrent atomic commit and checkpoint
 writes
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
Cc: jinbaoliu365@gmail.com, yangyongpeng@xiaomi.com, liujinbao1@xiaomi.com,
 shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net,
 jaegeuk@kernel.org, yangyongpeng.storage@outlook.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 30 Dec 2025 16:14:30 +0800 you wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> During SPO tests, when mounting F2FS, an -EINVAL error was returned from
> f2fs_recover_inode_page. The issue occurred under the following scenario
> 
> Thread A                                     Thread B
> f2fs_ioc_commit_atomic_write
>  - f2fs_do_sync_file // atomic = true
>   - f2fs_fsync_node_pages
>     : last_folio = inode folio
>     : schedule before folio_lock(last_folio) f2fs_write_checkpoint
>                                               - block_operations// writeback last_folio
>                                               - schedule before f2fs_flush_nat_entries
>     : set_fsync_mark(last_folio, 1)
>     : set_dentry_mark(last_folio, 1)
>     : folio_mark_dirty(last_folio)
>     - __write_node_folio(last_folio)
>       : f2fs_down_read(&sbi->node_write)//block
>                                               - f2fs_flush_nat_entries
>                                                 : {struct nat_entry}->flag |= BIT(IS_CHECKPOINTED)
>                                               - unblock_operations
>                                                 : f2fs_up_write(&sbi->node_write)
>                                              f2fs_write_checkpoint//return
>       : f2fs_do_write_node_page()
> f2fs_ioc_commit_atomic_write//return
>                                              SPO
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v4,1/1] f2fs: fix IS_CHECKPOINTED flag inconsistency issue caused by concurrent atomic commit and checkpoint writes
    https://git.kernel.org/jaegeuk/f2fs/c/7633a7387eb4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
