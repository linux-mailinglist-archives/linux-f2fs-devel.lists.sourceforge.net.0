Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6596B87C123
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Mar 2024 17:20:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rknoy-0005bN-GG;
	Thu, 14 Mar 2024 16:20:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rknox-0005bG-5q
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Mar 2024 16:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dc8z26VGfJ8t4WQk51GNledaY/JmcbRU55dIcMZhiuA=; b=m9dNUYlZYsGGqcWNZGlE4nQMfU
 kmmY7C5haxvw1MIqzCE6O259bJmMiYQU9D9AN/Ry8+mTk1Uae2diZLikpb3S/v01oytPTtOz5GcuP
 10SPWG0/ALtCzLz7OkxTHoyF2J14KJKHrG5QA1jtKvezdo3gBvJNjZXjGi7cc1WopkP4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dc8z26VGfJ8t4WQk51GNledaY/JmcbRU55dIcMZhiuA=; b=ZdSUPSojo4jUA+G8gwMYzoSFE+
 sK6UcNCbLGy7Ptt1sV+T1cjzc2RcibGB4ptflXqbNXlWJWK4bY1KLJbryX7zOX0aZ81Knpk2FECrT
 pe35o+YLkATQuyp3OTVURZZRzPTERPPyNGdrMRBlY+3W7IJZ01OJ/4FI1cEggc72PWMk=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rknom-0001s3-Qn for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Mar 2024 16:20:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 45327CE1DD2;
 Thu, 14 Mar 2024 16:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82B05C43390;
 Thu, 14 Mar 2024 16:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710433231;
 bh=DiMMcNdh086cZ1dy2/SsqCOSR/rQG4XxC4tlfBQ3NIs=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hF9pB5rwtQNKNi8cLb0VPwWDhJRtsUNAoHE5f7QVDsYRkJcE6GbiAalYTxtsxCK4t
 a2iCRcQV/nw/5PD8jhzND6x1NdqSNRm++a5mIWON6CAWt/oG0fb8kp3RDmqoRa0hf8
 5M15xbK3HaZkwSReUVEtfVLp9LnBXCTvjfbuVV0oCP9OA2yyCJ6fmWc8bjSvE51RhT
 S7Usmy2qDtd/ofd0YxIbJzehl/Dw98De1F2/79aKYY81H0VdkKXfcwMuBNph1NdIg+
 z0vhZp+fPlcITayDCK4gAo4Ot+kpj+UwaWLuV1uABpJjAc/2sA8yryinATt3sanklf
 JjVzGaxdcHmdw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6DCD3D95061; Thu, 14 Mar 2024 16:20:31 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171043323144.13516.1787617599417094605.git-patchwork-notify@kernel.org>
Date: Thu, 14 Mar 2024 16:20:31 +0000
References: <20240314020528.3051533-1-chao@kernel.org>
In-Reply-To: <20240314020528.3051533-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 14 Mar 2024 10:05:28 +0800 you
 wrote: > syzbot reports a f2fs bug as below: > > BUG: KASAN:
 slab-use-after-free
 in f2fs_filemap_fault+0xd1/0x2c0 fs/f2fs/file.c:49 > Read of size 8 at addr
 ffff [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rknom-0001s3-Qn
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid use-after-free issue in
 f2fs_filemap_fault
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
Cc: hdanton@sina.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 Ed.Tsai@mediatek.com, syzbot+763afad57075d3f862f2@syzkaller.appspotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 14 Mar 2024 10:05:28 +0800 you wrote:
> syzbot reports a f2fs bug as below:
> 
> BUG: KASAN: slab-use-after-free in f2fs_filemap_fault+0xd1/0x2c0 fs/f2fs/file.c:49
> Read of size 8 at addr ffff88807bb22680 by task syz-executor184/5058
> 
> CPU: 0 PID: 5058 Comm: syz-executor184 Not tainted 6.7.0-syzkaller-09928-g052d534373b7 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/17/2023
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:88 [inline]
>  dump_stack_lvl+0x1e7/0x2d0 lib/dump_stack.c:106
>  print_address_description mm/kasan/report.c:377 [inline]
>  print_report+0x163/0x540 mm/kasan/report.c:488
>  kasan_report+0x142/0x170 mm/kasan/report.c:601
>  f2fs_filemap_fault+0xd1/0x2c0 fs/f2fs/file.c:49
>  __do_fault+0x131/0x450 mm/memory.c:4376
>  do_shared_fault mm/memory.c:4798 [inline]
>  do_fault mm/memory.c:4872 [inline]
>  do_pte_missing mm/memory.c:3745 [inline]
>  handle_pte_fault mm/memory.c:5144 [inline]
>  __handle_mm_fault+0x23b7/0x72b0 mm/memory.c:5285
>  handle_mm_fault+0x27e/0x770 mm/memory.c:5450
>  do_user_addr_fault arch/x86/mm/fault.c:1364 [inline]
>  handle_page_fault arch/x86/mm/fault.c:1507 [inline]
>  exc_page_fault+0x456/0x870 arch/x86/mm/fault.c:1563
>  asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:570
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to avoid use-after-free issue in f2fs_filemap_fault
    https://git.kernel.org/jaegeuk/f2fs/c/eb70d5a6c932

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
