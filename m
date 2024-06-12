Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 746AB90579E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Jun 2024 17:56:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sHQKr-00043V-RT;
	Wed, 12 Jun 2024 15:56:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sHQKd-00042Q-Fm
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 15:56:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UolA5bh3yjeAZLQd6RxjW2rRV/zNWZOJBQb2Dd9ZngI=; b=F7RRwOcBT+sby6SQarArWxHOYE
 c5B4M0PFSSl5QYItVhamDG1UxMTXELGQcMyi0WX2H1+BXwxPTcywRzq5Ay/F6YlQNGia5B8pph3xa
 98/GPXwC8LRIE4/slo892hRcVjxnye0HtYe36WkS3HBp7anfgRsff4ZmpJJ8pkwNaU2E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UolA5bh3yjeAZLQd6RxjW2rRV/zNWZOJBQb2Dd9ZngI=; b=CB2BNR2gEgcIKgoBJU8dlbL/Fk
 lEUbzFu/YqBiV5cb1wBfZOnJqTBlrA3uEpbkrjYZGcyhw8MOYeHQaSznsuCeJd4Xf3uP4t7KQFySW
 GS+582xEGg2oPK1Rk12VTD3a9NnweECgteXIqgwg545sZjzteiqDje9qia3EaP/uvacw=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sHQKZ-0007SM-PT for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 15:56:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1D3B5CE21D5;
 Wed, 12 Jun 2024 15:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43C10C4AF53;
 Wed, 12 Jun 2024 15:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718207757;
 bh=fg5ngAXBtHfUv26u+nwajvrTqbRSPs+zZsIgoe3iwR4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=k5vQvJyBzqctuLwDDYj7pCJYgiBbRwzVJcRl1mJqImEXx8OrPBo9Qci53mSM+AGNc
 VTOTT9pQgIpE6xq1DqkQJ7qNyOt80lWHsKpUiYQjWNiHjaOKBIFLPJe79nlzhS/eK/
 oVElTBCjj2eopBOXvAjglDJY7w5VLhbBtpdWaNCH57UzNcvA5DLJXmg9vMxsm1Qqnt
 RmXU4N/H00oygZ8VMl7Heo+zZBiY/VC/JS7X3IAhxbpEk91lfiIJpMTdiQsifvyJeY
 R+05ZCk6JAKqDNYqcFmqiLfM0AN+2zdle0/sqyzSBsZCJa9MvmWdNUow2TYxC3rGjj
 o6Jh+01D6JqoA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 35CA6C43638; Wed, 12 Jun 2024 15:55:57 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171820775721.32393.16229302976932686990.git-patchwork-notify@kernel.org>
Date: Wed, 12 Jun 2024 15:55:57 +0000
References: <20240531020032.1019991-1-chao@kernel.org>
In-Reply-To: <20240531020032.1019991-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 31 May 2024 10:00:32 +0800 you
 wrote: > syzbot reports a f2fs bug as below: > > BUG: KASAN:
 slab-use-after-free
 in sanity_check_extent_cache+0x370/0x410 fs/f2fs/extent_cache.c:46 > Read
 of siz [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sHQKZ-0007SM-PT
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to cover read extent cache
 access with lock
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
 linux-kernel@vger.kernel.org,
 syzbot+74ebe2104433e9dc610d@syzkaller.appspotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 31 May 2024 10:00:32 +0800 you wrote:
> syzbot reports a f2fs bug as below:
> 
> BUG: KASAN: slab-use-after-free in sanity_check_extent_cache+0x370/0x410 fs/f2fs/extent_cache.c:46
> Read of size 4 at addr ffff8880739ab220 by task syz-executor200/5097
> 
> CPU: 0 PID: 5097 Comm: syz-executor200 Not tainted 6.9.0-rc6-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/27/2024
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:88 [inline]
>  dump_stack_lvl+0x241/0x360 lib/dump_stack.c:114
>  print_address_description mm/kasan/report.c:377 [inline]
>  print_report+0x169/0x550 mm/kasan/report.c:488
>  kasan_report+0x143/0x180 mm/kasan/report.c:601
>  sanity_check_extent_cache+0x370/0x410 fs/f2fs/extent_cache.c:46
>  do_read_inode fs/f2fs/inode.c:509 [inline]
>  f2fs_iget+0x33e1/0x46e0 fs/f2fs/inode.c:560
>  f2fs_nfs_get_inode+0x74/0x100 fs/f2fs/super.c:3237
>  generic_fh_to_dentry+0x9f/0xf0 fs/libfs.c:1413
>  exportfs_decode_fh_raw+0x152/0x5f0 fs/exportfs/expfs.c:444
>  exportfs_decode_fh+0x3c/0x80 fs/exportfs/expfs.c:584
>  do_handle_to_path fs/fhandle.c:155 [inline]
>  handle_to_path fs/fhandle.c:210 [inline]
>  do_handle_open+0x495/0x650 fs/fhandle.c:226
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xf5/0x240 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: fix to cover read extent cache access with lock
    https://git.kernel.org/jaegeuk/f2fs/c/d7409b05a64f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
