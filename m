Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE7B905787
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Jun 2024 17:56:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sHQKS-000056-K5;
	Wed, 12 Jun 2024 15:56:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sHQKR-00004x-F6
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 15:56:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tpTNRk60G08PG0e63S7FRO/+Rz32wrbrOBZ7OL596LI=; b=GZ5Vl/hTgmPXjfkqCiJANqyyQQ
 xE/vxq9k5X/aB/IfbbHxFdXVqKmDbD27w0NTIVICwFQG0rKBoHnzy78BeAvRjLbNmMdYjKL0tQB0k
 V2vgKhy2Hvm1ZZTsJqI/iyQpDGBzMapdGg01mkiZsMTKTWgoZ+go7866Y7aTnG7I6eU4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tpTNRk60G08PG0e63S7FRO/+Rz32wrbrOBZ7OL596LI=; b=OeEnKhfVR3rsRFSGq85BTPm2BV
 /k5qizZNEN42Ra8DZ3Ki0TgBn0wEoZW3xh85vgQw0q19g5vtCjvb1MlM3M59MBjHFLD+N7kbyDSuz
 i/h4ZPq1XgFzcNhp0psgAth4K4KMWhbAhZs3LYXn2Q3CdzWkLqJlo/iAtL38xow622Zc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sHQKR-0007Rj-Qo for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 15:56:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B1A93614C9;
 Wed, 12 Jun 2024 15:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F693C4AF48;
 Wed, 12 Jun 2024 15:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718207757;
 bh=InqFS4sAhFS4WS5r2v86I1PxxzLrtej/dKx5aTUSI7I=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=GFJWoRfekMfMC6zwSUbqWD52MqaKb2xn1cp3YFaIcDLXIf3dfm79BsBvq2f78C2W7
 5eIrd8bRlh7nC1ceKvNSt+m2R+Tx1zweMWfPvlSMcJO5T5Nyc7BmKzzOgRhT4IYhOP
 FVir2jWKu6YikbRhghh6d4Wl3+V4LOtaeJ0W23e8fi3/glAfJlwwZW5uAHC2ChUqD9
 ftc3PYUeZ2sH0Z1s5wECTqoUarvE2sjw+BH3E2ivq25GMSYP/0MBZCUxW3O0nFBDXB
 0wGRIze9QWU0qQJr6mOXZ6gyC1J3BoQsJoMmLvKHX9EDHhUl/SyThEZTjfWyij4emm
 sGf+TChXjLP3g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 15C6EC43619; Wed, 12 Jun 2024 15:55:57 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171820775708.32393.13954078092151830814.git-patchwork-notify@kernel.org>
Date: Wed, 12 Jun 2024 15:55:57 +0000
References: <20240521062318.976239-1-chao@kernel.org>
In-Reply-To: <20240521062318.976239-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 21 May 2024 14:23:17 +0800 you
 wrote: > syzbot reports a f2fs bug as below: > > [ cut here ] > kernel BUG
 at fs/f2fs/inline.c:258! > CPU: 1 PID: 34 Comm: kworker/u8:2 N [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
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
X-Headers-End: 1sHQKR-0007Rj-Qo
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix to do sanity check on
 F2FS_INLINE_DATA flag in inode during GC
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 syzbot+848062ba19c8782ca5c8@syzkaller.appspotmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 21 May 2024 14:23:17 +0800 you wrote:
> syzbot reports a f2fs bug as below:
> 
> ------------[ cut here ]------------
> kernel BUG at fs/f2fs/inline.c:258!
> CPU: 1 PID: 34 Comm: kworker/u8:2 Not tainted 6.9.0-rc6-syzkaller-00012-g9e4bc4bcae01 #0
> RIP: 0010:f2fs_write_inline_data+0x781/0x790 fs/f2fs/inline.c:258
> Call Trace:
>  f2fs_write_single_data_page+0xb65/0x1d60 fs/f2fs/data.c:2834
>  f2fs_write_cache_pages fs/f2fs/data.c:3133 [inline]
>  __f2fs_write_data_pages fs/f2fs/data.c:3288 [inline]
>  f2fs_write_data_pages+0x1efe/0x3a90 fs/f2fs/data.c:3315
>  do_writepages+0x35b/0x870 mm/page-writeback.c:2612
>  __writeback_single_inode+0x165/0x10b0 fs/fs-writeback.c:1650
>  writeback_sb_inodes+0x905/0x1260 fs/fs-writeback.c:1941
>  wb_writeback+0x457/0xce0 fs/fs-writeback.c:2117
>  wb_do_writeback fs/fs-writeback.c:2264 [inline]
>  wb_workfn+0x410/0x1090 fs/fs-writeback.c:2304
>  process_one_work kernel/workqueue.c:3254 [inline]
>  process_scheduled_works+0xa12/0x17c0 kernel/workqueue.c:3335
>  worker_thread+0x86d/0xd70 kernel/workqueue.c:3416
>  kthread+0x2f2/0x390 kernel/kthread.c:388
>  ret_from_fork+0x4d/0x80 arch/x86/kernel/process.c:147
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: fix to do sanity check on F2FS_INLINE_DATA flag in inode during GC
    https://git.kernel.org/jaegeuk/f2fs/c/fc01008c92f4
  - [f2fs-dev,2/2] f2fs: fix to do sanity check on blocks for inline_data inode
    https://git.kernel.org/jaegeuk/f2fs/c/c240c87bcd44

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
