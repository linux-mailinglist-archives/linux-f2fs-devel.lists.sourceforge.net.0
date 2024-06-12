Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EDD905794
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Jun 2024 17:56:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sHQKm-0006wy-KY;
	Wed, 12 Jun 2024 15:56:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sHQKb-0006vb-Mz
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 15:56:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CD4KiP7xTXSJoafzPoZiqY+6GIXr86Htaou3l9dDp+0=; b=e8MvsG5yHkpDkba+JzyACsshlo
 2peCZ8PE8rx9nvXIw4rISw+bXxJzPDE6GH1YxYRyOgRokiUdp5kfwZlYkiv4e85ZvWF782C7ndUpe
 a3SYSvF3qxJPw4SiuE9CZp9aE1MbH64jV004bQgjWWsCuiCQxnGi1pQK5cjK0hULSU70=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CD4KiP7xTXSJoafzPoZiqY+6GIXr86Htaou3l9dDp+0=; b=A/nhjqjRiJlBGmZgiKDpH8neVP
 bPr4UR62ZVqskQS0v208rytf26eP1JGdhUbFG3gEFT6DA2RBy7KiJgZq8ZZ9tnTLS0pqfn4eVtwK/
 EGWL0BlzLqiKEUgImOFVs7a/c0j+6c+qtgt4OxEpNeKTNAXxEloHPAyH3sirWs9KdPWM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sHQKX-0007SF-Mp for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 15:56:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A3C39614E7;
 Wed, 12 Jun 2024 15:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81EECC4AF4D;
 Wed, 12 Jun 2024 15:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718207757;
 bh=nvqdK8Zfe+BQqsmHz03eVLUh1k+NW47H6UA4WSho07I=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=epUylh4Wid+JYSdc14+jnpQ4XAO0GHhRMf3jsCknV2zF2KrJo1ADGp4pQ+rQeSj8d
 spM/szMeN43fZgHaV5R9s6ctyM1yz2wmjXYkcCLiULtBeFdXbVTtqiweUiaIAhz9s/
 3+Lr61L7+/aTHvhWLYQVyOip6OlnGkMpTZna+Cu6LoVZyGEjKH3tGkYSKp4gCLs7k3
 PBY661Ck0f36PhE7frbYprhlcHoy6wZSVfl/w8+Ece6zYNn1kXgc+2KfhvbPUtMzV2
 XCjNXbDeF3rL8yZU/K/y5wacN/pHE037DJL77ydqnkAEv+AXRdhToyFmAMgtQsiAAq
 +7SildofgLo8g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 75A19C43619; Wed, 12 Jun 2024 15:55:57 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171820775747.32393.11994963596959116040.git-patchwork-notify@kernel.org>
Date: Wed, 12 Jun 2024 15:55:57 +0000
References: <20240529100103.329778-1-chao@kernel.org>
In-Reply-To: <20240529100103.329778-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 29 May 2024 18:01:03 +0800 you
 wrote: > chenyuwen reports a f2fs bug as below: > > Unable to handle kernel
 NULL pointer dereference at virtual address 0000000000000011 >
 fscrypt_set_bio_crypt_ [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sHQKX-0007SF-Mp
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to truncate preallocated blocks
 in f2fs_file_open()
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, yuwen.chen@xjmz.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 29 May 2024 18:01:03 +0800 you wrote:
> chenyuwen reports a f2fs bug as below:
> 
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000011
>  fscrypt_set_bio_crypt_ctx+0x78/0x1e8
>  f2fs_grab_read_bio+0x78/0x208
>  f2fs_submit_page_read+0x44/0x154
>  f2fs_get_read_data_page+0x288/0x5f4
>  f2fs_get_lock_data_page+0x60/0x190
>  truncate_partial_data_page+0x108/0x4fc
>  f2fs_do_truncate_blocks+0x344/0x5f0
>  f2fs_truncate_blocks+0x6c/0x134
>  f2fs_truncate+0xd8/0x200
>  f2fs_iget+0x20c/0x5ac
>  do_garbage_collect+0x5d0/0xf6c
>  f2fs_gc+0x22c/0x6a4
>  f2fs_disable_checkpoint+0xc8/0x310
>  f2fs_fill_super+0x14bc/0x1764
>  mount_bdev+0x1b4/0x21c
>  f2fs_mount+0x20/0x30
>  legacy_get_tree+0x50/0xbc
>  vfs_get_tree+0x5c/0x1b0
>  do_new_mount+0x298/0x4cc
>  path_mount+0x33c/0x5fc
>  __arm64_sys_mount+0xcc/0x15c
>  invoke_syscall+0x60/0x150
>  el0_svc_common+0xb8/0xf8
>  do_el0_svc+0x28/0xa0
>  el0_svc+0x24/0x84
>  el0t_64_sync_handler+0x88/0xec
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: fix to truncate preallocated blocks in f2fs_file_open()
    https://git.kernel.org/jaegeuk/f2fs/c/298b1e4182d6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
