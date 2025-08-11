Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3FFB206D5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Aug 2025 13:05:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yEG1jJ08I58TblE8EPVlBQ5na3YzBQ/8tCfzKeccO4M=; b=UaKMeg6RR0Yb3g4KSbh7ynZb08
	2sUkQrvBCxdwXKU7iliO0cVQH5N5aJwErKxT0Hokl5dGZTdF/nZh6IuwMqKJhkVFMTH4Bcyj91hOd
	h7rjuQPjcfHJcPD81n2eF1ErZYweGS1RgV+qQL6BPIqlUpMKOpDLdqjXoighkVj1gf7M=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ulQLH-0002Dy-B0;
	Mon, 11 Aug 2025 11:05:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ulQLF-0002Dn-Im
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 11:05:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yA+Jsk9IpFVxbNFoTjSGoy1/zJzZV3lqHRIUKf9DVBE=; b=V7ISVKm4hcb7S1I0Fp2SuxR3ws
 gAIGFRMoe1Op68lcodF/pOKK46ybAOJFfpJXk86laT3jHpcyuttUFpSTXRzdpewb3Z+TBig68Akmw
 Xai0Ukeie6ZaNUD7ep8J1a1x5vIlnNo2K8HClH6ajE9SKZM8Va57F5CcCI4If8ojsKeg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yA+Jsk9IpFVxbNFoTjSGoy1/zJzZV3lqHRIUKf9DVBE=; b=YBSWHdLUmPTJLl9PCqJfZxOAYH
 eGGnZByteY0SvAw3C+C5oLAj59KwlftB/pU3Wuk2Q936eL5MP/65yirgwQsfmPtGwMg6eC+sEO+f8
 qosjz8VcquVhnXJzyJWsjsrDcd1C9Qaga9NP0NAZCsp4+BDEpwYRph7/yqdsbLwcizRs=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ulQLF-0007nK-N5 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 11:05:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D2E19600BB;
 Mon, 11 Aug 2025 11:05:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347CDC4CEED;
 Mon, 11 Aug 2025 11:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754910314;
 bh=zUpaZvR3LQEZeQi8NwqiAzj3ihUiOSHvoNtQpuWRYQ0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=teqqIOa62CRt3zCausdzCDXqss++uH+y9awBNb6jckHxKi/qfAcIqRBoqhQg/YMAT
 Wp0rQwgKa8hdTSUwYoqk/YBXu2qZW4IxlB+dvmwo8W60yVFIPXnUFBJpdoEhszZV7X
 Vf0MQOdqD+X4xI5Cdg3ehTTKvBdue/GUNT9ehSx4CbIBjh4aUUSXtSe3dQhKD1NbCe
 ft5IWiwEwjppxDbZE25szoQjTG6VsPo8RZoj7TuymKagRkGp6sJ2Kfbv6YMRJv0uBu
 yxt2W/jnpLsjyicIneINvkRVqMzUhaBvFbMIu00Hqv4BMIn/yyVojSTOZjm/sItf4Z
 qHGUZ3yFNfZtA==
Message-ID: <63224c9f-fb95-4aa4-b27e-56801d249771@kernel.org>
Date: Mon, 11 Aug 2025 19:05:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot <syzbot+803dd716c4310d16ff3a@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <67fe69c5.050a0220.186b78.0002.GAE@google.com>
Content-Language: en-US
In-Reply-To: <67fe69c5.050a0220.186b78.0002.GAE@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: #syz test:
 https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git
 bugfix/common On 4/15/25 22:14, syzbot wrote: > syzbot has found a reproducer
 for the following issue on: > > HEAD commit: 834a4a689699 Merge tag
 'for-linus'
 of git://git.kernel.org.. > git tree: upstream > console [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ulQLF-0007nK-N5
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_write_end_io
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common

On 4/15/25 22:14, syzbot wrote:
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    834a4a689699 Merge tag 'for-linus' of git://git.kernel.org..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=10051a3f980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=a972ee73c2fcf8ca
> dashboard link: https://syzkaller.appspot.com/bug?extid=803dd716c4310d16ff3a
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=145a2fe4580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13382470580000
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-834a4a68.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/4454365a3050/vmlinux-834a4a68.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/2d99dbd9f6f4/bzImage-834a4a68.xz
> mounted in repro: https://storage.googleapis.com/syzbot-assets/89819a66cafe/mount_0.gz
>   fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=13420b98580000)
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+803dd716c4310d16ff3a@syzkaller.appspotmail.com
> 
> ------------[ cut here ]------------
> kernel BUG at fs/f2fs/data.c:358!
> Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
> CPU: 0 UID: 0 PID: 1033 Comm: kworker/u4:5 Not tainted 6.15.0-rc2-syzkaller-00037-g834a4a689699 #0 PREEMPT(full) 
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
> Workqueue: loop0 loop_rootcg_workfn
> RIP: 0010:f2fs_write_end_io+0x77a/0x790 fs/f2fs/data.c:357
> Code: e8 fb d8 f0 fd e9 a2 fa ff ff 89 d9 80 e1 07 38 c1 0f 8c fe fa ff ff 48 89 df e8 81 d8 f0 fd e9 f1 fa ff ff e8 d7 9e 86 fd 90 <0f> 0b e8 9f 0a f4 07 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00
> RSP: 0000:ffffc90002597320 EFLAGS: 00010093
> RAX: ffffffff843cb659 RBX: 0000000000000000 RCX: ffff888035d74880
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000000000000a
> RBP: ffffc90002597430 R08: ffffffff843cb306 R09: 1ffffd4000219d7d
> R10: dffffc0000000000 R11: fffff94000219d7e R12: 0000000000000001
> R13: dffffc0000000000 R14: 000000000000000a R15: ffffea00010cebc0
> FS:  0000000000000000(0000) GS:ffff88808c593000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f7f3f420000 CR3: 00000000430fc000 CR4: 0000000000352ef0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  blk_update_request+0x5e5/0x1160 block/blk-mq.c:983
>  blk_mq_end_request+0x3e/0x70 block/blk-mq.c:1145
>  blk_flush_complete_seq+0x6bd/0xcf0 block/blk-flush.c:191
>  flush_end_io+0xab4/0xdc0 block/blk-flush.c:250
>  __blk_mq_end_request+0x492/0x5d0 block/blk-mq.c:1135
>  loop_handle_cmd drivers/block/loop.c:1960 [inline]
>  loop_process_work+0x1bdf/0x21d0 drivers/block/loop.c:1978
>  process_one_work kernel/workqueue.c:3238 [inline]
>  process_scheduled_works+0xac3/0x18e0 kernel/workqueue.c:3319
>  worker_thread+0x870/0xd50 kernel/workqueue.c:3400
>  kthread+0x7b7/0x940 kernel/kthread.c:464
>  ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>  </TASK>
> Modules linked in:
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:f2fs_write_end_io+0x77a/0x790 fs/f2fs/data.c:357
> Code: e8 fb d8 f0 fd e9 a2 fa ff ff 89 d9 80 e1 07 38 c1 0f 8c fe fa ff ff 48 89 df e8 81 d8 f0 fd e9 f1 fa ff ff e8 d7 9e 86 fd 90 <0f> 0b e8 9f 0a f4 07 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00
> RSP: 0000:ffffc90002597320 EFLAGS: 00010093
> RAX: ffffffff843cb659 RBX: 0000000000000000 RCX: ffff888035d74880
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000000000000a
> RBP: ffffc90002597430 R08: ffffffff843cb306 R09: 1ffffd4000219d7d
> R10: dffffc0000000000 R11: fffff94000219d7e R12: 0000000000000001
> R13: dffffc0000000000 R14: 000000000000000a R15: ffffea00010cebc0
> FS:  0000000000000000(0000) GS:ffff88808c593000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f7f3f420000 CR3: 00000000430fc000 CR4: 0000000000352ef0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> 
> 
> ---
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
