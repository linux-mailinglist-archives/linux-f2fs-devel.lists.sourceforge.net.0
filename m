Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE6BB51019
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Sep 2025 09:58:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9sfpK5WThxGz8X0qSJsWDQVPehqXI9ttSrvt9M5Z0H4=; b=RFuo0Gz5B3L3D+jIstNRuckSJv
	PuhEmjQ3loiAVJIHeMXZxQUWK1j7/Y0ZfdrvjXwszGsBBo9uN9BN9BfXTUPCYvjM8j9MP2sMXTmfx
	8Ha28Vk8gph5aJ3zLxQ63MHN4MuUJ/6m6hjFR64iMhIQwdvqv1iEymCKRkVgTXIMeq2c=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uwFif-00051n-P4;
	Wed, 10 Sep 2025 07:58:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uwFid-00051g-QI
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Sep 2025 07:58:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I7lYu5+AomPTCV9sTT4gI6Xlo5rJWPX7K6YXhgVtqeo=; b=K7r3EsgaXPDnNOMphqd5gvizvM
 qVhM0kxlEipD+KIQsZED7ZFYS0wvdGKw3X5K62lHLgENMG6KQrupxzLYcJW/ZmxMQuXWKaoDgLrCS
 q9w/2EreignAbXu0ATsOzCaKZsHhxiCKy88F0hWh/jLNncBBSE5HmozEDiIZu3kwgr5s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I7lYu5+AomPTCV9sTT4gI6Xlo5rJWPX7K6YXhgVtqeo=; b=SO6XNdtmKsohU3cGgaiVBTe0qr
 pmoKD4pql0/jG+lM6pRknJ/NqFchIKAOEIiLbbKZF+C4mQUohJhwbG0TvIlgS9A6EEpQ7zk/ESLaO
 1PxAgyc1aUToKVYJ7dgo7yjA4i0WbqMWNy656n/xBUuAT5w7xM71bO0vPUJD9l042iDA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uwFid-0004oh-14 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Sep 2025 07:58:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AFD0E449A1;
 Wed, 10 Sep 2025 07:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F6E9C4CEF5;
 Wed, 10 Sep 2025 07:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757491088;
 bh=LztD8EweTcKzQwfThVrDf5vHXn1Xuy8jy9vRPLZPWHM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=jVDKA8WCeQzXTghD9Y1h1TXSnVLZ4wu1cJ+PPuTu199VG9c0tr4UAOE1K6LU6OrgM
 ryfbrgQd9aXCZy46bOYE6+XS4AiNEdgfqXcX/j9FgmPF7b3NO88SBRjI700becCoYM
 8EFn/LbIyOz/Ugq9SK9Qz+XvRWrk08+L6sSyVJM/G5hQSnV3Mrw3E1Ss1itZp1cy4b
 wcu2VJX63oU3u3AvcJrgA+Z4Bes1BH39V4/dBROfUI54NYdBJrbyiDSciEzslU+5+T
 xYXz93Q9cUG5d5/99JDJdmXuBloeq66YyNsfRzLqM80z55TpRCqx//rQ4CZpcfVt00
 LzmIPaIfC1R2g==
Message-ID: <8ccaa1f0-3263-41a9-b2e5-bf540be979c7@kernel.org>
Date: Wed, 10 Sep 2025 15:58:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot <syzbot+90266696fe5daacebd35@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <68c09802.050a0220.3c6139.000e.GAE@google.com>
Content-Language: en-US
In-Reply-To: <68c09802.050a0220.3c6139.000e.GAE@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: #syz test:
 https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git
 bugfix/syzbot On 9/10/25 05:11, syzbot wrote: > Hello, > > syzbot found the
 following issue on: > > HEAD commit: f777d1112ee5 Merge tag
 'vfs-6.17-rc6.fixes'
 of git://git.k.. > git tree: upstream > console output: h [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uwFid-0004oh-14
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in clear_inode (4)
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

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot

On 9/10/25 05:11, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    f777d1112ee5 Merge tag 'vfs-6.17-rc6.fixes' of git://git.k..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=124dad62580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=429771c55b615e85
> dashboard link: https://syzkaller.appspot.com/bug?extid=90266696fe5daacebd35
> compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15a43562580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=164dad62580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/860ff2f591a4/disk-f777d111.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/31f4ca3a76d4/vmlinux-f777d111.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/c534fac91a74/bzImage-f777d111.xz
> mounted in repro: https://storage.googleapis.com/syzbot-assets/6c7a25c90276/mount_0.gz
>   fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=11a43562580000)
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+90266696fe5daacebd35@syzkaller.appspotmail.com
> 
> loop0: detected capacity change from 0 to 40427
> F2FS-fs (loop0): Wrong SSA boundary, start(3584) end(4096) blocks(3072)
> F2FS-fs (loop0): Can't find valid F2FS filesystem in 1th superblock
> F2FS-fs (loop0): invalid crc value
> F2FS-fs (loop0): f2fs_convert_inline_folio: corrupted inline inode ino=3, i_addr[0]:0x1601, run fsck to fix.
> ------------[ cut here ]------------
> kernel BUG at fs/inode.c:753!
> Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
> CPU: 0 UID: 0 PID: 6097 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025
> RIP: 0010:clear_inode+0x169/0x190 fs/inode.c:753
> Code: 4c 89 f7 e8 59 7a ec ff e9 60 ff ff ff 44 89 f1 80 e1 07 80 c1 03 38 c1 7c c0 4c 89 f7 e8 2f 7b ec ff eb b6 e8 28 40 8d ff 90 <0f> 0b e8 20 40 8d ff 90 0f 0b e8 18 40 8d ff 90 0f 0b e8 10 40 8d
> RSP: 0018:ffffc9000408f890 EFLAGS: 00010293
> RAX: ffffffff82311f78 RBX: ffff888022059300 RCX: ffff888024ced940
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: ffffc9000408fa00 R08: 0000000000000000 R09: 0000000000000000
> R10: dffffc0000000000 R11: fffffbfff1e3ab47 R12: dffffc0000000000
> R13: ffff888022059300 R14: ffff888022059558 R15: 0000000000000001
> FS:  000055557dd70500(0000) GS:ffff8881268bf000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000055738e9e8660 CR3: 0000000029a1c000 CR4: 00000000003526f0
> Call Trace:
>  <TASK>
>  evict+0x504/0x9c0 fs/inode.c:810
>  f2fs_fill_super+0x5612/0x6fa0 fs/f2fs/super.c:5047
>  get_tree_bdev_flags+0x40e/0x4d0 fs/super.c:1692
>  vfs_get_tree+0x8f/0x2b0 fs/super.c:1815
>  do_new_mount+0x2a2/0x9e0 fs/namespace.c:3808
>  do_mount fs/namespace.c:4136 [inline]
>  __do_sys_mount fs/namespace.c:4347 [inline]
>  __se_sys_mount+0x317/0x410 fs/namespace.c:4324
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f865d77038a
> Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 de 1a 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007ffc62ec72e8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
> RAX: ffffffffffffffda RBX: 00007ffc62ec7370 RCX: 00007f865d77038a
> RDX: 0000200000000140 RSI: 00002000000000c0 RDI: 00007ffc62ec7330
> RBP: 0000200000000140 R08: 00007ffc62ec7370 R09: 0000000000000008
> R10: 0000000000000008 R11: 0000000000000246 R12: 00002000000000c0
> R13: 00007ffc62ec7330 R14: 0000000000005531 R15: 00002000000056c0
>  </TASK>
> Modules linked in:
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:clear_inode+0x169/0x190 fs/inode.c:753
> Code: 4c 89 f7 e8 59 7a ec ff e9 60 ff ff ff 44 89 f1 80 e1 07 80 c1 03 38 c1 7c c0 4c 89 f7 e8 2f 7b ec ff eb b6 e8 28 40 8d ff 90 <0f> 0b e8 20 40 8d ff 90 0f 0b e8 18 40 8d ff 90 0f 0b e8 10 40 8d
> RSP: 0018:ffffc9000408f890 EFLAGS: 00010293
> RAX: ffffffff82311f78 RBX: ffff888022059300 RCX: ffff888024ced940
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: ffffc9000408fa00 R08: 0000000000000000 R09: 0000000000000000
> R10: dffffc0000000000 R11: fffffbfff1e3ab47 R12: dffffc0000000000
> R13: ffff888022059300 R14: ffff888022059558 R15: 0000000000000001
> FS:  000055557dd70500(0000) GS:ffff8881268bf000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000055738e9e8660 CR3: 0000000029a1c000 CR4: 00000000003526f0
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
