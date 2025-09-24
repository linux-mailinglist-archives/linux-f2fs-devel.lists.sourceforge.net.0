Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38342B98137
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Sep 2025 04:34:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQuHZ4GZ7X1PrNt8vBM6fW0wsTgAoMnTZpjCSYP9Ygg=; b=VfBEDgeY4s9SQFaq22HXNmyhvv
	BuHKaORBxEqrn2DX5aPUnHtBEYbIPSNEKYXxf67c+zn4NQ7Nh1RoCWb7nrIG1aVqYgTiGsh5PhgDg
	xMlTo/DGxcN9XXFWsm1AkfpKmPH6Q1B2bLbNAUyYyJXgFD7L8MchNVxAT2TpioNKSgg0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1FKq-0000BN-8z;
	Wed, 24 Sep 2025 02:34:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v1FKo-0000BB-NE
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 02:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6joV5Hq4NaYwoCSznjUO3CXWlNfB8tnOXVped7fOB6A=; b=gWzhJTLWm51dmuaWRvJZ5bXfkM
 rQqc7T8VEkhsKUqqzsOcCW3pqcY/8kSPshLJh/4/N/4CnDx0VCckdPn//+r7KnLiflpu+zMRA+g9Y
 wLHvP8mkOz+UWs8SzEy2ppRWLuFiqkQWL/6jqdV0iQBcV1epe5UvhULLoNjHcAzazYWU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:
 Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6joV5Hq4NaYwoCSznjUO3CXWlNfB8tnOXVped7fOB6A=; b=jr4zkinVvRxkIgtfeUuWs4t0Z/
 v2nMT8EY7QGroXJMNbCar+ohx0IzMvnjdB23uZsVBAyY/H0swoulGa3ToImqEAPHZeffMflMf0CI/
 6yNlCJC0lmsQGdMRx+hxFR/EahxAwila9zCly/lzT9S72wZnuYpZZ2QytBHfV9ICBID8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v1FKn-0005ID-U5 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 02:34:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 84B3344644;
 Wed, 24 Sep 2025 02:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE485C4CEF5;
 Wed, 24 Sep 2025 02:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758681251;
 bh=vHHMsm2dCasDT7uIVbVwJCTzX4UJX8VrNY0CTWRiC7M=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=TGrkK//HIsqtO4cQo1Hb2Dfb1IqzSD8QDLYZEKNrb9r3DIOeQKfsD47j7Unq9qrIA
 kFiZeBSvPr7BVT/pnFZPEWCrZW1iYO/OGQRslBvB1YNxhdAgoEYsUmrorS7+bhjvaf
 s21EP4+2ueYL17ZwhTVqZcL6B4DbsAzJhYFuIkqX4XBnWss2cIaOOkcp2k1GhSP/aw
 Nyi0k02wZpnso/sFgvayqtPmpPgTBhEsQ+FrsvQj6N8uMZaCqZG6zlYncX0maVHB7Z
 XHyrfX13yKEaNTEX8q6uIB+MVZ6W6ibPcobRma91LS7nuBGjWdkLSgqYNqJJSd23oS
 uliofMYluAxKA==
Message-ID: <1c900b10-d610-4077-bad5-05e1d9f0d7fe@kernel.org>
Date: Wed, 24 Sep 2025 10:34:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot <syzbot+bcdfadd9bda9988fa52a@syzkaller.appspotmail.com>,
 hch@lst.de, jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <684f0067.050a0220.be214.02c2.GAE@google.com>
Content-Language: en-US
In-Reply-To: <684f0067.050a0220.be214.02c2.GAE@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: #syz fix f2fs: Fix __write_node_folio() conversion On
 6/16/2025
 1:18 AM, syzbot wrote: > Hello, > > syzbot found the following issue on:
 > > HEAD commit: 488ef3560196 KEYS: Invert FINAL_PUT bit > git tree: upstream
 > console+strace: https://syzkaller. [...] 
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
X-Headers-End: 1v1FKn-0005ID-U5
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_sync_node_pages
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

#syz fix f2fs: Fix __write_node_folio() conversion

On 6/16/2025 1:18 AM, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    488ef3560196 KEYS: Invert FINAL_PUT bit
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=10e06d70580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=162faeb2d1eaefb4
> dashboard link: https://syzkaller.appspot.com/bug?extid=bcdfadd9bda9988fa52a
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13423682580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17423682580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/9bcad4b7e6e0/disk-488ef356.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/9ed0e62aacc9/vmlinux-488ef356.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/2e5e305c130c/bzImage-488ef356.xz
> mounted in repro: https://storage.googleapis.com/syzbot-assets/ed472c7ffb63/mount_0.gz
>    fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=16b74e0c580000)
> 
> The issue was bisected to:
> 
> commit 80f31d2a7e5f4efa7150c951268236c670bcb068
> Author: Christoph Hellwig <hch@lst.de>
> Date:   Thu May 8 05:14:32 2025 +0000
> 
>      f2fs: return bool from __write_node_folio
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=149f3682580000
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=169f3682580000
> console output: https://syzkaller.appspot.com/x/log.txt?x=129f3682580000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+bcdfadd9bda9988fa52a@syzkaller.appspotmail.com
> Fixes: 80f31d2a7e5f ("f2fs: return bool from __write_node_folio")
> 
>   f2fs_get_new_data_folio+0x138/0x870 fs/f2fs/data.c:1363
>   f2fs_add_regular_entry+0x5a3/0xc10 fs/f2fs/dir.c:702
>   f2fs_add_dentry+0xda/0x1d0 fs/f2fs/dir.c:771
>   f2fs_do_add_link+0x20f/0x3b0 fs/f2fs/dir.c:810
>   f2fs_add_link fs/f2fs/f2fs.h:3717 [inline]
>   f2fs_create+0x337/0x5c0 fs/f2fs/namei.c:380
> page last free pid 5818 tgid 5818 stack trace:
>   reset_page_owner include/linux/page_owner.h:25 [inline]
>   free_pages_prepare mm/page_alloc.c:1248 [inline]
>   __free_frozen_pages+0xc65/0xe60 mm/page_alloc.c:2706
>   __folio_put+0x21b/0x2c0 mm/swap.c:112
>   pipe_buf_release include/linux/pipe_fs_i.h:282 [inline]
>   pipe_update_tail fs/pipe.c:242 [inline]
>   anon_pipe_read+0x643/0x1040 fs/pipe.c:361
>   new_sync_read fs/read_write.c:491 [inline]
>   vfs_read+0x4d0/0x980 fs/read_write.c:572
>   ksys_read+0x145/0x250 fs/read_write.c:715
>   do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>   do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> ------------[ cut here ]------------
> kernel BUG at mm/filemap.c:1498!
> Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
> CPU: 0 UID: 0 PID: 12 Comm: kworker/u8:0 Not tainted 6.16.0-rc1-syzkaller-00005-g488ef3560196 #0 PREEMPT(full)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
> Workqueue: writeback wb_workfn (flush-7:0)
> RIP: 0010:folio_unlock+0x13d/0x160 mm/filemap.c:1498
> Code: de c8 ff 48 89 df 48 c7 c6 a0 36 94 8b e8 cb 6d 0e 00 90 0f 0b e8 13 de c8 ff 48 89 df 48 c7 c6 c0 2c 94 8b e8 b4 6d 0e 00 90 <0f> 0b e8 fc dd c8 ff 48 89 df 48 c7 c6 a0 36 94 8b e8 9d 6d 0e 00
> RSP: 0018:ffffc90000116e28 EFLAGS: 00010246
> RAX: ee13dd9e63919500 RBX: ffffea0001d33080 RCX: 0000000000000000
> RDX: 0000000000000006 RSI: ffffffff8d96d7f4 RDI: 00000000ffffffff
> RBP: ffffc90000117110 R08: ffffffff8f9fdef7 R09: 1ffffffff1f3fbde
> R10: dffffc0000000000 R11: fffffbfff1f3fbdf R12: 1ffffd40003a6611
> R13: 00fff00000004018 R14: ffffea0001d33088 R15: dffffc0000000000
> FS:  0000000000000000(0000) GS:ffff888125c86000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fa0ebcd1130 CR3: 0000000031646000 CR4: 00000000003526f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>   <TASK>
>   f2fs_sync_node_pages+0x180a/0x1a10 fs/f2fs/node.c:2081
>   f2fs_write_node_pages+0x303/0x6e0 fs/f2fs/node.c:2183
>   do_writepages+0x32b/0x550 mm/page-writeback.c:2636
>   __writeback_single_inode+0x145/0xff0 fs/fs-writeback.c:1680
>   writeback_sb_inodes+0x6b5/0x1000 fs/fs-writeback.c:1976
>   wb_writeback+0x43b/0xaf0 fs/fs-writeback.c:2156
>   wb_do_writeback fs/fs-writeback.c:2303 [inline]
>   wb_workfn+0x409/0xef0 fs/fs-writeback.c:2343
>   process_one_work kernel/workqueue.c:3238 [inline]
>   process_scheduled_works+0xade/0x17b0 kernel/workqueue.c:3321
>   worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
>   kthread+0x70e/0x8a0 kernel/kthread.c:464
>   ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>   </TASK>
> Modules linked in:
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:folio_unlock+0x13d/0x160 mm/filemap.c:1498
> Code: de c8 ff 48 89 df 48 c7 c6 a0 36 94 8b e8 cb 6d 0e 00 90 0f 0b e8 13 de c8 ff 48 89 df 48 c7 c6 c0 2c 94 8b e8 b4 6d 0e 00 90 <0f> 0b e8 fc dd c8 ff 48 89 df 48 c7 c6 a0 36 94 8b e8 9d 6d 0e 00
> RSP: 0018:ffffc90000116e28 EFLAGS: 00010246
> RAX: ee13dd9e63919500 RBX: ffffea0001d33080 RCX: 0000000000000000
> RDX: 0000000000000006 RSI: ffffffff8d96d7f4 RDI: 00000000ffffffff
> RBP: ffffc90000117110 R08: ffffffff8f9fdef7 R09: 1ffffffff1f3fbde
> R10: dffffc0000000000 R11: fffffbfff1f3fbdf R12: 1ffffd40003a6611
> R13: 00fff00000004018 R14: ffffea0001d33088 R15: dffffc0000000000
> FS:  0000000000000000(0000) GS:ffff888125d86000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00005555844206f8 CR3: 0000000028e76000 CR4: 00000000003526f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
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
