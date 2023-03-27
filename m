Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D21436CA9D2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Mar 2023 18:00:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pgpH5-0005ot-Jw;
	Mon, 27 Mar 2023 16:00:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pgpGl-0005oV-BE
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Mar 2023 16:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JiARjaO3jGhXzlmyjobM8jjLSlv117HZd+zLNnGIpE0=; b=afc8JW1GsgvYRieBI/DbyNB+ws
 OQidL+OEaYctrzIT60niHu1GRBAX4cxvH85onmbvJHXDaiUfKZwr2cpQSQficnOKpu3vmkp1OCBds
 Y57NDEfoEvLK4QHCrZOBrPeln+lDL7eXSGHJ1pSENnPjW6sBfdUWp/uF8mEurNagLX18=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JiARjaO3jGhXzlmyjobM8jjLSlv117HZd+zLNnGIpE0=; b=VYIxd5+vzzW7jXodwgHNAXcv4g
 8qJz1sNujRUDT40tN5LuZz8i6q5oxDCqxyiSOvC6JH1pY3dIc1ddEhr/r4WZTWA+uWLQBuA37BRJW
 eLAB6sLDpFix3qlq2ovKHpxf0/WioUVTwbwFmuUduW5For0Bx4Ma2knlADUaupGIZe3o=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pgpGj-005vG2-VC for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Mar 2023 16:00:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8E96A6135F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 27 Mar 2023 16:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3697C433D2;
 Mon, 27 Mar 2023 16:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679932820;
 bh=yzXF6ms5tVBoUp0idIE08tuqYR4d0j0UFOeE0fNkEvg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=NGY/co5tgkbRThir2Su3xDF7HDta4k5Y0KJImNPt9mO46KlCIBXhks/5yecv2W6gD
 xr2LDlAnLvutSDMhp2AeHmUr50drQ7QassBeG2F2oLKhQbM+QdNMTT4GA+q3UfaSro
 EswhVu4cQyaJxy9qUU8n+aF6kcZxtj/6D7uYUhKW/OacwMNCxpqp5aCQXiBxIS8yc1
 zCaGyJIIjtN9b78zrTBCA3nudX2FM9LxXNFrRtKGq1ZH22uAiMJGTsYlIgOKWurp7/
 D4uzGiUkzhDBuqJ67PiqBGAiRD7RP2elk+ZEtWyrZVLjjowoA+vPpHRrxJUH4zhvtH
 FMcRi3tDJdFxg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D1685E4D022; Mon, 27 Mar 2023 16:00:19 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167993281985.32120.768472186310508340.git-patchwork-notify@kernel.org>
Date: Mon, 27 Mar 2023 16:00:19 +0000
References: <20230323224734.2041173-1-jaegeuk@kernel.org>
In-Reply-To: <20230323224734.2041173-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 23 Mar 2023 15:47:34 -0700 you
 wrote: > [ 16.945668][ C0] Call trace: > [ 16.945678][ C0]
 dump_backtrace+0x110/0x204
 > [ 16.945706][ C0] dump_stack_lvl+0x84/0xbc > [ 16.945735][ C0] __schedule
 [...] Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pgpGj-005vG2-VC
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix scheduling while atomic in
 decompression path
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 23 Mar 2023 15:47:34 -0700 you wrote:
> [   16.945668][    C0] Call trace:
> [   16.945678][    C0]  dump_backtrace+0x110/0x204
> [   16.945706][    C0]  dump_stack_lvl+0x84/0xbc
> [   16.945735][    C0]  __schedule_bug+0xb8/0x1ac
> [   16.945756][    C0]  __schedule+0x724/0xbdc
> [   16.945778][    C0]  schedule+0x154/0x258
> [   16.945793][    C0]  bit_wait_io+0x48/0xa4
> [   16.945808][    C0]  out_of_line_wait_on_bit+0x114/0x198
> [   16.945824][    C0]  __sync_dirty_buffer+0x1f8/0x2e8
> [   16.945853][    C0]  __f2fs_commit_super+0x140/0x1f4
> [   16.945881][    C0]  f2fs_commit_super+0x110/0x28c
> [   16.945898][    C0]  f2fs_handle_error+0x1f4/0x2f4
> [   16.945917][    C0]  f2fs_decompress_cluster+0xc4/0x450
> [   16.945942][    C0]  f2fs_end_read_compressed_page+0xc0/0xfc
> [   16.945959][    C0]  f2fs_handle_step_decompress+0x118/0x1cc
> [   16.945978][    C0]  f2fs_read_end_io+0x168/0x2b0
> [   16.945993][    C0]  bio_endio+0x25c/0x2c8
> [   16.946015][    C0]  dm_io_dec_pending+0x3e8/0x57c
> [   16.946052][    C0]  clone_endio+0x134/0x254
> [   16.946069][    C0]  bio_endio+0x25c/0x2c8
> [   16.946084][    C0]  blk_update_request+0x1d4/0x478
> [   16.946103][    C0]  scsi_end_request+0x38/0x4cc
> [   16.946129][    C0]  scsi_io_completion+0x94/0x184
> [   16.946147][    C0]  scsi_finish_command+0xe8/0x154
> [   16.946164][    C0]  scsi_complete+0x90/0x1d8
> [   16.946181][    C0]  blk_done_softirq+0xa4/0x11c
> [   16.946198][    C0]  _stext+0x184/0x614
> [   16.946214][    C0]  __irq_exit_rcu+0x78/0x144
> [   16.946234][    C0]  handle_domain_irq+0xd4/0x154
> [   16.946260][    C0]  gic_handle_irq.33881+0x5c/0x27c
> [   16.946281][    C0]  call_on_irq_stack+0x40/0x70
> [   16.946298][    C0]  do_interrupt_handler+0x48/0xa4
> [   16.946313][    C0]  el1_interrupt+0x38/0x68
> [   16.946346][    C0]  el1h_64_irq_handler+0x20/0x30
> [   16.946362][    C0]  el1h_64_irq+0x78/0x7c
> [   16.946377][    C0]  finish_task_switch+0xc8/0x3d8
> [   16.946394][    C0]  __schedule+0x600/0xbdc
> [   16.946408][    C0]  preempt_schedule_common+0x34/0x5c
> [   16.946423][    C0]  preempt_schedule+0x44/0x48
> [   16.946438][    C0]  process_one_work+0x30c/0x550
> [   16.946456][    C0]  worker_thread+0x414/0x8bc
> [   16.946472][    C0]  kthread+0x16c/0x1e0
> [   16.946486][    C0]  ret_from_fork+0x10/0x20
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix scheduling while atomic in decompression path
    https://git.kernel.org/jaegeuk/f2fs/c/8906fb10b77f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
