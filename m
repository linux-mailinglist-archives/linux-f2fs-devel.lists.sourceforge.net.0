Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDBF709B46
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 May 2023 17:24:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q01y0-0000oe-HP;
	Fri, 19 May 2023 15:24:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q01xx-0000oV-Bs
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 May 2023 15:24:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fa4In9KhQpKJ5/UvXhlIaX48Qj0etA6pT83ltf9USVc=; b=Anfo5jQmsO2xVpe+CHsHNOvmII
 mdedWHxq1teIfvmKz334OlqxIshtqYVvWV+z7pKJMOtA9oP9tTG8D7dvNH33mtgKM1D9iZE1f8fA7
 A+oT9XfF+aO30BGaZl84YqN2sCZnC3InJcl1nxj7rpQLOY1HfD+N3djlFSMbOAzM0IN0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Fa4In9KhQpKJ5/UvXhlIaX48Qj0etA6pT83ltf9USVc=; b=KRUUdgHWMQp2PyaM4YLFWPkMXv
 PiihjsZZ2S2ijf25fdsFtM4GwsCkLankaMceGtlHIIpKr0sY171ZbyZlYZWYdHSjzfYaZgE5aIX5x
 1xpxigjbRcxg2Wz/QfMQjwuauamx0ujtD6XIeq+yTfNLKVO61IovPHOT05b6B7og7+yo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q01xw-00DSXd-Th for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 May 2023 15:24:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7C6B76589B;
 Fri, 19 May 2023 15:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DBD1C433EF;
 Fri, 19 May 2023 15:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684509858;
 bh=DY1tUdC1aAkwLYfr0L4Lv88tGfIAg79qybPXm9N1IzA=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=qAK1O/0V7h9Bw+L0GjWPcCAZm4TfU6jm+rkUrpb09T4Psf3LGiDnq392/wUyAEpO8
 Am3DQqvX/yXO2/vDIdeL2J3S1Fq7fpqpg0GfVvy26vHXUJ0oyZPJSTZMyRoT95oted
 nDCOZCPV44TbQRd8m/EMU06ke+cQyJe+bnPQL7Y0OHBrtY2KFdRnYvySwcVx6AY1Ka
 kUWFQIzT30OPFqhhmfr74zMfgtwydzej+u7Lg/+TYFb6uydvk6EDNJOdA0nozu6600
 CxRlCadD9eoBv4W3W9Z77XcxFp2aYSpGYVsLQFHwh0+EtDuCAvU8eu1G3uD3G4h3tX
 esTzI4z0rgFXw==
Message-ID: <986151e4-66ef-b76d-f66d-318017f34b5d@kernel.org>
Date: Fri, 19 May 2023 23:24:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: butt3rflyh4ck <butterflyhuangxx@gmail.com>
References: <CAFcO6XMJC=u5aASRNCqfVi7tJwDJBYGCw5i13M-R8zXdB9-8Ew@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAFcO6XMJC=u5aASRNCqfVi7tJwDJBYGCw5i13M-R8zXdB9-8Ew@mail.gmail.com>
X-Spam-Score: -6.7 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, Thanks for the report,
 it will be helpful if you can provide
 a reproducer. On 2023/5/19 15:13, butt3rflyh4ck wrote: > Hi,
 there is a null-ptr-deref
 bug in f2fs_write_end_io in > fs/f2fs/data.c, I reproduce it in the latest
 kernel too. > > #Quick description > When a thread a [...] 
 Content analysis details:   (-6.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q01xw-00DSXd-Th
Subject: Re: [f2fs-dev] A null-ptr-deref bug in f2fs_write_end_io
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

Thanks for the report, it will be helpful if you can provide a
reproducer.

On 2023/5/19 15:13, butt3rflyh4ck wrote:
> Hi, there is a null-ptr-deref  bug in f2fs_write_end_io in
> fs/f2fs/data.c, I reproduce it in the latest kernel too.
> 
> #Quick description
> When a thread always calls F2FS_IOC_RESIZE_FS to  resize fs, if resize
> fs is failed, f2fs kernel thread would  invoke callback function to
> update
> f2fs io info, it would call  f2fs_write_end_io and may trigger
> null-ptr-deref in NODE_MAPPING.
> ```
> static inline struct address_space *NODE_MAPPING(struct f2fs_sb_info *sbi)
> {
> return sbi->node_inode->i_mapping;
> }
> ```
> there is deref in sbi.
> 
> #crash log
> ----------------------------------------
> general protection fault, probably for non-canonical address
> 0xdffffc0000000006: 0000 [#1] PREEMPT SMP KASAN
> KASAN: null-ptr-deref in range [0x0000000000000030-0x0000000000000037]
> CPU: 0 PID: 17 Comm: ksoftirqd/0 Not tainted 6.4.0-rc1 #18
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
> RIP: 0010:NODE_MAPPING fs/f2fs/f2fs.h:1972 [inline]
> RIP: 0010:f2fs_write_end_io+0x727/0x1050 fs/f2fs/data.c:370
> Code: 00 00 48 89 f8 48 c1 e8 03 80 3c 18 00 0f 85 b3 07 00 00 48 8b
> 44 24 08 4c 8b a8 60 01 00 00 49 8d 7d 30 48 89 f8 48 c1 e8 03 <80> 3c
> 18 00 0f 85 9c 07 00 00 4d 3b 75 30 0f 84 10 04 00 00 e8 10
> RSP: 0018:ffffc9000042fc78 EFLAGS: 00010216
> RAX: 0000000000000006 RBX: dffffc0000000000 RCX: 0000000000000100
> RDX: ffff888013d18000 RSI: ffffffff83a93a4d RDI: 0000000000000030
> RBP: ffffea00009e6900 R08: 0000000000000001 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: ffffea00009e6900
> R13: 0000000000000000 R14: ffff88802a3cec48 R15: 0000000000000000
> FS:  0000000000000000(0000) GS:ffff88802ca00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000555faf194000 CR3: 00000000251bd000 CR4: 0000000000750ef0
> PKRU: 55555554
> Call Trace:
>   <TASK>
>   bio_endio+0x5af/0x6c0 block/bio.c:1608
>   req_bio_endio block/blk-mq.c:761 [inline]
>   blk_update_request+0x5cc/0x1690 block/blk-mq.c:906
>   blk_mq_end_request+0x59/0x4c0 block/blk-mq.c:1023
>   lo_complete_rq+0x1c6/0x280 drivers/block/loop.c:370
>   blk_complete_reqs+0xad/0xe0 block/blk-mq.c:1101
>   __do_softirq+0x1d4/0x8ef kernel/softirq.c:571
>   run_ksoftirqd kernel/softirq.c:939 [inline]
>   run_ksoftirqd+0x31/0x60 kernel/softirq.c:931
>   smpboot_thread_fn+0x659/0x9e0 kernel/smpboot.c:164
>   kthread+0x33e/0x440 kernel/kthread.c:379
>   ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308
>   </TASK>
> Modules linked in:
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:NODE_MAPPING fs/f2fs/f2fs.h:1972 [inline]
> RIP: 0010:f2fs_write_end_io+0x727/0x1050 fs/f2fs/data.c:370
> Code: 00 00 48 89 f8 48 c1 e8 03 80 3c 18 00 0f 85 b3 07 00 00 48 8b
> 44 24 08 4c 8b a8 60 01 00 00 49 8d 7d 30 48 89 f8 48 c1 e8 03 <80> 3c
> 18 00 0f 85 9c 07 00 00 4d 3b 75 30 0f 84 10 04 00 00 e8 10
> RSP: 0018:ffffc9000042fc78 EFLAGS: 00010216
> RAX: 0000000000000006 RBX: dffffc0000000000 RCX: 0000000000000100
> RDX: ffff888013d18000 RSI: ffffffff83a93a4d RDI: 0000000000000030
> RBP: ffffea00009e6900 R08: 0000000000000001 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: ffffea00009e6900
> R13: 0000000000000000 R14: ffff88802a3cec48 R15: 0000000000000000
> FS:  0000000000000000(0000) GS:ffff88802ca00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000555faf194000 CR3: 00000000251bd000 CR4: 0000000000750ef0
> PKRU: 55555554
> -----------------------
> 
> # new crash log in latest kernel
> ---------------------
> [  193.695164][ T8174] loop0: detected capacity change from 0 to 264192
> [  193.696467][ T8174] F2FS-fs (loop0): Magic Mismatch,
> valid(0xf2f52010) - read(0x0)
> [  193.696875][ T8174] F2FS-fs (loop0): Can't find valid F2FS
> filesystem in 2th superblock
> [  193.698363][ T8174] F2FS-fs (loop0): invalid crc_offset: 0
> [  193.700454][ T8174] F2FS-fs (loop0): Disable nat_bits due to
> incorrect cp_ver (4542359912962316977, 0)
> [  193.716594][ T8174] F2FS-fs (loop0): Try to recover 2th superblock, ret: 0
> [  193.717102][ T8174] F2FS-fs (loop0): Mounted with checkpoint
> version = 3e17dab1
> [  193.743330][ T8174] F2FS-fs (loop0): For resize: curseg of type 0: 46 ==> 4
> [  193.743904][ T8174] F2FS-fs (loop0): For resize: curseg of type 3: 52 ==> 6
> [  193.745690][ T8174] F2FS-fs (loop0): For resize: curseg of type 4: 50 ==> 8
> [  193.746108][ T8174] F2FS-fs (loop0): For resize: curseg of type 5: 48 ==> 10
> [  193.751857][ T8174] F2FS-fs (loop0): resize_fs failed, should run
> fsck to repair!
> [  193.780283][    C0] general protection fault, probably for
> non-canonical address 0xdffffc0000000006: 0000 [#1] PREEMPT SMP KASAN
> [  193.781027][    C0] KASAN: null-ptr-deref in range
> [0x0000000000000030-0x0000000000000037]
> [  193.781572][    C0] CPU: 0 PID: 17 Comm: ksoftirqd/0 Not tainted
> 6.4.0-rc2-00163-g2d1bcbc6cd70-dirty #17
> [  193.782201][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX,
> 1996), BIOS 1.15.0-1 04/01/2014
> [  193.782727][    C0] RIP: 0010:f2fs_write_end_io+0x727/0x1050
> [  193.783083][    C0] Code: 00 00 48 89 f8 48 c1 e8 03 80 3c 18 00 0f
> 85 b3 07 00 00 48 8b 44 24 08 4c 8b a8 60 01 00 00 49 8d 7d 30 48 89
> f8 48 c1 e8 03 <80> 3c 18 00 0f 85 9c 07 00 00 4d 3b 75 30 0f 0
> [  193.784268][    C0] RSP: 0018:ffffc9000042fc78 EFLAGS: 00010216
> [  193.784629][    C0] RAX: 0000000000000006 RBX: dffffc0000000000
> RCX: 0000000000000100
> [  193.785109][    C0] RDX: ffff888013d18000 RSI: ffffffff83a9588d
> RDI: 0000000000000030
> [  193.785576][    C0] RBP: ffffea000143e740 R08: 0000000000000001
> R09: 0000000000000000
> [  193.786051][    C0] R10: 0000000000000000 R11: 0000000000000000
> R12: ffffea000143e740
> [  193.786571][    C0] R13: 0000000000000000 R14: ffff888041423738
> R15: 0000000000000000
> [  193.787055][    C0] FS:  0000000000000000(0000)
> GS:ffff88802ca00000(0000) knlGS:0000000000000000
> [  193.787620][    C0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  193.787997][    C0] CR2: 000056056fd87000 CR3: 000000001b546000
> CR4: 00000000000006f0
> [  193.788585][    C0] Call Trace:
> [  193.788863][    C0]  <TASK>
> [  193.789115][    C0]  ? bio_uninit+0x1b7/0x410
> [  193.789509][    C0]  ? f2fs_write_end+0xa80/0xa80
> [  193.790053][    C0]  bio_endio+0x5af/0x6c0
> [  193.790522][    C0]  blk_update_request+0x5cc/0x1690
> [  193.791171][    C0]  blk_mq_end_request+0x59/0x4c0
> [  193.791695][    C0]  lo_complete_rq+0x1c6/0x280
> [  193.792247][    C0]  blk_complete_reqs+0xad/0xe0
> [  193.792759][    C0]  __do_softirq+0x1d4/0x8ef
> [  193.793312][    C0]  ? __irq_exit_rcu+0x190/0x190
> [  193.793805][    C0]  run_ksoftirqd+0x31/0x60
> [  193.794183][    C0]  smpboot_thread_fn+0x659/0x9e0
> [  193.794576][    C0]  ? sort_range+0x30/0x30
> [  193.794900][    C0]  kthread+0x33e/0x440
> [  193.795263][    C0]  ? kthread_complete_and_exit+0x40/0x40
> [  193.795907][    C0]  ret_from_fork+0x1f/0x30
> [  193.796324][    C0]  </TASK>
> [  193.796689][    C0] Modules linked in:
> [  193.797189][    C0] ---[ end trace 0000000000000000 ]---
> [  193.797635][    C0] RIP: 0010:f2fs_write_end_io+0x727/0x1050
> [  193.798182][    C0] Code: 00 00 48 89 f8 48 c1 e8 03 80 3c 18 00 0f
> 85 b3 07 00 00 48 8b 44 24 08 4c 8b a8 60 01 00 00 49 8d 7d 30 48 89
> f8 48 c1 e8 03 <80> 3c 18 00 0f 85 9c 07 00 00 4d 3b 75 30 0f 0
> [  193.799559][    C0] RSP: 0018:ffffc9000042fc78 EFLAGS: 00010216
> [  193.799945][    C0] RAX: 0000000000000006 RBX: dffffc0000000000
> RCX: 0000000000000100
> [  193.800329][    C0] RDX: ffff888013d18000 RSI: ffffffff83a9588d
> RDI: 0000000000000030
> [  193.800666][    C0] RBP: ffffea000143e740 R08: 0000000000000001
> R09: 0000000000000000
> [  193.801047][    C0] R10: 0000000000000000 R11: 0000000000000000
> R12: ffffea000143e740
> [  193.801503][    C0] R13: 0000000000000000 R14: ffff888041423738
> R15: 0000000000000000
> [  193.802069][    C0] FS:  0000000000000000(0000)
> GS:ffff88802ca00000(0000) knlGS:0000000000000000
> [  193.802804][    C0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  193.803356][    C0] CR2: 000056056fd87000 CR3: 000000001b546000
> CR4: 00000000000006f0
> [  193.804046][    C0] Kernel panic - not syncing: Fatal exception in interrupt
> [  193.804748][    C0] Kernel Offset: disabled
> [  193.805086][    C0] Rebooting in 86400 seconds..
> ----------------------------
> 
> If needed, I would provide reproduce.
> 
> Regards,
>   butt3rflyh4ck.
> 
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
