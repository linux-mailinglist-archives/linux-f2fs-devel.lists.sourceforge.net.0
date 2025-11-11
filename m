Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 624F8C50020
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Nov 2025 23:51:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNLUsNQ7qj899HajuFagV6XPLOnnUIHCO000qejOccY=; b=CIhe5Vs3fcjYdM5+TvChh2/1IE
	lvtrGU6gGB0eH61cvxIPBD2mCD4iXad05lgDwzm5QLLSVZ9wnmp3KBmAruNc39a8nfIaDcfjgPaZi
	K0aNwqMefOE4XloiPOh1WdaD/YzoMzY2cW4EpvTJuGRxnIcK3ppm0E4X/jBb+c4j7NiY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIxCZ-0008Rg-2V;
	Tue, 11 Nov 2025 22:51:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vIxCX-0008Qf-HD
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:51:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ggVbdp7pRPsTmZ9AWdf3vMtzLx4fB35akLllh7CPhSc=; b=DQFmyNotYUI7mtQVT0Hsm0lPHf
 NE6wxSNqppp3VUvtfl1PaVlD2yrcYioJPfW1cLctndFglIJd/yff+/HqN26rmn7iF4HulGBxLwvU+
 x/8TTjmvhZ3002/K88vAtJ61KCLCS12t8xHNHGcjGynTXXEWdH8lzwlz4dW1jTposRdg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ggVbdp7pRPsTmZ9AWdf3vMtzLx4fB35akLllh7CPhSc=; b=QZfoTNjE1xOndBf6uuogDaGNMk
 NvAa4/RfMt5HT7LhLPiXKxjN2pmtyOjLQvd9Wzhwac9wJwA3nGmqwwcjTc1rY1woh4aDCU4PH/0K6
 LJGPJPsIfFaQkaODPHi2kAMPzYF1akdU1DuZ9kSBPIz325IZvgIFQiCVa2e7p12YtHSw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIxCX-00047F-P1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:51:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2CC27600AC;
 Tue, 11 Nov 2025 22:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0FECC116B1;
 Tue, 11 Nov 2025 22:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762901455;
 bh=/mFXDzsNaVJtc+aBAgRDg4d40EXG5WNptX3dKSYuDSg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=tBNazh2zQFpk5Gpvm5lnBrCV8vP3ar1uwvW6InWShVyFLdjZdqtoj3v6p+MXtk+zG
 HlA+tI04C4Mt8qY16ooUzofGK6ekgV6ssaSz7/CBhkdSkiAS1ykQ8SPxViG5Ch/M7+
 COuyWLjVrX9X/S85TihbZRfW4FnqeENbeV2YutqMh9xUVdQh8NmMpjk6FBDZBDmqa6
 HSZnRZoK+6p+Hc2+P31pVdRKysd9GQ8kcTlGJIHrWgAsvPhxT1OeNecBUTxBd7w/06
 fahOFd0s+bYeSfk4k6uoGWSALtIykx3VsJGjapdYKQIViP7f//IFlZvoASfcczlggZ
 C4E80uzOOa6Yw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33C90380DBCD; Tue, 11 Nov 2025 22:50:27 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176290142599.3596344.15033354145117725938.git-patchwork-notify@kernel.org>
Date: Tue, 11 Nov 2025 22:50:25 +0000
References: <20251022030636.1194244-1-chao@kernel.org>
In-Reply-To: <20251022030636.1194244-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 22 Oct 2025 11:06:36 +0800 you
 wrote: > Bai, Shuangpeng <sjb7183@psu.edu> reported a bug as below: > > Oops:
 divide error: 0000 [#1] SMP KASAN PTI > CPU: 0 UID: 0 PID: 11441 Comm:
 syz.0.46 Not [...] 
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
X-Headers-End: 1vIxCX-00047F-P1
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid updating compression
 context during writeback
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
 stable@kernel.org, linux-kernel@vger.kernel.org, sjb7183@psu.edu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 22 Oct 2025 11:06:36 +0800 you wrote:
> Bai, Shuangpeng <sjb7183@psu.edu> reported a bug as below:
> 
> Oops: divide error: 0000 [#1] SMP KASAN PTI
> CPU: 0 UID: 0 PID: 11441 Comm: syz.0.46 Not tainted 6.17.0 #1 PREEMPT(full)
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
> RIP: 0010:f2fs_all_cluster_page_ready+0x106/0x550 fs/f2fs/compress.c:857
> Call Trace:
>  <TASK>
>  f2fs_write_cache_pages fs/f2fs/data.c:3078 [inline]
>  __f2fs_write_data_pages fs/f2fs/data.c:3290 [inline]
>  f2fs_write_data_pages+0x1c19/0x3600 fs/f2fs/data.c:3317
>  do_writepages+0x38e/0x640 mm/page-writeback.c:2634
>  filemap_fdatawrite_wbc mm/filemap.c:386 [inline]
>  __filemap_fdatawrite_range mm/filemap.c:419 [inline]
>  file_write_and_wait_range+0x2ba/0x3e0 mm/filemap.c:794
>  f2fs_do_sync_file+0x6e6/0x1b00 fs/f2fs/file.c:294
>  generic_write_sync include/linux/fs.h:3043 [inline]
>  f2fs_file_write_iter+0x76e/0x2700 fs/f2fs/file.c:5259
>  new_sync_write fs/read_write.c:593 [inline]
>  vfs_write+0x7e9/0xe00 fs/read_write.c:686
>  ksys_write+0x19d/0x2d0 fs/read_write.c:738
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xf7/0x470 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: fix to avoid updating compression context during writeback
    https://git.kernel.org/jaegeuk/f2fs/c/dc460f40c8f3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
